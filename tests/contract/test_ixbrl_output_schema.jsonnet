local test = import "jsonnetunit/test.libsonnet";
local config = import "example-accts/example-accts.jsonnet";

// Contract test: Verify that generated config conforms to ixbrl-reporter's expected schema
test.suite({
    // Test top-level required fields for ixbrl-reporter
    testHasRequiredTopLevelFields: {
        actual: std.objectHas(config, 'metadata') && 
                std.objectHas(config, 'report') && 
                std.objectHas(config, 'accounts'),
        expect: true
    },

    // Test metadata contains required business information
    testMetadataHasBusinessInfo: {
        actual: std.objectHas(config.metadata, 'business') &&
                std.objectHas(config.metadata.business, 'company-name') &&
                std.objectHas(config.metadata.business, 'company-number'),
        expect: true
    },

    // Test accounting metadata has required fields
    testAccountingMetadata: {
        actual: std.objectHas(config.metadata, 'accounting') &&
                std.objectHas(config.metadata.accounting, 'balance-sheet-date') &&
                std.objectHas(config.metadata.accounting, 'currency'),
        expect: true
    },

    // Test report has computations array (required by ixbrl-reporter)
    testReportHasComputationsArray: {
        actual: std.objectHas(config.report, 'computations') &&
                std.type(config.report.computations) == "array",
        expect: true
    },

    // Test each computation has required fields
    testComputationStructure: {
        local firstComp = config.report.computations[0],
        actual: std.objectHas(firstComp, 'id') &&
                std.objectHas(firstComp, 'description') &&
                std.objectHas(firstComp, 'kind'),
        expect: true
    },

    // Test accounts configuration matches expected schema
    testAccountsConfig: {
        actual: std.objectHas(config.accounts, 'file') &&
                std.objectHas(config.accounts, 'kind'),
        expect: true
    },

    // Test accounts kind is valid
    testAccountsKindValid: {
        actual: config.accounts.kind == 'gnucash' || config.accounts.kind == 'piecash',
        expect: true
    }
})