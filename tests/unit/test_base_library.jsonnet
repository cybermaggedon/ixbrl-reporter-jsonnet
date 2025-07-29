// Phase 1 Example: Unit test for lib/base.libsonnet
local test = import "jsonnetunit/test.libsonnet";
local base = import "lib/base.libsonnet";

test.suite({
    testBaseLibraryLoads: {
        actual: std.type(base),
        expect: "object"
    },

    testHasConfigFunction: {
        actual: std.objectHasAll(base, 'config'),
        expect: true
    },

    testConfigIsFunction: {
        actual: std.type(base.config),
        expect: "function"
    },

    // Test config function returns object
    testConfigReturnsObject: {
        local result = base.config(),
        actual: std.type(result),
        expect: "object"
    },

    // Test config has required methods
    testConfigHasMethods: {
        local config = base.config(),
        actual: std.objectHasAll(config, 'with_accounts_file') &&
                std.objectHasAll(config, 'with_accounts_kind'),
        expect: true
    },

    // Test methods are functions
    testMethodsAreFunctions: {
        local config = base.config(),
        actual: std.type(config.with_accounts_file) == "function" &&
                std.type(config.with_accounts_kind) == "function",
        expect: true
    }
})