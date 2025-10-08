---
description: Analyze if the current implementation meets the specified requirements and generate a report outlining any gaps or issues.
---

# Analyze and Report on Implementation Gaps


## 1. Compile and Analyze Requirements

- Identify and analyze what the current requirements of the currently implemented feature/bug fixes are. 
- Analyze any additional requirements specified below (these take precedence if specified): 
  ADDITIONAL_REQUIREMENTS: $ARGUMENTS


## 2. Analyze Current Implementation
- Analyse the current ongoing implementation
    - Use `git status` and `git diff` to identify changes and understand the current state
    - Use `git log` to review commit history and understand the evolution of the implementation


## 3. Gap Analysis
- Identify any gaps between the current implementation and the requirements.
- Identify any missing functionality, discrepancies or unfulfilled success criteria.
- Identify any missing integration points between components, incomplete functionality
  or any other gaps.
- Zoom out and do a **holistic review** and **sanity check** of the entire implementation to ensure nothing is overlooked and that the implementation is coherent, consistent and doesn't miss any vital aspects or integrations.
- **Ultrathink** and come up with a plan for addressing the gaps - *if any*.


## 4. Generate Report

Your job is *ONLY* to analyze and then generate a report. Do *NOT* make any code changes or commits.

Generate a report (markdown) that outlines the missing or incomplete functionality, discrepancies or unfulfilled success
criteria, and any other gaps identified in the gap analysis. Include a plan for addressing these gaps.

Store the review/gap analysis in a files in a suitable location, e.g. *ai_docs/feature-name-gap-review-analysis.md*
