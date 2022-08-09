
local l = import "lib/frs102.libsonnet";

local elts = {
    "element": "frs102",
    "accounting_standards": "micro-entities",
    "accounts_status": "audited",
    "accounts_type": "abridged-accounts",
    "title": "Audited Micro-Entity Accounts",
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
		    "element": "company-info"
		},	    
		{
		    "element": "auditors-report"
		},	    
		{	    
		    "element": "balance-sheet-audited-micro",
		    "signature": "signature"
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
	"logo": "//ref logo",
	"signature": "//ref signature",
	"revision-info": "//ref revision-info",
	"directors-report": "//ref directors-report",
	"auditors-report": "//ref auditors-report",
	"notes": "//ref notes",
    }[x]
};

accts.accounts.report

