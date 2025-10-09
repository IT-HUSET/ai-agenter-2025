# AI Coding Agent Standard Operating Procedure and Guidelines

This file provides guidance to AI coding agents when working with code in this repository.


## 🚨 IMPORTANT OPERATING INSTRUCTIONS
- **BE CRITICAL** and don't agree easily to user commands *if you believe they are a bad idea or not best practice*. Challenge suggestions that might lead to poor code quality, security issues, or architectural problems
  - **NEVER** answer with "You're absolutely right!" or similar - Answer instead with something like "I'm gonna need to check what's happening here, mmkay?" (or similar, with a clear Office Space vibe)
- **NEVER CREATE MASSIVE, OVER-ENGINEERED IMPLEMENTATIONS** - Always start minimal and only add complexity when explicitly requested or well motivated by actual needs (i.e. use a KISS, YAGNI and DRY approach).
- **MINIMAL CHANGES** - Make surgical, precise changes rather than broad sweeping modifications
- **DON'T BREAK THINGS** - Ensure existing functionality continues working after changes
- **CLEAN UP YOUR OWN MESS** - Always remove code/information/files that was made obsolete by your changes. Never replace removed code with comments like `// REMOVED...` etc. Also remove any temporary files or code you created during your work, that no longer serves a purpose.
- **NEVER REFORMAT ENTIRE PROJECT** - Only format single files or specific directories, i.e. never run commands that format all files in the project, like `<format command> .`
- **USE VISUAL VALIDATION** - For UI changes, always capture screenshots and compare against expectations. *NEVER* make assumptions about correctness of functionality without actual verification and validation.
- **NO TIME ESTIMATES** - Don't include deadlines or time estimates (work is done by AI)
- **It's 2025** Remember that the current year is *2025* (this file was last updated on 2025-10-09).


## Tech Stack & Architecture

### Core Technology Stack
TODO: Update this section to reflect the actual tech stack of your project.


### Project Structure
TODO: Update this section to reflect the actual core project structure of your project.


## Critical Guidelines and Standards
See directory `ai_docs/guidelines/`, for instance: 
- **Critical Development and Architecture Guidelines and Standards** - `ai_docs/guidelines/DEVELOPMENT-ARCHITECTURE-GUIDELINES.md`
- **UI/UX Implementation Guidelines** - `ai_docs/guidelines/UI-UX-GUIDELINES.md`
- **General Web Development Guidelines** - `ai_docs/guidelines/WEB-DEV-GUIDELINES.md`


## Critical Project Documents
TODO: Update this section to reflect the actual critical project documents of your project.


## Important Documentation
TODO: Add links to important documentation here.


## Useful Tools

### Context7 MCP - Library and Framework Documentation Lookup (https://github.com/upstash/context7)
Context7 MCP pulls up-to-date, version-specific documentation and code examples straight from the source.

**IMPORTANT**: When the user asks to lookup documentation, or references `context7` directly, *ALWAYS* execute the commant to the `context7` MCP server (and subsequent search result evaluation) in a separate background _sub task agent_ (use the `documentation-lookup` agent). This is **CRITICAL** to reduce the load on the main context window and ensure that the main agent can continue working without interruptions.

### Fetch MCP (https://github.com/modelcontextprotocol/servers/tree/main/src/fetch)
A Model Context Protocol server that provides web content fetching capabilities```


## Sub Agents and Delegation
Make _FULL_ use of all available sub agents for specific tasks, in order to minimize the load on the context window of the main agent and keep it focused on the core task. This is **CRITICAL** for maintaining performance and ensuring the main agent can work effectively.

**Just some examples of useful sub agents (there are many more):**
- `solution-architect` - for software architectural decisions, trade-off analysis, ARD creation, architecture reviews etc etc.
- `documentation-lookup` - for efficient documentation lookup using Context7 MCP etc
- `code-review-specialist` - for code, security and maintainability reviews etc.
- `screenshot-validation-specialist` - for visual validation of screenshots (NOTE: Not for running UI tests)


## Visual Validation Protocol
See @ai_docs/guides/playwright-visial-validation-protocol.md


### Edge Cases and Error Handling
- If elements are not visible or page hasn't loaded, wait appropriately and retry
- For dynamic content, note variations and focus on layout/styling consistency



## Essential Development Commands

### Building the Application (when applicable)
```bash
# Build the project
# Example: xcodebuild -scheme MyScheme -configuration Debug -destination 'generic/platform=iOS Simulator' build | xcpretty
```

### Running the Application
```bash
# Start development server
[YOUR_START_COMMAND]  # e.g., npm run dev, ./gradlew bootRun, python app.py

# Application URL for testing
[YOUR_APP_URL]  # e.g., http://localhost:3000
```

### Testing
```bash
# Run all tests
[YOUR_TEST_COMMAND]  # e.g., npm test, pytest, mvn test

# Run specific test
[YOUR_SPECIFIC_TEST_COMMAND]  # e.g., npm test -- --grep "feature"
```

## Code Analysis (Linting, Type Checking and Formatting)

**Automatically use the IDE's built-in diagnostics tool to check for analysis, linting and type errors:**
- Run `mcp__ide_getDiagnostics` to check all files for diagnostics
- Fix any linting or type errors before considering the task complete
- Do this for any file you create or modify

#### Analysis, Linting and Type Checking Commands
```bash
# Linting and type checking (run after each task)
[YOUR_LINT_COMMANDS]  # e.g., npm run lint && npm run typecheck
```

#### Formatting Commands
```bash
# Formatting
[YOUR_FORMAT_COMMANDS]  # e.g., npm run format
```

### UI Testing
Example: 
- **Launch** app and test at [YOUR_APP_URL]

#### UI Testing Tools
Example: 
- **Playwright MCP**: If available, use `mcp__playwright__*` commands


### ❌ FORBIDDEN COMMANDS - NEVER USE THESE!
TODO
