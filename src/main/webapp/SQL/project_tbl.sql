CREATE TABLE `project_tbl` (
  `subject` varchar(100) DEFAULT NULL,
  `technique` varchar(100) DEFAULT NULL,
  `outline` varchar(500) DEFAULT NULL,
  `teamMate` varchar(10) DEFAULT NULL,
  `level` varchar(10) DEFAULT NULL,
  `ref` int DEFAULT NULL,
  `startDate` varchar(50) DEFAULT NULL,
  `endDate` varchar(50) DEFAULT NULL,
  `projectName` varchar(50) DEFAULT NULL,
  `quantity` int DEFAULT '0',
  UNIQUE KEY `unique_projectName` (`projectName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
