-- Script de création de la BDD GRETA
-- Attention ce script supprime la BDD avant de la recréer !!!

-- Lister les BDD du serveur
SHOW DATABASES
;

-- Supprime la BD GRETA
DROP DATABASE IF EXISTS greta
;

-- Crée la BDD GRETA
CREATE DATABASE IF NOT EXISTS greta
;

-- Entre dans la BDD 
USE greta
;

-- Liste les tables de la BDD
SHOW TABLES
;

-- Crée la table TRAINERS
CREATE TABLE greta.trainers(
	id_tr TINYINT NOT NULL AUTO_INCREMENT,
    fname VARCHAR(30) NOT NULL,
    grade ENUM('A', 'B', 'C', 'D', 'E'), -- MySQL seulement
    dob DATE,
    PRIMARY KEY (id_tr)
) ENGINE=InnoDB CHARACTER SET utf8 COLLATE utf8_general_ci
;

-- Crée la table COURSES
CREATE TABLE greta.courses(
	id_c TINYINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    coeff TINYINT,
    id_tr TINYINT,
    CONSTRAINT courses_coeff_ck 
		CHECK (coeff BETWEEN 1 AND 7),
    CONSTRAINT courses_id_tr_fk 
		FOREIGN KEY (id_tr) 
        REFERENCES greta.trainers(id_tr)
) ENGINE=InnoDB CHARACTER SET utf8 COLLATE utf8_general_ci
;

-- Crée la table TRAINEES
CREATE TABLE greta.trainees(
	id_te TINYINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    fname VARCHAR(30) NOT NULL,
    dob DATE,
    sex CHAR(1),
    internal BOOLEAN, -- MySQL seulement = TINYINT
    CONSTRAINT trainees_internal_ck1
		CHECK (internal IN (0, 1)),
	CONSTRAINT trainees_sex_ck2
		CHECK (sex IN ('F', 'M', 'N'))
) ENGINE=InnoDB CHARACTER SET utf8 COLLATE utf8_general_ci
;

-- Crée la table FOLLOWS
CREATE TABLE greta.follows(
	id_te TINYINT NOT NULL,
    id_c TINYINT NOT NULL,
    eval DECIMAL(4, 2),
    PRIMARY KEY (id_te, id_c),
    CONSTRAINT follows_id_te_fk
		FOREIGN KEY (id_te)
        REFERENCES greta.trainees(id_te),
	CONSTRAINT follows_id_c_fk
		FOREIGN KEY (id_c)
        REFERENCES greta.courses(id_c),
	CONSTRAINT follows_eval_ck
		CHECK (eval BETWEEN 0 AND 20)
) ENGINE=InnoDB CHARACTER SET utf8 COLLATE utf8_general_ci
;