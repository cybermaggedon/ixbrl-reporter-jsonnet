{

    config():: {

	local cfg = self,

	style:: import "style.jsonnet",

	report +: {
	    "style": cfg.style
	},

	with_accounts_file(file):: self + {
	    accounts +: {
		file: file
	    }
	},

	with_accounts_kind(kind):: self + {
	    accounts +: {
		kind: kind
	    }
	},

	with_metadata(m):: self + { metadata: m },

	with_elements(e):: self + { report +: { elements: e } }

    },

    from_element_def(eltdef, c)::

        local elt = self.components[eltdef.element](c);

	local with = function(obj, k)
	  if k == "element"
	  then obj
	  else
	      (if k == "elements"
	      then obj + obj.with_elements([
                  $.from_element_def(e, c) for e in eltdef["elements"]
              ])
	      else obj["with_" + k](eltdef[k]));

	local mod_elt = std.foldl(
	    with, std.objectFields(eltdef), elt
	);

        mod_elt,

    accounts:: {

        mapping:: {
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
	    "tax-due": [
		"corporation-tax"
	    ],
	    "ct-annual-investment-allowance": [
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
	    "consultancy": [
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

	},

	compound: {
	    turnover: [
		"consultancy"
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
	}

    }

}

