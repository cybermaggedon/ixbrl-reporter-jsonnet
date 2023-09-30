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
		"ct-trading-profits"
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

	}

    },

    computation(id, description):: {
        id: id,
	description: description,
	in_year():: self + { period: "in-year" },
	at_end():: self + { period: "at-end" },
	at_start():: self + { period: "at-start" },
	note(n):: self + { note: n },
	segment(k, v)::
	    local elt = { [k]: v };
  	    if std.objectHas(self, "segments") then
	        local segs = self.segments + [{ [k]: v }];
		self + { segments: segs }
	    else
	        self + { segments: [ { [k]: v } ] },
	reverse_sign():: self + { "reverse-sign": true },

    },

    line(id, description):: $.computation(id, description) + {
        kind: "line",
        accounts: $.line_inputs(id),
    },

    sum(id, description):: $.computation(id, description) + {
        kind: "sum",
        inputs: $.compound_inputs(self.id),
    },

    group(id, description):: $.computation(id, description) + {
        kind: "group",
        inputs: $.compound_inputs(self.id),
    },

    round(id, description):: $.computation(id, description) + {
	kind: "round",
	down():: self + { direction: "down" },
	up():: self + { direction: "up" },
	nearest():: self + { direction: "nearest" },
        input: $.compound_inputs(self.id),
    },

    factor(id, description):: $.computation(id, description) + {
	kind: "factor",
	with_factor(f):: self + { factor: f },
        input: $.compound_inputs(self.id),
    },

    compare(id, description):: $.computation(id, description) + {
	kind: "compare",
	greater():: self + { comparison: "greater" },
	less():: self + { comparison: "less" },
        input: $.compound_inputs(self.id),
    },

    apportion(id, description):: $.computation(id, description) + {
	kind: "apportion",
	whole_period(p):: self + { "whole-period": p },
	proportion_period(p):: self + { "proportion-period": p },
        input: $.compound_inputs(self.id),
    },

    line_inputs(line):: $.accounts.mapping[line],

    compound_inputs(id):: $.accounts.compound[id],

}

