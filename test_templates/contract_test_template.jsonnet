// Template for contract testing (ixbrl-reporter schema compliance)
// Ensures output matches what downstream tools expect

local test = import "jsonnetunit/test.libsonnet";
local config = import "TEMPLATE_PATH_HERE";

test.suite({
    // Test ixbrl-reporter required top-level structure
    testIxbrlReporterSchema: {
        actual: std.objectHas(config, 'metadata') &&
                std.objectHas(config, 'report') &&
                std.objectHas(config, 'accounts'),
        expect: true
    },

    // Test metadata schema compliance
    testMetadataSchema: {
        local meta = config.metadata,
        actual: std.objectHas(meta, 'business') &&
                std.objectHas(meta, 'accounting') &&
                std.type(meta.business) == "object" &&
                std.type(meta.accounting) == "object",
        expect: true
    },

    // Test business information schema
    testBusinessInfoSchema: {
        local business = config.metadata.business,
        actual: std.objectHas(business, 'company-name') &&
                std.objectHas(business, 'company-number') &&
                std.type(business['company-name']) == "string" &&
                std.type(business['company-number']) == "string",
        expect: true
    },

    // Test accounting information schema
    testAccountingInfoSchema: {
        local accounting = config.metadata.accounting,
        actual: std.objectHas(accounting, 'balance-sheet-date') &&
                std.objectHas(accounting, 'currency') &&
                std.objectHas(accounting, 'periods') &&
                std.type(accounting['balance-sheet-date']) == "string" &&
                std.type(accounting.currency) == "string" &&
                std.type(accounting.periods) == "array",
        expect: true
    },

    // Test period schema compliance
    testPeriodSchema: {
        local periods = config.metadata.accounting.periods,
        local first_period = periods[0],
        actual: std.objectHas(first_period, 'name') &&
                std.objectHas(first_period, 'start') &&
                std.objectHas(first_period, 'end') &&
                std.type(first_period.name) == "string" &&
                std.type(first_period.start) == "string" &&
                std.type(first_period.end) == "string",
        expect: true
    },

    // Test report schema compliance
    testReportSchema: {
        local report = config.report,
        actual: std.objectHas(report, 'computations') &&
                std.type(report.computations) == "array",
        expect: true
    },

    // Test computation schema compliance
    testComputationSchema: {
        local computations = config.report.computations,
        local first_comp = computations[0],
        actual: std.objectHas(first_comp, 'id') &&
                std.objectHas(first_comp, 'description') &&
                std.objectHas(first_comp, 'kind') &&
                std.type(first_comp.id) == "string" &&
                std.type(first_comp.description) == "string" &&
                std.type(first_comp.kind) == "string",
        expect: true
    },

    // Test computation kinds are valid ixbrl-reporter values
    testComputationKindsValid: {
        local kinds = std.set([comp.kind for comp in config.report.computations]),
        local valid_kinds = ['line', 'group', 'sum'],
        local all_valid = std.all([std.member(kind, valid_kinds) for kind in kinds]),
        actual: all_valid,
        expect: true
    },

    // Test accounts schema compliance
    testAccountsSchema: {
        local accounts = config.accounts,
        actual: std.objectHas(accounts, 'file') &&
                std.objectHas(accounts, 'kind') &&
                std.type(accounts.file) == "string" &&
                std.type(accounts.kind) == "string",
        expect: true
    },

    // Test accounts kind is valid ixbrl-reporter value
    testAccountsKindValid: {
        local kind = config.accounts.kind,
        actual: kind == 'gnucash' || kind == 'piecash',
        expect: true
    },

    // Test line computations have required accounts field
    testLineComputationsHaveAccounts: {
        local line_comps = std.filter(function(c) c.kind == 'line', config.report.computations),
        local all_have_accounts = std.all([
            std.objectHas(c, 'accounts') && std.type(c.accounts) == "array"
            for c in line_comps
        ]),
        actual: all_have_accounts,
        expect: true
    },

    // Test group/sum computations have required inputs field
    testGroupComputationsHaveInputs: {
        local group_comps = std.filter(function(c) c.kind == 'group' || c.kind == 'sum', config.report.computations),
        local all_have_inputs = std.all([
            std.objectHas(c, 'inputs') && std.type(c.inputs) == "array"
            for c in group_comps
        ]),
        actual: all_have_inputs,
        expect: true
    },

    // Test period values are valid ixbrl-reporter values
    testPeriodValuesValid: {
        local periods = std.set([
            if std.objectHas(comp, 'period') then comp.period else 'at-end'
            for comp in config.report.computations
        ]),
        local valid_periods = ['at-start', 'at-end', 'in-year'],
        local all_valid = std.all([std.member(period, valid_periods) for period in periods]),
        actual: all_valid,
        expect: true
    },

    // Test currency is valid ISO code format
    testCurrencyFormat: {
        local currency = config.metadata.accounting.currency,
        actual: std.length(currency) == 3 && std.asciiUpper(currency) == currency,
        expect: true
    },

    // Test date format compliance (YYYY-MM-DD)
    testDateFormat: {
        local balance_date = config.metadata.accounting["balance-sheet-date"],
        // Simple regex-like check for YYYY-MM-DD format
        actual: std.length(balance_date) == 10 && 
                std.substr(balance_date, 4, 1) == "-" &&
                std.substr(balance_date, 7, 1) == "-",
        expect: true
    }
})