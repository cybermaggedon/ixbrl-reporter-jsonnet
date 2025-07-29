# UK Corporation Tax Example

This directory contains a complete example configuration for generating UK HMRC corporation tax filings using iXBRL. This example demonstrates how to create a **Corporation Tax Statement** with **DPL (Detailed Profit & Loss)** reporting suitable for electronic filing with HMRC.

## Files Overview

| File | Purpose |
|------|---------|
| `example-ct.jsonnet` | **Main configuration file** - Defines the corporation tax report structure and elements |
| `metadata.jsonnet` | **Company metadata** - Contains company information and tax-specific data including UTR |
| `mapping.jsonnet` | **Account mappings** - Maps GnuCash accounts to CT computations and DPL line items |
| `comps.jsonnet` | **Tax computations** - Defines custom computations including tax adjustments |

## Report Type

This example generates a **UK Corporation Tax filing** with the following components:

- **Corporation Tax Computations** - Tax calculations, adjustments, and liability determination
- **DPL (Detailed Profit & Loss)** - Detailed breakdown of income and expenses with HMRC taxonomy tagging
- **CT600 Reference Pages** - Human-readable reference pages matching CT600 form structure

## Key Features

### Comprehensive Tax Reporting
The report includes all required CT filing elements:
1. **Front page** - Summary information
2. **Capital allowances** - Depreciation and allowances calculations
3. **Profits** - Trading profit calculations
4. **Losses** - Loss relief and carried forward losses
5. **Tax chargeable** - Final tax liability calculation
6. **Research & Development** - R&D expenditure and enhanced allowances
7. **DPL Statement** - Detailed profit & loss with regulatory tagging
8. **Tax calculation** - Final corporation tax computation

### Tax Adjustments
The example demonstrates common corporation tax adjustments:
- **Entertainment expenses** - Added back as non-deductible
- **Depreciation** - Added back (replaced by capital allowances)
- **Shipping costs** - Properly categorized for DPL reporting

### iXBRL Taxonomy Compliance
- **CT-COMP taxonomy** - Corporation tax computations
- **DPL taxonomy** - Detailed profit & loss reporting
- **Proper tagging** - All amounts tagged with appropriate HMRC taxonomy elements
- **Dimensional analysis** - Segments for activity, territory, and business type

## Custom Computations

### Line Items
- `income` - Trading income with activity dimension 'm' (Professional services)
- `entertainment` - Entertainment expenses (administrative)
- `shipping` - Import and shipping charges
- `depreciation` - Depreciation expenses

### Tax Adjustments
- `adjustments-entertainment` - Entertainment added back to profits
- `adjustments-depreciation` - Depreciation added back to profits

### Account Mappings
```jsonnet
entertainment: ["Expenses:Entertainment"]
shipping: [
    "Expenses:VAT Purchases:Import Charges",
    "Expenses:VAT Purchases:Shipping Charges"
]
"adjustments-depreciation": ["Expenses:Depreciation"]
```

## Usage

To generate the corporation tax iXBRL filing:

```bash
# Generate the JSON configuration
jsonnet -J . example-ct/example-ct.jsonnet > ct-filing.json

# Generate the iXBRL report
ixbrl-reporter ct-filing.json report ixbrl > ct-statement.html
```

## Regulatory Compliance

This configuration produces reports compliant with:
- **HMRC CT filing requirements**
- **CT-COMP taxonomy** (Corporation Tax Computations)
- **DPL taxonomy** (Detailed Profit & Loss)
- **Companies House filing standards**

The generated iXBRL can be included in electronic CT filings through HMRC's online services or compatible tax software.

## Customization

To adapt this example for your company:

1. **Update metadata.jsonnet** - Replace with your company's UTR, accounting periods, and business details
2. **Modify mapping.jsonnet** - Map your GnuCash accounts to appropriate tax computations
3. **Adjust comps.jsonnet** - Add any company-specific tax adjustments or computations
4. **Review tax segments** - Ensure activity codes and territories match your business

## Technical Notes

- **Sign reversal** - Tax adjustments use `.reverse_sign()` to add back to profits
- **Dimensional tagging** - Uses segments for business-name, business-type, territory
- **Loss reform compliance** - Adjustments tagged as "post-loss-reform"
- **Context management** - Removes unused contexts like "previous-period"

This example provides a comprehensive foundation for automated UK corporation tax reporting with full regulatory compliance.