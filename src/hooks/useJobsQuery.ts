import { useQuery, useQueryClient } from "@tanstack/react-query";
import { getPipelineJobHistory } from "@/server/functions/jobs-pipeline";
import type { JobSearchParams } from "@/routes/jobs";

const PAGE_SIZE = 20;

export const jobsQueryKeys = {
  all: ["jobs"] as const,
  list: (params: JobSearchParams) =>
    [
      "jobs",
      {
        page: params.page,
        query: params.query,
        remote: params.remote,
        sortBy: params.sortBy,
        status: params.status,
        analyzedOnly: params.analyzedOnly,
      },
    ] as const,
};

interface UseJobsQueryOptions {
  searchParams: JobSearchParams;
}

export function useJobsQuery({ searchParams }: UseJobsQueryOptions) {
  const queryClient = useQueryClient();

  const query = useQuery({
    queryKey: jobsQueryKeys.list(searchParams),
    queryFn: async () => {
      const result = await getPipelineJobHistory({
        data: {
          ...searchParams,
          pageSize: PAGE_SIZE,
          excludeDiscovered: searchParams.analyzedOnly,
        },
      });
      return result;
    },
    staleTime: 1000 * 60, // 1 minute
    gcTime: 1000 * 60 * 5, // 5 minutes
  });

  const invalidateJobs = () => {
    void queryClient.invalidateQueries({
      queryKey: jobsQueryKeys.all,
    });
  };

  const updateJobsOptimistically = (updater: (jobs: typeof query.data) => typeof query.data) => {
    queryClient.setQueryData(jobsQueryKeys.list(searchParams), (old) => {
      if (!old) return old;
      return updater(old);
    });
  };

  return {
    ...query,
    invalidateJobs,
    updateJobsOptimistically,
    PAGE_SIZE,
  };
}
