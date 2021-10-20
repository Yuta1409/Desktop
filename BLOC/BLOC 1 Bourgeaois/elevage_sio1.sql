-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mar. 05 oct. 2021 à 15:16
-- Version du serveur :  8.0.21
-- Version de PHP : 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `elevage_sio1`
--

-- --------------------------------------------------------

--
-- Structure de la table `adoption`
--

DROP TABLE IF EXISTS `adoption`;
CREATE TABLE IF NOT EXISTS `adoption` (
  `client_id` smallint UNSIGNED NOT NULL,
  `animal_id` smallint UNSIGNED NOT NULL,
  `date_reservation` date NOT NULL,
  `date_adoption` date DEFAULT NULL,
  `prix` decimal(7,2) UNSIGNED NOT NULL,
  `paye` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`client_id`,`animal_id`),
  UNIQUE KEY `ind_uni_animal_id` (`animal_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `adoption`
--

INSERT INTO `adoption` (`client_id`, `animal_id`, `date_reservation`, `date_adoption`, `prix`, `paye`) VALUES
(1, 8, '2012-05-21', NULL, '735.00', 1),
(1, 39, '2008-08-17', '2008-08-17', '735.00', 1),
(1, 40, '2008-08-17', '2008-08-17', '735.00', 1),
(2, 3, '2011-03-12', '2011-03-12', '835.00', 1),
(2, 18, '2008-06-04', '2008-06-04', '485.00', 1),
(3, 27, '2009-11-17', '2009-11-17', '200.00', 1),
(4, 26, '2007-02-21', '2007-02-21', '485.00', 1),
(4, 41, '2007-02-21', '2007-02-21', '835.00', 1),
(5, 21, '2009-03-08', '2009-03-08', '200.00', 1),
(6, 16, '2010-01-27', '2010-01-27', '200.00', 1),
(7, 5, '2011-04-05', '2011-04-05', '150.00', 1),
(8, 42, '2008-08-16', '2008-08-16', '735.00', 1),
(9, 38, '2007-02-11', '2007-02-11', '985.00', 1),
(9, 55, '2011-02-13', '2011-02-13', '140.00', 1),
(9, 59, '2012-05-22', NULL, '700.00', 0),
(10, 49, '2010-08-17', '2010-08-17', '140.00', 0),
(11, 32, '2008-08-17', '2010-03-09', '140.00', 1),
(11, 62, '2011-03-01', '2011-03-01', '630.00', 0),
(12, 15, '2012-05-22', NULL, '200.00', 1),
(12, 69, '2007-09-20', '2007-09-20', '10.00', 1),
(12, 75, '2012-05-21', NULL, '10.00', 0),
(13, 57, '2012-01-10', '2012-01-10', '700.00', 1),
(14, 58, '2012-02-25', '2012-02-25', '700.00', 1),
(15, 30, '2008-08-17', '2008-08-17', '735.00', 1);

-- --------------------------------------------------------

--
-- Structure de la table `animal`
--

DROP TABLE IF EXISTS `animal`;
CREATE TABLE IF NOT EXISTS `animal` (
  `id` smallint UNSIGNED NOT NULL AUTO_INCREMENT,
  `sexe` char(1) DEFAULT NULL,
  `date_naissance` datetime NOT NULL,
  `nom` varchar(30) DEFAULT NULL,
  `commentaires` text,
  `espece_id` smallint UNSIGNED NOT NULL,
  `race_id` smallint UNSIGNED DEFAULT NULL,
  `mere_id` smallint UNSIGNED DEFAULT NULL,
  `pere_id` smallint UNSIGNED DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ind_uni_nom_espece_id` (`nom`,`espece_id`),
  KEY `fk_race_id` (`race_id`),
  KEY `fk_mere_id` (`mere_id`),
  KEY `fk_pere_id` (`pere_id`),
  KEY `fk_espece_id` (`espece_id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `animal`
--

INSERT INTO `animal` (`id`, `sexe`, `date_naissance`, `nom`, `commentaires`, `espece_id`, `race_id`, `mere_id`, `pere_id`) VALUES
(1, 'M', '2010-04-05 13:43:00', 'Rox', 'Mordille beaucoup', 1, 1, 18, 22),
(2, NULL, '2010-03-24 02:23:00', 'Roucky', NULL, 2, NULL, 40, 30),
(3, 'F', '2010-09-13 15:02:00', 'Schtroumpfette', NULL, 2, 4, 41, 31),
(4, 'F', '2009-08-03 05:12:00', NULL, 'Bestiole avec une carapace très dure', 3, NULL, NULL, NULL),
(5, NULL, '2010-10-03 16:44:00', 'Choupi', 'Né sans oreille gauche', 2, NULL, NULL, NULL),
(6, 'F', '2009-06-13 08:17:00', 'Bobosse', 'Carapace bizarre', 3, NULL, NULL, NULL),
(7, 'F', '2008-12-06 05:18:00', 'Caroline', NULL, 1, 2, NULL, NULL),
(8, 'M', '2008-09-11 15:38:00', 'Bagherra', NULL, 2, 5, NULL, NULL),
(9, NULL, '2010-08-23 05:18:00', NULL, 'Bestiole avec une carapace très dure', 3, NULL, NULL, NULL),
(10, 'M', '2010-07-21 15:41:00', 'Bobo', 'Petit pour son âge', 1, NULL, 18, 21),
(11, 'F', '2008-02-20 15:45:00', 'Canaille', NULL, 1, NULL, NULL, NULL),
(12, 'F', '2009-05-26 08:54:00', 'Cali', NULL, 1, 2, NULL, NULL),
(13, 'F', '2007-04-24 12:54:00', 'Rouquine', NULL, 1, 1, NULL, NULL),
(14, 'F', '2009-05-26 08:56:00', 'Fila', NULL, 1, 2, NULL, NULL),
(15, 'F', '2008-02-20 15:47:00', 'Anya', NULL, 1, NULL, NULL, NULL),
(16, 'F', '2009-05-26 08:50:00', 'Louya', NULL, 1, NULL, NULL, NULL),
(17, 'F', '2008-03-10 13:45:00', 'Welva', NULL, 1, NULL, NULL, NULL),
(18, 'F', '2007-04-24 12:59:00', 'Zira', NULL, 1, 1, NULL, NULL),
(19, 'F', '2009-05-26 09:02:00', 'Java', NULL, 1, 2, NULL, NULL),
(20, NULL, '2007-04-24 12:45:00', 'Balou', NULL, 1, 1, NULL, NULL),
(21, 'F', '2008-03-10 13:43:00', 'Pataude', NULL, 1, NULL, NULL, NULL),
(22, 'M', '2007-04-24 12:42:00', 'Bouli', NULL, 1, 1, NULL, NULL),
(24, 'M', '2007-04-12 05:23:00', 'Cartouche', NULL, 1, NULL, NULL, NULL),
(25, 'M', '2006-05-14 15:50:00', 'Zambo', NULL, 1, 1, NULL, NULL),
(26, 'M', '2006-05-14 15:48:00', 'Samba', NULL, 1, 1, NULL, NULL),
(27, 'M', '2008-03-10 13:40:00', 'Moka', NULL, 1, NULL, NULL, NULL),
(28, 'M', '2006-05-14 15:40:00', 'Pilou', NULL, 1, 1, NULL, NULL),
(29, 'M', '2009-05-14 06:30:00', 'Fiero', NULL, 2, 3, NULL, NULL),
(30, 'M', '2007-03-12 12:05:00', 'Zonko', NULL, 2, 5, NULL, NULL),
(31, 'M', '2008-02-20 15:45:00', 'Filou', NULL, 2, 4, NULL, NULL),
(32, 'M', '2009-07-26 11:52:00', 'Spoutnik', NULL, 3, NULL, 52, NULL),
(33, 'M', '2006-05-19 16:17:00', 'Caribou', NULL, 2, 4, NULL, NULL),
(34, 'M', '2008-04-20 03:22:00', 'Capou', NULL, 2, 5, NULL, NULL),
(35, 'M', '2006-05-19 16:56:00', 'Raccou', 'Pas de queue depuis la naissance', 2, 4, NULL, NULL),
(36, 'M', '2009-05-14 06:42:00', 'Boucan', NULL, 2, 3, NULL, NULL),
(37, 'F', '2006-05-19 16:06:00', 'Callune', NULL, 2, 8, NULL, NULL),
(38, 'F', '2009-05-14 06:45:00', 'Boule', NULL, 2, 3, NULL, NULL),
(39, 'F', '2008-04-20 03:26:00', 'Zara', NULL, 2, 5, NULL, NULL),
(40, 'F', '2007-03-12 12:00:00', 'Milla', NULL, 2, 5, NULL, NULL),
(41, 'F', '2006-05-19 15:59:00', 'Feta', NULL, 2, 4, NULL, NULL),
(42, 'F', '2008-04-20 03:20:00', 'Bilba', 'Sourde de l\'oreille droite à 80%', 2, 5, NULL, NULL),
(43, 'F', '2007-03-12 11:54:00', 'Cracotte', NULL, 2, 5, NULL, NULL),
(44, 'F', '2006-05-19 16:16:00', 'Cawette', NULL, 2, 8, NULL, NULL),
(45, 'F', '2007-04-01 18:17:00', 'Nikki', 'Bestiole avec une carapace très dure', 3, NULL, NULL, NULL),
(46, 'F', '2009-03-24 08:23:00', 'Tortilla', 'Bestiole avec une carapace très dure', 3, NULL, NULL, NULL),
(48, 'F', '2006-03-15 14:56:00', 'Lulla', 'Bestiole avec une carapace très dure', 3, NULL, NULL, NULL),
(49, 'F', '2008-03-15 12:02:00', 'Dana', 'Bestiole avec une carapace très dure', 3, NULL, NULL, NULL),
(50, 'F', '2009-05-25 19:57:00', 'Cheli', 'Bestiole avec une carapace très dure', 3, NULL, NULL, NULL),
(51, 'F', '2007-04-01 03:54:00', 'Chicaca', 'Bestiole avec une carapace très dure', 3, NULL, NULL, NULL),
(52, 'F', '2006-03-15 14:26:00', 'Redbul', 'Insomniaque', 3, NULL, NULL, NULL),
(54, 'M', '2008-03-16 08:20:00', 'Bubulle', 'Bestiole avec une carapace très dure', 3, NULL, NULL, NULL),
(55, 'M', '2008-03-15 18:45:00', 'Relou', 'Surpoids', 3, NULL, NULL, NULL),
(56, 'M', '2009-05-25 18:54:00', 'Bulbizard', 'Bestiole avec une carapace très dure', 3, NULL, NULL, NULL),
(57, 'M', '2007-03-04 19:36:00', 'Safran', 'Coco veut un gâteau !', 4, NULL, NULL, NULL),
(58, 'M', '2008-02-20 02:50:00', 'Gingko', 'Coco veut un gâteau !', 4, NULL, NULL, NULL),
(59, 'M', '2009-03-26 08:28:00', 'Bavard', 'Coco veut un gâteau !', 4, NULL, NULL, NULL),
(60, 'F', '2009-03-26 07:55:00', 'Parlotte', 'Coco veut un gâteau !', 4, NULL, NULL, NULL),
(61, 'M', '2010-11-09 00:00:00', 'Yoda', NULL, 2, 5, NULL, NULL),
(62, 'M', '2010-11-05 00:00:00', 'Pipo', NULL, 1, 9, NULL, NULL),
(69, 'F', '2012-02-13 15:45:00', 'Baba', NULL, 5, NULL, NULL, NULL),
(70, 'M', '2012-02-13 15:48:00', 'Bibo', 'Agressif', 5, NULL, 72, 73),
(72, 'F', '2008-02-01 02:25:00', 'Momy', NULL, 5, NULL, NULL, NULL),
(73, 'M', '2007-03-11 12:45:00', 'Popi', NULL, 5, NULL, NULL, NULL),
(75, 'F', '2007-03-12 22:03:00', 'Mimi', NULL, 5, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

DROP TABLE IF EXISTS `client`;
CREATE TABLE IF NOT EXISTS `client` (
  `id` smallint UNSIGNED NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) NOT NULL,
  `prenom` varchar(60) NOT NULL,
  `adresse` varchar(200) DEFAULT NULL,
  `code_postal` varchar(6) DEFAULT NULL,
  `ville` varchar(60) DEFAULT NULL,
  `pays` varchar(60) DEFAULT NULL,
  `email` varbinary(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ind_uni_email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`id`, `nom`, `prenom`, `adresse`, `code_postal`, `ville`, `pays`, `email`) VALUES
(1, 'Dupont', 'Jean', 'Rue du Centre, 5', '45810', 'Houtsiplou', 'France', 0x6a65616e2e6475706f6e7440656d61696c2e636f6d),
(2, 'Boudur', 'Marie', 'Place de la Gare, 2', '35840', 'Troudumonde', 'France', 0x6d617269652e626f7564757240656d61696c2e636f6d),
(3, 'Trachon', 'Fleur', 'Rue haute, 54b', '3250', 'Belville', 'Belgique', 0x666c65757274726163686f6e40656d61696c2e636f6d),
(4, 'Van Piperseel', 'Julien', NULL, NULL, NULL, NULL, 0x6a65616e767040656d61696c2e636f6d),
(5, 'Nouvel', 'Johan', NULL, NULL, NULL, 'Suisse', 0x6a6f68616e65747069726c6f75697440656d61696c2e636f6d),
(6, 'Germain', 'Frank', NULL, NULL, NULL, NULL, 0x6672616e636f69736765726d61696e40656d61696c2e636f6d),
(7, 'Antoine', 'Maximilien', 'Rue Moineau, 123', '4580', 'Trocoul', 'Belgique', 0x6d61782e616e746f696e6540656d61696c2e636f6d),
(8, 'Di Paolo', 'Hector', NULL, NULL, NULL, 'Suisse', 0x686563746f72646970616f40656d61696c2e636f6d),
(9, 'Corduro', 'Anaelle', NULL, NULL, NULL, NULL, 0x616e612e636f726475726f40656d61696c2e636f6d),
(10, 'Faluche', 'Eline', 'Avenue circulaire, 7', '45870', 'Garduche', 'France', 0x656c696e6566616c7563686540656d61696c2e636f6d),
(11, 'Penni', 'Carine', 'Boulevard Haussman, 85', '1514', 'Plasse', 'Suisse', 0x6370656e6e6940656d61696c2e636f6d),
(12, 'Broussaille', 'Virginie', 'Rue du Fleuve, 18', '45810', 'Houtsiplou', 'France', 0x766962726f757361696c6c6540656d61696c2e636f6d),
(13, 'Durant', 'Hannah', 'Rue des Pendus, 66', '1514', 'Plasse', 'Suisse', 0x6868647572616e7440656d61696c2e636f6d),
(14, 'Delfour', 'Elodie', 'Rue de Flore, 1', '3250', 'Belville', 'Belgique', 0x652e64656c666f757240656d61696c2e636f6d),
(15, 'Kestau', 'Joel', NULL, NULL, NULL, NULL, 0x6a6f656c2e6b657374617540656d61696c2e636f6d);

-- --------------------------------------------------------

--
-- Structure de la table `espece`
--

DROP TABLE IF EXISTS `espece`;
CREATE TABLE IF NOT EXISTS `espece` (
  `id` smallint UNSIGNED NOT NULL AUTO_INCREMENT,
  `nom_courant` varchar(40) NOT NULL,
  `nom_latin` varchar(40) NOT NULL,
  `description` text,
  `prix` decimal(7,2) UNSIGNED DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nom_latin` (`nom_latin`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `espece`
--

INSERT INTO `espece` (`id`, `nom_courant`, `nom_latin`, `description`, `prix`) VALUES
(1, 'Chien', 'Canis canis', 'Bestiole à quatre pattes qui aime les caresses et tire souvent la langue', '200.00'),
(2, 'Chat', 'Felis silvestris', 'Bestiole à quatre pattes qui saute très haut et grimpe aux arbres', '150.00'),
(3, 'Tortue d\'Hermann', 'Testudo hermanni', 'Bestiole avec une carapace très dure', '140.00'),
(4, 'Perroquet amazone', 'Alipiopsitta xanthops', 'Joli oiseau parleur vert et jaune', '700.00'),
(5, 'Rat brun', 'Rattus norvegicus', 'Petite bestiole avec de longues moustaches et une longue queue sans poils', '10.00');

-- --------------------------------------------------------

--
-- Structure de la table `race`
--

DROP TABLE IF EXISTS `race`;
CREATE TABLE IF NOT EXISTS `race` (
  `id` smallint UNSIGNED NOT NULL AUTO_INCREMENT,
  `nom` varchar(40) NOT NULL,
  `espece_id` smallint UNSIGNED NOT NULL,
  `description` text,
  `prix` decimal(7,2) UNSIGNED DEFAULT NULL,
  `date_insertion` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_race_espece_id` (`espece_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `race`
--

INSERT INTO `race` (`id`, `nom`, `espece_id`, `description`, `prix`, `date_insertion`) VALUES
(1, 'Berger allemand', 1, 'Chien sportif et élégant au pelage dense, noir-marron-fauve, noir ou gris.', '485.00', '2012-05-21 00:53:36'),
(2, 'Berger blanc suisse', 1, 'Petit chien au corps compact, avec des pattes courtes mais bien proportionnées et au pelage tricolore ou bicolore.', '935.00', '2012-05-21 00:53:36'),
(3, 'Singapura', 2, 'Chat de petite taille aux grands yeux en amandes.', '985.00', '2012-05-21 00:53:36'),
(4, 'Bleu russe', 2, 'Chat aux yeux verts et à la robe épaisse et argentée.', '835.00', '2012-05-21 00:53:36'),
(5, 'Maine coon', 2, 'Chat de grande taille, à poils mi-longs.', '735.00', '2012-05-21 00:53:36'),
(7, 'Sphynx', 2, 'Chat sans poils.', '1235.00', '2012-05-21 00:53:36'),
(8, 'Nebelung', 2, 'Chat bleu russe, mais avec des poils longs...', '985.00', '2012-05-21 00:53:36'),
(9, 'Rottweiller', 1, 'Chien d\'apparence solide, bien musclé, à la robe noire avec des taches feu bien délimitées.', '630.00', '2012-05-21 00:53:36'),
(10, 'Yorkshire terrier', 1, 'Chien de petite taille au pelage long et soyeux de couleur bleu et feu.', '700.00', '2012-05-22 00:58:25');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `adoption`
--
ALTER TABLE `adoption`
  ADD CONSTRAINT `fk_adoption_animal_id` FOREIGN KEY (`animal_id`) REFERENCES `animal` (`id`),
  ADD CONSTRAINT `fk_client_id` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`);

--
-- Contraintes pour la table `animal`
--
ALTER TABLE `animal`
  ADD CONSTRAINT `fk_espece_id` FOREIGN KEY (`espece_id`) REFERENCES `espece` (`id`),
  ADD CONSTRAINT `fk_mere_id` FOREIGN KEY (`mere_id`) REFERENCES `animal` (`id`),
  ADD CONSTRAINT `fk_pere_id` FOREIGN KEY (`pere_id`) REFERENCES `animal` (`id`),
  ADD CONSTRAINT `fk_race_id` FOREIGN KEY (`race_id`) REFERENCES `race` (`id`);

--
-- Contraintes pour la table `race`
--
ALTER TABLE `race`
  ADD CONSTRAINT `fk_race_espece_id` FOREIGN KEY (`espece_id`) REFERENCES `espece` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
