# AI Features Documentation

> Overview of the AI-powered capabilities across the Caliber ecosystem.

## Table of Contents

1. [Overview](#overview)
2. [Unicorn / Hidden Gems](#unicorn--hidden-gems)
3. [Job Insights](#job-insights)
4. [Job Match Score](#job-match-score)
5. [AI Search](#ai-search)
6. [RACI Generator](#raci-generator)

---

## Overview

Caliber applications leverage Cloudflare Workers AI with the `@cf/meta/llama-3.3-70b-instruct-fp8-fast` model to provide intelligent features. These features range from smart job discovery to improved productivity tools validation.

| Feature | App | Model | Purpose |
|---------|-----|-------|---------|
| **Unicorn** | Jobs | Llama 3.3 | Resume-based "hidden gem" discovery |
| **Insights** | Jobs | Llama 3.3 | Job post analysis (WLB, Salary, Culture) |
| **Match Score** | Jobs | Llama 3.3 | Scoring candidate fit for specific jobs |
| **AI Search** | Jobs | Llama 3.3 | Semantic query expansion |
| **RACI** | Tools | Llama 3.3 | Role/Task generation from description |

---

## Unicorn / Hidden Gems

**Location**: `apps/jobs/src/components/ai/UnicornJobs.tsx` (Frontend), `/api/ai/unicorn` (API)

The **Unicorn** feature (branded as "Hidden Gems") discovers jobs that a user is highly qualified for but might not explicitly search for. It breaks the "keyword bubble" by reasoning about transferable skills.

### Workflow

1.  **User Profile**: Takes the user's resume and skill tags.
2.  **Query Generation**: AI analyzes the profile to identify 3 distinct career paths or industries. It generates specific search queries (e.g., "Healthcare Operations" for a Project Manager).
3.  **Database Search**: The system executes these queries against the jobs database.
4.  **Match Scoring**: The AI then reviews the top results, comparing the candidate's hard skills against the job requirements to assign a `matchScore` (0-100%).
5.  **Caching**: Results are cached in `localStorage` for 24 hours.

### Key Components
*   **Prompt**: "You are a career advisor finding unique, non-obvious opportunities..."
*   **Scoring Logic**: Hard skills analysis with strict realistic scoring (0-60 poor, 60-75 decent, 75-90 strong, 90+ perfect).

---

## Job Insights

**Location**: `apps/jobs/src/components/ai/JobInsights.tsx` (Frontend), `/api/ai/insights` (API)

**Job Insights** provides a deep-dive analysis of a specific job posting, extracting structured data that might be buried in the text.

### Extracted Data Points
*   **Estimated Salary**: Min/Max ranges inferred from context if not explicit.
*   **Seniority Level**: Junior, Mid, Senior, Lead, Executive.
*   **Work-Life Balance**: Excellent, Good, Moderate, Demanding.
*   **Remote Flexibility**: Fully Remote, Hybrid, On-site.
*   **Culture Signals**: Positive/Neutral/Warning flags about company culture.
*   **Red Flags**: Warning signs like "fast-paced", "wear many hats" (context-dependent).
*   **Key Requirements**: concise list of top 3-5 absolute must-haves.

### User Interface
The UI (`JobInsightsPanel`) displays these insights as a collapsible accordion on the job details page, using color-coded badges for sentiment (Green for positive, Red/Amber for warnings).

---

## Job Match Score

**Location**: `apps/jobs/src/components/ai/JobMatchScore.tsx` (Frontend), `/api/ai/match` (API)

Unlike Unicorn which finds *new* jobs, **Job Match Score** evaluates how well a user fits a *specific* job they are currently viewing.

### Functionality
*   **Input**: User Resume/Skills + Job Title/Description.
*   **Output**: 0-100% Score.
*   **Analysis**:
    *   **Matching Skills**: Skills the user has that the job requires.
    *   **Missing Skills**: Critical gaps the user should address or be aware of.
    *   **Summary**: A 1-sentence explanation of the fit.

### Visualization
*   **Badge**: Compact view on job cards (Green > 75%, Amber > 50%, Red < 50%).
*   **Full Panel**: Detailed breakdown on job pages.

---

## AI Search

**Location**: `apps/jobs/src/components/SearchBar.tsx` (UI)

Integrated directly into the main search bar, **AI Search** enhances standard keyword matching with natural language understanding.

### Features
*   **Visual Cue**: `isAIProcessing` prop triggers a "Sparkles" animation to indicate intelligence.
*   **Semantic Expansion**: (Implementation dependant) Expands queries like "React dev at startups" into structured filters (Title: React Developer, Company Type: Startup).

---

## RACI Generator

**Location**: `apps/tools/src/components/RaciGeneratorPage.tsx` (Frontend), `apps/tools/src/lib/ai.ts` (Client Service)

A productivity tool that generates a full RACI (Responsible, Accountable, Consulted, Informed) matrix from a simple project description.

### Architecture
*   **Client-Side Rate Limiting**: The `aiService` class enforces a strict 10 requests/minute limit per session to prevent abuse.
*   **Robust Fallbacks**: If the AI API is unavailable, times out, or rate limits are hit, the system silently falls back to pre-defined templates (`AI_FALLBACKS`) based on keywords (e.g., "mobile app", "crm migration").

### Capabilities
1.  **Project Classification**: Determines the type of project (e.g., Software Dev, Marketing).
2.  **Role Extraction**: Identifies necessary roles (e.g., "Product Manager", "DevOps").
3.  **Task Generation**: Suggests phase-specific tasks.
4.  **RACI Logic**: Assigns R/A/C/I values based on best practices (e.g., One 'A' per task).
