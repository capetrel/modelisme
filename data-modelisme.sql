-- phpMyAdmin SQL Dump
-- version 4.6.0
-- http://www.phpmyadmin.net
--
-- Client :  localhost
-- Généré le :  Mer 11 Mai 2016 à 21:49
-- Version du serveur :  5.5.47-0+deb8u1
-- Version de PHP :  5.6.17-0+deb8u1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `modelisme`
--

--
-- Contenu de la table `cp`
--

INSERT INTO `cp` (`id`, `code`) VALUES
(1, 75000),
(2, 37000),
(3, 86000),
(4, 36000),
(5, 49000),
(6, 97190),
(7, 80062),
(8, 28007),
(9, 4228610);

-- --------------------------------------------------------
--
-- Contenu de la table `ville`
--

INSERT INTO `ville` (`id`, `nom`, `cp_id`) VALUES
(1, 'Paris', 1),
(2, 'Tours', 2),
(3, 'Poitier', 3),
(4, 'Chateauroux', 4),
(5, 'Angers', 5),
(6, 'Pointe-à-Pitre', 6),
(7, 'Meta', 7),
(8, 'Madrid', 8),
(9, 'Shizuoka', 9);

--
-- Contenu de la table `pays`
--

INSERT INTO `pays` (`id`, `nom`, `ville_id`) VALUES
(1, 'France', 1),
(2, 'France', 2),
(3, 'France', 3),
(4, 'France', 4),
(5, 'France', 5),
(6, 'France', 6),
(7, 'Italie', 7),
(8, 'Espagne', 8),
(9, 'Japon', 9);

--
-- Contenu de la table `adresse`
--

INSERT INTO `adresse` (`id`, `adresse`, `adresse2`, `adresse3`, `pays_id`) VALUES
(1, 'Suruga-ku', 'Ondabara 3-7', 'Yubinbango', 9),
(2, '8 via Lamma', NULL, NULL, 7),
(3, '120 rue Daniel Mayer', NULL, NULL, 2),
(4, '56 rue Bonnet', NULL, NULL, 3),
(5, '88 rue du LImas', NULL, NULL, 4),
(6, '8 rue sadi Carnot', 'Z.I. des Loges', 'BP 141132007', 6),
(7, '61 boulevard d\'Alsaces', NULL, NULL, 2),
(8, '45 rue du Chateaux', NULL, NULL, 5),
(9, '63 place Maurice-Charretier', NULL, NULL, 3);


--
-- Contenu de la table `acheteur`
--

INSERT INTO `acheteur` (`id`, `nom`, `prenom`, `adresse_id`, `tel`, `fax`, `mail`, `pseudo`, `pass`, `valide`) VALUES
(1, 'Troijours', 'Adam', 2, '123456789', NULL, 'adantroijour@gmail.com', 'adan3jour', '3jourquitue', 1),
(2, 'Térieur', 'Alain', 4, '9812375', NULL, 'teireur.A@yahoo.fr', 'tinrieur', '4141N', 1),
(3, 'Raton', 'Candy', 7, '994716535', NULL, 'C.raton@hotmail.fr', 'candiraton', 'LePayDeCandy', 1),
(4, 'Asonmak', 'Fidel', 9, '191827364', NULL, 'fidel.c@msn.com', 'fidelmek', '123fidel', 1),
(5, 'Lazar', 'garcin', 3, '247989153', NULL, 'garcinl@lycos.fr', 'garcinl', '000lazare', 1);

-- --------------------------------------------------------



-- --------------------------------------------------------

--
-- Contenu de la table `categorie`
--

INSERT INTO `categorie` (`id`, `nom`) VALUES
(1, 'En l\'air'),
(2, 'Sur terre'),
(3, 'Sur l\'eau'),
(4, 'Sous l\'eau');

-- --------------------------------------------------------

--
-- Contenu de la table `commande`
--

LOAD DATA LOCAL INFILE '../bddCategorieCouleurModelismeCap.csv'
INTO TABLE categorieCouleur
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
-- ESCAPED BY '\\'
LINES
-- STARTING BY ''
TERMINATED BY '\n';

-- --------------------------------------------------------
--
-- Contenu de la table `commande`
--

INSERT INTO `commande` (`id`, `dateCreation`, `tva`, `acheteur_id`) VALUES
(1, '2016-03-08', 20.00, 1),
(2, '2015-12-10', 20.00, 2),
(3, '2016-02-09', 20.00, 1),
(4, '2015-12-02', 20.00, 4),
(5, '2016-01-25', 20.00, 5),
(6, '2016-03-15', 20.00, 3),
(7, '2016-04-01', 20.00, 5),
(8, '2016-02-13', 20.00, 3),
(9, '2015-10-09', 20.00, 3),
(10, '2016-01-28', 20.00, 2);

-- --------------------------------------------------------

--
-- Contenu de la table `marque`
--

INSERT INTO `marque` (`id`, `nom`, `adresse_id`, `tel`, `fax`, `mail`, `description`, `valide`) VALUES
(1, 'tamiya', 1, '542865105', '542865107', 'contact@tamiya.com', 'Spécialiste japonais dU modèle réduit', 1),
(2, 'kyosho', 7, '12009876', '12006987', 'contact@kyosho.com', 'Spécialiste du modèle réduit radiocommandé connu pour la fiabilité de ces voitures.', 1);


--
-- Contenu de la table `produit`
--

INSERT INTO `produit` (`id`, `marque_id`, `nom`, `prix`, `description`) VALUES
(1, 2, 'marteau', 5.99, 'Tape pas les doigts'),
(12, 2, 'tournevis plat', 3.99, 'tourne des vis dans un sens ou dans l\'autre.'),
(13, 1, 'ciseau à bois', 2.98, 'coupe des copeaux de bois'),
(14, 2, 'ciseaux tout court', 3.50, 'ca coupe, attention au doigts'),
(15, 2, 'mini-cutter', 4.25, 'fait des mini-coupe'),
(16, 2, 'pousse-pointes', 14.50, 'pousse des mini clou dans des mini objet'),
(17, 1, 'pistolet à colle', 3.75, 'pousse des baton de colle qui brule'),
(18, 1, 'pince coupante', 9.80, 'une pince qui coupe ou qui pince.'),
(19, 2, 'tournevis cruciforme', 2.50, 'tourne des vis mais à une forme différente.'),
(20, 1, 'jeux de clé à laine', 8.99, 'ensemble de mini clé.'),
(21, 1, 'papier de verre 2000', 5.55, 'papier de verre très fin'),
(32, 2, 'beige vert', 3.99, 'on dirait du beige mais ce n\'est pas du beige.'),
(33, 2, 'beige', 3.99, 'ça c\'est du beige'),
(34, 1, 'jaune sable', 3.99, 'Un jaune comme le sable, bref du beige quoi.'),
(35, 2, 'Jaune de sécurité', 3.99, 'LE Jaune, fait avec de la poudre d\'or.'),
(36, 1, 'Jaune or', 3.99, 'Le jaune qui se mange....ou pas.'),
(37, 2, 'Jaune miel', 3.99, 'Le jaune qui se mange....ou pas.'),
(38, 1, 'Jaune mais', 3.99, 'Comme le jaune miel mais en moins sucré.'),
(39, 1, 'blue pigeon', 99.00, 'Le vrai bleu je te dis, il vaut bien ce prix la.'),
(40, 1, 'gris silex', 3.99, 'La plus vielle et la plus rustique des couleurs.'),
(41, 2, 'rouge brillant', 3.99, 'Est du rouge ou du sang?'),
(42, 2, 'l\'atlantis de ma jeunesse', 99.00, 'un super vaisseau'),
(43, 2, 'austin mini', 59.99, 'la meilleure voiture'),
(44, 2, 'Nautilus', 69.99, 'un célèbre sous-marin'),
(45, 1, 'Odysseus', 79.99, 'Il vole, mais pas en vrai'),
(46, 2, 'Penduick II', 119.00, 'le bateau qui à fait le tour du monde'),
(47, 2, 'Primagaze 1994', 89.99, 'Le vainqueur de la route du rhum. Ce sont des salauds.'),
(48, 2, 'racing team mk2', 99.00, 'un buggy de rally polyvalent.'),
(49, 2, 'Macross YF-19', 68.00, 'un avion transformable en robot'),
(50, 1, 'Macross YF-21', 68.00, 'Un avon transformable en robot et gerwalk.'),
(51, 2, 'hydrofoam', 98.00, 'un bateau qui vole.'),
(62, 2, 'San goku', 9.99, 'sait tout faire'),
(63, 2, 'Ryo Saeba', 9.99, 'conducteur de l\'austin mini, mais pas que.'),
(64, 1, 'Albator', 9.99, 'Capitaine de l\'atlantis'),
(65, 2, 'Larray daifaisse', 9.99, 'Skipper du primagaz.'),
(66, 2, 'Eric Tabarly', 9.99, 'Un des meilleurs marin de sa génération.'),
(67, 2, 'Laurent Bourgnon', 9.99, 'Il va bien avec son bateau, mais sait conduire une voiture.'),
(68, 2, 'Ulysse 31', 9.99, 'C\'est le même Ulysse que l\'odyssé, mais pas à la même époque.'),
(69, 1, 'Isamu Dyson', 9.99, 'Pilote d\'essai du YF_19.'),
(70, 2, 'Guld Bowman', 9.99, 'Pilote d\'essai du YF_21'),
(71, 1, 'sebastien Loeb', 9.99, 'pilote de rally');

--
-- Contenu de la table `commander`
--

INSERT INTO `commander` (`produit_id`, `commande_id`) VALUES
(1, 1),
(15, 1),
(33, 1),
(44, 1),
(65, 1),
(39, 2),
(51, 2),
(69, 2),
(16, 3),
(46, 3),
(66, 3),
(49, 4),
(69, 4),
(41, 5),
(43, 5),
(63, 5),
(42, 6),
(64, 6),
(48, 7),
(51, 8),
(15, 9),
(17, 9),
(21, 9),
(40, 9),
(34, 10),
(37, 10),
(39, 10);

-- --------------------------------------------------------



-- --------------------------------------------------------

--
-- Contenu de la table `taille`
--

INSERT INTO `taille` (`id`, `echelle`) VALUES
(1, '1/4'),
(2, '1/8'),
(3, '1/10'),
(4, '1/15'),
(5, '1/20'),
(6, '1/50'),
(7, '1/60'),
(8, '1/70'),
(9, '1/80'),
(10, '1/100');

--
-- Contenu de la table `figurine`
--

INSERT INTO `figurine` (`produit_id`, `taille_id`) VALUES
(65, 2),
(62, 3),
(63, 3),
(64, 3),
(66, 3),
(67, 3),
(68, 3),
(69, 3),
(70, 3);

-- --------------------------------------------------------

--
-- Contenu de la table `maquette`
--

INSERT INTO `maquette` (`produit_id`, `rc`, `taille_id`) VALUES
(42, 0, 5),
(43, 1, 2),
(44, 0, 6),
(45, 0, 9),
(46, 1, 4),
(47, 1, 4),
(48, 1, 2),
(49, 1, 3),
(50, 1, 3),
(51, 1, 2);

-- --------------------------------------------------------

--
-- Contenu de la table `materiaux`
--

INSERT INTO `materiaux` (`id`, `nom`) VALUES
(1, 'Plastique'),
(2, 'Bois'),
(3, 'Métal'),
(4, 'Mixte');

--
-- Contenu de la table `maquette_has_materiaux`
--

INSERT INTO `maquette_has_materiaux` (`materiaux_id`, `maquette_produit_id`) VALUES
(1, 42),
(1, 44),
(1, 45),
(1, 51),
(2, 46),
(3, 49),
(3, 50),
(4, 43),
(4, 47),
(4, 48);

-- --------------------------------------------------------


-- --------------------------------------------------------



-- --------------------------------------------------------

--
-- Contenu de la table `outils`
--

INSERT INTO `outils` (`produit_id`) VALUES
(1),
(12),
(13),
(14),
(15),
(16),
(17),
(18),
(19),
(20),
(21);

-- --------------------------------------------------------



-- --------------------------------------------------------
--
-- Contenu de la table `peinture`
--

INSERT INTO `peinture` (`produit_id`, `ral`) VALUES
(32, '1000'),
(33, '1001'),
(34, '1002'),
(35, '1003'),
(36, '1004'),
(37, '1005'),
(38, '1006'),
(39, '5014'),
(40, '7032'),
(41, '3024');

-- --------------------------------------------------------



-- --------------------------------------------------------

--
-- Contenu de la table `produit_has_categorie`
--

INSERT INTO `produit_has_categorie` (`produit_id`, `categorie_id`) VALUES
(42, 1),
(45, 1),
(49, 1),
(50, 1),
(51, 1),
(64, 1),
(69, 1),
(70, 1),
(43, 2),
(48, 2),
(49, 2),
(50, 2),
(62, 2),
(63, 2),
(69, 2),
(70, 2),
(71, 2),
(46, 3),
(47, 3),
(51, 3),
(66, 3),
(44, 4),
(65, 4);

-- --------------------------------------------------------



-- --------------------------------------------------------

--
-- Contenu de la table `utiliser`
--

INSERT INTO `utiliser` (`materiaux_id`, `outils_produit_id`) VALUES
(2, 13),
(2, 17),
(4, 1),
(4, 12),
(4, 14),
(4, 15),
(4, 16),
(4, 18),
(4, 19),
(4, 20);

-- --------------------------------------------------------


-- --------------------------------------------------------

--

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
