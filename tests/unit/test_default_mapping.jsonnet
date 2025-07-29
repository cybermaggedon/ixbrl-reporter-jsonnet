local test = import "jsonnetunit/test.libsonnet";
local mapping = import "lib/default-mapping.jsonnet";

test.suite({
    // Test that default mapping loads successfully
    testMappingIsObject: {
        actual: std.type(mapping),
        expect: "object"
    },

    // Test that hidden fields exist (using std.objectHasAll for hidden fields)
    testHasLineInputs: {
        actual: std.objectHasAll(mapping, 'line_inputs'),
        expect: true
    },

    // Test specific mapping entries exist
    testHasSalariesMapping: {
        actual: std.objectHasAll(mapping.line_inputs, 'salaries'),
        expect: true
    },

    testHasIncomeMapping: {
        actual: std.objectHasAll(mapping.line_inputs, 'income'),
        expect: true
    },

    // Test that salaries mapping is an array
    testSalariesMappingIsArray: {
        actual: std.type(mapping.line_inputs.salaries),
        expect: "array"
    }
})