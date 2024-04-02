function(accts)
[
    accts.line("consultancy", "Consultancy").in_year(),

    accts.sum("turnover", "Turnover / revenue").in_year(),

    accts.sum("other-operating-income", "Other income").in_year(),

    accts.sum("raw-materials-consumables", "Cost of raw materials").in_year(),

    accts.sum("gross-profit", "Gross Profit").in_year(),

    accts.line("salaries-expense", "Salaries").in_year(),

    accts.line("pensions-expense", "Pension contributions").in_year(),

    accts.group("staff-costs", "Staff costs")
	.in_year()
	.note("staff-costs-note"),

    accts.line("depreciation", "Depreciation").in_year(),

    accts.line("accountancy", "Accountancy services").in_year(),

    accts.line("bank-charges", "Bank charges").in_year(),

    accts.line("office", "Office costs").in_year(),

    accts.line("software", "Software").in_year(),

    accts.line("subscriptions", "Subscriptions").in_year(),

    accts.line("sundries", "Sundries").in_year(),

    accts.line("telecoms", "Telecoms").in_year(),

    accts.line("travel", "Travel").in_year(),

    accts.sum("other-charges", "Other charges").in_year(),

    accts.line("tax", "Tax").in_year(),

    accts.group("profit", "Profit (Loss)")
	.in_year()
	.note("profit-note"),

    accts.group("charges", "Charges against profits").in_year(),

    accts.line("interest-received", "Interest on current account")
	.in_year()
	.note("financial-income-note"),

    accts.group("interest-income", "Interest income").in_year(),

    accts.line("interest-paid", "Interest on bank loans")
	.in_year()
	.note("financial-costs-note"),

    accts.group("interest-expense", "Interest expense").in_year(),

    accts.group("zero", "No information").in_year(),

    accts.line("tangible-assets", "Tangible Assets").at_end(),

    accts.sum("fixed-assets", "Fixed Assets")
	.at_end()
	.note("equipment-note"),

    accts.line("debtors", "Debtors").at_end(),

    accts.line("vat-refund-due", "VAT Refund Due").at_end(),

    accts.line("bank", "Bank").at_end(),

    accts.sum("current-assets", "Current Assets").at_end(),

    accts.group(
	"prepayments-and-accrued-income",
	"Prepayments and Accrued Income"
    ).at_end(),

    accts.line("trade-creditors", "Trade Creditors").at_end(),

    accts.line("other-creditors", "Other Creditors").at_end(),

    accts.sum(
	"creditors-within-1-year",
	"Creditors: falling due within one year"
    )
	.at_end()
	.segment("matures", "within-1-year"),

    accts.sum("net-current-assets", "Net Current Assets").at_end(),

    accts.sum(
	"total-assets-less-liabilities",
	"Total Assets Less Liabilities"
    ).at_end(),

    accts.sum(
	"creditors-after-1-year",
	"Creditors: falling due after one year"
    )
	.at_end()
	.segment("matures", "after-1-year"),

    accts.sum("provisions-for-liabilities", "Provisions For Liabilities")
	.at_end(),

    accts.group(
	"accruals-and-deferred-income",
        "Accrued liabilities and deferred income"
    ).at_end(),

    accts.sum("net-assets", "Net Assets").at_end(),

    accts.line("share-capital-equity", "Share Capital")
	.at_end()
	.segment("equity", "ordinary-shares"),

    accts.line("profit-loss", "Retained Profit").at_end(),

    accts.line("dividends", "Dividends").at_end(),

    accts.line("corporation-tax", "Corporation tax").at_end(),

    accts.group("capital-and-reserves", "Capital and Reserves").at_end(),

    accts.sum("total-capital-and-reserves", "Capital and Reserves").at_end(),

    accts.line("fixed-assets-initial", "At start of period").at_start(),

    accts.line("fixed-assets-additions", "Additions").in_year(),

    accts.group("fixed-assets-total", "Fixed Assets").at_end(),

    accts.line("depreciation-initial", "At start of period").at_start(),

    accts.line("depreciation-charge", "Charge").in_year(),

    accts.group("depreciation-total", "Depreciation").at_end(),

    accts.sum("carrying-final", "Carrying at end of period").at_end(),

    accts.line("shares-at-start", "Ordinary Shares held at start").at_start(),

    accts.line("shares-issued", "Shares Issued in period").in_year(),

    accts.group("share-capital", "Share Capital")
	.at_end()
	.segment("equity", "ordinary-shares"),

    accts.line("corporation-tax-paid", "Corporation tax")
	.in_year()
	.note("taxation-note"),

    accts.line("depreciation-adjustment", "Adjustment for depreciation")
	.in_year()
	.note("equipment-note")
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

    accts.line("trade-payables", "Increase (decrease) in trade payables")
	.in_year()
	.reverse_sign(),

    accts.sum("cash-inflow", "Cash inflow").in_year(),

    accts.group("cash-from-operations", "Cash from operations")
	.in_year(),

    accts.group(
	"net-cash-from-operating-activities",
        "Net cash from operating activities"
    ).in_year(),

    accts.line("proceeds-sale-equipment", "Proceeds from sale of equipment")
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
	"net-cash-from-investing-activities",
        "Net cash from investing activities"
    ).in_year(),

    accts.group("proceeds-from-issuing-shares", "Issue of share capital")
	.in_year()
	.note("share-capital-note"),

    accts.line(
	"purchase-of-non-controlling-interest",
	"Purchase of non-controlling interest"
    ).in_year(),

    accts.line("dividends-paid", "Dividends").in_year(),

    accts.group(
	"net-cash-from-financing-activities",
        "Net cash from financing activities"
    ).in_year(),

    accts.line("cash-at-start-of-year", "Cash at start of year")
	.at_start(),

    accts.sum(
	"net-cash-change",
        "Net change in cash and cash equivalents"
	// FIXME: in_year()???  Net cash change implies in year?
    ).at_end(),

    accts.group(
	"cash-at-end-of-year",
	"Cash and cash equivalents at end of year"
    )
	.at_end()
	.note("cash-note"),

    accts.line("current-account", "Current account").at_end(),

    accts.line("reserve-account", "Reserve account").at_end(),

    accts.group("cash", "Cash and cash equivalents at end of year").at_end()

]

