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
	    "Assets:Accounts Receivable",
        ],

	"fixed-assets-initial": [
        ],

	"fixed-assets-additions": [
        ],

	"tangible-assets": [
        ],

	"trade-and-other-receivables": [
	    "Assets:Accounts Receivable",
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

	entertaining: [
	    "Expenses:General administrative expenses:Entertaining,Entertaining"
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
	    "Expenses:Property Costs"
	],

	// Liabilities
	"other-creditors": [
	    "Liabilities:Credit Card",
        ],

	"trade-payables": [
	    "Liabilities:Accounts Payable",
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

