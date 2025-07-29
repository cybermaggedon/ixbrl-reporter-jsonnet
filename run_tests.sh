#!/bin/bash

# Test runner for jsonnetunit tests
# Usage: ./run_tests.sh [unit|integration|contract|all]

set -e

JSONNET_FLAGS="-J . -J jsonnetunit"
TEST_TYPE=${1:-all}

run_tests_in_dir() {
    local dir=$1
    local name=$2
    
    echo "Running $name tests..."
    if [ -d "tests/$dir" ] && [ "$(ls -1 tests/$dir/test_*.jsonnet 2>/dev/null | wc -l)" -gt 0 ]; then
        for test_file in tests/$dir/test_*.jsonnet; do
            echo "  $(basename "$test_file")"
            jsonnet $JSONNET_FLAGS "$test_file"
        done
        echo ""
    else
        echo "  No tests found in tests/$dir/"
        echo ""
    fi
}

case $TEST_TYPE in
    unit)
        run_tests_in_dir "unit" "Unit"
        ;;
    integration)  
        run_tests_in_dir "integration" "Integration"
        ;;
    contract)
        run_tests_in_dir "contract" "Contract"
        ;;
    all)
        run_tests_in_dir "unit" "Unit"
        run_tests_in_dir "integration" "Integration" 
        run_tests_in_dir "contract" "Contract"
        ;;
    *)
        echo "Usage: $0 [unit|integration|contract|all]"
        exit 1
        ;;
esac

echo "All tests completed successfully!"