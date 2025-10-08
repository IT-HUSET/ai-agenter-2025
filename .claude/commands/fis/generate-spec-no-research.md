---
description: Creates a Feature Implementation Specification from template
---

# Generate Feature Implementation Specification

Given a feature request, generate a Feature Implementation Specification (FIS) using the template at @ai_docs/templates/spec_template.md.

## Feature Request Input:
```
$ARGUMENTS
```

**Remember**: Agents executing the FIS only get the context you provide. Include all necessary documentation, examples, and references.


## 1. Priming and Project Understanding
- Read CLAUDE.md for project guidelines, conventions, and development philosophy, useful tools and commands


## 2. Feature Research and Design

### Analyze Requirements
- Fully understand the feature request and requirements
- Note any provided documentation, examples, or constraints

#### Codebase Research:
- Search codebase for relevant files and similar patterns
   - Use command like `tree -d` and `git ls-files | head -250` to get an overview of the codebase structure
- Similar features/patterns in the codebase
- Files to reference with exact line numbers
- Existing conventions and test patterns
- Existing patterns and architecture
- Recommended agents to use: *@agent-research-specialist*, *@agent-solution-architect*

### User Clarification
Ask ONLY if implementation is blocked by ambiguity.


## 3. Generate FIS
**IMPORTANT**: Use the *@agent-solution-architect* agent to create the FIS.

### Gather All Needed **Context**
- Architecture decisions documents (ADRs) or other solution architecture documentation
- Documentation URLs with exact sections
- Exact file paths with line numbers
- Specific documentation URLs with sections
- Example patterns to follow
- UI wireframes, mockups, sketches and concept designs
- UI design assets (e.g. design system references, Figma links, etc)
- Architecture diagrams and design documents

### Generate from Template
**USE THE TEMPLATE**: Generate the FIS using @ai_docs/templates/spec_template.md as your structure.

### Key Generation Guidelines
1. Fill in template sections - **Include ALL Critical Context**, including: documentation, code examples, gotchas, patterns
2. Each task must be atomic
3. Include all context and file references with line numbers (when applicable)
4. Identify which tasks can be safely done in parallel - and mark them with [P]


## 4. Quality Validation

### Plan Review
Systematically review and critique the generated plan for missing edge cases, redundant aspects, and ordering inefficiencies.

### Confidence Check
Rate your FIS 1-10 for single-pass implementation success:
- **9-10**: All context present, clear decisions, validation automated
- **7-8**: Good detail, minor clarifications might be needed
- **<7**: Missing context, unclear architecture, needs revision

**If score <8**: Revise or ask for user clarification.

### Final Checklist
- [ ] FIS follows template structure exactly
- [ ] Validation tasks use different agents than implementation
- [ ] Context includes specific file:line references
- [ ] ADR clearly explains the decision


## 5. Output
Save FIS as: `ai_docs/fis/{feature-name}.md`

**Remember**: The FIS should be executable with minimal orchestration. All complexity and detail belongs in the FIS itself, not the execution command.
