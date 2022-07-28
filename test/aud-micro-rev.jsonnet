
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
  		    "element": "revision-info"
		},	    
		{
		    "element": "simple-notes"
		}
	    ]
	}
    ]
};

local accts = {
    metadata: import "test/metadata-aud-rev.jsonnet",
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

