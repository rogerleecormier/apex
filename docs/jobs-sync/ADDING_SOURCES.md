# Adding New Job Sources

> Guide for adding new ATS platforms or job aggregators to the Caliber ecosystem.

## Overview

The system uses a **Direct D1 Access** pattern for workers (`src/lib/worker-sync-logic.ts`) and a separate `sync-queue` system for manual API triggers (`src/lib/sync-queue.ts`). When adding a source, you typically need to update the worker logic first, as that powers the automated cron jobs.

---

## Adding a New ATS Source (e.g., Ashby, Greenhouse)

### 1. Primary Worker Logic (Automated Sync)

Edit `apps/jobs/src/lib/worker-sync-logic.ts`:

1.  **Add Source Type**:
    ```typescript
    const ATS_SOURCES = ['greenhouse', 'lever', 'workable', 'ashby'] as const
    type AtsSource = typeof ATS_SOURCES[number]
    ```

2.  **Add Company List**:
    Import your company list JSON (create one in `src/lib/job-sources/` first).
    ```typescript
    import ashbyCompanies from './job-sources/ashby-companies.json'
    
    function getAshbyCompanies(): string[] {
       // ... extraction logic
    }
    ```

3.  **Update `getCompaniesForSource`**:
    ```typescript
    function getCompaniesForSource(source: AtsSource): string[] {
      switch (source) {
        // ...
        case 'ashby': return getAshbyCompanies()
      }
    }
    ```

4.  **Update `syncAtsCompany` Logic**:
    *   **API URL**: Add case for URL construction.
    *   **Parsing**: Add case for parsing the JSON/HTML response into the `jobs` list.
    *   **Source URL**: Define how to construct the unique URL for deduplication.

### 2. Manual Trigger Support (Optional but Recommended)

Edit `apps/jobs/src/lib/sync-queue.ts` to enable `POST /api/v3/sync/ats` support:

1.  **Add Throttled Fetcher**:
    ```typescript
    export const sourceFetchers = {
      // ...
      ashby: createSourceFetcher('ashby', 1000),
    }
    ```

2.  **Update Types**:
    Add your source string to the `SyncWorkItem` source union type.

---

## Adding a New Aggregator (e.g., We Work Remotely)

### 1. Primary Worker Logic

Edit `apps/jobs/src/lib/worker-sync-logic.ts`:

1.  **Add Source Type**:
    ```typescript
    const AGGREGATOR_SOURCES = ['remoteok', 'himalayas', 'jobicy', 'weworkremotely'] as const
    ```

2.  **Define Batch Limits**:
    ```typescript
    const BATCH_LIMITS = {
      // ...
      weworkremotely: 50
    }
    ```

3.  **Update `syncAggregator`**:
    *   **Rotation**: Ensure `getNextAggregatorSource` includes it.
    *   **API Logic**: Add the `apiUrl` construction and response parsing in the main `syncAggregator` function.
    *   **Mapping**: Add strict field mapping (Title, Company, Description, Date) to the `jobs` table schema.

### 2. Manual Trigger Support

Edit `apps/jobs/src/lib/sync-queue.ts`:
1.  Add a generic `createSourceFetcher` for the new aggregator with appropriate rate limiting (e.g., 2000ms).

---

## Validation Checklist

- [ ] **Worker Logic**: Added to `worker-sync-logic.ts`?
- [ ] **Types**: Added to global types / TypeScript unions?
- [ ] **Rate Limits**: Is the API throttled correctly (e.g., 1 req/sec)?
- [ ] **Content-Type Check**: Does the code verify `application/json` to avoid parsing error pages?
- [ ] **Discovery**: If it's an ATS, is it hooked into the Discovery worker's checking logic?
