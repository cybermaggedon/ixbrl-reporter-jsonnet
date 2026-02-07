
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

        local table = function(content) {
            "tag": "table",
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

			{

			    // A div
			    "tag": "h2",
			    "content": "Hello world"
                        },

                        {
                            "tag": "table",
                            "attributes": {
                                "style": "border: 1px solid black",
                            },
                            "content": [
                                {
                                    "tag": "tr",
                                    "content": [
                                        {
                                            "tag": "td",
                                            "attributes": {
                                                "style": "border: 1px solid black",
                                            },
                                            "content": "Key 1",
                                        },
                                        {
                                            "tag": "td",
                                            "attributes": {
                                                "style": "border: 1px solid black",
                                            },
                                            "content": "Value 1",
                                        },
                                    ],
                                },
                                {
                                    "tag": "tr",
                                    "content": [
                                        {
                                            "tag": "td",
                                            "attributes": {
                                                "style": "border: 1px solid black",
                                            },
                                            "content": "Key 2",
                                        },
                                        {
                                            "tag": "td",
                                            "attributes": {
                                                "style": "border: 1px solid black",
                                            },
                                            "content": "Value 2",
                                        },
                                        {
                                            "tag": "td",
                                            "attributes": {
                                                "style": "border: 1px solid black",
                                            },
                                            "content": "expand:~(gross-profit-raw)",
                                        },
                                    ],
                                }
                            ],
                        },

/*
			// Standard page header
		    	local obj = import "lib/frs102/header.libsonnet";
			obj.element(

			    c,

			    // This is the heading
			    "Notes to the accounts",
			    "expand:~[gross-profit]"

			),
*/
/*
			{

			    // A div
			    "tag": "div",
			    "content": [

				// Heading for this notes
				{
				    "element": {
					"kind": "noteheading",
					"title": "Champagne",
					"level": 1
				    }
				},

				// Note body
				{

				    // A paragraph.  The paragraph
				    // text contains an expansion which
				    // puts the value for the entertainment
				    // computation into the text.
				    "tag": "p",
				    "content": "expand:The company spend on" +
				    "champagne this year was " +
				    "£ ~(entertainment)."

				}
			    ]
			}
*/
                    ]
		}
            }
	]
    }
}

