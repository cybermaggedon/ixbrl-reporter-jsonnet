// Phase 1: Unit test for lib/generic/facttable.libsonnet
local test = import "jsonnetunit/test.libsonnet";
local facttable = import "lib/generic/facttable.libsonnet";

test.suite({
    testFacttableLibraryLoads: {
        actual: std.type(facttable),
        expect: "object"
    },

    testHasElementFunction: {
        actual: std.objectHasAll(facttable, 'element'),
        expect: true
    },

    testElementIsFunction: {
        actual: std.type(facttable.element),
        expect: "function"
    },

    // Test facttable element generation
    testFacttableElementGeneration: {
        local result = facttable.element({}),
        actual: std.objectHas(result, 'kind') && result.kind == "facttable",
        expect: true
    },

    // Test element has all builder methods
    testElementHasMethods: {
        local result = facttable.element({}),
        actual: std.objectHasAll(result, 'with_id') &&
                std.objectHasAll(result, 'with_facts') &&
                std.objectHasAll(result, 'with_title') &&
                std.objectHasAll(result, 'with_elements'),
        expect: true
    },

    // Test methods are functions
    testMethodsAreFunctions: {
        local result = facttable.element({}),
        actual: std.type(result.with_id) == "function" &&
                std.type(result.with_facts) == "function" &&
                std.type(result.with_title) == "function" &&
                std.type(result.with_elements) == "function",
        expect: true
    },

    // Test with_id method
    testWithIdMethod: {
        local result = facttable.element({}).with_id("fact-table-1"),
        actual: std.objectHas(result, 'id') && result.id == "fact-table-1",
        expect: true
    },

    // Test with_facts method
    testWithFactsMethod: {
        local test_facts = ["fact1", "fact2", "fact3"],
        local result = facttable.element({}).with_facts(test_facts),
        actual: std.objectHas(result, 'facts') && 
                std.type(result.facts) == "array" &&
                std.length(result.facts) == 3,
        expect: true
    },

    // Test with_title method
    testWithTitleMethod: {
        local result = facttable.element({}).with_title("Financial Facts"),
        actual: std.objectHas(result, 'title') && result.title == "Financial Facts",
        expect: true
    },

    // Test with_elements method
    testWithElementsMethod: {
        local test_elements = ["elem1", "elem2"],
        local result = facttable.element({}).with_elements(test_elements),
        actual: std.objectHas(result, 'elements') && 
                std.type(result.elements) == "array" &&
                std.length(result.elements) == 2,
        expect: true
    },

    // Test complete method chaining
    testCompleteMethodChaining: {
        local test_facts = ["balance", "profit"],
        local result = facttable.element({})
                               .with_id("complete-table")
                               .with_title("Balance Sheet")
                               .with_facts(test_facts),
        actual: result.kind == "facttable" &&
                result.id == "complete-table" &&
                result.title == "Balance Sheet" &&
                std.length(result.facts) == 2,
        expect: true
    }
})