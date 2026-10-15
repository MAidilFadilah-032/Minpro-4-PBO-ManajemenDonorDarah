-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 15, 2026 at 05:57 AM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `donasi_darah`
--

-- --------------------------------------------------------

--
-- Table structure for table `donor`
--

CREATE TABLE `donor` (
  `id` int NOT NULL,
  `nama` varchar(100) NOT NULL,
  `golongan_darah` varchar(2) NOT NULL,
  `umur` int NOT NULL,
  `no_telepon` varchar(16) NOT NULL,
  `kategori` varchar(5) NOT NULL,
  `sumber_informasi` varchar(100) DEFAULT NULL,
  `jumlah_donasi` int DEFAULT NULL
) ;

--
-- Dumping data for table `donor`
--

INSERT INTO `donor` (`id`, `nama`, `golongan_darah`, `umur`, `no_telepon`, `kategori`, `sumber_informasi`, `jumlah_donasi`) VALUES
(1, 'Siti Aminah', 'A', 22, '081234567890', 'BARU', 'Media sosial', NULL),
(2, 'Budi Santoso', 'O', 30, '081298765432', 'TETAP', NULL, 4),
(5, 'Aidil', 'B', 20, '085389244432', 'BARU', 'Tidak disebutkan', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `riwayat_donasi`
--

CREATE TABLE `riwayat_donasi` (
  `id_donasi` int NOT NULL,
  `id_donor` int NOT NULL,
  `tanggal_donasi` date NOT NULL,
  `jumlah_kantong` int NOT NULL
) ;

--
-- Dumping data for table `riwayat_donasi`
--

INSERT INTO `riwayat_donasi` (`id_donasi`, `id_donor`, `tanggal_donasi`, `jumlah_kantong`) VALUES
(1, 2, '2026-01-15', 1),
(2, 2, '2026-01-20', 2),
(3, 5, '2026-01-20', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `donor`
--
ALTER TABLE `donor`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `riwayat_donasi`
--
ALTER TABLE `riwayat_donasi`
  ADD PRIMARY KEY (`id_donasi`),
  ADD KEY `fk_donasi_donor` (`id_donor`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `donor`
--
ALTER TABLE `donor`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `riwayat_donasi`
--
ALTER TABLE `riwayat_donasi`
  MODIFY `id_donasi` int NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `riwayat_donasi`
--
ALTER TABLE `riwayat_donasi`
  ADD CONSTRAINT `fk_donasi_donor` FOREIGN KEY (`id_donor`) REFERENCES `donor` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
