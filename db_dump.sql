-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mer. 16 avr. 2025 à 00:49
-- Version du serveur : 8.0.36-28
-- Version de PHP : 8.1.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `testv3fichiers`
--

-- --------------------------------------------------------

--
-- Structure de la table `agents`
--

CREATE TABLE `agents` (
  `id` int NOT NULL,
  `nom` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `prenom` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `service` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `telephone` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `avertissement` int DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `niveau_accreditation` int NOT NULL DEFAULT '1',
  `date_inscription` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `ip` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `agents_services`
--

CREATE TABLE `agents_services` (
  `id` int NOT NULL,
  `en_service` tinyint(1) NOT NULL,
  `date_prise_service` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_fin_service` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dernier_chargement` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `agent_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `changelogs`
--

CREATE TABLE `changelogs` (
  `id` int NOT NULL,
  `version` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `changes` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `triggered_by` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_time` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `demandes`
--

CREATE TABLE `demandes` (
  `id` int NOT NULL,
  `nom` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `prenom` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `service` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `telephone` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `niveau_accreditation` int NOT NULL DEFAULT '1',
  `date_demande` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `fnpc`
--

CREATE TABLE `fnpc` (
  `identifier` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prenom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `datenaissance` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `statutpermis` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `points` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `fnpc_infractions`
--

CREATE TABLE `fnpc_infractions` (
  `identifier` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `infraction` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `datefinsus` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `retraitpoint` int DEFAULT NULL,
  `datereleve` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `agent` int NOT NULL,
  `statut` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `fnpc_old`
--

CREATE TABLE `fnpc_old` (
  `id` int NOT NULL,
  `nom` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `prenom` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `date_naissance` date DEFAULT NULL,
  `statut` enum('Valide','Suspendu','Annulé') COLLATE utf8mb4_general_ci NOT NULL,
  `date_fin_suspension` date DEFAULT NULL,
  `infraction` text COLLATE utf8mb4_general_ci,
  `date_inscription` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `agent_inscripteur` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `fpr`
--

CREATE TABLE `fpr` (
  `id` int NOT NULL,
  `nom` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `prenom` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `date_naissance` date DEFAULT NULL,
  `date_inscription` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `taille` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description_vestimentaire` text COLLATE utf8mb4_general_ci,
  `photo` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `motifs` text COLLATE utf8mb4_general_ci NOT NULL,
  `fiche_rouge` tinyint(1) DEFAULT '0',
  `conduite_a_tenir` text COLLATE utf8mb4_general_ci,
  `agent_inscripteur` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `niveaux_accreditation`
--

CREATE TABLE `niveaux_accreditation` (
  `id` int NOT NULL,
  `niveau` enum('Direction PN','Chef OPJ','PM','Armes','ADMIN','Justice','OPJ','Agents') COLLATE utf8mb4_general_ci NOT NULL,
  `description` text COLLATE utf8mb4_general_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `password_resets`
--

CREATE TABLE `password_resets` (
  `id` int NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expires_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `sia`
--

CREATE TABLE `sia` (
  `id` int NOT NULL,
  `nom` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `prenom` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `date_naissance` date NOT NULL,
  `date_acquisition` date DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `modele` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `calibre` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `numero_serie` varchar(255) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `siv`
--

CREATE TABLE `siv` (
  `identifier` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `firstname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dateofbirth` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sex` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `height` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `plate` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `statistiques`
--

CREATE TABLE `statistiques` (
  `id` int NOT NULL,
  `agent_id` int NOT NULL,
  `nom` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prenom` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `service` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `page` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `taj`
--

CREATE TABLE `taj` (
  `id` int NOT NULL,
  `nom` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `prenom` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `date_naissance` date DEFAULT NULL,
  `telephone` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `date_inscription` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `photo` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `manop` text COLLATE utf8mb4_general_ci NOT NULL,
  `libelle_infractions` text COLLATE utf8mb4_general_ci NOT NULL,
  `numero_procedure` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `agent_inscripteur` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `agents`
--
ALTER TABLE `agents`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `idx_agents_nom` (`nom`),
  ADD KEY `idx_agents_service` (`service`);

--
-- Index pour la table `agents_services`
--
ALTER TABLE `agents_services`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `changelogs`
--
ALTER TABLE `changelogs`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `demandes`
--
ALTER TABLE `demandes`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `fnpc`
--
ALTER TABLE `fnpc`
  ADD PRIMARY KEY (`identifier`),
  ADD KEY `idx_fnpc_nom` (`nom`),
  ADD KEY `idx_fnpc_prenom` (`prenom`),
  ADD KEY `idx_fnpc_date_naissance` (`datenaissance`);

--
-- Index pour la table `fnpc_infractions`
--
ALTER TABLE `fnpc_infractions`
  ADD PRIMARY KEY (`datereleve`),
  ADD KEY `idx_fnpc_infractions_fnpc_id` (`identifier`);

--
-- Index pour la table `fnpc_old`
--
ALTER TABLE `fnpc_old`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_fnpc_old_nom` (`nom`),
  ADD KEY `idx_fnpc_old_prenom` (`prenom`);

--
-- Index pour la table `fpr`
--
ALTER TABLE `fpr`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_fpr_nom` (`nom`),
  ADD KEY `idx_fpr_prenom` (`prenom`),
  ADD KEY `idx_fpr_date_naissance` (`date_naissance`);

--
-- Index pour la table `niveaux_accreditation`
--
ALTER TABLE `niveaux_accreditation`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `sia`
--
ALTER TABLE `sia`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_sia_nom` (`nom`),
  ADD KEY `idx_sia_prenom` (`prenom`),
  ADD KEY `idx_sia_date_naissance` (`date_naissance`);

--
-- Index pour la table `siv`
--
ALTER TABLE `siv`
  ADD PRIMARY KEY (`plate`),
  ADD KEY `idx_siv_nom` (`firstname`,`lastname`),
  ADD KEY `isx_siv_plaque` (`plate`);

--
-- Index pour la table `statistiques`
--
ALTER TABLE `statistiques`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_statistiques_agent_id` (`agent_id`),
  ADD KEY `idx_statistiques_page` (`page`);

--
-- Index pour la table `taj`
--
ALTER TABLE `taj`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_taj_nom` (`nom`),
  ADD KEY `idx_taj_prenom` (`prenom`),
  ADD KEY `idx_taj_date_naissance` (`date_naissance`),
  ADD KEY `idx_taj_agent_inscripteur` (`agent_inscripteur`),
  ADD KEY `idx_taj_numero_procedure` (`numero_procedure`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `agents`
--
ALTER TABLE `agents`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `agents_services`
--
ALTER TABLE `agents_services`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `changelogs`
--
ALTER TABLE `changelogs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `demandes`
--
ALTER TABLE `demandes`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `fnpc_old`
--
ALTER TABLE `fnpc_old`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `fpr`
--
ALTER TABLE `fpr`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `niveaux_accreditation`
--
ALTER TABLE `niveaux_accreditation`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `password_resets`
--
ALTER TABLE `password_resets`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `sia`
--
ALTER TABLE `sia`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `statistiques`
--
ALTER TABLE `statistiques`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `taj`
--
ALTER TABLE `taj`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
