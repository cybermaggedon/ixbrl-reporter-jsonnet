// Phase 5: Unit test for lib/esef-en/balance-sheet.libsonnet
local test = import "jsonnetunit/test.libsonnet";
local balance_sheet = import "lib/esef-en/balance-sheet.libsonnet";

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

    // Test element structure
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
    },

    testWorksheetRefersToCorrectSheet: {
        local mock_context = {},
        local result = balance_sheet.element(mock_context),
        local worksheet_elements = std.filter(
            function(elem) std.objectHas(elem, 'kind') && elem.kind == "worksheet",
            result.elements
        ),
        actual: std.length(worksheet_elements) > 0 &&
                std.objectHas(worksheet_elements[0], 'worksheet') &&
                worksheet_elements[0].worksheet == "financial-position",
        expect: true
    },

    testHtmlHasHeaderClass: {
        local mock_context = {},
        local result = balance_sheet.element(mock_context),
        local html_element = std.filter(
            function(elem) std.objectHas(elem, 'kind') && elem.kind == "html",
            result.elements
        )[0],
        local has_header = std.objectHas(html_element, 'root') &&
                         std.objectHas(html_element.root, 'content') &&
                         std.type(html_element.root.content) == "array",
        actual: has_header,
        expect: true
    }
})