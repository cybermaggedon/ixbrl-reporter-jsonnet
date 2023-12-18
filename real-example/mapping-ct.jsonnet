{
    
    line_inputs +: {

	// Expenses
	accountancy: [
  	    "Expenses:Payroll Expenses:Accountancy and audit"
	],

	"bank-charges": [
	    "Expenses:General administrative expenses:Bank, credit card and other financial charges"
	],

	"bad-debts": [
	    "Expenses:General administrative expenses:Bad debts"
	],

	"donations": [
	    "Expenses:General administrative expenses:Donations"
	],

	depreciation: [
	    "Expenses:General administrative expenses:Depreciation"
	],

	"adjustments-depreciation": [
	    "Expenses:General administrative expenses:Depreciation"
	],

	entertaining: [
	    "Expenses:General administrative expenses:Entertaining"
	],
	
	"adjustments-entertaining": [
	    "Expenses:General administrative expenses:Entertaining"
	],
	
	insurance: [
	    "Expenses:General administrative expenses:Insurance"
	],
	
	"loss-profit-on-disposal": [
	    "Expenses:General administrative expenses:Profit/loss on disposal of assets"
	],
	
	"depreciation-initial": [
	    "Expenses:General administrative expenses:Depreciation"
        ],

	"depreciation-charge": [
	    "Expenses:General administrative expenses:Depreciation"
        ],

	"depreciation-adjustment": [
	    "Expenses:General administrative expenses:Depreciation"
        ],

	"interest-paid": [
	    "Expenses:General administrative expenses:Interest paid"
	],

	"interest-received": [
	    "Income:Interest Income"
	],

	office: [
	    "Expenses:General administrative expenses:Interest paid"
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
	    "Expenses:General administrative expenses:Sundry expenses (small miscellaneous expenses only)"
	],

	taxes: [
	    "Expenses:Taxes"
	],

	telecoms: [
	],

	"trade-creditors": [
	    "Liabilities:Accounts Payable"
        ],

	travel: [
	    "Expenses:General administrative expenses:Travel and subsistence"
	],

	vehicle: [
	    "Expenses:General administrative expenses:Vehicle expenses"
	],

	"property-costs": [
	    "Expenses:Property costs"
	],

	// Liabilities
	"other-creditors": [
	    "Liabilities:Credit Card",
        ],

	"trade-payables": [
	    "Liabilities:Accounts Payable",
        ],

	// Income
	income: [
	    "Income"
	],

	"main-income": [
	    "Income"
	],
	
	"capital-investment": [
	],

	"purchase-equipment": [
        ],

	"corporation-tax": [
	],

    },

    compound_inputs +: {

	turnover: [
	    "main-income",
	],

	"total-costs": [
	    "salaries",
	    "pensions",
	    "accountancy",
	    "bank-charges",
	    "office",
	    "software-expenses",
	    "depreciation",
	    "subscriptions-costs",
	    "sundries",
	    "insurance",
	    "telecoms",
	    "travel",
	    "bad-debts",
	    "donations",
	    "entertaining",
	    "loss-profit-on-disposal",
	    "taxes",
	    "vehicle",
	    "property-costs",
	],

	"ct-trading-profits-raw": [
	    "profit-loss-per-accounts",
	    "ct-annual-investment-allowance",
	    "adjustments-depreciation",
	    "adjustments-entertaining",
	],

    },

}

