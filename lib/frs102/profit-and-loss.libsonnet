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
				    "content": "Income statement"
                                },
                                {
				    "tag": "div",
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
                "kind": "worksheet",
                "worksheet": "profit-and-loss"
	    }
        ]
    }

}


