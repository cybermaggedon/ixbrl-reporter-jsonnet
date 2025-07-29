// Phase 1: Unit test for lib/esef-fr.libsonnet
local test = import "jsonnetunit/test.libsonnet";
local esef_fr = import "lib/esef-fr.libsonnet";

test.suite({
    testEsefFrLibraryLoads: {
        actual: std.type(esef_fr),
        expect: "object"
    },

    testInheritsFromBase: {
        actual: std.objectHasAll(esef_fr, 'config'),
        expect: true
    },

    testHasComponents: {
        actual: std.objectHasAll(esef_fr, 'components'),
        expect: true
    },

    testComponentsHasEsef: {
        actual: std.objectHasAll(esef_fr.components, 'esef'),
        expect: true
    },

    testEsefComponentIsFunction: {
        actual: std.type(esef_fr.components.esef),
        expect: "function"
    },

    // Test ESEF component basic functionality
    testEsefComponentBasic: {
        local mock_context = {
            line(id, desc): { id: id, description: desc, kind: "line" }
        },
        local result = esef_fr.components.esef(mock_context),
        actual: std.type(result) == "object" &&
                std.objectHas(result, 'report'),
        expect: true
    },

    // Test that ESEF component has computations
    testEsefHasComputations: {
        local mock_context = {
            line(id, desc): { id: id, description: desc, kind: "line" }
        },
        local result = esef_fr.components.esef(mock_context),
        actual: std.objectHas(result.report, 'computations') &&
                std.type(result.report.computations) == "array",
        expect: true
    },

    // Test that ESEF French component has title field
    testEsefFrHasTitle: {
        local mock_context = {
            line(id, desc): { id: id, description: desc, kind: "line" }
        },
        local result = esef_fr.components.esef(mock_context),
        actual: std.objectHas(result.report, 'title'),
        expect: true
    },

    // Test with_title builder method exists
    testEsefFrHasWithTitle: {
        local mock_context = {
            line(id, desc): { id: id, description: desc, kind: "line" }
        },
        local result = esef_fr.components.esef(mock_context),
        actual: std.objectHasAll(result, 'with_title'),
        expect: true
    },

    // Test with_title method is function
    testWithTitleIsFunction: {
        local mock_context = {
            line(id, desc): { id: id, description: desc, kind: "line" }
        },
        local result = esef_fr.components.esef(mock_context),
        actual: std.type(result.with_title) == "function",
        expect: true
    }
})