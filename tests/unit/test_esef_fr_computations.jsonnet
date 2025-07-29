// Phase 1: Unit test for lib/esef-fr/esef-computations.jsonnet
local test = import "jsonnetunit/test.libsonnet";
local esef_fr_computations = import "lib/esef-fr/esef-computations.jsonnet";

test.suite({
    // Test that computations function loads
    testEsefFrComputationsIsFunction: {
        actual: std.type(esef_fr_computations),
        expect: "function"
    },

    // Test that function returns array when called with mock context
    testEsefFrComputationsReturnsArray: {
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
        local result = esef_fr_computations(mock_context),
        actual: std.type(result) == "array",
        expect: true
    },

    // Test that array is not empty
    testEsefFrComputationsNotEmpty: {
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
        local result = esef_fr_computations(mock_context),
        actual: std.length(result) > 0,
        expect: true
    },

    // Test that it contains French descriptions (French ESEF localization)
    testEsefFrComputationsHasFrenchText: {
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
        local result = esef_fr_computations(mock_accts),
        local main_income_item = std.filter(
            function(x) std.objectHas(x, 'id') && x.id == "main-income",
            result
        )[0],
        actual: std.objectHas(main_income_item, 'description') && 
                std.findSubstr("Revenu", main_income_item.description) != [],
        expect: true
    },

    // Test that it contains main income computation
    testEsefFrComputationsHasMainIncome: {
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
        local result = esef_fr_computations(mock_accts),
        local main_income_found = std.length(std.filter(
            function(x) std.objectHas(x, 'id') && x.id == "main-income",
            result
        )) > 0,
        actual: main_income_found,
        expect: true
    },

    // Test that it contains balance sheet items
    testEsefFrComputationsHasBalanceSheetItems: {
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
        local result = esef_fr_computations(mock_accts),
        local total_assets_found = std.length(std.filter(
            function(x) std.objectHas(x, 'id') && x.id == "total-assets",
            result
        )) > 0,
        actual: total_assets_found,
        expect: true
    },

    // Test that it contains cash flow items
    testEsefFrComputationsHasCashFlowItems: {
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
        local result = esef_fr_computations(mock_accts),
        local cash_flows_found = std.length(std.filter(
            function(x) std.objectHas(x, 'id') && std.startsWith(x.id, "esef-net-cash"),
            result
        )) > 0,
        actual: cash_flows_found,
        expect: true
    }
})