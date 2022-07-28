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
			    "content": "Les \u00e9tats financiers"
			},
			{
			    "tag": "div",
			    "attributes": {
				"class": "subtitle"
			    },
			    "content": "expand:Pour la p\u00e9riode se terminant le ~[date-of-end-of-reporting-period]"
			}
		    ]
		}
	    }
	]
    }
}


