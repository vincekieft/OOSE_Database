-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: db
-- Gegenereerd op: 25 jan 2019 om 15:00
-- Serverversie: 8.0.13
-- PHP-versie: 7.2.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `OOSE`
--

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `Account`
--

CREATE TABLE `Account` (
  `id` int(11) NOT NULL,
  `docent_id` int(11) NOT NULL,
  `wachtwoord` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `AccountRecht`
--

CREATE TABLE `AccountRecht` (
  `account_id` int(11) NOT NULL,
  `recht_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `Beoordeling`
--

CREATE TABLE `Beoordeling` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `toetsbaar_object_id` int(11) NOT NULL,
  `score` int(3) NOT NULL,
  `datum` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Gegevens worden geëxporteerd voor tabel `Beoordeling`
--

INSERT INTO `Beoordeling` (`id`, `student_id`, `toetsbaar_object_id`, `score`, `datum`) VALUES
(1, 1, 1, 64, '2018-11-29'),
(2, 7, 2, 43, '2018-11-29'),
(3, 4, 1, 79, '2018-11-29');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `Beoordelingscriteria`
--

CREATE TABLE `Beoordelingscriteria` (
  `id` int(11) NOT NULL,
  `toetsbaar_object_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Gegevens worden geëxporteerd voor tabel `Beoordelingscriteria`
--

INSERT INTO `Beoordelingscriteria` (`id`, `toetsbaar_object_id`) VALUES
(1, 1),
(2, 2);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `Beoordelingsdimensie`
--

CREATE TABLE `Beoordelingsdimensie` (
  `id` int(11) NOT NULL,
  `beoordelingscriteria_id` int(11) NOT NULL,
  `leerdoel_id` int(11) NOT NULL,
  `criteria` json DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Gegevens worden geëxporteerd voor tabel `Beoordelingsdimensie`
--

INSERT INTO `Beoordelingsdimensie` (`id`, `beoordelingscriteria_id`, `leerdoel_id`, `criteria`) VALUES
(1, 1, 1, NULL);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `Docent`
--

CREATE TABLE `Docent` (
  `id` int(11) NOT NULL,
  `persoon_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Gegevens worden geëxporteerd voor tabel `Docent`
--

INSERT INTO `Docent` (`id`, `persoon_id`) VALUES
(1, 2),
(2, 8),
(3, 13);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `Document`
--

CREATE TABLE `Document` (
  `id` int(11) NOT NULL,
  `naam` text NOT NULL,
  `revisie` int(11) NOT NULL DEFAULT '1',
  `inhoud` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Gegevens worden geëxporteerd voor tabel `Document`
--

INSERT INTO `Document` (`id`, `naam`, `revisie`, `inhoud`) VALUES
(1, 'Toets OOSE', 1, '{}'),
(2, 'Kutles', 1, '<h1>hallo dit is leuk zeg</h1>'),
(3, 'Patterns (1/3)', 1, 'Factory pattern\nObserver pattern'),
(4, 'Patterns (2/3)', 1, 'Regel 1\nRegel 2\nRegel 3\nOpsomming:\n- Punt 1\n- Punt 2'),
(5, 'Test', 1, '<h1>kaas</h1>'),
(6, 'Test HTML Casus', 1, '<p dir=\"ltr\">\n    OOSE DT Casus “Integrated Course Design Environment (ICDE)”\n</p>\n<p dir=\"ltr\">\n    Auteurs/opdrachtgevers: Christian Köppe en Rody Middelkoop\n</p>\n<p dir=\"ltr\">\n    Versie: 0.1 van 05-07-2017\n</p>\n<br/>\n<h2 dir=\"ltr\">\n    Inleiding\n</h2>\n<p dir=\"ltr\">\n    Beide auteurs waren ook de ontwikkelaars van het semester Object-Oriented\n    Software Engineering (OOSE) in het kader van de nieuwe deeltijd. Daarbij is\n    er bewust voor gekozen om bij de ontwikkeling gebruik te maken van\n    Educational Patterns en als methodische aanpak Assessment-Driven Course\n    Design (zoals het eigenlijk sowieso hoort te zijn). Ze zijn begonnen met\n    het bepalen van de leeruitkomsten (en eenheden ervan) en hebben dan\n    vervolgens beoordelingsdimensies en beoordelingscriteria (in de vorm van\n    rubrics) vastgesteld, gevolgd door een globale planning van toetsmomenten.\n    Op basis van de vooraf vastgestelde inhoud en de beoordelingscriteria werd\n    dan een lesplanning en bijhorende didactiek bepaald. Hierbij zijn ook\n    elementen van Hybrid Pedagogy toegepast (als uitbreiding op Blended\n    Learning). Om ervoor te zorgen dat dat deze goed aansluit bij de manier\n    waarop wordt beoordeeld (Constructive Aligment) zijn in de lesplanning ook\n    per onderdeel de bijhorende beoordelingscriteria aan de lesinhoud\n    gekoppeld.\n</p>\n<div>\n    <br/>\n</div>'),
(7, '', 1, '\"Ding\" asd'),
(8, 'Naampiee', 1, '<h1>asdfasd</h1>\nasdfasd\n\n\"asdfasdfasdf\"');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `Leerdoel`
--

CREATE TABLE `Leerdoel` (
  `id` int(11) NOT NULL,
  `module_id` int(11) NOT NULL,
  `naam` text NOT NULL,
  `beschrijving` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Gegevens worden geëxporteerd voor tabel `Leerdoel`
--

INSERT INTO `Leerdoel` (`id`, `module_id`, `naam`, `beschrijving`) VALUES
(1, 1, 'Bad Smells herkennen, benoemen en categoriseren.', 'Een lange beschrijving over het herkennen en beschrijven van fouten en problemen in code, om vervolgens een gepaste oplossing aan te dragen'),
(2, 1, 'Clean Code', 'De student kan op een georganiseerde manier volgens de regels van Clean Code werken en beargumenteert zijn gemaakte keuzes op de juiste manier.'),
(7, 1, 'Leerdoel1', 'Test');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `Les`
--

CREATE TABLE `Les` (
  `id` int(11) NOT NULL,
  `naam` text NOT NULL,
  `datum` date NOT NULL,
  `lesstof` json DEFAULT NULL,
  `module_id` int(11) NOT NULL,
  `document_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Gegevens worden geëxporteerd voor tabel `Les`
--

INSERT INTO `Les` (`id`, `naam`, `datum`, `lesstof`, `module_id`, `document_id`) VALUES
(1, 'Les over dingen', '2019-01-02', NULL, 1, NULL),
(2, 'Kaas', '2021-03-04', NULL, 1, NULL),
(3, 'Test', '2021-05-03', NULL, 1, NULL),
(4, 'Kutles', '2020-02-03', NULL, 1, 2),
(5, 'Patterns (1/3)', '2018-12-27', NULL, 5, 3),
(6, 'Patterns (2/3)', '2019-01-03', NULL, 5, 4),
(7, 'Test', '2021-04-03', NULL, 3, 5),
(8, 'Test HTML Casus', '2019-01-17', NULL, 1, 6),
(9, 'Naampiee', '1997-02-03', NULL, 1, 8);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `LesDocent`
--

CREATE TABLE `LesDocent` (
  `id` int(11) NOT NULL,
  `les_id` int(11) NOT NULL,
  `docent_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Gegevens worden geëxporteerd voor tabel `LesDocent`
--

INSERT INTO `LesDocent` (`id`, `les_id`, `docent_id`) VALUES
(1, 1, 2),
(2, 4, 1),
(3, 4, 3),
(4, 7, 1),
(5, 8, 2),
(6, 4, 2);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `LesLeerdoel`
--

CREATE TABLE `LesLeerdoel` (
  `id` int(11) NOT NULL,
  `les_id` int(11) NOT NULL,
  `leerdoel_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Gegevens worden geëxporteerd voor tabel `LesLeerdoel`
--

INSERT INTO `LesLeerdoel` (`id`, `les_id`, `leerdoel_id`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 1, 2),
(8, 2, 1),
(12, 3, 1),
(13, 3, 2),
(17, 4, 1),
(18, 5, 2),
(19, 7, 1),
(20, 4, 7);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `Module`
--

CREATE TABLE `Module` (
  `id` int(11) NOT NULL,
  `naam` text NOT NULL,
  `beschrijving` text NOT NULL,
  `startdatum` date NOT NULL,
  `einddatum` date NOT NULL,
  `opleiding_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Gegevens worden geëxporteerd voor tabel `Module`
--

INSERT INTO `Module` (`id`, `naam`, `beschrijving`, `startdatum`, `einddatum`, `opleiding_id`) VALUES
(1, 'OOSE', 'Object Oriented Software Engineering', '2018-09-02', '2019-01-25', 1),
(2, 'Biometrische wetenschappen', 'Informatie die passend is voor de opleiding biometrische wetenschappen', '2019-09-01', '2020-02-01', 2),
(3, 'Test', 'Testtttieee', '2021-03-03', '2021-03-03', 1),
(5, 'kaas', 'kaasnek', '2021-03-03', '2023-03-03', 1),
(6, 'Alo', 'Alo', '2024-02-03', '2025-03-05', 3);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `ModuleStudent`
--

CREATE TABLE `ModuleStudent` (
  `id` int(11) NOT NULL,
  `module_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Gegevens worden geëxporteerd voor tabel `ModuleStudent`
--

INSERT INTO `ModuleStudent` (`id`, `module_id`, `student_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 2, 5),
(4, 2, 7),
(5, 1, 3),
(6, 1, 4),
(7, 1, 6),
(8, 1, 7),
(11, 1, 5);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `Opleiding`
--

CREATE TABLE `Opleiding` (
  `id` int(11) NOT NULL,
  `naam` text NOT NULL,
  `startjaar` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Gegevens worden geëxporteerd voor tabel `Opleiding`
--

INSERT INTO `Opleiding` (`id`, `naam`, `startjaar`) VALUES
(1, 'ICT Deeltijd', 2017),
(2, 'Fysiotherapie', 2016),
(3, 'Putjes skeppuh', 2001);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `Persoon`
--

CREATE TABLE `Persoon` (
  `id` int(11) NOT NULL,
  `voornaam` text NOT NULL,
  `achternaam` text NOT NULL,
  `emailadres` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Gegevens worden geëxporteerd voor tabel `Persoon`
--

INSERT INTO `Persoon` (`id`, `voornaam`, `achternaam`, `emailadres`) VALUES
(1, 'Jan', 'Janssen', 'j.janssen@hanhan.nl'),
(2, 'Piet', 'Pietersen', 'p.pietersen@hanhan.nl'),
(3, 'Hassaan', 'El Ja Kaki', 'test@test.nl'),
(4, 'Herman', 'Finken', 'test@han.nl'),
(5, 'Steef', 'Meef', 'meef@meef.nl'),
(6, 'Kaas', 'man', 'kaas@kaas.nl'),
(7, 'Kaas', 'nek', 'nek@nek.nl'),
(8, 'Henk', 'Jansen', 'jansen@kaas.nl'),
(9, 'Henk', 'Hendriks', 'h.hendriks@hanhan.nl'),
(10, 'Maria', 'Marinade', 'm.marinade@hanhan.nl'),
(11, 'Fred', 'Frederiks', 'f.frederiks@hanhan.nl'),
(13, 'firstname', 'lastname', 'email');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `Recht`
--

CREATE TABLE `Recht` (
  `id` int(11) NOT NULL,
  `naam` text NOT NULL,
  `endpoint` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `Student`
--

CREATE TABLE `Student` (
  `id` int(11) NOT NULL,
  `persoon_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Gegevens worden geëxporteerd voor tabel `Student`
--

INSERT INTO `Student` (`id`, `persoon_id`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `ToetsbaarObject`
--

CREATE TABLE `ToetsbaarObject` (
  `id` int(11) NOT NULL,
  `module_id` int(11) NOT NULL,
  `document_id` int(11) DEFAULT NULL,
  `naam` text NOT NULL,
  `inleverdatum` date DEFAULT NULL,
  `weging` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Gegevens worden geëxporteerd voor tabel `ToetsbaarObject`
--

INSERT INTO `ToetsbaarObject` (`id`, `module_id`, `document_id`, `naam`, `inleverdatum`, `weging`) VALUES
(1, 1, NULL, 'Toets OOSE', '2018-11-22', 30),
(2, 1, NULL, 'Casus OOSE', '2019-01-25', 70);

--
-- Indexen voor geëxporteerde tabellen
--

--
-- Indexen voor tabel `Account`
--
ALTER TABLE `Account`
  ADD PRIMARY KEY (`id`),
  ADD KEY `docent_id` (`docent_id`);

--
-- Indexen voor tabel `AccountRecht`
--
ALTER TABLE `AccountRecht`
  ADD KEY `account_id` (`account_id`),
  ADD KEY `recht_id` (`recht_id`);

--
-- Indexen voor tabel `Beoordeling`
--
ALTER TABLE `Beoordeling`
  ADD PRIMARY KEY (`id`),
  ADD KEY `BEOORDELING_STUDENT_FK` (`student_id`),
  ADD KEY `TOETSBAAR_OBJECT_B_FK` (`toetsbaar_object_id`);

--
-- Indexen voor tabel `Beoordelingscriteria`
--
ALTER TABLE `Beoordelingscriteria`
  ADD PRIMARY KEY (`id`),
  ADD KEY `TOETSBAAR_OBJECT_BC_FK` (`toetsbaar_object_id`) USING BTREE;

--
-- Indexen voor tabel `Beoordelingsdimensie`
--
ALTER TABLE `Beoordelingsdimensie`
  ADD PRIMARY KEY (`id`),
  ADD KEY `BEOORDELINGSCRITERIA_B_FK` (`beoordelingscriteria_id`),
  ADD KEY `LEERDOEL_B_FK` (`leerdoel_id`);

--
-- Indexen voor tabel `Docent`
--
ALTER TABLE `Docent`
  ADD PRIMARY KEY (`id`),
  ADD KEY `PERSON_DOCENT_FK` (`persoon_id`);

--
-- Indexen voor tabel `Document`
--
ALTER TABLE `Document`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `Leerdoel`
--
ALTER TABLE `Leerdoel`
  ADD PRIMARY KEY (`id`),
  ADD KEY `module_id` (`module_id`);

--
-- Indexen voor tabel `Les`
--
ALTER TABLE `Les`
  ADD PRIMARY KEY (`id`),
  ADD KEY `MODULE_FK` (`module_id`),
  ADD KEY `document_id` (`document_id`);

--
-- Indexen voor tabel `LesDocent`
--
ALTER TABLE `LesDocent`
  ADD PRIMARY KEY (`id`),
  ADD KEY `les_id` (`les_id`),
  ADD KEY `docent_id` (`docent_id`);

--
-- Indexen voor tabel `LesLeerdoel`
--
ALTER TABLE `LesLeerdoel`
  ADD PRIMARY KEY (`id`),
  ADD KEY `les_id` (`les_id`),
  ADD KEY `leerdoel_id` (`leerdoel_id`);

--
-- Indexen voor tabel `Module`
--
ALTER TABLE `Module`
  ADD PRIMARY KEY (`id`),
  ADD KEY `OPLEIDING_FK` (`opleiding_id`);

--
-- Indexen voor tabel `ModuleStudent`
--
ALTER TABLE `ModuleStudent`
  ADD PRIMARY KEY (`id`),
  ADD KEY `module_id` (`module_id`),
  ADD KEY `student_id` (`student_id`);

--
-- Indexen voor tabel `Opleiding`
--
ALTER TABLE `Opleiding`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `Persoon`
--
ALTER TABLE `Persoon`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `Recht`
--
ALTER TABLE `Recht`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `Student`
--
ALTER TABLE `Student`
  ADD PRIMARY KEY (`id`),
  ADD KEY `PERSON_STUDENT_FK` (`persoon_id`);

--
-- Indexen voor tabel `ToetsbaarObject`
--
ALTER TABLE `ToetsbaarObject`
  ADD PRIMARY KEY (`id`),
  ADD KEY `MODULE_TO_FK` (`module_id`) USING BTREE,
  ADD KEY `document_id` (`document_id`);

--
-- AUTO_INCREMENT voor geëxporteerde tabellen
--

--
-- AUTO_INCREMENT voor een tabel `Account`
--
ALTER TABLE `Account`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `Beoordeling`
--
ALTER TABLE `Beoordeling`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT voor een tabel `Beoordelingscriteria`
--
ALTER TABLE `Beoordelingscriteria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT voor een tabel `Beoordelingsdimensie`
--
ALTER TABLE `Beoordelingsdimensie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT voor een tabel `Docent`
--
ALTER TABLE `Docent`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT voor een tabel `Document`
--
ALTER TABLE `Document`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT voor een tabel `Leerdoel`
--
ALTER TABLE `Leerdoel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT voor een tabel `Les`
--
ALTER TABLE `Les`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT voor een tabel `LesDocent`
--
ALTER TABLE `LesDocent`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT voor een tabel `LesLeerdoel`
--
ALTER TABLE `LesLeerdoel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT voor een tabel `Module`
--
ALTER TABLE `Module`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT voor een tabel `ModuleStudent`
--
ALTER TABLE `ModuleStudent`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT voor een tabel `Opleiding`
--
ALTER TABLE `Opleiding`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT voor een tabel `Persoon`
--
ALTER TABLE `Persoon`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT voor een tabel `Recht`
--
ALTER TABLE `Recht`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `Student`
--
ALTER TABLE `Student`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT voor een tabel `ToetsbaarObject`
--
ALTER TABLE `ToetsbaarObject`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Beperkingen voor geëxporteerde tabellen
--

--
-- Beperkingen voor tabel `Account`
--
ALTER TABLE `Account`
  ADD CONSTRAINT `DOCENT_ACCOUNT_FK` FOREIGN KEY (`docent_id`) REFERENCES `Docent` (`id`);

--
-- Beperkingen voor tabel `AccountRecht`
--
ALTER TABLE `AccountRecht`
  ADD CONSTRAINT `ACCOUNT_AR_FK` FOREIGN KEY (`account_id`) REFERENCES `Account` (`id`),
  ADD CONSTRAINT `RECHT_AR_FK` FOREIGN KEY (`recht_id`) REFERENCES `Recht` (`id`);

--
-- Beperkingen voor tabel `Beoordeling`
--
ALTER TABLE `Beoordeling`
  ADD CONSTRAINT `BEOORDELING_STUDENT_FK` FOREIGN KEY (`student_id`) REFERENCES `Student` (`id`),
  ADD CONSTRAINT `TOETSBAAR_OBJECT_B_FK` FOREIGN KEY (`toetsbaar_object_id`) REFERENCES `ToetsbaarObject` (`id`);

--
-- Beperkingen voor tabel `Beoordelingscriteria`
--
ALTER TABLE `Beoordelingscriteria`
  ADD CONSTRAINT `TOETSBAAR_OBJECT_BC_FK` FOREIGN KEY (`toetsbaar_object_id`) REFERENCES `ToetsbaarObject` (`id`);

--
-- Beperkingen voor tabel `Beoordelingsdimensie`
--
ALTER TABLE `Beoordelingsdimensie`
  ADD CONSTRAINT `BEOORDELINGSCRITERIA_B_FK` FOREIGN KEY (`beoordelingscriteria_id`) REFERENCES `Beoordelingscriteria` (`id`),
  ADD CONSTRAINT `LEERDOEL_B_FK` FOREIGN KEY (`leerdoel_id`) REFERENCES `Leerdoel` (`id`);

--
-- Beperkingen voor tabel `Docent`
--
ALTER TABLE `Docent`
  ADD CONSTRAINT `PERSON_DOCENT_FK` FOREIGN KEY (`persoon_id`) REFERENCES `Persoon` (`id`);

--
-- Beperkingen voor tabel `Leerdoel`
--
ALTER TABLE `Leerdoel`
  ADD CONSTRAINT `MODULE_L_FK` FOREIGN KEY (`module_id`) REFERENCES `Module` (`id`);

--
-- Beperkingen voor tabel `Les`
--
ALTER TABLE `Les`
  ADD CONSTRAINT `DOCUMENT_L_FK` FOREIGN KEY (`document_id`) REFERENCES `Document` (`id`),
  ADD CONSTRAINT `MODULE_FK` FOREIGN KEY (`module_id`) REFERENCES `Module` (`id`);

--
-- Beperkingen voor tabel `LesDocent`
--
ALTER TABLE `LesDocent`
  ADD CONSTRAINT `DOCENT_LES_FK` FOREIGN KEY (`docent_id`) REFERENCES `Docent` (`id`),
  ADD CONSTRAINT `LES_DOCENT_FK` FOREIGN KEY (`les_id`) REFERENCES `Les` (`id`);

--
-- Beperkingen voor tabel `LesLeerdoel`
--
ALTER TABLE `LesLeerdoel`
  ADD CONSTRAINT `LEERDOEL_LES_FK` FOREIGN KEY (`leerdoel_id`) REFERENCES `Leerdoel` (`id`),
  ADD CONSTRAINT `LES_LEERDOEL_FK` FOREIGN KEY (`les_id`) REFERENCES `Les` (`id`);

--
-- Beperkingen voor tabel `Module`
--
ALTER TABLE `Module`
  ADD CONSTRAINT `OPLEIDING_FK` FOREIGN KEY (`opleiding_id`) REFERENCES `Opleiding` (`id`);

--
-- Beperkingen voor tabel `ModuleStudent`
--
ALTER TABLE `ModuleStudent`
  ADD CONSTRAINT `MODULE_STUDENT_FK` FOREIGN KEY (`module_id`) REFERENCES `Module` (`id`),
  ADD CONSTRAINT `STUDENT_MODULE_FK` FOREIGN KEY (`student_id`) REFERENCES `Student` (`id`);

--
-- Beperkingen voor tabel `Student`
--
ALTER TABLE `Student`
  ADD CONSTRAINT `PERSON_STUDENT_FK` FOREIGN KEY (`persoon_id`) REFERENCES `Persoon` (`id`);

--
-- Beperkingen voor tabel `ToetsbaarObject`
--
ALTER TABLE `ToetsbaarObject`
  ADD CONSTRAINT `DOCUMENT_TO_FK` FOREIGN KEY (`document_id`) REFERENCES `Document` (`id`),
  ADD CONSTRAINT `MODULE_TO_FK` FOREIGN KEY (`module_id`) REFERENCES `Module` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
