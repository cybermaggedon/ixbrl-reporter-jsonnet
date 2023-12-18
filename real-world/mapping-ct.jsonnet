{
    
    line_inputs +: {

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

	"adjustments-depreciation": [
	    "Expenses:Depreciation"
	],

	entertaining: [
	    "Expenses:Entertainment"
	],
	
	"adjustments-entertaining": [
	    "Expenses:Entertainment"
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

	"interest-received": [
	    "Income:Interest Income"
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
	    "Liabilities:Accounts Payable"
        ],

	travel: [
	    "Expenses:Travel and subsistence"
	],

	vehicle: [
	    "Expenses:Vehicle expenses"
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
	    "Revenue"
	],

        consultancy: [
	    "Revenue:Sales"
	],

	"main-income": [
	    "Revenue"
	],
	
	"capital-investment": [
	],

	"purchase-equipment": [
        ],

	"corporation-tax": [
	],

	"capital-losses": [
	    "Expenses:Capital Losses"
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
	    "capital-losses",
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

