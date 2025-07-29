// Phase 1: Unit test for lib/uk-vat/vat-computations.jsonnet
local test = import "jsonnetunit/test.libsonnet";
local vat_computations = import "lib/uk-vat/vat-computations.jsonnet";

test.suite({
    // Test that computations is an object with computations method
    testVatComputationsIsObject: {
        actual: std.type(vat_computations),
        expect: "object"
    },

    // Test that it has computations method
    testVatComputationsHasComputationsMethod: {
        actual: std.objectHasAll(vat_computations, 'computations'),
        expect: true
    },

    // Test that computations method is function
    testVatComputationsMethodIsFunction: {
        actual: std.type(vat_computations.computations),
        expect: "function"
    },

    // Test that computations method returns array
    testVatComputationsReturnsArray: {
        local mock_context = {
            resource(name): {
                "vat-output-sales": [{ account: "sales", reversed: false }],
                "vat-output-acquisitions": [{ account: "acquisitions", reversed: false }],
                "vat-input": [{ account: "input-vat", reversed: false }],
                "total-vatex-sales": [{ account: "ex-vat-sales", reversed: false }],
                "total-vatex-purchases": [{ account: "ex-vat-purchases", reversed: false }],
                "total-vatex-goods-supplied": [{ account: "ex-vat-goods", reversed: false }],
                "total-vatex-acquisitions": [{ account: "ex-vat-acq", reversed: false }]
            }[name]
        },
        local result = vat_computations.computations(mock_context),
        actual: std.type(result) == "array",
        expect: true
    },

    // Test that computations array is not empty
    testVatComputationsNotEmpty: {
        local mock_context = {
            resource(name): {
                "vat-output-sales": [{ account: "sales", reversed: false }],
                "vat-output-acquisitions": [{ account: "acquisitions", reversed: false }],
                "vat-input": [{ account: "input-vat", reversed: false }],
                "total-vatex-sales": [{ account: "ex-vat-sales", reversed: false }],
                "total-vatex-purchases": [{ account: "ex-vat-purchases", reversed: false }],
                "total-vatex-goods-supplied": [{ account: "ex-vat-goods", reversed: false }],
                "total-vatex-acquisitions": [{ account: "ex-vat-acq", reversed: false }]
            }[name]
        },
        local result = vat_computations.computations(mock_context),
        actual: std.length(result) > 0,
        expect: true
    },

    // Test that it contains VAT boxes 1-9
    testVatComputationsHasVatBoxes: {
        local mock_context = {
            resource(name): {
                "vat-output-sales": [{ account: "sales", reversed: false }],
                "vat-output-acquisitions": [{ account: "acquisitions", reversed: false }],
                "vat-input": [{ account: "input-vat", reversed: false }],
                "total-vatex-sales": [{ account: "ex-vat-sales", reversed: false }],
                "total-vatex-purchases": [{ account: "ex-vat-purchases", reversed: false }],
                "total-vatex-goods-supplied": [{ account: "ex-vat-goods", reversed: false }],
                "total-vatex-acquisitions": [{ account: "ex-vat-acq", reversed: false }]
            }[name]
        },
        local result = vat_computations.computations(mock_context),
        local vat_boxes = std.filter(
            function(x) std.objectHas(x, 'id') && std.startsWith(x.id, "vat") && std.length(x.id) == 4,
            result
        ),
        actual: std.length(vat_boxes) >= 9,
        expect: true
    },

    // Test that it contains vat-output computation
    testVatComputationsHasVatOutput: {
        local mock_context = {
            resource(name): {
                "vat-output-sales": [{ account: "sales", reversed: false }],
                "vat-output-acquisitions": [{ account: "acquisitions", reversed: false }],
                "vat-input": [{ account: "input-vat", reversed: false }],
                "total-vatex-sales": [{ account: "ex-vat-sales", reversed: false }],
                "total-vatex-purchases": [{ account: "ex-vat-purchases", reversed: false }],
                "total-vatex-goods-supplied": [{ account: "ex-vat-goods", reversed: false }],
                "total-vatex-acquisitions": [{ account: "ex-vat-acq", reversed: false }]
            }[name]
        },
        local result = vat_computations.computations(mock_context),
        local vat_output_found = std.length(std.filter(
            function(x) std.objectHas(x, 'id') && x.id == "vat-output",
            result
        )) > 0,
        actual: vat_output_found,
        expect: true
    },

    // Test that it contains vat-due computation
    testVatComputationsHasVatDue: {
        local mock_context = {
            resource(name): {
                "vat-output-sales": [{ account: "sales", reversed: false }],
                "vat-output-acquisitions": [{ account: "acquisitions", reversed: false }],
                "vat-input": [{ account: "input-vat", reversed: false }],
                "total-vatex-sales": [{ account: "ex-vat-sales", reversed: false }],
                "total-vatex-purchases": [{ account: "ex-vat-purchases", reversed: false }],
                "total-vatex-goods-supplied": [{ account: "ex-vat-goods", reversed: false }],
                "total-vatex-acquisitions": [{ account: "ex-vat-acq", reversed: false }]
            }[name]
        },
        local result = vat_computations.computations(mock_context),
        local vat_due_found = std.length(std.filter(
            function(x) std.objectHas(x, 'id') && x.id == "vat-due",
            result
        )) > 0,
        actual: vat_due_found,
        expect: true
    }
})