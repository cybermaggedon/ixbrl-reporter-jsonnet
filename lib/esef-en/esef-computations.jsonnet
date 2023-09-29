function(accts)
[
    {
        "id": "consultancy",
        "kind": "line",
        "description": "Consultancy",
        "period": "in-year",
        "accounts": accts.accounts(self.id)
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
        "description": "Personnel costs",
        "period": "in-year",
        "accounts": accts.accounts(self.id)
    },
    {
        "id": "depreciation-and-amortisation",
        "kind": "line",
        "description": "Depreciation and amortisation",
        "period": "in-year",
        "accounts": accts.accounts(self.id)
    },
    {
        "id": "accountancy",
        "kind": "line",
        "description": "Accountancy services",
        "period": "in-year",
        "accounts": accts.accounts(self.id)
    },
    {
        "id": "bank-charges",
        "kind": "line",
        "description": "Bank charges",
        "period": "in-year",
        "accounts": accts.accounts(self.id)
    },
    {
        "id": "office",
        "kind": "line",
        "description": "Office costs",
        "period": "in-year",
        "accounts": accts.accounts(self.id)
    },
    {
        "id": "software",
        "kind": "line",
        "description": "Software",
        "period": "in-year",
        "accounts": accts.accounts(self.id)
    },
    {
        "id": "subscriptions",
        "kind": "line",
        "description": "Subscriptions",
        "period": "in-year",
        "accounts": accts.accounts(self.id)
    },
    {
        "id": "sundries",
        "kind": "line",
        "description": "Sundries",
        "period": "in-year",
        "accounts": accts.accounts(self.id)
    },
    {
        "id": "telecoms",
        "kind": "line",
        "description": "Telecoms",
        "period": "in-year",
        "accounts": accts.accounts(self.id)
    },
    {
        "id": "travel",
        "kind": "line",
        "description": "Travel",
        "period": "in-year",
        "accounts": accts.accounts(self.id)
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
        "accounts": accts.accounts(self.id)
    },
    {
        "id": "interest-paid",
        "kind": "line",
        "period": "in-year",
        "description": "Interest on bank loans",
        "accounts": accts.accounts(self.id)
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
        "accounts": accts.accounts(self.id)
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
        "accounts": accts.accounts(self.id)
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
        "accounts": accts.accounts(self.id)
    },
    {
        "id": "vat-refund-owed",
        "kind": "line",
        "description": "VAT Refund Due",
        "period": "at-end",
        "accounts": accts.accounts(self.id)
    },
    {
        "id": "bank",
        "kind": "line",
        "description": "Bank",
        "period": "at-end",
        "accounts": accts.accounts(self.id)
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
        "accounts": accts.accounts(self.id)
    },
    {
        "id": "retained-profit",
        "kind": "line",
        "description": "Retained profit",
        "period": "at-end",
        "accounts": accts.accounts(self.id)
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
        "accounts": accts.accounts(self.id)
    },
    {
        "id": "other-creditors",
        "kind": "line",
        "description": "Other Creditors",
        "reverse-sign": true,
        "period": "at-end",
        "accounts": accts.accounts(self.id)
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
        "accounts": accts.accounts(self.id)
    },
    {
        "id": "depreciation-adjustment",
        "kind": "line",
        "description": "Adjustment for depreciation",
        "period": "in-year",
        "reverse-sign": true,
        "accounts": accts.accounts(self.id)
    },
    {
        "id": "financial-items-adjustment",
        "kind": "line",
        "description": "Adjustment for financial items",
        "period": "in-year",
        "reverse-sign": true,
        "accounts": accts.accounts(self.id)
    },
    {
        "id": "income-tax-adjustment",
        "kind": "line",
        "description": "Adjustment for Income tax",
        "period": "in-year",
        "reverse-sign": true,
        "accounts": accts.accounts(self.id)
    },
    {
        "id": "trade-and-other-receivables",
        "kind": "line",
        "description": "Decrease (increase) in trade and other receivables",
        "period": "in-year",
        "reverse-sign": true,
        "accounts": accts.accounts(self.id)
    },
    {
        "id": "inventories",
        "kind": "line",
        "description": "Decrease (increase) in inventories",
        "period": "in-year",
        "reverse-sign": true,
        "accounts": accts.accounts(self.id)
    },
    {
        "id": "trade-payables",
        "kind": "line",
        "description": "Increase (decrease) in trade payables",
        "period": "in-year",
        "reverse-sign": true,
        "accounts": accts.accounts(self.id)
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
        "accounts": accts.accounts(self.id)
    },
    {
        "id": "purchase-equipment",
        "kind": "line",
        "period": "in-year",
        "reverse-sign": true,
        "description": "Purchase of property, plant and equipment",
        "accounts": accts.accounts(self.id)
    },
    {
        "id": "purchase-intangible-assets",
        "kind": "line",
        "period": "in-year",
        "description": "Purchase of intangible assets",
        "accounts": accts.accounts(self.id)
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
        "accounts": accts.accounts(self.id)
    },
    {
        "id": "dividends-paid",
        "kind": "line",
        "description": "Dividends",
        "period": "in-year",
        "accounts": accts.accounts(self.id)
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
        "accounts": accts.accounts(self.id)
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
