// Phase 2: Unit test for lib/frs102/revision-info.libsonnet
local test = import "jsonnetunit/test.libsonnet";

test.suite({
    testRevisionInfoLoads: {
        local revision_info = import "lib/frs102/revision-info.libsonnet",
        actual: std.type(revision_info),
        expect: "object"
    },

    testHasElementMethod: {
        local revision_info = import "lib/frs102/revision-info.libsonnet",
        actual: std.objectHasAll(revision_info, 'element'),
        expect: true
    },

    testElementMethodIsFunction: {
        local revision_info = import "lib/frs102/revision-info.libsonnet",
        actual: std.type(revision_info.element),
        expect: "function"
    },

    testElementReturnsValidStructure: {
        local revision_info = import "lib/frs102/revision-info.libsonnet",
        local mock_context = {
            resource(name): { tag: "div", content: "mock revision info" }
        },
        local result = revision_info.element(mock_context),
        actual: std.type(result) == "object" &&
                std.objectHas(result, 'kind') &&
                result.kind == "page" &&
                std.objectHas(result, 'elements') &&
                std.type(result.elements) == "array",
        expect: true
    },

    testElementHasWithIdBuilder: {
        local revision_info = import "lib/frs102/revision-info.libsonnet",
        local mock_context = {
            resource(name): { tag: "div", content: "mock revision info" }
        },
        local result = revision_info.element(mock_context),
        actual: std.objectHasAll(result, 'with_id') &&
                std.type(result.with_id) == "function",
        expect: true
    }
})