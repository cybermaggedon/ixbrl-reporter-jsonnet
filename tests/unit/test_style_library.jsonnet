// Phase 1: Unit test for lib/style.jsonnet
local test = import "jsonnetunit/test.libsonnet";
local style = import "lib/style.jsonnet";

test.suite({
    testStyleLibraryLoads: {
        actual: std.type(style),
        expect: "string"
    },

    testStyleContentNotEmpty: {
        actual: std.length(style) > 0,
        expect: true
    },

    // Test that it contains CSS-like content
    testContainsCSSLikeContent: {
        actual: std.findSubstr(".", style) != [] || 
                std.findSubstr("{", style) != [] ||
                std.findSubstr("}", style) != [],
        expect: true
    },

    // Test basic CSS structure patterns
    testContainsBasicCSSPatterns: {
        local has_selectors = std.findSubstr(".", style) != [],
        local has_braces = std.findSubstr("{", style) != [] && std.findSubstr("}", style) != [],
        actual: has_selectors || has_braces,
        expect: true
    }
})