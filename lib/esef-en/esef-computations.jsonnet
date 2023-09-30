function(accts)
[
    accts.line("consultancy", "Consultancy").in_year(),

    accts.sum("operating-revenue", "Operating revenue").in_year(),

    accts.line("personnel-costs", "Personnel costs").in_year(),

    accts.line(
        "depreciation-and-amortisation",
        "Depreciation and amortisation"
    )
        .in_year(),

    accts.line("accountancy", "Accountancy services")
        .in_year(),

    accts.line("bank-charges", "Bank charges")
        .in_year(),

    accts.line("office", "Office costs").in_year(),

    accts.line("software", "Software").in_year(),

    accts.line("subscriptions", "Subscriptions").in_year(),

    accts.line("sundries", "Sundries").in_year(),

    accts.line("telecoms", "Telecoms").in_year(),

    accts.line("travel", "Travel").in_year(),

    accts.sum(
        "other-operating-costs",
        "Other operating costs"
    )
        .in_year(),

    accts.group(
        "operating-costs",
        "Operating costs"
    )
        .in_year(),

    accts.line("interest-received", "Interest on current account")
        .in_year(),

    accts.line(
	"interest-paid",
	"Interest on bank loans"
    )
	.in_year(),

    accts.group("net-financial-items", "Net financial items")
	.in_year(),

    accts.line("income-tax", "Income tax").in_year(),

    accts.group("net-profit", "Net profit for the year")
	.in_year(),

    accts.group(
	"other-comprehensive-income",
	"Other comprehensive income"
    )
        .in_year(),

    accts.group("comprehensive-income", "Comprehensive income for the year")
        .in_year(),

    accts.line("tangible-assets", "Tangible Assets").at_end(),

    accts.sum("fixed-assets", "Fixed Assets").at_end(),

    accts.sum("other-non-current-assets", "Other non-current assets")
	.at_end(),

    accts.sum("deferred-tax-assets", "Deferred tax assets")
	.at_end(),

    accts.group("non-current-assets", "Non current assets").at_end(),

    accts.line("debtors", "Debtors").at_end(),

    accts.line("vat-refund-due", "VAT Refund Due").at_end(),

    accts.line("bank", "Bank").at_end(),

    accts.group("current-assets", "Current Assets").at_end(),

    accts.sum("total-assets", "Total assets").at_end(),

    accts.line("capital", "Capital").at_end(),

    accts.line("retained-profit", "Retained profit")
	.at_end(),

    accts.group("equity", "Equity").at_end(),

    accts.group("non-current-liabilities", "Non-current liabilities").at_end(),

    accts.line("trade-creditors", "Trade Creditors")
        .at_end()
        .reverse_sign(),

    accts.line("other-creditors", "Other Creditors")
        .at_end()
        .reverse_sign(),

    accts.group("current-liabilities", "Current liabilities").at_end(),

    accts.sum("total-liabilities", "Total liabilities").at_end(),

    accts.sum(
	"total-equity-and-liabilities",
	"Total equity and liabilities"
    )
        .at_end(),

    accts.line("income-tax-paid", "Income tax").in_year(),

    accts.line(
	"depreciation-adjustment",
	"Adjustment for depreciation"
    )
        .in_year()
        .reverse_sign(),

    accts.line(
	"financial-items-adjustment",
	"Adjustment for financial items"
    )
        .in_year()
        .reverse_sign(),

    accts.line(
	"income-tax-adjustment",
	"Adjustment for Income tax"
    )
        .in_year()
        .reverse_sign(),

    accts.line(
        "trade-and-other-receivables",
        "Decrease (increase) in trade and other receivables"
    )
        .in_year()
        .reverse_sign(),

    accts.line("inventories", "Decrease (increase) in inventories")
        .in_year()
        .reverse_sign(),

    accts.line(
        "trade-payables",
        "Increase (decrease) in trade payables"
    )
        .in_year()
        .reverse_sign(),

    accts.group(
        "esef-net-cash-from-operating-activities",
        "Net cash from operating activities"
    )
        .in_year(),

    accts.line(
	"proceeds-sale-equipment",
	"Proceeds from sale of equipment"
    )
        .in_year(),

    accts.line(
        "purchase-equipment",
        "Purchase of property, plant and equipment"
    )
        .in_year()
        .reverse_sign(),

    accts.line(
        "purchase-intangible-assets",
        "Purchase of intangible assets"
    ).in_year(),

    accts.group(
        "esef-net-cash-from-investing-activities",
        "Net cash from investing activities"
    ).in_year(),

    accts.line(
	"proceeds-from-issuing-shares",
	"Issue of share capital"
    )
        .in_year(),

    accts.line("dividends-paid", "Dividends").in_year(),

    accts.group(
        "esef-net-cash-from-financing-activities",
        "Net cash from financing activities"
    ).in_year(),

    accts.line("cash-at-start-of-year", "Cash at start of year")
	.at_start(),

    accts.sum(
        "esef-net-cash-change",
        "Net change in cash and cash equivalents"
    ).in_year(),

    accts.group(
        "esef-cash-at-end-of-year",
        "Cash and cash equivalents at end of year"
    ),
    
]
