-- ##################################################
-- SQL-DML : Data Manipulation Language
-- ##################################################

USE greta
;

-- Vide la table TRAINEES
DELETE FROM trainees
WHERE id_te > 0
;

-- RAZ auto_increment
ALTER TABLE trainees
AUTO_INCREMENT = 1
;

-- Ajoute des lignes à la table TRAINEES
INSERT INTO trainees(fname, dob, sex, internal, email)
VALUES('Sidonie', '2000-02-26', 'F', 1, 'sidonie.moulart@gmail.com')
;

INSERT INTO trainees(fname, dob, sex, internal, email)
VALUES('Océane', '2000-08-02', 'F', 0, 'oceane.pichard@orange.fr')
;

INSERT INTO trainees(fname, dob, sex, internal, email)
VALUES('Céline', '2000-05-23', 'F', 0, 'celinebrechet@hotmail.fr')
;

INSERT INTO trainees(fname, dob, sex, internal, email)
VALUES('Blandine', '2000-04-28', 'F', 1, 'blandinefiguet@gmail.com')
;

INSERT INTO trainees(fname, dob, sex, internal, email)
VALUES('Mélissa', '2000-09-25', 'F', 0, 'melissagustave4@gmail.com')
;

-- Syntaxe MySQL
INSERT INTO trainees(fname, dob, sex, internal, email) VALUES
	('Edwin', '2000-01-15', 'M', 1, 'edwinjones.m@gmail.com'),
	('Kiris', '1998-09-05', 'M', 1, 'kirishankerpro@gmail.com'),
	('Vinoth', '1980-07-27', 'M', 1, 'tvkmr@outlook.fr'),
	('Bunsen', '2000-10-20', 'M', 1, 'changivy.bunsen@gmail.com'),
	('Tiago', '1995-03-23', 'M', 0, 'tiagofonseca1995@gmail.com'),
	('Paulo', '1991-03-31', 'M', 0, 'paulo_magalhaes@outlook.fr'),
	('Kamal', '1995-01-04', 'M', 0, 'kamalknina@hotmail.fr'),
	('Dioclès', '1961-12-04', 'M', 1, 'diotura@yahoo.fr'),
	('Flaviu', '1999-11-20', 'M', 0, 'skydemmon@gmail.com'),
	('Léo', '1997-01-14', 'M', 1, 'leo.labeaume@hotmail.fr')
;

-- Check table TRAINEES
SELECT *
FROM trainees
;

-- Ajoute des lignes à la table TRAINERS
INSERT INTO trainers(fname, grade, dob) VALUES
	('Nadjet', 'C', '2000-08-19'),
    ('Lesly', 'A', '1967-11-11')
;

-- Check table TRAINERS
SELECT *
FROM trainers
;

-- Mettre les fichiers CSV dans le dossier indiqué par la variable "secure_file_priv"
-- Sinon modifier le paramètre présent dans my.ini à la rubrique [mysqld]
-- Exemple : secure-file-priv = "d:/apps/uwamp/www/arpajon/cp6"
-- Redémarrer le serveur
SHOW VARIABLES LIKE 'secure_file_priv'
;

-- Importe le contenu du fichier CSV courses
LOAD DATA INFILE 'd:/apps/uwamp/www/arpajon/cp6/greta-courses.csv' 
	INTO TABLE greta.courses
	FIELDS TERMINATED BY ';' 
    ENCLOSED BY '"'
	LINES TERMINATED BY '\r\n'
	IGNORE 1 LINES
;

-- Importe le contenu du fichier CSV courses
LOAD DATA INFILE 'd:/apps/uwamp/www/arpajon/cp6/greta-follows.csv' 
	INTO TABLE greta.follows
	FIELDS TERMINATED BY ';' 
    ENCLOSED BY '"'
	LINES TERMINATED BY '\r\n'
	IGNORE 1 LINES
;