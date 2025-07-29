// Phase 1: Unit test for lib/uk-corptax.libsonnet
local test = import "jsonnetunit/test.libsonnet";
local uk_corptax = import "lib/uk-corptax.libsonnet";

test.suite({
    testUkCorptaxLibraryLoads: {
        actual: std.type(uk_corptax),
        expect: "object"
    },

    testInheritsFromBase: {
        actual: std.objectHasAll(uk_corptax, 'config'),
        expect: true
    },

    testHasComponents: {
        actual: std.objectHasAll(uk_corptax, 'components'),
        expect: true
    },

    testComponentsHasCorptax: {
        actual: std.objectHasAll(uk_corptax.components, 'corptax'),
        expect: true
    },

    testCorptaxComponentIsFunction: {
        actual: std.type(uk_corptax.components.corptax),
        expect: "function"
    },

    // Test corptax component basic functionality
    testCorptaxComponentBasic: {
        local mock_context = {
            line(id, desc): { id: id, description: desc, kind: "line" }
        },
        local result = uk_corptax.components.corptax(mock_context),
        actual: std.type(result) == "object" &&
                std.objectHas(result, 'report'),
        expect: true
    },

    // Test that corptax component has computations
    testCorptaxHasComputations: {
        local mock_context = {
            line(id, desc): { id: id, description: desc, kind: "line" }
        },
        local result = uk_corptax.components.corptax(mock_context),
        actual: std.objectHas(result.report, 'computations') &&
                std.type(result.report.computations) == "array",
        expect: true
    }
})