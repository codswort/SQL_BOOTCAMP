SELECT CONCAT (name, ' (age:', age, ',gender:', quote_literal(gender),',address:', quote_literal(address), ')') AS person_information
FROM person
ORDER by person_information