local test = import "jsonnetunit/test.libsonnet";
local config = import "example-accts/example-accts.jsonnet";

test.suite({
    // Test that the configuration generates successfully
    testConfigIsObject: {
        actual: std.type(config),
        expect: "object"
    },

    // Test that required top-level fields exist
    testHasMetadata: {
        actual: std.objectHas(config, 'metadata'),
        expect: true
    },

    testHasReport: {
        actual: std.objectHas(config, 'report'),
        expect: true
    },

    testHasAccounts: {
        actual: std.objectHas(config, 'accounts'),
        expect: true
    },

    // Test metadata structure
    testCompanyName: {
        actual: config.metadata.business["company-name"],
        expect: "Example Biz Ltd."
    },

    testCompanyNumber: {
        actual: config.metadata.business["company-number"],
        expect: "12345678"
    },

    // Test accounting dates are logical
    testAccountingDatesValid: {
        local balance_date = config.metadata.accounting["balance-sheet-date"],
        local auth_date = config.metadata.accounting["authorised-date"],
        actual: balance_date <= auth_date,
        expect: true
    },

    // Test that we have accounting periods
    testHasAccountingPeriods: {
        actual: std.length(config.metadata.accounting.periods) > 0,
        expect: true
    },

    // Test that the report has computations
    testReportHasComputations: {
        actual: std.objectHas(config.report, 'computations'),
        expect: true
    },

    testComputationsNotEmpty: {
        actual: std.length(config.report.computations) > 0,
        expect: true
    },

    // Test accounts configuration
    testAccountsFile: {
        actual: config.accounts.file,
        expect: "example2.gnucash"
    },

    testAccountsKind: {
        actual: config.accounts.kind,
        expect: "gnucash"
    }
})