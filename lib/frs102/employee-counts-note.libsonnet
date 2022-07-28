{
    element(c):: {
	kind: "html",
	root: {
            "tag": "div",
            "content": [
		{
                    "element": {
			"kind": "noteheading",
			"title": "Employees",
			"level": 1
                    }
		},
		{
                    "tag": "p",
                    "content": "The average monthly number of persons employed by the company (including directors) during the period was as follows:"
		},
		{
                    "tag": "table",
                    "attributes": {
			"class": "sheet table"
                    },
                    "content": [
			{
                            "tag": "tr",
                            "content": [
				{
                                    "tag": "td",
                                    "attributes": {
					"class": "label"
                                    },
                                    "content": ""
				},
				{
                                    "tag": "td",
                                    "attributes": {
					"class": "column header"
                                    },
                                    "content": "expand:~[metadata.accounting.periods.0.name]"
				},
				{
                                    "ifdef": "metadata.business.average-employees.1",
                                    "content": {
					"tag": "td",
					"attributes": {
                                            "class": "column header"
					},
					"content": "expand:~[metadata.accounting.periods.1.name]"
                                    }
				}
                            ]
			},
			{
                            "tag": "tr",
                            "content": [
				{
                                    "tag": "td",
                                    "attributes": {
					"class": "label heading"
                                    },
                                    "content": "Employees"
				},
				{
                                    "tag": "td",
                                    "attributes": {
					"class": "data value"
                                    },
                                    "content": "expand:~[average-employees-this]"
				},
				{
                                    "ifdef": "metadata.business.average-employees.1",
                                    "content": {
					"tag": "td",
					"attributes": {
                                            "class": "data value"
					},
					"content": "expand:~[average-employees-previous]"
                                    }
				}
                            ]
			}
                    ]
		}
            ]
	}
    }
}
