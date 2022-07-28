
local l = import "lib/frs102.libsonnet";

local elts = {
    "element": "frs102",
    "accounting_standards": "small-entities-regime",
    "accounts_status": "audit-exempt-with-accountants-report",
    "accounts_type": "abridged-accounts",
    "title": "Unaudited Abridged Accounts",
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
		    "element": "consent"
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
		    "element": "profit-and-loss"
		},	    
		{
		    "element": "simple-notes"
		}
	    ]
	}
    ]
};

local accts = {
    metadata: import "test/metadata-acc.jsonnet",
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

