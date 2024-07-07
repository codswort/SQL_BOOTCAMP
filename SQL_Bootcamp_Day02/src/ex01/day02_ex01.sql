SELECT missing_date::date
FROM generate_series('2022-01-01', '2022-01-10', interval '1 day') as missing_date
LEFT JOIN (SELECT visit_date FROM person_visits
           WHERE (person_visits.person_id = 1 OR person_visits.person_id = 2)) as dop
ON missing_date = dop.visit_date
WHERE (dop IS NULL)
ORDER by visit_date