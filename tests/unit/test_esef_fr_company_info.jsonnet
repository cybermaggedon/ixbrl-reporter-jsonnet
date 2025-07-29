// Phase 5: Unit test for lib/esef-fr/company-info.libsonnet
local test = import "jsonnetunit/test.libsonnet";
local company_info = import "lib/esef-fr/company-info.libsonnet";

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

    testElementHasHtmlContent: {
        local mock_context = {},
        local result = company_info.element(mock_context),
        local has_html_element = std.length(std.filter(
            function(elem) std.objectHas(elem, 'kind') && elem.kind == "html",
            result.elements
        )) > 0,
        actual: has_html_element,
        expect: true
    }
})