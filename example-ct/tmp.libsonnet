
// A customised notes page.
{

    // Re-use the standard company info note
    companyinfonote(c)::
	local obj = import "lib/frs102/company-info-note.libsonnet";
	obj.element(c),

    // Re-use the standard employee counts note
    employeecountsnote(c)::
        local obj = import "lib/frs102/employee-counts-note.libsonnet";
	obj.element(c),

    // local-notes defines an element
    element(c)::
    {

	// Every element has this
	with_id(id):: self + { id: id },

	// The element is a 'page'.
	kind: "page",

        local title = function(title) {
            "tag": "h2",
            "content": title,
        },

        local table = function(content) {
            "tag": "table",
            "attributes": {
                "style":
                    "border: 3px groove black; " +
                    ""
//                    "border-collapse: collapse; "
            },
            "content": content,
        },

        local row = function(content) {
            "tag": "tr",
            "content": content,
        },

        local cell = function(content) {
            "tag": "td",
            "attributes": {
                "style":
                    "border: 3px inset black; " +
                    "padding: 0.5rem; "
            },
            "content": content,
        },

        local cell_right = function(content) {
            "tag": "td",
            "attributes": {
                "style":
                    "border: 3px inset black; " +
                    "text-align: right; " +
                    "padding: 0.5rem; "
            },
            "content": content,
        },

	// Content
	elements: [
            {

		// HTML element
		"kind": "html",
		"root": {

		    // Contains a div
                    "tag": "div",
                    "content": [

			title("Hello world"),
                        table([
                            row([
                                cell(""),
                                cell_right("£"),
                            ]),
                            row([
                                cell("Profit (loss) per statutory accounts"),
                                cell("expand:~(profit-loss-per-accounts)"),
                            ]),
                        ],)
                        
                    ]
		}
            }
	]
    }
}

