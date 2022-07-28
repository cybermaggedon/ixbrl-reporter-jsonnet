
local base = import "base.libsonnet";

base + {

    components:: {

	esef(c)::
	    $.config() +
	    {
		report +: {
		    "title": "none",
		    "computations": import "esef-en/esef-computations.jsonnet",
		    "worksheets": import "esef/esef-worksheets.jsonnet",
		},

		with_title(val):: self + {
		    report +: { "title": val }
		}

	    } +
	    $.taxonomy("esef"),

	page(c)::
	    local obj = import "generic/page.libsonnet";
	    obj.element(c),

	composite(c)::
	    local obj = import "generic/composite.libsonnet";
	    obj.element(c),

	worksheet(c)::
	    local obj = import "generic/worksheet.libsonnet";
	    obj.element(c),

	html(c)::
	    local obj = import "generic/html.libsonnet";
	    obj.element(c),

	"title-page"(c)::
	    local obj = import "esef-en/title-page.libsonnet";
	    obj.element(c),

	"company-info"(c)::
	    local obj = import "esef-en/company-info.libsonnet";
	    obj.element(c),

	"income-statement"(c)::
	    local obj = import "esef-en/income-statement.libsonnet";
	    obj.element(c),

	"balance-sheet"(c)::
	    local obj = import "esef-en/balance-sheet.libsonnet";
	    obj.element(c),

	"cash-flows"(c)::
	    local obj = import "esef-en/cash-flows.libsonnet";
	    obj.element(c),

	notes(c)::
	    local obj = import "generic/notes.libsonnet";
	    obj.element(c),

    },

    taxonomy(t):: {
	report +: {
	    taxonomy: {
		"esef": import "taxonomy/esef.jsonnet"
	    }[t]
	}
    },

}

