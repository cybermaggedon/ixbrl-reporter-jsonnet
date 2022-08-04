{
    element(c):: {
	"kind": "page",
	"elements": [
	    {
		"kind": "facttable",
		"title": "Losses",
		"facts": [
		    {
			"id": "trading-losses-of-this-or-later-ap",
			"context": "report-period",
			"description": "Trading losses",
			"field": "275",
			"computation": "ct-trading-losses",
			"kind": "computation",
			"period-config": "metadata.tax.period"
		    },
		    {
			"context": "report-period",
			"description": "Loss amounts carried back",
			"field": "280",
			"id": "loss-amounts-carried-back",
			"kind": "bool",
			"value": false
		    },
		    {
			"id": "losses-of-trades-in-the-uk",
			"context": "report-period",
			"description": "Losses of trades in the UK",
			"field": "780",
			"computation": "ct-trading-losses",
			"kind": "computation",
			"period-config": "metadata.tax.period"
		    },
		    {
			"id": "losses-of-trades-outside-the-uk",
			"context": "report-period",
			"description": "Losses of trades outside the UK",
			"field": "790",
			"computation": "ct-trading-losses",
			"kind": "money",
			"value": 0
		    },
		    {
			"id": "uk-property-business-losses",
			"context": "report-period",
			"description": "UK property business losses",
			"field": "805",
			"value": 0,
			"kind": "money",
			"period-config": "metadata.tax.period"
		    },
		    {
			"id": "overseas-property-business-losses",
			"context": "report-period",
			"description": "Overseas property business losses",
			"field": "815",
			"value": 0,
			"kind": "money",
			"period-config": "metadata.tax.period"
		    },
		    {
			"id": "losses-from-miscellaneous-transactions",
			"context": "report-period",
			"description": "Losses from miscellaneous transactions",
			"field": "820",
			"value": 0,
			"kind": "money",
			"period-config": "metadata.tax.period"
		    },
		    {
			"id": "capital-losses",
			"context": "report-period",
			"description": "Capital losses",
			"field": "825",
			"value": 0,
			"kind": "money",
			"period-config": "metadata.tax.period"
		    },
		    {
			"id": "losses-on-intangible-fixed-assets",
			"context": "report-period",
			"description": "Losses on intangible fixed assets",
			"field": "830",
			"value": 0,
			"kind": "money",
			"period-config": "metadata.tax.period"
		    }
		]
	    }
	]
    }
}
