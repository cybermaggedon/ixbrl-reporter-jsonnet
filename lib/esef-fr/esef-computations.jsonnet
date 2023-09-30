function(accts)
[
    accts.line("consultancy", "Consultance").in_year(),

    accts.sum("operating-revenue", "Revenus d'exploitation").in_year(),

    accts.line("personnel-costs", "Co\u00fbts de personnel").in_year(),

    accts.line(
	"depreciation-and-amortisation",
	"D\u00e9pr\u00e9ciation et amortissement"
    )
	.in_year(),

    accts.line("accountancy", "Services de comptabilit\u00e9")
	.in_year(),

    accts.line("bank-charges", "Charges bancaires")
	.in_year(),

    accts.line("office", "Frais de bureau").in_year(),

    accts.line("software", "Logiciel").in_year(),

    accts.line("subscriptions", "Abonnements").in_year(),

    accts.line("sundries", "Articles divers").in_year(),

    accts.line("telecoms", "T\u00e9l\u00e9coms").in_year(),

    accts.line("travel", "Voyage").in_year(),

    accts.sum("other-operating-costs", "Autres co\u00fbts d'exploitation")
        .in_year(),

    accts.group("operating-costs", "Co\u00fbts d'exploitation").in_year(),

    accts.line("interest-received", "Int\u00e9r\u00eats sur le compte courant")
        .in_year(),

    accts.line(
        "interest-paid",
	"Int\u00e9r\u00eats sur les pr\u00eats bancaires"
    ).in_year(),

    accts.group("net-financial-items", "\u00c9l\u00e9ments financiers nets")
	.in_year(),

    accts.line("income-tax", "Imp\u00f4ts sur le revenu").in_year(),

    accts.group("net-profit", "B\u00e9n\u00e9fice net pour l'ann\u00e9e")
	.in_year(),

    accts.group(
	"other-comprehensive-income",
	"Autres \u00e9l\u00e9ments du r\u00e9sultat global"
    ).in_year(),

    accts.group("comprehensive-income", "R\u00e9sultat global de l'ann\u00e9e")
	.in_year(),

    accts.line("tangible-assets", "Actifs corporels").at_end(),

    accts.sum("fixed-assets", "Actifs fixes").at_end(),

    accts.sum("other-non-current-assets", "Autres actifs non courants")
	.at_end(),

    accts.sum("deferred-tax-assets", "Actifs d'imp\u00f4ts diff\u00e9r\u00e9s")
	.at_end(),

    accts.group("non-current-assets", "Actifs non courants").at_end(),

    accts.line("debtors", "D\u00e9biteurs").at_end(),

    accts.line("vat-refund-due", "Remboursement de la TVA d\u00fb").at_end(),

    accts.line("bank", "Liquidit\u00e9s en banque").at_end(),

    accts.group("current-assets", "Actifs courants").at_end(),

    accts.sum("total-assets", "Total des actifs").at_end(),

    accts.line("capital", "Capital").at_end(),

    accts.line("retained-profit", "B\u00e9n\u00e9fice non distribu\u00e9")
	.at_end(),

    accts.group("equity", "Equity").at_end(),

    accts.group("non-current-liabilities", "Passifs non courants").at_end(),

    accts.line("trade-creditors", "Cr\u00e9anciers commerciaux")
	.at_end()
	.reverse_sign(),

    accts.line("other-creditors", "Autres cr\u00e9anciers")
	.at_end()
	.reverse_sign(),

    accts.group("current-liabilities", "Passif \u00e0 court terme").at_end(),

    accts.sum("total-liabilities", "Total du passif").at_end(),

    accts.sum(
	"total-equity-and-liabilities",
	"Total des fonds propres et du passif"
    ).at_end(),

    accts.line("income-tax-paid", "Imp\u00f4ts sur le revenu").in_year(),

    accts.line(
	"depreciation-adjustment",
	"Ajustement pour d\u00e9pr\u00e9ciation"
    )
	.in_year()
	.reverse_sign(),

    accts.line(
	"financial-items-adjustment",
	"Ajustement pour les \u00e9l\u00e9ments financiers"
    )
	.in_year()
	.reverse_sign(),

    accts.line(
	"income-tax-adjustment",
	"Ajustement pour l'imp\u00f4t sur le revenu"
    )
	.in_year()
	.reverse_sign(),

    accts.line(
	"trade-and-other-receivables",
        "Diminution (augmentation) des cr\u00e9ances commerciales et autres cr\u00e9ances"
    )
	.in_year()
	.reverse_sign(),

    accts.line("inventories", "Diminution (augmentation) des stocks")
	.in_year()
	.reverse_sign(),

    accts.line(
	"trade-payables",
	"Augmentation (diminution) des dettes commerciales"
    )
	.in_year()
	.reverse_sign(),

    accts.group(
	"esef-net-cash-from-operating-activities",
        "Tr\u00e9sorerie nette des activit\u00e9s op\u00e9rationnelles"
    )
	.in_year(),

    accts.line(
	"proceeds-sale-equipment",
	"Produit de la vente d'\u00e9quipements"
    )
	.in_year(),

    accts.line(
	"purchase-equipment",
	"Achat de biens, d'installations et d'\u00e9quipements"
    )
	.in_year()
	.reverse_sign(),

    accts.line(
	"purchase-intangible-assets",
	"Achat d'actifs incorporels"
    ).in_year(),

    accts.group(
	"esef-net-cash-from-investing-activities",
        "Tr\u00e9sorerie nette des activit\u00e9s d'investissement"
    ).in_year(),

    accts.line(
	"proceeds-from-issuing-shares",
	"\u00c9mission de capital social"
    )
	.in_year(),

    accts.line("dividends-paid", "Dividendes").in_year(),

    accts.group(
	"esef-net-cash-from-financing-activities",
        "Trésorerie nette provenant des activités de financement"
    ).in_year(),

    accts.line("cash-at-start-of-year", "Trésorerie en début d'année")
	.at_start(),

    accts.sum(
	"esef-net-cash-change",
        "Variation nette de la trésorerie et des équivalents de trésorerie"
    ).in_year(),

    accts.group(
	"esef-cash-at-end-of-year",
        "Trésorerie et équivalents de trésorerie à la fin de l'exercice"
    ),
    
]
