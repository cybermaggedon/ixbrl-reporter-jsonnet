function(accts)
[

    // Change the income computation, change it's activity dimension to 'd',
    // and countries-regions to England & Wales.
    accts.library.line("income", "Income from main trade")
	.in_year()
	.segment("activity", "m")
	.segment("detailed-analysis", "item1")
	.segment("countries-regions", "england-and-wales"),

    // Define an entertainment computation
    accts.library.line("entertainment", "Entertainment")
	.in_year()
	.segment("expense-type", "administrative-expenses"),

    // Define a shipping computation
    accts.library.line("shipping", "Shipping")
	.in_year()
	.segment("detailed-analysis", "item8")
	.segment("expense-type", "administrative-expenses"),

    // Define an entertainment adjustment computation.  Note that this is
    // sign-reversed so that it is added back to the profits
    accts.library.line(
	"adjustments-entertainment",
	"Entertainment expense added back"
    )
	.in_year()
	.reverse_sign()
	.segment("business-name", "metadata.business.company-name")
	.segment("business-type", "trade")
	.segment("loss-reform", "post-loss-reform")
	.segment("territory", "uk"),

    // Define a depreciation computation
    accts.library.line(
	"depreciation",
	"Depreciaton"
    )
	.in_year()
        .segment("expense-type", "administrative-expenses"),

    // Define a depreciation adjustment computation.  Note that this is
    // sign-reversed so that it is added back to the profits
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

]

