-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.4.32-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.7.0.6850
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para zap1214400-2
CREATE DATABASE IF NOT EXISTS `zap1214400-2` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `zap1214400-2`;

-- Volcando estructura para tabla zap1214400-2.0r_mechanics
CREATE TABLE IF NOT EXISTS `0r_mechanics` (
  `plate` text DEFAULT NULL,
  `data` longtext DEFAULT '[]'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Volcando datos para la tabla zap1214400-2.0r_mechanics: ~0 rows (aproximadamente)

-- Volcando estructura para tabla zap1214400-2.accounts
CREATE TABLE IF NOT EXISTS `accounts` (
  `identifier` varchar(50) NOT NULL,
  `id` varchar(50) NOT NULL DEFAULT '',
  `name` longtext NOT NULL,
  `balance` bigint(20) NOT NULL DEFAULT 0,
  `transactions` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Volcando datos para la tabla zap1214400-2.accounts: ~0 rows (aproximadamente)
INSERT INTO `accounts` (`identifier`, `id`, `name`, `balance`, `transactions`) VALUES
	('ZRP16935', '45305', 'Personal Account', 10032, '[{"amount":"32","type":"deposit","description":""},{"type":"deposit","amount":"10000","description":"For car"}]');

-- Volcando estructura para tabla zap1214400-2.ak4y_advancedhunting
CREATE TABLE IF NOT EXISTS `ak4y_advancedhunting` (
  `#` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(255) DEFAULT NULL,
  `currentXP` int(11) DEFAULT NULL,
  `tasks` longtext DEFAULT NULL,
  `taskResetTime` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`#`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla zap1214400-2.ak4y_advancedhunting: ~0 rows (aproximadamente)
INSERT INTO `ak4y_advancedhunting` (`#`, `citizenid`, `currentXP`, `tasks`, `taskResetTime`) VALUES
	(3, 'ZRP16935', 48, '[{"rewardPrice":10000,"taken":false,"hasCount":0,"requiredCount":10,"taskId":1},{"rewardPrice":10000,"taken":false,"hasCount":0,"requiredCount":10,"taskId":2},{"rewardPrice":10000,"taken":false,"hasCount":0,"requiredCount":10,"taskId":3},{"rewardPrice":10000,"taken":false,"hasCount":0,"requiredCount":10,"taskId":4},{"rewardPrice":10000,"taken":false,"hasCount":0,"requiredCount":10,"taskId":5},{"rewardPrice":10000,"taken":false,"hasCount":0,"requiredCount":10,"taskId":6},{"rewardPrice":10000,"taken":false,"hasCount":0,"requiredCount":10,"taskId":7},{"rewardPrice":10000,"taken":false,"hasCount":0,"requiredCount":10,"taskId":8}]', '2024-07-25 18:41:32');

-- Volcando estructura para tabla zap1214400-2.ak4y_fishing
CREATE TABLE IF NOT EXISTS `ak4y_fishing` (
  `citizenid` varchar(255) DEFAULT NULL,
  `currentXP` int(11) DEFAULT NULL,
  `tasks` longtext DEFAULT NULL,
  `time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla zap1214400-2.ak4y_fishing: ~0 rows (aproximadamente)
INSERT INTO `ak4y_fishing` (`citizenid`, `currentXP`, `tasks`, `time`) VALUES
	('ZRP16935', 52, '[{"fishName":"smallbluefish","requiredCount":40,"hasCount":0,"taken":false},{"fishName":"bluefish","requiredCount":30,"hasCount":0,"taken":false},{"fishName":"bonitosfish","requiredCount":20,"hasCount":0,"taken":false},{"fishName":"garfish","requiredCount":15,"hasCount":0,"taken":false},{"fishName":"perch","requiredCount":10,"hasCount":0,"taken":false},{"fishName":"sharkfish","requiredCount":20,"hasCount":0,"taken":false}]', NULL);

-- Volcando estructura para tabla zap1214400-2.apartments
CREATE TABLE IF NOT EXISTS `apartments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `citizenid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla zap1214400-2.apartments: ~7 rows (aproximadamente)
INSERT INTO `apartments` (`id`, `name`, `type`, `label`, `citizenid`) VALUES
	(1, 'apartment12655', 'apartment1', 'South Rockford Drive 2655', 'NWG45939'),
	(2, 'apartment14223', 'apartment1', 'South Rockford Drive 4223', 'ZWO74305'),
	(5, 'apartment14794', 'apartment1', 'South Rockford Drive 4794', 'OYD43612'),
	(10, 'apartment29199', 'apartment2', 'Tinsel Towers 9199', 'IEW99125'),
	(12, 'apartment12080', 'apartment1', 'South Rockford Drive 2080', 'ZFQ53507'),
	(13, 'apartment17041', 'apartment1', 'South Rockford Drive 7041', 'KMR55667'),
	(18, 'apartment11040', 'apartment1', 'South Rockford Drive 1040', 'SVB88291');

-- Volcando estructura para tabla zap1214400-2.bank_accounts
CREATE TABLE IF NOT EXISTS `bank_accounts` (
  `record_id` bigint(255) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(250) DEFAULT NULL,
  `buisness` varchar(50) DEFAULT NULL,
  `buisnessid` int(11) DEFAULT NULL,
  `gangid` varchar(50) DEFAULT NULL,
  `amount` bigint(255) NOT NULL DEFAULT 0,
  `account_type` enum('Current','Savings','Buisness','Gang') NOT NULL DEFAULT 'Current',
  PRIMARY KEY (`record_id`),
  UNIQUE KEY `citizenid` (`citizenid`),
  KEY `buisness` (`buisness`),
  KEY `buisnessid` (`buisnessid`),
  KEY `gangid` (`gangid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Volcando datos para la tabla zap1214400-2.bank_accounts: ~0 rows (aproximadamente)

-- Volcando estructura para tabla zap1214400-2.bank_accounts_new
CREATE TABLE IF NOT EXISTS `bank_accounts_new` (
  `id` varchar(50) NOT NULL,
  `amount` int(11) DEFAULT 0,
  `transactions` longtext DEFAULT '[]',
  `auth` longtext DEFAULT '[]',
  `isFrozen` int(11) DEFAULT 0,
  `creator` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla zap1214400-2.bank_accounts_new: ~0 rows (aproximadamente)

-- Volcando estructura para tabla zap1214400-2.bank_statements
CREATE TABLE IF NOT EXISTS `bank_statements` (
  `record_id` bigint(255) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `account` varchar(50) DEFAULT NULL,
  `business` varchar(50) DEFAULT NULL,
  `businessid` int(11) DEFAULT NULL,
  `gangid` varchar(50) DEFAULT NULL,
  `deposited` int(11) DEFAULT NULL,
  `withdraw` int(11) DEFAULT NULL,
  `balance` int(11) DEFAULT NULL,
  `date` varchar(50) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`record_id`),
  KEY `business` (`business`),
  KEY `businessid` (`businessid`),
  KEY `gangid` (`gangid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Volcando datos para la tabla zap1214400-2.bank_statements: ~0 rows (aproximadamente)

-- Volcando estructura para tabla zap1214400-2.bans
CREATE TABLE IF NOT EXISTS `bans` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `license` varchar(50) DEFAULT NULL,
  `discord` varchar(50) DEFAULT NULL,
  `ip` varchar(50) DEFAULT NULL,
  `reason` text DEFAULT NULL,
  `expire` int(11) DEFAULT NULL,
  `bannedby` varchar(255) NOT NULL DEFAULT 'LeBanhammer',
  PRIMARY KEY (`id`),
  KEY `license` (`license`),
  KEY `discord` (`discord`),
  KEY `ip` (`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Volcando datos para la tabla zap1214400-2.bans: ~0 rows (aproximadamente)

-- Volcando estructura para tabla zap1214400-2.bees
CREATE TABLE IF NOT EXISTS `bees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `coords` longtext DEFAULT NULL,
  `beequeen` int(11) DEFAULT NULL,
  `timestamp` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;

-- Volcando datos para la tabla zap1214400-2.bees: ~0 rows (aproximadamente)

-- Volcando estructura para tabla zap1214400-2.bills
CREATE TABLE IF NOT EXISTS `bills` (
  `id` bigint(255) NOT NULL AUTO_INCREMENT,
  `bill_date` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `sender_account` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sender_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sender_citizenid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `recipient_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `recipient_citizenid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `status_date` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla zap1214400-2.bills: ~0 rows (aproximadamente)

-- Volcando estructura para tabla zap1214400-2.bossmenu
CREATE TABLE IF NOT EXISTS `bossmenu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_name` varchar(50) NOT NULL,
  `amount` int(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `job_name` (`job_name`)
) ENGINE=InnoDB AUTO_INCREMENT=7944 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Volcando datos para la tabla zap1214400-2.bossmenu: ~21 rows (aproximadamente)
INSERT INTO `bossmenu` (`id`, `job_name`, `amount`) VALUES
	(1, 'police', 0),
	(2, 'ambulance', 8000),
	(3, 'realestate', 0),
	(4, 'tuner', 0),
	(5, 'burgershot', 0),
	(6, 'mechanic', 0),
	(7, 'vanilla', 0),
	(8, 'whitewidow', 0),
	(9, 'pizzathis', 0),
	(10, 'catcafe', 0),
	(11, 'tequila', 0),
	(12, 'taco', 0),
	(13, 'drugdealer', 0),
	(41, 'pawn', 0),
	(377, 'casino', 0),
	(405, 'judge', 0),
	(608, 'beanmachine', 0),
	(1481, 'unemployed', 0),
	(1906, 'coolbeans', 0),
	(2931, 'redline', 0),
	(5095, 'yellowjack', 0);

-- Volcando estructura para tabla zap1214400-2.character_current
CREATE TABLE IF NOT EXISTS `character_current` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` longtext DEFAULT NULL,
  `model` longtext NOT NULL DEFAULT '',
  `drawables` longtext NOT NULL DEFAULT '',
  `props` longtext NOT NULL DEFAULT '',
  `drawtextures` longtext NOT NULL DEFAULT '',
  `proptextures` longtext NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Volcando datos para la tabla zap1214400-2.character_current: ~0 rows (aproximadamente)

-- Volcando estructura para tabla zap1214400-2.character_face
CREATE TABLE IF NOT EXISTS `character_face` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(255) NOT NULL,
  `hairColor` varchar(255) DEFAULT NULL,
  `headBlend` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`headBlend`)),
  `headOverlay` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`headOverlay`)),
  `headStructure` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`headStructure`)),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla zap1214400-2.character_face: ~0 rows (aproximadamente)

-- Volcando estructura para tabla zap1214400-2.character_outfits
CREATE TABLE IF NOT EXISTS `character_outfits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` longtext DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `slot` varchar(11) NOT NULL DEFAULT '',
  `model` longtext DEFAULT NULL,
  `drawables` longtext DEFAULT NULL,
  `props` longtext DEFAULT NULL,
  `drawtextures` longtext DEFAULT NULL,
  `proptextures` longtext DEFAULT NULL,
  `hairColor` longtext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla zap1214400-2.character_outfits: ~0 rows (aproximadamente)

-- Volcando estructura para tabla zap1214400-2.cl_spawnselector
CREATE TABLE IF NOT EXISTS `cl_spawnselector` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `location_data` longtext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=375 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla zap1214400-2.cl_spawnselector: ~5 rows (aproximadamente)
INSERT INTO `cl_spawnselector` (`id`, `location_data`) VALUES
	(1, '{"locationText":"Hospital","iconColor":"rgb(51, 51, 51)","iconName":"fas fa-hospital","screenPosition":{"left":510,"resolution":{"height":1080,"width":1920},"top":571},"backgroundColor":"rgb(253, 92, 99)"}'),
	(2, '{"locationText":"Legion Square","iconColor":"rgb(51, 51, 51)","iconName":"fas fa-tree","screenPosition":{"left":477,"resolution":{"height":1080,"width":1920},"top":546},"backgroundColor":"#c3f2cb"}'),
	(3, '{"locationText":"Airport","iconColor":"rgb(51, 51, 51)","iconName":"fas fa-cart-flatbed-suitcase","screenPosition":{"left":167,"resolution":{"height":1080,"width":1920},"top":391},"backgroundColor":"rgb(200, 237, 253)"}'),
	(4, '{"locationText":"Mount Chiliad","iconColor":"rgb(51, 51, 51)","iconName":"fas fa-person-hiking","screenPosition":{"left":1520,"resolution":{"height":1080,"width":1920},"top":595},"backgroundColor":"rgb(129, 104, 2)"}'),
	(5, '{"locationText":"MRPD","iconColor":"rgb(51, 51, 51)","iconName":"fas fa-shield","screenPosition":{"left":454,"resolution":{"height":1080,"width":1920},"top":587},"backgroundColor":"rgb(124, 185, 232)"}');

-- Volcando estructura para tabla zap1214400-2.communityservice
CREATE TABLE IF NOT EXISTS `communityservice` (
  `identifier` varchar(100) NOT NULL,
  `actions_remaining` int(10) NOT NULL,
  PRIMARY KEY (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla zap1214400-2.communityservice: ~0 rows (aproximadamente)

-- Volcando estructura para tabla zap1214400-2.configs
CREATE TABLE IF NOT EXISTS `configs` (
  `name` varchar(20) NOT NULL,
  `config` text DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla zap1214400-2.configs: ~0 rows (aproximadamente)
INSERT INTO `configs` (`name`, `config`) VALUES
	('keylabs', '{"washer2":0,"worth4":0,"worth3":0,"washer3":0,"worth2":0,"washer4":0,"methlab":9184,"methlab2":12205,"worth1":0,"washer1":0,"weedlab":9845,"cokelab":4729}');

-- Volcando estructura para tabla zap1214400-2.core_skills
CREATE TABLE IF NOT EXISTS `core_skills` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `skill_name` varchar(100) NOT NULL,
  `value1` varchar(50) NOT NULL,
  `value2` varchar(50) NOT NULL,
  `value3` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla zap1214400-2.core_skills: ~2 rows (aproximadamente)
INSERT INTO `core_skills` (`id`, `citizenid`, `skill_name`, `value1`, `value2`, `value3`) VALUES
	(1, 'ZRP16935', 'AddHealthRegen', '20', '40', '5000'),
	(2, 'ZRP16935', 'AddSpeed', '1.05', '0', '0'),
	(3, 'XAJ76238', 'AddSpeed', '1.05', '0', '0');

-- Volcando estructura para tabla zap1214400-2.crypto
CREATE TABLE IF NOT EXISTS `crypto` (
  `crypto` varchar(50) NOT NULL DEFAULT 'qbit',
  `worth` int(11) NOT NULL DEFAULT 0,
  `history` text DEFAULT NULL,
  PRIMARY KEY (`crypto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Volcando datos para la tabla zap1214400-2.crypto: ~0 rows (aproximadamente)
INSERT INTO `crypto` (`crypto`, `worth`, `history`) VALUES
	('qbit', 1025, '[{"NewWorth":1017,"PreviousWorth":1016},{"NewWorth":1017,"PreviousWorth":1016},{"NewWorth":1017,"PreviousWorth":1016},{"NewWorth":1025,"PreviousWorth":1017}]');

-- Volcando estructura para tabla zap1214400-2.cryptominers
CREATE TABLE IF NOT EXISTS `cryptominers` (
  `citizenid` varchar(50) NOT NULL,
  `card` varchar(50) NOT NULL,
  `balance` double NOT NULL,
  PRIMARY KEY (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla zap1214400-2.cryptominers: ~0 rows (aproximadamente)
INSERT INTO `cryptominers` (`citizenid`, `card`, `balance`) VALUES
	('POU11431', '1060gpu', 5.200000000000001);

-- Volcando estructura para tabla zap1214400-2.crypto_transactions
CREATE TABLE IF NOT EXISTS `crypto_transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `message` varchar(50) DEFAULT NULL,
  `date` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla zap1214400-2.crypto_transactions: ~0 rows (aproximadamente)

-- Volcando estructura para tabla zap1214400-2.dealers
CREATE TABLE IF NOT EXISTS `dealers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '0',
  `coords` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `time` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `createdby` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Volcando datos para la tabla zap1214400-2.dealers: ~0 rows (aproximadamente)

-- Volcando estructura para tabla zap1214400-2.dpkeybinds
CREATE TABLE IF NOT EXISTS `dpkeybinds` (
  `id` varchar(50) DEFAULT NULL,
  `keybind1` varchar(50) DEFAULT 'num4',
  `emote1` varchar(255) DEFAULT '',
  `keybind2` varchar(50) DEFAULT 'num5',
  `emote2` varchar(255) DEFAULT '',
  `keybind3` varchar(50) DEFAULT 'num6',
  `emote3` varchar(255) DEFAULT '',
  `keybind4` varchar(50) DEFAULT 'num7',
  `emote4` varchar(255) DEFAULT '',
  `keybind5` varchar(50) DEFAULT 'num8',
  `emote5` varchar(255) DEFAULT '',
  `keybind6` varchar(50) DEFAULT 'num9',
  `emote6` varchar(255) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla zap1214400-2.dpkeybinds: ~0 rows (aproximadamente)
INSERT INTO `dpkeybinds` (`id`, `keybind1`, `emote1`, `keybind2`, `emote2`, `keybind3`, `emote3`, `keybind4`, `emote4`, `keybind5`, `emote5`, `keybind6`, `emote6`) VALUES
	('license:d2564bd9f174527e1192ca089244188b2dee918e', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', '');

-- Volcando estructura para tabla zap1214400-2.fd_cards
CREATE TABLE IF NOT EXISTS `fd_cards` (
  `num_cards` int(11) DEFAULT 0,
  `id` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla zap1214400-2.fd_cards: ~0 rows (aproximadamente)
INSERT INTO `fd_cards` (`num_cards`, `id`) VALUES
	(21, 1);

-- Volcando estructura para tabla zap1214400-2.fine_types
CREATE TABLE IF NOT EXISTS `fine_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  `jailtime` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla zap1214400-2.fine_types: ~90 rows (aproximadamente)
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`, `jailtime`) VALUES
	(1, 'Murder', 3000, 0, 15),
	(2, 'Involuntary Manslaughter', 1000, 0, 5),
	(3, 'Vehicular Manslaughter', 750, 0, 5),
	(4, 'Attempted Murder on LEO', 2000, 0, 10),
	(5, 'Attempted Murder', 1500, 0, 50),
	(6, 'Assault w/ Deadly Weapon on LEO', 1500, 0, 45),
	(7, 'Assault w/ Deadly Weapon', 1000, 0, 30),
	(8, 'Assault on LEO', 750, 0, 15),
	(9, 'Assault', 1000, 0, 10),
	(10, 'Kidnapping of an LEO', 1000, 0, 20),
	(11, 'Kidnapping / Hostage Taking', 750, 0, 20),
	(12, 'Bank Robbery', 3000, 0, 50),
	(13, 'Armored Truck Robbery', 2000, 0, 20),
	(14, 'Jewelery Store Robbery ', 3000, 0, 20),
	(15, 'Store Robbery', 2000, 0, 15),
	(16, 'House Robbery', 1000, 0, 10),
	(17, 'Corruption', 10000, 0, 650),
	(18, 'Felony Driving Under the Influence', 500, 0, 10),
	(19, 'Grand Theft Auto', 500, 0, 5),
	(20, 'Evading Arrest', 500, 0, 10),
	(21, 'Driving Under the Influence', 500, 0, 5),
	(22, 'Hit and Run', 500, 0, 5),
	(23, 'Operating a Motor Vehicle without a License', 500, 0, 10),
	(24, 'Criminal Speeding', 300, 0, 10),
	(25, 'Excessive Speeding 4', 250, 0, 0),
	(26, 'Excessive Speeding 3', 200, 0, 0),
	(27, 'Excessive Speeding 2', 150, 0, 0),
	(28, 'Excessive Speeding', 100, 0, 0),
	(29, 'Operating an Unregisted Motor Vehicle', 250, 0, 5),
	(30, 'Reckless Endangerment', 250, 0, 5),
	(31, 'Careless Driving', 250, 0, 0),
	(32, 'Operating a Non-Street Legal Vehicle', 200, 0, 5),
	(33, 'Failure to Stop', 250, 0, 0),
	(34, 'Obstructing Traffic', 150, 0, 0),
	(35, 'Illegal Lane Change', 100, 0, 0),
	(36, 'Failure to Yield to an Emergency Vehicle', 150, 0, 0),
	(37, 'Illegal Parking', 100, 0, 0),
	(38, 'Excessive Vehicle Noise', 100, 0, 0),
	(39, 'Driving without Proper Use of Headlights', 100, 0, 0),
	(40, 'Illegal U-Turn', 100, 0, 0),
	(41, 'Drug Manufacturing/Cultivation', 1500, 0, 20),
	(42, 'Possession of Schedule 1 Drug', 2500, 0, 15),
	(43, 'Possession of Schedule 2 Drug', 3000, 0, 20),
	(44, 'Sale/Distribution of Schedule 1 Drug', 3500, 0, 20),
	(45, 'Sale/Distribution of Schedule 2 Drug', 4000, 0, 20),
	(46, 'Drug Trafficking', 3000, 0, 20),
	(47, 'Weapons Caching of Class 2s', 3500, 0, 20),
	(48, 'Weapons Caching of Class 1s', 3000, 0, 40),
	(49, 'Weapons Trafficking of Class 2s', 3000, 0, 20),
	(50, 'Weapons Trafficking of Class 1s', 3500, 0, 20),
	(51, 'Possession of a Class 2 Firearm', 2500, 0, 20),
	(52, 'Possession of a Class 1 Firearm', 1500, 0, 15),
	(53, 'Brandishing a Firearm', 1000, 0, 5),
	(54, 'Unlawful discharge of a firearm', 1500, 0, 10),
	(55, 'Perjury', 1000, 0, 60),
	(56, 'Arson', 500, 0, 30),
	(57, 'False Impersonation of a Government Official', 2000, 0, 25),
	(58, 'Possession of Dirty Money', 2000, 0, 25),
	(59, 'Possession of Stolen Goods', 1000, 0, 15),
	(60, 'Unlawful Solicitation', 1500, 0, 20),
	(61, 'Larceny', 150, 0, 20),
	(62, 'Felony Attempted Commision of an Offence/Crime', 1500, 0, 20),
	(63, 'Tampering With Evidence', 20000, 0, 20),
	(64, 'Illegal Gambling', 2000, 0, 20),
	(65, 'Bribery', 2000, 0, 20),
	(66, 'Stalking', 1500, 0, 20),
	(67, 'Organizing an illegal event', 3500, 0, 15),
	(68, 'Participating in an illegal event', 2500, 0, 5),
	(69, 'Criminal Mischief', 1000, 0, 15),
	(70, 'Prostitution', 2500, 0, 15),
	(71, 'Failure to Identify', 1500, 0, 15),
	(72, 'Obstruction of Justice', 25000, 0, 15),
	(73, 'Resisting Arrest', 1000, 0, 10),
	(74, 'Disturbing the Peace', 1000, 0, 10),
	(75, 'Threat to do Bodily Harm', 1000, 0, 10),
	(76, 'Terroristic Threat', 5000, 0, 10),
	(77, 'Damage to Government Property', 500, 0, 10),
	(78, 'Contempt of Court', 25000, 0, 10),
	(79, 'Failure to Obey a Lawful Order', 500, 0, 10),
	(80, 'False Report', 240, 0, 10),
	(81, 'Trespassing', 1000, 0, 10),
	(82, 'Loitering', 250, 0, 0),
	(83, 'Public Intoxication', 1000, 0, 0),
	(84, 'Indecent Exposure', 500, 0, 0),
	(85, 'Verbal Harassment ', 500, 0, 0),
	(86, 'Aiding and Abetting', 500, 0, 0),
	(87, 'Incident Report', 0, 0, 0),
	(88, 'Written Citation', 0, 0, 0),
	(89, 'Stealing PD Stuffs', 25000, 0, 20),
	(90, 'Verbal Warning', 0, 0, 0);

-- Volcando estructura para tabla zap1214400-2.frkn_fuel
CREATE TABLE IF NOT EXISTS `frkn_fuel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` varchar(50) DEFAULT NULL,
  `fuel_name` varchar(50) NOT NULL,
  `desc` longtext NOT NULL,
  `img` longtext NOT NULL,
  `price` varchar(50) DEFAULT NULL,
  `ownership` int(11) DEFAULT 0,
  `rate` varchar(50) DEFAULT NULL,
  `owner_name` varchar(50) DEFAULT 'Furkan',
  `employees` longtext DEFAULT '[]',
  `gas_prop` longtext DEFAULT '[]',
  `gas_netID` int(11) DEFAULT 0,
  `gas_price` longtext DEFAULT '0',
  `gas_tanker` longtext DEFAULT '0',
  `gas_data` longtext DEFAULT '0',
  `gas_level` longtext DEFAULT '{"level":1,"xp":0}',
  `gas_safe_money` int(11) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=194 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla zap1214400-2.frkn_fuel: ~27 rows (aproximadamente)
INSERT INTO `frkn_fuel` (`id`, `owner`, `fuel_name`, `desc`, `img`, `price`, `ownership`, `rate`, `owner_name`, `employees`, `gas_prop`, `gas_netID`, `gas_price`, `gas_tanker`, `gas_data`, `gas_level`, `gas_safe_money`) VALUES
	(1, 'Maze Arena', 'Gas Station 2', 'We\'re here to ensure your journeys are safe and comfortable. Offering your vehicles the high-quality fuel they need at the most competitive prices. Customer satisfaction and vehicle performance are our priorities. Just take the wheel and leave the rest to us', '../images/stationimg1.png', '15060', 1, '1.5', 'Frkn', '[]', '[]', 85, '{"premium":12,"nitro":8,"basic":5,"electric":15}', '{"premium":100,"nitro":"100","basic":100,"electric":100}', '0', '{"level":1,"xp":0}', 0),
	(2, 'Maze Arena', 'Gas Station 2', 'Every journey has a story, and a quality fuel is essential to tell that story best. Our station not only provides your vehicles with the ideal fuel but also welcomes you in a modern and comfortable atmosphere. We\'re here to make your journey even more enjoyable', '../images/stationimg1.png', '34560', 0, '2.5', 'There\'s no owner here', '[]', '[]', 85, '{"premium":12,"nitro":8,"basic":5,"electric":15}', '{"premium":100,"nitro":"100","basic":100,"electric":100}', '0', '{"level":1,"xp":0}', 0),
	(3, 'XAJ76238', 'Gas Station 3', 'Meeting your fuel needs is just a step away. Our station offers a variety of fuel types and quality fuel options, along with specialized care for your vehicles. When you stop by, you\'re not only filling up with fuel but also enjoying top-notch service', '../images/stationimg1.png', '25250', 1, '2.2', 'dwdwd dwdw', '[]', '[]', 85, '{"premium":12,"nitro":8,"basic":5,"electric":15}', '{"premium":100,"nitro":"100","basic":100,"electric":100}', '0', '{"level":1,"xp":0}', 0),
	(4, 'Maze Arena', 'Gas Station 4', ' you\'re looking to make your journeys more economical and efficient, we\'re waiting for you at our station. With suitable fuel options for your vehicles and specially designed fuel tanks, you can enhance your performance and save on fuel. Safe travels', '../images/stationimg1.png', '34555', 0, '2.8', 'There\'s no owner here', '[]', '[]', 85, '{"premium":12,"nitro":8,"basic":5,"electric":15}', '{"premium":100,"nitro":"100","basic":100,"electric":100}', '0', '{"level":1,"xp":0}', 0),
	(5, 'Maze Arena', 'Gas Station 5', 'Every journey is an experience, and a quality fuel enhances that experience. Our station provides your vehicles with the best fuel while offering you a comfortable rest stop. We\'re here to make your journeys safer and more enjoyable', '../images/stationimg1.png', '45620', 0, '3.5', 'There\'s no owner here', '[]', '[]', 85, '{"premium":12,"nitro":8,"basic":5,"electric":15}', '{"premium":100,"nitro":"100","basic":100,"electric":100}', '0', '{"level":1,"xp":0}', 0),
	(6, 'Maze Arena', 'Gas Station 6', 'For longer and more enjoyable journeys, our station awaits. We provide the energy your vehicles need with our quality fuel options and modern facilities. Join us to make your journeys more comfortable and efficient', '../images/stationimg1.png', '21950', 0, '2.5', 'There\'s no owner here', '[]', '[]', 85, '{"premium":12,"nitro":8,"basic":5,"electric":15}', '{"premium":100,"nitro":"100","basic":100,"electric":100}', '0', '{"level":1,"xp":0}', 0),
	(7, 'Maze Arena', 'Gas Station 7', 'We\'re here with you at every stage of your journey. Alongside offering the most suitable fuel for your vehicles, our station provides you with a comfortable resting area. With our top-notch service, we\'re making your journeys smoother and more enjoyable.', '../images/stationimg1.png', '28020', 0, '2.4', 'There\'s no owner here', '[]', '[]', 85, '{"premium":12,"nitro":8,"basic":5,"electric":15}', '{"premium":100,"nitro":"100","basic":100,"electric":100}', '0', '{"level":1,"xp":0}', 0),
	(8, 'Maze Arena', 'Gas Station 8', 'Providing the energy your vehicles need is our job. At our station, we offer different fuel types and quality options tailored to your vehicles. Just visit our station, and leave the rest to us', '../images/stationimg1.png', '45975', 0, '3.7', 'There\'s no owner here', '[]', '[]', 85, '{"premium":12,"nitro":8,"basic":5,"electric":15}', '{"premium":100,"nitro":"100","basic":100,"electric":100}', '0', '{"level":1,"xp":0}', 0),
	(9, 'Maze Arena', 'Gas Station 9', 'Your vehicles\' peak performance is our goal. Our station has specially designed fuel options and a modern facility to provide the care your vehicles need. Just set out on your journey and leave the rest to us.', '../images/stationimg1.png', '65750', 1, '4.6', 'FURKAN', '[]', '[]', 76, '{"nitro":155,"basic":15,"":5,"premium":45,"electric":35}', '{"premium":100,"nitro":"100","basic":100,"electric":100}', '0', '{"level":1,"xp":0}', 0),
	(10, 'Maze Arena', 'Gas Station 10', 'We\'re here to make your journeys special and enjoyable. Our station offers various fuel types and high-quality fuel to provide the best care for your vehicles. Let\'s meet at our station to make your journeys more comfortable and safer.', '../images/stationimg1.png', '84250', 0, '5', 'There\'s no owner here', '[]', '[]', 85, '{"premium":12,"nitro":8,"basic":5,"electric":15}', '{"premium":100,"nitro":"100","basic":100,"electric":100}', '0', '{"level":1,"xp":0}', 0),
	(11, 'Maze Arena', 'Gas Station 11', 'Your vehicles\' peak performance is our goal. Our station has specially designed fuel options and a modern facility to provide the care your vehicles need. Just set out on your journey and leave the rest to us.', '../images/stationimg1.png', '65420', 0, '4.7', 'There\'s no owner here', '[]', '[]', 85, '{"premium":12,"nitro":8,"basic":5,"electric":15}', '{"premium":100,"nitro":"100","basic":100,"electric":100}', '0', '{"level":1,"xp":0}', 0),
	(12, 'Maze Arena', 'Gas Station 12', 'Your vehicles\' peak performance is our goal. Our station has specially designed fuel options and a modern facility to provide the care your vehicles need. Just set out on your journey and leave the rest to us.', '../images/stationimg1.png', '75400', 0, '4.8', 'There\'s no owner here', '[]', '[]', 85, '{"premium":12,"nitro":8,"basic":5,"electric":15}', '{"premium":100,"nitro":"100","basic":100,"electric":100}', '0', '{"level":1,"xp":0}', 0),
	(13, 'Maze Arena', 'Gas Station 13', 'Your vehicles\' peak performance is our goal. Our station has specially designed fuel options and a modern facility to provide the care your vehicles need. Just set out on your journey and leave the rest to us.', '../images/stationimg1.png', '32500', 0, '3.6', 'There\'s no owner here', '[]', '[]', 85, '{"premium":12,"nitro":8,"basic":5,"electric":15}', '{"premium":100,"nitro":"100","basic":100,"electric":100}', '0', '{"level":1,"xp":0}', 0),
	(14, 'Maze Arena', 'Gas Station 14', 'Your vehicles\' peak performance is our goal. Our station has specially designed fuel options and a modern facility to provide the care your vehicles need. Just set out on your journey and leave the rest to us.', '../images/stationimg1.png', '78500', 0, '4.9', 'There\'s no owner here', '[]', '[]', 85, '{"premium":12,"nitro":8,"basic":5,"electric":15}', '{"premium":100,"nitro":"100","basic":100,"electric":100}', '0', '{"level":1,"xp":0}', 0),
	(15, 'Maze Arena', 'Gas Station 15', 'Your vehicles\' peak performance is our goal. Our station has specially designed fuel options and a modern facility to provide the care your vehicles need. Just set out on your journey and leave the rest to us.', '../images/stationimg1.png', '34000', 0, '3.4', 'There\'s no owner here', '[]', '[]', 85, '{"premium":12,"nitro":8,"basic":5,"electric":15}', '{"premium":100,"nitro":"100","basic":100,"electric":100}', '0', '{"level":1,"xp":0}', 0),
	(16, 'Maze Arena', 'Gas Station 16', 'Your vehicles\' peak performance is our goal. Our station has specially designed fuel options and a modern facility to provide the care your vehicles need. Just set out on your journey and leave the rest to us.', '../images/stationimg1.png', '67000', 0, '4.7', 'There\'s no owner here', '[]', '[]', 85, '{"premium":12,"nitro":8,"basic":5,"electric":15}', '{"premium":100,"nitro":"100","basic":100,"electric":100}', '0', '{"level":1,"xp":0}', 0),
	(17, 'Maze Arena', 'Gas Station 17', 'Your vehicles\' peak performance is our goal. Our station has specially designed fuel options and a modern facility to provide the care your vehicles need. Just set out on your journey and leave the rest to us.', '../images/stationimg1.png', '76500', 0, '4.9', 'There\'s no owner here', '[]', '[]', 85, '{"premium":12,"nitro":8,"basic":5,"electric":15}', '{"premium":100,"nitro":"100","basic":100,"electric":100}', '0', '{"level":1,"xp":0}', 0),
	(18, 'Maze Arena', 'Gas Station 18', 'Your vehicles\' peak performance is our goal. Our station has specially designed fuel options and a modern facility to provide the care your vehicles need. Just set out on your journey and leave the rest to us.', '../images/stationimg1.png', '98500', 0, '5', 'There\'s no owner here', '[]', '[]', 85, '{"premium":12,"nitro":8,"basic":5,"electric":15}', '{"premium":100,"nitro":"100","basic":100,"electric":100}', '0', '{"level":1,"xp":0}', 0),
	(19, 'Maze Arena', 'Gas Station 19', 'Your vehicles\' peak performance is our goal. Our station has specially designed fuel options and a modern facility to provide the care your vehicles need. Just set out on your journey and leave the rest to us.', '../images/stationimg1.png', '45000', 0, '4.2', 'There\'s no owner here', '[]', '[]', 85, '{"premium":12,"nitro":8,"basic":5,"electric":15}', '{"premium":100,"nitro":"100","basic":100,"electric":100}', '0', '{"level":1,"xp":0}', 0),
	(20, 'Maze Arena', 'Gas Station 20', 'Your vehicles\' peak performance is our goal. Our station has specially designed fuel options and a modern facility to provide the care your vehicles need. Just set out on your journey and leave the rest to us.', '../images/stationimg1.png', '23550', 0, '2.1', 'There\'s no owner here', '[]', '[]', 85, '{"premium":12,"nitro":8,"basic":5,"electric":15}', '{"premium":100,"nitro":"100","basic":100,"electric":100}', '0', '{"level":1,"xp":0}', 0),
	(21, 'Maze Arena', 'Gas Station 21\r\n', 'Your vehicles\' peak performance is our goal. Our station has specially designed fuel options and a modern facility to provide the care your vehicles need. Just set out on your journey and leave the rest to us.', '../images/stationimg1.png', '41255', 0, '3.2', 'There\'s no owner here', '[]', '[]', 85, '{"premium":12,"nitro":8,"basic":5,"electric":15}', '{"premium":100,"nitro":"100","basic":100,"electric":100}', '0', '{"level":1,"xp":0}', 0),
	(22, 'Maze Arena', 'Gas Station 22', 'Your vehicles\' peak performance is our goal. Our station has specially designed fuel options and a modern facility to provide the care your vehicles need. Just set out on your journey and leave the rest to us.', '../images/stationimg1.png', '45500', 0, '3.3', 'There\'s no owner here', '[]', '[]', 85, '{"premium":12,"nitro":8,"basic":5,"electric":15}', '{"premium":100,"nitro":"100","basic":100,"electric":100}', '0', '{"level":1,"xp":0}', 0),
	(23, 'Maze Arena', 'Gas Station 23', 'Your vehicles\' peak performance is our goal. Our station has specially designed fuel options and a modern facility to provide the care your vehicles need. Just set out on your journey and leave the rest to us.', '../images/stationimg1.png', '65500', 0, '3.7', 'There\'s no owner here', '[]', '[]', 85, '{"premium":12,"nitro":8,"basic":5,"electric":15}', '{"premium":100,"nitro":"100","basic":100,"electric":100}', '0', '{"level":1,"xp":0}', 0),
	(24, 'Maze Arena', 'Gas Station 24', 'Your vehicles\' peak performance is our goal. Our station has specially designed fuel options and a modern facility to provide the care your vehicles need. Just set out on your journey and leave the rest to us.', '../images/stationimg1.png', '45000', 0, '3.4', 'There\'s no owner here', '[]', '[]', 85, '{"premium":12,"nitro":8,"basic":5,"electric":15}', '{"premium":100,"nitro":"100","basic":100,"electric":100}', '0', '{"level":1,"xp":0}', 0),
	(25, 'Maze Arena', 'Gas Station 25', 'Your vehicles\' peak performance is our goal. Our station has specially designed fuel options and a modern facility to provide the care your vehicles need. Just set out on your journey and leave the rest to us.', '../images/stationimg1.png', '23500', 0, '2.8', 'There\'s no owner here', '[]', '[]', 85, '{"premium":12,"nitro":8,"basic":5,"electric":15}', '{"premium":100,"nitro":"100","basic":100,"electric":100}', '0', '{"level":1,"xp":0}', 0),
	(26, 'Maze Arena', 'Gas Station 26', 'Your vehicles\' peak performance is our goal. Our station has specially designed fuel options and a modern facility to provide the care your vehicles need. Just set out on your journey and leave the rest to us.', '../images/stationimg1.png', '47000', 0, '3.5', 'There\'s no owner here', '[]', '[]', 85, '{"premium":12,"nitro":8,"basic":5,"electric":15}', '{"premium":100,"nitro":"100","basic":100,"electric":100}', '0', '{"level":1,"xp":0}', 0),
	(27, 'Maze Arena', 'Gas Station 27', 'Your vehicles\' peak performance is our goal. Our station has specially designed fuel options and a modern facility to provide the care your vehicles need. Just set out on your journey and leave the rest to us.', '../images/stationimg1.png', '53500', 0, '3.9', 'There\'s no owner here', '[]', '[]', 85, '{"premium":12,"nitro":8,"basic":5,"electric":15}', '{"premium":100,"nitro":"100","basic":100,"electric":100}', '0', '{"level":1,"xp":0}', 0);

-- Volcando estructura para tabla zap1214400-2.fuel_stations
CREATE TABLE IF NOT EXISTS `fuel_stations` (
  `location` int(11) NOT NULL,
  `owned` int(11) DEFAULT NULL,
  `owner` varchar(50) DEFAULT NULL,
  `fuel` int(11) DEFAULT NULL,
  `fuelprice` int(11) DEFAULT NULL,
  `balance` int(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`location`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla zap1214400-2.fuel_stations: ~27 rows (aproximadamente)
INSERT INTO `fuel_stations` (`location`, `owned`, `owner`, `fuel`, `fuelprice`, `balance`, `label`) VALUES
	(1, 0, '0', 50000, 16, 0, 'Davis Avenue Ron'),
	(2, 0, '0', 50000, 16, 0, 'Grove Street LTD'),
	(3, 0, '0', 50000, 16, 0, 'Dutch London Xero'),
	(4, 0, '0', 50000, 16, 0, 'Little Seoul LTD'),
	(5, 0, '0', 50000, 16, 0, 'Strawberry Ave Xero'),
	(6, 0, '0', 50000, 16, 0, 'Popular Street Ron'),
	(7, 0, '0', 50000, 16, 0, 'Capital Blvd Ron'),
	(8, 0, '0', 50000, 16, 0, 'Mirror Park LTD'),
	(9, 0, '0', 50000, 16, 0, 'Clinton Ave Globe Oil'),
	(10, 0, '0', 50000, 16, 0, 'North Rockford Ron'),
	(11, 1, '0', 50000, 16, 0, 'Great Ocean Xero'),
	(12, 0, '0', 50000, 16, 0, 'Paleto Blvd Xero'),
	(13, 0, '0', 50000, 16, 0, 'Paleto Ron'),
	(14, 0, '0', 50000, 16, 0, 'Paleto Globe Oil'),
	(15, 0, '0', 50000, 16, 0, 'Grapeseed LTD'),
	(16, 0, '0', 50000, 16, 0, 'Sandy Shores Xero'),
	(17, 0, '0', 50000, 16, 0, 'Sandy Shores Globe Oil'),
	(18, 0, '0', 50000, 16, 0, 'Senora Freeway Xero'),
	(19, 0, '0', 50000, 16, 0, 'Harmony Globe Oil'),
	(20, 0, '0', 50000, 16, 0, 'Route 68 Globe Oil'),
	(21, 0, '0', 50000, 16, 0, 'Route 68 Workshop Globe O'),
	(22, 0, '0', 50000, 16, 0, 'Route 68 Xero'),
	(23, 0, '0', 50000, 16, 0, 'Route 68 Ron'),
	(24, 0, '0', 50000, 16, 0, 'Rex\'s Diner Globe Oil'),
	(25, 0, '0', 50000, 16, 0, 'Palmino Freeway Ron'),
	(26, 0, '0', 50000, 16, 0, 'North Rockford LTD'),
	(27, 0, '0', 50000, 16, 0, 'Alta Street Globe Oil');

-- Volcando estructura para tabla zap1214400-2.gangmenu
CREATE TABLE IF NOT EXISTS `gangmenu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_name` varchar(50) NOT NULL,
  `amount` int(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `job_name` (`job_name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Volcando datos para la tabla zap1214400-2.gangmenu: ~6 rows (aproximadamente)
INSERT INTO `gangmenu` (`id`, `job_name`, `amount`) VALUES
	(1, 'lostmc', 0),
	(2, 'ballas', 0),
	(3, 'vagos', 0),
	(4, 'cartel', 0),
	(5, 'families', 0),
	(6, 'triads', 0);

-- Volcando estructura para tabla zap1214400-2.gas_station_balance
CREATE TABLE IF NOT EXISTS `gas_station_balance` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `gas_station_id` varchar(50) NOT NULL,
  `income` bit(1) NOT NULL,
  `title` varchar(255) NOT NULL,
  `amount` int(10) unsigned NOT NULL,
  `date` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla zap1214400-2.gas_station_balance: ~71 rows (aproximadamente)
INSERT INTO `gas_station_balance` (`id`, `gas_station_id`, `income`, `title`, `amount`, `date`) VALUES
	(34, 'gas_station_27', b'0', 'Money deposited', 100, 1632778923),
	(35, 'gas_station_27', b'0', 'Money deposited', 100, 1632778926),
	(36, 'gas_station_27', b'0', 'Money deposited', 1000000, 1632778935),
	(37, 'gas_station_27', b'1', 'Upgrade purchased: Truck capacity', 45000, 1632778937),
	(38, 'gas_station_27', b'1', 'Upgrade purchased: Truck capacity', 45000, 1632778939),
	(39, 'gas_station_27', b'1', 'Upgrade purchased: Truck capacity', 45000, 1632778940),
	(40, 'gas_station_27', b'1', 'Upgrade purchased: Truck capacity', 45000, 1632778942),
	(41, 'gas_station_27', b'1', 'Upgrade purchased: Relationship', 60000, 1632778944),
	(42, 'gas_station_27', b'1', 'Upgrade purchased: Relationship', 60000, 1632778945),
	(43, 'gas_station_27', b'1', 'Upgrade purchased: Relationship', 60000, 1632778947),
	(44, 'gas_station_27', b'1', 'Upgrade purchased: Relationship', 60000, 1632778948),
	(45, 'gas_station_27', b'1', 'Upgrade purchased: Relationship', 60000, 1632778949),
	(46, 'gas_station_27', b'0', 'Delivery worker removed: 10', 220, 1632778954),
	(47, 'gas_station_27', b'1', 'Delivery job created: 10', 220, 1632778959),
	(48, 'gas_station_27', b'1', 'Stock purchased: Small cargo of 75 Liters', 1575, 1632778994),
	(49, 'gas_station_27', b'1', 'Money withdrawn', 558625, 1632779180),
	(50, 'gas_station_27', b'0', 'Money deposited', 10000000, 1632779185),
	(51, 'gas_station_27', b'1', 'Stock purchased: Small cargo of 75 Liters', 1575, 1632779349),
	(52, 'gas_station_27', b'0', 'Fuel sold (4 Liters)', 2, 1632782381),
	(53, 'gas_station_27', b'0', 'Fuel sold (6 Liters)', 3, 1632782416),
	(54, 'gas_station_1', b'0', 'Money deposited', 4294967295, 1721755809),
	(55, 'gas_station_1', b'1', 'Upgrade purchased: Stock capacity', 20000, 1721755815),
	(56, 'gas_station_1', b'1', 'Upgrade purchased: Stock capacity', 20000, 1721755816),
	(57, 'gas_station_1', b'1', 'Upgrade purchased: Stock capacity', 20000, 1721755816),
	(58, 'gas_station_1', b'1', 'Upgrade purchased: Stock capacity', 20000, 1721755816),
	(59, 'gas_station_1', b'1', 'Upgrade purchased: Stock capacity', 20000, 1721755817),
	(60, 'gas_station_1', b'1', 'Upgrade purchased: Stock capacity', 20000, 1721755817),
	(61, 'gas_station_1', b'1', 'Upgrade purchased: Truck capacity', 45000, 1721755817),
	(62, 'gas_station_1', b'1', 'Upgrade purchased: Truck capacity', 45000, 1721755818),
	(63, 'gas_station_1', b'1', 'Upgrade purchased: Truck capacity', 45000, 1721755818),
	(64, 'gas_station_1', b'1', 'Upgrade purchased: Truck capacity', 45000, 1721755818),
	(65, 'gas_station_1', b'1', 'Upgrade purchased: Truck capacity', 45000, 1721755818),
	(66, 'gas_station_1', b'1', 'Upgrade purchased: Relationship', 60000, 1721755819),
	(67, 'gas_station_1', b'1', 'Upgrade purchased: Relationship', 60000, 1721755819),
	(68, 'gas_station_1', b'1', 'Upgrade purchased: Relationship', 60000, 1721755820),
	(69, 'gas_station_1', b'1', 'Upgrade purchased: Relationship', 60000, 1721755820),
	(70, 'gas_station_1', b'1', 'Upgrade purchased: Relationship', 60000, 1721755820),
	(71, 'gas_station_1', b'1', 'Upgrade purchased: Relationship', 60000, 1721755820),
	(72, 'gas_station_26', b'0', 'Money deposited', 4294967295, 1721756029),
	(73, 'gas_station_26', b'1', 'Upgrade purchased: Stock capacity', 20000, 1721756032),
	(74, 'gas_station_26', b'1', 'Upgrade purchased: Stock capacity', 20000, 1721756033),
	(75, 'gas_station_26', b'1', 'Upgrade purchased: Stock capacity', 20000, 1721756033),
	(76, 'gas_station_26', b'1', 'Upgrade purchased: Stock capacity', 20000, 1721756034),
	(77, 'gas_station_26', b'1', 'Upgrade purchased: Stock capacity', 20000, 1721756035),
	(78, 'gas_station_26', b'1', 'Upgrade purchased: Truck capacity', 45000, 1721756035),
	(79, 'gas_station_26', b'1', 'Upgrade purchased: Truck capacity', 45000, 1721756036),
	(80, 'gas_station_26', b'1', 'Upgrade purchased: Truck capacity', 45000, 1721756036),
	(81, 'gas_station_26', b'1', 'Upgrade purchased: Truck capacity', 45000, 1721756037),
	(82, 'gas_station_26', b'1', 'Upgrade purchased: Truck capacity', 45000, 1721756038),
	(83, 'gas_station_26', b'1', 'Upgrade purchased: Relationship', 60000, 1721756038),
	(84, 'gas_station_26', b'1', 'Upgrade purchased: Relationship', 60000, 1721756039),
	(85, 'gas_station_26', b'1', 'Upgrade purchased: Relationship', 60000, 1721756040),
	(86, 'gas_station_26', b'1', 'Upgrade purchased: Relationship', 60000, 1721756041),
	(87, 'gas_station_26', b'1', 'Upgrade purchased: Relationship', 60000, 1721756041),
	(88, 'gas_station_26', b'1', 'Stock purchased: Large cargo of 300 Liters', 3600, 1721756058),
	(89, 'gas_station_26', b'0', 'Money deposited', 4294967295, 1721756147),
	(90, 'gas_station_26', b'1', 'Upgrade purchased: Stock capacity', 20000, 1721756150),
	(91, 'gas_station_26', b'1', 'Upgrade purchased: Stock capacity', 20000, 1721756150),
	(92, 'gas_station_26', b'1', 'Upgrade purchased: Stock capacity', 20000, 1721756150),
	(93, 'gas_station_26', b'1', 'Upgrade purchased: Stock capacity', 20000, 1721756151),
	(94, 'gas_station_26', b'1', 'Upgrade purchased: Stock capacity', 20000, 1721756152),
	(95, 'gas_station_26', b'1', 'Upgrade purchased: Truck capacity', 45000, 1721756152),
	(96, 'gas_station_26', b'1', 'Upgrade purchased: Truck capacity', 45000, 1721756153),
	(97, 'gas_station_26', b'1', 'Upgrade purchased: Truck capacity', 45000, 1721756153),
	(98, 'gas_station_26', b'1', 'Upgrade purchased: Truck capacity', 45000, 1721756154),
	(99, 'gas_station_26', b'1', 'Upgrade purchased: Truck capacity', 45000, 1721756155),
	(100, 'gas_station_26', b'1', 'Upgrade purchased: Relationship', 60000, 1721756156),
	(101, 'gas_station_26', b'1', 'Upgrade purchased: Relationship', 60000, 1721756156),
	(102, 'gas_station_26', b'1', 'Upgrade purchased: Relationship', 60000, 1721756156),
	(103, 'gas_station_26', b'1', 'Upgrade purchased: Relationship', 60000, 1721756157),
	(104, 'gas_station_26', b'1', 'Upgrade purchased: Relationship', 60000, 1721756157),
	(105, 'gas_station_26', b'1', 'Stock purchased: Small cargo of 75 Liters', 1575, 1721756173);

-- Volcando estructura para tabla zap1214400-2.gas_station_business
CREATE TABLE IF NOT EXISTS `gas_station_business` (
  `gas_station_id` varchar(50) NOT NULL DEFAULT '',
  `user_id` varchar(50) NOT NULL,
  `stock` int(10) unsigned NOT NULL DEFAULT 0,
  `price` int(10) unsigned NOT NULL DEFAULT 0,
  `stock_upgrade` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `truck_upgrade` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `relationship_upgrade` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `money` int(10) unsigned NOT NULL DEFAULT 0,
  `total_money_earned` int(10) unsigned NOT NULL DEFAULT 0,
  `total_money_spent` int(10) unsigned NOT NULL DEFAULT 0,
  `gas_bought` int(10) unsigned NOT NULL DEFAULT 0,
  `gas_sold` int(10) unsigned NOT NULL DEFAULT 0,
  `distance_traveled` double unsigned NOT NULL DEFAULT 0,
  `total_visits` int(10) unsigned NOT NULL DEFAULT 0,
  `customers` int(10) unsigned NOT NULL DEFAULT 0,
  `timer` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`gas_station_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla zap1214400-2.gas_station_business: ~0 rows (aproximadamente)
INSERT INTO `gas_station_business` (`gas_station_id`, `user_id`, `stock`, `price`, `stock_upgrade`, `truck_upgrade`, `relationship_upgrade`, `money`, `total_money_earned`, `total_money_spent`, `gas_bought`, `gas_sold`, `distance_traveled`, `total_visits`, `customers`, `timer`) VALUES
	('gas_station_26', 'ZRP16935', 0, 557, 5, 5, 5, 4294340720, 0, 626575, 0, 0, 0, 0, 0, 1721756140),
	('gas_station_7', 'XAJ76238', 0, 513, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1721921078);

-- Volcando estructura para tabla zap1214400-2.gas_station_jobs
CREATE TABLE IF NOT EXISTS `gas_station_jobs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `gas_station_id` varchar(50) NOT NULL DEFAULT '',
  `name` varchar(50) NOT NULL,
  `reward` int(10) unsigned NOT NULL DEFAULT 0,
  `amount` int(11) NOT NULL DEFAULT 0,
  `progress` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla zap1214400-2.gas_station_jobs: ~0 rows (aproximadamente)
INSERT INTO `gas_station_jobs` (`id`, `gas_station_id`, `name`, `reward`, `amount`, `progress`) VALUES
	(3, 'gas_station_27', '10', 10, 10, b'0');

-- Volcando estructura para tabla zap1214400-2.gloveboxitems
CREATE TABLE IF NOT EXISTS `gloveboxitems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plate` varchar(255) NOT NULL DEFAULT '[]',
  `items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`plate`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Volcando datos para la tabla zap1214400-2.gloveboxitems: ~1 rows (aproximadamente)
INSERT INTO `gloveboxitems` (`id`, `plate`, `items`) VALUES
	(1, '05DOY517', '[]'),
	(2, '5SF608JT', '[]');

-- Volcando estructura para tabla zap1214400-2.harmony_cooldown
CREATE TABLE IF NOT EXISTS `harmony_cooldown` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `serial` varchar(25) NOT NULL,
  `metadata` text NOT NULL DEFAULT '{}',
  PRIMARY KEY (`serial`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla zap1214400-2.harmony_cooldown: ~0 rows (aproximadamente)

-- Volcando estructura para tabla zap1214400-2.houselocations
CREATE TABLE IF NOT EXISTS `houselocations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `label` varchar(255) DEFAULT NULL,
  `coords` text DEFAULT NULL,
  `owned` tinyint(2) DEFAULT NULL,
  `houseID` varchar(50) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `tier` text DEFAULT NULL,
  `garage` text DEFAULT NULL,
  `creator` varchar(50) DEFAULT NULL,
  `mlo` text DEFAULT NULL,
  `ipl` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla zap1214400-2.houselocations: ~0 rows (aproximadamente)

-- Volcando estructura para tabla zap1214400-2.house_plants
CREATE TABLE IF NOT EXISTS `house_plants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `building` varchar(50) DEFAULT NULL,
  `stage` varchar(50) DEFAULT 'stage-a',
  `sort` varchar(50) DEFAULT NULL,
  `gender` varchar(50) DEFAULT NULL,
  `food` int(11) DEFAULT 100,
  `health` int(11) DEFAULT 100,
  `progress` int(11) DEFAULT 0,
  `coords` text DEFAULT NULL,
  `plantid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `building` (`building`),
  KEY `plantid` (`plantid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla zap1214400-2.house_plants: ~0 rows (aproximadamente)

-- Volcando estructura para tabla zap1214400-2.inventories
CREATE TABLE IF NOT EXISTS `inventories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(50) NOT NULL,
  `items` longtext DEFAULT '[]',
  PRIMARY KEY (`identifier`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla zap1214400-2.inventories: ~0 rows (aproximadamente)

-- Volcando estructura para tabla zap1214400-2.karma_clothing
CREATE TABLE IF NOT EXISTS `karma_clothing` (
  `id` int(25) NOT NULL AUTO_INCREMENT,
  `cid` int(11) DEFAULT 0,
  `model` varchar(50) NOT NULL DEFAULT '',
  `drawables_texture` text NOT NULL,
  `props_texture` text NOT NULL,
  `hairColor` text NOT NULL,
  `fadeLayer` text DEFAULT '0',
  `customHeadModel` text NOT NULL DEFAULT 'false',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla zap1214400-2.karma_clothing: ~2 rows (aproximadamente)
INSERT INTO `karma_clothing` (`id`, `cid`, `model`, `drawables_texture`, `props_texture`, `hairColor`, `fadeLayer`, `customHeadModel`, `created_at`) VALUES
	(28, 2, '1885233650', '{"Face":[0,0],"Mask":[0,0],"Hair":[0,0],"Torso":[0,0],"Leg":[4,0],"Parachute":[0,0],"Shoes":[1,2],"Accessory":[0,0],"Undershirt":[3,0],"Kevlar":[0,0],"Badge":[0,0],"Jacket":[14,0]}', '{"Hat":[-1,-1],"Glasses":[-1,-1],"Ears":[-1,-1],"Watch":[-1,-1],"Bracelet":[-1,-1]}', '[1,1]', 'null', '"\\"\\\\\\"false\\\\\\"\\""', '2024-07-28 16:43:39'),
	(29, 1, '1885233650', '{"Face":[0,0],"Mask":[0,0],"Hair":[2,0],"Torso":[1,0],"Leg":[4,0],"Parachute":[0,0],"Shoes":[1,0],"Accessory":[0,0],"Undershirt":[1,0],"Kevlar":[0,0],"Badge":[0,0],"Jacket":[4,0]}', '{"Hat":[12,0],"Glasses":[9,0],"Ears":[-1,-1],"Watch":[-1,-1],"Bracelet":[-1,-1]}', '[-1,-1]', 'null', '"\\"false\\""', '2024-07-28 17:09:16');

-- Volcando estructura para tabla zap1214400-2.karma_head_clothing
CREATE TABLE IF NOT EXISTS `karma_head_clothing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL,
  `model` varchar(50) DEFAULT NULL,
  `head_blend` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `head_features` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `head_overlays` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `fade` longtext DEFAULT '""',
  `eye_color` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE,
  CONSTRAINT `head_blend` CHECK (json_valid(`head_blend`)),
  CONSTRAINT `head_features` CHECK (json_valid(`head_features`)),
  CONSTRAINT `head_overlays` CHECK (json_valid(`head_overlays`))
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla zap1214400-2.karma_head_clothing: ~2 rows (aproximadamente)
INSERT INTO `karma_head_clothing` (`id`, `cid`, `model`, `head_blend`, `head_features`, `head_overlays`, `fade`, `eye_color`, `created_at`, `updated_at`) VALUES
	(10, 2, '1885233650', '{"ShapeFirst":0,"ShapeSecond":0,"ShapeThird":0,"SkinFirst":0,"SkinSecond":0,"SkinThird":0,"ShapeMix":0,"SkinMix":0,"ThirdMix":0}', '{"nose_width":0,"nose_peak":0,"nose_length":0,"nose_bone_curveness":0,"nose_tip":0,"nose_bone_twist":0,"eyebrow_up_down":0,"eyebrow_in_out":0,"cheek_bones":0,"cheek_sideways_bone_size":0,"cheek_bones_width":0,"eye_opening":0,"lip_thickness":0,"jaw_bone_width":0,"jaw_bone_shape":0,"chin_bone":0,"chin_bone_length":0,"chin_bone_shape":0,"chin_hole":0,"neck_thickness":0}', '{"Blemishes":{"value":255,"colorType":0,"firstColor":0,"secondColor":0,"opacity":1},"FacialHair":{"value":255,"colorType":1,"firstColor":0,"secondColor":0,"opacity":0},"Eyebrows":{"value":255,"colorType":1,"firstColor":0,"secondColor":0,"opacity":1},"Ageing":{"value":255,"colorType":0,"firstColor":0,"secondColor":0,"opacity":1},"Makeup":{"value":255,"colorType":2,"firstColor":0,"secondColor":0,"opacity":1},"Blush":{"value":255,"colorType":2,"firstColor":0,"secondColor":0,"opacity":1},"Complexion":{"value":255,"colorType":0,"firstColor":0,"secondColor":0,"opacity":1},"SunDamage":{"value":255,"colorType":0,"firstColor":0,"secondColor":0,"opacity":1},"Lipstick":{"value":255,"colorType":2,"firstColor":0,"secondColor":0,"opacity":1},"MolesFreckles":{"value":255,"colorType":0,"firstColor":0,"secondColor":0,"opacity":1},"ChestHair":{"value":255,"colorType":1,"firstColor":0,"secondColor":0,"opacity":1},"BodyBlemishes":{"value":255,"colorType":0,"firstColor":0,"secondColor":0,"opacity":1},"AddBodyBlemishes":{"value":255,"colorType":0,"firstColor":0,"secondColor":0,"opacity":1}}', '""', 0, '2024-07-28 17:10:19', '2024-07-28 17:10:19'),
	(11, 1, '1885233650', '{"ShapeFirst":0,"ShapeSecond":0,"ShapeThird":0,"SkinFirst":0,"SkinSecond":0,"SkinThird":0,"ShapeMix":0,"SkinMix":0,"ThirdMix":0}', '{"nose_width":0,"nose_peak":0,"nose_length":0,"nose_bone_curveness":0,"nose_tip":0,"nose_bone_twist":0,"eyebrow_up_down":0,"eyebrow_in_out":0,"cheek_bones":0,"cheek_sideways_bone_size":0,"cheek_bones_width":0,"eye_opening":0,"lip_thickness":0,"jaw_bone_width":0,"jaw_bone_shape":0,"chin_bone":0,"chin_bone_length":0,"chin_bone_shape":0,"chin_hole":0,"neck_thickness":0}', '{"Blemishes":{"value":0,"colorType":0,"firstColor":0,"secondColor":0,"opacity":0},"FacialHair":{"value":0,"colorType":0,"firstColor":0,"secondColor":0,"opacity":0},"Eyebrows":{"value":0,"colorType":0,"firstColor":0,"secondColor":0,"opacity":0},"Ageing":{"value":0,"colorType":0,"firstColor":0,"secondColor":0,"opacity":0},"Makeup":{"value":0,"colorType":0,"firstColor":0,"secondColor":0,"opacity":0},"Blush":{"value":0,"colorType":0,"firstColor":0,"secondColor":0,"opacity":0},"Complexion":{"value":0,"colorType":0,"firstColor":0,"secondColor":0,"opacity":0},"SunDamage":{"value":0,"colorType":0,"firstColor":0,"secondColor":0,"opacity":0},"Lipstick":{"value":0,"colorType":0,"firstColor":0,"secondColor":0,"opacity":0},"MolesFreckles":{"value":0,"colorType":0,"firstColor":0,"secondColor":0,"opacity":0},"ChestHair":{"value":0,"colorType":0,"firstColor":0,"secondColor":0,"opacity":0},"BodyBlemishes":{"value":0,"colorType":0,"firstColor":0,"secondColor":0,"opacity":0},"AddBodyBlemishes":{"value":0,"colorType":0,"firstColor":0,"secondColor":0,"opacity":0}}', '""', -1, '2024-07-28 17:43:42', '2024-07-28 17:43:42');

-- Volcando estructura para tabla zap1214400-2.karma_outfits
CREATE TABLE IF NOT EXISTS `karma_outfits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `tags` varchar(255) DEFAULT NULL,
  `slot` int(11) DEFAULT NULL,
  `model` varchar(255) DEFAULT NULL,
  `drawables_texture` text DEFAULT NULL,
  `props_texture` text DEFAULT NULL,
  `hairColor` text DEFAULT NULL,
  `fadeLayer` text DEFAULT NULL,
  `customHeadModel` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `unique_cid_slot` (`cid`,`slot`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla zap1214400-2.karma_outfits: ~0 rows (aproximadamente)

-- Volcando estructura para tabla zap1214400-2.lab
CREATE TABLE IF NOT EXISTS `lab` (
  `labname` varchar(50) NOT NULL,
  `code` int(11) NOT NULL,
  PRIMARY KEY (`labname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Volcando datos para la tabla zap1214400-2.lab: ~2 rows (aproximadamente)
INSERT INTO `lab` (`labname`, `code`) VALUES
	('cokelab', 1991),
	('methlab', 1234);

-- Volcando estructura para tabla zap1214400-2.lab_crews
CREATE TABLE IF NOT EXISTS `lab_crews` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `crewName` varchar(50) NOT NULL,
  `crewTag` varchar(50) NOT NULL,
  `crewLeader` varchar(50) NOT NULL,
  `crewMainBase` varchar(50) DEFAULT NULL,
  `crewGrade` longtext NOT NULL DEFAULT '{"Rookie":{"sendAnnounce":false,"crewUseGarage":false,"crewInvite":false,"crewChangeGrade":false,"crewUseInventory":false,"crewSetColour":false,"crewKickMember":false,"setGarage":false,"setInventory":false}}',
  `crewMember` longtext DEFAULT NULL,
  `crewCase` int(11) unsigned NOT NULL DEFAULT 0,
  `crewInventoryCoords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT 'vector3(0,0,0)',
  `crewGarageCoords` varchar(255) NOT NULL DEFAULT 'vector3(0,0,0)',
  `crewInventory` longtext DEFAULT NULL,
  `inventoryPassword` varchar(50) NOT NULL DEFAULT '0000',
  `crewGarage` longtext NOT NULL,
  `garagePassword` varchar(50) NOT NULL DEFAULT '0000',
  `crewColourID` varchar(50) DEFAULT '1',
  `crewColourHex` varchar(50) DEFAULT '0,0,0',
  `crewPlaces` longtext NOT NULL DEFAULT '[]',
  `crewIMG` longtext NOT NULL DEFAULT 'https://cdn.discordapp.com/attachments/938533769210654780/998130701994049606/IMG_4664.png',
  PRIMARY KEY (`id`),
  UNIQUE KEY `crewName` (`crewName`),
  UNIQUE KEY `crewTag` (`crewTag`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla zap1214400-2.lab_crews: ~0 rows (aproximadamente)
INSERT INTO `lab_crews` (`id`, `crewName`, `crewTag`, `crewLeader`, `crewMainBase`, `crewGrade`, `crewMember`, `crewCase`, `crewInventoryCoords`, `crewGarageCoords`, `crewInventory`, `inventoryPassword`, `crewGarage`, `garagePassword`, `crewColourID`, `crewColourHex`, `crewPlaces`, `crewIMG`) VALUES
	(1, 'zap1214400-2', 'zap1214400-2', 'XAJ76238', NULL, '{"Rookie":{"crewChangeGrade":false,"crewUseGarage":false,"crewSetColour":false,"crewInvite":false,"crewKickMember":false,"crewUseInventory":false,"sendAnnounce":false,"setGarage":false,"setInventory":false}}', NULL, 0, 'vector3(0,0,0)', 'vector3(0,0,0)', '[]', '0000', '[]', '0000', '1', '0,0,0', '[]', 'https://cdn.discordapp.com/attachments/645789662593548298/997845962821214239/ab67616d0000b2737bcd3cd54e8399ae38cc6e64.jpg'),
	(2, 'zap1214400-2CREW', 'zap1214400-2AA', 'POU11431', NULL, '{"Rookie":{"crewKickMember":false,"sendAnnounce":false,"crewSetColour":false,"setInventory":false,"crewInvite":false,"setGarage":false,"crewUseGarage":false,"crewUseInventory":false,"crewChangeGrade":false}}', NULL, 0, 'vector3(0,0,0)', 'vector3(0,0,0)', '[]', '0000', '[]', '0000', '1', '0,0,0', '[]', 'https://cdn.discordapp.com/attachments/645789662593548298/997845962821214239/ab67616d0000b2737bcd3cd54e8399ae38cc6e64.jpg');

-- Volcando estructura para tabla zap1214400-2.lab_crew_announcements
CREATE TABLE IF NOT EXISTS `lab_crew_announcements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `crewName` varchar(50) DEFAULT NULL,
  `sender` varchar(50) DEFAULT NULL,
  `announcements` longtext DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  KEY `int` (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla zap1214400-2.lab_crew_announcements: ~0 rows (aproximadamente)

-- Volcando estructura para tabla zap1214400-2.lab_crew_garage
CREATE TABLE IF NOT EXISTS `lab_crew_garage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `crewName` varchar(50) NOT NULL,
  `vehiclePlate` varchar(50) NOT NULL,
  `vehicleLabel` varchar(50) NOT NULL,
  `vehicleModel` varchar(50) DEFAULT NULL,
  `vehicleProperties` longtext NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  UNIQUE KEY `vehiclePlate` (`vehiclePlate`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla zap1214400-2.lab_crew_garage: ~0 rows (aproximadamente)

-- Volcando estructura para tabla zap1214400-2.lab_crew_invites
CREATE TABLE IF NOT EXISTS `lab_crew_invites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `crewName` varchar(50) DEFAULT NULL,
  `targetPlayer` varchar(50) DEFAULT NULL,
  `sender` varchar(50) DEFAULT NULL,
  `sendDate` varchar(50) DEFAULT NULL,
  `sendTime` longtext DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla zap1214400-2.lab_crew_invites: ~0 rows (aproximadamente)

-- Volcando estructura para tabla zap1214400-2.lab_crew_messages
CREATE TABLE IF NOT EXISTS `lab_crew_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `crewName` mediumtext NOT NULL,
  `messages` longtext NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla zap1214400-2.lab_crew_messages: ~0 rows (aproximadamente)

-- Volcando estructura para tabla zap1214400-2.lab_crew_sides
CREATE TABLE IF NOT EXISTS `lab_crew_sides` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `crewName` varchar(50) NOT NULL DEFAULT '',
  `locName` varchar(50) NOT NULL DEFAULT '',
  `x` float(8,4) NOT NULL,
  `y` float(8,4) NOT NULL,
  `z` float(8,4) NOT NULL,
  `rx` float(8,4) NOT NULL,
  `ry` float(8,4) NOT NULL,
  `rz` float(8,4) NOT NULL,
  `scale` float(8,4) unsigned zerofill NOT NULL,
  `text` varchar(32) NOT NULL,
  `font` varchar(32) NOT NULL,
  `color` int(3) NOT NULL,
  `interior` varchar(50) NOT NULL DEFAULT '',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Volcando datos para la tabla zap1214400-2.lab_crew_sides: ~0 rows (aproximadamente)

-- Volcando estructura para tabla zap1214400-2.lab_crew_wars
CREATE TABLE IF NOT EXISTS `lab_crew_wars` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `warSender` varchar(50) DEFAULT NULL,
  `warTarget` varchar(50) DEFAULT NULL,
  `status` varchar(50) NOT NULL DEFAULT 'waiting',
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla zap1214400-2.lab_crew_wars: ~0 rows (aproximadamente)

-- Volcando estructura para tabla zap1214400-2.lab_pet
CREATE TABLE IF NOT EXISTS `lab_pet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `netID` int(11) DEFAULT NULL,
  `petHash` varchar(50) DEFAULT NULL,
  `petTexureID` int(11) DEFAULT NULL,
  `petLeash` varchar(50) DEFAULT NULL,
  `petLeashID` int(11) DEFAULT NULL,
  `petOwner` varchar(50) DEFAULT NULL,
  `petGender` varchar(50) DEFAULT NULL,
  `petName` varchar(50) DEFAULT NULL,
  `petLabel` longtext DEFAULT NULL,
  `hungryDecrase` int(11) DEFAULT NULL,
  `petHungryLevel` int(11) DEFAULT NULL,
  `thirstDecrase` int(11) DEFAULT NULL,
  `petThirstLevel` int(11) DEFAULT NULL,
  `petEnergyLevel` int(11) DEFAULT NULL,
  `petHealthLevel` int(11) DEFAULT NULL,
  `petXP` int(11) DEFAULT NULL,
  `lastXP` int(11) DEFAULT NULL,
  `petLevel` int(11) DEFAULT NULL,
  `petPosition` text DEFAULT NULL,
  `petIMG` longtext DEFAULT NULL,
  `listOf` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `netID` (`netID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla zap1214400-2.lab_pet: ~0 rows (aproximadamente)
INSERT INTO `lab_pet` (`id`, `netID`, `petHash`, `petTexureID`, `petLeash`, `petLeashID`, `petOwner`, `petGender`, `petName`, `petLabel`, `hungryDecrase`, `petHungryLevel`, `thirstDecrase`, `petThirstLevel`, `petEnergyLevel`, `petHealthLevel`, `petXP`, `lastXP`, `petLevel`, `petPosition`, `petIMG`, `listOf`) VALUES
	(1, 8191, 'a_c_shepherd', 2, '0', 0, 'ZRP16935', 'F', 'shepherd', 'The shepherd dog breed is one of the oldest known dog breeds,[1] dating back to the Roman Empire. With their herding and guarding characteristics, they have been the helpers of people in many matters. It is even recognized as the breed that led the flocks of the Roman armies crossing the Alpine mountains and protected the people in the caravan.', 1, 0, 1, 13, 70, 0, 85670, 98571, 33, '{"x":-1388.2021484375,"y":32.66373825073242,"z":53.0380859375}', NULL, 'dog');

-- Volcando estructura para tabla zap1214400-2.lapraces
CREATE TABLE IF NOT EXISTS `lapraces` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `checkpoints` text DEFAULT NULL,
  `records` text DEFAULT NULL,
  `creator` varchar(50) DEFAULT NULL,
  `distance` int(11) DEFAULT NULL,
  `raceid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `raceid` (`raceid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Volcando datos para la tabla zap1214400-2.lapraces: ~0 rows (aproximadamente)

-- Volcando estructura para tabla zap1214400-2.management_funds
CREATE TABLE IF NOT EXISTS `management_funds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_name` varchar(50) NOT NULL,
  `amount` int(100) NOT NULL,
  `type` enum('boss','gang') NOT NULL DEFAULT 'boss',
  PRIMARY KEY (`id`),
  UNIQUE KEY `job_name` (`job_name`),
  KEY `type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla zap1214400-2.management_funds: ~12 rows (aproximadamente)
INSERT INTO `management_funds` (`id`, `job_name`, `amount`, `type`) VALUES
	(1, 'police', 0, 'boss'),
	(2, 'ambulance', 0, 'boss'),
	(3, 'realestate', 0, 'boss'),
	(4, 'taxi', 0, 'boss'),
	(5, 'cardealer', 0, 'boss'),
	(6, 'mechanic', 0, 'boss'),
	(7, 'lostmc', 0, 'gang'),
	(8, 'ballas', 0, 'gang'),
	(9, 'vagos', 0, 'gang'),
	(10, 'cartel', 0, 'gang'),
	(11, 'families', 0, 'gang'),
	(12, 'triads', 0, 'gang');

-- Volcando estructura para tabla zap1214400-2.mdt_bolos
CREATE TABLE IF NOT EXISTS `mdt_bolos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author` varchar(50) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `plate` varchar(50) DEFAULT NULL,
  `owner` varchar(50) DEFAULT NULL,
  `individual` varchar(50) DEFAULT NULL,
  `detail` text DEFAULT NULL,
  `tags` text DEFAULT NULL,
  `gallery` text DEFAULT NULL,
  `officersinvolved` text DEFAULT NULL,
  `time` varchar(20) DEFAULT NULL,
  `jobtype` varchar(25) NOT NULL DEFAULT 'police',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla zap1214400-2.mdt_bolos: ~0 rows (aproximadamente)

-- Volcando estructura para tabla zap1214400-2.mdt_bulletin
CREATE TABLE IF NOT EXISTS `mdt_bulletin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text NOT NULL,
  `desc` text NOT NULL,
  `author` varchar(50) NOT NULL,
  `time` varchar(20) NOT NULL,
  `jobtype` varchar(25) DEFAULT 'police',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla zap1214400-2.mdt_bulletin: ~0 rows (aproximadamente)
INSERT INTO `mdt_bulletin` (`id`, `title`, `desc`, `author`, `time`, `jobtype`) VALUES
	(1, '', 'ewdw', 'wdw dwdwdw', '1721169911799', 'ambulance');

-- Volcando estructura para tabla zap1214400-2.mdt_clocking
CREATE TABLE IF NOT EXISTS `mdt_clocking` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(50) NOT NULL DEFAULT '',
  `firstname` varchar(255) NOT NULL DEFAULT '',
  `lastname` varchar(255) NOT NULL DEFAULT '',
  `clock_in_time` varchar(255) NOT NULL DEFAULT '',
  `clock_out_time` varchar(50) DEFAULT NULL,
  `total_time` int(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (`user_id`) USING BTREE,
  KEY `id` (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla zap1214400-2.mdt_clocking: ~0 rows (aproximadamente)

-- Volcando estructura para tabla zap1214400-2.mdt_convictions
CREATE TABLE IF NOT EXISTS `mdt_convictions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` varchar(50) DEFAULT NULL,
  `linkedincident` int(11) NOT NULL DEFAULT 0,
  `warrant` varchar(50) DEFAULT NULL,
  `guilty` varchar(50) DEFAULT NULL,
  `processed` varchar(50) DEFAULT NULL,
  `associated` varchar(50) DEFAULT '0',
  `charges` text DEFAULT NULL,
  `fine` int(11) DEFAULT 0,
  `sentence` int(11) DEFAULT 0,
  `recfine` int(11) DEFAULT 0,
  `recsentence` int(11) DEFAULT 0,
  `time` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla zap1214400-2.mdt_convictions: ~0 rows (aproximadamente)

-- Volcando estructura para tabla zap1214400-2.mdt_data
CREATE TABLE IF NOT EXISTS `mdt_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` varchar(20) NOT NULL,
  `information` mediumtext DEFAULT NULL,
  `tags` text NOT NULL,
  `gallery` text NOT NULL,
  `jobtype` varchar(25) DEFAULT 'police',
  `pfp` text DEFAULT NULL,
  `fingerprint` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`cid`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla zap1214400-2.mdt_data: ~0 rows (aproximadamente)

-- Volcando estructura para tabla zap1214400-2.mdt_impound
CREATE TABLE IF NOT EXISTS `mdt_impound` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicleid` int(11) NOT NULL,
  `linkedreport` int(11) NOT NULL,
  `fee` int(11) DEFAULT NULL,
  `time` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla zap1214400-2.mdt_impound: ~0 rows (aproximadamente)

-- Volcando estructura para tabla zap1214400-2.mdt_incidents
CREATE TABLE IF NOT EXISTS `mdt_incidents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author` varchar(50) NOT NULL DEFAULT '',
  `title` varchar(50) NOT NULL DEFAULT '0',
  `details` text NOT NULL,
  `tags` text NOT NULL,
  `officersinvolved` text NOT NULL,
  `civsinvolved` text NOT NULL,
  `evidence` text NOT NULL,
  `time` varchar(20) DEFAULT NULL,
  `jobtype` varchar(25) NOT NULL DEFAULT 'police',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla zap1214400-2.mdt_incidents: ~0 rows (aproximadamente)

-- Volcando estructura para tabla zap1214400-2.mdt_logs
CREATE TABLE IF NOT EXISTS `mdt_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` text NOT NULL,
  `time` varchar(20) DEFAULT NULL,
  `jobtype` varchar(25) DEFAULT 'police',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla zap1214400-2.mdt_logs: ~0 rows (aproximadamente)
INSERT INTO `mdt_logs` (`id`, `text`, `time`, `jobtype`) VALUES
	(1, 'A new bulletin was added by wdw dwdwdw with the title: !', '1721169911000', 'police');

-- Volcando estructura para tabla zap1214400-2.mdt_reports
CREATE TABLE IF NOT EXISTS `mdt_reports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author` varchar(50) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `details` text DEFAULT NULL,
  `tags` text DEFAULT NULL,
  `officersinvolved` text DEFAULT NULL,
  `civsinvolved` text DEFAULT NULL,
  `gallery` text DEFAULT NULL,
  `time` varchar(20) DEFAULT NULL,
  `jobtype` varchar(25) DEFAULT 'police',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla zap1214400-2.mdt_reports: ~0 rows (aproximadamente)

-- Volcando estructura para tabla zap1214400-2.mdt_vehicleinfo
CREATE TABLE IF NOT EXISTS `mdt_vehicleinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plate` varchar(50) DEFAULT NULL,
  `information` text NOT NULL DEFAULT '',
  `stolen` tinyint(1) NOT NULL DEFAULT 0,
  `code5` tinyint(1) NOT NULL DEFAULT 0,
  `image` text NOT NULL DEFAULT '',
  `points` int(11) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla zap1214400-2.mdt_vehicleinfo: ~0 rows (aproximadamente)

-- Volcando estructura para tabla zap1214400-2.mdt_weaponinfo
CREATE TABLE IF NOT EXISTS `mdt_weaponinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `serial` varchar(50) DEFAULT NULL,
  `owner` varchar(50) DEFAULT NULL,
  `information` text NOT NULL DEFAULT '',
  `weapClass` varchar(50) DEFAULT NULL,
  `weapModel` varchar(50) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `serial` (`serial`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla zap1214400-2.mdt_weaponinfo: ~0 rows (aproximadamente)

-- Volcando estructura para tabla zap1214400-2.multichars_slots
CREATE TABLE IF NOT EXISTS `multichars_slots` (
  `identifier` varchar(60) NOT NULL,
  `slots` int(11) NOT NULL,
  PRIMARY KEY (`identifier`) USING BTREE,
  KEY `slots` (`slots`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla zap1214400-2.multichars_slots: ~0 rows (aproximadamente)

-- Volcando estructura para tabla zap1214400-2.multijobs
CREATE TABLE IF NOT EXISTS `multijobs` (
  `citizenid` varchar(100) NOT NULL,
  `jobdata` text DEFAULT NULL,
  PRIMARY KEY (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Volcando datos para la tabla zap1214400-2.multijobs: ~0 rows (aproximadamente)

-- Volcando estructura para tabla zap1214400-2.nchub_containers
CREATE TABLE IF NOT EXISTS `nchub_containers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `random_id` varchar(50) NOT NULL,
  `container_type` varchar(50) NOT NULL,
  `owner_citizenid` varchar(50) DEFAULT NULL,
  `password` char(60) DEFAULT NULL,
  `position` text DEFAULT NULL,
  `zone` varchar(50) DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 1,
  `deleted_by` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `random_id` (`random_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla zap1214400-2.nchub_containers: ~0 rows (aproximadamente)

-- Volcando estructura para tabla zap1214400-2.nchub_containers_access_log
CREATE TABLE IF NOT EXISTS `nchub_containers_access_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `random_id` varchar(50) NOT NULL,
  `citizenid` varchar(50) DEFAULT NULL,
  `action` varchar(50) DEFAULT NULL,
  `metadata` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `random_id` (`random_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla zap1214400-2.nchub_containers_access_log: ~0 rows (aproximadamente)

-- Volcando estructura para tabla zap1214400-2.nchub_delivery_employees
CREATE TABLE IF NOT EXISTS `nchub_delivery_employees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(64) NOT NULL,
  `profile` varchar(32) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `exp` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla zap1214400-2.nchub_delivery_employees: ~18 rows (aproximadamente)
INSERT INTO `nchub_delivery_employees` (`id`, `user`, `profile`, `level`, `exp`, `created_at`, `updated_at`) VALUES
	(1, 'NWG45939', 'profile_1', 1, 0, '2024-07-16 10:18:23', '2024-07-16 10:18:23'),
	(2, 'ZWO74305', 'profile_1', 1, 0, '2024-07-16 12:04:02', '2024-07-16 12:04:02'),
	(3, 'ZRP16935', 'profile_1', 1, 0, '2024-07-16 13:55:01', '2024-07-16 13:55:01'),
	(4, 'MTS42741', 'profile_1', 1, 0, '2024-07-17 20:36:14', '2024-07-17 20:36:14'),
	(5, 'OYD43612', 'profile_1', 1, 0, '2024-07-25 12:10:43', '2024-07-25 12:10:43'),
	(6, 'PAJ62435', 'profile_1', 1, 0, '2024-07-25 12:42:13', '2024-07-25 12:42:13'),
	(7, 'XAJ76238', 'profile_1', 1, 0, '2024-07-25 12:46:17', '2024-07-25 12:46:17'),
	(8, 'SAX44932', 'profile_1', 1, 0, '2024-07-25 22:06:44', '2024-07-25 22:06:44'),
	(9, 'POU11431', 'profile_1', 1, 0, '2024-07-25 22:11:06', '2024-07-25 22:11:06'),
	(10, 'SRG34852', 'profile_1', 1, 0, '2024-07-25 22:21:46', '2024-07-25 22:21:46'),
	(11, 'GNA74624', 'profile_1', 1, 0, '2024-07-25 22:25:32', '2024-07-25 22:25:32'),
	(12, 'IEW99125', 'profile_1', 1, 0, '2024-07-25 22:27:57', '2024-07-25 22:27:57'),
	(13, 'ZFQ53507', 'profile_1', 1, 0, '2024-07-28 11:45:39', '2024-07-28 11:45:39'),
	(14, 'KMR55667', 'profile_1', 1, 0, '2024-07-28 11:50:04', '2024-07-28 11:50:04'),
	(15, 'PIR50196', 'profile_1', 1, 0, '2024-07-28 12:15:32', '2024-07-28 12:15:32'),
	(16, 'XRP80046', 'profile_1', 1, 0, '2024-07-28 15:58:49', '2024-07-28 15:58:49'),
	(17, 'OTP90615', 'profile_1', 1, 0, '2024-07-28 16:03:44', '2024-07-28 16:03:44'),
	(18, 'DMI50978', 'profile_1', 1, 0, '2024-07-28 16:08:47', '2024-07-28 16:08:47'),
	(19, 'SVB88291', 'profile_1', 1, 0, '2024-07-28 17:09:40', '2024-07-28 17:09:40');

-- Volcando estructura para tabla zap1214400-2.nc_head_clothing
CREATE TABLE IF NOT EXISTS `nc_head_clothing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL,
  `model` varchar(50) DEFAULT NULL,
  `head_blend` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `head_features` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `head_overlays` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `fade` longtext DEFAULT '""',
  `eye_color` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE,
  CONSTRAINT `head_blend` CHECK (json_valid(`head_blend`)),
  CONSTRAINT `head_features` CHECK (json_valid(`head_features`)),
  CONSTRAINT `head_overlays` CHECK (json_valid(`head_overlays`))
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla zap1214400-2.nc_head_clothing: ~0 rows (aproximadamente)

-- Volcando estructura para tabla zap1214400-2.nc_vehicleshop_showroom_vehicles
CREATE TABLE IF NOT EXISTS `nc_vehicleshop_showroom_vehicles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dealershipId` int(11) DEFAULT NULL,
  `data` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Volcando datos para la tabla zap1214400-2.nc_vehicleshop_showroom_vehicles: ~0 rows (aproximadamente)

-- Volcando estructura para tabla zap1214400-2.nc_vehicleshop_stocks
CREATE TABLE IF NOT EXISTS `nc_vehicleshop_stocks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dealershipId` int(11) DEFAULT NULL,
  `data` longtext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Volcando datos para la tabla zap1214400-2.nc_vehicleshop_stocks: ~0 rows (aproximadamente)

-- Volcando estructura para tabla zap1214400-2.npwd_calls
CREATE TABLE IF NOT EXISTS `npwd_calls` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(48) DEFAULT NULL,
  `transmitter` varchar(255) NOT NULL,
  `receiver` varchar(255) NOT NULL,
  `is_accepted` tinyint(4) DEFAULT 0,
  `start` varchar(255) DEFAULT NULL,
  `end` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `identifier` (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla zap1214400-2.npwd_calls: ~0 rows (aproximadamente)

-- Volcando estructura para tabla zap1214400-2.npwd_crypto_transactions
CREATE TABLE IF NOT EXISTS `npwd_crypto_transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(20) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `amount` float DEFAULT NULL,
  `worth` float DEFAULT NULL,
  `sentTo` varchar(20) DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla zap1214400-2.npwd_crypto_transactions: ~0 rows (aproximadamente)

-- Volcando estructura para tabla zap1214400-2.npwd_darkchat_channels
CREATE TABLE IF NOT EXISTS `npwd_darkchat_channels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channel_identifier` varchar(255) NOT NULL,
  `label` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `darkchat_channels_channel_identifier_uindex` (`channel_identifier`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla zap1214400-2.npwd_darkchat_channels: ~0 rows (aproximadamente)

-- Volcando estructura para tabla zap1214400-2.npwd_darkchat_channel_members
CREATE TABLE IF NOT EXISTS `npwd_darkchat_channel_members` (
  `channel_id` int(11) NOT NULL,
  `user_identifier` varchar(255) NOT NULL,
  `is_owner` tinyint(4) NOT NULL DEFAULT 0,
  KEY `npwd_darkchat_channel_members_npwd_darkchat_channels_id_fk` (`channel_id`) USING BTREE,
  CONSTRAINT `npwd_darkchat_channel_members_npwd_darkchat_channels_id_fk` FOREIGN KEY (`channel_id`) REFERENCES `npwd_darkchat_channels` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla zap1214400-2.npwd_darkchat_channel_members: ~0 rows (aproximadamente)

-- Volcando estructura para tabla zap1214400-2.npwd_darkchat_messages
CREATE TABLE IF NOT EXISTS `npwd_darkchat_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channel_id` int(11) NOT NULL,
  `message` varchar(255) NOT NULL,
  `user_identifier` varchar(255) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `is_image` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `darkchat_messages_darkchat_channels_id_fk` (`channel_id`) USING BTREE,
  CONSTRAINT `darkchat_messages_darkchat_channels_id_fk` FOREIGN KEY (`channel_id`) REFERENCES `npwd_darkchat_channels` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla zap1214400-2.npwd_darkchat_messages: ~0 rows (aproximadamente)

-- Volcando estructura para tabla zap1214400-2.npwd_marketplace_listings
CREATE TABLE IF NOT EXISTS `npwd_marketplace_listings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(48) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `number` varchar(255) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `description` varchar(255) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `reported` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `identifier` (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla zap1214400-2.npwd_marketplace_listings: ~0 rows (aproximadamente)

-- Volcando estructura para tabla zap1214400-2.npwd_match_profiles
CREATE TABLE IF NOT EXISTS `npwd_match_profiles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(48) NOT NULL,
  `name` varchar(90) NOT NULL,
  `image` varchar(255) NOT NULL,
  `bio` varchar(512) DEFAULT NULL,
  `location` varchar(45) DEFAULT NULL,
  `job` varchar(45) DEFAULT NULL,
  `tags` varchar(255) NOT NULL DEFAULT '',
  `voiceMessage` varchar(512) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `identifier_UNIQUE` (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla zap1214400-2.npwd_match_profiles: ~0 rows (aproximadamente)

-- Volcando estructura para tabla zap1214400-2.npwd_match_views
CREATE TABLE IF NOT EXISTS `npwd_match_views` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(48) NOT NULL,
  `profile` int(11) NOT NULL,
  `liked` tinyint(4) DEFAULT 0,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `match_profile_idx` (`profile`),
  KEY `identifier` (`identifier`),
  CONSTRAINT `match_profile` FOREIGN KEY (`profile`) REFERENCES `npwd_match_profiles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla zap1214400-2.npwd_match_views: ~0 rows (aproximadamente)

-- Volcando estructura para tabla zap1214400-2.npwd_messages
CREATE TABLE IF NOT EXISTS `npwd_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` varchar(512) NOT NULL,
  `user_identifier` varchar(48) NOT NULL,
  `conversation_id` varchar(512) NOT NULL,
  `isRead` tinyint(4) NOT NULL DEFAULT 0,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `visible` tinyint(4) NOT NULL DEFAULT 1,
  `author` varchar(255) NOT NULL,
  `is_embed` tinyint(4) NOT NULL DEFAULT 0,
  `embed` varchar(512) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `user_identifier` (`user_identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla zap1214400-2.npwd_messages: ~0 rows (aproximadamente)

-- Volcando estructura para tabla zap1214400-2.npwd_messages_conversations
CREATE TABLE IF NOT EXISTS `npwd_messages_conversations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `conversation_list` varchar(225) NOT NULL,
  `label` varchar(60) DEFAULT '',
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_message_id` int(11) DEFAULT NULL,
  `is_group_chat` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla zap1214400-2.npwd_messages_conversations: ~0 rows (aproximadamente)

-- Volcando estructura para tabla zap1214400-2.npwd_messages_participants
CREATE TABLE IF NOT EXISTS `npwd_messages_participants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `conversation_id` int(11) NOT NULL,
  `participant` varchar(225) NOT NULL,
  `unread_count` int(11) DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `message_participants_npwd_messages_conversations_id_fk` (`conversation_id`) USING BTREE,
  CONSTRAINT `message_participants_npwd_messages_conversations_id_fk` FOREIGN KEY (`conversation_id`) REFERENCES `npwd_messages_conversations` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla zap1214400-2.npwd_messages_participants: ~0 rows (aproximadamente)

-- Volcando estructura para tabla zap1214400-2.npwd_notes
CREATE TABLE IF NOT EXISTS `npwd_notes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(48) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `identifier` (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla zap1214400-2.npwd_notes: ~0 rows (aproximadamente)

-- Volcando estructura para tabla zap1214400-2.npwd_phone_contacts
CREATE TABLE IF NOT EXISTS `npwd_phone_contacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(48) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `number` varchar(20) DEFAULT NULL,
  `display` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `identifier` (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla zap1214400-2.npwd_phone_contacts: ~0 rows (aproximadamente)

-- Volcando estructura para tabla zap1214400-2.npwd_phone_gallery
CREATE TABLE IF NOT EXISTS `npwd_phone_gallery` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(48) DEFAULT NULL,
  `image` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `identifier` (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla zap1214400-2.npwd_phone_gallery: ~0 rows (aproximadamente)

-- Volcando estructura para tabla zap1214400-2.npwd_twitter_likes
CREATE TABLE IF NOT EXISTS `npwd_twitter_likes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `profile_id` int(11) NOT NULL,
  `tweet_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_combination` (`profile_id`,`tweet_id`),
  KEY `profile_idx` (`profile_id`),
  KEY `tweet_idx` (`tweet_id`),
  CONSTRAINT `profile` FOREIGN KEY (`profile_id`) REFERENCES `npwd_twitter_profiles` (`id`),
  CONSTRAINT `tweet` FOREIGN KEY (`tweet_id`) REFERENCES `npwd_twitter_tweets` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla zap1214400-2.npwd_twitter_likes: ~0 rows (aproximadamente)

-- Volcando estructura para tabla zap1214400-2.npwd_twitter_profiles
CREATE TABLE IF NOT EXISTS `npwd_twitter_profiles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `profile_name` varchar(90) NOT NULL,
  `identifier` varchar(48) NOT NULL,
  `avatar_url` varchar(255) DEFAULT 'https://i.file.glass/QrEvq.png',
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `profile_name_UNIQUE` (`profile_name`),
  KEY `identifier` (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla zap1214400-2.npwd_twitter_profiles: ~0 rows (aproximadamente)

-- Volcando estructura para tabla zap1214400-2.npwd_twitter_reports
CREATE TABLE IF NOT EXISTS `npwd_twitter_reports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `profile_id` int(11) NOT NULL,
  `tweet_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_combination` (`profile_id`,`tweet_id`),
  KEY `profile_idx` (`profile_id`),
  KEY `tweet_idx` (`tweet_id`),
  CONSTRAINT `report_profile` FOREIGN KEY (`profile_id`) REFERENCES `npwd_twitter_profiles` (`id`),
  CONSTRAINT `report_tweet` FOREIGN KEY (`tweet_id`) REFERENCES `npwd_twitter_tweets` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla zap1214400-2.npwd_twitter_reports: ~0 rows (aproximadamente)

-- Volcando estructura para tabla zap1214400-2.npwd_twitter_tweets
CREATE TABLE IF NOT EXISTS `npwd_twitter_tweets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` varchar(1000) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `likes` int(11) NOT NULL DEFAULT 0,
  `identifier` varchar(48) NOT NULL,
  `visible` tinyint(4) NOT NULL DEFAULT 1,
  `images` varchar(1000) DEFAULT '',
  `retweet` int(11) DEFAULT NULL,
  `profile_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `npwd_twitter_tweets_npwd_twitter_profiles_id_fk` (`profile_id`) USING BTREE,
  CONSTRAINT `npwd_twitter_tweets_npwd_twitter_profiles_id_fk` FOREIGN KEY (`profile_id`) REFERENCES `npwd_twitter_profiles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla zap1214400-2.npwd_twitter_tweets: ~0 rows (aproximadamente)

-- Volcando estructura para tabla zap1214400-2.objects
CREATE TABLE IF NOT EXISTS `objects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `model` varchar(50) NOT NULL,
  `coords` varchar(255) NOT NULL,
  `type` varchar(50) DEFAULT NULL,
  `options` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`options`)),
  `name` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla zap1214400-2.objects: ~0 rows (aproximadamente)

-- Volcando estructura para tabla zap1214400-2.occasion_vehicles
CREATE TABLE IF NOT EXISTS `occasion_vehicles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `seller` varchar(50) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `plate` varchar(50) DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `mods` text DEFAULT NULL,
  `occasionid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `occasionId` (`occasionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Volcando datos para la tabla zap1214400-2.occasion_vehicles: ~0 rows (aproximadamente)

-- Volcando estructura para tabla zap1214400-2.ox_doorlock
CREATE TABLE IF NOT EXISTS `ox_doorlock` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `data` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=364 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla zap1214400-2.ox_doorlock: ~259 rows (aproximadamente)
INSERT INTO `ox_doorlock` (`id`, `name`, `data`) VALUES
	(26, 'boomerrangstreet boomerrangstreet4', '{"maxDistance":2.0,"coords":{"x":519.5894165039063,"y":240.06243896484376,"z":105.0416030883789},"hideUi":false,"state":1,"heading":340,"lockpick":true,"model":1042741067}'),
	(27, 'boomerrangstreet boomerrangstreet2', '{"maxDistance":6.0,"coords":{"x":466.79522705078127,"y":267.3243713378906,"z":102.04940795898438},"hideUi":false,"auto":true,"state":1,"heading":160,"lockpick":true,"model":853115216}'),
	(28, 'boomerrangstreet boomerrangstreet3', '{"maxDistance":2.0,"coords":{"x":471.2550964355469,"y":222.88815307617188,"z":105.04899597167969},"hideUi":false,"state":1,"heading":70,"lockpick":true,"model":1042741067}'),
	(29, 'boomerrangstreet boomerrangstreet5', '{"maxDistance":2.0,"coords":{"x":533.6976318359375,"y":200.16090393066407,"z":105.04899597167969},"hideUi":false,"state":1,"heading":70,"lockpick":true,"model":1042741067}'),
	(30, 'boomerrangstreet boomerrangstreet1', '{"maxDistance":6.0,"coords":{"x":409.9648132324219,"y":227.53330993652345,"z":102.20301818847656},"hideUi":false,"auto":true,"state":1,"heading":250,"lockpick":true,"model":853115216}'),
	(31, 'casino casino1', '{"maxDistance":6.0,"coords":{"x":1084.125732421875,"y":-2289.243408203125,"z":31.1184139251709},"groups":{"casino":0},"hideUi":false,"auto":true,"state":1,"heading":86,"lockpick":true,"model":-1618309597}'),
	(32, 'casino casino12', '{"maxDistance":2.0,"coords":{"x":1076.90771484375,"y":-2304.09765625,"z":24.58631324768066},"groups":{"casino":0},"hideUi":false,"state":1,"heading":85,"lockpick":true,"model":-1230442770}'),
	(33, 'casino casino4', '{"maxDistance":2.5,"coords":{"x":1059.40087890625,"y":-2307.310546875,"z":30.61402130126953},"groups":{"casino":0},"hideUi":false,"state":1,"lockpick":true,"doors":[{"heading":176,"model":946049566,"coords":{"x":1060.476806640625,"y":-2307.3857421875,"z":30.61402130126953}},{"heading":176,"model":1330036708,"coords":{"x":1058.3250732421876,"y":-2307.2353515625,"z":30.61402130126953}}]}'),
	(34, 'casino casino6', '{"maxDistance":2.5,"coords":{"x":1076.129150390625,"y":-2311.8212890625,"z":24.64148902893066},"groups":{"casino":0},"hideUi":false,"state":1,"lockpick":true,"doors":[{"heading":266,"model":1560632161,"coords":{"x":1076.22412109375,"y":-2310.46435546875,"z":24.64148902893066}},{"heading":266,"model":-813416359,"coords":{"x":1076.0343017578126,"y":-2313.178466796875,"z":24.64148902893066}}]}'),
	(35, 'casino casino10', '{"maxDistance":2.0,"coords":{"x":1099.090087890625,"y":-2297.871337890625,"z":24.81377220153808},"groups":{"casino":0},"hideUi":false,"state":1,"heading":356,"lockpick":true,"model":-185103545}'),
	(36, 'casino casino5', '{"maxDistance":2.5,"coords":{"x":1067.374755859375,"y":-2311.1259765625,"z":24.62066459655761},"groups":{"casino":0},"hideUi":false,"state":1,"lockpick":true,"doors":[{"heading":265,"model":-1989765534,"coords":{"x":1067.4766845703126,"y":-2309.82958984375,"z":24.62066459655761}},{"heading":266,"model":-431854123,"coords":{"x":1067.272705078125,"y":-2312.42236328125,"z":24.62066459655761}}]}'),
	(37, 'casino casino3', '{"maxDistance":2.5,"coords":{"x":1059.8818359375,"y":-2300.7490234375,"z":30.66965293884277},"groups":{"casino":0},"hideUi":false,"state":1,"lockpick":true,"doors":[{"heading":176,"model":-1429375248,"coords":{"x":1061.17529296875,"y":-2300.83935546875,"z":30.66965293884277}},{"heading":176,"model":714733195,"coords":{"x":1058.5885009765626,"y":-2300.658447265625,"z":30.66965293884277}}]}'),
	(38, 'casino casino2', '{"maxDistance":6.0,"coords":{"x":1083.2554931640626,"y":-2300.319580078125,"z":31.11460876464843},"groups":{"casino":0},"hideUi":false,"auto":true,"state":1,"heading":86,"lockpick":true,"model":-1618309597}'),
	(39, 'casino casino11', '{"maxDistance":2.0,"coords":{"x":1093.730224609375,"y":-2306.493896484375,"z":24.54071998596191},"groups":{"casino":0},"hideUi":false,"state":1,"heading":266,"lockpick":true,"model":452874391}'),
	(40, 'casino casino7', '{"maxDistance":2.0,"coords":{"x":1108.846435546875,"y":-2310.432861328125,"z":24.60752296447754},"groups":{"casino":0},"hideUi":false,"state":1,"heading":175,"lockpick":true,"model":2088680867}'),
	(41, 'casino casino9', '{"maxDistance":2.0,"coords":{"x":1115.7542724609376,"y":-2299.06884765625,"z":24.58684921264648},"groups":{"casino":0},"hideUi":false,"state":1,"heading":355,"lockpick":true,"model":-1421582160}'),
	(42, 'casino casino8', '{"maxDistance":2.0,"coords":{"x":1119.1680908203126,"y":-2303.559814453125,"z":24.58935356140136},"groups":{"casino":0},"hideUi":false,"state":1,"heading":85,"lockpick":true,"model":-1207991715}'),
	(43, 'catcafe catcafe7', '{"state":1,"coords":{"x":-600.8735961914063,"y":-1055.781982421875,"z":22.71302795410156},"heading":270,"maxDistance":2,"groups":{"uwu":0},"lockpick":true,"model":1099436502}'),
	(44, 'catcafe catcafe6', '{"auto":true,"state":1,"coords":{"x":-600.9105834960938,"y":-1059.2176513671876,"z":21.72143173217773},"heading":270,"maxDistance":6,"groups":{"uwu":0},"lockpick":true,"model":522844070}'),
	(45, 'catcafe catcafe5', '{"state":1,"coords":{"x":-593.1278076171875,"y":-1056.09130859375,"z":22.41300582885742},"heading":0,"maxDistance":2,"groups":{"uwu":0},"lockpick":true,"model":-60871655}'),
	(46, 'catcafe catcafe2', '{"state":1,"coords":{"x":-587.340087890625,"y":-1052.553466796875,"z":22.41300582885742},"heading":90,"maxDistance":2,"groups":{"uwu":0},"lockpick":true,"model":-1283712428}'),
	(47, 'catcafe catcafe4', '{"maxDistance":2.0,"coords":{"x":-594.4122924804688,"y":-1049.7686767578126,"z":22.49712753295898},"groups":{"catcafe":0},"hideUi":false,"state":1,"heading":90,"lockpick":true,"model":2089009131}'),
	(48, 'catcafe catcafe3', '{"state":1,"coords":{"x":-572.4244995117188,"y":-1057.388427734375,"z":26.76796531677246},"heading":0,"maxDistance":2,"groups":{"uwu":0},"lockpick":true,"model":2089009131}'),
	(49, 'catcafe catcafe1', '{"doors":[{"heading":0,"model":-69331849,"coords":{"x":-580.361083984375,"y":-1069.627197265625,"z":22.48974800109863}},{"heading":0,"model":526179188,"coords":{"x":-581.6677856445313,"y":-1069.627197265625,"z":22.48974800109863}}],"state":1,"coords":{"x":-581.014404296875,"y":-1069.627197265625,"z":22.48974800109863},"maxDistance":2.5,"groups":{"uwu":0},"lockpick":true}'),
	(50, 'CATCAFEBATH CATCAFEBATH1', '{"state":1,"coords":{"x":-570.6216430664063,"y":-1052.5565185546876,"z":22.41300582885742},"heading":270,"maxDistance":2,"groups":{"uwu":0},"lockpick":true,"model":1717323416}'),
	(51, 'changstreet changstreet1', '{"maxDistance":6.0,"coords":{"x":-666.8790283203125,"y":-889.5230102539063,"z":23.53174018859863},"hideUi":false,"auto":true,"state":1,"heading":90,"lockpick":true,"model":-1603817716}'),
	(52, 'changstreet changstreet3', '{"maxDistance":6.0,"coords":{"x":-675.3309936523438,"y":-878.72216796875,"z":25.23844337463379},"hideUi":false,"auto":true,"state":1,"heading":270,"lockpick":true,"model":245838764}'),
	(53, 'changstreet changstreet2', '{"maxDistance":2.0,"coords":{"x":-674.4851684570313,"y":-896.2799682617188,"z":24.6669864654541},"hideUi":false,"state":1,"heading":0,"lockpick":true,"model":-517883343}'),
	(68, 'coolbeans coolbeans5', '{"maxDistance":2.5,"coords":{"x":-1206.0234375,"y":-1134.07177734375,"z":8.09148788452148},"groups":{"coolbeans":0},"hideUi":false,"state":1,"lockpick":true,"doors":[{"heading":290,"model":1963114394,"coords":{"x":-1205.6744384765626,"y":-1135.030517578125,"z":8.09148788452148}},{"heading":110,"model":1963114394,"coords":{"x":-1206.372314453125,"y":-1133.113037109375,"z":8.09148788452148}}]}'),
	(69, 'coolbeans coolbeans2', '{"maxDistance":2.0,"coords":{"x":-1194.2764892578126,"y":-1137.9267578125,"z":8.0027961730957},"groups":{"coolbeans":0},"hideUi":false,"state":1,"heading":20,"lockpick":true,"model":-470980178}'),
	(70, 'coolbeans coolbeans3', '{"maxDistance":2.0,"coords":{"x":-1189.028076171875,"y":-1136.91552734375,"z":8.00532817840576},"groups":{"coolbeans":0},"hideUi":false,"state":1,"heading":110,"lockpick":true,"model":-470980178}'),
	(71, 'coolbeans coolbeans4', '{"maxDistance":2.0,"coords":{"x":-1189.33837890625,"y":-1139.3751220703126,"z":8.00532817840576},"groups":{"coolbeans":0},"hideUi":false,"state":1,"heading":20,"lockpick":true,"model":2137721}'),
	(72, 'coolbeans coolbeans1', '{"maxDistance":2.0,"coords":{"x":-1196.783447265625,"y":-1139.7423095703126,"z":8.00532817840576},"groups":{"coolbeans":0},"hideUi":false,"state":1,"heading":110,"lockpick":true,"model":-470980178}'),
	(73, 'coolbeans coolbeans6', '{"maxDistance":2.5,"coords":{"x":-1196.5858154296876,"y":-1130.564697265625,"z":8.09148788452148},"groups":{"coolbeans":0},"hideUi":false,"state":1,"lockpick":true,"doors":[{"heading":290,"model":1145438743,"coords":{"x":-1196.223388671875,"y":-1131.560546875,"z":8.09148788452148}},{"heading":110,"model":1145438743,"coords":{"x":-1196.9482421875,"y":-1129.56884765625,"z":8.09148788452148}}]}'),
	(74, 'donttouchthisdoor donttouchthisdoor', '{"maxDistance":2.0,"coords":{"x":1779.84228515625,"y":2507.663818359375,"z":45.97626113891601},"groups":{"shumjob":0},"hideUi":false,"state":1,"heading":30,"lockpick":true,"model":-1033001619}'),
	(75, 'donttouchthisdoor donttouchthisdoor2', '{"maxDistance":2.0,"coords":{"x":1782.8797607421876,"y":2498.365478515625,"z":50.57926177978515},"groups":{"shumjob":0},"hideUi":false,"state":1,"heading":300,"lockpick":true,"model":-1033001619}'),
	(76, 'eveentarrmy eveentarrmy1', '{"maxDistance":9.0,"coords":{"x":942.552001953125,"y":2435.81591796875,"z":47.32500076293945},"groups":{"police":0},"hideUi":false,"auto":true,"state":1,"heading":170,"lockpick":true,"model":2134625624}'),
	(77, 'eveentarrmy eveentarrmy4', '{"maxDistance":2.5,"coords":{"x":947.5579223632813,"y":2444.3994140625,"z":46.4683609008789},"groups":{"police":0},"hideUi":false,"state":1,"lockpick":true,"doors":[{"heading":176,"model":1447557555,"coords":{"x":947.6393432617188,"y":2445.443359375,"z":46.4683609008789}},{"heading":356,"model":1447557555,"coords":{"x":947.4765014648438,"y":2443.35546875,"z":46.4683609008789}}]}'),
	(78, 'hydra hydra2', '{"maxDistance":2.0,"coords":{"x":-903.5599975585938,"y":-2071.365234375,"z":8.25881481170654},"hideUi":false,"state":1,"heading":315,"lockpick":true,"model":598316077}'),
	(79, 'hydra hydra1', '{"maxDistance":6.0,"coords":{"x":-890.4931640625,"y":-2058.29833984375,"z":8.14420986175537},"hideUi":false,"auto":true,"state":1,"heading":45,"lockpick":true,"model":1146973368}'),
	(80, 'hydra hydra3', '{"maxDistance":2.0,"coords":{"x":-934.0243530273438,"y":-2052.278076171875,"z":8.32178020477295},"hideUi":false,"state":1,"heading":225,"lockpick":true,"model":598316077}'),
	(85, 'int_pizzza pizza', '{"maxDistance":2.0,"coords":{"x":-1350.553955078125,"y":-1064.0858154296876,"z":7.63254594802856},"groups":{"pizzathis":0},"hideUi":false,"state":1,"heading":29,"lockpick":false,"model":-1706440710}'),
	(86, 'int_sherrif sherrif10', '{"maxDistance":2.0,"coords":{"x":1852.81689453125,"y":3699.37939453125,"z":34.4227066040039},"groups":{"police":0},"hideUi":false,"state":1,"heading":30,"lockpick":false,"model":-2002725619}'),
	(87, 'int_sherrif sherrif3', '{"maxDistance":2.0,"coords":{"x":1857.4239501953126,"y":3689.847900390625,"z":34.38715362548828},"groups":{"police":0},"hideUi":false,"state":1,"heading":210,"lockpick":false,"model":-2063446532}'),
	(88, 'int_sherrif sherrif13', '{"maxDistance":2.0,"coords":{"x":1857.5592041015626,"y":3688.6357421875,"z":29.98644828796386},"groups":{"police":0},"hideUi":false,"state":1,"heading":210,"lockpick":false,"model":-1297471157}'),
	(89, 'int_sherrif sherrif2', '{"maxDistance":2.0,"coords":{"x":1849.521728515625,"y":3682.91943359375,"z":34.38288497924805},"groups":{"police":0},"hideUi":false,"state":1,"heading":300,"lockpick":false,"model":-712085785}'),
	(90, 'int_sherrif sherrif12', '{"maxDistance":2.0,"coords":{"x":1853.116455078125,"y":3686.07080078125,"z":29.98644828796386},"groups":{"police":0},"hideUi":false,"state":1,"heading":210,"lockpick":false,"model":-1297471157}'),
	(91, 'int_sherrif sherrif11', '{"maxDistance":2.0,"coords":{"x":1839.9462890625,"y":3691.92626953125,"z":38.3841323852539},"groups":{"police":0},"hideUi":false,"state":1,"heading":30,"lockpick":false,"model":-1225150018}'),
	(92, 'int_sherrif sherrif9', '{"maxDistance":2.0,"coords":{"x":1856.9417724609376,"y":3695.5986328125,"z":34.36867904663086},"groups":{"police":0},"hideUi":false,"state":1,"heading":300,"lockpick":false,"model":-1491332605}'),
	(93, 'int_sherrif sherrif7', '{"maxDistance":2.0,"coords":{"x":1849.9619140625,"y":3693.903076171875,"z":34.36824035644531},"groups":{"police":0},"hideUi":false,"state":1,"heading":30,"lockpick":false,"model":-1491332605}'),
	(94, 'int_sherrif sherrif', '{"maxDistance":2.0,"coords":{"x":1855.6861572265626,"y":3683.9287109375,"z":34.59624862670898},"groups":{"police":0},"hideUi":false,"state":1,"heading":30,"lockpick":false,"model":-1765048490}'),
	(95, 'int_sherrif sherrif8', '{"maxDistance":2.0,"coords":{"x":1852.89111328125,"y":3695.593994140625,"z":34.36824035644531},"groups":{"police":0},"hideUi":false,"state":1,"heading":30,"lockpick":false,"model":-1491332605}'),
	(96, 'int_sherrif sherrif4', '{"maxDistance":2.0,"coords":{"x":1848.14599609375,"y":3689.037841796875,"z":34.38746643066406},"groups":{"police":0},"hideUi":false,"state":1,"heading":210,"lockpick":false,"model":-712085785}'),
	(97, 'int_sherrif sherrif6', '{"maxDistance":2.0,"coords":{"x":1845.1708984375,"y":3690.459716796875,"z":34.38709259033203},"groups":{"police":0},"hideUi":false,"state":1,"heading":120,"lockpick":false,"model":-712085785}'),
	(98, 'int_sherrif sherrif5', '{"maxDistance":2.0,"coords":{"x":1845.6331787109376,"y":3689.658935546875,"z":34.38709259033203},"groups":{"police":0},"hideUi":false,"state":1,"heading":300,"lockpick":false,"model":-2063446532}'),
	(99, 'int_sherrif sherrif1', '{"maxDistance":2.0,"coords":{"x":1850.11474609375,"y":3685.6279296875,"z":34.38746643066406},"groups":{"police":0},"hideUi":false,"state":1,"heading":210,"lockpick":false,"model":-1297471157}'),
	(100, 'jewishstreet jewishstreet3', '{"maxDistance":2.5,"coords":{"x":-1162.2470703125,"y":-228.0936279296875,"z":38.06591033935547},"hideUi":false,"state":1,"lockpick":true,"doors":[{"heading":136,"model":2092587577,"coords":{"x":-1161.3021240234376,"y":-228.9905548095703,"z":38.06591033935547}},{"heading":316,"model":632106016,"coords":{"x":-1163.1920166015626,"y":-227.19668579101563,"z":38.06591033935547}}]}'),
	(101, 'jewishstreet jewishstreet4', '{"maxDistance":2.0,"coords":{"x":-1194.0233154296876,"y":-219.17315673828126,"z":38.08872985839844},"hideUi":false,"state":1,"heading":330,"lockpick":true,"model":631614199}'),
	(102, 'jewishstreet jewishstreet2', '{"maxDistance":6.0,"coords":{"x":-1152.5399169921876,"y":-202.32838439941407,"z":39.06315994262695},"hideUi":false,"auto":true,"state":1,"heading":14,"lockpick":true,"model":-1553971106}'),
	(103, 'jewishstreet jewishstreet1', '{"maxDistance":6.0,"coords":{"x":-1140.96044921875,"y":-228.02896118164063,"z":36.91936874389648},"hideUi":false,"auto":true,"state":1,"heading":30,"lockpick":true,"model":853115216}'),
	(104, 'judge judge4', '{"maxDistance":2.5,"coords":{"x":234.34658813476563,"y":-423.826416015625,"z":48.22354888916015},"groups":{"judge":0,"police":0},"hideUi":false,"state":1,"lockpick":true,"doors":[{"heading":160,"model":110411286,"coords":{"x":235.5675811767578,"y":-424.2722473144531,"z":48.22354888916015}},{"heading":340,"model":110411286,"coords":{"x":233.1256103515625,"y":-423.380615234375,"z":48.22354888916015}}]}'),
	(105, 'judge judge6', '{"maxDistance":2.5,"coords":{"x":215.97366333007813,"y":-428.7532043457031,"z":48.10931015014648},"groups":{"judge":0,"police":0},"hideUi":false,"state":1,"lockpick":true,"doors":[{"heading":340,"model":110411286,"coords":{"x":214.75140380859376,"y":-428.308349609375,"z":48.10931015014648}},{"heading":160,"model":110411286,"coords":{"x":217.19590759277345,"y":-429.19805908203127,"z":48.10931015014648}}]}'),
	(106, 'judge judge13', '{"maxDistance":2.0,"coords":{"x":262.2995910644531,"y":-424.37762451171877,"z":47.61734008789062},"groups":{"judge":0,"police":0},"hideUi":false,"state":1,"heading":340,"lockpick":true,"model":631614199}'),
	(107, 'judge judge8', '{"maxDistance":2.5,"coords":{"x":245.62594604492188,"y":-439.5718994140625,"z":48.10886001586914},"groups":{"judge":0,"police":0},"hideUi":false,"state":1,"lockpick":true,"doors":[{"heading":160,"model":110411286,"coords":{"x":246.84568786621095,"y":-440.0195617675781,"z":48.10886001586914}},{"heading":340,"model":110411286,"coords":{"x":244.4062042236328,"y":-439.12420654296877,"z":48.10886001586914}}]}'),
	(108, 'judge judge7', '{"maxDistance":2.5,"coords":{"x":238.31201171875,"y":-441.5090026855469,"z":48.10694122314453},"groups":{"judge":0,"police":0},"hideUi":false,"state":1,"lockpick":true,"doors":[{"heading":250,"model":110411286,"coords":{"x":238.75961303710938,"y":-440.2873840332031,"z":48.10694122314453}},{"heading":70,"model":110411286,"coords":{"x":237.86441040039063,"y":-442.7306213378906,"z":48.10694122314453}}]}'),
	(109, 'judge judge14', '{"maxDistance":2.0,"coords":{"x":263.5185852050781,"y":-425.2913818359375,"z":47.61734008789062},"groups":{"judge":0,"police":0},"hideUi":false,"state":1,"heading":70,"lockpick":true,"model":631614199}'),
	(110, 'judge judge15', '{"maxDistance":2.0,"coords":{"x":262.3677062988281,"y":-428.4533996582031,"z":47.61734008789062},"groups":{"judge":0,"police":0},"hideUi":false,"state":1,"heading":70,"lockpick":true,"model":631614199}'),
	(111, 'judge judge12', '{"maxDistance":2.0,"coords":{"x":263.423583984375,"y":-422.2405090332031,"z":47.58842849731445},"groups":{"judge":0,"police":0},"hideUi":false,"state":1,"heading":160,"lockpick":true,"model":110411286}'),
	(112, 'judge judge9', '{"maxDistance":2.0,"coords":{"x":253.60418701171876,"y":-414.06634521484377,"z":47.58226013183594},"groups":{"judge":0,"police":0},"hideUi":false,"state":1,"heading":160,"lockpick":true,"model":110411286}'),
	(113, 'judge judge11', '{"maxDistance":2.5,"coords":{"x":250.40966796875,"y":-426.70782470703127,"z":46.7607192993164},"groups":{"judge":0,"police":0},"hideUi":false,"state":1,"lockpick":true,"doors":[{"heading":160,"model":1901264878,"coords":{"x":251.44415283203126,"y":-427.0843505859375,"z":46.7607192993164}},{"heading":340,"model":1901264878,"coords":{"x":249.37518310546876,"y":-426.331298828125,"z":46.7607192993164}}]}'),
	(114, 'judge judge10', '{"maxDistance":2.0,"coords":{"x":256.12078857421877,"y":-414.98797607421877,"z":47.58113098144531},"groups":{"judge":0,"police":0},"hideUi":false,"state":1,"heading":340,"lockpick":true,"model":110411286}'),
	(115, 'judge judge1', '{"maxDistance":2.5,"coords":{"x":237.65093994140626,"y":-413.6126708984375,"z":48.21968841552734},"groups":{"judge":0,"police":0},"hideUi":false,"state":1,"lockpick":true,"doors":[{"heading":160,"model":110411286,"coords":{"x":238.87290954589845,"y":-414.0606384277344,"z":48.21968841552734}},{"heading":340,"model":110411286,"coords":{"x":236.42897033691407,"y":-413.1647033691406,"z":48.21968841552734}}]}'),
	(116, 'judge judge5', '{"maxDistance":2.5,"coords":{"x":227.84719848632813,"y":-433.2611083984375,"z":48.2181510925293},"groups":{"judge":0,"police":0},"hideUi":false,"state":1,"lockpick":true,"doors":[{"heading":160,"model":110411286,"coords":{"x":229.06655883789063,"y":-433.7107849121094,"z":48.2181510925293}},{"heading":340,"model":110411286,"coords":{"x":226.62782287597657,"y":-432.81146240234377,"z":48.2181510925293}}]}'),
	(117, 'judge judge3', '{"maxDistance":2.5,"coords":{"x":228.79795837402345,"y":-421.81201171875,"z":48.22354888916015},"groups":{"judge":0,"police":0},"hideUi":false,"state":1,"lockpick":true,"doors":[{"heading":160,"model":110411286,"coords":{"x":230.01893615722657,"y":-422.2578125,"z":48.22354888916015}},{"heading":340,"model":110411286,"coords":{"x":227.5769805908203,"y":-421.3661804199219,"z":48.22354888916015}}]}'),
	(118, 'judge judge2', '{"maxDistance":2.5,"coords":{"x":232.74343872070313,"y":-411.79974365234377,"z":48.21915054321289},"groups":{"judge":0,"police":0},"hideUi":false,"state":1,"lockpick":true,"doors":[{"heading":160,"model":110411286,"coords":{"x":233.9647674560547,"y":-412.24560546875,"z":48.21915054321289}},{"heading":340,"model":110411286,"coords":{"x":231.52212524414063,"y":-411.3538818359375,"z":48.21915054321289}}]}'),
	(119, 'judge judge16', '{"maxDistance":2.0,"coords":{"x":261.2515869140625,"y":-431.52001953125,"z":47.61734008789062},"groups":{"judge":0,"police":0},"hideUi":false,"state":1,"heading":70,"lockpick":true,"model":631614199}'),
	(120, 'krustykrub krustykrub3', '{"maxDistance":2.0,"coords":{"x":-1533.449951171875,"y":-1330.0760498046876,"z":4.05643081665039},"groups":{"burgershot":0},"hideUi":false,"state":1,"heading":105,"lockpick":true,"model":1842740015}'),
	(121, 'krustykrub krustykrub2', '{"maxDistance":2.0,"coords":{"x":-1535.343994140625,"y":-1323.009033203125,"z":4.09181118011474},"groups":{"burgershot":0},"hideUi":false,"state":1,"heading":105,"lockpick":true,"model":968528661}'),
	(122, 'krustykrub krustykrub1', '{"maxDistance":2.5,"coords":{"x":-1526.8489990234376,"y":-1323.70654296875,"z":4.80183219909668},"groups":{"burgershot":0},"hideUi":false,"state":1,"lockpick":true,"doors":[{"heading":285,"model":1804197609,"coords":{"x":-1527.196044921875,"y":-1322.427001953125,"z":4.80183219909668}},{"heading":105,"model":1804197609,"coords":{"x":-1526.501953125,"y":-1324.9859619140626,"z":4.80183219909668}}]}'),
	(123, 'mechanic mechanic4', '{"maxDistance":4.0,"coords":{"x":-1621.1563720703126,"y":-818.8241577148438,"z":11.84185600280761},"groups":{"mechanic":0},"hideUi":false,"auto":true,"state":1,"heading":139,"lockpick":true,"model":-1733711684}'),
	(124, 'mechanic mechanic2', '{"maxDistance":4.0,"coords":{"x":-1612.2193603515626,"y":-826.6301879882813,"z":11.84185600280761},"groups":{"mechanic":0},"hideUi":false,"auto":true,"state":1,"heading":139,"lockpick":true,"model":-1733711684}'),
	(125, 'mechanic mechanic3', '{"maxDistance":4.0,"coords":{"x":-1616.6942138671876,"y":-822.7373046875,"z":11.84185600280761},"groups":{"mechanic":0},"hideUi":false,"auto":true,"state":1,"heading":139,"lockpick":true,"model":-1216387481}'),
	(126, 'mechanic mechanic9', '{"maxDistance":2.0,"coords":{"x":-1605.2120361328126,"y":-832.4472045898438,"z":10.37854957580566},"groups":{"mechanic":0},"hideUi":false,"state":1,"heading":319,"lockpick":true,"model":714428445}'),
	(127, 'mechanic office', '{"maxDistance":2.0,"coords":{"x":-1584.038330078125,"y":-838.5380859375,"z":10.26577568054199},"groups":{"mechanic":0},"hideUi":false,"state":1,"heading":49,"lockpick":true,"model":-743902296}'),
	(128, 'mechanic office2', '{"maxDistance":2.5,"coords":{"x":-1593.652099609375,"y":-852.2708740234375,"z":10.27902221679687},"groups":{"mechanic":0},"hideUi":false,"state":1,"lockpick":true,"doors":[{"heading":319,"model":-1463706150,"coords":{"x":-1592.669677734375,"y":-853.12158203125,"z":10.27902221679687}},{"heading":319,"model":-1224721833,"coords":{"x":-1594.6346435546876,"y":-851.420166015625,"z":10.27902221679687}}]}'),
	(129, 'mechanic mechanic7', '{"maxDistance":2.0,"coords":{"x":-1607.89892578125,"y":-834.97509765625,"z":10.47097587585449},"groups":{"mechanic":0},"hideUi":false,"state":1,"heading":229,"lockpick":true,"model":-598592616}'),
	(130, 'mechanic mechanic5', '{"maxDistance":4.0,"coords":{"x":-1625.6602783203126,"y":-814.9097900390625,"z":11.84185600280761},"groups":{"mechanic":0},"hideUi":false,"auto":true,"state":1,"heading":139,"lockpick":true,"model":1195640306}'),
	(131, 'mechanic mechanic1', '{"maxDistance":4.0,"coords":{"x":-1607.760009765625,"y":-830.513427734375,"z":11.84185600280761},"groups":{"mechanic":0},"hideUi":false,"auto":true,"state":1,"heading":139,"lockpick":true,"model":-1436005319}'),
	(132, 'mechanic mechanic8', '{"maxDistance":2.0,"coords":{"x":-1612.47998046875,"y":-840.25634765625,"z":10.46283912658691},"groups":{"mechanic":0},"hideUi":false,"state":1,"heading":229,"lockpick":true,"model":-1611744562}'),
	(178, 'onyx-cobra onyx-cobradouble', '{"maxDistance":2.5,"coords":{"x":-1014.03466796875,"y":-1514.092041015625,"z":6.64647006988525},"hideUi":false,"state":1,"lockpick":true,"doors":[{"heading":305,"model":1240350830,"coords":{"x":-1014.77783203125,"y":-1513.025390625,"z":6.64647006988525}},{"heading":125,"model":1240350830,"coords":{"x":-1013.2914428710938,"y":-1515.1588134765626,"z":6.64647006988525}}]}'),
	(179, 'onyx-cobra onyx-cobragarage', '{"maxDistance":6.0,"coords":{"x":-1029.9925537109376,"y":-1529.5592041015626,"z":4.13085508346557},"hideUi":false,"auto":true,"state":1,"heading":305,"lockpick":true,"model":-1527129181}'),
	(180, 'prison prison1', '{"maxDistance":6.0,"coords":{"x":3839.405517578125,"y":-20.21618843078613,"z":5.6522741317749},"groups":{"police":0},"hideUi":false,"auto":true,"state":1,"heading":226,"lockpick":true,"model":741314661}'),
	(181, 'prison prison3', '{"maxDistance":6.0,"coords":{"x":3918.558349609375,"y":-12.89594459533691,"z":9.53095054626464},"groups":{"police":0},"hideUi":false,"auto":true,"state":1,"heading":85,"lockpick":true,"model":741314661}'),
	(182, 'prison prison7', '{"maxDistance":6.0,"coords":{"x":3840.38427734375,"y":3.8794949054718,"z":14.87379837036132},"groups":{"police":0},"hideUi":false,"auto":true,"state":1,"heading":268,"lockpick":true,"model":741314661}'),
	(183, 'prison prison6', '{"maxDistance":2.5,"coords":{"x":4080.71435546875,"y":41.3377571105957,"z":18.93248558044433},"groups":{"police":0},"hideUi":false,"state":1,"lockpick":true,"doors":[{"heading":190,"model":1438783233,"coords":{"x":4081.99365234375,"y":41.55300140380859,"z":18.93248558044433}},{"heading":10,"model":1438783233,"coords":{"x":4079.43505859375,"y":41.12251281738281,"z":18.93248558044433}}]}'),
	(184, 'prison prison4', '{"maxDistance":2.0,"coords":{"x":4031.637451171875,"y":1.55560600757598,"z":19.01582336425781},"groups":{"police":0},"hideUi":false,"state":1,"heading":358,"lockpick":true,"model":-692269081}'),
	(185, 'prison prison8', '{"maxDistance":6.0,"coords":{"x":3983.712158203125,"y":65.0813980102539,"z":12.56385517120361},"groups":{"police":0},"hideUi":false,"auto":true,"state":1,"heading":71,"lockpick":true,"model":-692269081}'),
	(186, 'prison prison12', '{"maxDistance":2.0,"coords":{"x":3915.4443359375,"y":33.9890022277832,"z":23.01493453979492},"groups":{"police":0},"hideUi":false,"state":1,"heading":174,"lockpick":true,"model":298123530}'),
	(187, 'prison prison13', '{"maxDistance":2.0,"coords":{"x":3867.716552734375,"y":-24.18517684936523,"z":6.7477970123291},"groups":{"police":0},"hideUi":false,"state":1,"heading":2,"lockpick":true,"model":239636868}'),
	(188, 'prison prison10', '{"maxDistance":2.0,"coords":{"x":3917.18505859375,"y":17.13458824157715,"z":24.2168960571289},"groups":{"police":0},"hideUi":false,"state":1,"heading":265,"lockpick":true,"model":-692269081}'),
	(189, 'prison prison9', '{"maxDistance":6.0,"coords":{"x":3959.386474609375,"y":17.37627029418945,"z":22.84865379333496},"groups":{"police":0},"hideUi":false,"auto":true,"state":1,"heading":265,"lockpick":true,"model":741314661}'),
	(190, 'prison prison5', '{"maxDistance":2.0,"coords":{"x":4014.42626953125,"y":5.3275089263916,"z":19.11520385742187},"groups":{"police":0},"hideUi":false,"state":1,"heading":20,"lockpick":true,"model":1817008884}'),
	(191, 'prison prison2', '{"maxDistance":6.0,"coords":{"x":3917.935546875,"y":-20.31609344482422,"z":9.53095054626464},"groups":{"police":0},"hideUi":false,"auto":true,"state":1,"heading":266,"lockpick":true,"model":741314661}'),
	(192, 'prison prison11', '{"maxDistance":2.0,"coords":{"x":3911.419921875,"y":20.41021728515625,"z":23.01379013061523},"groups":{"police":0},"hideUi":false,"state":1,"heading":175,"lockpick":true,"model":298123530}'),
	(193, 'realestate realestate1', '{"maxDistance":2.0,"coords":{"x":970.2534790039063,"y":-1726.9989013671876,"z":31.58459281921386},"groups":{"realestate":0},"hideUi":false,"state":1,"heading":355,"lockpick":true,"model":-1287708707}'),
	(194, 'redline redline1', '{"maxDistance":6.0,"coords":{"x":-509.8433837890625,"y":-2220.046875,"z":5.64719915390014},"groups":{"redline":0},"hideUi":false,"auto":true,"state":1,"heading":230,"lockpick":true,"model":277481442}'),
	(195, 'redlineori ori3', '{"maxDistance":6.0,"coords":{"x":462.82421875,"y":-572.9508666992188,"z":27.45138359069824},"groups":{"redline":0},"hideUi":false,"auto":true,"state":1,"heading":355,"lockpick":true,"model":82073993}'),
	(196, 'redlineori ori1', '{"maxDistance":6.0,"coords":{"x":473.4140625,"y":-575.8486938476563,"z":27.43756103515625},"groups":{"redline":0},"hideUi":false,"auto":true,"state":1,"heading":355,"lockpick":true,"model":82073993}'),
	(197, 'redlineori ori2', '{"maxDistance":6.0,"coords":{"x":468.3323669433594,"y":-575.3607177734375,"z":27.45138359069824},"groups":{"redline":0},"hideUi":false,"auto":true,"state":1,"heading":355,"lockpick":true,"model":82073993}'),
	(198, 'regularprison regularprison28', '{"maxDistance":6.0,"coords":{"x":1547.7061767578126,"y":2591.2822265625,"z":44.50946807861328},"groups":{"police":0},"hideUi":false,"auto":true,"state":1,"heading":267,"lockpick":true,"model":741314661}'),
	(199, 'regularprison regularprison9', '{"maxDistance":6.0,"coords":{"x":1798.570556640625,"y":2530.10791015625,"z":44.69487762451172},"groups":{"police":0},"hideUi":false,"auto":true,"state":1,"heading":185,"lockpick":true,"model":741314661}'),
	(200, 'regularprison regularprison17', '{"maxDistance":6.0,"coords":{"x":1663.384033203125,"y":2602.679931640625,"z":44.56974029541015},"groups":{"police":0},"hideUi":false,"auto":true,"state":1,"heading":90,"lockpick":true,"model":741314661}'),
	(201, 'regularprison regularprison2', '{"maxDistance":2.0,"coords":{"x":1837.741943359375,"y":2592.161865234375,"z":46.03957366943359},"groups":{"police":0},"hideUi":false,"state":1,"heading":0,"lockpick":true,"model":-684929024}'),
	(202, 'regularprison regularprison26', '{"maxDistance":6.0,"coords":{"x":1575.719482421875,"y":2667.15185546875,"z":44.50946807861328},"groups":{"police":0},"hideUi":false,"auto":true,"state":1,"heading":55,"lockpick":true,"model":741314661}'),
	(203, 'regularprison regularprison4', '{"maxDistance":2.0,"coords":{"x":1831.3399658203126,"y":2594.9921875,"z":46.03791046142578},"groups":{"police":0},"hideUi":false,"state":1,"heading":90,"lockpick":true,"model":-684929024}'),
	(204, 'regularprison regularprison13', '{"maxDistance":6.0,"coords":{"x":1626.2679443359376,"y":2531.43505859375,"z":44.56093978881836},"groups":{"police":0},"hideUi":false,"auto":true,"state":1,"heading":180,"lockpick":true,"model":741314661}'),
	(205, 'regularprison regularprison8', '{"maxDistance":2.0,"coords":{"x":1791.595703125,"y":2551.462158203125,"z":45.75320434570312},"groups":{"police":0},"hideUi":false,"state":1,"heading":90,"lockpick":true,"model":705715602}'),
	(206, 'regularprison regularprison12', '{"maxDistance":2.0,"coords":{"x":1693.423095703125,"y":2469.049560546875,"z":46.05363082885742},"groups":{"police":0},"hideUi":false,"state":1,"heading":180,"lockpick":true,"model":705715602}'),
	(207, 'regularprison regularprison34', '{"maxDistance":6.0,"coords":{"x":1749.1419677734376,"y":2419.81201171875,"z":44.4251708984375},"groups":{"police":0},"hideUi":false,"auto":true,"state":1,"heading":27,"lockpick":true,"model":741314661}'),
	(208, 'regularprison regularprison24', '{"maxDistance":6.0,"coords":{"x":1648.4110107421876,"y":2741.66796875,"z":44.44668960571289},"groups":{"police":0},"hideUi":false,"auto":true,"state":1,"heading":27,"lockpick":true,"model":741314661}'),
	(209, 'regularprison regularprison7', '{"maxDistance":2.0,"coords":{"x":1798.0899658203126,"y":2591.68701171875,"z":46.41783905029297},"groups":{"police":0},"hideUi":false,"state":1,"heading":180,"lockpick":true,"model":-1156020871}'),
	(210, 'regularprison regularprison23', '{"maxDistance":6.0,"coords":{"x":1762.196044921875,"y":2752.489013671875,"z":44.44668960571289},"groups":{"police":0},"hideUi":false,"auto":true,"state":1,"heading":340,"lockpick":true,"model":741314661}'),
	(211, 'regularprison regularprison33', '{"maxDistance":6.0,"coords":{"x":1652.9840087890626,"y":2409.571044921875,"z":44.44308090209961},"groups":{"police":0},"hideUi":false,"auto":true,"state":1,"heading":353,"lockpick":true,"model":741314661}'),
	(212, 'regularprison regularprison20', '{"maxDistance":6.0,"coords":{"x":1835.2850341796876,"y":2689.10400390625,"z":44.44670104980469},"groups":{"police":0},"hideUi":false,"auto":true,"state":1,"heading":110,"lockpick":true,"model":741314661}'),
	(213, 'regularprison regularprison37', '{"maxDistance":6.0,"coords":{"x":1813.7490234375,"y":2488.906982421875,"z":44.46368026733398},"groups":{"police":0},"hideUi":false,"auto":true,"state":1,"heading":252,"lockpick":true,"model":741314661}'),
	(214, 'regularprison regularprison15', '{"maxDistance":6.0,"coords":{"x":1625.68994140625,"y":2584.9990234375,"z":44.58578109741211},"groups":{"police":0},"hideUi":false,"auto":true,"state":1,"heading":180,"lockpick":true,"model":741314661}'),
	(215, 'regularprison regularprison22', '{"maxDistance":6.0,"coords":{"x":1776.7010498046876,"y":2747.14794921875,"z":44.44668960571289},"groups":{"police":0},"hideUi":false,"auto":true,"state":1,"heading":160,"lockpick":true,"model":741314661}'),
	(216, 'regularprison regularprison6', '{"maxDistance":2.0,"coords":{"x":1797.760986328125,"y":2596.56494140625,"z":46.38731002807617},"groups":{"police":0},"hideUi":false,"state":1,"heading":180,"lockpick":true,"model":-1156020871}'),
	(217, 'regularprison regularprison27', '{"maxDistance":6.0,"coords":{"x":1584.6529541015626,"y":2679.7490234375,"z":44.50947189331055},"groups":{"police":0},"hideUi":false,"auto":true,"state":1,"heading":234,"lockpick":true,"model":741314661}'),
	(218, 'regularprison regularprison16', '{"maxDistance":2.0,"coords":{"x":1626.4549560546876,"y":2563.10498046875,"z":46.32481002807617},"groups":{"police":0},"hideUi":false,"state":1,"heading":270,"lockpick":true,"model":-1156020871}'),
	(219, 'regularprison regularprison32', '{"maxDistance":6.0,"coords":{"x":1667.6689453125,"y":2407.64794921875,"z":44.42879104614258},"groups":{"police":0},"hideUi":false,"auto":true,"state":1,"heading":173,"lockpick":true,"model":741314661}'),
	(220, 'regularprison regularprison25', '{"maxDistance":6.0,"coords":{"x":1662.010986328125,"y":2748.702880859375,"z":44.44668960571289},"groups":{"police":0},"hideUi":false,"auto":true,"state":1,"heading":207,"lockpick":true,"model":741314661}'),
	(221, 'regularprison regularprison31', '{"maxDistance":6.0,"coords":{"x":1550.930419921875,"y":2482.743408203125,"z":44.39528656005859},"groups":{"police":0},"hideUi":false,"auto":true,"state":1,"heading":298,"lockpick":true,"model":741314661}'),
	(222, 'regularprison regularprison36', '{"maxDistance":6.0,"coords":{"x":1808.991943359375,"y":2474.544921875,"z":44.48077011108398},"groups":{"police":0},"hideUi":false,"auto":true,"state":1,"heading":71,"lockpick":true,"model":741314661}'),
	(223, 'regularprison regularprison35', '{"maxDistance":6.0,"coords":{"x":1762.5419921875,"y":2426.507080078125,"z":44.43787002563476},"groups":{"police":0},"hideUi":false,"auto":true,"state":1,"heading":206,"lockpick":true,"model":741314661}'),
	(224, 'regularprison regularprison1', '{"maxDistance":6.0,"coords":{"x":1844.998046875,"y":2604.81201171875,"z":44.63977813720703},"groups":{"police":0},"hideUi":false,"auto":true,"state":1,"heading":90,"lockpick":true,"model":741314661}'),
	(225, 'regularprison regularprison3', '{"maxDistance":2.0,"coords":{"x":1838.616943359375,"y":2593.705078125,"z":46.03635787963867},"groups":{"police":0},"hideUi":false,"state":1,"heading":270,"lockpick":true,"model":-684929024}'),
	(226, 'regularprison regularprison5', '{"maxDistance":2.0,"coords":{"x":1819.0728759765626,"y":2594.873291015625,"z":46.09036254882812},"groups":{"police":0},"hideUi":false,"state":1,"heading":270,"lockpick":true,"model":705715602}'),
	(227, 'regularprison regularprison19', '{"maxDistance":6.0,"coords":{"x":1799.6080322265626,"y":2616.97509765625,"z":44.6032485961914},"groups":{"police":0},"hideUi":false,"auto":true,"state":1,"heading":180,"lockpick":true,"model":741314661}'),
	(228, 'regularprison regularprison30', '{"maxDistance":6.0,"coords":{"x":1558.22119140625,"y":2469.34912109375,"z":44.39528656005859},"groups":{"police":0},"hideUi":false,"auto":true,"state":1,"heading":118,"lockpick":true,"model":741314661}'),
	(229, 'regularprison regularprison21', '{"maxDistance":6.0,"coords":{"x":1830.134033203125,"y":2703.4990234375,"z":44.44670104980469},"groups":{"police":0},"hideUi":false,"auto":true,"state":1,"heading":289,"lockpick":true,"model":741314661}'),
	(230, 'regularprison regularprison14', '{"maxDistance":2.0,"coords":{"x":1597.704345703125,"y":2553.188720703125,"z":46.05766296386719},"groups":{"police":0},"hideUi":false,"state":1,"heading":90,"lockpick":true,"model":705715602}'),
	(231, 'regularprison regularprison10', '{"maxDistance":6.0,"coords":{"x":1774.64501953125,"y":2534.51708984375,"z":44.69485855102539},"groups":{"police":0},"hideUi":false,"auto":true,"state":1,"heading":60,"lockpick":true,"model":741314661}'),
	(232, 'regularprison regularprison18', '{"maxDistance":6.0,"coords":{"x":1818.54296875,"y":2604.81201171875,"z":44.61100006103515},"groups":{"police":0},"hideUi":false,"auto":true,"state":1,"heading":90,"lockpick":true,"model":741314661}'),
	(233, 'regularprison regularprison29', '{"maxDistance":6.0,"coords":{"x":1546.9833984375,"y":2576.129638671875,"z":44.39032745361328},"groups":{"police":0},"hideUi":false,"auto":true,"state":1,"heading":87,"lockpick":true,"model":741314661}'),
	(234, 'rhpd rhpd11', '{"maxDistance":2.5,"coords":{"x":-406.40130615234377,"y":-396.2141418457031,"z":25.2458381652832},"groups":{"police":0},"hideUi":false,"state":1,"lockpick":true,"doors":[{"heading":260,"model":-543497392,"coords":{"x":-406.6273193359375,"y":-397.4958801269531,"z":25.2458381652832}},{"heading":80,"model":-543497392,"coords":{"x":-406.17529296875,"y":-394.9324035644531,"z":25.2458381652832}}]}'),
	(235, 'rhpd rhpd13', '{"maxDistance":2.0,"coords":{"x":-399.2298889160156,"y":-394.7256164550781,"z":25.25592803955078},"groups":{"police":0},"hideUi":false,"state":1,"heading":350,"lockpick":true,"model":2136045912}'),
	(236, 'rhpd rhpd10', '{"maxDistance":2.5,"coords":{"x":-370.953125,"y":-383.84478759765627,"z":25.24140739440918},"groups":{"police":0},"hideUi":false,"state":1,"lockpick":true,"doors":[{"heading":260,"model":-543497392,"coords":{"x":-371.17913818359377,"y":-385.12646484375,"z":25.24140739440918}},{"heading":80,"model":-543497392,"coords":{"x":-370.7271423339844,"y":-382.5630798339844,"z":25.24140739440918}}]}'),
	(237, 'rhpd rhpd38', '{"maxDistance":6.0,"coords":{"x":-400.1083984375,"y":-316.869873046875,"z":34.24290084838867},"groups":{"police":0},"hideUi":false,"auto":true,"state":1,"lockpick":true,"doors":[{"heading":144,"model":-1603028996,"coords":{"x":-401.1949462890625,"y":-316.0804443359375,"z":34.24290084838867}},{"heading":324,"model":-1603028996,"coords":{"x":-399.0218505859375,"y":-317.6592712402344,"z":34.24290084838867}}]}'),
	(238, 'rhpd rhpd23', '{"maxDistance":2.0,"coords":{"x":-379.2548522949219,"y":-417.3041076660156,"z":25.23634910583496},"groups":{"police":0},"hideUi":false,"state":1,"heading":80,"lockpick":true,"model":1176241902}'),
	(239, 'rhpd rhpd12', '{"maxDistance":2.0,"coords":{"x":-403.239501953125,"y":-399.4295654296875,"z":25.24434852600097},"groups":{"police":0},"hideUi":false,"state":1,"heading":170,"lockpick":true,"model":2136045912}'),
	(240, 'rhpd rhpd18', '{"maxDistance":2.0,"coords":{"x":-387.5570068359375,"y":-411.4516906738281,"z":25.23625755310058},"groups":{"police":0},"hideUi":false,"state":1,"heading":350,"lockpick":true,"model":1176241902}'),
	(241, 'rhpd rhpd51', '{"maxDistance":2.0,"coords":{"x":-407.8965759277344,"y":-357.84307861328127,"z":53.40922546386719},"groups":{"police":0},"hideUi":false,"state":1,"heading":260,"lockpick":true,"model":-543497392}'),
	(242, 'rhpd rhpd14', '{"maxDistance":2.0,"coords":{"x":-394.81634521484377,"y":-400.914794921875,"z":25.24434852600097},"groups":{"police":0},"hideUi":false,"state":1,"heading":170,"lockpick":true,"model":2136045912}'),
	(243, 'rhpd rhpd50', '{"maxDistance":2.0,"coords":{"x":-388.4878234863281,"y":-356.1365661621094,"z":48.6878547668457},"groups":{"police":0},"hideUi":false,"state":1,"heading":195,"lockpick":true,"model":-1821777087}'),
	(244, 'rhpd rhpd28', '{"maxDistance":2.0,"coords":{"x":-393.0013122558594,"y":-429.2707214355469,"z":25.23319816589355},"groups":{"police":0},"hideUi":false,"state":1,"heading":260,"lockpick":true,"model":1401135549}'),
	(245, 'rhpd rhpd1', '{"maxDistance":2.5,"coords":{"x":-363.9610595703125,"y":-277.8961181640625,"z":25.24388885498047},"groups":{"police":0},"hideUi":false,"state":1,"lockpick":true,"doors":[{"heading":170,"model":-543497392,"coords":{"x":-365.2415771484375,"y":-277.67034912109377,"z":25.24388885498047}},{"heading":350,"model":-543497392,"coords":{"x":-362.6805725097656,"y":-278.1219177246094,"z":25.24388885498047}}]}'),
	(246, 'rhpd rhpd58', '{"maxDistance":2.0,"coords":{"x":-407.9480895996094,"y":-357.83355712890627,"z":71.41740417480469},"groups":{"police":0},"hideUi":false,"state":1,"heading":261,"lockpick":true,"model":-543497392}'),
	(247, 'rhpd rhpd55', '{"maxDistance":2.0,"coords":{"x":-402.13092041015627,"y":-337.9494323730469,"z":53.41154861450195},"groups":{"police":0},"hideUi":false,"state":1,"heading":204,"lockpick":true,"model":-1821777087}'),
	(248, 'rhpd rhpd42', '{"maxDistance":6.0,"coords":{"x":-405.2982482910156,"y":-345.75836181640627,"z":37.42530059814453},"groups":{"stam":0},"hideUi":false,"auto":true,"state":1,"lockpick":true,"doors":[{"heading":260,"model":-283574096,"coords":{"x":-405.4430236816406,"y":-346.579345703125,"z":37.42530059814453}},{"heading":260,"model":14722111,"coords":{"x":-405.1534729003906,"y":-344.9373474121094,"z":37.42530059814453}}]}'),
	(249, 'rhpd rhpd56', '{"maxDistance":2.0,"coords":{"x":-409.87237548828127,"y":-357.8590087890625,"z":56.80317687988281},"groups":{"police":0},"hideUi":false,"state":1,"heading":170,"lockpick":true,"model":-543497392}'),
	(250, 'rhpd rhpd49', '{"maxDistance":6.0,"coords":{"x":-405.2982482910156,"y":-345.75836181640627,"z":47.5343017578125},"groups":{"stam":0},"hideUi":false,"auto":true,"state":1,"lockpick":true,"doors":[{"heading":260,"model":14722111,"coords":{"x":-405.1534729003906,"y":-344.9373474121094,"z":47.5343017578125}},{"heading":260,"model":-283574096,"coords":{"x":-405.4430236816406,"y":-346.579345703125,"z":47.5343017578125}}]}'),
	(251, 'rhpd rhpd57', '{"maxDistance":2.5,"coords":{"x":-405.469970703125,"y":-348.27874755859377,"z":71.34397888183594},"groups":{"police":0},"hideUi":false,"state":1,"lockpick":true,"doors":[{"heading":127,"model":2136045912,"coords":{"x":-404.6711120605469,"y":-349.3388977050781,"z":71.34397888183594}},{"heading":307,"model":2136045912,"coords":{"x":-406.26885986328127,"y":-347.2186279296875,"z":71.34397888183594}}]}'),
	(252, 'rhpd rhpd54', '{"maxDistance":6.0,"coords":{"x":-405.2982482910156,"y":-345.75836181640627,"z":52.26152038574219},"groups":{"stam":0},"hideUi":false,"auto":true,"state":1,"lockpick":true,"doors":[{"heading":260,"model":-283574096,"coords":{"x":-405.4430236816406,"y":-346.579345703125,"z":52.26152038574219}},{"heading":260,"model":14722111,"coords":{"x":-405.1534729003906,"y":-344.9373474121094,"z":52.26152038574219}}]}'),
	(253, 'rhpd rhpd35', '{"maxDistance":6.0,"coords":{"x":-395.43939208984377,"y":-363.0854187011719,"z":31.39771842956543},"groups":{"police":0},"hideUi":false,"auto":true,"state":1,"lockpick":true,"doors":[{"heading":172,"model":-1603028996,"coords":{"x":-396.77410888671877,"y":-362.9122619628906,"z":31.39771842956543}},{"heading":353,"model":-1603028996,"coords":{"x":-394.10467529296877,"y":-363.2585754394531,"z":31.39771842956543}}]}'),
	(254, 'rhpd rhpd34', '{"maxDistance":2.5,"coords":{"x":-346.2459716796875,"y":-390.7898864746094,"z":20.37446975708007},"groups":{"police":0},"hideUi":false,"state":1,"lockpick":true,"doors":[{"heading":350,"model":-2023754432,"coords":{"x":-347.5263366699219,"y":-390.5641174316406,"z":20.37446975708007}},{"heading":170,"model":-2023754432,"coords":{"x":-344.9656066894531,"y":-391.0156555175781,"z":20.37446975708007}}]}'),
	(255, 'rhpd rhpd44', '{"maxDistance":2.0,"coords":{"x":-407.8965759277344,"y":-357.84307861328127,"z":43.73978424072265},"groups":{"police":0},"hideUi":false,"state":1,"heading":260,"lockpick":true,"model":-543497392}'),
	(256, 'rhpd rhpd2', '{"maxDistance":6.0,"coords":{"x":-417.06536865234377,"y":-332.3592834472656,"z":34.34477996826172},"groups":{"police":0},"hideUi":false,"auto":true,"state":1,"heading":262,"lockpick":true,"model":-143534454}'),
	(257, 'rhpd rhpd7', '{"maxDistance":2.5,"coords":{"x":-394.1435546875,"y":-360.9199523925781,"z":25.23761749267578},"groups":{"police":0},"hideUi":false,"state":1,"lockpick":true,"doors":[{"heading":260,"model":-543497392,"coords":{"x":-394.3702087402344,"y":-362.2054748535156,"z":25.23761749267578}},{"heading":80,"model":-543497392,"coords":{"x":-393.9168701171875,"y":-359.6344299316406,"z":25.23761749267578}}]}'),
	(258, 'rhpd rhpd15', '{"maxDistance":2.0,"coords":{"x":-390.9976806640625,"y":-396.19488525390627,"z":25.25581741333007},"groups":{"police":0},"hideUi":false,"state":1,"heading":350,"lockpick":true,"model":2136045912}'),
	(259, 'rhpd rhpd26', '{"maxDistance":2.0,"coords":{"x":-390.3044128417969,"y":-433.05023193359377,"z":25.23319816589355},"groups":{"police":0},"hideUi":false,"state":1,"heading":350,"lockpick":true,"model":1401135549}'),
	(260, 'rhpd rhpd9', '{"maxDistance":2.5,"coords":{"x":-382.2376708984375,"y":-383.940673828125,"z":25.24443817138672},"groups":{"police":0},"hideUi":false,"state":1,"lockpick":true,"doors":[{"heading":350,"model":-543497392,"coords":{"x":-380.9564208984375,"y":-384.1665954589844,"z":25.24443817138672}},{"heading":170,"model":-543497392,"coords":{"x":-383.5188903808594,"y":-383.71478271484377,"z":25.24443817138672}}]}'),
	(261, 'rhpd rhpd3', '{"maxDistance":6.0,"coords":{"x":-417.66668701171877,"y":-336.6378479003906,"z":34.34477996826172},"groups":{"police":0},"hideUi":false,"auto":true,"state":1,"heading":263,"lockpick":true,"model":-143534454}'),
	(262, 'rhpd rhpd27', '{"maxDistance":2.0,"coords":{"x":-387.4139404296875,"y":-428.748779296875,"z":25.23319816589355},"groups":{"police":0},"hideUi":false,"state":1,"heading":80,"lockpick":true,"model":1401135549}'),
	(263, 'rhpd rhpd6', '{"maxDistance":2.0,"coords":{"x":-389.12628173828127,"y":-357.0074157714844,"z":25.22406768798828},"groups":{"police":0},"hideUi":false,"state":1,"heading":80,"lockpick":true,"model":2136045912}'),
	(264, 'rhpd rhpd43', '{"maxDistance":2.0,"coords":{"x":-407.8965759277344,"y":-357.84307861328127,"z":38.79921722412109},"groups":{"police":0},"hideUi":false,"state":1,"heading":260,"lockpick":true,"model":-543497392}'),
	(265, 'rhpd rhpd8', '{"maxDistance":2.5,"coords":{"x":-396.32470703125,"y":-373.35369873046877,"z":25.24363899230957},"groups":{"police":0},"hideUi":false,"state":1,"lockpick":true,"doors":[{"heading":80,"model":-543497392,"coords":{"x":-396.0981140136719,"y":-372.06854248046877,"z":25.24363899230957}},{"heading":260,"model":-543497392,"coords":{"x":-396.55133056640627,"y":-374.6388854980469,"z":25.24363899230957}}]}'),
	(266, 'rhpd rhpd5', '{"maxDistance":2.0,"coords":{"x":-391.9684753417969,"y":-373.0829772949219,"z":25.22527885437011},"groups":{"police":0},"hideUi":false,"state":1,"heading":80,"lockpick":true,"model":2136045912}'),
	(267, 'rhpd rhpd47', '{"maxDistance":2.0,"coords":{"x":-407.8965759277344,"y":-357.84307861328127,"z":48.67331314086914},"groups":{"police":0},"hideUi":false,"state":1,"heading":260,"lockpick":true,"model":-543497392}'),
	(268, 'rhpd rhpd41', '{"maxDistance":2.0,"coords":{"x":-405.92657470703127,"y":-349.32177734375,"z":37.42530059814453},"groups":{"stam":0},"hideUi":false,"state":1,"heading":260,"lockpick":true,"model":-283574096}'),
	(269, 'rhpd rhpd31', '{"maxDistance":2.0,"coords":{"x":-385.8181457519531,"y":-388.8480529785156,"z":25.24317741394043},"groups":{"police":0},"hideUi":false,"state":1,"heading":80,"lockpick":true,"model":1438783233}'),
	(270, 'rhpd rhpd22', '{"maxDistance":2.0,"coords":{"x":-380.8143310546875,"y":-413.7320251464844,"z":25.23634910583496},"groups":{"police":0},"hideUi":false,"state":1,"heading":125,"lockpick":true,"model":1176241902}'),
	(271, 'rhpd rhpd19', '{"maxDistance":2.0,"coords":{"x":-395.1109313964844,"y":-412.3939514160156,"z":25.23634910583496},"groups":{"police":0},"hideUi":false,"state":1,"heading":215,"lockpick":true,"model":1176241902}'),
	(272, 'rhpd rhpd53', '{"maxDistance":6.0,"coords":{"x":-405.78155517578127,"y":-348.4992980957031,"z":52.26152038574219},"groups":{"stam":0},"hideUi":false,"auto":true,"state":1,"lockpick":true,"doors":[{"heading":260,"model":-283574096,"coords":{"x":-405.92657470703127,"y":-349.32177734375,"z":52.26152038574219}},{"heading":260,"model":14722111,"coords":{"x":-405.6365051269531,"y":-347.67681884765627,"z":52.26152038574219}}]}'),
	(273, 'rhpd rhpd4', '{"maxDistance":2.5,"coords":{"x":-381.4813232421875,"y":-379.70379638671877,"z":25.22296905517578},"groups":{"police":0},"hideUi":false,"state":1,"lockpick":true,"doors":[{"heading":170,"model":2136045912,"coords":{"x":-380.1793518066406,"y":-379.9333801269531,"z":25.22296905517578}},{"heading":350,"model":2136045912,"coords":{"x":-382.7832946777344,"y":-379.4742431640625,"z":25.22296905517578}}]}'),
	(274, 'rhpd rhpd25', '{"maxDistance":2.0,"coords":{"x":-389.3796691894531,"y":-421.78863525390627,"z":25.23625755310058},"groups":{"police":0},"hideUi":false,"state":1,"heading":350,"lockpick":true,"model":1176241902}'),
	(275, 'rhpd rhpd36', '{"maxDistance":6.0,"coords":{"x":-366.71197509765627,"y":-355.3392639160156,"z":30.66342163085937},"groups":{"police":0},"hideUi":false,"auto":true,"state":1,"lockpick":true,"doors":[{"heading":253,"model":-1603028996,"coords":{"x":-367.1028747558594,"y":-356.6178283691406,"z":30.66342163085937}},{"heading":73,"model":-1603028996,"coords":{"x":-366.3210754394531,"y":-354.0606994628906,"z":30.66342163085937}}]}'),
	(276, 'rhpd rhpd24', '{"maxDistance":2.0,"coords":{"x":-380.9226989746094,"y":-421.01934814453127,"z":25.23634910583496},"groups":{"police":0},"hideUi":false,"state":1,"heading":35,"lockpick":true,"model":1176241902}'),
	(277, 'rhpd rhpd32', '{"maxDistance":2.0,"coords":{"x":-353.89208984375,"y":-363.69677734375,"z":20.37137985229492},"groups":{"police":0},"hideUi":false,"state":1,"heading":260,"lockpick":true,"model":-2023754432}'),
	(278, 'rhpd rhpd33', '{"maxDistance":2.0,"coords":{"x":-357.8390808105469,"y":-365.46343994140627,"z":20.34229660034179},"groups":{"police":0},"hideUi":false,"state":1,"heading":80,"lockpick":true,"model":-2023754432}'),
	(279, 'rhpd rhpd20', '{"maxDistance":2.0,"coords":{"x":-396.7779846191406,"y":-416.0242614746094,"z":25.23634910583496},"groups":{"police":0},"hideUi":false,"state":1,"heading":260,"lockpick":true,"model":1176241902}'),
	(280, 'rhpd rhpd37', '{"maxDistance":2.0,"coords":{"x":-397.4256896972656,"y":-344.276611328125,"z":32.54715728759765},"groups":{"police":0},"hideUi":false,"state":1,"heading":261,"lockpick":true,"model":-1821777087}'),
	(281, 'rhpd rhpd21', '{"maxDistance":2.0,"coords":{"x":-395.271240234375,"y":-419.58001708984377,"z":25.23634910583496},"groups":{"police":0},"hideUi":false,"state":1,"heading":305,"lockpick":true,"model":1176241902}'),
	(282, 'rhpd rhpd40', '{"maxDistance":2.0,"coords":{"x":-405.6365051269531,"y":-347.67681884765627,"z":37.42530059814453},"groups":{"stam":0},"hideUi":false,"state":1,"heading":260,"lockpick":true,"model":14722111}'),
	(283, 'rhpd rhpd17', '{"maxDistance":2.5,"coords":{"x":-385.9358215332031,"y":-404.91607666015627,"z":25.22267913818359},"groups":{"police":0},"hideUi":false,"state":1,"lockpick":true,"doors":[{"heading":350,"model":2136045912,"coords":{"x":-387.242431640625,"y":-404.6856994628906,"z":25.22267913818359}},{"heading":170,"model":2136045912,"coords":{"x":-384.62921142578127,"y":-405.146484375,"z":25.22267913818359}}]}'),
	(284, 'rhpd rhpd45', '{"maxDistance":6.0,"coords":{"x":-405.78155517578127,"y":-348.4992980957031,"z":42.5925064086914},"groups":{"stam":0},"hideUi":false,"auto":true,"state":1,"lockpick":true,"doors":[{"heading":260,"model":14722111,"coords":{"x":-405.6365051269531,"y":-347.67681884765627,"z":42.5925064086914}},{"heading":260,"model":-283574096,"coords":{"x":-405.92657470703127,"y":-349.32177734375,"z":42.5925064086914}}]}'),
	(285, 'rhpd rhpd46', '{"maxDistance":6.0,"coords":{"x":-405.2982482910156,"y":-345.75836181640627,"z":42.5925064086914},"groups":{"stam":0},"hideUi":false,"auto":true,"state":1,"lockpick":true,"doors":[{"heading":260,"model":-283574096,"coords":{"x":-405.4430236816406,"y":-346.579345703125,"z":42.5925064086914}},{"heading":260,"model":14722111,"coords":{"x":-405.1534729003906,"y":-344.9373474121094,"z":42.5925064086914}}]}'),
	(286, 'rhpd rhpd48', '{"maxDistance":6.0,"coords":{"x":-405.78155517578127,"y":-348.4992980957031,"z":47.5343017578125},"groups":{"stam":0},"hideUi":false,"auto":true,"state":1,"lockpick":true,"doors":[{"heading":260,"model":-283574096,"coords":{"x":-405.92657470703127,"y":-349.32177734375,"z":47.5343017578125}},{"heading":260,"model":14722111,"coords":{"x":-405.6365051269531,"y":-347.67681884765627,"z":47.5343017578125}}]}'),
	(287, 'taco taco2', '{"maxDistance":2.0,"coords":{"x":386.6038513183594,"y":-312.2874755859375,"z":43.10570907592773},"groups":{"taco":0},"hideUi":false,"state":1,"heading":70,"lockpick":true,"model":631614199}'),
	(288, 'taco taco1', '{"maxDistance":2.0,"coords":{"x":381.55706787109377,"y":-319.1512145996094,"z":43.10638046264648},"groups":{"taco":0},"hideUi":false,"state":1,"heading":340,"lockpick":true,"model":631614199}'),
	(289, 'taco taco3', '{"maxDistance":2.0,"coords":{"x":376.5166015625,"y":-308.77197265625,"z":47.10588836669922},"groups":{"taco":0},"hideUi":false,"state":1,"heading":340,"lockpick":true,"model":1443843183}'),
	(290, 'taco taco5', '{"maxDistance":2.5,"coords":{"x":386.54931640625,"y":-324.4841613769531,"z":47.14947891235351},"groups":{"taco":0},"hideUi":false,"state":1,"lockpick":true,"doors":[{"heading":160,"model":982993682,"coords":{"x":387.44189453125,"y":-324.80902099609377,"z":47.14947891235351}},{"heading":340,"model":982993682,"coords":{"x":385.6567687988281,"y":-324.1593017578125,"z":47.14947891235351}}]}'),
	(291, 'taco taco4', '{"maxDistance":2.5,"coords":{"x":377.81805419921877,"y":-321.3018798828125,"z":47.13598251342773},"groups":{"taco":0},"hideUi":false,"state":1,"lockpick":true,"doors":[{"heading":160,"model":982993682,"coords":{"x":378.70977783203127,"y":-321.62640380859377,"z":47.13598251342773}},{"heading":340,"model":982993682,"coords":{"x":376.9263610839844,"y":-320.9773254394531,"z":47.13598251342773}}]}'),
	(292, 'taco taco6', '{"maxDistance":2.0,"coords":{"x":387.72296142578127,"y":-323.7760314941406,"z":51.20909118652344},"groups":{"taco":0},"hideUi":false,"state":1,"heading":250,"lockpick":true,"model":-1821777087}'),
	(293, 'vanilla door11', '{"maxDistance":2.0,"coords":{"x":244.9752197265625,"y":-3156.333984375,"z":3.49333190917968},"groups":{"vanilla":0},"hideUi":false,"state":1,"heading":0,"lockpick":true,"model":390840000}'),
	(294, 'whitewidow whitewidow1', '{"maxDistance":2.5,"coords":{"x":201.136474609375,"y":-239.49191284179688,"z":54.23558807373047},"groups":{"whitewidow":0},"hideUi":false,"state":1,"lockpick":true,"doors":[{"heading":295,"model":-1226987899,"coords":{"x":200.58497619628907,"y":-238.31517028808595,"z":54.23558807373047}},{"heading":115,"model":-1226987899,"coords":{"x":201.68797302246095,"y":-240.66867065429688,"z":54.23558807373047}}]}'),
	(295, 'whitewidow whitewidow3', '{"maxDistance":2.0,"coords":{"x":185.3671417236328,"y":-244.16253662109376,"z":54.2199821472168},"groups":{"whitewidow":0},"hideUi":false,"state":1,"heading":160,"lockpick":true,"model":-2051651622}'),
	(296, 'whitewidow whitewidow4', '{"maxDistance":2.0,"coords":{"x":182.3453369140625,"y":-243.0863800048828,"z":54.21878814697265},"groups":{"whitewidow":0},"hideUi":false,"state":1,"heading":160,"lockpick":true,"model":-538477509}'),
	(297, 'whitewidowdoor whitewidow', '{"maxDistance":2.0,"coords":{"x":186.79415893554688,"y":-236.9383544921875,"z":54.22113800048828},"groups":{"whitewidow":0},"hideUi":false,"state":1,"heading":70,"lockpick":true,"model":-2051651622}'),
	(298, 'yellowjack door3', '{"maxDistance":2.0,"coords":{"x":1993.8564453125,"y":3050.665283203125,"z":50.57339477539062},"groups":{"yellowjack":0},"hideUi":false,"state":1,"heading":237,"lockpick":true,"model":1539342923}'),
	(299, 'yellowjack door1', '{"maxDistance":2.0,"coords":{"x":1991.1251220703126,"y":3053.094482421875,"z":47.23420715332031},"groups":{"yellowjack":0},"hideUi":false,"state":1,"heading":148,"lockpick":true,"model":808037258}'),
	(300, 'yellowjack door2', '{"maxDistance":2.0,"coords":{"x":1994.8846435546876,"y":3045.45849609375,"z":47.3079948425293},"groups":{"yellowjack":0},"hideUi":false,"state":1,"heading":238,"lockpick":true,"model":479144380}'),
	(301, 'yellowjack door4', '{"maxDistance":2.0,"coords":{"x":1981.1705322265626,"y":3049.784912109375,"z":50.67814636230469},"groups":{"yellowjack":0},"hideUi":false,"state":1,"heading":148,"lockpick":true,"model":808037258}'),
	(302, 'vangelico', '{"maxDistance":2,"lockSound":"door_bolt","coords":{"x":-631.19091796875,"y":-237.38540649414063,"z":38.2065315246582},"groups":{"police":0},"unlockSound":"door_bolt","state":1,"doors":[{"heading":306,"model":9467943,"coords":{"x":-630.426513671875,"y":-238.4375457763672,"z":38.2065315246582}},{"heading":306,"model":1425919976,"coords":{"x":-631.9553833007813,"y":-236.33326721191407,"z":38.2065315246582}}]}'),
	(338, 'apart105', '{"state":1,"lockSound":"door_bolt","unlockSound":"door_bolt","maxDistance":2,"hideUi":true,"doors":false,"model":2011001180,"heading":245,"coords":{"x":-645.9904174804688,"y":-1080.390380859375,"z":22.03683471679687}}'),
	(339, 'apart104', '{"state":1,"lockSound":"door_bolt","unlockSound":"door_bolt","maxDistance":2,"hideUi":true,"doors":false,"model":2011001180,"heading":245,"coords":{"x":-650.6544799804688,"y":-1090.337646484375,"z":22.03742790222168}}'),
	(340, 'apart103', '{"state":1,"lockSound":"door_bolt","unlockSound":"door_bolt","maxDistance":2,"hideUi":true,"doors":false,"model":2011001180,"heading":65,"coords":{"x":-655.2005004882813,"y":-1090.7791748046876,"z":22.0370864868164}}'),
	(341, 'apart102', '{"state":1,"lockSound":"door_bolt","unlockSound":"door_bolt","maxDistance":2,"hideUi":true,"doors":false,"model":2011001180,"heading":245,"coords":{"x":-655.3132934570313,"y":-1100.27392578125,"z":22.03801918029785}}'),
	(342, 'apart101', '{"state":1,"lockSound":"door_bolt","unlockSound":"door_bolt","maxDistance":2,"hideUi":true,"doors":false,"model":2011001180,"heading":65,"coords":{"x":-659.8594360351563,"y":-1100.71533203125,"z":22.03767776489257}}'),
	(349, 'mechanicnew1', '{"coords":{"x":154.79232788085938,"y":-3023.90869140625,"z":8.74872970581054},"heading":90,"groups":{"mechanic":0},"maxDistance":6,"state":1,"doors":false,"model":1031780519}'),
	(350, 'mechanicnew2', '{"coords":{"x":154.82150268554688,"y":-3034.057861328125,"z":8.74872970581054},"heading":90,"groups":{"mechanic":0},"maxDistance":6,"state":1,"doors":false,"model":1031780519}'),
	(351, 'mechanicnew3', '{"coords":{"x":154.82150268554688,"y":-3044.227783203125,"z":8.74872970581054},"heading":90,"groups":{"mechanic":0},"maxDistance":6,"state":1,"doors":false,"model":1031780519}'),
	(352, 'mechanicnew4', '{"maxDistance":2,"state":1,"heading":180,"model":299449810,"coords":{"x":148.72439575195313,"y":-3050.015625,"z":7.5966453552246},"doors":false,"groups":{"mechanic":0}}'),
	(353, 'mechanicnew5', '{"maxDistance":2,"state":1,"heading":180,"model":299449810,"coords":{"x":143.71844482421876,"y":-3050.015625,"z":7.5966453552246},"doors":false,"groups":{"mechanic":0}}'),
	(354, 'mechanicnew6', '{"maxDistance":4,"state":1,"heading":180,"model":299449810,"coords":{"x":138.18927001953126,"y":-3050.015625,"z":7.5966453552246},"doors":false,"groups":{"mechanic":0}}'),
	(355, 'mechanicnew7', '{"maxDistance":2,"heading":90,"doors":false,"model":-325945933,"state":1,"coords":{"x":154.88751220703126,"y":-3018.628173828125,"z":7.1985855102539},"groups":{"mechanic":0}}'),
	(362, 'mrdp', '{"coords":{"x":449.5223693847656,"y":-981.6597290039063,"z":30.87444877624511},"doors":[{"heading":90,"coords":{"x":449.5223693847656,"y":-980.3610229492188,"z":30.87444877624511},"model":-1481015543},{"heading":90,"coords":{"x":449.5223693847656,"y":-982.9584350585938,"z":30.87444877624511},"model":952639784}],"state":0,"auto":true,"maxDistance":2,"groups":{"police":0}}'),
	(363, 'mrdp', '{"coords":{"x":441.43255615234377,"y":-998.5841064453125,"z":31.11837196350097},"doors":[{"heading":0,"coords":{"x":440.1142578125,"y":-998.5843505859375,"z":31.1181411743164},"model":-688443112},{"heading":360,"coords":{"x":442.7508850097656,"y":-998.5838012695313,"z":31.11860275268554},"model":1847320387}],"state":1,"auto":true,"maxDistance":2,"groups":{"police":0}}');

-- Volcando estructura para tabla zap1214400-2.paychecks
CREATE TABLE IF NOT EXISTS `paychecks` (
  `citizenid` varchar(250) CHARACTER SET latin1 COLLATE latin1_spanish_ci DEFAULT NULL,
  `collectamount` int(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Volcando datos para la tabla zap1214400-2.paychecks: ~0 rows (aproximadamente)

-- Volcando estructura para tabla zap1214400-2.pa_billing
CREATE TABLE IF NOT EXISTS `pa_billing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `paid` varchar(50) NOT NULL DEFAULT '0',
  `owner` varchar(50) NOT NULL DEFAULT '0',
  `price` int(17) DEFAULT NULL,
  `receiver` varchar(50) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Volcando datos para la tabla zap1214400-2.pa_billing: ~2 rows (aproximadamente)
INSERT INTO `pa_billing` (`id`, `paid`, `owner`, `price`, `receiver`, `title`, `type`) VALUES
	(11, '1', 'ZRP16935', 1, 'MTS42741', 'Test ', 'police'),
	(12, '0', 'ZRP16935', 10, 'ZRP16935', 'Test', 'police'),
	(13, '1', 'ZRP16935', 100, 'MTS42741', 'Test', 'police');

-- Volcando estructura para tabla zap1214400-2.pa_vehicleshop_showroom_vehicles
CREATE TABLE IF NOT EXISTS `pa_vehicleshop_showroom_vehicles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dealershipId` int(11) NOT NULL,
  `vehicleModel` varchar(50) NOT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla zap1214400-2.pa_vehicleshop_showroom_vehicles: ~0 rows (aproximadamente)

-- Volcando estructura para tabla zap1214400-2.pa_vehicleshop_stocks
CREATE TABLE IF NOT EXISTS `pa_vehicleshop_stocks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicleModel` varchar(50) NOT NULL,
  `quantity` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla zap1214400-2.pa_vehicleshop_stocks: ~0 rows (aproximadamente)

-- Volcando estructura para tabla zap1214400-2.permissions
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `license` varchar(255) NOT NULL,
  `permission` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `license` (`license`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Volcando datos para la tabla zap1214400-2.permissions: ~0 rows (aproximadamente)

-- Volcando estructura para tabla zap1214400-2.phone_chatrooms
CREATE TABLE IF NOT EXISTS `phone_chatrooms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `room_code` varchar(10) NOT NULL,
  `room_name` varchar(15) NOT NULL,
  `room_owner_id` varchar(20) DEFAULT NULL,
  `room_owner_name` varchar(60) DEFAULT NULL,
  `room_members` text DEFAULT '{}',
  `room_pin` varchar(50) DEFAULT NULL,
  `unpaid_balance` decimal(10,2) DEFAULT 0.00,
  `is_pinned` tinyint(1) DEFAULT 0,
  `created` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `room_code` (`room_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla zap1214400-2.phone_chatrooms: ~0 rows (aproximadamente)

-- Volcando estructura para tabla zap1214400-2.phone_chatroom_messages
CREATE TABLE IF NOT EXISTS `phone_chatroom_messages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `room_id` int(10) unsigned DEFAULT NULL,
  `member_id` varchar(20) DEFAULT NULL,
  `member_name` varchar(50) DEFAULT NULL,
  `message` text NOT NULL,
  `is_pinned` tinyint(1) DEFAULT 0,
  `created` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla zap1214400-2.phone_chatroom_messages: ~0 rows (aproximadamente)

-- Volcando estructura para tabla zap1214400-2.phone_gallery
CREATE TABLE IF NOT EXISTS `phone_gallery` (
  `citizenid` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `date` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla zap1214400-2.phone_gallery: ~0 rows (aproximadamente)

-- Volcando estructura para tabla zap1214400-2.phone_invoices
CREATE TABLE IF NOT EXISTS `phone_invoices` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `amount` int(11) NOT NULL DEFAULT 0,
  `society` tinytext DEFAULT NULL,
  `sender` varchar(50) DEFAULT NULL,
  `sendercitizenid` varchar(50) DEFAULT NULL,
  `time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Volcando datos para la tabla zap1214400-2.phone_invoices: ~0 rows (aproximadamente)

-- Volcando estructura para tabla zap1214400-2.phone_messages
CREATE TABLE IF NOT EXISTS `phone_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `number` varchar(50) DEFAULT NULL,
  `messages` text DEFAULT NULL,
  `time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`),
  KEY `number` (`number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Volcando datos para la tabla zap1214400-2.phone_messages: ~0 rows (aproximadamente)

-- Volcando estructura para tabla zap1214400-2.phone_note
CREATE TABLE IF NOT EXISTS `phone_note` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `title` text DEFAULT NULL,
  `text` text DEFAULT NULL,
  `lastupdate` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Volcando datos para la tabla zap1214400-2.phone_note: ~0 rows (aproximadamente)

-- Volcando estructura para tabla zap1214400-2.phone_tweets
CREATE TABLE IF NOT EXISTS `phone_tweets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `firstName` varchar(25) DEFAULT NULL,
  `lastName` varchar(25) DEFAULT NULL,
  `type` varchar(25) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `url` text DEFAULT NULL,
  `tweetId` varchar(25) NOT NULL,
  `date` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Volcando datos para la tabla zap1214400-2.phone_tweets: ~0 rows (aproximadamente)

-- Volcando estructura para tabla zap1214400-2.players
CREATE TABLE IF NOT EXISTS `players` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(255) NOT NULL,
  `cid` int(11) DEFAULT NULL,
  `active` int(11) DEFAULT NULL,
  `steam` varchar(255) NOT NULL,
  `license` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `money` text NOT NULL,
  `paycheck` int(11) NOT NULL DEFAULT 0,
  `charinfo` text DEFAULT NULL,
  `job` text NOT NULL,
  `gang` text DEFAULT NULL,
  `position` text NOT NULL,
  `metadata` text NOT NULL,
  `inventory` longtext DEFAULT NULL,
  `last_updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `skin` longtext DEFAULT NULL,
  `luckywheel_spins` varchar(1) DEFAULT '1',
  `credits` int(11) NOT NULL DEFAULT 0,
  `tasks` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `tasks_completed` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `winnings` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `deleted` int(11) DEFAULT 0,
  `pp` longtext DEFAULT '',
  `policemdtinfo` longtext DEFAULT '',
  `tags` longtext DEFAULT '',
  `gallery` longtext DEFAULT '',
  `crafting_level` int(11) NOT NULL,
  `phonePos` text DEFAULT NULL,
  `spotify` text DEFAULT NULL,
  `ringtone` text DEFAULT NULL,
  `first_screen_showed` int(11) DEFAULT NULL,
  `electrocourses` int(11) DEFAULT 0,
  `inside` varchar(100) DEFAULT NULL,
  `hasvoted` tinyint(4) DEFAULT 0,
  `disabled` tinyint(1) DEFAULT 0,
  `tattoos` longtext DEFAULT NULL,
  `ownedskills` longtext NOT NULL DEFAULT '{}',
  `skillsinfo` longtext NOT NULL DEFAULT '{"skillpoints":0, "skillxp":0, "nextlevel":100, "currentlevel":0}',
  `frkn_fuelstation_control` int(11) NOT NULL DEFAULT 0,
  `phone_number` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`citizenid`),
  KEY `id` (`id`),
  KEY `last_updated` (`last_updated`),
  KEY `license` (`license`)
) ENGINE=InnoDB AUTO_INCREMENT=988 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Volcando datos para la tabla zap1214400-2.players: ~2 rows (aproximadamente)
INSERT INTO `players` (`id`, `citizenid`, `cid`, `active`, `steam`, `license`, `name`, `money`, `paycheck`, `charinfo`, `job`, `gang`, `position`, `metadata`, `inventory`, `last_updated`, `skin`, `luckywheel_spins`, `credits`, `tasks`, `tasks_completed`, `winnings`, `deleted`, `pp`, `policemdtinfo`, `tags`, `gallery`, `crafting_level`, `phonePos`, `spotify`, `ringtone`, `first_screen_showed`, `electrocourses`, `inside`, `hasvoted`, `disabled`, `tattoos`, `ownedskills`, `skillsinfo`, `frkn_fuelstation_control`, `phone_number`) VALUES
	(841, 'KMR55667', 1, NULL, '', 'license:d2564bd9f174527e1192ca089244188b2dee918e', 'SrLonganiza', '{"bank":1050,"crypto":0,"cash":261050}', 0, '{"cid":"1","gender":0,"account":"US05QBCore8007616623","birthdate":"2005-05-05","firstname":"Minguito","lastname":"Martinez","phone":"4338424853","nationality":"zap1214400-2"}', '{"payment":10,"name":"ambulance","grade":{"payment":125,"name":"Surgeon","level":3,"isboss":false},"type":"ems","isboss":false,"onduty":true,"label":"EMS"}', '{"isboss":false,"name":"none","grade":{"level":0,"name":"none"},"label":"No Gang Affiliation"}', '{"x":-1001.116455078125,"y":-478.0615234375,"z":50.02197265625}', '{"phonedata":{"SerialNumber":72105013,"InstalledApps":[]},"inlaststand":false,"thirst":96.2,"ishandcuffed":false,"craftingrep":0,"dealerrep":0,"jobrep":{"tow":0,"hotdog":0,"taxi":0,"trucker":0},"status":[],"inside":{"apartment":[]},"tracker":false,"callsign":"NO CALLSIGN","jailitems":[],"isdead":false,"criminalrecord":{"hasRecord":false},"attachmentcraftingrep":0,"fitbit":[],"injail":0,"licences":{"weapon":false,"business":false,"driver":true},"armor":0,"bloodtype":"AB-","walletid":"QB-44076277","fingerprint":"HB036l35Jhu0219","hunger":95.8,"phone":[],"stress":0}', '[{"name":"boosterpack","type":"item","info":{"quality":100},"created":1722365021,"amount":1,"slot":1},{"name":"toychest","type":"item","info":{"quality":100},"created":1722364990,"amount":1,"slot":2},{"name":"altawall","type":"item","info":{"quality":100,"grade":3,"graded":"False","centering":4,"number":20,"damage":5,"color":1},"created":1722365066,"amount":1,"slot":3},{"name":"bstoy2","type":"item","info":{"quality":100},"created":1722365006,"amount":1,"slot":4},{"name":"binder","type":"item","info":{"quality":100},"created":1722364995,"amount":1,"slot":5},{"name":"redgarage","type":"item","info":{"quality":100,"grade":6,"graded":"False","centering":8,"number":21,"damage":3,"color":6},"created":1722365078,"amount":1,"slot":6}]', '2024-07-31 08:22:24', NULL, '1', 0, '', '', '', 0, '', '', '', '', 0, NULL, NULL, NULL, NULL, 0, NULL, 0, 0, NULL, '{}', '{"skillpoints":0, "skillxp":0, "nextlevel":100, "currentlevel":0}', 0, NULL),
	(899, 'SVB88291', 2, NULL, '', 'license:d2564bd9f174527e1192ca089244188b2dee918e', 'SrLonganiza', '{"bank":5000,"crypto":0,"cash":500}', 0, '{"firstname":"Mibguito","nationality":"wwdwdwdwdw","gender":0,"account":"US01QBCore1876926172","cid":"2","birthdate":"2005-05-05","phone":"6296195881","lastname":"Maertinrz"}', '{"onduty":false,"grade":{"name":"Freelancer","level":0},"label":"Civilian","type":"none","isboss":false,"name":"unemployed","payment":10}', '{"name":"none","isboss":false,"grade":{"name":"none","level":0},"label":"No Gang Affiliation"}', '{"x":1153.4505615234376,"y":-471.3230895996094,"z":66.5347900390625}', '{"injail":0,"thirst":100,"stress":0,"criminalrecord":{"hasRecord":false},"status":[],"hunger":100,"fingerprint":"VU049Q75rXv3016","bloodtype":"O+","inside":{"apartment":[]},"fitbit":[],"jobrep":{"trucker":0,"taxi":0,"tow":0,"hotdog":0},"phone":[],"jailitems":[],"armor":0,"ishandcuffed":false,"isdead":false,"walletid":"QB-40575103","inlaststand":false,"dealerrep":0,"craftingrep":0,"phonedata":{"InstalledApps":[],"SerialNumber":53273327},"attachmentcraftingrep":0,"licences":{"business":false,"driver":true,"weapon":false},"callsign":"NO CALLSIGN","tracker":false}', '[{"name":"id_card","info":{"birthdate":"2005-05-05","citizenid":"SVB88291","lastname":"Maertinrz","quality":100,"nationality":"wwdwdwdwdw","gender":0,"firstname":"Mibguito"},"amount":1,"type":"item","slot":1,"created":1722186568},{"name":"phone","info":{"quality":100},"amount":1,"type":"item","slot":2,"created":1722186568},{"name":"driver_license","info":{"birthdate":"2005-05-05","type":"Class C Driver License","lastname":"Maertinrz","quality":100,"firstname":"Mibguito"},"amount":1,"type":"item","slot":3,"created":1722186568}]', '2024-07-30 10:53:02', NULL, '1', 0, '', '', '', 0, '', '', '', '', 0, NULL, NULL, NULL, NULL, 0, NULL, 0, 0, NULL, '{}', '{"skillpoints":0, "skillxp":0, "nextlevel":100, "currentlevel":0}', 0, NULL);

-- Volcando estructura para tabla zap1214400-2.playerskins
CREATE TABLE IF NOT EXISTS `playerskins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(11) NOT NULL,
  `model` varchar(255) NOT NULL,
  `skin` text NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`),
  KEY `active` (`active`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla zap1214400-2.playerskins: ~7 rows (aproximadamente)
INSERT INTO `playerskins` (`id`, `citizenid`, `model`, `skin`, `active`) VALUES
	(1, 'NWG45939', '1885233650', '{"chimp_bone_width":{"defaultItem":0,"texture":0,"item":0,"defaultTexture":0},"arms":{"defaultItem":0,"texture":0,"item":0,"defaultTexture":0},"jaw_bone_width":{"defaultItem":0,"texture":0,"item":0,"defaultTexture":0},"chimp_hole":{"defaultItem":0,"texture":0,"item":0,"defaultTexture":0},"eyebrows":{"defaultItem":-1,"texture":1,"item":-1,"defaultTexture":1},"bracelet":{"defaultItem":-1,"texture":0,"item":-1,"defaultTexture":0},"cheek_3":{"defaultItem":0,"texture":0,"item":0,"defaultTexture":0},"nose_2":{"defaultItem":0,"texture":0,"item":0,"defaultTexture":0},"facemix":{"defaultSkinMix":0.0,"defaultShapeMix":0.0,"shapeMix":0,"skinMix":0},"torso2":{"defaultItem":0,"texture":0,"item":0,"defaultTexture":0},"watch":{"defaultItem":-1,"texture":0,"item":-1,"defaultTexture":0},"neck_thikness":{"defaultItem":0,"texture":0,"item":0,"defaultTexture":0},"makeup":{"defaultItem":-1,"texture":1,"item":-1,"defaultTexture":1},"decals":{"defaultItem":0,"texture":0,"item":0,"defaultTexture":0},"shoes":{"defaultItem":1,"texture":0,"item":1,"defaultTexture":0},"face2":{"defaultItem":0,"texture":0,"item":0,"defaultTexture":0},"ageing":{"defaultItem":-1,"texture":0,"item":-1,"defaultTexture":0},"eye_opening":{"defaultItem":0,"texture":0,"item":0,"defaultTexture":0},"moles":{"defaultItem":-1,"texture":0,"item":-1,"defaultTexture":0},"cheek_2":{"defaultItem":0,"texture":0,"item":0,"defaultTexture":0},"bag":{"defaultItem":0,"texture":0,"item":0,"defaultTexture":0},"chimp_bone_lenght":{"defaultItem":0,"texture":0,"item":0,"defaultTexture":0},"chimp_bone_lowering":{"defaultItem":0,"texture":0,"item":0,"defaultTexture":0},"jaw_bone_back_lenght":{"defaultItem":0,"texture":0,"item":0,"defaultTexture":0},"eyebrown_forward":{"defaultItem":0,"texture":0,"item":0,"defaultTexture":0},"eyebrown_high":{"defaultItem":0,"texture":0,"item":0,"defaultTexture":0},"nose_1":{"defaultItem":0,"texture":0,"item":0,"defaultTexture":0},"cheek_1":{"defaultItem":0,"texture":0,"item":0,"defaultTexture":0},"accessory":{"defaultItem":0,"texture":0,"item":0,"defaultTexture":0},"nose_4":{"defaultItem":0,"texture":0,"item":0,"defaultTexture":0},"hair":{"defaultItem":0,"texture":0,"item":0,"defaultTexture":0},"lips_thickness":{"defaultItem":0,"texture":0,"item":0,"defaultTexture":0},"nose_3":{"defaultItem":0,"texture":0,"item":0,"defaultTexture":0},"beard":{"defaultItem":-1,"texture":1,"item":-1,"defaultTexture":1},"t-shirt":{"defaultItem":1,"texture":0,"item":1,"defaultTexture":0},"hat":{"defaultItem":-1,"texture":0,"item":-1,"defaultTexture":0},"lipstick":{"defaultItem":-1,"texture":1,"item":-1,"defaultTexture":1},"face":{"defaultItem":0,"texture":0,"item":0,"defaultTexture":0},"nose_5":{"defaultItem":0,"texture":0,"item":0,"defaultTexture":0},"blush":{"defaultItem":-1,"texture":1,"item":-1,"defaultTexture":1},"glass":{"defaultItem":0,"texture":0,"item":0,"defaultTexture":0},"nose_0":{"defaultItem":0,"texture":0,"item":0,"defaultTexture":0},"mask":{"defaultItem":0,"texture":0,"item":0,"defaultTexture":0},"ear":{"defaultItem":-1,"texture":0,"item":-1,"defaultTexture":0},"eye_color":{"defaultItem":-1,"texture":0,"item":-1,"defaultTexture":0},"vest":{"defaultItem":0,"texture":0,"item":0,"defaultTexture":0},"pants":{"defaultItem":0,"texture":0,"item":0,"defaultTexture":0}}', 1),
	(2, 'ZWO74305', '1885233650', '{"nose_5":{"texture":0,"defaultTexture":0,"item":0,"defaultItem":0},"pants":{"texture":0,"defaultTexture":0,"item":0,"defaultItem":0},"chimp_bone_width":{"texture":0,"defaultTexture":0,"item":0,"defaultItem":0},"eye_color":{"texture":0,"defaultTexture":0,"item":-1,"defaultItem":-1},"cheek_3":{"texture":0,"defaultTexture":0,"item":0,"defaultItem":0},"ear":{"texture":0,"defaultTexture":0,"item":-1,"defaultItem":-1},"nose_0":{"texture":0,"defaultTexture":0,"item":0,"defaultItem":0},"hair":{"texture":0,"defaultTexture":0,"item":0,"defaultItem":0},"lips_thickness":{"texture":0,"defaultTexture":0,"item":0,"defaultItem":0},"eyebrows":{"texture":1,"defaultTexture":1,"item":-1,"defaultItem":-1},"watch":{"texture":0,"defaultTexture":0,"item":-1,"defaultItem":-1},"shoes":{"texture":0,"defaultTexture":0,"item":1,"defaultItem":1},"arms":{"texture":0,"defaultTexture":0,"item":0,"defaultItem":0},"decals":{"texture":0,"defaultTexture":0,"item":0,"defaultItem":0},"eyebrown_high":{"texture":0,"defaultTexture":0,"item":0,"defaultItem":0},"eyebrown_forward":{"texture":0,"defaultTexture":0,"item":0,"defaultItem":0},"face2":{"texture":0,"defaultTexture":0,"item":0,"defaultItem":0},"chimp_bone_lenght":{"texture":0,"defaultTexture":0,"item":0,"defaultItem":0},"t-shirt":{"texture":0,"defaultTexture":0,"item":1,"defaultItem":1},"neck_thikness":{"texture":0,"defaultTexture":0,"item":0,"defaultItem":0},"makeup":{"texture":1,"defaultTexture":1,"item":-1,"defaultItem":-1},"nose_1":{"texture":0,"defaultTexture":0,"item":0,"defaultItem":0},"face":{"texture":0,"defaultTexture":0,"item":0,"defaultItem":0},"nose_3":{"texture":0,"defaultTexture":0,"item":0,"defaultItem":0},"mask":{"texture":0,"defaultTexture":0,"item":0,"defaultItem":0},"chimp_bone_lowering":{"texture":0,"defaultTexture":0,"item":0,"defaultItem":0},"bracelet":{"texture":0,"defaultTexture":0,"item":-1,"defaultItem":-1},"beard":{"texture":1,"defaultTexture":1,"item":-1,"defaultItem":-1},"nose_2":{"texture":0,"defaultTexture":0,"item":0,"defaultItem":0},"nose_4":{"texture":0,"defaultTexture":0,"item":0,"defaultItem":0},"accessory":{"texture":0,"defaultTexture":0,"item":0,"defaultItem":0},"glass":{"texture":0,"defaultTexture":0,"item":0,"defaultItem":0},"torso2":{"texture":0,"defaultTexture":0,"item":0,"defaultItem":0},"jaw_bone_back_lenght":{"texture":0,"defaultTexture":0,"item":0,"defaultItem":0},"bag":{"texture":0,"defaultTexture":0,"item":0,"defaultItem":0},"jaw_bone_width":{"texture":0,"defaultTexture":0,"item":0,"defaultItem":0},"eye_opening":{"texture":0,"defaultTexture":0,"item":0,"defaultItem":0},"cheek_1":{"texture":0,"defaultTexture":0,"item":0,"defaultItem":0},"blush":{"texture":1,"defaultTexture":1,"item":-1,"defaultItem":-1},"facemix":{"shapeMix":0,"defaultShapeMix":0.0,"skinMix":0,"defaultSkinMix":0.0},"cheek_2":{"texture":0,"defaultTexture":0,"item":0,"defaultItem":0},"hat":{"texture":0,"defaultTexture":0,"item":-1,"defaultItem":-1},"vest":{"texture":0,"defaultTexture":0,"item":0,"defaultItem":0},"chimp_hole":{"texture":0,"defaultTexture":0,"item":0,"defaultItem":0},"ageing":{"texture":0,"defaultTexture":0,"item":-1,"defaultItem":-1},"lipstick":{"texture":1,"defaultTexture":1,"item":-1,"defaultItem":-1},"moles":{"texture":0,"defaultTexture":0,"item":-1,"defaultItem":-1}}', 1),
	(8, 'OYD43612', '1885233650', '{"hair":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"eyebrows":{"defaultTexture":1,"defaultItem":-1,"item":-1,"texture":1},"nose_3":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"nose_5":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"torso2":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"eyebrown_high":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"lips_thickness":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"pants":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"t-shirt":{"defaultTexture":0,"defaultItem":1,"item":1,"texture":0},"cheek_2":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"shoes":{"defaultTexture":0,"defaultItem":1,"item":1,"texture":0},"makeup":{"defaultTexture":1,"defaultItem":-1,"item":-1,"texture":1},"jaw_bone_width":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"nose_4":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"arms":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"chimp_bone_lowering":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"mask":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"eyebrown_forward":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"bracelet":{"defaultTexture":0,"defaultItem":-1,"item":-1,"texture":0},"nose_1":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"accessory":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"facemix":{"skinMix":0,"shapeMix":0,"defaultShapeMix":0.0,"defaultSkinMix":0.0},"bag":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"eye_opening":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"decals":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"face":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"cheek_3":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"face2":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"blush":{"defaultTexture":1,"defaultItem":-1,"item":-1,"texture":1},"moles":{"defaultTexture":0,"defaultItem":-1,"item":-1,"texture":0},"vest":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"beard":{"defaultTexture":1,"defaultItem":-1,"item":-1,"texture":1},"chimp_bone_width":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"neck_thikness":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"hat":{"defaultTexture":0,"defaultItem":-1,"item":-1,"texture":0},"watch":{"defaultTexture":0,"defaultItem":-1,"item":-1,"texture":0},"chimp_hole":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"ear":{"defaultTexture":0,"defaultItem":-1,"item":-1,"texture":0},"cheek_1":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"nose_2":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"chimp_bone_lenght":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"jaw_bone_back_lenght":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"glass":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"nose_0":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"ageing":{"defaultTexture":0,"defaultItem":-1,"item":-1,"texture":0},"eye_color":{"defaultTexture":0,"defaultItem":-1,"item":-1,"texture":0},"lipstick":{"defaultTexture":1,"defaultItem":-1,"item":-1,"texture":1}}', 1),
	(12, 'IEW99125', '1885233650', '{"nose_5":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"chimp_bone_width":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"arms":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"jaw_bone_width":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"beard":{"item":-1,"texture":1,"defaultTexture":1,"defaultItem":-1},"torso2":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"nose_2":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"bag":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"face2":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"eye_opening":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"watch":{"item":-1,"texture":0,"defaultTexture":0,"defaultItem":-1},"facemix":{"shapeMix":0,"defaultSkinMix":0.0,"skinMix":0,"defaultShapeMix":0.0},"blush":{"item":-1,"texture":1,"defaultTexture":1,"defaultItem":-1},"neck_thikness":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"chimp_bone_lowering":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"cheek_1":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"ear":{"item":-1,"texture":0,"defaultTexture":0,"defaultItem":-1},"chimp_bone_lenght":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"eyebrows":{"item":-1,"texture":1,"defaultTexture":1,"defaultItem":-1},"jaw_bone_back_lenght":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"nose_1":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"eyebrown_forward":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"decals":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"glass":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"nose_3":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"cheek_3":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"chimp_hole":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"cheek_2":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"vest":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"pants":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"lips_thickness":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"t-shirt":{"item":1,"texture":0,"defaultTexture":0,"defaultItem":1},"hair":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"nose_0":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"nose_4":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"shoes":{"item":1,"texture":0,"defaultTexture":0,"defaultItem":1},"bracelet":{"item":-1,"texture":0,"defaultTexture":0,"defaultItem":-1},"moles":{"item":-1,"texture":0,"defaultTexture":0,"defaultItem":-1},"makeup":{"item":-1,"texture":1,"defaultTexture":1,"defaultItem":-1},"lipstick":{"item":-1,"texture":1,"defaultTexture":1,"defaultItem":-1},"eyebrown_high":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"accessory":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"face":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"hat":{"item":-1,"texture":0,"defaultTexture":0,"defaultItem":-1},"eye_color":{"item":-1,"texture":0,"defaultTexture":0,"defaultItem":-1},"mask":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"ageing":{"item":-1,"texture":0,"defaultTexture":0,"defaultItem":-1}}', 1),
	(17, 'ZFQ53507', '1885233650', '{"mask":{"texture":0,"item":0,"defaultTexture":0,"defaultItem":0},"face2":{"texture":0,"item":0,"defaultTexture":0,"defaultItem":0},"shoes":{"texture":0,"item":1,"defaultTexture":0,"defaultItem":1},"facemix":{"defaultSkinMix":0.0,"defaultShapeMix":0.0,"shapeMix":0,"skinMix":0},"hair":{"texture":0,"item":0,"defaultTexture":0,"defaultItem":0},"face":{"texture":0,"item":0,"defaultTexture":0,"defaultItem":0},"moles":{"texture":0,"item":-1,"defaultTexture":0,"defaultItem":-1},"chimp_bone_lowering":{"texture":0,"item":0,"defaultTexture":0,"defaultItem":0},"makeup":{"texture":1,"item":-1,"defaultTexture":1,"defaultItem":-1},"decals":{"texture":0,"item":0,"defaultTexture":0,"defaultItem":0},"chimp_bone_lenght":{"texture":0,"item":0,"defaultTexture":0,"defaultItem":0},"nose_3":{"texture":0,"item":0,"defaultTexture":0,"defaultItem":0},"chimp_hole":{"texture":0,"item":0,"defaultTexture":0,"defaultItem":0},"nose_0":{"texture":0,"item":0,"defaultTexture":0,"defaultItem":0},"accessory":{"texture":0,"item":0,"defaultTexture":0,"defaultItem":0},"watch":{"texture":0,"item":-1,"defaultTexture":0,"defaultItem":-1},"eye_opening":{"texture":0,"item":0,"defaultTexture":0,"defaultItem":0},"neck_thikness":{"texture":0,"item":0,"defaultTexture":0,"defaultItem":0},"pants":{"texture":0,"item":0,"defaultTexture":0,"defaultItem":0},"nose_5":{"texture":0,"item":0,"defaultTexture":0,"defaultItem":0},"bag":{"texture":0,"item":0,"defaultTexture":0,"defaultItem":0},"eyebrows":{"texture":1,"item":-1,"defaultTexture":1,"defaultItem":-1},"eyebrown_forward":{"texture":0,"item":0,"defaultTexture":0,"defaultItem":0},"eyebrown_high":{"texture":0,"item":0,"defaultTexture":0,"defaultItem":0},"jaw_bone_width":{"texture":0,"item":0,"defaultTexture":0,"defaultItem":0},"eye_color":{"texture":0,"item":-1,"defaultTexture":0,"defaultItem":-1},"nose_4":{"texture":0,"item":0,"defaultTexture":0,"defaultItem":0},"nose_2":{"texture":0,"item":0,"defaultTexture":0,"defaultItem":0},"t-shirt":{"texture":0,"item":1,"defaultTexture":0,"defaultItem":1},"cheek_3":{"texture":0,"item":0,"defaultTexture":0,"defaultItem":0},"cheek_2":{"texture":0,"item":0,"defaultTexture":0,"defaultItem":0},"bracelet":{"texture":0,"item":-1,"defaultTexture":0,"defaultItem":-1},"beard":{"texture":1,"item":-1,"defaultTexture":1,"defaultItem":-1},"lips_thickness":{"texture":0,"item":0,"defaultTexture":0,"defaultItem":0},"hat":{"texture":0,"item":-1,"defaultTexture":0,"defaultItem":-1},"jaw_bone_back_lenght":{"texture":0,"item":0,"defaultTexture":0,"defaultItem":0},"vest":{"texture":0,"item":0,"defaultTexture":0,"defaultItem":0},"arms":{"texture":0,"item":0,"defaultTexture":0,"defaultItem":0},"nose_1":{"texture":0,"item":0,"defaultTexture":0,"defaultItem":0},"cheek_1":{"texture":0,"item":0,"defaultTexture":0,"defaultItem":0},"chimp_bone_width":{"texture":0,"item":0,"defaultTexture":0,"defaultItem":0},"torso2":{"texture":0,"item":0,"defaultTexture":0,"defaultItem":0},"ear":{"texture":0,"item":-1,"defaultTexture":0,"defaultItem":-1},"glass":{"texture":0,"item":0,"defaultTexture":0,"defaultItem":0},"ageing":{"texture":0,"item":-1,"defaultTexture":0,"defaultItem":-1},"lipstick":{"texture":1,"item":-1,"defaultTexture":1,"defaultItem":-1},"blush":{"texture":1,"item":-1,"defaultTexture":1,"defaultItem":-1}}', 1),
	(18, 'KMR55667', '1885233650', '{"hair":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"blush":{"defaultTexture":1,"defaultItem":-1,"item":-1,"texture":1},"bag":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"eyebrown_forward":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"face2":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"nose_0":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"pants":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"torso2":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"shoes":{"defaultTexture":0,"defaultItem":1,"item":1,"texture":0},"arms":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"nose_5":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"makeup":{"defaultTexture":1,"defaultItem":-1,"item":-1,"texture":1},"cheek_2":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"eyebrows":{"defaultTexture":1,"defaultItem":-1,"item":-1,"texture":1},"hat":{"defaultTexture":0,"defaultItem":-1,"item":-1,"texture":0},"face":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"lipstick":{"defaultTexture":1,"defaultItem":-1,"item":-1,"texture":1},"cheek_1":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"nose_1":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"neck_thikness":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"accessory":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"vest":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"chimp_hole":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"t-shirt":{"defaultTexture":0,"defaultItem":1,"item":1,"texture":0},"beard":{"defaultTexture":1,"defaultItem":-1,"item":-1,"texture":1},"cheek_3":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"ear":{"defaultTexture":0,"defaultItem":-1,"item":-1,"texture":0},"chimp_bone_lenght":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"chimp_bone_lowering":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"jaw_bone_back_lenght":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"bracelet":{"defaultTexture":0,"defaultItem":-1,"item":-1,"texture":0},"moles":{"defaultTexture":0,"defaultItem":-1,"item":-1,"texture":0},"lips_thickness":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"facemix":{"skinMix":0,"defaultShapeMix":0.0,"defaultSkinMix":0.0,"shapeMix":0},"eye_opening":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"chimp_bone_width":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"nose_4":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"ageing":{"defaultTexture":0,"defaultItem":-1,"item":-1,"texture":0},"nose_3":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"nose_2":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"jaw_bone_width":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"eye_color":{"defaultTexture":0,"defaultItem":-1,"item":-1,"texture":0},"decals":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"eyebrown_high":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"mask":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"glass":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"watch":{"defaultTexture":0,"defaultItem":-1,"item":-1,"texture":0}}', 1);

-- Volcando estructura para tabla zap1214400-2.playerstattoos
CREATE TABLE IF NOT EXISTS `playerstattoos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` longtext DEFAULT NULL,
  `tattoos` longtext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Volcando datos para la tabla zap1214400-2.playerstattoos: ~0 rows (aproximadamente)

-- Volcando estructura para tabla zap1214400-2.players_pd_presets
CREATE TABLE IF NOT EXISTS `players_pd_presets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` longtext DEFAULT NULL,
  `ped` longtext DEFAULT NULL,
  `components` longtext DEFAULT NULL,
  `props` longtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Volcando datos para la tabla zap1214400-2.players_pd_presets: ~0 rows (aproximadamente)

-- Volcando estructura para tabla zap1214400-2.player_boats
CREATE TABLE IF NOT EXISTS `player_boats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `plate` varchar(50) DEFAULT NULL,
  `boathouse` varchar(50) DEFAULT NULL,
  `fuel` int(11) NOT NULL DEFAULT 100,
  `state` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Volcando datos para la tabla zap1214400-2.player_boats: ~0 rows (aproximadamente)

-- Volcando estructura para tabla zap1214400-2.player_contacts
CREATE TABLE IF NOT EXISTS `player_contacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `number` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Volcando datos para la tabla zap1214400-2.player_contacts: ~0 rows (aproximadamente)

-- Volcando estructura para tabla zap1214400-2.player_crafting
CREATE TABLE IF NOT EXISTS `player_crafting` (
  `crafter_hash` varchar(50) NOT NULL,
  `citizenid` varchar(50) NOT NULL,
  `experience` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla zap1214400-2.player_crafting: ~0 rows (aproximadamente)

-- Volcando estructura para tabla zap1214400-2.player_crops
CREATE TABLE IF NOT EXISTS `player_crops` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `coords` longtext DEFAULT NULL,
  `seed` varchar(100) NOT NULL,
  `water` double NOT NULL,
  `food` double NOT NULL,
  `stage` double NOT NULL,
  `rate` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla zap1214400-2.player_crops: ~0 rows (aproximadamente)

-- Volcando estructura para tabla zap1214400-2.player_emotes
CREATE TABLE IF NOT EXISTS `player_emotes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `player_id` varchar(50) DEFAULT NULL,
  `emote_category` varchar(255) NOT NULL,
  `emote_index` int(11) NOT NULL,
  `emote_type` varchar(255) NOT NULL,
  `emote_value` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla zap1214400-2.player_emotes: ~0 rows (aproximadamente)

-- Volcando estructura para tabla zap1214400-2.player_houses
CREATE TABLE IF NOT EXISTS `player_houses` (
  `house` varchar(50) NOT NULL,
  `identifier` varchar(50) DEFAULT NULL,
  `citizenid` varchar(50) DEFAULT NULL,
  `insideId` varchar(50) DEFAULT NULL,
  `keyholders` text DEFAULT NULL,
  `decorations` text DEFAULT NULL,
  `stash` text DEFAULT NULL,
  `houseID` varchar(50) DEFAULT NULL,
  `outfit` text DEFAULT NULL,
  `logout` text DEFAULT NULL,
  `decorateStash` text DEFAULT NULL,
  `charge` text DEFAULT NULL,
  `credit` varchar(50) DEFAULT NULL,
  `creditPrice` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`house`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla zap1214400-2.player_houses: ~0 rows (aproximadamente)

-- Volcando estructura para tabla zap1214400-2.player_jobs
CREATE TABLE IF NOT EXISTS `player_jobs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `jobname` varchar(50) DEFAULT NULL,
  `employees` text DEFAULT NULL,
  `maxEmployee` tinyint(11) DEFAULT 15,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=151 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Volcando datos para la tabla zap1214400-2.player_jobs: ~42 rows (aproximadamente)
INSERT INTO `player_jobs` (`id`, `jobname`, `employees`, `maxEmployee`) VALUES
	(106, 'coolbeans', '[]', 15),
	(107, 'pawn', '{"ZRP16935":{"name":"wdw dwdwdw","cid":"ZRP16935","grade":4}}', 15),
	(108, 'tatto', '[]', 15),
	(109, 'realestate', '{"POU11431":{"grade":3,"cid":"POU11431","name":"dwdwdw dwdwd"}}', 15),
	(110, 'yellowjack', '[]', 15),
	(111, 'beanmachine', '[]', 15),
	(112, 'redline', '[]', 15),
	(113, 'casino', '[]', 15),
	(114, 'garbage', '[]', 15),
	(115, 'admin', '[]', 15),
	(116, 'taxi', '{"ZRP16935":{"name":"wdw dwdwdw","grade":4,"cid":"ZRP16935"}}', 15),
	(117, 'cigar', '[]', 15),
	(118, 'logistics', '[]', 15),
	(119, 'planepilot', '[]', 15),
	(120, 'catcafe', '[]', 15),
	(121, 'vanilla', '{"ZRP16935":{"name":"wdw dwdwdw","cid":"ZRP16935","grade":4}}', 15),
	(122, 'taco', '{"ZRP16935":{"grade":0,"cid":"ZRP16935","name":"wdw dwdwdw"}}', 15),
	(123, 'pizzathis', '[]', 15),
	(124, 'trucker', '[]', 15),
	(125, 'tuner', '[]', 15),
	(126, 'corrections', '[]', 15),
	(127, 'henhouse', '[]', 15),
	(128, 'judge', '[]', 15),
	(129, 'tequilala', '[]', 15),
	(130, 'drugdealer', '[]', 15),
	(131, 'burgershot', '{"ZRP16935":{"cid":"ZRP16935","grade":4,"name":"wdw dwdwdw"}}', 15),
	(132, 'tow', '[]', 15),
	(133, 'telco', '[]', 15),
	(134, 'whitewidow', '[]', 15),
	(135, 'lawyer', '[]', 15),
	(136, 'bus', '[]', 15),
	(137, 'reporter', '[]', 15),
	(138, 'police', '{"POU11431":{"name":"dwdwdw dwdwd","cid":"POU11431","grade":0}}', 15),
	(139, 'comic', '{"POU11431":{"name":"dwdwdw dwdwd","cid":"POU11431","grade":1}}', 15),
	(140, 'mechanic', '{"XAJ76238":{"grade":4,"cid":"XAJ76238","name":"dwdwd dwdw"}}', 15),
	(141, 'ambulance', '{"KMR55667":{"cid":"KMR55667","name":"Minguito Martinez","grade":3}}', 15),
	(142, 'vineyard', '[]', 15),
	(143, 'mechanic2', '[]', 15),
	(144, 'mechanic3', '[]', 15),
	(145, 'bennys', '[]', 15),
	(146, 'hotdog', '[]', 15),
	(147, 'cardealer', '[]', 15),
	(148, 'beeker', '[]', 15),
	(149, 'uwu', '{"XAJ76238":{"name":"dwdwd dwdw","grade":1,"cid":"XAJ76238"}}', 15),
	(150, 'club77', '{"POU11431":{"cid":"POU11431","name":"dwdwdw dwdwd","grade":4}}', 15);

-- Volcando estructura para tabla zap1214400-2.player_mails
CREATE TABLE IF NOT EXISTS `player_mails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `sender` varchar(50) DEFAULT NULL,
  `subject` varchar(50) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `read` tinyint(4) DEFAULT 0,
  `mailid` int(11) DEFAULT NULL,
  `date` timestamp NULL DEFAULT current_timestamp(),
  `button` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Volcando datos para la tabla zap1214400-2.player_mails: ~0 rows (aproximadamente)

-- Volcando estructura para tabla zap1214400-2.player_outfits
CREATE TABLE IF NOT EXISTS `player_outfits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `outfitname` varchar(50) NOT NULL,
  `model` varchar(50) DEFAULT NULL,
  `skin` text DEFAULT NULL,
  `outfitId` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`),
  KEY `outfitId` (`outfitId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla zap1214400-2.player_outfits: ~0 rows (aproximadamente)

-- Volcando estructura para tabla zap1214400-2.player_quick_emotes
CREATE TABLE IF NOT EXISTS `player_quick_emotes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `player_id` varchar(255) NOT NULL,
  `keybinds` int(11) NOT NULL,
  `category` varchar(255) NOT NULL,
  `emote_index` int(11) NOT NULL,
  `pQuickEmote` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla zap1214400-2.player_quick_emotes: ~0 rows (aproximadamente)

-- Volcando estructura para tabla zap1214400-2.player_transactions
CREATE TABLE IF NOT EXISTS `player_transactions` (
  `id` varchar(50) NOT NULL,
  `isFrozen` int(11) DEFAULT 0,
  `transactions` longtext DEFAULT '[]',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla zap1214400-2.player_transactions: ~0 rows (aproximadamente)

-- Volcando estructura para tabla zap1214400-2.player_vehicles
CREATE TABLE IF NOT EXISTS `player_vehicles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `license` varchar(50) DEFAULT NULL,
  `citizenid` varchar(50) DEFAULT NULL,
  `vehicle` varchar(50) DEFAULT NULL,
  `hash` varchar(50) DEFAULT NULL,
  `mods` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `plate` varchar(50) NOT NULL,
  `fakeplate` varchar(50) DEFAULT NULL,
  `garage` varchar(50) DEFAULT NULL,
  `fuel` int(11) DEFAULT 100,
  `engine` float DEFAULT 1000,
  `body` float DEFAULT 1000,
  `state` int(11) DEFAULT 1,
  `depotprice` int(11) NOT NULL DEFAULT 0,
  `drivingdistance` int(50) DEFAULT NULL,
  `status` text DEFAULT NULL,
  `balance` int(11) NOT NULL DEFAULT 0,
  `paymentamount` int(11) NOT NULL DEFAULT 0,
  `paymentsleft` int(11) NOT NULL DEFAULT 0,
  `financetime` int(11) NOT NULL DEFAULT 0,
  `nosColour` text DEFAULT NULL,
  `traveldistance` int(50) DEFAULT 0,
  `noslevel` int(10) DEFAULT 0,
  `hasnitro` tinyint(4) DEFAULT 0,
  `vinnumber` varchar(50) DEFAULT NULL,
  `vinscratch` int(2) DEFAULT 0,
  `datefinish` date NOT NULL DEFAULT '2999-06-01',
  `logs` longtext DEFAULT '[]',
  PRIMARY KEY (`id`),
  KEY `plate` (`plate`),
  KEY `citizenid` (`citizenid`),
  KEY `license` (`license`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla zap1214400-2.player_vehicles: ~4 rows (aproximadamente)
INSERT INTO `player_vehicles` (`id`, `license`, `citizenid`, `vehicle`, `hash`, `mods`, `plate`, `fakeplate`, `garage`, `fuel`, `engine`, `body`, `state`, `depotprice`, `drivingdistance`, `status`, `balance`, `paymentamount`, `paymentsleft`, `financetime`, `nosColour`, `traveldistance`, `noslevel`, `hasnitro`, `vinnumber`, `vinscratch`, `datefinish`, `logs`) VALUES
	(1, 'license:d2564bd9f174527e1192ca089244188b2dee918e', 'NWG45939', 'npolvic', '356464800', '{"modTurbo":false,"modAerials":-1,"neonEnabled":[false,false,false,false],"modStruts":-1,"modKit49":-1,"modSpoilers":-1,"modSteeringWheel":-1,"wheelColor":0,"modWindows":-1,"modDashboard":-1,"modFrame":-1,"modDoorSpeaker":-1,"modRightFender":-1,"modRearBumper":-1,"bodyHealth":1000.0592475178704,"modKit17":-1,"tireHealth":{"1":1000.0,"2":1000.0,"3":1000.0,"0":1000.0},"modHorns":-1,"modOrnaments":-1,"modFrontWheels":-1,"modGrille":-1,"neonColor":[255,0,255],"modHydrolic":-1,"modBackWheels":-1,"plateIndex":4,"modKit21":-1,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modCustomTiresR":false,"modFrontBumper":-1,"interiorColor":111,"modSeats":-1,"pearlescentColor":0,"modAPlate":-1,"modXenon":false,"modEngineBlock":-1,"modDial":-1,"tyreSmokeColor":[255,255,255],"windowTint":-1,"modShifterLeavers":-1,"modKit47":-1,"engineHealth":1000.0592475178704,"xenonColor":255,"wheels":1,"dashboardColor":111,"modTransmission":-1,"wheelSize":0.0,"modSuspension":-1,"wheelWidth":0.0,"model":-901056903,"modKit19":-1,"modSpeakers":-1,"modHood":-1,"modRoof":-1,"modEngine":-1,"modTrunk":-1,"modBrakes":-1,"liveryRoof":-1,"modTrimA":-1,"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modPlateHolder":-1,"oilLevel":4.76596940834568,"color2":62,"modSideSkirt":-1,"windowStatus":{"1":true,"2":true,"3":true,"4":false,"5":false,"6":true,"7":true,"0":true},"modArmor":-1,"extras":{"6":true,"7":false,"4":false,"5":false,"2":false,"3":false,"1":false},"fuelLevel":100.08535757525947,"modArchCover":-1,"tankHealth":1000.0592475178704,"modTrimB":-1,"dirtLevel":0.0,"modFender":-1,"modTank":-1,"modAirFilter":-1,"modVanityPlate":-1,"modLivery":-1,"modExhaust":-1,"plate":"29BMY597","modSmokeEnabled":false,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"color1":62,"modCustomTiresF":false}', 'POL1446', NULL, NULL, 100, 1000, 1000, 0, 500, NULL, NULL, 0, 0, 0, 0, NULL, 0, 0, 0, NULL, 0, '2999-06-01', '[]'),
	(2, 'license:d2564bd9f174527e1192ca089244188b2dee918e', 'NWG45939', 'npolstang', '-938325879', '{"modTurbo":false,"modAerials":-1,"neonEnabled":[false,false,false,false],"modStruts":-1,"modKit49":-1,"modSpoilers":-1,"modSteeringWheel":-1,"wheelColor":0,"modWindows":-1,"modDashboard":-1,"modFrame":-1,"modDoorSpeaker":-1,"modRightFender":-1,"modRearBumper":-1,"bodyHealth":1000.0592475178704,"modKit17":-1,"tireHealth":{"1":1000.0,"2":1000.0,"3":1000.0,"0":1000.0},"modHorns":-1,"modOrnaments":-1,"modFrontWheels":-1,"modGrille":-1,"neonColor":[255,0,255],"modHydrolic":-1,"modBackWheels":-1,"plateIndex":4,"modKit21":-1,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modCustomTiresR":false,"modFrontBumper":-1,"interiorColor":111,"modSeats":-1,"pearlescentColor":66,"modAPlate":-1,"modXenon":false,"modEngineBlock":-1,"modDial":-1,"tyreSmokeColor":[255,255,255],"windowTint":-1,"modShifterLeavers":-1,"modKit47":-1,"engineHealth":1000.0592475178704,"xenonColor":255,"wheels":7,"dashboardColor":111,"modTransmission":-1,"wheelSize":0.0,"modSuspension":-1,"wheelWidth":0.0,"model":-1336796853,"modKit19":-1,"modSpeakers":-1,"modHood":-1,"modRoof":-1,"modEngine":-1,"modTrunk":-1,"modBrakes":-1,"liveryRoof":-1,"modTrimA":-1,"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modPlateHolder":-1,"oilLevel":4.76596940834568,"color2":141,"modSideSkirt":-1,"windowStatus":{"1":true,"2":true,"3":true,"4":false,"5":false,"6":true,"7":true,"0":true},"modArmor":-1,"extras":{"6":false,"4":true,"5":false,"2":false,"3":false,"1":false},"fuelLevel":100.08535757525947,"modArchCover":-1,"tankHealth":1000.0592475178704,"modTrimB":-1,"dirtLevel":3.9716411736214,"modFender":-1,"modTank":-1,"modAirFilter":-1,"modVanityPlate":-1,"modLivery":-1,"modExhaust":-1,"plate":"47EIA096","modSmokeEnabled":false,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"color1":141,"modCustomTiresF":false}', 'POL1081', NULL, NULL, 100, 1000, 1000, 0, 500, NULL, NULL, 0, 0, 0, 0, NULL, 0, 0, 0, NULL, 0, '2999-06-01', '[]'),
	(16, 'license:d2564bd9f174527e1192ca089244188b2dee918e', 'KMR55667', 'reaper', '234062309', '{"modFrame":-1,"modTrimB":-1,"modFrontBumper":-1,"modCustomTiresR":false,"modFrontWheels":-1,"modSeats":-1,"modSideSkirt":-1,"engineHealth":1000.0592475178704,"modWindows":-1,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"xenonColor":255,"tyreSmokeColor":[255,255,255],"neonEnabled":[false,false,false,false],"dirtLevel":3.17731293889712,"modHood":-1,"modSteeringWheel":-1,"modSmokeEnabled":false,"modKit49":-1,"modHorns":-1,"tankHealth":999.2649192831461,"modSpoilers":-1,"tireHealth":{"1":1000.0,"2":1000.0,"3":1000.0,"0":1000.0},"modLivery":-1,"modGrille":-1,"modHydrolic":-1,"plateIndex":0,"modDashboard":-1,"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modTurbo":false,"pearlescentColor":5,"color1":3,"liveryRoof":-1,"oilLevel":4.76596940834568,"modBackWheels":-1,"modXenon":false,"modAirFilter":-1,"modBrakes":-1,"bodyHealth":989.7329804664547,"modRightFender":-1,"modExhaust":-1,"modKit47":-1,"fuelLevel":88.96476228911952,"modVanityPlate":-1,"modSpeakers":-1,"windowStatus":{"1":true,"2":false,"3":false,"4":false,"5":false,"6":true,"7":false,"0":true},"plate":"0MB924KK","modKit19":-1,"modRoof":-1,"modArchCover":-1,"modKit21":-1,"interiorColor":0,"modSuspension":-1,"wheels":7,"modFender":-1,"modArmor":-1,"extras":[],"modOrnaments":-1,"model":234062309,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modPlateHolder":-1,"modShifterLeavers":-1,"modAPlate":-1,"modCustomTiresF":false,"modEngineBlock":-1,"modStruts":-1,"modDial":-1,"wheelWidth":1.0,"modDoorSpeaker":-1,"modTank":-1,"wheelSize":1.0,"color2":3,"neonColor":[255,255,255],"modTransmission":-1,"modRearBumper":-1,"modTrunk":-1,"wheelColor":156,"windowTint":-1,"modTrimA":-1,"modEngine":-1,"dashboardColor":0,"modAerials":-1,"modKit17":-1}', '0MB924KK', NULL, 'pillboxgarage', 89, 1000, 990, 1, 0, NULL, NULL, 0, 0, 0, 0, NULL, 0, 0, 0, NULL, 0, '2999-06-01', '[{"garage":"Pillbox Garage Parking","type":"Stored","time":"2024-07-31-07:14"},{"garage":"Pillbox Garage Parking","type":"Take Out","time":"2024-07-31-07:14"},{"garage":"Depot Lot","type":"Take Depot","time":"2024-07-31-08:13"},{"garage":"Pillbox Garage Parking","type":"Stored","time":"2024-07-31-08:14"},{"garage":"Pillbox Garage Parking","type":"Take Out","time":"2024-07-31-08:15"},{"garage":"Pillbox Garage Parking","type":"Stored","time":"2024-07-31-08:15"},{"garage":"Pillbox Garage Parking","type":"Take Out","time":"2024-07-31-08:18"},{"garage":"Pillbox Garage Parking","type":"Stored","time":"2024-07-31-08:19"}]'),
	(17, 'license:d2564bd9f174527e1192ca089244188b2dee918e', 'KMR55667', 'ardent', '159274291', '{"modGrille":-1,"modBrakes":-1,"modBackWheels":-1,"neonColor":[255,255,255],"plateIndex":0,"modLivery":-1,"modTrimB":-1,"modTransmission":-1,"modSmokeEnabled":false,"interiorColor":93,"modDoorSpeaker":-1,"modSteeringWheel":-1,"modFrontWheels":-1,"modKit19":-1,"modFender":-1,"tankHealth":1000.0592475178704,"modAerials":-1,"modTurbo":false,"modStruts":-1,"tireHealth":{"1":1000.0,"2":1000.0,"3":1000.0,"0":1000.0},"xenonColor":255,"tyreSmokeColor":[255,255,255],"modAirFilter":-1,"bodyHealth":1000.0592475178704,"wheelSize":0.0,"modOrnaments":-1,"modArmor":-1,"modSuspension":-1,"modTrunk":-1,"wheelColor":112,"modEngineBlock":-1,"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modFrame":-1,"modDial":-1,"modRoof":-1,"modSeats":-1,"model":159274291,"modKit49":-1,"modEngine":-1,"modArchCover":-1,"modCustomTiresR":false,"modAPlate":-1,"windowStatus":{"1":true,"2":true,"3":true,"4":false,"5":false,"6":true,"7":true,"0":false},"liveryRoof":-1,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modHydrolic":-1,"modKit47":-1,"neonEnabled":[false,false,false,false],"modExhaust":-1,"modTank":-1,"modKit21":-1,"modSpoilers":-1,"extras":[],"modSideSkirt":-1,"modHood":-1,"dirtLevel":11.12059528613994,"modRightFender":-1,"modKit17":-1,"pearlescentColor":87,"modHorns":-1,"modShifterLeavers":-1,"modXenon":false,"modCustomTiresF":false,"dashboardColor":93,"fuelLevel":93.73073169746522,"modDashboard":-1,"modVanityPlate":-1,"color1":88,"modSpeakers":-1,"wheelWidth":0.0,"modPlateHolder":-1,"modWindows":-1,"oilLevel":6.35462587779425,"modFrontBumper":-1,"color2":0,"windowTint":-1,"wheels":1,"modTrimA":-1,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"plate":"5SF608JT","engineHealth":1000.0592475178704,"modRearBumper":-1}', '5SF608JT', NULL, 'pillboxgarage', 94, 1000, 1000, 1, 500, NULL, NULL, 0, 0, 0, 0, NULL, 0, 0, 0, NULL, 0, '2999-06-01', '[{"type":"Stored","garage":"Pillbox Garage Parking","time":"2024-07-31-08:12"}]');

-- Volcando estructura para tabla zap1214400-2.player_warns
CREATE TABLE IF NOT EXISTS `player_warns` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `senderIdentifier` varchar(50) DEFAULT NULL,
  `targetIdentifier` varchar(50) DEFAULT NULL,
  `reason` text DEFAULT NULL,
  `warnId` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Volcando datos para la tabla zap1214400-2.player_warns: ~0 rows (aproximadamente)

-- Volcando estructura para tabla zap1214400-2.playlists
CREATE TABLE IF NOT EXISTS `playlists` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla zap1214400-2.playlists: ~5 rows (aproximadamente)
INSERT INTO `playlists` (`id`, `label`) VALUES
	(50, '80s'),
	(51, '90s'),
	(53, 'Metal'),
	(54, 'Random music'),
	(55, 'example');

-- Volcando estructura para tabla zap1214400-2.playlist_songs
CREATE TABLE IF NOT EXISTS `playlist_songs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playlist` int(11) DEFAULT NULL,
  `link` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla zap1214400-2.playlist_songs: ~6 rows (aproximadamente)
INSERT INTO `playlist_songs` (`id`, `playlist`, `link`) VALUES
	(26, 0, 'https://www.youtube.com/watch?v=EYAjqqWuBxg'),
	(28, 0, 'https://www.youtube.com/watch?v=yXeJ8ZRActM'),
	(29, 54, 'https://www.youtube.com/watch?v=yXeJ8ZRActM'),
	(30, 54, 'https://www.youtube.com/watch?v=CYgDUBH2Zro'),
	(32, 50, 'https://www.youtube.com/watch?v=CYgDUBH2Zro'),
	(33, 54, 'https://www.youtube.com/watch?v=L3wKzyIN1yk');

-- Volcando estructura para tabla zap1214400-2.properties
CREATE TABLE IF NOT EXISTS `properties` (
  `property_id` int(11) NOT NULL AUTO_INCREMENT,
  `owner_citizenid` varchar(50) DEFAULT NULL,
  `street` varchar(100) DEFAULT NULL,
  `region` varchar(100) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `has_access` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT json_array() CHECK (json_valid(`has_access`)),
  `extra_imgs` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT json_array() CHECK (json_valid(`extra_imgs`)),
  `furnitures` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT json_array() CHECK (json_valid(`furnitures`)),
  `for_sale` tinyint(1) NOT NULL DEFAULT 1,
  `price` int(11) NOT NULL DEFAULT 0,
  `shell` varchar(50) NOT NULL,
  `apartment` varchar(50) DEFAULT NULL,
  `door_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`door_data`)),
  `garage_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`garage_data`)),
  PRIMARY KEY (`property_id`),
  UNIQUE KEY `UQ_owner_apartment` (`owner_citizenid`,`apartment`),
  CONSTRAINT `FK_owner_citizenid` FOREIGN KEY (`owner_citizenid`) REFERENCES `players` (`citizenid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Volcando datos para la tabla zap1214400-2.properties: ~0 rows (aproximadamente)

-- Volcando estructura para tabla zap1214400-2.punchmachine
CREATE TABLE IF NOT EXISTS `punchmachine` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `score` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla zap1214400-2.punchmachine: ~0 rows (aproximadamente)

-- Volcando estructura para tabla zap1214400-2.save_jobs
CREATE TABLE IF NOT EXISTS `save_jobs` (
  `cid` varchar(100) NOT NULL,
  `job` varchar(100) NOT NULL,
  `grade` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Volcando datos para la tabla zap1214400-2.save_jobs: ~0 rows (aproximadamente)

-- Volcando estructura para tabla zap1214400-2.selldrugs_phone
CREATE TABLE IF NOT EXISTS `selldrugs_phone` (
  `player` varchar(255) NOT NULL,
  `settings` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Volcando datos para la tabla zap1214400-2.selldrugs_phone: ~17 rows (aproximadamente)
INSERT INTO `selldrugs_phone` (`player`, `settings`) VALUES
	('NWG45939', '{"statusAlertsSound":true,"statusAlerts":true}'),
	('ZWO74305', '{"statusAlertsSound":true,"statusAlerts":true}'),
	('ZRP16935', '{"statusAlertsSound":true,"statusAlerts":true}'),
	('MTS42741', '{"statusAlerts":true,"statusAlertsSound":true}'),
	('OYD43612', '{"statusAlertsSound":true,"statusAlerts":true}'),
	('PAJ62435', '{"statusAlerts":true,"statusAlertsSound":true}'),
	('XAJ76238', '{"statusAlerts":true,"statusAlertsSound":true}'),
	('POU11431', '{"statusAlerts":true,"statusAlertsSound":true}'),
	('SRG34852', '{"statusAlertsSound":true,"statusAlerts":true}'),
	('GNA74624', '{"statusAlertsSound":true,"statusAlerts":true}'),
	('IEW99125', '{"statusAlerts":true,"statusAlertsSound":true}'),
	('ZFQ53507', '{"statusAlerts":true,"statusAlertsSound":true}'),
	('KMR55667', '{"statusAlertsSound":true,"statusAlerts":true}'),
	('PIR50196', '{"statusAlertsSound":true,"statusAlerts":true}'),
	('XRP80046', '{"statusAlerts":true,"statusAlertsSound":true}'),
	('OTP90615', '{"statusAlertsSound":true,"statusAlerts":true}'),
	('DMI50978', '{"statusAlertsSound":true,"statusAlerts":true}'),
	('SVB88291', '{"statusAlerts":true,"statusAlertsSound":true}');

-- Volcando estructura para tabla zap1214400-2.selldrugs_players
CREATE TABLE IF NOT EXISTS `selldrugs_players` (
  `player` varchar(255) DEFAULT NULL,
  `respect` int(11) NOT NULL DEFAULT 0,
  `sale_skill` int(11) NOT NULL DEFAULT 0,
  `mole` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Volcando datos para la tabla zap1214400-2.selldrugs_players: ~17 rows (aproximadamente)
INSERT INTO `selldrugs_players` (`player`, `respect`, `sale_skill`, `mole`) VALUES
	('NWG45939', 0, 0, '{"criminal":[],"professional":[],"junkie":[]}'),
	('ZWO74305', 0, 0, '{"criminal":[],"junkie":[],"professional":[]}'),
	('ZRP16935', 0, 0, '{"junkie":[],"professional":[],"criminal":[]}'),
	('MTS42741', 0, 0, '{"junkie":[],"professional":[],"criminal":[]}'),
	('OYD43612', 0, 0, '{"professional":[],"junkie":[],"criminal":[]}'),
	('PAJ62435', 0, 0, '{"professional":[],"junkie":[],"criminal":[]}'),
	('XAJ76238', 0, 0, '{"junkie":[],"criminal":[],"professional":[]}'),
	('POU11431', 0, 0, '{"criminal":[],"junkie":[],"professional":[]}'),
	('SRG34852', 0, 0, '{"criminal":[],"junkie":[],"professional":[]}'),
	('GNA74624', 0, 0, '{"criminal":[],"junkie":[],"professional":[]}'),
	('IEW99125', 0, 0, '{"junkie":[],"professional":[],"criminal":[]}'),
	('ZFQ53507', 0, 0, '{"criminal":[],"professional":[],"junkie":[]}'),
	('KMR55667', 0, 0, '{"professional":[],"criminal":[],"junkie":[]}'),
	('PIR50196', 0, 0, '{"junkie":[],"criminal":[],"professional":[]}'),
	('XRP80046', 0, 0, '{"criminal":[],"professional":[],"junkie":[]}'),
	('OTP90615', 0, 0, '{"junkie":[],"professional":[],"criminal":[]}'),
	('DMI50978', 0, 0, '{"professional":[],"criminal":[],"junkie":[]}'),
	('SVB88291', 0, 0, '{"professional":[],"criminal":[],"junkie":[]}');

-- Volcando estructura para tabla zap1214400-2.shared_vehicles
CREATE TABLE IF NOT EXISTS `shared_vehicles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plate` varchar(50) NOT NULL,
  `vehicle` varchar(50) DEFAULT NULL,
  `category` varchar(50) DEFAULT 'None',
  `hash` varchar(50) DEFAULT NULL,
  `fuel` int(11) DEFAULT 100,
  `engine` float DEFAULT 1000,
  `body` float DEFAULT 1000,
  `state` varchar(50) DEFAULT 'Stored',
  `faction` varchar(50) DEFAULT NULL,
  `garage` varchar(50) DEFAULT NULL,
  `mods` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `plate` (`plate`),
  KEY `category` (`category`),
  KEY `garage` (`garage`),
  KEY `state` (`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla zap1214400-2.shared_vehicles: ~0 rows (aproximadamente)

-- Volcando estructura para tabla zap1214400-2.society
CREATE TABLE IF NOT EXISTS `society` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `money` longtext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla zap1214400-2.society: ~0 rows (aproximadamente)

-- Volcando estructura para tabla zap1214400-2.sprays
CREATE TABLE IF NOT EXISTS `sprays` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `x` float(8,4) NOT NULL,
  `y` float(8,4) NOT NULL,
  `z` float(8,4) NOT NULL,
  `rx` float(8,4) NOT NULL,
  `ry` float(8,4) NOT NULL,
  `rz` float(8,4) NOT NULL,
  `scale` float(8,4) NOT NULL,
  `text` varchar(32) NOT NULL,
  `font` varchar(32) NOT NULL,
  `color` int(3) NOT NULL,
  `interior` int(3) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Volcando datos para la tabla zap1214400-2.sprays: ~0 rows (aproximadamente)

-- Volcando estructura para tabla zap1214400-2.stashitems
CREATE TABLE IF NOT EXISTS `stashitems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stash` varchar(255) NOT NULL DEFAULT '[]',
  `items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`stash`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Volcando datos para la tabla zap1214400-2.stashitems: ~27 rows (aproximadamente)
INSERT INTO `stashitems` (`id`, `stash`, `items`) VALUES
	(4, 'ambulancestash_ZRP16935', '[]'),
	(27, 'balcaouwu', '[]'),
	(55, 'binder_KMR55667', '[{"slot":1,"name":"hardcorecomicstore","label":"Trading Card","unique":true,"type":"item","useable":true,"created":1722365000,"amount":1,"image":"hardcorecomicstore.png","info":{"grade":4,"color":2,"quality":100,"centering":8,"number":18,"graded":"False","damage":1},"weight":1000},{"slot":2,"name":"beanmachinepromo","label":"Trading Card","unique":true,"type":"item","useable":true,"created":1722365026,"amount":1,"image":"beanmachinepromo.png","info":{"grade":7,"color":8,"quality":100,"centering":2,"number":19,"damage":10,"graded":"False"},"weight":1000},null,null,null,{"slot":6,"name":"boosterpack","label":"Booster Pack","unique":false,"type":"item","useable":true,"created":1722365021,"amount":1,"image":"boosterpack.png","info":{"quality":100},"weight":1000}]'),
	(39, 'binder_POU11431', '[{"info":{"quality":100,"centering":3,"number":1,"grade":7,"damage":7,"color":10,"graded":"False"},"name":"danny","useable":true,"slot":1,"type":"item","weight":1000,"image":"danny.png","label":"Trading Card","amount":1,"unique":true,"created":1722090984},{"info":{"graded":"False","quality":100,"number":2,"grade":4,"damage":4,"color":3,"centering":4},"name":"beanmachine","slot":2,"created":1722091075,"useable":true,"image":"beanmachine.png","type":"item","label":"Trading Card","amount":1,"unique":true,"weight":1000}]'),
	(8, 'boss_burgershot', '[]'),
	(6, 'boss_pawn', '[]'),
	(19, 'boss_taxi', '[]'),
	(31, 'drinkstable1', '[]'),
	(35, 'drinkstable4', '[]'),
	(29, 'FrigorificoIngredientes', '[]'),
	(28, 'frigorificouwu', '[]'),
	(1, 'policestash_NWG45939', '[]'),
	(36, 'policestash_POU11431', '[]'),
	(30, 'policestash_XAJ76238', '[]'),
	(17, 'policestash_ZRP16935', '[]'),
	(2, 'property_1', '[]'),
	(3, 'property_2', '[]'),
	(5, 'stash1', '[]'),
	(9, 'stash2', '[]'),
	(25, 'storge2', '[null,null,null,null,null,{"created":1721868583,"slot":6,"name":"burgershot_macaroon","type":"item","label":"Macaroon","amount":1,"image":"burgershot_macaroon.png","info":{"quality":100},"weight":100,"useable":true,"unique":true}]'),
	(26, 'TabuleiroUwU1', '[]'),
	(46, 'toychest_KMR55667', '[]'),
	(42, 'toychest_POU11431', '[{"type":"item","created":1722091017,"weight":1000,"info":{"quality":100},"useable":true,"name":"wwe26","unique":true,"amount":1,"slot":1,"image":"wwe(26).png","label":"WWE Toy"},{"type":"item","created":1722091250,"weight":1000,"info":{"grade":8,"number":3,"graded":"False","centering":6,"color":9,"damage":8,"quality":100},"useable":true,"name":"burgershotpromo","unique":true,"amount":1,"slot":2,"image":"burgershotpromo.png","label":"Trading Card"},{"type":"item","created":1722094253,"weight":1000,"info":{"quality":100},"useable":true,"name":"theoffice27","unique":true,"amount":1,"slot":3,"image":"theoffice(27).png","label":"TheOffice Toy"},null,null,{"type":"item","created":1722094189,"weight":1000,"info":{"grade":4,"number":7,"graded":"False","centering":6,"color":3,"damage":2,"quality":100},"useable":true,"name":"pdm","unique":true,"amount":1,"slot":6,"image":"pdm.png","label":"Trading Card"},{"type":"item","created":1722094243,"weight":1000,"info":{"grade":8,"number":8,"graded":"False","centering":4,"color":9,"damage":10,"quality":100},"useable":true,"name":"hardcorecomicstorepromo","unique":true,"amount":1,"slot":7,"image":"hardcorecomicstorepromo.png","label":"Trading Card"},{"type":"item","created":1722094237,"weight":1000,"info":{"quality":100},"useable":true,"name":"boosterpack","unique":false,"amount":1,"slot":8,"image":"boosterpack.png","label":"Booster Pack"}]'),
	(7, 'Tray01', '[]'),
	(22, 'tray2', '[]'),
	(34, 'vanillastorage2', '[]'),
	(14, 'vu_storage', '[]');

-- Volcando estructura para tabla zap1214400-2.strain
CREATE TABLE IF NOT EXISTS `strain` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `n` int(2) DEFAULT 0,
  `p` int(2) DEFAULT 0,
  `k` int(2) DEFAULT 0,
  `rep` int(2) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla zap1214400-2.strain: ~0 rows (aproximadamente)

-- Volcando estructura para tabla zap1214400-2.territories
CREATE TABLE IF NOT EXISTS `territories` (
  `identifier` varchar(50) DEFAULT NULL,
  `grafiti` varchar(50) DEFAULT NULL,
  `coords` longtext DEFAULT NULL,
  `rotation` longtext DEFAULT NULL,
  `gang` varchar(50) DEFAULT NULL,
  `territory` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla zap1214400-2.territories: ~0 rows (aproximadamente)

-- Volcando estructura para tabla zap1214400-2.transaction_history
CREATE TABLE IF NOT EXISTS `transaction_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` text NOT NULL,
  `trans_id` int(11) NOT NULL,
  `account` text NOT NULL,
  `amount` int(11) NOT NULL,
  `trans_type` text NOT NULL,
  `receiver` text NOT NULL,
  `message` text NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Volcando datos para la tabla zap1214400-2.transaction_history: ~0 rows (aproximadamente)

-- Volcando estructura para tabla zap1214400-2.trunkitems
CREATE TABLE IF NOT EXISTS `trunkitems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plate` varchar(255) NOT NULL DEFAULT '[]',
  `items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`plate`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Volcando datos para la tabla zap1214400-2.trunkitems: ~0 rows (aproximadamente)
INSERT INTO `trunkitems` (`id`, `plate`, `items`) VALUES
	(1, '0BK714VJ', '[null,null,null,null,null,null,{"amount":1,"name":"package","label":"Suspicious Package","type":"item","created":1722088259,"slot":7,"info":{"quality":100},"useable":true,"weight":10000,"unique":true,"image":"package.png"}]');

-- Volcando estructura para tabla zap1214400-2.users
CREATE TABLE IF NOT EXISTS `users` (
  `identifier` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `money` int(11) DEFAULT NULL,
  `license` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT '',
  `skin` longtext DEFAULT NULL,
  `job` varchar(50) DEFAULT 'unemployed',
  `job_grade` int(11) DEFAULT 0,
  `loadout` longtext DEFAULT NULL,
  `position` varchar(36) DEFAULT NULL,
  `bank` int(11) DEFAULT NULL,
  `permission_level` int(11) DEFAULT NULL,
  `group` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `firstname` varchar(50) DEFAULT '',
  `lastname` varchar(50) DEFAULT '',
  `dateofbirth` varchar(25) DEFAULT '',
  `sex` varchar(10) DEFAULT '',
  `height` varchar(5) DEFAULT '',
  `is_dead` tinyint(1) DEFAULT 0,
  `last_property` varchar(255) DEFAULT NULL,
  `status` longtext DEFAULT NULL,
  `jail` int(11) NOT NULL DEFAULT 0,
  `phone_number` varchar(10) DEFAULT NULL,
  `skills` longtext DEFAULT NULL,
  `lastdigits` varchar(255) DEFAULT NULL,
  `last_house` int(11) DEFAULT 0,
  `hair_1` longtext DEFAULT NULL,
  `armour` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `zetony` int(11) DEFAULT NULL,
  `electrocourses` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla zap1214400-2.users: ~0 rows (aproximadamente)

-- Volcando estructura para tabla zap1214400-2.users_current
CREATE TABLE IF NOT EXISTS `users_current` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `cid` int(11) NOT NULL,
  `model` longtext NOT NULL,
  `drawables` longtext NOT NULL,
  `props` longtext NOT NULL,
  `drawtextures` longtext NOT NULL,
  `proptextures` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla zap1214400-2.users_current: ~0 rows (aproximadamente)

-- Volcando estructura para tabla zap1214400-2.users_face
CREATE TABLE IF NOT EXISTS `users_face` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `cid` int(11) NOT NULL,
  `hairColor` longtext NOT NULL,
  `headBlend` longtext NOT NULL,
  `headOverlay` longtext NOT NULL,
  `headStructure` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla zap1214400-2.users_face: ~0 rows (aproximadamente)

-- Volcando estructura para tabla zap1214400-2.users_motel
CREATE TABLE IF NOT EXISTS `users_motel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL,
  `building_type` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla zap1214400-2.users_motel: ~0 rows (aproximadamente)

-- Volcando estructura para tabla zap1214400-2.users_outfits
CREATE TABLE IF NOT EXISTS `users_outfits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `cid` int(11) NOT NULL,
  `model` longtext NOT NULL,
  `name` longtext NOT NULL,
  `slot` longtext NOT NULL,
  `drawables` longtext NOT NULL,
  `props` longtext NOT NULL,
  `drawtextures` longtext NOT NULL,
  `proptextures` longtext NOT NULL,
  `hairColor` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla zap1214400-2.users_outfits: ~0 rows (aproximadamente)

-- Volcando estructura para tabla zap1214400-2.users_tattoos
CREATE TABLE IF NOT EXISTS `users_tattoos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `cid` int(11) NOT NULL DEFAULT 0,
  `tattoos` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla zap1214400-2.users_tattoos: ~0 rows (aproximadamente)

-- Volcando estructura para tabla zap1214400-2.user_convictions
CREATE TABLE IF NOT EXISTS `user_convictions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `char_id` int(11) DEFAULT NULL,
  `offense` varchar(255) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla zap1214400-2.user_convictions: ~0 rows (aproximadamente)

-- Volcando estructura para tabla zap1214400-2.user_lastcharacter
CREATE TABLE IF NOT EXISTS `user_lastcharacter` (
  `steamid` varchar(255) NOT NULL,
  `charid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla zap1214400-2.user_lastcharacter: ~0 rows (aproximadamente)

-- Volcando estructura para tabla zap1214400-2.user_mdt
CREATE TABLE IF NOT EXISTS `user_mdt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `char_id` int(11) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `mugshot_url` varchar(255) DEFAULT NULL,
  `bail` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla zap1214400-2.user_mdt: ~0 rows (aproximadamente)

-- Volcando estructura para tabla zap1214400-2.vehicles
CREATE TABLE IF NOT EXISTS `vehicles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `model` varchar(60) NOT NULL,
  `price` int(11) NOT NULL,
  `category` varchar(60) DEFAULT NULL,
  `stock` int(11) DEFAULT 0,
  `brand` varchar(50) DEFAULT 'Rockstar',
  `class` char(50) DEFAULT 'D',
  `hidden` int(1) DEFAULT 0,
  `unreleased` int(11) DEFAULT 0,
  `location` varchar(255) DEFAULT 'CAR_DEALERSHIP',
  PRIMARY KEY (`model`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla zap1214400-2.vehicles: ~0 rows (aproximadamente)

-- Volcando estructura para tabla zap1214400-2.vehicle_mdt
CREATE TABLE IF NOT EXISTS `vehicle_mdt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plate` varchar(255) DEFAULT NULL,
  `stolen` bit(1) DEFAULT b'0',
  `notes` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla zap1214400-2.vehicle_mdt: ~0 rows (aproximadamente)

-- Volcando estructura para tabla zap1214400-2.weed_plants
CREATE TABLE IF NOT EXISTS `weed_plants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `timestamp` varchar(255) DEFAULT NULL,
  `x` varchar(255) DEFAULT NULL,
  `y` varchar(255) DEFAULT NULL,
  `z` varchar(255) DEFAULT NULL,
  `gender` int(1) DEFAULT 0,
  `water` float DEFAULT 10,
  `strain` text DEFAULT NULL,
  `maleseeds` text DEFAULT NULL,
  `harvest` int(1) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla zap1214400-2.weed_plants: ~0 rows (aproximadamente)

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
