[
    {
        "id": "consultancy",
        "kind": "line",
        "description": "Consultance",
        "period": "in-year",
        "accounts": [
            "Income:Sales"
        ]
    },
    {
        "id": "operating-revenue",
        "kind": "sum",
        "description": "Revenus d'exploitation",
        "period": "in-year",
        "inputs": [
            "consultancy"
        ]
    },
    {
        "id": "personnel-costs",
        "description": "Co\u00fbts de personnel",
        "kind": "line",
        "accounts": [
            "Expenses:Emoluments:Employees",
            "Expenses:Emoluments:Employer Pension Contribution"
        ],
        "period": "in-year"
    },
    {
        "id": "depreciation-and-amortisation",
        "kind": "line",
        "description": "D\u00e9pr\u00e9ciation et amortissement",
        "accounts": [
            "Expenses:Depreciation"
        ],
        "period": "in-year"
    },
    {
        "id": "accountancy",
        "kind": "line",
        "description": "Services de comptabilit\u00e9",
        "accounts": [
            "Expenses:VAT Purchases:Accountant"
        ],
        "period": "in-year"
    },
    {
        "id": "bank-charges",
        "kind": "line",
        "description": "Charges bancaires",
        "period": "in-year",
        "accounts": [
            "Expenses:VAT Purchases:Bank Charges"
        ]
    },
    {
        "id": "office",
        "kind": "line",
        "description": "Frais de bureau",
        "period": "in-year",
        "accounts": [
            "Expenses:VAT Purchases:Office"
        ]
    },
    {
        "id": "software",
        "kind": "line",
        "description": "Logiciel",
        "period": "in-year",
        "accounts": [
            "Expenses:VAT Purchases:Software"
        ]
    },
    {
        "id": "subscriptions",
        "kind": "line",
        "description": "Abonnements",
        "period": "in-year",
        "accounts": [
            "Expenses:VAT Purchases:Subscriptions"
        ]
    },
    {
        "id": "sundries",
        "kind": "line",
        "description": "Articles divers",
        "period": "in-year",
        "accounts": [
            "Expenses:VAT Purchases:Sundries"
        ]
    },
    {
        "id": "telecoms",
        "kind": "line",
        "description": "T\u00e9l\u00e9coms",
        "period": "in-year",
        "accounts": [
            "Expenses:VAT Purchases:Telecoms"
        ]
    },
    {
        "id": "travel",
        "kind": "line",
        "description": "Voyage",
        "period": "in-year",
        "accounts": [
            "Expenses:VAT Purchases:Travel/Accom"
        ]
    },
    {
        "id": "other-operating-costs",
        "kind": "sum",
        "description": "Autres co\u00fbts d'exploitation",
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
        "description": "Co\u00fbts d'exploitation",
        "period": "in-year"
    },
    {
        "id": "interest-received",
        "kind": "line",
        "period": "in-year",
        "description": "Int\u00e9r\u00eats sur le compte courant",
        "accounts": [
            "Income:Interest"
        ]
    },
    {
        "id": "interest-paid",
        "kind": "line",
        "period": "in-year",
        "description": "Int\u00e9r\u00eats sur les pr\u00eats bancaires",
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
        "description": "\u00c9l\u00e9ments financiers nets",
        "period": "in-year"
    },
    {
        "id": "income-tax",
        "kind": "line",
        "description": "Imp\u00f4ts sur le revenu",
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
        "description": "B\u00e9n\u00e9fice net pour l'ann\u00e9e",
        "period": "in-year"
    },
    {
        "id": "other-comprehensive-income",
        "kind": "group",
        "inputs": [],
        "description": "Autres \u00e9l\u00e9ments du r\u00e9sultat global",
        "period": "in-year"
    },
    {
        "id": "comprehensive-income",
        "kind": "group",
        "inputs": [
            "net-profit",
            "other-comprehensive-income"
        ],
        "description": "R\u00e9sultat global de l'ann\u00e9e",
        "period": "in-year"
    },
    {
        "id": "tangible-assets",
        "kind": "line",
        "description": "Actifs corporels",
        "period": "at-end",
        "accounts": [
            "Assets:Capital Equipment"
        ]
    },
    {
        "id": "fixed-assets",
        "description": "Actifs fixes",
        "kind": "sum",
        "period": "at-end",
        "inputs": [
            "tangible-assets"
        ]
    },
    {
        "id": "other-non-current-assets",
        "description": "Autres actifs non courants",
        "kind": "sum",
        "period": "at-end",
        "inputs": []
    },
    {
        "id": "deferred-tax-assets",
        "description": "Actifs d'imp\u00f4ts diff\u00e9r\u00e9s",
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
        "description": "Actifs non courants",
        "period": "at-end"
    },
    {
        "id": "debtors",
        "kind": "line",
        "description": "D\u00e9biteurs",
        "period": "at-end",
        "accounts": [
            "Accounts Receivable",
            "Assets:Owed To Us"
        ]
    },
    {
        "id": "vat-refund-owed",
        "kind": "line",
        "description": "Remboursement de la TVA d\u00fb",
        "period": "at-end",
        "accounts": [
            "VAT:Input"
        ]
    },
    {
        "id": "bank",
        "kind": "line",
        "description": "Liquidit\u00e9s en banque",
        "period": "at-end",
        "accounts": [
            "Bank Accounts"
        ]
    },
    {
        "id": "current-assets",
        "kind": "group",
        "description": "Actifs courants",
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
        "description": "Total des actifs",
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
        "description": "B\u00e9n\u00e9fice non distribu\u00e9",
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
        "description": "Passifs non courants",
        "period": "at-end"
    },
    {
        "id": "trade-creditors",
        "kind": "line",
        "description": "Cr\u00e9anciers commerciaux",
        "reverse-sign": true,
        "period": "at-end",
        "accounts": [
            "Accounts Payable"
        ]
    },
    {
        "id": "other-creditors",
        "kind": "line",
        "description": "Autres cr\u00e9anciers",
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
        "description": "Passif \u00e0 court terme",
        "period": "at-end"
    },
    {
        "id": "total-liabilities",
        "kind": "sum",
        "inputs": [
            "non-current-liabilities",
            "current-liabilities"
        ],
        "description": "Total du passif",
        "period": "at-end"
    },
    {
        "id": "total-equity-and-liabilities",
        "kind": "sum",
        "inputs": [
            "equity",
            "total-liabilities"
        ],
        "description": "Total des fonds propres et du passif",
        "period": "at-end"
    },
    {
        "id": "income-tax-paid",
        "kind": "line",
        "description": "Imp\u00f4ts sur le revenu",
        "period": "in-year",
        "accounts": [
            "Equity:Corporation Tax"
        ]
    },
    {
        "id": "depreciation-adjustment",
        "kind": "line",
        "description": "Ajustement pour d\u00e9pr\u00e9ciation",
        "period": "in-year",
        "reverse-sign": true,
        "accounts": [
            "Expenses:Depreciation"
        ]
    },
    {
        "id": "financial-items-adjustment",
        "kind": "line",
        "description": "Ajustement pour les \u00e9l\u00e9ments financiers",
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
        "description": "Ajustement pour l'imp\u00f4t sur le revenu",
        "period": "in-year",
        "reverse-sign": true,
        "accounts": [
            "Equity:Corporation Tax"
        ]
    },
    {
        "id": "trade-and-other-receivables",
        "kind": "line",
        "description": "Diminution (augmentation) des cr\u00e9ances commerciales et autres cr\u00e9ances",
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
        "description": "Diminution (augmentation) des stocks",
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
        "description": "Tr\u00e9sorerie nette des activit\u00e9s op\u00e9rationnelles",
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
        "description": "Produit de la vente d'\u00e9quipements",
        "accounts": []
    },
    {
        "id": "purchase-equipment",
        "kind": "line",
        "period": "in-year",
        "reverse-sign": true,
        "description": "Achat de biens, d'installations et d'\u00e9quipements",
        "accounts": [
            "Assets:Capital Equipment:Computer Equipment"
        ]
    },
    {
        "id": "purchase-intangible-assets",
        "kind": "line",
        "period": "in-year",
        "description": "Achat d'actifs incorporels",
        "accounts": []
    },
    {
        "id": "net-cash-from-investing-activities",
        "kind": "group",
        "description": "Tr\u00e9sorerie nette des activit\u00e9s d'investissement",
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
        "description": "\u00c9mission de capital social",
        "accounts": [
            "Equity:Shareholdings"
        ]
    },
    {
        "id": "dividends-paid",
        "kind": "line",
        "description": "Dividendes",
        "period": "in-year",
        "accounts": [
            "Equity:Dividends"
        ]
    },
    {
        "id": "net-cash-from-financing-activities",
        "kind": "group",
        "description": "Tr\u00e9sorerie nette des activit\u00e9s de financement",
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
        "description": "Liquidit\u00e9s au d\u00e9but de l'ann\u00e9e",
        "accounts": [
            "Bank Accounts"
        ]
    },
    {
        "id": "cash-at-end-of-year",
        "kind": "group",
        "description": "Tr\u00e9sorerie et \u00e9quivalents de tr\u00e9sorerie \u00e0 la fin de l'ann\u00e9e",
        "inputs": [
            "cash-at-start-of-year",
            {
                "id": "net-cash-change",
                "kind": "sum",
                "description": "Variation nette de la tr\u00e9sorerie et des \u00e9quivalents de tr\u00e9sorerie",
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
