-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 11, 2026 at 08:22 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.5.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbl_1_non_normalisasi`
--

-- --------------------------------------------------------

--
-- Table structure for table `non_normalisasi`
--

CREATE TABLE `non_normalisasi` (
  `ID_Transaksi` varchar(4) DEFAULT NULL,
  `ID_Pelanggan` varchar(5) DEFAULT NULL,
  `Nama_Pelanggan` varchar(17) DEFAULT NULL,
  `No_HP` bigint(12) DEFAULT NULL,
  `Email` varchar(27) DEFAULT NULL,
  `Alamat_Lengkap` varchar(43) DEFAULT NULL,
  `Kode_Barang` varchar(5) DEFAULT NULL,
  `Nama_Barang` varchar(29) DEFAULT NULL,
  `Kategori_Barang` varchar(23) DEFAULT NULL,
  `Harga_Sewa` varchar(24) DEFAULT NULL,
  `Kondisi_Barang_setelah dikembalikan` varchar(23) DEFAULT NULL,
  `Tanggal_Pinjam` varchar(10) DEFAULT NULL,
  `Tanggal_Kembali` varchar(10) DEFAULT NULL,
  `ID_Karyawan` varchar(5) DEFAULT NULL,
  `Nama_Karyawan` varchar(14) DEFAULT NULL,
  `Shift_Karyawan` varchar(4) DEFAULT NULL,
  `Metode_Bayar` varchar(8) DEFAULT NULL,
  `Status_Bayar` varchar(5) DEFAULT NULL,
  `Tanggal_Bayar` varchar(10) DEFAULT NULL,
  `Total_Bayar` int(6) DEFAULT NULL,
  `Denda` varchar(6) DEFAULT NULL,
  `Keterangan_Denda` varchar(22) DEFAULT NULL,
  `Keterlambatan_pembayaran` varchar(12) DEFAULT NULL,
  `Ulasan_Pelanggan` varchar(22) DEFAULT NULL,
  `Rating` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `non_normalisasi`
--

INSERT INTO `non_normalisasi` (`ID_Transaksi`, `ID_Pelanggan`, `Nama_Pelanggan`, `No_HP`, `Email`, `Alamat_Lengkap`, `Kode_Barang`, `Nama_Barang`, `Kategori_Barang`, `Harga_Sewa`, `Kondisi_Barang_setelah dikembalikan`, `Tanggal_Pinjam`, `Tanggal_Kembali`, `ID_Karyawan`, `Nama_Karyawan`, `Shift_Karyawan`, `Metode_Bayar`, `Status_Bayar`, `Tanggal_Bayar`, `Total_Bayar`, `Denda`, `Keterangan_Denda`, `Keterlambatan_pembayaran`, `Ulasan_Pelanggan`, `Rating`) VALUES
('T-1', 'P-001', 'Cristiano Ronaldo', 85217922655, 'cristiano.ronaldo@gmail.com', 'Jl. Mayjend Sungkono No.12, Surabaya', 'KB-1', 'Tenda Dome 4P, Matras Eiger', 'Tenda, Matras', '150.000 , 20.000', 'Baik, Baik', '01/06/2025', '03/06/2025', 'K-301', 'Dewi Marlina', 'Pagi', 'Transfer', 'Lunas', '01/06/2025', 170000, '-', '-', '-', 'Sangat puas', 5),
('T-2', 'P-002', 'Adidarma', 82234567890, 'agung.adidarma@gmail.com', 'Jl. Soekarno Hatta No.88, Lowokwaru, Malang', 'KB-2', 'Carrier Consina 60L', 'Carrier', '300000', 'Baik', '02/06/2025', '05/06/2025', 'K-302', 'Joko Supriyadi', 'Sore', 'Cash', 'Lunas', '06/06/2025', 350000, '50000', '-', 'telat 1 hari', 'Muat banyak tapi berat', 4),
('T-3', 'P-003', 'Jude Bellingham', 85331234567, 'jude.bellingham@gmail.com', 'Perumahan Puri Indah Blok B2 No.5, Sidoarjo', 'KB-3', 'Headlamp eiger, Trekking Pole', 'Headlamp, Trekking Pole', '200.000 , 50.000', 'Baik, Rusak', '03/06/2025', '04/06/2025', 'K-302', 'Joko Supriyadi', 'Sore', 'Transfer', 'Lunas', '04/06/2025', 350000, '100000', 'Trekking pole rusak', '-', '-', 2),
('T-4', 'P-004', 'Luka Modric', 87865432100, 'luka.modric@gmail.com', 'Jl. Hayam Wuruk No.40, Gadingrejo, Pasuruan', 'KB-4', 'Kompor Portable, Panci Set', 'Kompor, Peralatan Masak', '250.000 , 25.000', 'Baik, Baik', '04/06/2025', '07/06/2025', 'K-301', 'Dewi Marlina', 'Pagi', 'Cash', 'Lunas', '09/06/2025', 375000, '100000', '-', 'telat 2 hari', 'Kurang panas kompornya', 3),
('T-5', 'P-005', 'Novi Rahmawati', 87851244567, 'novi.rahmawati@gmail.com', 'Jl. Jaksa Agung Suprapto No.11, Lamongan', 'KB-5', 'Sleeping Bag Eiger', 'Sleeping Bag', '180000', 'Baik', '05/06/2025', '07/06/2025', 'K-301', 'Dewi Marlina', 'Pagi', 'Transfer', 'Lunas', '05/06/2025', 180000, '-', '-', '-', 'Hangat banget', 5),
('T-6', 'P-006', 'Andre Bauman', 82288445566, 'andre.bauman@gmail.com', 'Jl. Joyoboyo No.27, Mojoroto, Kediri', 'KB-6', 'Tenda Bivak, Cooking Set', 'Tenda, Peralatan Masak', '100.000 , 40.000', 'Baik, Baik', '06/06/2025', '08/06/2025', 'K-302', 'Joko Supriyadi', 'Sore', 'Transfer', 'Lunas', '06/06/2025', 140000, '-', '-', '-', 'Praktis dan ringan', 5),
('T-7', 'P-007', 'Adidarma', 82234567890, 'agung.adidarma@gmail.com', 'Jl. Soekarno Hatta No.88, Lowokwaru, Malang', 'KB-7', 'Jaket Gunung Arei', 'Jaket', '160000', 'Rusak', '06/06/2025', '07/06/2025', 'K-301', 'Dewi Marlina', 'Pagi', 'Transfer', 'Lunas', '06/06/2025', 360000, '200000', 'Jaket sobek', '-', 'kurang oke', 2),
('T-8', 'P-008', 'Kylian Mbappe', 81234567890, 'kylian.mbappe@gmail.com', 'Jl. Bhayangkara No.30, Sooko, Mojokerto', 'KB-8', 'Flysheet, Trekking Pole', 'Flysheet, Trekking Pole', '280.000 , 30.000', 'Baik, Baik', '07/06/2025', '10/06/2025', 'K-302', 'Joko Supriyadi', 'Sore', 'Cash', 'Lunas', '11/06/2025', 390000, '80000', '-', 'telat 1 hari', 'Flysheetnya oke', 4),
('T-9', 'P-009', 'Kevin De Bruyne', 89012345678, 'kevin.debruyne@gmail.com', 'Jl. Merdeka No.17, Sukorejo, Blitar', 'KB-9', 'Sleeping Bag Thermarest', 'Sleeping Bag', '200000', 'Rusak', '08/06/2025', '11/06/2025', 'K-301', 'Dewi Marlina', 'Pagi', 'Transfer', 'Lunas', '08/06/2025', 285000, '85000', 'Sleeping Bag berlubang', '-', 'kurang nyaman', 3),
('T-10', 'P-010', 'Luka Modric', 87865432100, 'luka.modric@gmail.com', 'Jl. Hayam Wuruk No.40, Gadingrejo, Pasuruan', 'KB-10', 'Lampu Tenda, Matras, Gas', 'Lampu, Matras, Gas', '50.000 , 20.000 , 20.000', 'Baik, Baik, baik sekali', '09/06/2025', '10/06/2025', 'K-302', 'Joko Supriyadi', 'Sore', 'Cash', 'Lunas', '12/06/2025', 150000, '60000', '-', 'telat 2 hari', 'Matras nyaman bree', 5);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
