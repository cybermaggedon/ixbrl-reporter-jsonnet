// Phase 3: Unit test for lib/uk-corptax/research-dev.libsonnet
local test = import "jsonnetunit/test.libsonnet";
local research_dev = import "lib/uk-corptax/research-dev.libsonnet";

test.suite({
    testResearchDevIsObject: {
        actual: std.type(research_dev),
        expect: "object"
    },

    testHasElementMethod: {
        actual: std.objectHasAll(research_dev, 'element'),
        expect: true
    },

    testElementMethodIsFunction: {
        actual: std.type(research_dev.element),
        expect: "function"
    },

    // Test element structure
    testElementReturnsValidStructure: {
        local mock_context = {},
        local result = research_dev.element(mock_context),
        actual: std.type(result) == "object" &&
                std.objectHas(result, 'kind') &&
                result.kind == "page" &&
                std.objectHas(result, 'elements') &&
                std.type(result.elements) == "array",
        expect: true
    },

    testElementHasWorksheet: {
        local mock_context = {},
        local result = research_dev.element(mock_context),
        local has_worksheet = std.length(std.filter(
            function(elem) std.objectHas(elem, 'kind') && elem.kind == "worksheet",
            result.elements
        )) > 0,
        actual: has_worksheet,
        expect: true
    },

    testWorksheetHasTitle: {
        local mock_context = {},
        local result = research_dev.element(mock_context),
        local worksheet = std.filter(
            function(elem) std.objectHas(elem, 'kind') && elem.kind == "worksheet",
            result.elements
        )[0],
        actual: std.objectHas(worksheet, 'title') &&
                worksheet.title == "SME R&D",
        expect: true
    },

    testWorksheetRefersToCorrectSheet: {
        local mock_context = {},
        local result = research_dev.element(mock_context),
        local worksheet = std.filter(
            function(elem) std.objectHas(elem, 'kind') && elem.kind == "worksheet",
            result.elements
        )[0],
        actual: std.objectHas(worksheet, 'worksheet') &&
                worksheet.worksheet == "rnd",
        expect: true
    }
})