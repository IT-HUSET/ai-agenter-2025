---
description: Helps create a comprehensive Product Requirements Document (PRD) from a refined idea, covering all functional and non-functional requirements with no outstanding questions.
argument-hint: [Spec process root directory, defaults to ai_docs/specs/new-feature/]
---

# Product Requirements Document (PRD) Creation

Help the user create a comprehensive Product Requirements Document from their refined idea, ensuring all edge cases are covered and there are no outstanding questions.


## Input

### Variables
_Standard directory for all artifacts created by this command and other commands, as part of the spec process:_
SPEC_DIR: $ARGUMENTS (or defaults to `ai_docs/specs/new-feature/`)

### Input Validation
Before running, ensure the _`SPEC_DIR`_ exists and contains a file named `1-idea-refinement.md` with the refined idea. If not, **STOP** and ask the user to run the idea refinement process first. 

Expected structure:
```bash
SPEC_DIR/
└── 1-idea-refinement.md
```

## Output
Store the completed PRD in a file called `2-prd.md` in the directory `SPEC_DIR`, i.e.:
```bash
SPEC_DIR/
├── 1-idea-refinement.md
└── 2-prd.md
```


## PRD Development Process

### 1. Initial Analysis & Gap Identification

Analyze the refined idea to identify:
- Missing functional requirements
- Unclear user flows or interactions
- Undefined edge cases
- Ambiguous success criteria
- Gaps in user personas or scenarios
- Quantifiable business impact
- Competitive positioning gaps
- MVP scope ambiguities

### 2. Requirements Discovery Interview

Interview the user to gather comprehensive requirements. Ask targeted questions based on gaps identified:

**Core Functionality Questions:**
- What are the must-have features vs nice-to-have features?
- What is the specific workflow for each major user action?
- What happens when users perform invalid actions or provide incorrect input?
- What are the data validation rules and constraints?
- How should the system handle errors and exceptions?

**User Experience Questions:**
- What is the expected user onboarding process?
- What are the different user roles and their permissions?
- How should the system provide feedback to users?
- What are the accessibility requirements?
- What devices and platforms must be supported?

**Business Logic Questions:**
- What are the business rules and constraints?
- How should the system handle concurrent users or actions?
- What are the data retention and deletion policies?
- What audit trails or logging are required?
- What are the compliance or regulatory requirements?

**Edge Cases & Error Scenarios:**
- What happens when network connectivity is lost?
- How should the system handle incomplete or partial data?
- What are the timeout and retry policies?
- How should the system degrade gracefully under load?
- What are the fallback behaviors for external dependencies?

**Success Metrics Questions:**
- What specific metrics define success for this product?
- What are the performance benchmarks?
- How will user adoption be measured?
- What are the quality thresholds?

Generate a comprehensive list of questions specific to the idea, then interview the user before proceeding.

### 3. Requirements Structuring & Documentation

Based on the interview responses, structure the PRD following this proven template:

#### Executive Summary
- Project title and version
- Problem statement with quantified impact
- Product vision and objectives
- Target audience and user personas
- Success definition with SMART metrics
- Business goals and OKR alignment

#### Problem Definition & Context
- Clear problem statement with data-backed evidence
- User research insights and validated pain points
- Market opportunity analysis
- Competitive landscape assessment
- Strategic positioning

#### MVP Scope & Boundaries
- Core functionality (must-haves vs nice-to-haves)
- Clear scope boundaries with explicit exclusions
- MVP validation approach and learning objectives
- Feature rationale tied to user needs
- Timeline expectations

#### Functional Requirements

**User Stories & Scenarios**
- User stories in format: "As a [user type], I want [goal], so that [benefit]"
- Primary user flows with step-by-step descriptions
- Alternative paths and edge cases
- Error scenarios and recovery flows
- User journey maps for critical paths

**Feature Specifications**
For each feature:
- Description and purpose tied to user value
- Testable acceptance criteria
- Input/output specifications
- Validation rules and constraints
- Error handling and recovery
- Dependencies and integration points
- Priority level (P0/P1/P2)

**Data Requirements**
- Data models and relationships
- Required fields and constraints
- Data validation rules
- Data privacy considerations

#### Non-Functional Requirements (High-Level)

**Performance Requirements**
- Response time expectations
- Throughput requirements
- Scalability considerations
- Resource utilization limits

**Reliability & Availability**
- Uptime requirements
- Error recovery expectations
- Data backup needs
- Disaster recovery considerations

**Security Requirements**
- Authentication requirements
- Authorization and access control
- Data protection needs
- Compliance requirements

**Usability Requirements**
- Accessibility standards
- Browser/device compatibility
- Internationalization needs
- User documentation requirements

**Operational Requirements**
- Monitoring and alerting needs
- Logging requirements
- Maintenance windows
- Support requirements

#### Constraints & Assumptions

**Constraints**
- Timeline constraints
- Resource limitations
- Technology constraints
- Regulatory constraints

**Assumptions**
- User behavior assumptions
- Technical assumptions
- Business assumptions
- External dependencies

#### Out of Scope
Explicitly list what is NOT included in this version

### 4. Edge Case Verification

Explore additional edge cases:
- Unusual user behaviors
- System boundary conditions
- Integration failure scenarios
- Data corruption or loss scenarios
- Security breach attempts
- Performance degradation scenarios
- Compliance violations

### 5. Apply Prioritization Framework

Before finalizing requirements, apply systematic prioritization:

**RICE Scoring for Features:**
- **Reach**: Number of users impacted per quarter
- **Impact**: Scale of impact (0.25=minimal, 0.5=low, 1=medium, 2=high, 3=massive)
- **Confidence**: Percentage certainty in estimates (50%, 80%, 100%)
- **Effort**: Person-months required
- **Score** = (Reach × Impact × Confidence) / Effort

**MoSCoW Classification:**
- **Must have**: Core MVP functionality
- **Should have**: Important but not vital
- **Could have**: Desirable but optional
- **Won't have**: Explicitly out of scope

### 6. Requirements Validation Checklist

Apply systematic validation:

**Completeness Assessment:**
- [ ] Problem definition clearly articulated with quantified impact
- [ ] All user stories have testable acceptance criteria
- [ ] Every feature has defined error handling
- [ ] All edge cases have specified behavior
- [ ] Success metrics are SMART (Specific, Measurable, Achievable, Relevant, Time-bound)
- [ ] Non-functional requirements have clear thresholds
- [ ] No ambiguous terms without specific definitions

**Quality Gates:**
- [ ] Requirements focus on "what" not "how"
- [ ] All assumptions are documented
- [ ] Dependencies are identified and mapped
- [ ] Compliance and regulatory requirements addressed
- [ ] Security considerations included
- [ ] Data privacy requirements defined
- [ ] Accessibility standards specified
- [ ] OKR alignment verified

**Stakeholder Alignment:**
- [ ] Cross-functional input incorporated
- [ ] Trade-offs explicitly documented
- [ ] Approval process defined
- [ ] The document is self-contained with no outstanding questions

### 7. Final PRD Format

Present the PRD in a clear, structured format:
- Use clear headings and sections
- Include diagrams, user flows, or wireframes where helpful
- Use tables for structured data (e.g., RICE scores, feature matrix)
- Provide concrete examples for complex requirements
- Include a glossary for domain-specific terms
- Add version control and change history
- Document approval process and stakeholder sign-offs

## Important PRD Creation Guidelines

- **Be Specific**: Replace vague terms with measurable criteria and concrete examples
- **Be Complete**: Cover all paths, not just happy paths
- **Be Testable**: Every requirement should be verifiable with clear pass/fail criteria
- **Be Realistic**: Consider technical and resource constraints
- **Be Prioritized**: Use RICE scoring and MoSCoW to clearly distinguish priorities
- **Be User-Focused**: Frame requirements from user perspective with clear value propositions
- **Be Consistent**: Use consistent terminology throughout
- **Focus on "What" not "How"**: Avoid technical implementation details (save for architecture phase)
- **Document Decisions**: Record rationale, trade-offs, and alternatives considered
- **Keep It Maintainable**: Structure for easy updates as requirements evolve
- **Living Document**: Treat the PRD as evolving throughout development
- **Data-Driven**: Support assertions with research, metrics, or evidence
- **OKR Alignment**: Connect features to measurable business outcomes

## 5. Peer Review

### Execute Comprehensive PRD Review

**Launch review sub-agent** to validate the complete PRD:

```yaml
Review Focus Areas:
1. Completeness Check
   - All user needs addressed
   - No missing requirements
   - Edge cases covered
   - Error scenarios defined

2. Quality Issues
   - Over-specified features (gold-plating)
   - Unnecessarily complex requirements
   - Scope creep beyond MVP
   - Conflicting requirements

3. Gap Analysis
   - Missing user stories
   - Unaddressed user segments
   - Forgotten non-functional requirements
   - Incomplete acceptance criteria

4. Clarity & Consistency
   - Ambiguous requirements
   - Contradicting features
   - Unclear priorities
   - Testability concerns

5. MVP Validation
   - Features truly essential for MVP
   - Nice-to-haves incorrectly included
   - Dependencies properly mapped
```

**Review Output:**
- Requirements gaps to fill
- Over-engineered features to simplify
- Conflicting requirements to resolve
- Ambiguities to clarify
- Scope creep to remove

**Action:** Revise PRD based on review findings before finalization.

## Output

After peer review, provide a complete PRD document with:

### Structure & Content
1. Executive summary with quantified problem statement
2. Problem definition with market context
3. MVP scope with clear boundaries
4. Comprehensive functional requirements with user stories
5. High-level non-functional requirements with thresholds
6. Success metrics aligned to OKRs
7. Prioritized feature list with RICE scores
8. Documented assumptions, constraints, and trade-offs
9. Edge cases and error scenarios fully specified
10. Clear scope boundaries and exclusions

### Quality Criteria
- No outstanding questions or ambiguities
- All requirements testable and verifiable
- User value clearly articulated
- Dependencies mapped
- Risks identified with mitigation strategies
- Stakeholder alignment documented
- **No over-specification or unnecessary complexity**
- **No conflicting requirements**
- **Clear MVP boundaries maintained**

### Deliverable Format
The PRD should be:
- Self-contained and comprehensive
- Ready for technical architecture phase
- Structured for easy navigation
- Version controlled with change history
- Include visual aids where helpful (diagrams, tables, flows)
- **Reviewed and validated for completeness and clarity**

The resulting document should enable the development team to proceed with technical design and implementation planning without requiring further clarification on business requirements or product decisions.


---

**Ultrathink** and deliver a comprehensive, high-quality PRD that meets all criteria.
