-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mar. 02 juil. 2024 à 18:32
-- Version du serveur : 5.7.40
-- Version de PHP : 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `feedbackforum`
--

-- --------------------------------------------------------

--
-- Structure de la table `comment`
--

DROP TABLE IF EXISTS `comment`;
CREATE TABLE IF NOT EXISTS `comment` (
  `COMMENT_ID` int(11) NOT NULL,
  `DESCRIPTION` text COLLATE utf8_bin NOT NULL,
  `CREATED_DATE` date NOT NULL,
  `UPDATED_DATE` date NOT NULL,
  `FEED_ID` int(11) NOT NULL,
  PRIMARY KEY (`COMMENT_ID`),
  UNIQUE KEY `COMMENT_FEEDBACK0_AK` (`FEED_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Structure de la table `course`
--

DROP TABLE IF EXISTS `course`;
CREATE TABLE IF NOT EXISTS `course` (
  `COURSE_ID` int(11) NOT NULL,
  `TITLE` varchar(50) COLLATE utf8_bin NOT NULL,
  `DESCRIPTION` text COLLATE utf8_bin NOT NULL,
  `CREATED_DATE` date NOT NULL,
  `UPDATED_DATE` date NOT NULL,
  `FEED_ID` int(11) NOT NULL,
  PRIMARY KEY (`COURSE_ID`),
  UNIQUE KEY `COURSE_FEEDBACK0_AK` (`FEED_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Structure de la table `divided_into`
--

DROP TABLE IF EXISTS `divided_into`;
CREATE TABLE IF NOT EXISTS `divided_into` (
  `SECTION_ID` int(11) NOT NULL,
  `FEED_ID` int(11) NOT NULL,
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ID`),
  KEY `DIVIDED_INTO_FEEDBACK1_FK` (`FEED_ID`),
  KEY `SECTION_ID` (`SECTION_ID`,`FEED_ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Structure de la table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
CREATE TABLE IF NOT EXISTS `feedback` (
  `FEED_ID` int(11) NOT NULL,
  `DESCRIPTION` text COLLATE utf8_bin NOT NULL,
  `GENERATED_DATE` date NOT NULL,
  `UPDATED_DATE` date NOT NULL,
  `COMMENT_ID` int(11) NOT NULL,
  `COURSE_ID` int(11) NOT NULL,
  PRIMARY KEY (`FEED_ID`),
  UNIQUE KEY `FEEDBACK_COMMENT0_AK` (`COMMENT_ID`),
  UNIQUE KEY `FEEDBACK_COURSE1_AK` (`COURSE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Structure de la table `manage`
--

DROP TABLE IF EXISTS `manage`;
CREATE TABLE IF NOT EXISTS `manage` (
  `FEED_ID` int(11) NOT NULL,
  `USER_ID` int(11) NOT NULL,
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ID`),
  KEY `MANAGE_USER1_FK` (`USER_ID`),
  KEY `FEED_ID` (`FEED_ID`,`USER_ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Structure de la table `question`
--

DROP TABLE IF EXISTS `question`;
CREATE TABLE IF NOT EXISTS `question` (
  `QUESTION_ID` int(11) NOT NULL,
  `TITLE` varchar(100) COLLATE utf8_bin NOT NULL,
  `DESCRIPTION` text COLLATE utf8_bin NOT NULL,
  `CREATED_DATE` date NOT NULL,
  `UPDATED_DATE` date NOT NULL,
  `SECTION_ID` int(11) NOT NULL,
  PRIMARY KEY (`QUESTION_ID`),
  KEY `QUESTION_SECTION0_FK` (`SECTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Structure de la table `response`
--

DROP TABLE IF EXISTS `response`;
CREATE TABLE IF NOT EXISTS `response` (
  `RESPONSE_ID` int(11) NOT NULL,
  `DESCRIPTION` text COLLATE utf8_bin NOT NULL,
  `CREATED_DATE` date NOT NULL,
  `UPDATED_DATE` date NOT NULL,
  `QUESTION_ID` int(11) NOT NULL,
  PRIMARY KEY (`RESPONSE_ID`),
  KEY `RESPONSE_QUESTION0_FK` (`QUESTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Structure de la table `role`
--

DROP TABLE IF EXISTS `role`;
CREATE TABLE IF NOT EXISTS `role` (
  `ROLE` int(11) NOT NULL,
  `TYPE` varchar(50) COLLATE utf8_bin NOT NULL,
  `DESCRIPTION` text COLLATE utf8_bin NOT NULL,
  `CREATED_DATE` date NOT NULL,
  `UPDATED_DATE` date NOT NULL,
  PRIMARY KEY (`ROLE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Structure de la table `section`
--

DROP TABLE IF EXISTS `section`;
CREATE TABLE IF NOT EXISTS `section` (
  `SECTION_ID` int(11) NOT NULL,
  `TITLE` varchar(100) COLLATE utf8_bin NOT NULL,
  `DESCRIPTION` text COLLATE utf8_bin NOT NULL,
  `CREATED_DATE` date NOT NULL,
  `UPDATED_DATE` date NOT NULL,
  PRIMARY KEY (`SECTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `USER_ID` int(11) NOT NULL,
  `FULLNAME` varchar(100) COLLATE utf8_bin NOT NULL,
  `LOGIN` varchar(50) COLLATE utf8_bin NOT NULL,
  `PASSWORD` varchar(50) COLLATE utf8_bin NOT NULL,
  `SPECIALITY` int(11) NOT NULL,
  `LEVEL` int(11) NOT NULL,
  `CREATED_DATE` date NOT NULL,
  `UPDATED_DATE` date NOT NULL,
  `ROLE` int(11) NOT NULL,
  PRIMARY KEY (`USER_ID`),
  KEY `USER_ROLE0_FK` (`ROLE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `COMMENT_FEEDBACK0_FK` FOREIGN KEY (`FEED_ID`) REFERENCES `feedback` (`FEED_ID`);

--
-- Contraintes pour la table `course`
--
ALTER TABLE `course`
  ADD CONSTRAINT `COURSE_FEEDBACK0_FK` FOREIGN KEY (`FEED_ID`) REFERENCES `feedback` (`FEED_ID`);

--
-- Contraintes pour la table `divided_into`
--
ALTER TABLE `divided_into`
  ADD CONSTRAINT `DIVIDED_INTO_FEEDBACK1_FK` FOREIGN KEY (`FEED_ID`) REFERENCES `feedback` (`FEED_ID`),
  ADD CONSTRAINT `DIVIDED_INTO_SECTION0_FK` FOREIGN KEY (`SECTION_ID`) REFERENCES `section` (`SECTION_ID`);

--
-- Contraintes pour la table `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `FEEDBACK_COMMENT0_FK` FOREIGN KEY (`COMMENT_ID`) REFERENCES `comment` (`COMMENT_ID`),
  ADD CONSTRAINT `FEEDBACK_COURSE1_FK` FOREIGN KEY (`COURSE_ID`) REFERENCES `course` (`COURSE_ID`);

--
-- Contraintes pour la table `manage`
--
ALTER TABLE `manage`
  ADD CONSTRAINT `MANAGE_FEEDBACK0_FK` FOREIGN KEY (`FEED_ID`) REFERENCES `feedback` (`FEED_ID`),
  ADD CONSTRAINT `MANAGE_USER1_FK` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`USER_ID`);

--
-- Contraintes pour la table `question`
--
ALTER TABLE `question`
  ADD CONSTRAINT `QUESTION_SECTION0_FK` FOREIGN KEY (`SECTION_ID`) REFERENCES `section` (`SECTION_ID`);

--
-- Contraintes pour la table `response`
--
ALTER TABLE `response`
  ADD CONSTRAINT `RESPONSE_QUESTION0_FK` FOREIGN KEY (`QUESTION_ID`) REFERENCES `question` (`QUESTION_ID`);

--
-- Contraintes pour la table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `USER_ROLE0_FK` FOREIGN KEY (`ROLE`) REFERENCES `role` (`ROLE`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
