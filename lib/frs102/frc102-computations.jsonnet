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
        "id": "turnover",
        "kind": "sum",
        "description": "Turnover / revenue",
        "period": "in-year",
        "inputs": [
            "consultancy"
        ]
    },
    {
        "id": "other-operating-income",
        "kind": "sum",
        "description": "Other income",
        "period": "in-year",
        "inputs": []
    },
    {
        "id": "raw-materials-consumables",
        "kind": "sum",
        "description": "Cost of raw materials",
        "period": "in-year",
        "inputs": []
    },
    {
        "id": "gross-profit",
        "kind": "sum",
        "description": "Gross Profit",
        "period": "in-year",
        "inputs": [
            "turnover"
        ]
    },
    {
        "id": "salaries-expense",
        "kind": "line",
        "accounts": [
            "Expenses:Emoluments:Employees",
            "Expenses:Emoluments:Employer's NICs"
        ],
        "description": "Salaries",
        "period": "in-year"
    },
    {
        "id": "pensions-expense",
        "kind": "line",
        "accounts": [
            "Expenses:Emoluments:Employer Pension Contribution"
        ],
        "description": "Pension contributions",
        "period": "in-year"
    },
    {
        "id": "staff-costs",
        "kind": "group",
        "note": "staff-costs-note",
        "inputs": [
            "salaries-expense",
            "pensions-expense"
        ],
        "description": "Staff costs",
        "period": "in-year"
    },
    {
        "id": "depreciation",
        "kind": "line",
        "description": "Depreciation",
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
        "id": "other-charges",
        "kind": "sum",
        "description": "Other charges",
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
        "id": "tax",
        "kind": "line",
        "description": "Tax",
        "period": "in-year",
        "accounts": [
            "Equity:Corporation Tax"
        ]
    },
    {
        "id": "profit",
        "kind": "group",
        "note": "profit-note",
        "description": "Profit (Loss)",
        "period": "in-year",
        "inputs": [
            "turnover",
            "other-operating-income",
            "raw-materials-consumables",
            "staff-costs",
            "depreciation",
            "other-charges"
        ]
    },
    {
        "id": "charges",
        "kind": "group",
        "description": "Charges against profits",
        "period": "in-year",
        "inputs": [
            "depreciation",
            "staff-costs",
            "other-charges"
        ]
    },
    {
        "id": "interest-received",
        "kind": "line",
        "note": "financial-income-note",
        "period": "in-year",
        "description": "Interest on current account",
        "accounts": [
            "Income:Interest"
        ]
    },
    {
        "id": "interest-income",
        "kind": "group",
        "description": "Interest income",
        "period": "in-year",
        "inputs": [
            "interest-received"
        ]
    },
    {
        "id": "interest-paid",
        "kind": "line",
        "period": "in-year",
        "note": "financial-costs-note",
        "description": "Interest on bank loans",
        "accounts": [
            "Expenses:Interest Paid"
        ]
    },
    {
        "id": "interest-expense",
        "kind": "group",
        "description": "Interest expense",
        "period": "in-year",
        "inputs": [
            "interest-paid"
        ]
    },
    {
        "id": "zero",
        "kind": "group",
        "description": "No information",
        "period": "in-year",
        "inputs": []
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
        "note": "equipment-note",
        "inputs": [
            "tangible-assets"
        ]
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
        "id": "vat-refund-due",
        "kind": "line",
        "description": "VAT Refund Due",
        "period": "at-end",
        "accounts": [
            "VAT:Input",
	    "VAT:Settlement:Input",
	    "Assets:VAT Repayments Due"
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
        "kind": "sum",
        "description": "Current Assets",
        "inputs": [
            "debtors",
            "vat-refund-due",
            "bank"
        ]
    },
    {
        "id": "prepayments-and-accrued-income",
        "kind": "group",
        "description": "Prepayments and Accrued Income",
        "inputs": []
    },
    {
        "id": "trade-creditors",
        "kind": "line",
        "description": "Trade Creditors",
        "period": "at-end",
        "accounts": [
            "Accounts Payable"
        ]
    },
    {
        "id": "other-creditors",
        "kind": "line",
        "description": "Other Creditors",
        "period": "at-end",
        "accounts": [
            "VAT:Output",
	    "VAT:Settlement:Output",
	    "Liabilities:Credit Cards",
            "Liabilities:Owed Corporation Tax"
        ]
    },
    {
        "id": "creditors-within-1-year",
        "kind": "sum",
        "description": "Creditors: falling due within one year",
        "inputs": [
            "trade-creditors",
            "other-creditors",
        ],
        "segments": [
            { "matures": "within-1-year" }
        ]
    },
    {
        "id": "net-current-assets",
        "kind": "sum",
        "description": "Net Current Assets",
        "inputs": [
            "current-assets",
            "prepayments-and-accrued-income",
            "creditors-within-1-year"
        ]
    },
    {
        "id": "total-assets-less-liabilities",
        "kind": "sum",
        "description": "Total Assets Less Liabilities",
        "inputs": [
            "fixed-assets",
            "current-assets",
            "prepayments-and-accrued-income",
            "creditors-within-1-year"
        ]
    },
    {
        "id": "creditors-after-1-year",
        "kind": "group",
        "description": "Creditors: falling due after one year",
        "inputs": [],
        "segments": [
            { "matures": "after-1-year" }
        ]
    },
    {
        "description": "Provisions For Liabilities",
        "id": "provisions-for-liabilities",
        "kind": "sum",
        "inputs": [
        ]
    },
    {
        "id": "accruals-and-deferred-income",
        "kind": "group",
        "description": "Accrued liabilities and deferred income",
        "inputs": []
    },
    {
        "id": "net-assets",
        "kind": "sum",
        "description": "Net Assets",
        "inputs": [
            "total-assets-less-liabilities",
            "creditors-after-1-year",
            "provisions-for-liabilities",
            "accruals-and-deferred-income"
        ]
    },
    {
        "id": "share-capital-equity",
        "kind": "line",
        "description": "Share Capital",
        "period": "at-end",
        "accounts": [
            "Equity:Shareholdings"
        ],
        "segments": [
            { "equity": "ordinary-shares" }
        ]
    },
    {
        "id": "profit-loss",
        "kind": "line",
        "description": "Retained Profit",
        "period": "at-end",
        "accounts": [
            "Income",
            "Expenses"
        ]
    },
    {
        "id": "dividends",
        "kind": "line",
        "description": "Dividends",
        "period": "at-end",
        "accounts": [
            "Equity:Dividends"
        ]
    },
    {
        "id": "corporation-tax",
        "kind": "line",
        "description": "Corporation tax",
        "period": "at-end",
        "accounts": [
            "Equity:Corporation Tax"
        ]
    },
    {
        "description": "Capital and Reserves",
        "id": "capital-and-reserves",
        "kind": "group",
        "inputs": [
            "share-capital-equity",
            "profit-loss",
            "dividends",
            "corporation-tax"
        ]
    },
    {
        "id": "total-capital-and-reserves",
        "kind": "sum",
        "description": "Capital and Reserves",
        "inputs": [
            "capital-and-reserves"
        ]
    },
    {
        "id": "fixed-assets-initial",
        "kind": "line",
        "description": "At start of period",
        "period": "at-start",
        "accounts": [
            "Assets:Capital Equipment:Computer Equipment"
        ]
    },
    {
        "id": "fixed-assets-additions",
        "kind": "line",
        "description": "Additions",
        "period": "in-year",
        "accounts": [
            "Assets:Capital Equipment:Computer Equipment"
        ]
    },
    {
        "id": "fixed-assets-total",
        "kind": "group",
        "description": "Fixed Assets",
        "inputs": [
            "fixed-assets-initial",
            "fixed-assets-additions"
        ]
    },
    {
        "id": "depreciation-initial",
        "kind": "line",
        "description": "At start of period",
        "period": "at-start",
        "accounts": [
            "Assets:Capital Equipment:Depreciation"
        ]
    },
    {
        "id": "depreciation-charge",
        "kind": "line",
        "description": "Charge",
        "period": "in-year",
        "accounts": [
            "Assets:Capital Equipment:Depreciation"
        ]
    },
    {
        "id": "depreciation-total",
        "kind": "group",
        "description": "Depreciation",
        "inputs": [
            "depreciation-initial",
            "depreciation-charge"
        ]
    },
    {
        "id": "carrying-final",
        "kind": "sum",
        "description": "Carrying at end of period",
        "inputs": [
            "fixed-assets-total",
            "depreciation-total"
        ]
    },
    {
        "id": "shares-at-start",
        "kind": "line",
        "description": "Ordinary Shares held at start",
        "period": "at-start",
        "accounts": [
            "Equity:Shareholdings:Ordinary Shares",
            "Equity:Shareholdings:Preference Shares"
        ]
    },
    {
        "id": "shares-issued",
        "kind": "line",
        "description": "Shares Issued in period",
        "period": "in-year",
        "accounts": [
            "Equity:Shareholdings"
        ]
    },
    {
        "id": "share-capital",
        "kind": "group",
        "description": "Share Capital",
        "period": "at-end",
        "inputs": [
            "shares-at-start",
            "shares-issued"
        ],
        "segments": [
            { "equity": "ordinary-shares" }
        ]
    },
    {
        "id": "corporation-tax-paid",
        "kind": "line",
        "note": "taxation-note",
        "description": "Corporation tax",
        "period": "in-year",
        "accounts": [
            "Equity:Corporation Tax"
        ]
    },
    {
        "id": "depreciation-adjustment",
        "kind": "line",
        "note": "equipment-note",
        "description": "Adjustment for depreciation",
        "period": "in-year",
        "reverse-sign": true,
        "accounts": [
            "Expenses:Depreciation"
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
            "VAT:Input",
	    "VAT:Settlement:Input"
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
	    "VAT:Settlement:Output",
            "Liabilities:Owed Corporation Tax"
        ]
    },
    {
        "id": "cash-inflow",
        "kind": "sum",
        "period": "in-year",
        "inputs": [
            "profit"
        ]
    },
    {
        "id": "cash-from-operations",
        "kind": "group",
        "description": "Cash from operations",
        "period": "in-year",
        "inputs": [
            "cash-inflow",
            "depreciation-adjustment",
            "trade-and-other-receivables",
            "inventories",
            "trade-payables"
        ]
    },
    {
        "id": "net-cash-from-operating-activities",
        "kind": "group",
        "description": "Net cash from operating activities",
        "period": "in-year",
        "inputs": [
            "profit",
            "depreciation-adjustment",
            "trade-and-other-receivables",
            "inventories",
            "trade-payables",
            "corporation-tax-paid"
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
        "kind": "group",
        "period": "in-year",
        "note": "share-capital-note",
        "description": "Issue of share capital",
        "inputs": [
            "shares-issued"
        ]
    },
    {
        "id": "purchase-of-non-controlling-interest",
        "kind": "line",
        "period": "in-year",
        "description": "Purchase of non-controlling interest",
        "accounts": []
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
            "purchase-of-non-controlling-interest",
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
        "note": "cash-note",
        "description": "Cash and cash equivalents at end of year",
        "inputs": [
            "cash-at-start-of-year",
            {
                "id": "net-cash-change",
                "kind": "sum",
                "description": "Net change in cash and cash equivalents",
                "inputs": [
                    "net-cash-from-operating-activities",
                    "net-cash-from-investing-activities",
                    "net-cash-from-financing-activities"
                ]
            }
        ]
    },
    {
        "id": "cash",
        "kind": "group",
        "description": "Cash and cash equivalents at end of year",
        "period": "at-end",
        "inputs": [
            {
                "id": "current-account",
                "kind": "line",
                "description": "Current account",
                "period": "at-end",
                "accounts": [
                    "Bank Accounts:Current Account"
                ]
            },
            {
                "id": "reserve-account",
                "kind": "line",
                "description": "Reserve account",
                "period": "at-end",
                "accounts": [
                    "Bank Accounts:Reserve Account"
                ]
            }
        ]
    }
]
