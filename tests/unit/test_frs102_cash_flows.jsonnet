// Phase 2: Unit test for lib/frs102/cash-flows.libsonnet
local test = import "jsonnetunit/test.libsonnet";
local cash_flows = import "lib/frs102/cash-flows.libsonnet";

test.suite({
    testCashFlowsIsObject: {
        actual: std.type(cash_flows),
        expect: "object"
    },

    testHasElementMethod: {
        actual: std.objectHasAll(cash_flows, 'element'),
        expect: true
    },

    testElementMethodIsFunction: {
        actual: std.type(cash_flows.element),
        expect: "function"
    },

    // Test element structure
    testElementReturnsValidStructure: {
        local mock_context = {},
        local result = cash_flows.element(mock_context),
        actual: std.type(result) == "object" &&
                std.objectHas(result, 'kind') &&
                result.kind == "page" &&
                std.objectHas(result, 'elements') &&
                std.type(result.elements) == "array",
        expect: true
    },

    testElementHasDefaultId: {
        local mock_context = {},
        local result = cash_flows.element(mock_context),
        actual: std.objectHas(result, 'id') && result.id == "cash-flows",
        expect: true
    },

    testElementHasWithIdBuilder: {
        local mock_context = {},
        local result = cash_flows.element(mock_context),
        actual: std.objectHasAll(result, 'with_id') &&
                std.type(result.with_id) == "function",
        expect: true
    },

    testWithIdBuilder: {
        local mock_context = {},
        local result = cash_flows.element(mock_context).with_id("test-id"),
        actual: std.objectHas(result, 'id') && result.id == "test-id",
        expect: true
    },

    testElementHasHtmlContent: {
        local mock_context = {},
        local result = cash_flows.element(mock_context),
        local has_html_element = std.length(std.filter(
            function(elem) std.objectHas(elem, 'kind') && elem.kind == "html",
            result.elements
        )) > 0,
        actual: has_html_element,
        expect: true
    },

    testElementHasWorksheetContent: {
        local mock_context = {},
        local result = cash_flows.element(mock_context),
        local has_worksheet_element = std.length(std.filter(
            function(elem) std.objectHas(elem, 'kind') && elem.kind == "worksheet",
            result.elements
        )) > 0,
        actual: has_worksheet_element,
        expect: true
    },

    testWorksheetRefersToCorrectSheet: {
        local mock_context = {},
        local result = cash_flows.element(mock_context),
        local worksheet_elements = std.filter(
            function(elem) std.objectHas(elem, 'kind') && elem.kind == "worksheet",
            result.elements
        ),
        actual: std.length(worksheet_elements) > 0 &&
                std.objectHas(worksheet_elements[0], 'worksheet') &&
                worksheet_elements[0].worksheet == "cash-flows",
        expect: true
    }
})