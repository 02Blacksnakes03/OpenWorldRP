CREATE TABLE IF NOT EXISTS `fd_cards` (
  `num_cards` int(11) DEFAULT 0,
  `id` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
DELETE FROM `fd_cards`;
INSERT INTO `fd_cards` (`num_cards`, `id`) VALUES
	(0, 1);
