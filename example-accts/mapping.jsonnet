{

    line_inputs +: {

	salaries: [
	    "Expenses:Emoluments:Employees",
	    "Expenses:Emoluments:Employer's NICs"
	],

	income: [
	    "Income"
	],

	pensions: [
	    "Expenses:Emoluments:Employer Pension Contribution"
	],

    },

    compound_inputs +: {

	turnover: [
	    "consultancy"
	],

	"other-operating-income": [],

	"raw-materials-consumables": [],

	"gross-profit": ["turnover"],

    },

}

