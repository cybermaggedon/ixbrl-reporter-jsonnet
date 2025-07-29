// Phase 3: Unit test for lib/uk-corptax/losses.libsonnet
local test = import "jsonnetunit/test.libsonnet";

test.suite({
    testLossesLoads: {
        local losses = import "lib/uk-corptax/losses.libsonnet",
        actual: std.type(losses),
        expect: "object"
    },

    testHasElementMethod: {
        local losses = import "lib/uk-corptax/losses.libsonnet",
        actual: std.objectHasAll(losses, 'element'),
        expect: true
    },

    testElementMethodIsFunction: {
        local losses = import "lib/uk-corptax/losses.libsonnet",
        actual: std.type(losses.element),
        expect: "function"
    },

    testElementReturnsValidStructure: {
        local losses = import "lib/uk-corptax/losses.libsonnet",
        local mock_context = {},
        local result = losses.element(mock_context),
        actual: std.type(result) == "object" &&
                std.objectHas(result, 'kind') &&
                result.kind == "page",
        expect: true
    }
})