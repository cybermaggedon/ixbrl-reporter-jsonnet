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
			local obj = import "header.libsonnet";
			obj.element(
			    c,
			    "Statement of financial position",
			    "expand:As at ~[balance-sheet-date]"
			),
			{
                            "worksheet": "balance-sheet"
			},
			{
                            "element": {
				"id": "balance-sheet-notes",
				"kind": "html",
				"root": {
				    "tag": "div",
				    "content": [
					{
					    "tag": "p",
					    "content": [
						"template:micro-entity-provisions"
					    ]
					},
					{
					    "tag": "p",
					    "content": [
						"template:small-company-audit-exempt"
					    ]
					},
					{
					    "tag": "p",
					    "content": [
						"template:no-audit-required"
					    ]
					},
					{
					    "tag": "p",
					    "content": [
						"template:directors-acknowledge"
					    ]
					}
				    ]
				}
			    }
			},
			{
			    element: $.approval(c, elt.signature)
			}
                    ]
		}
            }
	]
    }

}
