// Phase 3: Unit test for lib/uk-corptax/capital-allowances.libsonnet
local test = import "jsonnetunit/test.libsonnet";
local capital_allowances = import "lib/uk-corptax/capital-allowances.libsonnet";

test.suite({
    testCapitalAllowancesIsObject: {
        actual: std.type(capital_allowances),
        expect: "object"
    },

    testHasElementMethod: {
        actual: std.objectHasAll(capital_allowances, 'element'),
        expect: true
    },

    testElementMethodIsFunction: {
        actual: std.type(capital_allowances.element),
        expect: "function"
    },

    // Test element structure
    testElementReturnsValidStructure: {
        local mock_context = {},
        local result = capital_allowances.element(mock_context),
        actual: std.type(result) == "object" &&
                std.objectHas(result, 'kind') &&
                result.kind == "page" &&
                std.objectHas(result, 'elements') &&
                std.type(result.elements) == "array",
        expect: true
    },

    testElementHasFactTable: {
        local mock_context = {},
        local result = capital_allowances.element(mock_context),
        local has_facttable = std.length(std.filter(
            function(elem) std.objectHas(elem, 'kind') && elem.kind == "facttable",
            result.elements
        )) > 0,
        actual: has_facttable,
        expect: true
    },

    testFactTableHasTitle: {
        local mock_context = {},
        local result = capital_allowances.element(mock_context),
        local facttable = std.filter(
            function(elem) std.objectHas(elem, 'kind') && elem.kind == "facttable",
            result.elements
        )[0],
        actual: std.objectHas(facttable, 'title') &&
                facttable.title == "Capital allowances and balancing charges",
        expect: true
    },

    testFactTableHasFacts: {
        local mock_context = {},
        local result = capital_allowances.element(mock_context),
        local facttable = std.filter(
            function(elem) std.objectHas(elem, 'kind') && elem.kind == "facttable",
            result.elements
        )[0],
        actual: std.objectHas(facttable, 'facts') &&
                std.type(facttable.facts) == "array" &&
                std.length(facttable.facts) > 0,
        expect: true
    },

    testFactsContainAnnualInvestmentAllowance: {
        local mock_context = {},
        local result = capital_allowances.element(mock_context),
        local facttable = std.filter(
            function(elem) std.objectHas(elem, 'kind') && elem.kind == "facttable",
            result.elements
        )[0],
        local allowance_fact = std.filter(
            function(fact) std.objectHas(fact, 'id') && fact.id == "annual-investment-allowance",
            facttable.facts
        ),
        actual: std.length(allowance_fact) > 0 &&
                std.objectHas(allowance_fact[0], 'description') &&
                allowance_fact[0].description == "Annual investment allowance",
        expect: true
    }
})