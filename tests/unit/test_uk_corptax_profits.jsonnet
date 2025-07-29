// Phase 3: Unit test for lib/uk-corptax/profits.libsonnet
local test = import "jsonnetunit/test.libsonnet";
local profits = import "lib/uk-corptax/profits.libsonnet";

test.suite({
    testProfitsIsObject: {
        actual: std.type(profits),
        expect: "object"
    },

    testHasElementMethod: {
        actual: std.objectHasAll(profits, 'element'),
        expect: true
    },

    testElementMethodIsFunction: {
        actual: std.type(profits.element),
        expect: "function"
    },

    // Test element structure
    testElementReturnsValidStructure: {
        local mock_context = {},
        local result = profits.element(mock_context),
        actual: std.type(result) == "object" &&
                std.objectHas(result, 'kind') &&
                result.kind == "page" &&
                std.objectHas(result, 'elements') &&
                std.type(result.elements) == "array",
        expect: true
    },

    testElementHasFactTable: {
        local mock_context = {},
        local result = profits.element(mock_context),
        local has_facttable = std.length(std.filter(
            function(elem) std.objectHas(elem, 'kind') && elem.kind == "facttable",
            result.elements
        )) > 0,
        actual: has_facttable,
        expect: true
    },

    testFactTableHasTitle: {
        local mock_context = {},
        local result = profits.element(mock_context),
        local facttable = std.filter(
            function(elem) std.objectHas(elem, 'kind') && elem.kind == "facttable",
            result.elements
        )[0],
        actual: std.objectHas(facttable, 'title') &&
                facttable.title == "Profits and gains",
        expect: true
    },

    testFactTableHasFacts: {
        local mock_context = {},
        local result = profits.element(mock_context),
        local facttable = std.filter(
            function(elem) std.objectHas(elem, 'kind') && elem.kind == "facttable",
            result.elements
        )[0],
        actual: std.objectHas(facttable, 'facts') &&
                std.type(facttable.facts) == "array" &&
                std.length(facttable.facts) > 0,
        expect: true
    },

    testFactsContainTradingProfits: {
        local mock_context = {},
        local result = profits.element(mock_context),
        local facttable = std.filter(
            function(elem) std.objectHas(elem, 'kind') && elem.kind == "facttable",
            result.elements
        )[0],
        local trading_profits = std.filter(
            function(fact) std.objectHas(fact, 'id') && fact.id == "adjusted-trading-profit-of-this-period",
            facttable.facts
        ),
        actual: std.length(trading_profits) > 0 &&
                std.objectHas(trading_profits[0], 'description') &&
                trading_profits[0].description == "Trading profits",
        expect: true
    },

    testFactsContainTradingLosses: {
        local mock_context = {},
        local result = profits.element(mock_context),
        local facttable = std.filter(
            function(elem) std.objectHas(elem, 'kind') && elem.kind == "facttable",
            result.elements
        )[0],
        local trading_losses = std.filter(
            function(fact) std.objectHas(fact, 'id') && fact.id == "trading-losses-brought-forward",
            facttable.facts
        ),
        actual: std.length(trading_losses) > 0,
        expect: true
    },

    testFactsContainChargeableProfits: {
        local mock_context = {},
        local result = profits.element(mock_context),
        local facttable = std.filter(
            function(elem) std.objectHas(elem, 'kind') && elem.kind == "facttable",
            result.elements
        )[0],
        local chargeable_profits = std.filter(
            function(fact) std.objectHas(fact, 'id') && fact.id == "total-profits-chargeable-to-corporation-tax",
            facttable.facts
        ),
        actual: std.length(chargeable_profits) > 0 &&
                std.objectHas(chargeable_profits[0], 'description') &&
                chargeable_profits[0].description == "Profits chargeable to Corporation Tax",
        expect: true
    }
})