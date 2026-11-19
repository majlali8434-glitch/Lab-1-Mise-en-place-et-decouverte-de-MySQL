
-- LAB 1 : BASES DE DONNÉES MYSQL


-- 1. Création et sélection de la base de données
CREATE DATABASE testdb 
CHARACTER SET utf8mb4 
COLLATE utf8mb4_unicode_ci;
USE testdb;
SHOW DATABASES;

-- 2. Création de la table utilisateur

CREATE TABLE utilisateur (
  id    INT AUTO_INCREMENT PRIMARY KEY,
  nom   VARCHAR(50) NOT NULL,
  email VARCHAR(100) NOT NULL UNIQUE
) ENGINE=InnoDB;

-- 3. Insertion des données

INSERT INTO utilisateur (nom, email) VALUES 
('Alice Dupont', 'alice@example.com'),
('Bob Martin', 'bob@example.com'),
('Charlie Leroy', 'charlie@test.org');

SELECT * FROM utilisateur;

-- 4. Requêtes de lecture

SELECT nom, email
FROM utilisateur
WHERE email LIKE '%@example.com';
SELECT COUNT(*) AS total_utilisateurs
FROM utilisateur;
SELECT nom, email
FROM utilisateur
ORDER BY nom ASC;
SELECT nom, email
FROM utilisateur
ORDER BY id DESC
LIMIT 2;


-- 5. Mise à jour et suppression (UPDATE / DELETE)

UPDATE utilisateur
SET email = 'bob.martin@example.com'
WHERE id = 2;
DELETE FROM utilisateur
WHERE nom = 'Charlie Leroy';

SELECT * FROM utilisateur;

-- 6. Transaction et Rollback

START TRANSACTION;
DELETE FROM utilisateur WHERE nom = 'Alice Dupont';
-- Si vous changez d'avis :
ROLLBACK;
-- Si vous êtes sûr :
COMMIT;

-- 7. Gestion des index

CREATE INDEX idx_email ON utilisateur(email);
SHOW INDEX FROM utilisateur;
EXPLAIN SELECT * FROM utilisateur WHERE email = 'alice@example.com';
DROP INDEX idx_email ON utilisateur;
CREATE USER 'app_user'@'localhost' IDENTIFIED BY 'SecurePassword123!';
GRANT SELECT, INSERT, UPDATE, DELETE ON testdb.* TO 'app_user'@'localhost';
FLUSH PRIVILEGES;
SHOW GRANTS FOR 'app_user'@'localhost';
DROP USER 'app_user'@'localhost';
-- 9. Nettoyage final (à exécuter APRÈS avoir fait le mysqldump)
-- DROP TABLE utilisateur;
-- DROP DATABASE testdb;