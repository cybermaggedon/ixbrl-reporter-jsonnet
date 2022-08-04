
local l = import "lib/uk-corptax.libsonnet";
local modify = import "lib/modify.libsonnet";
local computations = import "lib/computations.libsonnet";

local elts = {
    "element": "corptax",
    "title": "Corporation Tax Statement",
    "accounts_file": "example2.gnucash",
    "accounts_kind": "gnucash",
    "elements": [
	{
	    "element": "composite",
	    "id": "report",
	    "elements": [
		{
		    "element": "front-page"
		},
		{
		    "element": "capital-allowances"
		},
		{
		    "element": "profits"
		},
		{
		    "element": "losses"
		},
		{
		    "element": "tax-chargeable"
		},
		{
		    "element": "research-dev-enhanced-expenditure"
		},
		{
		    "element": "research-dev"
		},
		{
		    "element": "detailed-profit-and-loss"
		},
		{
		    "element": "tax-calculation"
		}
	    ]
	}
    ]
};

local accts = {

    metadata: import "example-ct/metadata.jsonnet",

    accounts:: l.from_element_def(elts, self)
        .with_metadata(self.metadata),

    local comp_updates = import "example-ct/comps.jsonnet",

    local comps = computations.update($.accounts.report.computations, comp_updates),

    local ctxts = modify($.accounts.report.taxonomy.contexts),
    local mod_ctxts = ctxts.delete("previous-period"),

    local wsheets = modify($.accounts.report.worksheets),
    local mod_wsheets = wsheets.replace("rnd", {
	"id": "rnd",
	"kind": "simple",
	"description": "SME R&D",
	"computations": [
	    "rnd-proj1-enhanced-expenditure",
	    "rnd-enhanced-expenditure"
	]
    }),

    local metadata = modify($.accounts.report.taxonomy.metadata),
    local mod_metadata = metadata.delete("average-employees-previous"),

    local mod_desc_tags = $.accounts.report.taxonomy["description-tags"] + {
    },

    local mod_tags = $.accounts.report.taxonomy.tags + {
    },

    local mod_rev = $.accounts.report.taxonomy["sign-reversed"] + {
    },

    tailored:: self.accounts + {
	
	report +: {
	    computations: comps,
	    worksheets: mod_wsheets.val,
	    taxonomy +: {
		contexts: mod_ctxts.val,
		metadata: mod_metadata.val,
		"description-tags": mod_desc_tags,
		tags: mod_tags,
		"sign-reversed": mod_rev
	    }
	}

    }
};

accts.tailored

