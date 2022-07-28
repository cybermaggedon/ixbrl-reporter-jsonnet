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
				    "content": "Statement of Consent"
                                },
                                {
				    "tag": "div",
				    "content": "expand:For the year ended ~[period-end]"
                                },
                                {
				    "tag": "hr"
                                }
			    ]
                        },
                        {
			    "tag": "div",
			    "content": [
                                {
				    "tag": "h3",
				    "content": "Statement of consent to prepare Abridged Financial Statements"
                                },
                                {
				    "tag": "p",
				    "content": "template:members-agreed-abridged-accounts"
                                }
			    ]
                        }
		    ]
                }
	    }
        ]
    }

}


