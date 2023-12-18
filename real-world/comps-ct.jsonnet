function(accts)
[

    accts.library.line(
	"depreciation",
	"Depreciaton"
    )
	.in_year()
        .segment("expense-type", "administrative-expenses"),

    accts.library.line(
	"insurance",
	"Insurance"
    )
	.in_year()
	.segment("expense-type", "administrative-expenses"),
    
    accts.library.line(
	"telecoms",
	"Telecoms"
    )
	.in_year()
	.segment("expense-type", "administrative-expenses"),
        
    accts.library.line(
	"bad-debts",
	"Bad debts"
    )
	.in_year()
	.segment("expense-type", "administrative-expenses"),
    
    accts.library.line(
	"donations",
	"Donations"
    )
	.in_year()
	.segment("expense-type", "administrative-expenses"),
    
    accts.library.line(
	"entertaining",
	"Entertaining"
    )
	.in_year()
	.segment("expense-type", "administrative-expenses"),
    
    accts.library.line(
	"capital-losses",
	"Capital losses"
    )
	.in_year()
	.segment("expense-type", "administrative-expenses"),
    
    accts.library.line(
	"taxes",
	"Taxes"
    )
	.in_year()
	.segment("expense-type", "administrative-expenses"),
    
    accts.library.line(
	"vehicle",
	"Vehicle expenses"
    )
	.in_year()
	.segment("expense-type", "administrative-expenses"),
    
    accts.library.line(
	"property-costs",
	"Property costs"
    )
	.in_year()
	.segment("expense-type", "administrative-expenses"),
    
    accts.library.line(
	"adjustments-depreciation",
	"Depreciation expense added back"
    )
	.in_year()
	.reverse_sign()
	.segment("business-name", "metadata.business.company-name")
	.segment("business-type", "trade")
	.segment("loss-reform", "post-loss-reform")
	.segment("territory", "uk"),

    accts.library.line(
	"adjustments-entertaining",
	"Entertainment expense added back"
    )
	.in_year()
	.reverse_sign()
	.segment("business-name", "metadata.business.company-name")
	.segment("business-type", "trade")
	.segment("loss-reform", "post-loss-reform")
	.segment("territory", "uk"),

]

