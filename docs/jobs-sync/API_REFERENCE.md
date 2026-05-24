# V3 API Reference

> Reference for valid API endpoints. Note that V3 uses **Direct D1 Access** for workers, so these endpoints are primarily for **Frontend Data Access** and **Manual Triggers**.

## Base URL
`https://caliber.rcormier.dev/api/v3`

---

## Data Endpoints (Frontend)

### `GET /jobs`
Main job search endpoint.

**Params:**
*   `search`: Full text search
*   `category`: Category ID
*   `source`: Filter by source name
*   `salaryRange`: Filter by salary
*   `limit`: Pagination limit (default 20)
*   `offset`: Pagination offset

### `GET /stats`
Returns system health statistics:
*   Total jobs
*   Jobs per source
*   Worker status (last run time, success/fail)
*   Discovered company counts

### `GET /logs`
Returns recent entries from the `sync_history` table for the "Logs" dashboard tab.

---

## Sync Control (Manual)

> **Note**: These endpoints run an on-demand sync cycle. They are separate from the automated Cloudflare Workers.

### `POST /sync/ats`
Triggers a single company sync cycle (rotates Greenhouse -> Lever -> Workable).
*   **Returns**: JSON with `jobsAdded`, `jobsUpdated`, `company`.

### `POST /sync/aggregator`
Triggers a single aggregator fetch (rotates RemoteOK -> Himalayas -> Jobicy).
*   **Returns**: JSON with `jobsAdded`, `source`, `duration`.

### `POST /sync/discovery`
Triggers a check of pending companies in `potential_companies`.
