---
description: Executes a single agile story from an implementation plan with complete, autonomous implementation and validation
argument-hint: [Full path to story file]
---

# Execute Story

Execute a fully-defined Story/FIS document, focusing on autonomous, systematic and **COMPLETE** implementation with continuous validation.


## Vital Core Principles ⚠️
- **Autonomous Execution**: Agents work independently to complete tasks
- **Complete Implementation**: 100% completion required - no partial work  
- **No manual steps**: Make use of agents, tools and MCPs to ensure an autonomous process towards 100% completion - **MANUAL WORK = IMMEDIATE FAILURE**
- **Read and understand all instructions**: Read and understand all instructions in this command fully before proceeding!
- **Story = FIS**: Treat the story file as a Feature Implementation Specification (FIS) with all necessary details for implementation and validation.


## Input

### Variables
_Path to the file containing the Story FIS implementation details (i.e. a Feature Implementation Specification):_
FIS_FILE_PATH: $ARGUMENTS

### Input Validation
Before running, ensure the _`FIS_FILE_PATH`_ exists and is accessible. If not, **STOP** and ask the user to provide a valid story file.


## Workflow

The execution workflow consists of the following steps:

<workflow_steps>
1. Load FIS and plan for execution
2. FIS Execution
3. Evaluation, Iteration and Completion
4. Review (with External Agent Applications and internal agents)
5. Update FIS with Implementation Learnings and Documentation
</workflow_steps>


### Step 1: Load FIS and plan for execution
1. Read the FIS document at _`FIS_FILE_PATH`_, understand the Success Criteria, Scope & Boundaries, Architecture Decision Record (ADR), implementation plan, and validation strategies
2. Analyse the codebase to properly understand the project structure, relevant files and similar patterns
  - Use command like `tree -d` and `git ls-files | head -250` to get an overview of the codebase structure
3. Read any *`story-implementation-notes.md`* document for additional context and learnings from previous stories
4. Use TodoWrite to create todos for ALL tasks from the FIS (both implementation and validation tasks)
5. **Think hard** before you execute the plan. Make sure the plan is comprehensive and addresses all requirements.


### Step 2: FIS Execution
Execute the implementation as detailed in the *Implementation Plan* section of the FIS. 

*For each task:*
- Make sure relevant docs and context as defined under *Critical Documentation & Context* in the FIS are properly referenced and used
- Execute each task in sequence
- Make sure tasks marked with a [P] are executed with sub-agents or sub-tasks in parallel / background.
- When possible, delegate tasks to appropriate sub-agents (e.g. delegate isolated development work to *@agent-generalist-developer* or specialist agents, etc.)
- Update TodoWrite and mark each task as complete *in the FIS* when successfully implemented and verified against success criteria
- If encountering build issues or runtime errors, delegate troubleshooting work to the *@agent-build-troubleshooter* agent


### Step 3: Evaluation, Iteration and Completion
- Check all success criteria in the FIS are met
- Ensure all checkboxes in FIS are marked complete (- [x])
- Update progress summary in the FIS
- **CRITICAL**: Validation tasks must be completed by different agents than implementation tasks to ensure independent verification

#### Additional Iterations
- If the implementation does not meet the success criteria, or there are defects, analysis and review feedback that needs addressing, plan another Implementation Iteration:
  - Analyze the problems and use feedback from code reviews and testing to inform the next iteration
  - **Update task tracking**: Use `TodoWrite` to create new tasks for implementation and validation (using the _Validation Strategy_) as needed
  - Execute next iteration (i.e. *steps 2-3*)


### Step 4: Review

### 4.1 Execute Review with External Agent Applications and Internal Agents

Using the **External Agent Application Delegation Protocol** (see CLAUDE.md), launch external review agents to validate the implementation of the story. Use all CLI agents listed in the protocol. _In addition_, also launch review using the @agent-solution-architect agent.
Pass the prompt below to the agents, replacing the variables (e.g. _`FIS_FILE_PATH`_) with actual values.

<agent_review_prompt>
**Analyze and Report on Implementation Gaps**

**1. Compile and Analyze Requirements**
Read and understand the requirements, Success Criteria, Scope & Boundaries, Architecture Decision Record (ADR), implementation plan, and validation strategies from the FIS document at `FIS_FILE_PATH`.

**2. Analyze Current Implementation**
- Analyse the current ongoing implementation
    - Use `git status` and `git diff` to identify changes and understand the current state
    - Use `git log` to review commit history and understand the evolution of the implementation
- Read any *`story-implementation-notes.md`* document for additional context and learnings from previous stories

**3. Gap Analysis**
- Identify any gaps between the current implementation and the requirements.
- Identify any missing functionality, discrepancies or unfulfilled success criteria.
- Identify any missing integration points between components, incomplete functionality
  or any other gaps.
- Zoom out and do a **holistic review** and **sanity check** of the entire implementation to ensure nothing is overlooked and that the implementation is coherent, consistent and doesn't miss any vital aspects or integrations.
- **Ultrathink** and come up with a plan for addressing the gaps - *if any*.

**4. Generate Report**

Your job is *ONLY* to analyze and then generate a report. Do *NOT* make any code changes or commits.

Generate a report that outlines the missing or incomplete functionality, discrepancies or unfulfilled success criteria, and any other gaps identified in the gap analysis. Include a plan for addressing these gaps.

Return the report as markdown text.
</agent_review_prompt>

### 4.2 Evaluate Review Findings and Adjust Implementation if Needed
**Action:** Revise, fix and/or refactor implementation based on review findings from the agents before finalization. Use all suibtable sub agents to address the findings.


### Step 5: Update Implementation Notes documents with important learnings and decsisions
After completed implementation, update the *Implementation Notes* document (`story-implementation-notes.md`, in the same directory as the FIS file) with important learnings and decisions made during implementation.

For instance: 
- Description of what was implemented and how different parts of the implementation relate and integrate with each other
- Key challenges faced and how they were overcome
- Important decisions made and their rationale
- Any deviations from the original plan and why
- Suggestions for future improvements or related features


## Core Principles
- The FIS is the source of truth - follow it exactly
- No planning or decision-making - just execution
- Delegate as much work as possible to the available sub agents, and let the main claude code agent act as an orchestrator.
   - Attempt to parallelize work with sub agents when possible and there is no risk of conflicts (**IMPORTANT:** Task such as compilation/building must typically not be done in parallel)
- If something is unclear, the FIS is incomplete (not this command)
- **IMPORTANT**: The *Final Validation Checklist* must be completed (each item must be verified to be completed and then checked off in the FIS) and all criteria must be met before considering the implementation done.
