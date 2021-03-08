-- TP 2-1 et 2-2 : projections
-- Afficher tous les cours
SELECT *
FROM courses
;

-- Afficher le prénom, le grade et la ddn des intervenants
-- si grade NULL alors afficher 'N/A'
SELECT fname, COALESCE(grade, 'N/A') as grade, dob
FROM trainers
;

-- Afficher les notes  à partir de la table FOLLOWS
SELECT eval
FROM follows
;

-- TP 2-3 : sélections
-- Afficher la liste des notes dans module 5
-- comprises entre 12 et 16
SELECT eval, id_c
FROM follows
WHERE id_c = 5
AND eval BETWEEN 12 AND 16
;

-- Afficher le élèves nés entre le 13/07/1998
-- et le 15/07/2018
SELECT fname, dob
FROM trainees
WHERE dob BETWEEN '1998-07-13' AND '2018-07-15'
;

-- Afficher les cours traitant de 'e-commerce'
-- et de coefficient 1
SELECT name, coeff
FROM courses
WHERE name LIKE '%e-commerce%'
AND coeff = 1
;

-- Afficher la liste des filles nées entre mars et septembre
-- ou des garçons internes nés avant 1990
SELECT fname, sex, dob
FROM trainees
WHERE (sex='F' AND MONTH(dob) BETWEEN 3 AND 9)
OR (sex='M' AND internal=1 AND YEAR(dob)<1990)
;

-- TP 2-4 : Tris
-- Afficher la liste des élèves triée par sexe dans l'ordre croissant,
-- et par ddn dans l'ordre décroissant
SELECT fname, sex, dob
FROM trainees
ORDER BY sex, dob DESC
;

-- Liste des notes triée par ID du cours décroissant et 
-- par note croissant
SELECT id_c, eval
FROM follows
ORDER BY id_c DESC, eval
;










