// Phase 1: Unit test for lib/uk-vat.libsonnet
local test = import "jsonnetunit/test.libsonnet";
local uk_vat = import "lib/uk-vat.libsonnet";

test.suite({
    testUkVatLibraryLoads: {
        actual: std.type(uk_vat),
        expect: "object"
    },

    testInheritsFromBase: {
        actual: std.objectHasAll(uk_vat, 'config'),
        expect: true
    },

    testHasComponents: {
        actual: std.objectHasAll(uk_vat, 'components'),
        expect: true
    },

    testComponentsHasVat: {
        actual: std.objectHasAll(uk_vat.components, 'vat'),
        expect: true
    },

    testVatComponentIsFunction: {
        actual: std.type(uk_vat.components.vat),
        expect: "function"
    },

    // Test VAT component basic functionality
    testVatComponentBasic: {
        local mock_context = {
            line(id, desc): { id: id, description: desc, kind: "line" }
        },
        local result = uk_vat.components.vat(mock_context),
        actual: std.type(result) == "object" &&
                std.objectHas(result, 'report'),
        expect: true
    },

    // Test that VAT component has computations
    testVatHasComputations: {
        local mock_context = {
            line(id, desc): { id: id, description: desc, kind: "line" }
        },
        local result = uk_vat.components.vat(mock_context),
        actual: std.objectHas(result.report, 'computations') &&
                std.type(result.report.computations) == "array",
        expect: true
    }
})