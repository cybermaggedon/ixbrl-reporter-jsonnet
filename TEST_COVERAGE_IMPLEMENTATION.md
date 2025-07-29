# Test Coverage Implementation Plan

## Current State
- **Total files requiring coverage**: 97 files
- **Current test coverage**: 3 files (3%)
- **Coverage gap**: 94 files (97%)
- **Test framework**: jsonnetunit with clean directory structure

## Strategic Implementation Approach

### Phase 0: Regulatory Compliance (Week 1) - 4 CRITICAL Taxonomy Files
**Goal**: Ensure regulatory taxonomy mappings are correct - HIGHEST PRIORITY
**Risk**: CRITICAL - Errors here cause regulatory filing rejection

#### 0.1 Official Taxonomy Mappings (4 files)
**Target**: `taxonomy/` - Official regulatory mappings
- `frs102.jsonnet` - UK Companies House (FRC) taxonomy mapping
- `ct-dpl.jsonnet` - UK HMRC Corporation Tax & DPL taxonomy mapping  
- `esef.jsonnet` - European ESEF taxonomy mapping (English)
- `esef-fr.jsonnet` - European ESEF taxonomy mapping (French)

**Test Focus**:
- Official schema URL validation (FRC, HMRC, ESMA)
- Regulatory namespace compliance
- Context mapping accuracy (business entity, periods)
- Metadata reference integrity
- Required context existence (business, report-period, previous-period)
- Segment structure validation

**Regulatory Requirements**:
- **FRS-102**: Must reference official FRC schemas for Companies House acceptance
- **CT-DPL**: Must comply with HMRC Corporation Tax taxonomy requirements
- **ESEF**: Must reference ESMA taxonomy for European regulatory compliance
- **Context Mapping**: Entity IDs, periods, and segments must map correctly to internal metadata

**Deliverables**:
- 4 contract test files in `tests/contract/`
- Taxonomy validation patterns established
- Regulatory compliance verification

### Phase 1: Foundation (Weeks 2-3) - 22 Critical Files  
**Goal**: Establish testing for core infrastructure components (reduced from 26 due to taxonomy priority)
**Risk**: High - These components are used across all reports

#### 1.1 Generic Library Components (6 files)
**Target**: `lib/generic/`
- `composite.libsonnet` - Report composition logic
- `facttable.libsonnet` - Data table generation  
- `html.libsonnet` - HTML output formatting
- `notes.libsonnet` - Report notes generation
- `page.libsonnet` - Page layout components
- `worksheet.libsonnet` - Data worksheet logic

**Test Focus**:
- Function input/output validation
- HTML generation correctness
- Data structure integrity
- Error handling for malformed inputs

#### 1.2 Root Library Files (10 files)
**Target**: `lib/*.libsonnet` and `lib/*.jsonnet`
- `base.libsonnet` - Foundation library
- `computations.libsonnet` - Computation framework
- `modify.libsonnet` - Data modification utilities
- `style.jsonnet` - Styling and formatting
- `default-mapping.jsonnet` - Account mapping (expand existing)
- Framework libraries: `frs102.libsonnet`, `uk-corptax.libsonnet`, etc.

**Test Focus**:
- Library loading and initialization
- Core function behavior
- Account mapping accuracy
- Style generation validation

#### 1.3 Critical Computation Files (5 files - core only)
**Target**: Most critical mathematical/business logic
- `lib/frs102/frc102-computations.jsonnet`
- `lib/uk-corptax/ct-computations.jsonnet`
- `lib/uk-vat/vat-computations.jsonnet`
- `lib/esef-en/esef-computations.jsonnet`
- `lib/esef-fr/esef-computations.jsonnet`

**Test Focus**:
- Mathematical accuracy
- Business rule compliance
- Input validation
- Edge case handling (zero values, negative amounts)

**Deliverables**:
- 22 unit test files in `tests/unit/`
- Test patterns established for each component type
- Documentation for testing mathematical calculations

### Phase 2: Business Logic Core (Weeks 3-4) - 23 High-Priority Files
**Goal**: Comprehensive testing of FRS102 components
**Risk**: High - Most complex reporting standard

#### 2.1 FRS102 Report Components (23 files)
**Target**: `lib/frs102/`
- Balance sheet components: `balance-sheet*.libsonnet`
- Profit & loss: `profit-and-loss.libsonnet`
- Cash flows: `cash-flows.libsonnet`
- Compliance components: `auditors-report.libsonnet`, `directors-report.libsonnet`
- Notes and supporting elements

**Test Focus**:
- Balance sheet balancing rules
- Profit/loss calculations
- Cash flow statement logic
- Regulatory compliance validation
- Cross-references between statements

**Deliverables**:
- 23 unit test files
- Business rule validation patterns
- Financial statement integrity checks

### Phase 3: Tax & Compliance (Weeks 5-6) - 14 Medium-Priority Files  
**Goal**: Validate tax calculation accuracy and compliance
**Risk**: Medium-High - Critical for regulatory compliance

#### 3.1 UK Corporation Tax (11 files)
**Target**: `lib/uk-corptax/`
- Tax calculation: `tax-calculation.libsonnet`
- Capital allowances: `capital-allowances.libsonnet`
- Research & development: `research-dev*.libsonnet`
- Profit computations: `profits.libsonnet`
- Loss handling: `losses.libsonnet`

#### 3.2 VAT Components (3 files)
**Target**: `lib/uk-vat/`
- VAT computations and reporting

**Test Focus**:
- Tax calculation accuracy
- Rate application correctness
- Period handling
- Allowance calculations
- Loss carry-forward logic

**Deliverables**:
- 14 unit test files
- Tax calculation validation patterns
- Compliance rule verification

### Phase 4: European & Presentation (Weeks 7-8) - 18 Files
**Goal**: Complete international reporting coverage
**Risk**: Medium - Important for European compliance

#### 4.1 ESEF Components (13 files)
**Target**: `lib/esef-en/`, `lib/esef-fr/`, `lib/esef/`
- Multi-language reporting
- European taxonomy compliance
- Worksheet generation

#### 4.2 Worksheet Files (5 files)
**Target**: Various worksheet generators
- Data organization and presentation logic

**Test Focus**:
- Multi-language consistency
- European taxonomy compliance
- Data presentation accuracy
- Worksheet structure validation

**Deliverables**:
- 18 unit test files
- Multi-language testing patterns
- European compliance validation

### Phase 5: Integration & Examples (Weeks 9-10) - 21 Files
**Goal**: Complete coverage with example validation
**Risk**: Low-Medium - Reference implementations

#### 5.1 Example Templates (17 files)
**Target**: `example-*/`
- Complete workflow validation
- Template integration testing

#### 5.2 Taxonomy Files (4 files)
**Target**: `taxonomy/`
- Configuration validation
- Taxonomy structure verification

**Test Focus**:
- End-to-end template workflow
- Example accuracy
- Configuration validity
- Reference implementation compliance

**Deliverables**:
- 17 integration test files in `tests/integration/`
- 4 contract test files in `tests/contract/`
- Complete example validation suite

### Phase 6: Production & Real-world (Weeks 11-12) - 10 Files
**Goal**: Validate production configurations
**Risk**: High - Production code requiring careful testing

#### 6.1 Real-world Implementations (10 files)
**Target**: `real-world/`
- Production template validation
- Live configuration testing

**Test Focus**:
- Production accuracy
- Real-world scenario coverage
- Configuration integrity

**Deliverables**:
- 10 specialized test files
- Production validation patterns
- Real-world scenario coverage

## Implementation Support Infrastructure

### Test Templates & Patterns (Week 1)
Create reusable test patterns for:

#### Unit Test Template
```jsonnet
local test = import "jsonnetunit/test.libsonnet";
local component = import "lib/path/to/component.libsonnet";

test.suite({
    testLoadsSuccessfully: {
        actual: std.type(component),
        expect: "object"
    },
    
    testHasRequiredFunctions: {
        actual: std.objectHasAll(component, 'key_function'),
        expect: true
    },
    
    testFunctionBehavior: {
        local result = component.key_function(test_input),
        actual: result,
        expect: expected_output
    }
})
```

#### Computation Test Template
```jsonnet
local test = import "jsonnetunit/test.libsonnet";
local computations = import "lib/path/computations.jsonnet";

test.suite({
    testComputationAccuracy: {
        local result = computations[0].calculate({
            // test data
        }),
        actual: result,
        expect: expected_value
    },
    
    testBalanceSheetBalances: {
        local assets = sum_computations('assets'),
        local liabilities = sum_computations('liabilities'),
        actual: assets,
        expect: liabilities
    }
})
```

### Automation & Monitoring

#### Coverage Tracking Script
```bash
#!/bin/bash
# coverage_report.sh
echo "=== Test Coverage Report ==="
echo "Total files needing coverage: 97"
echo "Current test files: $(find tests -name '*.jsonnet' | wc -l)"
echo "Coverage: $(($(find tests -name '*.jsonnet' | wc -l) * 100 / 97))%"
echo ""
echo "Phase Progress:"
echo "Phase 1 (Critical): $(find tests/unit -name 'test_*generic*' -o -name 'test_*base*' -o -name 'test_*comp*' | wc -l)/26"
echo "Phase 2 (FRS102): $(find tests/unit -name 'test_*frs102*' | wc -l)/23"
# ... etc
```

#### Continuous Integration Enhancement
- Add coverage reporting to CI pipeline
- Implement coverage thresholds per phase
- Automated test discovery and execution

### Quality Assurance

#### Code Review Checklist
- [ ] Test follows established patterns
- [ ] Business rules are validated
- [ ] Edge cases are covered
- [ ] Mathematical accuracy verified
- [ ] Error conditions tested

#### Test Quality Metrics
- Test-to-code ratio: Target 1:1 (one test file per source file)
- Business rule coverage: 100% of critical calculations
- Error path coverage: All validation branches
- Cross-component integration: Key interfaces tested

## Success Criteria

### Phase Completion Criteria
Each phase is complete when:
- All targeted files have corresponding test files
- All tests pass consistently
- Code review completed
- Documentation updated
- CI integration verified

### Final Success Metrics
- **Coverage**: 97+ test files (100% coverage)
- **Quality**: 0 test failures in CI
- **Maintainability**: Test patterns documented and followed
- **Reliability**: Business rules validated with edge cases
- **Compliance**: Regulatory requirements tested

## Risk Mitigation

### High-Risk Components
- **Computations**: Require extra validation with real-world data
- **Tax Calculations**: Need accountant review of test cases
- **Multi-language**: Require native speaker validation
- **Production Code**: Require careful staging environment testing

### Contingency Planning
- Budget 20% extra time for complex components
- Establish domain expert review process
- Create fallback manual testing procedures
- Implement gradual rollout for production validation

This implementation plan transforms the current 3% test coverage into comprehensive 100% coverage over 12 weeks, with systematic approach ensuring quality and maintainability.