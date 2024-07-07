CREATE INDEX IF NOT EXISTS idx_person_name ON person (UPPER(name));
SET enable_seqscan = off;
EXPLAIN ANALYZE SELECT
name
FROM person
WHERE UPPER(name) IS NOT NULL;
