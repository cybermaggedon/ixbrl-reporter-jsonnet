// Phase 2: Unit test for lib/frs102/notes.libsonnet
local test = import "jsonnetunit/test.libsonnet";
local notes = import "lib/frs102/notes.libsonnet";

test.suite({
    testNotesIsObject: {
        actual: std.type(notes),
        expect: "object"
    },

    testHasElementMethod: {
        actual: std.objectHasAll(notes, 'element'),
        expect: true
    },

    testElementMethodIsFunction: {
        actual: std.type(notes.element),
        expect: "function"
    },

    testElementCallsResourceMethod: {
        local mock_context = {
            resource(name): {
                called_with: name,
                kind: "notes",
                notes: []
            }
        },
        local result = notes.element(mock_context),
        actual: std.objectHas(result, 'called_with') && 
                result.called_with == "notes",
        expect: true
    }
})