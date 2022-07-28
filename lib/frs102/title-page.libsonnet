{
    element(c):: {
	local elt = self,
	logo:: "",

	with_id(id):: self + { id: id },
	with_logo(x):: self + { logo:: c.resource(x) },

	"kind": "page",
	"elements": [
	    {
		"kind": "html",
		"root": {
		    "tag": "div",
		    "attributes": {
			"class": "titlepage"
		    },
		    "content": [
			{
			    "tag": "div",
			    "attributes": {
				"class": "company-number"
			    },
			    "content": "expand: Company registration no. ~[company-number] (~[jurisdiction])"
			},
			{
			    "tag": "img",
			    "attributes": {
				"src": elt.logo,
				"alt": "Company logo"
			    }
			},
			{
			    "tag": "div",
			    "attributes": {
				"class": "company-name"
			    },
			    "content": "expand:~[company-name]"
			},
			{
			    "tag": "div",
			    "attributes": {
				"class": "title"
			    },
			    "content": "expand:~[report-title]"
			},
			{
			    "tag": "div",
			    "attributes": {
				"class": "subtitle"
			    },
			    "content": "expand:For the year ended ~[period-end]"
			}
		    ]
		}
	    }
	]
    }
}
