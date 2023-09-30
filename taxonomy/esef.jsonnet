{
    "schema": [
        "http://www.esma.europa.eu/taxonomy/2021-03-24/esef_cor.xsd"
    ],
    "namespaces": {
        "ifrs-full": "http://xbrl.ifrs.org/taxonomy/2021-03-24/ifrs-full"
    },
    "contexts": [
        {
            "id": "business",
            "entity": "metadata.business.company-number",
            "scheme": "metadata.business.entity-scheme"
        },
        {
            "id": "report-period",
            "from": "business",
            "period": "metadata.accounting.periods.0"
        },
        {
            "from": "business",
            "id": "previous-period",
            "period": "metadata.accounting.periods.1"
        },
        {
            "id": "report-date",
            "from": "business",
            "instant": "metadata.accounting.date"
        },
        {
            "id": "end-of-reporting-period",
            "from": "business",
            "instant": "metadata.accounting.periods.0.end"
        }
    ],
    "document-metadata": [
        "name-of-reporting-entity"
    ],
    "metadata": [
        {
            "id": "name-of-reporting-entity",
            "context": "report-period",
            "config": "metadata.business.company-name"
        },
        {
            "id": "domicile-of-entity",
            "context": "report-period",
            "config": "metadata.business.domicile-of-entity"
        },
        {
            "id": "legal-form-of-entity",
            "context": "report-period",
            "config": "metadata.business.legal-form-of-entity"
        },
        {
            "id": "country-of-incorporation",
            "context": "report-period",
            "config": "metadata.business.country-of-incorporation"
        },
        {
            "id": "address-of-entitys-registered-office",
            "context": "report-period",
            "config": "metadata.business.address-of-entitys-registered-office"
        },
        {
            "id": "principal-place-of-business",
            "context": "report-period",
            "config": "metadata.business.principal-place-of-business"
        },
        {
            "id": "nature-of-entitys-principal-activities",
            "context": "report-period",
            "config": "metadata.business.nature-of-entitys-principal-activities"
        },
        {
            "id": "date-of-end-of-reporting-period",
            "context": "report-period",
            "config": "metadata.accounting.periods.0.end"
        },
        {
            "id": "period-start",
            "context": "report-period",
            "config": "metadata.accounting.periods.0.start"
        },
        {
            "id": "period-end",
            "context": "report-period",
            "config": "metadata.accounting.periods.0.end"
        }
    ],
    "note-templates": [],
    "sign-reversed": {
	"purchase-equipment": true,
	"other-operating-costs": true,
	"income-tax": true,
	"income-tax-paid": true,
	"interest-paid": true,
	"depreciation-and-amortisation": true,
	"dividends-paid": true,
	"personnel-costs": true,
	"trade-and-other-receivables": true,
	"financial-items-adjustment": true,
	"net-cash-from-investing-activities": true,
    },
    "tags": {
        "name-of-reporting-entity": "ifrs-full:NameOfReportingEntityOrOtherMeansOfIdentification",
        "domicile-of-entity": "ifrs-full:DomicileOfEntity",
        "legal-form-of-entity": "ifrs-full:LegalFormOfEntity",
        "country-of-incorporation": "ifrs-full:CountryOfIncorporation",
        "address-of-entitys-registered-office": "ifrs-full:AddressOfRegisteredOfficeOfEntity",
        "principal-place-of-business": "ifrs-full:PrincipalPlaceOfBusiness",
        "nature-of-entitys-principal-activities": "ifrs-full:DescriptionOfNatureOfEntitysOperationsAndPrincipalActivities",
        "date-of-end-of-reporting-period": "ifrs-full:DateOfEndOfReportingPeriod2013",
        "period-covered-by-financial-statements": "ifrs-full:PeriodCoveredByFinancialStatements",
        "description-of-presentation-currency": "ifrs-full:DescriptionOfPresentationCurrency",
        "level-of-rounding": "ifrs-full:LevelOfRoundingUsedInFinancialStatements",
        "statement-of-ifrs-compliance": "ifrs-full:StatementOfIFRSCompliance",
        "operating-revenue": "ifrs-full:Revenue",
        "personnel-costs": "ifrs-full:EmployeeBenefitsExpense",
        "depreciation-and-amortisation": "ifrs-full:DepreciationAndAmortisationExpense",
        "other-operating-costs": "ifrs-full:OtherExpenseByNature",
        "interest-received": "ifrs-full:FinanceIncome",
        "interest-paid": "ifrs-full:FinanceCosts",
        "income-tax": "ifrs-full:IncomeTaxExpenseContinuingOperations",
        "net-profit": "ifrs-full:ProfitLossFromOperatingActivities",
        "other-comprehensive-income": "ifrs-full:OtherIncomeExpenseFromSubsidiariesJointlyControlledEntitiesAndAssociates",
        "comprehensive-income": "ifrs-full:ProfitLoss",
        "fixed-assets": "ifrs-full:PropertyPlantAndEquipment",
        "other-non-current-assets": "ifrs-full:OtherNoncurrentFinancialAssets",
        "deferred-tax-assets": "ifrs-full:DeferredTaxAssets",
        "non-current-assets": "ifrs-full:NoncurrentAssets",
        "debtors": "ifrs-full:TradeAndOtherCurrentReceivables",
        "vat-refund-owed": "ifrs-full:CurrentTaxAssetsCurrent",
        "vat-refund-due": "ifrs-full:CurrentTaxAssetsCurrent",
        "bank": "ifrs-full:CashAndCashEquivalents",
        "current-assets": "ifrs-full:CurrentAssets",
        "total-assets": "ifrs-full:Assets",
        "capital": "ifrs-full:IssuedCapital",
        "retained-profit": "ifrs-full:RetainedEarnings",
        "equity": "ifrs-full:Equity",
        "non-current-liabilities": "ifrs-full:NoncurrentLiabilities",
        "trade-creditors": "ifrs-full:TradeAndOtherCurrentPayables",
        "other-creditors": "ifrs-full:OtherCurrentFinancialLiabilities",
        "current-liabilities": "ifrs-full:CurrentLiabilities",
        "total-liabilities": "ifrs-full:Liabilities",
        "total-equity-and-liabilities": "ifrs-full:EquityAndLiabilities",
        "income-tax-paid": "ifrs-full:IncomeTaxesPaidRefundClassifiedAsOperatingActivities",
        "income-tax-adjustment": "ifrs-full:AdjustmentsForIncomeTaxExpense",
        "financial-items-adjustment": "ifrs-full:AdjustmentsForFinanceCosts",
        "depreciation-adjustment": "ifrs-full:AdjustmentsForDepreciationExpense",
        "trade-and-other-receivables": "ifrs-full:AdjustmentsForDecreaseIncreaseInTradeAccountReceivable",
        "inventories": "ifrs-full:AdjustmentsForDecreaseIncreaseInInventories",
        "trade-payables": "ifrs-full:AdjustmentsForIncreaseDecreaseInTradeAccountPayable",
        "net-cash-from-operating-activities": "ifrs-full:CashFlowsFromUsedInOperations",
        "proceeds-sale-equipment": "ifrs-full:ProceedsFromSalesOfPropertyPlantAndEquipmentClassifiedAsInvestingActivities",
        "purchase-equipment": "ifrs-full:PurchaseOfPropertyPlantAndEquipmentClassifiedAsInvestingActivities",
        "purchase-intangible-assets": "ifrs-full:ProceedsFromSalesOfIntangibleAssetsClassifiedAsInvestingActivities",
        "net-cash-from-investing-activities": "ifrs-full:CashFlowsFromUsedInInvestingActivities",
        "proceeds-from-issuing-shares": "ifrs-full:ProceedsFromIssuingShares",
        "dividends-paid": "ifrs-full:DividendsPaidClassifiedAsFinancingActivities",
        "net-cash-from-financing-activities": "ifrs-full:CashFlowsFromUsedInFinancingActivities",
        "cash-at-start-of-year": "ifrs-full:CashAndCashEquivalents",
        "cash-at-end-of-year": "ifrs-full:CashAndCashEquivalents",
        "net-cash-change": "ifrs-full:IncreaseDecreaseInCashAndCashEquivalents"
    },
    "segment": {}
}
