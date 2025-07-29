// Phase 5: Unit test for lib/esef-en/cash-flows.libsonnet
local test = import "jsonnetunit/test.libsonnet";
local cash_flows = import "lib/esef-en/cash-flows.libsonnet";

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
    }
})