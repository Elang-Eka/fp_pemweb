-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 31, 2020 at 05:49 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dataapotek`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `ID_BARANG` int(20) NOT NULL,
  `NAMA_BARANG` varchar(255) DEFAULT NULL,
  `KONDISI_BARANG` varchar(255) DEFAULT NULL,
  `KETERANGAN_BARANG` varchar(255) DEFAULT NULL,
  `JUMLAH_BARANG` int(50) NOT NULL,
  `TANGGAL` timestamp NOT NULL DEFAULT current_timestamp(),
  `ID_JENIS` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`ID_BARANG`, `NAMA_BARANG`, `KONDISI_BARANG`, `KETERANGAN_BARANG`, `JUMLAH_BARANG`, `TANGGAL`, `ID_JENIS`) VALUES
(111, 'Bodrek', 'baru', 'obat batuk, pilek dan pusing', 100, '2020-12-31 04:32:35', 1111),
(112, 'Dekolgen', 'baru', 'obat batuk,pilek dan demam', 200, '2020-12-31 04:37:29', 1112),
(113, 'Salonpas', 'baru', 'salonpas untuk pegal pegal', 200, '2020-12-31 04:45:38', 1113);

-- --------------------------------------------------------

--
-- Table structure for table `jenis_barang`
--

CREATE TABLE `jenis_barang` (
  `ID_JENIS` int(20) NOT NULL,
  `NAMA_JENIS` varchar(255) DEFAULT NULL,
  `KETERANGAN_JENIS` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `jenis_barang`
--

INSERT INTO `jenis_barang` (`ID_JENIS`, `NAMA_JENIS`, `KETERANGAN_JENIS`) VALUES
(1111, 'tablet', 'jenis obat untuk batuk pilek dan pusing'),
(1112, 'tablet', 'obat untuk batuk pilek dan demam'),
(1113, 'salep', 'obat untuk pegal-pegal');

-- --------------------------------------------------------

--
-- Table structure for table `petugas`
--

CREATE TABLE `petugas` (
  `ID_PETUGAS` int(20) NOT NULL,
  `USERNAME` varchar(255) DEFAULT NULL,
  `PASSWORD` varchar(255) DEFAULT NULL,
  `NAMA_PETUGAS` varchar(255) DEFAULT NULL,
  `LEVEL` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `petugas`
--

INSERT INTO `petugas` (`ID_PETUGAS`, `USERNAME`, `PASSWORD`, `NAMA_PETUGAS`, `LEVEL`) VALUES
(121, 'elang', 'elangg', 'elang wicaksono', '1'),
(122, 'adit', 'aditt', 'aditya putra', '1'),
(123, 'fresya', 'fresyaa', 'fresya candra', '1');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `ID_TRANSAKSI` int(20) NOT NULL,
  `TANGGAL_TRANSAKSI` timestamp NULL DEFAULT current_timestamp(),
  `STATUS_TRANSAKSI` tinyint(4) DEFAULT 1,
  `ID_BARANG` int(20) NOT NULL,
  `JUMLAH_SELURUH` int(50) DEFAULT NULL,
  `ID_PETUGAS` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`ID_TRANSAKSI`, `TANGGAL_TRANSAKSI`, `STATUS_TRANSAKSI`, `ID_BARANG`, `JUMLAH_SELURUH`, `ID_PETUGAS`) VALUES
(1221, '2020-12-31 04:36:24', 1, 111, 50, 121),
(1222, '2020-12-31 04:40:09', 1, 112, 50, 122),
(1223, '2020-12-31 04:47:45', 1, 113, 70, 123);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`ID_BARANG`),
  ADD UNIQUE KEY `ID_JENIS` (`ID_JENIS`);

--
-- Indexes for table `jenis_barang`
--
ALTER TABLE `jenis_barang`
  ADD PRIMARY KEY (`ID_JENIS`);

--
-- Indexes for table `petugas`
--
ALTER TABLE `petugas`
  ADD PRIMARY KEY (`ID_PETUGAS`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`ID_TRANSAKSI`),
  ADD KEY `ID_BARANG` (`ID_BARANG`),
  ADD KEY `ID_PETUGAS` (`ID_PETUGAS`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `barang`
--
ALTER TABLE `barang`
  MODIFY `ID_BARANG` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=114;

--
-- AUTO_INCREMENT for table `jenis_barang`
--
ALTER TABLE `jenis_barang`
  MODIFY `ID_JENIS` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1114;

--
-- AUTO_INCREMENT for table `petugas`
--
ALTER TABLE `petugas`
  MODIFY `ID_PETUGAS` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=124;

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `ID_TRANSAKSI` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1224;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `jenis_barang`
--
ALTER TABLE `jenis_barang`
  ADD CONSTRAINT `jenis_barang_ibfk_1` FOREIGN KEY (`ID_JENIS`) REFERENCES `barang` (`ID_JENIS`);

--
-- Constraints for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`ID_BARANG`) REFERENCES `barang` (`ID_BARANG`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `transaksi_ibfk_2` FOREIGN KEY (`ID_PETUGAS`) REFERENCES `petugas` (`ID_PETUGAS`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
