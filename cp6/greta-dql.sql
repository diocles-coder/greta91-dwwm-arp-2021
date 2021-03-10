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

-- Jointures externes
SELECT t.fname, c.name
FROM trainers t LEFT JOIN courses c ON c.id_tr = t.id_tr
;

INSERT INTO courses(name)
VALUES('Langage Python')
;

SELECT t.fname, c.name
FROM trainers t RIGHT JOIN courses c ON c.id_tr = t.id_tr
;

-- Structure CASE simple
SELECT fname, 
		sex, 
        dob,
        CASE MONTH(dob)
			WHEN 1 THEN 'Hiver'
			WHEN 2 THEN 'Hiver'
			WHEN 3 THEN 'Hiver'
            WHEN 4 THEN 'Printemps'
            WHEN 5 THEN 'Printemps'
            WHEN 6 THEN 'Printemps'
            WHEN 7 THEN 'Eté'
            WHEN 8 THEN 'Eté'
            WHEN 9 THEN 'Eté'
            WHEN 10 THEN 'Automne'
            WHEN 11 THEN 'Automne'
            WHEN 12 THEN 'Automne'
            ELSE 'Inconnue'
        END AS saison
FROM trainees
ORDER BY saison
;

-- Structure CASE élaboré
SELECT fname, 
		sex, 
        dob,
        CASE 
			WHEN MONTH(dob) < 4 THEN 'Hiver'
			WHEN MONTH(dob) < 7 THEN 'Printemps'
			WHEN MONTH(dob) < 10 THEN 'Eté'
			WHEN MONTH(dob) < 13 THEN 'Automne'
            ELSE 'Inconnue'
        END AS saison,
        -- Ajouter une colonne calculée CIVILITE
        -- qui affiche 'Madame' si sex='f'
        -- et 'Jeune homme' si sex='m' et age < 30
        -- ou 'Monsieur' si sex='m' et age >= 30
        CASE
			WHEN sex = 'F' THEN 'Madame'
            WHEN sex = 'M' AND DATEDIFF(NOW(),dob)/365.25 < 30 THEN 'Jeune homme'
            WHEN sex = 'M' AND DATEDIFF(NOW(),dob)/365.25 >= 30 THEN 'Monsieur'
        END AS civilite
FROM trainees
ORDER BY saison
;

-- Regroupement : GROUP BY
SELECT sex, COUNT(id_te) AS nb
FROM trainees
GROUP BY sex
;

SELECT sex, internal, COUNT(id_te) AS nb
FROM trainees
GROUP BY sex, internal
;

-- Regroupements : HAVING
SELECT t.fname, c.name, AVG(f.eval) AS moyenne
FROM trainers t JOIN courses c JOIN follows f
ON t.id_tr = c.id_tr AND c.id_c = f.id_c
WHERE f.id_te != 14
GROUP BY t.fname, c.name
HAVING AVG(f.eval) < 12
ORDER BY moyenne
;






