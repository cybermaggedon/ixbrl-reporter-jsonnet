// Integration test for example-vat/example-vat.jsonnet
local test = import "jsonnetunit/test.libsonnet";
local config = import "example-vat/example-vat.jsonnet";

test.suite({
    // Test that the VAT configuration generates successfully
    testVatConfigIsObject: {
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

    // Test VAT-specific structure
    testReportHasComputations: {
        actual: std.objectHas(config.report, 'computations') &&
                std.type(config.report.computations) == "array",
        expect: true
    },

    testReportHasWorksheets: {
        actual: std.objectHas(config.report, 'worksheets') &&
                std.type(config.report.worksheets) == "array",
        expect: true
    },

    // Test that VAT computations are present
    testHasVatComputations: {
        local vat_computations = std.filter(
            function(comp) std.objectHas(comp, 'id') && std.startsWith(comp.id, "vat"),
            config.report.computations
        ),
        actual: std.length(vat_computations) > 0,
        expect: true
    },

    // Test that VAT worksheet exists
    testHasVatWorksheet: {
        local vat_worksheets = std.filter(
            function(ws) std.objectHas(ws, 'id') && ws.id == "vat",
            config.report.worksheets
        ),
        actual: std.length(vat_worksheets) > 0,
        expect: true
    },

    // Test VAT output sales computation exists
    testHasVatOutputSalesComputation: {
        local vat_output_sales = std.filter(
            function(comp) std.objectHas(comp, 'id') && comp.id == "vat-output-sales",
            config.report.computations
        ),
        actual: std.length(vat_output_sales) > 0,
        expect: true
    },

    // Test VAT input computation exists
    testHasVatInputComputation: {
        local vat_input = std.filter(
            function(comp) std.objectHas(comp, 'id') && comp.id == "vat-input",
            config.report.computations
        ),
        actual: std.length(vat_input) > 0,
        expect: true
    },

    // Test that all VAT boxes (vat1-vat9) are present
    testHasAllVatBoxes: {
        local vat_boxes = std.filter(
            function(comp) std.objectHas(comp, 'id') && (
                comp.id == "vat1" || comp.id == "vat2" || comp.id == "vat3" ||
                comp.id == "vat4" || comp.id == "vat5" || comp.id == "vat6" ||
                comp.id == "vat7" || comp.id == "vat8" || comp.id == "vat9"
            ),
            config.report.computations
        ),
        actual: std.length(vat_boxes) == 9,
        expect: true
    },

    // Test that the config generates VAT-related elements
    testHasVatElements: {
        local has_elements = std.objectHas(config.report, 'elements') &&
                            std.type(config.report.elements) == "array",
        actual: has_elements,
        expect: true
    }
})