// Phase 2: Unit test for lib/frs102/accountants-report.libsonnet
local test = import "jsonnetunit/test.libsonnet";

test.suite({
    testAccountantsReportLoads: {
        local accountants_report = import "lib/frs102/accountants-report.libsonnet",
        actual: std.type(accountants_report),
        expect: "object"
    },

    testHasElementMethod: {
        local accountants_report = import "lib/frs102/accountants-report.libsonnet",
        actual: std.objectHasAll(accountants_report, 'element'),
        expect: true
    },

    testElementMethodIsFunction: {
        local accountants_report = import "lib/frs102/accountants-report.libsonnet",
        actual: std.type(accountants_report.element),
        expect: "function"
    },

    testElementCallsResourceMethod: {
        local accountants_report = import "lib/frs102/accountants-report.libsonnet",
        local mock_context = {
            resource(name): {
                called_with: name,
                kind: "accountants-report"
            }
        },
        local result = accountants_report.element(mock_context),
        actual: std.objectHas(result, 'called_with') && 
                result.called_with == "accountants-report",
        expect: true
    }
})