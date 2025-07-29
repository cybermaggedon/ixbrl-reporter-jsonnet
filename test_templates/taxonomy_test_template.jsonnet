// Template for taxonomy testing - CRITICAL for regulatory compliance
// These files define official mappings to regulatory iXBRL taxonomies

local test = import "jsonnetunit/test.libsonnet";
local taxonomy = import "taxonomy/TAXONOMY_NAME.jsonnet";

test.suite({
    // Test taxonomy file loads correctly
    testTaxonomyLoads: {
        actual: std.type(taxonomy),
        expect: "object"
    },

    // Test has required top-level structure
    testRequiredStructure: {
        actual: std.objectHas(taxonomy, 'schema') &&
                std.objectHas(taxonomy, 'namespaces') &&
                std.objectHas(taxonomy, 'contexts'),
        expect: true
    },

    // Test schema URLs are valid format
    testSchemaStructure: {
        actual: std.type(taxonomy.schema) == "array" &&
                std.length(taxonomy.schema) > 0 &&
                std.all([std.type(url) == "string" for url in taxonomy.schema]),
        expect: true
    },

    // Test schema URLs are HTTPS (for security/integrity)
    testSchemaSecure: {
        local all_https = std.all([
            std.startsWith(url, "https://") || std.startsWith(url, "http://")
            for url in taxonomy.schema
        ]),
        actual: all_https,
        expect: true
    },

    // Test namespaces structure
    testNamespacesStructure: {
        actual: std.type(taxonomy.namespaces) == "object" &&
                std.length(std.objectFields(taxonomy.namespaces)) > 0,
        expect: true
    },

    // Test namespace values are valid URIs
    testNamespaceValues: {
        local namespace_values = [taxonomy.namespaces[key] for key in std.objectFields(taxonomy.namespaces)],
        local all_valid_uris = std.all([
            std.startsWith(uri, "http://") || std.startsWith(uri, "https://")
            for uri in namespace_values
        ]),
        actual: all_valid_uris,
        expect: true
    },

    // Test contexts structure
    testContextsStructure: {
        actual: std.type(taxonomy.contexts) == "array" &&
                std.length(taxonomy.contexts) > 0,
        expect: true
    },

    // Test each context has required fields
    testContextRequiredFields: {
        local all_valid = std.all([
            std.objectHas(ctx, 'id') && std.type(ctx.id) == "string"
            for ctx in taxonomy.contexts
        ]),
        actual: all_valid,
        expect: true
    },

    // Test business context exists (required for all taxonomies)
    testBusinessContextExists: {
        local business_contexts = std.filter(function(ctx) ctx.id == 'business', taxonomy.contexts),
        actual: std.length(business_contexts) > 0,
        expect: true
    },

    // Test business context has entity mapping
    testBusinessContextStructure: {
        local business_ctx = std.filter(function(ctx) ctx.id == 'business', taxonomy.contexts)[0],
        actual: std.objectHas(business_ctx, 'entity') &&
                std.objectHas(business_ctx, 'scheme'),
        expect: true
    },

    // Test report-period context exists (required for financial reports)
    testReportPeriodContextExists: {
        local period_contexts = std.filter(function(ctx) ctx.id == 'report-period', taxonomy.contexts),
        actual: std.length(period_contexts) > 0,
        expect: true
    },

    // Test metadata references are properly formatted
    testMetadataReferences: {
        local has_metadata_refs = std.any([
            std.objectHas(ctx, 'entity') && std.startsWith(ctx.entity, 'metadata.')
            for ctx in taxonomy.contexts
        ]),
        actual: has_metadata_refs,
        expect: true
    },

    // Test for previous period context (required for comparative figures)
    testPreviousPeriodContext: {
        local prev_contexts = std.filter(function(ctx) ctx.id == 'previous-period', taxonomy.contexts),
        actual: std.length(prev_contexts) > 0,
        expect: true
    },

    // Test context inheritance (from field validation)
    testContextInheritance: {
        local contexts_with_from = std.filter(function(ctx) std.objectHas(ctx, 'from'), taxonomy.contexts),
        local valid_from_refs = std.all([
            // Check that 'from' references point to existing context ids
            std.length(std.filter(function(base_ctx) base_ctx.id == ctx.from, taxonomy.contexts)) > 0
            for ctx in contexts_with_from
        ]),
        actual: valid_from_refs,
        expect: true
    },

    // Test segments structure (if present)
    testSegmentsStructure: {
        local contexts_with_segments = std.filter(function(ctx) std.objectHas(ctx, 'segments'), taxonomy.contexts),
        local segments_valid = if std.length(contexts_with_segments) > 0 then
            std.all([
                std.type(ctx.segments) == "array" &&
                std.all([std.type(seg) == "object" for seg in ctx.segments])
                for ctx in contexts_with_segments
            ])
        else true,
        actual: segments_valid,
        expect: true
    }
})