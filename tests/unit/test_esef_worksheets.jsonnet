// Phase 5: Unit test for lib/esef/esef-worksheets.jsonnet
local test = import "jsonnetunit/test.libsonnet";
local esef_worksheets = import "lib/esef/esef-worksheets.jsonnet";

test.suite({
    testEsefWorksheetsIsArray: {
        actual: std.type(esef_worksheets),
        expect: "array"
    },

    testEsefWorksheetsNotEmpty: {
        actual: std.length(esef_worksheets) > 0,
        expect: true
    },

    testHasIncomeStatementWorksheet: {
        local income_worksheet = std.filter(
            function(ws) std.objectHas(ws, 'id') && ws.id == "consolidated-statement-of-income",
            esef_worksheets
        ),
        actual: std.length(income_worksheet) > 0,
        expect: true
    },

    testHasFinancialPositionWorksheet: {
        local position_worksheet = std.filter(
            function(ws) std.objectHas(ws, 'id') && ws.id == "financial-position",
            esef_worksheets
        ),
        actual: std.length(position_worksheet) > 0,
        expect: true
    },

    testHasCashFlowsWorksheet: {
        local cashflow_worksheet = std.filter(
            function(ws) std.objectHas(ws, 'id') && ws.id == "cash-flows",
            esef_worksheets
        ),
        actual: std.length(cashflow_worksheet) > 0,
        expect: true
    },

    testIncomeStatementHasCorrectStructure: {
        local income_worksheet = std.filter(
            function(ws) std.objectHas(ws, 'id') && ws.id == "consolidated-statement-of-income",
            esef_worksheets
        )[0],
        actual: std.objectHas(income_worksheet, 'kind') &&
                income_worksheet.kind == "simple" &&
                std.objectHas(income_worksheet, 'computations') &&
                std.type(income_worksheet.computations) == "array",
        expect: true
    },

    testIncomeStatementHasKeyComputations: {
        local income_worksheet = std.filter(
            function(ws) std.objectHas(ws, 'id') && ws.id == "consolidated-statement-of-income",
            esef_worksheets
        )[0],
        local has_revenue = std.length(std.filter(
            function(comp) comp == "operating-revenue",
            income_worksheet.computations
        )) > 0,
        local has_net_profit = std.length(std.filter(
            function(comp) comp == "net-profit",
            income_worksheet.computations
        )) > 0,
        actual: has_revenue && has_net_profit,
        expect: true
    },

    testFinancialPositionHasKeyComputations: {
        local position_worksheet = std.filter(
            function(ws) std.objectHas(ws, 'id') && ws.id == "financial-position",
            esef_worksheets
        )[0],
        local has_assets = std.length(std.filter(
            function(comp) comp == "total-assets",
            position_worksheet.computations
        )) > 0,
        local has_equity = std.length(std.filter(
            function(comp) comp == "equity",
            position_worksheet.computations
        )) > 0,
        actual: has_assets && has_equity,
        expect: true
    },

    testCashFlowsHasKeyComputations: {
        local cashflow_worksheet = std.filter(
            function(ws) std.objectHas(ws, 'id') && ws.id == "cash-flows",
            esef_worksheets
        )[0],
        local has_operating = std.length(std.filter(
            function(comp) comp == "esef-net-cash-from-operating-activities",
            cashflow_worksheet.computations
        )) > 0,
        local has_end_cash = std.length(std.filter(
            function(comp) comp == "esef-cash-at-end-of-year",
            cashflow_worksheet.computations
        )) > 0,
        actual: has_operating && has_end_cash,
        expect: true
    },

    testAllWorksheetsHaveSimpleKind: {
        local all_simple = std.length(std.filter(
            function(ws) std.objectHas(ws, 'kind') && ws.kind == "simple",
            esef_worksheets
        )) == std.length(esef_worksheets),
        actual: all_simple,
        expect: true
    }
})