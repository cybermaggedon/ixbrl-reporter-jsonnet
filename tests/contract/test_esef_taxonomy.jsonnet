// CRITICAL: Test ESEF taxonomy compliance for European regulatory filings
local test = import "jsonnetunit/test.libsonnet";
local taxonomy = import "taxonomy/esef.jsonnet";

test.suite({
    testTaxonomyLoads: {
        actual: std.type(taxonomy),
        expect: "object"
    },

    testRequiredStructure: {
        actual: std.objectHas(taxonomy, 'schema') &&
                std.objectHas(taxonomy, 'namespaces') &&
                std.objectHas(taxonomy, 'contexts') &&
                std.objectHas(taxonomy, 'metadata') &&
                std.objectHas(taxonomy, 'tags'),
        expect: true
    },

    // Test official ESMA schema reference
    testOfficialESMASchema: {
        local has_esma_schema = std.any([
            std.startsWith(url, "http://www.esma.europa.eu/taxonomy/")
            for url in taxonomy.schema
        ]),
        actual: has_esma_schema,
        expect: true
    },

    // Test IFRS-full namespace (required for ESEF)
    testIFRSFullNamespace: {
        actual: std.objectHas(taxonomy.namespaces, 'ifrs-full') &&
                std.startsWith(taxonomy.namespaces['ifrs-full'], "http://xbrl.ifrs.org/taxonomy/"),
        expect: true
    },

    // Test business context structure
    testBusinessContextStructure: {
        local business_ctx = std.filter(function(ctx) ctx.id == 'business', taxonomy.contexts)[0],
        actual: business_ctx.entity == "metadata.business.company-number" &&
                business_ctx.scheme == "metadata.business.entity-scheme",
        expect: true
    },

    // Test required contexts for ESEF
    testRequiredESEFContexts: {
        local context_ids = [ctx.id for ctx in taxonomy.contexts],
        local has_business = std.length(std.filter(function(id) id == 'business', context_ids)) > 0,
        local has_report_period = std.length(std.filter(function(id) id == 'report-period', context_ids)) > 0,
        local has_previous_period = std.length(std.filter(function(id) id == 'previous-period', context_ids)) > 0,
        actual: has_business && has_report_period && has_previous_period,
        expect: true
    },

    // Test document-metadata structure (ESEF specific)
    testDocumentMetadata: {
        actual: std.objectHas(taxonomy, 'document-metadata') &&
                std.type(taxonomy['document-metadata']) == "array" &&
                std.length(std.filter(function(item) item == 'name-of-reporting-entity', taxonomy['document-metadata'])) > 0,
        expect: true
    },

    // Test metadata mappings structure
    testMetadataMappings: {
        actual: std.type(taxonomy.metadata) == "array" &&
                std.length(taxonomy.metadata) > 0 &&
                std.all([
                    std.objectHas(meta, 'id') &&
                    std.objectHas(meta, 'context') &&
                    std.objectHas(meta, 'config')
                    for meta in taxonomy.metadata
                ]),
        expect: true
    },

    // Test required ESEF metadata exists
    testRequiredESEFMetadata: {
        local metadata_ids = [meta.id for meta in taxonomy.metadata],
        local has_name = std.length(std.filter(function(id) id == 'name-of-reporting-entity', metadata_ids)) > 0,
        local has_domicile = std.length(std.filter(function(id) id == 'domicile-of-entity', metadata_ids)) > 0,
        local has_legal_form = std.length(std.filter(function(id) id == 'legal-form-of-entity', metadata_ids)) > 0,
        actual: has_name && has_domicile && has_legal_form,
        expect: true
    },

    // Test name-of-reporting-entity metadata configuration
    testNameOfReportingEntity: {
        local name_meta = std.filter(function(meta) meta.id == 'name-of-reporting-entity', taxonomy.metadata)[0],
        actual: name_meta.context == 'report-period' &&
                name_meta.config == 'metadata.business.company-name',
        expect: true
    },

    // Test tags structure and IFRS mappings
    testTagsStructure: {
        actual: std.type(taxonomy.tags) == "object" &&
                std.length(std.objectFields(taxonomy.tags)) > 0,
        expect: true
    },

    // Test required IFRS tags exist
    testRequiredIFRSTags: {
        local tag_keys = std.objectFields(taxonomy.tags),
        local has_name = std.length(std.filter(function(key) key == 'name-of-reporting-entity', tag_keys)) > 0,
        local has_revenue = std.length(std.filter(function(key) key == 'operating-revenue', tag_keys)) > 0,
        local has_profit = std.length(std.filter(function(key) key == 'net-profit', tag_keys)) > 0,
        actual: has_name && has_revenue && has_profit,
        expect: true
    },

    // Test IFRS tag values point to ifrs-full namespace
    testIFRSTagValues: {
        local tag_values = [taxonomy.tags[key] for key in std.objectFields(taxonomy.tags)],
        local all_ifrs_full = std.all([
            std.startsWith(tag_value, "ifrs-full:") for tag_value in tag_values
        ]),
        actual: all_ifrs_full,
        expect: true
    },

    // Test sign-reversed structure (ESEF accounting adjustments)
    testSignReversedStructure: {
        actual: std.objectHas(taxonomy, 'sign-reversed') &&
                std.type(taxonomy['sign-reversed']) == "object",
        expect: true
    },

    // Test note-templates structure
    testNoteTemplatesStructure: {
        actual: std.objectHas(taxonomy, 'note-templates') &&
                std.type(taxonomy['note-templates']) == "array",
        expect: true
    },

    // Test segment structure
    testSegmentStructure: {
        actual: std.objectHas(taxonomy, 'segment') &&
                std.type(taxonomy.segment) == "object",
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
    },

    // Test period and instant references point to metadata
    testMetadataReferences: {
        local period_contexts = std.filter(function(ctx) std.objectHas(ctx, 'period'), taxonomy.contexts),
        local instant_contexts = std.filter(function(ctx) std.objectHas(ctx, 'instant'), taxonomy.contexts),
        local valid_period_refs = std.all([
            std.startsWith(ctx.period, 'metadata.accounting.periods')
            for ctx in period_contexts
        ]),
        local valid_instant_refs = std.all([
            std.startsWith(ctx.instant, 'metadata.accounting')
            for ctx in instant_contexts
        ]),
        actual: valid_period_refs && valid_instant_refs,
        expect: true
    }
})