# V3 Sync Troubleshooting Guide

> Quick reference for common issues and solutions with the Worker-based Sync System.

## Worker Issues

### Worker Stuck on Same Company
**Symptom:** ATS sync keeps processing the same company repeatedly.
**Cause:** Batch state (in `sync_history` table) is not advancing due to an uncaught error in `worker-sync-logic.ts`.
**Solution:**
1. Check Cloudflare logs ("Workers & Pages" > "Logs") for the specific error.
2. Manually advance batch state in D1:
```sql
UPDATE sync_history 
SET stats = json_set(stats, '$.atsIndex', atsIndex + 1)
WHERE status = 'batch_state' AND sync_type = 'ats';
```

### 429 Rate Limits
**Symptom:** Logs show "Rate limit hit (429)".
**Reference:** `src/lib/worker-sync-logic.ts` handles this by setting a cooldown.
**Check:**
*   **Greenhouse/Lever**: Should be rare (1 req/sec limit).
*   **Workable**: Has dynamic rate limits. The system automatically sets a `workableCooldownUntil` timestamp in the batch state.
*   **Mitigation**: If persistent, check if multiple workers (e.g., local dev + prod) are running simultaneously.

### "Invalid response type: text/html"
**Symptom:** Worker fails with invalid content-type error.
**Cause:** The target API returned a 404 page, 500 error page, or Cloudflare challenge instead of JSON.
**Solution:**
*   The worker generally auto-detects this.
*   If it's an ATS 404 (Company leaving the platform), the **Self-Healing** logic in `syncAtsCompany` should automatically move them from `discovered_companies` back to `potential_companies`.

---

## Database Issues

### Jobs Not Appearing
**Debug Queries:**
```sql
-- Check total count
SELECT COUNT(*) FROM jobs;

-- Check latest additions
SELECT id, title, company, source_name, created_at 
FROM jobs 
ORDER BY created_at DESC 
LIMIT 10;
```

### Sync History Bloat
**Maintenance:** Periodically clean old logs (though D1 is cheap, it's good practice):
```sql
DELETE FROM sync_history 
WHERE status != 'batch_state' 
AND completed_at < datetime('now', '-30 days');
```

---

## API & Manual Triggers

### Manual Sync Difference
**Note:** Manual triggers (`POST /api/v3/sync/ats`) use slightly different code (`sync-queue.ts`) than the automated workers (`worker-sync-logic.ts`).
*   If a manual sync works but the worker fails: The issue is likely in `worker-sync-logic.ts`.
*   If both fail: The issue is likely the external API or database.

### Common Commands
```bash
# Manual ATS Sync
curl -X POST https://caliber.rcormier.dev/api/v3/sync/ats

# Manual Aggregator Sync
curl -X POST https://caliber.rcormier.dev/api/v3/sync/aggregator
```
