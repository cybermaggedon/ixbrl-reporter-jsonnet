// Phase 2: Unit test for lib/frs102/company-info.libsonnet
local test = import "jsonnetunit/test.libsonnet";
local company_info = import "lib/frs102/company-info.libsonnet";

test.suite({
    testCompanyInfoIsObject: {
        actual: std.type(company_info),
        expect: "object"
    },

    testHasElementMethod: {
        actual: std.objectHasAll(company_info, 'element'),
        expect: true
    },

    testElementMethodIsFunction: {
        actual: std.type(company_info.element),
        expect: "function"
    },

    // Test element structure
    testElementReturnsValidStructure: {
        local mock_context = {},
        local result = company_info.element(mock_context),
        actual: std.type(result) == "object" &&
                std.objectHas(result, 'kind') &&
                result.kind == "page" &&
                std.objectHas(result, 'elements') &&
                std.type(result.elements) == "array",
        expect: true
    },

    testElementHasWithIdBuilder: {
        local mock_context = {},
        local result = company_info.element(mock_context),
        actual: std.objectHasAll(result, 'with_id') &&
                std.type(result.with_id) == "function",
        expect: true
    },

    testWithIdBuilder: {
        local mock_context = {},
        local result = company_info.element(mock_context).with_id("test-id"),
        actual: std.objectHas(result, 'id') && result.id == "test-id",
        expect: true
    },

    testElementHasHtmlContent: {
        local mock_context = {},
        local result = company_info.element(mock_context),
        local has_html_element = std.length(std.filter(
            function(elem) std.objectHas(elem, 'kind') && elem.kind == "html",
            result.elements
        )) > 0,
        actual: has_html_element,
        expect: true
    },

    testHtmlContentHasTable: {
        local mock_context = {},
        local result = company_info.element(mock_context),
        local html_element = std.filter(
            function(elem) std.objectHas(elem, 'kind') && elem.kind == "html",
            result.elements
        )[0],
        local has_table = std.objectHas(html_element, 'root') &&
                         std.objectHas(html_element.root, 'content') &&
                         std.type(html_element.root.content) == "array",
        actual: has_table,
        expect: true
    }
})