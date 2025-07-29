// Phase 1: Unit test for lib/generic/worksheet.libsonnet
local test = import "jsonnetunit/test.libsonnet";
local worksheet = import "lib/generic/worksheet.libsonnet";

test.suite({
    testWorksheetLibraryLoads: {
        actual: std.type(worksheet),
        expect: "object"
    },

    testHasElementFunction: {
        actual: std.objectHasAll(worksheet, 'element'),
        expect: true
    },

    testElementIsFunction: {
        actual: std.type(worksheet.element),
        expect: "function"
    },

    // Test worksheet element generation
    testWorksheetElementGeneration: {
        local result = worksheet.element({}),
        actual: std.objectHas(result, 'kind') && result.kind == "worksheet",
        expect: true
    },

    // Test element has all builder methods
    testElementHasMethods: {
        local result = worksheet.element({}),
        actual: std.objectHasAll(result, 'with_id') &&
                std.objectHasAll(result, 'with_worksheet') &&
                std.objectHasAll(result, 'with_title') &&
                std.objectHasAll(result, 'with_elements'),
        expect: true
    },

    // Test methods are functions
    testMethodsAreFunctions: {
        local result = worksheet.element({}),
        actual: std.type(result.with_id) == "function" &&
                std.type(result.with_worksheet) == "function" &&
                std.type(result.with_title) == "function" &&
                std.type(result.with_elements) == "function",
        expect: true
    },

    // Test with_id method
    testWithIdMethod: {
        local result = worksheet.element({}).with_id("balance-sheet-worksheet"),
        actual: std.objectHas(result, 'id') && result.id == "balance-sheet-worksheet",
        expect: true
    },

    // Test with_worksheet method
    testWithWorksheetMethod: {
        local test_worksheet = { data: "financial-data", format: "table" },
        local result = worksheet.element({}).with_worksheet(test_worksheet),
        actual: std.objectHas(result, 'worksheet') && 
                std.type(result.worksheet) == "object" &&
                result.worksheet.data == "financial-data",
        expect: true
    },

    // Test with_title method
    testWithTitleMethod: {
        local result = worksheet.element({}).with_title("Profit & Loss Worksheet"),
        actual: std.objectHas(result, 'title') && result.title == "Profit & Loss Worksheet",
        expect: true
    },

    // Test with_elements method
    testWithElementsMethod: {
        local test_elements = ["header", "rows", "totals"],
        local result = worksheet.element({}).with_elements(test_elements),
        actual: std.objectHas(result, 'elements') && 
                std.type(result.elements) == "array" &&
                std.length(result.elements) == 3,
        expect: true
    },

    // Test complete method chaining
    testCompleteMethodChaining: {
        local test_worksheet = { type: "balance-sheet" },
        local test_elements = ["assets", "liabilities"],
        local result = worksheet.element({})
                              .with_id("bs-worksheet")
                              .with_title("Balance Sheet")
                              .with_worksheet(test_worksheet)
                              .with_elements(test_elements),
        actual: result.kind == "worksheet" &&
                result.id == "bs-worksheet" &&
                result.title == "Balance Sheet" &&
                result.worksheet.type == "balance-sheet" &&
                std.length(result.elements) == 2,
        expect: true
    }
})