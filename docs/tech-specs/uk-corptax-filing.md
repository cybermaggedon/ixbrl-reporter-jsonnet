# UK Corporation Tax Filing Technical Specification

This document describes how to create a UK corporation tax statement using the uk-corptax library. The output includes corporation tax computations and a detailed profit & loss (DPL), suitable for inclusion in an HMRC CT filing.

## Overview

The corporation tax statement combines two taxonomies:
- **CT (Computations)** - working out corporation tax liability
- **DPL (Detailed Profit & Loss)** - explaining profits with detailed breakdowns

The `example-ct/` directory contains a working corporation tax filing.

## Report Structure

The report is organised into sections that mirror the CT600 form structure. The opening pages present key values as fact tables with CT600 box references, making it easy to cross-reference with the paper form.

```
┌─────────────────────────────────────────┐
│ Front Page (CT600 boxes 1-35)           │  ← Company info, UTR, periods
├─────────────────────────────────────────┤
│ Capital Allowances (box 690)            │  ← Annual investment allowance
├─────────────────────────────────────────┤
│ Profits and Gains (boxes 155-315)       │  ← Trading profits, losses, reliefs
├─────────────────────────────────────────┤
│ Losses (boxes 780-830)                  │  ← Trading and capital losses
├─────────────────────────────────────────┤
│ Tax Chargeable (boxes 330-525)          │  ← FY split, rates, tax payable
├─────────────────────────────────────────┤
│ R&D Enhanced Expenditure                │  ← SME R&D relief (if applicable)
├─────────────────────────────────────────┤
│ R&D Worksheet                           │  ← R&D calculation details
├─────────────────────────────────────────┤
│ Detailed Profit and Loss                │  ← DPL taxonomy income/expenses
├─────────────────────────────────────────┤
│ Tax Calculation Worksheet               │  ← Full computation breakdown
└─────────────────────────────────────────┘
```

## File Structure

```
example-ct/
├── example-ct.jsonnet    # Main entry point
├── metadata.jsonnet      # Company and tax information
├── mapping.jsonnet       # Account mappings
└── comps.jsonnet         # Custom computations with dimensions
```

## Creating a Corporation Tax Filing

### Step 1: Define the Report Structure

```jsonnet
local l = import "lib/uk-corptax.libsonnet";

local elts = {
    "element": "corptax",
    "title": "Corporation Tax Statement",
    "accounts_file": "company.gnucash",
    "accounts_kind": "piecash",
    "elements": [
        {
            "element": "composite",
            "id": "report",
            "elements": [
                { "element": "front-page" },
                { "element": "capital-allowances" },
                { "element": "profits" },
                { "element": "losses" },
                { "element": "tax-chargeable" },
                { "element": "research-dev-enhanced-expenditure" },
                { "element": "research-dev" },
                { "element": "detailed-profit-and-loss" },
                { "element": "tax-calculation" }
            ]
        }
    ]
};
```

### Step 2: Configure the Accounts Object

```jsonnet
local accts = {
    metadata: import "metadata.jsonnet",

    library:: l + {
        accounts +: import "mapping.jsonnet",
    },

    local comp_updates = (import "comps.jsonnet")($),

    accounts:: $.library.from_element_def(elts, self)
        .with_metadata(self.metadata)
        .include_computations(comp_updates)
        .delete_context("previous-period")
        .delete_metadata("average-employees-previous")
        .include_tags({
            "shipping": "dpl:OtherOperationalAdministrationCosts",
            "adjustments-entertainment": "ct-comp:AdjustmentsEntertaining",
        })
        .include_description_tags({
            "shipping": "dpl:DescriptionActivity",
        })
        .include_sign_reverse({
            "shipping": true,
        }),
};

accts.accounts
```

### Step 3: Provide Tax Metadata

The `metadata.jsonnet` file must include corporation tax specific fields:

```jsonnet
{
    "business": {
        "company-name": "Example Ltd.",
        "company-number": "12345678",
        // ... standard company info
    },
    "accounting": {
        "currency": "GBP",
        "periods": [
            { "name": "2024", "start": "2024-01-01", "end": "2024-12-31" },
            { "name": "2023", "start": "2023-01-01", "end": "2023-12-31" }
        ],
        // ... other accounting settings
    },
    "tax": {
        "utr": "1234567890",
        "period": {
            "name": "2025",
            "start": "2024-01-01",
            "end": "2024-12-31"
        },
        "fy1": {
            "name": "FY1",
            "year": "2023",
            "start": "2024-01-01",
            "end": "2024-03-31"
        },
        "fy2": {
            "name": "FY2",
            "year": "2024",
            "start": "2024-04-01",
            "end": "2024-12-31"
        },
        "rnd-claim-notification-submitted": true,
        "rnd-additional-notification-submitted": true
    }
}
```

The `fy1` and `fy2` fields define how profits are apportioned across HMRC financial years (April to March).

## Available Report Elements

### Fact Table Elements

These display key values with CT600 box references:

| Element | CT600 Boxes | Description |
|---------|-------------|-------------|
| `front-page` | 1, 3, 30, 35 | Company name, UTR, return period |
| `capital-allowances` | 690 | Annual investment allowance |
| `profits` | 155-315 | Trading profits, losses brought forward, reliefs |
| `losses` | 780-830 | Trading losses, capital losses |
| `tax-chargeable` | 330-525 | Financial year split, tax rates, tax payable |
| `research-dev-enhanced-expenditure` | - | R&D qualifying and enhanced expenditure |

### Worksheet Elements

These display detailed computation breakdowns:

| Element | Description |
|---------|-------------|
| `detailed-profit-and-loss` | DPL taxonomy income and expense breakdown |
| `tax-calculation` | Full corporation tax calculation |
| `research-dev` | SME R&D relief calculation |

## CT600 Box Mapping

### Front Page (Boxes 1-35)

| Box | Field | Source |
|-----|-------|--------|
| 1 | Company name | `metadata.business.company-name` |
| 3 | Tax reference (UTR) | `metadata.tax.utr` |
| 30 | Return period start | `metadata.tax.period.start` |
| 35 | Return period end | `metadata.tax.period.end` |

### Capital Allowances (Box 690)

| Box | Computation |
|-----|-------------|
| 690 | `ct-annual-investment-allowance` |

### Profits and Gains (Boxes 155-315)

| Box | Computation |
|-----|-------------|
| 155 | `ct-trading-profits` |
| 160/285 | `ct-trading-losses-brought-forward` |
| 165 | `ct-net-trading-profits` |
| 235 | `profits-before-other-deductions-and-reliefs` |
| 300 | `profits-before-charges-and-group-relief` |
| 315 | `total-profits-chargeable-to-corporation-tax` |

### Losses (Boxes 780-830)

| Box | Computation |
|-----|-------------|
| 780 | `ct-trading-losses` |

### Tax Chargeable (Boxes 330-525)

| Box | Computation/Field |
|-----|-------------------|
| 330 | FY1 year (`metadata.tax.fy1.year`) |
| 335 | `ct-profit-before-tax-fy1` |
| 340 | FY1 tax rate (%) |
| 345 | `ct-tax-fy1` |
| 380 | FY2 year (`metadata.tax.fy2.year`) |
| 385 | `ct-profit-before-tax-fy2` |
| 390 | FY2 tax rate (%) |
| 395 | `ct-tax-fy2` |
| 430 | `ct-tax-total` |
| 440 | `corporation-tax-chargeable-payable` |
| 475 | `net-corporation-tax-payable` |
| 510 | `tax-chargeable` |
| 525 | `tax-payable` |

## Key Computations

### Profit Calculations

| ID | Type | Description |
|----|------|-------------|
| `income` | line | Main trading income |
| `ct-turnover` | group | Total turnover |
| `gross-profit-round` | round | Gross profit (rounded down) |
| `total-costs` | group | Total expenses |
| `profit-before-tax` | group | Net profit before tax |

### Tax Adjustments

| ID | Type | Description |
|----|------|-------------|
| `ct-annual-investment-allowance` | round | Capital allowances deduction |
| `rnd-qualifying-expenditure` | group | R&D qualifying costs |
| `rnd-enhanced-expenditure` | factor(1.3) | R&D enhanced at 130% |
| `profit-loss-per-accounts` | sum | Profit per accounts |
| `ct-trading-profits-raw` | group | Taxable profits before rounding |

### Tax Calculation

| ID | Type | Description |
|----|------|-------------|
| `ct-trading-profits` | round | Taxable profits (rounded) |
| `ct-trading-losses` | sum | Trading losses |
| `ct-net-trading-profits` | sum | Profits after losses b/f |
| `ct-profit-before-tax-fy1` | apportion | FY1 profit (apportioned) |
| `ct-profit-before-tax-fy2` | apportion | FY2 profit (apportioned) |
| `ct-tax-fy1` | factor(-0.19) | FY1 tax at 19% |
| `ct-tax-fy2` | factor(-0.19) | FY2 tax at 19% |
| `ct-tax-total` | group | Total corporation tax |

## DPL Dimensions (Segments)

The DPL taxonomy requires dimension tagging. Set these using `.segment()`:

### expense-type

Categorises expenses:
```jsonnet
.segment("expense-type", "administrative-expenses")
```

### detailed-analysis

Links to DPL detail items:
```jsonnet
.segment("detailed-analysis", "item1")  // item1 through item10
```

### countries-regions

Geographic segment:
```jsonnet
.segment("countries-regions", "UK")
```

### Business Context Segments

For profit adjustments:
```jsonnet
.segment("business-name", "metadata.business.company-name")
.segment("business-type", "trade")
.segment("loss-reform", "post-loss-reform")
.segment("territory", "uk")
```

## Custom Computations

### Adding Expense Lines

Define in `comps.jsonnet`:

```jsonnet
function(accts) [
    accts.library.line("entertainment", "Entertainment")
        .in_year()
        .segment("expense-type", "administrative-expenses"),

    accts.library.line("shipping", "Shipping")
        .in_year()
        .segment("detailed-analysis", "item8")
        .segment("expense-type", "administrative-expenses"),
]
```

### Adding Tax Adjustments

For non-deductible expenses added back to profits:

```jsonnet
accts.library.line("adjustments-entertainment", "Entertainment expense added back")
    .in_year()
    .reverse_sign()
    .segment("business-name", "metadata.business.company-name")
    .segment("business-type", "trade")
    .segment("loss-reform", "post-loss-reform")
    .segment("territory", "uk"),
```

### Mapping Custom Computations

In `mapping.jsonnet`:

```jsonnet
{
    line_inputs +: {
        "entertainment": ["Expenses:Entertainment"],
        "adjustments-entertainment": ["Expenses:Entertainment"],
    },

    compound_inputs +: {
        "total-costs": [
            "salaries", "pensions", "accountancy",
            // ... existing items
            "entertainment", "shipping"
        ],
        "ct-trading-profits-raw": [
            "profit-loss-per-accounts",
            "ct-annual-investment-allowance",
            "adjustments-depreciation",
            "adjustments-entertainment",
            "rnd-enhanced-expenditure"
        ]
    }
}
```

## Custom iXBRL Tags

### Adding Tags

For computations without default tags:

```jsonnet
.include_tags({
    "shipping": "dpl:OtherOperationalAdministrationCosts",
    "adjustments-entertainment": "ct-comp:AdjustmentsEntertaining",
})
```

### Description Tags

For DPL detail item labels:

```jsonnet
.include_description_tags({
    "shipping": "dpl:DescriptionActivity",
})
```

## R&D Relief

### Qualifying Expenditure

Map R&D costs to `rnd-qualifying-expenditure`:

```jsonnet
compound_inputs +: {
    "rnd-qualifying-expenditure": [
        "rnd-staff-costs",
        "rnd-software",
        "rnd-consumables"
    ]
}
```

### Enhanced Expenditure

The library automatically calculates 130% enhanced expenditure using a factor computation:

```jsonnet
accts.factor("rnd-enhanced-expenditure", "SME R&D enhanced expenditure (130%)")
    .with_factor(1.3)
    .in_year()
```

### R&D Notifications

Set in metadata when notifications have been submitted:

```jsonnet
"tax": {
    "rnd-claim-notification-submitted": true,
    "rnd-additional-notification-submitted": true
}
```

## Financial Year Apportionment

Corporation tax rates can change between HMRC financial years (April-March). The library apportions profits:

```jsonnet
accts.apportion("ct-profit-before-tax-fy1-raw", "FY1 (raw)")
    .whole_period("metadata.accounting.periods.0")
    .proportion_period("metadata.tax.fy1")
    .in_year()
```

This calculates the proportion of profits falling in FY1 based on the number of days.

## Building the Filing

```bash
make -f Makefile.example-ct
```

This generates:
1. `example-ct.json` - the report configuration
2. `example-ct.xhtml` - the iXBRL filing document

## Filing with HMRC

The generated `.xhtml` file is an iXBRL document that:
1. Contains CT and DPL taxonomy tags
2. Can be validated using HMRC's online validator
3. Is included in a CT electronic filing submission

The CT filing process requires wrapping this iXBRL document in a Govtalk XML envelope along with the CT600 form data. This is typically handled by filing software.
