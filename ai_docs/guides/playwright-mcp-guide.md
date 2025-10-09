# Playwright MCP Usage Guide for Claude Code

## Overview

Playwright MCP enables Claude Code to interact with browsers programmatically, perform UI testing, capture screenshots, and validate visual consistency. It uses structured accessibility snapshots rather than pixel-based input, making it LLM-friendly without requiring vision models.

## Core Capabilities

### Dynamic Tool Discovery
Claude Code automatically detects all available Playwright MCP tools at runtime (typically 21+ tools). Always verify available tools rather than assuming from static documentation.

### Available Browser Functions (at tieme of writing)
Core Navigation & Capture:
- **browser_navigate**: Navigate to URLs
- **browser_navigate_back**: Go back in browser history
- **browser_snapshot**: Capture accessibility tree (ALWAYS use before interactions)
- **browser_take_screenshot**: Capture visual screenshots (PNG/JPEG)

User Interactions:
- **browser_click**: Click elements via accessibility tree
- **browser_type**: Type text into elements
- **browser_fill_form**: Fill multiple form fields at once
- **browser_press_key**: Send keyboard keys (Enter, Escape, etc.)
- **browser_hover**: Hover over elements
- **browser_drag**: Drag and drop between elements
- **browser_select_option**: Select dropdown options
- **browser_file_upload**: Upload files to file inputs

Page Control & Monitoring:
- **browser_evaluate**: Execute JavaScript in page context
- **browser_wait_for**: Wait for elements or conditions
- **browser_tabs**: Manage browser tabs
- **browser_resize**: Set viewport dimensions
- **browser_close**: Close browser
- **browser_install**: Install browser if missing

Debugging & Dialogs:
- **browser_console_messages**: Retrieve console output
- **browser_network_requests**: Monitor network activity
- **browser_handle_dialog**: Handle alerts/confirms/prompts

## Screenshot Testing Workflow

### 1. Basic Screenshot Capture

```bash
# IMPORTANT: Always use browser_snapshot first to understand the page structure
# Then use browser_take_screenshot for visual capture

# Example workflow:
1. Navigate to page using browser_navigate
2. Wait for page load using browser_wait_for
3. Capture accessibility snapshot with browser_snapshot
4. Take screenshot with browser_take_screenshot
```

### 2. Visual Regression Testing

```typescript
// Directory structure for visual testing
/ai_docs/screenshots
  /baseline      # Golden/reference images
  /current       # Latest captures
  /diff          # Visual differences
  /archive       # Historical snapshots
```

### 3. Component-First Regression Fixing (RECOMMENDED)

```markdown
# Why component-first?
- Faster iterations (smaller images)
- Precise targeting (focus on exact problem)
- Clearer diffs (less noise)
- Memory efficient (avoid large screenshots)
- Parallel validation (test multiple components independently)

# Workflow:
1. DETECT: Full viewport screenshot → Identify all affected areas
   - browser_take_screenshot with fullPage: false, filename: "current/page.png"
   - npx pixelmatch baseline/page.png current/page.png diff/page-diff.png

2. ISOLATE: For each regression, capture just that component
   - browser_snapshot → Get component refs
   - browser_take_screenshot with element: "Header", ref: "header", filename: "current/header.png"

3. FIX & TEST: Make targeted fixes → Re-capture component only
   - Edit component styles/layout
   - browser_take_screenshot with element: "Header", ref: "header", filename: "current/header.png"
   - npx pixelmatch baseline/header.png current/header.png diff/header-diff.png

4. ITERATE: Repeat until component diff clean
   - Continue steps 2-3 for each affected component

5. VERIFY: Final full viewport check
   - browser_take_screenshot with fullPage: false, filename: "current/page-final.png"
   - Confirm all components work together
```

### 4. Full Page Comparison Workflow (Fallback)

```bash
# Use when component-level not feasible
# Step 1: Capture baseline
- Navigate to stable version
- Take screenshot as baseline/[feature].png

# Step 2: Capture after changes
- Navigate to updated version
- Take screenshot as current/[feature].png

# Step 3: Generate diff
- Use pixelmatch to compare images
- Output diff to diff/[feature]-diff.png

# Step 4: Review and approve
- Analyze diff image for unexpected changes
- Update baseline if changes are intentional
```

## UI Validation Protocol

### Pre-Validation Setup

```markdown
## Before ANY UI work:
1. Capture current state screenshot (baseline)
2. Document expected changes
3. Set up comparison script
4. Create validation checklist
```

### During Development - Component-First Approach

```markdown
## Iterative validation cycle (PRIORITIZED METHOD):

# Initial Detection
1. Make code changes
2. Capture viewport screenshot: browser_take_screenshot with fullPage: false
3. Generate diff: npx pixelmatch baseline/page.png current/page.png diff/page.png
4. Identify affected components from diff

# Component-Level Iteration (for each regression)
5. Get component structure: browser_snapshot
6. Capture component: browser_take_screenshot with element and ref
7. Fix component code
8. Re-capture ONLY that component
9. Generate component diff: npx pixelmatch
10. Repeat 6-9 until component passes

# Final Validation
11. Full viewport check when all components fixed
12. Verify components work together
```

### Post-Development Validation

```markdown
## Final validation steps:
1. Responsive testing at key breakpoints:
   - browser_resize with width: 375, height: 667 (mobile)
   - browser_resize with width: 768, height: 1024 (tablet)
   - browser_resize with width: 1920, height: 1080 (desktop)
2. Test interactive states on critical components
3. Verify animations disabled for consistency
4. Cross-browser validation if needed
5. Archive approved screenshots as new baseline
```

## Best Practices

### 1. ALWAYS Use Accessibility Snapshots First

```markdown
# CORRECT approach:
1. Use browser_snapshot to understand page structure
2. Find elements using accessibility tree references
3. Interact with elements using ref from snapshot
4. Take screenshots for visual validation

# INCORRECT approach:
- Taking screenshots without understanding structure
- Guessing element selectors
- Using pixel coordinates
```

### 2. Authentication Handling

```markdown
# For authenticated pages:
1. Have Claude navigate to login page
2. User manually logs in (credentials persist in session)
3. Claude continues with authenticated actions
4. Cookies persist for entire session
```

### 3. Dynamic Content Handling

```markdown
# Disable animations for consistent screenshots:
Use browser_evaluate with function parameter:
() => {
  document.documentElement.style.setProperty('--animation-duration', '0s');
  document.documentElement.style.setProperty('transition-duration', '0s');
}
```

### 4. Responsive Testing

```markdown
# Test across multiple breakpoints using browser_resize:
1. Mobile: browser_resize with width: 375, height: 667 (iPhone SE)
2. Tablet: browser_resize with width: 768, height: 1024 (iPad)
3. Desktop: browser_resize with width: 1920, height: 1080 (Full HD)

# Workflow for each breakpoint:
- browser_resize with width: [width], height: [height]
- browser_wait_for with time: 1 (let layout adjust)
- browser_take_screenshot with filename: "[feature]-[breakpoint].png"
- Test interactions specific to that viewport
```

### 5. Error Recovery

```markdown
# When browser actions fail:
1. Check if browser is installed (use browser_install if needed)
2. Verify element exists using browser_snapshot
3. Wait for element if timing issue (browser_wait_for)
4. Try alternative selectors from accessibility tree
5. Capture screenshot of error state for debugging
```

## Integration with Existing Workflow

### Adding to Test Suite

```typescript
// ai_docs/validation/screenshot-tests.ts
interface ScreenshotTest {
  name: string;
  url: string;
  waitFor?: string;  // Element to wait for
  actions?: Array<{type: 'click' | 'type' | 'wait', target?: string, value?: string}>;
  viewport?: {width: number, height: number};
}

const tests: ScreenshotTest[] = [
  {
    name: 'homepage-hero',
    url: '/',
    waitFor: '[data-testid="hero-section"]',
    viewport: {width: 1920, height: 1080}
  },
  // Add more test cases
];
```

### Validation Checklist Template

```markdown
## UI Validation Checklist
- [ ] Baseline screenshot captured
- [ ] Current screenshot captured
- [ ] Visual diff generated
- [ ] Layout consistency verified
- [ ] Color accuracy confirmed
- [ ] Typography rendering checked
- [ ] Interactive states tested
- [ ] Responsive breakpoints validated
- [ ] Cross-browser testing (if required)
- [ ] Accessibility tree validated
- [ ] Console errors checked
- [ ] Network requests verified
```

## Common Patterns

### Pattern 1: Full Page Testing

```markdown
# Navigate and capture full page
1. browser_navigate with url: "http://localhost:8000"
2. browser_wait_for with time: 2  (wait for animations)
3. browser_take_screenshot with fullPage: true, filename: "full-page.png"
```

### Pattern 2: Component Testing

```markdown
# Test specific component
1. browser_snapshot (get accessibility tree)
2. browser_take_screenshot with:
   - element: "Hero section"
   - ref: "[data-testid='hero-section']"
   - filename: "hero-component.png"
```

### Pattern 3: Interaction Testing

```markdown
# Test interactive states
1. browser_hover with element: "Button", ref: "[role='button']"
2. browser_take_screenshot with filename: "button-hover.png"
3. browser_click with element: "Button", ref: "[role='button']"
4. browser_wait_for with text: "Success"
5. browser_take_screenshot with filename: "after-click.png"
```

### Pattern 4: Form Testing

```markdown
# Test form interactions
1. browser_fill_form with fields:
   - name: "Email", ref: "#email", type: "textbox", value: "test@example.com"
   - name: "Accept terms", ref: "#terms", type: "checkbox", value: "true"
2. browser_take_screenshot with filename: "form-filled.png"
```

## Troubleshooting

### Common Issues and Solutions

```markdown
1. **Browser not installed**
   - Run: browser_install()

2. **Element not found**
   - Use browser_snapshot() first
   - Check if element is in iframe
   - Wait for dynamic content

3. **Screenshot differences**
   - Disable animations
   - Use consistent viewport
   - Clear cache/cookies if needed

4. **Authentication issues**
   - Let user manually login
   - Check cookie persistence

5. **Timeout errors**
   - Increase wait times
   - Check network throttling
   - Verify page load completeness
```

## Security Considerations

```markdown
⚠️ IMPORTANT SECURITY NOTES:
- Never store credentials in code
- Browser runs with user permissions
- Be cautious with browser_evaluate
- Review all generated test code
- Avoid automated purchases/transactions
- Use test environments when possible
```

## Performance Tips

```markdown
1. Batch related actions to reduce round trips
2. Use browser_snapshot sparingly (large payload)
3. Compress screenshots when archiving
4. Clean up old diff images regularly
5. Use targeted selectors from accessibility tree
6. Parallelize independent test scenarios
```

## Example: Complete UI Validation Session (Component-First)

```markdown
# 1. Setup
- browser_navigate with url: "http://localhost:8000"
- browser_resize with width: 1920, height: 1080 (desktop viewport)

# 2. Capture baseline
- browser_wait_for with text: "Welcome"
- browser_take_screenshot with fullPage: false, filename: "ai_docs/screenshots/baseline/home.png"

# 3. Make changes (done outside browser)
[Make code changes]

# 4. Capture new state (viewport for detection)
- browser_navigate with url: "http://localhost:8000"
- browser_wait_for with text: "Welcome"
- browser_take_screenshot with fullPage: false, filename: "ai_docs/temp/screenshots/current/home.png"

# 5. Generate diff to identify problems
- Bash: npx pixelmatch ai_docs/screenshots/baseline/home.png ai_docs/temp/screenshots/current/home.png ai_docs/temp/screenshots/diff/home-diff.png
[Review diff, identify nav bar and hero section have regressions]

# 6. Component-level fixing (nav bar)
- browser_snapshot (get structure)
- browser_take_screenshot with:
  - element: "Navigation bar"
  - ref: "nav[role='navigation']"
  - filename: "ai_docs/temp/screenshots/current/nav.png"
- [Fix nav styles]
- browser_take_screenshot with element: "Navigation bar", ref: "nav[role='navigation']", filename: "ai_docs/temp/screenshots/current/nav.png"
- Bash: npx pixelmatch ai_docs/screenshots/baseline/nav.png ai_docs/temp/screenshots/current/nav.png ai_docs/temp/screenshots/diff/nav-diff.png
[Repeat until nav passes]

# 7. Component-level fixing (hero section)
- browser_take_screenshot with:
  - element: "Hero section"
  - ref: "[data-testid='hero']"
  - filename: "ai_docs/temp/screenshots/current/hero.png"
- [Fix hero styles]
- browser_take_screenshot with element: "Hero section", ref: "[data-testid='hero']", filename: "ai_docs/temp/screenshots/current/hero.png"
- Bash: npx pixelmatch ai_docs/screenshots/baseline/hero.png ai_docs/temp/screenshots/current/hero.png ai_docs/temp/screenshots/diff/hero-diff.png
[Repeat until hero passes]

# 8. Final validation
- browser_take_screenshot with fullPage: false, filename: "ai_docs/temp/screenshots/current/home-final.png"
- Bash: npx pixelmatch ai_docs/screenshots/baseline/home.png ai_docs/temp/screenshots/current/home-final.png ai_docs/temp/screenshots/diff/home-final-diff.png
[Verify all components work together]

# 9. Responsive validation (optional but recommended)
- browser_resize with width: 375, height: 667
- browser_wait_for with time: 1
- browser_take_screenshot with fullPage: false, filename: "ai_docs/temp/screenshots/current/home-mobile.png"
- browser_resize with width: 768, height: 1024
- browser_wait_for with time: 1
- browser_take_screenshot with fullPage: false, filename: "ai_docs/temp/screenshots/current/home-tablet.png"

# 10. Clean up
- browser_close
```

## Integration with AI UI Validation

When the CLAUDE.md mentions "MANDATORY UI VALIDATION", use this protocol:

```markdown
1. **Before ANY UI changes:**
   - Capture baseline with browser_take_screenshot
   - Document in ai_docs/temp/validation-[timestamp]/

2. **During development:**
   - Regular screenshot captures after each change
   - Visual diff generation
   - Iterative refinement based on diffs

3. **After completion:**
   - Full validation suite run
   - Cross-browser testing if specified
   - Archive approved screenshots
   - Update baseline references
```

---

This guide should be referenced whenever UI work is performed. The combination of accessibility snapshots and visual screenshots provides comprehensive validation coverage.