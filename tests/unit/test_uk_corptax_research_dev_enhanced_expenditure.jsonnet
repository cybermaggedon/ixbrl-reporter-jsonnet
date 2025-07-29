// Phase 3: Unit test for lib/uk-corptax/research-dev-enhanced-expenditure.libsonnet
local test = import "jsonnetunit/test.libsonnet";

test.suite({
    testResearchDevEnhancedExpenditureLoads: {
        local research_dev_enhanced = import "lib/uk-corptax/research-dev-enhanced-expenditure.libsonnet",
        actual: std.type(research_dev_enhanced),
        expect: "object"
    },

    testHasElementMethod: {
        local research_dev_enhanced = import "lib/uk-corptax/research-dev-enhanced-expenditure.libsonnet",
        actual: std.objectHasAll(research_dev_enhanced, 'element'),
        expect: true
    },

    testElementMethodIsFunction: {
        local research_dev_enhanced = import "lib/uk-corptax/research-dev-enhanced-expenditure.libsonnet",
        actual: std.type(research_dev_enhanced.element),
        expect: "function"
    },

    testElementReturnsValidStructure: {
        local research_dev_enhanced = import "lib/uk-corptax/research-dev-enhanced-expenditure.libsonnet",
        local mock_context = {},
        local result = research_dev_enhanced.element(mock_context),
        actual: std.type(result) == "object" &&
                std.objectHas(result, 'kind') &&
                result.kind == "page",
        expect: true
    }
})