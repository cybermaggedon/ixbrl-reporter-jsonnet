// Phase 1: Unit test for lib/frs102.libsonnet
local test = import "jsonnetunit/test.libsonnet";
local frs102 = import "lib/frs102.libsonnet";

test.suite({
    testFrs102LibraryLoads: {
        actual: std.type(frs102),
        expect: "object"
    },

    testInheritsFromBase: {
        actual: std.objectHasAll(frs102, 'config'),
        expect: true
    },

    testHasComponents: {
        actual: std.objectHasAll(frs102, 'components'),
        expect: true
    },

    testComponentsHasFrs102: {
        actual: std.objectHasAll(frs102.components, 'frs102'),
        expect: true
    },

    testFrs102ComponentIsFunction: {
        actual: std.type(frs102.components.frs102),
        expect: "function"
    },

    // Test FRS102 component basic functionality
    testFrs102ComponentBasic: {
        local mock_context = {
            line(id, desc): { id: id, description: desc, kind: "line" },
            sum(id, desc): { id: id, description: desc, kind: "sum" },
            group(id, desc): { id: id, description: desc, kind: "group" }
        },
        local result = frs102.components.frs102(mock_context),
        actual: std.type(result) == "object" &&
                std.objectHas(result, 'report'),
        expect: true
    },

    // Test that FRS102 component has required report fields
    testFrs102ReportStructure: {
        local mock_context = {
            line(id, desc): { id: id, description: desc, kind: "line" }
        },
        local result = frs102.components.frs102(mock_context),
        actual: std.objectHas(result.report, 'accounting-standards') &&
                std.objectHas(result.report, 'accounts-status') &&
                std.objectHas(result.report, 'accounts-type') &&
                std.objectHas(result.report, 'title'),
        expect: true
    },

    // Test that FRS102 component has computations
    testFrs102HasComputations: {
        local mock_context = {
            line(id, desc): { id: id, description: desc, kind: "line" }
        },
        local result = frs102.components.frs102(mock_context),
        actual: std.objectHas(result.report, 'computations') &&
                std.type(result.report.computations) == "array",
        expect: true
    },

    // Test that FRS102 component has worksheets
    testFrs102HasWorksheets: {
        local mock_context = {
            line(id, desc): { id: id, description: desc, kind: "line" }
        },
        local result = frs102.components.frs102(mock_context),
        actual: std.objectHas(result.report, 'worksheets'),
        expect: true
    },

    // Test FRS102 component has builder methods
    testFrs102HasBuilderMethods: {
        local mock_context = {
            line(id, desc): { id: id, description: desc, kind: "line" }
        },
        local result = frs102.components.frs102(mock_context),
        actual: std.objectHasAll(result, 'with_accounting_standards') &&
                std.objectHasAll(result, 'with_accounts_status') &&
                std.objectHasAll(result, 'with_accounts_type'),
        expect: true
    },

    // Test builder methods are functions
    testBuilderMethodsAreFunctions: {
        local mock_context = {
            line(id, desc): { id: id, description: desc, kind: "line" }
        },
        local result = frs102.components.frs102(mock_context),
        actual: std.type(result.with_accounting_standards) == "function" &&
                std.type(result.with_accounts_status) == "function" &&
                std.type(result.with_accounts_type) == "function",
        expect: true
    }
})