SELECT ONE.name AS person_name1, person.name AS person_name2, person.address AS common_address
FROM person AS ONE
JOIN person ON person.address = ONE.address
WHERE (person.id < ONE.id)
ORDER by 1, 2, 3
