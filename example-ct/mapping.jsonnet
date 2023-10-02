{

    line_inputs +: {

	// Add the input to the 'entertainment' computation
	entertainment: [
	    "Expenses:Entertainment",
	],

	// Add the input to the 'shipping' computation
	shipping: [
	    "Expenses:VAT Purchases:Import Charges",
	    "Expenses:VAT Purchases:Shipping Charges"
	],

	// Add a corporation tax adjustment for depreciation
	// (added back to profits as not a tax-deductable expense)
	"adjustments-depreciation": [
	    "Expenses:Depreciation"
	],

	// Add a corporation tax adjustment for entertainment
	// (added back to profits as not a tax-deductable expense)
	"adjustments-entertainment": [
	    "Expenses:Entertainment",
	],

    },

    compound_inputs +: {

	// Add depreciation, entertainment and shipping to expenses
	// in the DPL
	"total-costs": [
	    "salaries",
	    "pensions",
	    "accountancy",
	    "bank-charges",
	    "office",
	    "software-expenses",
	    "subscriptions-costs",
	    "sundries",
	    "telecoms",
	    "travel",
	    "depreciation",
	    "entertainment",
	    "shipping",
	],

	// Modify the profit calculation to add depreciation and
	// entertainment adjustments.
	"ct-trading-profits-raw": [
	    "profit-loss-per-accounts",
	    "ct-annual-investment-allowance",
	    "adjustments-depreciation",
	    "adjustments-entertainment",
	    "rnd-enhanced-expenditure"
	],

    }

}

