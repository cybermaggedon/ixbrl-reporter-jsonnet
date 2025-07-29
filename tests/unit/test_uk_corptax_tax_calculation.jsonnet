// Phase 3: Unit test for lib/uk-corptax/tax-calculation.libsonnet
local test = import "jsonnetunit/test.libsonnet";
local tax_calculation = import "lib/uk-corptax/tax-calculation.libsonnet";

test.suite({
    testTaxCalculationIsObject: {
        actual: std.type(tax_calculation),
        expect: "object"
    },

    testHasElementMethod: {
        actual: std.objectHasAll(tax_calculation, 'element'),
        expect: true
    },

    testElementMethodIsFunction: {
        actual: std.type(tax_calculation.element),
        expect: "function"
    },

    // Test element structure
    testElementReturnsValidStructure: {
        local mock_context = {},
        local result = tax_calculation.element(mock_context),
        actual: std.type(result) == "object" &&
                std.objectHas(result, 'kind') &&
                result.kind == "page" &&
                std.objectHas(result, 'elements') &&
                std.type(result.elements) == "array",
        expect: true
    },

    testElementHasWorksheet: {
        local mock_context = {},
        local result = tax_calculation.element(mock_context),
        local has_worksheet = std.length(std.filter(
            function(elem) std.objectHas(elem, 'kind') && elem.kind == "worksheet",
            result.elements
        )) > 0,
        actual: has_worksheet,
        expect: true
    },

    testWorksheetHasTitle: {
        local mock_context = {},
        local result = tax_calculation.element(mock_context),
        local worksheet = std.filter(
            function(elem) std.objectHas(elem, 'kind') && elem.kind == "worksheet",
            result.elements
        )[0],
        actual: std.objectHas(worksheet, 'title') &&
                worksheet.title == "Tax calculation",
        expect: true
    },

    testWorksheetRefersToCorrectSheet: {
        local mock_context = {},
        local result = tax_calculation.element(mock_context),
        local worksheet = std.filter(
            function(elem) std.objectHas(elem, 'kind') && elem.kind == "worksheet",
            result.elements
        )[0],
        actual: std.objectHas(worksheet, 'worksheet') &&
                worksheet.worksheet == "tax-calculation",
        expect: true
    }
})