-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 15 Lip 2021, 12:36
-- Wersja serwera: 10.4.20-MariaDB
-- Wersja PHP: 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `rezerwacje_lotnicze`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `adres`
--

CREATE TABLE `adres` (
  `id` int(11) NOT NULL,
  `wojewodztwo` varchar(45) COLLATE utf8_polish_ci DEFAULT NULL,
  `powiat` varchar(45) COLLATE utf8_polish_ci DEFAULT NULL,
  `miejscowosc` varchar(60) COLLATE utf8_polish_ci NOT NULL,
  `ulica` varchar(60) COLLATE utf8_polish_ci NOT NULL,
  `numer_domu` varchar(8) COLLATE utf8_polish_ci NOT NULL,
  `numer_lokalu` varchar(5) COLLATE utf8_polish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `adres`
--

INSERT INTO `adres` (`id`, `wojewodztwo`, `powiat`, `miejscowosc`, `ulica`, `numer_domu`, `numer_lokalu`) VALUES
(1, 'małopolskie', 'krakowski', 'Kraków', 'Sienkiewicza', '7', '4b'),
(2, 'mazowieckie', NULL, 'Grójec', 'krakowska', '15', NULL),
(3, NULL, NULL, 'Łowicz', 'węgierska', '2', '34');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `lot`
--

CREATE TABLE `lot` (
  `numer_lotu` int(11) NOT NULL,
  `data_wylotu` datetime NOT NULL,
  `samolot_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pasazer`
--

CREATE TABLE `pasazer` (
  `id` int(11) NOT NULL,
  `imie` varchar(45) COLLATE utf8_polish_ci NOT NULL,
  `nazwisko` varchar(45) COLLATE utf8_polish_ci NOT NULL,
  `pesel` varchar(11) COLLATE utf8_polish_ci NOT NULL,
  `telefon` varchar(15) COLLATE utf8_polish_ci NOT NULL,
  `mail` varchar(80) COLLATE utf8_polish_ci NOT NULL,
  `adres_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `pasazer`
--

INSERT INTO `pasazer` (`id`, `imie`, `nazwisko`, `pesel`, `telefon`, `mail`, `adres_id`) VALUES
(1, 'Jan', 'Kowalski', '78120715632', '745896325', 'jan@kowalski.pl', 1),
(2, 'Adam', 'Nowak', '95071478523', '958745693', 'adam@nowak.eu', 2),
(3, 'Piotr', 'Kowalczyk', '88103014523', '636985219', 'piotr@kowalczyk.com', NULL);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `rezerwacja`
--

CREATE TABLE `rezerwacja` (
  `id` int(11) NOT NULL,
  `numer_siedzenia` int(11) NOT NULL,
  `bagaz` varchar(45) COLLATE utf8_polish_ci DEFAULT NULL,
  `pasazer_id` int(11) DEFAULT NULL,
  `lot_numer_lotu` int(11) DEFAULT NULL,
  `status_rezerwacji_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `samolot`
--

CREATE TABLE `samolot` (
  `id` int(11) NOT NULL,
  `producent` varchar(45) COLLATE utf8_polish_ci NOT NULL,
  `typ` varchar(45) COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `status_rezerwacji`
--

CREATE TABLE `status_rezerwacji` (
  `id` int(11) NOT NULL,
  `status` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `status_rezerwacji`
--

INSERT INTO `status_rezerwacji` (`id`, `status`) VALUES
(1, 'potwierdzony'),
(2, 'odwołany'),
(3, 'oczekujący');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `adres`
--
ALTER TABLE `adres`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `lot`
--
ALTER TABLE `lot`
  ADD PRIMARY KEY (`numer_lotu`),
  ADD KEY `samolot_id` (`samolot_id`);

--
-- Indeksy dla tabeli `pasazer`
--
ALTER TABLE `pasazer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `adres_id` (`adres_id`);

--
-- Indeksy dla tabeli `rezerwacja`
--
ALTER TABLE `rezerwacja`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pasazer_id` (`pasazer_id`),
  ADD KEY `lot_numer_lotu` (`lot_numer_lotu`),
  ADD KEY `status_rezerwacji_id` (`status_rezerwacji_id`);

--
-- Indeksy dla tabeli `samolot`
--
ALTER TABLE `samolot`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `status_rezerwacji`
--
ALTER TABLE `status_rezerwacji`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `adres`
--
ALTER TABLE `adres`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT dla tabeli `lot`
--
ALTER TABLE `lot`
  MODIFY `numer_lotu` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `pasazer`
--
ALTER TABLE `pasazer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT dla tabeli `rezerwacja`
--
ALTER TABLE `rezerwacja`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `samolot`
--
ALTER TABLE `samolot`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `status_rezerwacji`
--
ALTER TABLE `status_rezerwacji`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `pasazer`
--
ALTER TABLE `pasazer`
  ADD CONSTRAINT `pasazer_ibfk_1` FOREIGN KEY (`adres_id`) REFERENCES `adres` (`id`);

--
-- Ograniczenia dla tabeli `rezerwacja`
--
ALTER TABLE `rezerwacja`
  ADD CONSTRAINT `rezerwacja_ibfk_1` FOREIGN KEY (`pasazer_id`) REFERENCES `pasazer` (`id`),
  ADD CONSTRAINT `rezerwacja_ibfk_2` FOREIGN KEY (`lot_numer_lotu`) REFERENCES `lot` (`numer_lotu`),
  ADD CONSTRAINT `rezerwacja_ibfk_3` FOREIGN KEY (`status_rezerwacji_id`) REFERENCES `status_rezerwacji` (`id`);

--
-- Ograniczenia dla tabeli `samolot`
--
ALTER TABLE `samolot`
  ADD CONSTRAINT `samolot_ibfk_1` FOREIGN KEY (`id`) REFERENCES `lot` (`samolot_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
