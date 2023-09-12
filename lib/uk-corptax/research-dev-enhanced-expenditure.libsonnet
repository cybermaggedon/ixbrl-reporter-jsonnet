{
    element(c):: {
	"kind": "page",
	"elements": [
	    {
		"kind": "facttable",
		"title": "R&D / Creative enhanced expenditure",
		"facts": [
		    {
			"id": "rnd-enhanced-sme",
			"description": "Small or medium-sized enterprise",
			"field": "650",
			"context": "report-period",
			"kind": "bool",
			"value": true
		    },
		    {
			"id": "rnd-enhanced-large",
			"description": "Large company",
			"field": "655",
			"context": "report-period",
			"kind": "bool",
			"value": false
		    },
		    {
			"id": "rnd-claim-notification",
			"description": "Claim notification submitted",
			"field": "656",
			"context": "report-period",
			"kind": "config-bool",
			"key": "metadata.tax.rnd-claim-notification-submitted"
		    },
		    {
			"id": "rnd-additional-information",
			"description": "Additional information form submitted",
			"field": "657",
			"context": "report-period",
			"kind": "config-bool",
			"key": "metadata.tax.rnd-additional-notification-submitted"
		    },
		    {
			"id": "rnd-enhanced-expenditure",
			"kind": "computation",
			"description": "R&D expenditure qualifying for relief",
			"field": "659",
			"context": "trade-period",
			"computation": "rnd-qualifying-expenditure",
			"period-config": "metadata.tax.period"
		    },
		    {
			"id": "rnd-enhanced-expenditure",
			"kind": "computation",
			"description": "R&D enhanced expenditure",
			"field": "660",
			"context": "trade-period",
			"computation": "rnd-enhanced-expenditure",
			"period-config": "metadata.tax.period"
		    },
		    {
			"id": "creative-enhanced-expenditure",
			"kind": "money",
			"description": "Creative enhanced expenditure",
			"field": "665",
			"context": "trade-period",
			"value": 0,
			"period-config": "metadata.tax.period"
		    },
		    {
			"id": "rnd-creative-enhanced-expenditure",
			"kind": "computation",
			"description": "R&D / Creative enhanced expenditure",
			"field": "670",
			"context": "report-period",
			"computation": "rnd-creative-enhanced-expenditure",
			"period-config": "metadata.tax.period"
		    },
		    {
			"id": "rnd-enhanced-expenditure-subcontracted",
			"kind": "money",
			"description": "R&D subcontracted by a large company",
			"field": "675",
			"context": "report-period",
			"value": 0,
			"period-config": "metadata.tax.period"
		    }
		]
	    }
	]
    }
}
