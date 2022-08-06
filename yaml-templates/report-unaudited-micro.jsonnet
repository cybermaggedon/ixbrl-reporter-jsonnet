{
    taxonomy: "//import taxonomy/frs102.yaml",
    style: "//import report/style.yaml",
    "accounting-standards": "micro-entities",
    "accounts-status": "audit-exempt-no-accountants-report",
    "accounts-type": "abridged-accounts",
    title: "Unaudited Micro-Entity Accounts",
    macros: "//import report/ch/macros.yaml",
    computations: "//import report/ch/frc102-computations.yaml",
    worksheets: "//import report/ch/frc102-worksheets.yaml",
    elements: [
	{
	    id: "report",
	    kind: "html",
	    root: {
		tag: "div",
		content: [
		    {
			element: "title",
		    },
		    {
			element: "company-info",
		    },
		    {
			element: "balance-sheet",
		    },
		    {
			ifdef: "metadata.accounting.is-revised",
			content: {
			    element: "revision-info",
			}
		    },
		    {
			element: "notes"
		    },
		]
	    }
	},
	"//ref report.macros.title",
	"//ref report.macros.company-info",
	"//ref report.macros.balance-sheet-unaudited-micro",
	"//ref report.macros.signature",
	"//ref report.macros.revision",
	"//ref report.macros.simple-notes",
    ]
}
