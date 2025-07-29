// Phase 2: Unit test for lib/frs102/composite.libsonnet
local test = import "jsonnetunit/test.libsonnet";
local composite = import "lib/frs102/composite.libsonnet";

test.suite({
    testCompositeIsObject: {
        actual: std.type(composite),
        expect: "object"
    },

    testHasElementMethod: {
        actual: std.objectHasAll(composite, 'element'),
        expect: true
    },

    testElementMethodIsFunction: {
        actual: std.type(composite.element),
        expect: "function"
    },

    testElementReturnsCompositeStructure: {
        local mock_context = {},
        local result = composite.element(mock_context),
        actual: std.type(result) == "object" &&
                std.objectHas(result, 'kind') &&
                result.kind == "composite",
        expect: true
    },

    testElementHasBuilderMethods: {
        local mock_context = {},
        local result = composite.element(mock_context),
        actual: std.objectHasAll(result, 'with_id') &&
                std.objectHasAll(result, 'with_elements') &&
                std.type(result.with_id) == "function" &&
                std.type(result.with_elements) == "function",
        expect: true
    }
})