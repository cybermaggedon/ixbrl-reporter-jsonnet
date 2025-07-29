
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
		    "element": "simple-notes"
		}
	    ]
	}
    ]
};

local accts = {

    metadata:: import "test-examples/metadata.jsonnet",

    accounts:: l.from_element_def(elts, self).with_metadata(self.metadata),

/*

    local accts = self,

    accounts::
        l.frs102(accts)
            .with_accounting_standards("micro-entities")
            .with_accounts_status("audit-exempt-no-accountants-report")
            .with_accounts_type("abridged-accounts")
            .with_title("Unaudited Micro-Entity Accounts")
            .with_accounts_kind("piecash")
            .with_accounts_file("example2.gnucash")
            .with_metadata(accts.metadata)
            .with_elements([
	        l.composite(accts)
                    .with_id("report")
		    .with_elements([
		        l["title-page"](accts)
			    .with_logo("logo"),
		        l["company-info"](accts),
		        l["balance-sheet-unaudited-micro"](accts)
			    .with_signature("signature"),
		        l["simple-notes"](accts)
		    ])
	    ]),
*/

    resource(x):: {
	"logo": import "detail/logo.jsonnet",
	"signature": import "detail/signature.jsonnet"
    }[x]
};

accts.accounts

