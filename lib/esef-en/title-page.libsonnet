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
			    "content": "expand: ~[name-of-reporting-entity] (~[country-of-incorporation])"
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
			    "content": "expand:~[name-of-reporting-entity]"
			},
			{
			    "tag": "div",
			    "attributes": {
				"class": "title"
			    },
			    "content": "Financial Statements"
			},
			{
			    "tag": "div",
			    "attributes": {
				"class": "subtitle"
			    },
			    "content": "expand:For the period ended ~[date-of-end-of-reporting-period]"
			}
		    ]
		}
	    }
	]
    }
}


