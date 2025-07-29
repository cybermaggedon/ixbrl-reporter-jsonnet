// CRITICAL: Test CT-DPL taxonomy compliance for UK HMRC corporation tax filings
local test = import "jsonnetunit/test.libsonnet";
local taxonomy = import "taxonomy/ct-dpl.jsonnet";

test.suite({
    testTaxonomyLoads: {
        actual: std.type(taxonomy),
        expect: "object"
    },

    testRequiredStructure: {
        actual: std.objectHas(taxonomy, 'contexts'),
        expect: true
    },

    // Test business context for HMRC entity reference
    testBusinessContextExists: {
        local business_contexts = std.filter(function(ctx) ctx.id == 'business', taxonomy.contexts),
        actual: std.length(business_contexts) > 0,
        expect: true
    },

    // Test report-period context with business-type segment
    testReportPeriodWithBusinessType: {
        local period_ctx = std.filter(function(ctx) ctx.id == 'report-period', taxonomy.contexts)[0],
        actual: std.objectHas(period_ctx, 'segments') &&
                std.any([
                    std.objectHas(seg, 'business-type') && seg['business-type'] == 'company'
                    for seg in period_ctx.segments
                ]),
        expect: true
    },

    // Test management expenses context (CT-specific)
    testManagementExpensesContext: {
        local mgmt_contexts = std.filter(function(ctx) ctx.id == 'management-expenses-period', taxonomy.contexts),
        actual: std.length(mgmt_contexts) > 0,
        expect: true
    },

    // Test management expenses has correct business-type segment
    testManagementExpensesSegment: {
        local mgmt_ctx = std.filter(function(ctx) ctx.id == 'management-expenses-period', taxonomy.contexts)[0],
        actual: std.objectHas(mgmt_ctx, 'segments') &&
                std.any([
                    std.objectHas(seg, 'business-type') && seg['business-type'] == 'management-expenses'
                    for seg in mgmt_ctx.segments
                ]),
        expect: true
    },

    // Test report-date context exists
    testReportDateContext: {
        local date_contexts = std.filter(function(ctx) ctx.id == 'report-date', taxonomy.contexts),
        actual: std.length(date_contexts) > 0,
        expect: true
    },

    // Test all contexts have valid entity/scheme references
    testEntityReferences: {
        local business_ctx = std.filter(function(ctx) ctx.id == 'business', taxonomy.contexts)[0],
        actual: std.objectHas(business_ctx, 'entity') &&
                std.objectHas(business_ctx, 'scheme') &&
                business_ctx.entity == "metadata.business.company-number" &&
                business_ctx.scheme == "metadata.business.entity-scheme",
        expect: true
    },

    // Test context inheritance structure
    testContextInheritance: {
        local inherited_contexts = std.filter(function(ctx) std.objectHas(ctx, 'from'), taxonomy.contexts),
        local all_inherit_from_business = std.all([
            ctx.from == 'business' for ctx in inherited_contexts
        ]),
        actual: all_inherit_from_business,
        expect: true
    },

    // Test period references point to metadata
    testPeriodReferences: {
        local period_contexts = std.filter(function(ctx) std.objectHas(ctx, 'period'), taxonomy.contexts),
        local valid_period_refs = std.all([
            std.startsWith(ctx.period, 'metadata.accounting.periods')
            for ctx in period_contexts
        ]),
        actual: valid_period_refs,
        expect: true
    }
})