{
    element(c):: {
	"kind": "page",
	"elements": [
	    {
		"kind": "facttable",
		"title": "Tax chargeable",
		"facts": [
		    {
			"id": "financial-year1-covered-by-the-return",
			"context": "report-period",
			"description": "Financial year 1 covered by the return",
			"field": "330",
			"kind": "config",
			"key": "metadata.tax.fy1.year"
		    },
		    {
			"id": "financial-year2-covered-by-the-return",
			"context": "report-period",
			"description": "Financial year 2 covered by the return",
			"field": "380",
			"kind": "config",
			"key": "metadata.tax.fy2.year"
		    },
		    {
			"id": "fy1-amount-of-profit-chargeable-at-first-rate",
			"context": "report-period",
			"description": "FY1 profit chargeable at first rate",
			"field": "335",
			"computation": "ct-profit-before-tax-fy1",
			"kind": "computation",
			"period-config": "metadata.tax.period"
		    },
		    {
			"id": "fy2-amount-of-profit-chargeable-at-first-rate",
			"context": "report-period",
			"description": "FY2 profit chargeable at first rate",
			"field": "385",
			"computation": "ct-profit-before-tax-fy2",
			"kind": "computation",
			"period-config": "metadata.tax.period"
		    },
		    {
			"id": "fy1-first-rate-of-tax",
			"context": "report-period",
			"description": "FY1 first rate of tax (%)",
			"field": "340",
			"kind": "number",
			"value": 19
		    },
		    {
			"id": "fy2-first-rate-of-tax",
			"context": "report-period",
			"description": "FY2 first rate of tax (%)",
			"field": "390",
			"kind": "number",
			"value": 19
		    },
		    {
			"id": "fy1-tax-at-first-rate",
			"computation": "ct-tax-fy1",
			"context": "report-period",
			"description": "FY1 tax at first rate",
			"field": "345",
			"kind": "computation",
			"period-config": "metadata.tax.period"
		    },
		    {
			"id": "fy2-tax-at-first-rate",
			"computation": "ct-tax-fy2",
			"context": "report-period",
			"description": "FY2 tax at first rate",
			"field": "395",
			"kind": "computation",
			"period-config": "metadata.tax.period"
		    },
		    {
			"id": "corporation-tax-chargeable",
			"computation": "ct-tax-total",
			"context": "report-period",
			"description": "Corporation tax",
			"field": "430",
			"kind": "computation",
			"period-config": "metadata.tax.period"
		    },
		    {
			"context": "report-period",
			"description": "Marginal relief for ring fence trades",
			"field": "435",
			"id": "marginal-rate-relief-for-ring-fence-trades-payable",
			"kind": "money",
			"value": 0
		    },
		    {
			"computation": "corporation-tax-chargeable-payable",
			"context": "report-period",
			"description": "Corporation tax chargeable",
			"field": "440",
			"id": "corporation-tax-chargeable-payable",
			"kind": "computation",
			"period-config": "metadata.tax.period"
		    },
		    {
			"id": "total-reliefs-and-deductions-in-terms-of-tax-payable",
			"context": "report-period",
			"description": "Total reliefs and deduction in terms of tax",
			"field": "470",
			"kind": "money",
			"value": 0,
			"period-config": "metadata.tax.period"
		    },
		    {
			"id": "net-corporation-tax-payable",
			"kind": "computation",
			"context": "report-period",
			"computation": "net-corporation-tax-payable",
			"description": "Net Corporation Tax liability",
			"field": "475",
			"period-config": "metadata.tax.period"
		    },
		    {
			"id": "tax-chargeable",
			"kind": "computation",
			"context": "report-period",
			"computation": "tax-chargeable",
			"description": "Tax chargeable",
			"field": "510",
			"period-config": "metadata.tax.period"
		    },
		    {
			"id": "tax-payable",
			"kind": "computation",
			"context": "report-period",
			"computation": "tax-payable",
			"description": "Tax payable",
			"field": "525",
			"period-config": "metadata.tax.period"
		    }
		]
	    }
	]
    }
}

