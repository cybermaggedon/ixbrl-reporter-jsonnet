// Phase 3: Unit test for lib/uk-corptax/front-page.libsonnet
local test = import "jsonnetunit/test.libsonnet";
local front_page = import "lib/uk-corptax/front-page.libsonnet";

test.suite({
    testFrontPageIsObject: {
        actual: std.type(front_page),
        expect: "object"
    },

    testHasElementMethod: {
        actual: std.objectHasAll(front_page, 'element'),
        expect: true
    },

    testElementMethodIsFunction: {
        actual: std.type(front_page.element),
        expect: "function"
    },

    // Test element structure
    testElementReturnsValidStructure: {
        local mock_context = {},
        local result = front_page.element(mock_context),
        actual: std.type(result) == "object" &&
                std.objectHas(result, 'kind') &&
                result.kind == "page" &&
                std.objectHas(result, 'elements') &&
                std.type(result.elements) == "array",
        expect: true
    },

    testElementHasFactTable: {
        local mock_context = {},
        local result = front_page.element(mock_context),
        local has_facttable = std.length(std.filter(
            function(elem) std.objectHas(elem, 'kind') && elem.kind == "facttable",
            result.elements
        )) > 0,
        actual: has_facttable,
        expect: true
    },

    testFactTableHasTitle: {
        local mock_context = {},
        local result = front_page.element(mock_context),
        local facttable = std.filter(
            function(elem) std.objectHas(elem, 'kind') && elem.kind == "facttable",
            result.elements
        )[0],
        actual: std.objectHas(facttable, 'title') &&
                facttable.title == "Corporation Tax Return",
        expect: true
    },

    testFactTableHasFacts: {
        local mock_context = {},
        local result = front_page.element(mock_context),
        local facttable = std.filter(
            function(elem) std.objectHas(elem, 'kind') && elem.kind == "facttable",
            result.elements
        )[0],
        actual: std.objectHas(facttable, 'facts') &&
                std.type(facttable.facts) == "array" &&
                std.length(facttable.facts) > 0,
        expect: true
    },

    testFactsContainCompanyName: {
        local mock_context = {},
        local result = front_page.element(mock_context),
        local facttable = std.filter(
            function(elem) std.objectHas(elem, 'kind') && elem.kind == "facttable",
            result.elements
        )[0],
        local company_name_fact = std.filter(
            function(fact) std.objectHas(fact, 'id') && fact.id == "company-name",
            facttable.facts
        ),
        actual: std.length(company_name_fact) > 0 &&
                std.objectHas(company_name_fact[0], 'description') &&
                company_name_fact[0].description == "Company name",
        expect: true
    },

    testFactsContainTaxReference: {
        local mock_context = {},
        local result = front_page.element(mock_context),
        local facttable = std.filter(
            function(elem) std.objectHas(elem, 'kind') && elem.kind == "facttable",
            result.elements
        )[0],
        local tax_ref_fact = std.filter(
            function(fact) std.objectHas(fact, 'id') && fact.id == "tax-reference",
            facttable.facts
        ),
        actual: std.length(tax_ref_fact) > 0 &&
                std.objectHas(tax_ref_fact[0], 'description') &&
                tax_ref_fact[0].description == "Tax reference",
        expect: true
    },

    testFactsContainPeriodDates: {
        local mock_context = {},
        local result = front_page.element(mock_context),
        local facttable = std.filter(
            function(elem) std.objectHas(elem, 'kind') && elem.kind == "facttable",
            result.elements
        )[0],
        local period_facts = std.filter(
            function(fact) std.objectHas(fact, 'id') && (
                fact.id == "return-period-start" || 
                fact.id == "return-period-end"
            ),
            facttable.facts
        ),
        actual: std.length(period_facts) == 2,
        expect: true
    }
})