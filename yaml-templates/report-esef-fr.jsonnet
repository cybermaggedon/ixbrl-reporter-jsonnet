
local l = import "lib/esef-fr.libsonnet";

local notes = {
    "id": "notes",
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
				"content": "Notes sur les comptes"
			    },
			    {
				"tag": "div",
				"content": "Pour la p\u00e9riode se terminant le ~[date-of-end-of-reporting-period]"
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
			"element": {
			    "kind": "noteheading",
			    "title": "Conformit\u00e9",
			    "level": 1
			}
		    },
		    {
			"tag": "p",
                                "content": "expand:~{statement-of-ifrs-compliance= Les \u00e9tats financiers consolid\u00e9s d'~[name-of-reporting-entity] ont \u00e9t\u00e9 pr\u00e9par\u00e9s conform\u00e9ment aux normes internationales d'information financi\u00e8re (IFRS) et aux interpr\u00e9tations publi\u00e9es par le Comit\u00e9 d'interpr\u00e9tation des IFRS (IFRS IC) applicables aux soci\u00e9t\u00e9s publiant des rapports selon les IFRS. Les \u00e9tats financiers sont conformes aux normes IFRS telles que publi\u00e9es par l'International Accounting Standards Board (IASB).}"
		    },
		    {
			"element": {
			    "kind": "noteheading",
			    "title": "Monnaie",
			    "level": 1
			}
		    },
		    {
			"tag": "p",
                                "content": "expand:~{description-of-presentation-currency= Ces \u00e9tats sont pr\u00e9sent\u00e9s dans la devise euro (EUR).}"
		    },
		    {
			"element": {
			    "kind": "noteheading",
			    "title": "Niveau d'arrondi",
			    "level": 1
			}
		    },
		    {
			"tag": "p",
                        "content": "expand:~{level-of-rounding= Les valeurs mon\u00e9taires sont pr\u00e9sent\u00e9es arrondies \u00e0 l'euro le plus proche.}"
		    }
		]
	    }
	}
    ]
};

local elts = {
    "element": "esef",
    "title": "Financial statements",
    "accounts_file": "example2.gnucash",
    "accounts_kind": "piecash",
    "elements": [
	{
	    "id": "report",
	    "element": "composite",
	    "elements": [
		{
		    "element": "title-page",
		    "logo": "logo"
		},
		{
		    "element": "company-info"
		},
		{
		    "element": "income-statement"
		},
		{
		    "element": "balance-sheet"
		},
		{
		    "element": "cash-flows"
		},
		{
		    "element": "notes"
		}
	    ]
	}
    ]
};

local accts = {
    metadata: import "test/metadata-esef.jsonnet",
    accounts:: l.from_element_def(elts, self).with_metadata(self.metadata),
    resource(x):: {
	"logo": "//ref logo",
	"notes": notes
    }[x]
};

accts.accounts.report

