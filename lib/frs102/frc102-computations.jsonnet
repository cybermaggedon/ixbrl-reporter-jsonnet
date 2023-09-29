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
    accts.group(
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
    {
        "id": "share-capital-equity",
        "kind": "line",
        "description": "Share Capital",
        "period": "at-end",
        "segments": [
            { "equity": "ordinary-shares" }
        ],
        "accounts": accts.accounts(self.id)
    },
    {
        "id": "profit-loss",
        "kind": "line",
        "description": "Retained Profit",
        "period": "at-end",
        "accounts": accts.accounts(self.id)
    },
    {
        "id": "dividends",
        "kind": "line",
        "description": "Dividends",
        "period": "at-end",
        "accounts": accts.accounts(self.id)
    },
    {
        "id": "corporation-tax",
        "kind": "line",
        "description": "Corporation tax",
        "period": "at-end",
        "accounts": accts.accounts(self.id)
    },
    {
        "description": "Capital and Reserves",
        "id": "capital-and-reserves",
        "kind": "group",
        "inputs": [
            "share-capital-equity",
            "profit-loss",
            "dividends",
            "corporation-tax"
        ]
    },
    {
        "id": "total-capital-and-reserves",
        "kind": "sum",
        "description": "Capital and Reserves",
        "inputs": [
            "capital-and-reserves"
        ]
    },
    {
        "id": "fixed-assets-initial",
        "kind": "line",
        "description": "At start of period",
        "period": "at-start",
        "accounts": accts.accounts(self.id)
    },
    {
        "id": "fixed-assets-additions",
        "kind": "line",
        "description": "Additions",
        "period": "in-year",
        "accounts": accts.accounts(self.id)
    },
    {
        "id": "fixed-assets-total",
        "kind": "group",
        "description": "Fixed Assets",
        "inputs": [
            "fixed-assets-initial",
            "fixed-assets-additions"
        ]
    },
    {
        "id": "depreciation-initial",
        "kind": "line",
        "description": "At start of period",
        "period": "at-start",
        "accounts": accts.accounts(self.id)
    },
    {
        "id": "depreciation-charge",
        "kind": "line",
        "description": "Charge",
        "period": "in-year",
        "accounts": accts.accounts(self.id)
    },
    {
        "id": "depreciation-total",
        "kind": "group",
        "description": "Depreciation",
        "inputs": [
            "depreciation-initial",
            "depreciation-charge"
        ]
    },
    {
        "id": "carrying-final",
        "kind": "sum",
        "description": "Carrying at end of period",
        "inputs": [
            "fixed-assets-total",
            "depreciation-total"
        ]
    },
    {
        "id": "shares-at-start",
        "kind": "line",
        "description": "Ordinary Shares held at start",
        "period": "at-start",
        "accounts": accts.accounts(self.id)
    },
    {
        "id": "shares-issued",
        "kind": "line",
        "description": "Shares Issued in period",
        "period": "in-year",
        "accounts": accts.accounts(self.id),
    },
    {
        "id": "share-capital",
        "kind": "group",
        "description": "Share Capital",
        "period": "at-end",
        "inputs": [
            "shares-at-start",
            "shares-issued"
        ],
        "segments": [
            { "equity": "ordinary-shares" }
        ]
    },
    {
        "id": "corporation-tax-paid",
        "kind": "line",
        "note": "taxation-note",
        "description": "Corporation tax",
        "period": "in-year",
        "accounts": accts.accounts(self.id)
    },
    {
        "id": "depreciation-adjustment",
        "kind": "line",
        "note": "equipment-note",
        "description": "Adjustment for depreciation",
        "period": "in-year",
        "reverse-sign": true,
        "accounts": accts.accounts(self.id)
    },
    {
        "id": "trade-and-other-receivables",
        "kind": "line",
        "description": "Decrease (increase) in trade and other receivables",
        "period": "in-year",
        "reverse-sign": true,
        "accounts": accts.accounts(self.id)
    },
    {
        "id": "inventories",
        "kind": "line",
        "description": "Decrease (increase) in inventories",
        "period": "in-year",
        "reverse-sign": true,
        "accounts": accts.accounts(self.id)
    },
    {
        "id": "trade-payables",
        "kind": "line",
        "description": "Increase (decrease) in trade payables",
        "period": "in-year",
        "reverse-sign": true,
        "accounts": accts.accounts(self.id)
    },
    {
        "id": "cash-inflow",
        "kind": "sum",
        "period": "in-year",
        "inputs": [
            "profit"
        ]
    },
    {
        "id": "cash-from-operations",
        "kind": "group",
        "description": "Cash from operations",
        "period": "in-year",
        "inputs": [
            "cash-inflow",
            "depreciation-adjustment",
            "trade-and-other-receivables",
            "inventories",
            "trade-payables"
        ]
    },
    {
        "id": "net-cash-from-operating-activities",
        "kind": "group",
        "description": "Net cash from operating activities",
        "period": "in-year",
        "inputs": [
            "profit",
            "depreciation-adjustment",
            "trade-and-other-receivables",
            "inventories",
            "trade-payables",
            "corporation-tax-paid"
        ]
    },
    {
        "id": "proceeds-sale-equipment",
        "kind": "line",
        "period": "in-year",
        "description": "Proceeds from sale of equipment",
        "accounts": accts.accounts(self.id)
    },
    {
        "id": "purchase-equipment",
        "kind": "line",
        "period": "in-year",
        "reverse-sign": true,
        "description": "Purchase of property, plant and equipment",
        "accounts": accts.accounts(self.id)
    },
    {
        "id": "purchase-intangible-assets",
        "kind": "line",
        "period": "in-year",
        "description": "Purchase of intangible assets",
        "accounts": accts.accounts(self.id)
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
        "kind": "group",
        "period": "in-year",
        "note": "share-capital-note",
        "description": "Issue of share capital",
        "inputs": [
            "shares-issued"
        ]
    },
    {
        "id": "purchase-of-non-controlling-interest",
        "kind": "line",
        "period": "in-year",
        "description": "Purchase of non-controlling interest",
        "accounts": accts.accounts(self.id)
    },
    {
        "id": "dividends-paid",
        "kind": "line",
        "description": "Dividends",
        "period": "in-year",
        "accounts": accts.accounts(self.id)
    },
    {
        "id": "net-cash-from-financing-activities",
        "kind": "group",
        "description": "Net cash from financing activities",
        "period": "in-year",
        "inputs": [
            "interest-paid",
            "proceeds-from-issuing-shares",
            "purchase-of-non-controlling-interest",
            "dividends-paid"
        ]
    },
    {
        "id": "cash-at-start-of-year",
        "kind": "line",
        "period": "at-start",
        "description": "Cash at start of year",
        "accounts": accts.accounts(self.id)
    },
    {
        "id": "cash-at-end-of-year",
        "kind": "group",
        "note": "cash-note",
        "description": "Cash and cash equivalents at end of year",
        "inputs": [
            "cash-at-start-of-year",
            {
                "id": "net-cash-change",
                "kind": "sum",
                "description": "Net change in cash and cash equivalents",
                "inputs": [
                    "net-cash-from-operating-activities",
                    "net-cash-from-investing-activities",
                    "net-cash-from-financing-activities"
                ]
            }
        ]
    },
    {
        "id": "cash",
        "kind": "group",
        "description": "Cash and cash equivalents at end of year",
        "period": "at-end",
        "inputs": [
            {
                "id": "current-account",
                "kind": "line",
                "description": "Current account",
                "period": "at-end",
		"accounts": accts.accounts(self.id)
            },
            {
                "id": "reserve-account",
                "kind": "line",
                "description": "Reserve account",
                "period": "at-end",
		"accounts": accts.accounts(self.id)
            }
        ]
    }
]
