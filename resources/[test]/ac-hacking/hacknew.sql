-- --------------------------------------------------------
-- Sunucu:                       127.0.0.1
-- Sunucu sürümü:                10.4.32-MariaDB - mariadb.org binary distribution
-- Sunucu İşletim Sistemi:       Win64
-- HeidiSQL Sürüm:               12.6.0.6765
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;



-- tablo yapısı dökülüyor qbcoreframework_ca8f19.ac_hack
CREATE TABLE IF NOT EXISTS `ac_hack` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(46) DEFAULT NULL,
  `notes` longtext NOT NULL,
  `apps` longtext DEFAULT NULL,
  `build` longtext DEFAULT NULL,
  `props` longtext DEFAULT NULL,
  `miner` longtext DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `cryptoaddress` varchar(50) DEFAULT NULL,
  `macaddress` varchar(50) DEFAULT NULL,
  `butcoin` decimal(20,6) DEFAULT 0.000010,
  `temporaryCoin` decimal(20,6) DEFAULT 0.000010,
  `connectWifiTime` time DEFAULT NULL,
  `openControl` tinyint(4) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- qbcoreframework_ca8f19.ac_hack: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `ac_hack`;

-- tablo yapısı dökülüyor qbcoreframework_ca8f19.ac_hack_public_binunce
CREATE TABLE IF NOT EXISTS `ac_hack_public_binunce` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `senderUserName` varchar(100) DEFAULT NULL,
  `senderAddress` varchar(100) DEFAULT NULL,
  `receiverAddress` varchar(100) DEFAULT NULL,
  `macAddress` varchar(100) DEFAULT NULL,
  `amount` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- qbcoreframework_ca8f19.ac_hack_public_binunce: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `ac_hack_public_binunce`;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
