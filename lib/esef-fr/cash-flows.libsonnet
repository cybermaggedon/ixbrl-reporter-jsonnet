{
    element(c):: {
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
				    "content": "\u00c9tat des flux de tr\u00e9sorerie"
				},
				{
				    "tag": "div",
                                    "content": "expand:Pour la p\u00e9riode se terminant le ~[date-of-end-of-reporting-period]"
				    
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
		"kind": "worksheet",
		"worksheet": "cash-flows"
	    }
	]
    }
}


