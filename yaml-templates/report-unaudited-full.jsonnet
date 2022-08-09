
local l = import "lib/frs102.libsonnet";

local elts = {
    "element": "frs102",
    "accounting_standards": "frs102",
    "accounts_status": "audit-exempt-with-accountants-report",
    "accounts_type": "full-accounts",
    "title": "Unaudited Full Accounts",
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
		    "element": "directors-report"
		},	    
		{
		    "element": "accountants-report"
		},	    
		{	    
		    "element": "balance-sheet",
		    "signature": "signature"
		},
		{
		    "element": "cash-flows"
		},
		{
		    "element": "comprehensive-income"
		},
		{
		    "element": "maybe-revision-info"
		},
		{
		    "element": "notes"
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
	"revision-info": import "detail/revision-info.jsonnet",
	"directors-report": import "detail/directors-report.jsonnet",
	"accountants-report": import "detail/accountants-report.jsonnet",
	"notes": import "detail/notes.jsonnet",
    }[x]
};

accts.accounts.report

