-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sty 25, 2024 at 11:20 PM
-- Wersja serwera: 10.4.32-MariaDB
-- Wersja PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kursantki`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `cena`
--

CREATE TABLE `cena` (
  `cena_id` int(11) NOT NULL,
  `kurs_id` int(11) DEFAULT NULL,
  `cena` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Dumping data for table `cena`
--

INSERT INTO `cena` (`cena_id`, `kurs_id`, `cena`) VALUES
(1, 7, 2000),
(2, 8, 2500),
(3, 9, 1500),
(4, 10, 2000);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `kurs`
--

CREATE TABLE `kurs` (
  `kurs_id` int(11) NOT NULL,
  `nazwa` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Dumping data for table `kurs`
--

INSERT INTO `kurs` (`kurs_id`, `nazwa`) VALUES
(7, 'PHP'),
(8, 'C++'),
(9, 'Java'),
(10, 'Python');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `kursantki`
--

CREATE TABLE `kursantki` (
  `kursantki_id` int(11) NOT NULL,
  `imie` varchar(15) NOT NULL,
  `nazwisko` varchar(150) NOT NULL DEFAULT 'uczen'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Dumping data for table `kursantki`
--

INSERT INTO `kursantki` (`kursantki_id`, `imie`, `nazwisko`) VALUES
(1, 'Ola', 'uczen'),
(2, 'Iza', 'uczen'),
(3, 'Kasia', 'uczen'),
(4, 'Ania', 'uczen'),
(5, 'Monika', 'uczen'),
(6, 'Basia', 'uczen');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `nauka`
--

CREATE TABLE `nauka` (
  `nauka_id` int(11) NOT NULL,
  `kursantki_id` int(11) DEFAULT NULL,
  `kurs_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Dumping data for table `nauka`
--

INSERT INTO `nauka` (`nauka_id`, `kursantki_id`, `kurs_id`) VALUES
(7, 1, 7),
(8, 1, 8),
(9, 2, 10),
(10, 3, 9),
(11, 4, 9),
(12, 5, 7),
(13, 6, 9),
(14, 6, 8);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `oceny`
--

CREATE TABLE `oceny` (
  `ocena_id` int(11) NOT NULL,
  `kursantki_id` int(11) DEFAULT NULL,
  `kurs_id` int(11) DEFAULT NULL,
  `ocena` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Dumping data for table `oceny`
--

INSERT INTO `oceny` (`ocena_id`, `kursantki_id`, `kurs_id`, `ocena`) VALUES
(1, 1, 7, 90),
(2, 1, 8, 85),
(3, 2, 10, 92),
(4, 3, 9, 88),
(5, 4, 9, 95),
(6, 5, 7, 87),
(7, 6, 9, 91),
(8, 6, 8, 89);

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `cena`
--
ALTER TABLE `cena`
  ADD PRIMARY KEY (`cena_id`),
  ADD KEY `kurs_id` (`kurs_id`);

--
-- Indeksy dla tabeli `kurs`
--
ALTER TABLE `kurs`
  ADD PRIMARY KEY (`kurs_id`);

--
-- Indeksy dla tabeli `kursantki`
--
ALTER TABLE `kursantki`
  ADD PRIMARY KEY (`kursantki_id`);

--
-- Indeksy dla tabeli `nauka`
--
ALTER TABLE `nauka`
  ADD PRIMARY KEY (`nauka_id`),
  ADD KEY `kursantki_id` (`kursantki_id`),
  ADD KEY `kurs_id` (`kurs_id`);

--
-- Indeksy dla tabeli `oceny`
--
ALTER TABLE `oceny`
  ADD PRIMARY KEY (`ocena_id`),
  ADD KEY `kursantki_id` (`kursantki_id`),
  ADD KEY `kurs_id` (`kurs_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cena`
--
ALTER TABLE `cena`
  MODIFY `cena_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `kurs`
--
ALTER TABLE `kurs`
  MODIFY `kurs_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `kursantki`
--
ALTER TABLE `kursantki`
  MODIFY `kursantki_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `nauka`
--
ALTER TABLE `nauka`
  MODIFY `nauka_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `oceny`
--
ALTER TABLE `oceny`
  MODIFY `ocena_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cena`
--
ALTER TABLE `cena`
  ADD CONSTRAINT `cena_ibfk_1` FOREIGN KEY (`kurs_id`) REFERENCES `kurs` (`kurs_id`);

--
-- Constraints for table `nauka`
--
ALTER TABLE `nauka`
  ADD CONSTRAINT `nauka_ibfk_1` FOREIGN KEY (`kursantki_id`) REFERENCES `kursantki` (`kursantki_id`),
  ADD CONSTRAINT `nauka_ibfk_2` FOREIGN KEY (`kurs_id`) REFERENCES `kurs` (`kurs_id`);

--
-- Constraints for table `oceny`
--
ALTER TABLE `oceny`
  ADD CONSTRAINT `oceny_ibfk_1` FOREIGN KEY (`kursantki_id`) REFERENCES `kursantki` (`kursantki_id`),
  ADD CONSTRAINT `oceny_ibfk_2` FOREIGN KEY (`kurs_id`) REFERENCES `kurs` (`kurs_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
