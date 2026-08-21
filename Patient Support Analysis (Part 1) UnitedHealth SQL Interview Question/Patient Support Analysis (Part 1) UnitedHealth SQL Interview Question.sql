WITH CTE1 AS (SELECT policy_holder_id, COUNT(DISTINCT case_id) FROM callers
GROUP BY policy_holder_id
HAVING COUNT(DISTINCT case_id) >= 3)
SELECT COUNT(policy_holder_id) AS policy_holder_count
FROM CTE1