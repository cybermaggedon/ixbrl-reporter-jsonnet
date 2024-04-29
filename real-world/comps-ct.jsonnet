function(accts)
[

    accts.library.line(
	"depreciation",
	"Depreciaton"
    )
	.in_year()
        .segment("expense-type", "administrative-expenses"),

    accts.library.line("main-income", "Main income").in_year()
       .in_year()
//       .segment("activity", "m")
       .segment("detailed-analysis", "item1")
       .segment("countries-regions", "UK"),

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
	"adjustments-exempt-dividends",
	"Tax exempt dividends income deducted"
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

    accts.library.line(
	"capital-gains",
	"Capital gains (losses)"
    )
	.in_year()
	.segment("detailed-analysis", "item3")
	.segment("countries-regions", "UK"),
    
    accts.library.line(
	"gifts-received",
	"Gifts received"
    )
	.in_year()
//	.segment("activity", "m")
	.segment("detailed-analysis", "item4")
	.segment("countries-regions", "UK"),
    
    accts.library.line(
	"interest-income",
	"Interest income"
    )
	.in_year()
//	.segment("activity", "m")
	.segment("detailed-analysis", "item5")
	.segment("countries-regions", "UK"),
    
    accts.library.line(
	"other-income",
	"Other income"
    )
	.in_year()
//	.segment("activity", "m")
	.segment("detailed-analysis", "item6")
	.segment("countries-regions", "UK"),  

    accts.library.line(
	"dividends",
	"Dividends income"
    )
	.in_year()
//	.segment("activity", "m")
	.segment("detailed-analysis", "item7")
	.segment("countries-regions", "UK"),
  
]

