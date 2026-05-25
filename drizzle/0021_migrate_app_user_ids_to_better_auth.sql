-- Align app-level user IDs with better-auth user IDs.
-- D1-safe strategy: rebuild user-linked child tables against the new users table.

--> statement-breakpoint
ALTER TABLE users RENAME TO users_legacy;

--> statement-breakpoint
CREATE TABLE `users` (
  `id` text PRIMARY KEY NOT NULL,
  `email` text NOT NULL,
  `email_verified` integer DEFAULT 0 NOT NULL,
  `name` text,
  `image` text,
  `password_hash` text,
  `role` text NOT NULL DEFAULT 'user',
  `created_at` integer NOT NULL
);

--> statement-breakpoint
INSERT OR IGNORE INTO users (
  id,
  email,
  email_verified,
  name,
  image,
  password_hash,
  role,
  created_at
)
SELECT
  COALESCE((SELECT ba.id FROM user ba WHERE lower(ba.email) = lower(ul.email) LIMIT 1), CAST(ul.id AS TEXT)) AS id,
  ul.email,
  COALESCE((SELECT ba.email_verified FROM user ba WHERE lower(ba.email) = lower(ul.email) LIMIT 1), 0) AS email_verified,
  (SELECT ba.name FROM user ba WHERE lower(ba.email) = lower(ul.email) LIMIT 1) AS name,
  (SELECT ba.image FROM user ba WHERE lower(ba.email) = lower(ul.email) LIMIT 1) AS image,
  ul.password_hash,
  COALESCE(ul.role, (SELECT ba.role FROM user ba WHERE lower(ba.email) = lower(ul.email) LIMIT 1), 'user') AS role,
  CASE
    WHEN typeof(ul.created_at) = 'integer' THEN ul.created_at
    WHEN typeof(ul.created_at) = 'text' THEN COALESCE(unixepoch(ul.created_at), unixepoch())
    ELSE unixepoch()
  END AS created_at
FROM users_legacy ul;

--> statement-breakpoint
INSERT OR IGNORE INTO users (
  id,
  email,
  email_verified,
  name,
  image,
  password_hash,
  role,
  created_at
)
SELECT
  ba.id,
  ba.email,
  COALESCE(ba.email_verified, 0),
  ba.name,
  ba.image,
  NULL,
  COALESCE(ba.role, 'user'),
  COALESCE(ba.created_at, unixepoch())
FROM user ba;

--> statement-breakpoint
CREATE UNIQUE INDEX IF NOT EXISTS `users_email_unique` ON `users` (`email`);

--> statement-breakpoint
ALTER TABLE master_resume RENAME TO master_resume_legacy;

--> statement-breakpoint
CREATE TABLE `master_resume` (
  `id` integer PRIMARY KEY AUTOINCREMENT NOT NULL,
  `user_id` text REFERENCES `users`(`id`),
  `full_name` text NOT NULL,
  `email` text,
  `phone` text,
  `linkedin` text,
  `website` text,
  `summary` text,
  `competencies` text,
  `tools` text,
  `experience` text,
  `education` text,
  `certifications` text,
  `raw_text` text,
  `updated_at` text
);

--> statement-breakpoint
INSERT INTO master_resume (
  id, user_id, full_name, email, phone, linkedin, website, summary, competencies, tools, experience, education, certifications, raw_text, updated_at
)
SELECT
  mr.id,
  CASE
    WHEN mr.user_id IS NULL THEN NULL
    ELSE COALESCE((SELECT ba.id FROM users_legacy ul JOIN user ba ON lower(ba.email)=lower(ul.email) WHERE CAST(ul.id AS TEXT)=CAST(mr.user_id AS TEXT) LIMIT 1), CAST(mr.user_id AS TEXT))
  END,
  mr.full_name, mr.email, mr.phone, mr.linkedin, mr.website, mr.summary, mr.competencies, mr.tools, mr.experience, mr.education, mr.certifications, mr.raw_text, mr.updated_at
FROM master_resume_legacy mr;

--> statement-breakpoint
CREATE UNIQUE INDEX IF NOT EXISTS `master_resume_user_id_unique` ON `master_resume` (`user_id`);

--> statement-breakpoint
ALTER TABLE analytics_summary RENAME TO analytics_summary_legacy;

--> statement-breakpoint
CREATE TABLE `analytics_summary` (
  `id` integer PRIMARY KEY AUTOINCREMENT NOT NULL,
  `user_id` text REFERENCES `users`(`id`),
  `period` text NOT NULL,
  `top_jd_keywords` text,
  `top_resume_keywords` text,
  `top_job_titles` text,
  `top_industries` text,
  `average_match_score` real,
  `total_analyses` integer,
  `total_resumes_generated` integer,
  `total_applied` integer DEFAULT 0,
  `updated_at` text
);

--> statement-breakpoint
INSERT INTO analytics_summary (
  id, user_id, period, top_jd_keywords, top_resume_keywords, top_job_titles, top_industries, average_match_score, total_analyses, total_resumes_generated, total_applied, updated_at
)
SELECT
  a.id,
  CASE
    WHEN a.user_id IS NULL THEN NULL
    ELSE COALESCE((SELECT ba.id FROM users_legacy ul JOIN user ba ON lower(ba.email)=lower(ul.email) WHERE CAST(ul.id AS TEXT)=CAST(a.user_id AS TEXT) LIMIT 1), CAST(a.user_id AS TEXT))
  END,
  a.period, a.top_jd_keywords, a.top_resume_keywords, a.top_job_titles, a.top_industries, a.average_match_score, a.total_analyses, a.total_resumes_generated, a.total_applied, a.updated_at
FROM analytics_summary_legacy a;

--> statement-breakpoint
ALTER TABLE linkedin_job_results RENAME TO linkedin_job_results_legacy;

--> statement-breakpoint
ALTER TABLE linkedin_saved_searches RENAME TO linkedin_saved_searches_legacy;

--> statement-breakpoint
CREATE TABLE `linkedin_saved_searches` (
  `id` integer PRIMARY KEY AUTOINCREMENT NOT NULL,
  `user_id` text NOT NULL REFERENCES `users`(`id`),
  `name` text NOT NULL,
  `criteria` text NOT NULL,
  `is_active` integer DEFAULT 1 NOT NULL,
  `run_interval_hours` integer DEFAULT 24 NOT NULL,
  `sources` text DEFAULT '["linkedin", "greenhouse", "lever"]' NOT NULL,
  `last_run_at` text,
  `created_at` text NOT NULL,
  `updated_at` text NOT NULL
);

--> statement-breakpoint
INSERT INTO linkedin_saved_searches (
  id, user_id, name, criteria, is_active, run_interval_hours, sources, last_run_at, created_at, updated_at
)
SELECT
  lss.id,
  COALESCE((SELECT ba.id FROM users_legacy ul JOIN user ba ON lower(ba.email)=lower(ul.email) WHERE CAST(ul.id AS TEXT)=CAST(lss.user_id AS TEXT) LIMIT 1), CAST(lss.user_id AS TEXT)),
  lss.name,
  lss.criteria,
  lss.is_active,
  COALESCE(lss.run_interval_hours, 24),
  COALESCE(lss.sources, '["linkedin", "greenhouse", "lever"]'),
  lss.last_run_at,
  lss.created_at,
  lss.updated_at
FROM linkedin_saved_searches_legacy lss;

--> statement-breakpoint
CREATE TABLE `linkedin_job_results` (
  `id` integer PRIMARY KEY AUTOINCREMENT NOT NULL,
  `user_id` text NOT NULL REFERENCES `users`(`id`),
  `saved_search_id` integer REFERENCES `linkedin_saved_searches`(`id`),
  `external_job_id` text NOT NULL,
  `title` text NOT NULL,
  `company` text NOT NULL,
  `location` text NOT NULL,
  `source_url` text NOT NULL,
  `canonical_source_url` text NOT NULL,
  `source_name` text DEFAULT 'LinkedIn' NOT NULL,
  `search_url` text,
  `criteria` text NOT NULL,
  `salary` text,
  `snippet` text,
  `description` text,
  `post_date_text` text,
  `workplace_type` text,
  `ats_score` integer,
  `career_score` integer,
  `outlook_score` integer,
  `master_score` integer,
  `ats_reason` text,
  `career_reason` text,
  `outlook_reason` text,
  `is_unicorn` integer DEFAULT 0 NOT NULL,
  `unicorn_reason` text,
  `status` text DEFAULT 'Analyzed' NOT NULL,
  `first_seen_at` text NOT NULL,
  `last_seen_at` text NOT NULL,
  `created_at` text NOT NULL,
  `updated_at` text NOT NULL
);

--> statement-breakpoint
INSERT INTO linkedin_job_results (
  id, user_id, saved_search_id, external_job_id, title, company, location, source_url, canonical_source_url, source_name, search_url, criteria, salary, snippet, description, post_date_text, workplace_type, ats_score, career_score, outlook_score, master_score, ats_reason, career_reason, outlook_reason, is_unicorn, unicorn_reason, status, first_seen_at, last_seen_at, created_at, updated_at
)
SELECT
  ljr.id,
  COALESCE((SELECT ba.id FROM users_legacy ul JOIN user ba ON lower(ba.email)=lower(ul.email) WHERE CAST(ul.id AS TEXT)=CAST(ljr.user_id AS TEXT) LIMIT 1), CAST(ljr.user_id AS TEXT)),
  ljr.saved_search_id,
  ljr.external_job_id,
  ljr.title,
  ljr.company,
  ljr.location,
  ljr.source_url,
  ljr.canonical_source_url,
  ljr.source_name,
  ljr.search_url,
  ljr.criteria,
  ljr.salary,
  ljr.snippet,
  ljr.description,
  ljr.post_date_text,
  ljr.workplace_type,
  ljr.ats_score,
  ljr.career_score,
  ljr.outlook_score,
  ljr.master_score,
  ljr.ats_reason,
  ljr.career_reason,
  ljr.outlook_reason,
  ljr.is_unicorn,
  ljr.unicorn_reason,
  COALESCE(ljr.status, 'Analyzed'),
  ljr.first_seen_at,
  ljr.last_seen_at,
  ljr.created_at,
  ljr.updated_at
FROM linkedin_job_results_legacy ljr;

--> statement-breakpoint
CREATE UNIQUE INDEX IF NOT EXISTS `linkedin_job_results_user_canonical_url_unique`
ON `linkedin_job_results` (`user_id`,`canonical_source_url`);

--> statement-breakpoint
ALTER TABLE generated_documents RENAME TO generated_documents_legacy;

--> statement-breakpoint
ALTER TABLE job_analyses RENAME TO job_analyses_legacy;

--> statement-breakpoint
CREATE TABLE `job_analyses` (
  `id` integer PRIMARY KEY AUTOINCREMENT NOT NULL,
  `user_id` text REFERENCES `users`(`id`),
  `job_url` text NOT NULL,
  `job_title` text,
  `company` text,
  `industry` text,
  `location` text,
  `jd_text` text,
  `match_score` integer,
  `gap_analysis` text,
  `recommendations` text,
  `pursue` integer,
  `pursue_justification` text,
  `keywords` text,
  `strategy_note` text,
  `personal_interest` text,
  `career_analysis` text,
  `insights` text,
  `applied` integer DEFAULT 0,
  `application_status` text,
  `applied_at` text,
  `created_at` text
);

--> statement-breakpoint
INSERT INTO job_analyses (
  id, user_id, job_url, job_title, company, industry, location, jd_text, match_score, gap_analysis, recommendations, pursue, pursue_justification, keywords, strategy_note, personal_interest, career_analysis, insights, applied, application_status, applied_at, created_at
)
SELECT
  ja.id,
  CASE
    WHEN ja.user_id IS NULL THEN NULL
    ELSE COALESCE((SELECT ba.id FROM users_legacy ul JOIN user ba ON lower(ba.email)=lower(ul.email) WHERE CAST(ul.id AS TEXT)=CAST(ja.user_id AS TEXT) LIMIT 1), CAST(ja.user_id AS TEXT))
  END,
  ja.job_url, ja.job_title, ja.company, ja.industry, ja.location, ja.jd_text, ja.match_score, ja.gap_analysis, ja.recommendations, ja.pursue, ja.pursue_justification, ja.keywords, ja.strategy_note, ja.personal_interest, ja.career_analysis, ja.insights, ja.applied, ja.application_status, ja.applied_at, ja.created_at
FROM job_analyses_legacy ja;

--> statement-breakpoint
CREATE TABLE `generated_documents` (
  `id` integer PRIMARY KEY AUTOINCREMENT NOT NULL,
  `job_analysis_id` integer REFERENCES `job_analyses`(`id`),
  `doc_type` text NOT NULL,
  `r2_key` text NOT NULL,
  `file_name` text,
  `resume_keywords` text,
  `created_at` text
);

--> statement-breakpoint
INSERT INTO generated_documents (
  id, job_analysis_id, doc_type, r2_key, file_name, resume_keywords, created_at
)
SELECT
  gd.id, gd.job_analysis_id, gd.doc_type, gd.r2_key, gd.file_name, gd.resume_keywords, gd.created_at
FROM generated_documents_legacy gd;

--> statement-breakpoint
DROP TABLE master_resume_legacy;

--> statement-breakpoint
DROP TABLE analytics_summary_legacy;

--> statement-breakpoint
DROP TABLE linkedin_job_results_legacy;

--> statement-breakpoint
DROP TABLE linkedin_saved_searches_legacy;

--> statement-breakpoint
DROP TABLE generated_documents_legacy;

--> statement-breakpoint
DROP TABLE job_analyses_legacy;

--> statement-breakpoint
DROP TABLE users_legacy;
