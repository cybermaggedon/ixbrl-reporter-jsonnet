// Phase 1 Example: Unit test for lib/generic/html.libsonnet
local test = import "jsonnetunit/test.libsonnet";
local html = import "lib/generic/html.libsonnet";

test.suite({
    testHtmlLibraryLoads: {
        actual: std.type(html),
        expect: "object"
    },

    testHasElementFunction: {
        actual: std.objectHasAll(html, 'element'),
        expect: true
    },

    testElementIsFunction: {
        actual: std.type(html.element),
        expect: "function"
    },

    // Test HTML element generation
    testElementGeneration: {
        local result = html.element({}),
        actual: std.objectHas(result, 'kind') && result.kind == "html",
        expect: true
    },

    // Test element has builder methods
    testElementHasMethods: {
        local result = html.element({}),
        actual: std.objectHasAll(result, 'with_id') &&
                std.objectHasAll(result, 'with_elements') &&
                std.objectHasAll(result, 'with_root'),
        expect: true
    },

    // Test methods are functions
    testMethodsAreFunctions: {
        local result = html.element({}),
        actual: std.type(result.with_id) == "function" &&
                std.type(result.with_elements) == "function" &&
                std.type(result.with_root) == "function",
        expect: true
    },

    // Test method chaining works
    testMethodChaining: {
        local result = html.element({}).with_id("test-id"),
        actual: std.objectHas(result, 'id') && result.id == "test-id",
        expect: true
    }
})