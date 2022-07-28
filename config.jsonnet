
local l = import "lib/frs102.libsonnet";

local elts = {
    "element": "frs102",
    "accounting_standards": "micro-entities",
    "accounts_status": "audit-exempt-no-accountants-report",
    "accounts_type": "abridged-accounts",
    "title": "Unaudited Micro-entity Accounts",
    accounts_file: "example2.gnucash",
    accounts_kind: "piecash",
    elements: [
	{
	    element: "composite",
	    id: "report",
	    elements: [
		{
		    element: "title-page",
		    logo: "logo"
		},
		{
		    element: "company-info"
		},	    
		{	    
		    element: "balance-sheet-unaudited-micro",
		    signature: "signature"
		},
		{
		    element: "simple-notes"
		}
	    ]
	}
    ]
};

local accts = {
    metadata: import "metadata.jsonnet",
    accounts:: l.element(elts, self).with_metadata(self.metadata),
    resource(res):: {
        logo: import "detail/logo.jsonnet",
	signature: import "detail/signature.jsonnet"
    }[res]
};

accts.accounts

