[
    {
        "id": "consultancy",
        "kind": "line",
        "description": "Consultancy",
        "period": "in-year",
        "accounts": [
            "Income:Sales"
        ]
    },
    {
        "id": "operating-revenue",
        "kind": "sum",
        "description": "Operating revenue",
        "period": "in-year",
        "inputs": [
            "consultancy"
        ]
    },
    {
        "id": "personnel-costs",
        "kind": "line",
        "accounts": [
            "Expenses:Emoluments:Employees",
            "Expenses:Emoluments:Employer Pension Contribution"
        ],
        "description": "Personnel costs",
        "period": "in-year"
    },
    {
        "id": "depreciation-and-amortisation",
        "kind": "line",
        "description": "Depreciation and amortisation",
        "accounts": [
            "Expenses:Depreciation"
        ],
        "period": "in-year"
    },
    {
        "id": "accountancy",
        "kind": "line",
        "description": "Accountancy services",
        "accounts": [
            "Expenses:VAT Purchases:Accountant"
        ],
        "period": "in-year"
    },
    {
        "id": "bank-charges",
        "kind": "line",
        "description": "Bank charges",
        "period": "in-year",
        "accounts": [
            "Expenses:VAT Purchases:Bank Charges"
        ]
    },
    {
        "id": "office",
        "kind": "line",
        "description": "Office costs",
        "period": "in-year",
        "accounts": [
            "Expenses:VAT Purchases:Office"
        ]
    },
    {
        "id": "software",
        "kind": "line",
        "description": "Software",
        "period": "in-year",
        "accounts": [
            "Expenses:VAT Purchases:Software"
        ]
    },
    {
        "id": "subscriptions",
        "kind": "line",
        "description": "Subscriptions",
        "period": "in-year",
        "accounts": [
            "Expenses:VAT Purchases:Subscriptions"
        ]
    },
    {
        "id": "sundries",
        "kind": "line",
        "description": "Sundries",
        "period": "in-year",
        "accounts": [
            "Expenses:VAT Purchases:Sundries"
        ]
    },
    {
        "id": "telecoms",
        "kind": "line",
        "description": "Telecoms",
        "period": "in-year",
        "accounts": [
            "Expenses:VAT Purchases:Telecoms"
        ]
    },
    {
        "id": "travel",
        "kind": "line",
        "description": "Travel",
        "period": "in-year",
        "accounts": [
            "Expenses:VAT Purchases:Travel/Accom"
        ]
    },
    {
        "id": "other-operating-costs",
        "kind": "sum",
        "description": "Other operating costs",
        "inputs": [
            "accountancy",
            "bank-charges",
            "office",
            "software",
            "subscriptions",
            "sundries",
            "telecoms",
            "travel"
        ],
        "period": "in-year"
    },
    {
        "id": "operating-costs",
        "kind": "group",
        "inputs": [
            "personnel-costs",
            "depreciation-and-amortisation",
            "other-operating-costs"
        ],
        "description": "Operating costs",
        "period": "in-year"
    },
    {
        "id": "interest-received",
        "kind": "line",
        "period": "in-year",
        "description": "Interest on current account",
        "accounts": [
            "Income:Interest"
        ]
    },
    {
        "id": "interest-paid",
        "kind": "line",
        "period": "in-year",
        "description": "Interest on bank loans",
        "accounts": [
            "Expenses:Interest Paid"
        ]
    },
    {
        "id": "net-financial-items",
        "kind": "group",
        "inputs": [
            "interest-received",
            "interest-paid"
        ],
        "description": "Net financial items",
        "period": "in-year"
    },
    {
        "id": "income-tax",
        "kind": "line",
        "description": "Income tax",
        "period": "in-year",
        "accounts": [
            "Equity:Corporation Tax"
        ]
    },
    {
        "id": "net-profit",
        "kind": "group",
        "inputs": [
            "operating-revenue",
            "operating-costs",
            "net-financial-items",
            "income-tax"
        ],
        "description": "Net profit for the year",
        "period": "in-year"
    },
    {
        "id": "other-comprehensive-income",
        "kind": "group",
        "inputs": [],
        "description": "Other comprehensive income",
        "period": "in-year"
    },
    {
        "id": "comprehensive-income",
        "kind": "group",
        "inputs": [
            "net-profit",
            "other-comprehensive-income"
        ],
        "description": "Comprehensive income for the year",
        "period": "in-year"
    },
    {
        "id": "tangible-assets",
        "kind": "line",
        "description": "Tangible Assets",
        "period": "at-end",
        "accounts": [
            "Assets:Capital Equipment"
        ]
    },
    {
        "id": "fixed-assets",
        "description": "Fixed Assets",
        "kind": "sum",
        "period": "at-end",
        "inputs": [
            "tangible-assets"
        ]
    },
    {
        "id": "other-non-current-assets",
        "description": "Other non-current assets",
        "kind": "sum",
        "period": "at-end",
        "inputs": []
    },
    {
        "id": "deferred-tax-assets",
        "description": "Deferred tax assets",
        "kind": "sum",
        "period": "at-end",
        "inputs": []
    },
    {
        "id": "non-current-assets",
        "kind": "group",
        "inputs": [
            "fixed-assets",
            "other-non-current-assets",
            "deferred-tax-assets"
        ],
        "description": "Non current assets",
        "period": "at-end"
    },
    {
        "id": "debtors",
        "kind": "line",
        "description": "Debtors",
        "period": "at-end",
        "accounts": [
            "Accounts Receivable",
            "Assets:Owed To Us"
        ]
    },
    {
        "id": "vat-refund-owed",
        "kind": "line",
        "description": "VAT Refund Due",
        "period": "at-end",
        "accounts": [
            "VAT:Input"
        ]
    },
    {
        "id": "bank",
        "kind": "line",
        "description": "Bank",
        "period": "at-end",
        "accounts": [
            "Bank Accounts"
        ]
    },
    {
        "id": "current-assets",
        "kind": "group",
        "description": "Current Assets",
        "period": "at-end",
        "inputs": [
            "debtors",
            "vat-refund-owed",
            "bank"
        ]
    },
    {
        "id": "total-assets",
        "kind": "sum",
        "inputs": [
            "non-current-assets",
            "current-assets"
        ],
        "description": "Total assets",
        "period": "at-end"
    },
    {
        "id": "capital",
        "kind": "line",
        "description": "Capital",
        "period": "at-end",
        "accounts": [
            "Equity:Shareholdings"
        ]
    },
    {
        "id": "retained-profit",
        "kind": "line",
        "description": "Retained profit",
        "period": "at-end",
        "accounts": [
            "Income",
            "Expenses",
            "Equity:Corporation Tax",
            "Equity:Dividends"
        ]
    },
    {
        "id": "equity",
        "kind": "group",
        "inputs": [
            "capital",
            "retained-profit"
        ],
        "description": "Equity",
        "period": "at-end"
    },
    {
        "id": "non-current-liabilities",
        "kind": "group",
        "inputs": [],
        "description": "Non-current liabilities",
        "period": "at-end"
    },
    {
        "id": "trade-creditors",
        "kind": "line",
        "description": "Trade Creditors",
        "reverse-sign": true,
        "period": "at-end",
        "accounts": [
            "Accounts Payable"
        ]
    },
    {
        "id": "other-creditors",
        "kind": "line",
        "description": "Other Creditors",
        "reverse-sign": true,
        "period": "at-end",
        "accounts": [
            "VAT:Output",
            "Liabilities:Owed Corporation Tax"
        ]
    },
    {
        "id": "current-liabilities",
        "kind": "group",
        "inputs": [
            "trade-creditors",
            "other-creditors"
        ],
        "description": "Current liabilities",
        "period": "at-end"
    },
    {
        "id": "total-liabilities",
        "kind": "sum",
        "inputs": [
            "non-current-liabilities",
            "current-liabilities"
        ],
        "description": "Total liabilities",
        "period": "at-end"
    },
    {
        "id": "total-equity-and-liabilities",
        "kind": "sum",
        "inputs": [
            "equity",
            "total-liabilities"
        ],
        "description": "Total equity and liabilities",
        "period": "at-end"
    },
    {
        "id": "income-tax-paid",
        "kind": "line",
        "description": "Income tax",
        "period": "in-year",
        "accounts": [
            "Equity:Corporation Tax"
        ]
    },
    {
        "id": "depreciation-adjustment",
        "kind": "line",
        "description": "Adjustment for depreciation",
        "period": "in-year",
        "reverse-sign": true,
        "accounts": [
            "Expenses:Depreciation"
        ]
    },
    {
        "id": "financial-items-adjustment",
        "kind": "line",
        "description": "Adjustment for financial items",
        "period": "in-year",
        "reverse-sign": true,
        "accounts": [
            "Income:Interest",
            "Expenses:Interest Paid"
        ]
    },
    {
        "id": "income-tax-adjustment",
        "kind": "line",
        "description": "Adjustment for Income tax",
        "period": "in-year",
        "reverse-sign": true,
        "accounts": [
            "Equity:Corporation Tax"
        ]
    },
    {
        "id": "trade-and-other-receivables",
        "kind": "line",
        "description": "Decrease (increase) in trade and other receivables",
        "period": "in-year",
        "reverse-sign": true,
        "accounts": [
            "Accounts Receivable",
            "Assets:Owed To Us",
            "VAT:Input"
        ]
    },
    {
        "id": "inventories",
        "kind": "line",
        "description": "Decrease (increase) in inventories",
        "period": "in-year",
        "reverse-sign": true,
        "accounts": []
    },
    {
        "id": "trade-payables",
        "kind": "line",
        "description": "Increase (decrease) in trade payables",
        "period": "in-year",
        "reverse-sign": true,
        "accounts": [
            "Accounts Payable",
            "VAT:Output",
            "Liabilities:Owed Corporation Tax"
        ]
    },
    {
        "id": "net-cash-from-operating-activities",
        "kind": "group",
        "description": "Net cash from operating activities",
        "period": "in-year",
        "inputs": [
            "net-profit",
            "depreciation-adjustment",
            "financial-items-adjustment",
            "income-tax-adjustment",
            "trade-and-other-receivables",
            "inventories",
            "trade-payables",
            "income-tax-paid"
        ]
    },
    {
        "id": "proceeds-sale-equipment",
        "kind": "line",
        "period": "in-year",
        "description": "Proceeds from sale of equipment",
        "accounts": []
    },
    {
        "id": "purchase-equipment",
        "kind": "line",
        "period": "in-year",
        "reverse-sign": true,
        "description": "Purchase of property, plant and equipment",
        "accounts": [
            "Assets:Capital Equipment:Computer Equipment"
        ]
    },
    {
        "id": "purchase-intangible-assets",
        "kind": "line",
        "period": "in-year",
        "description": "Purchase of intangible assets",
        "accounts": []
    },
    {
        "id": "net-cash-from-investing-activities",
        "kind": "group",
        "description": "Net cash from investing activities",
        "period": "in-year",
        "inputs": [
            "proceeds-sale-equipment",
            "purchase-equipment",
            "purchase-intangible-assets",
            "interest-received"
        ]
    },
    {
        "id": "proceeds-from-issuing-shares",
        "kind": "line",
        "period": "in-year",
        "description": "Issue of share capital",
        "accounts": [
            "Equity:Shareholdings"
        ]
    },
    {
        "id": "dividends-paid",
        "kind": "line",
        "description": "Dividends",
        "period": "in-year",
        "accounts": [
            "Equity:Dividends"
        ]
    },
    {
        "id": "net-cash-from-financing-activities",
        "kind": "group",
        "description": "Net cash from financing activities",
        "period": "in-year",
        "inputs": [
            "interest-paid",
            "proceeds-from-issuing-shares",
            "dividends-paid"
        ]
    },
    {
        "id": "cash-at-start-of-year",
        "kind": "line",
        "period": "at-start",
        "description": "Cash at start of year",
        "accounts": [
            "Bank Accounts"
        ]
    },
    {
        "id": "cash-at-end-of-year",
        "kind": "group",
        "description": "Cash and cash equivalents at end of year",
        "inputs": [
            "cash-at-start-of-year",
            {
                "id": "net-cash-change",
                "kind": "sum",
                "description": "Net change in cash and cash equivalents",
                "period": "in-year",
                "inputs": [
                    "net-cash-from-operating-activities",
                    "net-cash-from-investing-activities",
                    "net-cash-from-financing-activities"
                ]
            }
        ]
    }
]
