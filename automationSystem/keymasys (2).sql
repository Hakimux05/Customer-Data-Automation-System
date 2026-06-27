-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 13, 2025 at 07:49 AM
-- Server version: 8.0.30
-- PHP Version: 8.3.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `keymasys`
--

-- --------------------------------------------------------

--
-- Table structure for table `audit_logs`
--

CREATE TABLE `audit_logs` (
  `id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `description` text,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contact_messages`
--

CREATE TABLE `contact_messages` (
  `id` int NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `message` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contact_messages`
--

INSERT INTO `contact_messages` (`id`, `name`, `email`, `message`) VALUES
(1, 'Danish Hakim', 'myhakimeez@gmail.com', 'testing');

-- --------------------------------------------------------

--
-- Table structure for table `keys_table`
--

CREATE TABLE `keys_table` (
  `id` int NOT NULL,
  `bangunan` varchar(100) DEFAULT NULL,
  `jabatan` varchar(100) DEFAULT NULL,
  `bilik` varchar(100) DEFAULT NULL,
  `kod` varchar(50) DEFAULT NULL,
  `bilangan_kunci` int DEFAULT NULL,
  `pegawai` varchar(100) DEFAULT NULL,
  `pegawai_img` varchar(255) DEFAULT NULL,
  `image_path` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `keys_table`
--

INSERT INTO `keys_table` (`id`, `bangunan`, `jabatan`, `bilik`, `kod`, `bilangan_kunci`, `pegawai`, `pegawai_img`, `image_path`) VALUES
(1, 'INDUK', 'UNIT PENTADBIRAN', 'PINTU UTAMA', 'A1-S01-D1', 0, 'Ts. Nadzri bin Che Kamis', '1759862485_a37c7c9f1aed83a1824b.jpg', 'uploads/keys/1758708211_f1a63e9d0617197f3524.jpg'),
(2, 'INDUK', 'UNIT PENTADBIRAN', 'PINTU UTAMA', 'A1-S01-D2', 1, 'Rosnani binti Dollah', '1759862505_f011f12263484cdabc4e.jpg', NULL),
(3, 'INDUK', 'UNIT PENTADBIRAN', 'PINTU UTAMA', 'A1-S01-D3', 1, 'Suraya binti Nizar', '1759862638_16205fb1b5bdf53c5804.jpeg', NULL),
(4, 'INDUK', 'UNIT PENTADBIRAN', 'PINTU UTAMA', 'A1-S01-D4', 0, 'Maznah binti Hamat', '1759862755_83a2ddb5672376295e1f.jpg', NULL),
(5, 'INDUK', 'UNIT PENTADBIRAN', 'PINTU UTAMA', 'A1-S01-D5', 0, 'Siti Norhidayu binti Mohd Derus@Nordin', '1759862796_239b83eb0b25166d170e.jpg', NULL),
(6, 'INDUK', 'UNIT PENTADBIRAN', 'PINTU UTAMA', 'A1-S01-D6', 1, 'Sabariah binti Hashim', '1759862816_144de1445109f6536843.jpg', NULL),
(7, 'INDUK', 'UNIT PENTADBIRAN', 'PENGARAH', 'A1-S02-D1', 1, 'Ts. Nadzri bin Che Kamis', '1759862846_c271ff2354e79051150b.jpg', NULL),
(8, 'INDUK', 'UNIT PENTADBIRAN', 'PENGARAH', 'A1-S02-D2', 1, 'Siti Norhidayu binti Mohd Derus@Nordin', '1759862928_dca8c5a584198dee1dbc.jpg', NULL),
(9, 'INDUK', 'UNIT PENTADBIRAN', 'TIMBALAN PENGARAH AKADEMIK', 'A1-S03-D1', 1, 'Haziman bin Madiah', '1759862953_2ae74aee79261d10be7f.png', NULL),
(10, 'INDUK', 'UNIT PENTADBIRAN', 'TIMBALAN PENGARAH SOKONGAN AKADEMIK', 'A1-S03-D2', 0, 'Zunaidi bin Abdullah', '1759862975_89b2d11debfc833c2a90.jpg', NULL),
(11, 'INDUK', 'UNIT PENTADBIRAN', 'PEMBANTU KHAS', 'A1-S04', 1, 'Siti Norhidayu binti Mohd Derus@Nordin', '1758706817_1758706817_fa30f37d57db6d23571b.jpg', NULL),
(12, 'INDUK', 'UNIT PENTADBIRAN', 'PEGAWAI EKSEKUTIF KANAN', 'A1-S05', 0, 'Rosnani binti Dollah', '1759863000_89b452a6ef88e8922926.jpg', NULL),
(13, 'INDUK', 'UNIT PENTADBIRAN', 'FAIL', 'A1-S06', 1, 'Sabariah binti Hashim', '1759863039_ffd5b889798c2df4b2b8.jpg', NULL),
(15, 'JKE', 'UNIT KEUSAHAWANAN', 'PINTU UTAMA', 'O2-S08-D1', 1, 'Rasmaliza binti Rashid', '1759862232_8ee41fe64bf52ebf469d.jpg', NULL),
(16, 'JKE', 'UNIT KEUSAHAWANAN', 'PINTU UTAMA', 'O2-S08-D2', 1, 'Intan Izyan binti Roslan', '1759862312_9a1e23663660b0c6628c.jpg', NULL),
(17, 'JKE', 'UNIT KEUSAHAWANAN', 'PINTU UTAMA', 'O2-S08-D3', 1, 'Aida Fazlin binti Hisham', '1759862400_bdc9868af7b92875f5d2.jpg', NULL),
(18, 'JKE', 'UNIT KEUSAHAWANAN', 'PINTU TEPI', 'O2-S09', 1, 'Rasmaliza binti Rashid', '1758632442_1758632442_dbda7fc2425b4fc1f052.jpg', NULL),
(19, 'JKE', 'UNIT KEUSAHAWANAN', 'PINTU BELAKANG', 'O2-S10', 1, 'Rasmaliza binti Rashid', '1758632294_1758632294_0e7e7a2d010fa54da131.jpg', NULL),
(20, 'INDUK', 'UNIT SISTEM MAKLUMAT', 'PINTU UTAMA', 'C1-U01-D1', 1, 'NORITA BINTI ALI', '1759903887_a28b8bc28705b38348c9.jpg', NULL),
(21, 'INDUK', 'UNIT SISTEM MAKLUMAT', 'PINTU UTAMA', 'C1-U01-D2', 1, 'SITI RUHANI BINTI SIDIK', '1759903907_1ee2e618e7f34d30fe18.jpg', NULL),
(22, 'INDUK', 'UNIT SISTEM MAKLUMAT', 'PINTU UTAMA', 'C1-U01-D3', 1, 'MOHD ASWADI BIN AWANG', '1759904070_0e87a472a7ca3f12b616.jpg', NULL),
(23, 'INDUK', 'UNIT SISTEM MAKLUMAT', 'PINTU UTAMA', 'C1-U01-D4', 1, 'MOHD AZRI BIN SULONG', '1759904088_c32dfcd41c6ff00fce45.jpg', NULL),
(24, 'INDUK', 'UNIT SISTEM MAKLUMAT', 'PINTU UTAMA', 'C1-U01-D5', 1, 'KHAIRUL AIZAM BIN MOHAMMAD @ HUSSIN', '1759904218_8ebc192b3d216d3d5468.jpg', NULL),
(25, 'INDUK', 'UNIT SISTEM MAKLUMAT', 'PINTU UTAMA', 'C1-U01-D6', 1, 'ROHANITA BINTI AYAT', '1759904273_c1ab532d5da3ecd63223.jpg', NULL),
(26, 'INDUK', 'UNIT SISTEM MAKLUMAT', 'PINTU BELAKANG', 'C1-U02-D1', 1, 'NORITA BINTI ALI', '1759926730_9f48129945550eb6cb13.jpg', NULL),
(27, 'INDUK', 'UNIT SISTEM MAKLUMAT', 'PINTU BELAKANG', 'C1-U02-D2', 1, 'SITI RUHANI BINTI SIDIK', '1759926750_1b4522eeb5ba2e7853f0.jpg', NULL),
(28, 'INDUK', 'UNIT SISTEM MAKLUMAT', 'PINTU BELAKANG', 'C1-U02-D3', 1, 'MOHD ASWADI BIN AWANG', '1759926770_00c763ad6cf9cdec323f.jpg', NULL),
(29, 'INDUK', 'UNIT SISTEM MAKLUMAT', 'PINTU BELAKANG', 'C1-U02-D4', 1, 'MOHD AZRI BIN SULONG', '1759926824_0ac4d79bc8c8501367de.jpg', NULL),
(30, 'INDUK', 'UNIT SISTEM MAKLUMAT', 'PINTU BELAKANG', 'C1-U02-D5', 1, 'KHAIRUL AIZAM BIN MOHAMMAD @ HUSSIN', '1759926852_ac0b719f62efaa5cd3c9.jpg', NULL),
(31, 'INDUK', 'UNIT SISTEM MAKLUMAT', 'PINTU BELAKANG', 'C1-U02-D6', 1, 'ROHANITA BINTI AYAT', '1759926871_b87119b64256bd3b14f0.jpg', NULL),
(32, 'INDUK', 'UNIT SISTEM MAKLUMAT', 'BILIK SERVER', 'C1-U03-K1', 1, 'SITI RUHANI BINTI SIDEK', '1759926892_986944333d89075d4091.jpg', NULL),
(33, 'INDUK', 'PERPUSTAKAAN', 'PINTU UTAMA', 'D1-P01-D1', 1, 'FARAH IZZATI BINTI ISMAIL', '1759927266_a8eca23acae19ffee7df.jpg', NULL),
(34, 'INDUK', 'PERPUSTAKAAN', 'PINTU UTAMA', 'D1-P01-D2', 1, 'ZAINUN BINTI MUSA', '1759927299_70e4433dbef5d5f4e1c6.jpg', NULL),
(35, 'INDUK', 'PERPUSTAKAAN', 'PINTU UTAMA', 'D1-P01-D3', 1, 'NORAMIZAA BINTI MOHAMMAD', '1759927317_b6582d98ed2b63cd44bb.jpg', NULL),
(36, 'INDUK', 'PERPUSTAKAAN', 'PINTU UTAMA', 'D1-P01-D4', 1, 'RUZAIMAH BINTI SAPUAN', '1759927346_da2ccd888d381c62a003.jpg', NULL),
(37, 'INDUK', 'PERPUSTAKAAN', 'PINTU UTAMA', 'D1-P01-D5', 1, 'MADIANA BINTI RAZALI', '1759927367_07e9184b7e38d6f724a2.jpg', NULL),
(38, 'INDUK', 'PERPUSTAKAAN', 'PINTU ALTERNATIF(KAYU)', 'D1-P01-K1', 1, 'MADIANA BINTI RAZALI', '1759927386_e7d8a483c6647a6256d2.jpg', NULL),
(39, 'INDUK', 'UNIT PERHUBUNGAN DAN LATIHAN INDUSTRI', 'PINTU UTAMA', 'E1-LI01-D1', 1, 'NOR NAZRAH BINTI ALI', '1759927429_641ce3e36ab32979f371.jpg', NULL),
(40, 'INDUK', 'UNIT PERHUBUNGAN DAN LATIHAN INDUSTRI', 'PINTU UTAMA', 'E1-LI01-D2', 1, 'NOR HAFIZAH BINTI MOHAMMAD', '1759927453_6fa24591c79c25dc0e11.jpg', NULL),
(41, 'INDUK', 'UNIT PERHUBUNGAN DAN LATIHAN INDUSTRI', 'PINTU UTAMA', 'E1-LI01-D3', 1, 'WAN MOHD BADRIL AMIN BIN WAN SAID', '1759927472_861bcb2b36c7c582ace8.jpg', NULL),
(42, 'INDUK', 'JABATAN HAL EHWAL & PEMBANGUNAN PELAJAR', 'PINTU UTAMA', 'F1-H01-D1', 1, 'MOHD ZAILANI BIN SULONG', '1759927497_abfbf2e74f57e16ade65.jpg', NULL),
(43, 'INDUK', 'JABATAN HAL EHWAL & PEMBANGUNAN PELAJAR', 'PINTU UTAMA', 'F1-H01-D2', 1, 'NORHAYATI BINTI ISMAIL', '1758706780_1758706780_1ee497de79fc4b66a96e.jpg', NULL),
(44, 'INDUK', 'JABATAN HAL EHWAL & PEMBANGUNAN PELAJAR', 'PINTU UTAMA', 'F1-H01-D3', 1, 'NUR AIMI BINTI A.RAHMAN', '1759927530_8743b87589a3736073f9.jpg', NULL),
(45, 'INDUK', 'JABATAN HAL EHWAL & PEMBANGUNAN PELAJAR', 'PINTU UTAMA', 'F1-H01-D4', 1, 'MOHD YUZI BIN YUSOF', '1759927559_2f740dc2793a07324336.jpg', NULL),
(46, 'INDUK', 'JABATAN HAL EHWAL & PEMBANGUNAN PELAJAR', 'PINTU UTAMA', 'F1-H01-D5', 1, 'MOHD FATHI BIN OMAR', '1759927590_0ffe0b7256eac9be8d80.jpg', NULL),
(47, 'INDUK', 'JABATAN HAL EHWAL & PEMBANGUNAN PELAJAR', 'PINTU UTAMA', 'F1-H01-D6', 1, 'MAHAYU BINTI ALI', '1759927609_2d5a040a850b7fe77ed3.jpg', NULL),
(48, 'INDUK', 'JABATAN HAL EHWAL & PEMBANGUNAN PELAJAR', 'PINTU UTAMA', 'F1-H01-D7', 1, 'NURUL SYUHADA BT ROSLAN', '1759927631_c31cefc786c49acfecbe.jpg', NULL),
(49, 'JPA', 'UNIT UPPSI', 'PINTU UTAMA', 'N3-UPP01-D1', 1, 'ROZILAH BINTI JAAFAR', '1757492590_RozilahbintiJaafar.JPG', NULL),
(50, 'JPA', 'UNIT UPPSI', 'PINTU UTAMA', 'N3-UPP01-D2', 1, 'SITI SALWANI BINTI MAMAT', '1757492218_Siti_Salwani_binti_Mamat.JPG', NULL),
(51, 'JPA', 'UNIT UPPSI', 'PINTU UTAMA', 'N3-UPP01-D3', 1, 'FAIZAH BINTI MAT ZAIN', '1757494082_FaizahbintiMatZin.JPG', NULL),
(52, 'JPA', 'UNIT UPPSI', 'PINTU UTAMA', 'N3-UPP01-D4', 1, 'PELAJAR PRAKTIKUM', NULL, NULL),
(53, 'JPA', 'UNIT UPPSI', 'BILIK PRS', 'N3-UPP04-K1', 1, 'SITI SALWANI BINTI MAMAT', '1757492235_Siti_Salwani_binti_Mamat.JPG', NULL),
(54, 'JPA', 'JABATAN PENGAJIAN AM', 'PINTU UTAMA', 'N3-PAM01-D1', 1, 'MOHD ZUKY BIN HANAFY', '1757493436_MohdZukybinHanafi.JPG', NULL),
(55, 'JPA', 'JABATAN PENGAJIAN AM', 'PINTU UTAMA', 'N3-PAM01-D2', 1, 'ZAINUN BINTI SALLEH', '1757426617_Zainun_binti_Salleh.JPG', NULL),
(56, 'JPA', 'JABATAN PENGAJIAN AM', 'PINTU UTAMA', 'N3-PAM01-D3', 1, 'AIDA FAZLIN BINTI HISHAM @ HASSAN', '1757494141_AidaFazlinbintiHishamHassan.JPG', NULL),
(57, 'JPA', 'JABATAN PENGAJIAN AM', 'PINTU UTAMA', 'N3-PAM01-D4', 1, 'WATI BINTI MOHAMAD', '1757489966_Wati_Binti_Mohamad.JPG', NULL),
(58, 'JPA', 'JABATAN PENGAJIAN AM', 'PINTU UTAMA', 'N3-PAM01-D5', 1, 'NORKATYNIY BINTI ISMAIL', '1757493018_NorkatyniybintiIsmail.JPG', NULL),
(59, 'JPA', 'JABATAN PENGAJIAN AM', 'PINTU UTAMA', 'N3-PAM01-D6', 1, 'WAN NORLAILI BINTI WAN ABDUL MANAN', '1757491852_WanNorlailibintiWanAbdulManan.JPG', NULL),
(60, 'JPA', 'JABATAN PENGAJIAN AM', 'PINTU UTAMA', 'N3-PAM01-D7', 1, 'SALMI BINTI MOHD', '1757492420_Salmi_binti_Mohd.JPG', NULL),
(61, 'JPA', 'JABATAN PENGAJIAN AM', 'PINTU UTAMA', 'N3-PAM01-D8', 1, 'ROSMALINI BINTI KUNING', '1757492727_RosmalinibintiKuning.JPG', NULL),
(62, 'JTMK', 'UNIT R&D', 'PINTU UTAMA', 'M4-K01', 1, 'Maisatul', NULL, NULL),
(63, 'JTMK', 'BILIK PENSYARAH', 'PINTU UTAMA', 'M4-K02', 1, 'HAZIMAN BIN MADIAH', '1759927931_37bb58b3e01dd4cabab0.png', NULL),
(90, 'SERBAGUNA', 'BILIK SEMINAR', 'PINTU UTAMA', 'L5-S01-K1', 1, NULL, NULL, NULL),
(96, 'JKE', 'BILIK PENSYARAH', 'PINTU UTAMA', 'O2-S02-D01', NULL, 'A', NULL, NULL),
(97, 'JKE', 'BILIK PENSYARAH', 'PINTU UTAMA', 'O2-S02-D02', NULL, 'B', NULL, NULL),
(98, 'JKE', 'BILIK PENSYARAH', 'PINTU UTAMA', 'O2-S02-D03', NULL, 'C', NULL, NULL),
(99, 'JKE', 'BILIK PENSYARAH', 'PINTU UTAMA', 'O2-S02-D04', NULL, 'D', NULL, NULL),
(100, 'JKE', 'BILIK PENSYARAH', 'PINTU UTAMA', 'O2-S02-D05', NULL, 'E', NULL, NULL),
(101, 'INDUK', 'UNIT LATIHAN & PENDIDIKAN LANJUTAN', 'PINTU UTAMA', 'G1-S02-D01', NULL, 'A', NULL, NULL),
(102, 'INDUK', 'UNIT E-PEMBELAJARAN & MULTIMEDIA', 'PINTU UTAMA', 'H1-S02-D01', NULL, 'A', NULL, NULL),
(103, 'INDUK', 'UNIT PEMBANGUNAN & SELENGGARAAN', 'PINTU UTAMA', 'I1-S02-D01', NULL, 'A', NULL, NULL),
(104, 'INDUK', 'JABATAN SUKAN, KEBUDAYAAN & KOKURIKULUM', 'PINTU UTAMA', 'J1-S02-D01', NULL, 'A', NULL, NULL),
(111, 'JTMK', 'UNIT R&D', 'PINTU UTAMA', 'M4-K03', 1, 'A', NULL, NULL),
(112, 'JTMK', 'UNIT R&D', 'PINTU UTAMA', 'M4-K04', 1, 'B', NULL, NULL),
(113, 'JTMK', 'UNIT R&D', 'PINTU UTAMA', 'M4-K05', 1, 'C', NULL, NULL),
(114, 'JTMK', 'UNIT R&D', 'PINTU UTAMA', 'M4-K06', 1, 'D', NULL, NULL),
(115, 'JTMK', 'UNIT R&D', 'PINTU UTAMA', 'M4-K07', 1, 'E', NULL, NULL),
(116, 'JTMK', 'UNIT R&D', 'PINTU UTAMA', 'M4-K08', 1, 'F', NULL, NULL),
(117, 'INDUK', 'UNIT PEPERIKSAAN', 'PINTU UTAMA', 'H1-K02', 1, 'A', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `key_images`
--

CREATE TABLE `key_images` (
  `id` int NOT NULL,
  `key_code` varchar(50) NOT NULL,
  `image_path` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `requests_table`
--

CREATE TABLE `requests_table` (
  `id` int NOT NULL,
  `staff_name` varchar(100) DEFAULT NULL,
  `bilangan_kunci` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `key_code` varchar(50) DEFAULT NULL,
  `purpose` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `pick_date` date DEFAULT NULL,
  `status` enum('Pending','Approved','Rejected') DEFAULT 'Pending',
  `request_date` datetime DEFAULT NULL,
  `approved_by` int DEFAULT NULL,
  `hold_days` int DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `requests_table`
--

INSERT INTO `requests_table` (`id`, `staff_name`, `bilangan_kunci`, `key_code`, `purpose`, `pick_date`, `status`, `request_date`, `approved_by`, `hold_days`) VALUES
(23, 'Zunaidi bin Abdullah', '1', 'M01-S03-D2', 'pinjam', '2025-09-27', 'Approved', '2025-09-09 16:14:40', 9, 0),
(33, 'Rosnani binti Dollah', '1', 'M01-S01-D4', 'pinjam', '2025-09-26', 'Approved', '2025-09-24 00:46:10', 9, 3),
(35, 'Ts. Nadzri bin Che Kamis', '1', 'M01-S01-D1', 'pinjam', '2025-09-25', 'Approved', '2025-09-24 01:32:00', 9, 2),
(36, 'Siti Norhidayu binti Mohd Derus@Nordin', '1', 'M01-S01-D5', 'pinjam', '2025-09-25', 'Approved', '2025-09-24 10:24:06', NULL, 3),
(37, 'Rosnani binti Dollah', '1', 'A1-S05', 'event', '2025-10-12', 'Rejected', '2025-10-12 18:01:38', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `name` text,
  `password` varchar(255) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `role` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `password`, `email`, `phone`, `role`) VALUES
(6, 'Danish Hakim', '$2y$10$YnvQw.8Ltqq/RgQk4d7lDudK.20SZSeNNp.oNF8FTqKOkvoUmDj3.', 'myhakimeez@gmail.com', '0179169308', 'oi'),
(7, 'Alif Husaini', '$2y$10$/DjP5KMxwnCKSmVS7UrwOOcjqpl/LszpsaMVIufmmB6wG5v8.fZVG', 'alif@gmail.com', '0123456789', 'so'),
(8, 'Ali', '$2y$10$iWi2TY3HWy8gg0vuRK28J.d1gUtHQH.BCzvQzS/UwrofRMz9Sm3Eq', 'ali@gmail.com', '0123456789', 'oi'),
(9, 'Abu', '$2y$10$EBwprGYug2uXtrPg7mywk.f5/RxTWhFdGGBr79CU0HlcA7BzUSw9.', 'abu@gmail.com', '0123456789', 'so'),
(18, 'husin', '$2y$10$df0CmJ3GfNpzGp6Gc5uwqe5zQvBEapMv0tXt3NGYhH06IpyHo.5DC', 'husin@gmail.com', '888', 'so'),
(20, 'Danish Hakim', '$2y$10$CzM9jAz2eOLZKpoTPOxAkeJuoP4/IKwbCcCVtkNYWvk38AyE./cVm', 'danishhakimpauzi59@gmail.com', '777', 'oi'),
(27, 'Ahmad Alif Husaini bin Ahmad Rafzi', '$2y$10$ViKiySSYG/Gbe7nXcCcpguGdsQCph0HlJjKJLOME7Cse8jW2EyN0e', 'alifhusaini998@gmail.com', '', 'so');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `audit_logs`
--
ALTER TABLE `audit_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact_messages`
--
ALTER TABLE `contact_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `keys_table`
--
ALTER TABLE `keys_table`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kod` (`kod`);

--
-- Indexes for table `key_images`
--
ALTER TABLE `key_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `key_code` (`key_code`);

--
-- Indexes for table `requests_table`
--
ALTER TABLE `requests_table`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `audit_logs`
--
ALTER TABLE `audit_logs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contact_messages`
--
ALTER TABLE `contact_messages`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `keys_table`
--
ALTER TABLE `keys_table`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=118;

--
-- AUTO_INCREMENT for table `key_images`
--
ALTER TABLE `key_images`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `requests_table`
--
ALTER TABLE `requests_table`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `key_images`
--
ALTER TABLE `key_images`
  ADD CONSTRAINT `key_images_ibfk_1` FOREIGN KEY (`key_code`) REFERENCES `keys_table` (`kod`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
