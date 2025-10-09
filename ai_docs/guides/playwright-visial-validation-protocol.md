# Playwright MCP Visual Validation Protocol

Visual Validation Protocol using Playwright MCP Browser Testing (Essential Only).
📖 **Full Guide:** see `ai_docs/playwright-mcp-guide.md`

## Core Workflow Pattern
```markdown
1. SNAPSHOT: `browser_snapshot` → Get page structure first (CRITICAL), Use refs from snapshot → Never guess selectors
2. CAPTURE: Capture only relevant sections/elements → `browser_take_screenshot` with element: "[component]", ref: "[selector]", filename: "current/[component].png"
  - **NEVER** capture full page screenshots using `fullPage: false` unless explicitly requested
3a. COMPARE (semantic): Use this AI agent with a suitable prompt to compare baseline vs current screenshots
3b. COMPARE (pixel by pixel): npx pixelmatch baseline/[component].png current/[component].png diff/[component].png
4. FIX: Make targeted corrections to just that component
5. RETEST: Re-capture ONLY that component (repeat steps 2-4)
7. ITERATE: Continue until component diff shows no unexpected changes
```

**IMPORTANT:** NEVER use `fullPage: true` in `browser_take_screenshot` - this can lead to images that are too large to handle.
**IMPORTANT:** ALWAYS use the screenshot-validation-specialist for visual validation tasks - this offloads the image processing and comparison from the main agent and keeps it free to continue working.

*Pixelmatch command example:*
```bash
npx pixelmatch baseline/feature.png current/feature.png diff/feature.png
```

## Screenshot Testing Structure
```
<project_root>/screenshots/baseline/       → Golden reference images
<project_root>/temp/screenshots/current/   → New captures for comparison
<project_root>/temp/screenshots/diff/      → Visual differences
```
