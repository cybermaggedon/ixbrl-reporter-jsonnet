{
    
    line_inputs +: {

	// Assets

	bank: [
	    "Assets:Current Assets",
        ],

	"cash-at-start-of-year": [
	    "Assets:Current Assets"
        ],

	"current-account": [
            "Assets:Current Assets"
        ],

	"reserve-account": [
        ],

	debtors: [
	    "Assets:Current Assets:Accounts Receivable (Debtors)",
        ],

	"fixed-assets-initial": [
        ],

	"fixed-assets-additions": [
        ],

	"tangible-assets": [
        ],

	"trade-and-other-receivables": [
	    "Assets:Current Assets:Accounts Receivable (Debtors)",
        ],

	"capital-investment": [
	],

	"purchase-equipment": [
        ],

	"vat-refund-due": [
        ],

	// Equity

	capital: [
	    "Equity"
	],

	"retained-profit": [
	    "Equity:Retained Earnings"
	],

        "income-tax": [
        ],

	"corporation-tax": [
	],

	tax: [
        ],

	"corporation-tax-paid": [
        ],

	"dividends": [
        ],

	"dividends-paid": [
        ],

	"share-capital-equity": [
        ],

	"shares-at-start": [
        ],

	"shares-issued": [
        ],

	// Expenses
	accountancy: [
  	    "Expenses:Payroll Expenses:Accountancy and audit"
	],

	"bank-charges": [
	    "Expenses:Bank, credit card and other financial charges"
	],

	"bad-debts": [
	    "Expenses:Bad debts"
	],

	"donations": [
	    "Expenses:Donations"
	],

	depreciation: [
	    "Expenses:Depreciation"
	],

	entertaining: [
	    "Expenses:Entertaining,Entertaining"
	],
	
	insurance: [
	    "Expenses:Insurance"
	],
	
	"loss-profit-on-disposal": [
	    "Expenses:Profit/loss on disposal of assets"
	],
	
	"depreciation-initial": [
	    "Expenses:Depreciation"
        ],

	"depreciation-charge": [
	    "Expenses:Depreciation"
        ],

	"depreciation-adjustment": [
	    "Expenses:Depreciation"
        ],

	"interest-paid": [
	    "Expenses:Interest paid"
	],

	"income": [
	    "Revenue"
	],

	"profit-loss": [
	    "Revenue",
	    "Expenses"
	],

	"interest-received": [
	    "Revenue:Interest Income"
	],

	"consultancy": [
	    "Revenue:Sales"
	],

	office: [
	    "Expenses:Interest paid"
	],

	pensions: [
	],

	"pensions-expense": [
        ],

	salaries: [
	    "Expenses:Payroll Expenses:Salaries and wages",
	],

	"salaries-expense": [
	    "Expenses:Payroll Expenses:Salaries and wages",
	],

	"software": [
	],

	"software-expenses": [
	],

	subscriptions: [
        ],

	"subscriptions-costs": [
        ],

	sundries: [
	    "Expenses:Sundry expenses (small miscellaneous expenses only)"
	],

	taxes: [
	    "Expenses:Taxes"
	],

	telecoms: [
	],

	"trade-creditors": [
	    "Liabilities:Current Liabilities:Accounts Payable"
        ],

	travel: [
	    "Expenses:Travel and subsistence"
	],

	vehicle: [
	    "Expenses:Vehicle expenses"
	],

	"property-costs": [
	    "Expenses:Property Costs"
	],

	// Liabilities
	"other-creditors": [
	    "Liabilities:Current Liabilities:Credit Card",
        ],

	"trade-payables": [
	    "Liabilities:Current Liabilities:Accounts Payable",
        ],

    },

    compound_inputs +: {

	"other-operating-costs": [
	    "accountancy",
	    "bank-charges",
	    "office",
	    "software",
	    "subscriptions",
	    "sundries",
	    "telecoms",
	    "travel",
	    "bad-debts",
	    "donations",
	    "entertaining",
	    "insurance",
	    "loss-profit-on-disposal",
	    "taxes",
	    "vehicle",
	    "property-costs",
	],

    },

}

