// Phase 2: Unit test for lib/frs102/directors-report.libsonnet
local test = import "jsonnetunit/test.libsonnet";
local directors_report = import "lib/frs102/directors-report.libsonnet";

test.suite({
    testDirectorsReportIsObject: {
        actual: std.type(directors_report),
        expect: "object"
    },

    testHasElementMethod: {
        actual: std.objectHasAll(directors_report, 'element'),
        expect: true
    },

    testElementMethodIsFunction: {
        actual: std.type(directors_report.element),
        expect: "function"
    },

    testElementCallsResourceMethod: {
        local mock_context = {
            resource(name): {
                called_with: name,
                kind: "directors-report"
            }
        },
        local result = directors_report.element(mock_context),
        actual: std.objectHas(result, 'called_with') && 
                result.called_with == "directors-report",
        expect: true
    }
})