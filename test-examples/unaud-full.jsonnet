
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
		    "element": "notes"
		}
	    ]
	}
    ]
};

local accts = {
    metadata: import "test-examples/metadata-acc.jsonnet",
    accounts:: l.from_element_def(elts, self).with_metadata(self.metadata),
    resource(x):: {
	"logo": import "detail/logo.jsonnet",
	"signature": import "detail/signature.jsonnet",
	"directors-report": import "detail/directors-report.jsonnet",
	"accountants-report": import "detail/accountants-report.jsonnet",
	"notes": import "detail/notes.jsonnet"
    }[x]
};

accts.accounts

