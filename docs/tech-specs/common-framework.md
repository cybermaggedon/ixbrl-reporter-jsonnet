# Common Framework Technical Specification

This document describes the common framework used across all example configurations in ixbrl-reporter-jsonnet.

## Overview

The framework provides a consistent pattern for building iXBRL report configurations. Each example follows the same structure, imports a scenario-specific library, and uses the same API to customise the output.

## Directory Structure

Each example follows this standard layout:

```
example-<type>/
├── <type>.jsonnet          # Main entry point
├── metadata.jsonnet        # Company/entity information
├── mapping.jsonnet         # Maps accounts to computations
├── comps.jsonnet           # Custom computation definitions
└── README.md               # Documentation
```

Optional files include `logo.jsonnet`, `signature.jsonnet`, and custom element libraries.

## Building an Example

### Step 1: Create the Main Entry Point

The main file (`<type>.jsonnet`) orchestrates everything:

```jsonnet
// Import the scenario-specific library
local l = import "lib/uk-corptax.libsonnet";

// Define report structure
local elts = {
    "element": "corptax",
    "title": "Corporation Tax Statement",
    "accounts_file": "example.gnucash",
    "accounts_kind": "piecash",
    "elements": [
        {
            "element": "composite",
            "id": "report",
            "elements": [
                { "element": "front-page" },
                { "element": "detailed-profit-and-loss" },
                { "element": "tax-calculation" }
            ]
        }
    ]
};

// Configure and output
local accts = {
    metadata: import "metadata.jsonnet",

    library:: l + {
        accounts +: import "mapping.jsonnet",
    },

    local comp_updates = (import "comps.jsonnet")($),

    accounts:: $.library.from_element_def(elts, self)
        .with_metadata(self.metadata)
        .include_computations(comp_updates)
};

accts.accounts
```

### Step 2: Define Metadata

Create `metadata.jsonnet` with company and accounting information:

```jsonnet
{
    "business": {
        "company-name": "Example Ltd.",
        "company-number": "12345678",
        "directors": ["A Smith", "B Jones"],
        "contact": {
            "address": ["123 High Street"],
            "postcode": "AB1 2CD"
        }
    },
    "accounting": {
        "currency": "GBP",
        "balance-sheet-date": "2024-12-31",
        "periods": [
            { "name": "2024", "start": "2024-01-01", "end": "2024-12-31" }
        ]
    }
}
```

### Step 3: Map Accounts

Create `mapping.jsonnet` to connect GnuCash accounts to computations:

```jsonnet
{
    line_inputs +: {
        // Map computation ID to account paths
        "entertainment": ["Expenses:Entertainment"],
        "shipping": [
            "Expenses:VAT Purchases:Import Charges",
            "Expenses:VAT Purchases:Shipping"
        ]
    },

    compound_inputs +: {
        // Map computation ID to other computation IDs
        "total-costs": [
            "salaries", "pensions", "office",
            "entertainment", "shipping"
        ]
    }
}
```

### Step 4: Define Custom Computations

Create `comps.jsonnet` as a function returning computation objects:

```jsonnet
function(accts) [
    accts.library.line("entertainment", "Entertainment")
        .in_year()
        .segment("expense-type", "administrative-expenses"),

    accts.library.line("shipping", "Shipping")
        .in_year()
        .segment("expense-type", "administrative-expenses")
]
```

## Computation Types

The framework provides these computation builders:

### line(id, description)
A single value from mapped accounts.

```jsonnet
accts.library.line("income", "Trading Income")
    .in_year()
    .segment("detailed-analysis", "item1")
```

### sum(id, description)
Sum of other computations.

```jsonnet
accts.library.sum("total-income", "Total Income")
    .in_year()
```

### group(id, description)
Groups related computations together.

```jsonnet
accts.library.group("expenses", "Expenses")
    .in_year()
```

### factor(id, description)
Multiplies input by a factor (e.g., R&D enhancement at 130%).

```jsonnet
accts.library.factor("rnd-enhanced", "R&D Enhanced Expenditure")
    .with_factor(1.3)
    .in_year()
```

### round(id, description)
Rounds a value.

```jsonnet
accts.library.round("tax-rounded", "Tax (rounded)")
    .down()  // or .up() or .nearest()
```

### compare(id, description)
Compares two values.

```jsonnet
accts.library.compare("max-deduction", "Maximum Deduction")
    .greater()  // or .less()
```

### apportion(id, description)
Apportions values across periods.

```jsonnet
accts.library.apportion("fy1-profit", "FY1 Profit")
    .whole_period("annual-profit")
    .proportion_period("fy1-days")
```

## Computation Modifiers

Chain these methods on any computation:

| Method | Purpose |
|--------|---------|
| `.in_year()` | Value for the accounting period |
| `.at_end()` | Value at period end (balance sheet) |
| `.at_start()` | Value at period start |
| `.reverse_sign()` | Negate the value |
| `.note(id)` | Link to an accounting note |
| `.segment(key, value)` | Add XBRL dimension |

## Configuration Methods

After calling `from_element_def()`, chain these methods:

### Metadata
```jsonnet
.with_metadata(metadata)
```

### Computations
```jsonnet
.include_computations(comp_updates)
```

### Contexts
```jsonnet
.delete_context("previous-period")
.replace_context("current-period", newValue)
.insert_context("new-context", value)
```

### Metadata Items
```jsonnet
.delete_metadata("average-employees-previous")
.replace_metadata("company-name", newValue)
.insert_metadata("custom-field", value)
```

### Tags
```jsonnet
.include_tags({
    "shipping": "dpl:OtherOperationalAdministrationCosts"
})

.include_description_tags({
    "shipping": "dpl:DescriptionActivity"
})
```

### Sign Reversal
```jsonnet
.include_sign_reverse({
    "shipping": true
})
```

### Worksheets
```jsonnet
.delete_worksheet("unused-sheet")
.replace_worksheet("sheet-id", newSheet)
.insert_worksheet("new-sheet", sheetDef)
```

## Available Libraries

Import the appropriate library for your report type:

| Library | Purpose |
|---------|---------|
| `lib/frs102.libsonnet` | UK FRS-102/FRS-105 accounts |
| `lib/uk-corptax.libsonnet` | UK corporation tax with DPL |
| `lib/uk-vat.libsonnet` | UK VAT returns |
| `lib/esef-en.libsonnet` | ESEF (English) |
| `lib/esef-fr.libsonnet` | ESEF (French) |

## Element Types

Common elements available across libraries:

| Element | Purpose |
|---------|---------|
| `composite` | Container for multiple elements |
| `page` | Single page container |
| `worksheet` | Computation worksheet |
| `facttable` | Table of facts |
| `html` | Raw HTML content |

Scenario-specific elements are documented in each library.

## Extending the Library

### Adding Custom Components

Register new components in the library override:

```jsonnet
library:: l + {
    components +: {
        "custom-notes"(c):: (import "custom-notes.libsonnet").element(c)
    }
}
```

Then reference in the element definition:

```jsonnet
{ "element": "custom-notes" }
```

### Custom Component Structure

A custom component implements an `element(c)` function:

```jsonnet
{
    element(c):: {
        kind: "page",
        elements: [
            {
                kind: "html",
                root: {
                    tag: "div",
                    content: [
                        // Your content here
                    ]
                }
            }
        ]
    }
}
```

## Invoking the Build

Use the provided Makefiles:

```bash
# From the repository root
make -f Makefile.example-ct

# From another directory
make -f Makefile.example-ct JSONNET_DATA=../ixbrl-reporter-jsonnet
```

The Makefile runs:
1. `jsonnet <input>.jsonnet -J <library-path> -o <output>.json`
2. `ixbrl-reporter <output>.json report ixbrl > <output>.xhtml`

## Data Flow

```
Main File
├── Element Definition (elts)
│   └── Defines report structure and elements
├── Metadata (metadata.jsonnet)
│   └── Company, accounting, tax information
├── Mappings (mapping.jsonnet)
│   └── line_inputs: account paths → computation IDs
│   └── compound_inputs: computation IDs → computation IDs
├── Computations (comps.jsonnet)
│   └── Custom line/sum/group/factor definitions
└── Library (lib/<scenario>.libsonnet)
    └── Components, worksheets, default computations, taxonomy

Output: JSON configuration for ixbrl-reporter
```
