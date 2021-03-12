-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 12, 2021 at 06:49 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.2.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `plugin`
--

-- --------------------------------------------------------

--
-- Table structure for table `buku`
--

CREATE TABLE `buku` (
  `id` int(5) NOT NULL,
  `judul` varchar(100) NOT NULL,
  `pengarang` varchar(100) NOT NULL,
  `penerbit` varchar(100) NOT NULL,
  `jenis_buku` enum('Novel','Komik','Pelajaran','Hobi') NOT NULL,
  `pendonasi` int(5) NOT NULL,
  `reg_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `buku`
--

INSERT INTO `buku` (`id`, `judul`, `pengarang`, `penerbit`, `jenis_buku`, `pendonasi`, `reg_date`) VALUES
(20, 'HUJAN', 'Tere Liye', 'Gramedia', 'Novel', 2, '2021-03-12 16:54:20'),
(21, 'BUMI', 'Tere Liye', 'Gramedia', 'Novel', 1, '2021-03-12 16:51:50'),
(22, 'NGOPI, YUK!', 'Assyifa S', 'Bukune', 'Komik', 2, '2021-03-12 16:53:58'),
(23, 'SI JUKI CARI KERJA', 'FAZA M', 'BUKUNE', 'Komik', 4, '2021-03-12 17:08:26'),
(24, 'KREASI MERAJUT', 'NURCHASANAH', 'siapa saja', 'Hobi', 1, '2021-03-12 17:15:30'),
(25, 'BUNGA felt', ' lisa tiyani', 'siapa saja', 'Hobi', 1, '2021-03-12 17:13:11'),
(26, 'KREASI BENTO', 'VANNY MEDIANA', ' siapa saja', 'Hobi', 1, '2021-03-12 17:14:05');

-- --------------------------------------------------------

--
-- Table structure for table `daftar_peminjam`
--

CREATE TABLE `daftar_peminjam` (
  `no` int(5) NOT NULL,
  `id_member` int(5) NOT NULL,
  `id_buku` int(5) NOT NULL,
  `reg_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `daftar_peminjam`
--

INSERT INTO `daftar_peminjam` (`no`, `id_member`, `id_buku`, `reg_date`) VALUES
(1, 2, 20, '2021-03-12 16:55:59'),
(2, 2, 22, '2021-03-12 16:55:59');

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE `member` (
  `id` int(5) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `jenis_kelamin` enum('L','P') NOT NULL,
  `status` enum('Pelajar','Mahasiswa','Masyarakat') NOT NULL,
  `no_telp` varchar(14) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `reg_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`id`, `nama`, `jenis_kelamin`, `status`, `no_telp`, `alamat`, `reg_date`) VALUES
(1, 'ammy', 'P', 'Pelajar', '089', 'desa', '2021-03-03 18:36:09'),
(2, 'aul', 'P', 'Pelajar', '081', '..', '2021-03-05 13:07:11'),
(3, 'aulia', 'P', 'Masyarakat', '085', '..', '2021-03-12 17:07:33'),
(4, 'aa', 'L', 'Mahasiswa', '084', 'rr', '2021-03-05 13:28:26');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_donasi` (`pendonasi`);

--
-- Indexes for table `daftar_peminjam`
--
ALTER TABLE `daftar_peminjam`
  ADD PRIMARY KEY (`no`),
  ADD KEY `fk_pinjam` (`id_member`),
  ADD KEY `fk_pinjam_buku` (`id_buku`);

--
-- Indexes for table `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `buku`
--
ALTER TABLE `buku`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `daftar_peminjam`
--
ALTER TABLE `daftar_peminjam`
  MODIFY `no` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `member`
--
ALTER TABLE `member`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `buku`
--
ALTER TABLE `buku`
  ADD CONSTRAINT `fk_donasi` FOREIGN KEY (`pendonasi`) REFERENCES `member` (`id`);

--
-- Constraints for table `daftar_peminjam`
--
ALTER TABLE `daftar_peminjam`
  ADD CONSTRAINT `fk_pinjam` FOREIGN KEY (`id_member`) REFERENCES `member` (`id`),
  ADD CONSTRAINT `fk_pinjam_buku` FOREIGN KEY (`id_buku`) REFERENCES `buku` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
