---
description: Systematically identify, diagnose, and fix issues in the current implementation through comprehensive troubleshooting and root cause analysis.
---

# Troubleshoot and Fix Implementation Issues


**Scope and context of troubleshooting:**

```
$ARGUMENTS
```


## Systematic Issue Discovery and Resolution


### 1. Current State Assessment

**1.1** - Analyze the current state of the implementation
- Use `git status` and `git diff` to understand recent changes and current working state
- Use `git log --oneline -10` to review recent commits and potential breaking changes
- Check for any obvious issues in the git working directory

**1.2** - Capture baseline information:
- Document current branch and commit hash
- Note any pending changes or uncommitted work
- Identify the scope of components/features that might be affected


### 2. Multi-Layer Issue Detection

**Execute comprehensive issue detection across all layers:**

#### 2.1 Build and Compilation Issues
- Run build commands specified in CLAUDE.md (`deno task build` or equivalent)
- Check for TypeScript compilation errors with `deno task check:types`
- Identify missing imports, type mismatches, or syntax errors
- Document all build failures with specific error messages and file locations

#### 2.2 Runtime and Application Issues  
- Start the development server (`deno task start`)
- Test basic application functionality and identify runtime errors
- Check browser console for JavaScript errors and warnings
- Verify critical user paths and core functionality
- Document any runtime failures, crashes, or unexpected behavior

#### 2.3 Code Quality and Standards Issues
- Run linting with `deno task lint` and identify all warnings/errors
- Run formatting checks with `deno task fmt --check`
- Identify code style violations and inconsistencies
- Check for potential security vulnerabilities or anti-patterns

#### 2.4 Test and Validation Issues
- Execute all tests with `deno test` and identify failures
- Run any additional test suites specified in CLAUDE.md
- Check test coverage and identify gaps
- Verify that existing functionality hasn't regressed

#### 2.5 Configuration and Environment Issues
- Validate environment variables and configuration files
- Check database connections (run `ai_docs/scripts/test-supabase-connection.ts`)
- Verify external service integrations and API connections
- Identify missing dependencies or version conflicts

#### 2.6 Architecture and Integration Issues
- Review component integrations and data flow
- Check for broken imports or circular dependencies  
- Validate API endpoint functionality
- Identify inconsistent state management or data handling


### 3. Root Cause Analysis and Prioritization

**3.1** - **Categorize and prioritize issues**:
- **Critical**: App doesn't start, major functionality broken, security vulnerabilities
- **High**: Test failures, build warnings, significant performance issues  
- **Medium**: Code quality issues, minor functionality problems, documentation gaps
- **Low**: Style inconsistencies, minor optimizations

**3.2** - **Analyze root causes**:
- Use "5 Whys" technique to dig deeper into each issue
- Identify if issues are related or have common underlying causes
- Map issue dependencies (some fixes may resolve multiple problems)
- Document the analysis for each significant issue

**3.3** - **Create comprehensive fix plan**:
- **Setup task tracking**: Use `TodoWrite` to create prioritized todos for all identified issues
- Group related issues that can be fixed together
- Plan fixes in dependency order (foundational issues first)


### 4. Systematic Issue Resolution

**Execute fixes methodically and autonomously:**

#### 4.1 Critical Issue Resolution (First Priority)
- Address any issues preventing the application from starting or building
- Fix security vulnerabilities immediately  
- Restore any broken core functionality
- **Delegate implementation** to specialized sub-agents as appropriate

#### 4.2 Progressive Fix Implementation
- Work through issues in priority order
- Fix one category at a time to avoid creating new problems
- For each fix:
  - Understand the root cause thoroughly before implementing
  - Follow existing patterns and CLAUDE.md guidelines strictly
  - Make minimal, surgical changes rather than broad refactoring
  - Test the specific fix before moving to the next issue

#### 4.3 Validation After Each Fix
- Run relevant tests to verify the fix works
- Ensure no new issues were introduced
- Update task tracking with completed fixes
- Document any side effects or additional changes needed


### 5. Comprehensive Post-Fix Verification

#### 5.1 Full System Validation
- **Build Verification**: Ensure application builds without errors or warnings
- **Runtime Verification**: Start application and verify all major functionality works
- **Test Suite**: Run complete test suite and ensure all tests pass
- **Code Quality**: Run linting, formatting, and type checking with zero issues

#### 5.2 Integration and End-to-End Testing
- Test critical user workflows end-to-end
- Verify database connectivity and data operations  
- Check API endpoints and external service integrations
- Validate responsive design and cross-browser compatibility (if applicable)

#### 5.3 Performance and Security Validation
- Check for performance regressions or new bottlenecks
- Verify security best practices are maintained
- Ensure no sensitive data is exposed or logged
- Run any security scanning tools available

**Always** use suitable **sub-agents** (in **parallel**) such as *@agent-qa-test-engineer*, *@agent-code-review-specialist*, *@agent-architect-reviewer*, *@agent-ui-ux-reviewer*, *@agent-build-troubleshooter*, and specialized technology agents as needed.


### 6. Documentation and Prevention

**6.1** - **Document solutions**:
- Record the root causes and solutions for significant issues
- Update troubleshooting guides if patterns emerge
- Note any configuration changes or environment setup requirements

**6.2** - **Preventive measures**:
- Identify if any development process improvements could prevent similar issues
- Suggest additional validation steps for the future
- Consider if any monitoring or alerting should be added


### 7. Iteration and Escalation

**7.1** - **Verification Loop**:
- If any issues remain unresolved or new issues emerge, start another troubleshooting iteration
- Re-run the full detection process to ensure nothing was missed
- **Update task tracking**: Use `TodoWrite` to create new todos for remaining issues

**7.2** - **Escalation Criteria**:
- If issues require architectural changes beyond the scope of troubleshooting
- If external dependencies or services are broken and need vendor support
- If issues require user input or business decisions

**IMPORTANT:** *Continue troubleshooting iterations until all critical and high-priority issues are resolved*


## **IMPORTANT**: Success Criteria (ALL must pass)

- ✅ **All** critical and high-priority issues identified and resolved
- ✅ **Application builds** successfully without errors or warnings
- ✅ **Application starts** and core functionality works as expected  
- ✅ **All tests pass** without failures or significant warnings
- ✅ **Code quality checks** pass (linting, formatting, type checking)
- ✅ **No regressions** introduced by the fixes
- ✅ **Security vulnerabilities** addressed and validated
- ✅ **Database and external service connections** working properly
- ✅ **Documentation** updated for any significant changes
- ✅ **Task tracking** reflects all completed troubleshooting work


## **IMPORTANT**: Best Practices

- **Systematic approach** - don't skip steps, methodically work through each layer
- **Fix-forward mindset** - address root causes, not just symptoms
- **Minimal changes** - make surgical fixes rather than broad refactoring
- **Test early and often** - validate each fix before proceeding
- **Document as you go** - capture solutions for future reference
- **Use specialized agents** - delegate appropriate work to expert sub-agents
- **Prioritize ruthlessly** - fix critical issues first, optimize later
- **Think in systems** - consider how fixes might affect other components
- **Follow project patterns** - maintain consistency with existing codebase


## **IMPORTANT**: ANTI-PATTERNS TO AVOID

- ❌ **Never** make broad, sweeping changes while troubleshooting
- ❌ Fixing symptoms without understanding root causes  
- ❌ Working on low-priority issues while critical ones remain
- ❌ Making untested changes or "hoping" fixes work
- ❌ Introducing new features while troubleshooting existing issues
- ❌ Skipping validation steps to "save time"
- ❌ Working sequentially when parallel agent delegation is possible
- ❌ Assuming issues are unrelated without proper analysis
- ❌ Over-engineering solutions to simple problems
- ❌ Modifying unrelated code while fixing specific issues