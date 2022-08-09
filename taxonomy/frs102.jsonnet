{
    "schema": [
        "https://xbrl.frc.org.uk/FRS-102/2021-01-01/FRS-102-2021-01-01.xsd"
    ],
    "namespaces": {
        "uk-bus": "http://xbrl.frc.org.uk/cd/2021-01-01/business",
        "uk-core": "http://xbrl.frc.org.uk/fr/2021-01-01/core",
        "uk-direp": "http://xbrl.frc.org.uk/reports/2021-01-01/direp",
        "uk-geo": "http://xbrl.frc.org.uk/cd/2021-01-01/countries",
        "uk-aurep": "http://xbrl.frc.org.uk/reports/2021-01-01/aurep",
        "uk-accrep": "http://xbrl.frc.org.uk/reports/2021-01-01/accrep"
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
        },
        {
            "id": "industry-sector",
            "from": "report-period",
            "segments": [
                {
                    "industry-sector": "metadata.business.industry-sector"
                }
            ]
        },
        {
            "id": "accounting-standards",
            "from": "report-period",
            "segments": [
                {
                    "accounting-standards": "report.accounting-standards"
                }
            ]
        },
        {
            "id": "accounts-type",
            "from": "report-period",
            "segments": [
                {
                    "accounts-type": "report.accounts-type"
                }
            ]
        },
        {
            "id": "accounts-status",
            "from": "report-period",
            "segments": [
                {
                    "accounts-status": "report.accounts-status"
                }
            ]
        },
        {
            "id": "entity-legal-form",
            "from": "report-period",
            "segments": [
                {
                    "entity-legal-form": "metadata.business.company-formation.form"
                }
            ]
        },
        {
            "id": "entity-legal-country",
            "from": "report-period",
            "segments": [
                {
                    "countries-regions": "metadata.business.company-formation.country"
                }
            ]
        },
        {
            "from": "report-period",
            "id": "officer1",
            "segments": [
                {
                    "officer": "director1"
                }
            ]
        },
        {
            "from": "report-period",
            "id": "officer2",
            "segments": [
                {
                    "officer": "director2"
                }
            ]
        },
        {
            "from": "report-period",
            "id": "officer3",
            "segments": [
                {
                    "officer": "director3"
                }
            ]
        },
        {
            "from": "report-period",
            "id": "officer4",
            "segments": [
                {
                    "officer": "director4"
                }
            ]
        },
        {
            "from": "report-period",
            "id": "officer5",
            "segments": [
                {
                    "officer": "director5"
                }
            ]
        },
        {
            "from": "report-period",
            "id": "officer6",
            "segments": [
                {
                    "officer": "director6"
                }
            ]
        },
        {
            "from": "report-period",
            "id": "officer7",
            "segments": [
                {
                    "officer": "director7"
                }
            ]
        },
        {
            "from": "report-period",
            "id": "officer8",
            "segments": [
                {
                    "officer": "director8"
                }
            ]
        },
        {
            "from": "report-period",
            "id": "officer9",
            "segments": [
                {
                    "officer": "director9"
                }
            ]
        },
        {
            "from": "report-period",
            "id": "officer10",
            "segments": [
                {
                    "officer": "director10"
                }
            ]
        },
        {
            "from": "report-period",
            "id": "officer11",
            "segments": [
                {
                    "officer": "director11"
                }
            ]
        },
        {
            "from": "report-period",
            "id": "officer12",
            "segments": [
                {
                    "officer": "director12"
                }
            ]
        },
        {
            "from": "report-period",
            "id": "officer13",
            "segments": [
                {
                    "officer": "director13"
                }
            ]
        },
        {
            "from": "report-period",
            "id": "officer14",
            "segments": [
                {
                    "officer": "director14"
                }
            ]
        },
        {
            "from": "report-period",
            "id": "officer15",
            "segments": [
                {
                    "officer": "director15"
                }
            ]
        },
        {
            "from": "report-period",
            "id": "officer16",
            "segments": [
                {
                    "officer": "director16"
                }
            ]
        },
        {
            "from": "report-period",
            "id": "officer17",
            "segments": [
                {
                    "officer": "director17"
                }
            ]
        },
        {
            "from": "report-period",
            "id": "officer18",
            "segments": [
                {
                    "officer": "director18"
                }
            ]
        },
        {
            "from": "report-period",
            "id": "officer19",
            "segments": [
                {
                    "officer": "director19"
                }
            ]
        },
        {
            "from": "report-period",
            "id": "officer20",
            "segments": [
                {
                    "officer": "director20"
                }
            ]
        },
        {
            "id": "signing-officer",
            "from": "report-period",
            "segments": [
                {
                    "officer": "metadata.accounting.signing-officer"
                }
            ]
        },
        {
            "id": "directors-report-signing-officer",
            "from": "report-period",
            "segments": [
                {
                    "officer": "metadata.accounting.directors-report-signing-officer"
                }
            ]
        },
        {
            "from": "report-period",
            "id": "contact-country",
            "segments": [
                {
                    "countries-regions": "metadata.business.contact.country"
                }
            ]
        },
        {
            "from": "report-period",
            "id": "phone",
            "segments": [
                {
                    "phone-number-type": "metadata.business.contact.phone.type"
                }
            ]
        },
        {
            "from": "report-period",
            "id": "website",
            "segments": [
                {
                    "countries-regions": "metadata.business.contact.country"
                }
            ]
        }
    ],
    "document-metadata": [
        "report-title",
        "report-date",
        "authorised-date",
        "period-start",
        "period-end",
        "company-name",
        "company-number",
        "vat-registration",
        "software-name",
        "software-version",
        "balance-sheet-date",
        "activities",
        "sic1",
        "sic2",
        "sic3",
        "sic4",
        "industry-sector",
        "is-dormant",
        "trading-status",
        "accounting-standards",
        "accounts-type",
        "accounts-status",
        "entity-legal-form",
        "entity-legal-country",
        "entity-legal-date",
        "average-employees-this",
        "average-employees-previous",
        "officer",
        "signing-officer",
        "contact-name",
        "contact-address1",
        "contact-address2",
        "contact-address3",
        "contact-location",
        "contact-county",
        "contact-postcode",
        "contact-email",
        "contact-phone-country",
        "contact-phone-area",
        "contact-phone-number",
        "website-url",
        "website-description",
        "is-revised",
        "directors-report-consistent-with-revised-accounts"
    ],
    "metadata": [
        {
            "id": "report-title",
            "context": "report-period",
            "config": "report.title"
        },
        {
            "id": "report-date",
            "kind": "date",
            "context": "report-date",
            "config": "metadata.accounting.date"
        },
        {
            "id": "authorised-date",
            "kind": "date",
            "context": "end-of-reporting-period",
            "config": "metadata.accounting.authorised-date"
        },
        {
            "id": "period-start",
            "kind": "date",
            "context": "report-date",
            "config": "metadata.accounting.periods.0.start"
        },
        {
            "id": "period-end",
            "kind": "date",
            "context": "report-date",
            "config": "metadata.accounting.periods.0.end"
        },
        {
            "id": "company-name",
            "context": "report-period",
            "config": "metadata.business.company-name"
        },
        {
            "id": "company-number",
            "context": "report-period",
            "config": "metadata.business.company-number"
        },
        {
            "id": "vat-registration",
            "context": "report-period",
            "config": "metadata.business.vat-registration"
        },
        {
            "id": "software-name",
            "context": "report-period",
            "config": "internal.software-name"
        },
        {
            "id": "software-version",
            "context": "report-period",
            "config": "internal.software-version"
        },
        {
            "id": "balance-sheet-date",
            "kind": "date",
            "context": "end-of-reporting-period",
            "config": "metadata.accounting.balance-sheet-date"
        },
        {
            "id": "activities",
            "context": "report-period",
            "config": "metadata.business.activities"
        },
        {
            "id": "sic1",
            "context": "report-period",
            "config": "metadata.business.sic-codes.0"
        },
        {
            "id": "sic2",
            "context": "report-period",
            "config": "metadata.business.sic-codes.1"
        },
        {
            "id": "sic3",
            "context": "report-period",
            "config": "metadata.business.sic-codes.2"
        },
        {
            "id": "sic4",
            "context": "report-period",
            "config": "metadata.business.sic-codes.3"
        },
        {
            "id": "industry-sector",
            "context": "industry-sector",
            "value": ""
        },
        {
            "id": "is-dormant",
            "context": "report-period",
            "config": "metadata.business.is-dormant",
            "kind": "bool"
        },
        {
            "id": "trading-status",
            "context": "report-period",
            "value": ""
        },
        {
            "id": "accounting-standards",
            "context": "accounting-standards",
            "value": ""
        },
        {
            "id": "accounts-type",
            "context": "accounts-type",
            "value": ""
        },
        {
            "id": "accounts-status",
            "context": "accounts-status",
            "value": ""
        },
        {
            "id": "entity-legal-form",
            "context": "entity-legal-form",
            "value": ""
        },
        {
            "id": "entity-legal-country",
            "context": "entity-legal-country",
            "value": ""
        },
        {
            "id": "entity-legal-date",
            "context": "report-date",
            "config": "metadata.business.company-formation.date",
            "kind": "date"
        },
        {
            "id": "average-employees-this",
            "context": "report-period",
            "config": "metadata.business.average-employees.0",
            "kind": "count"
        },
        {
            "id": "average-employees-previous",
            "context": "previous-period",
            "config": "metadata.business.average-employees.1",
            "kind": "count"
        },
        {
            "id": "officer1",
            "context": "officer1",
            "config": "metadata.business.directors.0"
        },
        {
            "id": "officer2",
            "context": "officer2",
            "config": "metadata.business.directors.1"
        },
        {
            "id": "officer3",
            "context": "officer3",
            "config": "metadata.business.directors.2"
        },
        {
            "id": "officer4",
            "context": "officer4",
            "config": "metadata.business.directors.3"
        },
        {
            "id": "officer5",
            "context": "officer5",
            "config": "metadata.business.directors.4"
        },
        {
            "id": "officer6",
            "context": "officer6",
            "config": "metadata.business.directors.5"
        },
        {
            "id": "officer7",
            "context": "officer7",
            "config": "metadata.business.directors.6"
        },
        {
            "id": "officer8",
            "context": "officer8",
            "config": "metadata.business.directors.7"
        },
        {
            "id": "officer9",
            "context": "officer9",
            "config": "metadata.business.directors.8"
        },
        {
            "id": "officer10",
            "context": "officer10",
            "config": "metadata.business.directors.9"
        },
        {
            "id": "officer11",
            "context": "officer11",
            "config": "metadata.business.directors.10"
        },
        {
            "id": "officer12",
            "context": "officer12",
            "config": "metadata.business.directors.11"
        },
        {
            "id": "officer13",
            "context": "officer13",
            "config": "metadata.business.directors.12"
        },
        {
            "id": "officer14",
            "context": "officer14",
            "config": "metadata.business.directors.13"
        },
        {
            "id": "officer15",
            "context": "officer15",
            "config": "metadata.business.directors.14"
        },
        {
            "id": "officer16",
            "context": "officer16",
            "config": "metadata.business.directors.15"
        },
        {
            "id": "officer17",
            "context": "officer17",
            "config": "metadata.business.directors.16"
        },
        {
            "id": "officer18",
            "context": "officer18",
            "config": "metadata.business.directors.17"
        },
        {
            "id": "officer19",
            "context": "officer19",
            "config": "metadata.business.directors.18"
        },
        {
            "id": "officer20",
            "context": "officer20",
            "config": "metadata.business.directors.19"
        },
        {
            "id": "signing-officer",
            "context": "signing-officer",
            "value": ""
        },
        {
            "id": "signed-by",
            "context": "signing-officer",
            "value": "FIXME"
        },
        {
            "id": "signers-name",
            "context": "report-period",
            "config": "metadata.accounting.signed-by"
        },
        {
            "id": "jurisdiction",
            "context": "report-period",
            "config": "metadata.business.jurisdiction"
        },
        {
            "id": "contact-name",
            "context": "contact-country",
            "config": "metadata.business.contact.name"
        },
        {
            "id": "contact-address1",
            "context": "contact-country",
            "config": "metadata.business.contact.address.0"
        },
        {
            "id": "contact-address2",
            "context": "contact-country",
            "config": "metadata.business.contact.address.1"
        },
        {
            "id": "contact-address3",
            "context": "contact-country",
            "config": "metadata.business.contact.address.2"
        },
        {
            "id": "contact-location",
            "context": "contact-country",
            "config": "metadata.business.contact.location"
        },
        {
            "id": "contact-county",
            "context": "contact-country",
            "config": "metadata.business.contact.county"
        },
        {
            "id": "contact-postcode",
            "context": "contact-country",
            "config": "metadata.business.contact.postcode"
        },
        {
            "id": "contact-email",
            "context": "contact-country",
            "config": "metadata.business.contact.email"
        },
        {
            "id": "contact-phone-country",
            "context": "phone",
            "config": "metadata.business.contact.phone.country"
        },
        {
            "id": "contact-phone-area",
            "context": "phone",
            "config": "metadata.business.contact.phone.area"
        },
        {
            "id": "contact-phone-number",
            "context": "phone",
            "config": "metadata.business.contact.phone.number"
        },
        {
            "id": "website-url",
            "context": "website",
            "config": "metadata.business.website.url"
        },
        {
            "id": "website-description",
            "context": "website",
            "config": "metadata.business.website.description"
        },
        {
            "id": "accountants-report-date",
            "kind": "date",
            "context": "end-of-reporting-period",
            "config": "metadata.accountant.report-date"
        },
        {
            "id": "accountant-name",
            "context": "report-period",
            "config": "metadata.accountant.name"
        },
        {
            "id": "accountant-business",
            "context": "report-period",
            "config": "metadata.accountant.business"
        },
        {
            "id": "accountant-address",
            "context": "report-period",
            "config": "metadata.accountant.address"
        },
        {
            "id": "auditors-report-date",
            "kind": "date",
            "context": "end-of-reporting-period",
            "config": "metadata.auditor.report-date"
        },
        {
            "id": "auditor-name",
            "context": "report-period",
            "config": "metadata.auditor.name"
        },
        {
            "id": "auditor-business",
            "context": "report-period",
            "config": "metadata.auditor.business"
        },
        {
            "id": "auditor-address",
            "context": "report-period",
            "config": "metadata.auditor.address"
        },
        {
            "id": "directors-report-date",
            "kind": "date",
            "context": "end-of-reporting-period",
            "config": "metadata.directors.report-date"
        },
        {
            "id": "directors-report-signing-officer",
            "context": "directors-report-signing-officer",
            "value": ""
        },
        {
            "id": "is-revised",
            "kind": "bool",
            "context": "report-period",
            "config": "metadata.accounting.is-revised"
        },
        {
            "id": "revised-auditors-report-date",
            "kind": "date",
            "context": "end-of-reporting-period",
            "config": "metadata.auditor.revised-report-date"
        },
        {
            "id": "directors-report-consistent-with-revised-accounts",
            "kind": "bool",
            "context": "report-period",
            "config": "metadata.auditor.directors-report-consistent-revised-accounts"
        }
    ],
    "note-templates": {
        "company": "expand:The company is a private company limited by shares and is registered in England and Wales number ~[company-number]. The registered address is: ~[contact-address1::, ] ~[contact-address2::, ] ~[contact-address3::, ] ~[contact-location:: ] ~[contact-postcode].",
        "directors-acknowledge": "expand:~{directors-duty=The directors acknowledge their responsibilities for complying with the requirements of the Act with respect to accounting records and the preparation of financial statements.}",
        "micro-entity-provisions": "expand:~{accounts-prepared-small-company-regime=These financial statements have been prepared in accordance with the micro-entity provisions and delivered in accordance with the provisions applicable under the small companies regime.}",
        "micro-entity-pl-provisions": "expand:~{accounts-prepared-small-company-regime= These financial statements have been prepared in accordance with the micro-entity provisions.}",
        "small-company-provisions": "expand:~{accounts-prepared-small-company-regime= These accounts have been prepared in accordance with the provisions applicable to companies subject to the small companies regime.}",
        "members-agreed-abridged-accounts": "expand:~{members-agreed-abridged-accounts= All of the members of ~[company-name] have consented to the preparation of the Abridged Statement of Financial Position and the Abridged Income Statement for the year ended ~[period-end] in accordance with Section 444(2A) of the Companies Act 2006.}",
        "no-audit-required": "expand:~{members-not-required-audit=The members have not required the company to obtain an audit of its financial statements for the accounting period in accordance with section 476.}",
        "small-company-audit-exempt": "expand:~{small-company-exempt-from-audit=For the accounting period ending ~[period-end] the company was entitled to exemption from audit under section 477 of the Companies Act 2006 relating to small companies.}",
        "software-version": "expand:These accounts were generated using ~[software-name] version ~[software-version]."
    },
    "sign-reversed": {
        "accruals-and-deferred-income": true,
        "administrative-expenses": true,
        "corporation-tax-owed": true,
        "cost-of-sales": true,
        "creditors-after-1-year": true,
        "creditors-within-1-year": true,
        "other-creditors": true,
        "prepayments-and-accrued-income": true,
        "provisions-for-liabilities": true,
        "trade-creditors": true,
        "depreciation-charge": true,
        "depreciation-total": true,
        "depreciation-adjustment": true
    },
    "tags": {
        "accounting-standards": "uk-bus:AccountingStandardsApplied",
        "accounts-status": "uk-bus:AccountsStatusAuditedOrUnaudited",
        "accounts-type": "uk-bus:AccountsTypeFullOrAbbreviated",
        "accruals-and-deferred-income": "uk-core:AccruedLiabilitiesDeferredIncome",
        "activities": "uk-bus:DescriptionPrincipalActivities",
        "administrative-expenses": "uk-core:AdministrativeExpenses",
        "authorised-date": "uk-core:DateAuthorisationFinancialStatementsForIssue",
        "average-employees-this": "uk-core:AverageNumberEmployeesDuringPeriod",
        "average-employees-previous": "uk-core:AverageNumberEmployeesDuringPeriod",
        "balance-sheet-date": "uk-bus:BalanceSheetDate",
        "bank": "uk-core:CashBankOnHand",
        "carrying-final": "uk-core:PropertyPlantEquipmentIncludingRight-of-useAssets",
        "company-name": "uk-bus:EntityCurrentLegalOrRegisteredName",
        "company-number": "uk-bus:UKCompaniesHouseRegisteredNumber",
        "contact-address1": "uk-bus:AddressLine1",
        "contact-address2": "uk-bus:AddressLine2",
        "contact-address3": "uk-bus:AddressLine3",
        "contact-county": "uk-bus:CountyRegion",
        "contact-email": "uk-bus:E-mailAddress",
        "contact-location": "uk-bus:PrincipalLocation-CityOrTown",
        "contact-name": "uk-bus:NameContactDepartmentOrPerson",
        "contact-phone-area": "uk-bus:AreaCode",
        "contact-phone-country": "uk-bus:CountryCode",
        "contact-phone-number": "uk-bus:LocalNumber",
        "contact-postcode": "uk-bus:PostalCodeZip",
        "corporation-tax-owed": "uk-core:TaxationIncludingDeferredTaxationBalanceSheetSubtotal",
        "cost-of-sales": "uk-core:CostSales",
        "creditors-after-1-year": "uk-core:Creditors",
        "creditors-within-1-year": "uk-core:Creditors",
        "current-assets": "uk-core:CurrentAssets",
        "debtors": "uk-core:TradeDebtorsTradeReceivables",
        "depreciation": "uk-core:DepreciationAmortisationImpairmentExpense",
        "depreciation-total": "uk-core:AccumulatedDepreciationImpairmentPropertyPlantEquipment",
        "depreciation-charge": "uk-core:IncreaseFromDepreciationChargeForYearPropertyPlantEquipment",
        "entity-legal-country": "uk-bus:CountryFormationOrIncorporation",
        "entity-legal-date": "uk-bus:DateFormationOrIncorporation",
        "entity-legal-form": "uk-bus:LegalFormEntity",
        "fixed-assets": "uk-core:FixedAssets",
        "fixed-assets-additions": "uk-core:IncreaseDecreaseInPropertyPlantEquipment",
        "fixed-assets-total": "uk-core:PropertyPlantEquipmentGrossCost",
        "gross-profit": "uk-core:GrossProfitLoss",
        "industry-sector": "uk-bus:MainIndustrySector",
        "is-dormant": "uk-bus:EntityDormantTruefalse",
        "members-agreed-abridged-accounts": "uk-direp:StatementThatMembersHaveAgreedToPreparationAbridgedAccountsUnderSection444CompaniesAct2006",
        "net-assets": "uk-core:NetAssetsLiabilities",
        "net-current-assets": "uk-core:NetCurrentAssetsLiabilities",
        "other-creditors": "uk-core:OtherCreditorsIncludingTaxationSocialSecurityBalanceSheetSubtotal",
        "other-operating-income": "uk-core:OtherOperatingIncomeFormat2",
        "other-charges": "uk-core:OtherOperatingExpensesFormat2",
        "raw-materials-consumables": "uk-core:RawMaterialsConsumablesUsed",
        "period-end": "uk-bus:EndDateForPeriodCoveredByReport",
        "period-start": "uk-bus:StartDateForPeriodCoveredByReport",
        "prepayments-and-accrued-income": "uk-core:PrepaymentsAccruedIncomeNotExpressedWithinCurrentAssetSubtotal",
        "profit": "uk-core:ProfitLoss",
        "provisions-for-liabilities": "uk-core:ProvisionsForLiabilitiesBalanceSheetSubtotal",
        "report-date": "uk-bus:BusinessReportPublicationDate",
        "report-title": "uk-bus:ReportTitle",
        "sic1": "uk-bus:SICCodeRecordedUKCompaniesHouse1",
        "sic2": "uk-bus:SICCodeRecordedUKCompaniesHouse2",
        "sic3": "uk-bus:SICCodeRecordedUKCompaniesHouse3",
        "sic4": "uk-bus:SICCodeRecordedUKCompaniesHouse4",
        "signing-officer": "uk-core:DirectorSigningFinancialStatements",
        "directors-report-signing-officer": "uk-direp:DirectorSigningDirectorsReport",
        "software-name": "uk-bus:NameProductionSoftware",
        "software-version": "uk-bus:VersionProductionSoftware",
        "staff-costs": "uk-core:StaffCostsEmployeeBenefitsExpense",
        "tangible-assets": "uk-core:PropertyPlantEquipmentIncludingRight-of-useAssets",
        "tax": "uk-core:TaxTaxCreditOnProfitOrLossOnOrdinaryActivities",
        "total-assets-less-liabilities": "uk-core:TotalAssetsLessCurrentLiabilities",
        "total-capital-and-reserves": "uk-core:Equity",
        "trade-creditors": "uk-core:TradeCreditorsTradePayables",
        "trading-status": "uk-bus:EntityTradingStatus",
        "turnover": "uk-core:TurnoverRevenue",
        "vat-refund-owed": "uk-core:DeferredTaxAssetDebtors",
        "vat-registration": "uk-bus:VATRegistrationNumber",
        "website-description": "uk-bus:DescriptionOrOtherInformationOnWebsite",
        "website-url": "uk-bus:WebsiteMainPageURL",
        "statement-on-respective-responsibilities": "uk-aurep:StatementOnRespectiveResponsibilitiesDirectorsAuditors",
        "opinion-of-auditors-on-entity": "uk-aurep:OpinionAuditorsOnEntity",
        "basis-for-opinion-auditors": "uk-aurep:BasisForOpinionAuditorsOnEntity",
        "opinion-of-auditors-additional-financial-reporting": "uk-aurep:OpinionAuditorsInRespectAdditionalFinancialReportingFramework",
        "emphasis-of-matter": "uk-aurep:EmphasisMatterStatement",
        "statement-on-risks-of-misstatement": "uk-aurep:StatementOnRisksMaterialMisstatementIdentifiedByAuditor",
        "statement-on-application-of-materiality": "uk-aurep:StatementOnApplicationMaterialityToAudit",
        "statement-on-audit-scope": "uk-aurep:StatementOnScopeAuditReport",
        "statement-on-matters-on-which-auditor-reports": "uk-aurep:StatementOnMattersOnWhichAuditorReportsByException",
        "statement-of-key-audit-matters": "uk-aurep:StatementKeyAuditMatters",
        "statement-of-responsibilities-of-management-corporate-governance": "uk-aurep:StatementResponsibilitiesManagementThoseChargedWithCorporateGovernance",
        "statement-of-auditors-responsibilities": "uk-aurep:StatementAuditorsResponsibilitiesRelatingToOtherInformation",
        "company-is-entitled-to-deliver-abbreviated-accounts": "uk-aurep:CompanyEntitledToDeliverAbbreviatedAccountsAccountsProperlyPreparedTruefalse",
        "matters-giving-rise-to-any-modified-audit": "uk-aurep:DescriptionMattersGivingRiseToAnyModifiedAuditOpinion",
        "directors-report-is-consistent": "uk-aurep:DirectorsReportConsistentWithAccountsTruefalse",
        "remuneration-report-properly-prepared": "uk-aurep:AuditablePartRemunerationReportHasBeenProperlyPreparedTruefalse",
        "date-of-auditors-report": "uk-aurep:DateAuditorsReport",
        "statement-on-scope-of-accountants-report": "uk-accrep:StatementOnScopeAccountantsReport",
        "accountants-report-on-financial-statements": "uk-accrep:AccountantsReportOnFinancialStatements",
        "accountants-report-date": "uk-accrep:DateAccountantsReport",
        "accountant-business": "uk-bus:NameEntityAccountants",
        "accountant-name": "uk-accrep:NameAccountantResponsible",
        "accountant-address": "uk-accrep:NameOrLocationAccountantsOffice",
        "auditors-report-date": "uk-aurep:DateAuditorsReport",
        "auditor-business": "uk-bus:NameEntityAuditors",
        "auditor-name": "uk-aurep:NameIndividualAuditor",
        "auditor-address": "uk-aurep:NameOrLocationOfficePerformingAudit",
        "description-of-principal-activities": "uk-bus:DescriptionPrincipalActivities",
        "officer1": "uk-bus:NameEntityOfficer",
        "officer2": "uk-bus:NameEntityOfficer",
        "officer3": "uk-bus:NameEntityOfficer",
        "officer4": "uk-bus:NameEntityOfficer",
        "officer5": "uk-bus:NameEntityOfficer",
        "officer6": "uk-bus:NameEntityOfficer",
        "officer7": "uk-bus:NameEntityOfficer",
        "officer8": "uk-bus:NameEntityOfficer",
        "officer9": "uk-bus:NameEntityOfficer",
        "officer10": "uk-bus:NameEntityOfficer",
        "officer11": "uk-bus:NameEntityOfficer",
        "officer12": "uk-bus:NameEntityOfficer",
        "officer13": "uk-bus:NameEntityOfficer",
        "officer14": "uk-bus:NameEntityOfficer",
        "officer15": "uk-bus:NameEntityOfficer",
        "officer16": "uk-bus:NameEntityOfficer",
        "officer17": "uk-bus:NameEntityOfficer",
        "officer18": "uk-bus:NameEntityOfficer",
        "officer19": "uk-bus:NameEntityOfficer",
        "officer20": "uk-bus:NameEntityOfficer",
        "dividend-recommended-by-directors": "uk-direp:DividendRecommendedByDirectors",
        "directors-duty": "uk-direp:StatementThatDirectorsAcknowledgeTheirResponsibilitiesUnderCompaniesAct",
        "accounts-prepared-small-company-regime": "uk-direp:StatementThatAccountsHaveBeenPreparedInAccordanceWithProvisionsSmallCompaniesRegime",
        "directors-report-small-company-regime": "uk-direp:StatementThatDirectorsReportHasBeenPreparedInAccordanceWithProvisionsSmallCompaniesRegime",
        "abbreviated-accounts-in-accordance-special-provisions": "uk-direp:AbbreviatedAccountsAreInAccordanceWithSpecialProvisionsInSection4453CompaniesActRelatingToMedium",
        "entity-has-taken-exemption-not-publishing-profit-and-loss": "uk-direp:EntityHasTakenExemptionUnderCompaniesActInNotPublishingItsOwnProfitLossAccountTruefalse",
        "statement-on-information-provided-auditors": "uk-direp:StatementOnQualityCompletenessInformationProvidedToAuditors",
        "statement-qualifying-third-party-indemnity": "uk-direp:StatementOnQualifyingThirdPartyIndemnityProvisions",
        "statement-on matters-required-in-directors-report": "uk-direp:StatementOnMattersRequiredInDirectorsReportBeingPlacedInStrategicReport",
        "small-company-exempt-from-audit": "uk-direp:StatementThatCompanyEntitledToExemptionFromAuditUnderSection477CompaniesAct2006RelatingToSmallCompanies",
        "members-not-required-audit": "uk-direp:StatementThatMembersHaveNotRequiredCompanyToObtainAnAudit",
        "directors-report-date": "uk-direp:DateSigningDirectorsReport",
        "description-of-body-authorising-financial-statements": "uk-core:DescriptionBodyAuthorisingFinancialStatements",
        "statement-of-compliance-reporting-framework": "uk-core:StatementComplianceWithApplicableReportingFramework",
        "description-of-basis-used-in-financial-statements": "uk-core:GeneralDescriptionBasisMeasurementUsedInPreparingFinancialStatements",
        "financial-statements-going-concern-basis": "uk-core:FinancialStatementsArePreparedOnGoing",
        "description-why-entity-not-going-concern": "uk-core:DescriptionWhyEntityNotGoing-concernOrUncertaintiesOverGoing-concernStatus",
        "revenue-recognition-policy": "uk-core:RevenueRecognitionPolicy",
        "description-of-measurement-property-plant-equipment": "uk-core:DescriptionMeasurementBasisForPropertyPlantEquipment",
        "description-of-depreciation-method-property-plant-equipment": "uk-core:DescriptionDepreciationMethodForPropertyPlantEquipment",
        "description-recognition-basis-intangible-assets": "uk-core:DescriptionRecognitionBasisMeasurementIntangibleAssets",
        "lessee-operating-lease-policy": "uk-core:LesseeOperatingLeasePolicy",
        "current-income-tax-policy": "uk-core:CurrentIncomeTaxPolicy",
        "deferred-tax-policy": "uk-core:DeferredTaxPolicy",
        "defined-contribution-pensions-policy": "uk-core:DefinedContributionPensionsPolicy",
        "cash-and-cash-equivalents-policy": "uk-core:CashCashEquivalentsPolicy",
        "finance-income-and-costs-policy": "uk-core:FinanceIncomeCostsPolicy",
        "interest-income": "uk-core:InterestIncome",
        "interest-expense": "uk-core:InterestExpense",
        "nominal-value-of-shares-issued-in-the-period": "uk-core:NominalValueSharesIssuedInPeriod",
        "shares-issued": "uk-core:NominalValueSharesIssuedInPeriod",
        "equity": "uk-core:Equity",
        "share-capital": "uk-core:Equity",
        "nominal-value-of-allotted-share-capital": "uk-core:NominalValueAllottedShareCapital",
        "is-revised": "uk-bus:ReportAnAmendedRevisedVersionPreviouslyFiledReportTruefalse",
        "supplementary-note": "uk-bus:SupplementaryNote",
        "opinion-of-auditors-on-revised-accounts": "uk-aurep:OpinionAuditorsOnRevisedAccounts",
        "opinion-of-auditors-failure-to-comply-companies-act": "uk-aurep:OpinionAuditorsOnFailureOriginalAccountsToComplyWithCompaniesAct2006",
        "directors-report-consistent-with-revised-accounts": "uk-aurep:DirectorsReportConsistentWithRevisedAccountsTruefalse",
        "revised-auditors-report-date": "uk-aurep:DateAuditorsReportOnRevisedAccounts",
        "proceeds-from-issuing-shares": "uk-core:ProceedsFromIssuingShares",
        "dividends-paid": "uk-core:DividendsPaidClassifiedAsFinancingActivities",
        "corporation-tax-paid": "uk-core:IncomeTaxesPaidRefundClassifiedAsOperatingActivities",
        "net-cash-from-operating-activities": "uk-core:NetCashGeneratedFromOperations",
        "cash-at-end-of-year": "uk-core:CashCashEquivalentsCashFlowValue",
        "trade-and-other-receivables": "uk-core:GainLossInCashFlowsFromChangeInTradeDebtorsTradeReceivables",
        "trade-payables": "uk-core:GainLossInCashFlowsFromChangeInTradeCreditorsTradePayables",
        "inventories": "uk-core:GainLossInCashFlowsFromChangeInInventories",
        "proceeds-sale-equipment": "uk-core:ProceedsFromSalesPropertyPlantEquipment",
        "purchase-equipment": "uk-core:PurchasePropertyPlantEquipment",
        "purchase-intangible-assets": "uk-core:PurchaseIntangibleAssets",
        "interest-received": "uk-core:InterestReceivedClassifiedAsInvestingActivities",
        "net-cash-from-investing-activities": "uk-core:NetCashFlowsFromUsedInInvestingActivities",
        "interest-paid": "uk-core:InterestPaidClassifiedAsFinancingActivities",
        "purchase-of-non-controlling-interest": "uk-core:CashFlowsUsedInPurchaseNon-controllingInterests",
        "net-cash-from-financing-activities": "uk-core:NetCashFlowsFromUsedInFinancingActivities",
        "cash-inflow": "uk-core:NetCashInflowOutflowFromOperationsBeforeMovementsInWorkingCapital",
        "depreciation-adjustment": "uk-core:DepreciationAmortisationImpairmentExpense"
    },
    "segment": {
        "accounting-standards": {
            "dimension": "uk-bus:AccountingStandardsDimension",
            "map": {
                "frs101": "uk-bus:FRS101",
                "frs102": "uk-bus:FRS102",
                "frsse": "uk-bus:FRSSE",
                "full-irs": "uk-bus:FullIFRS",
                "micro-entities": "uk-bus:Micro-entities",
                "other-standards": "uk-bus:OtherStandards",
                "small-entities-regime": "uk-bus:SmallEntities"
            }
        },
        "accounts-status": {
            "dimension": "uk-bus:AccountsStatusDimension",
            "map": {
                "audit-exempt-no-accountants-report": "uk-bus:AuditExempt-NoAccountantsReport",
                "audit-exempt-with-accountants-report": "uk-bus:AuditExemptWithAccountantsReport",
                "audited": "uk-bus:Audited",
                "independent-examination": "uk-bus:IndependentExaminationCharity",
                "other-reporting-regime": "uk-bus:OtherReportingRegime"
            }
        },
        "accounts-type": {
            "dimension": "uk-bus:AccountsTypeDimension",
            "map": {
                "abbreviated-accounts": "uk-bus:AbbreviatedAccounts",
                "abridged-accounts": "uk-bus:AbridgedAccounts",
                "full-accounts": "uk-bus:FullAccounts"
            }
        },
        "countries-regions": {
            "dimension": "uk-geo:CountriesRegionsDimension",
            "map": {
                "UK": "uk-geo:UnitedKingdom",
                "england-and-wales": "uk-geo:EnglandWales"
            }
        },
        "entity-legal-form": {
            "dimension": "uk-bus:LegalFormEntityDimension",
            "map": {
                "branch-trading-in-uk": "uk-bus:BranchTradingInUK",
                "community-interest-company": "uk-bus:CommunityInterestCompanyCIC",
                "company-limited-by-guarantee": "uk-bus:CompanyLimitedByGuarantee",
                "friendly-society": "uk-bus:FriendlySociety",
                "incorporated-by-act-of-parliament": "uk-bus:IncorporatedByActParliament",
                "incorporated-by-royal-charter": "uk-bus:IncorporatedByRoyalCharter",
                "industrial-and-provident-society": "uk-bus:IndustrialProvidentSociety",
                "limited-liability-partnership": "uk-bus:LimitedLiabilityPartnershipLLP",
                "other-incorporated-association": "uk-bus:OtherIncorporatedAssociation",
                "other-non-uk": "uk-bus:OtherNon-UK",
                "other-uk": "uk-bus:OtherUK",
                "private-limited-company": "uk-bus:PrivateLimitedCompanyLtd",
                "public-limited-company-not-quoted": "uk-bus:PublicLimitedCompanyPLCNotQuotedOnAnyExchange",
                "public-limited-company-plc": "uk-bus:PublicLimitedCompanyPLC",
                "registered-charity": "uk-bus:RegisteredCharity",
                "scottish-partnership": "uk-bus:ScottishPartnership",
                "unlimited-company": "uk-bus:UnlimitedCompany"
            }
        },
        "industry-sector": {
            "dimension": "uk-bus:MainIndustrySectorDimension",
            "map": {
                "a": "uk-bus:A-AgricultureForestryFishing",
                "b": "uk-bus:B-MiningQuarrying",
                "c": "uk-bus:C-Manufacturing",
                "d": "uk-bus:D-ElectricityGasSteamAirConditioningSupply",
                "e": "uk-bus:E-WaterSupplySewerageWasteManagementRemediationActivities",
                "f": "uk-bus:F-Construction",
                "g": "uk-bus:G-WholesaleRetailTradeRepairMotorVehiclesMotorcycles",
                "h": "uk-bus:H-TransportationStorage",
                "i": "uk-bus:I-AccommodationFoodServiceActivities",
                "j": "uk-bus:J-InformationCommunication",
                "k": "uk-bus:K-FinancialInsuranceActivities",
                "l": "uk-bus:L-RealEstateActivities",
                "m": "uk-bus:M-ProfessionalScientificTechnicalActivities",
                "n": "uk-bus:N-AdministrativeSupportServiceActivities",
                "o": "uk-bus:O-PublicAdministrationDefenceCompulsorySocialSecurity",
                "p": "uk-bus:P-Education",
                "q": "uk-bus:Q-HumanHealthSocialWorkActivities",
                "r": "uk-bus:R-ArtsEntertainmentRecreation",
                "s": "uk-bus:S-OtherServiceActivities"
            }
        },
        "matures": {
            "dimension": "uk-core:MaturitiesOrExpirationPeriodsDimension",
            "map": {
                "after-1-year": "uk-core:AfterOneYear",
                "within-1-year": "uk-core:WithinOneYear"
            }
        },
        "officer": {
            "dimension": "uk-bus:EntityOfficersDimension",
            "map": {
                "director1": "uk-bus:Director1",
                "director10": "uk-bus:Director10",
                "director2": "uk-bus:Director2",
                "director3": "uk-bus:Director3",
                "director4": "uk-bus:Director4",
                "director5": "uk-bus:Director5",
                "director6": "uk-bus:Director6",
                "director7": "uk-bus:Director7",
                "director8": "uk-bus:Director8",
                "director9": "uk-bus:Director9"
            }
        },
        "phone-number-type": {
            "dimension": "uk-bus:PhoneNumberTypeDimension",
            "map": {
                "fax": "uk-bus:Fax",
                "landline": "uk-bus:Landline",
                "mobile": "uk-bus:Mobile"
            }
        },
        "equity": {
            "dimension": "uk-core:EquityClassesDimension",
            "map": {
                "ordinary-shares": "uk-core:ShareCapitalOrdinaryShares",
                "preference-shares": "uk-core:ShareCapitalPreferenceShares"
            }
        }
    }
}
