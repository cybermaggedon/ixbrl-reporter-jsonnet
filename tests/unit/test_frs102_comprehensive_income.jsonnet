// Phase 2: Unit test for lib/frs102/comprehensive-income.libsonnet
local test = import "jsonnetunit/test.libsonnet";
local comprehensive_income = import "lib/frs102/comprehensive-income.libsonnet";

test.suite({
    testComprehensiveIncomeIsObject: {
        actual: std.type(comprehensive_income),
        expect: "object"
    },

    testHasElementMethod: {
        actual: std.objectHasAll(comprehensive_income, 'element'),
        expect: true
    },

    testElementMethodIsFunction: {
        actual: std.type(comprehensive_income.element),
        expect: "function"
    },

    // Test element structure
    testElementReturnsValidStructure: {
        local mock_context = {},
        local result = comprehensive_income.element(mock_context),
        actual: std.type(result) == "object" &&
                std.objectHas(result, 'kind') &&
                result.kind == "page" &&
                std.objectHas(result, 'elements') &&
                std.type(result.elements) == "array",
        expect: true
    },

    testElementHasWithIdBuilder: {
        local mock_context = {},
        local result = comprehensive_income.element(mock_context),
        actual: std.objectHasAll(result, 'with_id') &&
                std.type(result.with_id) == "function",
        expect: true
    },

    testWithIdBuilder: {
        local mock_context = {},
        local result = comprehensive_income.element(mock_context).with_id("test-id"),
        actual: std.objectHas(result, 'id') && result.id == "test-id",
        expect: true
    },

    testElementHasHtmlContent: {
        local mock_context = {},
        local result = comprehensive_income.element(mock_context),
        local has_html_element = std.length(std.filter(
            function(elem) std.objectHas(elem, 'kind') && elem.kind == "html",
            result.elements
        )) > 0,
        actual: has_html_element,
        expect: true
    },

    testElementHasWorksheetContent: {
        local mock_context = {},
        local result = comprehensive_income.element(mock_context),
        local has_worksheet_element = std.length(std.filter(
            function(elem) std.objectHas(elem, 'kind') && elem.kind == "worksheet",
            result.elements
        )) > 0,
        actual: has_worksheet_element,
        expect: true
    },

    testWorksheetRefersToCorrectSheet: {
        local mock_context = {},
        local result = comprehensive_income.element(mock_context),
        local worksheet_elements = std.filter(
            function(elem) std.objectHas(elem, 'kind') && elem.kind == "worksheet",
            result.elements
        ),
        actual: std.length(worksheet_elements) > 0 &&
                std.objectHas(worksheet_elements[0], 'worksheet') &&
                worksheet_elements[0].worksheet == "profit-and-loss",
        expect: true
    }
})