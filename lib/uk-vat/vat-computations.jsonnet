{
    computations(c)::
    local mappings = c.resource("mappings");
    [
        {
	    "id": "vat-output-sales",
	    "kind": "sum",
	    "inputs": [
		{
		    "kind": "line",
		    "accounts": [acct.account],
		    "period": "in-year",
		    "reverse-sign": acct.reversed,
		}
		for acct in mappings["vat-output-sales"]
	    ],
	    "period": "in-year"
	},
        {
	    "id": "vat-output-acquisitions",
	    "kind": "sum",
	    "inputs": [
		{
		    "kind": "line",
		    "accounts": [acct.account],
		    "period": "in-year",
		    "reverse-sign": acct.reversed,
		}
		for acct in mappings["vat-output-acquisitions"]
	    ],
	    "period": "in-year"
	},
	{
	    "id": "vat-output",
	    "kind": "sum",
	    "inputs": [
		"vat-output-sales", "vat-output-acquisitions"
	    ],
	    "period": "in-year"
	},
	{
	    "id": "vat-input",
	    "kind": "sum",
	    "inputs": [
		{
		    "kind": "line",
		    "description": "VAT 4",
		    "accounts": [acct.account],
		    "period": "in-year",
		    "reverse-sign": acct.reversed,
		}
		for acct in mappings["vat-input"]
	    ],
	    "period": "in-year"
	},
	{
	    "id": "vat-due",
	    "kind": "sum",
	    "inputs": [
		"vat-output", "vat-input"
	    ],
	    "period": "in-year"
	},

	{
	    "id": "total-vatex-sales",
	    "kind": "sum",
	    "inputs": [
		{
		    "kind": "line",
		    "description": "VAT 6",
		    "accounts": [acct.account],
		    "period": "in-year",
		    "reverse-sign": acct.reversed,
		}
		for acct in mappings["total-vatex-sales"]
	    ],
	    "period": "in-year"
	},
	{
	    "id": "total-vatex-purchases",
	    "kind": "round",
	    "direction": "down",
	    "description": "VAT 7: Purchases ex. VAT",
	    "input": {
		"kind": "factor",
		"factor": -1,
		"input": {
		    "kind": "sum",
		    "inputs": [
			{
			    "kind": "line",
			    "description": "VAT 7",
			    "accounts": [acct.account],
			    "period": "in-year",
			    "reverse-sign": acct.reversed,
			}
			for acct in mappings["total-vatex-purchases"]
		    ],
		    "period": "in-year"
		},
		"period": "in-year"
	    },
	    "period": "in-year"
	},
	{
	    "id": "total-vatex-goods-supplied",
	    "kind": "round",
	    "direction": "down",
	    "description": "VAT 8: Goods supplied ex. VAT",
	    "input": {
		"kind": "factor",
		"factor": 1,
		"input": {
		    "kind": "sum",
		    "inputs": [
			{
			    "kind": "line",
			    "description": "VAT 8",
			    "accounts": [acct.account],
			    "period": "in-year",
			    "reverse-sign": acct.reversed,
			}
			for acct in mappings["total-vatex-goods-supplied"]
		    ],
		    "period": "in-year"
		},
		"period": "in-year"
	    },
	    "period": "in-year"
	},
	{
	    "id": "total-vatex-acquisitions",
	    "kind": "round",
	    "direction": "down",
	    "description": "VAT 9: Total acquisitions ex. VAT",
	    "input": {
		"kind": "sum",
		"inputs": [
		    {
			"kind": "line",
			"description": "VAT 9",
			"accounts": [acct.account],
			"period": "in-year",
			"reverse-sign": acct.reversed,
		    }
		    for acct in mappings["total-vatex-acquisitions"]
		]
	    },
	    "period": "in-year"
	},

	{
	    "id": "vat1",
	    "kind": "factor",
	    "description": "VAT 1: VAT due on sales",
	    "factor": -1,
	    "input": "vat-output-sales",
	    "period": "in-year"
	},
	{
	    "id": "vat2",
	    "kind": "factor",
	    "description": "VAT 2: VAT due on acquisitions",
	    "factor": -1,
	    "input": "vat-output-acquisitions",
	    "period": "in-year"
	},
	{
	    "id": "vat3",
	    "kind": "factor",
	    "factor": -1,
	    "description": "VAT 3: Total VAT due",
	    "input": "vat-output",
	    "period": "in-year"
	},
	{
	    "id": "vat4",
	    "kind": "factor",
	    "factor": 1,
	    "description": "VAT 4: VAT reclaimed",
	    "input": "vat-input",
	    "period": "in-year"
	},
	{
	    "id": "vat5",
	    "kind": "abs",
	    "description": "VAT 5: VAT due",
	    "input": "vat-due",
	    "period": "in-year"
	},
	{
	    "id": "vat6",
	    "kind": "round",
	    "direction": "down",
	    "description": "VAT 6: Sales before VAT",
	    "input": "total-vatex-sales",
	    "period": "in-year"
	},
	{
	    "id": "vat7",
	    "kind": "round",
	    "direction": "down",
	    "description": "VAT 7: Purchases ex. VAT",
	    "input": "total-vatex-purchases",
	    "period": "in-year"
	},
	{
	    "id": "vat8",
	    "kind": "round",
	    "direction": "down",
	    "description": "VAT 8: Goods supplied ex. VAT",
	    "input": "total-vatex-goods-supplied",
	    "period": "in-year"
	},
	{
	    "id": "vat9",
	    "kind": "round",
	    "description": "VAT 9: Total acquisitions ex. VAT",
	    "direction": "down",
	    "input": {
		"kind": "factor",
		"factor": -1,
		"input": "total-vatex-acquisitions",
		"period": "in-year"
	    },
	    "period": "in-year"
	}
    ]
}
