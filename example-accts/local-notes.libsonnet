
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

	// Content
	elements: [
            {

		// HTML element
		"kind": "html",
		"root": {

		    // Contains a div
                    "tag": "div",
                    "content": [

			// Standard page header
		    	local obj = import "lib/frs102/header.libsonnet";
			obj.element(

			    c,

			    // This is the heading
			    "Notes to the accounts",
			    "expand:For the year ended ~[period-end]"

			),
			{

			    // Add the company info note
                            "element": $.companyinfonote(c)

			},
			{

			    // Add the employee counts note
                            "element": $.employeecountsnote(c)

			},
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
                    ]
		}
            }
	]
    }
}
