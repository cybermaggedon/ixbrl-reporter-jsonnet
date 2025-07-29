// Template for testing computation files (*.computations.jsonnet)
// These are critical for mathematical accuracy and business rules

local test = import "jsonnetunit/test.libsonnet";
local computations = import "lib/PATH_TO/computations.jsonnet";

test.suite({
    // Test that computations array loads
    testComputationsLoad: {
        actual: std.type(computations),
        expect: "array"
    },

    // Test that we have computations defined
    testHasComputations: {
        actual: std.length(computations) > 0,
        expect: true
    },

    // Test that each computation has required fields
    testComputationStructure: {
        local first_comp = computations[0],
        actual: std.objectHas(first_comp, 'id') &&
                std.objectHas(first_comp, 'description') &&
                std.objectHas(first_comp, 'kind'),
        expect: true
    },

    // Test specific computation by ID
    testSpecificComputation: {
        local target_comp = std.filter(function(c) c.id == 'TARGET_ID_HERE', computations)[0],
        actual: std.objectHas(target_comp, 'description'),
        expect: true
    },

    // Test computation types are valid
    testComputationKinds: {
        local kinds = std.set([comp.kind for comp in computations]),
        local valid_kinds = ['line', 'group', 'sum'],
        local all_valid = std.all([std.member(kind, valid_kinds) for kind in kinds]),
        actual: all_valid,
        expect: true
    },

    // Test that line computations have accounts
    testLineComputationsHaveAccounts: {
        local line_comps = std.filter(function(c) c.kind == 'line', computations),
        local have_accounts = std.all([std.objectHas(c, 'accounts') for c in line_comps]),
        actual: have_accounts,
        expect: true
    },

    // Test that group/sum computations have inputs
    testGroupComputationsHaveInputs: {
        local group_comps = std.filter(function(c) c.kind == 'group' || c.kind == 'sum', computations),
        local have_inputs = std.all([std.objectHas(c, 'inputs') for c in group_comps]),
        actual: have_inputs,
        expect: true
    },

    // Test mathematical relationships (example: assets = liabilities + equity)
    testBalanceSheetBalance: {
        // This would need to be customized based on actual computation structure
        local assets = std.filter(function(c) std.startsWith(c.id, 'asset'), computations),
        local liabilities = std.filter(function(c) std.startsWith(c.id, 'liability'), computations),
        // For now, just test that we have both types
        actual: std.length(assets) > 0 && std.length(liabilities) > 0,
        expect: true
    },

    // Test that all referenced inputs exist
    testInputReferencesValid: {
        local all_ids = std.set([comp.id for comp in computations]),
        local group_comps = std.filter(function(c) c.kind == 'group' || c.kind == 'sum', computations),
        local all_inputs = std.flattenArrays([
            if std.objectHas(c, 'inputs') then c.inputs else [] 
            for c in group_comps
        ]),
        local inputs_exist = std.all([std.member(input, all_ids) for input in all_inputs]),
        actual: inputs_exist,
        expect: true
    },

    // Test period specifications are valid
    testValidPeriods: {
        local periods = std.set([
            if std.objectHas(comp, 'period') then comp.period else 'at-end'
            for comp in computations
        ]),
        local valid_periods = ['at-start', 'at-end', 'in-year'],
        local all_valid = std.all([std.member(period, valid_periods) for period in periods]),
        actual: all_valid,
        expect: true
    }
})