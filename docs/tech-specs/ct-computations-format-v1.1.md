# HMRC CT Computations Format v1.1 Implementation

This document describes how to implement the HMRC prescribed CT Computations format (November 2025) for small/medium companies using the uk-corptax library.

## Overview

HMRC has published a prescribed format for corporation tax computations with specific XBRL tags. This spec covers implementation for typical small/medium trading companies, omitting specialized areas (mining, oil & gas, banking, tonnage tax, creatives).

## Implementation Approach

**This is a presentation problem, not an accounting problem.**

The accounting data already exists in GnuCash and flows through existing computations. The HMRC format is a prescribed way of presenting that data with specific XBRL tags. We do not invent new accounting lines just because they appear in the HMRC spec.

Key principles:

1. **Use existing computations** - Map existing computation IDs to HMRC's prescribed layout
2. **Add XBRL tags** - Apply ct-comp namespace tags to computations we already have
3. **Omit what we don't have** - Per HMRC: "do not include null items". If the company doesn't have special rate pool assets, we don't create empty special rate pool lines
4. **Presentation elements** - New worksheet/element definitions that arrange existing data in HMRC's format

The implementation creates new report elements (worksheets, fact tables) that reference existing computations, not new accounting infrastructure.

## Migration Strategy

**Add new elements alongside existing ones.**

The new HMRC v1.1 format elements are added as new components, not replacements. This allows:

1. **Comparison** - Run both old and new elements in the same filing to verify the new presentation matches existing data
2. **Validation** - Check that XBRL tags are correctly applied before removing old elements
3. **Incremental adoption** - Companies can switch to new elements when ready
4. **Safe rollback** - Old elements remain available if issues arise

Once validated, old elements can be deprecated and removed from filings. The library retains both until migration is complete.

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

The HMRC format prescribes this sequence for main pool presentation:

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

**Presentation approach:**

If a company has capital allowances data, create a worksheet element that presents it in this format. The existing `ct-annual-investment-allowance` computation would be displayed here with the appropriate XBRL tag.

For simple cases (e.g., company claims full AIA on all additions, no pool carried forward), only the relevant lines are shown - we don't create empty pool tracking lines.

**XBRL tags for existing computations:**

```jsonnet
.include_tags({
    "ct-annual-investment-allowance": "ct-comp:MainPoolAnnualInvestmentAllowance",
})
```

If more detailed pool tracking is needed for a specific company, those computations would be added in that company's `comps.jsonnet`, not in the library.

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

The Annual Investment Allowance (currently £1,000,000) is already handled by the existing `ct-annual-investment-allowance` computation. The HMRC format simply requires the correct XBRL tag for presentation.

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

### Presentation Elements Needed

New worksheet and element definitions to present existing data in HMRC format:

**Section 1 worksheets:**
- `accounts-adjustments-summary` - Groups existing adjustment computations
- `disallowable-expenditure` - Lists addback items (depreciation, entertainment, etc.)
- `allowable-expenditure` - Lists deduction items (capital allowances, R&D)

**Section 2 worksheets:**
- `capital-allowances-summary` - Presents CA totals
- `main-pool` - Shows pool calculation if company has P&M assets

These elements reference existing computations like `adjustments-depreciation`, `ct-annual-investment-allowance`, `rnd-enhanced-expenditure` - they don't create new accounting data.

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

During migration, include both old and new elements to compare outputs:

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
                // Existing elements (keep during migration)
                { "element": "front-page" },
                { "element": "capital-allowances" },
                { "element": "profits" },
                { "element": "losses" },
                { "element": "tax-chargeable" },
                { "element": "detailed-profit-and-loss" },
                { "element": "tax-calculation" },

                // New HMRC v1.1 elements (add alongside existing)
                { "element": "accounts-adjustments-v1.1" },
                { "element": "capital-allowances-v1.1" },
            ]
        }
    ]
};
```

Once validated, remove the old elements that the new ones replace.

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

## Implementation Phases

### Phase 1: Add New Elements

1. Create `accounts-adjustments-v1.1` element referencing existing computations
2. Create `capital-allowances-v1.1` element referencing existing CA computations
3. Add XBRL tags to existing computations (depreciation, entertainment, AIA, etc.)
4. Include new elements in example-ct alongside existing elements

### Phase 2: Validate

1. Build filing with both old and new elements
2. Compare values between old worksheets and new HMRC format tables
3. Verify XBRL tags are correctly applied
4. Check output renders correctly

### Phase 3: Migrate

1. Once validated, update example-ct to use new elements only
2. Remove redundant old elements from filing
3. Keep old element definitions in library for backwards compatibility (or remove if not needed)

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

2. **Presentation only**: This is about presenting existing accounting data in HMRC's prescribed format. We don't create accounting lines for data we don't have.

3. **Omit null items**: Per HMRC spec, lines with no data are omitted entirely. This aligns naturally with our approach - if a computation doesn't exist, it won't appear.

4. **Existing compatibility**: Current elements (`tax-calculation`, `capital-allowances`, etc.) remain unchanged. New v1.1 elements are added alongside for comparison before migration.

5. **DPL requirement**: The HMRC computations format is separate from the DPL (Detailed Profit & Loss) requirement. Both may be needed in a CT filing.

6. **Company-specific extensions**: If a particular company needs detailed pool tracking or other computations, those are added in that company's `comps.jsonnet` and `mapping.jsonnet`, not in the library.
