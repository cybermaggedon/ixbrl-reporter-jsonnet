// Phase 2: Unit test for lib/frs102/micro-entity-report.libsonnet
local test = import "jsonnetunit/test.libsonnet";
local micro_entity_report = import "lib/frs102/micro-entity-report.libsonnet";

test.suite({
    testMicroEntityReportIsObject: {
        actual: std.type(micro_entity_report),
        expect: "object"
    },

    testHasElementMethod: {
        actual: std.objectHasAll(micro_entity_report, 'element'),
        expect: true
    },

    testElementMethodIsFunction: {
        actual: std.type(micro_entity_report.element),
        expect: "function"
    },

    // Test element structure
    testElementReturnsValidStructure: {
        local mock_context = {
            resource(name): "mock-resource"
        },
        local result = micro_entity_report.element(mock_context),
        actual: std.type(result) == "object" &&
                std.objectHas(result, 'kind') &&
                result.kind == "composite" &&
                std.objectHas(result, 'elements') &&
                std.type(result.elements) == "array",
        expect: true
    },

    testElementHasBuilderMethods: {
        local mock_context = {
            resource(name): "mock-resource"
        },
        local result = micro_entity_report.element(mock_context),
        actual: std.objectHasAll(result, 'with_id') &&
                std.objectHasAll(result, 'with_logo') &&
                std.objectHasAll(result, 'with_signature') &&
                std.type(result.with_id) == "function" &&
                std.type(result.with_logo) == "function" &&
                std.type(result.with_signature) == "function",
        expect: true
    },

    testDefaultLogoIsNull: {
        local mock_context = {
            resource(name): "mock-resource"
        },
        local result = micro_entity_report.element(mock_context),
        actual: std.objectHasAll(result, 'logo') && result.logo == null,
        expect: true
    },

    testDefaultSignatureIsNull: {
        local mock_context = {
            resource(name): "mock-resource"
        },
        local result = micro_entity_report.element(mock_context),
        actual: std.objectHasAll(result, 'signature') && result.signature == null,
        expect: true
    },

    testWithIdBuilder: {
        local mock_context = {
            resource(name): "mock-resource"
        },
        local result = micro_entity_report.element(mock_context).with_id("test-id"),
        actual: std.objectHas(result, 'id') && result.id == "test-id",
        expect: true
    },

    testWithLogoBuilder: {
        local mock_context = {
            resource(name): "mock-resource"
        },
        local result = micro_entity_report.element(mock_context).with_logo("test-logo"),
        actual: std.objectHasAll(result, 'logo') && result.logo == "test-logo",
        expect: true
    },

    testWithSignatureBuilder: {
        local mock_context = {
            resource(name): "mock-resource"
        },
        local result = micro_entity_report.element(mock_context).with_signature("test-sig"),
        actual: std.objectHasAll(result, 'signature') && result.signature == "test-sig",
        expect: true
    }
})