# UK Company Accounts Example

This directory contains a complete example configuration for generating UK company accounts using the iXBRL reporter. This example demonstrates how to create an **FRS-105 Unaudited Micro-Entity** annual accounts report suitable for filing with UK Companies House.

## Files Overview

| File | Purpose |
|------|---------|
| `example-accts.jsonnet` | **Main configuration file** - Defines the report structure, accounting standards, and report elements |
| `metadata.jsonnet` | **Company metadata** - Contains all company information, directors, accounting periods, and contact details |
| `mapping.jsonnet` | **Account mappings** - Maps GnuCash accounts to report line items and defines computation inputs |
| `comps.jsonnet` | **Custom computations** - Defines additional computations like 'shipping' and 'entertainment' expenses |
| `local-notes.libsonnet` | **Custom notes page** - Creates a customized notes section for the accounts |
| `logo.jsonnet` | **Company logo** - Base64-encoded PNG image for the title page |
| `signature.jsonnet` | **Director signature** - Base64-encoded PNG image of director's signature |

## Report Type

This example generates an **FRS-105 Micro-Entity** report with the following characteristics:

- **Accounting Standard**: FRS-105 (Micro-entities)
- **Audit Status**: Audit-exempt with no accountants' report
- **Report Type**: Abridged accounts
- **Content**: Balance sheet only (P&L and cash flow sections are commented out)

## Key Configuration Elements

### Report Structure
The main report consists of:
1. **Title Page** - With company logo
2. **Company Information Page** - Basic company details
3. **Balance Sheet** - Unaudited micro-entity format with director signature
4. **Notes to Accounts** - Custom notes including company info and employee counts

### Account Mappings
The example includes custom mappings for:
- **Entertainment expenses** → `Expenses:Entertainment`
- **Shipping charges** → `Expenses:VAT Purchases:Import Charges` and `Expenses:VAT Purchases:Shipping Charges`

These are then included in the "other-charges" computation.

### Company Information
The metadata includes realistic example data for:
- Company details (Example Biz Ltd., company number 12345678)
- Directors (A Bloggs, B Smith, C Jones)
- Business activities (Computer security consultancy)
- SIC codes (62020, 62021)
- Accounting periods (2019-2020)

## Usage

To generate the iXBRL report:

```bash
# Generate the JSON configuration
jsonnet -J . example-accts/example-accts.jsonnet > output.json

# Generate the iXBRL report
ixbrl-reporter output.json report ixbrl > accounts.html
```

## Customization

To adapt this example for your own company:

1. **Update metadata.jsonnet** - Replace with your actual company information
2. **Modify mapping.jsonnet** - Map your GnuCash accounts to the appropriate line items
3. **Adjust comps.jsonnet** - Add any custom computations you need
4. **Replace logo.jsonnet and signature.jsonnet** - Use your company logo and director signature
5. **Customize local-notes.libsonnet** - Modify the notes section as required

## Requirements

- GnuCash accounts file named `example2.gnucash`
- ixbrl-reporter tool
- Jsonnet processor

This example demonstrates the flexibility of the iXBRL reporter system while providing a solid foundation for UK micro-entity company accounts.