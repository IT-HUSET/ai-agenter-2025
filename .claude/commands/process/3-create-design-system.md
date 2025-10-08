---
description: Creates a pragmatic design system and simple HTML wireframes from PRD requirements, concept design and existing/desired design systems, focusing on essential visual elements and major layout patterns.
argument-hint: [Spec process root directory, defaults to ai_docs/specs/new-feature/]
---

# Design System & Wireframe Creation

Transform PRD requirements along with concept design (optional) and a desired or existing foundation design system (optional) into a focused design system with essential visual language and simple HTML wireframes that capture the key layout and interaction patterns.

**IMPORTANT: Platform-Agnostic Approach**
HTML/CSS is used as the universal design language for ALL projects (web, mobile, desktop, etc.). These wireframes and design tokens serve as the canonical design reference that will be adapted to platform-specific implementations later. HTML provides the most accessible and reviewable format for stakeholders regardless of the final platform.

## Input

### Variables
_Standard directory for all artifacts created by this command and other commands, as part of the spec process:_
SPEC_DIR: $ARGUMENTS (or defaults to `ai_docs/specs/new-feature/`)

### Design Inputs (Optional - `3-design-input` sub directory)
Optionally, the user may provide concept design (such as design inspiration, mockups etc.) and/or an existing or desired foundation design system can help guide the visual direction.

### Input Validation
Before running, ensure the _`SPEC_DIR`_ exists and that is contains a PRD (see structure below). If not, **STOP** and ask the user to create necessary documents first.

Expected structure:
```bash
SPEC_DIR/
├── 1-idea-refinement.md                # Idea refinement document (optional) 
├── 2-prd.md                            # Product Requirements Document
└── 3-design-input/                     # OPTIONAL directory for design inputs
    ├── concept-design/                 # Concept design, mockups and design inspiration images or links (optional)
    └── foundation-design-system/       # Existing design system files or references (optional)
```

## Output
Store all design system artifacts in the following structure within `SPEC_DIR`:

```bash
SPEC_DIR/
├── 3-wireframes/             # HTML wireframes for each page/screen
└── 3-design-system/          # Design tokens, Component styles, documentation
```


## Streamlined Design Process

This pragmatic approach delivers what matters most:

1. **Quick Analysis**: Review design inputs and PRD to extract core visual direction
2. **Essential Tokens**: Define only the critical colors, typography, and spacing
3. **Core Components**: Focus on the most important reusable patterns
4. **Simple Wireframes**: Create basic HTML layouts showing major elements
5. **Practical Documentation**: Just enough detail for implementation

---

## Phase 1: Design Analysis

### 1.1 Extract Design Direction

Review provided materials to identify:
- **Primary colors** from concept design or foundation design system
- **Background colors and images** from concept design or foundation design system
- **Design of major UI elements** (buttons, cards, forms, ...) from concept design or foundation design system, and different states (hover, active, disabled), variations (primary, secondary, ...) etc.
- **Dark and Light themes** themes from concept design or foundation design system, if applicable
- **Typography style** (modern, classic, playful, etc.)
- **Overall mood** (professional, friendly, bold, minimal)
- **Key UI patterns** visible in references

### 1.2 Map PRD Requirements

**CRITICAL:** Create a comprehensive checklist from the PRD:
- **All pages/screens** - Create a complete list of all pages/screens (this list determines wireframe scope)
- Key user actions
- Essential components needed
- Must-have features
- Make note of any _mock data_ references or other content or domain model examples mentioned

### 1.3 Design Research (_Optional_ - If unclear direction, i.e. **ONLY** if no concept design or design system provided)

If unclear direction, use Task tool to launch research:
- **@research-specialist**: Find 3-5 similar products for inspiration
- **@ui-ux-designer**: Analyze what works in competitor designs
- **@research-specialist**: Find 3-5 potential design systems to base upon (use as foundation and inspiration)
- **@ui-ux-designer**: Analyze design systems for simplicity, practicality and suitability to the project requirements

---

## Phase 2: Essential Design Tokens

### 2.1 Simplified Color System

Define just the essentials.

_Example:_
```css
/* Primary Colors - Pick one main brand color */
--color-primary: #3B82F6;      /* Main brand color */
--color-primary-dark: #2563EB; /* Darker variant */
--color-primary-light: #60A5FA; /* Lighter variant */

/* Neutrals - Grayscale for text and borders */
--color-white: #FFFFFF;
--color-gray-50: #F9FAFB;
--color-gray-200: #E5E7EB;
--color-gray-400: #9CA3AF;
--color-gray-600: #4B5563;
--color-gray-900: #111827;
--color-black: #000000;

/* Semantic - Only if needed */
--color-success: #10B981;
--color-error: #EF4444;
--color-warning: #F59E0B;
```

### 2.2 Simple Typography

Use system fonts and practical sizes.

_Example:_
```css
/* Font Stack */
--font-sans: system-ui, -apple-system, sans-serif;

/* Sizes - Just what you need */
--text-xs: 0.75rem;   /* 12px - small labels */
--text-sm: 0.875rem;  /* 14px - body small */
--text-base: 1rem;    /* 16px - body default */
--text-lg: 1.125rem;  /* 18px - body large */
--text-xl: 1.5rem;    /* 24px - h3 */
--text-2xl: 2rem;     /* 32px - h2 */
--text-3xl: 3rem;     /* 48px - h1 */

/* Weights */
--font-normal: 400;
--font-medium: 500;
--font-bold: 700;
```

### 2.3 Basic Spacing

_Example:_: Simple 8px grid:

```css
/* Spacing - 8px base */
--space-1: 0.5rem;   /* 8px */
--space-2: 1rem;     /* 16px */
--space-3: 1.5rem;   /* 24px */
--space-4: 2rem;     /* 32px */
--space-6: 3rem;     /* 48px */
--space-8: 4rem;     /* 64px */

/* Container */
--container: 1200px;

/* Breakpoints */
--mobile: 640px;
--tablet: 768px;
--desktop: 1024px;
```

### 2.4 Minimal Effects

_Example:_
```css
/* Shadows - Just 3 levels */
--shadow-sm: 0 1px 3px rgba(0,0,0,0.12);
--shadow-md: 0 4px 6px rgba(0,0,0,0.1);
--shadow-lg: 0 10px 20px rgba(0,0,0,0.15);

/* Border Radius */
--radius: 0.5rem;
--radius-lg: 1rem;
--radius-full: 9999px;

/* Transition */
--transition: all 150ms ease;
```

---

## Phase 3: Core Components

### 3.1 Essential Components Only

Focus on what's actually needed from the PRD:

#### _Examples:

**Buttons:**
```css
.btn {
  padding: 0.5rem 1rem;
  border-radius: var(--radius);
  font-weight: var(--font-medium);
  transition: var(--transition);
}

.btn-primary {
  background: var(--color-primary);
  color: white;
}

.btn-secondary {
  background: transparent;
  border: 2px solid var(--color-gray-200);
  color: var(--color-gray-900);
}
```

**Forms:**
```css
.input {
  width: 100%;
  padding: 0.5rem;
  border: 2px solid var(--color-gray-200);
  border-radius: var(--radius);
}

.input:focus {
  outline: none;
  border-color: var(--color-primary);
}
```

**Cards:**
```css
.card {
  background: white;
  border-radius: var(--radius);
  padding: var(--space-3);
  box-shadow: var(--shadow-sm);
}
```

### 3.2 Common Patterns

Identify patterns from PRD:
- **Navigation**: Header with logo and menu
- **Hero Section**: Title, description, CTA
- **Content Grid**: Cards or list items
- **Forms**: Input fields with labels
- **Footer**: Links and copyright


---

## Phase 4: Simple HTML Wireframes

**MANDATORY:** Create a wireframe for every page/screen identified in Phase 1.2.

**Platform Note:** Even for native mobile or desktop apps, create HTML wireframes. These serve as the universal design specification that will be translated to platform-specific components (SwiftUI, Flutter, Compose, etc.) during implementation.

### 4.1 Wireframe Approach

Create basic, grayscale HTML layouts that show:
- **Major sections** and their placement
- **Major containers** (panels, cards, etc.) and their layout
- **Key content blocks** with realistic proportions
- **Primary navigation** structure
- **Important CTAs** and their hierarchy
- **Basic responsive behavior** (mobile/desktop)

**Keep it simple:**
- Use _boxes_ and _placeholders_
- Use _grayscales_ only, no colors
- _Focus on layout, not details_
- Show information hierarchy
- Include only essential interactions

### 4.2 Basic Wireframe Template
```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>[Page Name] - Wireframe</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: system-ui, sans-serif;
            line-height: 1.5;
            color: #333;
            background: #f5f5f5;
        }

        /* Simple wireframe styles */
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }

        .box {
            background: white;
            border: 2px solid #ddd;
            padding: 20px;
            margin-bottom: 20px;
        }

        .placeholder {
            background: #e0e0e0;
            border: 2px dashed #999;
            padding: 40px;
            text-align: center;
            color: #666;
        }

        .btn {
            display: inline-block;
            padding: 10px 20px;
            background: #666;
            color: white;
            text-decoration: none;
        }

        .btn-outline {
            background: white;
            color: #666;
            border: 2px solid #666;
        }

        .grid {
            display: grid;
            gap: 20px;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
        }

        .flex {
            display: flex;
            gap: 20px;
            align-items: center;
        }

        @media (max-width: 768px) {
            .flex {
                flex-direction: column;
            }
        }
    </style>
</head>
<body>
    <!-- Page content here -->
</body>
</html>
```

### 4.3 Major/Typical Component Showcase

Below are _examples_ of how components can be structured and showcased in wireframes:

**Navigation:**
```html
<nav class="box">
    <div class="flex" style="justify-content: space-between;">
        <div class="placeholder" style="width: 120px; height: 40px;">LOGO</div>
        <div class="flex">
            <a href="#" class="btn btn-outline">Menu 1</a>
            <a href="#" class="btn btn-outline">Menu 2</a>
            <a href="#" class="btn">Sign Up</a>
        </div>
    </div>
</nav>
```

**Hero Section:**
```html
<section class="box">
    <div class="grid" style="grid-template-columns: 1fr 1fr;">
        <div>
            <h1 style="font-size: 2.5rem; margin-bottom: 1rem;">Headline Here</h1>
            <p style="margin-bottom: 2rem; color: #666;">Description text</p>
            <a href="#" class="btn">Get Started</a>
        </div>
        <div class="placeholder" style="height: 300px;">IMAGE</div>
    </div>
</section>
```

**Content Grid:**
```html
<div class="grid">
    <div class="box">
        <div class="placeholder" style="height: 150px; margin-bottom: 10px;">IMG</div>
        <h3>Item Title</h3>
        <p>Brief description</p>
    </div>
    <!-- Repeat for more items -->
</div>
```

### 4.4 Efficient Wireframe Creation

**CRITICAL REQUIREMENT:** You must create a wireframe HTML file for EVERY page/screen identified in the PRD. No page should be omitted.

**Wireframe Creation Process:**
1. **Reference your Phase 1.2 list** - Use the pages/screens list from PRD mapping as your master checklist
2. **Create wireframes in parallel** - Launch multiple Task agents simultaneously, each handling a _single_ page only
3. **Name files clearly** - Use descriptive names that match the PRD (e.g., `home.html`, `dashboard.html`, `user-profile.html`)
4. **Track completion** - Verify _all_ PRD pages have corresponding wireframes - 100% completeness

**Before Moving to Phase 5:**
- Verify EVERY page from the PRD has a corresponding wireframe
- No page should be skipped because it seems "similar" to another
- Each unique user flow needs representation

#### 4.5 Visual Validation
- Follow any **Visual Validation Protocol** specified in _project guidelines_ (see CLAUDE.md / AGENTS.md) to ensure wireframes meet quality standards, and are free of layout issues.
- Use available **sub-agents** such as *@agent-qa-test-engineer* or more specialized agents.


---

## Phase 5: Documentation

### 5.1 Simple Style Guide

```markdown
# [Product Name] Design System

## Colors
- Primary: #3B82F6
- Grays: #111827 to #F9FAFB
- Semantic: Success (#10B981), Error (#EF4444)

## Typography
- Font: System UI
- Sizes: 12px to 48px
- Weights: 400, 500, 700

## Spacing
- Base unit: 8px
- Scale: 8, 16, 24, 32, 48, 64px

## Components
- Buttons: Primary, Secondary
- Forms: Input, Select, Textarea
- Cards: Basic container with shadow
- Navigation: Header with logo and menu

## Breakpoints
- Mobile: < 640px
- Tablet: 640px - 1024px
- Desktop: > 1024px
```

### 5.2 Interactive Showcase

Create `showcase.html` - a single-page reference that demonstrates:
- All color swatches with hex values
- Typography scale with font specifications
- Spacing system visualization
- Every component variant with live examples
- Interactive elements (buttons, forms, modals)
- Code snippets for implementation
- Light/dark theme toggle if applicable

This becomes the living style guide developers actually use.

### 5.3 File Structure

```bash
SPEC_DIR/
├── 3-wireframes/           # HTML wireframes for each page/screen
│   ├── index.html
│   └── [page].html
└── 3-design-system/
    ├── tokens.css          # Design tokens
    ├── components.css      # Component styles
    ├── style-guide.md      # Documentation
    └── showcase.html       # Interactive component library demo
```

---

## Execution Guide

### Process Steps:
1. **Analysis**: Review PRD and design inputs, creating a comprehensive list of ALL pages/screens
2. **Design Tokens**: Define colors, type, spacing
3. **Components**: Create essential patterns
4. **Wireframes**: Build HTML layouts for EVERY page identified in the PRD (use parallel Task agents for speed)
5. **Documentation**: Write simple style guide and verify wireframe completeness
6. **Review**: Quality check ensuring 100% PRD page coverage

### Key Principles:
- **Start simple**: Basic boxes and typography first
- **Focus on layout**: Structure matters more than polish
- **Be pragmatic**: Only create what the PRD requires
- **Stay grayscale**: Wireframes don't need colors
- **Think mobile-first**: Design for small screens, scale up

### Essential Deliverables:
1. **Design tokens** (tokens.css)
2. **HTML wireframes** for all PRD pages
3. **Basic components** (components.css)
4. **Simple style guide** (style-guide.md)
5. **Interactive showcase** (showcase.html) - Live component library with all design tokens, typography, colors, spacing, and component examples in one browsable reference

### Quality Checklist:
- [ ] **100% PRD Coverage**: Every single page/screen from PRD has a corresponding wireframe file
- [ ] **No Missing Pages**: Cross-checked against Phase 1.2 list - zero omissions
- [ ] Design tokens are consistent
- [ ] Components are reusable
- [ ] Responsive behavior works
- [ ] Documentation includes wireframe inventory matching PRD

---

## Phase 6: Peer Review

### 6.1 Execute Comprehensive Design System Review, using External Agents

Using the **External Agent Application Delegation Protocol** (see CLAUDE.md), launch review agents to validate the design system. Use all CLI agents listed in the protocol. _In addition_, also launch review using the @agent-solution-architect agent.
Pass the prompt below to the external agents (replacing the placeholders in _Inputs_ with actual paths).

<agent_review_prompt>
# Design System Review
Review the newly created design system and wireframes for completeness, simplicity, and alignment with PRD requirements. Identify any over-designed elements, inconsistencies, or gaps in coverage.

## Inputs
- PRD: [Insert PRD path]
- Design System: [Insert path to generated design system]
- Wireframes: [Insert path to wireframes]

## Review Focus Areas:
1. PRD Coverage
   - All required pages have wireframes
   - No missing UI elements
   - User flows properly represented

2. Design Quality Issues
   - Over-designed components (too complex)
   - Unnecessary design patterns
   - Inconsistent styles or tokens
   - Conflicting component behaviors

3. Gap Analysis
   - Missing page layouts
   - Unaddressed UI states (error, loading, empty)
   - Forgotten responsive breakpoints
   - Missing accessibility considerations

4. Simplicity Check
   - Over-engineered CSS
   - Unnecessary complexity
   - Non-essential components
   - Premature visual polish

5. Implementation Readiness
   - Components map to development needs
   - Wireframes match PRD functionality
   - Design tokens are practical

## Review Output:
- Missing wireframes or components
- Over-designed elements to simplify
- Inconsistencies to resolve
- Unnecessary complexity to remove
- Gaps in UI coverage
</agent_review_prompt>

### 6.2 Evaluate Review Findings and Adjust Design System
**Action:** Revise design system based on review findings from the external agents before finalization.

---

## Final Quality Checklist

After peer review, verify:

- [ ] **MANDATORY:** Phase 1.2 checklist 100% complete (all pages have wireframes)
- [ ] No over-designed or unnecessarily complex components
- [ ] Design tokens are consistent and minimal
- [ ] Components are reusable and pragmatic
- [ ] No conflicting patterns or styles
- [ ] Responsive behavior works
- [ ] Documentation includes complete page/wireframe mapping
- [ ] Focus remains on structure, not polish

---

## Agent Support (Optional)

Use Task tool for efficient execution:
- **@agent-ui-ux-designer**: For wireframe creation
- **@agent-research-specialist**: Find similar products (if unclear direction)

---

**Remember**: The goal is a pragmatic, implementable design system - not perfection. Focus on capturing the essential structure and patterns that developers need to build the product. Keep it simple, functional, and focused on wireframes rather than polished designs.


---

**Ultrathink** and deliver comprehensive, high-quality wireframes and design system that meets all criteria.
