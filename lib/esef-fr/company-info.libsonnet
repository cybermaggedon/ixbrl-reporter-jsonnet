
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
			{
			    "tag": "div",
			    "attributes": {
				"class": "header"
			    },
			    "content": [
				{
				    "tag": "div",
				    "content": "expand:~[name-of-reporting-entity]"
				},
				{
				    "tag": "div",
				    "content": "Informations sur la soci\u00e9t\u00e9"
				},
				{
				    "tag": "div",
                                    "content": "expand:Pour la p\u00e9riode se terminant le ~[date-of-end-of-reporting-period]"
				    
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
		"kind": "html",
		"root": {
		    "tag": "div",
		    "content": [
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
					    "content": "Nom de l'entit\u00e9 d\u00e9clarante"
					},
					{
					    "tag": "td",
					    "content": "expand:~[name-of-reporting-entity]"
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
					    "content": "Domicile de l'entreprise"
					},
					{
					    "tag": "td",
					    "content": "expand:~[domicile-of-entity]"
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
					    "content": "Forme juridique de l'entit\u00e9"
					},
					{
					    "tag": "td",
					    "content": "expand:~[legal-form-of-entity]"
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
					    "content": "Pays d'incorporation"
					},
					{
					    "tag": "td",
					    "content": "expand:~[country-of-incorporation]"
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
					    "content": "Adresse du si\u00e8ge social de l'entit\u00e9"
					},
					{
					    "tag": "td",
					    "content": "expand:~[address-of-entitys-registered-office]"
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
					    "content": "Principal lieu d'activit\u00e9"
					},
					{
					    "tag": "td",
					    "content": "expand:~[principal-place-of-business]"
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
					    "content": "Nature des principales activit\u00e9s de l'entit\u00e9"
					},
					{
					    "tag": "td",
					    "content": "expand:~[nature-of-entitys-principal-activities]"
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
					    "content": "Date de fin de la p\u00e9riode de r\u00e9f\u00e9rence"
					},
					{
					    "tag": "td",
					    "content": "expand:~[date-of-end-of-reporting-period]"
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
					    "content": "P\u00e9riode couverte par les \u00e9tats financiers"
					},
					{
					    "tag": "td",
					    "content": "expand:Pour la p\u00e9riode ~{period-covered-by-financial-statements= ~[period-start] au ~[period-end]}"
					}
				    ]
				}
			    ]
			}
		    ]
		}
	    }

	]

    }

}


