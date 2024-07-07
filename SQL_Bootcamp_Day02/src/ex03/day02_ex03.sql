WITH NEW AS (SELECT missing_dates::date as missing_date
FROM generate_series('2022-01-01', '2022-01-10', interval '1 day') AS missing_dates)
SELECT missing_date FROM NEW
LEFT JOIN (SELECT visit_date FROM person_visits
           WHERE (person_visits.person_id = 1 OR person_visits.person_id = 2)) as dop
ON missing_date = dop.visit_date
WHERE (dop IS NULL)
ORDER by visit_date