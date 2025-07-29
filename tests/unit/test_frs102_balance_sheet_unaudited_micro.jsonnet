// Phase 2: Unit test for lib/frs102/balance-sheet-unaudited-micro.libsonnet
local test = import "jsonnetunit/test.libsonnet";
local balance_sheet_unaudited_micro = import "lib/frs102/balance-sheet-unaudited-micro.libsonnet";

test.suite({
    testBalanceSheetUnauditedMicroIsObject: {
        actual: std.type(balance_sheet_unaudited_micro),
        expect: "object"
    },

    testHasElementMethod: {
        actual: std.objectHasAll(balance_sheet_unaudited_micro, 'element'),
        expect: true
    },

    testElementMethodIsFunction: {
        actual: std.type(balance_sheet_unaudited_micro.element),
        expect: "function"
    },

    testHasApprovalMethod: {
        actual: std.objectHasAll(balance_sheet_unaudited_micro, 'approval'),
        expect: true
    },

    testApprovalMethodIsFunction: {
        actual: std.type(balance_sheet_unaudited_micro.approval),
        expect: "function"
    },

    // Test element structure
    testElementReturnsValidStructure: {
        local mock_context = {
            resource(name): "mock-resource"
        },
        local result = balance_sheet_unaudited_micro.element(mock_context),
        actual: std.type(result) == "object" &&
                std.objectHas(result, 'kind') &&
                result.kind == "page" &&
                std.objectHas(result, 'elements') &&
                std.type(result.elements) == "array",
        expect: true
    },

    testElementHasBuilderMethods: {
        local mock_context = {
            resource(name): "mock-resource"
        },
        local result = balance_sheet_unaudited_micro.element(mock_context),
        actual: std.objectHasAll(result, 'with_id') &&
                std.objectHasAll(result, 'with_signature') &&
                std.type(result.with_id) == "function" &&
                std.type(result.with_signature) == "function",
        expect: true
    }
})