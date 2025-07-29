// Phase 2: Unit test for lib/frs102/auditors-report.libsonnet
local test = import "jsonnetunit/test.libsonnet";

test.suite({
    testAuditorsReportLoads: {
        local auditors_report = import "lib/frs102/auditors-report.libsonnet",
        actual: std.type(auditors_report),
        expect: "object"
    },

    testHasElementMethod: {
        local auditors_report = import "lib/frs102/auditors-report.libsonnet",
        actual: std.objectHasAll(auditors_report, 'element'),
        expect: true
    },

    testElementMethodIsFunction: {
        local auditors_report = import "lib/frs102/auditors-report.libsonnet",
        actual: std.type(auditors_report.element),
        expect: "function"
    },

    testElementCallsResourceMethod: {
        local auditors_report = import "lib/frs102/auditors-report.libsonnet",
        local mock_context = {
            resource(name): {
                called_with: name,
                kind: "auditors-report"
            }
        },
        local result = auditors_report.element(mock_context),
        actual: std.objectHas(result, 'called_with') && 
                result.called_with == "auditors-report",
        expect: true
    }
})