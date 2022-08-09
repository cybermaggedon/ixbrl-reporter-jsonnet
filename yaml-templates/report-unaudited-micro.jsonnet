
local l = import "lib/frs102.libsonnet";

local elts = {
    "element": "frs102",
    "accounting_standards": "micro-entities",
    "accounts_status": "audit-exempt-no-accountants-report",
    "accounts_type": "abridged-accounts",
    "title": "Unaudited Micro-Entity Accounts",
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
		    "element": "balance-sheet-unaudited-micro",
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
	"accountants-report": "//ref accountants-report",
	"notes": "//ref notes",
    }[x]
};

accts.accounts.report

