// Phase 1: Unit test for lib/generic/composite.libsonnet
local test = import "jsonnetunit/test.libsonnet";
local composite = import "lib/generic/composite.libsonnet";

test.suite({
    testCompositeLibraryLoads: {
        actual: std.type(composite),
        expect: "object"
    },

    testHasElementFunction: {
        actual: std.objectHasAll(composite, 'element'),
        expect: true
    },

    testElementIsFunction: {
        actual: std.type(composite.element),
        expect: "function"
    },

    // Test composite element generation
    testCompositeElementGeneration: {
        local result = composite.element({}),
        actual: std.objectHas(result, 'kind') && result.kind == "composite",
        expect: true
    },

    // Test element has builder methods
    testElementHasMethods: {
        local result = composite.element({}),
        actual: std.objectHasAll(result, 'with_id') &&
                std.objectHasAll(result, 'with_elements'),
        expect: true
    },

    // Test methods are functions
    testMethodsAreFunctions: {
        local result = composite.element({}),
        actual: std.type(result.with_id) == "function" &&
                std.type(result.with_elements) == "function",
        expect: true
    },

    // Test with_id method chaining
    testWithIdMethodChaining: {
        local result = composite.element({}).with_id("test-composite"),
        actual: std.objectHas(result, 'id') && result.id == "test-composite",
        expect: true
    },

    // Test with_elements method chaining
    testWithElementsMethodChaining: {
        local test_elements = ["element1", "element2"],
        local result = composite.element({}).with_elements(test_elements),
        actual: std.objectHas(result, 'elements') && 
                std.type(result.elements) == "array" &&
                std.length(result.elements) == 2,
        expect: true
    },

    // Test method chaining combination
    testMethodChainingCombination: {
        local test_elements = ["elem1"],
        local result = composite.element({})
                               .with_id("combo-test")
                               .with_elements(test_elements),
        actual: result.kind == "composite" &&
                result.id == "combo-test" &&
                std.length(result.elements) == 1,
        expect: true
    }
})