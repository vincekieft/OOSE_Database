-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: db
-- Gegenereerd op: 25 jan 2019 om 19:47
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

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `Beoordelingscriteria`
--

CREATE TABLE `Beoordelingscriteria` (
  `id` int(11) NOT NULL,
  `toetsbaar_object_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
(4, 15);

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
(9, 'Inleiding', 1, '<div id=\"lesson-content\">\r\n                        <span class=\"hide show-print\">\r\n                            <strong>1. Courseopzet</strong>\r\n                            <small>(1. Coursebeschrijving)</small>\r\n                        </span>\r\n    <div>\r\n        <p><img alt=\"\" src=\"data:image/png;base64,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\" style=\"float:left\"></p>\r\n\r\n        <p> </p>\r\n\r\n        <table border=\"0\" cellpadding=\"1\" cellspacing=\"1\" style=\"height:106px; line-height:20.8px; width:374px\">\r\n            <tbody>\r\n            <tr>\r\n                <td>     </td>\r\n                <td colspan=\"2\"><strong>Studiehandleiding</strong></td>\r\n                <td> </td>\r\n            </tr>\r\n            <tr>\r\n                <td> </td>\r\n                <td colspan=\"2\"><strong>COURSE naam</strong></td>\r\n                <td>OOSE DEA</td>\r\n            </tr>\r\n            <tr>\r\n                <td> </td>\r\n                <td colspan=\"2\"><strong>Studiejaar</strong></td>\r\n                <td>2018-2019</td>\r\n            </tr>\r\n            <tr>\r\n                <td> </td>\r\n                <td colspan=\"2\"><strong>Opleiding</strong></td>\r\n                <td>profiel SD/WD/DSD</td>\r\n            </tr>\r\n            </tbody>\r\n        </table>\r\n\r\n        <br>\r\n        <br>\r\n        <h1><a id=\"1. Algemene gegevens\" name=\"1. Algemene gegevens\"><strong>1. Algemene gegevens</strong></a><br>\r\n             </h1>\r\n\r\n        <p><strong>Titel                           OOSE DEA</strong></p>\r\n\r\n        <p><strong>Studiejaar                2018-2019</strong></p>\r\n\r\n        <p><strong>Opleiding                  Profiel SD/WD/DSD</strong></p>\r\n\r\n        <p><strong>Auteurs</strong>                     Rody Middelkoop, Meron Brouwer</p>\r\n\r\n        <p> </p>\r\n\r\n        <div>\r\n            <p><em>Deze studiehandleiding is gebaseerd op de owe-beschrijving OOSE DEA , onderdeel van het Opleidingsstatuut ICA .</em></p>\r\n\r\n            <p><em>Aan deze handleiding kunnen geen rechten worden ontleend.<br>\r\n                Het Opleidingsstatuut is te vinden op HAN Insite: ICA -&gt; Rechten en Plichten</em></p>\r\n        </div>\r\n\r\n        <p> </p>\r\n\r\n        <h1><a id=\"1.1 De course\" name=\"1.1 De course\"><strong>1.1 De course</strong></a></h1>\r\n\r\n        <p>Aan ontwikkelaars worden steeds hogere en meer diverse eisen gesteld. Naast het schrijven van broncode, moet je kwaliteit kunnen leveren, in teams kunnen werken, onderzoek kunnen doen naar nieuwe technologieën en frameworks en daarbij je keuzes goed onderbouwen en beschrijven. In de course DEA leer je behalve het schrijven van broncode voor gedistribueerde applicaties hoe je deze applicaties testbaar en onderhoudbaar maakt en houdt. Daarbij maak je gebruik van verschillende tools, frameworks en design patterns maar leer je deze ook zelf onderzoeken en op waarde schatten. <br>\r\n            Deze course bouwt voort op de voorkennis uit de courses SPD en OOPD die je met goed gevolg hebt afgerond. We maken gebruik van het Java platform, maar zullen vooral ingaan op de concepten en ideeën achter de gebruikte technologie zodat je snel kunt wisselen naar een vergelijkbaar platform zoals .NET.  </p>\r\n\r\n        <h2><a id=\"1.2 Literatuur  benodigde software\" name=\"1.2 Literatuur  benodigde software\"><strong>1.2 Literatuur  benodigde software</strong></a></h2>\r\n\r\n        <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"line-height:20.8px; width:502px\">\r\n            <tbody>\r\n            <tr>\r\n                <td style=\"height:2px; width:91px\">\r\n                    <p>Verplichte literatuur</p>\r\n                </td>\r\n                <td style=\"height:2px; width:548px\">\r\n                    <p>De volgende bronnen behoren tot de toetsstof:</p>\r\n\r\n                    <ul>\r\n                        <li>Studiehandleiding course DEA (dit document dus)</li>\r\n                        <li>Sheets course DEA (digitaal)</li>\r\n                        <li>ISBN 9780596803735, Java: The Good Parts (Waldo)</li>\r\n                        <li>ISBN 9780321127426, Patterns of Enterprise Application Architecture (Fowler)</li>\r\n                        <li>ISBN 0076092037224, Applying UML and Patterns (Larman)</li>\r\n                        <li>PluralSight account </li>\r\n                    </ul>\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td style=\"height:2px; width:91px\">\r\n                    <p>Aanbevolen literatuur</p>\r\n                </td>\r\n                <td style=\"height:2px; width:548px\">\r\n                    <p>Van de volgende boeken worden specifieke hoofdstukken aanbevolen voor de komende lessen. De gebruikte sheets en codevoorbeelden bevatten stof die voortkomt uit deze boeken.</p>\r\n\r\n                    <ul>\r\n                        <li>ISBN 9780201633610, Design Patterns: Elements of Reusable Object-Oriented Software</li>\r\n                        <li>ISBN 9780132350884, Clean Code: A Handbook of Agile Software Craftsmanship</li>\r\n                    </ul>\r\n\r\n                    <p>De volgende boeken helpen je extra te oefenen met de stof en zijn erg bruikbaar gebleken ook na je studiecarriere.</p>\r\n\r\n                    <ul>\r\n                        <li>ISBN 9780201485677, Refactoring: Improving the Design of Existing Code</li>\r\n                        <li>ISBN 9780321146533, Test Driven Development: By Example</li>\r\n                        <li>ISBN 9780321503626, Growing Object-Oriented Software, Guided by Tests</li>\r\n                        <li>ISBN 9780321213358, Refactoring to Patterns</li>\r\n                        <li>ISBN 9781449365110, Java Web Services: Up and Running</li>\r\n                        <li>ISBN 9780131857254, Agile Principles, Patterns, and Practices in C#</li>\r\n                        <li>ISBN 9780321356680, Effective Java (2nd Edition) (Java Series)</li>\r\n                    </ul>\r\n                </td>\r\n            </tr>\r\n            </tbody>\r\n        </table>\r\n\r\n        <p><strong>Codevoorbeelden</strong></p>\r\n\r\n        <p>In de les zal gebruik gemaakt worden van codevoorbeelden, soms vanaf “scratch”, soms is er al code die uitgelegd worden. De broncode in zijn verschillende stadia is te downloaden en te gebruiken via github: <a href=\"https://onderwijsonline.han.nl/elearning/lesson/MNZpYrxDhttps://github.com/ddoa/dea-code-examples\"><strong>https://github.com/ddoa/dea-code-examples</strong></a>. Je kunt de code als zip-downloaden maar als je <a href=\"https://onderwijsonline.han.nl/elearning/lesson/MNZpYrxDhttp://git-scm.com/downloads\">git</a> installeert en gebruikt (bijvoorbeeld samen met <a href=\"https://onderwijsonline.han.nl/elearning/lesson/MNZpYrxDhttp://sourcetreeapp.com/\">SourceTree</a>) dan kun je wisselen tussen twee verschillende branches: master (startcode) en exercise-results (bevat uitwerkingen van de oefeningen en workshops). </p>\r\n\r\n        <p><strong>Software</strong></p>\r\n\r\n        <p><a href=\"https://onderwijsonline.han.nl/elearning/lesson/MNZpYrxDhttps://maven.apache.org/download.cgi\" target=\"_blank\">Maven 3.3</a> of hoger</p>\r\n\r\n        <p><a href=\"https://onderwijsonline.han.nl/elearning/lesson/MNZpYrxDhttp://www.eclipse.org/downloads/eclipse-packages/\" target=\"_blank\">Eclipse IDE for Java Developers</a></p>\r\n\r\n        <p>IntelliJ (vraag een studentlicentie aan via <a href=\"https://onderwijsonline.han.nl/elearning/lesson/MNZpYrxDhttp://http://jetbrains.com/student\" target=\"_blank\">http://jetbrains.com/student</a> en <a href=\"https://onderwijsonline.han.nl/elearning/lesson/MNZpYrxDhttps://www.jetbrains.com/idea/download/\" target=\"_blank\">download</a> de Ultimate versie).</p>\r\n\r\n        <p>UML tooling zoals Astah (Professional versie beschikbaar voor <a href=\"https://onderwijsonline.han.nl/elearning/lesson/MNZpYrxDhttp://astah.net/student-license-request\" target=\"_blank\">studenten</a>).</p>\r\n\r\n        <h1><a id=\"2. Praktische informatie\" name=\"2. Praktische informatie\"><strong>2. PRAKTISCHE INFORMATIE</strong></a></h1>\r\n\r\n        <p> </p>\r\n\r\n        <h2><a id=\"2.1 Studiepunten en studiebelasting\" name=\"2.1 Studiepunten en studiebelasting\">2.1 Studiepunten, studiebelasting</a></h2>\r\n\r\n        <p>Deze OWE heeft een omvang van 7,5 studiepunten (EC). Dit komt neer op een gemiddelde studiebelasting van 20 uur per week. Per week is gemiddeld 3 uur theorie en 6 uur begeleid practicum, zodat er voor zelfstudie dan nog ongeveer 11 uur over is.</p>\r\n\r\n        <h2><a name=\"2.2 Docententeam\">2.2 Docententeam</a></h2>\r\n\r\n        <p>Bij de uitvoering zijn de volgende docenten betrokken:</p>\r\n\r\n        <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"line-height:20.8px\">\r\n            <tbody>\r\n            <tr>\r\n                <td style=\"width:317px\">Uwe van Heesch</td>\r\n                <td style=\"width:317px\">\r\n                    <p>uwe.vanheesch@han.nl</p>\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td style=\"width:317px\">Meron Brouwer</td>\r\n                <td style=\"width:317px\">\r\n                    <p>Meron.Brouwer@han.nl</p>\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td style=\"width:317px\">Bart van der Wall</td>\r\n                <td style=\"width:317px\">\r\n                    <p>bart.vanderwal@han.nl</p>\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td style=\"width:317px\">Michel Koolwaaij</td>\r\n                <td style=\"width:317px\">\r\n                    <p>Michel.Koolwaaij@han.nl</p>\r\n                </td>\r\n            </tr>\r\n            </tbody>\r\n        </table>\r\n\r\n        <p>Coordinator/trekker van de course is Meron Brouwer (Meron.Brouwer@han.nl). Als je vragen hebt over de course die niet klas-gerelateerd zijn, stuur hem dan een mailtje.</p>\r\n\r\n        <h2><a id=\"2.3 Inhoud en onderdelen\" name=\"2.3 Inhoud en onderdelen\">2.3 Inhoud en onderdelen</a></h2>\r\n\r\n        <h2>Thema\'s</h2>\r\n\r\n        <p>De course bestaat uit twee thema’s:</p>\r\n\r\n        <ul>\r\n            <li>Software craftsmanship, bestaande uit de onderwerpen:\r\n                <ul>\r\n                    <li>Installatie IDE, software, instellingen, gereedschap</li>\r\n                    <li>Unittesten</li>\r\n                    <li>Java APIs: Threads, Exceptions, Sockets</li>\r\n                    <li>Maven</li>\r\n                    <li>TDD</li>\r\n                    <li>Design Patterns</li>\r\n                    <li>SOLID principes</li>\r\n                </ul>\r\n            </li>\r\n            <li>Enterprise Architecures, bestaande uit de onderwerpen:\r\n                <ul>\r\n                    <li>Architectuur: UML packagediagrammen, UML deploymentdiagrammen.</li>\r\n                    <li>Architectuurstijlen, -patronen en –principes.</li>\r\n                    <li>Werken onder architectuur met JEE.</li>\r\n                    <li>Onderzoek naar inpassing van nieuwe technoloie</li>\r\n                </ul>\r\n            </li>\r\n        </ul>\r\n\r\n        <h2>Backlog</h2>\r\n\r\n        <p>De te behandelen onderwerpen zijn ondergebracht in een Product Backlog</p>\r\n\r\n        <p>Deze bevat ook toetsen (in verschillende toetsvormen, waaronder een programmeertoets, een opdracht en een onderzoeksrapport). Elke toets/opdracht wordt beschreven en heeft een set aan leermiddelen. In vrijwel alle opdrachten staan de leermiddelen in een volgorde die overeenkomt met de lessen van de reguliere DEA-uitvoering.</p>\r\n\r\n        <p>De docent zal deze thema\'s ook in deze volgorde kort introduceren. Daarna kun je met behulp van de genoemde leermiddelen de onderwerpen verder uitdiepen.</p>\r\n\r\n        <p> </p>\r\n\r\n        <h2><a id=\"2.4 Competenties\" name=\"2.4 Competenties\">2.4 Competenties</a></h2>\r\n\r\n        <table border=\"1\" cellpadding=\"0\" cellspacing=\"0\" style=\"line-height:20.8px; width:497px\">\r\n            <tbody>\r\n            <tr>\r\n                <td style=\"width:100px\">\r\n                    <p><strong>competentie</strong></p>\r\n                </td>\r\n                <td style=\"width:397px\">\r\n                    <p><strong>omschrijving</strong></p>\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td style=\"width:100px\">\r\n                    <p>DEA.1</p>\r\n                </td>\r\n                <td style=\"width:397px\">De kandidaat richt zijn eigen ontwikkelomgeving in volgens gegeven procedures en kwaliteitsrichtlijnen.</td>\r\n            </tr>\r\n            <tr>\r\n                <td style=\"width:100px\">\r\n                    <p>DEA.2</p>\r\n                </td>\r\n                <td style=\"width:397px\">De kandidaat ontwikkelt gedistribueerde software volgens de principes van test-driven development.</td>\r\n            </tr>\r\n            <tr>\r\n                <td style=\"width:100px\">\r\n                    <p>DEA.3</p>\r\n                </td>\r\n                <td style=\"width:397px\">De kandidaat ontwikkelt gedistribueerde software gebruik makend van bestaande Java APIs.</td>\r\n            </tr>\r\n            <tr>\r\n                <td style=\"width:100px\">\r\n                    <p>DEA.4</p>\r\n                </td>\r\n                <td style=\"width:397px\">De kandidaat ontwikkelt gedistribueerde software met behulp van frameworks, applicatieservers en gedistribueerde protocollen. </td>\r\n            </tr>\r\n            <tr>\r\n                <td style=\"width:100px\">\r\n                    <p>DEA.5</p>\r\n                </td>\r\n                <td style=\"width:397px\">De kandidaat beschrijft de structuur, samenhang en samenwerking van componenten van een gedistribueerde applicatie in een architectuurmodel.</td>\r\n            </tr>\r\n            <tr>\r\n                <td style=\"width:100px\">\r\n                    <p>DEA.6</p>\r\n                </td>\r\n                <td style=\"width:397px\">De kandidaat doet op basis van eigen praktijkervaring en bestaande bronnen onderzoek naar een van de gegeven thema’s uit het gebied van gedistribueerde applicatieontwikkeling.</td>\r\n            </tr>\r\n            <tr>\r\n                <td style=\"width:100px\">\r\n                    <p>DEA.7</p>\r\n                </td>\r\n                <td style=\"width:397px\">De kandidaat verbetert een bestaand ontwerp voor een gedistribueerde applicatie door toepassing van refactorings en verschillende design patterns en realiseert de applicatie.</td>\r\n            </tr>\r\n            </tbody>\r\n        </table>\r\n\r\n        <h2> </h2>\r\n\r\n        <h2><a id=\"2.5 Beoordelingscriteria\" name=\"2.5 Beoordelingscriteria\">2.5 Beoordelingscriteria</a></h2>\r\n\r\n        <table border=\"1\" cellpadding=\"0\" cellspacing=\"0\" style=\"line-height:20.8px; width:497px\">\r\n            <tbody>\r\n            <tr>\r\n                <td style=\"width:100px\">\r\n                    <p><strong>Competentie</strong></p>\r\n                </td>\r\n                <td style=\"width:322px\">\r\n                    <p><strong>Beoordelingscriteria</strong></p>\r\n                </td>\r\n                <td style=\"width:75px\">\r\n                    <p><strong>Toets</strong></p>\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td style=\"width:100px\">\r\n                    <p>DEA.1</p>\r\n                </td>\r\n                <td style=\"width:322px\">\r\n                    <ul>\r\n                        <li>De softwaretoepassing kan aantoonbaar gecreëerd worden met Maven in en buiten de IDE met een passende naam, groep/package en versie.</li>\r\n                        <li>De softwaretoepassing kan in en buiten de IDE met Maven gecompileerd en ge-unittest worden.</li>\r\n                        <li>De softwaretoepassing bevat een Maven build-file met zelfstandig toegevoegde externe dependencies.</li>\r\n                    </ul>\r\n                </td>\r\n                <td style=\"width:75px\">\r\n                    <p>PO-Kwaliteit</p>\r\n\r\n                    <p>PO-Patterns</p>\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td style=\"width:100px\">\r\n                    <p>DEA.2</p>\r\n                </td>\r\n                <td style=\"width:322px\">\r\n                    <ul>\r\n                        <li>De softwaretoepassing bevat unittests voor broncode met als doel een coverage van 100%. Afwijkingen van de coverage worden mondeling gemotiveerd.</li>\r\n                        <li>In de softwaretoepassing zijn refactoring principes toegepast om bad smells uit broncode te verwijderen.</li>\r\n                    </ul>\r\n                </td>\r\n                <td style=\"width:75px\">PO-Kwaliteit</td>\r\n            </tr>\r\n            <tr>\r\n                <td style=\"width:100px\">\r\n                    <p>DEA.3</p>\r\n                </td>\r\n                <td style=\"width:322px\">\r\n                    <ul>\r\n                        <li>In de softwaretoepassing is de Thread API correct toegepast door gebruik van Thread, Runnable en synchronized.</li>\r\n                        <li>De softwaretoepassing bevat correcte foutafhandeling door het gebruik van checked en unchecked exceptions.</li>\r\n                        <li>De softwaretoepassing maakt correct gebruik van de Sockets API.</li>\r\n                    </ul>\r\n                </td>\r\n                <td style=\"width:75px\">PO-Kwaliteit</td>\r\n            </tr>\r\n            <tr>\r\n                <td style=\"width:100px\">\r\n                    <p>DEA.4</p>\r\n                </td>\r\n                <td style=\"width:322px\">\r\n                    <ul>\r\n                        <li>In de softwaretoepassing is de koppeling tussen componenten verlaagd door gebruik van een dependency injection framework. Er zijn voldoende slagende unit-test die de verlaagde koppeling aantoont.</li>\r\n                        <li>De softwaretoepassing bevat een eigen gebouwde REST-service. </li>\r\n                        <li>De softwaretoepassing voldoet aan de door de HAN gegeven en de student aangevulde ontwerpen en (functionele en niet-functionele) eisen uit het technisch ontwerp en implementeert de verplichte architectuurpatterns (Fowler).</li>\r\n                        <li>De softwaretoepassing wordt gedocumenteerd met een tabel met functionele eisen en niet-functionele eisen waaruit duidelijk wordt waar deze eisen in de broncode geïmplementeerd zijn. In de broncode staat cross-references naar deze eisen zodat duidelijk wordt welke eis waar in de broncode is geïmplementeerd.</li>\r\n                        <li>De softwaretoepassing bevat een databasekoppeling waarbij gebruik is van een Java API zoals JDBC.</li>\r\n                    </ul>\r\n                </td>\r\n                <td style=\"width:75px\">\r\n                    <p>PO-EA</p>\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td style=\"width:100px\">\r\n                    <p>DEA.5</p>\r\n                </td>\r\n                <td style=\"width:322px\">\r\n                    <ul>\r\n                        <li>Het softwareontwerp bevat voor een gegeven casusbeschrijving een correct logisch UML packagediagram bestaande uit packages, dependencies, classes en interfaces. Het diagram is voorzien van een toelichting waaruit blijkt hoe het diagram tot stand is gekomen en welke designbeslissingen gemaakt zijn.</li>\r\n                        <li>Het softwareontwerp bevat voor een gegeven casusbeschrijving en op basis van een correct UML deploymentdiagram bestaande uit nodes, protocollen en componenten. Het diagram is voorzien van een toelichting waaruit blijkt hoe het diagram tot stand is gekomen en welke designbeslissingen gemaakt zijn.</li>\r\n                        <li>Het softwareontwerp voldoet als document aan de ICA stijlkaart. </li>\r\n                    </ul>\r\n                </td>\r\n                <td style=\"width:75px\">\r\n                    <p>PO-EA</p>\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td style=\"width:100px\">\r\n                    <p>DEA.6</p>\r\n                </td>\r\n                <td style=\"width:322px\">\r\n                    <ul>\r\n                        <li>Het onderzoeksrapport bevat een correcte doelstelling, hoofdvraag en deelvragen. De conclusie geeft aan in hoeverre de doelstelling gehaald is en de vragen beantwoord zijn.</li>\r\n                        <li>Het onderzoeksrapport bevat gestructureerde doel- en doelgroepgerichte teksten.</li>\r\n                        <li>Het onderzoeksrapport is geschreven in correct Nederlands (spelling, grammatica en zakelijke schrijfstijl) en voldoet aan de ICA stijlkaart.</li>\r\n                        <li>Het onderzoeksrapport is gebaseerd op eigen uitgevoerd bieb- en labonderzoek zoals beschreven in de ICA-methodenkaart voor praktijkonderzoek. Bieb-onderzoek voldoet o.a. aan APA-normen voor bronvermelding en van het labonderzoek zijn meetopstellingen en –resultaten beschikbaar ten behoeve van controleerbaarheid en reproduceerbaarheid.</li>\r\n                        <li>Het onderzoeksrapport beschrijft en motiveert de gekozen onderzoeksmethoden.</li>\r\n                        <li>Het onderzoeksrapport beschrijft voldoende inhoudelijke verifieerbare kennis.</li>\r\n                    </ul>\r\n                </td>\r\n                <td style=\"width:75px\">E-EA</td>\r\n            </tr>\r\n            <tr>\r\n                <td style=\"width:100px\">\r\n                    <p>DEA.7</p>\r\n                </td>\r\n                <td style=\"width:322px\">\r\n                    <ul>\r\n                        <li>De softwaretoepassing bevat verbeteringen in de vorm van verschillend refactorings die de bijpassende “bad smell” in code oplossen.</li>\r\n                        <li>De softwaretoepassing bevat verbeteringen in de vorm van design patterns als gevolg van herkenbare tekortkomingen in een bestaand ontwerp.</li>\r\n                        <li>De softwaretoepassing is gerealiseerd in Java door gebruik te maken van correcte OO principes (inheritance, delegation, polymorfisme, interfaces, encapsulatie).</li>\r\n                    </ul>\r\n                </td>\r\n                <td style=\"width:75px\">\r\n                    <p>PO-Patterns</p>\r\n                </td>\r\n            </tr>\r\n            </tbody>\r\n        </table>\r\n\r\n        <p> </p>\r\n\r\n        <h2><a id=\"2.6 Beoordeling en producten\" name=\"2.6 Beoordeling en producten\">2.6 Beoordeling en producten</a></h2>\r\n\r\n        <ul>\r\n            <li>Alle toetsen, m.u.v. de onderzoeksopdracht maak je zelfstandig, individueel dus.</li>\r\n            <li>In het lesschema wordt onderscheid gemaakt tussen oefeningen en opdrachten. Oefeningen zijn om zelfstandig of in de klas te kunnen oefenen in een gesloten context, opdrachten zijn <u>toetsen</u>.</li>\r\n            <li>De weeknummers van de genoemde toetsen zijn een indicatie, de exacte toetsdata vind je op het toetsrooster dat op iSAS staat, <a href=\"https://onderwijsonline.han.nl/elearning/lesson/MNZpYrxDhttp://isas.han.nl\">http://isas.han.nl</a>.  </li>\r\n        </ul>\r\n\r\n        <table border=\"1\" cellpadding=\"0\" cellspacing=\"0\" style=\"line-height:20.8px; width:505px\">\r\n            <tbody>\r\n            <tr>\r\n                <td style=\"width:106px\">\r\n                    <p><strong>Deelproduct</strong></p>\r\n                </td>\r\n                <td style=\"width:57px\">\r\n                    <p><strong>Week</strong></p>\r\n                </td>\r\n                <td style=\"width:161px\">\r\n                    <p><strong>Vorm</strong></p>\r\n                </td>\r\n                <td style=\"width:104px\">\r\n                    <p><strong>Beoordeling*</strong></p>\r\n                </td>\r\n                <td style=\"width:78px\">\r\n                    <p><strong>I/G</strong></p>\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td style=\"width:106px\">\r\n                    <p>Programmeeropdracht Kwaliteit</p>\r\n                </td>\r\n                <td style=\"width:57px\">\r\n                    <p>3</p>\r\n                </td>\r\n                <td style=\"width:161px\">(Performance) Assessment</td>\r\n                <td style=\"width:104px\">\r\n                    <p>cijfer / 25%</p>\r\n                </td>\r\n                <td style=\"width:78px\">\r\n                    <p>Individueel</p>\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td style=\"width:106px\">Programmeeropdracht Design Patterns</td>\r\n                <td style=\"width:57px\">\r\n                    <p>5</p>\r\n                </td>\r\n                <td style=\"width:161px\">(Performance) Assessment</td>\r\n                <td style=\"width:104px\">\r\n                    <p>cijfer / 25%</p>\r\n                </td>\r\n                <td style=\"width:78px\">\r\n                    <p>Individueel</p>\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td style=\"width:106px\">\r\n                    <p>Programmeeropdracht Enterprise Applications</p>\r\n                </td>\r\n                <td style=\"width:57px\">\r\n                    <p>7</p>\r\n                </td>\r\n                <td style=\"width:161px\">Opdracht</td>\r\n                <td style=\"width:104px\">\r\n                    <p>cijfer / 20%</p>\r\n                </td>\r\n                <td style=\"width:78px\">\r\n                    <p>Individueel</p>\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td style=\"width:106px\">\r\n                    <p>Onderzoeksrapport Enterprise Applications</p>\r\n                </td>\r\n                <td style=\"width:57px\">\r\n                    <p>8</p>\r\n                </td>\r\n                <td style=\"width:161px\">Verslag</td>\r\n                <td style=\"width:104px\">\r\n                    <p>cijfer / 30%</p>\r\n                </td>\r\n                <td style=\"width:78px\">\r\n                    <p>Groep. Cijfer wordt voor de groep bepaald maar kan individueel afwijken naar boven of naar beneden. </p>\r\n                </td>\r\n            </tr>\r\n            </tbody>\r\n        </table>\r\n\r\n        <p> </p>\r\n\r\n        <h2><a id=\"2.7 Omschrijving deelproducten\" name=\"2.7 Omschrijving deelproducten\">2.7 Omschrijving deelproducten</a></h2>\r\n\r\n        <p><strong>Programmeeropdracht Kwaliteit</strong></p>\r\n\r\n        <p>In deze opdracht is een selectie van de stof uit de weken 1 en 2 verwerkt tot een set opgaven die je in 2 uur in de klas \"live\" uitprogrammeert. In principe is je docent in de klas aanwezig zodat hij direct de opgaven kan afvinken en nakijken, zo niet dan maak je de opgaven en worden deze naderhand nagekeken, in de klas is dan een surveillant aanwezig. Je mag gedurende de toets gebruik maken van al het lesmateriaal, boeken en internet. Je mag geen contact hebben met anderen wie welk medium dan ook, in dat geval wordt er onherroepelijk een 1 op je toets gezet en wordt er melding gemaakt bij de examencommissie. </p>\r\n\r\n        <p><strong>Programmeeropdracht Patterns</strong></p>\r\n\r\n        <p>In deze opdracht is een selectie van de stof uit de weken 3 en 4 verwerkt tot een set opgaven die je in 2 uur in de klas \"live\" uitprogrammeert. In principe is je docent in de klas aanwezig zodat hij direct de opgaven kan afvinken en nakijken, zo niet dan maak je de opgaven en worden deze naderhand nagekeken, in de klas in dan een surveillant aanwezig. Je mag gedurende de toets gebruik maken van al het lesmateriaal, boeken en internet. Je mag geen contact hebben met anderen wie welk medium dan ook, in dat geval wordt er onherroepelijk een 1 op je toets gezet en wordt er melding gemaakt bij de examencommissie. </p>\r\n\r\n        <p><strong>Programmeeropdracht Enterprise Applications</strong></p>\r\n\r\n        <p>In deze opdracht werk je gedurende twee weken aan een casus waarbij je gebruik mag maken van oefeningen om specifieke onderdelen los te leren. Je komt alleen in aanmerking voor een beoordeling als je een demo van de werkende functionaliteit aan je docent hebt laten zien. </p>\r\n\r\n        <p>Hoewel deze opdracht deel uitmaakt van een lessenreeks die zich richt op het JEE platform, is het toegestaan de implementatie te baseren op Spring of .Net. In beide gevallen is het echter de verantwoordelijkheid van de student dit eerst af te stemmen met de docent. Indien de docent aangeeft zelf niet in staat te zijn de opdracht dan voldoende te kunnen beoordelen, is het aan de student om contact op te nemen met een andere docent die dat wel kan. </p>\r\n\r\n        <p><strong>Onderzoeksopdracht Enterprise Applications</strong></p>\r\n\r\n        <p>In deze opdracht doe je zelfstandig onderzoek naar een onderwerp dat verbredend of verdiepend is voor de programmeeropdracht Enterprise Applications. Je maakt hierbij gebruik van de ICA methodenkaart voor praktijkonderzoek en past de onderzoeksgebieden \"bieb\" en \"lab\" toe.</p>\r\n    </div>\r\n</div>');

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
(8, 7, 'Inrichting', 'De kandidaat richt zijn eigen ontwikkelomgeving in volgens gegeven procedures en kwaliteitsrichtlijnen'),
(9, 7, 'Test-driven ontwikkeling', 'De kandidaat ontwikkelt gedistribueerde software volgens de principes van test-driven development'),
(10, 7, 'Werken met Java APIs', 'De kandidaat ontwikkelt gedistribueerde software gebruik makend van bestaande Java APIs.');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `Les`
--

CREATE TABLE `Les` (
  `id` int(11) NOT NULL,
  `naam` text NOT NULL,
  `datum` date NOT NULL,
  `module_id` int(11) NOT NULL,
  `document_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Gegevens worden geëxporteerd voor tabel `Les`
--

INSERT INTO `Les` (`id`, `naam`, `datum`, `module_id`, `document_id`) VALUES
(10, 'Inleiding', '2019-01-01', 7, 9);

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
(7, 10, 4);

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
(21, 10, 8);

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
(7, 'OOSE', 'Aan ontwikkelaars worden steeds hogere en meer diverse eisen gesteld. Naast het schrijven van broncode, moet je kwaliteit kunnen leveren, in teams kunnen werken, onderzoek kunnen doen naar nieuwe technologieën en frameworks en daarbij je keuzes goed onderbouwen en beschrijven. In de course DEA leer je behalve het schrijven van broncode voor gedistribueerde applicaties hoe je deze applicaties testbaar en onderhoudbaar maakt en houdt. Daarbij maak je gebruik van verschillende tools, frameworks en design patterns maar leer je deze ook zelf onderzoeken en op waarde schatten. ', '2019-01-01', '2019-06-01', 4);

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
(12, 7, 9),
(13, 7, 10);

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
(4, 'HBO ICT Deeltijd', 2019);

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
(14, 'Jan', 'Jansen', 'janjansen@gmail.com'),
(15, 'Henk', 'Henksma', 'henkhenksma@gmail.com'),
(16, 'Justus', 'Usus', 'justususus@gmail.com');

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
(9, 14),
(10, 16);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT voor een tabel `Document`
--
ALTER TABLE `Document`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT voor een tabel `Leerdoel`
--
ALTER TABLE `Leerdoel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT voor een tabel `Les`
--
ALTER TABLE `Les`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT voor een tabel `LesDocent`
--
ALTER TABLE `LesDocent`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT voor een tabel `LesLeerdoel`
--
ALTER TABLE `LesLeerdoel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT voor een tabel `Module`
--
ALTER TABLE `Module`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT voor een tabel `ModuleStudent`
--
ALTER TABLE `ModuleStudent`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT voor een tabel `Opleiding`
--
ALTER TABLE `Opleiding`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT voor een tabel `Persoon`
--
ALTER TABLE `Persoon`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT voor een tabel `Recht`
--
ALTER TABLE `Recht`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `Student`
--
ALTER TABLE `Student`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

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
