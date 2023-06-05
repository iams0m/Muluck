-- 무럭 DDL 생성 코드 --

-- multi.card definition

CREATE TABLE `card` (
  `card_no` int NOT NULL AUTO_INCREMENT,
  `card_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '식물 이름',
  `card_species` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '종',
  `card_birth` date NOT NULL COMMENT '반려일',
  `card_mmti` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '식물 성향',
  `card_img` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '사진 첨부',
  `card_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '발급일',
  PRIMARY KEY (`card_no`)
) ENGINE=InnoDB AUTO_INCREMENT=231 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- muluck.community definition

CREATE TABLE `community` (
  `community_no` int NOT NULL,
  `community_category` varchar(200) NOT NULL,
  PRIMARY KEY (`community_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- muluck.`member` definition

CREATE TABLE `member` (
  `member_no` int NOT NULL AUTO_INCREMENT,
  `member_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `member_pw` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `member_email` varchar(100) NOT NULL,
  `member_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'sns로그인회원',
  `member_tel` varchar(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'sns로그인회원',
  `member_nickname` varchar(100) NOT NULL,
  `member_img` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'myprofile.png',
  `member_gender` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'U',
  `member_birthyear` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `member_manager` int DEFAULT NULL,
  PRIMARY KEY (`member_no`),
  UNIQUE KEY `member_un` (`member_id`,`member_email`,`member_tel`,`member_nickname`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- muluck.bbs definition

CREATE TABLE `bbs` (
  `bbs_no` int NOT NULL AUTO_INCREMENT,
  `bbs_title` varchar(200) NOT NULL,
  `bbs_content` text NOT NULL,
  `bbs_img` varchar(200) DEFAULT NULL,
  `member_no` int NOT NULL,
  `community_no` int NOT NULL,
  PRIMARY KEY (`bbs_no`),
  KEY `bbs_FK` (`community_no`),
  KEY `bbs_FK1` (`member_no`),
  CONSTRAINT `bbs_FK` FOREIGN KEY (`community_no`) REFERENCES `community` (`community_no`),
  CONSTRAINT `bbs_FK1` FOREIGN KEY (`member_no`) REFERENCES `member` (`member_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- muluck.bookmark definition

CREATE TABLE `bookmark` (
  `bookmark_no` int NOT NULL AUTO_INCREMENT,
  `member_no` int NOT NULL,
  `bbs_no` int NOT NULL,
  PRIMARY KEY (`bookmark_no`),
  KEY `bookmark_FK` (`bbs_no`),
  KEY `bookmark_FK_1` (`member_no`),
  CONSTRAINT `bookmark_FK` FOREIGN KEY (`bbs_no`) REFERENCES `bbs` (`bbs_no`),
  CONSTRAINT `bookmark_FK_1` FOREIGN KEY (`member_no`) REFERENCES `member` (`member_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- muluck.business definition

CREATE TABLE `business` (
  `business_no` int NOT NULL AUTO_INCREMENT COMMENT '게시판 번호',
  `business_title` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '게시글제목',
  `business_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '게시한 시간',
  `business_write` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci COMMENT '작성한 글',
  `business_image` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '이미지',
  `business_place` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '거래장소',
  `member_no` int NOT NULL COMMENT 'member테이블의 id',
  `business_choose` tinyint(1) DEFAULT NULL COMMENT '예약중 표기',
  `business_share` tinyint(1) NOT NULL COMMENT '나눔,거래?',
  PRIMARY KEY (`business_no`),
  KEY `business_FK` (`member_no`),
  CONSTRAINT `business_FK` FOREIGN KEY (`member_no`) REFERENCES `member` (`member_no`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- muluck.calendar definition

CREATE TABLE `calendar` (
  `member_no` int DEFAULT NULL,
  `calendar_id` int DEFAULT NULL,
  `calendar_start` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `calendar_end` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `calendar_title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `calendar__mood` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- plant.diary definition

CREATE TABLE `diary` (
  `diary_no` int NOT NULL AUTO_INCREMENT,
  `diary_img` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `diary_nickname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `diary_title` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `diary_contents` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `diary_mood` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `diary_date` datetime NOT NULL,
  `member_no` int DEFAULT NULL,
  `card_no` int DEFAULT NULL,
  PRIMARY KEY (`diary_no`),
  KEY `diary_FK` (`member_no`),
  KEY `diary_FK_1` (`card_no`),
  CONSTRAINT `diary_FK` FOREIGN KEY (`member_no`) REFERENCES `member` (`member_no`),
  CONSTRAINT `diary_FK_1` FOREIGN KEY (`card_no`) REFERENCES `card` (`card_no`)
) ENGINE=InnoDB AUTO_INCREMENT=142 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- muluck.follow definition

CREATE TABLE `follow` (
  `follow_no` int NOT NULL AUTO_INCREMENT,
  `follower_id` varchar(200) NOT NULL,
  `following_id` varchar(200) NOT NULL,
  `follow_management` tinyint(1) NOT NULL,
  `member_no` int NOT NULL,
  PRIMARY KEY (`follow_no`),
  KEY `follow_FK` (`member_no`),
  CONSTRAINT `follow_FK` FOREIGN KEY (`member_no`) REFERENCES `member` (`member_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- muluck.heart definition

CREATE TABLE `heart` (
  `heart_no` int NOT NULL AUTO_INCREMENT,
  `member_no` int NOT NULL,
  `bbs_no` int NOT NULL,
  PRIMARY KEY (`heart_no`),
  KEY `heart_FK` (`bbs_no`),
  KEY `heart_FK_1` (`member_no`),
  CONSTRAINT `heart_FK` FOREIGN KEY (`bbs_no`) REFERENCES `bbs` (`bbs_no`),
  CONSTRAINT `heart_FK_1` FOREIGN KEY (`member_no`) REFERENCES `member` (`member_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- muluck.reply definition

CREATE TABLE `reply` (
  `reply_no` int NOT NULL AUTO_INCREMENT,
  `reply_content` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `member_no` int NOT NULL,
  `bbs_no` int NOT NULL,
  PRIMARY KEY (`reply_no`),
  KEY `reply_FK` (`bbs_no`),
  KEY `reply_FK_1` (`member_no`),
  CONSTRAINT `reply_FK` FOREIGN KEY (`bbs_no`) REFERENCES `bbs` (`bbs_no`),
  CONSTRAINT `reply_FK_1` FOREIGN KEY (`member_no`) REFERENCES `member` (`member_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

