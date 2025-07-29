// Phase 1: Unit test for lib/computations.libsonnet
local test = import "jsonnetunit/test.libsonnet";
local computations = import "lib/computations.libsonnet";

test.suite({
    testComputationsLibraryLoads: {
        actual: std.type(computations),
        expect: "object"
    },

    testHasRequiredFunctions: {
        actual: std.objectHasAll(computations, 'input') &&
                std.objectHasAll(computations, 'inputs') &&
                std.objectHasAll(computations, 'comp_deps') &&
                std.objectHasAll(computations, 'is_met'),
        expect: true
    },

    testFunctionsAreCallable: {
        actual: std.type(computations.input) == "function" &&
                std.type(computations.inputs) == "function" &&
                std.type(computations.comp_deps) == "function" &&
                std.type(computations.is_met) == "function",
        expect: true
    },

    // Test input function with string
    testInputFunctionWithString: {
        local result = computations.input("test-comp"),
        actual: std.type(result) == "array" && 
                std.length(result) == 1 &&
                result[0] == "test-comp",
        expect: true
    },

    // Test input function with object that has inputs
    testInputFunctionWithObject: {
        local comp_with_inputs = { inputs: ["comp1", "comp2"] },
        local result = computations.input(comp_with_inputs),
        actual: std.type(result) == "array" && 
                std.length(result) == 2,
        expect: true
    },

    // Test inputs function with object having inputs array
    testInputsFunctionWithInputsArray: {
        local comp = { inputs: ["asset1", "asset2", "asset3"] },
        local result = computations.inputs(comp),
        actual: std.type(result) == "array" && 
                std.length(result) == 3,
        expect: true
    },

    // Test inputs function with object having single input
    testInputsFunctionWithSingleInput: {
        local comp = { input: "single-comp" },
        local result = computations.inputs(comp),
        actual: std.type(result) == "array" && 
                std.length(result) == 1 &&
                result[0] == "single-comp",
        expect: true
    },

    // Test inputs function with object having no inputs
    testInputsFunctionWithNoInputs: {
        local comp = { id: "no-inputs-comp" },
        local result = computations.inputs(comp),
        actual: std.type(result) == "array" && 
                std.length(result) == 0,
        expect: true
    },

    // Test comp_deps function
    testCompDepsFunctionBasic: {
        local test_comps = [
            { id: "comp1", inputs: ["base1", "base2"] },
            { id: "comp2", input: "base3" }
        ],
        local result = computations.comp_deps(test_comps),
        actual: std.type(result) == "array" && 
                std.length(result) == 2 &&
                result[0].id == "comp1" &&
                std.length(result[0].inputs) == 2,
        expect: true
    },

    // Test is_met function with satisfied dependencies
    testIsMetFunctionSatisfied: {
        local required = ["comp1", "comp2"],
        local available = ["comp1", "comp2", "comp3"],
        local result = computations.is_met(required, available),
        actual: result == true,
        expect: true
    },

    // Test is_met function with unsatisfied dependencies
    testIsMetFunctionUnsatisfied: {
        local required = ["comp1", "comp2", "comp3"],
        local available = ["comp1", "comp2"],
        local result = computations.is_met(required, available),
        actual: result == false,
        expect: true
    }
})