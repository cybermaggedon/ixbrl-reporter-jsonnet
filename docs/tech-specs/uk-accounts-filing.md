# UK Accounts Filing Technical Specification

This document describes how to create a UK company accounts filing using the FRS-102 library. These reports are suitable for filing with Companies House.

## Overview

The FRS-102 library supports UK Financial Reporting Standards including:
- FRS-102 (full accounts)
- FRS-105 (micro-entity accounts)

The `example-accts/` directory contains a working micro-entity accounts filing.

## Report Types

### Accounting Standards

Set via the `accounting_standards` field in the element definition:

| Value | Description |
|-------|-------------|
| `micro-entities` | FRS-105 micro-entity accounts |
| `small-entities` | FRS-102 Section 1A small company accounts |
| `full` | Full FRS-102 accounts |

### Accounts Status

Set via the `accounts_status` field:

| Value | Description |
|-------|-------------|
| `audit-exempt-no-accountants-report` | Unaudited, no accountant's report |
| `audit-exempt-with-accountants-report` | Unaudited with accountant's report |
| `audited` | Fully audited accounts |

### Accounts Type

Set via the `accounts_type` field:

| Value | Description |
|-------|-------------|
| `abridged-accounts` | Abridged (shortened) accounts |
| `full-accounts` | Full accounts |

## File Structure

```
example-accts/
├── example-accts.jsonnet    # Main entry point
├── metadata.jsonnet         # Company information
├── mapping.jsonnet          # Account mappings
├── comps.jsonnet            # Custom computations
├── local-notes.libsonnet    # Custom notes page
├── logo.jsonnet             # Company logo (base64 PNG)
└── signature.jsonnet        # Director signature (base64 PNG)
```

## Creating a Micro-Entity Filing

### Step 1: Define the Report Structure

```jsonnet
local l = import "lib/frs102.libsonnet";

local elts = {
    "element": "frs102",
    "accounting_standards": "micro-entities",
    "accounts_status": "audit-exempt-no-accountants-report",
    "accounts_type": "abridged-accounts",
    "title": "Unaudited Micro-Entity Accounts",
    "accounts_file": "company.gnucash",
    "accounts_kind": "piecash",
    "elements": [
        {
            "element": "composite",
            "id": "report",
            "elements": [
                { "element": "title-page", "logo": "logo" },
                { "element": "company-info" },
                { "element": "balance-sheet-unaudited-micro", "signature": "signature" },
                { "element": "local-notes" }
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
        components +: {
            "local-notes"(c)::
                local obj = import "local-notes.libsonnet";
                obj.element(c),
        },
        accounts +: import "mapping.jsonnet",
    },

    local comp_updates = (import "comps.jsonnet")($),

    accounts:: $.library.from_element_def(elts, self)
        .with_metadata(self.metadata)
        .include_computations(comp_updates),

    resource(x):: {
        "logo": import "logo.jsonnet",
        "signature": import "signature.jsonnet",
    }[x],
};

accts.accounts
```

### Step 3: Provide Company Metadata

The `metadata.jsonnet` file contains all company information:

```jsonnet
{
    "business": {
        "company-name": "Example Ltd.",
        "company-number": "12345678",
        "entity-scheme": "http://www.companieshouse.gov.uk/",
        "company-formation": {
            "country": "england-and-wales",
            "date": "2020-01-01",
            "form": "private-limited-company"
        },
        "directors": ["A Smith", "B Jones"],
        "sic-codes": ["62020"],
        "contact": {
            "name": "Corporate Enquiries",
            "address": ["123 High Street"],
            "location": "London",
            "postcode": "SW1A 1AA",
            "country": "UK"
        },
        "activities": "Software development services",
        "average-employees": [5, 4],
        "is-dormant": false,
        "jurisdiction": "England and Wales"
    },
    "accountant": {
        "name": "J Accountant FCA",
        "business": "ABC Accountants",
        "address": "456 Finance Road, London EC1A 1BB",
        "report-date": "2024-03-01"
    },
    "directors": {
        "report-date": "2024-02-15"
    },
    "accounting": {
        "currency": "GBP",
        "currency-label": "£",
        "decimals": 0,
        "scale": 0,
        "balance-sheet-date": "2023-12-31",
        "authorised-date": "2024-02-01",
        "date": "2024-03-01",
        "periods": [
            { "name": "2023", "start": "2023-01-01", "end": "2023-12-31" },
            { "name": "2022", "start": "2022-01-01", "end": "2022-12-31" }
        ],
        "signed-by": "A Smith",
        "signing-officer": "director1"
    }
}
```

## Available Report Elements

### Page Elements

| Element | Description |
|---------|-------------|
| `title-page` | Cover page with company name and logo |
| `company-info` | Company information page |
| `directors-report` | Directors' report |
| `accountants-report` | Accountant's report (for unaudited accounts) |
| `auditors-report` | Auditor's report (for audited accounts) |

### Financial Statement Elements

| Element | Description |
|---------|-------------|
| `balance-sheet-unaudited-micro` | Balance sheet for unaudited micro-entity |
| `balance-sheet-audited-micro` | Balance sheet for audited micro-entity |
| `balance-sheet` | Full balance sheet |
| `profit-and-loss` | Profit and loss statement |
| `cash-flows` | Cash flow statement |
| `comprehensive-income` | Statement of comprehensive income |

### Notes Elements

| Element | Description |
|---------|-------------|
| `notes` | Standard notes to accounts |
| `simple-notes` | Simplified notes |

### Other Elements

| Element | Description |
|---------|-------------|
| `composite` | Container for multiple elements |
| `consent` | Consent statement |
| `revision-info` | Revision information |

## Balance Sheet Structure

The FRS-102 balance sheet follows this structure:

```
Fixed Assets
  └── Tangible Assets

Current Assets
  ├── Debtors
  ├── VAT Refund Due
  └── Bank

Prepayments and Accrued Income

Creditors: falling due within one year
  ├── Trade Creditors
  └── Other Creditors

Net Current Assets
Total Assets Less Liabilities

Creditors: falling due after one year
Provisions for Liabilities
Accruals and Deferred Income

Net Assets

Capital and Reserves
  ├── Share Capital
  ├── Retained Profit
  ├── Dividends
  └── Corporation Tax
```

## Key Computations

### Balance Sheet Computations

| ID | Description | Period |
|----|-------------|--------|
| `fixed-assets` | Total fixed assets | at_end |
| `current-assets` | Total current assets | at_end |
| `creditors-within-1-year` | Creditors due within one year | at_end |
| `net-current-assets` | Current assets less current liabilities | at_end |
| `net-assets` | Total net assets | at_end |
| `total-capital-and-reserves` | Shareholders' funds | at_end |

### Profit and Loss Computations

| ID | Description | Period |
|----|-------------|--------|
| `turnover` | Revenue/turnover | in_year |
| `gross-profit` | Gross profit | in_year |
| `staff-costs` | Total staff costs | in_year |
| `other-charges` | Other operating expenses | in_year |
| `profit` | Profit or loss | in_year |

### Cash Flow Computations

| ID | Description | Period |
|----|-------------|--------|
| `net-cash-from-operating-activities` | Operating cash flow | in_year |
| `net-cash-from-investing-activities` | Investing cash flow | in_year |
| `net-cash-from-financing-activities` | Financing cash flow | in_year |
| `cash-at-end-of-year` | Closing cash position | at_end |

## Mapping GnuCash Accounts

The `mapping.jsonnet` file connects GnuCash accounts to computations:

```jsonnet
{
    line_inputs +: {
        // Map custom expense accounts
        "entertainment": ["Expenses:Entertainment"],
        "shipping": [
            "Expenses:VAT Purchases:Import Charges",
            "Expenses:VAT Purchases:Shipping"
        ]
    },

    compound_inputs +: {
        // Add custom items to other-charges
        "other-charges": [
            "accountancy",
            "bank-charges",
            "office",
            "software",
            "subscriptions",
            "sundries",
            "telecoms",
            "travel",
            "entertainment",
            "shipping"
        ]
    }
}
```

### Default Account Mappings

The library provides default mappings for common GnuCash account structures:

| Computation | Default GnuCash Accounts |
|-------------|-------------------------|
| `main-income` | `Income:Sales` |
| `salaries-expense` | `Expenses:Emoluments:Employees`, `Expenses:Emoluments:Employer's NICs` |
| `bank` | `Bank Accounts` |
| `debtors` | `Accounts Receivable`, `Assets:Owed To Us` |
| `trade-creditors` | `Accounts Payable` |
| `share-capital-equity` | `Equity:Shareholdings` |

## Custom Computations

Define custom computations in `comps.jsonnet`:

```jsonnet
function(accts) [
    accts.library.line("entertainment", "Entertainment").in_year(),
    accts.library.line("shipping", "Shipping").in_year()
]
```

## Custom Notes Page

Create a custom notes element in `local-notes.libsonnet`:

```jsonnet
{
    companyinfonote(c)::
        local obj = import "lib/frs102/company-info-note.libsonnet";
        obj.element(c),

    employeecountsnote(c)::
        local obj = import "lib/frs102/employee-counts-note.libsonnet";
        obj.element(c),

    element(c):: {
        with_id(id):: self + { id: id },
        kind: "page",
        elements: [{
            "kind": "html",
            "root": {
                "tag": "div",
                "content": [
                    local obj = import "lib/frs102/header.libsonnet";
                    obj.element(c, "Notes to the accounts",
                        "expand:For the year ended ~[period-end]"),
                    { "element": $.companyinfonote(c) },
                    { "element": $.employeecountsnote(c) },
                    {
                        "tag": "div",
                        "content": [
                            {
                                "element": {
                                    "kind": "noteheading",
                                    "title": "Custom Note",
                                    "level": 1
                                }
                            },
                            {
                                "tag": "p",
                                "content": "expand:Custom note text with value £ ~(entertainment)."
                            }
                        ]
                    }
                ]
            }
        }]
    }
}
```

### Text Expansion

Use `expand:` prefix for dynamic text:
- `~[period-end]` - inserts metadata values
- `~(computation-id)` - inserts computation values

## Resources

### Logo and Signature

Provide logo and signature as base64-encoded PNG files:

```jsonnet
// logo.jsonnet
{
    "type": "png/base64",
    "data": "iVBORw0KGgo..."
}
```

Reference in element definition:
```jsonnet
{ "element": "title-page", "logo": "logo" }
{ "element": "balance-sheet-unaudited-micro", "signature": "signature" }
```

Access via the `resource` function:
```jsonnet
resource(x):: {
    "logo": import "logo.jsonnet",
    "signature": import "signature.jsonnet",
}[x]
```

## Building the Filing

```bash
# From repository root
make -f Makefile.example-accts

# Or from another directory
make -f Makefile.example-accts JSONNET_DATA=../ixbrl-reporter-jsonnet
```

This generates:
1. `example-accts.json` - the report configuration
2. `example-accts.xhtml` - the iXBRL filing document

## Filing with Companies House

The generated `.xhtml` file is an iXBRL document that can be:
1. Validated using the Companies House online validator
2. Submitted via the Companies House WebFiling service
3. Submitted via approved filing software

The document includes all required iXBRL tags from the FRS-102 taxonomy.
