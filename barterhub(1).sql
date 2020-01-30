-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 12, 2019 at 03:33 PM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `barterhub`
--

-- --------------------------------------------------------

--
-- Table structure for table `listitem`
--

CREATE TABLE `listitem` (
  `id` int(10) NOT NULL,
  `namaItem` varchar(30) DEFAULT NULL,
  `namaPenjual` varchar(20) DEFAULT NULL,
  `lokasiGambar` varchar(30) DEFAULT NULL,
  `deskripsiSingkat` varchar(30) DEFAULT NULL,
  `statusPublish` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `listitem`
--

INSERT INTO `listitem` (`id`, `namaItem`, `namaPenjual`, `lokasiGambar`, `deskripsiSingkat`, `statusPublish`) VALUES
(1, 'Cybernetic Synchro Fiber', 'Florensea', '1.jpg', 'Untuk Cybernetic', 'approve'),
(2, 'Synchro Fiber', 'Florensea', '2.jpg', 'Untuk Zenith', 'approve'),
(3, 'Reanimator', 'Florensea', '3.jpg', 'Untuk Material', 'approve'),
(4, 'Stregalia', 'longiflorum', '3.jpg', 'Nothing in Particular', 'approve'),
(5, 'Strixa', 'longiflorum', '3.jpg', 'Nothing in Particular', 'approve'),
(6, 'Stella-prima', 'longiflorum', '3.jpg', 'album baru kano', 'approve'),
(9, 'Kompas', 'longiflorum', '3.jpg', 'Nego', 'approve'),
(11, 'SSD', 'longiflorum', '3.jpg', 'dari rz komputer', 'approve'),
(12, 'PC', 'longiflorum', '3.jpg', 'PC apaalh', 'approve'),
(13, 'Mi Band', 'longiflorum', '3.jpg', 'Mi Band bogor', 'approve');

-- --------------------------------------------------------

--
-- Table structure for table `tb_user`
--

CREATE TABLE `tb_user` (
  `id` varchar(20) NOT NULL,
  `password` varchar(32) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `role` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_user`
--

INSERT INTO `tb_user` (`id`, `password`, `email`, `nama`, `role`) VALUES
('adm33n', '0192023a7bbd73250516f069df18b500', 'email@barterhub.id', 'Crusch Kaarsten', 'admin'),
('ameameagari', '5f4dcc3b5aa765d61d8327deb882cf99', 'ameli@barterhub.com', 'Ameli', 'user'),
('awdpkosm', 'woidsavkdwa', 'pawdaw@c.c', 'Ajwda', 'user'),
('floem', '', 'rezapahlawan@gmail.com', 'S', 'user'),
('floemizu', '', 'a@email.com', 'Violet EX', 'user'),
('Florensea', '5f416e549241a840733db9f960a9e8cf', 'violet@union.closers', 'Violet', 'user'),
('ixfloma', 'password', 'aa@string.c', 'Flovio', 'user'),
('koyumearts', '5f4dcc3b5aa765d61d8327deb882cf99', 'koyumeart@mangahouse.jp', 'Koyume', 'user'),
('longiflorum', '5f4dcc3b5aa765d61d8327deb882cf99', 'julisalexia@asterisk.sch.ast', 'Easter Lily', 'user'),
('null', 'null', 'florensea@merahputih.id', 'Violet', 'user'),
('pahla', 'password', 'awdwa@aaa.c', 'awdnjwda', 'user'),
('userb', '827ccb0eea8a706c4c34a16891f84e7b', 'email@a.c', 'nama', 'user'),
('usz', '81dc9bdb52d04dc20036dbd8313ed055', 'aw@ca.c', 'kawd', 'user'),
('vioviocute', 'hydehide', 'viobigsword@wolfdog.cls', 'Fuyulens', 'user');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `listitem`
--
ALTER TABLE `listitem`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `listitem`
--
ALTER TABLE `listitem`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
