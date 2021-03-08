USE greta
;

-- Projections : toutes les lignes
SELECT fname, dob
FROM trainees
;

SELECT *
FROM trainers
;

SELECT DISTINCT sex, internal
FROM trainees
;

SELECT fname, 'Hello, j''ai', 35+22, 'ans', NOW()
FROM trainers
;

SELECT fname, FLOOR(DATEDIFF(NOW(), dob)/365.25) AS age
FROM trainers
;

-- Arrondis
-- FLOOR, CEIL, TRUNCATE, ROUND
SELECT ROUND(1234.56), 
		ROUND(1234.5678, 2),
        ROUND(1234.5678, -2),
        FLOOR(1.99999999),
        FLOOR(1.00000001),
        CEIL(1.99999999),
        CEIL(1.00000001),
        TRUNCATE(1.493, 1)
;

-- Concaténation
SELECT CONCAT('Je m''appelle', ' ', fname) AS "Prénom stagiaire"
FROM trainees
;

-- Gestion des NULL
INSERT INTO trainers(fname) VALUES
	('Gaja'),
    ('Vital')
;

SELECT fname, grade, COALESCE(grade, 'E') AS grade2
FROM trainers
;

-- Sélections : choix des lignes
SELECT fname, dob
FROM trainees
-- WHERE YEAR(dob) = 2000
-- WHERE LEFT(dob, 4) = '2000'
-- WHERE dob BETWEEN '2000-01-01' AND '2000-12-31'
WHERE dob LIKE '2000%'
;

-- Liste des trainees qui s'appellent : 
-- Noémie, Léo, Kiris, Edwin
SELECT fname, dob
FROM trainees
WHERE fname='Noémie' 
OR fname='Léo' 
OR fname='Kiris'
OR fname='Edwin'
;
--
SELECT fname, dob
FROM trainees
WHERE fname IN ('Noémie','Léo','Kiris','Edwin')
;

-- BETWEEN
SELECT fname, dob
FROM trainees
WHERE fname BETWEEN 'c' AND 'l'
;

-- LIKE
SELECT *
FROM trainees
WHERE fname LIKE '%i_'
;

-- NULL
SELECT fname, dob
FROM trainers
WHERE dob IS NOT NULL;

-- Jointures internes
SELECT fname, name
FROM trainers, courses
WHERE trainers.id_tr = courses.id_tr
;

-- SQL-1 : 1987
SELECT t.fname, c.name
FROM trainers t, courses c
WHERE t.id_tr = c.id_tr
;

-- SQL-3 : 1999
SELECT t.fname, c.name
FROM trainers t JOIN courses c ON t.id_tr = c.id_tr
;

-- JOIN ... USING
SELECT t.fname, c.name
FROM trainers t JOIN courses c USING(id_tr)
;

-- NATURAL JOIN : déconseillé
SELECT t.fname, c.name
FROM trainers t NATURAL JOIN courses c
;

