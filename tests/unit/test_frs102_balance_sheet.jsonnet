// Phase 2: Unit test for lib/frs102/balance-sheet.libsonnet
local test = import "jsonnetunit/test.libsonnet";
local balance_sheet = import "lib/frs102/balance-sheet.libsonnet";

test.suite({
    testBalanceSheetIsObject: {
        actual: std.type(balance_sheet),
        expect: "object"
    },

    testHasElementMethod: {
        actual: std.objectHasAll(balance_sheet, 'element'),
        expect: true
    },

    testElementMethodIsFunction: {
        actual: std.type(balance_sheet.element),
        expect: "function"
    },

    testHasApprovalMethod: {
        actual: std.objectHasAll(balance_sheet, 'approval'),
        expect: true
    },

    testApprovalMethodIsFunction: {
        actual: std.type(balance_sheet.approval),
        expect: "function"
    },

    // Test element structure
    testElementReturnsValidStructure: {
        local mock_context = {
            resource(name): "mock-resource"
        },
        local result = balance_sheet.element(mock_context),
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
        local result = balance_sheet.element(mock_context),
        actual: std.objectHasAll(result, 'with_id') &&
                std.objectHasAll(result, 'with_signature') &&
                std.type(result.with_id) == "function" &&
                std.type(result.with_signature) == "function",
        expect: true
    },

    testWithIdBuilder: {
        local mock_context = {
            resource(name): "mock-resource"
        },
        local result = balance_sheet.element(mock_context).with_id("test-id"),
        actual: std.objectHas(result, 'id') && result.id == "test-id",
        expect: true
    },

    testElementHasHtmlContent: {
        local mock_context = {
            resource(name): "mock-resource"
        },
        local result = balance_sheet.element(mock_context),
        local has_html_element = std.length(std.filter(
            function(elem) std.objectHas(elem, 'kind') && elem.kind == "html",
            result.elements
        )) > 0,
        actual: has_html_element,
        expect: true
    },

    testBalanceSheetNotesStructure: {
        actual: std.objectHasAll(balance_sheet, 'balance-sheet-notes-audited-small') &&
                std.type(balance_sheet["balance-sheet-notes-audited-small"]) == "object" &&
                std.objectHas(balance_sheet["balance-sheet-notes-audited-small"], 'kind') &&
                balance_sheet["balance-sheet-notes-audited-small"].kind == "notes",
        expect: true
    }
})