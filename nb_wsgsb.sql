-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : ven. 01 déc. 2023 à 10:58
-- Version du serveur : 10.4.28-MariaDB
-- Version de PHP : 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `nb_gsb`
--

-- --------------------------------------------------------

--
-- Structure de la table `activite_compl`
--

CREATE TABLE `activite_compl` (
  `id_activite_compl` int(11) NOT NULL,
  `date_activite` date DEFAULT NULL,
  `lieu_activite` varchar(200) DEFAULT NULL,
  `theme_activite` varchar(100) DEFAULT NULL,
  `motif_activite` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `composant`
--

CREATE TABLE `composant` (
  `id_composant` int(11) NOT NULL,
  `lib_composant` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `composant`
--

INSERT INTO `composant` (`id_composant`, `lib_composant`) VALUES
(1, 'Amoxicilline'),
(2, 'Triamcinolone'),
(3, 'Néomycine'),
(4, 'Nystatine'),
(5, 'Tyrothricine'),
(6, 'Tétracaïne'),
(7, 'Acide ascorbique'),
(8, 'Erythromycine'),
(9, 'Dextropropoxyphène'),
(10, 'Paracétamol'),
(11, 'Acide acétylsalicylique'),
(12, 'Clarithromycine'),
(13, 'Clomipramine'),
(14, 'Mirtazapine'),
(15, 'Doxylamine'),
(16, 'Méclozine'),
(17, 'Adrafinil'),
(18, 'Diphénydramine'),
(19, 'Josamycine'),
(20, 'Oxytétracycline'),
(21, 'Lidocaïne'),
(22, 'Lithium'),
(23, 'Sulbutiamine'),
(24, 'Pyrazinamide'),
(25, 'Bacitracine'),
(26, 'Paroxétine'),
(27, 'Fosfomycine trométamol'),
(28, 'Acide clavulanique'),
(29, 'Codéine');

-- --------------------------------------------------------

--
-- Structure de la table `constituer`
--

CREATE TABLE `constituer` (
  `id_composant` int(11) NOT NULL,
  `id_medicament` int(11) NOT NULL,
  `qte_composant` decimal(11,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `constituer`
--

INSERT INTO `constituer` (`id_composant`, `id_medicament`, `qte_composant`) VALUES
(1, 2, 200.00),
(1, 3, 400.00),
(1, 4, 100.00),
(2, 1, 50.00),
(2, 28, 400.00),
(3, 1, 100.00),
(4, 1, 100.00),
(5, 1, 500.00),
(6, 5, 100.00),
(6, 6, 300.00),
(6, 7, 40.00),
(7, 8, 200.00),
(8, 8, 100.00),
(9, 9, 200.00),
(9, 10, 50.00),
(10, 7, 200.00),
(10, 10, 100.00),
(10, 11, 300.00),
(11, 12, 200.00),
(12, 13, 500.00),
(13, 14, 200.00),
(14, 7, 100.00),
(14, 10, 20.00),
(14, 11, 100.00),
(15, 15, 200.00),
(16, 16, 400.00),
(17, 17, 200.00),
(18, 18, 100.00),
(19, 19, 200.00),
(20, 20, 200.00),
(20, 21, 300.00),
(21, 22, 200.00),
(22, 10, 30.00),
(23, 23, 300.00),
(24, 24, 200.00),
(25, 25, 300.00),
(26, 26, 300.00),
(27, 5, 400.00),
(27, 7, 50.00),
(28, 27, 100.00);

-- --------------------------------------------------------

--
-- Structure de la table `dosage`
--

CREATE TABLE `dosage` (
  `id_dosage` int(11) NOT NULL,
  `qte_dosage` int(11) DEFAULT NULL,
  `unite_dosage` char(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `dosage`
--

INSERT INTO `dosage` (`id_dosage`, `qte_dosage`, `unite_dosage`) VALUES
(1, 1, 'Heure'),
(2, 2, 'Heure'),
(3, 1, 'Jour'),
(4, 2, 'Jour'),
(5, 3, 'Jour'),
(6, 4, 'Jour'),
(7, 1, 'Semaine'),
(8, 2, 'Semaine'),
(9, 3, 'Semaine'),
(10, 4, 'Semaine');

-- --------------------------------------------------------

--
-- Structure de la table `etat`
--

CREATE TABLE `etat` (
  `id_etat` int(11) NOT NULL,
  `lib_etat` varchar(120) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `etat`
--

INSERT INTO `etat` (`id_etat`, `lib_etat`) VALUES
(1, 'Saisie clôturée'),
(2, 'Fiche créée, saisie en cours'),
(3, 'Remboursée'),
(4, 'Validée et mise en paiement');

-- --------------------------------------------------------

--
-- Structure de la table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `famille`
--

CREATE TABLE `famille` (
  `id_famille` int(11) NOT NULL,
  `lib_famille` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `famille`
--

INSERT INTO `famille` (`id_famille`, `lib_famille`) VALUES
(1, 'Antalgiques en association'),
(2, 'Antalgiques antipyrétiques en association'),
(3, 'Antidépresseur d\'action centrale'),
(4, 'Antivertigineux antihistaminique H1'),
(5, 'Antibiotique antituberculeux'),
(6, 'Antibiotique antiacnéique local'),
(7, 'Antibiotique de la famille des béta-lactamines (pénicilline A)'),
(8, 'Antibiotique de la famille des cyclines'),
(9, 'Antibiotique de la famille des macrolides'),
(10, 'Antihistaminique H1 local'),
(11, 'Antidépresseur imipraminique (tricyclique)'),
(12, 'Antidépresseur inhibiteur sélectif de la recapture de la sérotonine'),
(13, 'Antibiotique local (ORL)'),
(14, 'Antidépresseur IMAO non sélectif'),
(15, 'Antibiotique ophtalmique'),
(16, 'Antipsychotique normothymique'),
(17, 'Antibiotique urinaire minute'),
(18, 'Corticoïde antibiotique et antifongique à  usage local'),
(19, 'Hypnotique antihistaminique'),
(20, 'Psychostimulant antiasthénique');

-- --------------------------------------------------------

--
-- Structure de la table `formuler`
--

CREATE TABLE `formuler` (
  `id_medicament` int(11) NOT NULL,
  `id_presentation` int(11) NOT NULL,
  `qte_formuler` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `formuler`
--

INSERT INTO `formuler` (`id_medicament`, `id_presentation`, `qte_formuler`) VALUES
(1, 1, 10),
(1, 7, 54),
(2, 2, 12),
(2, 8, 84),
(3, 3, 9),
(3, 9, 42),
(4, 4, 25),
(4, 10, 23),
(5, 5, 2),
(5, 11, 25),
(6, 6, 51),
(6, 12, 15),
(7, 7, 12),
(7, 13, 17),
(8, 8, 14),
(8, 14, 18),
(9, 1, 95),
(9, 9, 47),
(10, 2, 35),
(10, 10, 12),
(11, 3, 68),
(11, 11, 23),
(12, 4, 35),
(12, 12, 25),
(13, 5, 36),
(13, 13, 45),
(14, 6, 57),
(14, 14, 63),
(15, 1, 47),
(15, 7, 12),
(16, 2, 51),
(16, 8, 52),
(17, 3, 8),
(17, 9, 68),
(18, 4, 84),
(18, 10, 38),
(19, 5, 29),
(19, 11, 39),
(20, 6, 34),
(20, 12, 54),
(21, 7, 38),
(21, 13, 5),
(22, 8, 42),
(22, 14, 42),
(23, 3, 23),
(23, 9, 50),
(24, 4, 54),
(24, 10, 68),
(25, 5, 37),
(25, 11, 39),
(26, 6, 84),
(26, 12, 7),
(27, 7, 45),
(27, 13, 71),
(28, 8, 57),
(28, 14, 35);

-- --------------------------------------------------------

--
-- Structure de la table `frais`
--

CREATE TABLE `frais` (
  `id_frais` int(11) NOT NULL,
  `id_etat` int(11) NOT NULL,
  `anneemois` char(7) NOT NULL,
  `id_visiteur` int(11) NOT NULL,
  `nbjustificatifs` int(11) DEFAULT NULL,
  `datemodification` date DEFAULT NULL,
  `montantvalide` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `frais`
--

INSERT INTO `frais` (`id_frais`, `id_etat`, `anneemois`, `id_visiteur`, `nbjustificatifs`, `datemodification`, `montantvalide`) VALUES
(1, 4, '2017-09', 1, 6, '2023-11-30', 845.00),
(2, 3, '2019-07', 5, 1, '2019-07-01', 917.00),
(3, 3, '2019-07', 5, 1, '2019-07-01', 917.00),
(4, 2, '2020-05', 3, 5, '2020-05-15', 1234.50),
(5, 1, '2021-02', 7, 2, '2021-02-10', 750.25),
(6, 4, '2019-11', 2, 4, '2019-11-20', 1045.75),
(7, 3, '2022-03', 8, 3, '2022-03-05', 625.00),
(8, 2, '2020-12', 6, 6, '2020-12-28', 1500.75),
(13, 4, '2019-08', 5, 4, '2019-07-01', 865.00),
(14, 2, '2017-09', 1, 4, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `fraisforfait`
--

CREATE TABLE `fraisforfait` (
  `id_fraisforfait` int(11) NOT NULL,
  `lib_fraisforfait` varchar(100) DEFAULT NULL,
  `montant_frais_forfait` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `fraisforfait`
--

INSERT INTO `fraisforfait` (`id_fraisforfait`, `lib_fraisforfait`, `montant_frais_forfait`) VALUES
(1, 'Forfait Etape', 180.00),
(2, 'Frais Kilométrique', 0.89),
(3, 'Nuitée Hôtel', 90.00),
(4, 'Repas Restaurant', 35.00);

-- --------------------------------------------------------

--
-- Structure de la table `fraishorsforfait`
--

CREATE TABLE `fraishorsforfait` (
  `id_fraishorsforfait` int(11) NOT NULL,
  `id_frais` int(11) NOT NULL,
  `date_fraishorsforfait` date DEFAULT NULL,
  `montant_fraishorsforfait` decimal(10,2) DEFAULT NULL,
  `lib_fraishorsforfait` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `fraishorsforfait`
--

INSERT INTO `fraishorsforfait` (`id_fraishorsforfait`, `id_frais`, `date_fraishorsforfait`, `montant_fraishorsforfait`, `lib_fraishorsforfait`) VALUES
(4, 2, '2020-05-25', 30.00, 'Frais de transport'),
(9, 1, '2022-01-10', 25.50, 'Frais de repas'),
(10, 1, '2022-02-15', 42.75, 'Frais de déplacement'),
(11, 1, '2022-03-20', 15.25, 'Frais de téléphone'),
(12, 1, '2022-04-25', 50.00, 'Frais de fournitures'),
(13, 1, '2023-11-01', 15.00, 'Frais de voiture');

-- --------------------------------------------------------

--
-- Structure de la table `interagir`
--

CREATE TABLE `interagir` (
  `id_medicament` int(11) NOT NULL,
  `med_id_medicament` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `interagir`
--

INSERT INTO `interagir` (`id_medicament`, `med_id_medicament`) VALUES
(2, 5),
(2, 9),
(2, 20);

-- --------------------------------------------------------

--
-- Structure de la table `inviter`
--

CREATE TABLE `inviter` (
  `id_activite_compl` int(11) NOT NULL,
  `id_praticien` int(11) NOT NULL,
  `specialiste` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `laboratoire`
--

CREATE TABLE `laboratoire` (
  `id_laboratoire` int(11) NOT NULL,
  `nom_laboratoire` varchar(100) DEFAULT NULL,
  `chef_vente` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `laboratoire`
--

INSERT INTO `laboratoire` (`id_laboratoire`, `nom_laboratoire`, `chef_vente`) VALUES
(1, 'Bichat', 'Suzanne Terminus'),
(2, 'Gyverny', 'Marcel MacDouglas'),
(3, 'Swiss Kane', 'Alain Poure');

-- --------------------------------------------------------

--
-- Structure de la table `ligne_fraisforfait`
--

CREATE TABLE `ligne_fraisforfait` (
  `id_frais` int(11) NOT NULL,
  `id_fraisforfait` int(11) NOT NULL,
  `quantite_ligne` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `ligne_fraisforfait`
--

INSERT INTO `ligne_fraisforfait` (`id_frais`, `id_fraisforfait`, `quantite_ligne`) VALUES
(1, 2, 500),
(1, 3, 2),
(1, 4, 5);

-- --------------------------------------------------------

--
-- Structure de la table `medicament`
--

CREATE TABLE `medicament` (
  `id_medicament` int(11) NOT NULL,
  `id_famille` int(11) DEFAULT NULL,
  `depot_legal` varchar(100) DEFAULT NULL,
  `nom_commercial` varchar(100) DEFAULT NULL,
  `effets` varchar(512) DEFAULT NULL,
  `contre_indication` char(255) DEFAULT NULL,
  `prix_echantillon` decimal(11,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `medicament`
--

INSERT INTO `medicament` (`id_medicament`, `id_famille`, `depot_legal`, `nom_commercial`, `effets`, `contre_indication`, `prix_echantillon`) VALUES
(1, 18, '3MYC7', 'TRIMYCINE', 'Ce médicament est un corticoïde à  activité forte ou très forte associé à  un antibiotique et un antifongique, utilisé en application locale dans certaines atteintes cutanées surinfectées.', 'Ce médicament est contre-indiqué en cas d\'allergie à  l\'un des constituants, d\'infections de la peau ou de parasitisme non traités, d\'acné. Ne pas appliquer sur une plaie, ni sous un pansement occlusif.', 8.00),
(2, 7, 'ADIMOL9', 'ADIMOL', 'Ce médicament, plus puissant que les pénicillines simples, est utilisé pour traiter des infections bactériennes spécifiques.', 'Ce médicament est contre-indiqué en cas d\'allergie aux pénicillines ou aux céphalosporines.', 9.00),
(3, 7, 'AMOPIL7', 'AMOPIL', 'Ce médicament, plus puissant que les pénicillines simples, est utilisé pour traiter des infections bactériennes spécifiques.', 'Ce médicament est contre-indiqué en cas d\'allergie aux pénicillines. Il doit être administré avec prudence en cas d\'allergie aux céphalosporines.', 5.00),
(4, 7, 'AMOX45', 'AMOXAR', 'Ce médicament, plus puissant que les pénicillines simples, est utilisé pour traiter des infections bactériennes spécifiques.', 'La prise de ce médicament peut rendre positifs les tests de dépistage du dopage.', NULL),
(5, 7, 'AMOXIG12', 'AMOXI Gé', 'Ce médicament, plus puissant que les pénicillines simples, est utilisé pour traiter des infections bactériennes spécifiques.', 'Ce médicament est contre-indiqué en cas d\'allergie aux pénicillines. Il doit être administré avec prudence en cas d\'allergie aux céphalosporines.', 8.00),
(6, 13, 'APATOUX22', 'APATOUX Vitamine C', 'Ce médicament est utilisé pour traiter les affections de la bouche et de la gorge.', 'Ce médicament est contre-indiqué en cas d\'allergie à  l\'un des constituants, en cas de phénylcétonurie et chez l\'enfant de moins de 6 ans.', 5.00),
(7, 6, 'BACTIG10', 'BACTIGEL', 'Ce médicament est utilisé en application locale pour traiter l\'acné et les infections cutanées bactériennes associées.', 'Ce médicament est contre-indiqué en cas d\'allergie aux antibiotiques de la famille des macrolides ou des lincosanides.', 6.00),
(8, 9, 'BACTIV13', 'BACTIVIL', 'Ce médicament est utilisé pour traiter des infections bactériennes spécifiques.', 'Ce médicament est contre-indiqué en cas d\'allergie aux macrolides (dont le chef de file est l\'érythromycine).', 7.00),
(9, 2, 'BITALV', 'BIVALIC', 'Ce médicament est utilisé pour traiter les douleurs d\'intensité modérée ou intense.', 'Ce médicament est contre-indiqué en cas d\'allergie aux médicaments de cette famille, d\'insuffisance hépatique ou d\'insuffisance rénale.', 4.00),
(10, 2, 'CARTION6', 'CARTION', 'Ce médicament est utilisé dans le traitement symptomatique de la douleur ou de la fièvre.', 'Ce médicament est contre-indiqué en cas de troubles de la coagulation (tendances aux hémorragies), d\'ulcère gastroduodénal, maladies graves du foie.', 7.00),
(11, 9, 'CLAZER6', 'CLAZER', 'Ce médicament est utilisé pour traiter des infections bactériennes spécifiques. Il est également utilisé dans le traitement de l\'ulcère gastro-duodénal, en association avec d\'autres médicaments.', 'Ce médicament est contre-indiqué en cas d\'allergie aux macrolides (dont le chef de file est l\'érythromycine).', 2.00),
(12, 11, 'DEPRIL9', 'DEPRAMIL', 'Ce médicament est utilisé pour traiter les épisodes dépressifs sévères, certaines douleurs rebelles, les troubles obsessionnels compulsifs et certaines énurésies chez l\'enfant.', 'Ce médicament est contre-indiqué en cas de glaucome ou d\'adénome de la prostate, d\'infarctus récent, ou si vous avez reà§u un traitement par IMAO durant les 2 semaines précédentes ou en cas d\'allergie aux antidépresseurs imipraminiques.', 3.00),
(13, 3, 'DIMIRTAM6', 'DIMIRTAM', 'Ce médicament est utilisé pour traiter les épisodes dépressifs sévères.', 'La prise de ce produit est contre-indiquée en cas de d\'allergie à  l\'un des constituants.', 5.00),
(14, 2, 'DOLRIL7', 'DOLORIL', 'Ce médicament est utilisé dans le traitement symptomatique de la douleur ou de la fièvre.', 'Ce médicament est contre-indiqué en cas d\'allergie au paracétamol ou aux salicylates.', 11.00),
(15, 19, 'DORNOM8', 'NORMADOR', 'Ce médicament est utilisé pour traiter l\'insomnie chez l\'adulte.', 'Ce médicament est contre-indiqué en cas de glaucome, de certains troubles urinaires (rétention urinaire) et chez l\'enfant de moins de 15 ans.', 4.00),
(16, 4, 'EQUILARX6', 'EQUILAR', 'Ce médicament est utilisé pour traiter les vertiges et pour prévenir le mal des transports.', 'Ce médicament ne doit pas être utilisé en cas d\'allergie au produit, en cas de glaucome ou de rétention urinaire.', 7.00),
(17, 20, 'EVILR7', 'EVEILLOR', 'Ce médicament est utilisé pour traiter les troubles de la vigilance et certains symptomes neurologiques chez le sujet agé.', 'Ce médicament est contre-indiqué en cas d\'allergie à  l\'un des constituants.', 10.00),
(18, 10, 'INSXT5', 'INSECTIL', 'Ce médicament est utilisé en application locale sur les piqûres d\'insecte et l\'urticaire.', 'Ce médicament est contre-indiqué en cas d\'allergie aux antihistaminiques.', 5.00),
(19, 9, 'JOVAI8', 'JOVENIL', 'Ce médicament est utilisé pour traiter des infections bactériennes spécifiques.', 'Ce médicament est contre-indiqué en cas d\'allergie aux macrolides (dont le chef de file est l\'érythromycine).', 7.00),
(20, 8, 'LIDOXY23', 'LIDOXYTRACINE', 'Ce médicament est utilisé en injection intramusculaire pour traiter certaines infections spécifiques.', 'Ce médicament est contre-indiqué en cas d\'allergie à  l\'un des constituants. Il ne doit pas être associé aux rétinoïdes.', 6.00),
(21, 16, 'LITHOR12', 'LITHORINE', 'Ce médicament est indiqué dans la prévention des psychoses maniaco-dépressives ou pour traiter les états maniaques.', 'Ce médicament ne doit pas être utilisé si vous êtes allergique au lithium. Avant de prendre ce traitement, signalez à  votre médecin traitant si vous souffrez d\'insuffisance rénale, ou si vous avez un régime sans sel.', 8.00),
(22, 1, 'PARMOL16', 'PARMOCODEINE', 'Ce médicament est utilisé pour le traitement des douleurs lorsque des antalgiques simples ne sont pas assez efficaces.', 'Ce médicament est contre-indiqué en cas d\'allergie à  l\'un des constituants, chez l\'enfant de moins de 15 Kg, en cas d\'insuffisance hépatique ou respiratoire, d\'asthme, de phénylcétonurie et chez la femme qui allaite.', 5.00),
(23, 20, 'PHYSOI8', 'PHYSICOR', 'Ce médicament est utilisé pour traiter les baisses d\'activité physique ou psychique, souvent dans un contexte de dépression.', 'Ce médicament est contre-indiqué en cas d\'allergie à  l\'un des constituants.', 13.00),
(24, 5, 'PIRIZ8', 'PIRIZAN', 'Ce médicament est utilisé, en association à  d\'autres antibiotiques, pour traiter la tuberculose.', 'Ce médicament est contre-indiqué en cas d\'allergie à  l\'un des constituants, d\'insuffisance rénale ou hépatique, d\'hyperuricémie ou de porphyrie.', 11.00),
(25, 15, 'POMDI20', 'POMADINE', 'Ce médicament est utilisé pour traiter les infections oculaires de la surface de l\'oeil.', 'Ce médicament est contre-indiqué en cas d\'allergie aux antibiotiques appliqués localement.', 9.00),
(26, 12, 'TROXT21', 'TROXADET', 'Ce médicament est utilisé pour traiter la dépression et les troubles obsessionnels compulsifs. Il peut également être utilisé en prévention des crises de panique avec ou sans agoraphobie.', 'Ce médicament est contre-indiqué en cas d\'allergie au produit.', 4.00),
(27, 13, 'TXISOL22', 'TOUXISOL Vitamine C', 'Ce médicament est utilisé pour traiter les affections de la bouche et de la gorge.', 'Ce médicament est contre-indiqué en cas d\'allergie à  l\'un des constituants et chez l\'enfant de moins de 6 ans.', 7.00),
(28, 17, 'URIEG6', 'URIREGUL', 'Ce médicament est utilisé pour traiter les infections urinaires simples chez la femme de moins de 65 ans.', 'La prise de ce médicament est contre-indiquée en cas d\'allergie à  l\'un des constituants et d\'insuffisance rénale.', 5.00);

-- --------------------------------------------------------

--
-- Structure de la table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1);

-- --------------------------------------------------------

--
-- Structure de la table `offrir`
--

CREATE TABLE `offrir` (
  `id_medicament` int(11) NOT NULL,
  `id_rapport` int(11) NOT NULL,
  `qte_offerte` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `offrir`
--

INSERT INTO `offrir` (`id_medicament`, `id_rapport`, `qte_offerte`) VALUES
(2, 6, 1),
(6, 1, 4),
(6, 2, 3),
(8, 5, 3),
(10, 2, 2),
(12, 1, 2),
(12, 4, 2);

-- --------------------------------------------------------

--
-- Structure de la table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 2, 'auth_token', 'd22bfb302150b6fda4769657823c8a4dbc3c008dc7b2522a7c9d965677e9ed60', '[\"*\"]', NULL, NULL, '2023-11-30 14:42:12', '2023-11-30 14:42:12'),
(2, 'App\\Models\\User', 2, 'auth_token', '1be21d03046e1b6182b782e2e5db4f46f008a29ff6b81ce006dcc6a0d715a312', '[\"*\"]', NULL, NULL, '2023-11-30 14:46:19', '2023-11-30 14:46:19'),
(3, 'App\\Models\\User', 2, 'auth_token', '83a44d8cd2814e5c85bef864b5ae649b34c89c01164a73337c079cea2b407f40', '[\"*\"]', NULL, NULL, '2023-11-30 14:46:28', '2023-11-30 14:46:28');

-- --------------------------------------------------------

--
-- Structure de la table `posseder`
--

CREATE TABLE `posseder` (
  `id_praticien` int(11) NOT NULL,
  `id_specialite` int(11) NOT NULL,
  `diplome` varchar(100) DEFAULT NULL,
  `coef_prescription` decimal(11,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `praticien`
--

CREATE TABLE `praticien` (
  `id_praticien` int(11) NOT NULL,
  `id_type_praticien` int(11) DEFAULT NULL,
  `nom_praticien` varchar(100) DEFAULT NULL,
  `prenom_praticien` varchar(100) DEFAULT NULL,
  `adresse_praticien` varchar(200) DEFAULT NULL,
  `cp_praticien` char(5) DEFAULT NULL,
  `ville_praticien` varchar(100) DEFAULT NULL,
  `coef_notoriete` decimal(11,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `praticien`
--

INSERT INTO `praticien` (`id_praticien`, `id_type_praticien`, `nom_praticien`, `prenom_praticien`, `adresse_praticien`, `cp_praticien`, `ville_praticien`, `coef_notoriete`) VALUES
(1, 1, 'Notini', 'Alain', '114 r Authie', '85000', 'LA ROCHE SUR YON', 290.00),
(2, 2, 'Gosselin', 'Albert', '13 r Devon', '41000', 'BLOIS', 307.00),
(3, 5, 'Delahaye', 'André', '36 av 6 Juin', '25000', 'BESANCON', 185.00),
(4, 3, 'Leroux', 'André', '47 av Robert Schuman', '60000', 'BEAUVAIS', 172.00),
(5, 2, 'Desmoulins', 'Anne', '31 r St Jean', '30000', 'NIMES', 94.00),
(6, 1, 'Mouel', 'Anne', '27 r Auvergne', '80000', 'AMIENS', 45.00),
(7, 2, 'Desgranges-Lentz', 'Antoine', '1 r Albert de Mun', '29000', 'MORLAIX', 20.00),
(8, 5, 'Marcouiller', 'Arnaud', '31 r St Jean', '68000', 'MULHOUSE', 396.00),
(9, 3, 'Dupuy', 'Benoit', '9 r Demolombe', '34000', 'MONTPELLIER', 395.00),
(10, 4, 'Lerat', 'Bernard', '31 r St Jean', '59000', 'LILLE', 257.00),
(11, 1, 'Marçais-Lefebvre', 'Bertrand', '86Bis r Basse', '67000', 'STRASBOURG', 450.00),
(12, 2, 'Boscher', 'Bruno', '94 r Falaise', '10000', 'TROYES', 356.00),
(13, 5, 'Morel', 'Catherine', '21 r Chateaubriand', '75000', 'PARIS', 379.00),
(14, 3, 'Guivarch', 'Chantal', '4 av Gén Laperrine', '45000', 'ORLEANS', 114.00),
(15, 4, 'Bessin-Grosdoit', 'Christophe', '92 r Falaise', '06000', 'NICE', 222.00),
(16, 1, 'Rossa', 'Claire', '14 av Thiès', '06000', 'NICE', 529.00),
(17, 2, 'Cauchy', 'Denis', '5 av Ste Thérèse', '11000', 'NARBONNE', 458.00),
(18, 5, 'Gaffé', 'Dominique', '9 av 1ère Armée Française', '35000', 'RENNES', 213.00),
(19, 3, 'Guenon', 'Dominique', '98 bd Mar Lyautey', '44000', 'NANTES', 175.00),
(20, 4, 'Prévot', 'Dominique', '29 r Lucien Nelle', '87000', 'LIMOGES', 151.00),
(21, 1, 'Houchard', 'Eliane', '9 r Demolombe', '49100', 'ANGERS', 436.00),
(22, 2, 'Desmons', 'Elisabeth', '51 r Bernières', '29000', 'QUIMPER', 281.00),
(23, 5, 'Flament', 'Elisabeth', '11 r Pasteur', '35000', 'RENNES', 315.00),
(24, 3, 'Goussard', 'Emmanuel', '9 r Demolombe', '41000', 'BLOIS', 40.00),
(25, 4, 'Desprez', 'Eric', '9 r Vaucelles', '33000', 'BORDEAUX', 406.00),
(26, 1, 'Coste', 'Evelyne', '29 r Lucien Nelle', '19000', 'TULLE', 441.00),
(27, 2, 'Lefebvre', 'Frédéric', '2 pl Wurzburg', '55000', 'VERDUN', 573.00),
(28, 5, 'Lemée', 'Frédéric', '29 av 6 Juin', '56000', 'VANNES', 326.00),
(29, 3, 'Martin', 'Frédéric', 'Bât A 90 r Bayeux', '70000', 'VESOUL', 506.00),
(30, 4, 'Marie', 'Frédérique', '172 r Caponière', '70000', 'VESOUL', 313.00),
(31, 1, 'Rosenstech', 'Geneviève', '27 r Auvergne', '75000', 'PARIS', 366.00),
(32, 2, 'Pontavice', 'Ghislaine', '8 r Gaillon', '86000', 'POITIERS', 265.00),
(33, 5, 'Leveneur-Mosquet', 'Guillaume', '47 av Robert Schuman', '64000', 'PAU', 184.00),
(34, 3, 'Blanchais', 'Guy', '30 r Authie', '08000', 'SEDAN', 502.00),
(35, 4, 'Leveneur', 'Hugues', '7 pl St Gilles', '62000', 'ARRAS', 7.00),
(36, 1, 'Mosquet', 'Isabelle', '22 r Jules Verne', '76000', 'ROUEN', 77.00),
(37, 2, 'Giraudon', 'Jean-Christophe', '1 r Albert de Mun', '38100', 'VIENNE', 92.00),
(38, 5, 'Marie', 'Jean-Claude', '26 r Hérouville', '69000', 'LYON', 120.00),
(39, 3, 'Maury', 'Jean-François', '5 r Pierre Girard', '71000', 'CHALON SUR SAONE', 13.00),
(40, 4, 'Dennel', 'Jean-Louis', '7 pl St Gilles', '28000', 'CHARTRES', 550.00),
(41, 1, 'Ain', 'Jean-Pierre', '4 résid Olympia', '02000', 'LAON', 5.00),
(42, 2, 'Chemery', 'Jean-Pierre', '51 pl Ancienne Boucherie', '14000', 'CAEN', 396.00),
(43, 5, 'Comoz', 'Jean-Pierre', '35 r Auguste Lechesne', '18000', 'BOURGES', 340.00),
(44, 3, 'Desfaudais', 'Jean-Pierre', '7 pl St Gilles', '29000', 'BREST', 71.00),
(45, 4, 'Phan', 'JérÃ´me', '9 r Clos Caillet', '79000', 'NIORT', 451.00),
(46, 1, 'Riou', 'Line', '43 bd Gén Vanier', '77000', 'MARNE LA VALLEE', 193.00),
(47, 2, 'Chubilleau', 'Louis', '46 r Eglise', '17000', 'SAINTES', 202.00),
(48, 5, 'Lebrun', 'Lucette', '178 r Auge', '54000', 'NANCY', 410.00),
(49, 3, 'Goessens', 'Marc', '6 av 6 Juin', '39000', 'DOLE', 548.00),
(50, 4, 'Laforge', 'Marc', '5 résid Prairie', '50000', 'SAINT LO', 265.00),
(51, 1, 'Millereau', 'Marc', '36 av 6 Juin', '72000', 'LA FERTE BERNARD', 430.00),
(52, 2, 'Dauverne', 'Marie-Christine', '69 av Charlemagne', '21000', 'DIJON', 281.00),
(53, 5, 'Vittorio', 'Myriam', '3 pl Champlain', '94000', 'BOISSY SAINT LEGER', 356.00),
(54, 3, 'Lapasset', 'Nhieu', '31 av 6 Juin', '52000', 'CHAUMONT', 107.00),
(55, 4, 'Plantet-Besnier', 'Nicole', '10 av 1ère Armée Française', '86000', 'CHATELLEREAULT', 369.00),
(56, 1, 'Chubilleau', 'Pascal', '3 r Hastings', '15000', 'AURRILLAC', 290.00),
(57, 2, 'Robert', 'Pascal', '31 r St Jean', '93000', 'BOBIGNY', 162.00),
(58, 5, 'Jean', 'Pascale', '114 r Authie', '49100', 'SAUMUR', 375.00),
(59, 3, 'Chanteloube', 'Patrice', '14 av Thiès', '13000', 'MARSEILLE', 478.00),
(60, 4, 'Lecuirot', 'Patrice', 'résid St Pères 55 r Pigacière', '54000', 'NANCY', 239.00),
(61, 1, 'Gandon', 'Patrick', '47 av Robert Schuman', '37000', 'TOURS', 599.00),
(62, 2, 'Mirouf', 'Patrick', '22 r Puits Picard', '74000', 'ANNECY', 458.00),
(63, 5, 'Boireaux', 'Philippe', '14 av Thiès', '10000', 'CHALON EN CHAMPAGNE', 454.00),
(64, 3, 'Cendrier', 'Philippe', '7 pl St Gilles', '12000', 'RODEZ', 164.00),
(65, 4, 'Duhamel', 'Philippe', '114 r Authie', '34000', 'MONTPELLIER', 98.00),
(66, 1, 'Grigy', 'Philippe', '15 r Mélingue', '44000', 'CLISSON', 285.00),
(67, 2, 'Linard', 'Philippe', '1 r Albert de Mun', '81000', 'ALBI', 486.00),
(68, 5, 'Lozier', 'Philippe', '8 r Gaillon', '31000', 'TOULOUSE', 48.00),
(69, 3, 'Dechâtre', 'Pierre', '63 av Thiès', '23000', 'MONTLUCON', 253.00),
(70, 4, 'Goessens', 'Pierre', '22 r Jean Romain', '40000', 'MONT DE MARSAN', 426.00),
(71, 1, 'Leménager', 'Pierre', '39 av 6 Juin', '57000', 'METZ', 118.00),
(72, 2, 'Née', 'Pierre', '39 av 6 Juin', '82000', 'MONTAUBAN', 72.00),
(73, 5, 'Guyot', 'Pierre-Laurent', '43 bd Gén Vanier', '48000', 'MENDE', 352.00),
(74, 3, 'Chauchard', 'Roger', '9 r Vaucelles', '13000', 'MARSEILLE', 552.00),
(75, 4, 'Mabire', 'Roland', '11 r Boutiques', '67000', 'STRASBOURG', 422.00),
(76, 1, 'Leroy', 'Soazig', '45 r Boutiques', '61000', 'ALENCON', 570.00),
(77, 2, 'Guyot', 'Stéphane', '26 r Hérouville', '46000', 'FIGEAC', 28.00),
(78, 5, 'Delposen', 'Sylvain', '39 av 6 Juin', '27000', 'DREUX', 292.00),
(79, 3, 'Rault', 'Sylvie', '15 bd Richemond', '02000', 'SOISSON', 526.00),
(80, 4, 'Renouf', 'Sylvie', '98 bd Mar Lyautey', '88000', 'EPINAL', 425.00),
(81, 1, 'Alliet-Grach', 'Thierry', '14 av Thiès', '07000', 'PRIVAS', 451.00),
(82, 2, 'Bayard', 'Thierry', '92 r Falaise', '42000', 'SAINT ETIENNE', 271.00),
(83, 5, 'Gauchet', 'Thierry', '7 r Desmoueux', '38100', 'GRENOBLE', 406.00),
(84, 3, 'Bobichon', 'Tristan', '219 r Caponière', '09000', 'FOIX', 218.00),
(85, 4, 'Duchemin-Laniel', 'Véronique', '130 r St Jean', '33000', 'LIBOURNE', 265.00),
(86, 1, 'Laurent', 'Younès', '34 r Demolombe', '53000', 'MAYENNE', 496.00);

-- --------------------------------------------------------

--
-- Structure de la table `prescrire`
--

CREATE TABLE `prescrire` (
  `id_dosage` int(11) NOT NULL,
  `id_medicament` int(11) NOT NULL,
  `id_type_individu` int(11) NOT NULL,
  `posologie` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `prescrire`
--

INSERT INTO `prescrire` (`id_dosage`, `id_medicament`, `id_type_individu`, `posologie`) VALUES
(3, 2, 2, '2 comprimés à prendre le matin avec un verre d\'eau'),
(4, 2, 1, '1 comprimé à prendre le matin avec un verre d\'eau');

-- --------------------------------------------------------

--
-- Structure de la table `presentation`
--

CREATE TABLE `presentation` (
  `id_presentation` int(11) NOT NULL,
  `lib_presentation` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `presentation`
--

INSERT INTO `presentation` (`id_presentation`, `lib_presentation`) VALUES
(1, 'Gélule'),
(2, 'Comprimé enrobé'),
(3, 'Comprimé pelliculé'),
(4, 'Comprimé à sucer'),
(5, 'Comprimé effervescent'),
(6, 'Comprimé pelliculé'),
(7, 'Comprimé à croquer'),
(8, 'Comprimé gastro-résistant'),
(9, 'Sirop'),
(10, 'Suppositoire'),
(11, 'Granulé'),
(12, 'Collutoire'),
(13, 'Gouttes'),
(14, 'Sachet');

-- --------------------------------------------------------

--
-- Structure de la table `rapport_visite`
--

CREATE TABLE `rapport_visite` (
  `id_rapport` int(11) NOT NULL,
  `id_praticien` int(11) DEFAULT NULL,
  `id_visiteur` int(11) NOT NULL,
  `date_rapport` date DEFAULT NULL,
  `bilan` varchar(512) DEFAULT NULL,
  `motif` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `rapport_visite`
--

INSERT INTO `rapport_visite` (`id_rapport`, `id_praticien`, `id_visiteur`, `date_rapport`, `bilan`, `motif`) VALUES
(1, 5, 1, '2018-09-03', 'visiteannuelle', 'positif'),
(2, 8, 1, '2018-09-04', 'Très aimable maintenir un contact régulier', 'Demande du médecin'),
(3, 12, 1, '2018-09-08', 'Trop pressé', 'Demande du médecin'),
(4, 9, 1, '2018-09-10', 'Visite positive', 'recommandation de confrère'),
(5, 6, 2, '2018-09-03', 'Pas intéressé du tout', 'Visite annuelle'),
(6, 1, 2, '2018-09-08', 'A revoir assez rapidement', 'Installation nouvelle');

-- --------------------------------------------------------

--
-- Structure de la table `realiser`
--

CREATE TABLE `realiser` (
  `id_activite_compl` int(11) NOT NULL,
  `id_visiteur` int(11) NOT NULL,
  `montant_ac` decimal(11,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `region`
--

CREATE TABLE `region` (
  `id_region` int(11) NOT NULL,
  `id_secteur` int(11) DEFAULT NULL,
  `nom_region` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `region`
--

INSERT INTO `region` (`id_region`, `id_secteur`, `nom_region`) VALUES
(1, 1, 'Alsace Lorraine'),
(2, 5, 'Aquitaine'),
(3, 4, 'Auvergne'),
(4, 3, 'Bretagne'),
(5, 3, 'Basse Normandie'),
(6, 1, 'Bourgogne'),
(7, 2, 'Champagne Ardennes'),
(8, 4, 'Centre'),
(9, 1, 'Franche Comté'),
(10, 2, 'Haute Normandie'),
(11, 4, 'Ile de France'),
(12, 5, 'Languedoc'),
(13, 4, 'Limousin'),
(14, 5, 'Midi Pyrénée'),
(15, 2, 'Nord Pas de Calais'),
(16, 5, 'Provence Alpes Cote d\'Azur'),
(17, 3, 'Poitou Charente'),
(18, 2, 'Picardie'),
(19, 3, 'Pays de Loire'),
(20, 1, 'Rhone Alpes'),
(21, 5, 'Roussilon'),
(22, 3, 'Vendée');

-- --------------------------------------------------------

--
-- Structure de la table `secteur`
--

CREATE TABLE `secteur` (
  `id_secteur` int(11) NOT NULL,
  `lib_secteur` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `secteur`
--

INSERT INTO `secteur` (`id_secteur`, `lib_secteur`) VALUES
(1, 'Est'),
(2, 'Nord'),
(3, 'Ouest'),
(4, 'Paris centre'),
(5, 'Sud');

-- --------------------------------------------------------

--
-- Structure de la table `specialite`
--

CREATE TABLE `specialite` (
  `id_specialite` int(11) NOT NULL,
  `lib_specialite` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `specialite`
--

INSERT INTO `specialite` (`id_specialite`, `lib_specialite`) VALUES
(1, 'anatomie et cytologie pathologiques'),
(2, 'angéiologie, médecine vasculaire'),
(3, 'anesthésiologie et réanimation chirurgicale'),
(4, 'biologie médicale'),
(5, 'cardiologie et affections cardio-vasculaires'),
(6, 'chirurgie cardio-vasculaire et thoracique'),
(7, 'chirurgie générale'),
(8, 'chirurgie maxillo-faciale'),
(9, 'cancérologie, oncologie médicale'),
(10, 'chirurgie orthopédique et traumatologie'),
(11, 'chirurgie plastique reconstructrice et esthétique'),
(12, 'chirurgie urologique'),
(13, 'chirurgie vasculaire'),
(14, 'diabétologie-nutrition, nutrition'),
(15, 'dermatologie et vénéréologie'),
(16, 'endocrinologie et métabolismes'),
(17, 'évaluation et traitement de la douleur'),
(18, 'gastro-entérologie et hépatologie (appareil digestif)'),
(19, 'gynécologie médicale, obstétrique'),
(20, 'gynécologie-obstétrique'),
(21, 'maladies du sang (hématologie)'),
(22, 'médecine et biologie du sport'),
(23, 'médecine du travail'),
(24, 'médecine manuelle - ostéopathie'),
(25, 'médecine nucléaire'),
(26, 'médecine physique et de réadaptation'),
(27, 'médecine tropicale, pathologie infectieuse et tropicale'),
(28, 'néphrologie'),
(29, 'neurochirurgie'),
(30, 'neurologie'),
(31, 'orthopédie dento maxillo-faciale'),
(32, 'ophtalmologie'),
(33, 'oto-rhino-laryngologie'),
(34, 'psychiatrie de l\'enfant et de l\'adolescent'),
(35, 'pédiatrie maladies des enfants'),
(36, 'pneumologie'),
(37, 'psychiatrie'),
(38, 'radiologie (radiodiagnostic et imagerie médicale)'),
(39, 'radiothérapie (oncologie option radiothérapie)'),
(40, 'reproduction et gynécologie médicale'),
(41, 'rhumatologie'),
(42, 'stomatologie'),
(43, 'sexologie'),
(44, 'toxicomanie et alcoologie');

-- --------------------------------------------------------

--
-- Structure de la table `stats_prescriptions`
--

CREATE TABLE `stats_prescriptions` (
  `id_praticien` int(11) NOT NULL,
  `id_medicament` int(11) NOT NULL,
  `annee_mois` int(11) NOT NULL,
  `quantite` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `travailler`
--

CREATE TABLE `travailler` (
  `id_visiteur` int(11) NOT NULL,
  `jjmmaa` date NOT NULL,
  `id_region` int(11) NOT NULL,
  `role_visiteur` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `travailler`
--

INSERT INTO `travailler` (`id_visiteur`, `jjmmaa`, `id_region`, `role_visiteur`) VALUES
(1, '1992-12-11', 5, 'Visiteur'),
(1, '1996-05-27', 4, 'Visiteur'),
(2, '1991-08-26', 20, 'Visiteur'),
(2, '1997-09-19', 20, 'Délégué'),
(3, '1987-07-17', 14, 'Visiteur'),
(3, '1995-05-19', 21, 'Visiteur'),
(3, '1999-08-21', 21, 'Délégué'),
(4, '1999-01-02', 17, 'Visiteur'),
(5, '1996-03-11', 1, 'Visiteur'),
(6, '1997-03-21', 4, 'Visiteur'),
(7, '1999-01-31', 19, 'Visiteur'),
(8, '1994-07-03', 19, 'Visiteur'),
(8, '2000-01-01', 19, 'Délégué'),
(9, '2000-08-02', 12, 'Visiteur'),
(10, '1993-12-06', 8, 'Délégué'),
(10, '1999-06-18', 8, 'Responsable'),
(11, '1997-09-25', 2, 'Visiteur'),
(12, '1998-01-18', 16, 'Visiteur'),
(13, '1995-10-21', 20, 'Visiteur'),
(14, '1989-02-01', 16, 'Visiteur'),
(14, '1997-02-01', 16, 'Délégué'),
(14, '2001-03-03', 16, 'Responsable'),
(15, '1992-05-05', 7, 'Visiteur'),
(16, '1991-04-09', 1, 'Visiteur'),
(17, '1991-12-05', 19, 'Visiteur'),
(18, '1997-11-18', 9, 'Délégué'),
(18, '2002-03-20', 9, 'Responsable'),
(19, '1989-03-24', 1, 'Visiteur'),
(20, '1993-05-17', 1, 'Délégué'),
(20, '2000-02-29', 1, 'Responsable'),
(21, '1988-04-26', 11, 'Visiteur'),
(22, '1996-02-19', 14, 'Visiteur'),
(23, '1990-11-27', 14, 'Visiteur'),
(23, '1995-11-27', 14, 'Délégué'),
(23, '2000-11-27', 2, 'Responsable'),
(24, '1991-10-31', 10, 'Visiteur'),
(25, '1993-06-08', 20, 'Visiteur'),
(26, '1997-02-15', 20, 'Visiteur'),
(27, '1994-05-03', 14, 'Visiteur'),
(28, '1996-01-18', 11, 'Visiteur'),
(29, '1999-03-27', 18, 'Délégué'),
(29, '2000-10-31', 18, 'Responsable'),
(30, '1985-10-02', 4, 'Visiteur'),
(31, '1996-01-13', 13, 'Visiteur'),
(32, '1993-05-08', 13, 'Visiteur'),
(33, '1998-04-26', 11, 'Visiteur'),
(34, '1993-08-26', 3, 'Visiteur'),
(35, '1992-11-01', 7, 'Visiteur'),
(36, '1998-02-25', 7, 'Responsable'),
(37, '1992-12-16', 15, 'Visiteur'),
(38, '1998-06-18', 11, 'Responsable'),
(39, '1996-11-21', 12, 'Visiteur'),
(40, '1983-03-23', 7, 'Visiteur'),
(40, '1992-04-03', 1, 'Délégué'),
(41, '1995-02-02', 19, 'Visiteur'),
(42, '1995-06-05', 17, 'Visiteur'),
(43, '1997-01-24', 19, 'Visiteur'),
(44, '1996-02-27', 9, 'Visiteur'),
(45, '1987-10-06', 14, 'Visiteur'),
(46, '1990-10-13', 1, 'Visiteur'),
(46, '1999-04-08', 1, 'Délégué'),
(47, '1996-03-06', 10, 'Visiteur'),
(48, '1992-08-30', 8, 'Visiteur'),
(49, '1994-12-19', 18, 'Visiteur'),
(50, '1995-01-05', 12, 'Visiteur'),
(51, '1992-12-24', 11, 'Visiteur'),
(52, '1992-12-14', 5, 'Délégué'),
(52, '1999-07-17', 5, 'Responsable'),
(53, '1998-07-27', 17, 'Visiteur'),
(54, '1994-12-12', 18, 'Visiteur'),
(55, '1977-10-03', 8, 'Visiteur'),
(56, '1997-03-30', 2, 'Visiteur'),
(57, '1990-03-01', 21, 'Visiteur'),
(58, '1991-06-23', 6, 'Visiteur'),
(59, '1997-09-06', 5, 'Visiteur'),
(60, '1984-07-29', 5, 'Visiteur'),
(60, '1998-05-25', 5, 'Responsable'),
(61, '1990-06-30', 4, 'Visiteur'),
(62, '1995-11-14', 9, 'Visiteur'),
(63, '1992-09-25', 13, 'Visiteur'),
(64, '1995-03-09', 6, 'Visiteur'),
(65, '1997-08-29', 18, 'Visiteur'),
(66, '1994-11-29', 14, 'Visiteur'),
(67, '1991-03-29', 8, 'Visiteur');

-- --------------------------------------------------------

--
-- Structure de la table `type_individu`
--

CREATE TABLE `type_individu` (
  `id_type_individu` int(11) NOT NULL,
  `lib_type_individu` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `type_individu`
--

INSERT INTO `type_individu` (`id_type_individu`, `lib_type_individu`) VALUES
(1, 'Enfant à partir de 8 ans'),
(2, 'Adulte à partir de 15 ans'),
(3, 'Femme enceinte'),
(4, 'Nourisson'),
(5, 'Enfant à partir de 2 ans');

-- --------------------------------------------------------

--
-- Structure de la table `type_praticien`
--

CREATE TABLE `type_praticien` (
  `id_type_praticien` int(11) NOT NULL,
  `lib_type_praticien` varchar(100) DEFAULT NULL,
  `lieu_type_praticien` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `type_praticien`
--

INSERT INTO `type_praticien` (`id_type_praticien`, `lib_type_praticien`, `lieu_type_praticien`) VALUES
(1, 'Médecin Hospitalier', 'Hopital ou clinique'),
(2, 'Médecine de Ville', 'Cabinet'),
(3, 'Pharmacien Hospitalier', 'Hopital ou clinique'),
(4, 'Pharmacien Officine', 'Pharmacie'),
(5, 'Personnel de santé', 'Centre paramédical');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Villechalane', 'Villechalane@free.fr', NULL, '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', NULL, NULL, NULL),
(2, 'Andre', 'Andre@free.fr', NULL, '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', '3|eeG3xeARLvSfFDq57DVc8qzhYttVBFngAUIBlxUS8bae4529', NULL, '2023-11-30 14:46:28');

-- --------------------------------------------------------

--
-- Structure de la table `visiteur`
--

CREATE TABLE `visiteur` (
  `id_visiteur` int(11) NOT NULL,
  `id_laboratoire` int(11) DEFAULT NULL,
  `id_secteur` int(11) DEFAULT NULL,
  `nom_visiteur` varchar(100) DEFAULT NULL,
  `prenom_visiteur` varchar(100) DEFAULT NULL,
  `adresse_visiteur` varchar(200) DEFAULT NULL,
  `cp_visiteur` char(5) DEFAULT NULL,
  `ville_visiteur` varchar(100) DEFAULT NULL,
  `date_embauche` date DEFAULT NULL,
  `login_visiteur` varchar(50) DEFAULT NULL,
  `pwd_visiteur` varchar(200) DEFAULT NULL,
  `type_visiteur` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `visiteur`
--

INSERT INTO `visiteur` (`id_visiteur`, `id_laboratoire`, `id_secteur`, `nom_visiteur`, `prenom_visiteur`, `adresse_visiteur`, `cp_visiteur`, `ville_visiteur`, `date_embauche`, `login_visiteur`, `pwd_visiteur`, `type_visiteur`) VALUES
(1, 3, 2, 'Villechalane', 'Louis', '8 cours Lafontaine', '29000', 'BREST', '1992-12-11', 'Villechalane', '$2y$10$oliwgYQr08tfj5t4Ws4Ob.l8OPV/WVZ4yK/TFrhKpx0e0aLb3TIMu', 'V'),
(2, 2, 2, 'Andre', 'David', '1 r Aimon de Chissée', '38100', 'GRENOBLE', '1991-08-26', 'Andre', '$2y$10$RmK7Us1AnIs5P9KJW2QsIuCxN3nqoBWHoefkKbPEKJY0iOauO/FXi', 'V'),
(3, 2, 2, 'Bedos', 'Christian', '1 r Bénédictins', '65000', 'TARBES', '1987-07-17', 'Bedos', '$2y$10$leH1B8ijslT3MR6EVZFttOYZp9.wAXl8Gyy766Lbjkme.ywueupG2', 'V'),
(4, 3, 2, 'Tusseau', 'Louis', '22 r Renou', '86000', 'POITIERS', '1999-01-02', 'TusseauL', '$2y$10$BBS3HjL3tIOYWcWGgZbLwuoBe7I4MBeGECpdJjwvnBCC0biaWxsw6', 'V'),
(5, 2, 2, 'Bentot', 'Pascal', '11 av 6 Juin', '67000', 'STRASBOURG', '1996-03-11', 'Bentot', '$2y$10$H6z/qpcaM0G55in2hk.94uBUDmLpY4/NVcYma.OGI.kfgy1BQPri2', 'V'),
(6, 3, 2, 'Bioret', 'Luc', '1 r Linne', '35000', 'RENNES', '1997-03-21', 'Bioret', '$2y$10$arGaZeDzEpvGMZIHG1NyhuchZHAgBN9KyxAmtgVes5LZUDRS20kx6', 'V'),
(7, 2, 2, 'Bunisset', 'Francis', '10 r Nicolas Chorier', '85000', 'LA ROCHE SUR YON', '1999-01-31', 'BunissetF', '$2y$10$Q32mKYf35VBLf/X1gUDksOzFKeKGqPNQdLDKUoOKoM151/qWu51KS', 'V'),
(8, 3, 2, 'Bunisset', 'Denise', '1 r Lionne', '49100', 'ANGERS', '1994-07-03', 'BunissetD', '$2y$10$VsiEqXx258tfRYkS0zkvxeSLIltm/jfjDbBZ4sQ3ONf49QrKCzzNe', 'V'),
(9, 2, 2, 'Cacheux', 'Bernard', '114 r Authie', '34000', 'MONTPELLIER', '2000-08-02', 'Cacheux', '$2y$10$c9rSN0Juxqec.62ouxHX8.e8BFdAHFNTmnQlQGBOCoCgQZbHcL5x.', 'V'),
(10, 2, 3, 'Cadic', 'Eric', '123 r Caponière', '41000', 'BLOIS', '1993-12-06', 'Cadic', '$2y$10$LrES..SzlW2X2yzxIAmHS.Ea/renNu52bZ95t3xt.54EwNMKkJJPO', 'V'),
(11, 3, 2, 'Charoze', 'Catherine', '100 pl Géants', '33000', 'BORDEAUX', '1997-09-25', 'Charoze', '$2y$10$.y7cw6dEYSYS5psrjnw7zuDGp.uqRj8pdgHEfIvxx9Xd43qTLrpqm', 'V'),
(12, 2, 2, 'Clepkens', 'Christophe', '12 r Fédérico Garcia Lorca', '13000', 'MARSEILLE', '1998-01-18', 'Clepkens', '$2y$10$ydB4UmbF90At9keBol7NnuY/Js4pxEbDxZ1v9ll/lLxKbkguCh/4a', 'V'),
(13, 2, 2, 'Cottin', 'Vincenne', '36 sq Capucins', '05000', 'GAP', '1995-10-21', 'Cottin', '$2y$10$FXQz9noj0AIfqBCkNNP4S.jpWbTOhho9aRZ7pWia/pUqibXhoUkdW', 'V'),
(14, 3, 3, 'Daburon', 'François', '13 r Champs Elysées', '06000', 'NICE', '1989-02-01', 'Daburon', '$2y$10$2W2p7UOIH5m4rurFz0/JbOuubXdo8hrWWaob5J2BNs8kMrOencWTq', 'V'),
(15, 2, 2, 'De', 'Philippe', '13 r Charles Peguy', '10000', 'TROYES', '1992-05-05', 'De', '$2y$10$BmG1YDB0eMpJ.Z0mEv9hOeqPVE3khA/LH4fQu017QbSWUnDAenHf6', 'V'),
(16, 3, 2, 'Debelle', 'Michel', '181 r Caponière', '88000', 'EPINAL', '1991-04-09', 'DebelleM', '$2y$10$GGCWM6oCqGioeDOqHC4jI.rPWa.LB.KhL2TlSCw.l.vAb7hKRDBrW', 'V'),
(17, 3, 2, 'Debelle', 'Jeanne', '134 r Stalingrad', '44000', 'NANTES', '1991-12-05', 'DebelleJ', '$2y$10$V0XtZ2RlJQUovy9Sfdiu6.l1wKfujb5wHEOOLlrOvyQoX/eNBi1.q', 'V'),
(18, 2, 1, 'Debroise', 'Michel', '2 av 6 Juin', '70000', 'VESOUL', '1997-11-18', 'Debroise', '$2y$10$MC8deT8uCHgJWoUW3yBk6uEuUed8Zh6OQUk7ZvnHLT5.gVZ4H7NqG', 'V'),
(19, 2, 1, 'Desmarquest', 'Nathalie', '14 r Fédérico Garcia Lorca', '54000', 'NANCY', '1989-03-24', 'Desmarquest', '$2y$10$sNlkA.XemEBdbQ4IpbArBuqbXbxljon5vYc9n1rTiOc02nEO1Kd0e', 'V'),
(20, 2, 1, 'Desnost', 'Pierre', '16 r Barral de Montferrat', '55000', 'VERDUN', '1993-05-17', 'Desnost', '$2y$10$x8fnTrJbWijDnBUTWV32xeBWlxVpGoa1zXwBeD.CeNVLn409/v2Hi', 'V'),
(21, 2, 1, 'Dudouit', 'Frédéric', '18 quai Xavier Jouvin', '75000', 'PARIS', '1988-04-26', 'Dudouit', '$2y$10$JcbuR7vO4IqXI0GUz1hDzOtWSvPZCmJHj2i8aIXN5xhl/wvTCqf12', 'V'),
(22, 2, 1, 'Duncombe', 'Claude', '19 av Alsace Lorraine', '09000', 'FOIX', '1996-02-19', 'Duncombe', '$2y$10$D0mw7xNQapKEQ9V20uScUOC/1C9qf3jEJBfQ8.hPlIQgu7i8kHkYi', 'V'),
(23, 3, 2, 'Enault-Pascreau', 'Céline', '25B r Stalingrad', '40000', 'MONT DE MARSAN', '1990-11-27', 'Enault-Pascreau', '$2y$10$2jESiMuU2kU0mE0YE5BTVO1sPms1WX1CWIZ.VdWpwQSsdbUdpeNkq', 'V'),
(24, 2, 1, 'Eynde', 'Valérie', '3 r Henri Moissan', '76000', 'ROUEN', '1991-10-31', 'Eynde', '$2y$10$8dKnK3tUL8YJ/qNNEIRL7OPX3LMd2M410eGQKTEb7QKx38dtTBppW', 'V'),
(25, 3, 2, 'Finck', 'Jacques', 'rte Montreuil Bellay', '74000', 'ANNECY', '1993-06-08', 'Finck', '$2y$10$3KcL23quetCvsZ6pXsoDCu7IcxdSK4yPw/x4BGoI8dwCVxTBlixsG', 'V'),
(26, 3, 2, 'Frémont', 'Fernande', '4 r Jean Giono', '69000', 'LYON', '1997-02-15', 'Frémont', '$2y$10$rCRSkDzIR/37o/gulY.Fa.jy2R5LultdQWJLSm9DmQ0mMbZ3GR7pa', 'V'),
(27, 2, 1, 'Gest', 'Alain', '30 r Authie', '46000', 'FIGEAC', '1994-05-03', 'Gest', '$2y$10$5NXKgP0ABetPSLwPLm06YuCSkCVV/1oGV742rISrfMIT.IeyPKMzm', 'V'),
(28, 3, 2, 'Gheysen', 'Galassus', '32 bd Mar Foch', '75000', 'PARIS', '1996-01-18', 'Gheysen', '$2y$10$nVy3cYNcfYDF2WCqQVwRjOUwbjpOoopHOMLsIV6BR/UD3NmFQFEsu', 'V'),
(29, 2, 2, 'Girard', 'Yvon', '31 av 6 Juin', '80000', 'AMIENS', '1999-03-27', 'Girard', '$2y$10$.dF/kBSQcANDEAD465eeMeI7QOwdNo6okrcNxJe3f/1WfoSUuQh2S', 'V'),
(30, 2, 1, 'Gombert', 'Luc', '32 r Emile Gueymard', '56000', 'VANNES', '1985-10-02', 'Gombert', '$2y$10$eIo/auItn4V0EmEOXURmR.Qgjpf/leYxPyThwb4u0c4pF0c4vZ7j2', 'V'),
(31, 2, 1, 'Guindon', 'Caroline', '40 r Mar Montgomery', '87000', 'LIMOGES', '1996-01-13', 'GuindonC', '$2y$10$FMc8tsQSOrF9Zq3Xdgr63uXYFHpCBT7DXxYkS7anL4H2EaMLFX7Za', 'V'),
(32, 3, 2, 'Guindon', 'François', '44 r Picotière', '19000', 'TULLE', '1993-05-08', 'GuindonF', '$2y$10$xQJgFprJf6H1sccet.d5SOPLlpRGRvFOyL.un2w9fWaLJqUCFeZI2', 'V'),
(33, 3, 2, 'Igigabel', 'Guy', '33 gal Arlequin', '94000', 'CRETEIL', '1998-04-26', 'Igigabel', '$2y$10$rph/xmPDD7V/EYkQkzMwJubFFkV99ndpOdM0mrSokm.cDf4mGqjN.', 'V'),
(34, 2, 1, 'Jourdren', 'Pierre', '34 av Jean Perrot', '15000', 'AURRILLAC', '1993-08-26', 'Jourdren', '$2y$10$bvfPuntwv1GFtvSDNdnxDehvxPJSrgiF6LmG30l2JBSKnBnWoTwb.', 'V'),
(35, 2, 1, 'Juttard', 'Pierre-Raoul', '34 cours Jean Jaurès', '08000', 'SEDAN', '1992-11-01', 'Juttard', '$2y$10$lJPWsjwKg8lXfp6QG4yeG.CCRZNe/PghWZ1rmlxspfPZKGj0qfcPq', 'V'),
(36, 3, 2, 'Labouré-Morel', 'Saout', '38 cours Berriat', '52000', 'CHAUMONT', '1998-02-25', 'Labouré-Morel', '$2y$10$yiezpEGDApQ9L16syBktSO4nIiUnXPRh2.GseYD.ZeTnjW.IfRpfq', 'V'),
(37, 2, 1, 'Landré', 'Philippe', '4 av Gén Laperrine', '59000', 'LILLE', '1992-12-16', 'Landré', '$2y$10$o5fxIoDw.wBZfDc.DqUFdeR8xfq51UB9nnDkNIq5hgUKcZvuuzcI6', 'V'),
(38, 2, 2, 'Langeard', 'Hugues', '39 av Jean Perrot', '93000', 'BAGNOLET', '1998-06-18', 'Langeard', '$2y$10$i2sGMOIgvvQ98fBrWWra2Oue5LGZFMCcYnR8zjHO6MRae6pvyEeC.', 'V'),
(39, 3, 2, 'Lanne', 'Bernard', '4 r Bayeux', '30000', 'NIMES', '0000-00-00', 'Lanne', '$2y$10$7y./LSaIZ8ROw22zMSMRWepLTt6BmAbp5w9xijAEC/PRDVA6eykfK', 'V'),
(40, 3, 2, 'Le', 'Noël', '4 av Beauvert', '68000', 'MULHOUSE', '0000-00-00', 'LeN', '$2y$10$lBfj3BZM4ScE6EtFikDN1OQiBzM9cMMoWSX7VxfoVzEapi8nEgY5O', 'V'),
(41, 3, 2, 'Le', 'Jean', '39 r Raspail', '53000', 'LAVAL', '1995-02-02', 'LeJ', '$2y$10$QVbjB3QZlN6NTDQ6BN2Aeu2d0CEU7Kh0WLbz1P5l1c8UoFaiKwJw6', 'V'),
(42, 3, 2, 'Leclercq', 'Servane', '11 r Quinconce', '18000', 'BOURGES', '1995-06-05', 'Leclercq', '$2y$10$5kDAbYgkPy.FaJSIeVbLEuM3OuRehKHv/q8PSryzB1FKdDYUJdgaC', 'V'),
(43, 2, 3, 'Lecornu', 'Jean-Bernard', '4 bd Mar Foch', '72000', 'LA FERTE BERNARD', '1997-01-24', 'LecornuJ', '$2y$10$lE5yt1b88fDq68nX7CgLpuha9EDRCDLuRhtG0jsW.lNhfkq77cZca', 'V'),
(44, 3, 2, 'Lecornu', 'Ludovic', '4 r Abel Servien', '25000', 'BESANCON', '1996-02-27', 'LecornuL', '$2y$10$3/IVW4F1H8vhDebl81nJiuxmN9Ex1..JxPFUu8dMdsGhXDjLxrTiS', 'V'),
(45, 3, 2, 'Lejard', 'Agnès', '4 r Anthoard', '82000', 'MONTAUBAN', '1987-10-06', 'Lejard', '$2y$10$a2DvRbrYkNFpzKKQ.mz9f.MpPeGXmYZJiejOtdyrQE5swCHTLkQFS', 'V'),
(46, 2, 2, 'Lesaulnier', 'Pascal', '47 r Thiers', '57000', 'METZ', '1990-10-13', 'Lesaulnier', '$2y$10$QZqZfsZgiRSn1BvGqKTBUeKJgRW8kjLXP9b8OMusnHpu7slRufhuO', 'V'),
(47, 2, 3, 'Letessier', 'Stéphane', '5 chem Capuche', '27000', 'EVREUX', '1996-03-06', 'Letessier', '$2y$10$B29vreYQnEdPHZnSyb3QhOcs9mPpgitLMldbycBTheOMexiWjYGd.', 'V'),
(48, 2, 3, 'Loirat', 'Didier', 'Les Pêchers cité Bourg la Croix', '45000', 'ORLEANS', '1992-08-30', 'Loirat', '$2y$10$Ek27AdomVx0aPNlpZ3aY3eIiFAT2JNsWVbJV3T9F5tLIbeCaIxzJ.', 'V'),
(49, 2, 2, 'Maffezzoli', 'Thibaud', '5 r Chateaubriand', '02000', 'LAON', '1994-12-19', 'Maffezzoli', '$2y$10$OfjxRlI9qzfLOdP3I6v5Dem0QH.be5cZuxViyAMiPCa7JRXz5bBM2', 'V'),
(50, 2, 3, 'Mancini', 'Anne', '5 r D\'Agier', '48000', 'MENDE', '1995-01-05', 'Mancini', '$2y$10$xzjrKC0cnbq4Okyh0IvOKe21kX4ejkkqADGYdHnS9PWWH22Y7iUli', 'V'),
(51, 3, 3, 'Marcouiller', 'Gérard', '7 pl St Gilles', '91000', 'ISSY LES MOULINEAUX', '1992-12-24', 'Marcouiller', '$2y$10$yr//n71PmpTjC/810aUnnuVz8QRh9ThixEWOMKXx.8CkORiqfVoE6', 'V'),
(52, 3, 3, 'Michel', 'Jean-Claude', '5 r Gabriel Péri', '61000', 'FLERS', '1992-12-14', 'Michel', '$2y$10$NmRk8Tr.hg56edd1VK8ps.dcVCIlisvc5OHpiLhmZYWOpia873SfW', 'V'),
(53, 2, 2, 'Montecot', 'Françoise', '6 r Paul Valéry', '17000', 'SAINTES', '1998-07-27', 'Montecot', '$2y$10$Wa3KcpE1vK3zmkpo2EjzYOW6N5rv1dg87Vjc0So8cXFuAJdcZru/G', 'V'),
(54, 3, 2, 'Notini', 'Veronique', '5 r Lieut Chabal', '60000', 'BEAUVAIS', '1994-12-12', 'Notini', '$2y$10$w1sU/ZcOllPvkdxRsq4a7u2xzzhXKj6.gx26fcjVfMYhbw6Hgn1x2', 'V'),
(55, 2, 2, 'Onfroy', 'Den', '5 r Sidonie Jacolin', '37000', 'TOURS', '1977-10-03', 'Onfroy', '$2y$10$.X4bc1zGWemMVf5wBOcDtOVHbIt10.J.LJ2K6.7wsNJhA.Z5NjfUe', 'V'),
(56, 3, 2, 'Pascreau', 'Charles', '57 bd Mar Foch', '64000', 'PAU', '1997-03-30', 'Pascreau', '$2y$10$yizsG2Qc9jdyvPmFpR/k4u9jTQZOv8Idg4ugKiY8acw/ergY1khwy', 'V'),
(57, 2, 2, 'Pernot', 'Claude-Noël', '6 r Alexandre 1 de Yougoslavie', '11000', 'NARBONNE', '1990-03-01', 'Pernot', '$2y$10$8IRKIoiz/QMDALzbsG/UnOCGH5XWS0TFQqwSugsMJyI5CUopdNbLe', 'V'),
(58, 2, 2, 'Perrier', 'Maître', '6 r Aubert Dubayet', '71000', 'CHALON SUR SAONE', '1991-06-23', 'Perrier', '$2y$10$V2XhvRiaFPZjXdR3/b26neNGI2LwGPoBqqWaUdkc46nSMUg4/8rjK', 'V'),
(59, 2, 2, 'Petit', 'Jean-Louis', '7 r Ernest Renan', '50000', 'SAINT LO', '1997-09-06', 'Petit', '$2y$10$h/yXdt/7374CNel9fBiUQ.Vj46Bz5GJnTMkpo1nM0TgyOuaUC4OcO', 'V'),
(60, 2, 3, 'Piquery', 'Patrick', '9 r Vaucelles', '14000', 'CAEN', '1984-07-29', 'Piquery', '$2y$10$Wwkx6lXpMKLjohhI4SFKHu1GMNph7zvC4xk1yulcQaIEQb0X2Ws0K', 'V'),
(61, 2, 2, 'Quiquandon', 'Joël', '7 r Ernest Renan', '29000', 'QUIMPER', '1990-06-30', 'Quiquandon', '$2y$10$qJRURyTXJ1Ip15DrSvKVO.QufygMxTHHgTjr1oPmamsUVOKk84F1K', 'V'),
(62, 3, 2, 'Retailleau', 'Josselin', '88Bis r Saumuroise', '39000', 'DOLE', '1995-11-14', 'RetailleauJ', '$2y$10$0Zb1f62WkkI8kERARI2nKeEuWHVzyktajlaIWsc.6lUpJFBtVdRwK', 'V'),
(63, 3, 2, 'Retailleau', 'Pascal', '32 bd Ayrault', '23000', 'MONTLUCON', '1992-09-25', 'RetailleauP', '$2y$10$fX8NHSBSrjcugQQu.m3fmu220iEiPCEAclZmHAFFMd6ASMY0Ymef2', 'V'),
(64, 3, 2, 'Souron', 'Maryse', '7B r Gay Lussac', '21000', 'DIJON', '1995-03-09', 'Souron', '$2y$10$MzOOIJdyXP/tXy8yk9XCIOAlURguoqbEsIOs.P.r6hMUFhs9TaeM2', 'V'),
(65, 3, 2, 'Tiphagne', 'Patrick', '7B r Gay Lussac', '62000', 'ARRAS', '1997-08-29', 'Tiphagne', '$2y$10$KrhuvJRp5XMArMRFt/Y04OAkIYNmfHqWP9ielB.7aTfsppIovHxW2', 'V'),
(66, 3, 2, 'Tréhet', 'Alain', '7D chem Barral', '12000', 'RODEZ', '1994-11-29', 'Tréhet', '$2y$10$nBjXARXxllTejRJxT367BeUumittTncVhnn/hGuVY4/gF6Qo/wWZy', 'V'),
(67, 2, 2, 'Tusseau', 'Josselin', '63 r Bon Repos', '28000', 'CHARTRES', '1991-03-29', 'TusseauJ', '$2y$10$2TkiBHXQOt1Ubezlv.X5TuokEdTKKQUTN5RmE4bNJ.kt28HlDrL3q', 'V'),
(68, 1, 2, 'swiss', 'bourdin', '', '', '', '2003-06-18', 'swiss', '$2y$10$O6nQA7tpNcs5yFgzHToENeT27tN0iQY1fvUfc9Vl0R.QrQpHDst5q', 'V'),
(69, 1, 3, 'Auchon', 'Paul', '', '', '', '2014-01-01', 'auchon', '$2y$10$.iP5MrsY/GBPjF/rOQp5eu5QuFZauycCFs2v/jiGtVxxGVM8mka8m', 'P'),
(70, 1, 1, 'Gathor', 'Ali', '', '', '', '2014-01-01', 'gathor', '$2y$10$0tAbiQu2HFGF7FBgMwgoMOZLkoD37UJFeZ1SbFyyTN0VRQdeNdhpK', 'C'),
(71, 1, 2, 'Zhette', 'Annie', '', '', '', '2014-01-01', 'zhette', '$2y$10$SjkdCHv8WFgT0x7vvjxS8OZIw00Mu/LmlQw2pWFWzTbpwb9Vx4bZi', 'A'),
(72, 1, 1, 'Khyroul', 'Pierre', '', '', '', '2014-01-01', 'khyroul', '$2y$10$gceKy5TVdCQ6o7A/cfIIYeEa6FZOrcMGrmkWBjq7tXtCCnPPEJVne', 'G');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `activite_compl`
--
ALTER TABLE `activite_compl`
  ADD PRIMARY KEY (`id_activite_compl`);

--
-- Index pour la table `composant`
--
ALTER TABLE `composant`
  ADD PRIMARY KEY (`id_composant`);

--
-- Index pour la table `constituer`
--
ALTER TABLE `constituer`
  ADD PRIMARY KEY (`id_composant`,`id_medicament`),
  ADD KEY `fk_constituer_medicament` (`id_medicament`);

--
-- Index pour la table `dosage`
--
ALTER TABLE `dosage`
  ADD PRIMARY KEY (`id_dosage`);

--
-- Index pour la table `etat`
--
ALTER TABLE `etat`
  ADD PRIMARY KEY (`id_etat`);

--
-- Index pour la table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Index pour la table `famille`
--
ALTER TABLE `famille`
  ADD PRIMARY KEY (`id_famille`);

--
-- Index pour la table `formuler`
--
ALTER TABLE `formuler`
  ADD PRIMARY KEY (`id_medicament`,`id_presentation`),
  ADD KEY `fk_formuler_presentation` (`id_presentation`);

--
-- Index pour la table `frais`
--
ALTER TABLE `frais`
  ADD PRIMARY KEY (`id_frais`),
  ADD KEY `fk_frais_etat` (`id_etat`),
  ADD KEY `fk_frais_visiteur` (`id_visiteur`);

--
-- Index pour la table `fraisforfait`
--
ALTER TABLE `fraisforfait`
  ADD PRIMARY KEY (`id_fraisforfait`);

--
-- Index pour la table `fraishorsforfait`
--
ALTER TABLE `fraishorsforfait`
  ADD PRIMARY KEY (`id_fraishorsforfait`),
  ADD KEY `fk_fraishorsforfait_frais` (`id_frais`);

--
-- Index pour la table `interagir`
--
ALTER TABLE `interagir`
  ADD PRIMARY KEY (`id_medicament`,`med_id_medicament`),
  ADD KEY `fk_interagir_medicament_dest` (`med_id_medicament`);

--
-- Index pour la table `inviter`
--
ALTER TABLE `inviter`
  ADD PRIMARY KEY (`id_activite_compl`,`id_praticien`),
  ADD KEY `fk_inviter_praticien` (`id_praticien`);

--
-- Index pour la table `laboratoire`
--
ALTER TABLE `laboratoire`
  ADD PRIMARY KEY (`id_laboratoire`);

--
-- Index pour la table `ligne_fraisforfait`
--
ALTER TABLE `ligne_fraisforfait`
  ADD PRIMARY KEY (`id_frais`,`id_fraisforfait`),
  ADD KEY `fk_ligne_fraisforfait` (`id_fraisforfait`);

--
-- Index pour la table `medicament`
--
ALTER TABLE `medicament`
  ADD PRIMARY KEY (`id_medicament`),
  ADD KEY `fk_medicament_famille` (`id_famille`);

--
-- Index pour la table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `offrir`
--
ALTER TABLE `offrir`
  ADD PRIMARY KEY (`id_medicament`,`id_rapport`),
  ADD KEY `fk_offrir_rapport_visite` (`id_rapport`);

--
-- Index pour la table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Index pour la table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Index pour la table `posseder`
--
ALTER TABLE `posseder`
  ADD PRIMARY KEY (`id_praticien`,`id_specialite`),
  ADD KEY `fk_posseder_specialite` (`id_specialite`);

--
-- Index pour la table `praticien`
--
ALTER TABLE `praticien`
  ADD PRIMARY KEY (`id_praticien`),
  ADD KEY `fk_praticien_type_praticien` (`id_type_praticien`);

--
-- Index pour la table `prescrire`
--
ALTER TABLE `prescrire`
  ADD PRIMARY KEY (`id_dosage`,`id_medicament`,`id_type_individu`),
  ADD KEY `fk_prescrire_medicament` (`id_medicament`),
  ADD KEY `fk_prescrire_type_individu` (`id_type_individu`);

--
-- Index pour la table `presentation`
--
ALTER TABLE `presentation`
  ADD PRIMARY KEY (`id_presentation`);

--
-- Index pour la table `rapport_visite`
--
ALTER TABLE `rapport_visite`
  ADD PRIMARY KEY (`id_rapport`),
  ADD KEY `fk_rapport_visite_praticien` (`id_praticien`),
  ADD KEY `fk_rapport_visite_visiteur` (`id_visiteur`);

--
-- Index pour la table `realiser`
--
ALTER TABLE `realiser`
  ADD PRIMARY KEY (`id_activite_compl`,`id_visiteur`),
  ADD KEY `fk_realiser_visiteur` (`id_visiteur`);

--
-- Index pour la table `region`
--
ALTER TABLE `region`
  ADD PRIMARY KEY (`id_region`),
  ADD KEY `fk_region_secteur` (`id_secteur`);

--
-- Index pour la table `secteur`
--
ALTER TABLE `secteur`
  ADD PRIMARY KEY (`id_secteur`);

--
-- Index pour la table `specialite`
--
ALTER TABLE `specialite`
  ADD PRIMARY KEY (`id_specialite`);

--
-- Index pour la table `stats_prescriptions`
--
ALTER TABLE `stats_prescriptions`
  ADD PRIMARY KEY (`id_praticien`,`id_medicament`,`annee_mois`),
  ADD KEY `fk_stats_prescriptions_medicament` (`id_medicament`);

--
-- Index pour la table `travailler`
--
ALTER TABLE `travailler`
  ADD PRIMARY KEY (`id_visiteur`,`jjmmaa`,`id_region`),
  ADD KEY `fk_travailler_region` (`id_region`);

--
-- Index pour la table `type_individu`
--
ALTER TABLE `type_individu`
  ADD PRIMARY KEY (`id_type_individu`);

--
-- Index pour la table `type_praticien`
--
ALTER TABLE `type_praticien`
  ADD PRIMARY KEY (`id_type_praticien`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Index pour la table `visiteur`
--
ALTER TABLE `visiteur`
  ADD PRIMARY KEY (`id_visiteur`),
  ADD UNIQUE KEY `uniq_login_visiteur` (`login_visiteur`),
  ADD KEY `fk_visiteur_secteur` (`id_secteur`),
  ADD KEY `fk_visiteur_laboratoire` (`id_laboratoire`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `activite_compl`
--
ALTER TABLE `activite_compl`
  MODIFY `id_activite_compl` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `composant`
--
ALTER TABLE `composant`
  MODIFY `id_composant` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT pour la table `dosage`
--
ALTER TABLE `dosage`
  MODIFY `id_dosage` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `etat`
--
ALTER TABLE `etat`
  MODIFY `id_etat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `famille`
--
ALTER TABLE `famille`
  MODIFY `id_famille` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT pour la table `frais`
--
ALTER TABLE `frais`
  MODIFY `id_frais` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT pour la table `fraisforfait`
--
ALTER TABLE `fraisforfait`
  MODIFY `id_fraisforfait` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `fraishorsforfait`
--
ALTER TABLE `fraishorsforfait`
  MODIFY `id_fraishorsforfait` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT pour la table `laboratoire`
--
ALTER TABLE `laboratoire`
  MODIFY `id_laboratoire` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `medicament`
--
ALTER TABLE `medicament`
  MODIFY `id_medicament` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT pour la table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `praticien`
--
ALTER TABLE `praticien`
  MODIFY `id_praticien` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- AUTO_INCREMENT pour la table `presentation`
--
ALTER TABLE `presentation`
  MODIFY `id_presentation` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT pour la table `rapport_visite`
--
ALTER TABLE `rapport_visite`
  MODIFY `id_rapport` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `region`
--
ALTER TABLE `region`
  MODIFY `id_region` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT pour la table `secteur`
--
ALTER TABLE `secteur`
  MODIFY `id_secteur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `specialite`
--
ALTER TABLE `specialite`
  MODIFY `id_specialite` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT pour la table `type_individu`
--
ALTER TABLE `type_individu`
  MODIFY `id_type_individu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `type_praticien`
--
ALTER TABLE `type_praticien`
  MODIFY `id_type_praticien` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `visiteur`
--
ALTER TABLE `visiteur`
  MODIFY `id_visiteur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `constituer`
--
ALTER TABLE `constituer`
  ADD CONSTRAINT `fk_constituer_composant` FOREIGN KEY (`id_composant`) REFERENCES `composant` (`id_composant`),
  ADD CONSTRAINT `fk_constituer_medicament` FOREIGN KEY (`id_medicament`) REFERENCES `medicament` (`id_medicament`);

--
-- Contraintes pour la table `formuler`
--
ALTER TABLE `formuler`
  ADD CONSTRAINT `fk_formuler_medicament` FOREIGN KEY (`id_medicament`) REFERENCES `medicament` (`id_medicament`),
  ADD CONSTRAINT `fk_formuler_presentation` FOREIGN KEY (`id_presentation`) REFERENCES `presentation` (`id_presentation`);

--
-- Contraintes pour la table `frais`
--
ALTER TABLE `frais`
  ADD CONSTRAINT `fk_frais_etat` FOREIGN KEY (`id_etat`) REFERENCES `etat` (`id_etat`),
  ADD CONSTRAINT `fk_frais_visiteur` FOREIGN KEY (`id_visiteur`) REFERENCES `visiteur` (`id_visiteur`);

--
-- Contraintes pour la table `fraishorsforfait`
--
ALTER TABLE `fraishorsforfait`
  ADD CONSTRAINT `fk_fraishorsforfait_frais` FOREIGN KEY (`id_frais`) REFERENCES `frais` (`id_frais`);

--
-- Contraintes pour la table `interagir`
--
ALTER TABLE `interagir`
  ADD CONSTRAINT `fk_interagir_medicament` FOREIGN KEY (`id_medicament`) REFERENCES `medicament` (`id_medicament`),
  ADD CONSTRAINT `fk_interagir_medicament_dest` FOREIGN KEY (`med_id_medicament`) REFERENCES `medicament` (`id_medicament`);

--
-- Contraintes pour la table `inviter`
--
ALTER TABLE `inviter`
  ADD CONSTRAINT `fk_inviter_activite_compl` FOREIGN KEY (`id_activite_compl`) REFERENCES `activite_compl` (`id_activite_compl`),
  ADD CONSTRAINT `fk_inviter_praticien` FOREIGN KEY (`id_praticien`) REFERENCES `praticien` (`id_praticien`);

--
-- Contraintes pour la table `ligne_fraisforfait`
--
ALTER TABLE `ligne_fraisforfait`
  ADD CONSTRAINT `fk_ligne_frais` FOREIGN KEY (`id_frais`) REFERENCES `frais` (`id_frais`),
  ADD CONSTRAINT `fk_ligne_fraisforfait` FOREIGN KEY (`id_fraisforfait`) REFERENCES `fraisforfait` (`id_fraisforfait`);

--
-- Contraintes pour la table `medicament`
--
ALTER TABLE `medicament`
  ADD CONSTRAINT `fk_medicament_famille` FOREIGN KEY (`id_famille`) REFERENCES `famille` (`id_famille`);

--
-- Contraintes pour la table `offrir`
--
ALTER TABLE `offrir`
  ADD CONSTRAINT `fk_offrir_medicament` FOREIGN KEY (`id_medicament`) REFERENCES `medicament` (`id_medicament`),
  ADD CONSTRAINT `fk_offrir_rapport_visite` FOREIGN KEY (`id_rapport`) REFERENCES `rapport_visite` (`id_rapport`);

--
-- Contraintes pour la table `posseder`
--
ALTER TABLE `posseder`
  ADD CONSTRAINT `fk_posseder_praticien` FOREIGN KEY (`id_praticien`) REFERENCES `praticien` (`id_praticien`),
  ADD CONSTRAINT `fk_posseder_specialite` FOREIGN KEY (`id_specialite`) REFERENCES `specialite` (`id_specialite`);

--
-- Contraintes pour la table `praticien`
--
ALTER TABLE `praticien`
  ADD CONSTRAINT `fk_praticien_type_praticien` FOREIGN KEY (`id_type_praticien`) REFERENCES `type_praticien` (`id_type_praticien`);

--
-- Contraintes pour la table `prescrire`
--
ALTER TABLE `prescrire`
  ADD CONSTRAINT `fk_prescrire_dosage` FOREIGN KEY (`id_dosage`) REFERENCES `dosage` (`id_dosage`),
  ADD CONSTRAINT `fk_prescrire_medicament` FOREIGN KEY (`id_medicament`) REFERENCES `medicament` (`id_medicament`),
  ADD CONSTRAINT `fk_prescrire_type_individu` FOREIGN KEY (`id_type_individu`) REFERENCES `type_individu` (`id_type_individu`);

--
-- Contraintes pour la table `rapport_visite`
--
ALTER TABLE `rapport_visite`
  ADD CONSTRAINT `fk_rapport_visite_praticien` FOREIGN KEY (`id_praticien`) REFERENCES `praticien` (`id_praticien`),
  ADD CONSTRAINT `fk_rapport_visite_visiteur` FOREIGN KEY (`id_visiteur`) REFERENCES `visiteur` (`id_visiteur`);

--
-- Contraintes pour la table `realiser`
--
ALTER TABLE `realiser`
  ADD CONSTRAINT `fk_realiser_activite_compl` FOREIGN KEY (`id_activite_compl`) REFERENCES `activite_compl` (`id_activite_compl`),
  ADD CONSTRAINT `fk_realiser_visiteur` FOREIGN KEY (`id_visiteur`) REFERENCES `visiteur` (`id_visiteur`);

--
-- Contraintes pour la table `region`
--
ALTER TABLE `region`
  ADD CONSTRAINT `fk_region_secteur` FOREIGN KEY (`id_secteur`) REFERENCES `secteur` (`id_secteur`);

--
-- Contraintes pour la table `stats_prescriptions`
--
ALTER TABLE `stats_prescriptions`
  ADD CONSTRAINT `fk_stats_prescriptions_medicament` FOREIGN KEY (`id_medicament`) REFERENCES `medicament` (`id_medicament`),
  ADD CONSTRAINT `fk_stats_prescriptions_praticien` FOREIGN KEY (`id_praticien`) REFERENCES `praticien` (`id_praticien`);

--
-- Contraintes pour la table `travailler`
--
ALTER TABLE `travailler`
  ADD CONSTRAINT `fk_travailler_region` FOREIGN KEY (`id_region`) REFERENCES `region` (`id_region`),
  ADD CONSTRAINT `fk_travailler_visiteur` FOREIGN KEY (`id_visiteur`) REFERENCES `visiteur` (`id_visiteur`);

--
-- Contraintes pour la table `visiteur`
--
ALTER TABLE `visiteur`
  ADD CONSTRAINT `fk_visiteur_laboratoire` FOREIGN KEY (`id_laboratoire`) REFERENCES `laboratoire` (`id_laboratoire`),
  ADD CONSTRAINT `fk_visiteur_secteur` FOREIGN KEY (`id_secteur`) REFERENCES `secteur` (`id_secteur`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
