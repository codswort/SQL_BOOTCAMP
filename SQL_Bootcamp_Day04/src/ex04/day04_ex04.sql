CREATE VIEW v_symmetric_union AS
WITH ONE AS (
    SELECT *
    FROM person_visits
    WHERE visit_date = '2022-01-02'),
TWO AS (SELECT *
    FROM person_visits
    WHERE visit_date = '2022-01-06'),
THREE AS (SELECT * FROM ONE
    EXCEPT
    SELECT * FROM TWO),
FOUR AS (SELECT * FROM TWO
    EXCEPT
    SELECT * FROM ONE),
RESULT AS (SELECT person_id FROM THREE
    UNION SELECT person_id FROM FOUR)
SELECT * FROM RESULT
ORDER by 1;