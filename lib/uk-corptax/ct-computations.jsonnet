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
	"total-profits-chargeable-to-corporation-tax-raw",
	"Profits chargeable to Corporation Tax (unrounded)"
    )
	.in_year()
        .segment("business-type", "company"),

    // CT600 box 315 is a whole-pound figure, and the FY apportionment
    // rows (ct-profit-before-tax-fy1/fy2) are rounded individually while
    // tagging the same ct-comp:TotalProfitsChargeableToCorporationTax
    // concept via ct-profit-before-tax-total.  If any pence reach this
    // computation, the two facts diverge and HMRC (ChRIS) rejects the
    // submission: error 3314, "Inconsistent duplicate fact values".
    // Rounding down here keeps every use of the concept whole-pound.
    accts.round(
	"total-profits-chargeable-to-corporation-tax",
	"Profits chargeable to Corporation Tax"
    )
	.down()
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

    // Marginal relief (CT600 box 435).  The box was relabelled from
    // "Marginal relief for ring fence trades" to plain "Marginal relief"
    // from April 2023, when marginal relief for profits between the small
    // profits and main rate limits was reintroduced; the taxonomy concept
    // keeps the legacy name.  The default is a line with no mapped
    // accounts, i.e. zero.  To claim relief, override this computation
    // with a constant in your computations file, e.g.:
    //
    //   accts.library.computation(
    //       "marginal-rate-relief-for-ring-fence-trades-payable",
    //       "Marginal relief"
    //   )
    //       .in_year()
    //       .segment("business-type", "company")
    //   + { kind: "constant", values: { "2026-03-31": 2921.96 } },
    //
    // A "constant" computation needs an entry for EVERY period the
    // report evaluates: a report with a previous-period comparative also
    // needs a key for that period end (typically 0).
    //
    // The value must be POSITIVE: tax liabilities are negative in the
    // internal sign convention (their display sign is reversed by the
    // taxonomy), so summing a positive relief into
    // corporation-tax-chargeable-payable reduces the liability.
    accts.line(
	"marginal-rate-relief-for-ring-fence-trades-payable",
	"Marginal relief"
    )
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

