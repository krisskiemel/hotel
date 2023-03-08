-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 08 Mar 2023, 15:29
-- Wersja serwera: 10.4.24-MariaDB
-- Wersja PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `3a_motel`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `goscie`
--

CREATE TABLE `goscie` (
  `nr_klienta` int(11) NOT NULL,
  `imie` varchar(30) NOT NULL,
  `nazwisko` varchar(50) NOT NULL,
  `adres_zamieszkania` varchar(60) NOT NULL,
  `nr_dowodu` varchar(9) NOT NULL,
  `pesel` varchar(11) NOT NULL,
  `nr_telefonu` varchar(12) NOT NULL,
  `poziom_rabat` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pokoje`
--

CREATE TABLE `pokoje` (
  `nr_pokoju` int(11) NOT NULL,
  `pietro` int(11) NOT NULL,
  `ilosc_osob` int(11) NOT NULL,
  `widok` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pracownicy`
--

CREATE TABLE `pracownicy` (
  `nr_pracownika` int(11) NOT NULL,
  `imie` varchar(30) NOT NULL,
  `nazwisko` varchar(50) NOT NULL,
  `pesel` varchar(11) NOT NULL,
  `login` varchar(6) NOT NULL,
  `haslo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `pracownicy`
--

INSERT INTO `pracownicy` (`nr_pracownika`, `imie`, `nazwisko`, `pesel`, `login`, `haslo`) VALUES
(1, 'Antoni', 'Kaczmarek', '91022312349', 'antkac', ''),
(2, 'Jan', 'Kowalski', '97120110305', 'jankow', ''),
(3, 'Bogna', 'Mróz', '00320501130', 'bogmro', '');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `rezerwacje`
--

CREATE TABLE `rezerwacje` (
  `nr_rezerwacji` int(11) NOT NULL,
  `nr_pokoju` int(11) NOT NULL,
  `nr_klienta` int(11) NOT NULL,
  `nr_pracownika` int(11) NOT NULL,
  `termin_poczatek` date NOT NULL,
  `termin_koniec` date NOT NULL,
  `ilosc_osob` int(11) NOT NULL,
  `typ_wyzywienia` int(11) NOT NULL,
  `zwierze` tinyint(1) NOT NULL,
  `dostep_basen` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `typy_wyzywienia`
--

CREATE TABLE `typy_wyzywienia` (
  `id_wyzywienia` int(11) NOT NULL,
  `nazwa` text NOT NULL,
  `skrot` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `goscie`
--
ALTER TABLE `goscie`
  ADD PRIMARY KEY (`nr_klienta`);

--
-- Indeksy dla tabeli `pokoje`
--
ALTER TABLE `pokoje`
  ADD PRIMARY KEY (`nr_pokoju`);

--
-- Indeksy dla tabeli `pracownicy`
--
ALTER TABLE `pracownicy`
  ADD PRIMARY KEY (`nr_pracownika`);

--
-- Indeksy dla tabeli `rezerwacje`
--
ALTER TABLE `rezerwacje`
  ADD PRIMARY KEY (`nr_rezerwacji`),
  ADD KEY `rezerwacja_gosc` (`nr_klienta`),
  ADD KEY `rezerwacja_pokoj` (`nr_pokoju`),
  ADD KEY `rezerwacja_pracownik` (`nr_pracownika`),
  ADD KEY `rezerwacja_typ_wyzywienia` (`typ_wyzywienia`);

--
-- Indeksy dla tabeli `typy_wyzywienia`
--
ALTER TABLE `typy_wyzywienia`
  ADD PRIMARY KEY (`id_wyzywienia`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `goscie`
--
ALTER TABLE `goscie`
  MODIFY `nr_klienta` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `pracownicy`
--
ALTER TABLE `pracownicy`
  MODIFY `nr_pracownika` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT dla tabeli `rezerwacje`
--
ALTER TABLE `rezerwacje`
  MODIFY `nr_rezerwacji` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `typy_wyzywienia`
--
ALTER TABLE `typy_wyzywienia`
  MODIFY `id_wyzywienia` int(11) NOT NULL AUTO_INCREMENT;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `rezerwacje`
--
ALTER TABLE `rezerwacje`
  ADD CONSTRAINT `rezerwacja_gosc` FOREIGN KEY (`nr_klienta`) REFERENCES `goscie` (`nr_klienta`),
  ADD CONSTRAINT `rezerwacja_pokoj` FOREIGN KEY (`nr_pokoju`) REFERENCES `pokoje` (`nr_pokoju`),
  ADD CONSTRAINT `rezerwacja_pracownik` FOREIGN KEY (`nr_pracownika`) REFERENCES `pracownicy` (`nr_pracownika`),
  ADD CONSTRAINT `rezerwacja_typ_wyzywienia` FOREIGN KEY (`typ_wyzywienia`) REFERENCES `typy_wyzywienia` (`id_wyzywienia`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
