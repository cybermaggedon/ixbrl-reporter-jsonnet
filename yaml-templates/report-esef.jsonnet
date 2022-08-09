
local l = import "lib/esef.libsonnet";

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
				"content": "Notes to the accounts"
			    },
			    {
				"tag": "div",
				"content": "expand:For the period ended ~[date-of-end-of-reporting-period]"
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
			    "title": "Compliance",
			    "level": 1
			}
		    },
		    {
			"tag": "p",
			"content": "expand:~{statement-of-ifrs-compliance= The consolidated financial statements of ~[name-of-reporting-entity] have been prepared in accordance with International Financial Reporting Standards (IFRS) and interpretations issued by the IFRS Interpretations Committee (IFRS IC) applicable to companies reporting under IFRS. The financial statements comply with IFRS as issued by the International Accounting Standards Board (IASB).}"
		    },
		    {
			"element": {
			    "kind": "noteheading",
			    "title": "Currency",
			    "level": 1
			}
		    },
		    {
			"tag": "p",
			"content": "expand:~{description-of-presentation-currency= These statements are presented in the euro currency (EUR).}"
		    },
		    {
			"element": {
			    "kind": "noteheading",
			    "title": "Level of rounding",
			    "level": 1
			}
		    },
		    {
			"tag": "p",
			"content": "expand:~{level-of-rounding= Monetary values are reported rounded to the nearest euro.}"
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
    accounts:: l.from_element_def(elts, self),
    resource(x):: {
	"logo": "//ref logo",
	"notes": notes
    }[x]
};

accts.accounts.report

