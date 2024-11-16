{
    element(c):: {
	"kind": "page",
	"elements": [
	    {
		"kind": "facttable",
		"title": "Profits and gains",
		"facts": [
		    {
			"id": "adjusted-trading-profit-of-this-period",
			"context": "report-period",
			"description": "Trading profits",
			"field": "155",
			"computation": "ct-trading-profits",
			"kind": "computation",
			"period-config": "metadata.tax.period"
		    },
		    {
			"id": "trading-losses-brought-forward",
			"description": "Trading losses brough forward",
			"field": "160, 285",
			"context": "report-period",
			"computation": "ct-trading-losses-brought-forward",
			"kind": "computation",
			"period-config": "metadata.tax.period"
		    },
		    {
			"id": "net-trading-profits",
			"computation": "ct-net-trading-profits",
			"context": "report-period",
			"description": "Net trading profits",
			"field": "165",
			"kind": "computation",
			"period-config": "metadata.tax.period"
		    },
		    {
			"context": "report-period",
			"description": "Net chargeable gains",
			"field": "220",
			"id": "net-chargeable-gains",
			"kind": "money",
			"value": 0,
			"period-config": "metadata.tax.period"
		    },
		    {
			"id": "profits-before-other-deductions-and-reliefs",
			"computation": "profits-before-other-deductions-and-reliefs",
			"context": "report-period",
			"description": "Profits before other deductions and reliefs",
			"field": "235",
			"kind": "computation",
			"period-config": "metadata.tax.period"
		    },
		    {
			"id": "profits-before-charges-and-group-relief",
			"kind": "computation",
			"computation": "profits-before-charges-and-group-relief",
			"context": "report-period",
			"description": "Profits before donations and group relief",
			"field": "300",
			"period-config": "metadata.tax.period"
		    },
		    {
			"id": "qualifying-donations",
			"context": "report-period",
			"description": "Qualifying donations",
			"field": "305",
			"kind": "money",
			"value": 0
		    },
		    {
			"context": "report-period",
			"description": "Group relief",
			"field": "310",
			"id": "group-relief-claimed",
			"kind": "money",
			"value": 0
		    },
		    {
			"context": "report-period",
			"description": "Group relief for carried forward losses",
			"field": "312",
			"id": "group-relief-claimed-for-carried-forward-losses",
			"kind": "money",
			"value": 0
		    },
		    {
			"computation": "total-profits-chargeable-to-corporation-tax",
			"context": "report-period",
			"description": "Profits chargeable to Corporation Tax",
			"field": "315",
			"id": "total-profits-chargeable-to-corporation-tax",
			"kind": "computation",
			"period-config": "metadata.tax.period"
		    }
		]
	    }
	]
    }
}
