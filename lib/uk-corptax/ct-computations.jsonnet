function(ct)
[
    {
        "id": "income",
        "description": "Income from main trade",
        "period": "in-year",
        "segments": [
	    { "activity": "m" },
            { "detailed-analysis": "item1" },
            { "countries-regions": "UK" }
	],
        "kind": "line",
        "accounts": ct.accounts($.id)
    },
    {
        "id": "turnover",
        "kind": "group",
        "description": "Turnover / revenue",
        "period": "in-year",
        "inputs": [
            "income"
        ]
    },
    {
        "id": "gross-profit",
        "description": "Gross profit",
	"kind": "round",
	"direction": "down",
        "period": "in-year",
	"input": {
            "kind": "sum",
            "period": "in-year",
            "inputs": [
		"turnover"
            ]
	}
    },
    {
        "id": "salaries",
        "kind": "line",
        "description": "Salaries",
        "period": "in-year",
        "segments": [
            { "expense-type": "administrative-expenses" }
        ],
        "accounts": ct.accounts($.id)
    },
    {
        "id": "pensions",
        "kind": "line",
        "description": "Pension contributions",
        "period": "in-year",
        "segments": [
            { "expense-type": "administrative-expenses" }
        ],
        "accounts": ct.accounts($.id)
    },
    {
        "id": "bank-charges",
        "kind": "line",
        "description": "Bank charges",
        "period": "in-year",
        "segments": [
	    { "expense-type": "administrative-expenses" }
        ],
        "accounts": ct.accounts($.id)
    },
    {
        "id": "office",
        "kind": "line",
        "description": "Office costs",
        "period": "in-year",
        "segments": [
	    { "expense-type": "administrative-expenses" }
        ],
        "accounts": ct.accounts($.id)
    },
    {
        "id": "software-expenses",
        "kind": "line",
        "description": "Software",
        "period": "in-year",
        "segments": [
	    { "expense-type": "administrative-expenses" }
        ],
        "accounts": ct.accounts($.id)
    },
    {
        "id": "sundries",
        "description": "Sundries",
        "kind": "line",
        "period": "in-year",
        "segments": [
	    { "expense-type": "administrative-expenses" }
        ],
        "accounts": ct.accounts($.id)
    },
    {
        "id": "travel",
        "description": "Travel",
        "kind": "line",
        "period": "in-year",
        "segments": [
            { "expense-type": "administrative-expenses" }
        ],
        "accounts": ct.accounts($.id)
    },
    {
        "id": "accountancy",
        "description": "Accountancy services",
        "kind": "line",
        "period": "in-year",
        "segments": [
	    { "expense-type": "administrative-expenses" }
        ],
        "accounts": ct.accounts($.id)
    },
    {
        "id": "subscriptions-costs",
        "kind": "line",
        "description": "Subscriptions",
        "period": "in-year",
        "segments": [
            { "expense-type": "administrative-expenses" }
        ],
        "accounts": ct.accounts($.id)
    },
    {
        "id": "telecoms",
        "kind": "line",
        "description": "Telecoms",
        "period": "in-year",
        "segments": [
            { "expense-type": "administrative-expenses" }
        ],
        "accounts": ct.accounts($.id)
    },
    {
        "id": "total-costs",
        "description": "Total costs",
        "kind": "group",
        "period": "in-year",
        "inputs": [
            "salaries",
            "pensions",
            "accountancy",
            "bank-charges",
            "office",
            "software-expenses",
            "subscriptions-costs",
            "sundries",
            "telecoms",
            "travel"
        ]
    },
    {
        "id": "profit-before-tax",
        "kind": "group",
        "description": "Net profit before tax",
        "inputs": [
            "gross-profit",
            "total-costs"
        ],
        "period": "in-year"
    },
    {
        "id": "corporation-tax",
        "kind": "line",
        "description": "Corporation tax",
        "period": "in-year",
        "accounts": ct.accounts($.id)
    },
    {
        "id": "tax-due",
        "description": "Corporation tax",
        "kind": "sum",
        "period": "in-year",
        "inputs": [
	    "corporation-tax"
	]
    },
    {
        "id": "profit",
        "kind": "sum",
        "description": "Profit (Loss) after tax",
        "period": "in-year",
        "inputs": [
            "profit-before-tax",
            "tax-due"
        ]
    },
    {
        "id": "rnd-qualifying-expenditure",
        "kind": "group",
        "description": "SME R&D qualifying expenditure",
        "period": "in-year",
        "segments": [
            { "business-name": "metadata.business.company-name" },
            { "business-type": "trade" },
            { "loss-reform": "post-loss-reform" },
            { "territory": "uk" }
        ],
        "inputs": [
        ]
    },
    {
        "id": "rnd-enhanced-expenditure",
        "kind": "factor",
        "description": "SME R&D enhanced expenditure (130%)",
        "factor": 1.3,
        "period": "in-year",
        "input": "rnd-qualifying-expenditure",
        "segments": [
            { "business-name": "metadata.business.company-name" },
            { "business-type": "trade" },
            { "loss-reform": "post-loss-reform" },
            { "territory": "uk" }
        ]
    },
    {
        "id": "rnd-creative-enhanced-expenditure",
        "kind": "sum",
        "description": "SME R&D / Creative enhanced expenditure (130%)",
        "period": "in-year",
        "inputs": [
	    "rnd-enhanced-expenditure",
	],
        "segments": [
            { "business-name": "metadata.business.company-name" },
            { "business-type": "trade" },
            { "loss-reform": "post-loss-reform" },
            { "territory": "uk" }
        ]
    },
    {
        "id": "ct-annual-investment-allowance",
        "kind": "round",
        "description": "Annual investment allowance",
        "period": "in-year",
        "direction": "down",
        "segments": [
            { "business-type": "management-expenses" }
        ],
        "input": {
            "kind": "line",
            "period": "in-year",
            "reverse-sign": true,
            "segments": [
                { "business-type": "management-expenses" }
            ],
            "accounts": ct.accounts($.id)
        }
    },
    {
        "id": "profit-loss-per-accounts",
        "kind": "sum",
        "description": "Profit (loss) per accounts",
        "period": "in-year",
        "segments": [
            { "business-name": "metadata.business.company-name" },
            { "business-type": "trade" },
            { "loss-reform": "post-loss-reform" },
            { "territory": "uk" }
        ],
        "inputs": [
            "profit-before-tax"
        ]
    },
    {
        "id": "ct-trading-profits-raw",
        "kind": "group",
        "description": "Taxable profits",
        "period": "in-year",
        "segments": [
            { "business-type": "company" }
        ],
        "inputs": [
            "profit-loss-per-accounts",
            "ct-annual-investment-allowance",
            "rnd-enhanced-expenditure"
        ]
    },
    {
        "id": "ct-trading-profits",
        "kind": "round",
        "description": "Taxable profits",
        "input": {
	    "kind": "compare",
	    "comparison": "greater",
	    "input": "ct-trading-profits-raw",
	},
        "direction": "down",
        "period": "in-year",
        "segments": [
            { "business-type": "company" }
        ]
    },
    {
        "id": "ct-trading-losses",
        "kind": "sum",
        "description": "Trading losses",
        "inputs": [
	    {
		"kind": "compare",
		"comparison": "less",
		"input": "ct-trading-profits-raw"
	    }
	],
        "period": "in-year",
        "segments": [
            { "business-type": "company" }
        ]
    },
    {
        "id": "ct-net-trading-profits",
        "kind": "sum",
        "description": "Profits chargeable to corporation tax",
        "period": "in-year",
        "segments": [
            { "business-type": "company" }
        ],
        "inputs": [
            "ct-trading-profits"
        ]
    },
    {
        "id": "profits-before-other-deductions-and-reliefs",
        "kind": "group",
        "description": "Profits before other deductions and reliefs",
        "period": "in-year",
        "segments": [
            { "business-type": "company" }
        ],
        "inputs": [
            "ct-net-trading-profits"
        ]
    },
    {
        "id": "profits-before-charges-and-group-relief",
        "kind": "group",
        "description": "Profits before donations and group relief",
        "period": "in-year",
        "segments": [
            { "business-type": "company" }
        ],
        "inputs": [
            "profits-before-other-deductions-and-reliefs"
        ]
    },
    {
        "id": "total-profits-chargeable-to-corporation-tax",
        "kind": "group",
        "description": "Profits chargeable to Corporation Tax",
        "period": "in-year",
        "segments": [
            { "business-type": "company" }
        ],
        "inputs": [
            "profits-before-charges-and-group-relief"
        ]
    },
    {
        "id": "ct-profit-before-tax-fy1",
        "kind": "round",
        "description": "FY1",
        "period": "in-year",
        "direction": "nearest",
        "input": {
            "kind": "apportion",
            "description": "FY1",
            "period": "in-year",
            "input": "ct-net-trading-profits",
            "whole-period": "metadata.accounting.periods.0",
            "proportion-period": "metadata.tax.fy1"
        },
        "segments": [
            { "business-type": "company" }
        ]
    },
    {
        "id": "ct-profit-before-tax-fy2",
        "kind": "round",
        "description": "FY2",
        "period": "in-year",
        "direction": "nearest",
        "input": {
            "kind": "apportion",
            "description": "FY2",
            "period": "in-year",
            "input": "ct-net-trading-profits",
            "whole-period": "metadata.accounting.periods.0",
            "proportion-period": "metadata.tax.fy2"
        },
        "segments": [
            { "business-type": "company" }
        ]
    },
    {
        "id": "ct-profit-before-tax-total",
        "description": "Profits, by financial year",
        "kind": "group",
        "period": "in-year",
        "inputs": [
            "ct-profit-before-tax-fy1",
            "ct-profit-before-tax-fy2"
        ],
        "segments":  [
            { "business-type": "company" }
        ]
    },
    {
        "id": "ct-tax-fy1",
        "kind": "factor",
        "description": "FY1 (19%)",
        "factor": -0.19,
        "period": "in-year",
        "input": "ct-profit-before-tax-fy1",
        "reverse-sign": true,
        "segments": [
            { "business-type": "company" }
        ]
    },
    {
        "id": "ct-tax-fy2",
        "kind": "factor",
        "description": "FY2 (19%)",
        "factor": -0.19,
        "period": "in-year",
        "input": "ct-profit-before-tax-fy2",
        "reverse-sign": true,
        "segments": [
            { "business-type": "company" }
        ]
    },
    {
        "id": "ct-tax-total",
        "description": "Corporation tax chargeable",
        "kind": "group",
        "inputs": [
            "ct-tax-fy1",
            "ct-tax-fy2"
        ],
        "period": "in-year",
        "segments": [
            { "business-type": "company" }
        ]
    },
    {
        "id": "corporation-tax-chargeable-payable",
        "kind": "sum",
        "inputs": [
            "ct-tax-total"
        ],
        "period": "in-year",
        "segments": [
            { "business-type": "company" }
        ]
    },
    {
        "id": "net-corporation-tax-payable",
        "kind": "sum",
        "inputs": [
            "corporation-tax-chargeable-payable"
        ],
        "period": "in-year",
        "segments": [
            { "business-type": "company" }
        ]
    },
    {
        "id": "ct-tax-owed",
        "kind": "sum",
        "inputs": [
            "net-corporation-tax-payable"
        ],
        "period": "in-year",
        "segments": [
            { "business-type": "company" }
        ]
    },
    {
        "id": "tax-chargeable",
        "kind": "sum",
        "inputs": [
            "ct-tax-owed"
        ],
        "period": "in-year",
        "segments": [
            { "business-type": "company" }
        ]
    },
    {
        "id": "tax-payable",
        "kind": "sum",
        "inputs": [
            "tax-chargeable"
        ],
        "period": "in-year",
        "segments": [
            { "business-type": "company" }
        ]
    }
]
