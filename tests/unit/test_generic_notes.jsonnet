// Phase 1: Unit test for lib/generic/notes.libsonnet
local test = import "jsonnetunit/test.libsonnet";
local notes = import "lib/generic/notes.libsonnet";

test.suite({
    testNotesLibraryLoads: {
        actual: std.type(notes),
        expect: "object"
    },

    testHasElementFunction: {
        actual: std.objectHasAll(notes, 'element'),
        expect: true
    },

    testElementIsFunction: {
        actual: std.type(notes.element),
        expect: "function"
    },

    // Test notes element with mock resource function
    testNotesElementWithMockResource: {
        local mock_context = {
            resource(name): if name == "notes" then "mock-notes-content" else null
        },
        local result = notes.element(mock_context),
        actual: result == "mock-notes-content",
        expect: true
    },

    // Test notes element calls resource with correct parameter
    testNotesElementCallsResourceWithNotes: {
        local mock_context = {
            resource_called: false,
            resource_param: null,
            resource(name): self + { resource_called: true, resource_param: name } + 
                           if name == "notes" then { result: "notes-data" } else { result: null }
        },
        local result = notes.element(mock_context),
        actual: std.objectHas(result, 'resource_called') && 
                result.resource_called == true &&
                result.resource_param == "notes",
        expect: true
    },

    // Test notes element behavior with different resource implementations
    testNotesElementWithDifferentResource: {
        local context_with_object = {
            resource(name): if name == "notes" then { 
                content: "Financial notes", 
                type: "notes" 
            } else null
        },
        local result = notes.element(context_with_object),
        actual: std.type(result) == "object" &&
                std.objectHas(result, 'content') &&
                result.content == "Financial notes",
        expect: true
    },

    // Test notes element with null resource
    testNotesElementWithNullResource: {
        local context_with_null = {
            resource(name): null
        },
        local result = notes.element(context_with_null),
        actual: result == null,
        expect: true
    }
})