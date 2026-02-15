<!-- This is V1.0.0 of RSP AI Native SDLC Framework -->

# Quality Gates for AI-Generated Code

## Intent
Establish automated quality thresholds that code must pass before merging or deployment.

## Context
- Continuous integration pipelines
- Code review workflows
- Quality assurance processes
- Team standards enforcement

## Problem
Manual quality checks don't scale and are inconsistent. Need automated, objective criteria for determining if code meets standards.

## Solution
Define and enforce quality gates with automated tooling in CI/CD pipelines.

## Quality Gate Types

### 1. Testing Gate
Code must pass all tests with adequate coverage

### 2. Code Quality Gate
Code must meet style and maintainability standards

### 3. Security Gate
Code must have no high/critical vulnerabilities

### 4. Performance Gate
Code must meet performance benchmarks

### 5. Documentation Gate
Code must be adequately documented

## Testing Gate

### Requirements
```yaml
Testing Gate Criteria:
  - All tests pass: ✓
  - Coverage >= 80%: ✓
  - No skipped tests in main branch: ✓
  - Test execution time < threshold: ✓
```

### Implementation

```yaml
# .github/workflows/quality-gates.yml
name: Quality Gates

on: [push, pull_request]

jobs:
  testing-gate:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3

      - name: Run Tests
        run: npm test

      - name: Check Coverage
        run: |
          npm run test:coverage
          coverage=$(npm run test:coverage -- --json | jq .total.lines.pct)
          if (( $(echo "$coverage < 80" | bc -l) )); then
            echo "Coverage $coverage% is below 80%"
            exit 1
          fi

      - name: Upload Coverage
        uses: codecov/codecov-action@v3
```

### Configuration

```json
// jest.config.js
{
  "coverageThreshold": {
    "global": {
      "branches": 75,
      "functions": 80,
      "lines": 80,
      "statements": 80
    }
  }
}
```

## Code Quality Gate

### Requirements
```yaml
Code Quality Criteria:
  - Linting passes: ✓
  - No code smells (SonarQube): ✓
  - Complexity < threshold: ✓
  - Duplication < 3%: ✓
  - Maintainability rating >= B: ✓
```

### Implementation

```yaml
code-quality-gate:
  runs-on: ubuntu-latest
  steps:
    - name: Lint
      run: npm run lint

    - name: Type Check
      run: npm run type-check

    - name: SonarQube Scan
      uses: sonarsource/sonarqube-scan-action@master
      env:
        SONAR_TOKEN: ${{ secrets.SONAR_TOKEN }}

    - name: SonarQube Quality Gate
      uses: sonarsource/sonarquality-gate-action@master
      timeout-minutes: 5
      env:
        SONAR_TOKEN: ${{ secrets.SONAR_TOKEN }}
```

### Configuration

```javascript
// .eslintrc.js
module.exports = {
  rules: {
    'complexity': ['error', 10],
    'max-lines': ['warn', 300],
    'max-depth': ['error', 4],
    'max-params': ['error', 5],
  }
};
```

```yaml
# sonar-project.properties
sonar.qualitygate.wait=true
sonar.qualitygate.timeout=300

# Quality Gate Conditions
sonar.coverage.minimum=80
sonar.duplications.maximum=3
sonar.maintainability.rating.minimum=B
```

## Security Gate

### Requirements
```yaml
Security Criteria:
  - No critical vulnerabilities: ✓
  - No high vulnerabilities: ✓
  - Dependencies up to date: ✓
  - No hardcoded secrets: ✓
```

### Implementation

```yaml
security-gate:
  runs-on: ubuntu-latest
  steps:
    - name: Run Snyk Security Scan
      run: |
        npm install -g snyk
        snyk test --severity-threshold=high

    - name: Run npm audit
      run: npm audit --audit-level=moderate

    - name: Scan for secrets
      uses: trufflesecurity/trufflehog@main
      with:
        path: ./
        base: ${{ github.event.repository.default_branch }}
        head: HEAD
```

## Performance Gate

### Requirements
```yaml
Performance Criteria:
  - API response time < 200ms (p95): ✓
  - Memory usage < threshold: ✓
  - No performance regressions: ✓
```

### Implementation

```yaml
performance-gate:
  runs-on: ubuntu-latest
  steps:
    - name: Run Benchmarks
      run: npm run benchmark

    - name: Compare with Baseline
      run: |
        node scripts/compare-benchmarks.js \
          --baseline benchmarks/baseline.json \
          --current benchmarks/current.json \
          --threshold 10  # 10% regression allowed
```

```javascript
// scripts/compare-benchmarks.js
const baseline = require(process.argv[2]);
const current = require(process.argv[3]);
const threshold = parseFloat(process.argv[4]);

for (const test of Object.keys(baseline)) {
  const regression = ((current[test] - baseline[test]) / baseline[test]) * 100;

  if (regression > threshold) {
    console.error(`❌ Performance regression in ${test}: ${regression.toFixed(2)}%`);
    process.exit(1);
  }
}

console.log('✅ No performance regressions detected');
```

## Documentation Gate

### Requirements
```yaml
Documentation Criteria:
  - Public APIs documented: ✓
  - README updated: ✓
  - Changelog updated: ✓
  - Breaking changes documented: ✓
```

### Implementation

```yaml
documentation-gate:
  runs-on: ubuntu-latest
  steps:
    - name: Check Documentation
      run: |
        # Check for JSDoc on public functions
        npm run check-docs

    - name: Verify README
      run: |
        if git diff --name-only origin/main | grep -q "src/"; then
          if ! git diff --name-only origin/main | grep -q "README.md"; then
            echo "⚠️  Source changed but README not updated"
            # Warning only, don't fail
          fi
        fi
```

## Combined Quality Gate

### All Gates Must Pass

```yaml
name: Quality Gates

on:
  pull_request:
    branches: [main]

jobs:
  quality-gates:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3

      - name: Install Dependencies
        run: npm ci

      # Testing Gate
      - name: Testing Gate
        run: |
          echo "Running Testing Gate..."
          npm test
          npm run test:coverage

      # Code Quality Gate
      - name: Code Quality Gate
        run: |
          echo "Running Code Quality Gate..."
          npm run lint
          npm run type-check

      # Security Gate
      - name: Security Gate
        run: |
          echo "Running Security Gate..."
          npm audit --audit-level=moderate
          npm install -g snyk
          snyk test --severity-threshold=high

      # Performance Gate (if applicable)
      - name: Performance Gate
        if: github.event_name == 'pull_request'
        run: |
          echo "Running Performance Gate..."
          npm run benchmark

      # All gates passed
      - name: Success
        run: echo "✅ All quality gates passed!"
```

## Quality Gate Configuration

### Strictness Levels

#### Level 1: Minimal (Quick Feedback)
- Tests pass
- Linting passes
- No critical security issues

#### Level 2: Standard (Recommended)
- Tests pass with 80% coverage
- No linting errors
- No high/critical security issues
- Basic code quality checks

#### Level 3: Strict (High Standards)
- Tests pass with 90% coverage
- No linting errors or warnings
- No medium+ security issues
- Comprehensive code quality
- Performance benchmarks
- Documentation complete

### Per-Branch Configuration

```yaml
# Different gates for different branches
jobs:
  quality-gates:
    steps:
      - name: Determine strictness
        run: |
          if [ "${{ github.ref }}" == "refs/heads/main" ]; then
            echo "STRICTNESS=strict" >> $GITHUB_ENV
          elif [ "${{ github.base_ref }}" == "main" ]; then
            echo "STRICTNESS=standard" >> $GITHUB_ENV
          else
            echo "STRICTNESS=minimal" >> $GITHUB_ENV
          fi

      - name: Run Appropriate Gates
        run: npm run quality-gates:${{ env.STRICTNESS }}
```

## Handling Gate Failures

### Auto-Comment on PR

```yaml
- name: Comment on PR
  if: failure()
  uses: actions/github-script@v6
  with:
    script: |
      github.rest.issues.createComment({
        issue_number: context.issue.number,
        owner: context.repo.owner,
        repo: context.repo.repo,
        body: '❌ Quality gates failed. Please review the checks above.'
      })
```

### Block Merge

```yaml
# Branch protection rules
required_status_checks:
  strict: true
  contexts:
    - "quality-gates"
```

## Metrics and Reporting

### Track Over Time
- Gate pass rate
- Most common failures
- Time to fix failures
- Trend of quality metrics

### Dashboard Example

```markdown
# Quality Metrics Dashboard

## Last 30 Days

| Metric | Current | Target | Trend |
|--------|---------|--------|-------|
| Test Coverage | 85% | 80% | ↗ +2% |
| Linting Pass Rate | 98% | 100% | ↗ +1% |
| Security Issues | 0 | 0 | → |
| Avg Complexity | 7.2 | <10 | ↗ |
| Code Duplication | 2.1% | <3% | ↘ -0.3% |

## Quality Gate Pass Rate: 94%
```

## Best Practices

### DO
✅ Start with minimal gates, add gradually
✅ Make gates fast (< 5 minutes)
✅ Provide clear error messages
✅ Allow exceptions for specific cases
✅ Track metrics over time
✅ Review and adjust thresholds

### DON'T
❌ Make gates too strict initially
❌ Have slow gates (> 15 minutes)
❌ Add gates without team agreement
❌ Ignore gate failures
❌ Set unrealistic thresholds
❌ Have too many gates (gate fatigue)

## Gradual Rollout

### Week 1: Monitor Only
- Run gates but don't block
- Gather baseline data
- Identify issues

### Week 2: Soft Enforcement
- Gates can be bypassed with approval
- Track bypass reasons
- Fix common issues

### Week 3: Hard Enforcement
- Gates block merges
- Emergency bypass process
- Continuous improvement

## Tool Recommendations

### Testing
- Jest, pytest, go test
- Codecov, Coveralls

### Code Quality
- ESLint, pylint, golangci-lint
- SonarQube, CodeClimate

### Security
- Snyk, npm audit
- Bandit, gosec

### Performance
- Benchmark.js, pytest-benchmark
- k6, Artillery

## Next Steps

- Set up basic quality gates
- Start with testing and linting
- Add security scanning
- Gradually increase strictness
- Monitor and adjust thresholds
- Celebrate quality improvements
