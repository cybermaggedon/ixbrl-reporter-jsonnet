// Phase 5: Unit test for lib/esef-fr/balance-sheet.libsonnet
local test = import "jsonnetunit/test.libsonnet";
local balance_sheet = import "lib/esef-fr/balance-sheet.libsonnet";

test.suite({
    testBalanceSheetIsObject: {
        actual: std.type(balance_sheet),
        expect: "object"
    },

    testHasElementMethod: {
        actual: std.objectHasAll(balance_sheet, 'element'),
        expect: true
    },

    testElementMethodIsFunction: {
        actual: std.type(balance_sheet.element),
        expect: "function"
    },

    testElementReturnsValidStructure: {
        local mock_context = {},
        local result = balance_sheet.element(mock_context),
        actual: std.type(result) == "object" &&
                std.objectHas(result, 'kind') &&
                result.kind == "page" &&
                std.objectHas(result, 'elements') &&
                std.type(result.elements) == "array",
        expect: true
    },

    testElementHasHtmlContent: {
        local mock_context = {},
        local result = balance_sheet.element(mock_context),
        local has_html_element = std.length(std.filter(
            function(elem) std.objectHas(elem, 'kind') && elem.kind == "html",
            result.elements
        )) > 0,
        actual: has_html_element,
        expect: true
    },

    testElementHasWorksheetContent: {
        local mock_context = {},
        local result = balance_sheet.element(mock_context),
        local has_worksheet_element = std.length(std.filter(
            function(elem) std.objectHas(elem, 'kind') && elem.kind == "worksheet",
            result.elements
        )) > 0,
        actual: has_worksheet_element,
        expect: true
    }
})