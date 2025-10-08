---
description: Interactive idea refinement through systematic discovery interviews, analysis, and creative exploration that transforms initial concepts into validated, well-defined ideas ready for PRD development.
argument-hint: [Short description of the initial idea, or reference to file] [Spec process root directory, defaults to ai_docs/specs/new-feature/]
---

# Interactive Idea Refinement Process

A conversation-driven approach to refine application concepts through structured discovery interviews, strategic analysis, and targeted creative exploration.


## Input

### Variables
_The initial idea for the application:_
INITIAL_IDEA: $1

_Standard directory for all artifacts created by this command and other commands, as part of the spec process:_
SPEC_DIR: $2 (or defaults to `ai_docs/specs/new-feature/`)

### Input Validation
If the _`INITIAL_IDEA`_ is missing, **STOP** immediately and ask the user to provide it.

## Output
Store the refined idea in a file called _`1-idea-refinement.md`_ in the directory `SPEC_DIR`, i.e.:
```bash
SPEC_DIR/
└── 1-idea-refinement.md
```

---

## Process Overview: Interview-Centric Refinement

This refinement process places the **interactive discovery interview** at its center, using dialogue as the primary tool for understanding, challenging, and enhancing ideas.

### The 5-Phase Journey

1. **🔍 Pre-Interview Analysis** (10 mins)
   Quick assessment to prepare intelligent, targeted questions

2. **💬 Interactive Discovery Interview** (30-45 mins)
   Deep, conversational exploration of the idea through structured dialogue

3. **🎨 Targeted Creative Exploration** (20 mins)
   Focused brainstorming based on interview insights

4. **🔄 Synthesis & Validation Loop** (15 mins)
   Consolidate findings and validate with user

5. **✅ Final Refinement** (10 mins)
   Polish and present the refined concept

---

## Phase 1: Pre-Interview Analysis
*Quick preparation to maximize interview effectiveness*

### 1.1 Rapid Assessment (5 minutes)

**What's Clear:**
- Identify strong, well-defined aspects
- Note specific details already provided
- Recognize explicit constraints or requirements

**What's Missing:**
- Flag undefined elements
- Identify implicit assumptions
- Note areas needing clarification

### 1.2 Interview Planning (5 minutes)

**Generate Hypothesis:**
- Form initial theories about user intent
- Identify potential challenges
- Anticipate likely directions

**Prepare Question Themes:**
- Group questions by topic
- Prioritize based on gaps
- Plan conversation flow

---

## Phase 2: Interactive Discovery Interview
*The heart of the refinement process*

### 2.1 Interview Philosophy

**Core Principles:**
- **Listen First, Talk Second**: Let the user guide the conversation
- **Follow the Energy**: Dig deeper where passion appears
- **Embrace Tangents**: Often reveal hidden insights
- **Challenge Respectfully**: Question assumptions constructively
- **Build Together**: Make it collaborative, not interrogative

### 2.2 Interview Structure

#### Opening (5 minutes)
**Set the Tone:**
```
"I'm excited to help refine your idea. Let's have a conversation about what you're
envisioning. I'll ask questions to understand your vision deeply, challenge assumptions
constructively, and explore possibilities together. Ready?"
```

**Start Broad:**
- "Tell me the story of how this idea came to be"
- "Paint me a picture of success - what does that look like?"
- "Who's the hero of this story - your ideal user?"

#### Discovery Deep Dive (25 minutes)

**Layer 1: The Problem Space**

*Opening Questions:*
- "Walk me through a day in your target user's life - where does this fit?"
- "What's broken about how they solve this today?"
- "When did you personally feel this pain most acutely?"

*Probing Techniques:*
- **The Five Whys**: "Why is that important?" (repeat to reach core)
- **Scenario Testing**: "What if they could already do X?"
- **Extremes**: "What if this problem got 10x worse?"

**Layer 2: The Solution Vision**

*Opening Questions:*
- "If you had a magic wand, what would the perfect solution do?"
- "What's the one thing this MUST do brilliantly?"
- "What would make users tell their friends about this?"

*Probing Techniques:*
- **Feature Prioritization**: "If you could only have 3 features..."
- **Trade-off Exploration**: "Would you rather have X or Y?"
- **Success Metrics**: "How would you measure if this is working?"

**Layer 3: The Market Context**

*Opening Questions:*
- "Who else has tried to solve this? What happened?"
- "What's your unfair advantage here?"
- "Why hasn't Big Tech Company X solved this already?"

*Probing Techniques:*
- **Competitive Analysis**: "How is this 10x better than [alternative]?"
- **Timing Assessment**: "Why is now the right time?"
- **Moat Building**: "What prevents easy copying?"

**Layer 4: The Practical Reality**

*Opening Questions:*
- "What resources do you realistically have?"
- "What's your biggest fear about this project?"
- "What would make you abandon this idea?"

*Probing Techniques:*
- **Resource Mapping**: "Walk me through your constraints"
- **Risk Assessment**: "What keeps you up at night?"
- **Timeline Reality**: "When do you need results by?"

#### Exploration & Ideation (10 minutes)

**Creative Dialogue Techniques:**

*"What If" Game:*
- "What if users could pay with time instead of money?"
- "What if this was a physical product instead?"
- "What if you had Apple's resources?"

*Role Reversal:*
- "If you were the competitor, how would you attack this?"
- "As a skeptical investor, what would worry you?"
- "As the user's friend, what would you warn them about?"

*Analogical Exploration:*
- "This reminds me of [X] - is that connection useful?"
- "How would Netflix/Amazon/Tesla approach this?"
- "What's the Uber of your space?"

#### Synthesis Check (5 minutes)

**Reflection & Validation:**
- "Let me play back what I'm hearing..."
- "The core insight seems to be X - is that right?"
- "If I had to pitch this in one sentence..."

### 2.3 Advanced Interview Techniques

#### Active Listening Signals
- **Mirroring**: Repeat key phrases to show understanding
- **Summarizing**: "So what you're saying is..."
- **Emotional Labeling**: "It sounds like you're frustrated by..."
- **Silence**: Use 3-5 second pauses to let thoughts develop

#### Question Techniques

**Socratic Method:**
- Guide discovery through questions
- Let user reach conclusions themselves
- Challenge without confronting

**Laddering:**
- Start with features → benefits → emotional outcomes
- "You want X" → "So you can Y" → "Which makes you feel Z"

**Projective Techniques:**
- "If your product was a person, what would they be like?"
- "Draw your user journey as a story arc"
- "What movie title describes your product?"

#### Managing Difficult Moments

**When Ideas Are Vague:**
- "Can you give me a specific example?"
- "Walk me through one use case in detail"
- "Show me what the user sees/does/feels"

**When Scope Creeps:**
- "That's interesting - is that MVP or future vision?"
- "If we had to launch in 30 days, what would we cut?"
- "What's the smallest useful version?"

**When Contradictions Appear:**
- "Earlier you mentioned X, now Y - help me understand"
- "These seem in tension - how do we resolve that?"
- "Which matters more when they conflict?"

### 2.4 Interview Documentation

**Real-Time Capture:**
- Direct quotes for key insights
- Emotional moments and energy shifts
- Contradictions and uncertainties
- Breakthrough moments

**Organization Method:**
- **Facts**: What we know for certain
- **Assumptions**: What we believe but haven't validated
- **Questions**: What remains unclear
- **Ideas**: New possibilities that emerged
- **Decisions**: Clear choices made

---

## Phase 3: Targeted Creative Exploration
*Focused brainstorming based on interview insights*

### 3.1 Selecting Techniques

Based on interview findings, choose appropriate methods from the **[Brainstorming Toolkit](./brainstorming-toolkit.md)**:

**If Need Innovation:**
- What If Scenarios
- Assumption Reversal
- Provocation Technique

**If Need Clarity:**
- First Principles Thinking
- Five Whys
- Mind Mapping

**If Need Features:**
- SCAMPER Method
- Morphological Analysis
- Forced Relationships

### 3.2 Focused Exploration Sessions

Run 2-3 targeted 10-minute sessions using selected techniques, focusing on:
- Biggest gaps identified in interview
- Areas of highest user passion
- Key differentiation opportunities
- Critical risk areas

---

## Phase 4: Synthesis & Validation Loop

### 4.1 Pattern Recognition
- Identify recurring themes from interview
- Connect insights to user needs
- Map creative ideas to problems

### 4.2 Validation Conversation

**Present Synthesis:**
```
"Based on our conversation, here's what I'm understanding as the refined concept:
- Core Problem: [concise statement]
- Target User: [specific description]
- Key Solution: [main approach]
- Success Looks Like: [measurable outcome]

What did I get wrong? What's missing?"
```

**Iterate Based on Feedback:**
- Adjust based on corrections
- Clarify misunderstandings
- Confirm alignment

---

## Phase 5: Final Refinement

### 5.1 The Refined Concept

Structure the final output as:

```markdown
# Refined Application Concept

## Executive Summary
[2-3 sentences capturing the essence]

## Core Insights from Discovery
- **Key Problem**: [Most important problem identified]
- **Target User**: [Specific persona with clear needs]
- **Unique Value**: [What makes this special]

## Solution Definition
### The Big Idea
[One paragraph describing the solution]

### MVP Scope
**Must Have:**
- [Essential feature 1]
- [Essential feature 2]
- [Essential feature 3]

**Success Metrics:**
- [Metric 1]: Target value
- [Metric 2]: Target value

### Key Differentiators
- [Unique aspect 1]
- [Unique aspect 2]

## Implementation Approach
- **Phase 1**: [First milestone]
- **Phase 2**: [Second milestone]
- **Technical Strategy**: [High-level approach]

## Critical Risks & Mitigations
| Risk | Mitigation Strategy |
|------|-------------------|
| [Risk 1] | [Approach] |
| [Risk 2] | [Approach] |

## Next Steps
1. [Immediate action]
2. [Follow-up action]
3. [Validation action]
```

---

## Interview Best Practices

### Do's ✅
- **Be genuinely curious** - Real interest creates better dialogue
- **Follow energy** - Dig deeper where passion appears
- **Use specifics** - Always ask for concrete examples
- **Embrace silence** - Give time for thought
- **Challenge with respect** - Question assumptions constructively
- **Document verbatim** - Capture exact words for key insights
- **Stay flexible** - Let conversation flow naturally
- **Build together** - Make it collaborative

### Don'ts ❌
- **Don't lead witness** - Avoid suggesting answers
- **Don't judge** - Stay neutral and open
- **Don't rush** - Give ideas time to develop
- **Don't assume** - Always verify understanding
- **Don't solve immediately** - Understand fully first
- **Don't interrupt** - Let thoughts complete
- **Don't skip emotions** - They reveal important insights
- **Don't fear tangents** - They often lead to breakthroughs

---

## Quality Checklist

Before considering refinement complete:

**Discovery Quality:**
- ☐ User problem deeply understood
- ☐ Target audience specifically defined
- ☐ Core value proposition clear
- ☐ Differentiation established
- ☐ Assumptions identified and challenged

**Solution Quality:**
- ☐ MVP scope focused and achievable
- ☐ Success metrics defined and measurable
- ☐ Technical approach validated
- ☐ Key risks identified with mitigations
- ☐ Next steps clear and actionable

**Communication Quality:**
- ☐ Can explain in one sentence
- ☐ User would recognize their problem
- ☐ Investor would understand opportunity
- ☐ Developer would know where to start
- ☐ Success criteria unambiguous

---

## Remember

The goal is not perfection but clarity. A well-refined idea:
- Solves a real problem for real people
- Has a clear, focused MVP scope
- Can be built with available resources
- Has measurable success criteria
- Is ready for PRD development

The interactive interview is your most powerful tool - use it to understand deeply, challenge thoughtfully, and build collaboratively.