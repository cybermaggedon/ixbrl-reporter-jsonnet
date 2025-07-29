// CRITICAL: Test ESEF-FR taxonomy compliance for European French regulatory filings
local test = import "jsonnetunit/test.libsonnet";
local taxonomy = import "taxonomy/esef-fr.jsonnet";

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

    // Test official ESMA French schema reference
    testOfficialESMAFrenchSchema: {
        local has_esma_fr_schema = std.any([
            std.startsWith(url, "http://www.esma.europa.eu/taxonomy/") &&
            std.endsWith(url, "-lab-fr.xml")
            for url in taxonomy.schema
        ]),
        actual: has_esma_fr_schema,
        expect: true
    },

    // Test IFRS-full namespace (same as English version)
    testIFRSFullNamespace: {
        actual: std.objectHas(taxonomy.namespaces, 'ifrs-full') &&
                std.startsWith(taxonomy.namespaces['ifrs-full'], "http://xbrl.ifrs.org/taxonomy/"),
        expect: true
    },

    // Test business context structure (consistent with English)
    testBusinessContextStructure: {
        local business_ctx = std.filter(function(ctx) ctx.id == 'business', taxonomy.contexts)[0],
        actual: business_ctx.entity == "metadata.business.company-number" &&
                business_ctx.scheme == "metadata.business.entity-scheme",
        expect: true
    },

    // Test required contexts for ESEF-FR (same as English)
    testRequiredESEFFRContexts: {
        local context_ids = [ctx.id for ctx in taxonomy.contexts],
        local has_business = std.length(std.filter(function(id) id == 'business', context_ids)) > 0,
        local has_report_period = std.length(std.filter(function(id) id == 'report-period', context_ids)) > 0,
        local has_previous_period = std.length(std.filter(function(id) id == 'previous-period', context_ids)) > 0,
        actual: has_business && has_report_period && has_previous_period,
        expect: true
    },

    // Test document-metadata structure (French version)
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

    // Test required ESEF-FR metadata exists (same requirements as English)
    testRequiredESEFFRMetadata: {
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

    // Test tags structure and IFRS mappings (identical to English version)
    testTagsStructure: {
        actual: std.type(taxonomy.tags) == "object" &&
                std.length(std.objectFields(taxonomy.tags)) > 0,
        expect: true
    },

    // Test required IFRS tags exist (French version should have same tags)
    testRequiredIFRSTags: {
        local tag_keys = std.objectFields(taxonomy.tags),
        local has_name = std.length(std.filter(function(key) key == 'name-of-reporting-entity', tag_keys)) > 0,
        local has_revenue = std.length(std.filter(function(key) key == 'operating-revenue', tag_keys)) > 0,
        local has_profit = std.length(std.filter(function(key) key == 'net-profit', tag_keys)) > 0,
        actual: has_name && has_revenue && has_profit,
        expect: true
    },

    // Test IFRS tag values point to ifrs-full namespace (identical mappings)
    testIFRSTagValues: {
        local tag_values = [taxonomy.tags[key] for key in std.objectFields(taxonomy.tags)],
        local all_ifrs_full = std.all([
            std.startsWith(tag_value, "ifrs-full:") for tag_value in tag_values
        ]),
        actual: all_ifrs_full,
        expect: true
    },

    // Test sign-reversed structure (accounting adjustments - same as English)
    testSignReversedStructure: {
        actual: std.objectHas(taxonomy, 'sign-reversed') &&
                std.type(taxonomy['sign-reversed']) == "object",
        expect: true
    },

    // Test key sign-reversed entries exist
    testRequiredSignReversedFields: {
        local sign_rev_keys = std.objectFields(taxonomy['sign-reversed']),
        local has_purchase = std.length(std.filter(function(key) key == 'purchase-equipment', sign_rev_keys)) > 0,
        local has_tax = std.length(std.filter(function(key) key == 'income-tax', sign_rev_keys)) > 0,
        local has_interest = std.length(std.filter(function(key) key == 'interest-paid', sign_rev_keys)) > 0,
        actual: has_purchase && has_tax && has_interest,
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
    },

    // Test consistency between French and core metadata (should be structurally identical)
    testMetadataConsistency: {
        local period_start_meta = std.filter(function(meta) meta.id == 'period-start', taxonomy.metadata)[0],
        local period_end_meta = std.filter(function(meta) meta.id == 'period-end', taxonomy.metadata)[0],
        actual: period_start_meta.config == 'metadata.accounting.periods.0.start' &&
                period_end_meta.config == 'metadata.accounting.periods.0.end',
        expect: true
    }
})