// Phase 4: Unit test for lib/uk-vat/vat-worksheets.jsonnet
local test = import "jsonnetunit/test.libsonnet";
local vat_worksheets = import "lib/uk-vat/vat-worksheets.jsonnet";

test.suite({
    testVatWorksheetsIsArray: {
        actual: std.type(vat_worksheets),
        expect: "array"
    },

    testVatWorksheetsNotEmpty: {
        actual: std.length(vat_worksheets) > 0,
        expect: true
    },

    testVatWorksheetsHasVatWorksheet: {
        local vat_worksheet = std.filter(
            function(ws) std.objectHas(ws, 'id') && ws.id == "vat",
            vat_worksheets
        ),
        actual: std.length(vat_worksheet) > 0,
        expect: true
    },

    testVatWorksheetHasCorrectStructure: {
        local vat_worksheet = std.filter(
            function(ws) std.objectHas(ws, 'id') && ws.id == "vat",
            vat_worksheets
        )[0],
        actual: std.objectHas(vat_worksheet, 'kind') &&
                vat_worksheet.kind == "simple" &&
                std.objectHas(vat_worksheet, 'computations') &&
                std.type(vat_worksheet.computations) == "array",
        expect: true
    },

    testVatWorksheetHasAllVatBoxes: {
        local vat_worksheet = std.filter(
            function(ws) std.objectHas(ws, 'id') && ws.id == "vat",
            vat_worksheets
        )[0],
        actual: std.length(vat_worksheet.computations) == 9,
        expect: true
    },

    testVatWorksheetContainsVat1: {
        local vat_worksheet = std.filter(
            function(ws) std.objectHas(ws, 'id') && ws.id == "vat",
            vat_worksheets
        )[0],
        local has_vat1 = std.length(std.filter(
            function(comp) comp == "vat1",
            vat_worksheet.computations
        )) > 0,
        actual: has_vat1,
        expect: true
    },

    testVatWorksheetContainsVat9: {
        local vat_worksheet = std.filter(
            function(ws) std.objectHas(ws, 'id') && ws.id == "vat",
            vat_worksheets
        )[0],
        local has_vat9 = std.length(std.filter(
            function(comp) comp == "vat9",
            vat_worksheet.computations
        )) > 0,
        actual: has_vat9,
        expect: true
    },

    testVatWorksheetComputationsAreStrings: {
        local vat_worksheet = std.filter(
            function(ws) std.objectHas(ws, 'id') && ws.id == "vat",
            vat_worksheets
        )[0],
        local all_strings = std.length(std.filter(
            function(comp) std.type(comp) == "string",
            vat_worksheet.computations
        )) == std.length(vat_worksheet.computations),
        actual: all_strings,
        expect: true
    }
})