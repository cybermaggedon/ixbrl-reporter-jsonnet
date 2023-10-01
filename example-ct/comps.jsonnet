function(accts)
[

    accts.library.line("income", "Income from main trade")
	.in_year()
	.segment("activity", "m")
	.segment("detailed-analysis", "item1")
	.segment("countries-regions", "UK"),

    accts.library.group("ct-turnover", "Turnover / revenue").in_year(),

    accts.library.group("gross-profit-raw", "Gross profit unrounded").in_year(),
    
    accts.library.round("gross-profit-round", "Gross profit")
	.down()
	.in_year(),

]

