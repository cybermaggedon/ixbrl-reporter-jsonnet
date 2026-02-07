# HMRC CT Computations Format v1.1 Implementation

This document describes how to implement the HMRC prescribed CT Computations format (November 2025) for small/medium companies using the uk-corptax library.

## Overview

HMRC has published a prescribed format for corporation tax computations with specific XBRL tags. This spec covers implementation for typical small/medium trading companies, omitting specialized areas (mining, oil & gas, banking, tonnage tax, creatives).

## Document Structure

The HMRC format has two main sections:

```
Section 1: Accounts Adjustments (7 parts)
├── Part 1: Summary
├── Part 2: Non-Taxable Income Deducted
├── Part 3: Disallowable Expenditure Addback
├── Part 4: Taxable Income Addback
├── Part 5: Allowable Expenditure Deducted
├── Part 6: Non-Accounting Income Additions
└── Part 7: Non-Accounting Allowable Expenditure

Section 2: Capital Allowances (9 parts)
├── Part 1: Summary
├── Part 2: Plant and Machinery
├── Part 3: Structures and Buildings
├── Part 4: Business Premises Renovation (legacy)
├── Part 5: Mineral Extraction (skip)
├── Part 6: R&D Allowances
├── Part 7: Know-how (legacy)
├── Part 8: Patents (legacy)
└── Part 9: Dredging (skip)
```

## Scope for Small/Medium Companies

### Relevant Parts

| Part | Relevance | Notes |
|------|-----------|-------|
| **Section 1** | | |
| Part 1 Summary | Essential | Core profit calculation |
| Part 2 Non-Taxable Income | Common | Investment income, property receipts |
| Part 3 Disallowable Addback | Essential | Depreciation, entertainment, etc. |
| Part 4 Taxable Income Addback | Rare | Intangibles, reserves adjustments |
| Part 5 Allowable Expenditure | Common | Pre-trade expenses, capitalised R&D |
| Part 6 Non-Accounting Additions | Common | Balancing charges, RDEC |
| Part 7 Non-Accounting Deductions | Essential | Capital allowances, R&D enhanced |
| **Section 2** | | |
| Part 1 Summary | Essential | CA totals |
| Part 2 P&M Allowances | Essential | AIA, Main Pool, Special Rate |
| Part 3 SBA | Occasional | Building purchases |
| Part 6 R&D Allowances | Occasional | R&D capital expenditure |

### Out of Scope

These are unlikely for typical small/medium companies:
- Freeports/Investment Zones (Part 2b)
- Mineral Extraction (Part 5)
- Know-how pre-2002 (Part 7)
- Patents pre-2002 (Part 8)
- Dredging (Part 9)
- Hedging instruments
- Hybrid mismatches
- Tonnage tax
- Joint ventures as separate entities

## Section 1: Accounts Adjustments

### Part 1 Summary

The summary worksheet presents key totals with prescribed XBRL tags.

| Line | XBRL Tag | Current Computation |
|------|----------|---------------------|
| Profit/(loss) before tax per accounts | `ProfitLossPerAccounts` | `profit-loss-per-accounts` |
| Revised Figure Before Tax | `AdjustedProfitOrLossBeforeAccountingPeriodAdjustments` | (new) |
| Adjusted Profit/(Loss) | `AdjustedProfitForThePeriod` / `AdjustedLossOfPeriod` | `ct-trading-profits` |

**Implementation:**

```jsonnet
// New computations needed
accts.library.sum("revised-profit-before-tax", "Revised Figure Before Tax")
    .in_year(),

// Wire the XBRL tag
.include_tags({
    "profit-loss-per-accounts": "ct-comp:ProfitLossPerAccounts",
    "revised-profit-before-tax": "ct-comp:AdjustedProfitOrLossBeforeAccountingPeriodAdjustments",
    "ct-trading-profits": "ct-comp:AdjustedProfitForThePeriod",
})
```

### Part 3 Disallowable Expenditure Addback

Common adjustments for small/medium companies:

| Line | XBRL Tag | Notes |
|------|----------|-------|
| Depreciation | `AdjustmentsDepreciation` | Already implemented |
| Entertaining | `AdjustmentsEntertaining` | Already implemented |
| Capital Expenditure | `AdjustmentsCapitalExpenditure` | Items incorrectly expensed |
| Motor, travel & subsistence | `AdjustmentsMotorTravelAndSubsistence` | Disallowed portion |
| Donations | `AdjustmentsDonations` | Non-qualifying donations |
| Accountancy, legal fees | `AdjustmentsAccountancyLegalAndProfessionalFees` | Capital element |
| Penalties or fines | `AdjustmentsPenaltiesAndFines` | Non-deductible |
| Pension contributions | `AdjustmentsPensionContributions` | Timing differences |
| Other | `AdjustmentsOtherAdditions` | Catch-all |

**Example Implementation:**

```jsonnet
// In comps.jsonnet
function(accts) [
    accts.library.line("adjustments-depreciation", "Depreciation")
        .in_year()
        .reverse_sign()
        .segment("business-name", "metadata.business.company-name")
        .segment("business-type", "trade"),

    accts.library.line("adjustments-entertainment", "Entertainment")
        .in_year()
        .reverse_sign()
        .segment("business-name", "metadata.business.company-name")
        .segment("business-type", "trade"),
]

// In mapping.jsonnet
{
    line_inputs +: {
        "adjustments-depreciation": ["Expenses:Depreciation"],
        "adjustments-entertainment": ["Expenses:Entertainment"],
    },
    compound_inputs +: {
        "ct-trading-profits-raw": [
            "profit-loss-per-accounts",
            "ct-annual-investment-allowance",
            "adjustments-depreciation",
            "adjustments-entertainment",
            "rnd-enhanced-expenditure"
        ]
    }
}

// Tags
.include_tags({
    "adjustments-depreciation": "ct-comp:AdjustmentsDepreciation",
    "adjustments-entertainment": "ct-comp:AdjustmentsEntertaining",
})
```

### Part 7 Non-Accounting Allowable Expenditure

Key deductions for small/medium companies:

| Line | XBRL Tag | Notes |
|------|----------|-------|
| Total Capital Allowances | `TotalCapitalAllowances` | From Section 2 |
| R&D enhanced expenditure | `AdjustmentsAdditionalDeductionForQualifyingRDExpenditureSME` | SME scheme |
| Patent Box | `PatentBoxAdjustment` | If applicable |

**Existing Implementation:**

The current `ct-annual-investment-allowance` and `rnd-enhanced-expenditure` computations align with these requirements.

## Section 2: Capital Allowances

### Part 1 Summary

| Line | XBRL Tag |
|------|----------|
| Total Plant and Machinery Allowances | (no tag - sum of sub-pools) |
| Total Capital Allowances | `TotalCapitalAllowances` |
| Total Balancing Charges | `TotalBalancingCharges` |

### Part 2 Plant and Machinery - Main Pool

The main pool calculation follows a specific sequence:

```
Unrelieved Qualifying Expenditure b/f     MainPoolWrittenDownValue
+ Qualifying Expenditure added            MainPoolExpenditureQualifyingForWritingDownAllowance
= Available Qualifying Expenditure (AQE)
- Annual Investment Allowance (AIA)       MainPoolAnnualInvestmentAllowance
- Total disposal receipts                 MainPoolTotalDisposalReceipts
= Balance of qualifying expenditure
- Writing Down Allowance (18%)            MainPoolWritingDownAllowances
= Unrelieved Qualifying Expenditure c/f   MainPoolWrittenDownValue
```

**New Element: Capital Allowances Worksheet**

```jsonnet
// New element for capital-allowances-worksheet.libsonnet
{
    element(c):: {
        kind: "worksheet",
        title: "Capital Allowances - Main Pool",
        computations: [
            { id: "ca-main-pool-bf", description: "Unrelieved QE b/f" },
            { id: "ca-main-pool-additions", description: "Qualifying expenditure added" },
            { id: "ca-main-pool-aqe", description: "Available qualifying expenditure" },
            { id: "ca-aia-qualifying", description: "Additions qualifying for AIA" },
            { id: "ca-aia-limit", description: "AIA limit" },
            { id: "ca-aia-claimed", description: "AIA claimed" },
            { id: "ca-main-pool-post-aia", description: "AQE less AIA" },
            { id: "ca-main-pool-disposals", description: "Total disposal receipts" },
            { id: "ca-main-pool-balance", description: "Balance of qualifying expenditure" },
            { id: "ca-main-pool-wda-rate", description: "WDA %" },
            { id: "ca-main-pool-wda-available", description: "WDA available" },
            { id: "ca-main-pool-wda-claimed", description: "WDA claimed" },
            { id: "ca-main-pool-cf", description: "Unrelieved QE c/f" },
            { id: "ca-main-pool-total", description: "Total capital allowances - main pool" }
        ]
    }
}
```

**Required Computations:**

```jsonnet
// Main pool computations
accts.library.line("ca-main-pool-bf", "Unrelieved QE brought forward")
    .at_start(),

accts.library.line("ca-main-pool-additions", "Qualifying expenditure added")
    .in_year(),

accts.library.sum("ca-main-pool-aqe", "Available qualifying expenditure")
    .in_year(),

accts.library.line("ca-aia-qualifying", "Additions qualifying for AIA")
    .in_year(),

accts.library.line("ca-aia-limit", "AIA limit")
    .in_year(),

accts.library.compare("ca-aia-claimed", "AIA claimed")
    .less()
    .in_year(),

accts.library.factor("ca-main-pool-wda-available", "WDA available")
    .with_factor(0.18)
    .in_year(),

// Tags
.include_tags({
    "ca-main-pool-bf": "ct-comp:MainPoolWrittenDownValue",
    "ca-main-pool-additions": "ct-comp:MainPoolExpenditureQualifyingForWritingDownAllowance",
    "ca-aia-qualifying": "ct-comp:MainPoolExpenditureQualifyingForAnnualInvestmentAllowance",
    "ca-aia-claimed": "ct-comp:MainPoolAnnualInvestmentAllowance",
    "ca-main-pool-disposals": "ct-comp:MainPoolTotalDisposalReceipts",
    "ca-main-pool-wda-claimed": "ct-comp:MainPoolWritingDownAllowances",
    "ca-main-pool-cf": "ct-comp:MainPoolWrittenDownValue",
    "ca-main-pool-total": "ct-comp:MainPoolTotalAllowances",
})
```

### Part 2 Plant and Machinery - Special Rate Pool

Similar structure to main pool but with 6% WDA rate.

| Line | XBRL Tag |
|------|----------|
| Written down value b/f | `SpecialRatePoolWrittenDownValue` |
| Expenditure on integral features | `SpecialRatePoolIntegralFeaturesExpenditure` |
| Expenditure on long-life assets | `SpecialRatePoolLongLifeAssetExpenditure` |
| Expenditure on high-emission cars | `SpecialRatePoolExpenditureOnACarThatIsNotAMainRateCar` |
| WDA claimed (6%) | `SpecialRatePoolWritingDownAllowance` |
| Written down value c/f | `SpecialRatePoolWrittenDownValue` |

### AIA Handling

The Annual Investment Allowance (currently £1,000,000) applies across all pools but is typically claimed against main pool first.

```jsonnet
// AIA limit computation (considers short accounting periods)
accts.library.apportion("ca-aia-limit-calculated", "AIA limit")
    .whole_period({ start: "metadata.accounting.periods.0.start", end: "metadata.accounting.periods.0.end" })
    .proportion_period({ days: 365 })
    .with_base_amount(1000000)
    .in_year()
```

## Mapping to Existing Library

### Current uk-corptax Computations

| Existing ID | HMRC Format Equivalent |
|-------------|------------------------|
| `profit-loss-per-accounts` | Part 1: Profit/(loss) before tax |
| `adjustments-depreciation` | Part 3: Depreciation |
| `adjustments-entertainment` | Part 3: Entertaining |
| `ct-annual-investment-allowance` | Part 7: Total Capital Allowances |
| `rnd-enhanced-expenditure` | Part 7: R&D enhanced expenditure |
| `ct-trading-profits` | Part 1: Adjusted Profit/(Loss) |

### New Computations Needed

For full compliance, these computations would be added:

**Section 1:**
- `accounting-non-taxable-income-total` - Part 2 subtotal
- `accounting-disallowable-total` - Part 3 subtotal
- `accounting-taxable-income-total` - Part 4 subtotal
- `accounting-allowable-total` - Part 5 subtotal
- `non-accounting-income-total` - Part 6 subtotal
- `non-accounting-allowable-total` - Part 7 subtotal

**Section 2:**
- `ca-main-pool-*` - Main pool sequence
- `ca-special-rate-*` - Special rate pool sequence (if needed)
- `ca-total-allowances` - Sum of all CA
- `ca-total-balancing-charges` - Sum of all BC

## Report Element Structure

### New Element: `ct-computations-v1.1`

```jsonnet
// lib/uk-corptax/ct-computations-v1.1.libsonnet
{
    element(c):: {
        kind: "composite",
        elements: [
            { element: "accounts-adjustments-summary" },
            { element: "disallowable-expenditure" },
            { element: "allowable-expenditure" },
            { element: "non-accounting-deductions" },
            { element: "capital-allowances-summary" },
            { element: "main-pool" },
            // Optional elements included conditionally:
            // { element: "special-rate-pool" },
            // { element: "structures-buildings" },
        ]
    }
}
```

### Element Definition

```jsonnet
local elts = {
    "element": "corptax",
    "title": "Corporation Tax Computations",
    "accounts_file": "company.gnucash",
    "accounts_kind": "piecash",
    "elements": [
        {
            "element": "composite",
            "id": "report",
            "elements": [
                // Existing elements
                { "element": "front-page" },
                { "element": "capital-allowances" },
                { "element": "profits" },
                { "element": "losses" },
                { "element": "tax-chargeable" },

                // New HMRC v1.1 compliant elements
                { "element": "ct-computations-v1.1" },

                // DPL for HMRC
                { "element": "detailed-profit-and-loss" },
                { "element": "tax-calculation" }
            ]
        }
    ]
};
```

## XBRL Tag Reference

### Section 1 Tags (ct-comp namespace)

| Tag | Description |
|-----|-------------|
| `ProfitLossPerAccounts` | Opening profit/loss |
| `AdjustedProfitOrLossBeforeAccountingPeriodAdjustments` | After accounting adjustments |
| `AdjustedProfitForThePeriod` | Final adjusted profit |
| `AdjustedLossOfPeriod` | Final adjusted loss |
| `AdjustmentsDepreciation` | Depreciation addback |
| `AdjustmentsEntertaining` | Entertainment addback |
| `AdjustmentsCapitalExpenditure` | Capital items addback |
| `AdjustmentsDonations` | Non-qualifying donations |
| `AdjustmentsPensionContributions` | Pension timing |
| `AdjustmentsOtherAdditions` | Other addbacks |
| `AdjustmentsPre-tradingExpenditure` | Pre-trade expenses |
| `AdjustmentsOtherDeductions` | Other deductions |
| `TotalCapitalAllowances` | CA deduction |
| `TotalBalancingCharges` | BC addition |
| `AdjustmentsAdditionalDeductionForQualifyingRDExpenditureSME` | SME R&D |

### Section 2 Tags (ct-comp namespace)

| Tag | Description |
|-----|-------------|
| `MainPoolWrittenDownValue` | Main pool WDV (b/f and c/f) |
| `MainPoolExpenditureQualifyingForWritingDownAllowance` | Main pool additions |
| `MainPoolExpenditureQualifyingForAnnualInvestmentAllowance` | AIA qualifying |
| `MainPoolAnnualInvestmentAllowance` | AIA claimed |
| `MainPoolTotalDisposalReceipts` | Disposals |
| `MainPoolWritingDownAllowances` | WDA claimed |
| `MainPoolTotalAllowances` | Total main pool CA |
| `SpecialRatePoolWrittenDownValue` | SR pool WDV |
| `SpecialRatePoolWritingDownAllowance` | SR WDA claimed |
| `SpecialRatePoolTotalAllowances` | Total SR pool CA |

## Implementation Approach

### Phase 1: Core Adjustments

1. Add missing adjustment computations to `ct-computations.jsonnet`
2. Add XBRL tags for Part 1 and Part 3 items
3. Create `accounts-adjustments-summary` element

### Phase 2: Capital Allowances

1. Add main pool computation sequence
2. Create `main-pool` worksheet element
3. Add capital allowances summary

### Phase 3: Optional Pools

1. Special rate pool (if company has qualifying assets)
2. Short-life assets (if elections made)
3. Structures and buildings (if applicable)

## Formatting Requirements

From the HMRC specification:

- Each table as separate HTML table
- Do not include null items (no entry = omit line)
- Nil items must be shown (e.g., pool balance of 0)
- Use brackets ( ) for amounts going against section intention
- Currency at column header, not every figure
- Date format: DD/MM/YYYY
- Sterling unless CFM64000 exemption applies

## Example Output Structure

```
Accounts Adjustments Summary
├── Profit/(loss) before tax per statutory accounts     £50,000
├── Accounting Disallowable Expenditure Addback Total   £5,000
├── Accounting Allowable Expenditure Deducted Total     (£1,000)
├── Non-accounting Allowable Expenditure Deducted Total (£10,000)
└── Adjusted Profit                                     £44,000

Capital Allowances - Main Pool
├── Unrelieved Qualifying Expenditure b/f               £25,000
├── Qualifying Expenditure added to pool                £15,000
├── Available qualifying expenditure                    £40,000
├── Additions qualifying for AIA                        £15,000
├── AIA limit                                           £1,000,000
├── AIA claimed                                         (£15,000)
├── AQE less AIA                                        £25,000
├── Total disposal receipts                             £0
├── Balance of qualifying expenditure                   £25,000
├── WDA % (18%)
├── WDA available                                       £4,500
├── WDA claimed                                         (£4,500)
├── Unrelieved Qualifying Expenditure c/f               £20,500
└── Total capital allowances - main pool                £19,500
```

## Notes

1. **Implementation date**: HMRC has removed the mandatory implementation date. The format is guidance for now.

2. **Minimal approach**: For small companies with simple affairs, only implement the lines actually needed. HMRC states "do not include null items".

3. **Existing compatibility**: The current `tax-calculation` worksheet can continue alongside the new format elements.

4. **DPL requirement**: The HMRC computations format is separate from the DPL (Detailed Profit & Loss) requirement. Both may be needed in a CT filing.
