{
    companyinfonote(c)::
	local obj = import "company-info-note.libsonnet";
	obj.element(c),
    employeecountsnote(c)::
        local obj = import "employee-counts-note.libsonnet";
	obj.element(c),
    element(c)::
    {

	with_id(id):: self + { id: id },

	kind: "page",

	elements: [
            {
		"kind": "html",
		"root": {
                    "tag": "div",
                    "content": [
		    	local obj = import "header.libsonnet";
			obj.element(
			    c,
			    "Notes to the accounts",
			    "expand:For the year ended ~[period-end]"
			),
			{
                            "element": $.companyinfonote(c)
			},
			{
                            "element": $.employeecountsnote(c)
			}
                    ]
		}
            }
	]
    }
}
