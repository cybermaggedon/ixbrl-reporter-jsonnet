{
    element(c):: {

	local elt = self,
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
				    "content": "expand:~[company-name]"
                                },
                                {
				    "tag": "div",
				    "content": "VAT statement"
                                },
                                {
				    "tag": "div",
				    "content": "expand:For the period ~[period-start] to ~[period-end]"
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
                "worksheet": "vat"
	    }
        ]
    }

}

