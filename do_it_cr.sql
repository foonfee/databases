-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 14 Paź 2018, 12:49
-- Wersja serwera: 10.1.30-MariaDB
-- Wersja PHP: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `do_it_cr`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `faktury`
--

CREATE TABLE `faktury` (
  `id` int(11) NOT NULL,
  `id_pracownik` int(11) NOT NULL,
  `id_klient` int(11) NOT NULL,
  `sp_platnosci` int(11) NOT NULL,
  `data_wystawienia` date NOT NULL,
  `data_sprzedazy` date NOT NULL,
  `nr` varchar(10) COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `faktury`
--

INSERT INTO `faktury` (`id`, `id_pracownik`, `id_klient`, `sp_platnosci`, `data_wystawienia`, `data_sprzedazy`, `nr`) VALUES
(1, 3, 2, 1, '2018-09-18', '2018-09-18', '1/09/2018'),
(2, 3, 4, 1, '2018-09-13', '2018-09-13', '2/09/2018');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `klienci`
--

CREATE TABLE `klienci` (
  `id` int(11) NOT NULL,
  `imie` varchar(30) COLLATE utf8_polish_ci NOT NULL,
  `nazwisko` varchar(30) COLLATE utf8_polish_ci NOT NULL,
  `ulica` varchar(50) COLLATE utf8_polish_ci NOT NULL,
  `miasto` varchar(30) COLLATE utf8_polish_ci NOT NULL,
  `kod` varchar(6) COLLATE utf8_polish_ci NOT NULL,
  `tel` int(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `klienci`
--

INSERT INTO `klienci` (`id`, `imie`, `nazwisko`, `ulica`, `miasto`, `kod`, `tel`) VALUES
(1, 'Dawid', 'Myszka', 'Jana Pawła II 8', 'Bielsko - Biała', '43-300', 0),
(2, 'Przemysław', 'Łukaszek', 'Grzybowa 12/3', 'Bielsko - Biała', '43-300', 0),
(3, 'Krzysztof', 'Błaszek', 'Farbowa 31', 'Bielsko - Biała', '43-300', 0),
(4, 'Konrad', 'Spyra', 'Fabryczna 72', 'Żywiec', '34-300', 0),
(5, 'Oskar', 'Mrówka', 'Grzybowa 142', 'Żywiec', '34-300', 0);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pracownicy`
--

CREATE TABLE `pracownicy` (
  `id` int(11) NOT NULL,
  `imie` varchar(30) COLLATE utf8_polish_ci NOT NULL,
  `nazwisko` varchar(30) COLLATE utf8_polish_ci NOT NULL,
  `login` varchar(11) COLLATE utf8_polish_ci NOT NULL,
  `password` varchar(32) COLLATE utf8_polish_ci NOT NULL,
  `type` varchar(30) COLLATE utf8_polish_ci DEFAULT NULL,
  `adres` varchar(30) COLLATE utf8_polish_ci NOT NULL,
  `miasto` varchar(30) COLLATE utf8_polish_ci NOT NULL,
  `wojewodztwo` varchar(30) COLLATE utf8_polish_ci NOT NULL,
  `kod_pocztowy` int(5) NOT NULL,
  `tel` int(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `pracownicy`
--

INSERT INTO `pracownicy` (`id`, `imie`, `nazwisko`, `login`, `password`, `type`, `adres`, `miasto`, `wojewodztwo`, `kod_pocztowy`, `tel`) VALUES
(1, 'Paweł', 'Drzazga', 'paw.drz7453', 'ZAQ!2wsx', 'admin', 'Kasztanowa 12/3', 'Bielsko - Biała ', 'Śląsk', 34300, 563589654),
(3, 'Szymon', 'Ciemnik', 'szy.cie9384', 'ZAQ!2wsx', 'user', 'Olszowa 8a', 'Bielsko - Biała', 'Śląsk', 34300, 548659845),
(4, 'Krzysztof', 'Szczurnik', 'krz.szc9283', 'ZAQ!2wsx', 'user', 'Łagodna 3', 'Bielsko - Biała', 'Śląsk', 34300, 0),
(5, 'Zbigniew', 'Domagała', 'zbi.dom0293', 'ZAQ!2wsx', 'user', 'Zgodna 129', 'Pietrzykowice', 'Śląsk', 34326, 0),
(6, 'Franciszek', 'Grys', 'fra.gry2684', 'ZAQ!2wsx', 'user', 'Olchowa 21', 'Cieszyn', 'Śląsk', 32569, 0),
(8, 'Daniel', 'Kawka', 'dan.kaw5896', 'ZAQ!2wsx', 'user', 'Zgodna 7', 'Żywiec', 'Śląsk', 87596, 0);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `uslugi`
--

CREATE TABLE `uslugi` (
  `id` int(11) NOT NULL,
  `nazwa` varchar(200) COLLATE utf8_polish_ci NOT NULL,
  `cena` decimal(9,2) NOT NULL,
  `grupa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `uslugi`
--

INSERT INTO `uslugi` (`id`, `nazwa`, `cena`, `grupa`) VALUES
(1, 'Naprawa i łatanie uszkodzonej opony', '19.00', 1),
(2, 'Uszczelnianie opony', '9.00', 1),
(3, 'Pompowanie koła azotem', '9.00', 1),
(4, 'Prostowanie felg stalowych (za szt.)', '49.00', 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `uslugi_faktury`
--

CREATE TABLE `uslugi_faktury` (
  `id` int(11) NOT NULL,
  `id_faktury` int(11) NOT NULL,
  `id_uslugi` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `uslugi_faktury`
--

INSERT INTO `uslugi_faktury` (`id`, `id_faktury`, `id_uslugi`) VALUES
(1, 1, 2),
(2, 1, 3),
(3, 1, 4),
(4, 2, 1),
(5, 2, 3),
(6, 2, 2),
(7, 2, 4);

--
-- Indeksy dla zrzutów tabel
--

--
-- Indexes for table `faktury`
--
ALTER TABLE `faktury`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_pracownik` (`id_pracownik`),
  ADD KEY `id_klient` (`id_klient`),
  ADD KEY `sp_platnosci` (`sp_platnosci`);

--
-- Indexes for table `klienci`
--
ALTER TABLE `klienci`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pracownicy`
--
ALTER TABLE `pracownicy`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `uslugi`
--
ALTER TABLE `uslugi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `uslugi_faktury`
--
ALTER TABLE `uslugi_faktury`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_faktury` (`id_faktury`),
  ADD KEY `id_uslugi` (`id_uslugi`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `faktury`
--
ALTER TABLE `faktury`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT dla tabeli `klienci`
--
ALTER TABLE `klienci`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT dla tabeli `pracownicy`
--
ALTER TABLE `pracownicy`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT dla tabeli `uslugi`
--
ALTER TABLE `uslugi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT dla tabeli `uslugi_faktury`
--
ALTER TABLE `uslugi_faktury`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
