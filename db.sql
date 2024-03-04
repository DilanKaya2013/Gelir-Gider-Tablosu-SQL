-- --------------------------------------------------------
-- Sunucu:                       127.0.0.1
-- Sunucu sürümü:                8.0.30 - MySQL Community Server - GPL
-- Sunucu İşletim Sistemi:       Win64
-- HeidiSQL Sürüm:               12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- futbol için veritabanı yapısı dökülüyor
DROP DATABASE IF EXISTS `futbol`;
CREATE DATABASE IF NOT EXISTS `futbol` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `futbol`;

-- tablo yapısı dökülüyor futbol.lig
DROP TABLE IF EXISTS `lig`;
CREATE TABLE IF NOT EXISTS `lig` (
  `id` int NOT NULL AUTO_INCREMENT,
  `lig_ad` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- futbol.lig: ~7 rows (yaklaşık) tablosu için veriler indiriliyor
INSERT INTO `lig` (`id`, `lig_ad`) VALUES
	(1, 'Süper Lig'),
	(2, 'Premier Lig'),
	(3, 'La Liga'),
	(4, 'Bundesliga'),
	(5, 'Serie A'),
	(6, 'Ligue 1'),
	(7, 'Eredivisie');

-- tablo yapısı dökülüyor futbol.mevki
DROP TABLE IF EXISTS `mevki`;
CREATE TABLE IF NOT EXISTS `mevki` (
  `id` int NOT NULL AUTO_INCREMENT,
  `mevki_ad` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- futbol.mevki: ~6 rows (yaklaşık) tablosu için veriler indiriliyor
INSERT INTO `mevki` (`id`, `mevki_ad`) VALUES
	(1, 'Kaleci'),
	(2, 'Defans'),
	(3, 'Orta Saha'),
	(4, 'Forvet'),
	(5, 'Kanat'),
	(6, 'Santrafor');

-- tablo yapısı dökülüyor futbol.oyuncu
DROP TABLE IF EXISTS `oyuncu`;
CREATE TABLE IF NOT EXISTS `oyuncu` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ad` varchar(30) NOT NULL,
  `soyad` varchar(30) NOT NULL,
  `dogum_tarihi` date NOT NULL,
  `takim_id` int NOT NULL,
  `mevki_id` int NOT NULL,
  `boy` double NOT NULL,
  `kilo` tinyint NOT NULL,
  `forma_no` tinyint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_oyuncu_takim` (`takim_id`),
  KEY `FK_oyuncu_mevki` (`mevki_id`),
  CONSTRAINT `FK_oyuncu_mevki` FOREIGN KEY (`mevki_id`) REFERENCES `mevki` (`id`),
  CONSTRAINT `FK_oyuncu_takim` FOREIGN KEY (`takim_id`) REFERENCES `takim` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- futbol.oyuncu: ~60 rows (yaklaşık) tablosu için veriler indiriliyor
INSERT INTO `oyuncu` (`id`, `ad`, `soyad`, `dogum_tarihi`, `takim_id`, `mevki_id`, `boy`, `kilo`, `forma_no`) VALUES
	(1, 'Emre', 'Belözoğlu', '1980-02-07', 3, 3, 1.7, 75, 5),
	(2, 'Burak', 'Yılmaz', '1985-07-15', 1, 6, 1.88, 83, 17),
	(3, 'Cenk', 'Tosun', '1991-06-07', 4, 4, 1.83, 78, 14),
	(4, 'Yusuf', 'Yazıcı', '1997-01-29', 2, 5, 1.83, 74, 18),
	(5, 'Hakan', 'Çalhanoğlu', '1994-02-08', 8, 3, 1.78, 72, 10),
	(6, 'Ozan', 'Tufan', '1995-03-23', 5, 3, 1.8, 76, 6),
	(7, 'Enes', 'Ünal', '1997-05-10', 6, 6, 1.87, 79, 9),
	(8, 'Mert', 'Günok', '1989-01-01', 7, 1, 1.91, 85, 1),
	(9, 'Cengiz', 'Ünder', '1997-07-14', 10, 5, 1.73, 67, 17),
	(10, 'Merih', 'Demiral', '1998-03-05', 4, 2, 1.92, 88, 28),
	(11, 'Okay', 'Yokuşlu', '1994-03-09', 5, 3, 1.85, 79, 5),
	(12, 'Umut', 'Meraş', '1996-07-20', 9, 2, 1.84, 77, 3),
	(13, 'Yunus', 'Malli', '1992-02-24', 6, 5, 1.78, 73, 11),
	(14, 'Dorukhan', 'Toköz', '1996-05-23', 1, 3, 1.81, 76, 5),
	(15, 'Ömer', 'Bayram', '1992-07-24', 2, 4, 1.76, 74, 14),
	(16, 'Emre', 'Kılınç', '1999-06-05', 8, 3, 1.75, 70, 21),
	(17, 'Çağlar', 'Söyüncü', '1996-05-23', 10, 2, 1.87, 82, 4),
	(18, 'Hasan', 'Ali Kaldırım', '1989-12-09', 3, 1, 1.83, 75, 6),
	(19, 'Denzel', 'Dumfries', '1996-04-18', 6, 2, 1.89, 82, 23),
	(20, 'Hakan', 'Arslan', '1994-10-07', 9, 3, 1.82, 75, 8),
	(21, 'Orkun', 'Kökcü', '2000-12-29', 1, 3, 1.83, 78, 11),
	(22, 'Mehmet', 'Zeki Çelik', '1997-02-17', 7, 2, 1.82, 75, 2),
	(23, 'Cenk', 'Özkaçar', '2001-01-10', 8, 4, 1.86, 80, 16),
	(24, 'Ahmet', 'Kutucu', '2000-05-01', 2, 5, 1.76, 72, 7),
	(25, 'Ozan', 'Kabak', '2000-03-25', 5, 2, 1.86, 82, 20),
	(26, 'Yunus', 'Akgün', '2000-08-13', 3, 5, 1.78, 70, 15),
	(27, 'Atalay', 'Babayaroğlu', '2003-02-01', 10, 3, 1.75, 68, 29),
	(28, 'Berkay', 'Özcan', '1998-02-15', 6, 3, 1.8, 75, 19),
	(29, 'Enis', 'Destan', '2002-11-05', 4, 4, 1.84, 77, 32),
	(30, 'Kerem', 'Aksakal', '2002-06-23', 9, 5, 1.75, 68, 25),
	(31, 'Ömer', 'Faruk Beyaz', '2003-08-29', 1, 3, 1.72, 67, 14),
	(32, 'Atakan', 'Çankaya', '2002-04-11', 10, 2, 1.88, 80, 27),
	(33, 'Berat', 'Özdemir', '2000-01-22', 7, 3, 1.78, 72, 22),
	(34, 'Mustafa', 'Kapi', '2001-12-21', 6, 4, 1.85, 78, 21),
	(35, 'Erencan', 'Yazıcı', '2000-07-04', 2, 5, 1.73, 70, 24),
	(36, 'Eray', 'Comert', '1998-03-07', 5, 2, 1.87, 85, 26),
	(37, 'Ferdi', 'Kadioglu', '1999-10-07', 8, 3, 1.76, 73, 23),
	(38, 'Uğurcan', 'Çakır', '1996-04-05', 7, 1, 1.87, 82, 1),
	(39, 'Orhan', 'Ak', '2000-09-22', 3, 5, 1.75, 70, 30),
	(40, 'Yusuf', 'Sarı', '2002-06-25', 9, 4, 1.84, 77, 28),
	(41, 'Batuhan', 'Kurt', '2002-12-05', 4, 4, 1.8, 75, 18),
	(42, 'Barış', 'Alıcı', '1997-08-09', 1, 2, 1.84, 80, 13),
	(43, 'Doğukan', 'Sinik', '1996-11-25', 2, 3, 1.78, 72, 8),
	(44, 'Efecan', 'Karaca', '1998-09-30', 3, 5, 1.75, 68, 21),
	(45, 'Ferhat', 'Çoğalan', '2000-03-14', 5, 3, 1.76, 73, 15),
	(46, 'Kerem', 'Aktürkoğlu', '2001-05-17', 7, 5, 1.77, 72, 23),
	(47, 'Metehan', 'Güçlü', '1999-04-01', 8, 4, 1.85, 78, 10),
	(48, 'Muhammed', 'Gümüşkaya', '2002-06-11', 6, 3, 1.8, 75, 19),
	(49, 'Onur', 'Türk', '2000-08-26', 9, 2, 1.86, 80, 6),
	(50, 'Recep', 'Gül', '1997-02-08', 10, 3, 1.81, 76, 9),
	(51, 'Sergen', 'Yatgın', '2001-12-14', 1, 5, 1.75, 70, 27),
	(52, 'Soner', 'Aydın', '1998-07-02', 2, 4, 1.78, 72, 17),
	(53, 'Tolgay', 'Arslan', '1990-04-16', 3, 3, 1.78, 75, 14),
	(54, 'Uğur', 'Demirok', '1988-03-26', 4, 2, 1.87, 82, 4),
	(55, 'Yunus', 'Mert', '2002-09-18', 5, 6, 1.88, 80, 32),
	(56, 'Zeki', 'Çelik', '1997-12-17', 6, 2, 1.82, 75, 2),
	(57, 'Bilal', 'Başaçıkoğlu', '1995-10-26', 7, 5, 1.8, 75, 11),
	(58, 'Furkan', 'Soyuncu', '2001-06-16', 8, 4, 1.86, 80, 16),
	(59, 'Emre', 'Akbaba', '1993-10-04', 9, 3, 1.75, 70, 7),
	(60, 'Yusuf', 'Abdioglu', '2000-02-03', 10, 3, 1.78, 72, 15);

-- tablo yapısı dökülüyor futbol.takim
DROP TABLE IF EXISTS `takim`;
CREATE TABLE IF NOT EXISTS `takim` (
  `id` int NOT NULL AUTO_INCREMENT,
  `takim_ad` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `lig_id` int NOT NULL,
  `kurulus_yil` date NOT NULL,
  `renkler` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `logo` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `sampiyonluk_sayisi` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `FK_takim_lig` (`lig_id`),
  CONSTRAINT `FK_takim_lig` FOREIGN KEY (`lig_id`) REFERENCES `lig` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- futbol.takim: ~31 rows (yaklaşık) tablosu için veriler indiriliyor
INSERT INTO `takim` (`id`, `takim_ad`, `lig_id`, `kurulus_yil`, `renkler`, `logo`, `sampiyonluk_sayisi`) VALUES
	(1, 'Beşiktaş', 1, '1903-03-19', 'Siyah-Beyaz', 'besiktas_logo.jpg', 16),
	(2, 'Trabzonspor', 1, '1967-08-02', 'Bordo-Mavı', 'trabzonspor_logo.jpg', 6),
	(3, 'Fenerbahçe', 1, '1907-05-03', 'Sarı-Lacivert', 'fenerbahce_logo.jpg', 28),
	(4, 'Galatasaray', 1, '1905-05-30', 'Sarı-Kırmızı', 'galatasaray_logo.jpg', 22),
	(5, 'Başakşehir', 1, '1990-05-04', 'Turuncu-Mavi', 'basaksehir_logo.jpg', 1),
	(6, 'Antalyaspor', 1, '1966-07-14', 'Kırmızı-Beyaz', 'antalyaspor_logo.jpg', 0),
	(7, 'Göztepe', 1, '1925-06-14', 'Sarı-Kırmızı', 'goztepe_logo.jpg', 6),
	(8, 'Kasımpaşa', 1, '1921-01-01', 'Lacivert-Beyaz', 'kasimpasa_logo.jpg', 0),
	(9, 'Alanyaspor', 1, '1948-11-01', 'Turuncu-Yeşil', 'alanyaspor_logo.jpg', 0),
	(10, 'Sivasspor', 1, '1967-05-15', 'Kırmızı-Beyaz', 'sivasspor_logo.jpg', 0),
	(11, 'Gençlerbirliği', 1, '1923-01-14', 'Kırmızı-Siyah', 'genclerbirligi_logo.jpg', 1),
	(12, 'Kayserispor', 1, '1966-07-15', 'Sarı-Kırmızı', 'kayserispor_logo.jpg', 0),
	(13, 'Denizlispor', 1, '1966-06-26', 'Yeşil-Siyah', 'denizlispor_logo.jpg', 0),
	(14, 'Konyaspor', 1, '1922-12-22', 'Yeşil-Beyaz', 'konyaspor_logo.jpg', 0),
	(15, 'Gaziantep FK', 1, '1988-07-18', 'Mavi-Kırmızı', 'gaziantepfk_logo.jpg', 0),
	(16, 'Rizespor', 1, '1953-05-19', 'Yeşil-Beyaz', 'rizespor_logo.jpg', 0),
	(17, 'Malatyaspor', 1, '1966-06-20', 'Kırmızı-Siyah', 'malatyaspor_logo.jpg', 0),
	(18, 'Erzurumspor', 1, '2010-06-30', 'Bordo', 'erzurumspor_logo.jpg', 0),
	(19, 'Hatayspor', 1, '1967-05-09', 'Turuncu-Mavi', 'hatayspor_logo.jpg', 0),
	(20, 'Altay', 1, '1914-01-28', 'Siyah-Beyaz', 'altay_logo.jpg', 6),
	(21, 'Arsenal', 2, '1886-12-01', 'Kırmızı-Beyaz', 'arsenal_logo.jpg', 13),
	(22, 'Inter Milan', 5, '1908-03-09', 'Mavi-Siyah', 'inter_logo.jpg', 19),
	(23, 'Borussia Dortmund', 4, '1909-12-19', 'Sarı-Siyah', 'bvb_logo.jpg', 8),
	(24, 'Atletico Madrid', 3, '1903-04-26', 'Kırmızı-Beyaz', 'atletico_logo.jpg', 11),
	(25, 'Paris Saint-Germain', 6, '1970-08-12', 'Mavi-Kırmızı', 'psg_logo.jpg', 9),
	(26, 'Manchester City', 2, '1880-04-16', 'Mavi-Beyaz', 'mancity_logo.jpg', 6),
	(27, 'Roma', 5, '1927-07-22', 'Sarı-Kırmızı', 'roma_logo.jpg', 3),
	(28, 'Tottenham Hotspur', 2, '1882-09-05', 'Beyaz', 'tottenham_logo.jpg', 2),
	(29, 'Napoli', 5, '1926-08-01', 'Mavi-Beyaz', 'napoli_logo.jpg', 2),
	(30, 'Sevilla', 3, '1890-01-25', 'Beyaz-Kırmızı', 'sevilla_logo.jpg', 6),
	(31, 'Adana Demir Spor', 1, '1955-10-20', 'Mavi-Beyaz', 'logo.png', 0);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
