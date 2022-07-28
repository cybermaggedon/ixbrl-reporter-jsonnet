{

    approval(c, sig)::
        local obj = import "approval.libsonnet";
        obj.element(c, sig),

    element(c):: {

	local elt = self,

	with_id(id):: self + { id: id },
        with_signature(e):: self + { signature: c.resource(e) },

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
				    "content": "Statement of financial position"
                                },
                                {
				    "tag": "div",
				    "content": "expand:As at ~[balance-sheet-date]"
                                },
                                {
				    "tag": "hr"
                                }
			    ]
                        },
                        {
			    "worksheet": "balance-sheet"
                        },
                        {
			    "element": $["balance-sheet-notes-audited-small"]
                        },
                        {
			    "element": $.approval(c, elt.signature)
                        }
		    ]
                }
	    }
        ]
    },

    "balance-sheet-notes-audited-small":: {
        "kind": "notes",
        "numbered": false,
        "notes": [
	    "template:small-company-provisions",
	    "template:small-company-audit-exempt",
	    "template:directors-acknowledge",
	    "template:no-audit-required"
        ]
    }

}

