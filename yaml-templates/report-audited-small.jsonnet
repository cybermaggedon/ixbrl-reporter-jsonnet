
local l = import "lib/frs102.libsonnet";

local elts = {
    "element": "frs102",
    "accounting_standards": "small-entities-regime",
    "accounts_status": "audited",
    "accounts_type": "abridged-accounts",
    "title": "Audited Small Company Accounts",
    "accounts_file": "example2.gnucash",
    "accounts_kind": "piecash",
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
		    "element": "consent"
		},	    
		{
		    "element": "company-info"
		},	    
		{
		    "element": "directors-report"
		},	    
		{
		    "element": "auditors-report"
		},	    
		{	    
		    "element": "balance-sheet",
		    "signature": "signature"
		},
		{
		    "element": "profit-and-loss"
		},
		{
		    "element": "maybe-revision-info"
		},
		{
		    "element": "simple-notes"
		}
	    ]
	}
    ]
};

local accts = {

    library:: l + {
        components +: {
            "maybe-revision-info"(c)::
	        local obj = import "maybe-revision-info.jsonnet";
	        obj.element(c),
        }
    },

    accounts:: $.library.from_element_def(elts, self),

    resource(x):: {
	"logo": import "detail/logo.jsonnet",
	"signature": import "detail/signature.jsonnet",
	"revision-info": "//ref revision-info",
	"directors-report": "//ref directors-report",
	"auditors-report": "//ref auditors-report",
    }[x]
};

accts.accounts.report

