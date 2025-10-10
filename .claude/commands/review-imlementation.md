---
description: Perform a thorough review of code, architecture, UI, and security of the current implementation
---

# Review Current Implementation
Perform a thorough review of code, architecture, UI, and security of the current implementation.


## Comprehensive Review Process

## 1. Analyze Current Implementation
- Analyse the current ongoing implementation
    - Use `git status` and `git diff` to identify changes and understand the current state
    - Use `git log` to review commit history and understand the evolution of the implementation
- Analyse the codebase to properly understand the project structure, relevant files and similar patterns
  - Use command like `tree -d` and `git ls-files | head -250` to get an overview of the codebase structure

### 2. Code Analysis and Style (Analysis, Linting, etc)

Using guidelines and commands specified in _project guidelines_ (see CLAUDE.md / AGENTS.md):
- Run analysis, linting and type checking and _fix all warnings and errors_

**Always** use available **sub-agents** such as *@agent-qa-test-engineer* or more specialized agents (better suited for specific technologies). 

### 3. Code, Architecture, UI and Security Review

- Review code quality, security, maintenance, architecture, UI, UX and adherence to project standards and development guidelines as well as adherence to requirements
- **Always** use all suitable **sub-agents** (in **parallel**) such as *@agent-code-review-specialist*, *@agent-architect-reviewer*, *@agent-ui-ux-reviewer*, and other agents as needed.

## 4. Generate Report

Your job is *ONLY* to review and then generate a report. Do *NOT* make any code changes or commits.

Generate a report (markdown) that outlines the findings from the review. Include a plan for addressing any issues found.

Store the review report in a files in a suitable location, e.g. *ai_docs/feature-name-review-report.md*
