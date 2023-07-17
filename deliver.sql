-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : lun. 17 juil. 2023 à 18:22
-- Version du serveur : 8.0.27
-- Version de PHP : 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `deliver`
--

-- --------------------------------------------------------

--
-- Structure de la table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `nom-admin` varchar(40) NOT NULL,
  `prenom-admin` varchar(40) NOT NULL,
  `email-admin` varchar(40) NOT NULL,
  `numero-admin` int NOT NULL,
  `url-img` varchar(40) NOT NULL,
  `role-admin` varchar(40) NOT NULL,
  `dispo-admin` varchar(40) NOT NULL,
  `id-admin` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id-admin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

DROP TABLE IF EXISTS `client`;
CREATE TABLE IF NOT EXISTS `client` (
  `id-client` int NOT NULL AUTO_INCREMENT,
  `nom-client` int NOT NULL,
  `numero-client` int NOT NULL,
  `ville` varchar(40) NOT NULL,
  PRIMARY KEY (`id-client`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

DROP TABLE IF EXISTS `commande`;
CREATE TABLE IF NOT EXISTS `commande` (
  `id-commande` int NOT NULL AUTO_INCREMENT,
  `quantite` int NOT NULL,
  `date-achat` date NOT NULL,
  `vendu` int NOT NULL,
  `n-panier` int NOT NULL,
  `annuler` int NOT NULL,
  `id-client` int NOT NULL,
  `id-livreur` int NOT NULL,
  `id-produit` int NOT NULL,
  PRIMARY KEY (`id-commande`),
  KEY `id-livreur` (`id-livreur`),
  KEY `id-client` (`id-client`,`id-produit`),
  KEY `id-produit` (`id-produit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `livreur`
--

DROP TABLE IF EXISTS `livreur`;
CREATE TABLE IF NOT EXISTS `livreur` (
  `id-livreur` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(40) NOT NULL,
  `prenom` varchar(40) NOT NULL,
  `id-ville` int NOT NULL,
  `email` varchar(40) NOT NULL,
  `url-img` varchar(40) NOT NULL,
  `numéro` int NOT NULL,
  `quota-fixe` int NOT NULL,
  `quota-km` int NOT NULL,
  `disponible` int NOT NULL,
  PRIMARY KEY (`id-livreur`),
  KEY `id-ville` (`id-ville`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

DROP TABLE IF EXISTS `produit`;
CREATE TABLE IF NOT EXISTS `produit` (
  `id-prod` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(40) NOT NULL,
  `prix` int NOT NULL,
  `categorie` varchar(40) NOT NULL,
  `supp` int NOT NULL,
  `id-restau` int NOT NULL,
  PRIMARY KEY (`id-prod`),
  KEY `id-restau` (`id-restau`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `restaurant`
--

DROP TABLE IF EXISTS `restaurant`;
CREATE TABLE IF NOT EXISTS `restaurant` (
  `id-restau` int NOT NULL AUTO_INCREMENT,
  `nom-restau` varchar(40) NOT NULL,
  `ville-restau` varchar(40) NOT NULL,
  `tarif` int NOT NULL,
  `contact` varchar(40) NOT NULL,
  `disponibilite` varchar(40) NOT NULL,
  `email` varchar(40) NOT NULL,
  `mdp` varchar(40) NOT NULL,
  `logo` varchar(40) NOT NULL,
  PRIMARY KEY (`id-restau`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `ville`
--

DROP TABLE IF EXISTS `ville`;
CREATE TABLE IF NOT EXISTS `ville` (
  `id-ville` int NOT NULL AUTO_INCREMENT,
  `nom-ville` varchar(40) NOT NULL,
  PRIMARY KEY (`id-ville`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `commande`
--
ALTER TABLE `commande`
  ADD CONSTRAINT `commande_ibfk_1` FOREIGN KEY (`id-client`) REFERENCES `client` (`id-client`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `commande_ibfk_2` FOREIGN KEY (`id-produit`) REFERENCES `produit` (`id-prod`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `commande_ibfk_3` FOREIGN KEY (`id-livreur`) REFERENCES `livreur` (`id-livreur`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `livreur`
--
ALTER TABLE `livreur`
  ADD CONSTRAINT `livreur_ibfk_1` FOREIGN KEY (`id-ville`) REFERENCES `ville` (`id-ville`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `produit`
--
ALTER TABLE `produit`
  ADD CONSTRAINT `produit_ibfk_1` FOREIGN KEY (`id-restau`) REFERENCES `restaurant` (`id-restau`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
