// Template for unit testing library components
// Copy this file and customize for each component in lib/

local test = import "jsonnetunit/test.libsonnet";
local component = import "lib/COMPONENT_PATH_HERE";

test.suite({
    // Basic loading test - every component should have this
    testComponentLoads: {
        actual: std.type(component),
        expect: "object"
    },

    // Test required fields/functions exist
    testHasRequiredFunctions: {
        actual: std.objectHasAll(component, 'FUNCTION_NAME_HERE'),
        expect: true
    },

    // Test function behavior with valid input
    testFunctionWithValidInput: {
        local input = {
            // Add test input data here
        },
        local result = component.FUNCTION_NAME_HERE(input),
        actual: std.type(result),
        expect: "EXPECTED_TYPE_HERE"
    },

    // Test function behavior with edge cases
    testFunctionWithEmptyInput: {
        local result = component.FUNCTION_NAME_HERE({}),
        actual: std.type(result),
        expect: "EXPECTED_TYPE_HERE"
    },

    // For computation components - test mathematical accuracy
    testMathematicalAccuracy: {
        local test_data = {
            value1: 100,
            value2: 200
        },
        local expected = 300,
        local result = component.calculate_something(test_data),
        actual: result,
        expect: expected
    },

    // For components with arrays - test array handling
    testArrayHandling: {
        local test_array = [1, 2, 3],
        local result = component.process_array(test_array),
        actual: std.length(result),
        expect: 3
    },

    // Test error conditions (if applicable)
    testErrorConditions: {
        // This might test that invalid input produces expected error
        // or returns null/empty result
        local invalid_input = null,
        local result = component.FUNCTION_NAME_HERE(invalid_input),
        actual: result == null || result == {},
        expect: true
    }
})