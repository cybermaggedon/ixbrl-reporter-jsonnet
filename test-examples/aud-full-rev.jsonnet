
local l = import "lib/frs102.libsonnet";

local elts = {
    "element": "frs102",
    "accounting_standards": "frs102",
    "accounts_status": "audited",
    "accounts_type": "full-accounts",
    "title": "Audited Full Accounts",
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
		    "element": "auditors-report"
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
		    "element": "revision-info"
		},	    
		{
		    "element": "notes"
		}
	    ]
	}
    ]
};

local accts = {
    metadata: import "test-examples/metadata-acc-aud-rev.jsonnet",
    accounts:: l.from_element_def(elts, self).with_metadata(self.metadata),
    resource(x):: {
	"logo": import "detail/logo.jsonnet",
	"signature": import "detail/signature.jsonnet",
	"directors-report": import "detail/directors-report.jsonnet",
	"auditors-report": import "detail/revised-auditors-report.jsonnet",
	"revision-info": import "detail/revision-info.jsonnet",
	"notes": import "detail/notes.jsonnet"
    }[x]
};

accts.accounts

