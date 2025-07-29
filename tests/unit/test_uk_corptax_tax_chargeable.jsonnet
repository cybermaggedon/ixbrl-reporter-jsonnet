// Phase 3: Unit test for lib/uk-corptax/tax-chargeable.libsonnet
local test = import "jsonnetunit/test.libsonnet";

test.suite({
    testTaxChargeableLoads: {
        local tax_chargeable = import "lib/uk-corptax/tax-chargeable.libsonnet",
        actual: std.type(tax_chargeable),
        expect: "object"
    },

    testHasElementMethod: {
        local tax_chargeable = import "lib/uk-corptax/tax-chargeable.libsonnet",
        actual: std.objectHasAll(tax_chargeable, 'element'),
        expect: true
    },

    testElementMethodIsFunction: {
        local tax_chargeable = import "lib/uk-corptax/tax-chargeable.libsonnet",
        actual: std.type(tax_chargeable.element),
        expect: "function"
    },

    testElementReturnsValidStructure: {
        local tax_chargeable = import "lib/uk-corptax/tax-chargeable.libsonnet",
        local mock_context = {},
        local result = tax_chargeable.element(mock_context),
        actual: std.type(result) == "object" &&
                std.objectHas(result, 'kind') &&
                result.kind == "page",
        expect: true
    }
})