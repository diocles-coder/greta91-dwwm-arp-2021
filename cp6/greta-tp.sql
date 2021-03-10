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

-- TP 2-5 : jointures

-- Afficher le prénom des formateurs et l'intitulé des cours
-- dont le coefficient est supérieur à 1
SELECT t.fname, c.name
FROM trainers t JOIN courses c ON t.id_tr = c.id_tr
WHERE c.coeff > 1
;

-- Afficher le prénom des élèves féminines et internes
-- ainsi que leur note sur le cours n° 7
SELECT t.fname, f.eval
FROM trainees t JOIN follows f ON t.id_te = f.id_te
WHERE t.sex = 'F'
AND t.internal = 1
AND f.id_c = 7
;

-- Afficher l'intitulé des cours et le prénom de 
-- l'élève n° 14
SELECT t.fname, c.name, f.eval
FROM trainees t JOIN follows f JOIN courses c
ON t.id_te = f.id_te AND c.id_c = f.id_c
WHERE t.id_te = 14
;
--
SELECT t.fname, c.name, f.eval
FROM trainees t JOIN follows f ON t.id_te = f.id_te
JOIN courses c ON c.id_c = f.id_c
WHERE t.id_te = 14
;

-- TP 3-2 : regroupements

-- Afficher la moyenne des notes obtenue par les 
-- filles sur le cours n°5
SELECT f.id_c, AVG(f.eval) AS moyenne
FROM trainees t JOIN follows f ON t.id_te = f.id_te
WHERE t.sex = 'F'
AND f.id_c = 5
GROUP BY f.id_c
;

-- Quelle est la meilleure note en Maquettage 
-- pour les garçons ?
SELECT t.fname, c.name, MAX(f.eval) AS moyenne
FROM trainees t JOIN follows f JOIN courses c
ON t.id_te = f.id_te AND c.id_c = f.id_c
WHERE t.sex = 'M'
AND c.name LIKE '%maquett%'
GROUP BY t.fname, c.name, t.sex
ORDER BY moyenne DESC
LIMIT 1
;

-- Qui des filles ou des garçons a la meilleure
-- moyenne générale ?
SELECT t.sex, AVG(f.eval) AS moyenne
FROM trainees t JOIN follows f ON t.id_te = f.id_te
GROUP BY t.sex
;

-- Quel formateur.trice a le meilleur rendement : 
-- meilleure moyenne sur les notes obtenues par 
-- leurs élèves ?
SELECT t.fname, AVG(f.eval) AS moyenne
FROM trainers t JOIN courses c JOIN follows f
ON t.id_tr = c.id_tr AND  c.id_c = f.id_c
GROUP BY t.fname
;
--
SELECT t.fname, AVG(f.eval) AS moyenne
FROM trainers t 
	LEFT JOIN courses c 
		ON t.id_tr = c.id_tr
	LEFT JOIN follows f
		ON c.id_c = f.id_c
GROUP BY t.fname
;