// Phase 1: Unit test for lib/esef-en.libsonnet
local test = import "jsonnetunit/test.libsonnet";
local esef_en = import "lib/esef-en.libsonnet";

test.suite({
    testEsefEnLibraryLoads: {
        actual: std.type(esef_en),
        expect: "object"
    },

    testInheritsFromBase: {
        actual: std.objectHasAll(esef_en, 'config'),
        expect: true
    },

    testHasComponents: {
        actual: std.objectHasAll(esef_en, 'components'),
        expect: true
    },

    testComponentsHasEsef: {
        actual: std.objectHasAll(esef_en.components, 'esef'),
        expect: true
    },

    testEsefComponentIsFunction: {
        actual: std.type(esef_en.components.esef),
        expect: "function"
    },

    // Test ESEF component basic functionality
    testEsefComponentBasic: {
        local mock_context = {
            line(id, desc): { id: id, description: desc, kind: "line" }
        },
        local result = esef_en.components.esef(mock_context),
        actual: std.type(result) == "object" &&
                std.objectHas(result, 'report'),
        expect: true
    },

    // Test that ESEF component has computations
    testEsefHasComputations: {
        local mock_context = {
            line(id, desc): { id: id, description: desc, kind: "line" }
        },
        local result = esef_en.components.esef(mock_context),
        actual: std.objectHas(result.report, 'computations') &&
                std.type(result.report.computations) == "array",
        expect: true
    }
})