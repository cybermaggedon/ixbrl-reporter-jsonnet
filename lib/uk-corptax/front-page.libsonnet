{
    element(c):: {
	"kind": "page",
	"elements": [
	    {
		"kind": "facttable",
		"title": "Corporation Tax Return",
		"facts": [
		    {
			"id": "company-name",
			"kind": "config",
			"description": "Company name",
			"field": "1",
			"context": "report-date",
			"key": "metadata.business.company-name"
		    },
		    {
			"context": "report-date",
			"description": "Tax reference",
			"field": "3",
			"id": "tax-reference",
			"key": "metadata.tax.utr",
			"kind": "config"
		    },
		    {
			"context": "report-date",
			"description": "Return period start",
			"field": "30",
			"id": "return-period-start",
			"key": "metadata.tax.period.start",
			"kind": "config-date"
		    },
		    {
			"context": "report-date",
			"description": "Return period end",
			"field": "35",
			"id": "return-period-end",
			"key": "metadata.tax.period.end",
			"kind": "config-date"
		    },
		    {
			"context": "report-date",
			"description": "Start of accounts period",
			"field": "-",
			"id": "account-period-start",
			"key": "metadata.tax.period.start",
			"kind": "config-date"
		    },
		    {
			"context": "report-date",
			"description": "End of accounts period",
			"field": "-",
			"id": "account-period-end",
			"key": "metadata.tax.period.end",
			"kind": "config-date"
		    },
		    {
			"context": "report-period",
			"description": "Company is a partner in a firm",
			"field": "-",
			"id": "partner-in-a-firm",
			"kind": "bool",
			"value": false
		    }
		]
	    }
	]
    }
}
