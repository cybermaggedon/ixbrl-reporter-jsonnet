// Phase 2: Unit test for lib/frs102/approval.libsonnet
local test = import "jsonnetunit/test.libsonnet";
local approval = import "lib/frs102/approval.libsonnet";

test.suite({
    testApprovalIsObject: {
        actual: std.type(approval),
        expect: "object"
    },

    testHasElementMethod: {
        actual: std.objectHasAll(approval, 'element'),
        expect: true
    },

    testElementMethodIsFunction: {
        actual: std.type(approval.element),
        expect: "function"
    }
})