
{
    element(c):: {

	with_id(id):: self + { id: id },

	"kind": "page",
	"elements": [
	    {
		"kind": "html",
		"root": {
		    "tag": "div",
		    "content": [
			{
			    "tag": "div",
			    "attributes": {
				"class": "header"
			    },
			    "content": [
				{
				    "tag": "div",
				    "content": "expand:~[name-of-reporting-entity]"
				},
				{
				    "tag": "div",
				    "content": "Company information"
				},
				{
				    "tag": "div",
				    "content": "expand:For the period ended ~[date-of-end-of-reporting-period]"
				},
				{
				    "tag": "hr"
				}
			    ]
			}
		    ]
		}
	    },
	    {
		"kind": "html",
		"root": {
		    "tag": "div",
		    "content": [
			{
			    "tag": "table",
			    "attributes": {
				"class": "company-info"
			    },
			    "content": [
				{
				    "tag": "tr",
				    "content": [
					{
					    "tag": "td",
					    "attributes": {
						"class": "tag"
					    },
					    "content": "Name of reporting entity"
					},
					{
					    "tag": "td",
					    "content": "expand:~[name-of-reporting-entity]"
					}
				    ]
				},
				{
				    "tag": "tr",
				    "content": [
					{
					    "tag": "td",
					    "attributes": {
						"class": "tag"
					    },
					    "content": "Domicile of entity"
					},
					{
					    "tag": "td",
					    "content": "expand:~[domicile-of-entity]"
					}
				    ]
				},
				{
				    "tag": "tr",
				    "content": [
					{
					    "tag": "td",
					    "attributes": {
						"class": "tag"
					    },
					    "content": "Legal form of entity"
					},
					{
					    "tag": "td",
					    "content": "expand:~[legal-form-of-entity]"
					}
				    ]
				},
				{
				    "tag": "tr",
				    "content": [
					{
					    "tag": "td",
					    "attributes": {
						"class": "tag"
					    },
					    "content": "Country of incorporation"
					},
					{
					    "tag": "td",
					    "content": "expand:~[country-of-incorporation]"
					}
				    ]
				},
				{
				    "tag": "tr",
				    "content": [
					{
					    "tag": "td",
					    "attributes": {
						"class": "tag"
					    },
					    "content": "Address of entity's registered office"
					},
					{
					    "tag": "td",
					    "content": "expand:~[address-of-entitys-registered-office]"
					}
				    ]
				},
				{
				    "tag": "tr",
				    "content": [
					{
					    "tag": "td",
					    "attributes": {
						"class": "tag"
					    },
					    "content": "Principal place of business"
					},
					{
					    "tag": "td",
					    "content": "expand:~[principal-place-of-business]"
					}
				    ]
				},
				{
				    "tag": "tr",
				    "content": [
					{
					    "tag": "td",
					    "attributes": {
						"class": "tag"
					    },
					    "content": "Nature of entity's principal activities"
					},
					{
					    "tag": "td",
					    "content": "expand:~[nature-of-entitys-principal-activities]"
					}
				    ]
				},
				{
				    "tag": "tr",
				    "content": [
					{
					    "tag": "td",
					    "attributes": {
						"class": "tag"
					    },
					    "content": "Date of end of reporting period"
					},
					{
					    "tag": "td",
					    "content": "expand:~[date-of-end-of-reporting-period]"
					}
				    ]
				},
				{
				    "tag": "tr",
				    "content": [
					{
					    "tag": "td",
					    "attributes": {
						"class": "tag"
					    },
					    "content": "Period covered by financial statements"
					},
					{
					    "tag": "td",
					    "content": "expand:For the period ~{period-covered-by-financial-statements= ~[period-start] to ~[period-end]}"
					}
				    ]
				}
			    ]
			}
		    ]
		}
	    }

	]

    }

}


