
local l = import "lib/uk-corptax.libsonnet";

local elts = {
    "element": "corptax",
    "title": "Corporation Tax Statement",
    "accounts_file": "example2.gnucash",
    "accounts_kind": "piecash",
    "elements": [
	{
	    "element": "composite",
	    "id": "report",
	    "elements": [
		{
		    "element": "front-page"
		},
		{
		    "element": "capital-allowances"
		},
		{
		    "element": "profits"
		},
		{
		    "element": "tax-chargeable"
		},
		{
		    "element": "research-dev-enhanced-expenditure"
		},
		{
		    "element": "research-dev"
		},
		{
		    "element": "tax-calculation"
		},
		{
		    "element": "detailed-profit-and-loss"
		}
	    ]
	}
    ]
};

local accts = {
    metadata: import "test/metadata-ct.jsonnet",
    accounts:: l.from_element_def(elts, self).with_metadata(self.metadata)
};

accts.accounts

