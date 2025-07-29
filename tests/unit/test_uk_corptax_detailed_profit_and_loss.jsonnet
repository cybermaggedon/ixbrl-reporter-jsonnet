// Phase 3: Unit test for lib/uk-corptax/detailed-profit-and-loss.libsonnet
local test = import "jsonnetunit/test.libsonnet";
local detailed_profit_and_loss = import "lib/uk-corptax/detailed-profit-and-loss.libsonnet";

test.suite({
    testDetailedProfitAndLossIsObject: {
        actual: std.type(detailed_profit_and_loss),
        expect: "object"
    },

    testHasElementMethod: {
        actual: std.objectHasAll(detailed_profit_and_loss, 'element'),
        expect: true
    },

    testElementMethodIsFunction: {
        actual: std.type(detailed_profit_and_loss.element),
        expect: "function"
    },

    // Test element structure
    testElementReturnsValidStructure: {
        local mock_context = {},
        local result = detailed_profit_and_loss.element(mock_context),
        actual: std.type(result) == "object" &&
                std.objectHas(result, 'kind') &&
                result.kind == "page" &&
                std.objectHas(result, 'elements') &&
                std.type(result.elements) == "array",
        expect: true
    },

    testElementHasWorksheet: {
        local mock_context = {},
        local result = detailed_profit_and_loss.element(mock_context),
        local has_worksheet = std.length(std.filter(
            function(elem) std.objectHas(elem, 'kind') && elem.kind == "worksheet",
            result.elements
        )) > 0,
        actual: has_worksheet,
        expect: true
    },

    testWorksheetHasTitle: {
        local mock_context = {},
        local result = detailed_profit_and_loss.element(mock_context),
        local worksheet = std.filter(
            function(elem) std.objectHas(elem, 'kind') && elem.kind == "worksheet",
            result.elements
        )[0],
        actual: std.objectHas(worksheet, 'title') &&
                worksheet.title == "Detailed Profit-and-Loss",
        expect: true
    },

    testWorksheetRefersToCorrectSheet: {
        local mock_context = {},
        local result = detailed_profit_and_loss.element(mock_context),
        local worksheet = std.filter(
            function(elem) std.objectHas(elem, 'kind') && elem.kind == "worksheet",
            result.elements
        )[0],
        actual: std.objectHas(worksheet, 'worksheet') &&
                worksheet.worksheet == "detailed-profit-and-loss",
        expect: true
    }
})