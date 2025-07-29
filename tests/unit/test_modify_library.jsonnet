// Phase 1: Unit test for lib/modify.libsonnet
local test = import "jsonnetunit/test.libsonnet";
local modify_fn = import "lib/modify.libsonnet";

test.suite({
    testModifyLibraryLoads: {
        actual: std.type(modify_fn),
        expect: "function"
    },

    // Test modify function returns object with val
    testModifyFunctionBasic: {
        local test_data = [
            { id: "item1", value: 100 },
            { id: "item2", value: 200 }
        ],
        local result = modify_fn(test_data),
        actual: std.type(result) == "object" &&
                std.objectHas(result, 'val') &&
                std.length(result.val) == 2,
        expect: true
    },

    // Test modify object has required methods
    testModifyObjectHasMethods: {
        local result = modify_fn([]),
        actual: std.objectHasAll(result, 'replace') &&
                std.objectHasAll(result, 'delete') &&
                std.objectHasAll(result, 'insert_after'),
        expect: true
    },

    // Test methods are functions
    testMethodsAreFunctions: {
        local result = modify_fn([]),
        actual: std.type(result.replace) == "function" &&
                std.type(result.delete) == "function" &&
                std.type(result.insert_after) == "function",
        expect: true
    },

    // Test replace method
    testReplaceMethod: {
        local test_data = [
            { id: "item1", value: 100 },
            { id: "item2", value: 200 }
        ],
        local modifier = modify_fn(test_data),
        local result = modifier.replace("item1", { id: "item1", value: 150 }),
        actual: std.length(result.val) == 2 &&
                result.val[0].value == 150 &&
                result.val[1].value == 200,
        expect: true
    },

    // Test delete method
    testDeleteMethod: {
        local test_data = [
            { id: "item1", value: 100 },
            { id: "item2", value: 200 },
            { id: "item3", value: 300 }
        ],
        local modifier = modify_fn(test_data),
        local result = modifier.delete("item2"),
        actual: std.length(result.val) == 2 &&
                result.val[0].id == "item1" &&
                result.val[1].id == "item3",
        expect: true
    },

    // Test insert_after method
    testInsertAfterMethod: {
        local test_data = [
            { id: "item1", value: 100 },
            { id: "item3", value: 300 }
        ],
        local modifier = modify_fn(test_data),
        local new_item = { id: "item2", value: 200 },
        local result = modifier.insert_after("item1", new_item),
        actual: std.length(result.val) == 3 &&
                result.val[0].id == "item1" &&
                result.val[1].id == "item2" &&
                result.val[2].id == "item3",
        expect: true
    },

    // Test insert_after with non-existent id
    testInsertAfterNonExistentId: {
        local test_data = [
            { id: "item1", value: 100 }
        ],
        local modifier = modify_fn(test_data),
        local new_item = { id: "item2", value: 200 },
        local result = modifier.insert_after("non-existent", new_item),
        actual: std.length(result.val) == 1 &&
                result.val[0].id == "item1",
        expect: true
    },

    // Test method chaining
    testMethodChaining: {
        local test_data = [
            { id: "item1", value: 100 },
            { id: "item2", value: 200 },
            { id: "item3", value: 300 }
        ],
        local modifier = modify_fn(test_data),
        local result = modifier.replace("item2", { id: "item2", value: 250 })
                              .delete("item3")
                              .insert_after("item1", { id: "item1.5", value: 150 }),
        actual: std.length(result.val) == 3 &&
                result.val[0].id == "item1" &&
                result.val[1].id == "item1.5" &&
                result.val[2].id == "item2" &&
                result.val[2].value == 250,
        expect: true
    },

    // Test with empty array
    testWithEmptyArray: {
        local modifier = modify_fn([]),
        local new_item = { id: "first", value: 1 },
        local result = modifier.insert_after("non-existent", new_item),
        actual: std.length(result.val) == 0,
        expect: true
    }
})