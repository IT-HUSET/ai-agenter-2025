---
description: Creates a complete agile implementation plan with focused, independently verifiable stories based on project requirements and architecture.
argument-hint: [Spec process root directory, defaults to ai_docs/specs/new-feature/]
---

# Implementation Plan & Story Creation

Transform project requirements and architecture into an executable agile implementation plan with focused, parallel-executable stories (a.k.a. Feature Implementation Specifications - FIS).


## Input

### Variables
_Standard directory for all artifacts created by this command and other commands, as part of the spec process:_
SPEC_DIR: $ARGUMENTS (or defaults to `ai_docs/specs/new-feature/`)

### Input Validation
Before running, ensure the _`SPEC_DIR`_ exists and that is contains a PRD (see structure below), design system and wireframes, as well as architecture documentation (ADRs). If not, **STOP** and ask the user to create necessary documents first.

Expected structure:
```bash
SPEC_DIR/
├── 1-idea-refinement.md      # Idea refinement document (optional)
├── 2-prd.md                  # Product requirements document
├── 3-wireframes/             # HTML wireframes for each page/screen
├── 3-design-system/          # Design tokens, Component styles, design system / style guide documentation
└── 4-adrs/                   # Generated ADRs and architecture documentation
```

## Output
Store all design system artifacts in the following structure within `SPEC_DIR`:
```bash
SPEC_DIR/
├── 5-implementation-plan.md    # Master implementation plan
└── 5-stories/                  # Directory containing individual story files
    ├── story-[id]-[name].md
    └── ...
```


---

## Phase 1: Requirements Analysis

### Document Discovery & Analysis

**The implementation MUST be based on:**
- **PRD** - Product requirements document
- **Architecture** - Technical decisions (ADRs) in architecture docs
- **Design System** - Style guides and UI components from `SPEC_DIR/3-design-system/`
  - Use `tokens.css` for all design tokens (colors, typography, spacing) - translate to platform-specific formats
  - Reference `components.css` for component patterns - adapt to native components
  - **CRITICAL**: Use HTML wireframes from `SPEC_DIR/3-wireframes/` directory as design reference for each screen
  - **Platform Note**: HTML/CSS artifacts serve as universal design language - translate to platform-specific implementations (SwiftUI, React Native, Flutter, Electron, etc.)
- **Concept Design** - Visual designs, mockups
- **Tech Stack** - Correct patterns and best practices for chosen stack
- **Relevant Guidelines** - For Development, Architecture, UX/UI etc - see under `ai_docs/guidelines` and any other relevant directories

```bash
# Find project documentation
tree -d -L 3
find . -name "*.md" -type f | grep -E "(doc|spec|requirement|design|architecture)"
git ls-files | head -250
```

**Fully understand:**
- All requirements and user stories
- Architecture decisions and constraints
- Design system specifications
- Existing codebase patterns and conventions

### Additional Research (If Needed)

Before creating stories, fill knowledge gaps:
- Use suitable sub-agents for research tasks
- Execute research in **parallel** for efficiency
- Save findings to documentation **only if substantial**
- For simple references, just add links to stories

**User Clarification:** Ask ONLY if implementation is blocked by critical ambiguity.

---

## Phase 2: Story Creation

### CRITICAL Story Guidelines

**Every story MUST be:**
1. **Focused & Limited** - Single aspect of functionality, standalone for parallel execution
2. **Pragmatic** - Not over-engineered, produces 100% functional code
3. **Verifiable** - Clear acceptance criteria and tests

**Ensure a Balanced Story Set:**
- **Create the MINIMUM** number of stories to cover all requirements
   - **Avoid Too Small Stories** - Each story should be substantial enough to deliver meaningful functionality
- **Avoid Over-Specification** - No unnecessary complexity or features
- **No Overlap** - Stories must not duplicate work or conflict

### Progressive Implementation Strategy

#### For ALL Projects:
1. **Foundation First** - Setup, core architecture, routing
2. **Use Mock Data** - As long as possible to reduce complexity
3. **Iterative Enhancement** - Build incrementally on foundation
4. **Polish Last** - Performance, optimization, final styling

#### For UI Projects Specifically:
1. **Wireframes First** - Use HTML wireframes from `SPEC_DIR/3-wireframes/` as design specification
   - Each screen/page story MUST reference its corresponding wireframe file
   - **Web Projects**: Convert HTML directly to target framework (React, Vue, etc.)
   - **Native Mobile**: Translate HTML layout to SwiftUI, React Native, Flutter components
   - **Desktop Apps**: Adapt HTML structure to Electron, Tauri, native toolkit
   - **Key**: HTML wireframes define layout and information hierarchy, not implementation
2. **Functional Structure** - Navigation/routing and major components work
3. **Progressive Detail** - Build features iteratively
4. **Design System Last** - Apply design tokens translated to platform-specific formats

#### Test-First Development (TDD):
- **Write tests first** for application logic
- Define acceptance criteria through tests
- Include test specs in story definition

### Story Organization

- For complete projects or complex/large features, organize stories into layers/phases (see example below). 
- For more regular sized individual features (i.e. not complete projects), use only a single story per layer.
- Mark stories that can be done in parallel with `[P]`.

#### Example Layered Story Structure
```
Foundation Layer (Sequential)
├── Project setup
├── Core architecture
├── Basic routing/navigation [UI: wireframes only]
└── Data layer [with mock data]

Feature Layer (Parallel - mark with [P])
├── [P] Feature modules [use mock data]
├── [P] Business logic [TDD - tests first]
├── [P] API endpoints [mock responses initially]
└── [P] UI components [wireframes, no styling]

Integration Layer (Sequential)
├── Real data connections
├── External services
└── Third-party APIs

Polish Layer (Parallel - mark with [P])
├── [P] Design system application
├── [P] Performance optimization
├── [P] Error handling
└── [P] Accessibility
```


---

## Phase 3: Story Specification

### Platform Translation Guidelines

When creating stories for non-web platforms, include translation mappings:

**Mobile Native (iOS/Android):**
- HTML `<div>` containers → `View`/`VStack`/`HStack` (SwiftUI) or `Box`/`Column`/`Row` (Compose)
- CSS Grid/Flexbox → Platform layout systems
- CSS colors/typography → Native theme systems
- HTML forms → Native input controls

**Desktop Native:**
- HTML structure → Window/Panel/Widget hierarchies
- CSS styling → Platform theming APIs
- Responsive breakpoints → Window size handling

**Cross-Platform Frameworks:**
- React Native: Near-direct translation with RN components
- Flutter: Widget tree following HTML structure
- Electron: Can use HTML/CSS directly


### Story (FIS) Generation:

**IMPORTANT**: Use the *@agent-solution-architect* agent to create the Stories (FIS).

#### Gather All Needed **Context**
- Architecture decisions documents (ADRs) or other solution architecture documentation
- Documentation URLs with exact sections
- Exact file paths with line numbers
- Specific documentation URLs with sections
- Example patterns to follow
- UI wireframes, mockups, sketches and concept designs
   - _All_ UI stories **MUST** reference their corresponding wireframe file, containing the exact screen/page design to implement
- UI design assets (e.g. design system references, Figma links, etc)
   - _All_ UI stories **MUST** reference their corresponding design system tokens, components and element definitions, etc.
- Architecture diagrams and design documents
- References to relevant guidelines: 
   - For Development tasks, always include reference to _`ai_docs/guidelines/DEVELOPMENT-ARCHITECTURE-GUIDELINES.md`_
   - For UI/UX related tasks, always include reference to _`ai_docs/guidelines/UX-UI-GUIDELINES.md`_
   - See also other relevant guidelines under _`ai_docs/guidelines/`_ directory

#### Generate from Template
**USE THE TEMPLATE**: Generate the Stories (FIS) using @ai_docs/templates/spec_template.md as your structure.

#### Key Generation Guidelines
1. Fill in template sections - **Include ALL Critical Context**, including: documentation, code examples, gotchas, patterns
2. Each todo must be atomic
3. Include all context and file references with line numbers (when applicable)
4. Identify which objective todos can be safely done in parallel - and mark them with [P]


### Parallel Story Creation

After establishing the full story list:
- Spawn sub-tasks for story specification creation
- Execute story creation tasks in **parallel** using specialized agents
- Assign agents based on domain (frontend, backend, testing, etc)

---

## Phase 4: Plan Assembly

### Output Structure

```bash
SPEC_DIR/
├── 5-implementation-plan.md    # Master implementation plan (includes all below)
└── 5-stories/                  # Directory containing individual story files     
    ├── story-[id]-[name].md
    └── ...
```

### Master Plan Contents

1. **Executive Summary** - Approach, timeline, success criteria
2. **Story Catalog** - Complete list with descriptions
3. **Execution Roadmap**
   ```
   Phase 1: Foundation (Sequential)
   - Stories: [001, 002, 003]

   Phase 2: Core Features (Parallel Groups)
   - Group A: [P] Stories [004, 005]
   - Group B: [P] Stories [006, 007]
   ```
4. **Dependency Map**
   ```yaml
   story-001: []                    # No dependencies
   story-002: [story-001]
   story-003: []                    # Can start immediately
   story-004: [story-002, story-003]
   ```
5. **Risk Register**
   | Risk | Impact | Mitigation | Affected Stories |
   |------|--------|------------|------------------|
   | ... | High/Med/Low | Strategy | Story IDs |

6. **Success Metrics** - Completion criteria, quality benchmarks

---

## Phase 5: Peer Review

### 5.1 Execute Comprehensive Review

Using the **External Agent Application Delegation Protocol** (see CLAUDE.md), launch review agents to validate the entire plan. Use all CLI agents listed in the protocol. _In addition_, also launch review using the @agent-solution-architect agent.
Pass the prompt below to the agents (replacing the placeholders in _Inputs_ with actual paths).

<agent_review_prompt>
# Implementation Plan Review
Review the newly created Implementation Plan (stories) for completeness, alignment with PRD requirements, and technical quality. Identify any missing decisions, over-engineered solutions, or conflicting choices.

## Inputs
- PRD: [Insert PRD path]
- Implementation Plan: [Insert path to generated implementation plan/stories]

## Review Focus Areas:
1. Requirements Coverage
   - Cross-reference every PRD requirement
   - Verify all ADRs are properly applied
   - Confirm design system usage:
     * Each UI story references its corresponding wireframe from `wireframes/`
     * Stories use design tokens from `tokens.css`
     * Component patterns from `components.css` are followed

2. Story Quality Issues
   - Identify over-engineering or over-specification
   - Flag unnecessary complexity
   - Find any story overlap or conflicts
   - Check for duplicated work

3. Gap Analysis
   - Missing features or functionality
   - Unaddressed edge cases
   - Incomplete user flows
   - Forgotten non-functional requirements

4. Execution Optimization
   - Validate parallel execution markings
   - Check dependency accuracy
   - Identify additional parallelization opportunities

## Review Output:
- List of gaps to address
- Stories needing simplification
- Conflicting or overlapping stories
- Missing requirements coverage
- Optimization suggestions
</agent_review_prompt>

### 7.2 Evaluate Review Findings and Adjust Plan
**Action:** Revise plan based on review findings from the external agents before finalization.

---

## Final Story Creation Checklist

After peer review, verify:

**Story Coverage:**
- [ ] All PRD features have corresponding stories
- [ ] Gaps identified by review addressed
- [ ] No missing functionality or edge cases
- [ ] Each story is self-contained and focused

**Story Quality:**
- [ ] No over-engineering or over-specification
- [ ] No unnecessary complexity
- [ ] No overlap between stories
- [ ] No conflicting work requirements
- [ ] Mock data used appropriately
- [ ] UI starts with wireframes
- [ ] Tests written first (TDD)

**Technical Compliance:**
- [ ] Architecture decisions (ADRs) properly referenced
- [ ] Design system correctly used:
  - [ ] Each UI story links to its wireframe file
  - [ ] Design tokens (`tokens.css`) referenced
  - [ ] Component patterns (`components.css`) followed
  - [ ] Wireframes used as starting point for UI implementation
- [ ] No conflicting frameworks introduced
- [ ] Tech stack best practices followed

**Execution Readiness:**
- [ ] Parallel stories correctly marked [P]
- [ ] Dependencies accurately mapped
- [ ] Progressive enhancement clear
- [ ] Risks identified and mitigated

---

## Key Principles

### DO:
✅ Start with HTML wireframes from `ai_docs/specs/[feature]/design-system/wireframes/` as design reference
✅ Reference specific wireframe files in each UI story
✅ Translate HTML/CSS design system to platform-specific implementations:
  - Web → Direct usage with framework adaptations
  - Mobile → Native component equivalents (UIKit, Jetpack Compose, etc.)
  - Desktop → Platform toolkit components
✅ Maintain design token consistency across platforms
✅ Write tests before implementation (TDD)
✅ Keep stories focused and limited
✅ Enable parallel execution
✅ Build progressively from foundation

### DON'T:
❌ Apply design before structure works
❌ Integrate real data too early
❌ Over-engineer or over-specify
❌ Create large, complex stories
❌ Skip tests for business logic

---

## Success Criteria

The plan succeeds when it provides:
1. **Complete Coverage** - All requirements addressed
2. **Clear Progression** - Foundation → Features → Integration → Polish
3. **Parallel Execution** - Independent stories for concurrent work
4. **Pragmatic Approach** - Simple, functional, testable stories
5. **Risk Awareness** - Challenges identified and mitigated

**Outcome:** An executable plan with focused stories that start simple (wireframes/mocks) and build progressively to full implementation.

---

**Ultrathink** and deliver a comprehensive, high-quality implementation plan and story set that meets all criteria.
