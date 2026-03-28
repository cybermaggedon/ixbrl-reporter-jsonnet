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
	    "Expenses:Administration and office expenses"
	],

	pensions: [
	],

	"pensions-expense": [
        ],

	salaries: [
	    "Expenses:Payroll Expenses:Salaries and wages",
	    "Expenses:Payroll Expenses:Gifts and Trivial Benefits",
	],

	"salaries-expense": [
	    "Expenses:Payroll Expenses:Salaries and wages",
	    "Expenses:Payroll Expenses:Gifts and Trivial Benefits",
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
	    "Expenses:Taxes:Capital Gains Tax",
	    "Expenses:Taxes:Interest charged",
	    "Expenses:Taxes:Local Taxes",
	    "Expenses:Taxes:NI Contributions",
	    "Expenses:Taxes:Other Taxes",
	    "Expenses:Taxes:Property Taxes",
	    "Expenses:Taxes:VAT",
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
	    "Revenue:Sales"
	],

	"main-income": [
	    "Revenue:Sales"
	],
	
	"capital-investment": [
	],

	"purchase-equipment": [
        ],

	"corporation-tax": [
            "Expenses:Taxes:Corporation Tax",
	],

	"adjustments-exempt-dividends": [
		"Revenue:Dividend Income"
	],

	"dividends": [
		"Revenue:Dividend Income"
	],

	"capital-gains": [
	    "Revenue:Capital Gains",
	    "Expenses:Capital Losses"
	],
	
	"interest-income": [
	    "Revenue:Interest Income"
	],

	"other-income": [
	    "Revenue:Other Income"
	],
	
	"gifts-received": [
	    "Revenue:Gifts received"
	],
	
    },

    compound_inputs +: {

	turnover: [
	    "main-income",
            "capital-gains",
            "gifts-received",
            "other-income",
            "interest-income",
            "dividends",
	],

        "ct-turnover": [
	    "main-income",
            "capital-gains",
            "gifts-received",
            "other-income",
            "interest-income",
            "dividends",
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
	    "taxes",
	    "vehicle",
	    "property-costs",
	],

	"ct-trading-profits-raw": [
	    "profit-loss-per-accounts",
	    "ct-annual-investment-allowance",
	    "adjustments-depreciation",
	    "adjustments-entertaining",
            "adjustments-exempt-dividends",
	],

    },

}

