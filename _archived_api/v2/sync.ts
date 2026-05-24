import { createFileRoute } from '@tanstack/react-router'
import { json } from '@tanstack/react-start'

interface SyncRequestBody {
  type: 'job_sync' | 'discovery'
}

export const Route = createFileRoute('/api/_archived/v2/sync')({
  server: {
    handlers: {
      POST: async ({ request, context }) => {
        const syncStartTime = new Date();
        const syncId = crypto.randomUUID();
        
        try {
          // Parse request body
          const body = await request.json() as SyncRequestBody;
          const syncType = body.type || 'job_sync';
          
          if (syncType !== 'job_sync' && syncType !== 'discovery') {
            return json({
              success: false,
              error: 'Invalid sync type. Must be "job_sync" or "discovery"'
            }, { status: 400 });
          }
          
          // Route to appropriate sync endpoint based on type
          const targetEndpoint = syncType === 'job_sync' 
            ? '/api/v2/sync-batch'
            : '/api/v2/discover-companies';
          
          console.log(`[Unified Sync] ${syncType} started at ${syncStartTime.toISOString()}`);
          
          // Call the appropriate endpoint
          const ctx = context as any;
          const baseUrl = ctx.env?.SELF_URL || 'https://caliber.rcormier.dev';
          
          const response = await fetch(`${baseUrl}${targetEndpoint}`, {
            method: 'POST',
            headers: {
              'Content-Type': 'application/json'
            }
          });
          
          const result = await response.json();
          
          console.log(`[Unified Sync] ${syncType} completed:`, result);
          
          return json({
            success: result.success,
            syncId: result.syncId || syncId,
            type: syncType,
            ...result
          });
          
        } catch (error) {
          console.error('[Unified Sync] Error:', error);
          
          return json({
            success: false,
            error: error instanceof Error ? error.message : 'Unknown error occurred',
            syncId
          }, { status: 500 });
        }
      }
    }
  }
})
