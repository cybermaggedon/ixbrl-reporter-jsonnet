function(accts)
[

    // FIXME: CT vs FRS definition
    accts.line("main-income", "Main income").in_year(),

    accts.line("income", "Income from main trade")
	.in_year()
	.segment("detailed-analysis", "item1")
	.segment("countries-regions", "UK"),

    accts.group("ct-turnover", "Turnover / revenue").in_year(),

    accts.group("gross-profit-raw", "Gross profit unrounded").in_year(),
    
    accts.round("gross-profit-round", "Gross profit")
	.down()
	.in_year(),

    accts.line("salaries", "Salaries")
	.in_year()
	.segment("expense-type", "administrative-expenses"),

    accts.line("pensions", "Pension contributions")
	.in_year()
	.segment("expense-type", "administrative-expenses"),

    accts.line("bank-charges", "Bank charges")
	.in_year()
	.segment("expense-type", "administrative-expenses"),

    accts.line("office", "Office costs")
	.in_year().
	segment("expense-type", "administrative-expenses"),

    accts.line("software-expenses", "Software")
	.in_year()
	.segment("expense-type", "administrative-expenses"),

    accts.line("sundries", "Sundries")
	.in_year()
	.segment("expense-type", "administrative-expenses"),

    accts.line("travel", "Travel")
	.in_year()
    	.segment("expense-type", "administrative-expenses"),

    accts.line("accountancy", "Accountancy services")
	.in_year()
	.segment("expense-type", "administrative-expenses"),

    accts.line("subscriptions-costs", "Subscriptions")
	.in_year()
	.segment("expense-type", "administrative-expenses"),

    accts.line("telecoms", "Telecoms")
	.in_year()
	.segment("expense-type", "administrative-expenses"),

    accts.group("total-costs", "Total costs").in_year(),

    accts.group("profit-before-tax", "Net profit before tax")
	.in_year(),

    accts.line("corporation-tax", "Corporation tax")
	.in_year(),

    accts.sum("tax-due", "Corporation tax")
	.in_year(),

    accts.sum("profit-after-tax", "Profit (Loss) after tax")
	.in_year(),

    accts.group("rnd-qualifying-expenditure", "SME R&D qualifying expenditure")
	.in_year()
	.segment("business-name", "metadata.business.company-name")
	.segment("business-type", "trade")
	.segment("loss-reform", "post-loss-reform")
	.segment("territory", "uk"),

    accts.factor(
	"rnd-enhanced-expenditure",
        "SME R&D enhanced expenditure (130%)"
    )
	.with_factor(1.3)
	.in_year()
	.segment("business-name", "metadata.business.company-name")
	.segment("business-type", "trade")
	.segment("loss-reform", "post-loss-reform")
	.segment("territory", "uk"),

    accts.sum(
	"rnd-creative-enhanced-expenditure",
	"SME R&D / Creative enhanced expenditure (130%)"
    ).
	in_year()
	.segment("business-name", "metadata.business.company-name")
	.segment("business-type", "trade")
	.segment("loss-reform", "post-loss-reform")
	.segment("territory", "uk"),

    accts.line("capital-investment", "Capital investment")
	.in_year()
	.reverse_sign()
    	.segment("business-type", "management-expenses"),

    accts.round(
	"ct-annual-investment-allowance",
        "Annual investment allowance"
    )
	.down()
	.in_year()
	.reverse_sign()
	.segment("business-type", "management-expenses"),

    accts.sum("profit-loss-per-accounts", "Profit (loss) per accounts")
	.in_year()
	.segment("business-name", "metadata.business.company-name")
	.segment("business-type", "trade")
	.segment("loss-reform", "post-loss-reform")
	.segment("territory", "uk"),

    accts.group("ct-trading-profits-raw", "Taxable profits")
	.in_year()
	.segment("business-type", "company"),

    accts.compare(
	"ct-trading-profits-if-pos",
	"Profits (if positive)"
    )
	.greater()
	.in_year(),

    accts.compare(
	"ct-trading-profits-if-neg",
	"Profits (if negative)"
    )
	.less()
	.in_year(),

    accts.round("ct-trading-profits", "Taxable profits")
	.down()
	.in_year()
	.segment("business-type", "company"),

    accts.sum("ct-trading-losses", "Trading losses")
	.in_year()
	.segment("business-type", "company"),

    accts.line(
        "ct-trading-losses-brought-forward",
        "Trading losses brought forward"
    )
	.in_year()
	.segment("business-type", "company"),

    accts.sum(
	"ct-net-trading-profits",
        "Profits chargeable to corporation tax"
    )
	.in_year()
	.segment("business-type", "company"),

    accts.group(
	"profits-before-other-deductions-and-reliefs",
        "Profits before other deductions and reliefs"
    )
	.in_year()
    	.segment("business-type", "company"),

    accts.group(
	"profits-before-charges-and-group-relief",
        "Profits before donations and group relief"
    )
	.in_year()
    	.segment("business-type", "company"),

    accts.group(
	"total-profits-chargeable-to-corporation-tax",
	"Profits chargeable to Corporation Tax"
    )
	.in_year()
        .segment("business-type", "company"),

    accts.apportion(
	"ct-profit-before-tax-fy1-raw",
	"FY1 (raw)"
    )
	.whole_period("metadata.accounting.periods.0")
	.proportion_period("metadata.tax.fy1")
	.in_year()
    	.segment("business-type", "company"),

    accts.round("ct-profit-before-tax-fy1", "FY1")
	.in_year()
	.nearest()
    	.segment("business-type", "company"),

    accts.apportion(
	"ct-profit-before-tax-fy2-raw",
	"FY2 (raw)"
    )
	.whole_period("metadata.accounting.periods.0")
	.proportion_period("metadata.tax.fy2")
	.in_year()
    	.segment("business-type", "company"),

    accts.round("ct-profit-before-tax-fy2", "FY2")
	.in_year()
	.nearest()
    	.segment("business-type", "company"),

    accts.group("ct-profit-before-tax-total", "Profits, by financial year")
	.in_year()
    	.segment("business-type", "company"),

    // FIXME: Should be defined as a constant somewhere else
    // FIXME: Deal with multiple tax bands
    accts.factor("ct-tax-fy1", "FY1 (19%)")
	.with_factor(-0.19)
	.in_year()
	.reverse_sign()
    	.segment("business-type", "company"),

    accts.factor("ct-tax-fy2", "FY2 (19%)")
	.with_factor(-0.19)
	.in_year()
	.reverse_sign()
    	.segment("business-type", "company"),

    accts.group("ct-tax-total", "Corporation tax chargeable")
	.in_year()
    	.segment("business-type", "company"),

    accts.sum(
	"corporation-tax-chargeable-payable",
	"Corporation tax chargeable payable"
    )
	.in_year()
    	.segment("business-type", "company"),

    accts.sum(
	"net-corporation-tax-payable",
	"Net corporation tax payable"
    )
	.in_year()
    	.segment("business-type", "company"),

    accts.sum(
	"ct-tax-owed",
	"Corporation tax owed"
    )
	.in_year()
    	.segment("business-type", "company"),

    accts.sum(
	"tax-chargeable",
	"Corporation tax chargeable"
    )
	.in_year()
    	.segment("business-type", "company"),

    accts.sum(
	"tax-payable",
	"Corporation tax payable"
    )
	.in_year()
    	.segment("business-type", "company"),

]

