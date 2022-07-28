{
    element(c):: {
	with_id(id):: self + { id: id },
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
			    "Company information",
			    "expand:For the year ended ~[period-end]"
			),
			{
                            "tag": "table",
                            "attributes": {
				"class": "company-info"
                            },
                            "content": [
				{
                                    "tag": "tr",
                                    "content": [
					{
                                            "tag": "td",
                                            "attributes": {
						"class": "tag"
                                            },
                                            "content": "Directors"
					},
					{
                                            "tag": "td",
                                            "content": [
						{
                                                    "ifdef": "metadata.business.directors.0",
                                                    "content": {
							"tag": "div",
							"content": [
                                                            "expand:~[officer1]",
                                                            {
								"tag": "br"
                                                            }
							]
                                                    }
						},
						{
                                                    "ifdef": "metadata.business.directors.1",
                                                    "content": {
							"tag": "div",
							"content": [
                                                            "expand:~[officer2]",
                                                            {
								"tag": "br"
                                                            }
							]
                                                    }
						},
						{
                                                    "ifdef": "metadata.business.directors.2",
                                                    "content": {
							"tag": "div",
							"content": [
                                                            "expand:~[officer3]",
                                                            {
								"tag": "br"
                                                            }
							]
                                                    }
						},
						{
                                                    "ifdef": "metadata.business.directors.3",
                                                    "content": {
							"tag": "div",
							"content": [
                                                            "expand:~[officer4]",
                                                            {
								"tag": "br"
                                                            }
							]
                                                    }
						},
						{
                                                    "ifdef": "metadata.business.directors.4",
                                                    "content": {
							"tag": "div",
							"content": [
                                                            "expand:~[officer5]",
                                                            {
								"tag": "br"
                                                            }
							]
                                                    }
						},
						{
                                                    "ifdef": "metadata.business.directors.5",
                                                    "content": {
							"tag": "div",
							"content": [
                                                            "expand:~[officer6]",
                                                            {
								"tag": "br"
                                                            }
							]
                                                    }
						}
                                            ]
					}
                                    ]
				},
				{
                                    "tag": "tr",
                                    "content": [
					{
                                            "tag": "td",
                                            "attributes": {
						"class": "tag"
                                            },
                                            "content": "Company number"
					},
					{
                                            "tag": "td",
                                            "content": "expand: ~[company-number], registered in ~[jurisdiction]"
					}
                                    ]
				},
				{
                                    "tag": "tr",
                                    "content": [
					{
                                            "tag": "td",
                                            "attributes": {
						"class": "tag"
                                            },
                                            "content": "Registered office"
					},
					{
                                            "tag": "td",
                                            "content": [
						{
                                                    "ifdef": "metadata.business.contact.address.0",
                                                    "content": {
							"tag": "div",
							"content": [
                                                            "expand:~[contact-address1::, ]",
                                                            {
								"tag": "br"
                                                            }
							]
                                                    }
						},
						{
                                                    "ifdef": "metadata.business.contact.address.1",
                                                    "content": {
							"tag": "div",
							"content": [
                                                            "expand:~[contact-address2::, ]",
                                                            {
								"tag": "br"
                                                            }
							]
                                                    }
						},
						{
                                                    "ifdef": "metadata.business.contact.address.2",
                                                    "content": {
							"tag": "div",
							"content": [
                                                            "expand:~[contact-address3::, ]",
                                                            {
								"tag": "br"
                                                            }
							]
                                                    }
						},
						"expand:~[contact-location::, ] ~[contact-postcode]"
                                            ]
					}
                                    ]
				},
				{
                                    "ifdef": "metadata.accountant.name",
                                    "content": {
					"tag": "tr",
					"content": [
                                            {
						"tag": "td",
						"attributes": {
                                                    "class": "tag"
						},
						"content": "Accountant"
                                            },
                                            {
						"tag": "td",
						"content": [
                                                    "expand:~[accountant-name]",
                                                    {
							"tag": "br"
                                                    },
                                                    "expand:~[accountant-business]",
                                                    {
							"tag": "br"
                                                    },
                                                    "expand:~[accountant-address]"
						]
                                            }
					]
                                    }
				},
				{
                                    "ifdef": "metadata.auditor.name",
                                    "content": {
					"tag": "tr",
					"content": [
                                            {
						"tag": "td",
						"attributes": {
                                                    "class": "tag"
						},
						"content": "Auditor"
                                            },
                                            {
						"tag": "td",
						"content": [
                                                    "expand:~[auditor-name]",
                                                    {
							"tag": "br"
                                                    },
                                                    "expand:~[auditor-business]",
                                                    {
							"tag": "br"
                                                    },
                                                    "expand:~[auditor-address]"
						]
                                            }
					]
                                    }
				}
                            ]
			}
                    ]
		}
            }
	]
    }
}
