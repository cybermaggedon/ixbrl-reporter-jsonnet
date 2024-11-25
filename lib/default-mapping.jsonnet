{

    line_inputs:: {

	salaries: [
	    "Expenses:Emoluments:Employees",
	    "Expenses:Emoluments:Employer's NICs"
	],

	income: [
	    "Income"
	],

	pensions: [
	    "Expenses:Emoluments:Employer Pension Contribution"
	],

	office: [
	    "Expenses:VAT Purchases:Office"
	],

	"software-expenses": [
	    "Expenses:VAT Purchases:Software"
	],

	sundries: [
	    "Expenses:VAT Purchases:Sundries"
	],

	travel: [
	    "Expenses:VAT Purchases:Travel/Accom"
	],

	"subscriptions-costs": [
	    "Expenses:VAT Purchases:Subscriptions"
	],

	telecoms: [
	    "Expenses:VAT Purchases:Telecoms"
	],

	"corporation-tax": [
	    "Equity:Corporation Tax"
	],

	"capital-investment": [
	    "Assets:Capital Equipment:Computer Equipment"
	],


	// Multiple
	accountancy: [
	    "Expenses:VAT Purchases:Accountant"
	],

	"bank-charges": [
	    "Expenses:VAT Purchases:Bank Charges"
	],

	// Accounts
	"main-income": [
	    "Income:Sales"
        ],

	"salaries-expense": [
	    "Expenses:Emoluments:Employees",
	    "Expenses:Emoluments:Employer's NICs"
        ],

	"pensions-expense": [
	    "Expenses:Emoluments:Employer Pension Contribution"
        ],

	depreciation: [
	    "Expenses:Depreciation"
        ],

	software: [
	    "Expenses:VAT Purchases:Software"
        ],

	subscriptions: [
	    "Expenses:VAT Purchases:Subscriptions"
        ],

	tax: [
	    "Equity:Corporation Tax"
        ],

	"interest-received": [
	    "Income:Interest"
        ],

	"interest-paid": [
	    "Expenses:Interest Paid"
        ],

	"tangible-assets": [
	    "Assets:Capital Equipment"
        ],

	debtors: [
	    "Accounts Receivable",
	    "Assets:Owed To Us"
        ],

	"vat-refund-due": [
	    "VAT:Input",
	    "VAT:Settlement:Input",
	    "Assets:VAT Repayments Due"
        ],

	bank: [
	    "Bank Accounts"
        ],

	"trade-creditors": [
	    "Accounts Payable"
        ],

	"other-creditors": [
	    "VAT:Output",
	    "VAT:Settlement:Output",
	    "Liabilities:Credit Cards",
	    "Liabilities:Owed Corporation Tax"
        ],

	"share-capital-equity": [
	    "Equity:Shareholdings"
        ],

	"profit-loss": [
	    "Income",
	    "Expenses"
        ],

	"dividends": [
	    "Equity:Dividends"
        ],

	"fixed-assets-initial": [
	    "Assets:Capital Equipment:Computer Equipment"
        ],

	"fixed-assets-additions": [
	    "Assets:Capital Equipment:Computer Equipment"
        ],

	"depreciation-initial": [
	    "Assets:Capital Equipment:Depreciation"
        ],

	"depreciation-charge": [
	    "Assets:Capital Equipment:Depreciation"
        ],

	"shares-at-start": [
	    "Equity:Shareholdings:Ordinary Shares",
	    "Equity:Shareholdings:Preference Shares"
        ],

	"shares-issued": [
	    "Equity:Shareholdings"
        ],

	"corporation-tax-paid": [
	    "Equity:Corporation Tax"
        ],

	"depreciation-adjustment": [
	    "Expenses:Depreciation"
        ],

	"trade-and-other-receivables": [
	    "Accounts Receivable",
	    "Assets:Owed To Us",
	    "VAT:Input",
	    "VAT:Settlement:Input"
        ],

	inventories: [
	],

	"trade-payables": [
	    "Accounts Payable",
	    "VAT:Output",
	    "VAT:Settlement:Output",
	    "Liabilities:Owed Corporation Tax"
        ],

	"proceeds-sale-equipment": [
	],

	"purchase-equipment": [
	    "Assets:Capital Equipment:Computer Equipment"
        ],

	"purchase-intangible-assets": [
	],

	"purchase-of-non-controlling-interest": [
	],

	"dividends-paid": [
	    "Equity:Dividends"
        ],

	"cash-at-start-of-year": [
	    "Bank Accounts"
        ],

	"current-account": [
            "Bank Accounts:Current Account"
        ],

	"reserve-account": [
            "Bank Accounts:Reserve Account"
        ],

	// ESEF
        "personnel-costs": [
	    "Expenses:Emoluments:Employees",
	    "Expenses:Emoluments:Employer Pension Contribution"
        ],

	"depreciation-and-amortisation": [
	    "Expenses:Depreciation"
        ],

        "income-tax": [
	    "Equity:Corporation Tax"
        ],

        "capital": [
	    "Equity:Shareholdings"
        ],

	"vat-refund-owed": [
	    "VAT:Input",
	    "VAT:Settlement:Input",
	    "Assets:VAT Repayments Due"
        ],

	"retained-profit": [
	    "Income",
	    "Expenses",
	    "Equity:Corporation Tax",
	    "Equity:Dividends"
        ],

        "income-tax-paid": [
	    "Equity:Corporation Tax"
	],

	"financial-items-adjustment": [
	    "Income:Interest",
	    "Expenses:Interest Paid"
        ],

	"income-tax-adjustment": [
	    "Equity:Corporation Tax"
        ],

	"proceeds-from-issuing-shares": [
	    "Equity:Shareholdings"
        ],

	"ct-trading-losses-brought-forward": [
	],
	
    },

    compound_inputs: {

	turnover: [
	    "main-income"
	],

	"other-operating-income": [],

	"raw-materials-consumables": [],

	"gross-profit": ["turnover"],

	"staff-costs": [
	    "salaries-expense",
	    "pensions-expense"
	],

	"other-charges": [
	    "accountancy",
	    "bank-charges",
	    "office",
	    "software",
	    "subscriptions",
	    "sundries",
	    "telecoms",
	    "travel"
	],

	profit: [
	    "turnover",
	    "other-operating-income",
	    "raw-materials-consumables",
	    "staff-costs",
	    "depreciation",
	    "other-charges"
	],

	charges: [
	    "depreciation",
	    "staff-costs",
	    "other-charges"
	],

	"interest-income": [
	    "interest-received"
	],

	"interest-expense": [
	    "interest-paid"
	],

	zero: [],

	"fixed-assets": [ "tangible-assets" ],

        "current-assets": [
	    "debtors",
	    "vat-refund-due",
	    "bank"
	],

	"prepayments-and-accrued-income": [],

	"creditors-within-1-year": [
	    "trade-creditors",
	    "other-creditors",
	],

	"net-current-assets": [
	    "current-assets",
	    "prepayments-and-accrued-income",
	    "creditors-within-1-year"
	],

	"total-assets-less-liabilities": [
	    "fixed-assets",
	    "current-assets",
	    "prepayments-and-accrued-income",
	    "creditors-within-1-year"
	],

	"creditors-after-1-year": [
	],

	"provisions-for-liabilities": [
	],

	"accruals-and-deferred-income": [
	],

	"net-assets": [
	    "total-assets-less-liabilities",
	    "creditors-after-1-year",
	    "provisions-for-liabilities",
	    "accruals-and-deferred-income"
	],

	"capital-and-reserves": [
	    "share-capital-equity",
	    "profit-loss",
	    "dividends",
	    "corporation-tax"
	],

	"total-capital-and-reserves": [
	    "capital-and-reserves"
	],

	"fixed-assets-total": [
	    "fixed-assets-initial",
	    "fixed-assets-additions"
	],

        "deprectiation-total": [
	    "depreciation-initial",
	    "depreciation-charge"
	],

	"carrying-final": [
	    "fixed-assets-total",
	    "depreciation-total"
	],

	"share-capital": [
	    "shares-at-start",
	    "shares-issued"
	],

	"cash-inflow": [
	    "profit"
	],

	"cash-from-operations": [
	    "cash-inflow",
	    "depreciation-adjustment",
	    "trade-and-other-receivables",
	    "inventories",
	    "trade-payables"
	],

	"net-cash-from-operating-activities": [
	    "profit",
	    "depreciation-adjustment",
	    "trade-and-other-receivables",
	    "inventories",
	    "trade-payables",
	    "corporation-tax-paid"
	],

	"net-cash-from-investing-activities": [
	    "proceeds-sale-equipment",
	    "purchase-equipment",
	    "purchase-intangible-assets",
	    "interest-received"
	],

	"proceeds-from-issuing-shares": [
	    "shares-issued"
	],

	"net-cash-from-financing-activities": [
	    "interest-paid",
	    "proceeds-from-issuing-shares",
	    "purchase-of-non-controlling-interest",
	    "dividends-paid"
	],

	"cash-at-end-of-year": [
	    "cash-at-start-of-year",
	    "net-cash-change"
	],

	"net-cash-change": [
            "net-cash-from-operating-activities",
            "net-cash-from-investing-activities",
            "net-cash-from-financing-activities"
	],

	"cash": [
	    "current-account",
            "reserve-account"
	],

	"depreciation-total": [
	    "depreciation-initial",
	    "depreciation-charge"
	],


	// FIXME: Accts vs CT

	"ct-turnover": [
	    "income"
	],


	// CT600 wants turnover as whole pounds.  This is the
	// un-rounded form.

	"gross-profit-raw": [ "ct-turnover" ],

	"gross-profit-round": "gross-profit-raw",

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
	    "travel"
	],

	"profit-before-tax": [
	    "gross-profit-round",
	    "total-costs"
	],


	"tax-due": [
	    "corporation-tax"
	],

	"profit-after-tax": [
	    "profit-before-tax",
	    "tax-due"
	],


	"rnd-qualifying-expenditure": [
	],


	"rnd-enhanced-expenditure": "rnd-qualifying-expenditure",

	"rnd-creative-enhanced-expenditure": [
	    "rnd-enhanced-expenditure"
	],


	"ct-annual-investment-allowance": "capital-investment",

	"profit-loss-per-accounts": [
	    "profit-before-tax"
	],

	"ct-trading-profits-raw": [
	    "profit-loss-per-accounts",
	    "ct-annual-investment-allowance",
	    "rnd-enhanced-expenditure"
	],

	"ct-trading-profits-if-pos": "ct-trading-profits-raw",

	"ct-trading-profits-if-neg": "ct-trading-profits-raw",

	"ct-trading-profits": "ct-trading-profits-if-pos",
	
	"ct-trading-losses": [ "ct-trading-profits-if-neg" ],

	"ct-net-trading-profits": [
	    "ct-trading-profits",
            "ct-trading-losses-brought-forward"
	],
	
	"profits-before-other-deductions-and-reliefs": [
	    "ct-net-trading-profits"
	],

	"profits-before-charges-and-group-relief": [
	    "profits-before-other-deductions-and-reliefs"
	],

	"total-profits-chargeable-to-corporation-tax": [
	    "profits-before-charges-and-group-relief"
	],

	"ct-profit-before-tax-fy1-raw": "ct-net-trading-profits",

	"ct-profit-before-tax-fy1": "ct-profit-before-tax-fy1-raw",

	"ct-profit-before-tax-fy2-raw": "ct-net-trading-profits",

	"ct-profit-before-tax-fy2": "ct-profit-before-tax-fy2-raw",

	"ct-profit-before-tax-total": [
	    "ct-profit-before-tax-fy1",
	    "ct-profit-before-tax-fy2"
	],

	"ct-tax-fy1": "ct-profit-before-tax-fy1",
	"ct-tax-fy2": "ct-profit-before-tax-fy2",

	"ct-tax-total": [
	    "ct-tax-fy1",
	    "ct-tax-fy2"
	],

	"corporation-tax-chargeable-payable": [
	    "ct-tax-total"
	],

	"net-corporation-tax-payable": [
	    "corporation-tax-chargeable-payable"
	],

	"ct-tax-owed": [
	    "net-corporation-tax-payable"
	],

	"tax-chargeable": [
	    "ct-tax-owed"
	],

	"tax-payable": [
	    "tax-chargeable"
	],

	// ESEF...

	"operating-revenue": [
	    "main-income"
	],

	"other-operating-costs": [
	    "accountancy",
	    "bank-charges",
	    "office",
	    "software",
	    "subscriptions",
	    "sundries",
	    "telecoms",
	    "travel"
	],

	"operating-costs": [
	    "personnel-costs",
	    "depreciation-and-amortisation",
	    "other-operating-costs"
	],

	"net-financial-items": [
	    "interest-received",
	    "interest-paid"
	],

	"net-profit": [
	    "operating-revenue",
	    "operating-costs",
	    "net-financial-items",
	    "income-tax"
	],

	"other-comprehensive-income": [],

	"comprehensive-income": [
	    "net-profit",
	    "other-comprehensive-income"
	],

	"other-non-current-assets": [],

	"deferred-tax-assets": [],

        "non-current-assets": [
	    "fixed-assets",
	    "other-non-current-assets",
	    "deferred-tax-assets"
        ],

	"total-assets": [
	    "non-current-assets",
	    "current-assets"
	],

	"equity": [
	    "capital",
	    "retained-profit"
        ],

	"non-current-liabilities": [],

	"current-liabilities": [
	    "trade-creditors",
	    "other-creditors"
	],

        "total-liabilities": [
	    "non-current-liabilities",
	    "current-liabilities"
	],

	"total-equity-and-liabilities": [
	    "equity",
	    "total-liabilities"
	],

	"esef-net-cash-from-operating-activities": [
	    "net-profit",
	    "depreciation-adjustment",
	    "financial-items-adjustment",
	    "income-tax-adjustment",
	    "trade-and-other-receivables",
	    "inventories",
	    "trade-payables",
	    "income-tax-paid"
	],

	"esef-net-cash-from-investing-activities": [
	    "proceeds-sale-equipment",
	    "purchase-equipment",
	    "purchase-intangible-assets",
	    "interest-received"
	],

	"esef-net-cash-from-financing-activities": [
	    "interest-paid",
	    "proceeds-from-issuing-shares",
	    "dividends-paid"
        ],

	"esef-net-cash-change": [
            "esef-net-cash-from-operating-activities",
            "esef-net-cash-from-investing-activities",
            "esef-net-cash-from-financing-activities"
	],

	"esef-cash-at-end-of-year": [
	    "cash-at-start-of-year",
            "esef-net-cash-change"
	],

    }

}
