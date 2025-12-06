/*
SQLyog Community v13.2.0 (64 bit)
MySQL - 9.4.0 : Database - mes
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`mes` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `mes`;

/*Table structure for table `eam_inspection_item` */

CREATE TABLE `eam_inspection_item` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `inspection_item_code` varchar(50) COLLATE utf8mb4_general_ci NOT NULL COMMENT '检验项目编码',
  `inspection_item_nam` varchar(100) COLLATE utf8mb4_general_ci NOT NULL COMMENT '检验项目名称',
  `enabled` tinyint(1) NOT NULL COMMENT '启用',
  `org_code` varchar(50) COLLATE utf8mb4_general_ci NOT NULL COMMENT '组织编码',
  `org_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '组织名称',
  `remarks` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `modifier` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人',
  `modifierName` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人名称',
  `modifyTime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `org_code` (`org_code`),
  CONSTRAINT `eam_inspection_item_ibfk_1` FOREIGN KEY (`org_code`) REFERENCES `organizationmaintain` (`org_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='EAM检验项目维护表';

/*Data for the table `eam_inspection_item` */

/*Table structure for table `sample_size_code` */

CREATE TABLE `sample_size_code` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `start_range` int DEFAULT NULL,
  `end_range` int DEFAULT NULL,
  `special_level_1` char(1) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `special_level_2` char(1) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `special_level_3` char(1) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `special_level_4` char(1) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `general_level_1` char(1) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `general_level_2` char(1) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `general_level_3` char(1) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `remarks` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `modifier` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `modifierName` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `modifyTime` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='样本量字码维护表';

/*Data for the table `sample_size_code` */

/*Table structure for table `sampling_plan` */

CREATE TABLE `sampling_plan` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `sampling_plan_code` varchar(50) COLLATE utf8mb4_general_ci NOT NULL COMMENT '抽样方案编码',
  `sampling_plan_name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL COMMENT '抽样方案名称',
  `sampling_plan_type` tinyint NOT NULL COMMENT '抽样方案类型(1-自定义、2-MIL-STD-105E、3-GB/T2828.1、4-JIS Z9015-1、5-C=0、6-MIL-STD-1916 计数型、7-MIL-STD-1916 计量型、8-全检)',
  `enabled` tinyint(1) NOT NULL COMMENT '启用',
  `org_code` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '组织编码',
  `org_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '组织名称',
  `remarks` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `modifier` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人',
  `modifierName` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人名称',
  `modifyTime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `org_code` (`org_code`),
  CONSTRAINT `sampling_plan_ibfk_1` FOREIGN KEY (`org_code`) REFERENCES `organizationmaintain` (`org_code`),
  CONSTRAINT `sampling_plan_chk_1` CHECK ((`sampling_plan_type` in (1,2,3,4,5,6,7,8)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='抽样方案维护表';

/*Data for the table `sampling_plan` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
