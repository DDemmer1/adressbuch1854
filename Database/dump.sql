-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 07. Okt 2020 um 18:31
-- Server-Version: 10.4.11-MariaDB
-- PHP-Version: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `adressbuch1854`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `addresses`
--

CREATE TABLE `addresses` (
  `id` int(11) NOT NULL,
  `houseno` smallint(6) DEFAULT NULL,
  `houseno_specification` varchar(42) DEFAULT NULL,
  `geo_long` float DEFAULT NULL,
  `geo_lat` float DEFAULT NULL,
  `address_specification_verbatim` varchar(128) DEFAULT NULL,
  `street_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `addresses`
--

INSERT INTO `addresses` (`id`, `houseno`, `houseno_specification`, `geo_long`, `geo_lat`, `address_specification_verbatim`, `street_id`) VALUES
(1, 55, 'bis', NULL, NULL, 'im Dachgeschoss', 1),
(2, 100, NULL, NULL, NULL, NULL, 2),
(3, 7, 'bis', 2.34761, 48.8473, 'nahe der Kirche', 3),
(5, 34, '', NULL, NULL, '', 4),
(6, 17, NULL, NULL, NULL, 'im Hinterhof', 5),
(7, 6, NULL, 2.29364, 48.8722, NULL, 6),
(8, 30, NULL, NULL, NULL, 'im blauen Haus', 6),
(9, 10, 'a', NULL, NULL, NULL, 7),
(10, 26, NULL, NULL, NULL, 'beim Postamt', 7);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `addresses_companies`
--

CREATE TABLE `addresses_companies` (
  `address_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `addresses_companies`
--

INSERT INTO `addresses_companies` (`address_id`, `company_id`) VALUES
(1, 2),
(3, 1),
(5, 1),
(7, 1),
(7, 2);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `addresses_persons`
--

CREATE TABLE `addresses_persons` (
  `address_id` int(11) NOT NULL,
  `person_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `addresses_persons`
--

INSERT INTO `addresses_persons` (`address_id`, `person_id`) VALUES
(1, 1),
(1, 2),
(2, 3),
(3, 3),
(9, 2),
(10, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `arrondissements`
--

CREATE TABLE `arrondissements` (
  `id` int(11) NOT NULL,
  `no` smallint(6) DEFAULT NULL,
  `insee_citycode` mediumint(9) DEFAULT NULL,
  `type` enum('pre1860','post1860') DEFAULT NULL,
  `postcode` mediumint(9) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `arrondissements`
--

INSERT INTO `arrondissements` (`id`, `no`, `insee_citycode`, `type`, `postcode`) VALUES
(1, 1, 75101, 'post1860', 75001),
(2, 2, 75102, 'post1860', 75002),
(3, 3, 75103, 'post1860', 75003),
(4, 4, 75104, 'post1860', 75004),
(5, 5, 75105, 'post1860', 75005),
(6, 6, 75106, 'post1860', 75006),
(7, 7, 75107, 'post1860', 75007),
(8, 8, 75108, 'post1860', 75008),
(9, 9, 75109, 'post1860', 75009),
(10, 10, 75110, 'post1860', 75010),
(11, 11, 75111, 'post1860', 75011),
(12, 12, 75112, 'post1860', 75012),
(13, 13, 75113, 'post1860', 75013),
(14, 14, 75114, 'post1860', 75014),
(15, 15, 75115, 'post1860', 75015),
(16, 16, 75116, 'post1860', 75016),
(17, 17, 75117, 'post1860', 75017),
(18, 18, 75118, 'post1860', 75018),
(19, 19, 75119, 'post1860', 75019),
(20, 20, 75120, 'post1860', 75020),
(21, 1, NULL, 'pre1860', NULL),
(22, 2, NULL, 'pre1860', NULL),
(23, 3, NULL, 'pre1860', NULL),
(24, 4, NULL, 'pre1860', NULL),
(25, 5, NULL, 'pre1860', NULL),
(26, 6, NULL, 'pre1860', NULL),
(27, 7, NULL, 'pre1860', NULL),
(28, 8, NULL, 'pre1860', NULL),
(29, 9, NULL, 'pre1860', NULL),
(30, 10, NULL, 'pre1860', NULL),
(31, 11, NULL, 'pre1860', NULL),
(32, 12, NULL, 'pre1860', NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `arrondissements_streets`
--

CREATE TABLE `arrondissements_streets` (
  `arrondissement_id` int(11) NOT NULL,
  `street_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `arrondissements_streets`
--

INSERT INTO `arrondissements_streets` (`arrondissement_id`, `street_id`) VALUES
(1, 1),
(1, 4),
(1, 5),
(2, 1),
(2, 4),
(2, 5),
(4, 2),
(5, 3),
(26, 1),
(26, 4),
(26, 5),
(27, 1),
(27, 2),
(27, 4),
(27, 5),
(29, 2),
(32, 3);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `companies`
--

CREATE TABLE `companies` (
  `id` int(11) NOT NULL,
  `name` varchar(62) DEFAULT NULL,
  `specification_verbatim` varchar(128) DEFAULT NULL,
  `profession_verbatim` varchar(128) DEFAULT NULL,
  `prof_category_id` int(11) DEFAULT NULL,
  `notable_commercant` tinyint(1) NOT NULL DEFAULT 0,
  `bold` tinyint(1) NOT NULL DEFAULT 0,
  `advert` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `companies`
--

INSERT INTO `companies` (`id`, `name`, `specification_verbatim`, `profession_verbatim`, `prof_category_id`, `notable_commercant`, `bold`, `advert`) VALUES
(1, 'Müller u. Comp.', '', 'Verfertiger von Möbeln', 1, 0, 1, 1),
(2, 'Mayer, Hunkers und Comp.', 'Nachfolger der Weidmann\'schen Kanapee-Fabrik', 'Möbelfabrik', 1, 1, 0, 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `companies_external_references`
--

CREATE TABLE `companies_external_references` (
  `company_id` int(11) NOT NULL,
  `external_reference_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `companies_external_references`
--

INSERT INTO `companies_external_references` (`company_id`, `external_reference_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `companies_original_references`
--

CREATE TABLE `companies_original_references` (
  `company_id` int(11) NOT NULL,
  `original_reference_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `companies_original_references`
--

INSERT INTO `companies_original_references` (`company_id`, `original_reference_id`) VALUES
(1, 1),
(2, 2),
(2, 3);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `companies_persons`
--

CREATE TABLE `companies_persons` (
  `company_id` int(11) NOT NULL,
  `person_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `companies_persons`
--

INSERT INTO `companies_persons` (`company_id`, `person_id`) VALUES
(1, 1),
(2, 1),
(2, 3);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `external_references`
--

CREATE TABLE `external_references` (
  `id` int(11) NOT NULL,
  `reference` varchar(128) DEFAULT NULL,
  `short_description` varchar(256) DEFAULT NULL,
  `link` varchar(512) DEFAULT NULL,
  `reference_type_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `external_references`
--

INSERT INTO `external_references` (`id`, `reference`, `short_description`, `link`, `reference_type_id`) VALUES
(1, 'Thesaurus der untergegangenen Berufe, Artikel: Möbelschreiner, S. 13', 'Beschreibt den Beruf des Möbelschreiners', NULL, 6),
(2, 'Wikipedia, Artikel Ehrenlegion', 'Erklärt die Ränge der Légion d\'Honneur', 'https://de.wikipedia.org/wiki/Ehrenlegion', 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `external_references_persons`
--

CREATE TABLE `external_references_persons` (
  `external_reference_id` int(11) NOT NULL,
  `person_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `external_references_persons`
--

INSERT INTO `external_references_persons` (`external_reference_id`, `person_id`) VALUES
(1, 1),
(2, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `ldh_ranks`
--

CREATE TABLE `ldh_ranks` (
  `id` int(11) NOT NULL,
  `rank` varchar(42) DEFAULT NULL,
  `index_no` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `ldh_ranks`
--

INSERT INTO `ldh_ranks` (`id`, `rank`, `index_no`) VALUES
(1, 'Chevalier', 1),
(2, 'Commandeur', 2),
(3, 'Officier', 3),
(4, 'Grand Officier', 4),
(5, 'Grand-Croix', 5);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `military_statuses`
--

CREATE TABLE `military_statuses` (
  `id` int(11) NOT NULL,
  `status` varchar(42) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `military_statuses`
--

INSERT INTO `military_statuses` (`id`, `status`) VALUES
(1, 'Military'),
(2, 'Civil');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `occupation_statuses`
--

CREATE TABLE `occupation_statuses` (
  `id` int(11) NOT NULL,
  `status` varchar(42) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `occupation_statuses`
--

INSERT INTO `occupation_statuses` (`id`, `status`) VALUES
(1, 'Active'),
(2, 'Pensioner'),
(3, 'Annuitant');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `original_references`
--

CREATE TABLE `original_references` (
  `id` int(11) NOT NULL,
  `scan_no` smallint(6) DEFAULT NULL,
  `begin_page_no` smallint(6) DEFAULT NULL,
  `end_page_no` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `original_references`
--

INSERT INTO `original_references` (`id`, `scan_no`, `begin_page_no`, `end_page_no`) VALUES
(1, 3, 11, 12),
(2, 4, 20, NULL),
(3, 5, 31, NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `original_references_persons`
--

CREATE TABLE `original_references_persons` (
  `original_reference_id` int(11) NOT NULL,
  `person_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `original_references_persons`
--

INSERT INTO `original_references_persons` (`original_reference_id`, `person_id`) VALUES
(1, 1),
(2, 1),
(3, 2),
(3, 3);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `persons`
--

CREATE TABLE `persons` (
  `id` int(11) NOT NULL,
  `surname` varchar(64) DEFAULT NULL,
  `first_name` varchar(64) DEFAULT NULL,
  `gender` enum('M','F') DEFAULT NULL,
  `title` varchar(42) DEFAULT NULL,
  `name_predicate` varchar(42) DEFAULT NULL,
  `specification_verbatim` varchar(128) DEFAULT NULL,
  `profession_verbatim` varchar(128) DEFAULT NULL,
  `de_l_institut` tinyint(1) DEFAULT NULL,
  `notable_commercant` tinyint(1) DEFAULT NULL,
  `bold` tinyint(1) DEFAULT NULL,
  `advert` tinyint(1) DEFAULT NULL,
  `ldh_rank_id` int(11) DEFAULT NULL,
  `military_status_id` int(11) DEFAULT NULL,
  `social_status_id` int(11) DEFAULT NULL,
  `occupation_status_id` int(11) DEFAULT NULL,
  `prof_category_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `persons`
--

INSERT INTO `persons` (`id`, `surname`, `first_name`, `gender`, `title`, `name_predicate`, `specification_verbatim`, `profession_verbatim`, `de_l_institut`, `notable_commercant`, `bold`, `advert`, `ldh_rank_id`, `military_status_id`, `social_status_id`, `occupation_status_id`, `prof_category_id`) VALUES
(1, 'Müller', 'Karl', 'M', 'Doctor', NULL, 'Dr.', 'Verfertiger von Möbeln', 1, 1, 1, 1, 1, 1, 2, 1, 1),
(2, 'Weidmann', 'Marie', 'F', 'Baronin', 'von', 'Baronin', NULL, 0, 0, 0, 0, NULL, 2, 1, 3, 2),
(3, 'Kahle', NULL, 'M', NULL, NULL, NULL, 'Gastwirth, Möbel', 0, 0, 1, 1, NULL, 2, 2, 1, 3),
(4, 'Graumann', 'Lisa', 'F', 'Doctrix', NULL, NULL, 'Schaustellerin', NULL, NULL, 1, 1, NULL, 2, 2, 1, 3);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `prof_categories`
--

CREATE TABLE `prof_categories` (
  `id` int(11) NOT NULL,
  `name` varchar(42) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `prof_categories`
--

INSERT INTO `prof_categories` (`id`, `name`) VALUES
(1, 'Handwerk'),
(2, 'Rentier'),
(3, 'Gastronomie und Hotellerie');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `reference_types`
--

CREATE TABLE `reference_types` (
  `id` int(11) NOT NULL,
  `type` varchar(42) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `reference_types`
--

INSERT INTO `reference_types` (`id`, `type`) VALUES
(1, 'weblink'),
(2, 'printed publication'),
(3, 'online publication'),
(4, 'unpublished source'),
(5, 'other'),
(6, 'profession thesaurus');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `social_statuses`
--

CREATE TABLE `social_statuses` (
  `id` int(11) NOT NULL,
  `status` varchar(42) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `social_statuses`
--

INSERT INTO `social_statuses` (`id`, `status`) VALUES
(1, 'Noble'),
(2, 'Commoner'),
(3, 'Clergy');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `streets`
--

CREATE TABLE `streets` (
  `id` int(11) NOT NULL,
  `name_old_verbatim` varchar(62) DEFAULT NULL,
  `name_old_clean` varchar(62) DEFAULT NULL,
  `name_new` varchar(62) DEFAULT NULL,
  `geo_long` float DEFAULT NULL,
  `geo_lat` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `streets`
--

INSERT INTO `streets` (`id`, `name_old_verbatim`, `name_old_clean`, `name_new`, `geo_long`, `geo_lat`) VALUES
(1, 'Temple', 'Rue du Temple', 'Rue du Temple', 2.35451, 48.8601),
(2, 'Saint-Antoine', 'Rue Saint-Antoine', 'Rue François-Miron', 2.3546, 48.8559),
(3, 'Amandiers-Saint-Jacques ', 'Rue des Amandiers-Saint-Jacques \r\n', 'Rue Laplace', 2.34764, 48.8472),
(4, 'Rue Temple', 'Rue du Temple', 'Rue du Temple', 2.35451, 48.8601),
(5, 'Teste', 'Rue du Teste', 'Rue Nouvelle', 2.35451, 48.8601),
(6, 'Vielle', 'Rue Vielle', 'Rue Kléber', 2.291, 48.8683),
(7, 'Rue Manin', 'Rue Manin', 'Rue Manin', 2.37853, 48.8789);

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `street_id` (`street_id`);

--
-- Indizes für die Tabelle `addresses_companies`
--
ALTER TABLE `addresses_companies`
  ADD PRIMARY KEY (`address_id`,`company_id`),
  ADD KEY `company_id` (`company_id`);

--
-- Indizes für die Tabelle `addresses_persons`
--
ALTER TABLE `addresses_persons`
  ADD PRIMARY KEY (`address_id`,`person_id`),
  ADD KEY `person_id` (`person_id`);

--
-- Indizes für die Tabelle `arrondissements`
--
ALTER TABLE `arrondissements`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `arrondissements_streets`
--
ALTER TABLE `arrondissements_streets`
  ADD PRIMARY KEY (`arrondissement_id`,`street_id`),
  ADD KEY `street_id` (`street_id`);

--
-- Indizes für die Tabelle `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `prof_category_id` (`prof_category_id`);

--
-- Indizes für die Tabelle `companies_external_references`
--
ALTER TABLE `companies_external_references`
  ADD PRIMARY KEY (`company_id`,`external_reference_id`),
  ADD KEY `external_reference_id` (`external_reference_id`);

--
-- Indizes für die Tabelle `companies_original_references`
--
ALTER TABLE `companies_original_references`
  ADD PRIMARY KEY (`company_id`,`original_reference_id`),
  ADD KEY `original_reference_id` (`original_reference_id`);

--
-- Indizes für die Tabelle `companies_persons`
--
ALTER TABLE `companies_persons`
  ADD PRIMARY KEY (`company_id`,`person_id`),
  ADD KEY `person_id` (`person_id`);

--
-- Indizes für die Tabelle `external_references`
--
ALTER TABLE `external_references`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reference_type_id` (`reference_type_id`);

--
-- Indizes für die Tabelle `external_references_persons`
--
ALTER TABLE `external_references_persons`
  ADD PRIMARY KEY (`external_reference_id`,`person_id`),
  ADD KEY `person_id` (`person_id`);

--
-- Indizes für die Tabelle `ldh_ranks`
--
ALTER TABLE `ldh_ranks`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `military_statuses`
--
ALTER TABLE `military_statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `occupation_statuses`
--
ALTER TABLE `occupation_statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `original_references`
--
ALTER TABLE `original_references`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `original_references_persons`
--
ALTER TABLE `original_references_persons`
  ADD PRIMARY KEY (`original_reference_id`,`person_id`),
  ADD KEY `person_id` (`person_id`);

--
-- Indizes für die Tabelle `persons`
--
ALTER TABLE `persons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `prof_category_id` (`prof_category_id`),
  ADD KEY `social_status_id` (`social_status_id`),
  ADD KEY `ldh_rank_id` (`ldh_rank_id`),
  ADD KEY `occupation_status_id` (`occupation_status_id`),
  ADD KEY `military_status_id` (`military_status_id`);

--
-- Indizes für die Tabelle `prof_categories`
--
ALTER TABLE `prof_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `reference_types`
--
ALTER TABLE `reference_types`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `social_statuses`
--
ALTER TABLE `social_statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `streets`
--
ALTER TABLE `streets`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `addresses`
--
ALTER TABLE `addresses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT für Tabelle `arrondissements`
--
ALTER TABLE `arrondissements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT für Tabelle `companies`
--
ALTER TABLE `companies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT für Tabelle `external_references`
--
ALTER TABLE `external_references`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT für Tabelle `ldh_ranks`
--
ALTER TABLE `ldh_ranks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT für Tabelle `military_statuses`
--
ALTER TABLE `military_statuses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT für Tabelle `occupation_statuses`
--
ALTER TABLE `occupation_statuses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `original_references`
--
ALTER TABLE `original_references`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `persons`
--
ALTER TABLE `persons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT für Tabelle `prof_categories`
--
ALTER TABLE `prof_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `reference_types`
--
ALTER TABLE `reference_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT für Tabelle `social_statuses`
--
ALTER TABLE `social_statuses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `streets`
--
ALTER TABLE `streets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `addresses`
--
ALTER TABLE `addresses`
  ADD CONSTRAINT `addresses_ibfk_1` FOREIGN KEY (`street_id`) REFERENCES `streets` (`id`);

--
-- Constraints der Tabelle `addresses_companies`
--
ALTER TABLE `addresses_companies`
  ADD CONSTRAINT `addresses_companies_ibfk_1` FOREIGN KEY (`address_id`) REFERENCES `addresses` (`id`),
  ADD CONSTRAINT `addresses_companies_ibfk_2` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`);

--
-- Constraints der Tabelle `addresses_persons`
--
ALTER TABLE `addresses_persons`
  ADD CONSTRAINT `addresses_persons_ibfk_1` FOREIGN KEY (`address_id`) REFERENCES `addresses` (`id`),
  ADD CONSTRAINT `addresses_persons_ibfk_2` FOREIGN KEY (`person_id`) REFERENCES `persons` (`id`);

--
-- Constraints der Tabelle `arrondissements_streets`
--
ALTER TABLE `arrondissements_streets`
  ADD CONSTRAINT `arrondissements_streets_ibfk_1` FOREIGN KEY (`arrondissement_id`) REFERENCES `arrondissements` (`id`),
  ADD CONSTRAINT `arrondissements_streets_ibfk_2` FOREIGN KEY (`street_id`) REFERENCES `streets` (`id`);

--
-- Constraints der Tabelle `companies`
--
ALTER TABLE `companies`
  ADD CONSTRAINT `companies_ibfk_1` FOREIGN KEY (`prof_category_id`) REFERENCES `prof_categories` (`id`);

--
-- Constraints der Tabelle `companies_external_references`
--
ALTER TABLE `companies_external_references`
  ADD CONSTRAINT `companies_external_references_ibfk_1` FOREIGN KEY (`external_reference_id`) REFERENCES `external_references` (`id`),
  ADD CONSTRAINT `companies_external_references_ibfk_2` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`);

--
-- Constraints der Tabelle `companies_original_references`
--
ALTER TABLE `companies_original_references`
  ADD CONSTRAINT `companies_original_references_ibfk_1` FOREIGN KEY (`original_reference_id`) REFERENCES `original_references` (`id`),
  ADD CONSTRAINT `companies_original_references_ibfk_2` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`);

--
-- Constraints der Tabelle `companies_persons`
--
ALTER TABLE `companies_persons`
  ADD CONSTRAINT `companies_persons_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`),
  ADD CONSTRAINT `companies_persons_ibfk_2` FOREIGN KEY (`person_id`) REFERENCES `persons` (`id`);

--
-- Constraints der Tabelle `external_references`
--
ALTER TABLE `external_references`
  ADD CONSTRAINT `external_references_ibfk_1` FOREIGN KEY (`reference_type_id`) REFERENCES `reference_types` (`id`);

--
-- Constraints der Tabelle `external_references_persons`
--
ALTER TABLE `external_references_persons`
  ADD CONSTRAINT `external_references_persons_ibfk_1` FOREIGN KEY (`external_reference_id`) REFERENCES `external_references` (`id`),
  ADD CONSTRAINT `external_references_persons_ibfk_2` FOREIGN KEY (`person_id`) REFERENCES `persons` (`id`);

--
-- Constraints der Tabelle `original_references_persons`
--
ALTER TABLE `original_references_persons`
  ADD CONSTRAINT `original_references_persons_ibfk_1` FOREIGN KEY (`original_reference_id`) REFERENCES `original_references` (`id`),
  ADD CONSTRAINT `original_references_persons_ibfk_2` FOREIGN KEY (`person_id`) REFERENCES `persons` (`id`);

--
-- Constraints der Tabelle `persons`
--
ALTER TABLE `persons`
  ADD CONSTRAINT `persons_ibfk_1` FOREIGN KEY (`prof_category_id`) REFERENCES `prof_categories` (`id`),
  ADD CONSTRAINT `persons_ibfk_2` FOREIGN KEY (`social_status_id`) REFERENCES `social_statuses` (`id`),
  ADD CONSTRAINT `persons_ibfk_3` FOREIGN KEY (`ldh_rank_id`) REFERENCES `ldh_ranks` (`id`),
  ADD CONSTRAINT `persons_ibfk_4` FOREIGN KEY (`occupation_status_id`) REFERENCES `occupation_statuses` (`id`),
  ADD CONSTRAINT `persons_ibfk_5` FOREIGN KEY (`military_status_id`) REFERENCES `military_statuses` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
