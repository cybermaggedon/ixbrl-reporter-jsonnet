// Phase 2: Unit test for lib/frs102/simple-notes.libsonnet
local test = import "jsonnetunit/test.libsonnet";

test.suite({
    testSimpleNotesLoads: {
        local simple_notes = import "lib/frs102/simple-notes.libsonnet",
        actual: std.type(simple_notes),
        expect: "object"
    },

    testHasElementMethod: {
        local simple_notes = import "lib/frs102/simple-notes.libsonnet",
        actual: std.objectHasAll(simple_notes, 'element'),
        expect: true
    },

    testElementMethodIsFunction: {
        local simple_notes = import "lib/frs102/simple-notes.libsonnet",
        actual: std.type(simple_notes.element),
        expect: "function"
    },

    testElementReturnsValidStructure: {
        local simple_notes = import "lib/frs102/simple-notes.libsonnet",
        local mock_context = {},
        local result = simple_notes.element(mock_context),
        actual: std.type(result) == "object" &&
                std.objectHas(result, 'kind') &&
                result.kind == "page" &&
                std.objectHas(result, 'elements') &&
                std.type(result.elements) == "array",
        expect: true
    },

    testElementHasWithIdBuilder: {
        local simple_notes = import "lib/frs102/simple-notes.libsonnet",
        local mock_context = {},
        local result = simple_notes.element(mock_context),
        actual: std.objectHasAll(result, 'with_id') &&
                std.type(result.with_id) == "function",
        expect: true
    },

    testHasCompanyInfoNoteMethod: {
        local simple_notes = import "lib/frs102/simple-notes.libsonnet",
        actual: std.objectHasAll(simple_notes, 'companyinfonote'),
        expect: true
    },

    testHasEmployeeCountsNoteMethod: {
        local simple_notes = import "lib/frs102/simple-notes.libsonnet",
        actual: std.objectHasAll(simple_notes, 'employeecountsnote'),
        expect: true
    }
})