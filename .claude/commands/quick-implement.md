---
description: Atonomously implementation of specified functionality with automated verification
---

# Autonomously implement detailed feature specifications with complete verification
Autonomously implement a specified feature or fix a bug, with comprehensive verification to ensure the implementation is correct and meets all requirements.


## Inputs

REQUESTED_FUNCTIONALITY: $ARGUMENTS


## Workflow

The workflow of this command consists of an iterative loop of the following the _`iterative_implementation_loop`_ below. **Repeat** these loop until the _Evaluation_ step concludes that all success criteria are met and there are no issues from the Verification step.

<iterative_implementation_loop>
1. Analyze
2. Implementation
3. Comprehensive Verification Phase
4. Evaluation
</iterative_implementation_loop>

### 1. Analyze

- Analyse the requirements of the requested feature/fix (see _`REQUESTED_FUNCTIONALITY`_)
- Analyse the codebase to properly understand the project structure, relevant files and similar patterns
  - Use command like `tree -d` and `git ls-files | head -250` to get an overview of the codebase structure
- Identify any potential roadblocks or challenges and plan for how to address them.
- Read and understand any documentation provided or linked to in the issue
- Make sure you fully understand your mission and the project context, then plan your work for effective execution.
- Break down the implementation into smaller, manageable todos, that can be easily tracked
  - **Setup task tracking**: Use `TodoWrite` to create and track all todos
- Before starting the implementation, **think hard** and make sure the plan is comprehensive and addresses all requirements.


### 2. Implementation

**Execute the implementation efficiently and autonomously:**

- Write code following existing patterns in the codebase
- Follow _project guidelines_ (see CLAUDE.md / AGENTS.md) strictly
- Identify which tasks can safely be executed in parallel / background, and do so using the appropriate sub-agents
- Create/update tests before and alongside implementation
- If encountering build issues or runtime errors, delegate troubleshooting tasks to the *@agent-build-troubleshooter* agent


### 3. Comprehensive Verification Phase

Use sub-agents to run the following verification steps in **parallel**:

#### Code Analysis and Style (Analysis, Linting and Formatting)

Using guidelines and commands specified in _project guidelines_ (see CLAUDE.md / AGENTS.md):
- Make sure all code is properly formatted
- Run analysis, linting and type checking and _fix all warnings and errors_

**Always** use available **sub-agents** such as *@agent-qa-test-engineer* or more specialized agents (better suited for specific technologies). 

#### Code, Architecture, UI and Security Review

- Review code quality, security, maintenance, architecture, UI, UX and adherence to project standards and development guidelines as well as adherence to requirements
- **Always** use all suitable **sub-agents** (in **parallel**) such as *@agent-code-review-specialist*, *@agent-architect-reviewer*, *@agent-ui-ux-reviewer*, and other agents as needed.

#### Run Tests

- Execute all tests to ensure everything is working as expected.
- Make sure validation and testing commands in _project guidelines_ (see CLAUDE.md / AGENTS.md) are used (and add new commands as needed)
- Fix any issues that arise during testing.
- **Always** use available **sub-agents** such as *@agent-qa-test-engineer* or more specialized agents.

#### Visual Validation (if applicable)
- If there are UI changes, follow any **Visual Validation Protocol** specified in _project guidelines_ (see CLAUDE.md / AGENTS.md) to ensure UI changes are correct and meet design specifications
- **Always** use available **sub-agents** such as *@agent-qa-test-engineer* or more specialized agents.

#### Verify and Report Completed Work
- Verify task completion: review the work that has been done against the requirements of each task
- For verified tasks, make sure any check boxes in markdown files are checked


### 4. Evaluation
- If the implementation does not meet the success criteria, or there are defects, analysis and review feedback that needs addressing, plan another Implementation Iteration:
  - Analyze the problems and use feedback from code reviews and testing to inform the next iteration
  - Request user input or clarification if necessary
  - **Update task tracking**: Use `TodoWrite` to create new todos for next iteration
  - Execute next iteration with implementation and validation (i.e. **step 2-3**)


## Additional Instructions

### Success Criteria (ALL must pass)

- ✅ **All** tasks and todos in the implementation plan are completed and the completion is reviewed and verified
- ✅ **Status** of verifiably completed tasks and todos are updated (and *checked off/marked as complete* in any relevant markdown files, such as story, FIS, spec files)
- ✅ Application **build** correctly without errors
- ✅ **All** new functionality must be **FULLY** working as specified
- ✅ **No** regressions introduced
- ✅ **All** tests pass
- ✅ **No** review issues
- ✅ **No** analysis issues
- ✅ **All** temporary, refactored, migrated or obsolete code/files removed and cleaned up

### Best Practices

- Always follow project development guidelines (see CLAUDE.md / AGENTS.md)
- **Fix-forward approach** - address issues immediately
- Keep implementation simple and focused (focused on the specific issue) 
- Update documentation if behavior changes
- Consider edge cases and related issues
- Reuse existing utilities and patterns
- Stay on current branch unless explicitly told to create new one
- **Delegate** as much work as possible to the available *sub agents*, and let the main agent act as an orchestrator.

### ANTI-PATTERNS TO AVOID

- ❌ **Never** modify code or documentation that are not related to the current task
- ❌ Researching what's already decided
- ❌ Redesigning the solution
- ❌ Creating unnecessary files
- ❌ Sequential verification (parallelize!)
- ❌ Discussing instead of *doing*
- ❌ Over-engineering the implementation and implementing functionality not in the scope
