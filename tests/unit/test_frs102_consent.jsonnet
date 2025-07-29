// Phase 2: Unit test for lib/frs102/consent.libsonnet
local test = import "jsonnetunit/test.libsonnet";

test.suite({
    testConsentLoads: {
        local consent = import "lib/frs102/consent.libsonnet",
        actual: std.type(consent),
        expect: "object"
    },

    testHasElementMethod: {
        local consent = import "lib/frs102/consent.libsonnet",
        actual: std.objectHasAll(consent, 'element'),
        expect: true
    },

    testElementMethodIsFunction: {
        local consent = import "lib/frs102/consent.libsonnet",
        actual: std.type(consent.element),
        expect: "function"
    },

    testElementReturnsValidStructure: {
        local consent = import "lib/frs102/consent.libsonnet",
        local mock_context = {},
        local result = consent.element(mock_context),
        actual: std.type(result) == "object" &&
                std.objectHas(result, 'kind') &&
                result.kind == "page" &&
                std.objectHas(result, 'elements') &&
                std.type(result.elements) == "array",
        expect: true
    },

    testElementHasWithIdBuilder: {
        local consent = import "lib/frs102/consent.libsonnet",
        local mock_context = {},
        local result = consent.element(mock_context),
        actual: std.objectHasAll(result, 'with_id') &&
                std.type(result.with_id) == "function",
        expect: true
    }
})