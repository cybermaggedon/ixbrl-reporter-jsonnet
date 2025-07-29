// Phase 2: Unit test for lib/frs102/title-page.libsonnet
local test = import "jsonnetunit/test.libsonnet";
local title_page = import "lib/frs102/title-page.libsonnet";

test.suite({
    testTitlePageIsObject: {
        actual: std.type(title_page),
        expect: "object"
    },

    testHasElementMethod: {
        actual: std.objectHasAll(title_page, 'element'),
        expect: true
    },

    testElementMethodIsFunction: {
        actual: std.type(title_page.element),
        expect: "function"
    },

    // Test element structure
    testElementReturnsValidStructure: {
        local mock_context = {
            resource(name): "mock-resource"
        },
        local result = title_page.element(mock_context),
        actual: std.type(result) == "object" &&
                std.objectHas(result, 'kind') &&
                result.kind == "page" &&
                std.objectHas(result, 'elements') &&
                std.type(result.elements) == "array",
        expect: true
    },

    testElementHasBuilderMethods: {
        local mock_context = {
            resource(name): "mock-resource"
        },
        local result = title_page.element(mock_context),
        actual: std.objectHasAll(result, 'with_id') &&
                std.objectHasAll(result, 'with_logo') &&
                std.type(result.with_id) == "function" &&
                std.type(result.with_logo) == "function",
        expect: true
    },

    testWithIdBuilder: {
        local mock_context = {
            resource(name): "mock-resource"
        },
        local result = title_page.element(mock_context).with_id("test-id"),
        actual: std.objectHas(result, 'id') && result.id == "test-id",
        expect: true
    },

    testWithLogoBuilder: {
        local mock_context = {
            resource(name): "test-logo-resource"
        },
        local result = title_page.element(mock_context).with_logo("logo-resource"),
        actual: std.objectHasAll(result, 'logo'),
        expect: true
    },

    testElementHasHtmlContent: {
        local mock_context = {
            resource(name): "mock-resource"
        },
        local result = title_page.element(mock_context),
        local has_html_element = std.length(std.filter(
            function(elem) std.objectHas(elem, 'kind') && elem.kind == "html",
            result.elements
        )) > 0,
        actual: has_html_element,
        expect: true
    },

    testTitlePageHasCorrectCSSClass: {
        local mock_context = {
            resource(name): "mock-resource"
        },
        local result = title_page.element(mock_context),
        local html_element = std.filter(
            function(elem) std.objectHas(elem, 'kind') && elem.kind == "html",
            result.elements
        )[0],
        actual: std.objectHas(html_element, 'root') &&
                std.objectHas(html_element.root, 'attributes') &&
                std.objectHas(html_element.root.attributes, 'class') &&
                html_element.root.attributes.class == "titlepage",
        expect: true
    },

    testDefaultLogoIsEmpty: {
        local mock_context = {
            resource(name): "mock-resource"
        },
        local result = title_page.element(mock_context),
        actual: std.objectHasAll(result, 'logo') && result.logo == "",
        expect: true
    }
})