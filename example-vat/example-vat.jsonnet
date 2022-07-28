
local l = import "lib/uk-vat.libsonnet";

local elts = {
    "element": "vat",
    accounts_file: "example2.gnucash",
    accounts_kind: "piecash",
    elements: [
	{
	    element: "composite",
	    id: "report",
	    elements: [
		{
		    element: "vat-report"
		}
	    ]
	}
    ]
};

local accts = {

    metadata: import "example-vat/metadata.jsonnet",

    accounts:: l.from_element_def(elts, self).with_metadata(self.metadata),
    resource(res):: {
	mappings: {
            "vat-output-sales": [
		"VAT:Output:Sales"
	    ],
	    "vat-output-acquisitions": [
		"VAT:Output:EU"
	    ],
	    "vat-input": [
		"VAT:Input"
	    ],
	    "total-vatex-sales": [
		"Assets:Capital Equipment:EU Reverse VAT Purchase",
		"Income"
	    ],
	    "total-vatex-purchases": [
		"Assets:Capital Equipment",
		"Expenses:VAT Purchases",
		"Expenses:VAT Purchases:EU Reverse VAT"
	    ],
	    "total-vatex-goods-supplied": [
		"Income:Sales:EU:Goods"
	    ],
	    "total-vatex-acquisitions": [
		"Expenses:VAT Purchases:EU Reverse VAT"
	    ]
	}
    }[res],

};

accts.accounts

