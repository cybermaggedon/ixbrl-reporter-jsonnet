// Phase 1: Unit test for lib/esef-en/esef-computations.jsonnet
local test = import "jsonnetunit/test.libsonnet";
local esef_en_computations = import "lib/esef-en/esef-computations.jsonnet";

test.suite({
    // Test that computations function loads
    testEsefEnComputationsIsFunction: {
        actual: std.type(esef_en_computations),
        expect: "function"
    },

    // Test that function returns array when called with mock context
    testEsefEnComputationsReturnsArray: {
        local mock_context = {
            line(id, desc): { 
                id: id, 
                description: desc, 
                kind: "line",
                in_year(): self,
                at_end(): self,
                at_start(): self,
                reverse_sign(): self
            },
            group(id, desc): { 
                id: id, 
                description: desc, 
                kind: "group",
                in_year(): self,
                at_end(): self
            },
            sum(id, desc): { 
                id: id, 
                description: desc, 
                kind: "sum",
                in_year(): self,
                at_end(): self
            }
        },
        local result = esef_en_computations(mock_context),
        actual: std.type(result) == "array",
        expect: true
    },

    // Test that array is not empty
    testEsefEnComputationsNotEmpty: {
        local mock_context = {
            line(id, desc): { 
                id: id, 
                description: desc, 
                kind: "line",
                in_year(): self,
                at_end(): self,
                at_start(): self,
                reverse_sign(): self
            },
            group(id, desc): { 
                id: id, 
                description: desc, 
                kind: "group",
                in_year(): self,
                at_end(): self
            },
            sum(id, desc): { 
                id: id, 
                description: desc, 
                kind: "sum",
                in_year(): self,
                at_end(): self
            }
        },
        local result = esef_en_computations(mock_context),
        actual: std.length(result) > 0,
        expect: true
    },

    // Test that it contains main income computation
    testEsefEnComputationsHasMainIncome: {
        local mock_accts = {
            line(id, desc): {
                id: id,
                description: desc,
                kind: "line",
                in_year(): self,
                at_end(): self,
                at_start(): self,
                reverse_sign(): self
            },
            group(id, desc): { 
                id: id, 
                description: desc, 
                kind: "group",
                in_year(): self,
                at_end(): self 
            },
            sum(id, desc): { 
                id: id, 
                description: desc, 
                kind: "sum",
                in_year(): self,
                at_end(): self 
            }
        },
        local result = esef_en_computations(mock_accts),
        local main_income_found = std.length(std.filter(
            function(x) std.objectHas(x, 'id') && x.id == "main-income",
            result
        )) > 0,
        actual: main_income_found,
        expect: true
    },

    // Test that it contains balance sheet items
    testEsefEnComputationsHasBalanceSheetItems: {
        local mock_accts = {
            line(id, desc): {
                id: id,
                description: desc,
                kind: "line",
                in_year(): self,
                at_end(): self,
                at_start(): self,
                reverse_sign(): self
            },
            group(id, desc): { 
                id: id, 
                description: desc, 
                kind: "group",
                in_year(): self,
                at_end(): self 
            },
            sum(id, desc): { 
                id: id, 
                description: desc, 
                kind: "sum",
                in_year(): self,
                at_end(): self 
            }
        },
        local result = esef_en_computations(mock_accts),
        local total_assets_found = std.length(std.filter(
            function(x) std.objectHas(x, 'id') && x.id == "total-assets",
            result
        )) > 0,
        actual: total_assets_found,
        expect: true
    },

    // Test that it contains cash flow items
    testEsefEnComputationsHasCashFlowItems: {
        local mock_accts = {
            line(id, desc): {
                id: id,
                description: desc,
                kind: "line",
                in_year(): self,
                at_end(): self,
                at_start(): self,
                reverse_sign(): self
            },
            group(id, desc): { 
                id: id, 
                description: desc, 
                kind: "group",
                in_year(): self,
                at_end(): self 
            },
            sum(id, desc): { 
                id: id, 
                description: desc, 
                kind: "sum",
                in_year(): self,
                at_end(): self 
            }
        },
        local result = esef_en_computations(mock_accts),
        local cash_flows_found = std.length(std.filter(
            function(x) std.objectHas(x, 'id') && std.startsWith(x.id, "esef-net-cash"),
            result
        )) > 0,
        actual: cash_flows_found,
        expect: true
    },

    // Test that it contains operating revenue
    testEsefEnComputationsHasOperatingRevenue: {
        local mock_accts = {
            line(id, desc): {
                id: id,
                description: desc,
                kind: "line",
                in_year(): self,
                at_end(): self,
                at_start(): self,
                reverse_sign(): self
            },
            group(id, desc): { 
                id: id, 
                description: desc, 
                kind: "group",
                in_year(): self,
                at_end(): self 
            },
            sum(id, desc): { 
                id: id, 
                description: desc, 
                kind: "sum",
                in_year(): self,
                at_end(): self 
            }
        },
        local result = esef_en_computations(mock_accts),
        local operating_revenue_found = std.length(std.filter(
            function(x) std.objectHas(x, 'id') && x.id == "operating-revenue",
            result
        )) > 0,
        actual: operating_revenue_found,
        expect: true
    }
})