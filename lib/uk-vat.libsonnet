local base = import "base.libsonnet";

base + {

    components:: {

	vat(c)::
	    local comps = import "uk-vat/vat-computations.jsonnet";
	    $.config() +
	    {
		report +: {
		    "title": "none",
		    "computations": comps.computations(c),
		    "worksheets": import "uk-vat/vat-worksheets.jsonnet",
		},

		with_title(val):: self + {
		    report +: { "title": val }
		}

	    } +
	    $.taxonomy("uk-vat"),

	composite(c)::
	    local obj = import "generic/composite.libsonnet";
	    obj.element(c),

	"vat-report"(c)::
	    local obj = import "uk-vat/vat-report.libsonnet";
	    obj.element(c),

    },

    taxonomy(t):: {
	report +: {
	    taxonomy: {
		"uk-vat": import "uk-vat/vat-taxonomy.json"
	    }[t]
	}
    },

}

