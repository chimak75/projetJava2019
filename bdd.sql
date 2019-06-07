-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  ven. 07 juin 2019 à 14:35
-- Version du serveur :  5.7.21
-- Version de PHP :  7.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `java2019`
--

-- --------------------------------------------------------

--
-- Structure de la table `annéescolaire`
--

DROP TABLE IF EXISTS `annéescolaire`;
CREATE TABLE IF NOT EXISTS `annéescolaire` (
  `ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `annéescolaire`
--

INSERT INTO `annéescolaire` (`ID`) VALUES
(2018),
(2019);

-- --------------------------------------------------------

--
-- Structure de la table `bulletin`
--

DROP TABLE IF EXISTS `bulletin`;
CREATE TABLE IF NOT EXISTS `bulletin` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `appréciation` varchar(255) NOT NULL,
  `trimestre` int(11) NOT NULL,
  `inscription` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `bulletin`
--

INSERT INTO `bulletin` (`ID`, `appréciation`, `trimestre`, `inscription`) VALUES
(1, 'Bon élève, Travailleur', 1, 1),
(2, 'Faits de gros efforts', 2, 1),
(3, 'Felicitations!', 3, 1);

-- --------------------------------------------------------

--
-- Structure de la table `classe`
--

DROP TABLE IF EXISTS `classe`;
CREATE TABLE IF NOT EXISTS `classe` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(10) NOT NULL,
  `niveau` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `classe`
--

INSERT INTO `classe` (`ID`, `nom`, `niveau`) VALUES
(1, 'CP A', 1);

-- --------------------------------------------------------

--
-- Structure de la table `detailbulletin`
--

DROP TABLE IF EXISTS `detailbulletin`;
CREATE TABLE IF NOT EXISTS `detailbulletin` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `appréciation` varchar(255) NOT NULL,
  `bulletin` int(11) NOT NULL,
  `enseignement` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `detailbulletin`
--

INSERT INTO `detailbulletin` (`ID`, `appréciation`, `bulletin`, `enseignement`) VALUES
(1, 'Eleve sérieux', 1, 1),
(2, 'De bons efforts', 2, 1);

-- --------------------------------------------------------

--
-- Structure de la table `discipline`
--

DROP TABLE IF EXISTS `discipline`;
CREATE TABLE IF NOT EXISTS `discipline` (
  `ID` int(11) NOT NULL,
  `nom` varchar(20) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `discipline`
--

INSERT INTO `discipline` (`ID`, `nom`) VALUES
(1, 'Physique');

-- --------------------------------------------------------

--
-- Structure de la table `enseignement`
--

DROP TABLE IF EXISTS `enseignement`;
CREATE TABLE IF NOT EXISTS `enseignement` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `enseignant` int(11) NOT NULL,
  `classe` int(11) NOT NULL,
  `discipline` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `enseignement`
--

INSERT INTO `enseignement` (`ID`, `enseignant`, `classe`, `discipline`) VALUES
(1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `evaluation`
--

DROP TABLE IF EXISTS `evaluation`;
CREATE TABLE IF NOT EXISTS `evaluation` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `note` float NOT NULL,
  `appréciation` varchar(255) NOT NULL,
  `detail` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `evaluation`
--

INSERT INTO `evaluation` (`ID`, `note`, `appréciation`, `detail`) VALUES
(1, 10.5, 'Bof', 1),
(2, 18.5, 'Bravo!', 1);

-- --------------------------------------------------------

--
-- Structure de la table `inscription`
--

DROP TABLE IF EXISTS `inscription`;
CREATE TABLE IF NOT EXISTS `inscription` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `élève` int(11) NOT NULL,
  `classe` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `inscription`
--

INSERT INTO `inscription` (`ID`, `élève`, `classe`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `niveau`
--

DROP TABLE IF EXISTS `niveau`;
CREATE TABLE IF NOT EXISTS `niveau` (
  `ID` int(11) NOT NULL,
  `nom` varchar(5) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `personne`
--

DROP TABLE IF EXISTS `personne`;
CREATE TABLE IF NOT EXISTS `personne` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(25) NOT NULL,
  `prénom` varchar(25) NOT NULL,
  `enseignant` int(11) NOT NULL,
  `élève` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `personne`
--

INSERT INTO `personne` (`ID`, `nom`, `prénom`, `enseignant`, `élève`) VALUES
(1, 'Jean', 'Valou', 0, 1),
(2, 'Valjean', 'Jean', 1, 0);

-- --------------------------------------------------------

--
-- Structure de la table `trimestre`
--

DROP TABLE IF EXISTS `trimestre`;
CREATE TABLE IF NOT EXISTS `trimestre` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `numéro` int(11) NOT NULL,
  `début` int(11) NOT NULL,
  `fin` int(11) NOT NULL,
  `annéescolaire` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `trimestre`
--

INSERT INTO `trimestre` (`ID`, `numéro`, `début`, `fin`, `annéescolaire`) VALUES
(1, 1, 9, 12, 2018),
(2, 2, 12, 3, 2018),
(3, 3, 3, 6, 2018);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
