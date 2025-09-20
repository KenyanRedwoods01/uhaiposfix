

CREATE TABLE `accounts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `account_no` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `initial_balance` double DEFAULT NULL,
  `total_balance` double NOT NULL,
  `note` text DEFAULT NULL,
  `is_default` tinyint(1) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `type` varchar(255) NOT NULL DEFAULT 'Bank Account',
  `parent_account_id` int(11) DEFAULT NULL,
  `is_payment` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO accounts VALUES("1","11111","Sales Accounts","1000","1000","this is first account","0","1","2018-12-18 02:58:02","2025-02-26 18:51:23","","Bank Account","","1");
INSERT INTO accounts VALUES("3","21211","Sa","","0","","0","0","2018-12-18 02:58:56","2025-02-19 15:59:59","","Bank Account","","1");
INSERT INTO accounts VALUES("5","bank-1","zuhair","100000","100000","","","0","2022-11-28 05:58:18","2025-02-19 16:00:03","","Bank Account","","1");
INSERT INTO accounts VALUES("6","HDHDHE333","EXPENSE ACCOUNT","2000","2000","","","0","2025-02-24 15:41:39","2025-02-26 17:31:20","","Bank Account","","1");
INSERT INTO accounts VALUES("7","QWERTY1234","WAGES","50000","50000","","","0","2025-02-24 16:03:40","2025-02-26 17:31:24","","Bank Account","","1");
INSERT INTO accounts VALUES("8","The  Bingo Hotel","The  Bingo Hotel","10000","10000","","1","1","2025-02-26 18:48:06","2025-02-26 18:48:06","","Bank Account","","1");



CREATE TABLE `adjustments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `reference_no` varchar(191) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `document` varchar(191) DEFAULT NULL,
  `total_qty` double NOT NULL,
  `item` int(11) NOT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=147 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO adjustments VALUES("18","adr-20250220-023408","3","","20","1","","2025-02-20 14:34:08","2025-03-01 21:32:44");
INSERT INTO adjustments VALUES("19","adr-20250220-023430","3","","11","1","","2025-02-20 14:34:30","2025-02-20 14:34:30");
INSERT INTO adjustments VALUES("20","adr-20250220-023525","3","","11","1","","2025-02-20 14:35:25","2025-02-20 14:35:25");
INSERT INTO adjustments VALUES("21","adr-20250220-023623","3","","12","1","","2025-02-20 14:36:23","2025-02-20 14:36:23");
INSERT INTO adjustments VALUES("22","adr-20250220-034218","3","","13","1","","2025-02-20 15:42:18","2025-02-20 15:42:18");
INSERT INTO adjustments VALUES("23","adr-20250223-070751","3","","20","1","","2025-02-23 19:07:51","2025-02-23 19:07:51");
INSERT INTO adjustments VALUES("24","adr-20250224-081423","3","","20","1","","2025-02-24 08:14:23","2025-02-24 08:14:23");
INSERT INTO adjustments VALUES("25","adr-20250224-082122","3","","10","1","","2025-02-24 08:21:22","2025-02-24 08:21:22");
INSERT INTO adjustments VALUES("26","adr-20250224-082215","3","","20","1","","2025-02-24 08:22:15","2025-02-24 08:22:15");
INSERT INTO adjustments VALUES("27","adr-20250224-084046","3","","20","1","","2025-02-24 08:40:46","2025-02-24 08:40:46");
INSERT INTO adjustments VALUES("28","adr-20250224-084216","3","","20","1","","2025-02-24 08:42:16","2025-02-24 08:42:16");
INSERT INTO adjustments VALUES("29","adr-20250224-084306","3","","15","1","","2025-02-24 08:43:06","2025-02-24 08:43:06");
INSERT INTO adjustments VALUES("30","adr-20250224-090257","3","","20","1","","2025-02-24 09:02:57","2025-02-24 09:02:57");
INSERT INTO adjustments VALUES("31","adr-20250224-090438","3","","20","1","","2025-02-24 09:04:38","2025-03-01 22:49:19");
INSERT INTO adjustments VALUES("32","adr-20250224-091413","3","","20","1","","2025-02-24 09:14:13","2025-02-24 09:14:13");
INSERT INTO adjustments VALUES("33","adr-20250224-091833","3","","20","1","","2025-02-24 09:18:33","2025-02-24 09:18:33");
INSERT INTO adjustments VALUES("34","adr-20250224-092124","3","","20","1","","2025-02-24 09:21:24","2025-02-24 09:21:24");
INSERT INTO adjustments VALUES("35","adr-20250224-092535","3","","20","1","","2025-02-24 09:25:35","2025-02-24 09:25:35");
INSERT INTO adjustments VALUES("36","adr-20250224-092824","3","","20","1","","2025-02-24 09:28:24","2025-02-24 09:28:24");
INSERT INTO adjustments VALUES("37","adr-20250224-093718","3","","20","1","","2025-02-24 09:37:18","2025-02-24 09:37:18");
INSERT INTO adjustments VALUES("38","adr-20250224-094516","3","","20","1","","2025-02-24 09:45:16","2025-02-24 09:45:16");
INSERT INTO adjustments VALUES("39","adr-20250224-094954","3","","20","1","","2025-02-24 09:49:54","2025-02-24 09:49:54");
INSERT INTO adjustments VALUES("40","adr-20250224-095328","3","","20","1","","2025-02-24 09:53:28","2025-02-24 09:53:28");
INSERT INTO adjustments VALUES("41","adr-20250224-095524","3","","20","1","","2025-02-24 09:55:24","2025-02-24 09:55:24");
INSERT INTO adjustments VALUES("42","adr-20250224-095922","3","","20","1","","2025-02-24 09:59:22","2025-02-24 09:59:22");
INSERT INTO adjustments VALUES("43","adr-20250224-100257","3","","20","1","","2025-02-24 10:02:57","2025-02-24 10:02:57");
INSERT INTO adjustments VALUES("44","adr-20250224-100451","3","","20","1","","2025-02-24 10:04:51","2025-02-24 10:04:51");
INSERT INTO adjustments VALUES("45","adr-20250224-100643","3","","20","1","","2025-02-24 10:06:43","2025-02-24 10:06:43");
INSERT INTO adjustments VALUES("46","adr-20250224-020447","3","","20","1","","2025-02-24 14:04:47","2025-02-24 14:04:47");
INSERT INTO adjustments VALUES("47","adr-20250225-103056","3","","20","1","","2025-02-25 10:30:56","2025-02-25 10:30:56");
INSERT INTO adjustments VALUES("48","adr-20250225-103250","3","","20","1","","2025-02-25 10:32:50","2025-02-25 10:32:50");
INSERT INTO adjustments VALUES("49","adr-20250225-104441","3","","20","1","","2025-02-25 10:44:41","2025-02-25 10:44:41");
INSERT INTO adjustments VALUES("50","adr-20250225-104643","3","","20","1","","2025-02-25 10:46:43","2025-02-25 10:46:43");
INSERT INTO adjustments VALUES("51","adr-20250225-104826","3","","20","1","","2025-02-25 10:48:26","2025-02-25 10:48:26");
INSERT INTO adjustments VALUES("52","adr-20250225-105608","3","","20","1","","2025-02-25 10:56:08","2025-02-25 10:56:08");
INSERT INTO adjustments VALUES("53","adr-20250225-110036","3","","20","1","","2025-02-25 11:00:36","2025-02-25 11:00:36");
INSERT INTO adjustments VALUES("54","adr-20250225-110428","3","","20","1","","2025-02-25 11:04:28","2025-02-25 11:04:28");
INSERT INTO adjustments VALUES("55","adr-20250225-110719","3","","20","1","","2025-02-25 11:07:19","2025-02-25 11:07:19");
INSERT INTO adjustments VALUES("56","adr-20250225-111035","3","","20","1","","2025-02-25 11:10:35","2025-02-25 11:10:35");
INSERT INTO adjustments VALUES("57","adr-20250225-111233","3","","20","1","","2025-02-25 11:12:33","2025-02-25 11:12:33");
INSERT INTO adjustments VALUES("58","adr-20250225-111846","3","","20","1","","2025-02-25 11:18:46","2025-02-25 11:18:46");
INSERT INTO adjustments VALUES("59","adr-20250225-112313","3","","20","1","","2025-02-25 11:23:13","2025-02-25 11:23:13");
INSERT INTO adjustments VALUES("60","adr-20250225-112628","3","","20","1","","2025-02-25 11:26:28","2025-02-25 11:26:28");
INSERT INTO adjustments VALUES("61","adr-20250225-113019","3","","20","1","","2025-02-25 11:30:19","2025-02-25 11:30:19");
INSERT INTO adjustments VALUES("62","adr-20250225-113430","3","","20","1","","2025-02-25 11:34:30","2025-02-25 11:34:30");
INSERT INTO adjustments VALUES("63","adr-20250225-113430","3","","20","1","","2025-02-25 11:34:30","2025-02-25 11:34:30");
INSERT INTO adjustments VALUES("64","adr-20250225-113808","3","","20","1","","2025-02-25 11:38:08","2025-02-25 11:38:08");
INSERT INTO adjustments VALUES("65","adr-20250225-114057","3","","20","1","","2025-02-25 11:40:57","2025-02-25 11:40:57");
INSERT INTO adjustments VALUES("66","adr-20250225-114506","3","","20","1","","2025-02-25 11:45:06","2025-02-25 11:45:06");
INSERT INTO adjustments VALUES("67","adr-20250226-082834","3","","50","1","","2025-02-26 20:28:34","2025-02-26 20:28:34");
INSERT INTO adjustments VALUES("68","adr-20250226-083003","4","","10","1","","2025-02-26 20:30:03","2025-02-26 20:30:03");
INSERT INTO adjustments VALUES("69","adr-20250301-095241","3","","10","1","","2025-03-01 21:52:41","2025-03-01 21:52:41");
INSERT INTO adjustments VALUES("70","adr-20250301-095342","3","","101","2","","2025-03-01 21:53:42","2025-03-01 22:43:28");
INSERT INTO adjustments VALUES("71","adr-20250301-104632","3","","20","1","","2025-03-01 22:46:32","2025-03-01 22:49:49");
INSERT INTO adjustments VALUES("72","adr-20250301-105540","3","","20","1","","2025-03-01 22:55:40","2025-03-01 22:55:40");
INSERT INTO adjustments VALUES("73","adr-20250301-105625","3","","19","1","","2025-03-01 22:56:25","2025-03-01 22:56:25");
INSERT INTO adjustments VALUES("74","adr-20250301-110117","3","Beans.jpg","70","1","","2025-03-01 23:01:17","2025-03-01 23:01:17");
INSERT INTO adjustments VALUES("75","adr-20250301-110351","3","Beans.jpg","1","1","","2025-03-01 23:03:51","2025-03-01 23:03:51");
INSERT INTO adjustments VALUES("76","adr-20250301-110623","3","uji.jpg","100","1","","2025-03-01 23:06:23","2025-03-01 23:06:23");
INSERT INTO adjustments VALUES("77","adr-20250301-110922","3","","80","1","","2025-03-01 23:09:22","2025-03-01 23:09:22");
INSERT INTO adjustments VALUES("78","adr-20250301-110950","3","","1","1","","2025-03-01 23:09:50","2025-03-01 23:09:50");
INSERT INTO adjustments VALUES("79","adr-20250301-111345","3","1389218444898.jpeg","80","1","","2025-03-01 23:13:45","2025-03-01 23:13:45");
INSERT INTO adjustments VALUES("80","adr-20250301-111506","3","","30","1","","2025-03-01 23:15:06","2025-03-01 23:15:06");
INSERT INTO adjustments VALUES("81","adr-20250301-112046","3","","80","1","","2025-03-01 23:20:46","2025-03-01 23:20:46");
INSERT INTO adjustments VALUES("82","adr-20250301-112050","3","uji.jpg","100","1","","2025-03-01 23:20:50","2025-03-01 23:20:50");
INSERT INTO adjustments VALUES("83","adr-20250301-112210","3","uji.jpg","100","1","","2025-03-01 23:22:10","2025-03-01 23:22:10");
INSERT INTO adjustments VALUES("84","adr-20250301-112420","3","","80","1","","2025-03-01 23:24:20","2025-03-01 23:24:20");
INSERT INTO adjustments VALUES("85","adr-20250301-112610","3","","100","1","","2025-03-01 23:26:10","2025-03-01 23:26:10");
INSERT INTO adjustments VALUES("86","adr-20250301-112657","3","","80","1","","2025-03-01 23:26:57","2025-03-01 23:26:57");
INSERT INTO adjustments VALUES("87","adr-20250301-112740","3","","306","1","","2025-03-01 23:27:40","2025-03-01 23:27:40");
INSERT INTO adjustments VALUES("88","adr-20250301-112810","3","","119","1","","2025-03-01 23:28:10","2025-03-01 23:28:10");
INSERT INTO adjustments VALUES("89","adr-20250301-112853","3","","81","1","","2025-03-01 23:28:53","2025-03-01 23:28:53");
INSERT INTO adjustments VALUES("90","adr-20250301-112856","3","","70","1","","2025-03-01 23:28:56","2025-03-01 23:28:56");
INSERT INTO adjustments VALUES("91","adr-20250301-113051","3","","10","1","","2025-03-01 23:30:51","2025-03-01 23:30:51");
INSERT INTO adjustments VALUES("92","adr-20250301-113224","3","","80","1","","2025-03-01 23:32:24","2025-03-01 23:32:24");
INSERT INTO adjustments VALUES("93","adr-20250301-113335","3","","100","1","","2025-03-01 23:33:35","2025-03-01 23:33:35");
INSERT INTO adjustments VALUES("94","adr-20250301-113502","3","","65","1","","2025-03-01 23:35:02","2025-03-01 23:35:02");
INSERT INTO adjustments VALUES("95","adr-20250301-113607","3","","50","1","","2025-03-01 23:36:07","2025-03-01 23:36:07");
INSERT INTO adjustments VALUES("96","adr-20250301-113720","3","","82","1","","2025-03-01 23:37:20","2025-03-01 23:37:20");
INSERT INTO adjustments VALUES("97","adr-20250301-113720","3","","82","1","","2025-03-01 23:37:20","2025-03-01 23:37:20");
INSERT INTO adjustments VALUES("98","adr-20250301-113810","3","","82","1","","2025-03-01 23:38:10","2025-03-01 23:38:10");
INSERT INTO adjustments VALUES("99","adr-20250301-113854","3","","80","1","","2025-03-01 23:38:54","2025-03-01 23:38:54");
INSERT INTO adjustments VALUES("100","adr-20250301-114025","3","","83","1","","2025-03-01 23:40:25","2025-03-01 23:40:25");
INSERT INTO adjustments VALUES("101","adr-20250301-114158","3","","99","1","","2025-03-01 23:41:58","2025-03-01 23:41:58");
INSERT INTO adjustments VALUES("102","adr-20250301-114201","3","","81","1","","2025-03-01 23:42:01","2025-03-01 23:42:01");
INSERT INTO adjustments VALUES("103","adr-20250301-114300","3","","80","1","","2025-03-01 23:43:00","2025-03-01 23:43:00");
INSERT INTO adjustments VALUES("104","adr-20250301-114306","3","","92","1","","2025-03-01 23:43:06","2025-03-01 23:43:06");
INSERT INTO adjustments VALUES("105","adr-20250301-114522","3","","83","1","","2025-03-01 23:45:22","2025-03-01 23:45:22");
INSERT INTO adjustments VALUES("106","adr-20250301-114534","3","","100","1","","2025-03-01 23:45:34","2025-03-01 23:45:34");
INSERT INTO adjustments VALUES("107","adr-20250301-114617","3","","2","1","","2025-03-01 23:46:17","2025-03-01 23:46:17");
INSERT INTO adjustments VALUES("108","adr-20250301-114701","3","","81","1","","2025-03-01 23:47:01","2025-03-01 23:47:01");
INSERT INTO adjustments VALUES("109","adr-20250301-114746","3","","84","1","","2025-03-01 23:47:46","2025-03-01 23:47:46");
INSERT INTO adjustments VALUES("110","adr-20250301-114851","3","","100","1","","2025-03-01 23:48:51","2025-03-01 23:48:51");
INSERT INTO adjustments VALUES("111","adr-20250301-115011","3","","20","1","","2025-03-01 23:50:11","2025-03-01 23:50:11");
INSERT INTO adjustments VALUES("112","adr-20250301-115031","3","","100","1","","2025-03-01 23:50:31","2025-03-01 23:50:31");
INSERT INTO adjustments VALUES("113","adr-20250301-115219","3","","61","1","","2025-03-01 23:52:19","2025-03-01 23:52:19");
INSERT INTO adjustments VALUES("114","adr-20250301-115337","3","","80","1","","2025-03-01 23:53:37","2025-03-01 23:53:37");
INSERT INTO adjustments VALUES("115","adr-20250301-115422","3","","82","1","","2025-03-01 23:54:22","2025-03-01 23:54:22");
INSERT INTO adjustments VALUES("116","adr-20250301-115447","3","","82","1","","2025-03-01 23:54:47","2025-03-01 23:54:47");
INSERT INTO adjustments VALUES("117","adr-20250301-115607","3","","82","1","","2025-03-01 23:56:07","2025-03-01 23:56:07");
INSERT INTO adjustments VALUES("118","adr-20250301-115841","3","","82","1","","2025-03-01 23:58:41","2025-03-01 23:58:41");
INSERT INTO adjustments VALUES("119","adr-20250302-120140","3","","80","1","","2025-03-02 00:01:40","2025-03-02 00:01:40");
INSERT INTO adjustments VALUES("120","adr-20250302-120654","3","","1","1","","2025-03-02 00:06:54","2025-03-02 00:06:54");
INSERT INTO adjustments VALUES("121","adr-20250302-120737","3","","1","1","","2025-03-02 00:07:37","2025-03-02 00:07:37");
INSERT INTO adjustments VALUES("122","adr-20250302-120838","3","","50","1","","2025-03-02 00:08:38","2025-03-02 00:08:38");
INSERT INTO adjustments VALUES("123","adr-20250302-120923","3","","2","1","","2025-03-02 00:09:23","2025-03-02 00:09:23");
INSERT INTO adjustments VALUES("124","adr-20250302-121019","3","","1","1","","2025-03-02 00:10:19","2025-03-02 00:10:19");
INSERT INTO adjustments VALUES("125","adr-20250302-121139","3","","1","1","","2025-03-02 00:11:39","2025-03-02 00:11:39");
INSERT INTO adjustments VALUES("126","adr-20250302-121648","3","","14","1","","2025-03-02 00:16:48","2025-03-02 00:16:48");
INSERT INTO adjustments VALUES("127","adr-20250302-121725","3","","2","1","","2025-03-02 00:17:25","2025-03-02 00:17:25");
INSERT INTO adjustments VALUES("128","adr-20250302-121817","3","","12","1","","2025-03-02 00:18:17","2025-03-02 00:18:17");
INSERT INTO adjustments VALUES("129","adr-20250302-121902","3","","1","1","","2025-03-02 00:19:02","2025-03-02 00:19:02");
INSERT INTO adjustments VALUES("130","adr-20250302-121939","3","","2","1","","2025-03-02 00:19:39","2025-03-02 00:19:39");
INSERT INTO adjustments VALUES("131","adr-20250302-122018","3","","1","1","","2025-03-02 00:20:18","2025-03-02 00:20:18");
INSERT INTO adjustments VALUES("132","adr-20250302-122051","3","","3","1","","2025-03-02 00:20:51","2025-03-02 00:20:51");
INSERT INTO adjustments VALUES("133","adr-20250302-122217","3","","4","1","","2025-03-02 00:22:17","2025-03-02 00:22:17");
INSERT INTO adjustments VALUES("134","adr-20250302-122251","3","","2","1","","2025-03-02 00:22:51","2025-03-02 00:22:51");
INSERT INTO adjustments VALUES("135","adr-20250302-122332","3","","2","1","","2025-03-02 00:23:32","2025-03-02 00:23:32");
INSERT INTO adjustments VALUES("136","adr-20250302-123157","3","","1","1","","2025-03-02 00:31:57","2025-03-02 00:31:57");
INSERT INTO adjustments VALUES("137","adr-20250304-082036","3","","100","1","","2025-03-04 20:20:36","2025-03-04 20:20:36");
INSERT INTO adjustments VALUES("138","adr-20250304-085822","3","","10","1","","2025-03-04 20:58:22","2025-03-04 20:58:22");
INSERT INTO adjustments VALUES("139","adr-20250304-090201","3","","100","1","","2025-03-04 21:02:01","2025-03-04 21:02:01");
INSERT INTO adjustments VALUES("140","adr-20250305-082334","3","","20","1","","2025-03-05 08:23:34","2025-03-05 08:23:34");
INSERT INTO adjustments VALUES("141","adr-20250305-082745","3","","100","1","","2025-03-05 08:27:45","2025-03-05 08:27:45");
INSERT INTO adjustments VALUES("142","adr-20250305-082957","3","","10","1","","2025-03-05 08:29:57","2025-03-05 08:29:57");
INSERT INTO adjustments VALUES("143","adr-20250305-083156","3","","100","1","","2025-03-05 08:31:56","2025-03-05 08:31:56");
INSERT INTO adjustments VALUES("144","adr-20250305-083721","3","","100","1","","2025-03-05 08:37:21","2025-03-05 08:37:21");
INSERT INTO adjustments VALUES("145","adr-20250305-083828","3","","100","1","","2025-03-05 08:38:28","2025-03-05 08:38:28");
INSERT INTO adjustments VALUES("146","adr-20250305-084053","3","","100","1","","2025-03-05 08:40:53","2025-03-05 08:40:53");



CREATE TABLE `attendances` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `employee_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `checkin` varchar(255) NOT NULL,
  `checkout` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO attendances VALUES("2","2025-02-24","1","47","10:00am","6:00pm","1","","2025-02-24 16:00:02","2025-02-24 16:00:02");
INSERT INTO attendances VALUES("3","2025-02-23","1","47","10:00am","6:00pm","1","","2025-02-24 16:01:22","2025-02-24 16:01:22");



CREATE TABLE `barcodes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `width` double(22,4) DEFAULT NULL,
  `height` double(22,4) DEFAULT NULL,
  `paper_width` double(22,4) DEFAULT NULL,
  `paper_height` double(22,4) DEFAULT NULL,
  `top_margin` double(22,4) DEFAULT NULL,
  `left_margin` double(22,4) DEFAULT NULL,
  `row_distance` double(22,4) DEFAULT NULL,
  `col_distance` double(22,4) DEFAULT NULL,
  `stickers_in_one_row` int(11) DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `is_continuous` tinyint(1) NOT NULL DEFAULT 0,
  `stickers_in_one_sheet` int(11) DEFAULT NULL,
  `is_custom` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO barcodes VALUES("7","20 Labels per Sheet","Sheet Size: 8.5" x 11", Label Size: 4" x 1", Label...","4.0000","1.0000","8.5000","11.0000","0.5000","0.1250","0.0000","0.1875","2","0","0","20","","","");
INSERT INTO barcodes VALUES("8","30 Labels per sheet","Sheet Size: 8.5" x 11", Label Size: 2.625" x 1", Labels per sheet: 30","2.6250","1.0000","8.5000","11.0000","0.5000","0.1880","0.0000","0.1250","3","0","0","30","","","");
INSERT INTO barcodes VALUES("9","32 Labels per sheet","Sheet Size: 8.5" x 11", Label Size: 2" x 1.25", Labels per sheet: 32","2.0000","1.2500","8.5000","11.0000","0.5000","0.2500","0.0000","0.0000","4","0","0","32","","","");
INSERT INTO barcodes VALUES("10","40 Labels per sheet","Sheet Size: 8.5" x 11", Label Size: 2" x 1", Labels per sheet: 40","2.0000","1.0000","8.5000","11.0000","0.5000","0.2500","0.0000","0.0000","4","0","0","40","","","");
INSERT INTO barcodes VALUES("11","50 Labels per Sheet","Sheet Size: 8.5" x 11", Label Size: 1.5" x 1", Labels per sheet: 50","1.5000","1.0000","8.5000","11.0000","0.5000","0.5000","0.0000","0.0000","5","0","0","50","","","");
INSERT INTO barcodes VALUES("12","Continuous Rolls - 31.75mm x 25.4mm","Label Size: 31.75mm x 25.4mm, Gap: 3.18mm","1.2500","1.0000","1.2500","0.0000","0.1250","0.0000","0.1250","0.0000","1","0","1","","","","");
INSERT INTO barcodes VALUES("13","custom","","2.0000","0.5000","3.0000","","2.0000","2.0000","0.3000","0.3000","1","0","1","28","1","","");



CREATE TABLE `billers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `image` varchar(191) DEFAULT NULL,
  `company_name` varchar(191) NOT NULL,
  `vat_number` varchar(191) DEFAULT NULL,
  `email` varchar(191) NOT NULL,
  `phone_number` varchar(191) NOT NULL,
  `address` varchar(191) NOT NULL,
  `city` varchar(191) NOT NULL,
  `state` varchar(191) DEFAULT NULL,
  `postal_code` varchar(191) DEFAULT NULL,
  `country` varchar(191) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO billers VALUES("1","Isaac Cashier","","The Bingo Hotel","","isaac.owalo@gmail.com","0707279936","Bondo","TTC","","","Kenya","1","2024-01-19 13:30:23","2025-02-24 14:25:52");
INSERT INTO billers VALUES("2","J OWADE","","The Bingo Hotel","","jowade@gmail.com","0717608640","2121","Nairobi","","","Kenya","1","2025-02-14 15:59:53","2025-02-26 15:41:06");
INSERT INTO billers VALUES("3","CASHIER 1","","The Bingo Hotel","","morrisolungah1@gmail.com","0767898876","Bondo","TTC","","","Kenya","1","2025-02-24 14:30:55","2025-02-26 15:40:44");
INSERT INTO billers VALUES("4","brian7401","","Uhai Africa","","briankibet7401@gmail.com","07176086422","2121","Nairobi","","","","0","2025-02-26 14:11:11","2025-02-26 14:13:51");
INSERT INTO billers VALUES("5","admin","","The Bingo Hotel","","adminds@example.com","071762308640","2121","Nairobi","","","","0","2025-02-26 15:09:01","2025-02-26 15:29:25");
INSERT INTO billers VALUES("6","brian7401","","The Bingo Hotel","","briankibet7401@gmail.com","07176408640","2121","Nairobi","","","","0","2025-02-26 15:29:10","2025-02-26 15:29:25");
INSERT INTO billers VALUES("7","brian7401","","The Bingo Hotel","","briankibet7401@gmail.com","0717608640","2121","Nairobi","","","","1","2025-02-26 15:32:25","2025-02-26 15:32:25");
INSERT INTO billers VALUES("8","ISAAC VILAGECAN CASHIER","","The Bingo Hotel","","isaac.owalo1@gmail.com","0707279936","17160-00100","TTC","","","Kenya","1","2025-02-26 20:33:20","2025-02-26 20:33:20");
INSERT INTO billers VALUES("9","Collins Owade","","The Bingo Hotel","","owadejr09@gmail.com","0792546625","P.o box 558-40601","Bondo","Bondo","","Kenya","1","2025-03-01 21:45:14","2025-03-01 21:45:14");
INSERT INTO billers VALUES("10","brian7401","","The Bingo Hotel","","admin@app.com","07176086422","2121","Nairobi","","","","0","2025-03-10 16:33:59","2025-03-10 16:34:09");



CREATE TABLE `brands` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) NOT NULL,
  `image` varchar(191) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO brands VALUES("20","BEVERAGES","","1","2025-02-14 17:33:51","2025-02-14 17:33:51");
INSERT INTO brands VALUES("21","MAIN DISHES","","1","2025-02-14 17:34:08","2025-02-14 17:34:08");
INSERT INTO brands VALUES("22","FIRST COURSE","","1","2025-02-14 17:34:23","2025-02-14 17:34:23");
INSERT INTO brands VALUES("24","N/A","","1","2025-02-24 08:38:46","2025-02-24 08:38:46");
INSERT INTO brands VALUES("25"," ","","1","2025-03-01 18:50:58","2025-03-01 18:50:58");



CREATE TABLE `cash_registers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cash_in_hand` double NOT NULL,
  `user_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO cash_registers VALUES("1","100","1","2","0","2024-01-19 14:46:52","2024-08-25 23:03:17");
INSERT INTO cash_registers VALUES("2","150","1","1","0","2024-01-19 14:47:08","2024-08-25 23:03:24");
INSERT INTO cash_registers VALUES("3","200","1","1","1","2024-08-25 23:04:20","2024-08-25 23:04:20");
INSERT INTO cash_registers VALUES("4","10000","47","1","1","2025-02-13 16:36:20","2025-02-13 16:36:20");
INSERT INTO cash_registers VALUES("5","10000","48","1","1","2025-02-14 16:51:49","2025-02-14 16:51:49");
INSERT INTO cash_registers VALUES("6","100000","48","3","1","2025-02-14 19:18:07","2025-02-14 19:18:07");
INSERT INTO cash_registers VALUES("7","120000","47","3","1","2025-02-15 23:36:27","2025-02-15 23:36:27");
INSERT INTO cash_registers VALUES("8","6","47","2","1","2025-02-17 19:28:46","2025-02-17 19:28:46");
INSERT INTO cash_registers VALUES("9","100000","47","3","1","2025-02-19 16:48:06","2025-02-19 16:48:06");
INSERT INTO cash_registers VALUES("10","10000","47","3","1","2025-02-19 19:27:53","2025-02-19 19:27:53");
INSERT INTO cash_registers VALUES("11","10000","47","3","1","2025-02-19 19:28:00","2025-02-19 19:28:00");
INSERT INTO cash_registers VALUES("12","10000","47","3","1","2025-02-19 19:42:52","2025-02-19 19:42:52");
INSERT INTO cash_registers VALUES("13","10000","47","3","1","2025-02-20 14:38:46","2025-02-20 14:38:46");
INSERT INTO cash_registers VALUES("14","10000","47","3","1","2025-02-20 14:40:18","2025-02-20 14:40:18");
INSERT INTO cash_registers VALUES("15","5000","50","3","1","2025-02-24 14:50:43","2025-02-24 14:50:43");
INSERT INTO cash_registers VALUES("16","900","47","4","1","2025-02-26 20:25:34","2025-02-26 20:25:34");
INSERT INTO cash_registers VALUES("17","1000","54","4","1","2025-03-04 00:29:28","2025-03-04 00:29:28");



CREATE TABLE `categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `image` varchar(191) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `woocommerce_category_id` int(11) DEFAULT NULL,
  `is_sync_disable` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO categories VALUES("29","Vegetables","","","1","","","2024-01-04 19:22:16","2024-01-08 06:22:05");
INSERT INTO categories VALUES("30","Dairy & Egg","","","0","","","2024-01-04 19:22:16","2025-02-23 18:34:47");
INSERT INTO categories VALUES("31","Meat & Fish","","","0","","","2024-01-04 19:22:16","2025-02-23 18:37:35");
INSERT INTO categories VALUES("32","Sauces & Pickles","","","0","","","2024-01-04 19:22:16","2025-02-23 18:37:45");
INSERT INTO categories VALUES("33","Candy & Chocolates","","","0","","","2024-01-04 19:22:16","2025-02-23 18:33:17");
INSERT INTO categories VALUES("34","Foods","","","0","","","2024-01-04 19:22:16","2025-02-24 08:10:50");
INSERT INTO categories VALUES("35","Cooking","","34","0","","","2024-01-04 19:22:16","2025-02-23 18:39:31");
INSERT INTO categories VALUES("36","Breakfast","","","1","","","2024-01-04 19:22:16","2024-01-08 06:22:05");
INSERT INTO categories VALUES("37","Soft Drinks","","","1","","","2024-01-04 19:22:16","2024-01-08 06:22:05");
INSERT INTO categories VALUES("38","BackPack","20240119070653.jpg","","0","","","","2025-02-23 18:34:56");
INSERT INTO categories VALUES("40","spices","","","0","","","2024-04-29 12:28:15","2025-02-23 18:40:44");
INSERT INTO categories VALUES("41","Kitchen","","","0","","","2025-02-14 17:29:28","2025-02-23 18:38:43");
INSERT INTO categories VALUES("42","BREAKFIRST","","","0","","","2025-02-14 17:34:48","2025-02-23 18:39:48");
INSERT INTO categories VALUES("43","MAIN DISHES","","","1","","","2025-02-14 17:34:55","2025-02-14 17:34:55");
INSERT INTO categories VALUES("44","BEEF","","","0","","","2025-02-14 17:35:10","2025-02-23 18:38:51");
INSERT INTO categories VALUES("45","Soft Drinks","","","0","","","2025-02-18 16:24:04","2025-02-23 18:40:11");
INSERT INTO categories VALUES("46","accessories","","","0","","","2025-02-19 11:27:46","2025-02-19 18:59:17");
INSERT INTO categories VALUES("47","food","","","0","","","2025-02-19 11:27:46","2025-02-23 18:42:10");
INSERT INTO categories VALUES("48","SNACKS","","","0","","","2025-02-20 18:04:47","2025-02-24 08:10:06");
INSERT INTO categories VALUES("49","Raw Materials","","","1","","","2025-02-24 15:20:17","2025-02-24 15:20:17");



CREATE TABLE `challans` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `reference_no` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `courier_id` int(11) NOT NULL,
  `packing_slip_list` longtext NOT NULL,
  `amount_list` longtext NOT NULL,
  `cash_list` longtext DEFAULT NULL,
  `online_payment_list` longtext DEFAULT NULL,
  `cheque_list` longtext DEFAULT NULL,
  `delivery_charge_list` longtext DEFAULT NULL,
  `status_list` longtext DEFAULT NULL,
  `closing_date` date DEFAULT NULL,
  `created_by_id` int(11) NOT NULL,
  `closed_by_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO challans VALUES("1","1001","Close","1","1","577","500","","77","50","Delivered","2024-08-11","1","1","2024-08-11 05:27:04","2024-08-11 05:28:06");
INSERT INTO challans VALUES("2","1002","Active","1","2","599","","","","","","","1","","2024-08-11 05:39:22","2024-08-11 05:39:22");



CREATE TABLE `coupons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) NOT NULL,
  `type` varchar(191) NOT NULL,
  `amount` double NOT NULL,
  `minimum_amount` double DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `used` int(11) NOT NULL,
  `expired_date` date NOT NULL,
  `user_id` int(11) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `couriers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `phone_number` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO couriers VALUES("1","Fedex","3122312","london,uk","0","2024-08-11 05:26:49","2025-02-19 15:56:47");
INSERT INTO couriers VALUES("2","G4S","7209086035","17160-00100","0","2025-02-15 23:58:38","2025-02-19 15:56:43");
INSERT INTO couriers VALUES("3","COURIER 1","0717608640","BONDO","1","2025-02-19 19:41:20","2025-02-19 19:41:20");



CREATE TABLE `currencies` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `code` varchar(191) NOT NULL,
  `exchange_rate` double NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO currencies VALUES("1","US Dollar","USD","11","0","2020-11-01 00:22:58","2025-02-13 16:15:54");
INSERT INTO currencies VALUES("2","Euro","Euro","0.95","0","2020-11-01 01:29:12","2025-02-13 16:15:58");
INSERT INTO currencies VALUES("3","Bangladeshi Taka","BDT","110","0","2023-09-06 07:05:29","2023-09-06 07:05:46");
INSERT INTO currencies VALUES("4","KES","KES","1","1","2025-02-13 16:15:41","2025-02-14 12:10:04");



CREATE TABLE `custom_fields` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `belongs_to` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `type` varchar(191) NOT NULL,
  `default_value` text DEFAULT NULL,
  `option_value` text DEFAULT NULL,
  `grid_value` int(11) NOT NULL,
  `is_table` tinyint(1) NOT NULL,
  `is_invoice` tinyint(1) NOT NULL,
  `is_required` tinyint(1) NOT NULL,
  `is_admin` tinyint(1) NOT NULL,
  `is_disable` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `customer_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `percentage` varchar(191) NOT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO customer_groups VALUES("1","Regular","0","1","2024-01-19 13:19:29","2024-01-19 13:19:29");
INSERT INTO customer_groups VALUES("2","Loyalty Program","2","1","2025-02-13 21:20:32","2025-02-13 21:20:32");



CREATE TABLE `customers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customer_group_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `company_name` varchar(191) DEFAULT NULL,
  `email` varchar(191) DEFAULT NULL,
  `phone_number` varchar(191) NOT NULL,
  `tax_no` varchar(191) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(191) DEFAULT NULL,
  `postal_code` varchar(191) DEFAULT NULL,
  `country` varchar(191) DEFAULT NULL,
  `points` double DEFAULT NULL,
  `deposit` double DEFAULT NULL,
  `expense` double DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `ecom` varchar(255) DEFAULT NULL,
  `dsf` varchar(255) DEFAULT 'df',
  `arabic_name` varchar(255) DEFAULT NULL,
  `admin` varchar(255) DEFAULT NULL,
  `franchise_location` varchar(255) DEFAULT NULL,
  `customer_type` varchar(255) DEFAULT 'Same as Customer',
  `customer_assigned_to` varchar(255) DEFAULT 'Advocate',
  `assigned` varchar(255) DEFAULT 'Advocate',
  `aaaaaaaa` varchar(255) DEFAULT 'aa',
  `district` varchar(255) DEFAULT NULL,
  `Location` varchar(255) DEFAULT NULL,
  `origin` varchar(255) DEFAULT NULL,
  `sub_county` varchar(255) DEFAULT NULL,
  `ward` varchar(255) DEFAULT NULL,
  `sublocation` varchar(255) DEFAULT NULL,
  `village` varchar(255) DEFAULT NULL,
  `next_of_kin` varchar(255) DEFAULT NULL,
  `MemberNo` varchar(255) DEFAULT NULL,
  `next_of_kin_mobile` varchar(20) DEFAULT NULL,
  `next_of_kin_relationship` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO customers VALUES("34","1","","Isaac Owalo","XYZ University","johndoe@example.com","712345678","","Main Campus","2025","Computer Science","Kenyan","12345","","","","1","2025-03-13 21:42:37","2025-03-25 16:05:58","","df","","","","Same as Customer","Advocate","Advocate","aa","","67890","Kenya","Nairobi","Westlands","Parklands","Lavington","Jane Doe","45678","723456789","Mother");
INSERT INTO customers VALUES("36","1","","Brian Simiyu","XYZ University","johndoe@example.com","712345678","","Main Campus","2025","Computer Science","Kenyan","12345","","","","1","2025-03-13 21:45:50","2025-03-13 21:47:17","","df","","","","Same as Customer","Advocate","Advocate","aa","","67891","Kenya","Nairobi","Westlands","Parklands","Lavington","Jane Doe","45679","723456789","Mother");
INSERT INTO customers VALUES("37","1","","Brigid Tarus","XYZ University","johndoe@example.com","712345678","","Main Campus","2025","Computer Science","Kenyan","12345","","","","1","2025-03-13 21:47:54","2025-03-15 10:01:39","","df","","","","Same as Customer","Advocate","Advocate","aa","","67737","Kenya","Nairobi","Westlands","Parklands","Lavington","Jane Doe","12345","723456789","Mother");
INSERT INTO customers VALUES("38","1","","STEVE OKOTH OMOLLO","","okothsteve56@gmail.com","0703409890","","HOMABAY","KISUMU","","","","","","","1","2025-03-23 14:18:10","2025-03-23 14:18:10","","df","","","","Same as Customer","Advocate","Advocate","aa","","","","","","","","","","","");
INSERT INTO customers VALUES("39","1","","Isaac Owalo Junior","XYZ University","johndoe@example.com","712345678","","Main Campus","2025","Computer Science","Kenyan","12345","","","","1","2025-03-25 16:05:59","2025-03-25 16:05:59","","df","","","","Same as Customer","Advocate","Advocate","aa","","67890","Kenya","Nairobi","Westlands","Parklands","Lavington","Jane Doe","45678","723456789","Mother");



CREATE TABLE `deliveries` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `reference_no` varchar(191) NOT NULL,
  `sale_id` int(11) NOT NULL,
  `packing_slip_ids` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `courier_id` int(11) DEFAULT NULL,
  `address` text NOT NULL,
  `delivered_by` varchar(191) DEFAULT NULL,
  `recieved_by` varchar(191) DEFAULT NULL,
  `file` varchar(191) DEFAULT NULL,
  `note` varchar(191) DEFAULT NULL,
  `status` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO deliveries VALUES("2","dr-20240811-113738","43","2","1","1","Halishahar","","","","","3","2024-08-11 05:37:38","2025-02-13 17:37:10");
INSERT INTO deliveries VALUES("3","dr-20250217-094931","77","","47","2","Halishahar chittagong Bangladesh","","","","","2","2025-02-17 21:49:39","2025-02-17 21:49:39");
INSERT INTO deliveries VALUES("4","dr-20250218-054258","133","","47","1","Halishahar chittagong Bangladesh","","","","","1","2025-02-18 17:43:06","2025-02-18 17:43:06");



CREATE TABLE `departments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO departments VALUES("1","Sales People","0","2025-02-15 23:12:48","2025-02-24 15:56:13");
INSERT INTO departments VALUES("2","Pastry","1","2025-02-24 15:52:48","2025-02-24 15:52:48");
INSERT INTO departments VALUES("3","Servoury","1","2025-02-24 15:53:52","2025-02-24 15:53:52");
INSERT INTO departments VALUES("4","Cutlery","1","2025-02-24 15:54:30","2025-02-24 15:54:30");
INSERT INTO departments VALUES("5","Customer service","1","2025-02-24 15:55:12","2025-02-24 15:55:12");
INSERT INTO departments VALUES("6","main kitchen","1","2025-02-24 15:55:28","2025-02-24 15:55:28");
INSERT INTO departments VALUES("7","water","1","2025-02-24 15:55:51","2025-02-24 15:55:51");



CREATE TABLE `deposits` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `amount` double NOT NULL,
  `customer_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO deposits VALUES("1","20","1","1","","2024-07-08 05:54:31","2024-07-08 05:54:31");



CREATE TABLE `discount_plan_customers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `discount_plan_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO discount_plan_customers VALUES("1","1","10","2025-02-26 20:01:10","2025-02-26 20:01:10");



CREATE TABLE `discount_plan_discounts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `discount_id` int(11) NOT NULL,
  `discount_plan_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `discount_plans` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO discount_plans VALUES("1","Asa Discount","1","2025-02-26 20:01:10","2025-02-26 20:01:10");



CREATE TABLE `discounts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `applicable_for` varchar(191) NOT NULL,
  `product_list` longtext DEFAULT NULL,
  `valid_from` date NOT NULL,
  `valid_till` date NOT NULL,
  `type` varchar(191) NOT NULL,
  `value` double NOT NULL,
  `minimum_qty` double NOT NULL,
  `maximum_qty` double NOT NULL,
  `days` varchar(191) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `dso_alerts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_info` longtext NOT NULL,
  `number_of_products` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `employees` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `phone_number` varchar(191) NOT NULL,
  `department_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `staff_id` varchar(191) DEFAULT NULL,
  `image` varchar(191) DEFAULT NULL,
  `address` varchar(191) DEFAULT NULL,
  `city` varchar(191) DEFAULT NULL,
  `country` varchar(191) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO employees VALUES("1","Beatrice Anyango","beatrice@gmail.com","072734778","2","49","2000","","17160-00100","Nairobi","Kenya","1","2025-02-15 23:14:16","2025-02-24 15:57:54");
INSERT INTO employees VALUES("2","Victor Wanyonyi","vc@gmail.com","0767898876","6","51","45454","","17160-00100","Nairobi","Kenya","1","2025-02-24 16:11:55","2025-02-24 16:11:55");



CREATE TABLE `expense_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO expense_categories VALUES("1","Electric Bill","Electric Bill","1","2024-01-19 14:50:02","2025-03-01 12:16:40");
INSERT INTO expense_categories VALUES("2","93158712","SUPPLIER LIST1","1","2025-02-17 19:50:23","2025-03-01 12:16:40");
INSERT INTO expense_categories VALUES("3","24870332","UTILITIES","1","2025-02-24 15:39:56","2025-03-01 12:16:40");
INSERT INTO expense_categories VALUES("4","Purchases","Purchases","0","2025-03-01 12:16:40","2025-03-01 12:19:19");
INSERT INTO expense_categories VALUES("5","Carriage-inwards","Carriage-inwards","0","2025-03-01 12:16:40","2025-03-01 12:19:19");
INSERT INTO expense_categories VALUES("6","Customer deliveries","Customer deliveries","0","2025-03-01 12:16:40","2025-03-01 12:19:19");
INSERT INTO expense_categories VALUES("7","Mpesa payment charges","Mpesa payment charges","0","2025-03-01 12:16:40","2025-03-01 12:19:19");
INSERT INTO expense_categories VALUES("8","Mpesa collection charges","Mpesa collection charges","0","2025-03-01 12:16:40","2025-03-01 12:19:19");
INSERT INTO expense_categories VALUES("9","Trading-license","Trading-license","0","2025-03-01 12:16:40","2025-03-01 12:19:19");
INSERT INTO expense_categories VALUES("10","Water-guard","Water-guard","0","2025-03-01 12:16:40","2025-03-01 12:19:19");
INSERT INTO expense_categories VALUES("11","Photocopy & printing","Photocopy & printing","0","2025-03-01 12:16:40","2025-03-01 12:20:04");
INSERT INTO expense_categories VALUES("12","Creditors ","Creditors ","0","2025-03-01 12:16:40","2025-03-01 12:20:04");
INSERT INTO expense_categories VALUES("13","Telephone","Telephone","0","2025-03-01 12:16:40","2025-03-01 12:20:04");
INSERT INTO expense_categories VALUES("14","Wifi internet","Wifi internet","0","2025-03-01 12:16:40","2025-03-01 12:20:04");
INSERT INTO expense_categories VALUES("15","Rent","Rent","0","2025-03-01 12:16:40","2025-03-01 12:20:04");
INSERT INTO expense_categories VALUES("16","Proprietor promotions","Proprietor promotions","0","2025-03-01 12:16:40","2025-03-01 12:20:04");
INSERT INTO expense_categories VALUES("17","Employees meals ","Employees meals ","0","2025-03-01 12:16:40","2025-03-01 12:20:04");
INSERT INTO expense_categories VALUES("18","Staff salaries","Staff salaries","0","2025-03-01 12:16:40","2025-03-01 12:20:04");
INSERT INTO expense_categories VALUES("19","Daily wages ","Daily wages ","0","2025-03-01 12:16:40","2025-03-01 12:20:04");
INSERT INTO expense_categories VALUES("20","Electricity","Electricity","0","2025-03-01 12:16:40","2025-03-01 12:17:06");
INSERT INTO expense_categories VALUES("21","Travel & accomodation","Travel & accomodation","0","2025-03-01 12:16:40","2025-03-01 12:20:04");
INSERT INTO expense_categories VALUES("22","Business name registration","Business name registration","0","2025-03-01 12:16:40","2025-03-01 12:20:13");
INSERT INTO expense_categories VALUES("23","38647031","Water-guard","0","2025-03-01 12:17:33","2025-03-01 12:20:13");
INSERT INTO expense_categories VALUES("24","98248629","Purchases","0","2025-03-01 12:20:52","2025-03-01 21:08:22");
INSERT INTO expense_categories VALUES("25","36819270","Carriage-inwards","0","2025-03-01 12:21:32","2025-03-01 21:08:22");
INSERT INTO expense_categories VALUES("26","09564781","Customer deliveries","0","2025-03-01 12:21:47","2025-03-01 21:08:22");
INSERT INTO expense_categories VALUES("27","28107755","Mpesa payment charges","0","2025-03-01 12:22:03","2025-03-01 21:08:22");
INSERT INTO expense_categories VALUES("28","11609752","Mpesa collection charges","0","2025-03-01 12:22:16","2025-03-01 21:08:22");
INSERT INTO expense_categories VALUES("29","15940320","Trading-license","0","2025-03-01 12:22:36","2025-03-01 21:08:22");
INSERT INTO expense_categories VALUES("30","63540380","Water-guard","0","2025-03-01 12:22:50","2025-03-01 21:08:22");
INSERT INTO expense_categories VALUES("31","04932623","Photocopy & printing","0","2025-03-01 12:23:04","2025-03-01 21:08:34");
INSERT INTO expense_categories VALUES("32","34116263","Creditors","0","2025-03-01 12:23:18","2025-03-01 21:08:34");
INSERT INTO expense_categories VALUES("33","61793465","Telephone","0","2025-03-01 12:23:35","2025-03-01 21:08:34");
INSERT INTO expense_categories VALUES("34","06092126","Wifi internet","0","2025-03-01 12:23:51","2025-03-01 21:08:34");
INSERT INTO expense_categories VALUES("35","68092391","Rent","0","2025-03-01 12:24:06","2025-03-01 21:08:34");
INSERT INTO expense_categories VALUES("36","91847839","Proprietor promotions","0","2025-03-01 12:24:19","2025-03-01 21:08:34");
INSERT INTO expense_categories VALUES("37","96213339","Employees meals","0","2025-03-01 12:24:32","2025-03-01 21:08:34");
INSERT INTO expense_categories VALUES("38","42339095","Staff salaries","0","2025-03-01 12:24:44","2025-03-01 21:08:34");
INSERT INTO expense_categories VALUES("39","50457271","Daily wages","0","2025-03-01 12:24:59","2025-03-01 21:08:34");
INSERT INTO expense_categories VALUES("40","95313882","Business name registration","0","2025-03-01 12:25:11","2025-03-01 21:08:34");
INSERT INTO expense_categories VALUES("41","23062730","Purchases","1","2025-03-01 21:18:15","2025-03-01 21:18:15");
INSERT INTO expense_categories VALUES("42","75109369","Carriage-inwards","1","2025-03-01 21:18:29","2025-03-01 21:18:29");
INSERT INTO expense_categories VALUES("43","13708904","Customer deliveries","1","2025-03-01 21:18:44","2025-03-01 21:18:44");
INSERT INTO expense_categories VALUES("44","23681051","Mpesa payment charges","1","2025-03-01 21:18:56","2025-03-01 21:18:56");
INSERT INTO expense_categories VALUES("45","09147278","Mpesa collection charges","1","2025-03-01 21:19:07","2025-03-01 21:19:07");
INSERT INTO expense_categories VALUES("46","21517980","Trading-license","1","2025-03-01 21:19:21","2025-03-01 21:19:21");
INSERT INTO expense_categories VALUES("47","64501709","Water-guard","1","2025-03-01 21:19:38","2025-03-01 21:19:38");
INSERT INTO expense_categories VALUES("48","79413682","Photocopy & printing","1","2025-03-01 21:19:50","2025-03-01 21:19:50");
INSERT INTO expense_categories VALUES("49","34913127","Creditors","1","2025-03-01 21:20:02","2025-03-01 21:20:02");
INSERT INTO expense_categories VALUES("50","26423526","Telephone","1","2025-03-01 21:20:14","2025-03-01 21:20:14");
INSERT INTO expense_categories VALUES("51","53979613","Wifi internet","1","2025-03-01 21:20:27","2025-03-01 21:20:27");
INSERT INTO expense_categories VALUES("52","42617243","Rent","1","2025-03-01 21:20:38","2025-03-01 21:20:38");
INSERT INTO expense_categories VALUES("53","92072007","Proprietor promotions","1","2025-03-01 21:20:55","2025-03-01 21:20:55");
INSERT INTO expense_categories VALUES("54","10097263","Employees meals","1","2025-03-01 21:21:06","2025-03-01 21:21:06");
INSERT INTO expense_categories VALUES("55","83247491","Staff salaries","1","2025-03-01 21:21:19","2025-03-01 21:21:19");
INSERT INTO expense_categories VALUES("56","35972107","Daily wages","1","2025-03-01 21:21:31","2025-03-01 21:21:31");
INSERT INTO expense_categories VALUES("57","87370029","Travel & accomodation","1","2025-03-01 21:21:44","2025-03-01 21:21:44");
INSERT INTO expense_categories VALUES("58","59081234","Business name registration","1","2025-03-01 21:21:56","2025-03-01 21:21:56");



CREATE TABLE `expenses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `reference_no` varchar(191) NOT NULL,
  `expense_category_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `cash_register_id` int(11) DEFAULT NULL,
  `amount` double NOT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO expenses VALUES("1","er-20240119-085023","1","1","1","1","2","200","","2024-01-19 14:50:23","2024-01-19 14:50:23");
INSERT INTO expenses VALUES("2","er-20240119-085046","1","2","1","1","1","120","","2024-01-19 14:50:46","2024-01-19 14:50:46");
INSERT INTO expenses VALUES("6","er-20250224-034707","3","3","6","47","7","1000","Paid water bill","2025-02-24 00:00:00","2025-02-24 15:47:07");
INSERT INTO expenses VALUES("7","er-20250227-012358","1","3","8","47","7","10000","","2025-02-27 00:00:00","2025-02-27 13:23:58");
INSERT INTO expenses VALUES("8","er-20250301-091025","3","3","8","47","7","0","Purchases","2025-03-01 00:00:00","2025-03-01 21:10:25");



CREATE TABLE `external_services` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `details` longtext DEFAULT NULL,
  `module_status` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`module_status`)),
  `active` int(11) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO external_services VALUES("1","PayPal","payment","Client ID,Client Secret;abcd1234,wxyz5678","","0","","");
INSERT INTO external_services VALUES("2","Stripe","payment","Public Key,Private Key;efgh1234,stuv5678","","0","","");
INSERT INTO external_services VALUES("3","Razorpay","payment","Key,Secret;rzp_test_Y4MCcpHfZNU6rR,3Hr7SDqaZ0G5waN0jsLgsiLx","","1","","");
INSERT INTO external_services VALUES("4","Paystack","payment","public_Key,Secret_Key;pk_test_e8d220b7463d64569f0053e78534f38e6b10cf4a,sk_test_6d62cb976e1e0ab43f1e48b2934b0dfc7f32a1fe","","1","","");
INSERT INTO external_services VALUES("6","Mollie","payment","api_key;test_dHar4XY7LxsDOtmnkVtjNVWXLSlXsM","","0","","");
INSERT INTO external_services VALUES("7","Xendit","payment","secret_key,callback_token;xnd_development_aKJVKYbc4lHkEjcCLzWLrBsKs6jF6nbM6WaCMfnJerP3JW57CLis553XNRdDU,YPZxND92Mt8tdXntTYIEkRX802onZ5OcdKBUzycebuqYvN4n","","1","","");
INSERT INTO external_services VALUES("8","bkash","payment","Mode,app_key,app_secret,username,password;sandbox,0vWQuCRGiUX7EPVjQDr0EUAYtc,jcUNPBgbcqEDedNKdvE4G1cAK7D3hCjmJccNPZZBq96QIxxwAMEx,01770618567,D7DaC<*E*eG","","1","","");
INSERT INTO external_services VALUES("9","sslcommerz","payment","appkey,appsecret;12341234,asdfa23423","","1","","");
INSERT INTO external_services VALUES("10","Pesapal","payment","Mode,Consumer Key,Consumer Secret;sandbox,qkio1BGGYAXTu2JOfm7XSXNruoZsrqEW,osGQ364R49cXKeOYSpaOnT++rHs=","","1","","");



CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `general_settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_title` varchar(191) NOT NULL,
  `site_logo` varchar(191) DEFAULT NULL,
  `is_rtl` tinyint(1) DEFAULT NULL,
  `currency` varchar(191) NOT NULL,
  `package_id` int(11) DEFAULT NULL,
  `subscription_type` varchar(255) DEFAULT NULL,
  `staff_access` varchar(191) NOT NULL,
  `without_stock` varchar(255) NOT NULL DEFAULT 'no',
  `date_format` varchar(191) NOT NULL,
  `developed_by` varchar(191) DEFAULT NULL,
  `invoice_format` varchar(191) DEFAULT NULL,
  `decimal` int(11) DEFAULT 2,
  `state` int(11) DEFAULT NULL,
  `theme` varchar(191) NOT NULL,
  `modules` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `currency_position` varchar(191) NOT NULL,
  `expiry_date` date DEFAULT NULL,
  `expiry_type` varchar(255) NOT NULL DEFAULT 'days',
  `expiry_value` varchar(255) NOT NULL DEFAULT '0',
  `is_zatca` tinyint(1) DEFAULT NULL,
  `company_name` varchar(191) DEFAULT NULL,
  `vat_registration_number` varchar(191) DEFAULT NULL,
  `is_packing_slip` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO general_settings VALUES("1","Uhai Africa","20250214024746.png","0","4","","","warehouse","no","d-m-Y","Uhai Africa","standard","2","1","default.css","manufacturing","2018-07-06 06:13:11","2025-02-26 18:49:59","prefix","","days","0","0","Uhai Africa","","1");



CREATE TABLE `gift_card_recharges` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `gift_card_id` int(11) NOT NULL,
  `amount` double NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO gift_card_recharges VALUES("1","1","700","47","2025-02-18 18:29:25","2025-02-18 18:29:25");
INSERT INTO gift_card_recharges VALUES("2","1","7.5","47","2025-02-18 18:29:34","2025-02-18 18:29:34");



CREATE TABLE `gift_cards` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `card_no` varchar(191) NOT NULL,
  `amount` double NOT NULL,
  `expense` double NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `expired_date` date DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO gift_cards VALUES("1","2007950876341921","1407.5","999.99","2","","2025-03-01","47","0","2025-02-18 17:57:37","2025-02-19 15:56:17");
INSERT INTO gift_cards VALUES("2","9862242033375187","700","0","5","","2025-02-18","47","0","2025-02-18 18:30:18","2025-02-18 18:45:37");
INSERT INTO gift_cards VALUES("3","4642982391715133","700","0","4","","2025-02-18","47","0","2025-02-18 18:31:50","2025-02-18 18:45:32");



CREATE TABLE `holidays` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL,
  `note` text DEFAULT NULL,
  `is_approved` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `hrm_settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `checkin` varchar(191) NOT NULL,
  `checkout` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO hrm_settings VALUES("1","10:00am","6:00pm","2019-01-02 02:20:08","2019-01-02 04:20:53");



CREATE TABLE `income_categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO income_categories VALUES("1","99903833","Foreign investment","1","2024-08-11 04:56:46","2024-08-11 04:56:46");



CREATE TABLE `incomes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `reference_no` varchar(255) NOT NULL,
  `income_category_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `cash_register_id` int(11) DEFAULT NULL,
  `amount` double NOT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO incomes VALUES("1","ir-20240811-105709","1","1","1","1","2","100","","2024-08-11 04:57:09","2024-08-11 04:57:09");
INSERT INTO incomes VALUES("2","ir-20241202-100021","1","1","1","1","3","77","","2024-12-05 06:00:00","2024-12-03 04:00:21");



CREATE TABLE `languages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO languages VALUES("1","en","2018-07-07 22:59:17","2019-12-24 17:34:20");



CREATE TABLE `mail_settings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `driver` varchar(191) NOT NULL,
  `host` varchar(191) NOT NULL,
  `port` varchar(191) NOT NULL,
  `from_address` varchar(191) NOT NULL,
  `from_name` varchar(191) NOT NULL,
  `username` varchar(191) NOT NULL,
  `password` varchar(191) NOT NULL,
  `encryption` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO mail_settings VALUES("1","SMTP","mail.uhai.africa","587","info@uhai.africa","info@uhai.africa","info@uhai.africa","Kibet7401#","TLS","2025-02-14 11:42:30","2025-02-14 14:49:36");



CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=263 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO migrations VALUES("1","2014_10_12_000000_create_users_table","1");
INSERT INTO migrations VALUES("2","2014_10_12_100000_create_password_resets_table","1");
INSERT INTO migrations VALUES("3","2018_02_17_060412_create_categories_table","1");
INSERT INTO migrations VALUES("4","2018_02_20_035727_create_brands_table","1");
INSERT INTO migrations VALUES("5","2018_02_25_100635_create_suppliers_table","1");
INSERT INTO migrations VALUES("6","2018_02_27_101619_create_warehouse_table","1");
INSERT INTO migrations VALUES("7","2018_03_03_040448_create_units_table","1");
INSERT INTO migrations VALUES("8","2018_03_04_041317_create_taxes_table","1");
INSERT INTO migrations VALUES("9","2018_03_10_061915_create_customer_groups_table","1");
INSERT INTO migrations VALUES("10","2018_03_10_090534_create_customers_table","1");
INSERT INTO migrations VALUES("11","2018_03_11_095547_create_billers_table","1");
INSERT INTO migrations VALUES("12","2018_04_05_054401_create_products_table","1");
INSERT INTO migrations VALUES("13","2018_04_06_133606_create_purchases_table","1");
INSERT INTO migrations VALUES("14","2018_04_06_154600_create_product_purchases_table","1");
INSERT INTO migrations VALUES("15","2018_04_06_154915_create_product_warhouse_table","1");
INSERT INTO migrations VALUES("16","2018_04_10_085927_create_sales_table","1");
INSERT INTO migrations VALUES("17","2018_04_10_090133_create_product_sales_table","1");
INSERT INTO migrations VALUES("18","2018_04_10_090254_create_payments_table","1");
INSERT INTO migrations VALUES("19","2018_04_10_090341_create_payment_with_cheque_table","1");
INSERT INTO migrations VALUES("20","2018_04_10_090509_create_payment_with_credit_card_table","1");
INSERT INTO migrations VALUES("21","2018_04_13_121436_create_quotation_table","1");
INSERT INTO migrations VALUES("22","2018_04_13_122324_create_product_quotation_table","1");
INSERT INTO migrations VALUES("23","2018_04_14_121802_create_transfers_table","1");
INSERT INTO migrations VALUES("24","2018_04_14_121913_create_product_transfer_table","1");
INSERT INTO migrations VALUES("25","2018_05_13_082847_add_payment_id_and_change_sale_id_to_payments_table","2");
INSERT INTO migrations VALUES("26","2018_05_13_090906_change_customer_id_to_payment_with_credit_card_table","3");
INSERT INTO migrations VALUES("27","2018_05_20_054532_create_adjustments_table","4");
INSERT INTO migrations VALUES("28","2018_05_20_054859_create_product_adjustments_table","4");
INSERT INTO migrations VALUES("29","2018_05_21_163419_create_returns_table","5");
INSERT INTO migrations VALUES("30","2018_05_21_163443_create_product_returns_table","5");
INSERT INTO migrations VALUES("31","2018_06_02_050905_create_roles_table","6");
INSERT INTO migrations VALUES("32","2018_06_02_073430_add_columns_to_users_table","7");
INSERT INTO migrations VALUES("33","2018_06_03_053738_create_permission_tables","8");
INSERT INTO migrations VALUES("36","2018_06_21_063736_create_pos_setting_table","9");
INSERT INTO migrations VALUES("37","2018_06_21_094155_add_user_id_to_sales_table","10");
INSERT INTO migrations VALUES("38","2018_06_21_101529_add_user_id_to_purchases_table","11");
INSERT INTO migrations VALUES("39","2018_06_21_103512_add_user_id_to_transfers_table","12");
INSERT INTO migrations VALUES("40","2018_06_23_061058_add_user_id_to_quotations_table","13");
INSERT INTO migrations VALUES("41","2018_06_23_082427_add_is_deleted_to_users_table","14");
INSERT INTO migrations VALUES("42","2018_06_25_043308_change_email_to_users_table","15");
INSERT INTO migrations VALUES("43","2018_07_06_115449_create_general_settings_table","16");
INSERT INTO migrations VALUES("44","2018_07_08_043944_create_languages_table","17");
INSERT INTO migrations VALUES("45","2018_07_11_102144_add_user_id_to_returns_table","18");
INSERT INTO migrations VALUES("46","2018_07_11_102334_add_user_id_to_payments_table","18");
INSERT INTO migrations VALUES("47","2018_07_22_130541_add_digital_to_products_table","19");
INSERT INTO migrations VALUES("49","2018_07_24_154250_create_deliveries_table","20");
INSERT INTO migrations VALUES("50","2018_08_16_053336_create_expense_categories_table","21");
INSERT INTO migrations VALUES("51","2018_08_17_115415_create_expenses_table","22");
INSERT INTO migrations VALUES("55","2018_08_18_050418_create_gift_cards_table","23");
INSERT INTO migrations VALUES("56","2018_08_19_063119_create_payment_with_gift_card_table","24");
INSERT INTO migrations VALUES("57","2018_08_25_042333_create_gift_card_recharges_table","25");
INSERT INTO migrations VALUES("58","2018_08_25_101354_add_deposit_expense_to_customers_table","26");
INSERT INTO migrations VALUES("59","2018_08_26_043801_create_deposits_table","27");
INSERT INTO migrations VALUES("60","2018_09_02_044042_add_keybord_active_to_pos_setting_table","28");
INSERT INTO migrations VALUES("61","2018_09_09_092713_create_payment_with_paypal_table","29");
INSERT INTO migrations VALUES("62","2018_09_10_051254_add_currency_to_general_settings_table","30");
INSERT INTO migrations VALUES("63","2018_10_22_084118_add_biller_and_store_id_to_users_table","31");
INSERT INTO migrations VALUES("65","2018_10_26_034927_create_coupons_table","32");
INSERT INTO migrations VALUES("66","2018_10_27_090857_add_coupon_to_sales_table","33");
INSERT INTO migrations VALUES("67","2018_11_07_070155_add_currency_position_to_general_settings_table","34");
INSERT INTO migrations VALUES("68","2018_11_19_094650_add_combo_to_products_table","35");
INSERT INTO migrations VALUES("69","2018_12_09_043712_create_accounts_table","36");
INSERT INTO migrations VALUES("70","2018_12_17_112253_add_is_default_to_accounts_table","37");
INSERT INTO migrations VALUES("71","2018_12_19_103941_add_account_id_to_payments_table","38");
INSERT INTO migrations VALUES("72","2018_12_20_065900_add_account_id_to_expenses_table","39");
INSERT INTO migrations VALUES("73","2018_12_20_082753_add_account_id_to_returns_table","40");
INSERT INTO migrations VALUES("74","2018_12_26_064330_create_return_purchases_table","41");
INSERT INTO migrations VALUES("75","2018_12_26_144210_create_purchase_product_return_table","42");
INSERT INTO migrations VALUES("76","2018_12_26_144708_create_purchase_product_return_table","43");
INSERT INTO migrations VALUES("77","2018_12_27_110018_create_departments_table","44");
INSERT INTO migrations VALUES("78","2018_12_30_054844_create_employees_table","45");
INSERT INTO migrations VALUES("79","2018_12_31_125210_create_payrolls_table","46");
INSERT INTO migrations VALUES("80","2018_12_31_150446_add_department_id_to_employees_table","47");
INSERT INTO migrations VALUES("81","2019_01_01_062708_add_user_id_to_expenses_table","48");
INSERT INTO migrations VALUES("82","2019_01_02_075644_create_hrm_settings_table","49");
INSERT INTO migrations VALUES("83","2019_01_02_090334_create_attendances_table","50");
INSERT INTO migrations VALUES("84","2019_01_27_160956_add_three_columns_to_general_settings_table","51");
INSERT INTO migrations VALUES("85","2019_02_15_183303_create_stock_counts_table","52");
INSERT INTO migrations VALUES("86","2019_02_17_101604_add_is_adjusted_to_stock_counts_table","53");
INSERT INTO migrations VALUES("87","2019_04_13_101707_add_tax_no_to_customers_table","54");
INSERT INTO migrations VALUES("89","2019_10_14_111455_create_holidays_table","55");
INSERT INTO migrations VALUES("90","2019_11_13_145619_add_is_variant_to_products_table","56");
INSERT INTO migrations VALUES("91","2019_11_13_150206_create_product_variants_table","57");
INSERT INTO migrations VALUES("92","2019_11_13_153828_create_variants_table","57");
INSERT INTO migrations VALUES("93","2019_11_25_134041_add_qty_to_product_variants_table","58");
INSERT INTO migrations VALUES("94","2019_11_25_134922_add_variant_id_to_product_purchases_table","58");
INSERT INTO migrations VALUES("95","2019_11_25_145341_add_variant_id_to_product_warehouse_table","58");
INSERT INTO migrations VALUES("96","2019_11_29_182201_add_variant_id_to_product_sales_table","59");
INSERT INTO migrations VALUES("97","2019_12_04_121311_add_variant_id_to_product_quotation_table","60");
INSERT INTO migrations VALUES("98","2019_12_05_123802_add_variant_id_to_product_transfer_table","61");
INSERT INTO migrations VALUES("100","2019_12_08_114954_add_variant_id_to_product_returns_table","62");
INSERT INTO migrations VALUES("101","2019_12_08_203146_add_variant_id_to_purchase_product_return_table","63");
INSERT INTO migrations VALUES("102","2020_02_28_103340_create_money_transfers_table","64");
INSERT INTO migrations VALUES("103","2020_07_01_193151_add_image_to_categories_table","65");
INSERT INTO migrations VALUES("105","2020_09_26_130426_add_user_id_to_deliveries_table","66");
INSERT INTO migrations VALUES("107","2020_10_11_125457_create_cash_registers_table","67");
INSERT INTO migrations VALUES("108","2020_10_13_155019_add_cash_register_id_to_sales_table","68");
INSERT INTO migrations VALUES("109","2020_10_13_172624_add_cash_register_id_to_returns_table","69");
INSERT INTO migrations VALUES("110","2020_10_17_212338_add_cash_register_id_to_payments_table","70");
INSERT INTO migrations VALUES("111","2020_10_18_124200_add_cash_register_id_to_expenses_table","71");
INSERT INTO migrations VALUES("112","2020_10_21_121632_add_developed_by_to_general_settings_table","72");
INSERT INTO migrations VALUES("113","2019_08_19_000000_create_failed_jobs_table","73");
INSERT INTO migrations VALUES("114","2020_10_30_135557_create_notifications_table","73");
INSERT INTO migrations VALUES("115","2020_11_01_044954_create_currencies_table","74");
INSERT INTO migrations VALUES("116","2020_11_01_140736_add_price_to_product_warehouse_table","75");
INSERT INTO migrations VALUES("117","2020_11_02_050633_add_is_diff_price_to_products_table","76");
INSERT INTO migrations VALUES("118","2020_11_09_055222_add_user_id_to_customers_table","77");
INSERT INTO migrations VALUES("119","2020_11_17_054806_add_invoice_format_to_general_settings_table","78");
INSERT INTO migrations VALUES("120","2021_02_10_074859_add_variant_id_to_product_adjustments_table","79");
INSERT INTO migrations VALUES("121","2021_03_07_093606_create_product_batches_table","80");
INSERT INTO migrations VALUES("122","2021_03_07_093759_add_product_batch_id_to_product_warehouse_table","80");
INSERT INTO migrations VALUES("123","2021_03_07_093900_add_product_batch_id_to_product_purchases_table","80");
INSERT INTO migrations VALUES("124","2021_03_11_132603_add_product_batch_id_to_product_sales_table","81");
INSERT INTO migrations VALUES("127","2021_03_25_125421_add_is_batch_to_products_table","82");
INSERT INTO migrations VALUES("128","2021_05_19_120127_add_product_batch_id_to_product_returns_table","82");
INSERT INTO migrations VALUES("130","2021_05_22_105611_add_product_batch_id_to_purchase_product_return_table","83");
INSERT INTO migrations VALUES("131","2021_05_23_124848_add_product_batch_id_to_product_transfer_table","84");
INSERT INTO migrations VALUES("132","2021_05_26_153106_add_product_batch_id_to_product_quotation_table","85");
INSERT INTO migrations VALUES("133","2021_06_08_213007_create_reward_point_settings_table","86");
INSERT INTO migrations VALUES("134","2021_06_16_104155_add_points_to_customers_table","87");
INSERT INTO migrations VALUES("135","2021_06_17_101057_add_used_points_to_payments_table","88");
INSERT INTO migrations VALUES("136","2021_07_06_132716_add_variant_list_to_products_table","89");
INSERT INTO migrations VALUES("137","2021_09_27_161141_add_is_imei_to_products_table","90");
INSERT INTO migrations VALUES("138","2021_09_28_170052_add_imei_number_to_product_warehouse_table","91");
INSERT INTO migrations VALUES("139","2021_09_28_170126_add_imei_number_to_product_purchases_table","91");
INSERT INTO migrations VALUES("140","2021_10_03_170652_add_imei_number_to_product_sales_table","92");
INSERT INTO migrations VALUES("141","2021_10_10_145214_add_imei_number_to_product_returns_table","93");
INSERT INTO migrations VALUES("142","2021_10_11_104504_add_imei_number_to_product_transfer_table","94");
INSERT INTO migrations VALUES("143","2021_10_12_160107_add_imei_number_to_purchase_product_return_table","95");
INSERT INTO migrations VALUES("144","2021_10_12_205146_add_is_rtl_to_general_settings_table","96");
INSERT INTO migrations VALUES("145","2021_10_23_142451_add_is_approve_to_payments_table","97");
INSERT INTO migrations VALUES("146","2022_01_13_191242_create_discount_plans_table","97");
INSERT INTO migrations VALUES("147","2022_01_14_174318_create_discount_plan_customers_table","97");
INSERT INTO migrations VALUES("148","2022_01_14_202439_create_discounts_table","98");
INSERT INTO migrations VALUES("149","2022_01_16_153506_create_discount_plan_discounts_table","98");
INSERT INTO migrations VALUES("150","2022_02_05_174210_add_order_discount_type_and_value_to_sales_table","99");
INSERT INTO migrations VALUES("154","2022_05_26_195506_add_daily_sale_objective_to_products_table","100");
INSERT INTO migrations VALUES("155","2022_05_28_104209_create_dso_alerts_table","101");
INSERT INTO migrations VALUES("156","2022_06_01_112100_add_is_embeded_to_products_table","102");
INSERT INTO migrations VALUES("157","2022_06_14_130505_add_sale_id_to_returns_table","103");
INSERT INTO migrations VALUES("159","2022_07_19_115504_add_variant_data_to_products_table","104");
INSERT INTO migrations VALUES("160","2022_07_25_194300_add_additional_cost_to_product_variants_table","104");
INSERT INTO migrations VALUES("161","2022_09_04_195610_add_purchase_id_to_return_purchases_table","105");
INSERT INTO migrations VALUES("162","2023_01_18_123842_alter_table_pos_setting","106");
INSERT INTO migrations VALUES("164","2023_01_18_125040_alter_table_general_settings","107");
INSERT INTO migrations VALUES("165","2023_01_18_133701_alter_table_pos_setting","108");
INSERT INTO migrations VALUES("166","2023_01_25_145309_add_expiry_date_to_general_settings_table","109");
INSERT INTO migrations VALUES("167","2023_02_23_125656_alter_table_sales","110");
INSERT INTO migrations VALUES("168","2023_02_26_124100_add_package_id_to_general_settings_table","111");
INSERT INTO migrations VALUES("169","2023_03_04_120325_create_custom_fields_table","111");
INSERT INTO migrations VALUES("170","2023_03_22_174352_add_currency_id_and_exchange_rate_to_returns_table","112");
INSERT INTO migrations VALUES("171","2023_03_27_114320_add_currency_id_and_exchange_rate_to_purchases_table","113");
INSERT INTO migrations VALUES("172","2023_03_27_132747_add_currency_id_and_exchange_rate_to_return_purchases_table","114");
INSERT INTO migrations VALUES("173","2023_04_25_150236_create_mail_settings_table","115");
INSERT INTO migrations VALUES("174","2023_05_13_125424_add_zatca_to_general_settings_table","116");
INSERT INTO migrations VALUES("175","2023_05_28_155540_create_tables_table","117");
INSERT INTO migrations VALUES("176","2023_05_29_115039_add_is_table_to_pos_setting_table","117");
INSERT INTO migrations VALUES("177","2023_05_29_115301_add_table_id_to_sales_table","117");
INSERT INTO migrations VALUES("178","2023_05_31_165049_add_queue_no_to_sales_table","117");
INSERT INTO migrations VALUES("190","2023_08_12_124016_add_staff_id_to_employees_table","121");
INSERT INTO migrations VALUES("192","2023_07_23_160254_create_couriers_table","122");
INSERT INTO migrations VALUES("193","2023_07_23_174343_add_courier_id_to_deliveries_table","122");
INSERT INTO migrations VALUES("194","2023_08_14_142608_add_is_active_to_currencies_table","122");
INSERT INTO migrations VALUES("195","2023_08_24_130203_change_columns_to_attendances_table","122");
INSERT INTO migrations VALUES("196","2023_09_10_134503_add_without_stock_to_general_settings_table","123");
INSERT INTO migrations VALUES("204","2023_09_26_211542_add_modules_to_general_settings_table","125");
INSERT INTO migrations VALUES("217","2023_10_15_124306_add_return_qty_to_product_sales_table","129");
INSERT INTO migrations VALUES("219","2023_12_03_235606_crete_external_services_table","131");
INSERT INTO migrations VALUES("221","2023_03_14_174658_add_subscription_type_to_general_setting_table","130");
INSERT INTO migrations VALUES("222","2024_02_04_131826_add_unit_cost_to_product_adjustments_table","132");
INSERT INTO migrations VALUES("223","2024_02_13_173126_change_modules_to_general_settings_table","133");
INSERT INTO migrations VALUES("224","2024_05_02_114215_add_payment_receiver_to_payments","134");
INSERT INTO migrations VALUES("225","2024_05_06_132553_create_sms_templates_table","135");
INSERT INTO migrations VALUES("226","2024_05_07_102225_add_send_sms_to_pos_setting_table","135");
INSERT INTO migrations VALUES("227","2024_05_07_132625_add_is_default_to_sms_templates_table","135");
INSERT INTO migrations VALUES("228","2024_05_08_112211_change_address_and_city_field_to_nullable_in_customers_table","135");
INSERT INTO migrations VALUES("229","2024_05_08_151050_add_is_default_ecommerce_columne_to_sms_templates_table","135");
INSERT INTO migrations VALUES("230","2024_05_20_182757_add_wholesale_price_to_products_table","136");
INSERT INTO migrations VALUES("231","2024_05_21_170500_add_is_sent_to_transfers_table","137");
INSERT INTO migrations VALUES("232","2023_02_05_132001_add_change_to_payments_table","138");
INSERT INTO migrations VALUES("233","2024_06_04_225113_create_income_categories_table","138");
INSERT INTO migrations VALUES("234","2024_06_04_225128_create_incomes_table","138");
INSERT INTO migrations VALUES("235","2024_06_29_131917_add_is_packing_slip_to_general_settings_table","138");
INSERT INTO migrations VALUES("236","2024_07_05_192531_create_packing_slips_table","138");
INSERT INTO migrations VALUES("237","2024_07_05_193002_create_packing_slip_products_table","138");
INSERT INTO migrations VALUES("238","2024_07_05_194501_add_is_packing_and_delivered_to_product_sales_table","138");
INSERT INTO migrations VALUES("239","2024_07_14_122245_add_delivery_id_to_packing_slips_table","138");
INSERT INTO migrations VALUES("240","2024_07_14_122415_add_variant_id_to_packing_slip_products_table","138");
INSERT INTO migrations VALUES("241","2024_07_14_122519_add_packing_slip_ids_to_deliveries_table","138");
INSERT INTO migrations VALUES("242","2024_07_16_125908_create_challans_table","138");
INSERT INTO migrations VALUES("245","2023_03_18_141537_add_woocommerce_category_id_to_categories_table","139");
INSERT INTO migrations VALUES("246","2023_03_20_214553_add_column_for_woocommerce_to_products_table","139");
INSERT INTO migrations VALUES("247","2023_03_20_214563_add_woocommerce_tax_id_to_taxes_table","139");
INSERT INTO migrations VALUES("248","2023_03_20_214565_add_woocommerce_order_id_to_sales_table","139");
INSERT INTO migrations VALUES("249","2023_08_01_134406_add_is_sync_disable_to_categories_table","139");
INSERT INTO migrations VALUES("250","2023_08_01_135252_add_product_status_to_woocommerce_settings_table","139");
INSERT INTO migrations VALUES("251","2024_08_12_112830_add_thermal_invoice_size_to_pos_setting","139");
INSERT INTO migrations VALUES("252","2024_08_14_133351_add_expiry_type_value_to_general_settings","139");
INSERT INTO migrations VALUES("253","2024_09_11_151744_add_return_qty_to_product_purchases_table","140");
INSERT INTO migrations VALUES("254","2024_09_12_162309_create_barcodes_table","140");
INSERT INTO migrations VALUES("255","2024_10_10_121312_add_data_to_payment_with_credit_card_table","141");
INSERT INTO migrations VALUES("256","2024_10_10_212501_alter_attendances_table","142");
INSERT INTO migrations VALUES("257","2024_10_10_213757_alter_attendances_table","142");
INSERT INTO migrations VALUES("258","2024_10_14_144917_change_column_to_nullable_to_payment_with_credit_card_table","142");
INSERT INTO migrations VALUES("259","2024_09_01_120515_create_productions_table","143");
INSERT INTO migrations VALUES("260","2024_09_01_120536_create_product_productions_table","143");
INSERT INTO migrations VALUES("261","2024_11_10_121521_add_code_and_type_to_accounts_table","144");
INSERT INTO migrations VALUES("262","2024_11_24_100926_add_module_status_to_external_services_table","145");



CREATE TABLE `money_transfers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `reference_no` varchar(191) NOT NULL,
  `from_account_id` int(11) NOT NULL,
  `to_account_id` int(11) NOT NULL,
  `amount` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO money_transfers VALUES("1","mtr-20250224-034228","1","6","500","2025-02-24 15:42:28","2025-02-24 15:42:28");



CREATE TABLE `notifications` (
  `id` char(36) NOT NULL,
  `type` varchar(191) NOT NULL,
  `notifiable_type` varchar(191) NOT NULL,
  `notifiable_id` bigint(20) unsigned NOT NULL,
  `data` text NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `packing_slip_products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `packing_slip_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `variant_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO packing_slip_products VALUES("1","1","23","","2024-08-11 05:25:41","2024-08-11 05:25:41");
INSERT INTO packing_slip_products VALUES("2","2","18","","2024-08-11 05:37:38","2024-08-11 05:37:38");



CREATE TABLE `packing_slips` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `reference_no` varchar(255) NOT NULL,
  `sale_id` int(11) NOT NULL,
  `delivery_id` int(11) DEFAULT NULL,
  `amount` double NOT NULL,
  `status` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO packing_slips VALUES("1","1001","42","1","577","Delivered","2024-08-11 05:25:41","2024-08-11 05:28:06");
INSERT INTO packing_slips VALUES("2","1002","43","2","599","In Transit","2024-08-11 05:37:38","2024-08-11 05:39:22");



CREATE TABLE `password_resets` (
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO password_resets VALUES("ashfaqdev.php@gmail.com","$2y$10$plxHOMxChJlHd9t6FQkoN.4dXMdtZ9fE5tXBBItzjxB1R5JF9OpbO","2023-07-15 11:31:30");
INSERT INTO password_resets VALUES("briankibet7401@gmail.com","$2y$10$D72MQVsCF5CIO1WcjsevlO4vA9BidUuWBefmn038aah/McdWl7uM2","2025-02-14 15:01:43");



CREATE TABLE `payment_with_cheque` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `payment_id` int(11) NOT NULL,
  `cheque_no` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO payment_with_cheque VALUES("1","21","34242423","2024-06-03 06:29:06","2024-06-03 06:29:06");



CREATE TABLE `payment_with_credit_card` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `payment_id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `customer_stripe_id` varchar(191) DEFAULT NULL,
  `charge_id` varchar(191) NOT NULL,
  `data` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `payment_with_gift_card` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `payment_id` int(11) NOT NULL,
  `gift_card_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO payment_with_gift_card VALUES("1","103","1","2025-02-18 18:54:55","2025-02-18 18:54:55");



CREATE TABLE `payment_with_paypal` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `payment_id` int(11) NOT NULL,
  `transaction_id` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `payments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `payment_reference` varchar(191) NOT NULL,
  `user_id` int(11) NOT NULL,
  `purchase_id` int(11) DEFAULT NULL,
  `sale_id` int(11) DEFAULT NULL,
  `cash_register_id` int(11) DEFAULT NULL,
  `account_id` int(11) NOT NULL,
  `payment_receiver` varchar(255) DEFAULT NULL,
  `amount` double NOT NULL,
  `used_points` double DEFAULT NULL,
  `change` double DEFAULT NULL,
  `paying_method` varchar(191) NOT NULL,
  `payment_note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=261 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO payments VALUES("1","spr-20240119-084017","1","","1","","1","","1758","","","Cash","","2024-01-19 14:40:17","2024-01-19 14:40:17");
INSERT INTO payments VALUES("2","spr-20240119-084441","1","","2","","1","","3017","","","Cash","","2024-01-19 14:44:41","2024-01-19 14:44:41");
INSERT INTO payments VALUES("3","spr-20240210-122224","1","","5","2","1","","1259","","","Cash","","2024-02-10 06:22:24","2024-02-10 06:22:24");
INSERT INTO payments VALUES("4","spr-20240225-014951","1","","6","2","1","","1299.99","","","Credit Card","","2024-02-25 07:49:51","2024-02-25 07:49:51");
INSERT INTO payments VALUES("5","spr-20240225-015013","1","","7","2","1","","2599.98","","","Cash","","2024-02-25 07:50:13","2024-02-25 07:50:13");
INSERT INTO payments VALUES("6","spr-20240228-112744","1","","8","2","1","","2558.99","","","Cash","","2024-02-28 05:27:44","2024-02-28 05:27:44");
INSERT INTO payments VALUES("7","spr-20240421-110143","1","","9","2","1","","350","","","Cash","","2024-04-21 05:01:43","2024-04-21 05:01:43");
INSERT INTO payments VALUES("8","spr-20240428-121544","1","","13","2","1","","1409","","","Cash","","2024-04-28 06:15:44","2024-04-28 06:15:44");
INSERT INTO payments VALUES("9","spr-20240429-062956","1","","14","2","1","","3800.99","","","Cash","","2024-04-29 12:29:56","2024-04-29 12:29:56");
INSERT INTO payments VALUES("12","spr-20240505-052905","1","","20","2","1","","2549.99","","","Cash","","2024-05-05 11:29:05","2024-05-05 11:29:05");
INSERT INTO payments VALUES("13","spr-20240508-020851","1","","22","2","1","","1349.99","","","Cash","","2024-05-08 08:08:51","2024-05-08 08:08:51");
INSERT INTO payments VALUES("14","spr-20240519-022423","1","","23","2","1","","1299.99","","","Cash","","2024-05-19 08:24:23","2024-05-19 08:24:23");
INSERT INTO payments VALUES("15","spr-20240519-022530","1","","24","2","1","","1300","","","Cash","","2024-05-19 08:25:30","2024-05-19 08:25:30");
INSERT INTO payments VALUES("16","spr-20240519-023055","1","","25","2","1","","1300","","","Cash","","2024-05-19 08:30:55","2024-05-19 08:30:55");
INSERT INTO payments VALUES("18","spr-20240521-013249","1","","28","2","1","","1050","","","Cash","","2024-05-21 07:32:49","2024-05-21 07:32:49");
INSERT INTO payments VALUES("19","spr-20240603-122701","1","","29","2","1","","1000","","","Cash","","2024-06-03 06:27:01","2024-06-03 06:27:01");
INSERT INTO payments VALUES("20","spr-20240603-122810","1","","29","2","1","","1000","","","Credit Card","","2024-06-03 06:28:10","2024-06-03 06:28:10");
INSERT INTO payments VALUES("21","spr-20240603-122906","1","","29","2","1","","549.99","","","Cheque","","2024-06-03 06:29:06","2024-06-03 06:29:06");
INSERT INTO payments VALUES("22","spr-20240603-053022","1","","30","2","1","","2300","","","Cash","","2024-06-03 11:30:22","2024-06-03 11:30:22");
INSERT INTO payments VALUES("23","spr-20240626-010119","1","","33","2","1","","1299.99","","","Cash","","2024-06-26 07:01:19","2024-06-26 07:01:19");
INSERT INTO payments VALUES("24","spr-20240718-113630","1","","38","2","1","","1299.99","","0","Cash","","2024-07-18 05:36:30","2024-07-18 05:36:30");
INSERT INTO payments VALUES("25","spr-20240718-015913","1","","39","2","1","","250","","0","Cash","","2024-07-18 07:59:13","2024-07-18 07:59:13");
INSERT INTO payments VALUES("26","spr-20240718-020145","1","","40","1","1","","250","","0","Cash","","2024-07-18 08:01:45","2024-07-18 08:01:45");
INSERT INTO payments VALUES("27","spr-20240811-112806","1","","42","2","1","","500","","0","Cash","","2024-08-11 05:28:06","2024-08-11 05:28:06");
INSERT INTO payments VALUES("28","spr-20240811-112806","1","","42","2","1","","77","","0","Cheque","","2024-08-11 05:28:06","2024-08-11 05:28:06");
INSERT INTO payments VALUES("29","spr-20240811-114852","1","","45","2","1","","1600","","0","Cash","","2024-08-11 05:48:52","2024-08-11 05:48:52");
INSERT INTO payments VALUES("30","spr-20240825-062616","1","","46","3","1","","1299.99","","0","","","2024-08-25 23:26:16","2024-08-25 23:26:16");
INSERT INTO payments VALUES("31","spr-20240825-062630","1","","47","3","1","","1050","","0","Cash","","2024-08-25 23:26:30","2024-08-25 23:26:30");
INSERT INTO payments VALUES("34","spr-20240825-062929","1","","50","3","1","","350","","0","","","2024-08-25 23:29:29","2024-08-25 23:29:29");
INSERT INTO payments VALUES("35","spr-20241126-101724","1","","51","3","1","","31.9","","0","Cash","","2024-11-26 16:17:24","2024-11-26 16:17:24");
INSERT INTO payments VALUES("36","spr-20241128-112142","1","","53","3","1","","1299.99","","0","Cash","","2024-11-28 05:21:42","2024-11-28 05:21:42");
INSERT INTO payments VALUES("37","spr-20241128-091248","1","","56","3","1","","1497","","0","Cash","","2024-11-28 15:12:48","2024-11-28 15:12:48");
INSERT INTO payments VALUES("38","spr-20250213-044151","47","","57","4","1","","21299.89","","0","Cash","","2025-02-13 16:41:51","2025-02-13 16:41:51");
INSERT INTO payments VALUES("39","spr-20250213-044506","47","","58","4","1","","14299.89","","0","Cash","","2025-02-13 16:45:06","2025-02-13 16:45:06");
INSERT INTO payments VALUES("40","spr-20250213-044845","47","","59","4","1","","24299.89","","0","Cash","","2025-02-13 16:48:45","2025-02-13 16:48:45");
INSERT INTO payments VALUES("41","spr-20250213-075412","47","","62","4","1","","14299.89","","0","Cash","","2025-02-13 19:54:12","2025-02-13 19:54:12");
INSERT INTO payments VALUES("42","spr-20250214-101034","47","","63","4","1","","1250","","0","Cash","","2025-02-14 10:10:34","2025-02-14 10:10:34");
INSERT INTO payments VALUES("43","spr-20250214-071905","48","","64","6","1","","220","","0","Cash","","2025-02-14 19:19:05","2025-02-14 19:19:05");
INSERT INTO payments VALUES("44","spr-20250215-112411","47","","65","4","1","Tarus","1260","","0","Cash","Done","2025-02-15 23:24:11","2025-02-15 23:24:11");
INSERT INTO payments VALUES("45","spr-20250215-112741","47","","66","4","1","","2400.99","","0","Cash","","2025-02-15 23:27:41","2025-02-15 23:27:41");
INSERT INTO payments VALUES("46","spr-20250215-112848","47","","67","4","1","","559","","0","Cash","","2025-02-15 23:28:48","2025-02-15 23:28:48");
INSERT INTO payments VALUES("47","spr-20250215-112946","47","","68","4","1","","5999.94","","0","Cash","","2025-02-15 23:29:46","2025-02-15 23:29:46");
INSERT INTO payments VALUES("48","spr-20250215-113100","47","","69","4","1","","2301.98","","0","Cash","","2025-02-15 23:31:00","2025-02-15 23:31:00");
INSERT INTO payments VALUES("49","spr-20250215-113419","47","","70","4","1","","350","","0","Cash","","2025-02-15 23:34:19","2025-02-15 23:34:19");
INSERT INTO payments VALUES("50","spr-20250215-113721","47","","71","7","1","","448.8","","0","Cash","","2025-02-15 23:37:21","2025-02-15 23:37:21");
INSERT INTO payments VALUES("51","spr-20250215-113829","47","","72","4","1","","2500","","0","Cash","","2025-02-15 23:38:29","2025-02-15 23:38:29");
INSERT INTO payments VALUES("52","spr-20250217-072621","47","","75","4","1","","1050","","0","Cash","","2025-02-17 19:26:21","2025-02-17 19:26:21");
INSERT INTO payments VALUES("53","spr-20250217-072909","47","","76","8","1","","1325.99","","0","Cash","","2025-02-17 19:29:09","2025-02-17 19:29:09");
INSERT INTO payments VALUES("54","spr-20250217-073140","47","","77","4","1","","218","","0","Cash","","2025-02-17 19:31:40","2025-02-17 19:31:40");
INSERT INTO payments VALUES("55","spr-20250218-100646","47","","78","4","1","","1050","","1000","Cash","","2025-02-18 10:06:46","2025-02-18 10:06:46");
INSERT INTO payments VALUES("56","spr-20250218-101048","47","","79","4","1","","1150.99","","1000","Cash","","2025-02-18 10:10:48","2025-02-18 10:10:48");
INSERT INTO payments VALUES("57","spr-20250218-101449","47","","80","4","1","","1150.99","","10","Cash","","2025-02-18 10:14:49","2025-02-18 10:14:49");
INSERT INTO payments VALUES("58","spr-20250218-103942","47","","82","4","1","","1150.99","","0","Cash","","2025-02-18 10:39:42","2025-02-18 10:39:42");
INSERT INTO payments VALUES("59","spr-20250218-022422","47","","86","4","1","","559","","5030","Cash","","2025-02-18 14:24:22","2025-02-18 14:24:22");
INSERT INTO payments VALUES("60","spr-20250218-022501","47","","87","4","1","","559","","100","Cash","","2025-02-18 14:25:01","2025-02-18 14:25:01");
INSERT INTO payments VALUES("61","spr-20250218-022538","47","","88","4","1","","1111.99","","0","Cash","","2025-02-18 14:25:38","2025-02-18 14:25:38");
INSERT INTO payments VALUES("62","spr-20250218-022717","47","","89","4","1","","559","","0","Cash","","2025-02-18 14:27:17","2025-02-18 14:27:17");
INSERT INTO payments VALUES("63","spr-20250218-023138","47","","90","4","1","","559","","100","Cash","","2025-02-18 14:31:38","2025-02-18 14:31:38");
INSERT INTO payments VALUES("64","spr-20250218-023258","47","","91","4","1","","559","","100","Cash","","2025-02-18 14:32:58","2025-02-18 14:32:58");
INSERT INTO payments VALUES("65","spr-20250218-023320","47","","92","4","1","","559","","0","Cash","","2025-02-18 14:33:20","2025-02-18 14:33:20");
INSERT INTO payments VALUES("66","spr-20250218-025911","47","","93","4","1","","559","","100","Cash","","2025-02-18 14:59:11","2025-02-18 14:59:11");
INSERT INTO payments VALUES("67","spr-20250218-030015","47","","94","4","1","","559","","100","Cash","","2025-02-18 15:00:15","2025-02-18 15:00:15");
INSERT INTO payments VALUES("68","spr-20250218-030253","47","","95","4","1","","559","","100","Cash","","2025-02-18 15:02:53","2025-02-18 15:02:53");
INSERT INTO payments VALUES("69","spr-20250218-030511","47","","96","4","1","","1150.99","","1000","Cash","","2025-02-18 15:05:11","2025-02-18 15:05:11");
INSERT INTO payments VALUES("70","spr-20250218-030547","47","","97","4","1","","1150.99","","1000","Cash","","2025-02-18 15:05:47","2025-02-18 15:05:47");
INSERT INTO payments VALUES("71","spr-20250218-030703","47","","98","4","1","","1150.99","","1000","Cash","","2025-02-18 15:07:03","2025-02-18 15:07:03");
INSERT INTO payments VALUES("72","spr-20250218-031643","47","","99","4","1","","2301.98","","3000","Cash","","2025-02-18 15:16:43","2025-02-18 15:16:43");
INSERT INTO payments VALUES("73","spr-20250218-031726","47","","100","4","1","","1111.99","","1000","Cash","","2025-02-18 15:17:26","2025-02-18 15:17:26");
INSERT INTO payments VALUES("74","spr-20250218-032057","47","","101","4","1","","1111.99","","200","Cash","","2025-02-18 15:20:57","2025-02-18 15:20:57");
INSERT INTO payments VALUES("75","spr-20250218-032209","47","","102","4","1","","1111.99","","10200","Cash","","2025-02-18 15:22:09","2025-02-18 15:22:09");
INSERT INTO payments VALUES("76","spr-20250218-032256","47","","103","4","1","","1111.99","","2000","Cash","","2025-02-18 15:22:56","2025-02-18 15:22:56");
INSERT INTO payments VALUES("77","spr-20250218-032500","47","","104","4","1","","1111.99","","1000","Cash","","2025-02-18 15:25:00","2025-02-18 15:25:00");
INSERT INTO payments VALUES("78","spr-20250218-033317","47","","105","4","1","","1111.99","","1000","Cash","","2025-02-18 15:33:17","2025-02-18 15:33:17");
INSERT INTO payments VALUES("79","spr-20250218-033407","47","","106","4","1","","1111.99","","2000","Cash","","2025-02-18 15:34:07","2025-02-18 15:34:07");
INSERT INTO payments VALUES("80","spr-20250218-033433","47","","107","4","1","","1111.99","","0","Cash","","2025-02-18 15:34:33","2025-02-18 15:34:33");
INSERT INTO payments VALUES("81","spr-20250218-035818","47","","108","8","1","","1299.99","","0","Cash","","2025-02-18 15:58:18","2025-02-18 15:58:18");
INSERT INTO payments VALUES("82","spr-20250218-035915","47","","109","8","1","","1299.99","","0","Cash","","2025-02-18 15:59:15","2025-02-18 15:59:15");
INSERT INTO payments VALUES("83","spr-20250218-040157","47","","110","4","1","","1250","","0","Cash","","2025-02-18 16:01:57","2025-02-18 16:01:57");
INSERT INTO payments VALUES("84","spr-20250218-042141","47","","112","4","1","","1150.99","","0","Credit Card","","2025-02-18 16:21:41","2025-02-18 16:21:41");
INSERT INTO payments VALUES("85","spr-20250218-042222","47","","113","4","1","","1250","","0","Cash","","2025-02-18 16:22:22","2025-02-18 16:22:22");
INSERT INTO payments VALUES("86","spr-20250218-044833","47","","115","4","1","","1111.99","","0","Deposit","","2025-02-18 16:48:33","2025-02-18 16:48:33");
INSERT INTO payments VALUES("87","spr-20250218-045140","47","","116","4","1","","1709.99","","1000","Credit Card","","2025-02-18 16:51:40","2025-02-18 16:51:40");
INSERT INTO payments VALUES("88","spr-20250218-045252","47","","117","4","1","","1111.99","","1000","Cash","","2025-02-18 16:52:52","2025-02-18 16:52:52");
INSERT INTO payments VALUES("89","spr-20250218-045425","47","","118","4","1","","1150.99","","2000","Cash","","2025-02-18 16:54:25","2025-02-18 16:54:25");
INSERT INTO payments VALUES("90","spr-20250218-045701","47","","119","4","1","","1150.99","","1000","Cash","","2025-02-18 16:57:01","2025-02-18 16:57:01");
INSERT INTO payments VALUES("91","spr-20250218-045723","47","","120","4","1","","350","","200","Cash","","2025-02-18 16:57:23","2025-02-18 16:57:23");
INSERT INTO payments VALUES("92","spr-20250218-045812","47","","121","4","1","","12660.89","43","0","Points","","2025-02-18 16:58:12","2025-02-18 16:58:12");
INSERT INTO payments VALUES("93","spr-20250218-050306","47","","122","4","1","","12660.89","","10000","Cash","","2025-02-18 17:03:06","2025-02-18 17:03:06");
INSERT INTO payments VALUES("94","spr-20250218-050548","47","","123","4","1","","14299.89","","10000","Cash","","2025-02-18 17:05:48","2025-02-18 17:05:48");
INSERT INTO payments VALUES("95","spr-20250218-050601","47","","124","4","1","","1299.99","","0","Cash","","2025-02-18 17:06:01","2025-02-18 17:06:01");
INSERT INTO payments VALUES("96","spr-20250218-050923","47","","126","4","1","","1250","","0","Cash","","2025-02-18 17:09:23","2025-02-18 17:09:23");
INSERT INTO payments VALUES("97","spr-20250218-051247","47","","127","4","1","","1250","","0","Cash","","2025-02-18 17:12:47","2025-02-18 17:12:47");
INSERT INTO payments VALUES("98","spr-20250218-051810","47","","128","4","1","","1250","","0","Cash","","2025-02-18 17:18:10","2025-02-18 17:18:10");
INSERT INTO payments VALUES("99","spr-20250218-052610","47","","130","4","1","","1750","","1000","Cash","","2025-02-18 17:26:10","2025-02-18 17:26:10");
INSERT INTO payments VALUES("100","spr-20250218-052744","47","","131","4","1","","1750","","0","Cash","","2025-02-18 17:27:44","2025-02-18 17:27:44");
INSERT INTO payments VALUES("101","spr-20250218-052922","47","","133","4","1","","2249.99","","0","Cash","","2025-02-18 17:29:22","2025-02-18 17:29:22");
INSERT INTO payments VALUES("102","spr-20250218-063636","47","","138","8","1","","1111.99","","0","Cash","","2025-02-18 18:36:36","2025-02-18 18:36:36");
INSERT INTO payments VALUES("103","spr-20250218-065455","47","","142","4","1","","999.99","","0","Gift Card","","2025-02-18 18:54:55","2025-02-18 18:54:55");
INSERT INTO payments VALUES("104","spr-20250218-065805","47","","144","4","1","","1250","","0","Cash","","2025-02-18 18:58:05","2025-02-18 18:58:05");
INSERT INTO payments VALUES("114","spr-20250220-024912","47","","155","7","1","","50","","0","Gift Card","","2025-02-20 14:49:12","2025-02-20 14:49:12");
INSERT INTO payments VALUES("115","spr-20250220-024930","47","","156","7","1","","50","","0","Cash","","2025-02-20 14:49:30","2025-02-20 14:49:30");
INSERT INTO payments VALUES("116","spr-20250220-024949","47","","157","7","1","","50","","0","Gift Card","","2025-02-20 14:49:49","2025-02-20 14:49:49");
INSERT INTO payments VALUES("146","ppr-20250224-031414","47","15","","","1","","10000","","0","Cash","","2025-02-24 15:14:14","2025-02-24 15:14:14");
INSERT INTO payments VALUES("147","ppr-20250224-032403","47","16","","","1","","50000","","0","Cash","","2025-02-24 15:24:03","2025-02-24 15:24:03");
INSERT INTO payments VALUES("148","ppr-20250224-033649","47","17","","","1","","3000","","2000","Cash","","2025-02-24 15:36:49","2025-02-24 15:36:49");
INSERT INTO payments VALUES("149","ppr-20250224-033813","47","17","","","1","","2000","","0","Cash","","2025-02-24 15:38:13","2025-02-24 15:38:13");
INSERT INTO payments VALUES("196","ppr-20250226-055921","47","15","","","1","","0","","0","Credit Card","","2025-02-26 17:59:21","2025-02-26 17:59:21");
INSERT INTO payments VALUES("197","ppr-20250226-060433","47","21","","","1","","700","","300","Cash","","2025-02-26 18:04:33","2025-02-26 18:04:33");
INSERT INTO payments VALUES("198","ppr-20250226-061134","47","21","","","1","","300","","0","Credit Card","","2025-02-26 18:11:34","2025-02-26 18:11:34");
INSERT INTO payments VALUES("201","ppr-20250226-090933","47","21","","","8","","0","","0","Cash","","2025-02-26 21:09:33","2025-02-26 21:09:33");
INSERT INTO payments VALUES("223","spr-20250302-040538","47","","320","7","8","","120","","0","Cash","","2025-03-02 16:05:38","2025-03-02 16:05:38");
INSERT INTO payments VALUES("224","spr-20250302-040943","47","","321","7","8","","660","","0","Deposit","","2025-03-02 16:09:43","2025-03-02 16:09:43");
INSERT INTO payments VALUES("225","spr-20250302-060140","50","","322","15","8","","30","","0","Cash","","2025-03-02 18:01:40","2025-03-02 18:01:40");
INSERT INTO payments VALUES("226","spr-20250304-082157","47","","323","7","8","","40","","0","Cash","","2025-03-04 08:21:57","2025-03-04 08:21:57");
INSERT INTO payments VALUES("227","spr-20250304-082300","47","","324","7","8","","20","","0","Cash","","2025-03-04 08:23:00","2025-03-04 08:23:00");
INSERT INTO payments VALUES("228","spr-20250313-040815","47","","325","7","8","","10","","0","Cash","","2025-03-13 16:08:15","2025-03-13 16:08:15");
INSERT INTO payments VALUES("229","spr-20250313-040859","47","","326","7","8","","10","","0","Cash","","2025-03-13 16:08:59","2025-03-13 16:08:59");
INSERT INTO payments VALUES("230","spr-20250313-052421","47","","327","7","8","","40","","0","Cash","","2025-03-13 17:24:21","2025-03-13 17:24:21");
INSERT INTO payments VALUES("231","spr-20250313-081602","47","","328","7","8","","10","","0","Cash","","2025-03-13 20:16:02","2025-03-13 20:16:02");
INSERT INTO payments VALUES("232","spr-20250313-082526","47","","329","7","8","","10","","0","Cash","","2025-03-13 20:25:26","2025-03-13 20:25:26");
INSERT INTO payments VALUES("233","spr-20250313-082626","47","","330","7","8","","10","","0","Cash","","2025-03-13 20:26:26","2025-03-13 20:26:26");
INSERT INTO payments VALUES("234","spr-20250314-113443","47","","331","7","8","","10","","0","Cash","","2025-03-14 11:34:43","2025-03-14 11:34:43");
INSERT INTO payments VALUES("235","spr-20250314-114134","47","","332","7","8","","10","","0","Cash","","2025-03-14 11:41:34","2025-03-14 11:41:34");
INSERT INTO payments VALUES("236","spr-20250314-114402","47","","333","7","8","","10","","0","Cash","","2025-03-14 11:44:02","2025-03-14 11:44:02");
INSERT INTO payments VALUES("237","spr-20250314-114524","47","","334","7","8","","10","","0","Cash","","2025-03-14 11:45:24","2025-03-14 11:45:24");
INSERT INTO payments VALUES("239","spr-20250315-031632","47","","336","7","8","","10","","0","Cash","","2025-03-15 15:16:32","2025-03-15 15:16:32");
INSERT INTO payments VALUES("240","spr-20250315-031641","47","","337","7","8","","10","","0","Cash","","2025-03-15 15:16:41","2025-03-15 15:16:41");
INSERT INTO payments VALUES("241","spr-20250315-031840","47","","338","7","8","","80","","0","Cash","","2025-03-15 15:18:40","2025-03-15 15:18:40");
INSERT INTO payments VALUES("242","spr-20250315-031906","47","","339","7","8","","80","","0","Cash","","2025-03-15 15:19:06","2025-03-15 15:19:06");
INSERT INTO payments VALUES("243","spr-20250315-031936","47","","340","7","8","","10","","0","Cash","","2025-03-15 15:19:36","2025-03-15 15:19:36");
INSERT INTO payments VALUES("244","spr-20250315-032031","47","","341","7","8","","10","","0","Cash","","2025-03-15 15:20:31","2025-03-15 15:20:31");
INSERT INTO payments VALUES("245","spr-20250315-032453","47","","342","7","8","","60","","0","Cash","","2025-03-15 15:24:53","2025-03-15 15:24:53");
INSERT INTO payments VALUES("246","spr-20250315-035556","47","","343","7","8","","30","","0","Cash","","2025-03-15 15:55:56","2025-03-15 15:55:56");
INSERT INTO payments VALUES("247","spr-20250315-054819","47","","344","7","8","","80","","0","Cash","","2025-03-15 17:48:19","2025-03-15 17:48:19");
INSERT INTO payments VALUES("248","spr-20250315-071024","47","","345","7","8","","80","","0","Cash","","2025-03-15 19:10:24","2025-03-15 19:10:24");
INSERT INTO payments VALUES("249","spr-20250315-071452","47","","346","7","8","","80","","0","Cash","","2025-03-15 19:14:52","2025-03-15 19:14:52");
INSERT INTO payments VALUES("250","spr-20250315-073230","47","","347","7","8","","10","","0","Cash","","2025-03-15 19:32:30","2025-03-15 19:32:30");
INSERT INTO payments VALUES("251","spr-20250315-073252","47","","348","7","8","","80","","0","Cash","","2025-03-15 19:32:52","2025-03-15 19:32:52");
INSERT INTO payments VALUES("252","spr-20250315-073328","47","","349","7","8","","80","","0","Cash","","2025-03-15 19:33:28","2025-03-15 19:33:28");
INSERT INTO payments VALUES("253","spr-20250315-092344","47","","350","7","8","","80","","0","Cash","","2025-03-15 21:23:44","2025-03-15 21:23:44");
INSERT INTO payments VALUES("254","spr-20250318-011530","47","","351","7","8","","27.08","","0","Cash","","2025-03-18 13:15:30","2025-03-18 13:15:30");
INSERT INTO payments VALUES("255","spr-20250318-011841","47","","352","7","8","","80","","0","Cash","","2025-03-18 13:18:41","2025-03-18 13:18:41");
INSERT INTO payments VALUES("256","spr-20250318-011913","47","","353","7","8","","10","","0","Cash","","2025-03-18 13:19:13","2025-03-18 13:19:13");
INSERT INTO payments VALUES("257","spr-20250319-084120","47","","354","7","8","","80","","0","Cash","","2025-03-19 20:41:20","2025-03-19 20:41:20");
INSERT INTO payments VALUES("258","spr-20250319-090118","47","","355","7","8","","80","","0","Cash","","2025-03-19 21:01:18","2025-03-19 21:01:18");
INSERT INTO payments VALUES("259","spr-20250320-032940","47","","356","7","8","","80","","0","Cash","","2025-03-20 15:29:40","2025-03-20 15:29:40");
INSERT INTO payments VALUES("260","spr-20250326-073122","47","","357","7","8","","60","","0","Cash","","2025-03-26 19:31:22","2025-03-26 19:31:22");



CREATE TABLE `payrolls` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `reference_no` varchar(191) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `amount` double NOT NULL,
  `paying_method` varchar(191) NOT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO payrolls VALUES("6","payroll-20250224-040514","1","7","47","2000","0","","2025-02-24 00:00:00","2025-02-24 16:05:14");
INSERT INTO payrolls VALUES("7","payroll-20250224-040923","1","7","47","3000","0","","2025-02-25 00:00:00","2025-02-24 16:13:30");
INSERT INTO payrolls VALUES("8","payroll-20250224-041224","2","7","47","5000","0","","2025-02-24 00:00:00","2025-02-24 16:12:24");



CREATE TABLE `permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `guard_name` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=133 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO permissions VALUES("4","products-edit","web","2018-06-03 01:00:09","2018-06-03 01:00:09");
INSERT INTO permissions VALUES("5","products-delete","web","2018-06-03 22:54:22","2018-06-03 22:54:22");
INSERT INTO permissions VALUES("6","products-add","web","2018-06-04 00:34:14","2018-06-04 00:34:14");
INSERT INTO permissions VALUES("7","products-index","web","2018-06-04 03:34:27","2018-06-04 03:34:27");
INSERT INTO permissions VALUES("8","purchases-index","web","2018-06-04 08:03:19","2018-06-04 08:03:19");
INSERT INTO permissions VALUES("9","purchases-add","web","2018-06-04 08:12:25","2018-06-04 08:12:25");
INSERT INTO permissions VALUES("10","purchases-edit","web","2018-06-04 09:47:36","2018-06-04 09:47:36");
INSERT INTO permissions VALUES("11","purchases-delete","web","2018-06-04 09:47:36","2018-06-04 09:47:36");
INSERT INTO permissions VALUES("12","sales-index","web","2018-06-04 10:49:08","2018-06-04 10:49:08");
INSERT INTO permissions VALUES("13","sales-add","web","2018-06-04 10:49:52","2018-06-04 10:49:52");
INSERT INTO permissions VALUES("14","sales-edit","web","2018-06-04 10:49:52","2018-06-04 10:49:52");
INSERT INTO permissions VALUES("15","sales-delete","web","2018-06-04 10:49:53","2018-06-04 10:49:53");
INSERT INTO permissions VALUES("16","quotes-index","web","2018-06-04 22:05:10","2018-06-04 22:05:10");
INSERT INTO permissions VALUES("17","quotes-add","web","2018-06-04 22:05:10","2018-06-04 22:05:10");
INSERT INTO permissions VALUES("18","quotes-edit","web","2018-06-04 22:05:10","2018-06-04 22:05:10");
INSERT INTO permissions VALUES("19","quotes-delete","web","2018-06-04 22:05:10","2018-06-04 22:05:10");
INSERT INTO permissions VALUES("20","transfers-index","web","2018-06-04 22:30:03","2018-06-04 22:30:03");
INSERT INTO permissions VALUES("21","transfers-add","web","2018-06-04 22:30:03","2018-06-04 22:30:03");
INSERT INTO permissions VALUES("22","transfers-edit","web","2018-06-04 22:30:03","2018-06-04 22:30:03");
INSERT INTO permissions VALUES("23","transfers-delete","web","2018-06-04 22:30:03","2018-06-04 22:30:03");
INSERT INTO permissions VALUES("24","returns-index","web","2018-06-04 22:50:24","2018-06-04 22:50:24");
INSERT INTO permissions VALUES("25","returns-add","web","2018-06-04 22:50:24","2018-06-04 22:50:24");
INSERT INTO permissions VALUES("26","returns-edit","web","2018-06-04 22:50:25","2018-06-04 22:50:25");
INSERT INTO permissions VALUES("27","returns-delete","web","2018-06-04 22:50:25","2018-06-04 22:50:25");
INSERT INTO permissions VALUES("28","customers-index","web","2018-06-04 23:15:54","2018-06-04 23:15:54");
INSERT INTO permissions VALUES("29","customers-add","web","2018-06-04 23:15:55","2018-06-04 23:15:55");
INSERT INTO permissions VALUES("30","customers-edit","web","2018-06-04 23:15:55","2018-06-04 23:15:55");
INSERT INTO permissions VALUES("31","customers-delete","web","2018-06-04 23:15:55","2018-06-04 23:15:55");
INSERT INTO permissions VALUES("32","suppliers-index","web","2018-06-04 23:40:12","2018-06-04 23:40:12");
INSERT INTO permissions VALUES("33","suppliers-add","web","2018-06-04 23:40:12","2018-06-04 23:40:12");
INSERT INTO permissions VALUES("34","suppliers-edit","web","2018-06-04 23:40:12","2018-06-04 23:40:12");
INSERT INTO permissions VALUES("35","suppliers-delete","web","2018-06-04 23:40:12","2018-06-04 23:40:12");
INSERT INTO permissions VALUES("36","product-report","web","2018-06-24 23:05:33","2018-06-24 23:05:33");
INSERT INTO permissions VALUES("37","purchase-report","web","2018-06-24 23:24:56","2018-06-24 23:24:56");
INSERT INTO permissions VALUES("38","sale-report","web","2018-06-24 23:33:13","2018-06-24 23:33:13");
INSERT INTO permissions VALUES("39","customer-report","web","2018-06-24 23:36:51","2018-06-24 23:36:51");
INSERT INTO permissions VALUES("40","due-report","web","2018-06-24 23:39:52","2018-06-24 23:39:52");
INSERT INTO permissions VALUES("41","users-index","web","2018-06-25 00:00:10","2018-06-25 00:00:10");
INSERT INTO permissions VALUES("42","users-add","web","2018-06-25 00:00:10","2018-06-25 00:00:10");
INSERT INTO permissions VALUES("43","users-edit","web","2018-06-25 00:01:30","2018-06-25 00:01:30");
INSERT INTO permissions VALUES("44","users-delete","web","2018-06-25 00:01:30","2018-06-25 00:01:30");
INSERT INTO permissions VALUES("45","profit-loss","web","2018-07-14 21:50:05","2018-07-14 21:50:05");
INSERT INTO permissions VALUES("46","best-seller","web","2018-07-14 22:01:38","2018-07-14 22:01:38");
INSERT INTO permissions VALUES("47","daily-sale","web","2018-07-14 22:24:21","2018-07-14 22:24:21");
INSERT INTO permissions VALUES("48","monthly-sale","web","2018-07-14 22:30:41","2018-07-14 22:30:41");
INSERT INTO permissions VALUES("49","daily-purchase","web","2018-07-14 22:36:46","2018-07-14 22:36:46");
INSERT INTO permissions VALUES("50","monthly-purchase","web","2018-07-14 22:48:17","2018-07-14 22:48:17");
INSERT INTO permissions VALUES("51","payment-report","web","2018-07-14 23:10:41","2018-07-14 23:10:41");
INSERT INTO permissions VALUES("52","warehouse-stock-report","web","2018-07-14 23:16:55","2018-07-14 23:16:55");
INSERT INTO permissions VALUES("53","product-qty-alert","web","2018-07-14 23:33:21","2018-07-14 23:33:21");
INSERT INTO permissions VALUES("54","supplier-report","web","2018-07-30 03:00:01","2018-07-30 03:00:01");
INSERT INTO permissions VALUES("55","expenses-index","web","2018-09-05 01:07:10","2018-09-05 01:07:10");
INSERT INTO permissions VALUES("56","expenses-add","web","2018-09-05 01:07:10","2018-09-05 01:07:10");
INSERT INTO permissions VALUES("57","expenses-edit","web","2018-09-05 01:07:10","2018-09-05 01:07:10");
INSERT INTO permissions VALUES("58","expenses-delete","web","2018-09-05 01:07:11","2018-09-05 01:07:11");
INSERT INTO permissions VALUES("59","general_setting","web","2018-10-19 23:10:04","2018-10-19 23:10:04");
INSERT INTO permissions VALUES("60","mail_setting","web","2018-10-19 23:10:04","2018-10-19 23:10:04");
INSERT INTO permissions VALUES("61","pos_setting","web","2018-10-19 23:10:04","2018-10-19 23:10:04");
INSERT INTO permissions VALUES("62","hrm_setting","web","2019-01-02 10:30:23","2019-01-02 10:30:23");
INSERT INTO permissions VALUES("63","purchase-return-index","web","2019-01-02 21:45:14","2019-01-02 21:45:14");
INSERT INTO permissions VALUES("64","purchase-return-add","web","2019-01-02 21:45:14","2019-01-02 21:45:14");
INSERT INTO permissions VALUES("65","purchase-return-edit","web","2019-01-02 21:45:14","2019-01-02 21:45:14");
INSERT INTO permissions VALUES("66","purchase-return-delete","web","2019-01-02 21:45:14","2019-01-02 21:45:14");
INSERT INTO permissions VALUES("67","account-index","web","2019-01-02 22:06:13","2019-01-02 22:06:13");
INSERT INTO permissions VALUES("68","balance-sheet","web","2019-01-02 22:06:14","2019-01-02 22:06:14");
INSERT INTO permissions VALUES("69","account-statement","web","2019-01-02 22:06:14","2019-01-02 22:06:14");
INSERT INTO permissions VALUES("70","department","web","2019-01-02 22:30:01","2019-01-02 22:30:01");
INSERT INTO permissions VALUES("71","attendance","web","2019-01-02 22:30:01","2019-01-02 22:30:01");
INSERT INTO permissions VALUES("72","payroll","web","2019-01-02 22:30:01","2019-01-02 22:30:01");
INSERT INTO permissions VALUES("73","employees-index","web","2019-01-02 22:52:19","2019-01-02 22:52:19");
INSERT INTO permissions VALUES("74","employees-add","web","2019-01-02 22:52:19","2019-01-02 22:52:19");
INSERT INTO permissions VALUES("75","employees-edit","web","2019-01-02 22:52:19","2019-01-02 22:52:19");
INSERT INTO permissions VALUES("76","employees-delete","web","2019-01-02 22:52:19","2019-01-02 22:52:19");
INSERT INTO permissions VALUES("77","user-report","web","2019-01-16 06:48:18","2019-01-16 06:48:18");
INSERT INTO permissions VALUES("78","stock_count","web","2019-02-17 10:32:01","2019-02-17 10:32:01");
INSERT INTO permissions VALUES("79","adjustment","web","2019-02-17 10:32:02","2019-02-17 10:32:02");
INSERT INTO permissions VALUES("80","sms_setting","web","2019-02-22 05:18:03","2019-02-22 05:18:03");
INSERT INTO permissions VALUES("81","create_sms","web","2019-02-22 05:18:03","2019-02-22 05:18:03");
INSERT INTO permissions VALUES("82","print_barcode","web","2019-03-07 05:02:19","2019-03-07 05:02:19");
INSERT INTO permissions VALUES("83","empty_database","web","2019-03-07 05:02:19","2019-03-07 05:02:19");
INSERT INTO permissions VALUES("84","customer_group","web","2019-03-07 05:37:15","2019-03-07 05:37:15");
INSERT INTO permissions VALUES("85","unit","web","2019-03-07 05:37:15","2019-03-07 05:37:15");
INSERT INTO permissions VALUES("86","tax","web","2019-03-07 05:37:15","2019-03-07 05:37:15");
INSERT INTO permissions VALUES("87","gift_card","web","2019-03-07 06:29:38","2019-03-07 06:29:38");
INSERT INTO permissions VALUES("88","coupon","web","2019-03-07 06:29:38","2019-03-07 06:29:38");
INSERT INTO permissions VALUES("89","holiday","web","2019-10-19 08:57:15","2019-10-19 08:57:15");
INSERT INTO permissions VALUES("90","warehouse-report","web","2019-10-22 06:00:23","2019-10-22 06:00:23");
INSERT INTO permissions VALUES("91","warehouse","web","2020-02-26 06:47:32","2020-02-26 06:47:32");
INSERT INTO permissions VALUES("92","brand","web","2020-02-26 06:59:59","2020-02-26 06:59:59");
INSERT INTO permissions VALUES("93","billers-index","web","2020-02-26 07:11:15","2020-02-26 07:11:15");
INSERT INTO permissions VALUES("94","billers-add","web","2020-02-26 07:11:15","2020-02-26 07:11:15");
INSERT INTO permissions VALUES("95","billers-edit","web","2020-02-26 07:11:15","2020-02-26 07:11:15");
INSERT INTO permissions VALUES("96","billers-delete","web","2020-02-26 07:11:15","2020-02-26 07:11:15");
INSERT INTO permissions VALUES("97","money-transfer","web","2020-03-02 05:41:48","2020-03-02 05:41:48");
INSERT INTO permissions VALUES("98","category","web","2020-07-13 12:13:16","2020-07-13 12:13:16");
INSERT INTO permissions VALUES("99","delivery","web","2020-07-13 12:13:16","2020-07-13 12:13:16");
INSERT INTO permissions VALUES("100","send_notification","web","2020-10-31 06:21:31","2020-10-31 06:21:31");
INSERT INTO permissions VALUES("101","today_sale","web","2020-10-31 06:57:04","2020-10-31 06:57:04");
INSERT INTO permissions VALUES("102","today_profit","web","2020-10-31 06:57:04","2020-10-31 06:57:04");
INSERT INTO permissions VALUES("103","currency","web","2020-11-09 00:23:11","2020-11-09 00:23:11");
INSERT INTO permissions VALUES("104","backup_database","web","2020-11-15 00:16:55","2020-11-15 00:16:55");
INSERT INTO permissions VALUES("105","reward_point_setting","web","2021-06-27 04:34:42","2021-06-27 04:34:42");
INSERT INTO permissions VALUES("106","revenue_profit_summary","web","2022-02-08 13:57:21","2022-02-08 13:57:21");
INSERT INTO permissions VALUES("107","cash_flow","web","2022-02-08 13:57:22","2022-02-08 13:57:22");
INSERT INTO permissions VALUES("108","monthly_summary","web","2022-02-08 13:57:22","2022-02-08 13:57:22");
INSERT INTO permissions VALUES("109","yearly_report","web","2022-02-08 13:57:22","2022-02-08 13:57:22");
INSERT INTO permissions VALUES("110","discount_plan","web","2022-02-16 09:12:26","2022-02-16 09:12:26");
INSERT INTO permissions VALUES("111","discount","web","2022-02-16 09:12:38","2022-02-16 09:12:38");
INSERT INTO permissions VALUES("112","product-expiry-report","web","2022-03-30 05:39:20","2022-03-30 05:39:20");
INSERT INTO permissions VALUES("113","purchase-payment-index","web","2022-06-05 14:12:27","2022-06-05 14:12:27");
INSERT INTO permissions VALUES("114","purchase-payment-add","web","2022-06-05 14:12:28","2022-06-05 14:12:28");
INSERT INTO permissions VALUES("115","purchase-payment-edit","web","2022-06-05 14:12:28","2022-06-05 14:12:28");
INSERT INTO permissions VALUES("116","purchase-payment-delete","web","2022-06-05 14:12:28","2022-06-05 14:12:28");
INSERT INTO permissions VALUES("117","sale-payment-index","web","2022-06-05 14:12:28","2022-06-05 14:12:28");
INSERT INTO permissions VALUES("118","sale-payment-add","web","2022-06-05 14:12:28","2022-06-05 14:12:28");
INSERT INTO permissions VALUES("119","sale-payment-edit","web","2022-06-05 14:12:28","2022-06-05 14:12:28");
INSERT INTO permissions VALUES("120","sale-payment-delete","web","2022-06-05 14:12:28","2022-06-05 14:12:28");
INSERT INTO permissions VALUES("121","all_notification","web","2022-06-05 14:12:29","2022-06-05 14:12:29");
INSERT INTO permissions VALUES("122","sale-report-chart","web","2022-06-05 14:12:29","2022-06-05 14:12:29");
INSERT INTO permissions VALUES("123","dso-report","web","2022-06-05 14:12:29","2022-06-05 14:12:29");
INSERT INTO permissions VALUES("124","product_history","web","2022-08-25 14:04:05","2022-08-25 14:04:05");
INSERT INTO permissions VALUES("125","supplier-due-report","web","2022-08-31 09:46:33","2022-08-31 09:46:33");
INSERT INTO permissions VALUES("126","custom_field","web","2023-05-02 07:41:35","2023-05-02 07:41:35");
INSERT INTO permissions VALUES("127","incomes-index","web","2024-08-11 04:50:59","2024-08-11 04:50:59");
INSERT INTO permissions VALUES("128","incomes-add","web","2024-08-11 04:50:59","2024-08-11 04:50:59");
INSERT INTO permissions VALUES("129","incomes-edit","web","2024-08-11 04:50:59","2024-08-11 04:50:59");
INSERT INTO permissions VALUES("130","incomes-delete","web","2024-08-11 04:50:59","2024-08-11 04:50:59");
INSERT INTO permissions VALUES("131","packing_slip_challan","web","2024-08-11 04:51:00","2024-08-11 04:51:00");
INSERT INTO permissions VALUES("132","biller-report","web","2024-08-25 23:30:44","2024-08-25 23:30:44");



CREATE TABLE `pos_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `biller_id` int(11) NOT NULL,
  `product_number` int(11) NOT NULL,
  `keybord_active` tinyint(1) NOT NULL,
  `is_table` tinyint(1) NOT NULL DEFAULT 0,
  `send_sms` tinyint(1) NOT NULL DEFAULT 0,
  `stripe_public_key` varchar(191) DEFAULT NULL,
  `stripe_secret_key` varchar(191) DEFAULT NULL,
  `paypal_live_api_username` varchar(191) DEFAULT NULL,
  `paypal_live_api_password` varchar(191) DEFAULT NULL,
  `paypal_live_api_secret` varchar(191) DEFAULT NULL,
  `payment_options` text DEFAULT NULL,
  `invoice_option` varchar(10) DEFAULT NULL,
  `thermal_invoice_size` varchar(255) NOT NULL DEFAULT '80',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  UNIQUE KEY `pos_setting_id_unique` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO pos_setting VALUES("1","2","3","1","5","0","0","1","","","admin","admin","","cash,card,cheque,gift_card,deposit","thermal","80","2018-09-02 03:17:04","2025-02-21 14:01:06");



CREATE TABLE `product_adjustments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `adjustment_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `variant_id` int(11) DEFAULT NULL,
  `unit_cost` double DEFAULT NULL,
  `qty` double NOT NULL,
  `action` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=149 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO product_adjustments VALUES("1","1","11","","1500","100","+","2025-02-14 18:05:49","2025-02-14 18:05:49");
INSERT INTO product_adjustments VALUES("2","2","39","","1200","10","+","2025-02-14 18:10:21","2025-02-14 18:10:21");
INSERT INTO product_adjustments VALUES("3","3","35","","1500","10","+","2025-02-14 19:09:14","2025-02-14 19:09:14");
INSERT INTO product_adjustments VALUES("4","4","2","","1000","10","-","2025-02-14 19:12:13","2025-02-14 19:12:13");
INSERT INTO product_adjustments VALUES("5","5","2","","1000","11","+","2025-02-14 19:12:58","2025-02-14 19:12:58");
INSERT INTO product_adjustments VALUES("6","6","61","","0","10","+","2025-02-19 19:07:42","2025-02-19 19:07:42");
INSERT INTO product_adjustments VALUES("7","7","61","","0","10","+","2025-02-19 19:07:52","2025-02-19 19:07:52");
INSERT INTO product_adjustments VALUES("8","8","61","","0","10","+","2025-02-19 19:08:09","2025-02-19 19:08:09");
INSERT INTO product_adjustments VALUES("9","9","61","","0","45","+","2025-02-19 19:08:29","2025-02-19 19:08:29");
INSERT INTO product_adjustments VALUES("10","10","61","","0","2","+","2025-02-19 19:09:22","2025-02-19 19:09:22");
INSERT INTO product_adjustments VALUES("11","11","61","","0","10","+","2025-02-19 19:11:13","2025-02-19 19:11:13");
INSERT INTO product_adjustments VALUES("12","12","50","","40","14","+","2025-02-20 14:11:06","2025-02-20 14:11:06");
INSERT INTO product_adjustments VALUES("13","13","61","","0","11","+","2025-02-20 14:12:28","2025-02-20 14:12:28");
INSERT INTO product_adjustments VALUES("14","14","61","","0","11","+","2025-02-20 14:17:02","2025-02-20 14:17:02");
INSERT INTO product_adjustments VALUES("15","14","50","","40","12","+","2025-02-20 14:17:02","2025-02-20 14:17:02");
INSERT INTO product_adjustments VALUES("16","15","61","","0","12","+","2025-02-20 14:29:25","2025-02-20 14:29:25");
INSERT INTO product_adjustments VALUES("17","16","61","","0","11","+","2025-02-20 14:31:35","2025-02-20 14:31:35");
INSERT INTO product_adjustments VALUES("18","17","61","","0","21","+","2025-02-20 14:33:01","2025-02-20 14:33:01");
INSERT INTO product_adjustments VALUES("19","18","61","","0","20","+","2025-02-20 14:34:08","2025-03-01 21:32:44");
INSERT INTO product_adjustments VALUES("20","19","50","","40","11","+","2025-02-20 14:34:30","2025-02-20 14:34:30");
INSERT INTO product_adjustments VALUES("21","20","61","","0","11","+","2025-02-20 14:35:25","2025-02-20 14:35:25");
INSERT INTO product_adjustments VALUES("22","21","57","","50","12","+","2025-02-20 14:36:23","2025-02-20 14:36:23");
INSERT INTO product_adjustments VALUES("23","22","51","","30","13","+","2025-02-20 15:42:18","2025-02-20 15:42:18");
INSERT INTO product_adjustments VALUES("24","23","80","","0","20","+","2025-02-23 19:07:51","2025-02-23 19:07:51");
INSERT INTO product_adjustments VALUES("25","24","42","","0","20","+","2025-02-24 08:14:23","2025-02-24 08:14:23");
INSERT INTO product_adjustments VALUES("26","25","43","","0","10","+","2025-02-24 08:21:22","2025-02-24 08:21:22");
INSERT INTO product_adjustments VALUES("27","26","44","","0","20","+","2025-02-24 08:22:15","2025-02-24 08:22:15");
INSERT INTO product_adjustments VALUES("28","27","43","","0","20","+","2025-02-24 08:40:46","2025-02-24 08:40:46");
INSERT INTO product_adjustments VALUES("29","28","43","","0","20","+","2025-02-24 08:42:16","2025-02-24 08:42:16");
INSERT INTO product_adjustments VALUES("30","29","42","","0","15","+","2025-02-24 08:43:06","2025-02-24 08:43:06");
INSERT INTO product_adjustments VALUES("31","30","83","","0","20","+","2025-02-24 09:02:58","2025-02-24 09:02:58");
INSERT INTO product_adjustments VALUES("32","31","84","","0","20","+","2025-02-24 09:04:38","2025-03-01 22:49:19");
INSERT INTO product_adjustments VALUES("33","32","85","","0","20","+","2025-02-24 09:14:13","2025-02-24 09:14:13");
INSERT INTO product_adjustments VALUES("34","33","64","","0","20","+","2025-02-24 09:18:33","2025-02-24 09:18:33");
INSERT INTO product_adjustments VALUES("35","34","86","","0","20","+","2025-02-24 09:21:24","2025-02-24 09:21:24");
INSERT INTO product_adjustments VALUES("36","35","87","","0","20","+","2025-02-24 09:25:35","2025-02-24 09:25:35");
INSERT INTO product_adjustments VALUES("37","36","88","","0","20","+","2025-02-24 09:28:24","2025-02-24 09:28:24");
INSERT INTO product_adjustments VALUES("38","37","90","","0","20","+","2025-02-24 09:37:18","2025-02-24 09:37:18");
INSERT INTO product_adjustments VALUES("39","38","91","","0","20","+","2025-02-24 09:45:16","2025-02-24 09:45:16");
INSERT INTO product_adjustments VALUES("40","39","92","","0","20","+","2025-02-24 09:49:54","2025-02-24 09:49:54");
INSERT INTO product_adjustments VALUES("41","40","93","","0","20","+","2025-02-24 09:53:28","2025-02-24 09:53:28");
INSERT INTO product_adjustments VALUES("42","41","94","","0","20","+","2025-02-24 09:55:24","2025-02-24 09:55:24");
INSERT INTO product_adjustments VALUES("43","42","95","","0","20","+","2025-02-24 09:59:22","2025-02-24 09:59:22");
INSERT INTO product_adjustments VALUES("44","43","96","","0","20","+","2025-02-24 10:02:57","2025-02-24 10:02:57");
INSERT INTO product_adjustments VALUES("45","44","97","","0","20","+","2025-02-24 10:04:51","2025-02-24 10:04:51");
INSERT INTO product_adjustments VALUES("46","45","98","","0","20","+","2025-02-24 10:06:43","2025-02-24 10:06:43");
INSERT INTO product_adjustments VALUES("47","46","89","","0","20","+","2025-02-24 14:04:47","2025-02-24 14:04:47");
INSERT INTO product_adjustments VALUES("48","47","100","","0","20","+","2025-02-25 10:30:56","2025-02-25 10:30:56");
INSERT INTO product_adjustments VALUES("49","48","101","","0","20","+","2025-02-25 10:32:50","2025-02-25 10:32:50");
INSERT INTO product_adjustments VALUES("50","49","101","","0","20","+","2025-02-25 10:44:41","2025-02-25 10:44:41");
INSERT INTO product_adjustments VALUES("51","50","103","","0","20","+","2025-02-25 10:46:43","2025-02-25 10:46:43");
INSERT INTO product_adjustments VALUES("52","51","104","","0","20","+","2025-02-25 10:48:26","2025-02-25 10:48:26");
INSERT INTO product_adjustments VALUES("53","52","59","","0","20","+","2025-02-25 10:56:08","2025-02-25 10:56:08");
INSERT INTO product_adjustments VALUES("54","53","58","","0","20","+","2025-02-25 11:00:36","2025-02-25 11:00:36");
INSERT INTO product_adjustments VALUES("55","54","57","","0","20","+","2025-02-25 11:04:28","2025-02-25 11:04:28");
INSERT INTO product_adjustments VALUES("56","55","55","","0","20","+","2025-02-25 11:07:19","2025-02-25 11:07:19");
INSERT INTO product_adjustments VALUES("57","56","54","","0","20","+","2025-02-25 11:10:35","2025-02-25 11:10:35");
INSERT INTO product_adjustments VALUES("58","57","53","","0","20","+","2025-02-25 11:12:33","2025-02-25 11:12:33");
INSERT INTO product_adjustments VALUES("59","58","52","","0","20","+","2025-02-25 11:18:46","2025-02-25 11:18:46");
INSERT INTO product_adjustments VALUES("60","59","51","","0","20","+","2025-02-25 11:23:13","2025-02-25 11:23:13");
INSERT INTO product_adjustments VALUES("61","60","50","","0","20","+","2025-02-25 11:26:28","2025-02-25 11:26:28");
INSERT INTO product_adjustments VALUES("62","61","49","","0","20","+","2025-02-25 11:30:19","2025-02-25 11:30:19");
INSERT INTO product_adjustments VALUES("63","62","48","","0","20","+","2025-02-25 11:34:30","2025-02-25 11:34:30");
INSERT INTO product_adjustments VALUES("64","63","48","","0","20","+","2025-02-25 11:34:30","2025-02-25 11:34:30");
INSERT INTO product_adjustments VALUES("65","64","105","","0","20","+","2025-02-25 11:38:08","2025-02-25 11:38:08");
INSERT INTO product_adjustments VALUES("66","65","47","","0","20","+","2025-02-25 11:40:57","2025-02-25 11:40:57");
INSERT INTO product_adjustments VALUES("67","66","46","","0","20","+","2025-02-25 11:45:06","2025-02-25 11:45:06");
INSERT INTO product_adjustments VALUES("68","67","105","","0","50","+","2025-02-26 20:28:34","2025-02-26 20:28:34");
INSERT INTO product_adjustments VALUES("69","68","105","","0","10","+","2025-02-26 20:30:03","2025-02-26 20:30:03");
INSERT INTO product_adjustments VALUES("70","69","85","","0","10","+","2025-03-01 21:52:41","2025-03-01 22:40:49");
INSERT INTO product_adjustments VALUES("71","70","85","","0","100","+","2025-03-01 21:53:42","2025-03-01 22:43:28");
INSERT INTO product_adjustments VALUES("72","70","57","","0","1","-","2025-03-01 22:40:10","2025-03-01 22:43:28");
INSERT INTO product_adjustments VALUES("73","71","95","","0","20","-","2025-03-01 22:46:32","2025-03-01 22:49:49");
INSERT INTO product_adjustments VALUES("74","72","89","","0","20","+","2025-03-01 22:55:40","2025-03-01 22:55:40");
INSERT INTO product_adjustments VALUES("75","73","89","","0","19","-","2025-03-01 22:56:25","2025-03-01 22:56:25");
INSERT INTO product_adjustments VALUES("76","74","89","","0","70","+","2025-03-01 23:01:17","2025-03-01 23:01:17");
INSERT INTO product_adjustments VALUES("77","75","89","","0","1","-","2025-03-01 23:03:51","2025-03-01 23:03:51");
INSERT INTO product_adjustments VALUES("78","76","83","","0","100","+","2025-03-01 23:06:23","2025-03-01 23:06:23");
INSERT INTO product_adjustments VALUES("79","77","103","","0","80","+","2025-03-01 23:09:22","2025-03-01 23:09:22");
INSERT INTO product_adjustments VALUES("80","78","89","","0","1","+","2025-03-01 23:09:50","2025-03-01 23:09:50");
INSERT INTO product_adjustments VALUES("81","79","94","","0","80","+","2025-03-01 23:13:45","2025-03-01 23:13:45");
INSERT INTO product_adjustments VALUES("82","80","85","","0","30","-","2025-03-01 23:15:06","2025-03-01 23:15:06");
INSERT INTO product_adjustments VALUES("83","81","87","","0","80","+","2025-03-01 23:20:46","2025-03-01 23:20:46");
INSERT INTO product_adjustments VALUES("84","82","83","","0","100","+","2025-03-01 23:20:50","2025-03-01 23:20:50");
INSERT INTO product_adjustments VALUES("85","83","83","","0","100","+","2025-03-01 23:22:10","2025-03-01 23:22:10");
INSERT INTO product_adjustments VALUES("86","84","90","","0","80","+","2025-03-01 23:24:20","2025-03-01 23:24:20");
INSERT INTO product_adjustments VALUES("87","85","83","","0","100","+","2025-03-01 23:26:10","2025-03-01 23:26:10");
INSERT INTO product_adjustments VALUES("88","86","88","","0","80","+","2025-03-01 23:26:57","2025-03-01 23:26:57");
INSERT INTO product_adjustments VALUES("89","87","83","","0","306","-","2025-03-01 23:27:40","2025-03-01 23:27:40");
INSERT INTO product_adjustments VALUES("90","88","57","","0","119","+","2025-03-01 23:28:10","2025-03-01 23:28:10");
INSERT INTO product_adjustments VALUES("91","89","59","","0","81","+","2025-03-01 23:28:53","2025-03-01 23:28:53");
INSERT INTO product_adjustments VALUES("92","90","64","","0","70","+","2025-03-01 23:28:56","2025-03-01 23:28:56");
INSERT INTO product_adjustments VALUES("93","91","64","","0","10","+","2025-03-01 23:30:51","2025-03-01 23:30:51");
INSERT INTO product_adjustments VALUES("94","92","44","","10","80","+","2025-03-01 23:32:24","2025-03-01 23:32:24");
INSERT INTO product_adjustments VALUES("95","93","44","","10","100","-","2025-03-01 23:33:35","2025-03-01 23:33:35");
INSERT INTO product_adjustments VALUES("96","94","42","","0","65","+","2025-03-01 23:35:02","2025-03-01 23:35:02");
INSERT INTO product_adjustments VALUES("97","95","43","","0","50","+","2025-03-01 23:36:07","2025-03-01 23:36:07");
INSERT INTO product_adjustments VALUES("98","96","98","","0","82","+","2025-03-01 23:37:20","2025-03-01 23:37:20");
INSERT INTO product_adjustments VALUES("99","97","98","","0","82","+","2025-03-01 23:37:20","2025-03-01 23:37:20");
INSERT INTO product_adjustments VALUES("100","98","98","","0","82","-","2025-03-01 23:38:10","2025-03-01 23:38:10");
INSERT INTO product_adjustments VALUES("101","99","100","","0","80","+","2025-03-01 23:38:54","2025-03-01 23:38:54");
INSERT INTO product_adjustments VALUES("102","100","52","","0","83","+","2025-03-01 23:40:25","2025-03-01 23:40:25");
INSERT INTO product_adjustments VALUES("103","101","95","","0","99","+","2025-03-01 23:41:58","2025-03-01 23:41:58");
INSERT INTO product_adjustments VALUES("104","102","54","","0","81","+","2025-03-01 23:42:01","2025-03-01 23:42:01");
INSERT INTO product_adjustments VALUES("105","103","84","","0","80","+","2025-03-01 23:43:00","2025-03-01 23:43:00");
INSERT INTO product_adjustments VALUES("106","104","53","","0","92","+","2025-03-01 23:43:06","2025-03-01 23:43:06");
INSERT INTO product_adjustments VALUES("107","105","55","","0","83","+","2025-03-01 23:45:22","2025-03-01 23:45:22");
INSERT INTO product_adjustments VALUES("108","106","45","","30","100","+","2025-03-01 23:45:34","2025-03-01 23:45:34");
INSERT INTO product_adjustments VALUES("109","107","45","","30","2","+","2025-03-01 23:46:17","2025-03-01 23:46:17");
INSERT INTO product_adjustments VALUES("110","108","49","","0","81","+","2025-03-01 23:47:01","2025-03-01 23:47:01");
INSERT INTO product_adjustments VALUES("111","109","47","","0","84","+","2025-03-01 23:47:46","2025-03-01 23:47:46");
INSERT INTO product_adjustments VALUES("112","110","91","","0","100","+","2025-03-01 23:48:51","2025-03-01 23:48:51");
INSERT INTO product_adjustments VALUES("113","111","91","","0","20","-","2025-03-01 23:50:11","2025-03-01 23:50:11");
INSERT INTO product_adjustments VALUES("114","112","102","","0","100","+","2025-03-01 23:50:31","2025-03-01 23:50:31");
INSERT INTO product_adjustments VALUES("115","113","48","","0","61","+","2025-03-01 23:52:19","2025-03-01 23:52:19");
INSERT INTO product_adjustments VALUES("116","114","104","","0","80","+","2025-03-01 23:53:37","2025-03-01 23:53:37");
INSERT INTO product_adjustments VALUES("117","115","58","","0","82","+","2025-03-01 23:54:22","2025-03-01 23:54:22");
INSERT INTO product_adjustments VALUES("118","116","58","","0","82","+","2025-03-01 23:54:47","2025-03-01 23:54:47");
INSERT INTO product_adjustments VALUES("119","117","58","","0","82","-","2025-03-01 23:56:07","2025-03-01 23:56:07");
INSERT INTO product_adjustments VALUES("120","118","92","","0","82","+","2025-03-01 23:58:41","2025-03-01 23:58:41");
INSERT INTO product_adjustments VALUES("121","119","86","","0","80","+","2025-03-02 00:01:40","2025-03-02 00:01:40");
INSERT INTO product_adjustments VALUES("122","120","89","","0","1","-","2025-03-02 00:06:54","2025-03-02 00:06:54");
INSERT INTO product_adjustments VALUES("123","121","59","","0","1","-","2025-03-02 00:07:37","2025-03-02 00:07:37");
INSERT INTO product_adjustments VALUES("124","122","57","","0","50","-","2025-03-02 00:08:38","2025-03-02 00:08:38");
INSERT INTO product_adjustments VALUES("125","123","98","","0","2","-","2025-03-02 00:09:23","2025-03-02 00:09:23");
INSERT INTO product_adjustments VALUES("126","124","45","","30","1","-","2025-03-02 00:10:19","2025-03-02 00:10:19");
INSERT INTO product_adjustments VALUES("127","125","49","","0","1","-","2025-03-02 00:11:39","2025-03-02 00:11:39");
INSERT INTO product_adjustments VALUES("128","126","83","","0","14","-","2025-03-02 00:16:48","2025-03-02 00:16:48");
INSERT INTO product_adjustments VALUES("129","127","92","","0","2","-","2025-03-02 00:17:25","2025-03-02 00:17:25");
INSERT INTO product_adjustments VALUES("130","128","53","","0","12","-","2025-03-02 00:18:17","2025-03-02 00:18:17");
INSERT INTO product_adjustments VALUES("131","129","54","","0","1","-","2025-03-02 00:19:02","2025-03-02 00:19:02");
INSERT INTO product_adjustments VALUES("132","130","52","","0","2","-","2025-03-02 00:19:39","2025-03-02 00:19:39");
INSERT INTO product_adjustments VALUES("133","131","52","","0","1","-","2025-03-02 00:20:18","2025-03-02 00:20:18");
INSERT INTO product_adjustments VALUES("134","132","55","","0","3","-","2025-03-02 00:20:51","2025-03-02 00:20:51");
INSERT INTO product_adjustments VALUES("135","133","47","","0","4","-","2025-03-02 00:22:17","2025-03-02 00:22:17");
INSERT INTO product_adjustments VALUES("136","134","58","","0","2","-","2025-03-02 00:22:51","2025-03-02 00:22:51");
INSERT INTO product_adjustments VALUES("137","135","48","","0","2","-","2025-03-02 00:23:32","2025-03-02 00:23:32");
INSERT INTO product_adjustments VALUES("138","136","48","","0","1","+","2025-03-02 00:31:57","2025-03-02 00:31:57");
INSERT INTO product_adjustments VALUES("139","137","155","","0","100","+","2025-03-04 20:20:36","2025-03-04 20:20:36");
INSERT INTO product_adjustments VALUES("140","138","158","","0","10","+","2025-03-04 20:58:22","2025-03-04 20:58:22");
INSERT INTO product_adjustments VALUES("141","139","159","","0","100","+","2025-03-04 21:02:01","2025-03-04 21:02:01");
INSERT INTO product_adjustments VALUES("142","140","164","","0","20","+","2025-03-05 08:23:34","2025-03-05 08:23:34");
INSERT INTO product_adjustments VALUES("143","141","165","","0","100","+","2025-03-05 08:27:45","2025-03-05 08:27:45");
INSERT INTO product_adjustments VALUES("144","142","166","","0","10","+","2025-03-05 08:29:57","2025-03-05 08:29:57");
INSERT INTO product_adjustments VALUES("145","143","167","","0","100","+","2025-03-05 08:31:56","2025-03-05 08:31:56");
INSERT INTO product_adjustments VALUES("146","144","168","","0","100","+","2025-03-05 08:37:21","2025-03-05 08:37:21");
INSERT INTO product_adjustments VALUES("147","145","163","","0","100","+","2025-03-05 08:38:28","2025-03-05 08:38:28");
INSERT INTO product_adjustments VALUES("148","146","169","","0","100","+","2025-03-05 08:40:53","2025-03-05 08:40:53");



CREATE TABLE `product_batches` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `batch_no` varchar(191) NOT NULL,
  `expired_date` date NOT NULL,
  `qty` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `product_productions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `production_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` double NOT NULL,
  `recieved` double NOT NULL,
  `purchase_unit_id` int(11) NOT NULL,
  `net_unit_cost` double NOT NULL,
  `tax_rate` double NOT NULL,
  `tax` double NOT NULL,
  `total` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `product_purchases` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `purchase_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_batch_id` int(11) DEFAULT NULL,
  `variant_id` int(11) DEFAULT NULL,
  `imei_number` text DEFAULT NULL,
  `qty` double NOT NULL,
  `recieved` double NOT NULL,
  `return_qty` double NOT NULL DEFAULT 0,
  `purchase_unit_id` int(11) NOT NULL,
  `net_unit_cost` double NOT NULL,
  `discount` double NOT NULL,
  `tax_rate` double NOT NULL,
  `tax` double NOT NULL,
  `total` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO product_purchases VALUES("1","1","23","","","","10","10","0","1","439","0","0","0","4390","2024-01-19 13:46:04","2024-01-19 13:46:04");
INSERT INTO product_purchases VALUES("2","1","27","","","","10","10","0","1","0.89","0","0","0","8.9","2024-01-19 13:46:04","2024-01-19 13:46:04");
INSERT INTO product_purchases VALUES("3","1","20","","","","10","10","0","1","399","0","0","0","3990","2024-01-19 13:46:04","2024-01-19 13:46:04");
INSERT INTO product_purchases VALUES("4","1","17","","","","10","10","0","1","349","0","0","0","3490","2024-01-19 13:46:04","2024-01-19 13:46:04");
INSERT INTO product_purchases VALUES("5","1","16","","","","10","10","0","1","79","0","0","0","790","2024-01-19 13:46:04","2024-01-19 13:46:04");
INSERT INTO product_purchases VALUES("6","1","30","","","","10","10","0","1","100","0","10","100","1100","2024-01-19 13:46:04","2024-01-19 13:46:04");
INSERT INTO product_purchases VALUES("7","1","19","","","","10","10","0","1","817.27","0","10","817.27","8990","2024-01-19 13:46:04","2024-01-19 13:46:04");
INSERT INTO product_purchases VALUES("8","1","3","","","","10","10","0","1","272.73","0","10","272.73","3000","2024-01-19 13:46:05","2024-01-19 13:46:05");
INSERT INTO product_purchases VALUES("9","1","7","","","","10","10","0","1","818.17","0","10","818.17","8999.9","2024-01-19 13:46:05","2024-01-19 13:46:05");
INSERT INTO product_purchases VALUES("10","1","2","","","","10","10","0","1","909.09","0","10","909.09","10000","2024-01-19 13:46:05","2024-01-19 13:46:05");
INSERT INTO product_purchases VALUES("11","2","6","","","","10","10","0","1","999.99","0","0","0","9999.9","2024-01-19 13:50:04","2024-01-19 13:50:04");
INSERT INTO product_purchases VALUES("12","2","13","","","","10","10","0","1","227.27","0","10","227.27","2500","2024-01-19 13:50:04","2024-01-19 13:50:04");
INSERT INTO product_purchases VALUES("13","2","10","","","","10","10","0","1","990","0","0","0","9900","2024-01-19 13:50:04","2024-01-19 13:50:04");
INSERT INTO product_purchases VALUES("14","2","21","","","","10","10","0","1","369","0","0","0","3690","2024-01-19 13:50:04","2024-01-19 13:50:04");
INSERT INTO product_purchases VALUES("15","2","8","","","","10","10","0","1","1090","0","10","1090","11990","2024-01-19 13:50:04","2024-01-19 13:50:04");
INSERT INTO product_purchases VALUES("16","2","12","","","","10","10","0","1","908.18","0","10","908.18","9990","2024-01-19 13:50:04","2024-01-19 13:50:04");
INSERT INTO product_purchases VALUES("17","2","29","","","","10","10","0","1","2.39","0","0","0","23.9","2024-01-19 13:50:04","2024-01-19 13:50:04");
INSERT INTO product_purchases VALUES("18","2","26","","","","10","10","0","4","2.99","0","0","0","29.9","2024-01-19 13:50:04","2024-01-19 13:50:04");
INSERT INTO product_purchases VALUES("19","2","9","","","","10","10","0","1","399","0","0","0","3990","2024-01-19 13:50:04","2024-01-19 13:50:04");
INSERT INTO product_purchases VALUES("20","2","11","","","","10","10","0","1","1363.64","0","10","1363.64","15000","2024-01-19 13:50:04","2024-01-19 13:50:04");
INSERT INTO product_purchases VALUES("21","3","1","","","","10","10","0","1","999.99","0","10","999.99","10999.9","2024-01-19 13:53:21","2024-01-19 13:53:21");
INSERT INTO product_purchases VALUES("22","3","18","","","","10","10","0","1","417.27","0","10","417.27","4590","2024-01-19 13:53:21","2024-01-19 13:53:21");
INSERT INTO product_purchases VALUES("23","3","25","","","","10","10","0","1","130","0","0","0","1300","2024-01-19 13:53:21","2024-01-19 13:53:21");
INSERT INTO product_purchases VALUES("24","3","28","","","","10","10","0","1","2.39","0","0","0","23.9","2024-01-19 13:53:21","2024-01-19 13:53:21");
INSERT INTO product_purchases VALUES("25","3","14","","","","10","10","0","1","318.18","0","10","318.18","3500","2024-01-19 13:53:21","2024-01-19 13:53:21");
INSERT INTO product_purchases VALUES("26","3","24","","","","10","10","0","1","271.82","0","10","271.82","2990","2024-01-19 13:53:21","2024-01-19 13:53:21");
INSERT INTO product_purchases VALUES("27","3","4","","","","10","10","0","1","818.18","0","10","818.18","9000","2024-01-19 13:53:21","2024-01-19 13:53:21");
INSERT INTO product_purchases VALUES("28","3","5","","","","10","10","0","1","864.54","0","10","864.54","9509.9","2024-01-19 13:53:21","2024-01-19 13:53:21");
INSERT INTO product_purchases VALUES("29","3","22","","","","10","10","0","1","275","0","0","0","2750","2024-01-19 13:53:21","2024-01-19 13:53:21");
INSERT INTO product_purchases VALUES("30","3","15","","","","10","10","0","1","499","0","0","0","4990","2024-01-19 13:53:21","2024-01-19 13:53:21");
INSERT INTO product_purchases VALUES("31","4","1","","","","11","11","0","1","999.99","0","10","1099.99","12099.89","2024-01-19 14:26:48","2024-01-19 14:26:48");
INSERT INTO product_purchases VALUES("32","4","18","","","","10","10","0","1","417.27","0","10","417.27","4590","2024-01-19 14:26:48","2024-01-19 14:26:48");
INSERT INTO product_purchases VALUES("33","4","25","","","","10","10","0","1","130","0","0","0","1300","2024-01-19 14:26:48","2024-01-19 14:26:48");
INSERT INTO product_purchases VALUES("34","4","28","","","","10","10","0","1","2.39","0","0","0","23.9","2024-01-19 14:26:48","2024-01-19 14:26:48");
INSERT INTO product_purchases VALUES("35","4","14","","","","10","10","0","1","318.18","0","10","318.18","3500","2024-01-19 14:26:49","2024-01-19 14:26:49");
INSERT INTO product_purchases VALUES("36","4","24","","","","10","10","0","1","271.82","0","10","271.82","2990","2024-01-19 14:26:49","2024-01-19 14:26:49");
INSERT INTO product_purchases VALUES("37","4","4","","","","10","10","0","1","818.18","0","10","818.18","9000","2024-01-19 14:26:49","2024-01-19 14:26:49");
INSERT INTO product_purchases VALUES("38","4","5","","","","10","10","0","1","864.54","0","10","864.54","9509.9","2024-01-19 14:26:49","2024-01-19 14:26:49");
INSERT INTO product_purchases VALUES("39","4","22","","","","10","10","0","1","275","0","0","0","2750","2024-01-19 14:26:49","2024-01-19 14:26:49");
INSERT INTO product_purchases VALUES("40","4","15","","","","10","10","0","1","499","0","0","0","4990","2024-01-19 14:26:49","2024-01-19 14:26:49");
INSERT INTO product_purchases VALUES("41","5","23","","","","10","10","0","1","439","0","0","0","4390","2024-01-19 14:28:26","2024-01-19 14:28:26");
INSERT INTO product_purchases VALUES("42","5","27","","","","10","10","0","1","0.89","0","0","0","8.9","2024-01-19 14:28:26","2024-01-19 14:28:26");
INSERT INTO product_purchases VALUES("43","5","20","","","","10","10","0","1","399","0","0","0","3990","2024-01-19 14:28:26","2024-01-19 14:28:26");
INSERT INTO product_purchases VALUES("44","5","17","","","","10","10","0","1","349","0","0","0","3490","2024-01-19 14:28:26","2024-01-19 14:28:26");
INSERT INTO product_purchases VALUES("45","5","16","","","","10","10","0","1","79","0","0","0","790","2024-01-19 14:28:26","2024-01-19 14:28:26");
INSERT INTO product_purchases VALUES("46","5","30","","","","10","10","0","1","100","0","10","100","1100","2024-01-19 14:28:26","2024-01-19 14:28:26");
INSERT INTO product_purchases VALUES("47","5","19","","","","10","10","0","1","817.27","0","10","817.27","8990","2024-01-19 14:28:26","2024-01-19 14:28:26");
INSERT INTO product_purchases VALUES("48","5","3","","","","10","10","0","1","272.73","0","10","272.73","3000","2024-01-19 14:28:26","2024-01-19 14:28:26");
INSERT INTO product_purchases VALUES("49","5","7","","","","10","10","0","1","818.17","0","10","818.17","8999.9","2024-01-19 14:28:26","2024-01-19 14:28:26");
INSERT INTO product_purchases VALUES("50","5","2","","","","10","10","0","1","909.09","0","10","909.09","10000","2024-01-19 14:28:26","2024-01-19 14:28:26");
INSERT INTO product_purchases VALUES("51","6","6","","","","10","10","0","1","999.99","0","0","0","9999.9","2024-01-19 14:28:35","2024-01-19 14:28:35");
INSERT INTO product_purchases VALUES("52","6","13","","","","10","10","0","1","227.27","0","10","227.27","2500","2024-01-19 14:28:35","2024-01-19 14:28:35");
INSERT INTO product_purchases VALUES("53","6","10","","","","10","10","0","1","990","0","0","0","9900","2024-01-19 14:28:35","2024-01-19 14:28:35");
INSERT INTO product_purchases VALUES("54","6","21","","","","10","10","0","1","369","0","0","0","3690","2024-01-19 14:28:35","2024-01-19 14:28:35");
INSERT INTO product_purchases VALUES("55","6","8","","","","10","10","0","1","1090","0","10","1090","11990","2024-01-19 14:28:35","2024-01-19 14:28:35");
INSERT INTO product_purchases VALUES("56","6","12","","","","10","10","0","1","908.18","0","10","908.18","9990","2024-01-19 14:28:35","2024-01-19 14:28:35");
INSERT INTO product_purchases VALUES("57","6","29","","","","10","10","0","1","2.39","0","0","0","23.9","2024-01-19 14:28:35","2024-01-19 14:28:35");
INSERT INTO product_purchases VALUES("58","6","26","","","","10","10","0","4","2.99","0","0","0","29.9","2024-01-19 14:28:35","2024-01-19 14:28:35");
INSERT INTO product_purchases VALUES("59","6","9","","","","10","10","0","1","399","0","0","0","3990","2024-01-19 14:28:35","2024-01-19 14:28:35");
INSERT INTO product_purchases VALUES("60","6","11","","","","10","10","0","1","1363.64","0","10","1363.64","15000","2024-01-19 14:28:35","2024-01-19 14:28:35");
INSERT INTO product_purchases VALUES("61","7","17","","","","1","1","0","1","349","0","0","0","349","2024-01-19 14:52:02","2024-01-19 14:52:02");
INSERT INTO product_purchases VALUES("62","7","20","","","","1","1","0","1","399","0","0","0","399","2024-01-19 14:52:02","2024-01-19 14:52:02");
INSERT INTO product_purchases VALUES("64","8","7","","","","6","6","0","1","800","0","10","480","5280","2024-06-20 05:08:26","2024-06-20 05:08:26");
INSERT INTO product_purchases VALUES("65","9","33","","","1001,1002,1003,1004,1005","5","5","0","1","100","0","0","0","500","2024-07-18 07:41:45","2024-07-18 07:41:45");
INSERT INTO product_purchases VALUES("67","10","33","","","2001,2002,2003,2004,2005","5","5","0","1","100","0","0","0","500","2024-07-18 07:51:35","2024-07-18 07:51:35");
INSERT INTO product_purchases VALUES("68","11","1","","","","1","1","0","1","999.99","0","10","100","1099.99","2025-02-14 12:10:45","2025-02-14 12:10:45");
INSERT INTO product_purchases VALUES("69","12","1","","","","100","0","0","1","999.99","0","10","9999.91","109999","2025-02-17 19:49:32","2025-02-17 19:49:32");
INSERT INTO product_purchases VALUES("70","13","5","","","","100","0","0","1","864.54","0","10","8645.36","95099","2025-02-18 17:20:30","2025-02-18 17:20:30");
INSERT INTO product_purchases VALUES("72","15","89","","","","10","10","0","17","1000","0","0","0","10000","2025-02-24 15:09:05","2025-02-24 15:09:05");
INSERT INTO product_purchases VALUES("73","16","99","","","","50","50","0","4","1000","0","0","0","50000","2025-02-24 15:23:46","2025-02-24 15:23:46");
INSERT INTO product_purchases VALUES("74","17","99","","","","5","5","0","4","1000","0","0","0","5000","2025-02-24 15:32:49","2025-02-24 15:32:49");
INSERT INTO product_purchases VALUES("78","21","44","","","","100","100","0","6","10","0","0","0","1000","2025-02-26 18:02:09","2025-02-26 18:02:09");



CREATE TABLE `product_quotation` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `quotation_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_batch_id` int(11) DEFAULT NULL,
  `variant_id` int(11) DEFAULT NULL,
  `qty` double NOT NULL,
  `sale_unit_id` int(11) NOT NULL,
  `net_unit_price` double NOT NULL,
  `discount` double NOT NULL,
  `tax_rate` double NOT NULL,
  `tax` double NOT NULL,
  `total` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO product_quotation VALUES("1","1","17","","","1","1","499","0","0","0","499","2024-01-19 14:51:32","2024-01-19 14:51:32");
INSERT INTO product_quotation VALUES("2","1","20","","","1","1","499","0","0","0","499","2024-01-19 14:51:32","2024-01-19 14:51:32");
INSERT INTO product_quotation VALUES("4","3","27","","","100","1","1.29","0","0","0","129","2025-02-18 16:41:17","2025-02-27 11:44:10");
INSERT INTO product_quotation VALUES("5","3","35","","","10","1","130","0","0","0","1300","2025-02-18 16:41:17","2025-02-27 11:44:10");
INSERT INTO product_quotation VALUES("6","4","83","","","1","6","20","0","0","0","20","2025-02-26 19:13:49","2025-02-27 11:47:19");
INSERT INTO product_quotation VALUES("7","4","53","","","1","10","130","0","0","0","130","2025-02-26 19:13:49","2025-02-27 11:47:19");
INSERT INTO product_quotation VALUES("8","5","57","","","10","8","70","0","0","0","700","2025-02-27 10:49:54","2025-02-27 11:03:12");



CREATE TABLE `product_returns` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `return_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_batch_id` int(11) DEFAULT NULL,
  `variant_id` int(11) DEFAULT NULL,
  `imei_number` text DEFAULT NULL,
  `qty` double NOT NULL,
  `sale_unit_id` int(11) NOT NULL,
  `net_unit_price` double NOT NULL,
  `discount` double NOT NULL,
  `tax_rate` double NOT NULL,
  `tax` double NOT NULL,
  `total` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO product_returns VALUES("1","1","1","","","","1","1","1181.81","0","10","118.18","1299.99","2024-03-24 07:08:23","2024-03-24 07:08:23");
INSERT INTO product_returns VALUES("2","2","5","","","","1","1","1046.35","0","10","104.64","1150.99","2024-04-29 12:30:38","2024-04-29 12:30:38");
INSERT INTO product_returns VALUES("3","2","3","","","","1","1","318.18","0","10","31.82","350","2024-04-29 12:30:38","2024-04-29 12:30:38");
INSERT INTO product_returns VALUES("4","3","1","","","","1","1","1181.81","0","10","118.18","1299.99","2024-06-26 07:01:42","2024-06-26 07:01:42");
INSERT INTO product_returns VALUES("5","4","1","","","","1","1","1205.45","0","10","120.54","1325.99","2025-02-18 17:34:00","2025-02-18 17:34:00");



CREATE TABLE `product_sales` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sale_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_batch_id` int(11) DEFAULT NULL,
  `variant_id` int(11) DEFAULT NULL,
  `imei_number` text DEFAULT NULL,
  `qty` double NOT NULL,
  `return_qty` double NOT NULL DEFAULT 0,
  `sale_unit_id` int(11) NOT NULL,
  `net_unit_price` double NOT NULL,
  `discount` double NOT NULL,
  `tax_rate` double NOT NULL,
  `tax` double NOT NULL,
  `total` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_delivered` tinyint(1) DEFAULT NULL,
  `is_packing` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=436 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO product_sales VALUES("189","156","45","","","null","1","0","6","50","0","0","0","50","2025-02-20 14:49:30","2025-02-20 14:49:30","","");
INSERT INTO product_sales VALUES("395","320","55","","","null","2","0","7","60","0","0","0","120","2025-03-02 16:05:38","2025-03-02 16:05:38","","");
INSERT INTO product_sales VALUES("396","321","55","","","null","1","0","7","60","0","0","0","60","2025-03-02 16:09:43","2025-03-02 16:09:43","","");
INSERT INTO product_sales VALUES("397","321","92","","","null,null","3","0","17","30","0","0","0","90","2025-03-02 16:09:43","2025-03-02 16:09:43","","");
INSERT INTO product_sales VALUES("398","321","100","","","null","3","0","1","170","0","0","0","510","2025-03-02 16:09:43","2025-03-02 16:09:43","","");
INSERT INTO product_sales VALUES("399","322","64","","","null","1","0","1","30","0","0","0","30","2025-03-02 18:01:40","2025-03-02 18:01:40","","");
INSERT INTO product_sales VALUES("400","323","88","","","null","1","0","17","40","0","0","0","40","2025-03-04 08:21:57","2025-03-04 08:21:57","","");
INSERT INTO product_sales VALUES("401","324","94","","","null","1","0","17","20","0","0","0","20","2025-03-04 08:23:00","2025-03-04 08:23:00","","");
INSERT INTO product_sales VALUES("402","325","42","","","null","1","0","6","10","0","0","0","10","2025-03-13 16:08:14","2025-03-13 16:08:14","","");
INSERT INTO product_sales VALUES("403","326","43","","","null","1","0","6","10","0","0","0","10","2025-03-13 16:08:59","2025-03-13 16:08:59","","");
INSERT INTO product_sales VALUES("404","327","47","","","null","1","0","9","40","0","0","0","40","2025-03-13 17:24:21","2025-03-13 17:24:21","","");
INSERT INTO product_sales VALUES("405","328","42","","","null","1","0","6","10","0","0","0","10","2025-03-13 20:16:01","2025-03-13 20:16:01","","");
INSERT INTO product_sales VALUES("406","329","42","","","null","1","0","6","10","0","0","0","10","2025-03-13 20:25:26","2025-03-13 20:25:26","","");
INSERT INTO product_sales VALUES("407","330","42","","","null","1","0","6","10","0","0","0","10","2025-03-13 20:26:26","2025-03-13 20:26:26","","");
INSERT INTO product_sales VALUES("408","331","42","","","null","1","0","6","10","0","0","0","10","2025-03-14 11:34:43","2025-03-14 11:34:43","","");
INSERT INTO product_sales VALUES("409","332","42","","","null","1","0","6","10","0","0","0","10","2025-03-14 11:41:34","2025-03-14 11:41:34","","");
INSERT INTO product_sales VALUES("410","333","43","","","null","1","0","6","10","0","0","0","10","2025-03-14 11:44:02","2025-03-14 11:44:02","","");
INSERT INTO product_sales VALUES("411","334","42","","","null","2","0","6","10","0","0","0","20","2025-03-14 11:45:23","2025-03-14 12:01:54","","");
INSERT INTO product_sales VALUES("413","336","42","","","null","1","0","6","10","0","0","0","10","2025-03-15 15:16:32","2025-03-15 15:16:32","","");
INSERT INTO product_sales VALUES("414","337","43","","","null","1","0","6","10","0","0","0","10","2025-03-15 15:16:41","2025-03-15 15:16:41","","");
INSERT INTO product_sales VALUES("415","338","49","","","null","1","0","13","80","0","0","0","80","2025-03-15 15:18:40","2025-03-15 15:18:40","","");
INSERT INTO product_sales VALUES("416","339","49","","","null","1","0","13","80","0","0","0","80","2025-03-15 15:19:06","2025-03-15 15:19:06","","");
INSERT INTO product_sales VALUES("417","340","42","","","null","1","0","6","10","0","0","0","10","2025-03-15 15:19:36","2025-03-15 15:19:36","","");
INSERT INTO product_sales VALUES("418","341","42","","","null","1","0","6","10","0","0","0","10","2025-03-15 15:20:31","2025-03-15 15:20:31","","");
INSERT INTO product_sales VALUES("419","342","55","","","null","1","0","7","60","0","0","0","60","2025-03-14 15:24:52","2025-03-14 15:24:52","","");
INSERT INTO product_sales VALUES("420","343","44","","","null","1","0","6","30","0","0","0","30","2025-03-15 15:55:56","2025-03-15 15:55:56","","");
INSERT INTO product_sales VALUES("421","344","49","","","null","1","0","13","80","0","0","0","80","2025-03-15 17:48:18","2025-03-15 17:48:18","","");
INSERT INTO product_sales VALUES("422","345","49","","","null","1","0","13","66.67","0","20","13.33","80","2025-03-15 19:10:24","2025-03-15 19:10:24","","");
INSERT INTO product_sales VALUES("423","346","49","","","null","1","0","13","66.67","0","20","13.33","80","2025-03-15 19:14:51","2025-03-15 19:14:51","","");
INSERT INTO product_sales VALUES("424","347","42","","","null","1","0","6","10","0","0","0","10","2025-03-15 19:32:30","2025-03-15 19:32:30","","");
INSERT INTO product_sales VALUES("425","348","49","","","null","1","0","13","66.67","0","20","13.33","80","2025-03-15 19:32:52","2025-03-15 19:32:52","","");
INSERT INTO product_sales VALUES("426","349","49","","","null","1","0","13","66.67","0","20","13.33","80","2025-03-15 19:33:28","2025-03-15 19:33:28","","");
INSERT INTO product_sales VALUES("427","350","49","","","null","1","0","13","66.67","0","20","13.33","80","2025-03-15 21:23:43","2025-03-15 21:23:43","","");
INSERT INTO product_sales VALUES("428","351","43","","","null,null","2","0","6","10","0","35.4","7.08","27.08","2025-03-18 13:15:30","2025-03-18 13:15:30","","");
INSERT INTO product_sales VALUES("429","352","49","","","null","1","0","13","80","0","0","0","80","2025-03-18 13:18:40","2025-03-18 13:18:40","","");
INSERT INTO product_sales VALUES("430","353","43","","","null","1","0","6","10","0","0","0","10","2025-03-18 13:19:13","2025-03-18 13:19:13","","");
INSERT INTO product_sales VALUES("431","354","49","","","null","1","0","13","59.08","0","35.4","20.92","80","2025-03-19 20:41:20","2025-03-19 20:41:20","","");
INSERT INTO product_sales VALUES("432","355","49","","","null","1","0","13","59.08","0","35.4","20.92","80","2025-03-19 21:01:18","2025-03-19 21:01:18","","");
INSERT INTO product_sales VALUES("433","356","49","","","null","1","0","13","59.08","0","35.4","20.92","80","2025-03-20 15:29:40","2025-03-20 15:29:40","","");
INSERT INTO product_sales VALUES("434","357","92","","","null","1","0","17","30","0","0","0","30","2025-03-26 19:31:22","2025-03-26 19:31:22","","");
INSERT INTO product_sales VALUES("435","357","89","","","null","1","0","17","30","0","0","0","30","2025-03-26 19:31:22","2025-03-26 19:31:22","","");



CREATE TABLE `product_transfer` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `transfer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_batch_id` int(11) DEFAULT NULL,
  `variant_id` int(11) DEFAULT NULL,
  `imei_number` text DEFAULT NULL,
  `qty` double NOT NULL,
  `purchase_unit_id` int(11) NOT NULL,
  `net_unit_cost` double NOT NULL,
  `tax_rate` double NOT NULL,
  `tax` double NOT NULL,
  `total` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `product_variants` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `variant_id` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  `item_code` varchar(191) NOT NULL,
  `additional_cost` double DEFAULT NULL,
  `additional_price` double DEFAULT NULL,
  `qty` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=354 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO product_variants VALUES("342","50","1","1","S/Red-52840330","","","0","2025-03-04 20:59:24","2025-03-04 20:59:24");
INSERT INTO product_variants VALUES("343","50","2","2","S/Green-52840330","","","0","2025-03-04 20:59:24","2025-03-04 20:59:24");
INSERT INTO product_variants VALUES("344","50","3","3","M/Red-52840330","","","0","2025-03-04 20:59:24","2025-03-04 20:59:24");
INSERT INTO product_variants VALUES("345","50","4","4","M/Green-52840330","","","0","2025-03-04 20:59:24","2025-03-04 20:59:24");
INSERT INTO product_variants VALUES("346","50","5","5","L/Red-52840330","","","0","2025-03-04 20:59:24","2025-03-04 20:59:24");
INSERT INTO product_variants VALUES("347","50","6","6","L/Green-52840330","","","0","2025-03-04 20:59:24","2025-03-04 20:59:24");
INSERT INTO product_variants VALUES("348","96","1","1","S/Red-","","","0","2025-03-05 08:19:08","2025-03-05 08:19:08");
INSERT INTO product_variants VALUES("349","96","2","2","S/Green-","","","0","2025-03-05 08:19:08","2025-03-05 08:19:08");
INSERT INTO product_variants VALUES("350","96","3","3","M/Red-","","","0","2025-03-05 08:19:08","2025-03-05 08:19:08");
INSERT INTO product_variants VALUES("351","96","4","4","M/Green-","","","0","2025-03-05 08:19:08","2025-03-05 08:19:08");
INSERT INTO product_variants VALUES("352","96","5","5","L/Red-","","","0","2025-03-05 08:19:08","2025-03-05 08:19:08");
INSERT INTO product_variants VALUES("353","96","6","6","L/Green-","","","0","2025-03-05 08:19:08","2025-03-05 08:19:08");



CREATE TABLE `product_warehouse` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` varchar(191) NOT NULL,
  `product_batch_id` int(11) DEFAULT NULL,
  `variant_id` int(11) DEFAULT NULL,
  `imei_number` text DEFAULT NULL,
  `warehouse_id` int(11) NOT NULL,
  `qty` double NOT NULL,
  `price` double DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=152 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO product_warehouse VALUES("1","23","","","","1","7","577","2024-01-19 13:46:04","2025-02-19 15:57:27");
INSERT INTO product_warehouse VALUES("2","27","","","","1","10","1.29","2024-01-19 13:46:04","2024-07-11 06:12:35");
INSERT INTO product_warehouse VALUES("3","20","","","","1","-3","499","2024-01-19 13:46:04","2025-02-19 15:57:27");
INSERT INTO product_warehouse VALUES("4","17","","","","1","10","499","2024-01-19 13:46:04","2024-04-28 06:05:43");
INSERT INTO product_warehouse VALUES("5","16","","","","1","8","109","2024-01-19 13:46:04","2025-02-17 19:31:40");
INSERT INTO product_warehouse VALUES("6","30","","","","1","10","200","2024-01-19 13:46:04","2025-02-19 15:57:27");
INSERT INTO product_warehouse VALUES("7","19","","","","1","9","1059","2024-01-19 13:46:04","2024-05-28 08:46:50");
INSERT INTO product_warehouse VALUES("8","3","","","","1","3","350","2024-01-19 13:46:05","2025-02-18 16:57:23");
INSERT INTO product_warehouse VALUES("9","7","","","","1","2","","2024-01-19 13:46:05","2025-02-18 18:54:55");
INSERT INTO product_warehouse VALUES("10","2","","","","1","-1","","2024-01-19 13:46:05","2025-02-18 16:01:57");
INSERT INTO product_warehouse VALUES("11","6","","","","1","0","1111.99","2024-01-19 13:50:04","2025-02-18 16:52:52");
INSERT INTO product_warehouse VALUES("12","13","","","","1","10","349","2024-01-19 13:50:04","2024-01-19 13:50:04");
INSERT INTO product_warehouse VALUES("13","10","","","","1","1","1250","2024-01-19 13:50:04","2025-02-18 19:05:31");
INSERT INTO product_warehouse VALUES("14","21","","","","1","10","599","2024-01-19 13:50:04","2024-01-19 13:50:04");
INSERT INTO product_warehouse VALUES("15","8","","","","1","8","1300","2024-01-19 13:50:04","2024-05-19 08:30:55");
INSERT INTO product_warehouse VALUES("16","12","","","","1","8","1250","2024-01-19 13:50:04","2025-02-15 23:38:29");
INSERT INTO product_warehouse VALUES("17","29","","","","1","0","3.19","2024-01-19 13:50:04","2024-11-26 16:36:03");
INSERT INTO product_warehouse VALUES("18","26","","","","1","10","3.99","2024-01-19 13:50:04","2024-01-19 13:50:04");
INSERT INTO product_warehouse VALUES("19","9","","","","1","-1","559","2024-01-19 13:50:04","2025-02-18 16:51:40");
INSERT INTO product_warehouse VALUES("20","11","","","","1","108","1750","2024-01-19 13:50:04","2025-02-18 17:27:43");
INSERT INTO product_warehouse VALUES("21","1","","","","1","-4","1299.99","2024-01-19 13:53:21","2025-02-18 17:06:01");
INSERT INTO product_warehouse VALUES("22","18","","","","1","10","599","2024-01-19 13:53:21","2024-01-19 13:53:21");
INSERT INTO product_warehouse VALUES("23","25","","","null","1","10","157.99","2024-01-19 13:53:21","2025-02-19 15:57:27");
INSERT INTO product_warehouse VALUES("24","28","","","","1","10","3.3","2024-01-19 13:53:21","2024-01-19 13:53:21");
INSERT INTO product_warehouse VALUES("25","14","","","","1","9","499","2024-01-19 13:53:21","2024-01-19 14:40:16");
INSERT INTO product_warehouse VALUES("26","24","","","","1","10","379","2024-01-19 13:53:21","2024-01-19 13:53:21");
INSERT INTO product_warehouse VALUES("27","4","","","","1","4","1050","2024-01-19 13:53:21","2025-02-18 10:06:46");
INSERT INTO product_warehouse VALUES("28","5","","","","1","-5","1150.99","2024-01-19 13:53:21","2025-02-18 17:03:06");
INSERT INTO product_warehouse VALUES("29","22","","","","1","10","399","2024-01-19 13:53:21","2024-01-19 13:53:21");
INSERT INTO product_warehouse VALUES("30","15","","","","1","10","547","2024-01-19 13:53:21","2024-01-19 13:53:21");
INSERT INTO product_warehouse VALUES("31","1","","","","2","8","1299.99","2024-01-19 14:26:48","2025-02-18 17:34:00");
INSERT INTO product_warehouse VALUES("32","18","","","","2","7","599","2024-01-19 14:26:48","2024-08-11 05:37:38");
INSERT INTO product_warehouse VALUES("33","25","","","","2","10","157.99","2024-01-19 14:26:48","2025-02-19 15:57:27");
INSERT INTO product_warehouse VALUES("34","28","","","","2","10","3.3","2024-01-19 14:26:48","2024-01-19 14:26:48");
INSERT INTO product_warehouse VALUES("35","14","","","","2","10","499","2024-01-19 14:26:49","2024-01-19 14:26:49");
INSERT INTO product_warehouse VALUES("36","24","","","","2","10","379","2024-01-19 14:26:49","2024-01-19 14:26:49");
INSERT INTO product_warehouse VALUES("37","4","","","","2","9","1050","2024-01-19 14:26:49","2024-01-19 14:44:41");
INSERT INTO product_warehouse VALUES("38","5","","","","2","10","1150.99","2024-01-19 14:26:49","2024-01-19 14:26:49");
INSERT INTO product_warehouse VALUES("39","22","","","","2","10","399","2024-01-19 14:26:49","2024-01-19 14:26:49");
INSERT INTO product_warehouse VALUES("40","15","","","","2","10","547","2024-01-19 14:26:49","2024-01-19 14:26:49");
INSERT INTO product_warehouse VALUES("41","23","","","null","2","9","577","2024-01-19 14:28:26","2025-02-19 15:57:27");
INSERT INTO product_warehouse VALUES("42","27","","","","2","7","1.29","2024-01-19 14:28:26","2024-01-19 14:48:33");
INSERT INTO product_warehouse VALUES("43","20","","","","2","10","499","2024-01-19 14:28:26","2025-02-19 15:57:27");
INSERT INTO product_warehouse VALUES("44","17","","","","2","10","499","2024-01-19 14:28:26","2024-01-19 14:28:26");
INSERT INTO product_warehouse VALUES("45","16","","","","2","9","109","2024-01-19 14:28:26","2024-01-19 14:44:41");
INSERT INTO product_warehouse VALUES("46","30","","","","2","10","200","2024-01-19 14:28:26","2024-01-19 14:28:26");
INSERT INTO product_warehouse VALUES("47","19","","","","2","10","1059","2024-01-19 14:28:26","2024-05-28 08:46:50");
INSERT INTO product_warehouse VALUES("48","3","","","","2","8","350","2024-01-19 14:28:26","2024-01-19 14:44:41");
INSERT INTO product_warehouse VALUES("49","7","","","","2","10","","2024-01-19 14:28:26","2024-05-23 07:38:12");
INSERT INTO product_warehouse VALUES("50","2","","","","2","8","","2024-01-19 14:28:26","2025-02-18 18:35:10");
INSERT INTO product_warehouse VALUES("51","6","","","","2","9","1111.99","2024-01-19 14:28:35","2025-02-18 18:36:36");
INSERT INTO product_warehouse VALUES("52","13","","","","2","10","349","2024-01-19 14:28:35","2024-01-19 14:28:35");
INSERT INTO product_warehouse VALUES("53","10","","","","2","10","1250","2024-01-19 14:28:35","2024-01-19 14:28:35");
INSERT INTO product_warehouse VALUES("54","21","","","","2","10","599","2024-01-19 14:28:35","2024-01-19 14:28:35");
INSERT INTO product_warehouse VALUES("55","8","","","","2","10","1300","2024-01-19 14:28:35","2024-01-19 14:28:35");
INSERT INTO product_warehouse VALUES("56","12","","","","2","10","1250","2024-01-19 14:28:35","2024-01-19 14:28:35");
INSERT INTO product_warehouse VALUES("57","29","","","","2","10","3.19","2024-01-19 14:28:35","2024-01-19 14:28:35");
INSERT INTO product_warehouse VALUES("58","26","","","","2","10","3.99","2024-01-19 14:28:35","2024-01-19 14:28:35");
INSERT INTO product_warehouse VALUES("59","9","","","","2","9","559","2024-01-19 14:28:35","2024-01-19 14:44:41");
INSERT INTO product_warehouse VALUES("60","11","","","","2","10","1750","2024-01-19 14:28:35","2024-01-19 14:28:35");
INSERT INTO product_warehouse VALUES("61","32","","","","1","0","","2024-04-29 12:29:17","2024-04-29 12:29:17");
INSERT INTO product_warehouse VALUES("62","32","","","","2","0","","2024-04-29 12:29:17","2024-04-29 12:29:17");
INSERT INTO product_warehouse VALUES("63","33","","","1001,1002,1004,1005","1","4","","2024-07-18 07:39:33","2024-07-18 07:59:13");
INSERT INTO product_warehouse VALUES("64","33","","","2002,2003,2004,2005,","2","4","","2024-07-18 07:39:33","2024-07-18 08:01:45");
INSERT INTO product_warehouse VALUES("65","35","","","","1","10","130","2025-02-14 18:02:36","2025-02-14 19:09:14");
INSERT INTO product_warehouse VALUES("66","35","","","","2","0","123","2025-02-14 18:02:36","2025-02-14 18:02:36");
INSERT INTO product_warehouse VALUES("67","34","","","","1","0","123","2025-02-14 18:07:22","2025-02-14 18:07:22");
INSERT INTO product_warehouse VALUES("68","34","","","","2","0","130","2025-02-14 18:07:22","2025-02-14 18:07:22");
INSERT INTO product_warehouse VALUES("69","39","","","null,null,null,null","3","10","120","2025-02-14 18:09:52","2025-02-18 17:28:27");
INSERT INTO product_warehouse VALUES("70","30","","","null,null,null","3","-3","","2025-02-14 19:17:22","2025-02-19 15:57:27");
INSERT INTO product_warehouse VALUES("71","61","","","null","3","184","100","2025-02-19 19:07:18","2025-03-01 21:32:44");
INSERT INTO product_warehouse VALUES("72","45","","","null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null","3","100","50","2025-02-19 19:16:39","2025-03-02 00:10:19");
INSERT INTO product_warehouse VALUES("73","42","","","null,null,null,null,null","3","88","10","2025-02-19 19:20:45","2025-03-15 19:32:30");
INSERT INTO product_warehouse VALUES("74","57","","","null,null","3","100","70","2025-02-20 14:08:30","2025-03-02 00:08:38");
INSERT INTO product_warehouse VALUES("75","50","","","null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null","3","57","50","2025-02-20 14:09:18","2025-03-04 08:18:22");
INSERT INTO product_warehouse VALUES("76","51","","","null,null","3","33","40","2025-02-20 14:09:43","2025-03-04 08:17:12");
INSERT INTO product_warehouse VALUES("77","60","","","","3","0","70","2025-02-20 15:34:13","2025-02-20 15:34:13");
INSERT INTO product_warehouse VALUES("78","59","","","null,null","3","100","40","2025-02-20 15:35:08","2025-03-02 00:07:37");
INSERT INTO product_warehouse VALUES("79","49","","","null,null,null,null,null,null","3","88","80","2025-02-20 15:35:39","2025-03-20 15:29:40");
INSERT INTO product_warehouse VALUES("80","47","","","null,null,null,null,null,null,null,null,null,null,null","3","99","40","2025-02-20 15:35:58","2025-03-13 17:24:21");
INSERT INTO product_warehouse VALUES("81","46","","","null,null,null,null,null,null,null,null,null,null,null","3","20","40","2025-02-20 15:36:17","2025-03-02 00:03:19");
INSERT INTO product_warehouse VALUES("82","58","","","null,null,null","3","100","40","2025-02-20 15:36:57","2025-03-02 00:22:51");
INSERT INTO product_warehouse VALUES("83","44","","","","3","99","30","2025-02-20 15:37:16","2025-03-15 15:55:56");
INSERT INTO product_warehouse VALUES("84","43","","","","3","94","10","2025-02-20 15:38:26","2025-03-18 13:19:13");
INSERT INTO product_warehouse VALUES("85","56","","","null,null,null","3","0","40","2025-02-20 15:38:44","2025-02-26 16:25:16");
INSERT INTO product_warehouse VALUES("86","54","","","null,null","3","100","100","2025-02-20 15:39:01","2025-03-02 00:19:02");
INSERT INTO product_warehouse VALUES("87","53","","","null,null,null","3","100","130","2025-02-20 15:39:21","2025-03-02 00:18:17");
INSERT INTO product_warehouse VALUES("88","52","","","null,null,null","3","100","200","2025-02-20 15:39:39","2025-03-02 00:20:18");
INSERT INTO product_warehouse VALUES("89","55","","","null,null,null,null,null","3","96","60","2025-02-20 15:39:57","2025-03-15 15:24:52");
INSERT INTO product_warehouse VALUES("90","48","","","null","3","100","70","2025-02-20 15:40:30","2025-03-02 00:31:57");
INSERT INTO product_warehouse VALUES("91","62","","","","3","0","10","2025-02-20 18:05:36","2025-02-20 18:05:36");
INSERT INTO product_warehouse VALUES("92","63","","","","3","0","20","2025-02-20 18:06:38","2025-02-20 18:06:38");
INSERT INTO product_warehouse VALUES("93","64","","","null","3","99","30","2025-02-20 18:07:55","2025-03-02 18:01:40");
INSERT INTO product_warehouse VALUES("94","65","","","null","3","0","40","2025-02-20 18:09:56","2025-02-26 16:25:16");
INSERT INTO product_warehouse VALUES("95","66","","","","3","0","30","2025-02-20 18:11:51","2025-02-20 18:11:51");
INSERT INTO product_warehouse VALUES("96","67","","","","3","0","40","2025-02-20 18:12:58","2025-02-20 18:12:58");
INSERT INTO product_warehouse VALUES("97","68","","","null,null","3","0","30","2025-02-20 18:14:03","2025-02-26 16:25:24");
INSERT INTO product_warehouse VALUES("98","69","","","","3","0","20","2025-02-20 18:15:00","2025-02-20 18:15:00");
INSERT INTO product_warehouse VALUES("99","70","","","null","3","0","20","2025-02-20 18:18:06","2025-02-26 16:25:16");
INSERT INTO product_warehouse VALUES("100","71","","","","3","0","40","2025-02-20 18:19:11","2025-02-20 18:19:11");
INSERT INTO product_warehouse VALUES("101","72","","","","3","0","40","2025-02-20 18:20:12","2025-02-20 18:20:12");
INSERT INTO product_warehouse VALUES("102","73","","","","3","0","40","2025-02-20 18:23:58","2025-02-20 18:23:58");
INSERT INTO product_warehouse VALUES("103","74","","","null","3","0","120","2025-02-20 18:25:45","2025-02-26 16:25:24");
INSERT INTO product_warehouse VALUES("104","75","","","null,null","3","0","170","2025-02-20 18:27:48","2025-02-26 16:25:16");
INSERT INTO product_warehouse VALUES("105","76","","","","3","0","90","2025-02-20 18:30:21","2025-02-20 18:30:21");
INSERT INTO product_warehouse VALUES("106","77","","","","3","0","130","2025-02-20 18:32:00","2025-02-20 18:32:00");
INSERT INTO product_warehouse VALUES("107","78","","","","3","0","70","2025-02-20 18:34:57","2025-02-20 18:34:57");
INSERT INTO product_warehouse VALUES("108","79","","","","3","0","170","2025-02-20 18:37:54","2025-02-20 18:37:54");
INSERT INTO product_warehouse VALUES("109","80","","","","3","20","10","2025-02-20 18:39:01","2025-02-23 19:07:51");
INSERT INTO product_warehouse VALUES("110","81","","","","3","0","20","2025-02-20 18:42:43","2025-02-20 18:42:43");
INSERT INTO product_warehouse VALUES("111","82","","","","3","0","","2025-02-23 18:26:11","2025-02-26 17:50:36");
INSERT INTO product_warehouse VALUES("112","83","","","null","3","100","","2025-02-24 08:47:40","2025-03-02 00:16:48");
INSERT INTO product_warehouse VALUES("113","84","","","null","3","100","","2025-02-24 09:04:13","2025-03-01 23:43:00");
INSERT INTO product_warehouse VALUES("114","85","","","","3","100","20","2025-02-24 09:13:39","2025-03-04 08:20:40");
INSERT INTO product_warehouse VALUES("115","86","","","","3","100","","2025-02-24 09:20:38","2025-03-02 00:01:40");
INSERT INTO product_warehouse VALUES("116","87","","","","3","100","100","2025-02-24 09:24:37","2025-03-04 08:21:26");
INSERT INTO product_warehouse VALUES("117","88","","","","3","99","","2025-02-24 09:28:00","2025-03-04 08:21:57");
INSERT INTO product_warehouse VALUES("118","89","","","null","3","99","30","2025-02-24 09:33:46","2025-03-26 19:31:22");
INSERT INTO product_warehouse VALUES("119","90","","","null","3","100","","2025-02-24 09:36:46","2025-03-01 23:24:20");
INSERT INTO product_warehouse VALUES("120","91","","","","3","100","","2025-02-24 09:44:52","2025-03-01 23:50:11");
INSERT INTO product_warehouse VALUES("121","92","","","null,null,null","3","96","","2025-02-24 09:48:31","2025-03-26 19:31:22");
INSERT INTO product_warehouse VALUES("122","93","","","null,null","3","20","","2025-02-24 09:52:50","2025-03-02 00:03:19");
INSERT INTO product_warehouse VALUES("123","94","","","","3","99","","2025-02-24 09:54:56","2025-03-04 08:23:00");
INSERT INTO product_warehouse VALUES("124","95","","","null","3","100","","2025-02-24 09:58:21","2025-03-01 23:41:58");
INSERT INTO product_warehouse VALUES("125","96","","","","3","20","","2025-02-24 10:01:35","2025-02-24 10:02:57");
INSERT INTO product_warehouse VALUES("126","97","","","","3","20","","2025-02-24 10:04:28","2025-02-24 10:04:51");
INSERT INTO product_warehouse VALUES("127","98","","","null,null","3","100","","2025-02-24 10:06:04","2025-03-02 00:09:23");
INSERT INTO product_warehouse VALUES("128","99","","","","3","55","50","2025-02-24 15:22:26","2025-02-26 19:13:41");
INSERT INTO product_warehouse VALUES("129","100","","","","3","97","","2025-02-25 10:18:48","2025-03-02 16:09:43");
INSERT INTO product_warehouse VALUES("130","101","","","","3","40","","2025-02-25 10:22:48","2025-02-25 10:44:41");
INSERT INTO product_warehouse VALUES("131","102","","","","3","100","","2025-02-25 10:41:28","2025-03-01 23:50:31");
INSERT INTO product_warehouse VALUES("132","103","","","","3","100","10","2025-02-25 10:46:14","2025-03-04 08:20:17");
INSERT INTO product_warehouse VALUES("133","104","","","","3","100","","2025-02-25 10:48:06","2025-03-01 23:53:37");
INSERT INTO product_warehouse VALUES("134","105","","","","3","-150","50","2025-02-25 11:37:36","2025-03-01 22:48:16");
INSERT INTO product_warehouse VALUES("135","105","","","","4","-20","100","2025-02-26 20:23:54","2025-03-01 21:51:30");
INSERT INTO product_warehouse VALUES("136","51","","","","4","0","40","2025-03-04 08:17:12","2025-03-04 08:17:12");
INSERT INTO product_warehouse VALUES("137","50","","","","4","0","50","2025-03-04 08:18:22","2025-03-04 08:18:22");
INSERT INTO product_warehouse VALUES("138","152","","","","3","0","1000","2025-03-04 20:02:51","2025-03-04 20:02:51");
INSERT INTO product_warehouse VALUES("139","153","","","","3","0","1000","2025-03-04 20:14:26","2025-03-04 20:14:26");
INSERT INTO product_warehouse VALUES("140","155","","","","3","100","1000","2025-03-04 20:19:40","2025-03-04 20:20:36");
INSERT INTO product_warehouse VALUES("141","156","","","","3","0","1000","2025-03-04 20:22:36","2025-03-04 20:22:36");
INSERT INTO product_warehouse VALUES("142","157","","","","3","0","40","2025-03-04 20:49:23","2025-03-04 20:49:23");
INSERT INTO product_warehouse VALUES("143","158","","","","3","10","100","2025-03-04 20:57:42","2025-03-04 20:58:22");
INSERT INTO product_warehouse VALUES("144","159","","","","3","100","40","2025-03-04 21:01:43","2025-03-04 21:02:01");
INSERT INTO product_warehouse VALUES("145","164","","","","3","20","90","2025-03-05 08:22:39","2025-03-05 08:23:34");
INSERT INTO product_warehouse VALUES("146","165","","","","3","100","130","2025-03-05 08:26:52","2025-03-05 08:27:45");
INSERT INTO product_warehouse VALUES("147","166","","","","3","10","170","2025-03-05 08:29:29","2025-03-05 08:29:57");
INSERT INTO product_warehouse VALUES("148","167","","","","3","100","50","2025-03-05 08:31:36","2025-03-05 08:31:56");
INSERT INTO product_warehouse VALUES("149","168","","","","3","100","40","2025-03-05 08:34:49","2025-03-05 08:37:21");
INSERT INTO product_warehouse VALUES("150","163","","","","3","100","40","2025-03-05 08:38:14","2025-03-05 08:38:28");
INSERT INTO product_warehouse VALUES("151","169","","","","3","100","40","2025-03-05 08:40:26","2025-03-05 08:40:53");



CREATE TABLE `productions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `reference_no` varchar(255) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `item` int(11) NOT NULL,
  `total_qty` int(11) NOT NULL,
  `total_tax` double NOT NULL,
  `total_cost` double NOT NULL,
  `shipping_cost` double DEFAULT NULL,
  `grand_total` double NOT NULL,
  `status` int(11) NOT NULL,
  `document` varchar(255) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `code` varchar(191) NOT NULL,
  `type` varchar(191) NOT NULL,
  `barcode_symbology` varchar(191) NOT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  `unit_id` int(11) NOT NULL,
  `purchase_unit_id` int(11) NOT NULL,
  `sale_unit_id` int(11) NOT NULL,
  `cost` double NOT NULL,
  `price` double NOT NULL,
  `wholesale_price` double DEFAULT NULL,
  `qty` double DEFAULT NULL,
  `alert_quantity` double DEFAULT NULL,
  `daily_sale_objective` double DEFAULT NULL,
  `promotion` tinyint(4) DEFAULT NULL,
  `promotion_price` varchar(191) DEFAULT NULL,
  `starting_date` varchar(200) DEFAULT NULL,
  `last_date` date DEFAULT NULL,
  `tax_id` int(11) DEFAULT NULL,
  `tax_method` int(11) DEFAULT NULL,
  `image` longtext DEFAULT NULL,
  `file` varchar(191) DEFAULT NULL,
  `is_embeded` tinyint(1) DEFAULT NULL,
  `is_variant` tinyint(1) DEFAULT NULL,
  `is_batch` tinyint(1) DEFAULT NULL,
  `is_diffPrice` tinyint(1) DEFAULT NULL,
  `is_imei` tinyint(1) DEFAULT NULL,
  `featured` tinyint(4) DEFAULT NULL,
  `product_list` varchar(191) DEFAULT NULL,
  `variant_list` varchar(191) DEFAULT NULL,
  `qty_list` varchar(191) DEFAULT NULL,
  `price_list` varchar(191) DEFAULT NULL,
  `product_details` text DEFAULT NULL,
  `variant_option` text DEFAULT NULL,
  `variant_value` text DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `is_sync_disable` tinyint(4) DEFAULT NULL,
  `woocommerce_product_id` int(11) DEFAULT NULL,
  `woocommerce_media_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=170 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO products VALUES("26","Fresh Organic Navel Orange","33887520","standard","C128","","29","4","4","4","2.99","3.99","","20","","","","","","","","1","202401151115301.png","","","","","","","1","","","","","<p>Fresh Organic Navel Orange</p>","","","0","","","","2024-01-15 17:15:32","2025-02-19 15:16:26");
INSERT INTO products VALUES("27","Banana (pack of 12)","27583341","standard","C128","","29","1","1","1","0.89","1.29","","-83","","","","","","","","1","202401151118271.png","","","","","","","1","","","","","","","","0","","","","2024-01-15 17:18:28","2025-02-27 11:44:47");
INSERT INTO products VALUES("28","Water Melon ~ 3KG","19186147","standard","C128","","29","1","1","1","2.39","3.3","","20","","","","","","","","1","202401151142511.png","","","","","","","1","","","","","<p>Water Melon ~ 3KG</p>","","","0","","","","2024-01-15 17:42:53","2025-02-20 15:40:56");
INSERT INTO products VALUES("29","Gala Original Apple - 1KG","80912386","standard","C128","","29","1","1","1","2.39","3.19","","10","","","","","","","","1","202401151144271.png","","","","","","","1","","","","","<p>Gala Original Apple - 1KG</p>","","","0","","","","2024-01-15 17:44:27","2025-02-19 15:16:37");
INSERT INTO products VALUES("31","Alpha Cheese","33357221","standard","C128","","34","1","1","1","120","200","","0","","","","","","","","1","zummXD2dvAtI.png","","","","1","","","1","","","","","","","","0","","","","2024-04-14 06:15:06","2025-02-24 08:10:50");
INSERT INTO products VALUES("32","green spice","61226895","standard","C128","19","40","1","1","1","10","20","","0","","","","","","","3","1","zummXD2dvAtI.png","","","","","","","1","","","","","","","","0","","","","2024-04-29 12:29:17","2025-02-23 18:40:44");
INSERT INTO products VALUES("34","BEEF","28953213","standard","C128","20","43","1","1","1","1200","1500","","0","5","","","","","","","1","202502140536341.jpg","","1","","","1","","1","","","","","","","","0","","","","2025-02-14 17:36:34","2025-02-19 15:15:23");
INSERT INTO products VALUES("35","BEEF STEW","48101092","standard","C128","20","43","1","1","1","1500","1200","","10","5","","","","","","","1","202502140554181.jpg","","0","","","1","","1","","","","","","","","0","","","","2025-02-14 17:54:18","2025-02-19 15:15:37");
INSERT INTO products VALUES("36","CHAPO","96826041","standard","C128","20","43","1","1","1","1500","1300","","0","5","5","1","1200","2025-02-14","2025-02-21","","1","202502140555521.jpg","","","","","","","1","","","","","","","","0","","","","2025-02-14 17:55:52","2025-02-19 15:15:50");
INSERT INTO products VALUES("37","MUKIMO","98031028","standard","C128","22","43","1","1","1","450","500","","0","","","","","","","","1","202502140557071.jpg","","","","","","","1","","","","","","","","0","","","","2025-02-14 17:57:07","2025-02-20 14:08:47");
INSERT INTO products VALUES("38","MURSIK","11629700","standard","C128","22","43","1","1","1","300","400","","0","5","3","","","","","","1","202502140558151.jpg","","0","","","0","","1","","","","","","","","0","","","","2025-02-14 17:58:15","2025-02-20 14:08:54");
INSERT INTO products VALUES("39","BEEF SOUP","31639174","standard","C128","","43","1","1","1","1200","1500","","10","5","","","","","","","1","202502140609521.jpg","","","","","1","","1","","","","","","","","0","","","","2025-02-14 18:09:52","2025-02-19 15:15:30");
INSERT INTO products VALUES("40","tinko","9999","standard","C128","23","46","1","1","1","15","20","","0","","","","","","","","1","","","","1","","","","1","","","","","this is test product with variant","["Size","Color"]","["S,M,L","Red,Green"]","0","","","","2025-02-19 11:27:46","2025-02-19 18:59:17");
INSERT INTO products VALUES("41","tinki","1111","standard","C128","","47","4","4","4","10","15","","0","","","","","","","","1","","","","","","","","1","","","","","this is test product without variant","","","0","","","","2025-02-19 11:27:46","2025-02-23 18:42:10");
INSERT INTO products VALUES("42","Tea-milk","32369098","standard","C128","24","37","6","6","6","5","10","","88","10","","","","","","","1","202502190505351.jpeg","","0","","","1","","1","","","","","","","","1","","","","2025-02-19 17:05:35","2025-03-15 19:32:30");
INSERT INTO products VALUES("43","Tea-black","82041032","standard","C128","24","37","6","6","6","0","10","","94","10","","","","","","","1","202502190506481.jpeg","","0","","","1","","1","","","","","","","","1","","","","2025-02-19 17:06:48","2025-03-18 13:19:13");
INSERT INTO products VALUES("44","Tea-special","23012979","standard","C128","24","37","6","6","6","10","30","","99","10","","","","","","","1","202502190508241.jpeg","","0","","","1","","1","","","","","","","","1","","","","2025-02-19 17:08:24","2025-03-15 15:55:56");
INSERT INTO products VALUES("45","Milk Cup","45290793","standard","C128","20","36","6","6","6","30","50","","100","","","","","","","","1","202502190509521.jpeg","","0","","","1","","1","","","","","","","","1","","","","2025-02-19 17:09:53","2025-03-02 00:10:19");
INSERT INTO products VALUES("46","Mountain Dew300ml","","standard","C128","","49","4","4","4","0","0","","2","10","","","","","","","1","","","0","1","","1","","1","","","","","this is test product with variant","["Size","Color"]","["S,M,L","Red,Green"]","1","","","","2025-02-19 17:11:26","2025-03-02 00:03:19");
INSERT INTO products VALUES("47","Mirinda","96213060","standard","C128","24","37","9","9","9","0","40","","99","10","","","","","","","1","202502190512381.jpeg","","0","","","1","","1","","","","","","","","1","","","","2025-02-19 17:12:39","2025-03-13 17:24:21");
INSERT INTO products VALUES("48","Predator 400ml","63092062","standard","C128","24","37","13","13","13","0","70","","100","20","","","","","","","1","202502190514081.jpeg","","0","","","1","","1","","","","","","","","1","","","","2025-02-19 17:14:08","2025-03-05 08:12:26");
INSERT INTO products VALUES("49","Minute-maid","92961331","standard","C128","","37","13","13","13","0","80","","88","10","","","","","","6","2","202502190515151.jpeg","","0","","","1","","1","","","","","","","","1","","","","2025-02-19 17:15:15","2025-03-20 15:29:40");
INSERT INTO products VALUES("50","Pepsi Plastic330ml","52840330","standard","C128","","37","12","12","12","0","50","","2","10","","","","","","","1","202503040859232.jpeg","","0","1","","1","","1","","","","","<p>this is test product with variant</p>","["Size","Color"]","["S,M,L","Red,Green"]","0","","","","2025-02-19 17:16:06","2025-03-05 08:30:48");
INSERT INTO products VALUES("51","Pepsi Bottle300ml","23849321","standard","C128","","37","9","9","9","0","40","","10","10","","","","","","","1","","","0","1","","1","","1","","","","","<p>this is test product with variant</p>","["Size","Color"]","["S,M,L","Red,Green"]","0","","","","2025-02-19 17:17:29","2025-03-04 20:46:37");
INSERT INTO products VALUES("52","Soda plastic 2L","69701884","standard","C128","24","37","11","11","11","0","200","","100","10","","","","","","","1","202502190518481.jpeg","","0","","","1","","1","","","","","","","","1","","","","2025-02-19 17:18:48","2025-03-02 00:20:18");
INSERT INTO products VALUES("53","Soda Plastic 1.25L","42231830","standard","C128","","37","10","10","10","0","130","","100","10","","","","","","","1","202502190521391.jpeg","","0","","","1","","1","","","","","","","","1","","","","2025-02-19 17:21:39","2025-03-02 00:18:17");
INSERT INTO products VALUES("54","Soda plastic 1L","97430265","standard","C128","","37","8","8","8","0","100","","100","10","","","","","","","1","202502190522341.jpeg","","0","","","1","","1","","","","","","","","1","","","","2025-02-19 17:22:34","2025-03-02 00:19:02");
INSERT INTO products VALUES("55","Soda 500ML","29775043","standard","C128","24","37","7","7","7","0","60","","96","10","","","","","","","1","202502190524201.jpeg","","0","","","1","","1","","","","","","","","1","","","","2025-02-19 17:24:20","2025-03-15 15:24:52");
INSERT INTO products VALUES("56","Soda300ml","","standard","C128","","49","4","4","4","0","0","","0","","","","","","","","1","","","0","1","","1","","1","","","","","this is test product with variant","["Size","Color"]","["S,M,L","Red,Green"]","1","","","","2025-02-19 17:27:29","2025-03-01 21:04:41");
INSERT INTO products VALUES("57","Dasani 1L","00572129","standard","C128","","37","8","8","8","0","70","","100","10","","","","","","","1","202502190528341.jpeg","","0","","","1","","1","","","","","","","","1","","","","2025-02-19 17:28:34","2025-03-02 00:08:38");
INSERT INTO products VALUES("58","Planet 500ml","36392121","standard","C128","24","37","7","7","7","0","40","","100","10","","","","","","","1","202502190530121.jpeg","","0","","","1","","1","","","","","","","","1","","","","2025-02-19 17:30:12","2025-03-02 00:22:51");
INSERT INTO products VALUES("59","Dasani 500ml","94880209","standard","C128","","37","7","7","7","0","40","","100","10","","","","","","","1","202502190531181.jpeg","","0","","","1","","1","","","","","","","","1","","","","2025-02-19 17:31:18","2025-03-02 00:07:37");
INSERT INTO products VALUES("60","CHIPS 70","00810124","standard","C128","","34","15","15","15","0","70","","0","","","","","","","","1","202502190704132.jpeg","","0","","","1","","1","","","","","","","","0","","","","2025-02-19 19:03:34","2025-02-24 08:10:50");
INSERT INTO products VALUES("61","CHIPS 100","10186135","standard","C128","","34","16","16","16","0","100","","184","10","7","","","","","","1","202502190705551.jpeg","","0","","","1","","1","","","","","","","","0","","","","2025-02-19 19:05:55","2025-03-01 21:32:44");
INSERT INTO products VALUES("62","Mandazi","32102192","standard","C128","","48","1","1","1","0","10","","0","","","","","","","","1","202502200605351.jpeg","","","","","1","","1","","","","","","","","0","","","","2025-02-20 18:05:36","2025-02-24 08:10:06");
INSERT INTO products VALUES("63","Chapati","43509924","standard","C128","","48","1","1","1","0","20","","0","","","","","","","","1","202502200606371.jpeg","","","","","1","","1","","","","","","","","0","","","","2025-02-20 18:06:38","2025-02-24 08:10:06");
INSERT INTO products VALUES("64","Viazi","89700121","standard","C128","","43","1","1","1","0","30","","98","0","","","","","","","1","202502200607551.jpeg","","0","","","1","","1","","","","","","","","1","","","","2025-02-20 18:07:55","2025-03-02 18:01:40");
INSERT INTO products VALUES("65","Eggs","37052986","standard","C128","","48","1","1","1","0","40","","0","","","","","","","","1","202502200609551.jpeg","","","","","1","","1","","","","","","","","0","","","","2025-02-20 18:09:56","2025-02-26 16:25:16");
INSERT INTO products VALUES("66","Dengu","90126316","standard","C128","","47","17","17","17","0","30","","0","","","","","","","","1","202502200611511.jpeg","","","","","1","","1","","","","","","","","0","","","","2025-02-20 18:11:51","2025-02-23 18:42:10");
INSERT INTO products VALUES("67","Rice","61451208","standard","C128","","34","17","17","17","0","40","","0","","","","","","","","1","202502200612581.jpeg","","","","","1","","1","","","","","","","","0","","","","2025-02-20 18:12:58","2025-02-24 08:10:50");
INSERT INTO products VALUES("68","Ugali","09893221","standard","C128","","34","17","17","17","0","30","","0","","","","","","","","1","202502200614031.jpeg","","","","","1","","1","","","","","","","","0","","","","2025-02-20 18:14:03","2025-02-26 16:25:24");
INSERT INTO products VALUES("69","Sukuma","60429319","standard","C128","","34","17","17","17","0","20","","0","","","","","","","","1","202502200615001.jpeg","","","","","1","","1","","","","","","","","0","","","","2025-02-20 18:15:00","2025-02-24 08:10:50");
INSERT INTO products VALUES("70","Cabbage","09055742","standard","C128","","34","17","17","17","0","20","","0","","","","","","","","1","202502200618061.jpeg","","","","","1","","1","","","","","","","","0","","","","2025-02-20 18:18:06","2025-02-26 16:25:16");
INSERT INTO products VALUES("71","Managu","14352139","standard","C128","","34","17","17","17","0","40","","0","","","","","","","","1","202502200619111.jpeg","","","","","1","","1","","","","","","","","0","","","","2025-02-20 18:19:11","2025-02-24 08:10:50");
INSERT INTO products VALUES("72","Omena","43065197","standard","C128","","34","17","17","17","0","40","","0","","","","","","","","1","202502200620121.jpeg","","","","","1","","1","","","","","","","","0","","","","2025-02-20 18:20:12","2025-02-24 08:10:50");
INSERT INTO products VALUES("73","Fulu","59993210","standard","C128","","34","17","17","17","0","40","","0","","","","","","","","1","202502200623571.jpeg","","","","","1","","1","","","","","","","","0","","","","2025-02-20 18:23:57","2025-02-24 08:10:50");
INSERT INTO products VALUES("74","Fish120","92351627","standard","C128","","34","17","17","17","0","120","","0","","","","","","","","1","202502200625451.jpeg","","0","","","1","","1","","","","","","","","0","","","","2025-02-20 18:25:45","2025-02-26 16:25:24");
INSERT INTO products VALUES("75","Fish170","06049026","standard","C128","","34","17","17","17","0","170","","0","","","","","","","","1","202502200627481.jpeg","","","","","1","","1","","","","","","","","0","","","","2025-02-20 18:27:48","2025-02-26 16:25:16");
INSERT INTO products VALUES("76","Matumbo","23081130","standard","C128","","34","17","17","17","0","90","","0","","","","","","","","1","202502200630211.jpeg","","","","","1","","1","","","","","","","","0","","","","2025-02-20 18:30:21","2025-02-24 08:10:50");
INSERT INTO products VALUES("77","Nyama","93619174","standard","C128","","47","17","17","17","0","130","","0","","","","","","","","1","202502200631591.jpeg","","","","","1","","1","","","","","","","","0","","","","2025-02-20 18:31:59","2025-02-23 18:42:10");
INSERT INTO products VALUES("78","Mix","40379539","standard","C128","","34","17","17","17","0","70","","0","","","","","","","","1","202502200634571.jpeg","","","","","1","","1","","","","","","","","0","","","","2025-02-20 18:34:57","2025-02-24 08:10:50");
INSERT INTO products VALUES("79","Kuku","29074835","standard","C128","","34","17","17","17","0","170","","0","","","","","","","","1","202502200637541.jpeg","","","","","1","","1","","","","","","","","0","","","","2025-02-20 18:37:54","2025-02-24 08:10:50");
INSERT INTO products VALUES("80","Beans Soup","76411602","standard","C128","","34","17","17","17","0","10","","20","","","","","","","","1","202502200639011.jpeg","","","","","1","","1","","","","","","","","0","","","","2025-02-20 18:39:01","2025-02-24 08:10:50");
INSERT INTO products VALUES("81","Nyama- Soup","09495341","standard","C128","","34","17","17","17","0","20","","0","","","","","","","","1","202502200642431.jpeg","","","","","1","","1","","","","","","","","0","","","","2025-02-20 18:42:43","2025-02-24 08:10:50");
INSERT INTO products VALUES("82","KUKU TEST","12333","standard","C128","21","34","1","1","1","0","250","","0","10","","","","","","","1","zummXD2dvAtI.png","","","","","","","","","","","","","","","0","","","","2025-02-23 18:26:11","2025-02-26 17:50:36");
INSERT INTO products VALUES("83","Uji","96905206","standard","C128","24","36","6","6","6","0","20","","100","10","","","","","","","1","202503011124512.jpg","","0","","","0","","1","","","","","","","","1","","","","2025-02-24 08:47:40","2025-03-05 07:51:11");
INSERT INTO products VALUES("84","Mandazi","13196700","standard","C128","24","43","1","1","1","0","10","","100","10","","","","","","","1","202503011144212.jpg","","0","","","0","","1","","","","","","","","1","","","","2025-02-24 09:04:13","2025-03-05 07:51:58");
INSERT INTO products VALUES("85","Chapati","63651882","standard","C128","24","43","1","1","1","0","20","","100","10","","","","","","","1","202503011116452.jpg","","0","","","1","","1","","","","","","","","1","","","","2025-02-24 09:13:39","2025-03-05 07:52:20");
INSERT INTO products VALUES("86","Chips-70","59071327","standard","C128","24","43","15","15","15","0","70","","100","10","","","","","","","1","202503011121412.jpg","","0","","","0","","1","","","","","","","","1","","","","2025-02-24 09:20:38","2025-03-05 07:53:08");
INSERT INTO products VALUES("87","Chips-100","99332001","standard","C128","24","43","16","16","16","0","100","","100","10","","","","","","","1","202503011119372.jpg","","0","","","1","","1","","","","","","","","1","","","","2025-02-24 09:24:37","2025-03-05 07:53:23");
INSERT INTO products VALUES("88","Eggs","54250388","standard","C128","24","43","17","17","17","0","40","","99","10","","","","","","","1","202503011126192.jpg","","0","","","0","","1","","","","","","","","1","","","","2025-02-24 09:28:00","2025-03-05 07:53:56");
INSERT INTO products VALUES("89","Beans","26580322","standard","C128","24","43","17","17","17","0","30","","99","10","","","","","","","1","202503011102072.jpg","","0","","","1","","1","","","","","","","","1","","","","2025-02-24 09:33:46","2025-03-26 19:31:22");
INSERT INTO products VALUES("90","Dengu","29917275","standard","C128","24","43","17","17","17","0","30","","100","10","","","","","","","1","202503011123502.jpg","","0","","","0","","1","","","","","","","","1","","","","2025-02-24 09:36:46","2025-03-05 07:54:56");
INSERT INTO products VALUES("91","Rice","91612758","standard","C128","24","43","17","17","17","0","40","","100","10","","","","","","","1","202503011147142.jpg","","0","","","0","","1","","","","","","","","1","","","","2025-02-24 09:44:52","2025-03-05 07:55:20");
INSERT INTO products VALUES("92","Ugali","90852946","standard","C128","24","43","17","17","17","0","30","","96","10","","","","","","","1","202503011157532.jpg","","0","","","0","","1","","","","","","","","1","","","","2025-02-24 09:48:31","2025-03-26 19:31:22");
INSERT INTO products VALUES("93","Sukuma","","standard","C128","","49","4","4","4","0","0","","2","10","","","","","","","1","","","","1","","","","1","","","","","this is test product with variant","["Size","Color"]","["S,M,L","Red,Green"]","1","","","","2025-02-24 09:52:50","2025-03-02 00:03:19");
INSERT INTO products VALUES("94","Cabbage","23520925","standard","C128","21","43","17","17","17","0","20","","99","10","","","","","","","1","202503011114202.jpeg","","0","","","0","","1","","","","","","","","1","","","","2025-02-24 09:54:56","2025-03-04 08:23:00");
INSERT INTO products VALUES("95","Managu","95371256","standard","C128","24","29","17","17","17","0","40","","100","10","","","","","","","1","202503011141032.jpg","","0","","","0","","1","","","","","","","","1","","","","2025-02-24 09:58:21","2025-03-01 23:41:58");
INSERT INTO products VALUES("96","Omena Raw Material","33746997","standard","C128","","49","4","4","4","0","0","","0","10","","","","","","","1","","","0","1","","0","","0","","","","","<p>this is test product with variant</p>","["Size","Color"]","["S,M,L","Red,Green"]","1","","","","2025-02-24 10:01:35","2025-03-05 08:19:09");
INSERT INTO products VALUES("97","Fulu","","standard","C128","","49","4","4","4","0","0","","0","10","","","","","","","1","","","","1","","","","1","","","","","this is test product with variant","["Size","Color"]","["S,M,L","Red,Green"]","1","","","","2025-02-24 10:04:28","2025-03-01 21:04:41");
INSERT INTO products VALUES("98","Fish-120","01603719","standard","C128","24","43","1","1","1","0","120","","100","10","","","","","","","1","202503011134372.jpg","","0","","","0","","1","","","","","","","","1","","","","2025-02-24 10:06:04","2025-03-02 00:09:23");
INSERT INTO products VALUES("99","Beans-Raw","09260364","standard","C128","24","49","4","4","4","1000","50","","55","10","","","","","","","1","zummXD2dvAtI.png","","0","","","1","","1","","","","","","","","1","","","","2025-02-24 15:22:26","2025-02-26 19:13:41");
INSERT INTO products VALUES("100","Fish-170","56379893","standard","C128","24","43","1","1","1","0","170","","97","10","","","","","","","1","202503011136162.jpg","","0","","","0","","1","","","","","","","","1","","","","2025-02-25 10:18:48","2025-03-02 16:09:43");
INSERT INTO products VALUES("101","Matumbo","","standard","C128","","49","4","4","4","0","0","","0","10","","","","","","","1","","","","1","","","","","","","","","this is test product with variant","["Size","Color"]","["S,M,L","Red,Green"]","1","","","","2025-02-25 10:22:48","2025-03-01 21:04:41");
INSERT INTO products VALUES("102","Mix","03479366","standard","C128","24","43","17","17","17","0","130","","100","10","","","","","","","1","202503011149342.jpg","","0","","","0","","1","","","","","","","","1","","","","2025-02-25 10:41:28","2025-03-01 23:50:31");
INSERT INTO products VALUES("103","Beans Soup","13712074","standard","C128","24","43","17","17","17","0","10","","100","10","","","","","","","1","202503011107522.jpg","","0","","","1","","1","","","","","","","","1","","","","2025-02-25 10:46:14","2025-03-04 08:20:17");
INSERT INTO products VALUES("104","Nyama-soup","81271708","standard","C128","24","43","17","17","17","0","20","","100","10","","","","","","","1","202503011152522.jpg","","0","","","0","","1","","","","","","","","1","","","","2025-02-25 10:48:06","2025-03-01 23:53:37");
INSERT INTO products VALUES("105","7-up350ml","","standard","C128","","49","4","4","4","0","0","","-250","10","","","","","","","1","","","0","1","","1","","1","","","","","this is test product with variant","["Size","Color"]","["S,M,L","Red,Green"]","1","","","","2025-02-25 11:37:36","2025-03-01 22:48:16");
INSERT INTO products VALUES("106","Wheat flour (Softy)","9999","standard","C128","25","49","4","4","4","0","0","","0","10","","","","","","","1","","","","1","","","","","","","","","this is test product with variant","["Size","Color"]","["S,M,L","Red,Green"]","1","","","","2025-03-01 20:04:37","2025-03-01 21:04:40");
INSERT INTO products VALUES("107","Salt","1111","standard","C128","","49","4","4","4","0","0","","0","","","","","","","","1","","","","1","","","","","","","","","this is test product with variant","["Size","Color"]","["S,M,L","Red,Green"]","1","","","","2025-03-01 21:04:40","2025-03-01 21:04:40");
INSERT INTO products VALUES("108","Sugar","","standard","C128","","49","4","4","4","0","0","","0","","","","","","","","1","","","","1","","","","","","","","","this is test product with variant","["Size","Color"]","["S,M,L","Red,Green"]","1","","","","2025-03-01 21:04:40","2025-03-01 21:04:40");
INSERT INTO products VALUES("109","Milk (Dairy top)","","standard","C128","","49","4","4","4","0","0","","0","","","","","","","","1","","","","1","","","","","","","","","this is test product with variant","["Size","Color"]","["S,M,L","Red,Green"]","1","","","","2025-03-01 21:04:40","2025-03-01 21:04:40");
INSERT INTO products VALUES("110","Tea (Tangawizi)","","standard","C128","","49","4","4","4","0","0","","0","","","","","","","","1","","","","1","","","","","","","","","this is test product with variant","["Size","Color"]","["S,M,L","Red,Green"]","1","","","","2025-03-01 21:04:40","2025-03-01 21:04:40");
INSERT INTO products VALUES("111","Royco","","standard","C128","","49","4","4","4","0","0","","0","","","","","","","","1","","","","1","","","","","","","","","this is test product with variant","["Size","Color"]","["S,M,L","Red,Green"]","1","","","","2025-03-01 21:04:40","2025-03-01 21:04:40");
INSERT INTO products VALUES("112","Royco cubes","","standard","C128","","49","4","4","4","0","0","","0","","","","","","","","1","","","","1","","","","","","","","","this is test product with variant","["Size","Color"]","["S,M,L","Red,Green"]","1","","","","2025-03-01 21:04:40","2025-03-01 21:04:40");
INSERT INTO products VALUES("113","Uji mix","","standard","C128","","49","4","4","4","0","0","","0","","","","","","","","1","","","","1","","","","","","","","","this is test product with variant","["Size","Color"]","["S,M,L","Red,Green"]","1","","","","2025-03-01 21:04:40","2025-03-01 21:04:40");
INSERT INTO products VALUES("114","Green grams (Laxmi)","","standard","C128","","49","4","4","4","0","0","","0","","","","","","","","1","","","","1","","","","","","","","","this is test product with variant","["Size","Color"]","["S,M,L","Red,Green"]","1","","","","2025-03-01 21:04:40","2025-03-01 21:04:40");
INSERT INTO products VALUES("115","Rice (corrie)","","standard","C128","","49","4","4","4","0","0","","0","","","","","","","","1","","","","1","","","","","","","","","this is test product with variant","["Size","Color"]","["S,M,L","Red,Green"]","1","","","","2025-03-01 21:04:40","2025-03-01 21:04:40");
INSERT INTO products VALUES("116","Maize flour (Mfalme)","","standard","C128","","49","4","4","4","0","0","","0","","","","","","","","1","","","","1","","","","","","","","","this is test product with variant","["Size","Color"]","["S,M,L","Red,Green"]","1","","","","2025-03-01 21:04:40","2025-03-01 21:04:40");
INSERT INTO products VALUES("117","Bar Soap","","standard","C128","","49","4","4","4","0","0","","0","","","","","","","","1","","","","1","","","","","","","","","this is test product with variant","["Size","Color"]","["S,M,L","Red,Green"]","1","","","","2025-03-01 21:04:40","2025-03-01 21:04:40");
INSERT INTO products VALUES("118","Baking","","standard","C128","","49","4","4","4","0","0","","0","","","","","","","","1","","","","1","","","","","","","","","this is test product with variant","["Size","Color"]","["S,M,L","Red,Green"]","1","","","","2025-03-01 21:04:40","2025-03-01 21:04:40");
INSERT INTO products VALUES("119","Cow boy","","standard","C128","","49","4","4","4","0","0","","0","","","","","","","","1","","","","1","","","","","","","","","this is test product with variant","["Size","Color"]","["S,M,L","Red,Green"]","1","","","","2025-03-01 21:04:40","2025-03-01 21:04:40");
INSERT INTO products VALUES("120","Cooking Oil","","standard","C128","","49","4","4","4","0","0","","0","","","","","","","","1","","","","1","","","","","","","","","this is test product with variant","["Size","Color"]","["S,M,L","Red,Green"]","1","","","","2025-03-01 21:04:40","2025-03-01 21:04:40");
INSERT INTO products VALUES("121","Matches","","standard","C128","","49","4","4","4","0","0","","0","","","","","","","","1","","","","1","","","","","","","","","this is test product with variant","["Size","Color"]","["S,M,L","Red,Green"]","1","","","","2025-03-01 21:04:40","2025-03-01 21:04:40");
INSERT INTO products VALUES("122","Lemon","","standard","C128","","49","4","4","4","0","0","","0","","","","","","","","1","","","","1","","","","","","","","","this is test product with variant","["Size","Color"]","["S,M,L","Red,Green"]","1","","","","2025-03-01 21:04:40","2025-03-01 21:04:40");
INSERT INTO products VALUES("123","Onions","","standard","C128","","49","4","4","4","0","0","","0","","","","","","","","1","","","","1","","","","","","","","","this is test product with variant","["Size","Color"]","["S,M,L","Red,Green"]","1","","","","2025-03-01 21:04:40","2025-03-01 21:04:40");
INSERT INTO products VALUES("124","Dania","","standard","C128","","49","4","4","4","0","0","","0","","","","","","","","1","","","","1","","","","","","","","","this is test product with variant","["Size","Color"]","["S,M,L","Red,Green"]","1","","","","2025-03-01 21:04:40","2025-03-01 21:04:40");
INSERT INTO products VALUES("125","Cabbages","","standard","C128","","49","4","4","4","0","0","","0","","","","","","","","1","","","","1","","","","","","","","","this is test product with variant","["Size","Color"]","["S,M,L","Red,Green"]","1","","","","2025-03-01 21:04:40","2025-03-01 21:04:40");
INSERT INTO products VALUES("126","Tomatoes","","standard","C128","","49","4","4","4","0","0","","0","","","","","","","","1","","","","1","","","","","","","","","this is test product with variant","["Size","Color"]","["S,M,L","Red,Green"]","1","","","","2025-03-01 21:04:41","2025-03-01 21:04:41");
INSERT INTO products VALUES("127","Garlic","","standard","C128","","49","4","4","4","0","0","","0","","","","","","","","1","","","","1","","","","","","","","","this is test product with variant","["Size","Color"]","["S,M,L","Red,Green"]","1","","","","2025-03-01 21:04:41","2025-03-01 21:04:41");
INSERT INTO products VALUES("128","Ginger","","standard","C128","","49","4","4","4","0","0","","0","","","","","","","","1","","","","1","","","","","","","","","this is test product with variant","["Size","Color"]","["S,M,L","Red,Green"]","1","","","","2025-03-01 21:04:41","2025-03-01 21:04:41");
INSERT INTO products VALUES("129","Meat","","standard","C128","","49","4","4","4","0","0","","0","","","","","","","","1","","","","1","","","","","","","","","this is test product with variant","["Size","Color"]","["S,M,L","Red,Green"]","1","","","","2025-03-01 21:04:41","2025-03-01 21:04:41");
INSERT INTO products VALUES("130","Poatoes","","standard","C128","","49","4","4","4","0","0","","0","","","","","","","","1","","","","1","","","","","","","","","this is test product with variant","["Size","Color"]","["S,M,L","Red,Green"]","1","","","","2025-03-01 21:04:41","2025-03-01 21:04:41");
INSERT INTO products VALUES("131","Fish120","49933162","standard","C128","","49","4","4","4","0","0","","0","","","","","","","","1","","","0","1","","0","","0","","","","","<p>this is test product with variant</p>","["Size","Color"]","["S,M,L","Red,Green"]","1","","","","2025-03-01 21:04:41","2025-03-01 23:33:25");
INSERT INTO products VALUES("132","Minji","","standard","C128","","49","4","4","4","0","0","","0","","","","","","","","1","","","","1","","","","","","","","","this is test product with variant","["Size","Color"]","["S,M,L","Red,Green"]","1","","","","2025-03-01 21:04:41","2025-03-01 21:04:41");
INSERT INTO products VALUES("133","Frenh beans","","standard","C128","","49","4","4","4","0","0","","0","","","","","","","","1","","","","1","","","","","","","","","this is test product with variant","["Size","Color"]","["S,M,L","Red,Green"]","1","","","","2025-03-01 21:04:41","2025-03-01 21:04:41");
INSERT INTO products VALUES("134","Carrots","","standard","C128","","49","4","4","4","0","0","","0","","","","","","","","1","","","","1","","","","","","","","","this is test product with variant","["Size","Color"]","["S,M,L","Red,Green"]","1","","","","2025-03-01 21:04:41","2025-03-01 21:04:41");
INSERT INTO products VALUES("135","Liquid soap","","standard","C128","","49","4","4","4","0","0","","0","","","","","","","","1","","","","1","","","","","","","","","this is test product with variant","["Size","Color"]","["S,M,L","Red,Green"]","1","","","","2025-03-01 21:04:41","2025-03-01 21:04:41");
INSERT INTO products VALUES("136","Makaa","","standard","C128","","49","4","4","4","0","0","","0","","","","","","","","1","","","","1","","","","","","","","","this is test product with variant","["Size","Color"]","["S,M,L","Red,Green"]","1","","","","2025-03-01 21:04:41","2025-03-01 21:04:41");
INSERT INTO products VALUES("137","Firewood","","standard","C128","","49","4","4","4","0","0","","0","","","","","","","","1","","","","1","","","","","","","","","this is test product with variant","["Size","Color"]","["S,M,L","Red,Green"]","1","","","","2025-03-01 21:04:41","2025-03-01 21:04:41");
INSERT INTO products VALUES("138","Gas","","standard","C128","","49","4","4","4","0","0","","0","","","","","","","","1","","","","1","","","","","","","","","this is test product with variant","["Size","Color"]","["S,M,L","Red,Green"]","1","","","","2025-03-01 21:04:41","2025-03-01 21:04:41");
INSERT INTO products VALUES("139","Water","","standard","C128","","49","4","4","4","0","0","","0","","","","","","","","1","","","","1","","","","","","","","","this is test product with variant","["Size","Color"]","["S,M,L","Red,Green"]","1","","","","2025-03-01 21:04:41","2025-03-01 21:04:41");
INSERT INTO products VALUES("140","Fish170","","standard","C128","","49","4","4","4","0","0","","0","","","","","","","","1","","","","1","","","","","","","","","this is test product with variant","["Size","Color"]","["S,M,L","Red,Green"]","1","","","","2025-03-01 21:04:41","2025-03-01 21:04:41");
INSERT INTO products VALUES("141","Hoho","","standard","C128","","49","4","4","4","0","0","","0","","","","","","","","1","","","","1","","","","","","","","","this is test product with variant","["Size","Color"]","["S,M,L","Red,Green"]","1","","","","2025-03-01 21:04:41","2025-03-01 21:04:41");
INSERT INTO products VALUES("142","Tissue paper","","standard","C128","","49","4","4","4","0","0","","0","","","","","","","","1","","","","1","","","","","","","","","this is test product with variant","["Size","Color"]","["S,M,L","Red,Green"]","1","","","","2025-03-01 21:04:41","2025-03-01 21:04:41");
INSERT INTO products VALUES("143","Seviettes","","standard","C128","","49","4","4","4","0","0","","0","","","","","","","","1","","","","1","","","","","","","","","this is test product with variant","["Size","Color"]","["S,M,L","Red,Green"]","1","","","","2025-03-01 21:04:41","2025-03-01 21:04:41");
INSERT INTO products VALUES("144","Dasani1ltr","","standard","C128","","49","4","4","4","0","0","","0","","","","","","","","1","","","","1","","","","","","","","","this is test product with variant","["Size","Color"]","["S,M,L","Red,Green"]","1","","","","2025-03-01 21:04:41","2025-03-01 21:04:41");
INSERT INTO products VALUES("145","Soda500ml","","standard","C128","","49","4","4","4","0","0","","0","","","","","","","","1","","","","1","","","","","","","","","this is test product with variant","["Size","Color"]","["S,M,L","Red,Green"]","1","","","","2025-03-01 21:04:41","2025-03-01 21:04:41");
INSERT INTO products VALUES("146","Soda plastic1ltr","","standard","C128","","49","4","4","4","0","0","","0","","","","","","","","1","","","","1","","","","","","","","","this is test product with variant","["Size","Color"]","["S,M,L","Red,Green"]","1","","","","2025-03-01 21:04:41","2025-03-01 21:04:41");
INSERT INTO products VALUES("147","Soda plastic1.25ltr","83190502","standard","C128","","49","4","4","4","0","0","","0","","","","","","","","1","202503011138392.jpg","","0","1","","0","","0","","","","","<p>this is test product with variant</p>","["Size","Color"]","["S,M,L","Red,Green"]","1","","","","2025-03-01 21:04:41","2025-03-01 23:38:39");
INSERT INTO products VALUES("148","Soda plastic2ltr","","standard","C128","","49","4","4","4","0","0","","0","","","","","","","","1","","","","1","","","","","","","","","this is test product with variant","["Size","Color"]","["S,M,L","Red,Green"]","1","","","","2025-03-01 21:04:41","2025-03-01 21:04:41");
INSERT INTO products VALUES("149","Minute-maid400ml","","standard","C128","","49","4","4","4","0","0","","0","","","","","","","","1","","","","1","","","","","","","","","this is test product with variant","["Size","Color"]","["S,M,L","Red,Green"]","1","","","","2025-03-01 21:04:41","2025-03-01 21:04:41");
INSERT INTO products VALUES("150","Predator400ml","","standard","C128","","49","4","4","4","0","0","","0","","","","","","","","1","","","","1","","","","","","","","","this is test product with variant","["Size","Color"]","["S,M,L","Red,Green"]","1","","","","2025-03-01 21:04:41","2025-03-01 21:04:41");
INSERT INTO products VALUES("151","Mirinda300ml","","standard","C128","","49","4","4","4","0","0","","0","","","","","","","","1","","","","1","","","","","","","","","this is test product with variant","["Size","Color"]","["S,M,L","Red,Green"]","1","","","","2025-03-01 21:04:41","2025-03-01 21:04:41");
INSERT INTO products VALUES("152","Test","68392093","standard","C128","","37","4","4","4","0","1000","","0","","","","","","","","1","202503040803302.png","","0","1","","1","","1","","","","","","["large","small"]","["1","2"]","0","","","","2025-03-04 20:02:05","2025-03-04 20:23:43");
INSERT INTO products VALUES("153","test 2","20910965","standard","C128","","36","6","6","6","0","1000","","0","","","","","","","","1","202503040810361.jpeg","","0","1","","1","","1","","","","","","["large"]","["greem,blue,yellow"]","0","","","","2025-03-04 20:10:36","2025-03-04 20:24:00");
INSERT INTO products VALUES("154","test 3","44281261","standard","C128","","36","9","9","9","0","1000","","0","","","","","","","","1","zummXD2dvAtI.png","","","","","","","1","","","","","","","","0","","","","2025-03-04 20:12:48","2025-03-04 20:24:12");
INSERT INTO products VALUES("155","tests","01268903","standard","C128","","37","12","12","12","0","1000","","100","","","","","","","","1","202503040819021.jpg","","0","","","1","","1","","","","","","","","0","","","","2025-03-04 20:19:02","2025-03-04 20:24:21");
INSERT INTO products VALUES("156","tests2","75931279","standard","C128","","36","4","4","4","0","1000","","0","","","","","","","","1","zummXD2dvAtI.png","","","1","","1","","1","","","","","","["large"]","["ree"]","0","","","","2025-03-04 20:22:36","2025-03-04 20:24:36");
INSERT INTO products VALUES("157","Pepsi Bottle300ml","29437507","standard","C128","","37","9","9","9","0","40","","0","10","","","","","","","1","202503040847311.jpeg","","0","","","1","","1","","","","","","","","0","","","","2025-03-04 20:47:31","2025-03-04 21:01:29");
INSERT INTO products VALUES("158","test","02402602","standard","C128","","36","15","15","15","0","1000","","10","","","","","","","","1","zummXD2dvAtI.png","","0","","","1","","0","","","","","","","","0","","","","2025-03-04 20:56:18","2025-03-04 20:58:56");
INSERT INTO products VALUES("159","Pepsi Bottle300ml","84631590","standard","C128","","37","9","9","9","0","40","","100","","","","","","","","1","202503040901431.jpeg","","","","","1","","1","","","","","","","","1","","","","2025-03-04 21:01:43","2025-03-04 21:02:01");
INSERT INTO products VALUES("160","7-up 350ml","06243536","standard","C128","","37","14","14","14","0","40","","0","","","","","","","","1","202503050811062.jpeg","","0","","","0","","1","","","","","","","","1","","","","2025-03-05 08:09:54","2025-03-05 08:11:06");
INSERT INTO products VALUES("161","Soda 300ml","22831893","standard","C128","","37","9","9","9","0","40","","0","","","","","","","","1","202503050814061.jpeg","","","","","","","1","","","","","","","","1","","","","2025-03-05 08:14:06","2025-03-05 08:14:06");
INSERT INTO products VALUES("162","Sukuma Wiki","94537618","standard","C128","","43","17","17","17","0","20","","0","","","","","","","","1","202503050816521.jpeg","","","","","","","1","","","","","","","","1","","","","2025-03-05 08:16:53","2025-03-05 08:16:53");
INSERT INTO products VALUES("163","Omena","32637860","standard","C128","","43","17","17","17","0","40","","100","","","","","","","","1","202503050819361.jpeg","","0","","","1","","1","","","","","","","","1","","","","2025-03-05 08:19:36","2025-03-05 08:38:28");
INSERT INTO products VALUES("164","Matumbo.","11704629","standard","C128","","43","17","17","17","0","90","","20","","","","","","","","1","202503050822391.jpeg","","","","","1","","1","","","","","","","","1","","","","2025-03-05 08:22:39","2025-03-05 08:23:34");
INSERT INTO products VALUES("165","Nyama","06922147","standard","C128","","43","17","17","17","0","130","","100","","","","","","","","1","202503050825381.jpeg","","0","","","1","","1","","","","","","","","1","","","","2025-03-05 08:25:39","2025-03-05 08:27:45");
INSERT INTO products VALUES("166","Kuku","22793068","standard","C128","","43","17","17","17","0","170","","10","","","","","","","","1","202503050829291.jpeg","","","","","1","","1","","","","","","","","1","","","","2025-03-05 08:29:29","2025-03-05 08:29:57");
INSERT INTO products VALUES("167","Pepsi Bottle330ml","11129348","standard","C128","","37","12","12","12","0","50","","100","","","","","","","","1","202503050831361.jpeg","","","","","1","","1","","","","","","","","1","","","","2025-03-05 08:31:36","2025-03-05 08:31:56");
INSERT INTO products VALUES("168","Mountai Dew","58938010","standard","C128","","37","9","9","9","0","40","","100","","","","","","","","1","202503050834491.jpeg","","","","","1","","1","","","","","","","","1","","","","2025-03-05 08:34:49","2025-03-05 08:37:21");
INSERT INTO products VALUES("169","Fulu.","53427140","standard","C128","","43","17","17","17","0","40","","100","","","","","","","","1","zummXD2dvAtI.png","","","","","1","","1","","","","","","","","1","","","","2025-03-05 08:40:26","2025-03-05 08:40:53");



CREATE TABLE `purchase_product_return` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `return_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_batch_id` int(11) DEFAULT NULL,
  `variant_id` int(11) DEFAULT NULL,
  `imei_number` text DEFAULT NULL,
  `qty` double NOT NULL,
  `purchase_unit_id` int(11) NOT NULL,
  `net_unit_cost` double NOT NULL,
  `discount` double NOT NULL,
  `tax_rate` double NOT NULL,
  `tax` double NOT NULL,
  `total` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `purchases` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `reference_no` varchar(191) NOT NULL,
  `user_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `currency_id` int(11) DEFAULT NULL,
  `exchange_rate` double DEFAULT NULL,
  `item` int(11) NOT NULL,
  `total_qty` double NOT NULL,
  `total_discount` double NOT NULL,
  `total_tax` double NOT NULL,
  `total_cost` double NOT NULL,
  `order_tax_rate` double DEFAULT NULL,
  `order_tax` double DEFAULT NULL,
  `order_discount` double DEFAULT NULL,
  `shipping_cost` double DEFAULT NULL,
  `grand_total` double NOT NULL,
  `paid_amount` double NOT NULL,
  `status` int(11) NOT NULL,
  `payment_status` int(11) NOT NULL,
  `document` varchar(191) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO purchases VALUES("15","FHGTR444","47","3","3","4","1","1","10","0","0","10000","0","0","0","0","10000","10000","1","2","","","2025-02-24 00:00:00","2025-02-24 15:14:14");
INSERT INTO purchases VALUES("16","FHGTR444","47","3","3","4","1","1","50","0","0","50000","0","0","0","0","50000","50000","1","2","","","2025-02-24 00:00:00","2025-02-24 15:24:03");
INSERT INTO purchases VALUES("17","FHGTR444","47","3","3","4","1","1","5","0","0","5000","0","0","0","0","5000","5000","1","2","","","2025-02-24 00:00:00","2025-02-24 15:38:13");
INSERT INTO purchases VALUES("21","REF10","47","3","3","4","1","1","100","0","0","1000","0","0","0","0","1000","1000","1","2","","","2025-02-26 00:00:00","2025-02-26 18:11:34");



CREATE TABLE `quotations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `reference_no` varchar(191) NOT NULL,
  `user_id` int(11) NOT NULL,
  `biller_id` int(11) NOT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `customer_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `item` int(11) NOT NULL,
  `total_qty` double NOT NULL,
  `total_discount` double NOT NULL,
  `total_tax` double NOT NULL,
  `total_price` double NOT NULL,
  `order_tax_rate` double DEFAULT NULL,
  `order_tax` double DEFAULT NULL,
  `order_discount` double DEFAULT NULL,
  `shipping_cost` double DEFAULT NULL,
  `grand_total` double NOT NULL,
  `quotation_status` int(11) NOT NULL,
  `document` varchar(191) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO quotations VALUES("1","qr-20240119-085132","1","1","1","1","1","2","2","0","0","998","0","0","","","998","1","","","2024-01-19 14:51:32","2024-01-19 14:51:32");
INSERT INTO quotations VALUES("3","qr-20250218-044117","47","2","1","8","4","2","110","0","0","1429","0","0","0","0","1429","2","","","2025-02-18 16:41:17","2025-02-27 11:44:10");
INSERT INTO quotations VALUES("4","qr-20250226-071349","47","1","3","8","3","2","2","0","0","150","0","0","0","0","150","2","","","2025-02-26 19:13:49","2025-02-27 11:47:19");
INSERT INTO quotations VALUES("5","qr-20250227-104954","47","8","3","8","3","1","10","0","0","700","0","0","0","0","700","2","","","2025-02-27 10:49:54","2025-02-27 11:03:12");



CREATE TABLE `return_purchases` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `reference_no` varchar(191) NOT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `warehouse_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `purchase_id` int(11) DEFAULT NULL,
  `account_id` int(11) NOT NULL,
  `currency_id` int(11) DEFAULT NULL,
  `exchange_rate` double DEFAULT NULL,
  `item` int(11) NOT NULL,
  `total_qty` double NOT NULL,
  `total_discount` double NOT NULL,
  `total_tax` double NOT NULL,
  `total_cost` double NOT NULL,
  `order_tax_rate` double DEFAULT NULL,
  `order_tax` double DEFAULT NULL,
  `grand_total` double NOT NULL,
  `document` varchar(191) DEFAULT NULL,
  `return_note` text DEFAULT NULL,
  `staff_note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO return_purchases VALUES("1","prr-20250224-042253","3","3","47","18","1","4","1","0","0","0","0","0","0","0","0","","","","2025-02-24 16:22:53","2025-02-24 16:22:53");



CREATE TABLE `returns` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `reference_no` varchar(191) NOT NULL,
  `user_id` int(11) NOT NULL,
  `sale_id` int(11) DEFAULT NULL,
  `cash_register_id` int(11) DEFAULT NULL,
  `customer_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `biller_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `currency_id` int(11) DEFAULT NULL,
  `exchange_rate` double DEFAULT NULL,
  `item` int(11) NOT NULL,
  `total_qty` double NOT NULL,
  `total_discount` double NOT NULL,
  `total_tax` double NOT NULL,
  `total_price` double NOT NULL,
  `order_tax_rate` double DEFAULT NULL,
  `order_tax` double DEFAULT NULL,
  `grand_total` double NOT NULL,
  `document` varchar(191) DEFAULT NULL,
  `return_note` text DEFAULT NULL,
  `staff_note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `reward_point_settings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `per_point_amount` double NOT NULL,
  `minimum_amount` double NOT NULL,
  `duration` int(11) DEFAULT NULL,
  `type` varchar(191) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO reward_point_settings VALUES("1","100","100","1","Year","1","2021-06-08 15:40:15","2025-02-18 19:10:42");



CREATE TABLE `role_has_permissions` (
  `permission_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO role_has_permissions VALUES("4","1");
INSERT INTO role_has_permissions VALUES("4","2");
INSERT INTO role_has_permissions VALUES("4","4");
INSERT INTO role_has_permissions VALUES("4","6");
INSERT INTO role_has_permissions VALUES("5","1");
INSERT INTO role_has_permissions VALUES("5","2");
INSERT INTO role_has_permissions VALUES("6","1");
INSERT INTO role_has_permissions VALUES("6","2");
INSERT INTO role_has_permissions VALUES("6","4");
INSERT INTO role_has_permissions VALUES("6","6");
INSERT INTO role_has_permissions VALUES("7","1");
INSERT INTO role_has_permissions VALUES("7","2");
INSERT INTO role_has_permissions VALUES("7","4");
INSERT INTO role_has_permissions VALUES("7","6");
INSERT INTO role_has_permissions VALUES("8","1");
INSERT INTO role_has_permissions VALUES("8","2");
INSERT INTO role_has_permissions VALUES("8","4");
INSERT INTO role_has_permissions VALUES("9","1");
INSERT INTO role_has_permissions VALUES("9","2");
INSERT INTO role_has_permissions VALUES("9","4");
INSERT INTO role_has_permissions VALUES("10","1");
INSERT INTO role_has_permissions VALUES("10","2");
INSERT INTO role_has_permissions VALUES("11","1");
INSERT INTO role_has_permissions VALUES("11","2");
INSERT INTO role_has_permissions VALUES("12","1");
INSERT INTO role_has_permissions VALUES("12","2");
INSERT INTO role_has_permissions VALUES("12","4");
INSERT INTO role_has_permissions VALUES("12","6");
INSERT INTO role_has_permissions VALUES("13","1");
INSERT INTO role_has_permissions VALUES("13","2");
INSERT INTO role_has_permissions VALUES("13","4");
INSERT INTO role_has_permissions VALUES("13","6");
INSERT INTO role_has_permissions VALUES("14","1");
INSERT INTO role_has_permissions VALUES("14","2");
INSERT INTO role_has_permissions VALUES("14","6");
INSERT INTO role_has_permissions VALUES("15","1");
INSERT INTO role_has_permissions VALUES("15","2");
INSERT INTO role_has_permissions VALUES("16","1");
INSERT INTO role_has_permissions VALUES("16","2");
INSERT INTO role_has_permissions VALUES("16","6");
INSERT INTO role_has_permissions VALUES("17","1");
INSERT INTO role_has_permissions VALUES("17","2");
INSERT INTO role_has_permissions VALUES("17","6");
INSERT INTO role_has_permissions VALUES("18","1");
INSERT INTO role_has_permissions VALUES("18","2");
INSERT INTO role_has_permissions VALUES("18","6");
INSERT INTO role_has_permissions VALUES("19","1");
INSERT INTO role_has_permissions VALUES("19","2");
INSERT INTO role_has_permissions VALUES("20","1");
INSERT INTO role_has_permissions VALUES("20","2");
INSERT INTO role_has_permissions VALUES("20","4");
INSERT INTO role_has_permissions VALUES("21","1");
INSERT INTO role_has_permissions VALUES("21","2");
INSERT INTO role_has_permissions VALUES("21","4");
INSERT INTO role_has_permissions VALUES("22","1");
INSERT INTO role_has_permissions VALUES("22","2");
INSERT INTO role_has_permissions VALUES("22","4");
INSERT INTO role_has_permissions VALUES("23","1");
INSERT INTO role_has_permissions VALUES("23","2");
INSERT INTO role_has_permissions VALUES("24","1");
INSERT INTO role_has_permissions VALUES("24","2");
INSERT INTO role_has_permissions VALUES("24","4");
INSERT INTO role_has_permissions VALUES("24","6");
INSERT INTO role_has_permissions VALUES("25","1");
INSERT INTO role_has_permissions VALUES("25","2");
INSERT INTO role_has_permissions VALUES("25","4");
INSERT INTO role_has_permissions VALUES("25","6");
INSERT INTO role_has_permissions VALUES("26","1");
INSERT INTO role_has_permissions VALUES("26","2");
INSERT INTO role_has_permissions VALUES("26","6");
INSERT INTO role_has_permissions VALUES("27","1");
INSERT INTO role_has_permissions VALUES("27","2");
INSERT INTO role_has_permissions VALUES("28","1");
INSERT INTO role_has_permissions VALUES("28","2");
INSERT INTO role_has_permissions VALUES("28","4");
INSERT INTO role_has_permissions VALUES("28","6");
INSERT INTO role_has_permissions VALUES("29","1");
INSERT INTO role_has_permissions VALUES("29","2");
INSERT INTO role_has_permissions VALUES("29","4");
INSERT INTO role_has_permissions VALUES("29","6");
INSERT INTO role_has_permissions VALUES("30","1");
INSERT INTO role_has_permissions VALUES("30","2");
INSERT INTO role_has_permissions VALUES("30","6");
INSERT INTO role_has_permissions VALUES("31","1");
INSERT INTO role_has_permissions VALUES("31","2");
INSERT INTO role_has_permissions VALUES("32","1");
INSERT INTO role_has_permissions VALUES("32","2");
INSERT INTO role_has_permissions VALUES("33","1");
INSERT INTO role_has_permissions VALUES("33","2");
INSERT INTO role_has_permissions VALUES("34","1");
INSERT INTO role_has_permissions VALUES("34","2");
INSERT INTO role_has_permissions VALUES("35","1");
INSERT INTO role_has_permissions VALUES("35","2");
INSERT INTO role_has_permissions VALUES("36","1");
INSERT INTO role_has_permissions VALUES("36","2");
INSERT INTO role_has_permissions VALUES("37","1");
INSERT INTO role_has_permissions VALUES("37","2");
INSERT INTO role_has_permissions VALUES("38","1");
INSERT INTO role_has_permissions VALUES("38","2");
INSERT INTO role_has_permissions VALUES("39","1");
INSERT INTO role_has_permissions VALUES("39","2");
INSERT INTO role_has_permissions VALUES("39","6");
INSERT INTO role_has_permissions VALUES("40","1");
INSERT INTO role_has_permissions VALUES("40","2");
INSERT INTO role_has_permissions VALUES("41","1");
INSERT INTO role_has_permissions VALUES("41","2");
INSERT INTO role_has_permissions VALUES("42","1");
INSERT INTO role_has_permissions VALUES("42","2");
INSERT INTO role_has_permissions VALUES("43","1");
INSERT INTO role_has_permissions VALUES("43","2");
INSERT INTO role_has_permissions VALUES("44","1");
INSERT INTO role_has_permissions VALUES("44","2");
INSERT INTO role_has_permissions VALUES("45","1");
INSERT INTO role_has_permissions VALUES("45","2");
INSERT INTO role_has_permissions VALUES("46","1");
INSERT INTO role_has_permissions VALUES("46","2");
INSERT INTO role_has_permissions VALUES("46","6");
INSERT INTO role_has_permissions VALUES("47","1");
INSERT INTO role_has_permissions VALUES("47","2");
INSERT INTO role_has_permissions VALUES("47","6");
INSERT INTO role_has_permissions VALUES("48","1");
INSERT INTO role_has_permissions VALUES("48","2");
INSERT INTO role_has_permissions VALUES("49","1");
INSERT INTO role_has_permissions VALUES("49","2");
INSERT INTO role_has_permissions VALUES("49","6");
INSERT INTO role_has_permissions VALUES("50","1");
INSERT INTO role_has_permissions VALUES("50","2");
INSERT INTO role_has_permissions VALUES("51","1");
INSERT INTO role_has_permissions VALUES("51","2");
INSERT INTO role_has_permissions VALUES("52","1");
INSERT INTO role_has_permissions VALUES("52","2");
INSERT INTO role_has_permissions VALUES("53","1");
INSERT INTO role_has_permissions VALUES("53","2");
INSERT INTO role_has_permissions VALUES("53","6");
INSERT INTO role_has_permissions VALUES("54","1");
INSERT INTO role_has_permissions VALUES("54","2");
INSERT INTO role_has_permissions VALUES("55","1");
INSERT INTO role_has_permissions VALUES("55","2");
INSERT INTO role_has_permissions VALUES("55","4");
INSERT INTO role_has_permissions VALUES("56","1");
INSERT INTO role_has_permissions VALUES("56","2");
INSERT INTO role_has_permissions VALUES("56","4");
INSERT INTO role_has_permissions VALUES("57","1");
INSERT INTO role_has_permissions VALUES("57","2");
INSERT INTO role_has_permissions VALUES("57","4");
INSERT INTO role_has_permissions VALUES("58","1");
INSERT INTO role_has_permissions VALUES("58","2");
INSERT INTO role_has_permissions VALUES("59","1");
INSERT INTO role_has_permissions VALUES("59","2");
INSERT INTO role_has_permissions VALUES("60","1");
INSERT INTO role_has_permissions VALUES("60","2");
INSERT INTO role_has_permissions VALUES("61","1");
INSERT INTO role_has_permissions VALUES("61","2");
INSERT INTO role_has_permissions VALUES("62","1");
INSERT INTO role_has_permissions VALUES("62","2");
INSERT INTO role_has_permissions VALUES("63","1");
INSERT INTO role_has_permissions VALUES("63","2");
INSERT INTO role_has_permissions VALUES("63","4");
INSERT INTO role_has_permissions VALUES("63","6");
INSERT INTO role_has_permissions VALUES("64","1");
INSERT INTO role_has_permissions VALUES("64","2");
INSERT INTO role_has_permissions VALUES("64","4");
INSERT INTO role_has_permissions VALUES("64","6");
INSERT INTO role_has_permissions VALUES("65","1");
INSERT INTO role_has_permissions VALUES("65","2");
INSERT INTO role_has_permissions VALUES("65","6");
INSERT INTO role_has_permissions VALUES("66","1");
INSERT INTO role_has_permissions VALUES("66","2");
INSERT INTO role_has_permissions VALUES("67","1");
INSERT INTO role_has_permissions VALUES("67","2");
INSERT INTO role_has_permissions VALUES("68","1");
INSERT INTO role_has_permissions VALUES("68","2");
INSERT INTO role_has_permissions VALUES("69","1");
INSERT INTO role_has_permissions VALUES("69","2");
INSERT INTO role_has_permissions VALUES("70","1");
INSERT INTO role_has_permissions VALUES("70","2");
INSERT INTO role_has_permissions VALUES("71","1");
INSERT INTO role_has_permissions VALUES("71","2");
INSERT INTO role_has_permissions VALUES("72","1");
INSERT INTO role_has_permissions VALUES("72","2");
INSERT INTO role_has_permissions VALUES("73","1");
INSERT INTO role_has_permissions VALUES("73","2");
INSERT INTO role_has_permissions VALUES("74","1");
INSERT INTO role_has_permissions VALUES("74","2");
INSERT INTO role_has_permissions VALUES("75","1");
INSERT INTO role_has_permissions VALUES("75","2");
INSERT INTO role_has_permissions VALUES("76","1");
INSERT INTO role_has_permissions VALUES("76","2");
INSERT INTO role_has_permissions VALUES("77","1");
INSERT INTO role_has_permissions VALUES("77","2");
INSERT INTO role_has_permissions VALUES("78","1");
INSERT INTO role_has_permissions VALUES("78","2");
INSERT INTO role_has_permissions VALUES("79","1");
INSERT INTO role_has_permissions VALUES("79","2");
INSERT INTO role_has_permissions VALUES("80","1");
INSERT INTO role_has_permissions VALUES("80","2");
INSERT INTO role_has_permissions VALUES("81","1");
INSERT INTO role_has_permissions VALUES("81","2");
INSERT INTO role_has_permissions VALUES("82","1");
INSERT INTO role_has_permissions VALUES("82","2");
INSERT INTO role_has_permissions VALUES("83","1");
INSERT INTO role_has_permissions VALUES("83","2");
INSERT INTO role_has_permissions VALUES("84","1");
INSERT INTO role_has_permissions VALUES("84","2");
INSERT INTO role_has_permissions VALUES("85","1");
INSERT INTO role_has_permissions VALUES("85","2");
INSERT INTO role_has_permissions VALUES("86","1");
INSERT INTO role_has_permissions VALUES("86","2");
INSERT INTO role_has_permissions VALUES("87","1");
INSERT INTO role_has_permissions VALUES("87","2");
INSERT INTO role_has_permissions VALUES("88","1");
INSERT INTO role_has_permissions VALUES("88","2");
INSERT INTO role_has_permissions VALUES("89","1");
INSERT INTO role_has_permissions VALUES("89","2");
INSERT INTO role_has_permissions VALUES("89","4");
INSERT INTO role_has_permissions VALUES("90","1");
INSERT INTO role_has_permissions VALUES("90","2");
INSERT INTO role_has_permissions VALUES("91","1");
INSERT INTO role_has_permissions VALUES("91","2");
INSERT INTO role_has_permissions VALUES("92","1");
INSERT INTO role_has_permissions VALUES("92","2");
INSERT INTO role_has_permissions VALUES("93","1");
INSERT INTO role_has_permissions VALUES("93","2");
INSERT INTO role_has_permissions VALUES("94","1");
INSERT INTO role_has_permissions VALUES("94","2");
INSERT INTO role_has_permissions VALUES("95","1");
INSERT INTO role_has_permissions VALUES("95","2");
INSERT INTO role_has_permissions VALUES("96","1");
INSERT INTO role_has_permissions VALUES("96","2");
INSERT INTO role_has_permissions VALUES("97","1");
INSERT INTO role_has_permissions VALUES("97","2");
INSERT INTO role_has_permissions VALUES("98","1");
INSERT INTO role_has_permissions VALUES("98","2");
INSERT INTO role_has_permissions VALUES("99","1");
INSERT INTO role_has_permissions VALUES("99","2");
INSERT INTO role_has_permissions VALUES("99","6");
INSERT INTO role_has_permissions VALUES("100","1");
INSERT INTO role_has_permissions VALUES("100","2");
INSERT INTO role_has_permissions VALUES("101","1");
INSERT INTO role_has_permissions VALUES("101","2");
INSERT INTO role_has_permissions VALUES("101","6");
INSERT INTO role_has_permissions VALUES("102","1");
INSERT INTO role_has_permissions VALUES("102","2");
INSERT INTO role_has_permissions VALUES("103","1");
INSERT INTO role_has_permissions VALUES("103","2");
INSERT INTO role_has_permissions VALUES("104","1");
INSERT INTO role_has_permissions VALUES("104","2");
INSERT INTO role_has_permissions VALUES("105","1");
INSERT INTO role_has_permissions VALUES("105","2");
INSERT INTO role_has_permissions VALUES("106","1");
INSERT INTO role_has_permissions VALUES("106","4");
INSERT INTO role_has_permissions VALUES("107","1");
INSERT INTO role_has_permissions VALUES("108","1");
INSERT INTO role_has_permissions VALUES("109","1");
INSERT INTO role_has_permissions VALUES("110","1");
INSERT INTO role_has_permissions VALUES("111","1");
INSERT INTO role_has_permissions VALUES("112","1");
INSERT INTO role_has_permissions VALUES("112","6");
INSERT INTO role_has_permissions VALUES("113","1");
INSERT INTO role_has_permissions VALUES("114","1");
INSERT INTO role_has_permissions VALUES("115","1");
INSERT INTO role_has_permissions VALUES("116","1");
INSERT INTO role_has_permissions VALUES("117","1");
INSERT INTO role_has_permissions VALUES("117","6");
INSERT INTO role_has_permissions VALUES("118","1");
INSERT INTO role_has_permissions VALUES("118","6");
INSERT INTO role_has_permissions VALUES("119","1");
INSERT INTO role_has_permissions VALUES("119","6");
INSERT INTO role_has_permissions VALUES("120","1");
INSERT INTO role_has_permissions VALUES("121","1");
INSERT INTO role_has_permissions VALUES("121","6");
INSERT INTO role_has_permissions VALUES("122","1");
INSERT INTO role_has_permissions VALUES("123","1");
INSERT INTO role_has_permissions VALUES("123","6");
INSERT INTO role_has_permissions VALUES("124","1");
INSERT INTO role_has_permissions VALUES("125","1");
INSERT INTO role_has_permissions VALUES("126","1");
INSERT INTO role_has_permissions VALUES("127","1");
INSERT INTO role_has_permissions VALUES("128","1");
INSERT INTO role_has_permissions VALUES("129","1");
INSERT INTO role_has_permissions VALUES("130","1");
INSERT INTO role_has_permissions VALUES("131","1");
INSERT INTO role_has_permissions VALUES("132","1");



CREATE TABLE `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `guard_name` varchar(191) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO roles VALUES("1","Admin","admin can access all data...","web","1","2018-06-01 23:46:44","2018-06-02 23:13:05");
INSERT INTO roles VALUES("2","Owner","Staff of shop","web","1","2018-10-22 02:38:13","2022-02-01 13:13:30");
INSERT INTO roles VALUES("4","staff","staff has specific acess...","web","1","2018-06-02 00:05:27","2022-02-01 13:13:04");
INSERT INTO roles VALUES("5","Customer","","web","1","2020-11-05 06:43:16","2020-11-15 00:24:15");
INSERT INTO roles VALUES("6","Cashier","","web","1","2025-02-14 15:54:36","2025-02-14 15:54:36");
INSERT INTO roles VALUES("7","Bingo Admin","Bingo Admin","web","1","2025-02-26 20:13:43","2025-02-26 20:13:43");



CREATE TABLE `sales` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `reference_no` varchar(191) NOT NULL,
  `user_id` int(11) NOT NULL,
  `cash_register_id` int(11) DEFAULT NULL,
  `table_id` int(11) DEFAULT NULL,
  `queue` int(11) DEFAULT NULL,
  `customer_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `biller_id` int(11) DEFAULT NULL,
  `item` int(11) NOT NULL,
  `total_qty` double NOT NULL,
  `total_discount` double NOT NULL,
  `total_tax` double NOT NULL,
  `total_price` double NOT NULL,
  `grand_total` double NOT NULL,
  `currency_id` int(11) DEFAULT NULL,
  `exchange_rate` double DEFAULT NULL,
  `order_tax_rate` double DEFAULT NULL,
  `order_tax` double DEFAULT NULL,
  `order_discount_type` varchar(191) DEFAULT NULL,
  `order_discount_value` double DEFAULT NULL,
  `order_discount` double DEFAULT NULL,
  `coupon_id` int(11) DEFAULT NULL,
  `coupon_discount` double DEFAULT NULL,
  `shipping_cost` double DEFAULT NULL,
  `sale_status` int(11) NOT NULL,
  `payment_status` int(11) NOT NULL,
  `document` varchar(191) DEFAULT NULL,
  `paid_amount` double DEFAULT NULL,
  `sale_note` text DEFAULT NULL,
  `staff_note` text DEFAULT NULL,
  `woocommerce_order_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=358 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO sales VALUES("336","posr-20250315-031632","47","7","","","37","3","1","1","1","0","0","10","10","4","1","0","0","Flat","","0","","0","0","1","4","","10","","","","2025-03-15 15:16:32","2025-03-15 15:16:32");
INSERT INTO sales VALUES("337","posr-20250315-031641","47","7","","","37","3","1","1","1","0","0","10","10","4","1","0","0","Flat","","0","","0","0","1","4","","10","","","","2025-03-15 15:16:41","2025-03-15 15:16:41");
INSERT INTO sales VALUES("338","posr-20250315-031840","47","7","","","36","3","1","1","1","0","0","80","80","4","1","0","0","Flat","","0","","0","0","1","4","","80","","","","2025-03-15 15:18:40","2025-03-15 15:18:40");
INSERT INTO sales VALUES("339","posr-20250315-031906","47","7","","","36","3","1","1","1","0","0","80","80","4","1","0","0","Flat","","0","","0","0","1","4","","80","","","","2025-03-15 15:19:06","2025-03-15 15:19:06");
INSERT INTO sales VALUES("340","posr-20250315-031936","47","7","","","34","3","1","1","1","0","0","10","10","4","1","0","0","Flat","","0","","0","0","1","4","","10","","","","2025-03-15 15:19:36","2025-03-15 15:19:36");
INSERT INTO sales VALUES("341","posr-20250315-032031","47","7","","","34","3","1","1","1","0","0","10","10","4","1","0","0","Flat","","0","","0","0","1","4","","10","","","","2025-03-15 15:20:31","2025-03-15 15:20:31");
INSERT INTO sales VALUES("342","posr-20250315-032452","47","7","","","36","3","1","1","1","0","0","60","60","4","1","0","0","Flat","","0","","0","0","1","4","","60","","","","2025-03-15 15:24:52","2025-03-15 15:24:52");
INSERT INTO sales VALUES("343","posr-20250315-035556","47","7","","","36","3","1","1","1","0","0","30","30","4","1","0","0","Flat","","0","","0","0","1","4","","30","","","","2025-03-15 15:55:56","2025-03-15 15:55:56");
INSERT INTO sales VALUES("344","posr-20250315-054818","47","7","","","36","3","1","1","1","0","0","80","80","4","1","0","0","Flat","","0","","0","0","1","4","","80","","","","2025-03-15 17:48:18","2025-03-15 17:48:18");
INSERT INTO sales VALUES("345","posr-20250315-071024","47","7","","","34","3","1","1","1","0","13.33","80","80","4","1","0","0","Flat","","0","","0","0","1","4","","80","","","","2025-03-15 19:10:24","2025-03-15 19:10:24");
INSERT INTO sales VALUES("346","posr-20250315-071451","47","7","","","34","3","1","1","1","0","13.33","80","80","4","1","0","0","Flat","","0","","0","0","1","4","","80","","","","2025-03-15 19:14:51","2025-03-15 19:14:51");
INSERT INTO sales VALUES("347","posr-20250315-073230","47","7","","","36","3","1","1","1","0","0","10","10","4","1","0","0","Flat","","0","","0","0","1","4","","10","","","","2025-03-15 19:32:30","2025-03-15 19:32:30");
INSERT INTO sales VALUES("348","posr-20250315-073252","47","7","","","34","3","1","1","1","0","13.33","80","80","4","1","0","0","Flat","","0","","0","0","1","4","","80","","","","2025-03-15 19:32:52","2025-03-15 19:32:52");
INSERT INTO sales VALUES("349","posr-20250315-073328","47","7","","","36","3","1","1","1","0","13.33","80","80","4","1","0","0","Flat","","0","","0","0","1","4","","80","","","","2025-03-15 19:33:28","2025-03-15 19:33:28");
INSERT INTO sales VALUES("350","posr-20250315-092343","47","7","","","36","3","1","1","1","0","13.33","80","80","4","1","0","0","Flat","","0","","0","0","1","4","","80","","","","2025-03-15 21:23:43","2025-03-15 21:23:43");
INSERT INTO sales VALUES("351","posr-20250318-011530","47","7","","","37","3","1","1","2","0","7.08","27.08","27.08","4","1","0","0","Flat","","0","","0","0","1","4","","27.08","","","","2025-03-18 13:15:30","2025-03-18 13:15:30");
INSERT INTO sales VALUES("352","posr-20250318-011840","47","7","","","37","3","1","1","1","0","0","80","80","4","1","0","0","Flat","","0","","0","0","1","4","","80","","","","2025-03-18 13:18:40","2025-03-18 13:18:40");
INSERT INTO sales VALUES("353","posr-20250318-011913","47","7","","","36","3","1","1","1","0","0","10","10","4","1","0","0","Flat","","0","","0","0","1","4","","10","","","","2025-03-18 13:19:13","2025-03-18 13:19:13");
INSERT INTO sales VALUES("354","posr-20250319-084120","47","7","","","37","3","1","1","1","0","20.92","80","80","4","1","0","0","Flat","","0","","0","0","1","4","","80","","","","2025-03-19 20:41:20","2025-03-19 20:41:20");
INSERT INTO sales VALUES("355","posr-20250319-090118","47","7","","","34","3","1","1","1","0","20.92","80","80","4","1","0","0","Flat","","0","","0","0","1","4","","80","","","","2025-03-19 21:01:18","2025-03-19 21:01:18");
INSERT INTO sales VALUES("356","posr-20250320-032940","47","7","","","34","3","1","1","1","0","20.92","80","80","4","1","0","0","Flat","","0","","0","0","1","4","","80","","","","2025-03-20 15:29:40","2025-03-20 15:29:40");
INSERT INTO sales VALUES("357","posr-20250326-073121","47","7","","","37","3","7","2","2","0","0","60","60","4","1","0","0","Flat","","0","","0","0","1","4","","60","","","","2025-03-26 19:31:21","2025-03-26 19:31:21");



CREATE TABLE `sms_templates` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `is_default_ecommerce` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO sms_templates VALUES("1","test template","eso nije kori...","1","0","2024-05-19 08:14:12","2024-10-28 20:07:53");
INSERT INTO sms_templates VALUES("2","test template 2","fsdfsdf","0","1","2024-05-19 08:20:25","2024-10-28 20:07:53");



CREATE TABLE `stock_counts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `reference_no` varchar(191) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `category_id` varchar(191) DEFAULT NULL,
  `brand_id` varchar(191) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `type` varchar(191) NOT NULL,
  `initial_file` varchar(191) DEFAULT NULL,
  `final_file` varchar(191) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `is_adjusted` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO stock_counts VALUES("1","scr-20240825-060302","1","","","1","full","20240825-060302.csv","","","0","2024-08-25 23:03:02","2024-08-25 23:03:02");



CREATE TABLE `suppliers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `image` varchar(191) DEFAULT NULL,
  `company_name` varchar(191) NOT NULL,
  `vat_number` varchar(191) DEFAULT NULL,
  `email` varchar(191) NOT NULL,
  `phone_number` varchar(191) NOT NULL,
  `address` varchar(191) NOT NULL,
  `city` varchar(191) NOT NULL,
  `state` varchar(191) DEFAULT NULL,
  `postal_code` varchar(191) DEFAULT NULL,
  `country` varchar(191) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO suppliers VALUES("1","Abdullah","","Global Tech","31213131","abdullah@gmail.com","312313","Mirpur","Dhaka","","","Bangladesh","0","2024-01-19 13:41:37","2025-02-24 15:07:22");
INSERT INTO suppliers VALUES("2","rahmatullah","","Samsung","","info@microsoft.com","213123123","boropul, halishahr","chittagong","","","","0","2024-07-18 07:51:07","2025-02-24 15:07:29");
INSERT INTO suppliers VALUES("3","Owade J","","VCAN SMART MEALS","","owadejr09@gmail.com","0792 546625","Bondo","TTC","","","Kenya","1","2025-02-24 15:07:14","2025-02-24 15:07:14");



CREATE TABLE `tables` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `number_of_person` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO tables VALUES("1","Table 1","3","middle table","1","2024-04-21 04:58:24","2024-04-21 04:58:24");



CREATE TABLE `taxes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `rate` double NOT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `woocommerce_tax_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO taxes VALUES("1","@10","10","0","","2024-01-08 05:26:16","2025-02-19 19:21:37");
INSERT INTO taxes VALUES("2","@15","15","0","","2024-01-08 05:26:29","2025-02-19 19:21:37");
INSERT INTO taxes VALUES("3","vat 20%","20","0","","2024-04-29 12:28:49","2025-02-19 19:21:37");
INSERT INTO taxes VALUES("4","LOYALTY AS SERVICE","20","1","","2025-03-13 20:56:14","2025-03-13 20:56:14");
INSERT INTO taxes VALUES("5","BUSSINESS DEVELOPMENT","20","1","","2025-03-13 20:56:44","2025-03-13 20:56:44");
INSERT INTO taxes VALUES("6","CLIMATE-ACTION","35.4","1","","2025-03-15 09:55:37","2025-03-15 09:55:37");
INSERT INTO taxes VALUES("7","HOSPITAL-INSURANCE","16.6","1","","2025-03-15 09:55:50","2025-03-15 09:55:50");
INSERT INTO taxes VALUES("8","SOCIAL-ACTION","8","1","","2025-03-15 09:56:03","2025-03-15 09:56:03");
INSERT INTO taxes VALUES("9","INPL SMART ADVANCES","0","1","","2025-03-15 09:56:15","2025-03-15 09:56:15");
INSERT INTO taxes VALUES("10","REWARDS","0","1","","2025-03-15 09:56:24","2025-03-15 09:56:24");



CREATE TABLE `transfers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `reference_no` varchar(191) NOT NULL,
  `user_id` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `from_warehouse_id` int(11) NOT NULL,
  `to_warehouse_id` int(11) NOT NULL,
  `item` int(11) NOT NULL,
  `total_qty` double NOT NULL,
  `total_tax` double NOT NULL,
  `total_cost` double NOT NULL,
  `shipping_cost` double DEFAULT NULL,
  `grand_total` double NOT NULL,
  `document` varchar(191) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `is_sent` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `units` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `unit_code` varchar(191) NOT NULL,
  `unit_name` varchar(191) NOT NULL,
  `base_unit` int(11) DEFAULT NULL,
  `operator` varchar(191) DEFAULT NULL,
  `operation_value` double DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO units VALUES("1","pc","Piece","","*","1","1","2024-01-08 05:37:39","2024-01-08 05:37:39");
INSERT INTO units VALUES("2","dozen","Dozen","1","*","12","1","2024-01-08 05:38:27","2024-01-08 05:38:27");
INSERT INTO units VALUES("3","carton","Carton","1","*","24","1","2024-01-08 05:39:01","2024-01-08 05:39:01");
INSERT INTO units VALUES("4","kg","Kilogram","","*","1","1","2024-01-08 05:39:37","2024-01-08 05:39:37");
INSERT INTO units VALUES("5","gm","Gram","4","/","1000","1","2024-01-08 05:40:00","2024-01-08 05:40:00");
INSERT INTO units VALUES("6","Cup","Cup","","*","1","1","2025-02-19 16:52:01","2025-02-19 16:52:01");
INSERT INTO units VALUES("7","500 ml","500 ml","","*","1","1","2025-02-19 16:52:30","2025-02-19 16:52:30");
INSERT INTO units VALUES("8","1 Litre","1 Litre","","*","1","1","2025-02-19 16:52:47","2025-02-19 16:52:47");
INSERT INTO units VALUES("9","300 ML","300 ML","","*","1","1","2025-02-19 16:52:58","2025-02-19 16:52:58");
INSERT INTO units VALUES("10","1.25 L","1.25 L","","*","1","1","2025-02-19 16:53:20","2025-02-19 16:53:20");
INSERT INTO units VALUES("11","2 L","2 L","","*","1","1","2025-02-19 16:53:50","2025-02-19 16:53:50");
INSERT INTO units VALUES("12","330 ML","330 ML","","*","1","1","2025-02-19 16:54:06","2025-02-19 16:54:06");
INSERT INTO units VALUES("13","400 ML","400 ML","","*","1","1","2025-02-19 16:54:22","2025-02-19 16:54:22");
INSERT INTO units VALUES("14","350 ML","350 ML","","*","1","1","2025-02-19 16:54:31","2025-02-19 16:54:31");
INSERT INTO units VALUES("15","CHIPS 70","CHIPS 70","","*","1","1","2025-02-19 19:02:12","2025-02-19 19:02:12");
INSERT INTO units VALUES("16","CHIPS 100","CHIPS 100","","*","1","1","2025-02-19 19:04:58","2025-02-19 19:04:58");
INSERT INTO units VALUES("17","PLATE","PLATE","","*","1","1","2025-02-20 18:10:16","2025-02-20 18:10:16");
INSERT INTO units VALUES("18","Bale","bale","","*","1","1","2025-03-01 20:37:57","2025-03-01 20:37:57");



CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `password` varchar(191) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `phone` varchar(191) NOT NULL,
  `company_name` varchar(191) DEFAULT NULL,
  `role_id` int(11) NOT NULL,
  `biller_id` int(11) DEFAULT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO users VALUES("1","admin","ashfaqdev.php@gmail.com","$2a$12$UmEJxPv6lb3pc22LZ.Z40.gioOt6OEuBNAtPn.sg7h9RorQ/9zyfm","cYJmu9OE8HQIZZuvg0sURkn9cGZDRwmIOF3yhuBKtZRJ0N26kHeRXsf2jc8F","12112","lioncoders","1","","","0","1","2018-06-02 03:24:15","2025-02-14 19:35:57");
INSERT INTO users VALUES("3","dhiman da","dhiman@gmail.com","$2y$10$Fef6vu5E67nm11hX7V5a2u1ThNCQ6n9DRCvRF9TD7stk.Pmt2R6O.","5ehQM6JIfiQfROgTbB5let0Z93vjLHS7rd9QD5RPNgOxli3xdo7fykU7vtTt","212","lioncoders","1","","","0","1","2018-06-13 22:00:31","2020-11-05 07:06:51");
INSERT INTO users VALUES("6","test","test@gmail.com","$2y$10$TDAeHcVqHyCmurki0wjLZeIl1SngKX3WLOhyTiCoZG3souQfqv.LS","KpW1gYYlOFacumklO2IcRfSsbC3KcWUZzOI37gqoqM388Xie6KdhaOHIFEYm","1234","212312","4","","","0","1","2018-06-23 03:05:33","2018-06-23 03:13:45");
INSERT INTO users VALUES("8","test","test@yahoo.com","$2y$10$hlMigidZV0j2/IPkgE/xsOSb8WM2IRlsMv.1hg1NM7kfyd6bGX3hC","","31231","","4","","","0","1","2018-06-24 22:35:49","2018-07-02 01:07:39");
INSERT INTO users VALUES("9","staff","anda@gmail.com","$2y$10$kxDbnynB6mB1e1w3pmtbSOlSxy/WwbLPY5TJpMi0Opao5ezfuQjQm","EOBWOQLzRNZHj4Qo59mIDEW4z1qk7Bewt7tgTwGSnMaGlez2Xt47zb6ReIb1","3123","","4","5","1","0","1","2018-07-02 01:08:08","2025-02-14 19:35:57");
INSERT INTO users VALUES("10","abul","abul@alpha.com","$2y$10$5zgB2OOMyNBNVAd.QOQIju5a9fhNnTqPx5H6s4oFlXhNiF6kXEsPq","x7HlttI5bM0vSKViqATaowHFJkLS3PHwfvl7iJdFl5Z1SsyUgWCVbLSgAoi0","1234","anda","1","","","0","1","2018-09-07 23:44:48","2025-02-14 19:35:57");
INSERT INTO users VALUES("11","teststaff","a@a.com","$2y$10$5KNBIIhZzvvZEQEhkHaZGu.Q8bbQNfqYvYgL5N55B8Pb4P5P/b/Li","DkHDEcCA0QLfsKPkUK0ckL0CPM6dPiJytNa0k952gyTbeAyMthW3vi7IRitp","111","aa","4","5","1","0","1","2018-10-22 02:47:56","2018-10-23 02:10:56");
INSERT INTO users VALUES("12","john","john@gmail.com","$2y$10$P/pN2J/uyTYNzQy2kRqWwuSv7P2f6GE/ykBwtHdda7yci3XsfOKWe","O0f1WJBVjT5eKYl3Js5l1ixMMtoU6kqrH7hbHDx9I1UCcD9CmiSmCBzHbQZg","10001","","4","2","2","0","1","2018-12-30 00:48:37","2019-03-06 04:59:49");
INSERT INTO users VALUES("13","jjj","test@test.com","$2y$10$/Qx3gHWYWUhlF1aPfzXaCeZA7fRzfSEyCIOnk/dcC4ejO8PsoaalG","","1213","","1","","","0","1","2019-01-03 00:08:31","2019-03-03 04:02:29");
INSERT INTO users VALUES("19","shakalaka","shakalaka@gmail.com","$2y$10$ketLWT0Ib/JXpo00eJlxoeSw.7leS8V1CUGInfbyOWT4F5.Xuo7S2","","1212","Digital image","5","","","0","1","2020-11-09 00:07:16","2025-02-14 19:35:57");
INSERT INTO users VALUES("21","modon","modon@gmail.com","$2y$10$7VpoeGMkP8QCvL5zLwFW..6MYJ5MRumDLDoX.TTQtClS561rpFHY.","","2222","modon company","5","","","0","1","2020-11-13 07:12:08","2025-02-14 19:35:57");
INSERT INTO users VALUES("22","dhiman","dhiman@gmail.com","$2y$10$3mPygsC6wwnDtw/Sg85IpuExtUhgaHx52Lwp7Rz0.FNfuFdfKVpRq","","+8801111111101","lioncoders","5","","","0","1","2020-11-15 06:14:58","2025-02-14 19:35:57");
INSERT INTO users VALUES("31","mbs","mbs@gmail.com","$2y$10$6Ldm1rWEVSrlTmpjIXkeQO9KwWJz/j0FB4U.fY1oCFeax47rvttEK","","2121","","4","1","2","0","1","2021-12-29 06:40:22","2025-02-14 19:35:57");
INSERT INTO users VALUES("39","maja","maja@maja.com","$2y$10$lrMVhNDE9AuKhFrJIgG2y.zdtrCltR8/JB1okO0W8GsUcMjSFW7rW","","444555","","4","5","2","0","1","2022-09-14 04:37:21","2025-02-14 19:35:57");
INSERT INTO users VALUES("42","Tarik Iqbal","tarik_17@yahoo.co.uk","$2y$10$z2nZAsrIPrSWgPEtTY9D6.1vmkvYj4p3W3kamYvdoCDnCtlVqZp86","","","","5","","","0","1","2023-11-17 05:04:37","2025-02-14 19:35:57");
INSERT INTO users VALUES("43","support@lion-coders.com","support@lion-coders.com","$2y$10$ea.ekPLTQk0Y5087FqSbdevaN.gkEMGucgFJ13aGPEd.EqY45Y.AK","","","","5","","","0","1","2023-12-09 14:15:06","2025-02-14 19:35:57");
INSERT INTO users VALUES("44","james","jamesbond@gmail.com","$2y$10$7XCviP5GAZm6E/nlk4HQmuyw2kbhVpLbxsN6PqmNubmUKpiseGiEy","","313131","MI6","5","","","0","1","2024-01-19 13:23:28","2025-02-26 15:33:24");
INSERT INTO users VALUES("46","bkk","bkk@bkk.com","$2y$10$6FBCW.gf7tOH6ygDYLUcSeVkur1VL.iBSvGor35AxO849fJLxxZoW","","87897","","5","","","0","1","2024-06-10 10:40:15","2025-02-26 15:33:24");
INSERT INTO users VALUES("47","brian7401","briankibet7401@gmail.com","$2y$10$dMCSWq6cTahWLa1iTJJ3u.z167dJmSeTvPW3SlcBB6RjiNwoN0YAW","","0717608640","kirinyaga","1","","","1","1","2025-02-13 16:12:36","2025-02-26 15:33:24");
INSERT INTO users VALUES("48","Maurice Olunga","morrisolungah@gmail.com","$2y$10$8LUj/1l2/TVD3KWYLf3wve3Lc1IXpDFBxjzy3HEFe878IoN22ilb.","","0724992339","The Bingo Hotel","6","3","3","1","0","2025-02-14 16:20:16","2025-03-01 22:11:07");
INSERT INTO users VALUES("49","Rao","railaodinga@gmail.com","$2y$10$.OU6JFCZMI2KTIjcDt8d5eCjpjA4LKsdUkqMs.SRg328S2uc1qe3e","","072734778","","5","1","1","0","1","2025-02-15 23:14:16","2025-02-26 15:33:24");
INSERT INTO users VALUES("50","Isaac Owalo Cashier","isaac.owalo@gmail.com","$2y$10$X2luMBB5Rqov/P/ZwVfC.O9gU5QAI1MpVFnt45EszwjiXMz7yEEm2","","0707279936","The Bingo Hotel","6","3","3","1","0","2025-02-24 14:36:22","2025-02-24 14:36:22");
INSERT INTO users VALUES("51","CW","vc@gmail.com","$2y$10$eE4gwfCwknT0wYayRCh6jOTuGWQ00RW/Q/2no7L6LR3AHV4vxoAVa","","0767898876","","1","","","0","1","2025-02-24 16:11:55","2025-02-26 15:33:24");
INSERT INTO users VALUES("52","brian7401","briankibet7401@gmail.com","$2y$10$LD930w8L6aqurpUeM3ANLe2E2dZ90ug0yRal6uDgMy.2Ex94D47O2","","07176086422","","6","7","3","0","1","2025-02-26 15:35:24","2025-02-26 17:42:17");
INSERT INTO users VALUES("53","brian7401","briankibet7401@gmail.com","$2y$10$qsCyPL1Tbk8/QTwfQlI0eOg8eTieLVEAq7/gzQ2ltNARiiTzHv1nK","","07176086112","The Bingo Hotel","6","7","3","1","0","2025-02-26 17:42:53","2025-02-26 17:42:53");
INSERT INTO users VALUES("54","ISAAC VILAGECAN CASHIER","isaac.owalo2@gmail.com","$2y$10$KrPP8CyhRzJp1QdNR0YSs.oHJrU.8qFl4lpjXef9qVRV2uqkDKFJa","","0707279936","The Bingo Hotel","6","8","4","1","0","2025-02-26 20:34:29","2025-02-26 20:34:29");
INSERT INTO users VALUES("55","ESolXdSZYB","bentleimx@gmail.com","$2y$10$EZa6pGe5OwS54hj7tGqugefAYoPL69b/55UQOzU3QxzNyAILj4D1a","","7024654211","elmLkeHMrCAPC","7","8","4","0","0","2025-03-01 15:21:54","2025-03-01 15:21:54");
INSERT INTO users VALUES("56","crlWDVrVjeEMW","kassgriffma@gmail.com","$2y$10$63Ya3Xvh8100GgkQd3cC/u7ObfzqC6arXm0HxjT/80FT9kcVihjGm","","9355661956","ghWSMAwIpCCbsA","7","9","3","0","0","2025-03-04 16:44:38","2025-03-04 16:44:38");
INSERT INTO users VALUES("57","NmDAIcGgxwS","stormoneills2@gmail.com","$2y$10$J6g3Ofc.ckCM2cLt3NC...CXfv4tNeW0JdMQtpotpGmdcGsk6Q3uK","","4871534761","AGToaLNCEcf","7","9","3","0","0","2025-03-05 20:39:58","2025-03-05 20:39:58");
INSERT INTO users VALUES("58","vXZlhzAWVnLN","pmiriamp2001@gmail.com","$2y$10$.sYPECUyDJVFLqHR7TQxguePkQYtgD.1TvlbgF0TUScBcdbpMNELa","","7934109020","YzbysCHE","7","9","3","0","0","2025-03-07 04:17:05","2025-03-07 04:17:05");
INSERT INTO users VALUES("59","NTNzEphIwZCn","linfordsmithct@gmail.com","$2y$10$DQOyirVG/98GdxaQGvjjt.fslaiOcjpIIuhDEbu4b7g3tlMrnFy1O","","4224788810","ccJOMdsHL","7","9","3","0","0","2025-03-09 03:05:55","2025-03-09 03:05:55");
INSERT INTO users VALUES("60","BVrJHGCcjyJ","tranterfk@gmail.com","$2y$10$ZE918mpf1iwbdjPmL0FSTuBNpvWUaD/cnQfzNGbSP/5cKvmSJZ4GK","","6078328402","JIcYUICnOYUuL","7","9","3","0","0","2025-03-12 01:03:50","2025-03-12 01:03:50");
INSERT INTO users VALUES("61","bvrliJXuD","brenkorepi42@gmail.com","$2y$10$K9pS9WO3SKAElpVIh58pHukiCAJZlTYg8A.igLIWVsqZyWaT4BpCu","","9308823318","CYBgryYn","7","9","3","0","0","2025-03-14 16:40:08","2025-03-14 16:40:08");
INSERT INTO users VALUES("62","rkAHmXjCfwxC","einslib6@gmail.com","$2y$10$Bj3x4ZnxqnquM42CDEkqteapHIVaDatF5RILKcfQNP6XsaRuQ5lC.","","7292466947","oBaofjNgiC","7","9","3","0","0","2025-03-19 11:41:15","2025-03-19 11:41:15");
INSERT INTO users VALUES("63","tdoJVDDERyZXsS","tamsinpadillah@gmail.com","$2y$10$PAB18lU9xelOqUU6p5tONOqnFO46ZaRRIycx9jl4fcLgtOAhEJTYq","","3202673577","XZZFlzyJ","7","9","3","0","0","2025-03-20 14:07:45","2025-03-20 14:07:45");
INSERT INTO users VALUES("64","IhjWElqc","mccaelsl61@gmail.com","$2y$10$S1cVLjONszSMQWzYCVZMUOE4XxzQ93Awz3XgTg18lC8/0e5EVu8w2","","8925978465","zuNeUFVDJcBsESf","7","9","3","0","0","2025-03-21 05:13:52","2025-03-21 05:13:52");
INSERT INTO users VALUES("65","NEW ACCOUNT","almasdev2018@gmail.com","$2y$10$008bRkmNwq20G4PxKhYtXOFht90aU6thDn41RmgsIUSszHsj7pr.2","","0721927604","NEW ACCOUNT","1","","","0","0","2025-03-22 08:17:41","2025-03-22 08:17:41");
INSERT INTO users VALUES("66","xxaChSFkfTph","acogregnb@gmail.com","$2y$10$/plwPjZBC1V8n3VFy.SEKOVcoJiFd7.KftK/xCKybZjYp6.6ryou.","","8063818824","dixKWfLWGlr","7","9","3","0","0","2025-03-22 10:47:44","2025-03-22 10:47:44");
INSERT INTO users VALUES("67","buzRTbyJfCsrKb","djenarnj18@gmail.com","$2y$10$Lq4WZLf1Ys.4SXVxK79Pk.Ds6WVYG3zsa6B7zcbcYOsWYi/cZQKWW","","6564961584","dGyUgfmGenPS","7","9","3","0","0","2025-03-23 02:13:01","2025-03-23 02:13:01");
INSERT INTO users VALUES("68","ZgHPqHQkkUS","terrailynchv45@gmail.com","$2y$10$ntulethlEp8mBqG.eQ7./.Vhm5nY3A070dICY.Sd07JZ6PHVri4zC","","6792664958","yYlTTVem","7","9","3","0","0","2025-03-23 17:49:50","2025-03-23 17:49:50");
INSERT INTO users VALUES("69","RUuAVGdZu","tavaura.tong402689@yahoo.com","$2y$10$qHiDtVoZajaNY3yRRkXoye.ooqpk/LbpNZ2SXVK7C.GQotq.J0kSS","","5336065707","zVczoSoDVtGUGn","7","9","3","0","0","2025-03-24 09:31:54","2025-03-24 09:31:54");



CREATE TABLE `variants` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO variants VALUES("1","S/Red","2025-02-19 11:27:46","2025-02-19 11:27:46");
INSERT INTO variants VALUES("2","S/Green","2025-02-19 11:27:46","2025-02-19 11:27:46");
INSERT INTO variants VALUES("3","M/Red","2025-02-19 11:27:46","2025-02-19 11:27:46");
INSERT INTO variants VALUES("4","M/Green","2025-02-19 11:27:46","2025-02-19 11:27:46");
INSERT INTO variants VALUES("5","L/Red","2025-02-19 11:27:46","2025-02-19 11:27:46");
INSERT INTO variants VALUES("6","L/Green","2025-02-19 11:27:46","2025-02-19 11:27:46");
INSERT INTO variants VALUES("7","1/2","2025-03-04 20:02:05","2025-03-04 20:02:05");
INSERT INTO variants VALUES("8","greem","2025-03-04 20:10:36","2025-03-04 20:10:36");
INSERT INTO variants VALUES("9","blue","2025-03-04 20:10:36","2025-03-04 20:10:36");
INSERT INTO variants VALUES("10","yellow","2025-03-04 20:10:36","2025-03-04 20:10:36");
INSERT INTO variants VALUES("11","ree","2025-03-04 20:22:36","2025-03-04 20:22:36");



CREATE TABLE `warehouses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `phone` varchar(191) DEFAULT NULL,
  `email` varchar(191) DEFAULT NULL,
  `address` text NOT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO warehouses VALUES("1","Shop 1","97090998","ashfaqdev.php@gmail.com","london","0","2024-01-19 13:28:31","2025-02-19 16:47:38");
INSERT INTO warehouses VALUES("2","Shop 2","8098098","ashfaqdev.php@gmail.com","Liverpool","0","2024-01-19 13:28:52","2025-02-19 16:47:43");
INSERT INTO warehouses VALUES("3","THE BINGO HOTEL","0717608640","","NAIROBI","1","2025-02-14 18:08:42","2025-02-20 14:07:58");
INSERT INTO warehouses VALUES("4","VILLAGE CAN SHOP","0767898876","vc@gmail.com","17160-00100","0","2025-02-26 20:18:23","2025-03-04 08:20:54");

