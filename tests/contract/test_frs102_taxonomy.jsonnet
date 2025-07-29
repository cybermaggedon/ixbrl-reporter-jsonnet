// CRITICAL: Test FRS-102 taxonomy compliance for UK Companies House filings
local test = import "jsonnetunit/test.libsonnet";
local taxonomy = import "taxonomy/frs102.jsonnet";

test.suite({
    testTaxonomyLoads: {
        actual: std.type(taxonomy),
        expect: "object"
    },

    testRequiredStructure: {
        actual: std.objectHas(taxonomy, 'schema') &&
                std.objectHas(taxonomy, 'namespaces') &&
                std.objectHas(taxonomy, 'contexts'),
        expect: true
    },

    // Test official UK FRC schema reference
    testOfficialFRCSchema: {
        local has_frc_schema = std.any([
            std.startsWith(url, "https://xbrl.frc.org.uk/FRS-102/")
            for url in taxonomy.schema
        ]),
        actual: has_frc_schema,
        expect: true
    },

    // Test required UK regulatory namespaces
    testUKRegulatoryNamespaces: {
        local required_namespaces = ['uk-bus', 'uk-core', 'uk-direp'],
        local has_required = std.all([
            std.objectHas(taxonomy.namespaces, ns) for ns in required_namespaces
        ]),
        actual: has_required,
        expect: true
    },

    // Test UK business namespace points to FRC
    testUKBusinessNamespace: {
        local uk_bus_ns = taxonomy.namespaces['uk-bus'],
        actual: std.startsWith(uk_bus_ns, "http://xbrl.frc.org.uk/cd/"),
        expect: true
    },

    // Test business context for Companies House entity ID
    testBusinessContextStructure: {
        local business_ctx = std.filter(function(ctx) ctx.id == 'business', taxonomy.contexts)[0],
        actual: business_ctx.entity == "metadata.business.company-number" &&
                business_ctx.scheme == "metadata.business.entity-scheme",
        expect: true
    },

    // Test report-period context for accounting periods
    testReportPeriodContext: {
        local period_ctx = std.filter(function(ctx) ctx.id == 'report-period', taxonomy.contexts)[0],
        actual: std.objectHas(period_ctx, 'period') &&
                period_ctx.period == "metadata.accounting.periods.0",
        expect: true
    },

    // Test accounting standards context exists (FRS-102 specific)
    testAccountingStandardsContext: {
        local acc_std_contexts = std.filter(function(ctx) ctx.id == 'accounting-standards', taxonomy.contexts),
        actual: std.length(acc_std_contexts) > 0,
        expect: true
    },

    // Test industry sector context (required by Companies House)
    testIndustrySectorContext: {
        local industry_contexts = std.filter(function(ctx) ctx.id == 'industry-sector', taxonomy.contexts),
        actual: std.length(industry_contexts) > 0,
        expect: true
    },

    // Test context inheritance is valid
    testContextInheritanceValid: {
        local contexts_with_from = std.filter(function(ctx) std.objectHas(ctx, 'from'), taxonomy.contexts),
        local valid_refs = std.all([
            std.length(std.filter(function(base_ctx) base_ctx.id == ctx.from, taxonomy.contexts)) > 0
            for ctx in contexts_with_from
        ]),
        actual: valid_refs,
        expect: true
    }
})