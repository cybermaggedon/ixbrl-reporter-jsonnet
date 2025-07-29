// Phase 1: Unit test for lib/uk-corptax/ct-computations.jsonnet
local test = import "jsonnetunit/test.libsonnet";
local ct_computations = import "lib/uk-corptax/ct-computations.jsonnet";

// Simple mock that supports all the chained methods needed
local mockElement = {
    in_year(): self,
    at_end(): self,
    at_start(): self,
    down(): self,
    reverse_sign(): self,
    nearest(): self,
    greater(): self,
    less(): self,
    segment(key, val): self,
    with_factor(f): self,
    whole_period(p): self,
    proportion_period(p): self
};

test.suite({
    // Test that computations function loads
    testCtComputationsIsFunction: {
        actual: std.type(ct_computations),
        expect: "function"
    },

    // Test that function returns array when called with mock context
    testCtComputationsReturnsArray: {
        local mock_context = {
            line(id, desc): { id: id, description: desc, kind: "line" } + mockElement,
            group(id, desc): { id: id, description: desc, kind: "group" } + mockElement,
            sum(id, desc): { id: id, description: desc, kind: "sum" } + mockElement,
            round(id, desc): { id: id, description: desc, kind: "round" } + mockElement,
            factor(id, desc): { id: id, description: desc, kind: "factor" } + mockElement,
            compare(id, desc): { id: id, description: desc, kind: "compare" } + mockElement,
            apportion(id, desc): { id: id, description: desc, kind: "apportion" } + mockElement
        },
        actual: std.type(ct_computations(mock_context)) == "array",
        expect: true
    },

    // Test that array is not empty
    testCtComputationsNotEmpty: {
        local mock_context = {
            line(id, desc): { id: id, description: desc, kind: "line" } + mockElement,
            group(id, desc): { id: id, description: desc, kind: "group" } + mockElement,
            sum(id, desc): { id: id, description: desc, kind: "sum" } + mockElement,
            round(id, desc): { id: id, description: desc, kind: "round" } + mockElement,
            factor(id, desc): { id: id, description: desc, kind: "factor" } + mockElement,
            compare(id, desc): { id: id, description: desc, kind: "compare" } + mockElement,
            apportion(id, desc): { id: id, description: desc, kind: "apportion" } + mockElement
        },
        actual: std.length(ct_computations(mock_context)) > 0,
        expect: true
    }
})