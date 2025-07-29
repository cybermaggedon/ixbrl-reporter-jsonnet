// Phase 1: Unit test for lib/generic/page.libsonnet
local test = import "jsonnetunit/test.libsonnet";
local page = import "lib/generic/page.libsonnet";

test.suite({
    testPageLibraryLoads: {
        actual: std.type(page),
        expect: "object"
    },

    testHasElementFunction: {
        actual: std.objectHasAll(page, 'element'),
        expect: true
    },

    testElementIsFunction: {
        actual: std.type(page.element),
        expect: "function"
    },

    // Test page element generation
    testPageElementGeneration: {
        local result = page.element({}),
        actual: std.objectHas(result, 'kind') && result.kind == "page",
        expect: true
    },

    // Test element has builder methods
    testElementHasMethods: {
        local result = page.element({}),
        actual: std.objectHasAll(result, 'with_id') &&
                std.objectHasAll(result, 'with_elements'),
        expect: true
    },

    // Test methods are functions
    testMethodsAreFunctions: {
        local result = page.element({}),
        actual: std.type(result.with_id) == "function" &&
                std.type(result.with_elements) == "function",
        expect: true
    },

    // Test with_id method
    testWithIdMethod: {
        local result = page.element({}).with_id("balance-sheet-page"),
        actual: std.objectHas(result, 'id') && result.id == "balance-sheet-page",
        expect: true
    },

    // Test with_elements method
    testWithElementsMethod: {
        local test_elements = ["header", "table", "footer"],
        local result = page.element({}).with_elements(test_elements),
        actual: std.objectHas(result, 'elements') && 
                std.type(result.elements) == "array" &&
                std.length(result.elements) == 3,
        expect: true
    },

    // Test method chaining
    testMethodChaining: {
        local test_elements = ["content1", "content2"],
        local result = page.element({})
                          .with_id("report-page")
                          .with_elements(test_elements),
        actual: result.kind == "page" &&
                result.id == "report-page" &&
                std.length(result.elements) == 2,
        expect: true
    },

    // Test empty elements array
    testEmptyElementsArray: {
        local result = page.element({}).with_elements([]),
        actual: std.objectHas(result, 'elements') && 
                std.length(result.elements) == 0,
        expect: true
    }
})