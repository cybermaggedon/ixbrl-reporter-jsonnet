#!/bin/bash

# Test Coverage Tracking Script
# Reports current test coverage progress across all phases

set -e

echo "==================== TEST COVERAGE REPORT ===================="
echo ""

# Overall coverage
TOTAL_FILES=97
CURRENT_TESTS=$(find tests -name 'test_*.jsonnet' | wc -l)
COVERAGE_PERCENT=$((CURRENT_TESTS * 100 / TOTAL_FILES))

echo "📊 OVERALL COVERAGE"
echo "Total files needing coverage: $TOTAL_FILES"
echo "Current test files: $CURRENT_TESTS"
echo "Coverage: $COVERAGE_PERCENT%"
echo ""

# Phase-by-phase progress
echo "📈 PHASE PROGRESS"
echo ""

# Phase 0: Regulatory Compliance (4 CRITICAL taxonomy files)
PHASE0_TAXONOMY=$(find tests/contract -name 'test_*taxonomy*' -o -name 'test_*frs102_taxonomy*' -o -name 'test_*ct_dpl_taxonomy*' -o -name 'test_*esef*taxonomy*' | wc -l)
PHASE0_PERCENT=$((PHASE0_TAXONOMY * 100 / 4))
echo "Phase 0 - Regulatory Compliance (CRITICAL): $PHASE0_TAXONOMY/4 files ($PHASE0_PERCENT%)"
echo "  ├─ FRS-102 taxonomy: $(find tests/contract -name 'test_*frs102_taxonomy*' | wc -l)/1"
echo "  ├─ CT-DPL taxonomy: $(find tests/contract -name 'test_*ct_dpl_taxonomy*' | wc -l)/1"
echo "  ├─ ESEF taxonomy: $(find tests/contract -name 'test_*esef_taxonomy*' | wc -l)/1"
echo "  └─ ESEF-FR taxonomy: $(find tests/contract -name 'test_*esef_fr_taxonomy*' | wc -l)/1"

# Phase 1: Foundation (22 critical files - reduced due to taxonomy priority)
PHASE1_UNIT=$(find tests/unit -name 'test_*generic*' -o -name 'test_*base*' -o -name 'test_*comp*' -o -name 'test_*default*' -o -name 'test_*style*' -o -name 'test_*modify*' -o -name 'test_*frs102.jsonnet' -o -name 'test_*uk-corptax.jsonnet' -o -name 'test_*uk-vat.jsonnet' -o -name 'test_*esef*.jsonnet' | wc -l)
PHASE1_PERCENT=$((PHASE1_UNIT * 100 / 22))
echo ""
echo "Phase 1 - Foundation (Critical): $PHASE1_UNIT/22 files ($PHASE1_PERCENT%)"
echo "  ├─ Generic libraries: $(find tests/unit -name 'test_*generic*' | wc -l)/6"
echo "  ├─ Root libraries: $(find tests/unit -name 'test_*base*' -o -name 'test_*comp*' -o -name 'test_*default*' -o -name 'test_*style*' -o -name 'test_*modify*' | wc -l)/10"  
echo "  └─ Core computations: $(find tests/unit -name 'test_*computations*' | wc -l)/5"

# Phase 2: FRS102 (23 files)
PHASE2_UNIT=$(find tests/unit -name 'test_*frs102*' | wc -l)
PHASE2_PERCENT=$((PHASE2_UNIT * 100 / 23))
echo ""
echo "Phase 2 - FRS102 Components (High Priority): $PHASE2_UNIT/23 files ($PHASE2_PERCENT%)"

# Phase 3: Tax & Compliance (14 files)
PHASE3_UNIT=$(find tests/unit -name 'test_*corptax*' -o -name 'test_*vat*' | wc -l)
PHASE3_PERCENT=$((PHASE3_UNIT * 100 / 14))
echo ""
echo "Phase 3 - Tax & Compliance (Medium-High Priority): $PHASE3_UNIT/14 files ($PHASE3_PERCENT%)"

# Phase 4: European & Presentation (18 files)
PHASE4_UNIT=$(find tests/unit -name 'test_*esef*' -o -name 'test_*worksheet*' | wc -l)
PHASE4_PERCENT=$((PHASE4_UNIT * 100 / 18))
echo ""
echo "Phase 4 - European & Presentation (Medium Priority): $PHASE4_UNIT/18 files ($PHASE4_PERCENT%)"

# Phase 5: Integration & Examples (21 files)
PHASE5_INTEGRATION=$(find tests/integration -name 'test_*.jsonnet' | wc -l)
PHASE5_CONTRACT=$(find tests/contract -name 'test_*.jsonnet' | wc -l)
PHASE5_TOTAL=$((PHASE5_INTEGRATION + PHASE5_CONTRACT))
PHASE5_PERCENT=$((PHASE5_TOTAL * 100 / 21))
echo ""
echo "Phase 5 - Integration & Examples (Low-Medium Priority): $PHASE5_TOTAL/21 files ($PHASE5_PERCENT%)"
echo "  ├─ Integration tests: $PHASE5_INTEGRATION/17"
echo "  └─ Contract tests: $PHASE5_CONTRACT/4"

# Phase 6: Production (10 files)
PHASE6_UNIT=$(find tests/unit -name 'test_*real-world*' | wc -l)
PHASE6_PERCENT=$((PHASE6_UNIT * 100 / 10))
echo ""
echo "Phase 6 - Production & Real-world (High Risk): $PHASE6_UNIT/10 files ($PHASE6_PERCENT%)"

echo ""
echo "==================== DETAILED BREAKDOWN ===================="
echo ""

# Test type breakdown
UNIT_TESTS=$(find tests/unit -name 'test_*.jsonnet' | wc -l)
INTEGRATION_TESTS=$(find tests/integration -name 'test_*.jsonnet' | wc -l)
CONTRACT_TESTS=$(find tests/contract -name 'test_*.jsonnet' | wc -l)

echo "🧪 TEST TYPE DISTRIBUTION"
echo "Unit tests: $UNIT_TESTS"
echo "Integration tests: $INTEGRATION_TESTS"
echo "Contract tests: $CONTRACT_TESTS"
echo ""

# Next steps recommendation
echo "🎯 RECOMMENDED NEXT STEPS"
if [ $PHASE0_PERCENT -lt 100 ]; then
    echo "1. URGENT: Complete Phase 0 (Regulatory Compliance) - $((4 - PHASE0_TAXONOMY)) files remaining"
    echo "   Focus on: taxonomy/ files - CRITICAL for regulatory acceptance"
    echo "   Missing: ESEF and ESEF-FR taxonomy tests"
elif [ $PHASE1_PERCENT -lt 100 ]; then
    echo "1. Complete Phase 1 (Foundation) - $((22 - PHASE1_UNIT)) files remaining"
    echo "   Focus on: lib/generic/, core libraries, critical computations"
elif [ $PHASE2_PERCENT -lt 100 ]; then
    echo "1. Complete Phase 2 (FRS102) - $((23 - PHASE2_UNIT)) files remaining"
    echo "   Focus on: lib/frs102/ components"
elif [ $PHASE3_PERCENT -lt 100 ]; then
    echo "1. Complete Phase 3 (Tax & Compliance) - $((14 - PHASE3_UNIT)) files remaining"
    echo "   Focus on: lib/uk-corptax/, lib/uk-vat/"
else
    echo "1. Continue with remaining phases"
fi

echo ""

# Quick test run summary
echo "🚀 QUICK TEST STATUS"
echo "Run './run_tests.sh' to execute all current tests"
echo "Run './run_tests.sh unit' for unit tests only"
echo "Run './run_tests.sh integration' for integration tests only"
echo "Run './run_tests.sh contract' for contract tests only"

echo ""
echo "==================== END REPORT ===================="