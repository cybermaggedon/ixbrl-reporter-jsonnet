
local base = import "base.libsonnet";

base + {

    components:: {

	corptax(c)::
	    $.config() +
	    {
		report +: {
		    "computations": import "uk-corptax/ct-computations.jsonnet",
		    "worksheets": import "uk-corptax/ct-worksheets.jsonnet",
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

