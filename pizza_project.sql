-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Gegenereerd op: 30 mrt 2023 om 10:15
-- Serverversie: 10.4.24-MariaDB
-- PHP-versie: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pizza_project`
--
CREATE DATABASE IF NOT EXISTS `pizza_project` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `pizza_project`;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `img` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `category`
--

INSERT INTO `category` (`id`, `name`, `img`, `description`) VALUES
(1, 'Vis Pizza', 'img/category/fish_pizza.png', NULL),
(2, 'Vlees Pizza', 'img/category/meat_pizza.png', NULL),
(3, 'Vegetarische Pizza', 'img/category/veggie_pizza.png', NULL);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20230215131404', '2023-03-22 14:03:13', 111),
('DoctrineMigrations\\Version20230215132124', '2023-03-22 14:03:13', 12),
('DoctrineMigrations\\Version20230216140904', '2023-03-22 14:03:13', 38),
('DoctrineMigrations\\Version20230222090629', '2023-03-22 14:03:14', 169),
('DoctrineMigrations\\Version20230222090935', '2023-03-22 14:03:14', 15),
('DoctrineMigrations\\Version20230305233459', '2023-03-22 14:03:14', 89),
('DoctrineMigrations\\Version20230310111322', '2023-03-22 14:03:14', 39),
('DoctrineMigrations\\Version20230323133856', '2023-03-30 09:22:42', 671);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `messenger_messages`
--

CREATE TABLE `messenger_messages` (
  `id` bigint(20) NOT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `headers` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue_name` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `available_at` datetime NOT NULL,
  `delivered_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `order`
--

CREATE TABLE `order` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `adress` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zipcode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double DEFAULT NULL,
  `phone_number` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `order`
--

INSERT INTO `order` (`id`, `product_id`, `first_name`, `last_name`, `adress`, `zipcode`, `price`, `phone_number`) VALUES
(1, 1, 'Berdan', 'Yilmaz', 'Tinwerf 16', '1234AB', 13.99, 612345678),
(2, 3, 'Amine', 'El Kadaoi', 'Tinwerf 12', '1234AB', 11.49, 612345679),
(3, 2, 'Arash', 'Fakiri', 'Ijzerwerf 12', '1234AB', 14.69, 1234567890),
(4, 2, 'Berdan', 'Yilmaz', 'Tinwerf 16', '1234AB', 14.69, 0),
(5, 2, 'test', 'test', 'test', 'test', 14.69, 0);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` int(11) NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `product`
--

INSERT INTO `product` (`id`, `name`, `price`, `description`, `category_id`, `image`) VALUES
(1, 'Bbq Chicken Pizza', 13.99, 'Een pizza met bbq kip', 2, 'img/product/meat/bbq_chicken.png'),
(2, 'Chicken Tandoori Pizza', 14.69, 'Een pizza kip tandoori', 2, 'img/product/meat/chicken_tandoori.png'),
(3, 'Chicken Teriyaki Pizza', 11.49, 'Een pizza chicken teriyaki', 2, 'img/product/meat/chicken_teriyaki.png'),
(4, 'Döner Pizza', 10.99, 'Een pizza met kipdöner', 2, 'img/product/meat/doner.png'),
(5, 'Pulled Chicken Pizza', 13.99, 'Een pizza met pulled chicken', 2, 'img/product/meat/pulled_chicken.png'),
(6, 'Pizza Tonijn', 13.99, '...', 1, 'img/product/fish/tuna.png'),
(7, 'Zalm Pizza', 14.99, '...', 1, 'img/product/fish/salmon.png'),
(8, 'Garnaal Pizza', 16.99, '...', 1, 'img/product/fish/shrimp.png'),
(9, 'Mozarella Pizza', 10.99, '...', 3, 'img/product/veggie/mozarella.png'),
(10, 'Kaas Pizza', 9.95, '...', 3, 'img/product/veggie/cheese.png'),
(11, 'California Pizza', 13.45, '...', 3, 'img/product/veggie/cali.png');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `task`
--

CREATE TABLE `task` (
  `id` int(11) NOT NULL,
  `task` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `due_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexen voor geëxporteerde tabellen
--

--
-- Indexen voor tabel `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Indexen voor tabel `messenger_messages`
--
ALTER TABLE `messenger_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  ADD KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  ADD KEY `IDX_75EA56E016BA31DB` (`delivered_at`);

--
-- Indexen voor tabel `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_F52993984584665A` (`product_id`);

--
-- Indexen voor tabel `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_D34A04AD12469DE2` (`category_id`);

--
-- Indexen voor tabel `task`
--
ALTER TABLE `task`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT voor geëxporteerde tabellen
--

--
-- AUTO_INCREMENT voor een tabel `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT voor een tabel `messenger_messages`
--
ALTER TABLE `messenger_messages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `order`
--
ALTER TABLE `order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT voor een tabel `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT voor een tabel `task`
--
ALTER TABLE `task`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Beperkingen voor geëxporteerde tabellen
--

--
-- Beperkingen voor tabel `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `FK_F52993984584665A` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);

--
-- Beperkingen voor tabel `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `FK_D34A04AD12469DE2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
