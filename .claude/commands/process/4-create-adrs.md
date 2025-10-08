---
description: Creates Architecture Decision Records (ADRs) through systematic technical research, trade-off analysis, and interactive decision-making based on a PRD.
argument-hint: [Spec process root directory, defaults to ai_docs/specs/new-feature/]
---

# Architecture Decision Records (ADR) Creation

Transform a Product Requirements Document into a comprehensive set of Architecture Decision Records through parallel research, systematic trade-off analysis, and interactive decision-making.


## Input

### Variables
_Standard directory for all artifacts created by this command and other commands, as part of the spec process:_
SPEC_DIR: $ARGUMENTS (or defaults to `ai_docs/specs/new-feature/`)


### Input Validation
Before running, ensure the _`SPEC_DIR`_ exists and that is contains a PRD (see structure below), design system and wireframes. If not, **STOP** and and ask the user to create necessary documents first.

Expected structure:
```bash
SPEC_DIR/
├── 1-idea-refinement.md      # Idea refinement document (optional)
├── 2-prd.md                  # Product Requirements Document
├── 3-wireframes/             # HTML wireframes for each page/screen
└── 3-design-system/          # Design tokens, Component styles, design system / style guide documentation
```

## Output
Store all design system artifacts in the following structure within `SPEC_DIR`:

```bash
SPEC_DIR/
└── 4-adrs/                   # Generated ADRs and architecture documentation
```


## ADR Development Process Overview

This process follows a structured approach to create ADRs that provide clear, actionable technical direction:

1. **Requirements Analysis**: Extract technical decision areas from PRD
2. **Goals & Criteria Definition**: Establish architecture principles and evaluation framework
3. **Parallel Research**: Use sub-agents to explore options across decision areas
4. **Trade-off Analysis**: Systematic evaluation using weighted criteria
5. **Interactive Decision-Making**: Present options and gather user choices
6. **ADR Documentation**: Create formal, actionable decision records

---

## Phase 1: Requirements Analysis & Decision Areas

### 1.1 PRD Technical Analysis

Analyze the PRD to identify required technical decisions:

**Core Decision Areas to Evaluate:**
- Application architecture pattern (monolithic, microservices, serverless, etc.)
- Technology stack (language, framework, runtime)
- Database and data persistence strategy
- Authentication and authorization approach
- API design and integration patterns
- Frontend architecture and UI framework
- Hosting and deployment infrastructure
- Development and CI/CD tooling
- Monitoring and observability strategy
- Security and compliance requirements

**Context-Specific Areas (as applicable):**
- Real-time communication (WebSockets, SSE, polling)
- File storage and CDN strategy
- Email and notification services
- Payment processing
- Search and indexing
- Analytics and tracking
- Caching strategy
- Queue and background job processing
- Third-party service integrations
- Mobile app considerations

### 1.2 Decision Priority Matrix

Categorize decisions by:
- **Critical Path**: Must be decided before development can begin
- **Early Stage**: Should be decided early but can evolve
- **Deferred**: Can be decided during implementation
- **Future**: Post-MVP considerations

---

## Phase 2: Architecture Goals & Evaluation Framework

### 2.1 High-Level Architecture Goals Interview

**Gather User's Architecture Objectives:**

Ask the user about their priorities and constraints:

**Technical Philosophy:**
- What's your preferred balance between simplicity and capability?
- Do you favor proven/stable technologies or modern/cutting-edge?
- Preference for opinionated frameworks vs flexible libraries?
- Monolithic simplicity vs distributed complexity?

**Operational Priorities:**
- What's more important: Developer productivity or runtime performance?
- How important is zero-downtime deployment?
- What's your tolerance for operational complexity?
- How critical is vendor lock-in avoidance?

**Team & Resources:**
- What's the team's current technical expertise?
- Are there technologies the team wants to learn/avoid?
- What's the available budget for infrastructure and services?
- Timeline pressure: Ship fast vs build right?

**Non-Functional Priorities:**
- Performance requirements (response times, throughput)
- Scalability expectations (users, data volume, geographic distribution)
- Security and compliance requirements
- Reliability targets (uptime, data durability)

**Long-term Vision:**
- Expected product evolution over 6-12 months
- Potential pivots or major feature additions
- International expansion plans
- Team growth expectations

### 2.2 Evaluation Criteria Prioritization

Present the comprehensive evaluation criteria and ask the user to prioritize:

**Technical Criteria:**

1. **Language/Framework Completeness** (1-10 importance)
   - Built-in feature richness / batteries included
   - Minimal third-party dependencies
   - Standard library capabilities (leading to fewer dependencies)
   - Framework maturity and stability
   - Standard tools for formatting, analysis / linting, building, testing, etc.

2. **Web Standards & Performance** (1-10 importance)
   - Adherence to web standards
   - Client-side resource efficiency
   - Progressive enhancement support
   - SEO and accessibility features
   - Core Web Vitals optimization

3. **Developer Experience** (1-10 importance)
   - Learning curve and onboarding time
   - Documentation quality
   - IDE and tooling support
   - Debugging capabilities
   - Development workflow efficiency

4. **Toolchain Simplicity** (1-10 importance)
   - Setup and configuration ease
   - Build process complexity
   - Dependency management
   - Local development experience
   - Testing infrastructure
   - Increased work due to high total amount of dependencies (direct and transitive)

5. **Maintainability** (1-10 importance)
   - Code organization patterns
   - Refactoring ease
   - Increased work due to high total amount of dependencies (direct and transitive)
   - Dependency update frequency
   - Technical debt management
   - Version migration paths

6. **Community & Ecosystem** (1-10 importance)
   - Community size and activity
   - Library availability
   - Learning resources
   - Professional support options
   - Hiring pool availability

7. **Security** (1-10 importance)
   - Built-in security features
   - Vulnerability track record
   - Security update frequency
   - Compliance certifications
   - Supply chain security
   - Increased risk due to high total amount of dependencies (direct and transitive)

8. **Long-term Viability** (1-10 importance)
   - Project/company backing
   - Development activity
   - Roadmap clarity
   - Breaking change frequency
   - Industry adoption trends

9. **Flexibility & Extensibility** (1-10 importance)
   - Architecture adaptability
   - Integration capabilities
   - Plugin/extension systems
   - Escape hatches availability
   - Migration paths

10. **Testing & Quality** (1-10 importance)
    - Testing framework maturity
    - Test execution speed
    - Mocking capabilities
    - Code coverage tools
    - E2E testing support

11. **Deployment & Operations** (1-10 importance)
    - Deployment complexity
    - CI/CD integration
    - Monitoring capabilities
    - Zero-downtime deployment
    - Rollback mechanisms

12. **Performance & Scalability** (1-10 importance)
    - Runtime performance
    - Memory efficiency
    - Horizontal scaling capability
    - Auto-scaling support
    - Load balancing options

**Additional Criteria (if applicable):**
- Cost efficiency
- Compliance requirements
- Multi-tenancy support
- Internationalization
- Real-time capabilities

### 2.3 Weighted Scoring Framework

Based on user priorities, create weighted scoring formula:

```
Total Score = Σ(Criterion Score × Weight) / Σ(Weights)
```

---

## Phase 3: Parallel Technical Research

### 3.1 Research Orchestration

**Launch Parallel Sub-Agent Research:**

Based on identified decision areas, launch specialized agents in _parallel_:

**Core Research Tasks:**

1. **Tech Stack Research** (@agent-solution-architect)
   - Research 5-15 viable language/framework combinations
   - Evaluate against all criteria
   - Include both traditional and modern options
   - Consider full-stack frameworks vs composable stacks

2. **Database Strategy** (@agent-solution-architect)
   - SQL vs NoSQL vs Multi-model
   - Managed vs self-hosted options
   - Data modeling implications
   - Migration and backup strategies

3. **Authentication Research** (@agent-solution-architect)
   - Build vs buy decision
   - OAuth providers evaluation
   - Session vs token-based approaches
   - Security best practices

4. **Hosting Infrastructure** (@agent-solution-architect)
   - Cloud providers comparison (Vercel, Netlify, Railway, Fly.io, Hetzner, Cloudflare, Deno Deploy, AWS, GCP, Azure, etc. - Research the relevant available options first)
   - Serverless vs traditional hosting
   - Container orchestration options
   - Edge deployment possibilities

5. **Frontend Architecture** (@agent-solution-architect)
   - SPA/CSR vs MPA vs hybrid approaches (modern SSR/SSG)
   - Framework comparison (HTMX, React, Vue, Svelte, etc.)
   - SSR based frameworks (Next.js, Nuxt, SvelteKit, etc.)
   - State management patterns
   - Build tool evaluation

6. **API & Integration** (@agent-solution-architect)
   - REST vs GraphQL vs RPC
   - API gateway options
   - Service mesh considerations
   - Event-driven patterns

7. **DevOps Toolchain** (@agent-solution-architect)
   - CI/CD platforms
   - Testing infrastructure
   - Monitoring and logging
   - Infrastructure as Code

8. **Third-party Services** (@agent-research-specialist)
   - Email services
   - Payment processors
   - Analytics platforms
   - CDN providers

### 3.2 Research Guidelines for Sub-Agents

Each research agent should:

1. **Identify 4-7 Viable Options** per decision area
2. **Evaluate Against Criteria** using the weighted framework
3. **Provide Concrete Evidence** (benchmarks, case studies, documentation)
4. **Include Real-world Examples** of successful implementations
5. **Document Gotchas and Limitations**
6. **Consider Integration Implications** with other choices
7. **Estimate Total Cost of Ownership**
8. **Assess Migration Complexity** from/to other options

### 3.3 Research Synthesis

Consolidate research from all agents:
- Identify interdependencies between decisions
- Flag conflicting recommendations
- Highlight consensus choices
- Note unique insights or warnings

---

## Phase 4: Trade-off Analysis & Option Presentation

### 4.1 Systematic Trade-off Analysis

For each decision area, create a structured comparison:

```markdown
## [Decision Area] Trade-off Analysis

### Options Evaluated
1. **Option A**: Brief description
   - Strengths: [Key advantages]
   - Weaknesses: [Main limitations]
   - Best for: [Ideal use cases]
   - Score: [Weighted score]/10

2. **Option B**: Brief description
   - Strengths: [Key advantages]
   - Weaknesses: [Main limitations]
   - Best for: [Ideal use cases]
   - Score: [Weighted score]/10

### Detailed Comparison Matrix
| Criterion | Option A | Option B | Option C |
|-----------|----------|----------|----------|
| Performance | 8/10 | 9/10 | 7/10 |
| Developer Experience | 9/10 | 7/10 | 8/10 |
| [Continue for all criteria...] |
| **Weighted Total** | **8.2/10** | **7.8/10** | **7.5/10** |

### Risk Analysis
- **Option A Risks**: [Specific risks and mitigation]
- **Option B Risks**: [Specific risks and mitigation]

### Recommendation
Based on the analysis and your priorities, Option A is recommended because...
```

### 4.2 Interactive Decision Process

For each major decision:

1. **Present Analysis Summary**
   - Top 3 options with scores
   - Key trade-offs
   - Risk factors

2. **Gather User Input**
   - "Based on this analysis, which option do you prefer?"
   - "Any concerns about the recommended choice?"
   - "Should we explore any option in more detail?"

3. **Handle Special Cases**
   - If user wants custom combination
   - If none of the options are satisfactory
   - If requirements have changed

### 4.3 Decision Dependencies

Map and validate decision interactions:
- Tech stack → Database options
- Hosting → Deployment strategy
- Frontend framework → Build tools
- Authentication → Session management

Ensure chosen options are compatible.

---

## Phase 5: ADR Documentation

### 5.1 ADR Template

For each architectural decision, create a formal ADR:

```markdown
# ADR-[Number]: [Decision Title]

## Status
[Proposed | Accepted | Superseded]

## Context
[Background information and requirements driving this decision]

## Decision
**We will use [chosen solution] for [specific purpose].**

[Detailed explanation of what this means in practice]

## Consequences

### Positive
- [Specific benefit 1]
- [Specific benefit 2]
- [Specific benefit 3]

### Negative
- [Trade-off or limitation 1]
- [Trade-off or limitation 2]

### Neutral
- [Implication that's neither good nor bad]

## Alternatives Considered

### [Alternative 1]
- **Pros**: [Key advantages]
- **Cons**: [Key disadvantages]
- **Rejected because**: [Specific reason]

### [Alternative 2]
- **Pros**: [Key advantages]
- **Cons**: [Key disadvantages]
- **Rejected because**: [Specific reason]

## Implementation Notes
- [Specific implementation guidance]
- [Configuration requirements]
- [Integration points]
- [Migration considerations]

## Architecture Diagrams
- [Link to diagrams or embed ASCII art]

## References
- [Documentation links]
- [Example implementations]
- [Learning resources]
```

### 5.2 ADR Validation

Ensure each ADR is:
- **Actionable**: Provides clear implementation direction
- **Justified**: Rationale is evidence-based
- **Complete**: All alternatives considered
- **Traceable**: Links back to PRD requirements
- **Testable**: Success criteria defined

---

## Phase 6: Architecture Summary & Roadmap

### 6.1 Architecture Overview Document

Create a high-level summary:

```markdown
## Architecture Overview

### Core Technology Decisions
- **Language**: [Choice with version]
- **Framework**: [Choice with version]
- **Database**: [Choice with configuration]
- **Hosting**: [Platform and tier]
- **Authentication**: [Approach and provider]

### Index of ADRs
1. ADR-001: [Decision Title] - [Link]
2. ADR-002: [Decision Title] - [Link]
3. ADR-00X: [Decision Title] - [Link]

### Architecture Diagram
[ASCII or description of component relationships]
```

### 6.2 Architecture Appendix Document

```markdown
## Architecture Appendix 

### Development Workflow
- Local development setup
- Testing strategy
- CI/CD pipeline
- Deployment process

### Cost Projection
- Infrastructure: $[X]/month
- Services: $[Y]/month
- Scaling considerations

### Risk Register
1. [Risk]: [Mitigation strategy]
2. [Risk]: [Mitigation strategy]
```

---

## Phase 7: Peer Review

### 7.1 Execute Comprehensive ADR Review

Using the **External Agent Application Delegation Protocol** (see CLAUDE.md), launch review agents to validate all architectural decisions. Use all CLI agents listed in the protocol. _In addition_, also launch review using the @agent-solution-architect agent.
Pass the prompt below to the external agents (replacing the placeholders in _Inputs_ with actual paths).

<agent_review_prompt>
# ADR Review
Review the newly created Architecture Decision Records (ADRs) for completeness, alignment with PRD requirements, and technical quality. Identify any missing decisions, over-engineered solutions, or conflicting choices.

## Inputs
- PRD: [Insert PRD path]
- ADRs: [Insert path to generated ADRs]

## Review Focus Areas:
1. PRD Alignment
   - Every PRD requirement has supporting architecture
   - No missing technical decisions
   - All user needs addressed

2. Technical Quality Issues
   - Over-engineered solutions
   - Unnecessarily complex architectures
   - Gold-plating or feature creep
   - Conflicting decisions between ADRs

3. Gap Analysis
   - Missing decision areas
   - Unaddressed technical risks
   - Incomplete integration considerations
   - Forgotten non-functional requirements

4. Practical Validation
   - Feasibility with team skills
   - Budget alignment
   - Timeline realism
   - Maintenance burden assessment

5. Consistency Check
   - No contradicting decisions
   - Coherent technology choices
   - Aligned patterns across ADRs

## Review Output:
- Missing architectural decisions
- Over-engineered solutions to simplify
- Conflicting or contradictory ADRs
- Unrealistic or impractical choices
- Cost/complexity optimization opportunities
</agent_review_prompt>

### 7.2 Evaluate Review Findings and Adjust ADRs
**Action:** Revise ADRs based on review findings from the external agents before finalization.

---

## Quality Checklist

After peer review, verify:

### Completeness
- [ ] All critical decision areas addressed
- [ ] Dependencies between decisions mapped
- [ ] Implementation guidance provided
- [ ] Cost implications documented
- [ ] Risk mitigation strategies defined

### Alignment
- [ ] Decisions support PRD requirements
- [ ] Architecture goals reflected in choices
- [ ] Team capabilities considered
- [ ] Budget constraints respected
- [ ] Timeline feasibility validated

### Quality
- [ ] No over-engineering or unnecessary complexity
- [ ] No conflicting decisions between ADRs
- [ ] Trade-offs clearly documented
- [ ] Alternatives thoroughly evaluated
- [ ] Evidence-based recommendations
- [ ] Clear implementation path
- [ ] Monitoring strategy defined

### Documentation
- [ ] ADRs follow consistent format
- [ ] Decisions are traceable
- [ ] References provided
- [ ] Glossary included if needed
- [ ] Version control established

---

## ADR Output Format

Deliver a complete architecture decision package:

1. **Individual ADRs** for each major decision
2. **Architecture Overview** document
3. **Architecture Appendix** document

The architecture should be:
- **Aligned** with business requirements
- **Feasible** within constraints
- **Scalable** for future growth
- **Maintainable** by the team
- **Documented** for onboarding

Ready to proceed with technical implementation based on clear, justified architectural decisions.


---

**Ultrathink** and deliver comprehensive, high-quality ADRs that meets all criteria.
