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

    accts.sum("other-operating-costs", "Other operating costs").in_year(),

    accts.group("operating-costs", "Operating costs").in_year(),

    accts.line("interest-received", "Interest on current account").in_year(),

    accts.line("interest-paid", "Interest on bank loans").in_year(),

    accts.group("net-financial-items", "Net financial items").in_year(),

    accts.line("income-tax", "Income tax").in_year(),

    accts.group("net-profit", "Net profit for the year").in_year(),

    accts.group("other-comprehensive-income", "Other comprehensive income")
	.in_year(),

    accts.group("comprehensive-income", "Comprehensive income for the year")
	.in_year(),

    accts.line("tangible-assets", "Tangible Assets").at_end(),

    accts.sum("fixed-assets", "Fixed Assets").at_end(),

    accts.sum("other-non-current-assets", "Other non-current assets").at_end(),

    accts.sum("deferred-tax-assets", "Deferred tax assets").at_end(),

    accts.group("non-current-assets", "Non current assets").at_end(),

    accts.line("debtors", "Debtors").at_end(),

    accts.line("vat-refund-due", "VAT Refund Due").at_end(),

    accts.line("bank", "Bank").at_end(),

    accts.group("current-assets", "Current Assets").at_end(),

    accts.sum("total-assets", "Total assets").at_end(),

    accts.line("capital", "Capital").at_end(),

    accts.line("retained-profit", "Retained profit").at_end(),

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

    accts.sum("total-equity-and-liabilities", "Total equity and liabilities")
	.at_end(),

    accts.line("income-tax-paid", "Income tax").in_year(),

    {
        "id": "depreciation-adjustment",
        "kind": "line",
        "description": "Adjustment for depreciation",
        "period": "in-year",
        "reverse-sign": true,
        "accounts": accts.line_inputs(self.id)
    },
    {
        "id": "financial-items-adjustment",
        "kind": "line",
        "description": "Adjustment for financial items",
        "period": "in-year",
        "reverse-sign": true,
        "accounts": accts.line_inputs(self.id)
    },
    {
        "id": "income-tax-adjustment",
        "kind": "line",
        "description": "Adjustment for Income tax",
        "period": "in-year",
        "reverse-sign": true,
        "accounts": accts.line_inputs(self.id)
    },
    {
        "id": "trade-and-other-receivables",
        "kind": "line",
        "description": "Decrease (increase) in trade and other receivables",
        "period": "in-year",
        "reverse-sign": true,
        "accounts": accts.line_inputs(self.id)
    },
    {
        "id": "inventories",
        "kind": "line",
        "description": "Decrease (increase) in inventories",
        "period": "in-year",
        "reverse-sign": true,
        "accounts": accts.line_inputs(self.id)
    },
    {
        "id": "trade-payables",
        "kind": "line",
        "description": "Increase (decrease) in trade payables",
        "period": "in-year",
        "reverse-sign": true,
        "accounts": accts.line_inputs(self.id)
    },
    {
        "id": "net-cash-from-operating-activities",
        "kind": "group",
        "description": "Net cash from operating activities",
        "period": "in-year",
        "inputs": [
            "net-profit",
            "depreciation-adjustment",
            "financial-items-adjustment",
            "income-tax-adjustment",
            "trade-and-other-receivables",
            "inventories",
            "trade-payables",
            "income-tax-paid"
        ]
    },
    {
        "id": "proceeds-sale-equipment",
        "kind": "line",
        "period": "in-year",
        "description": "Proceeds from sale of equipment",
        "accounts": accts.line_inputs(self.id)
    },
    {
        "id": "purchase-equipment",
        "kind": "line",
        "period": "in-year",
        "reverse-sign": true,
        "description": "Purchase of property, plant and equipment",
        "accounts": accts.line_inputs(self.id)
    },
    {
        "id": "purchase-intangible-assets",
        "kind": "line",
        "period": "in-year",
        "description": "Purchase of intangible assets",
        "accounts": accts.line_inputs(self.id)
    },
    {
        "id": "net-cash-from-investing-activities",
        "kind": "group",
        "description": "Net cash from investing activities",
        "period": "in-year",
        "inputs": [
            "proceeds-sale-equipment",
            "purchase-equipment",
            "purchase-intangible-assets",
            "interest-received"
        ]
    },
    {
        "id": "proceeds-from-issuing-shares",
        "kind": "line",
        "period": "in-year",
        "description": "Issue of share capital",
        "accounts": accts.line_inputs(self.id)
    },
    {
        "id": "dividends-paid",
        "kind": "line",
        "description": "Dividends",
        "period": "in-year",
        "accounts": accts.line_inputs(self.id)
    },
    {
        "id": "net-cash-from-financing-activities",
        "kind": "group",
        "description": "Net cash from financing activities",
        "period": "in-year",
        "inputs": [
            "interest-paid",
            "proceeds-from-issuing-shares",
            "dividends-paid"
        ]
    },
    {
        "id": "cash-at-start-of-year",
        "kind": "line",
        "period": "at-start",
        "description": "Cash at start of year",
        "accounts": accts.line_inputs(self.id)
    },
    {
        "id": "cash-at-end-of-year",
        "kind": "group",
        "description": "Cash and cash equivalents at end of year",
        "inputs": [
            "cash-at-start-of-year",
            {
                "id": "net-cash-change",
                "kind": "sum",
                "description": "Net change in cash and cash equivalents",
                "period": "in-year",
                "inputs": [
                    "net-cash-from-operating-activities",
                    "net-cash-from-investing-activities",
                    "net-cash-from-financing-activities"
                ]
            }
        ]
    }
]
