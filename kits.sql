-- --------------------------------------------------------
-- Host:                         51.83.237.187
-- Wersja serwera:               8.0.32 - MySQL Community Server - GPL
-- Serwer OS:                    Linux
-- HeidiSQL Wersja:              12.0.0.6468
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Zrzut struktury bazy danych s3182_baza

-- Zrzut struktury tabela s3182_baza.fancy_kits
CREATE TABLE IF NOT EXISTS `fancy_kits` (
  `identifier` varchar(50) DEFAULT NULL,
  `starter` varchar(50) DEFAULT NULL,
  `vip` varchar(50) DEFAULT NULL,
  `booster` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Zrzucanie danych dla tabeli s3182_baza.fancy_kits: ~2 rows (około)
INSERT INTO `fancy_kits` (`identifier`, `starter`, `vip`, `booster`) VALUES
	('299fbbc087155d2a741e8c0b0291cd20ee416ffb', '1688077393', '1688077362', '1688077359'),
	('67eb58cd807e20fb4c53611e08d8c55ef48172b9', '1688077489', NULL, '1688077479');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
