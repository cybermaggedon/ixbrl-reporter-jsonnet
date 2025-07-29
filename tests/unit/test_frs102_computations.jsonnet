// Phase 1 Example: Unit test for lib/frs102/frc102-computations.jsonnet
local test = import "jsonnetunit/test.libsonnet";
local computations_fn = import "lib/frs102/frc102-computations.jsonnet";

// Mock accounts object for testing
local mock_accts = {
    line(id, desc): { id: id, description: desc, kind: "line", in_year(): self },
    sum(id, desc): { id: id, description: desc, kind: "sum", in_year(): self },
    group(id, desc): { id: id, description: desc, kind: "group", in_year(): self }
};

local computations = computations_fn(mock_accts);

test.suite({
    testComputationsFunctionLoads: {
        actual: std.type(computations_fn),
        expect: "function"
    },

    // Basic test - just verify it's callable and returns something
    testComputationsFunctionCallable: {
        actual: std.type(computations),
        expect: "array"
    }
})