
local l = import "lib/frs102.libsonnet";
local modify = import "lib/modify.libsonnet";
local computations = import "lib/computations.libsonnet";

local elts = {
    "element": "frs102",
    "accounting_standards": "micro-entities",
    "accounts_status": "audit-exempt-no-accountants-report",
    "accounts_type": "abridged-accounts",
    "title": "Unaudited Micro-Entity Accounts",
    "accounts_file": "example2.gnucash",
    "accounts_kind": "gnucash",
    "elements": [
	{
	    "element": "composite",
	    "id": "report",
	    "elements": [
		{
		    "element": "title-page",
		    "logo": "logo"
		},
		{
		    "element": "company-info"
		},	    
		{	    
		    "element": "balance-sheet-unaudited-micro",
		    "signature": "signature"
		},
/*
		{	    
		    "element": "profit-and-loss"
		},
		{	    
		    "element": "cash-flows"
		},
*/
		{
		    "element": "local-notes",
		}
	    ]
	}
    ]
};

local accts = {

    metadata: import "example-accts/metadata.jsonnet",

    library:: l + {
        components +: {
            "local-notes"(c)::
   	        local obj = import "local-notes.libsonnet";
	        obj.element(c),
        }
    },

    accounts:: $.library.from_element_def(elts, self)
        .with_metadata(self.metadata),

    resource(x):: {
    	"logo": import "example-accts/logo.jsonnet",
	"signature": import "example-accts/signature.jsonnet",
    }[x],

    local comp_updates = import "example-accts/comps.jsonnet",
    
    local comps = computations.update($.accounts.report.computations, comp_updates),

    local ctxts = modify($.accounts.report.taxonomy.contexts),
    local mod_ctxts = ctxts,

    local metadata = modify($.accounts.report.taxonomy.metadata),
    local mod_metadata = metadata,

    tailored:: self.accounts + {
	
	report +: {
	    computations: comps,
	    taxonomy +: {
		contexts: mod_ctxts.val,
		metadata: mod_metadata.val,
	    }
	}

    }
};

accts.tailored

