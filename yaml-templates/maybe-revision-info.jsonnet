{
    element(c):: {
	with_id(id):: self + { id: id },
	"kind": "html",
	"root": {
	    "tag": "div",
	    "content": {
		"ifdef": "metadata.accounting.is-revised",
		"content": {
		    "kind": "element",
		    "element": {
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
						    "content": "expand:~[company-name]"
						},
						{
						    "tag": "div",
						    "content": "Revision of the financial statements"
						},
						{
						    "tag": "div",
						    "attributes": {
							"class": "subtitle"
						    },
						    "content": "expand:For the year ended ~[period-end]"
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
				"root": c.resource("revision-info")
			    }
			]
		    }
		}
	    }
	}
    }
}


