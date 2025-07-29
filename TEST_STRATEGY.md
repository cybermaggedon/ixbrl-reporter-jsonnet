# Test Strategy for ixbrl-reporter-jsonnet

## Overview

This document outlines the testing strategy for the ixbrl-reporter-jsonnet project, which generates iXBRL financial reports using Jsonnet templates. The testing approach ensures reliability, compliance, and maintainability of the generated financial reports.

## Project Architecture

The project follows this workflow:
1. **Jsonnet Templates** → JSON configuration files
2. **JSON Configuration** → ixbrl-reporter → iXBRL (XHTML) reports
3. **iXBRL Reports** → Regulatory filing (Companies House, HMRC, ESEF)

## Test Structure and Organization

The test suite is organized into three distinct categories, each with a specific purpose:

```
tests/
├── unit/          # Test individual library components
├── integration/   # Test complete template configurations  
└── contract/      # Test compliance with external interfaces
```

## Testing Levels

### 1. Unit Testing (`tests/unit/`)
**Purpose**: Test individual library components in isolation  
**Tool**: jsonnetunit  
**Target**: Files under `lib/` directory

**What to test**:
- Individual Jsonnet library functions (`lib/*.libsonnet`)
- Account mapping definitions (`lib/default-mapping.jsonnet`) 
- Computation libraries (`lib/*/computations.jsonnet`)
- Style and formatting utilities (`lib/style.jsonnet`)

**Example**:
```bash
jsonnet -J . -J jsonnetunit tests/unit/test_default_mapping.jsonnet
```

**Sample test structure**:
- Verify library loads without errors
- Test function inputs/outputs  
- Validate data structure integrity
- Check for required fields/functions

### 2. Integration Testing (`tests/integration/`)
**Purpose**: Test complete template configurations that generate full reports  
**Tool**: jsonnetunit  
**Target**: Example templates (`example-*/`, complete report workflows)

**What to test**:
- Complete template compilation (`example-accts.jsonnet`, `example-ct.jsonnet`)
- Multi-file template dependencies  
- Metadata + computation + mapping integration
- Business rule validation (accounting logic)

**Example**:
```bash
jsonnet -J . -J jsonnetunit tests/integration/test_example_accts.jsonnet
```

**Sample test structure**:
- Verify template generates valid JSON configuration
- Test business rules (balance sheet balances, date logic)
- Validate cross-references between components
- Check accounting period consistency

### 3. Contract Testing (`tests/contract/`)
**Purpose**: Verify outputs comply with external system interfaces (ixbrl-reporter schema)  
**Tool**: jsonnetunit  
**Target**: Output format compliance, external API contracts

**What to test**:
- ixbrl-reporter JSON schema compliance
- Required fields for downstream tools
- Data type validation  
- Regulatory taxonomy compatibility

**Example**:
```bash
jsonnet -J . -J jsonnetunit tests/contract/test_ixbrl_output_schema.jsonnet
```

**Sample test structure**:
- Verify all required top-level fields exist
- Test metadata structure matches ixbrl-reporter expectations
- Validate computation array format
- Check accounts configuration schema

### 3. Regression Testing

#### 3.1 Output Comparison
- **Current Implementation**: KV file comparison in `test/log/`
- **Purpose**: Detect unintended changes in output
- **Process**:
  1. Generate iXBRL report
  2. Extract key-value pairs using `ixbrl-to-kv`
  3. Compare against baseline KV files
  4. Flag any differences

#### 3.2 Baseline Management
- **Update Process**:
  1. Review changes carefully
  2. Verify changes are intentional
  3. Update baseline KV files
  4. Document reason for change

### 4. Compliance Testing

#### 4.1 Taxonomy Validation
- **Purpose**: Ensure iXBRL output complies with regulatory taxonomies
- **Tools**: 
  - HMRC's validation service
  - Companies House test service
  - XBRL validation tools
- **Taxonomies to validate**:
  - UK-GAAP (FRS-102/105)
  - UK Corporation Tax
  - ESEF
  - DPL (Detailed Profit & Loss)

#### 4.2 Business Rule Validation
- **Purpose**: Verify accounting rules and calculations
- **Tests**:
  - Balance sheet balances
  - Profit/loss calculations
  - Tax computations
  - Cross-references between statements

### 5. Data-Driven Testing

#### 5.1 Test Data Sets
Create test scenarios for:
- **Minimal**: Simplest valid accounts
- **Typical**: Common business scenarios
- **Complex**: Edge cases (losses, adjustments, multi-period)
- **Error Cases**: Invalid data handling

#### 5.2 Computation Testing
- Test mathematical accuracy of:
  - Summations
  - Tax calculations
  - Brought-forward values
  - Period comparisons

### 6. Performance Testing

#### 6.1 Generation Speed
- Benchmark Jsonnet compilation time
- Monitor ixbrl-reporter processing time
- Set performance baselines

#### 6.2 Scalability
- Test with large account hierarchies
- Multiple reporting periods
- Complex computation chains

## Test Automation

### Test Runner
A unified test runner is provided for all test types:

```bash
# Run all tests
./run_tests.sh

# Run specific test categories  
./run_tests.sh unit
./run_tests.sh integration
./run_tests.sh contract
```

### Continuous Integration
```yaml
# Example GitHub Actions workflow
name: Test Suite
on: [push, pull_request]
jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
        with:
          submodules: true  # For jsonnetunit
      - name: Install dependencies
        run: |
          sudo apt-get update
          sudo apt-get install -y jsonnet
          pip install ixbrl-reporter
      - name: Run jsonnetunit tests
        run: ./run_tests.sh
      - name: Run legacy integration tests  
        run: sh test/run_all
```

### Pre-commit Hooks
```bash
#!/bin/bash
# .git/hooks/pre-commit
# Run jsonnetunit tests before commit
./run_tests.sh || exit 1

# Validate Jsonnet syntax
find . -name "*.jsonnet" -o -name "*.libsonnet" | while read f; do
  jsonnet --dry-run "$f" || exit 1
done
```

## Test Coverage

### Current Coverage
- ✅ Basic integration testing via `test/run_all`
- ✅ Regression testing with KV comparison
- ✅ Multiple report types (micro, small, full, CT, ESEF)

### Gaps to Address
1. **Jsonnet Unit Tests**: Individual component testing
2. **Error Handling**: Invalid input scenarios
3. **Taxonomy Compliance**: Automated validation
4. **Computation Verification**: Mathematical accuracy
5. **Multi-period Testing**: Year-over-year scenarios

## Implementation Roadmap

### Phase 1: Enhance Existing Tests (Week 1-2)
- Add Jsonnet syntax validation to test suite
- Improve error reporting in `test/run_all`
- Document test data requirements

### Phase 2: Add Validation Layer (Week 3-4)
- Implement JSON schema validation
- Add iXBRL structure checks
- Create taxonomy validation scripts

### Phase 3: Expand Test Coverage (Week 5-6)
- Create unit tests for key components
- Add computation accuracy tests
- Implement error scenario testing

### Phase 4: Automation & CI (Week 7-8)
- Set up CI/CD pipeline
- Implement pre-commit hooks
- Create test report generation

## Maintenance

### Regular Tasks
1. **Monthly**: Review and update baseline KV files
2. **Quarterly**: Validate against latest taxonomies
3. **Annually**: Review test coverage and strategy

### Documentation
- Maintain test case documentation
- Document known issues and limitations
- Keep baseline update log

## Success Metrics

- **Test Coverage**: >80% of Jsonnet components
- **Regression Detection**: 100% of output changes detected
- **Compliance**: Pass all regulatory validations
- **Performance**: <5 seconds for typical report generation
- **Reliability**: Zero undetected breaking changes

## Conclusion

This test strategy ensures the ixbrl-reporter-jsonnet project produces accurate, compliant financial reports. By combining automated testing, compliance validation, and regression detection, we can maintain high quality while enabling confident updates to the codebase.