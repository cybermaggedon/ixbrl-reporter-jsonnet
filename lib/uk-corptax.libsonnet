
local base = import "base.libsonnet";

base + {

    accounts(line):: {
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
	"bank-charges": [
            "Expenses:VAT Purchases:Bank Charges"
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
	accountancy: [
            "Expenses:VAT Purchases:Accountant"
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
    }[line],

    components:: {

	corptax(c)::
	    $.config() +
	    {

		report +: {
		    local comps = import "uk-corptax/ct-computations.jsonnet",
		    local ws = import "uk-corptax/ct-worksheets.jsonnet",
		    "computations": comps($),
		    "worksheets": ws
		},

		with_accounting_standards(val):: self + {
		    report +: { "accounting-standards": val }
		},

		with_accounts_status(val):: self + {
		    report +: { "accounts-status": val }
		},

		with_accounts_type(val):: self + {
		    report +: { "accounts-type": val }
		},

		with_title(val):: self + {
		    report +: { "title": val }
		}

	    } +
	    $.taxonomy("ct-dpl"),

	composite(c)::
	    local obj = import "generic/composite.libsonnet";
	    obj.element(c),

	page(c)::
	    local obj = import "generic/page.libsonnet";
	    obj.element(c),

	facttable(c)::
	    local obj = import "generic/facttable.libsonnet";
	    obj.element(c),

	worksheet(c)::
	    local obj = import "generic/worksheet.libsonnet";
	    obj.element(c),

	"front-page"(c)::
	    local obj = import "uk-corptax/front-page.libsonnet";
	    obj.element(c),

	"capital-allowances"(c)::
	    local obj = import "uk-corptax/capital-allowances.libsonnet";
	    obj.element(c),

	"profits"(c)::
	    local obj = import "uk-corptax/profits.libsonnet";
	    obj.element(c),

	"losses"(c)::
	    local obj = import "uk-corptax/losses.libsonnet";
	    obj.element(c),

	"tax-chargeable"(c)::
	    local obj = import "uk-corptax/tax-chargeable.libsonnet";
	    obj.element(c),

	"research-dev-enhanced-expenditure"(c)::
	    local obj =
	        import "uk-corptax/research-dev-enhanced-expenditure.libsonnet";
	    obj.element(c),

	"research-dev"(c)::
	    local obj = import "uk-corptax/research-dev.libsonnet";
	    obj.element(c),

	"tax-calculation"(c)::
	    local obj = import "uk-corptax/tax-calculation.libsonnet";
	    obj.element(c),

	"detailed-profit-and-loss"(c)::
	    local obj = import "uk-corptax/detailed-profit-and-loss.libsonnet";
	    obj.element(c),

    },

    taxonomy(t):: {
	report +: {
	    taxonomy: {
		"ct-dpl": import "taxonomy/ct-dpl.jsonnet"
	    }[t]
	}
    },

}

