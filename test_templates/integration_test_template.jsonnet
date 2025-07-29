// Template for integration testing complete templates (example-*/)
// Tests full workflow from template to final configuration

local test = import "jsonnetunit/test.libsonnet";
local config = import "TEMPLATE_PATH_HERE/TEMPLATE_NAME.jsonnet";

test.suite({
    // Basic configuration generation
    testConfigGenerates: {
        actual: std.type(config),
        expect: "object"
    },

    // Test required top-level structure
    testRequiredTopLevelFields: {
        actual: std.objectHas(config, 'metadata') &&
                std.objectHas(config, 'report') &&
                std.objectHas(config, 'accounts'),
        expect: true
    },

    // Test metadata completeness
    testMetadataComplete: {
        actual: std.objectHas(config.metadata, 'business') &&
                std.objectHas(config.metadata, 'accounting'),
        expect: true
    },

    // Test business metadata
    testBusinessMetadata: {
        local business = config.metadata.business,
        actual: std.objectHas(business, 'company-name') &&
                std.objectHas(business, 'company-number'),
        expect: true
    },

    // Test accounting metadata  
    testAccountingMetadata: {
        local accounting = config.metadata.accounting,
        actual: std.objectHas(accounting, 'balance-sheet-date') &&
                std.objectHas(accounting, 'currency') &&
                std.objectHas(accounting, 'periods'),
        expect: true
    },

    // Test accounting periods structure
    testAccountingPeriods: {
        local periods = config.metadata.accounting.periods,
        actual: std.type(periods) == "array" &&
                std.length(periods) > 0 &&
                std.all([
                    std.objectHas(p, 'name') &&
                    std.objectHas(p, 'start') &&
                    std.objectHas(p, 'end')
                    for p in periods
                ]),
        expect: true
    },

    // Test date logic (balance sheet date <= authorized date)
    testDateLogic: {
        local accounting = config.metadata.accounting,
        local balance_date = accounting["balance-sheet-date"],
        local auth_date = accounting["authorised-date"],
        actual: balance_date <= auth_date,
        expect: true
    },

    // Test report structure
    testReportStructure: {
        actual: std.objectHas(config.report, 'computations') &&
                std.type(config.report.computations) == "array",
        expect: true
    },

    // Test computations exist
    testComputationsExist: {
        actual: std.length(config.report.computations) > 0,
        expect: true
    },

    // Test accounts configuration
    testAccountsConfig: {
        local accounts = config.accounts,
        actual: std.objectHas(accounts, 'file') &&
                std.objectHas(accounts, 'kind'),
        expect: true
    },

    // Test accounts file type is valid
    testAccountsKind: {
        local kind = config.accounts.kind,
        actual: kind == 'gnucash' || kind == 'piecash',
        expect: true
    },

    // Business logic: Test that we have key financial statement components
    testFinancialStatementComponents: {
        local comp_ids = [comp.id for comp in config.report.computations],
        local has_assets = std.any([std.startsWith(id, 'asset') || std.endsWith(id, 'assets') for id in comp_ids]),
        local has_liabilities = std.any([std.startsWith(id, 'liability') || std.endsWith(id, 'liabilities') for id in comp_ids]),
        actual: has_assets && has_liabilities,
        expect: true
    },

    // Test computation ID uniqueness
    testComputationIdUniqueness: {
        local ids = [comp.id for comp in config.report.computations],
        local unique_ids = std.set(ids),
        actual: std.length(ids) == std.length(unique_ids),
        expect: true
    },

    // Test that all computation references are valid
    testComputationReferences: {
        local all_ids = std.set([comp.id for comp in config.report.computations]),
        local group_comps = std.filter(function(c) c.kind == 'group' || c.kind == 'sum', config.report.computations),
        local all_inputs = std.flattenArrays([
            if std.objectHas(c, 'inputs') then c.inputs else []
            for c in group_comps
        ]),
        local refs_valid = std.all([std.member(input, all_ids) for input in all_inputs]),
        actual: refs_valid,
        expect: true
    }
})