-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  mar. 07 avr. 2020 à 00:32
-- Version du serveur :  5.7.26
-- Version de PHP :  7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `pwebcbdd`
--

-- --------------------------------------------------------

--
-- Structure de la table `carte`
--

DROP TABLE IF EXISTS `carte`;
CREATE TABLE IF NOT EXISTS `carte` (
  `idCarte` int(11) NOT NULL AUTO_INCREMENT,
  `LabelCarte` varchar(100) NOT NULL,
  `idUtilisateur` int(11) NOT NULL,
  PRIMARY KEY (`idCarte`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `carte`
--

INSERT INTO `carte` (`idCarte`, `LabelCarte`, `idUtilisateur`) VALUES
(1, 'CarteTransports', 6),
(3, 'RoadMap', 5),
(4, 'NomCarte', 6),
(9, 'hiha', 9);

-- --------------------------------------------------------

--
-- Structure de la table `layer`
--

DROP TABLE IF EXISTS `layer`;
CREATE TABLE IF NOT EXISTS `layer` (
  `idLayer` int(11) NOT NULL AUTO_INCREMENT,
  `LabelLayer` varchar(11) NOT NULL,
  `idCarte` int(11) NOT NULL,
  PRIMARY KEY (`idLayer`),
  KEY `FK_idCarte` (`idCarte`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `layer`
--

INSERT INTO `layer` (`idLayer`, `LabelLayer`, `idCarte`) VALUES
(1, 'Transport', 1);

-- --------------------------------------------------------

--
-- Structure de la table `marqueurs`
--

DROP TABLE IF EXISTS `marqueurs`;
CREATE TABLE IF NOT EXISTS `marqueurs` (
  `idMarqueur` int(11) NOT NULL AUTO_INCREMENT,
  `LabelMarqueur` varchar(100) DEFAULT NULL,
  `LattitudeMarqueur` double NOT NULL,
  `LongitudeMarqueur` double NOT NULL,
  `idCarte` int(11) NOT NULL,
  `iconUrl` varchar(100) NOT NULL,
  PRIMARY KEY (`idMarqueur`),
  KEY `FK_IdCarteMarqueurs` (`idCarte`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `marqueurs`
--

INSERT INTO `marqueurs` (`idMarqueur`, `LabelMarqueur`, `LattitudeMarqueur`, `LongitudeMarqueur`, `idCarte`, `iconUrl`) VALUES
(23, NULL, 48.864940612458, 2.2446441650391, 1, 'https://img.icons8.com/clouds/100/000000/cloud-network.png'),
(22, NULL, 48.833085609348, 2.4269485473633, 1, 'https://img.icons8.com/clouds/100/000000/cloud-network.png'),
(18, NULL, 48.867199062954, 2.1694564819336, 3, 'https://img.icons8.com/clouds/100/000000/cloud-network.png'),
(19, NULL, 48.863585493236, 2.2147750854492, 3, 'https://img.icons8.com/clouds/100/000000/cloud-network.png'),
(20, NULL, 48.863133778674, 2.1965789794922, 3, 'https://img.icons8.com/clouds/100/000000/cloud-network.png'),
(21, NULL, 48.865618158309, 2.2491073608398, 3, 'https://img.icons8.com/clouds/100/000000/cloud-network.png'),
(24, NULL, 48.860875144709, 2.3445510864258, 1, 'https://img.icons8.com/color/64/000000/home.png'),
(26, NULL, 48.884585717855, 2.5431203842163, 6, 'https://img.icons8.com/color/64/000000/map-pokemon.png'),
(27, NULL, 48.855228113857, 2.2618103027344, 6, 'https://img.icons8.com/color/64/000000/user-location.png'),
(28, NULL, 48.898806668202, 2.277946472168, 6, 'https://img.icons8.com/color/64/000000/map-pin.png');

-- --------------------------------------------------------

--
-- Structure de la table `partage`
--

DROP TABLE IF EXISTS `partage`;
CREATE TABLE IF NOT EXISTS `partage` (
  `idPartage` int(11) NOT NULL AUTO_INCREMENT,
  `idCarte` int(11) NOT NULL,
  `idEmetteur` int(11) NOT NULL,
  `idRecepteur` int(11) NOT NULL,
  PRIMARY KEY (`idPartage`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `partage`
--

INSERT INTO `partage` (`idPartage`, `idCarte`, `idEmetteur`, `idRecepteur`) VALUES
(1, 3, 5, 6),
(16, 1, 6, 1),
(14, 1, 6, 3),
(15, 1, 6, 5);

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

DROP TABLE IF EXISTS `utilisateur`;
CREATE TABLE IF NOT EXISTS `utilisateur` (
  `idUtilisateur` int(25) NOT NULL AUTO_INCREMENT,
  `pseudo` varchar(100) COLLATE utf8_bin NOT NULL,
  `email` varchar(75) COLLATE utf8_bin NOT NULL,
  `mdp` varchar(300) COLLATE utf8_bin NOT NULL COMMENT 'mot de passe',
  `bConnect` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`idUtilisateur`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`idUtilisateur`, `pseudo`, `email`, `mdp`, `bConnect`) VALUES
(1, 'test', 'malloga@hotmail.fr', '$2y$10$IkzoKYjjO8ZSf0GFWsKol.tDPvSCvvrxtXvgQQ00XKQuiFUAbpzNW', 0),
(3, 'adrien', 'test3@gmail.com', '$2y$10$SsS98BgHH0Ira922tjCtoOaIbABVfI6I9tOEr7GREnPYBZpI2yk5i', 0),
(5, 'yo', 'test5@gmail.com', '$2y$10$SghX4MRBuLfuFJER60qYy.1DkUyAcVAjxQPtIXfxH3Y0.it1CzQT.', 0),
(6, 'clem75', 'clementboutheg@gmail.com', '$2y$10$s1H8ZE58xwjTNaZrLltmyuu0uoOYwCIBQxgvfb0rL8WJEE/Bie6ty', 0),
(7, 'ohoh', 'ohoh@gmail.com', '$2y$10$laTRBPpigIK2CpRLf8rhU.XiZmsaaYxeuksM0PL8o/xjN6Ou5SrZO', 0),
(8, 'stimmy201', 'stimmy201@gmail.com', '$2y$10$phuECSF9bgwqTRyiWkf7Aej7QwbqoRnOfePNeEuEWjxGB1apyucsO', 0),
(9, 'test1', 'test1@gmail.com', '$2y$10$8sEHoYCCdwV74VYPIxxpGu5A.Sy0MXNwt9qoK.G/sGO7413rcmWXC', 0);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
