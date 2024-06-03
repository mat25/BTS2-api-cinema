-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : lun. 03 juin 2024 à 17:33
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
-- Base de données : `db_cinema`
--

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20240212100724', '2024-03-27 17:27:58', 297);

-- --------------------------------------------------------

--
-- Structure de la table `film`
--

CREATE TABLE `film` (
  `id` int(11) NOT NULL,
  `titre` varchar(150) NOT NULL,
  `duree` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `film`
--

INSERT INTO `film` (`id`, `titre`, `duree`) VALUES
(22, 'The Truman Show', 41),
(23, 'Creed', 30),
(24, 'Stalker', 94),
(25, 'Alien', 160),
(26, 'Gran Torino', 189),
(27, 'Vertigo', 63),
(28, 'The Lord of the Rings', 130),
(29, 'Vertigo', 136),
(30, 'The Great Dictator', 167),
(31, 'V for Vendetta', 194),
(32, 'Terminator', 107),
(33, 'Jaws', 150),
(34, 'We Own the Night', 65),
(35, 'The Departed', 126),
(36, 'Room', 104),
(37, 'Titanic', 174),
(38, '12 Years a Slave', 83),
(39, 'No Country for Old Men', 52),
(40, 'The Irishman', 198),
(41, 'Aliens', 123),
(42, 'The Lion King', 170);

-- --------------------------------------------------------

--
-- Structure de la table `messenger_messages`
--

CREATE TABLE `messenger_messages` (
  `id` bigint(20) NOT NULL,
  `body` longtext NOT NULL,
  `headers` longtext NOT NULL,
  `queue_name` varchar(190) NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `available_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `delivered_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `reservation`
--

CREATE TABLE `reservation` (
  `id` int(11) NOT NULL,
  `seance_id` int(11) DEFAULT NULL,
  `users_id` int(11) DEFAULT NULL,
  `nb_place_reservation` int(11) NOT NULL,
  `date_réservation` datetime NOT NULL,
  `montant` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `reservation`
--

INSERT INTO `reservation` (`id`, `seance_id`, `users_id`, `nb_place_reservation`, `date_réservation`, `montant`) VALUES
(28, 28, 25, 5, '2024-05-11 15:41:45', 33.7),
(29, 24, 25, 15, '2024-05-11 15:45:17', 77.55),
(30, 23, 25, 4, '2024-05-11 16:01:45', 34.36),
(31, 24, 25, 2, '2024-05-12 15:59:02', 10.34),
(32, 25, 25, 4, '2024-05-31 21:13:08', 23.76),
(33, 25, 25, 2, '2024-06-01 11:11:01', 11.88),
(34, 25, 25, 2, '2024-06-01 11:13:19', 11.88),
(35, 22, 27, 8, '2024-06-03 17:28:07', 48),
(36, 30, 27, 12, '2024-06-03 17:28:15', 110.28),
(37, 32, 27, 2, '2024-06-03 17:28:24', 19.66),
(38, 23, 27, 4, '2024-06-03 17:28:32', 34.36),
(39, 33, 27, 3, '2024-06-03 17:28:42', 29.73),
(40, 25, 27, 2, '2024-06-03 17:29:49', 11.88);

-- --------------------------------------------------------

--
-- Structure de la table `salle`
--

CREATE TABLE `salle` (
  `id` int(11) NOT NULL,
  `nom_salle` varchar(100) NOT NULL,
  `nb_place` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `salle`
--

INSERT INTO `salle` (`id`, `nom_salle`, `nb_place`) VALUES
(22, 'Bill Murray', 134),
(23, 'Woody Allen', 149),
(24, 'Maggie Gyllenhaal', 29),
(25, 'Adam Driver', 82),
(26, 'Ellen Page', 133),
(27, 'Christoph Waltz', 116),
(28, 'Tilda Swinton', 124),
(29, 'Michael Douglas', 62),
(30, 'Emma Watson', 81),
(31, 'Olivia Colman', 16),
(32, 'Reese Witherspoon', 99),
(33, 'Jake Gyllenhaal', 33),
(34, 'Jodie Foster', 65),
(35, 'Robert de Niro', 47),
(36, 'Ingrid Bergman', 116),
(37, 'Jonah Hill', 105),
(38, 'Benicio Del Toro', 105),
(39, 'Cameron Diaz', 53),
(40, 'Steve Carell', 79),
(41, 'Scarlett Johanson', 50),
(42, 'James Dean', 96);

-- --------------------------------------------------------

--
-- Structure de la table `seance`
--

CREATE TABLE `seance` (
  `id` int(11) NOT NULL,
  `salle_id` int(11) DEFAULT NULL,
  `film_id` int(11) DEFAULT NULL,
  `date_projection` datetime NOT NULL,
  `tarif_normal` double NOT NULL,
  `tarif_reduit` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `seance`
--

INSERT INTO `seance` (`id`, `salle_id`, `film_id`, `date_projection`, `tarif_normal`, `tarif_reduit`) VALUES
(22, 22, 22, '2025-05-15 11:15:35', 6, 4.2),
(23, 23, 22, '2025-05-12 08:17:42', 8.59, 6),
(24, 24, 22, '2025-05-14 14:09:48', 5.17, 3.619),
(25, 25, 25, '2025-05-06 21:51:07', 5.94, 4.158),
(26, 26, 26, '2025-05-16 15:42:58', 7.93, 5.551),
(27, 27, 27, '2025-05-08 09:16:32', 8.95, 6.265),
(28, 28, 28, '2025-05-12 19:43:38', 6.74, 4.718),
(29, 29, 29, '2025-05-19 20:14:41', 6.71, 4.697),
(30, 30, 30, '2025-05-12 19:10:40', 9.19, 6.433),
(31, 31, 31, '2025-05-17 18:40:47', 7.14, 4.998),
(32, 32, 32, '2025-05-08 23:00:30', 9.83, 6.881),
(33, 33, 33, '2025-05-13 10:22:04', 9.91, 6.937),
(34, 34, 34, '2024-05-11 09:44:11', 7.19, 5.033),
(35, 35, 35, '2024-05-11 11:52:27', 7.05, 4.935),
(36, 36, 36, '2024-05-06 13:46:24', 8.7, 6.09),
(37, 37, 37, '2024-05-18 22:41:48', 7.74, 5.418),
(38, 38, 38, '2024-05-18 16:37:48', 8.56, 5.992),
(39, 39, 39, '2024-05-07 08:06:11', 7.88, 5.516),
(40, 40, 40, '2024-05-17 01:11:20', 8.77, 6.139),
(41, 41, 41, '2024-05-11 05:26:47', 5.34, 3.738),
(42, 42, 42, '2024-05-13 22:36:56', 9.76, 6.832);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(180) NOT NULL,
  `roles` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '(DC2Type:json)' CHECK (json_valid(`roles`)),
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`) VALUES
(25, 'mateojean25660@gmail.com', '[\"ROLE_USER\"]', '$2y$10$NRC1.QPuBRcltIt4nz6rSestOVLqvMolMPp1OCPzBeU/1n/HI.Vym'),
(26, 'test@test.fr', '[\"ROLE_USER\"]', '$2y$10$ZfMCtkOtDjpjztNUIu8ve.Xc7sXXkvUoTzC4e2H.j3CgcXGrC5MRy'),
(27, 'Joe@gmail.com', '[\"ROLE_USER\"]', '$2y$10$otBF2EHY4b0sv9d/jNGrH.WKSIhTSMNpSNWH78n1nofh26UFmzCQi');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Index pour la table `film`
--
ALTER TABLE `film`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  ADD KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  ADD KEY `IDX_75EA56E016BA31DB` (`delivered_at`);

--
-- Index pour la table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_42C84955E3797A94` (`seance_id`),
  ADD KEY `IDX_42C8495567B3B43D` (`users_id`);

--
-- Index pour la table `salle`
--
ALTER TABLE `salle`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `seance`
--
ALTER TABLE `seance`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_DF7DFD0EDC304035` (`salle_id`),
  ADD KEY `IDX_DF7DFD0E567F5183` (`film_id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `film`
--
ALTER TABLE `film`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT pour la table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `reservation`
--
ALTER TABLE `reservation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT pour la table `salle`
--
ALTER TABLE `salle`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT pour la table `seance`
--
ALTER TABLE `seance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `FK_42C8495567B3B43D` FOREIGN KEY (`users_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_42C84955E3797A94` FOREIGN KEY (`seance_id`) REFERENCES `seance` (`id`);

--
-- Contraintes pour la table `seance`
--
ALTER TABLE `seance`
  ADD CONSTRAINT `FK_DF7DFD0E567F5183` FOREIGN KEY (`film_id`) REFERENCES `film` (`id`),
  ADD CONSTRAINT `FK_DF7DFD0EDC304035` FOREIGN KEY (`salle_id`) REFERENCES `salle` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
