{
    element(c):: {

	with_id(id):: self + { id: id },

	"id": "cash-flows",
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
                                    "content": "Statement of Cash Flows"
                                },
                                {
                                    "tag": "div",
                                    "content": "expand:For the year ended ~[period-end]"
                                },
                                {
                                    "tag": "hr"
                                }
                            ]
                        }
                    ]
                }
            },
            {
                "kind": "worksheet",
                "worksheet": "cash-flows"
            }
        ]
    }

}


