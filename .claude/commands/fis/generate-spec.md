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

### Deep Research Process
- Use all suitable sub-agents for research tasks, and execute them in **parallel**.
- Save findings to @ai_docs/research/{feature-name}/ only if substantial, and add links to generated FIS. Note: If only a file/URL is needed, do not create a research file, just add the reference.

#### 1. Codebase Research:
- Search codebase for relevant files and similar patterns
   - Use command like `tree -d` and `git ls-files | head -250` to get an overview of the codebase structure
- Similar features/patterns in the codebase
- Files to reference with exact line numbers
- Existing conventions and test patterns
- Existing patterns and architecture
- Recommended agents to use: *@agent-research-specialist*, *@agent-solution-architect*

#### 2. External Research:
- Search for similar features/patterns online
- Library/framework documentation (include specific URLs)
- Implementation examples (GitHub/StackOverflow/blogs)
- UI inspiration
- Best practices and common pitfalls
- General explorative and deep web research
- Recommended agents to use: *@agent-research-specialist*, *@agent-solution-architect*, *@agent-ux-designer*

#### 3. Research Multiple Architectural Approaches and Trade-offs
- Analyze 1-3 different approaches with trade-offs
- Consider the trade-offs of different approaches 
- Evaluate implementation complexity, performance implications etc
- Document potential risks and mitigation strategies
- Create architecture diagrams (when needed)
- Recommended agents to use: *@agent-solution-architect*

#### 4. UI Designs Research (when applicable)
- Explore existing UI patterns and components
- Download appropriate design inspiration assets
- Gather inspiration from design systems and libraries
- Create UI wireframes, mockups and sketches
- Create and describe UI flows
- Recommended agents to use: *@agent-ui-designer*, *@agent-ux-designer*
    - When novel UI ideas are needed: *@agent-whimsy-injector*

### User Clarification
Ask ONLY if implementation is blocked by ambiguity.


## 3. Generate FIS
**IMPORTANT**: Use the *@agent-solution-architect* agent to create the FIS.

### Gather All Needed **Context**
- Research documents from _Feature Research and Design_ phase with links
- Architecture decisions documents (ADRs) or other solution architecture documentation
- Documentation URLs with exact sections
- Exact file paths with line numbers
- Specific documentation URLs with sections
- Example patterns to follow
- UI wireframes, mockups, sketches and concept designs
   - _All_ UI related FIS documents **MUST** reference their corresponding wireframe file, containing the exact screen/page design to implement
- UI design assets (e.g. design system references, Figma links, etc)
    - _All_ UI stories **MUST** reference their corresponding design system tokens, components and element definitions, etc.
- Architecture diagrams and design documents
- References to relevant guidelines documents

### Generate from Template
**USE THE TEMPLATE**: Generate the FIS using @ai_docs/templates/spec_template.md as your structure.

### Key Generation Guidelines
1. Fill in template sections - **Include ALL Critical Context**, including: documentation, code examples, gotchas, patterns
2. Each task must be atomic
3. Include all context and file references with line numbers (when applicable)
4. Identify which tasks can safely be done in parallel - and mark them with [P]


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
- [ ] Validation task use different agents than implementation
- [ ] Context includes specific file:line references
- [ ] ADR clearly explains the decision


## 5. Output
Save FIS as: `ai_docs/fis/{feature-name}.md`

**Remember**: The FIS should be executable with minimal orchestration. All complexity and detail belongs in the FIS itself, not the execution command.
