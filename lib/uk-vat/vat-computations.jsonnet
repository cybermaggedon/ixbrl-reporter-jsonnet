{
    computations(c)::
    local mappings = c.resource("mappings");
    [
	{
	    "id": "vat1",
	    "kind": "sum",
	    "description": "VAT 1: VAT due on sales",
	    "inputs": [
		{
		    "kind": "line",
		    "description": "VAT 1",
		    "accounts": mappings["vat-output-sales"],
		    "period": "in-year"
		}
	    ],
	    "period": "in-year"
	},
	{
	    "id": "vat2",
	    "kind": "sum",
	    "description": "VAT 2: VAT due on acquisitions",
	    "inputs": [
		{
		    "kind": "line",
		    "description": "VAT 2",
		    "accounts":  mappings["vat-output-acquisitions"],
		    "period": "in-year"
		}
	    ],
	    "period": "in-year"
	},
	{
	    "id": "vat3",
	    "kind": "sum",
	    "description": "VAT 3: Total VAT due",
	    "inputs": [
		"vat1", "vat2"
	    ],
	    "period": "in-year"
	},
	{
	    "id": "vat4",
	    "kind": "sum",
	    "description": "VAT 4: VAT reclaimed",
	    "inputs": [
		{
		    "kind": "line",
		    "description": "VAT 4",
		    "accounts": mappings["vat-input"],
		    "period": "in-year"
		}
	    ],
	    "period": "in-year"
	},
	{
	    "id": "vat5",
	    "kind": "abs",
	    "description": "VAT 5: VAT due",
	    "input": {
		"kind": "sum",
		"inputs": [
		    "vat3", "vat4"
		]
	    },
	    "period": "in-year"
	},
	{
	    "id": "vat6",
	    "kind": "round",
	    "direction": "down",
	    "description": "VAT 6: Sales before VAT",
	    "input": {
		"kind": "sum",
		"inputs": [
		    {
			"kind": "line",
			"description": "VAT 6",
			"accounts": mappings["total-vatex-sales"],
			"period": "in-year"
		    }
		]
	    },
	    "period": "in-year"
	},
	{
	    "id": "vat7",
	    "kind": "round",
	    "direction": "down",
	    "description": "VAT 7: Purchases ex. VAT",
	    "input": {
		"kind": "sum",
		"inputs": [
		    {
			"kind": "line",
			"description": "VAT 7",
			"accounts": mappings["total-vatex-purchases"],
			"period": "in-year"
		    }
		]
	    },
	    "period": "in-year"
	},
	{
	    "id": "vat8",
	    "kind": "round",
	    "direction": "down",
	    "description": "VAT 8: Goods supplied ex. VAT",
	    "input": {
		"kind": "sum",
		"inputs": [
		    {
			"kind": "line",
			"description": "VAT 8",
			"accounts": mappings["total-vatex-goods-supplied"],
			"period": "in-year"
		    }
		]
	    },
	    "period": "in-year"
	},
	{
	    "id": "vat9",
	    "kind": "round",
	    "direction": "down",
	    "description": "VAT 9: Total acquisitions ex. VAT",
	    "input": {
		"kind": "sum",
		"inputs": [
		    {
			"kind": "line",
			"description": "VAT 9",
			"accounts": mappings["total-vatex-acquisitions"],
			"period": "in-year"
		    }
		]
	    },
	    "period": "in-year"
	}
    ]
}