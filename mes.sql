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

/*Table structure for table `	machiningsuspendedworkordertransfer` */

DROP TABLE IF EXISTS `	machiningsuspendedworkordertransfer`;

CREATE TABLE `	machiningsuspendedworkordertransfer` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `workOrder_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '工单编码',
  `	productionLine_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '产线编码',
  `productionLine_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '产线名称',
  `productionStatus` tinyint DEFAULT NULL COMMENT '生产状态(1：停工)',
  `product_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '产品编码',
  `product_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '产品名称',
  `productSpec` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '产品规格',
  `customer_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '客户编码',
  `customer_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '客户名称',
  `workOrderType` tinyint NOT NULL COMMENT '工单类型(0：量产  1：试做  2:客退返工)',
  `workOrderMaterialPrepareStatus` tinyint NOT NULL COMMENT '工单备料状态(0：未备料  1：首套备料中)',
  `planQty` int DEFAULT NULL COMMENT '计划数量',
  `boardSurface` tinyint DEFAULT NULL COMMENT '版面',
  `planStartTime` datetime DEFAULT NULL COMMENT '计划开始时间',
  `planEndTime` datetime DEFAULT NULL COMMENT '计划结束时间',
  `workOrderTransferStatus` tinyint NOT NULL COMMENT '工单转产状态(对于原工单，0：完工 1:停工)',
  `materialTransferType` tinyint NOT NULL COMMENT '物料转产类型（0:剩余物料全部退仓 1：可共用物料转入新工单，不可共用物料退回仓库  2：剩余物料保留给原工单 3：可共用物料归入新工单，不可共用物料保留给原工单）',
  `targetWorkOrderNo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '目的工单编码',
  `transferNo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '转产编码',
  `processSection_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '工艺段编码',
  `workshop_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '车间编码',
  `workshop_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '车间名称',
  `workOrderGroupNo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '工单组编码',
  `org_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '组织编码',
  `org_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '组织名称',
  `remarks` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `modifier` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人',
  `modifierName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人名称',
  `modifyTime` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `workOrder_code` (`workOrder_code`),
  KEY `	productionLine_code` (`	productionLine_code`),
  KEY `customer_code` (`customer_code`),
  KEY `processSection_code` (`processSection_code`),
  KEY `workshop_code` (`workshop_code`),
  KEY `org_code` (`org_code`),
  CONSTRAINT `	machiningsuspendedworkordertransfer_ibfk_1` FOREIGN KEY (`workOrder_code`) REFERENCES `workordermaintain` (`workOrder_code`),
  CONSTRAINT `	machiningsuspendedworkordertransfer_ibfk_2` FOREIGN KEY (`	productionLine_code`) REFERENCES `production_line` (`line_code`),
  CONSTRAINT `	machiningsuspendedworkordertransfer_ibfk_3` FOREIGN KEY (`customer_code`) REFERENCES `customermaintain` (`customer_code`),
  CONSTRAINT `	machiningsuspendedworkordertransfer_ibfk_4` FOREIGN KEY (`processSection_code`) REFERENCES `process_segment` (`segment_code`),
  CONSTRAINT `	machiningsuspendedworkordertransfer_ibfk_5` FOREIGN KEY (`workshop_code`) REFERENCES `workshop` (`workshop_code`),
  CONSTRAINT `	machiningsuspendedworkordertransfer_ibfk_6` FOREIGN KEY (`org_code`) REFERENCES `organizationmaintain` (`org_code`),
  CONSTRAINT `	machiningsuspendedworkordertransfer_chk_1` CHECK ((`productionStatus` = 1)),
  CONSTRAINT `	machiningsuspendedworkordertransfer_chk_2` CHECK ((`workOrderType` in (0,1,2))),
  CONSTRAINT `	machiningsuspendedworkordertransfer_chk_3` CHECK ((`workOrderMaterialPrepareStatus` in (0,1,2))),
  CONSTRAINT `	machiningsuspendedworkordertransfer_chk_4` CHECK ((`boardSurface` = 1)),
  CONSTRAINT `	machiningsuspendedworkordertransfer_chk_5` CHECK ((`workOrderTransferStatus` in (0,1))),
  CONSTRAINT `	machiningsuspendedworkordertransfer_chk_6` CHECK ((`materialTransferType` in (0,1,2,3)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `	machiningsuspendedworkordertransfer` */

/*Table structure for table `bom_general` */

DROP TABLE IF EXISTS `bom_general`;

CREATE TABLE `bom_general` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `hierarchy_level` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '阶层',
  `global_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '全局编号',
  `bom_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'BOM代码',
  `sequence_number` int NOT NULL COMMENT '序号',
  `material_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '物料编码',
  `is_main_material` tinyint NOT NULL DEFAULT '0' COMMENT '主料(0:否,1:是)',
  `main_material_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '主料编码',
  `quantity` decimal(10,4) NOT NULL COMMENT '用量',
  `placement` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '点位',
  `material_bom_version` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '物料BOM版本',
  `remarks` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `creator` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
  `creation_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifier` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人',
  `modification_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `material_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '物料名称',
  `material_specification` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '物料规格',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `global_id` (`global_id`) USING BTREE,
  KEY `fk_bom_general_material` (`material_code`) USING BTREE,
  KEY `fk_bom_general_main_material` (`main_material_code`) USING BTREE,
  CONSTRAINT `fk_bom_general_main_material` FOREIGN KEY (`main_material_code`) REFERENCES `material_info` (`material_code`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_bom_general_material` FOREIGN KEY (`material_code`) REFERENCES `material_info` (`material_code`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='BOM表（通用类）';

/*Data for the table `bom_general` */

insert  into `bom_general`(`id`,`hierarchy_level`,`global_id`,`bom_code`,`sequence_number`,`material_code`,`is_main_material`,`main_material_code`,`quantity`,`placement`,`material_bom_version`,`remarks`,`creator`,`creation_time`,`modifier`,`modification_time`,`material_name`,`material_specification`) values 
(4,'L1','BOM001','BOM-GEN-001',1,'MAT003',0,NULL,1.0000,NULL,NULL,NULL,NULL,'2025-10-26 14:26:33',NULL,'2025-10-26 14:26:33',NULL,NULL),
(5,'L2','BOM002','BOM-GEN-001',2,'MAT001',0,NULL,10.0000,NULL,NULL,NULL,NULL,'2025-10-26 14:26:33',NULL,'2025-10-26 14:26:33',NULL,NULL),
(6,'L2','BOM003','BOM-GEN-001',3,'MAT002',0,NULL,5.0000,NULL,NULL,NULL,NULL,'2025-10-26 14:26:33',NULL,'2025-10-26 14:26:33',NULL,NULL);

/*Table structure for table `bom_non_ims` */

DROP TABLE IF EXISTS `bom_non_ims`;

CREATE TABLE `bom_non_ims` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `hierarchy_level` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '阶层',
  `global_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '全局编号',
  `bom_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'BOM代码',
  `sequence_number` int NOT NULL COMMENT '序号',
  `material_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '物料编码',
  `is_main_material` tinyint NOT NULL DEFAULT '0' COMMENT '主料(0:否,1:是)',
  `main_material_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '主料编码',
  `quantity` decimal(10,4) NOT NULL COMMENT '用量',
  `placement` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '点位',
  `material_bom_version` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '物料BOM版本',
  `remarks` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `creator` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
  `creation_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifier` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人',
  `modification_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `material_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '物料名称',
  `material_specification` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '物料规格',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `global_id` (`global_id`) USING BTREE,
  KEY `fk_bom_non_ims_material` (`material_code`) USING BTREE,
  KEY `fk_bom_non_ims_main_material` (`main_material_code`) USING BTREE,
  CONSTRAINT `fk_bom_non_ims_main_material` FOREIGN KEY (`main_material_code`) REFERENCES `material_info` (`material_code`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_bom_non_ims_material` FOREIGN KEY (`material_code`) REFERENCES `material_info` (`material_code`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='BOM表（非IMS类）';

/*Data for the table `bom_non_ims` */

/*Table structure for table `bom_smt` */

DROP TABLE IF EXISTS `bom_smt`;

CREATE TABLE `bom_smt` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `hierarchy_level` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '阶层',
  `alternative_material` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '替代物料',
  `material_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '物料编码',
  `quantity` decimal(10,4) NOT NULL COMMENT '用量',
  `placement` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '点位',
  `bom_version` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'BOM版本',
  `remarks` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `creator` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
  `creation_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifier` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人',
  `modification_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `row_number` int DEFAULT NULL COMMENT '行号',
  `material_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '物料名称',
  `material_specification` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '物料规格',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_bom_smt_material` (`material_code`) USING BTREE,
  CONSTRAINT `fk_bom_smt_material` FOREIGN KEY (`material_code`) REFERENCES `material_info` (`material_code`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='BOM表（SMT类）';

/*Data for the table `bom_smt` */

insert  into `bom_smt`(`id`,`hierarchy_level`,`alternative_material`,`material_code`,`quantity`,`placement`,`bom_version`,`remarks`,`creator`,`creation_time`,`modifier`,`modification_time`,`row_number`,`material_name`,`material_specification`) values 
(4,'L1',NULL,'MAT001',1.0000,'R1',NULL,NULL,NULL,'2025-10-26 14:26:33',NULL,'2025-10-26 14:26:33',NULL,NULL,NULL),
(5,'L1',NULL,'MAT002',1.0000,'C1',NULL,NULL,NULL,'2025-10-26 14:26:33',NULL,'2025-10-26 14:26:33',NULL,NULL,NULL),
(6,'L1',NULL,'MAT003',1.0000,'U1',NULL,NULL,NULL,'2025-10-26 14:26:33',NULL,'2025-10-26 14:26:33',NULL,NULL,NULL);

/*Table structure for table `cad_maintenance` */

DROP TABLE IF EXISTS `cad_maintenance`;

CREATE TABLE `cad_maintenance` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `placement` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '点位',
  `board_surface` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '板面标识',
  `x_coordinate` decimal(10,4) DEFAULT NULL COMMENT 'X坐标',
  `y_coordinate` decimal(10,4) DEFAULT NULL COMMENT 'Y坐标',
  `angle` decimal(8,4) DEFAULT NULL COMMENT '角度',
  `remarks` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `modifier` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人',
  `modifier_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人名称',
  `modification_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='CAD维护表';

/*Data for the table `cad_maintenance` */

insert  into `cad_maintenance`(`id`,`placement`,`board_surface`,`x_coordinate`,`y_coordinate`,`angle`,`remarks`,`modifier`,`modifier_name`,`modification_time`) values 
(2,'R1','TOP',10.5000,20.3000,NULL,NULL,NULL,NULL,'2025-10-26 14:26:33'),
(3,'C1','TOP',15.2000,25.1000,NULL,NULL,NULL,NULL,'2025-10-26 14:26:33'),
(4,'U1','TOP',5.8000,30.4000,NULL,NULL,NULL,NULL,'2025-10-26 14:26:33');

/*Table structure for table `customermaintain` */

DROP TABLE IF EXISTS `customermaintain`;

CREATE TABLE `customermaintain` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `customer_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '客户编码',
  `customer_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '客户名称',
  `customerShort_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '客户简称',
  `erpCustomer_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'ERP客户编码',
  `incomingLPNLabelParsingScheme_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '来料LPN标签解析方案编码',
  `stockOutRule` tinyint NOT NULL COMMENT '出库规则(0-FIFO；1-以组织策略配置为准)',
  `materialAGranularity` int DEFAULT NULL COMMENT 'A材出库粒度(网站里都是0)',
  `materialBGranularity` int DEFAULT NULL COMMENT 'B材出库粒度(网站里都是0)',
  `materialCGranularity` int DEFAULT NULL COMMENT 'C材出库粒度(网站里都是0)',
  `enabled` tinyint NOT NULL COMMENT '启用状态(0：否  1：是)',
  `remarks` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `modifier` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人',
  `modifier_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人名称',
  `modify_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `customer_code` (`customer_code`) USING BTREE,
  UNIQUE KEY `	erpCustomer_code` (`erpCustomer_code`),
  CONSTRAINT `customermaintain_chk_1` CHECK ((`stockOutRule` in (0,1))),
  CONSTRAINT `customermaintain_chk_2` CHECK ((`enabled` in (0,1)))
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

/*Data for the table `customermaintain` */

insert  into `customermaintain`(`id`,`customer_code`,`customer_name`,`customerShort_name`,`erpCustomer_code`,`incomingLPNLabelParsingScheme_code`,`stockOutRule`,`materialAGranularity`,`materialBGranularity`,`materialCGranularity`,`enabled`,`remarks`,`modifier`,`modifier_name`,`modify_time`) values 
(1,'CUST001','广州电子科技有限公司','广州电子','ERP-CUST-001','LPN-SC001',0,0,0,0,1,'电子元器件采购','ADMIN001','管理员','2025-11-09 16:34:50'),
(2,'CUST002','深圳塑胶制品有限公司','深圳塑胶','ERP-CUST-002','LPN-SC002',1,0,0,0,1,'塑胶外壳定制','ADMIN002','管理员','2025-11-09 16:34:50'),
(3,'CUST003','杭州电器贸易有限公司','杭州电器','ERP-CUST-003','LPN-SC003',0,0,0,0,1,'电器产品经销商','ADMIN001','管理员','2025-11-09 16:34:50'),
(4,'CUST004','北京通信设备有限公司','北京通信','ERP-CUST-004','LPN-SC004',1,0,0,0,1,'通信配件采购商','ADMIN002','管理员','2025-11-09 16:34:50');

/*Table structure for table `equipment_info` */

DROP TABLE IF EXISTS `equipment_info`;

CREATE TABLE `equipment_info` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `global_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '全局编号',
  `model_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '设备型号编码',
  `equipment_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '设备编码',
  `equipment_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '设备名称',
  `factory_serial_number` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '出厂序列号',
  `supplier_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '供应商编码',
  `manufacturer_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '制造商编码',
  `asset_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '资产编码',
  `workshop_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '车间编码',
  `production_line_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '产线编码',
  `workstation_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '工位编码',
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '闲置' COMMENT '状态',
  `scrap_time` datetime DEFAULT NULL COMMENT '报废时间',
  `production_date` date DEFAULT NULL COMMENT '生产日期',
  `purchase_date` date DEFAULT NULL COMMENT '购买日期',
  `installation_date` datetime DEFAULT NULL COMMENT '安装日期',
  `last_maintenance_date` datetime DEFAULT NULL COMMENT '最后保养日期',
  `maintenance_usage_count` int DEFAULT '0' COMMENT '保养后使用次数',
  `total_usage_count` int DEFAULT '0' COMMENT '总使用次数',
  `iot_equipment_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'IOT设备编码',
  `ibox_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'IBOX编码',
  `online` tinyint DEFAULT '0' COMMENT '联机(0:否,1:是)',
  `process_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '工序编码',
  `ex1_wp_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'column.ex1_wp_code',
  `internal_calibration_time` date DEFAULT NULL COMMENT '内部校准时间',
  `external_calibration_time` date DEFAULT NULL COMMENT '外部校准时间',
  `baking_temperature` decimal(10,2) DEFAULT NULL COMMENT '烘烤温度',
  `warehouse_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '仓库编码',
  `storage_location_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '储位编码',
  `sick_operation` tinyint DEFAULT '0' COMMENT '带病作业(0:否,1:是)',
  `recent_inspection_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '最近已检类型',
  `source` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '来源',
  `enabled` tinyint NOT NULL DEFAULT '1' COMMENT '启用(0:否,1:是)',
  `remarks` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `creator` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
  `creator_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人名称',
  `creation_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifier` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人',
  `modifier_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人名称',
  `modification_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `organization_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '组织名称',
  `supplier_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '供应商名称',
  `manufacturer_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '制造商名称',
  `workshop_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '车间名称',
  `production_line_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '产线名称',
  `workstation_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '工位名称',
  `warehouse_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '仓库名称',
  `task_limit` int DEFAULT '0' COMMENT '任务数上限',
  `model_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '设备型号名称',
  `special_classification` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '特殊分类',
  `virtual_model` tinyint DEFAULT '0' COMMENT '虚拟型号(0:否,1:是)',
  `agv_model_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'AGV模型编码',
  `agv_model_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'AGV模型名称',
  `agv_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'AGV类型',
  `record_original_production_data` tinyint DEFAULT '0' COMMENT '记录原始生产数据(0:否,1:是)',
  `record_work_order_production_count` tinyint DEFAULT '0' COMMENT '记工单生产数(0:否,1:是)',
  `feeder_cross_prevention` tinyint DEFAULT '0' COMMENT '供料器交叉防错(0:否,1:是)',
  `smart_feeder_auto_loading_mode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '智能供料器自动上料模式',
  `work_center_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '工作中心编码',
  `work_center_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '工作中心名称',
  `responsible_person` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '责任人',
  `responsible_person_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '责任人名称',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `global_id` (`global_id`) USING BTREE,
  UNIQUE KEY `uk_equipment_code` (`equipment_code`) USING BTREE,
  KEY `fk_equipment_model` (`model_code`) USING BTREE,
  KEY `fk_equipment_warehouse` (`warehouse_code`) USING BTREE,
  KEY `fk_equipment_storage_location` (`storage_location_code`) USING BTREE,
  KEY `fk_equipment_workshop` (`workshop_code`) USING BTREE,
  KEY `fk_equipment_production_line` (`production_line_code`) USING BTREE,
  CONSTRAINT `fk_equipment_model` FOREIGN KEY (`model_code`) REFERENCES `equipment_model` (`model_code`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_equipment_production_line` FOREIGN KEY (`production_line_code`) REFERENCES `production_line` (`line_code`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_equipment_storage_location` FOREIGN KEY (`storage_location_code`) REFERENCES `storage_location` (`location_code`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_equipment_warehouse` FOREIGN KEY (`warehouse_code`) REFERENCES `warehouse` (`warehouse_code`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_equipment_workshop` FOREIGN KEY (`workshop_code`) REFERENCES `workshop` (`workshop_code`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='设备信息维护表';

/*Data for the table `equipment_info` */

insert  into `equipment_info`(`id`,`global_id`,`model_code`,`equipment_code`,`equipment_name`,`factory_serial_number`,`supplier_code`,`manufacturer_code`,`asset_code`,`workshop_code`,`production_line_code`,`workstation_code`,`status`,`scrap_time`,`production_date`,`purchase_date`,`installation_date`,`last_maintenance_date`,`maintenance_usage_count`,`total_usage_count`,`iot_equipment_code`,`ibox_code`,`online`,`process_code`,`ex1_wp_code`,`internal_calibration_time`,`external_calibration_time`,`baking_temperature`,`warehouse_code`,`storage_location_code`,`sick_operation`,`recent_inspection_type`,`source`,`enabled`,`remarks`,`creator`,`creator_name`,`creation_time`,`modifier`,`modifier_name`,`modification_time`,`organization_name`,`supplier_name`,`manufacturer_name`,`workshop_name`,`production_line_name`,`workstation_name`,`warehouse_name`,`task_limit`,`model_name`,`special_classification`,`virtual_model`,`agv_model_code`,`agv_model_name`,`agv_type`,`record_original_production_data`,`record_work_order_production_count`,`feeder_cross_prevention`,`smart_feeder_auto_loading_mode`,`work_center_code`,`work_center_name`,`responsible_person`,`responsible_person_name`) values 
(1,'1','EM001','EQ001','贴片机1号',NULL,NULL,NULL,NULL,'WS001','PL001',NULL,'闲置',NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,1,NULL,NULL,NULL,'2025-10-26 14:26:33',NULL,NULL,'2025-10-26 14:26:33',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL,NULL,NULL,0,0,0,NULL,NULL,NULL,NULL,NULL),
(2,'2','EM002','EQ002','回流焊炉1号',NULL,NULL,NULL,NULL,'WS001','PL001',NULL,'闲置',NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,1,NULL,NULL,NULL,'2025-10-26 14:26:33',NULL,NULL,'2025-10-26 14:26:33',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL,NULL,NULL,0,0,0,NULL,NULL,NULL,NULL,NULL),
(3,'3','EM003','EQ003','测试仪1号',NULL,NULL,NULL,NULL,'WS003','PL003',NULL,'闲置',NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,1,NULL,NULL,NULL,'2025-10-26 14:26:33',NULL,NULL,'2025-10-26 14:26:33',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL,NULL,NULL,0,0,0,NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `equipment_model` */

DROP TABLE IF EXISTS `equipment_model`;

CREATE TABLE `equipment_model` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `model_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '设备型号编码',
  `model_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '设备型号名称',
  `category_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '设备分类编码',
  `category_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '设备分类名称',
  `special_classification` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '特殊分类',
  `program_parsing_scheme` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '程序解析方案',
  `virtual_model` tinyint DEFAULT '0' COMMENT '虚拟型号(0:否,1:是)',
  `control_points` tinyint DEFAULT '0' COMMENT '管控点位(0:否,1:是)',
  `enable_inspection` tinyint DEFAULT '0' COMMENT '设备启用点检(0:否,1:是)',
  `need_calibration` tinyint DEFAULT '0' COMMENT '需校准(0:否,1:是)',
  `inspection_item_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '检验项目编码',
  `enabled` tinyint NOT NULL DEFAULT '1' COMMENT '启用(0:否,1:是)',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `model_code` (`model_code`) USING BTREE,
  UNIQUE KEY `uk_model_code` (`model_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='设备型号维护表';

/*Data for the table `equipment_model` */

insert  into `equipment_model`(`id`,`model_code`,`model_name`,`category_code`,`category_name`,`special_classification`,`program_parsing_scheme`,`virtual_model`,`control_points`,`enable_inspection`,`need_calibration`,`inspection_item_code`,`enabled`) values 
(1,'EM001','贴片机-X100',NULL,'SMT设备',NULL,NULL,0,0,0,0,NULL,1),
(2,'EM002','回流焊炉',NULL,'焊接设备',NULL,NULL,0,0,0,0,NULL,1),
(3,'EM003','测试仪',NULL,'测试设备',NULL,NULL,0,0,0,0,NULL,1);

/*Table structure for table `exception_info` */

DROP TABLE IF EXISTS `exception_info`;

CREATE TABLE `exception_info` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `workorder_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '未处理',
  `exception_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `exception_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `lpn` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `exception_value` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `workorder_code` (`workorder_code`) USING BTREE,
  CONSTRAINT `exception_info_ibfk_1` FOREIGN KEY (`workorder_code`) REFERENCES `smt_dashboard` (`workorder_code`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

/*Data for the table `exception_info` */

insert  into `exception_info`(`id`,`workorder_code`,`status`,`exception_name`,`exception_desc`,`lpn`,`exception_value`) values 
(1,'MO230112015-SMT','已处理','抛料异常','供料器位置抛料过多','LPN001','12'),
(2,'MO230112015-SMT','未处理','设备停机','SPI设备故障','LPN002','2');

/*Table structure for table `exceptioninfomaintain` */

DROP TABLE IF EXISTS `exceptioninfomaintain`;

CREATE TABLE `exceptioninfomaintain` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `exception_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '异常编码',
  `exception_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '异常名称',
  `exceptionType_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '异常类型编码',
  `exceptionType_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '异常类型名称',
  `	exceptionCategory` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '异常分类',
  `	checkInType` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '签到类型',
  `managementMethod` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '管理方式',
  `controlType` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '管控类型',
  `source` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '来源',
  `enabled` tinyint DEFAULT NULL COMMENT '启用(0：否  1：是)',
  `org_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '组织编码',
  `org_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '组织名称',
  `modifier` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人',
  `modifierName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人名称',
  `modifyTime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `org_code` (`org_code`) USING BTREE,
  CONSTRAINT `exceptioninfomaintain_ibfk_1` FOREIGN KEY (`org_code`) REFERENCES `organizationmaintain` (`org_code`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `exceptioninfomaintain_chk_1` CHECK ((`exception_name` = _utf8mb4'人员在岗超时')),
  CONSTRAINT `exceptioninfomaintain_chk_2` CHECK ((`source` = _utf8mb4'固定项')),
  CONSTRAINT `exceptioninfomaintain_chk_3` CHECK ((`enabled` in (0,1)))
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

/*Data for the table `exceptioninfomaintain` */

insert  into `exceptioninfomaintain`(`id`,`exception_code`,`exception_name`,`exceptionType_code`,`exceptionType_name`,`	exceptionCategory`,`	checkInType`,`managementMethod`,`controlType`,`source`,`enabled`,`org_code`,`org_name`,`modifier`,`modifierName`,`modifyTime`) values 
(1,'EXP001','人员在岗超时','EX001','人员管理异常','人事管理类','线下签到','警告提醒','严格管控','固定项',1,'ORG001','电子制造事业部',NULL,'管理员','2025-11-09 18:26:19'),
(12,'EXP002','人员在岗超时','EX001','人员管理异常','人事管理类','线上打卡','限期整改','常规管控','固定项',1,'ORG002','塑胶加工事业部',NULL,'管理员','2025-11-09 18:26:19'),
(13,'EXP003','人员在岗超时','EX001','人员管理异常','人事管理类','双签验证','绩效关联','严格管控','固定项',1,'ORG003','通信配件事业部',NULL,'管理员','2025-11-09 18:26:19'),
(14,'EXP004','人员在岗超时','EX001','人员管理异常','人事管理类','指纹签到','通报批评','常规管控','固定项',0,'ORG004','综合管理部',NULL,'管理员','2025-11-09 18:26:19');

/*Table structure for table `feeder_throw` */

DROP TABLE IF EXISTS `feeder_throw`;

CREATE TABLE `feeder_throw` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `workorder_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `material_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `device_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `position` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `throw_qty` int NOT NULL DEFAULT '0',
  `throw_rate` decimal(5,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `workorder_code` (`workorder_code`) USING BTREE,
  CONSTRAINT `feeder_throw_ibfk_1` FOREIGN KEY (`workorder_code`) REFERENCES `smt_dashboard` (`workorder_code`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

/*Data for the table `feeder_throw` */

insert  into `feeder_throw`(`id`,`workorder_code`,`material_code`,`device_code`,`position`,`throw_qty`,`throw_rate`) values 
(1,'MO230112015-SMT','08-3201','LINE1-M1','1R-7',19,327.59),
(2,'MO230112015-SMT','100003','LINE1-M1','1R-7',3,327.59),
(3,'MO230112015-SMT','08-4006','LINE1-M2','1R-27',1,66.67);

/*Table structure for table `finetuningmasterlist` */

DROP TABLE IF EXISTS `finetuningmasterlist`;

CREATE TABLE `finetuningmasterlist` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `fineTuning_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '微调编码',
  `fineTuningType` tinyint NOT NULL COMMENT '微调类型(0:不管控上料调整；1:SKU调整；2:自动备料/上料调整；3:增加主料)',
  `workOrder_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '工单编码',
  `product_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '产品编码',
  `product_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '产品名称',
  `product_specification` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '产品规格',
  `material_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '物料编码',
  `material_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '物料名称',
  `material_specification` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '物料规格',
  `org_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '组织编码',
  `org_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '组织名称',
  `remarks` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `	modifier` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人',
  `modifier_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人名称',
  `modify_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`,`fineTuning_code`) USING BTREE,
  UNIQUE KEY `uk_FineTurningCode` (`fineTuning_code`) USING BTREE,
  KEY `material_code` (`material_code`) USING BTREE,
  KEY `workOrder_code` (`workOrder_code`) USING BTREE,
  KEY `org_code` (`org_code`) USING BTREE,
  CONSTRAINT `finetuningmasterlist_ibfk_1` FOREIGN KEY (`material_code`) REFERENCES `material_info` (`material_code`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `finetuningmasterlist_ibfk_2` FOREIGN KEY (`workOrder_code`) REFERENCES `workordermaintain` (`workOrder_code`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `finetuningmasterlist_ibfk_3` FOREIGN KEY (`org_code`) REFERENCES `organizationmaintain` (`org_code`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `finetuningmasterlist_chk_1` CHECK ((`fineTuningType` in (0,1,2,3)))
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

/*Data for the table `finetuningmasterlist` */

insert  into `finetuningmasterlist`(`id`,`fineTuning_code`,`fineTuningType`,`workOrder_code`,`product_code`,`product_name`,`product_specification`,`material_code`,`material_name`,`material_specification`,`org_code`,`org_name`,`remarks`,`	modifier`,`modifier_name`,`modify_time`) values 
(1,'FT001',0,'WO2024001','MAT001','贴片电阻','0402 10KΩ ±1%','MAT001','陶瓷电阻体','0402规格','ORG001','电子制造事业部','上料数量微调，适配量产需求',NULL,'管理员','2025-11-09 18:26:19'),
(2,'FT002',1,'WO2024002','MAT002','路由器外壳','ABS材质 白色 通用型','MAT002','ABS塑料颗粒','一级纯度','ORG002','塑胶加工事业部','SKU编码匹配调整，适配新物料批次',NULL,'管理员','2025-11-09 18:26:19'),
(3,'FT003',2,'WO2024003','MAT003','电源适配器','220V转12V 3A','MAT003','电源接口端子','12V专用','ORG003','电子制造事业部','自动备料参数调整，提升上料效率',NULL,'管理员','2025-11-09 18:26:19');

/*Table structure for table `finished_product_inventory` */

DROP TABLE IF EXISTS `finished_product_inventory`;

CREATE TABLE `finished_product_inventory` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `product_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '产品编码',
  `warehouse_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '仓库编码',
  `storage_location_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '储位编码',
  `batch_number` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '批次号',
  `workorder_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '生产工单',
  `total_quantity` decimal(15,4) NOT NULL DEFAULT '0.0000' COMMENT '总数量',
  `available_quantity` decimal(15,4) NOT NULL DEFAULT '0.0000' COMMENT '可用数量',
  `locked_quantity` decimal(15,4) NOT NULL DEFAULT '0.0000' COMMENT '锁定数量',
  `allocated_quantity` decimal(15,4) NOT NULL DEFAULT '0.0000' COMMENT '已分配数量',
  `unit` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '单位',
  `production_date` date DEFAULT NULL COMMENT '生产日期',
  `expiry_date` date DEFAULT NULL COMMENT '有效期至',
  `quality_status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '合格' COMMENT '质量状态(合格,不合格,待检)',
  `inventory_status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '正常' COMMENT '库存状态(正常,冻结,待处理)',
  `customer_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '客户编码',
  `last_in_time` datetime DEFAULT NULL COMMENT '最后入库时间',
  `last_out_time` datetime DEFAULT NULL COMMENT '最后出库时间',
  `remarks` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `creator` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
  `creator_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人名称',
  `creation_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifier` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人',
  `modifier_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人名称',
  `modification_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_product_batch_location` (`product_code`,`batch_number`,`warehouse_code`,`storage_location_code`) USING BTREE,
  KEY `idx_product_code` (`product_code`) USING BTREE,
  KEY `idx_warehouse_code` (`warehouse_code`) USING BTREE,
  KEY `idx_batch_number` (`batch_number`) USING BTREE,
  KEY `idx_workorder_code` (`workorder_code`) USING BTREE,
  KEY `idx_customer_code` (`customer_code`) USING BTREE,
  KEY `fk_fpi_storage_location` (`storage_location_code`) USING BTREE,
  CONSTRAINT `fk_fpi_customer` FOREIGN KEY (`customer_code`) REFERENCES `customermaintain` (`customer_code`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_fpi_product` FOREIGN KEY (`product_code`) REFERENCES `material_info` (`material_code`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_fpi_storage_location` FOREIGN KEY (`storage_location_code`) REFERENCES `storage_location` (`location_code`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_fpi_warehouse` FOREIGN KEY (`warehouse_code`) REFERENCES `warehouse` (`warehouse_code`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_fpi_workorder` FOREIGN KEY (`workorder_code`) REFERENCES `workordermaintain` (`workOrder_code`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='成品库存表';

/*Data for the table `finished_product_inventory` */

insert  into `finished_product_inventory`(`id`,`product_code`,`warehouse_code`,`storage_location_code`,`batch_number`,`workorder_code`,`total_quantity`,`available_quantity`,`locked_quantity`,`allocated_quantity`,`unit`,`production_date`,`expiry_date`,`quality_status`,`inventory_status`,`customer_code`,`last_in_time`,`last_out_time`,`remarks`,`creator`,`creator_name`,`creation_time`,`modifier`,`modifier_name`,`modification_time`) values 
(6,'MAT003','WH002','LOC001','FPBATCH2025001','WO2024001',500.0000,450.0000,30.0000,20.0000,'PCS','2025-01-20','2026-01-20','合格','正常','CUST001','2025-01-25 16:00:00','2025-02-01 10:30:00','成品入库','admin','系统管理员','2025-11-21 11:24:54',NULL,NULL,'2025-11-21 11:24:54'),
(7,'MAT003','WH002','LOC002','FPBATCH2025002','WO2024002',300.0000,250.0000,25.0000,25.0000,'PCS','2025-02-15','2026-02-15','合格','正常','CUST002','2025-02-20 14:15:00','2025-02-25 09:45:00','客户订单','admin','系统管理员','2025-11-21 11:24:54',NULL,NULL,'2025-11-21 11:24:54'),
(8,'MAT003','WH003','LOC003','FPBATCH2025003','WO2024003',200.0000,180.0000,10.0000,10.0000,'PCS','2025-03-10','2026-03-10','待检','待处理','CUST003','2025-03-15 11:30:00',NULL,'新生产批次','admin','系统管理员','2025-11-21 11:24:54',NULL,NULL,'2025-11-21 11:24:54'),
(9,'MAT003','WH002','LOC001','FPBATCH2025004','WO2024001',400.0000,350.0000,30.0000,20.0000,'PCS','2025-04-05','2026-04-05','合格','正常','CUST001','2025-04-10 10:00:00','2025-04-15 14:20:00','常规生产','admin','系统管理员','2025-11-21 11:24:54',NULL,NULL,'2025-11-21 11:24:54'),
(10,'MAT003','WH003','LOC002','FPBATCH2025005','WO2024002',350.0000,300.0000,30.0000,20.0000,'PCS','2025-05-20','2026-05-20','合格','冻结','CUST002','2025-05-25 13:45:00','2025-05-28 16:10:00','质量检查','admin','系统管理员','2025-11-21 11:24:54',NULL,NULL,'2025-11-21 11:24:54');

/*Table structure for table `generalcompletedmaterialtransfer` */

DROP TABLE IF EXISTS `generalcompletedmaterialtransfer`;

CREATE TABLE `generalcompletedmaterialtransfer` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `workOrder_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '工单编码',
  `erpWorkOrder_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'ERP工单编码',
  `productionStatus` tinyint DEFAULT NULL COMMENT '生产状态(1：完工)',
  `product_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '产品编码',
  `product_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '产品名称',
  `productSpec` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '产品规格',
  `materialProcessingCompleted` tinyint NOT NULL COMMENT '物料处理完毕(0：否  1：是)',
  `customer_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '客户编码',
  `customer_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '客户名称',
  `planQty` int DEFAULT NULL COMMENT '计划数量',
  `totalProductionQty` int DEFAULT NULL COMMENT '总生产数量',
  `productionLine_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '产线编码',
  `productionLine_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '产线名称',
  `planStartTime` datetime DEFAULT NULL COMMENT '计划开始时间',
  `planEndTime` datetime DEFAULT NULL COMMENT '计划结束时间',
  `processSection_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '工艺段编码',
  `processSection_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '工艺段名称',
  `processSectionCategory` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '工艺段类别',
  `workshop_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '车间编码',
  `workshop_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '车间名称',
  `boardSurface` tinyint DEFAULT NULL COMMENT '版面(1-整体)',
  `outsourcing` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '外协',
  `supplier_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '供应商编码',
  `supplier_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '供应商名称',
  `org_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '组织编码',
  `org_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '组织名称',
  `remarks` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `modifier` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人',
  `modifierName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人名称',
  `modifyTime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `workOrder_code` (`workOrder_code`) USING BTREE,
  KEY `productionLine_code` (`productionLine_code`) USING BTREE,
  KEY `processSection_code` (`processSection_code`) USING BTREE,
  KEY `workshop_code` (`workshop_code`) USING BTREE,
  KEY `customer_code` (`customer_code`) USING BTREE,
  KEY `supplier_code` (`supplier_code`) USING BTREE,
  CONSTRAINT `generalcompletedmaterialtransfer_ibfk_1` FOREIGN KEY (`workOrder_code`) REFERENCES `workordermaintain` (`workOrder_code`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `generalcompletedmaterialtransfer_ibfk_2` FOREIGN KEY (`customer_code`) REFERENCES `customermaintain` (`customer_code`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `generalcompletedmaterialtransfer_ibfk_3` FOREIGN KEY (`productionLine_code`) REFERENCES `production_line` (`line_code`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `generalcompletedmaterialtransfer_ibfk_4` FOREIGN KEY (`processSection_code`) REFERENCES `process_segment` (`segment_code`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `generalcompletedmaterialtransfer_ibfk_5` FOREIGN KEY (`workshop_code`) REFERENCES `workshop` (`workshop_code`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `generalcompletedmaterialtransfer_ibfk_6` FOREIGN KEY (`customer_code`) REFERENCES `customermaintain` (`customer_code`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `generalcompletedmaterialtransfer_ibfk_7` FOREIGN KEY (`supplier_code`) REFERENCES `suppliermaintain` (`supplier_code`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `generalcompletedmaterialtransfer_chk_1` CHECK ((`productionStatus` = 1)),
  CONSTRAINT `generalcompletedmaterialtransfer_chk_2` CHECK ((`materialProcessingCompleted` in (0,1))),
  CONSTRAINT `generalcompletedmaterialtransfer_chk_3` CHECK ((`boardSurface` = 1))
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

/*Data for the table `generalcompletedmaterialtransfer` */

insert  into `generalcompletedmaterialtransfer`(`id`,`workOrder_code`,`erpWorkOrder_code`,`productionStatus`,`product_code`,`product_name`,`productSpec`,`materialProcessingCompleted`,`customer_code`,`customer_name`,`planQty`,`totalProductionQty`,`productionLine_code`,`productionLine_name`,`planStartTime`,`planEndTime`,`processSection_code`,`processSection_name`,`processSectionCategory`,`workshop_code`,`workshop_name`,`boardSurface`,`outsourcing`,`supplier_code`,`supplier_name`,`org_code`,`org_name`,`remarks`,`modifier`,`modifierName`,`modifyTime`) values 
(1,'WO2024001','ERP-WO-001',1,'PROD001','贴片电阻','0402 10KΩ ±1%',1,'CUST001','广州电子科技有限公司',5000,5000,'PL001','SMT生产线1','2025-12-12 08:00:00','2025-12-13 18:00:00','PS001','SMT工艺段','电子装配','WS001','电子车间',1,'否',NULL,NULL,'ORG001','电子制造事业部',NULL,'USER001','张三','2025-12-23 18:30:00'),
(4,'WO2024003','ERP-WO-003',1,'PROD005','USB Type-C连接器','10Gbps 防水型',1,'CUST004','北京通信设备有限公司',2000,2000,'PL003','连接器生产线4','2025-12-05 08:30:00','2025-12-06 17:30:00','PS003','连接器装配工艺段','通信配件','WS002','通信车间',1,'是',NULL,NULL,'ORG003','通信配件事业部',NULL,'USER004','赵六','2025-12-25 18:00:00'),
(6,'WO2024002','ERP-WO-002',1,'PROD010','精密传动齿轮','合金钢 φ30mm 模数2',0,'CUST004','北京通信设备有限公司',200,180,'PL002','精密加工生产线2','2025-12-09 09:00:00','2025-12-10 16:00:00','PS002','精密加工工艺段','机械加工','WS003','机械加工车间',1,'否',NULL,NULL,'ORG004','精密制造事业部',NULL,'USER004','赵六','2025-12-24 16:30:00');

/*Table structure for table `generalpreproductiontransfer` */

DROP TABLE IF EXISTS `generalpreproductiontransfer`;

CREATE TABLE `generalpreproductiontransfer` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `workOrder_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '工单编码',
  `productionLine_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '产线编码',
  `productionLine_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '产线名称',
  `productionStatus` tinyint NOT NULL COMMENT '生产状态(0：在产  1：清尾  )',
  `product_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '产品编码',
  `product_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '产品名称',
  `	productSpec` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '产品规格',
  `customer_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '客户编码',
  `customer_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '客户名称',
  `workOrderType` tinyint NOT NULL COMMENT '工单类型(0：量产  1：试做  )',
  `workOrderMaterialPrepareStatus` tinyint NOT NULL COMMENT '工单备料状态(0：未备料  1：首套备料中)',
  `planQty` int DEFAULT NULL COMMENT '计划数量',
  `planStartTime` datetime DEFAULT NULL COMMENT '计划开始时间',
  `planEndTime` datetime DEFAULT NULL COMMENT '计划结束时间',
  `workOrderTransferStatus` tinyint NOT NULL COMMENT '工单转产状态(对于原工单，0：完工)',
  `materialTransferType` tinyint NOT NULL COMMENT '物料转产类型(3：可共用物料归入新工单，不可共用物料保留给原工单)',
  `retainMaterialFullUnbind` tinyint NOT NULL COMMENT '保留物料全部解绑(0：不选中  1：选中)',
  `sharedMaterialFullUnbind` tinyint NOT NULL COMMENT '共用物料全部解绑(0：不选中  1：选中)',
  `fixtureTransferType` tinyint NOT NULL COMMENT '极治具转产类型(0：全部下线)',
  `personnelTransferType` tinyint NOT NULL COMMENT '岗位人员转产类型(0：全部下岗)',
  `	targetWorkOrderNo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '目的工单编码',
  `transferNo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '转产编码',
  `processSection_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '工艺段编码',
  `workshop_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '车间编码',
  `workshop_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '车间名称',
  `	workOrderGroupNo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '工单组编码',
  `org_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '组织编码',
  `org_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '组织名称',
  `remarks` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `modifier` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人',
  `modifierName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人名称',
  `modifyTime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `workOrder_code` (`workOrder_code`) USING BTREE,
  KEY `productionLine_code` (`productionLine_code`) USING BTREE,
  KEY `customer_code` (`customer_code`) USING BTREE,
  KEY `processSection_code` (`processSection_code`) USING BTREE,
  KEY `workshop_code` (`workshop_code`) USING BTREE,
  KEY `org_code` (`org_code`) USING BTREE,
  CONSTRAINT `generalpreproductiontransfer_ibfk_1` FOREIGN KEY (`workOrder_code`) REFERENCES `workordermaintain` (`workOrder_code`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `generalpreproductiontransfer_ibfk_2` FOREIGN KEY (`productionLine_code`) REFERENCES `production_line` (`line_code`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `generalpreproductiontransfer_ibfk_3` FOREIGN KEY (`customer_code`) REFERENCES `customermaintain` (`customer_code`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `generalpreproductiontransfer_ibfk_4` FOREIGN KEY (`processSection_code`) REFERENCES `process_segment` (`segment_code`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `generalpreproductiontransfer_ibfk_5` FOREIGN KEY (`workshop_code`) REFERENCES `workshop` (`workshop_code`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `generalpreproductiontransfer_ibfk_6` FOREIGN KEY (`org_code`) REFERENCES `organizationmaintain` (`org_code`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `generalpreproductiontransfer_chk_1` CHECK ((`productionStatus` in (0,1,2,3,4))),
  CONSTRAINT `generalpreproductiontransfer_chk_10` CHECK ((`planEndTime` > `planStartTime`)),
  CONSTRAINT `generalpreproductiontransfer_chk_2` CHECK ((`workOrderType` in (0,1,2))),
  CONSTRAINT `generalpreproductiontransfer_chk_3` CHECK ((`workOrderMaterialPrepareStatus` in (0,1,2))),
  CONSTRAINT `generalpreproductiontransfer_chk_4` CHECK ((`workOrderTransferStatus` in (0,1))),
  CONSTRAINT `generalpreproductiontransfer_chk_5` CHECK ((`materialTransferType` in (0,1,2,3))),
  CONSTRAINT `generalpreproductiontransfer_chk_6` CHECK ((`retainMaterialFullUnbind` in (0,1))),
  CONSTRAINT `generalpreproductiontransfer_chk_7` CHECK ((`sharedMaterialFullUnbind` in (0,1))),
  CONSTRAINT `generalpreproductiontransfer_chk_8` CHECK ((`fixtureTransferType` in (0,1,2,3))),
  CONSTRAINT `generalpreproductiontransfer_chk_9` CHECK ((`personnelTransferType` in (0,1)))
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

/*Data for the table `generalpreproductiontransfer` */

insert  into `generalpreproductiontransfer`(`id`,`workOrder_code`,`productionLine_code`,`productionLine_name`,`productionStatus`,`product_code`,`product_name`,`	productSpec`,`customer_code`,`customer_name`,`workOrderType`,`workOrderMaterialPrepareStatus`,`planQty`,`planStartTime`,`planEndTime`,`workOrderTransferStatus`,`materialTransferType`,`retainMaterialFullUnbind`,`sharedMaterialFullUnbind`,`fixtureTransferType`,`personnelTransferType`,`	targetWorkOrderNo`,`transferNo`,`processSection_code`,`workshop_code`,`workshop_name`,`	workOrderGroupNo`,`org_code`,`org_name`,`remarks`,`modifier`,`modifierName`,`modifyTime`) values 
(1,'WO2024001','PL001','SMT生产线1',0,'PROD001','贴片电阻','0402 10KΩ ±1%','CUST001','广州电子科技有限公司',0,1,5000,'2025-11-20 08:00:00','2025-11-20 18:00:00',0,3,1,1,0,0,'WO2025005','TR-GEN-PRE2025001','PS001','WS001','电子车间','WG2025023','ORG001','电子制造事业部',NULL,'USER001','张三','2025-11-20 17:30:00'),
(2,'WO2024002','PL002','机械加工生产线1',1,'PROD013','精密阀门阀芯','不锈钢304 公差±0.01mm','CUST004','北京通信设备有限公司',1,0,150,'2025-11-21 09:00:00','2025-11-21 16:30:00',0,3,0,0,0,0,'WO2025006','TR-GEN-PRE2025002','PS002','WS002','机械加工车间','WG2025024','ORG004','精密制造事业部',NULL,'USER004','赵六','2025-11-21 16:00:00'),
(3,'WO2024003','PL003','连接器生产线4',0,'PROD005','USB Type-C连接器','10Gbps 防水型','CUST004','北京通信设备有限公司',0,1,2000,'2025-11-22 08:30:00','2025-11-22 17:30:00',0,3,1,0,0,0,'WO2025012','TR-GEN-PRE2025003','PS003','WS003','通信车间','WG2025025','ORG003','通信配件事业部',NULL,'USER001','张三','2025-11-22 15:40:00');

/*Table structure for table `generalproductiontable` */

DROP TABLE IF EXISTS `generalproductiontable`;

CREATE TABLE `generalproductiontable` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `org_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `org_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `productionLine_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `productionLine_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `workOrder_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `erpWorkOrder_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `workOrderType` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `product_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `product_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `productSpec` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `customer_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `customer_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `planQty` int DEFAULT NULL,
  `planStartTime` datetime DEFAULT NULL,
  `planEndTime` datetime DEFAULT NULL,
  `productionStatus` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`,`product_name`) USING BTREE,
  KEY `org_code` (`org_code`) USING BTREE,
  KEY `productionLine_code` (`productionLine_code`) USING BTREE,
  KEY `workOrder_code` (`workOrder_code`) USING BTREE,
  KEY `customer_code` (`customer_code`) USING BTREE,
  CONSTRAINT `generalproductiontable_ibfk_1` FOREIGN KEY (`org_code`) REFERENCES `organizationmaintain` (`org_code`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `generalproductiontable_ibfk_2` FOREIGN KEY (`productionLine_code`) REFERENCES `production_line` (`line_code`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `generalproductiontable_ibfk_3` FOREIGN KEY (`workOrder_code`) REFERENCES `workordermaintain` (`workOrder_code`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `generalproductiontable_ibfk_4` FOREIGN KEY (`customer_code`) REFERENCES `customermaintain` (`customer_code`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

/*Data for the table `generalproductiontable` */

insert  into `generalproductiontable`(`id`,`org_code`,`org_name`,`productionLine_code`,`productionLine_name`,`workOrder_code`,`erpWorkOrder_code`,`workOrderType`,`product_code`,`product_name`,`productSpec`,`customer_code`,`customer_name`,`planQty`,`planStartTime`,`planEndTime`,`productionStatus`) values 
(1,'ORG001','电子制造事业部','PL001','SMT生产线1','WO2024001','ERP-WO-001','常规生产','PROD001','贴片电阻','0402 10KΩ ±1%','CUST001','广州电子科技有限公司',5000,'2025-11-25 08:00:00','2025-11-25 18:00:00','生产中'),
(2,'ORG002','塑胶加工事业部','PL002','注塑生产线2','WO2024002','ERP-WO-002','半成品生产','PROD002','路由器外壳','ABS材质 白色 通用型','CUST002','深圳塑胶制品有限公司',1200,'2025-11-26 09:00:00','2025-11-26 16:00:00','已完成'),
(3,'ORG001','电子制造事业部','PL003','组装生产线3','WO2024003','ERP-WO20-003','成品组装','PROD003','电源适配器','220V转12V 3A','CUST003','杭州电器贸易有限公司',800,'2025-11-27 10:00:00','2025-11-27 18:00:00','待投产');

/*Table structure for table `generalrankingfinetuningtable` */

DROP TABLE IF EXISTS `generalrankingfinetuningtable`;

CREATE TABLE `generalrankingfinetuningtable` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `org_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '组织编码',
  `org_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '组织名称',
  `workOrder_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '工单编码',
  `mainPlan_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '主计划编码',
  `erpWorkOrder_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'ERP工单编码',
  `product_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '产品编码',
  `product_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '产品名称',
  `processSection_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '工艺段编码',
  `customer_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '客户编码',
  `customerName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '客户名称',
  `planQty` int DEFAULT NULL COMMENT '计划数量',
  `productionStatus` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '生产状态',
  `workOrderMaterialPrepareStatus` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '工单备料状态',
  `productionTransferResourceType` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '转产资源类型',
  `fineTuningType` tinyint NOT NULL COMMENT '微调类型（0-不管控上料调整；1-SKU调整；2-自动备料/上料调整；3-增加主料）',
  `fineTuning_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '微调编码',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `org_code` (`org_code`) USING BTREE,
  KEY `workOrder_code` (`workOrder_code`) USING BTREE,
  KEY `processSection_code` (`processSection_code`) USING BTREE,
  KEY `customer_code` (`customer_code`) USING BTREE,
  KEY `fineTuning_code` (`fineTuning_code`) USING BTREE,
  CONSTRAINT `generalrankingfinetuningtable_ibfk_1` FOREIGN KEY (`org_code`) REFERENCES `organizationmaintain` (`org_code`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `generalrankingfinetuningtable_ibfk_2` FOREIGN KEY (`workOrder_code`) REFERENCES `workordermaintain` (`workOrder_code`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `generalrankingfinetuningtable_ibfk_3` FOREIGN KEY (`processSection_code`) REFERENCES `process_segment` (`segment_code`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `generalrankingfinetuningtable_ibfk_4` FOREIGN KEY (`customer_code`) REFERENCES `customermaintain` (`customer_code`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `generalrankingfinetuningtable_ibfk_5` FOREIGN KEY (`fineTuning_code`) REFERENCES `finetuningmasterlist` (`fineTuning_code`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `generalrankingfinetuningtable_chk_1` CHECK ((`fineTuningType` in (0,1,2)))
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

/*Data for the table `generalrankingfinetuningtable` */

insert  into `generalrankingfinetuningtable`(`id`,`org_code`,`org_name`,`workOrder_code`,`mainPlan_code`,`erpWorkOrder_code`,`product_code`,`product_name`,`processSection_code`,`customer_code`,`customerName`,`planQty`,`productionStatus`,`workOrderMaterialPrepareStatus`,`productionTransferResourceType`,`fineTuningType`,`fineTuning_code`) values 
(1,'ORG001','电子制造事业部','WO2024001','MP2025001','ERP-WO-001','PROD001','贴片电阻','PS001','CUST001','广州电子科技有限公司',5000,'生产中','已备料','上料设备',0,'FT001'),
(2,'ORG001','电子制造事业部','WO2024002','MP2025004','ERP-WO-002','PROD004','控制电路板','PS002','CUST001','广州电子科技有限公司',300,'待投产','备料中','物料规格',1,'FT002'),
(3,'ORG003','通信配件事业部','WO2024003','MP2025005','ERP-WO-003','PROD005','USB Type-C连接器','PS003','CUST004','北京通信设备有限公司',2000,'排程中','已备料','备料系统',2,'FT003');

/*Table structure for table `generalsuspendedworkordertransfer` */

DROP TABLE IF EXISTS `generalsuspendedworkordertransfer`;

CREATE TABLE `generalsuspendedworkordertransfer` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `workOrder_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '工单编码',
  `productionLine_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '产线编码',
  `productionLine_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '产线名称',
  `productionStatus` tinyint DEFAULT NULL COMMENT '生产状态(1：停工)',
  `product_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '产品编码',
  `product_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '产品名称',
  `productSpec` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '产品规格',
  `customer_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '客户编码',
  `customer_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '客户名称',
  `workOrderType` tinyint NOT NULL COMMENT '工单类型(0：量产  1：试做  )',
  `workOrderMaterialPrepareStatus` tinyint NOT NULL COMMENT '工单备料状态(0：未备料  1：首套备料中)',
  `planQty` int DEFAULT NULL COMMENT '计划数量',
  `planStartTime` datetime DEFAULT NULL COMMENT '计划开始时间',
  `planEndTime` datetime DEFAULT NULL COMMENT '计划结束时间',
  `workOrderTransferStatus` tinyint NOT NULL COMMENT '工单转产状态(对于原工单，0：完工)',
  `materialTransferType` tinyint NOT NULL COMMENT '物料转产类型(0:剩余物料全部退仓  )',
  `targetWorkOrderNo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '目的工单编码',
  `transferNo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '转产编码',
  `processSection_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '工艺段编码',
  `workshop_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '车间编码',
  `workshop_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '车间名称',
  `workOrderGroupNo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '工单组编码',
  `org_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '组织编码',
  `org_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '组织名称',
  `remarks` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `modifier` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人',
  `modifierName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人名称',
  `modifyTime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  CONSTRAINT `generalsuspendedworkordertransfer_chk_1` CHECK ((`productionStatus` = 1)),
  CONSTRAINT `generalsuspendedworkordertransfer_chk_2` CHECK ((`workOrderType` in (0,1,2))),
  CONSTRAINT `generalsuspendedworkordertransfer_chk_3` CHECK ((`workOrderMaterialPrepareStatus` in (0,1,2))),
  CONSTRAINT `generalsuspendedworkordertransfer_chk_4` CHECK ((`workOrderTransferStatus` in (0,1))),
  CONSTRAINT `generalsuspendedworkordertransfer_chk_5` CHECK ((`materialTransferType` in (0,1,2,3))),
  CONSTRAINT `generalsuspendedworkordertransfer_chk_6` CHECK ((`planEndTime` > `planStartTime`))
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

/*Data for the table `generalsuspendedworkordertransfer` */

insert  into `generalsuspendedworkordertransfer`(`id`,`workOrder_code`,`productionLine_code`,`productionLine_name`,`productionStatus`,`product_code`,`product_name`,`productSpec`,`customer_code`,`customer_name`,`workOrderType`,`workOrderMaterialPrepareStatus`,`planQty`,`planStartTime`,`planEndTime`,`workOrderTransferStatus`,`materialTransferType`,`targetWorkOrderNo`,`transferNo`,`processSection_code`,`workshop_code`,`workshop_name`,`workOrderGroupNo`,`org_code`,`org_name`,`remarks`,`modifier`,`modifierName`,`modifyTime`) values 
(1,'WO2024002','PL002','精密加工生产线2',1,'PROD010','精密传动齿轮','合金钢 φ30mm 模数2 淬火处理','CUST003','杭州电器贸易有限公司',1,0,200,'2025-12-15 09:00:00','2025-12-15 16:00:00',1,0,'WO2024020','TR-STOP2025002','PS006','WS003','机械加工车间','WG2025011','ORG004','精密制造事业部','试做阶段发现图纸参数偏差，停工调整后转新工单生产','USER004','赵六','2025-12-14 11:20:00'),
(2,'WO2024003','PL003','连接器生产线4',1,'PROD005','USB Type-C连接器','10Gbps 防水型','CUST004','北京通信设备有限公司',0,1,2000,'2025-12-16 08:30:00','2025-12-16 17:30:00',0,0,'WO2024003','TR-STOP2025003','PS003','WS004','通信车间','WG2025012','ORG003','通信配件事业部','原材料供应延迟导致停工，物料退仓后转后续工单','USER004','赵六','2025-12-15 10:10:00'),
(3,'WO2024001','PL001','SMT生产线1',1,'PROD001','贴片电阻','0402 10KΩ ±1%','CUST001','广州电子科技有限公司',0,1,5000,'2025-12-14 08:00:00','2025-12-14 18:00:00',0,0,'WO2024019','TR-STOP2024001','PS001','WS001','电子车间','WG2024010','ORG001','电子制造事业部',NULL,'USER001','张三','2025-12-13 15:40:00');

/*Table structure for table `goods_issue` */

DROP TABLE IF EXISTS `goods_issue`;

CREATE TABLE `goods_issue` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `issue_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '出库单号',
  `issue_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '出库类型（生产发料/销售发货/报废/退料）',
  `material_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '物料编码',
  `batch_number` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '批次号',
  `quantity` decimal(15,4) NOT NULL COMMENT '出库数量',
  `unit` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '单位',
  `workOrder_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '关联工单（生产发料时）',
  `sales_order_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '销售订单号（销售发货时）',
  `customer_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '客户编码',
  `warehouse_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '出库仓库',
  `storage_location_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '出库储位',
  `carrier` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '承运商（销售时）',
  `tracking_no` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '运单号',
  `issue_status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '已出库' COMMENT '出库状态',
  `issue_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '出库时间',
  `operator` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '操作人',
  `operator_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '操作人名称',
  `remarks` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_issue_no` (`issue_no`) USING BTREE,
  KEY `idx_material` (`material_code`) USING BTREE,
  KEY `idx_workorder` (`workOrder_code`) USING BTREE,
  KEY `idx_customer` (`customer_code`) USING BTREE,
  KEY `idx_location` (`storage_location_code`) USING BTREE,
  CONSTRAINT `fk_gi_customer` FOREIGN KEY (`customer_code`) REFERENCES `customermaintain` (`customer_code`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_gi_location` FOREIGN KEY (`storage_location_code`) REFERENCES `storage_location` (`location_code`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_gi_material` FOREIGN KEY (`material_code`) REFERENCES `material_info` (`material_code`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_gi_workorder` FOREIGN KEY (`workOrder_code`) REFERENCES `workordermaintain` (`workOrder_code`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='出库单表';

/*Data for the table `goods_issue` */

insert  into `goods_issue`(`id`,`issue_no`,`issue_type`,`material_code`,`batch_number`,`quantity`,`unit`,`workOrder_code`,`sales_order_no`,`customer_code`,`warehouse_code`,`storage_location_code`,`carrier`,`tracking_no`,`issue_status`,`issue_time`,`operator`,`operator_name`,`remarks`) values 
(1,'GI20250001','生产发料','MAT001','BATCH2025001',80.0000,'PCS','WO2024001',NULL,NULL,'WH001','LOC001',NULL,NULL,'已出库','2025-01-25 09:30:00','user01','张三','SMT线首批发料'),
(2,'GI20250002','生产发料','MAT002','BATCH2025002',50.0000,'PCS','WO2024001',NULL,NULL,'WH001','LOC002',NULL,NULL,'已出库','2025-01-25 10:15:00','user02','李四','同步发料'),
(3,'GI20250003','销售发货','MAT003','FPBATCH2025001',20.0000,'PCS',NULL,'SO20250001','CUST001','WH002','LOC001','顺丰速运','SF123456789CN','已出库','2025-02-01 10:30:00','user07','周九','客户订单发货'),
(4,'GI20250004','退料','MAT002','BATCH2025002',5.0000,'PCS','WO2024002',NULL,NULL,'WH001','LOC002',NULL,NULL,'已出库','2025-02-02 14:00:00','user03','王五','多余物料退回'),
(5,'GI20250005','报废','MAT003','FPBATCH2025001',10.0000,'PCS',NULL,NULL,NULL,'WH002','LOC001',NULL,NULL,'已出库','2025-02-16 08:30:00','admin','系统管理员','过期批次报废处理');

/*Table structure for table `import_scheme` */

DROP TABLE IF EXISTS `import_scheme`;

CREATE TABLE `import_scheme` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `global_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '全局编号',
  `scheme_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '导入方案编码',
  `scheme_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '导入方案名称',
  `import_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '导入类型',
  `is_default` tinyint NOT NULL DEFAULT '0' COMMENT '默认(0:否,1:是)',
  `enabled` tinyint NOT NULL DEFAULT '1' COMMENT '启用(0:否,1:是)',
  `remarks` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `creator` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
  `creator_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人名称',
  `creation_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifier` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人',
  `modifier_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人名称',
  `modification_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `global_id` (`global_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='导入方案维护表';

/*Data for the table `import_scheme` */

insert  into `import_scheme`(`id`,`global_id`,`scheme_code`,`scheme_name`,`import_type`,`is_default`,`enabled`,`remarks`,`creator`,`creator_name`,`creation_time`,`modifier`,`modifier_name`,`modification_time`) values 
(1,'1','IMP001','BOM导入方案','BOM',0,1,NULL,NULL,NULL,'2025-10-26 14:26:33',NULL,NULL,'2025-10-26 14:26:33'),
(2,'2','IMP002','物料导入方案','MATERIAL',0,1,NULL,NULL,NULL,'2025-10-26 14:26:33',NULL,NULL,'2025-10-26 14:26:33'),
(3,'3','IMP003','设备导入方案','EQUIPMENT',0,1,NULL,NULL,NULL,'2025-10-26 14:26:33',NULL,NULL,'2025-10-26 14:26:33');

/*Table structure for table `inventory_alert` */

DROP TABLE IF EXISTS `inventory_alert`;

CREATE TABLE `inventory_alert` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `material_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '物料编码',
  `warehouse_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '仓库编码',
  `alert_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '预警类型(库存不足,库存过剩,临期,过期)',
  `current_quantity` decimal(15,4) NOT NULL COMMENT '当前数量',
  `threshold_quantity` decimal(15,4) NOT NULL COMMENT '阈值数量',
  `alert_level` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '预警级别(低,中,高)',
  `alert_message` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '预警信息',
  `alert_status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '未处理' COMMENT '预警状态(未处理,已处理,已忽略)',
  `alert_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '预警时间',
  `process_time` datetime DEFAULT NULL COMMENT '处理时间',
  `processor` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '处理人',
  `processor_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '处理人名称',
  `process_remarks` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '处理备注',
  `creation_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_material_code` (`material_code`) USING BTREE,
  KEY `idx_alert_type` (`alert_type`) USING BTREE,
  KEY `idx_alert_status` (`alert_status`) USING BTREE,
  KEY `idx_alert_time` (`alert_time`) USING BTREE,
  CONSTRAINT `fk_ia_material` FOREIGN KEY (`material_code`) REFERENCES `material_info` (`material_code`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='库存预警表';

/*Data for the table `inventory_alert` */

insert  into `inventory_alert`(`id`,`material_code`,`warehouse_code`,`alert_type`,`current_quantity`,`threshold_quantity`,`alert_level`,`alert_message`,`alert_status`,`alert_time`,`process_time`,`processor`,`processor_name`,`process_remarks`,`creation_time`) values 
(1,'MAT001','WH004','库存不足',50.0000,100.0000,'高','MAT001库存低于安全库存，请及时补货','已忽略','2025-01-28 15:30:00','2025-11-26 21:50:07','P001','王晓','不需要理会','2025-11-21 11:26:33'),
(2,'MAT002','WH002','临期',200.0000,300.0000,'中','MAT002批次BATCH2025002即将过期','未处理','2025-02-05 10:20:00',NULL,'','','','2025-11-21 11:26:33'),
(3,'MAT001','WH004','库存过剩',800.0000,500.0000,'低','MAT001库存超过最高库存限制','已处理','2025-03-01 09:15:00','2025-03-02 14:00:00','admin','系统管理员','调整采购计划','2025-11-21 11:26:33'),
(4,'MAT003','WH004','过期',10.0000,50.0000,'高','MAT003批次FPBATCH2025001已过期','已处理','2025-02-15 16:45:00','2025-02-16 08:30:00','admin','系统管理员','已隔离处理','2025-11-21 11:26:33'),
(5,'MAT002','WH004','库存不足',80.0000,150.0000,'中','MAT002库存偏低，建议补货','已处理','2025-04-10 11:30:00','2025-11-26 21:49:58','P002','林月','处理完毕','2025-11-21 11:26:33'),
(6,'MAT003','WH001','临期',10.0000,50.0000,'中','MAT001即将过期','未处理','2025-11-27 13:58:05',NULL,NULL,NULL,NULL,'2025-11-27 13:58:05');

/*Table structure for table `inventory_count` */

DROP TABLE IF EXISTS `inventory_count`;

CREATE TABLE `inventory_count` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `count_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '盘点单号',
  `count_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '盘点类型（全盘/抽盘/循环盘点）',
  `warehouse_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '仓库编码',
  `area_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '库区编码',
  `count_status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '进行中' COMMENT '盘点状态（进行中/已完成/已关闭）',
  `plan_start_time` datetime NOT NULL COMMENT '计划开始时间',
  `plan_end_time` datetime NOT NULL COMMENT '计划结束时间',
  `actual_start_time` datetime DEFAULT NULL COMMENT '实际开始时间',
  `actual_end_time` datetime DEFAULT NULL COMMENT '实际结束时间',
  `creator` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建人',
  `creator_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建人名称',
  `approver` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '审批人',
  `approve_time` datetime DEFAULT NULL COMMENT '审批时间',
  `remarks` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_count_no` (`count_no`) USING BTREE,
  KEY `idx_warehouse` (`warehouse_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='盘点单主表';

/*Data for the table `inventory_count` */

insert  into `inventory_count`(`id`,`count_no`,`count_type`,`warehouse_code`,`area_code`,`count_status`,`plan_start_time`,`plan_end_time`,`actual_start_time`,`actual_end_time`,`creator`,`creator_name`,`approver`,`approve_time`,`remarks`) values 
(1,'IC20250001','全盘','WH001',NULL,'已完成','2025-06-01 08:00:00','2025-06-01 18:00:00','2025-06-01 08:30:00','2025-06-01 17:45:00','admin','系统管理员','USER001','2025-06-02 09:00:00','月度全盘'),
(2,'IC20250002','抽盘','WH002','AREA01','已完成','2025-06-05 09:00:00','2025-06-05 12:00:00','2025-06-05 09:15:00','2025-06-05 11:30:00','admin','系统管理员','USER002','2025-06-06 10:00:00','高值物料抽查'),
(3,'IC20250003','循环盘点','WH001',NULL,'进行中','2025-06-10 08:00:00','2025-06-10 18:00:00','2025-06-10 08:20:00',NULL,'admin','系统管理员',NULL,NULL,'A类物料循环盘点'),
(4,'IC20250004','全盘','WH003',NULL,'已关闭','2025-05-20 08:00:00','2025-05-20 18:00:00',NULL,NULL,'admin','系统管理员',NULL,NULL,'盘点取消'),
(5,'IC20250005','抽盘','WH002','AREA02','已完成','2025-06-15 10:00:00','2025-06-15 15:00:00','2025-06-15 10:10:00','2025-06-15 14:50:00','admin','系统管理员','USER003','2025-06-16 09:30:00','临期物料盘点');

/*Table structure for table `inventory_count_detail` */

DROP TABLE IF EXISTS `inventory_count_detail`;

CREATE TABLE `inventory_count_detail` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `count_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '盘点单号',
  `material_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '物料编码',
  `batch_number` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '批次号',
  `storage_location_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '储位编码',
  `system_quantity` decimal(15,4) NOT NULL COMMENT '系统库存数量',
  `actual_quantity` decimal(15,4) DEFAULT NULL COMMENT '实盘数量',
  `difference` decimal(15,4) GENERATED ALWAYS AS ((`actual_quantity` - `system_quantity`)) STORED COMMENT '差异量',
  `difference_reason` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '差异原因',
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '未盘点' COMMENT '明细状态（未盘点/已盘点/已调整）',
  `adjustment_doc_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '库存调整单号',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_count_no` (`count_no`) USING BTREE,
  KEY `idx_material_location` (`material_code`,`storage_location_code`) USING BTREE,
  KEY `fk_icd_location` (`storage_location_code`) USING BTREE,
  CONSTRAINT `fk_icd_count` FOREIGN KEY (`count_no`) REFERENCES `inventory_count` (`count_no`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `fk_icd_location` FOREIGN KEY (`storage_location_code`) REFERENCES `storage_location` (`location_code`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_icd_material` FOREIGN KEY (`material_code`) REFERENCES `material_info` (`material_code`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='盘点明细表';

/*Data for the table `inventory_count_detail` */

insert  into `inventory_count_detail`(`id`,`count_no`,`material_code`,`batch_number`,`storage_location_code`,`system_quantity`,`actual_quantity`,`difference_reason`,`status`,`adjustment_doc_no`) values 
(1,'IC20250001','MAT001','BATCH2025001','LOC001',900.0000,895.0000,'损耗','已盘点',NULL),
(2,'IC20250001','MAT002','BATCH2025002','LOC002',1700.0000,1700.0000,NULL,'已盘点',NULL),
(3,'IC20250002','MAT003','FPBATCH2025001','LOC001',490.0000,485.0000,'发货误差','已盘点',NULL),
(4,'IC20250003','MAT001','BATCH2025004','LOC003',800.0000,NULL,NULL,'未盘点',NULL),
(5,'IC20250005','MAT003','FPBATCH2025005','LOC002',350.0000,348.0000,'包装破损','已盘点',NULL);

/*Table structure for table `machiningcompletedmaterialtransfer` */

DROP TABLE IF EXISTS `machiningcompletedmaterialtransfer`;

CREATE TABLE `machiningcompletedmaterialtransfer` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `workOrder_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '工单编码',
  `productionLine_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '产线编码',
  `productionLine_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '产线名称',
  `productionStatus` tinyint DEFAULT NULL COMMENT '生产状态(1：完工)',
  `product_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '产品编码',
  `product_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '产品名称',
  `productSpec` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '产品规格',
  `customer_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '客户编码',
  `customer_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '客户名称',
  `materialProcessingCompleted` tinyint NOT NULL COMMENT '物料处理完毕(0：否  1：是)',
  `planQty` int DEFAULT NULL COMMENT '计划数量',
  `planStartTime` datetime DEFAULT NULL COMMENT '计划开始时间',
  `planEndTime` datetime DEFAULT NULL COMMENT '计划结束时间',
  `targetWorkOrderNo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '目的工单编码',
  `transferNo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '转产编码',
  `processSection_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '工艺段编码',
  `workshop_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '车间编码',
  `workshop_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '车间名称',
  `workOrderGroupNo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '工单组编码',
  `org_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '组织编码',
  `org_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '组织名称',
  `remarks` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `modifier` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人',
  `modifierName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人名称',
  `modifyTime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `workOrder_code` (`workOrder_code`) USING BTREE,
  KEY `productionLine_code` (`productionLine_code`) USING BTREE,
  KEY `customer_code` (`customer_code`) USING BTREE,
  KEY `processSection_code` (`processSection_code`) USING BTREE,
  KEY `workshop_code` (`workshop_code`) USING BTREE,
  KEY `org_code` (`org_code`) USING BTREE,
  CONSTRAINT `machiningcompletedmaterialtransfer_ibfk_1` FOREIGN KEY (`workOrder_code`) REFERENCES `workordermaintain` (`workOrder_code`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `machiningcompletedmaterialtransfer_ibfk_2` FOREIGN KEY (`productionLine_code`) REFERENCES `production_line` (`line_code`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `machiningcompletedmaterialtransfer_ibfk_3` FOREIGN KEY (`customer_code`) REFERENCES `customermaintain` (`customer_code`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `machiningcompletedmaterialtransfer_ibfk_4` FOREIGN KEY (`processSection_code`) REFERENCES `process_segment` (`segment_code`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `machiningcompletedmaterialtransfer_ibfk_5` FOREIGN KEY (`workshop_code`) REFERENCES `workshop` (`workshop_code`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `machiningcompletedmaterialtransfer_ibfk_6` FOREIGN KEY (`org_code`) REFERENCES `organizationmaintain` (`org_code`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `machiningcompletedmaterialtransfer_chk_1` CHECK ((`productionStatus` = 1)),
  CONSTRAINT `machiningcompletedmaterialtransfer_chk_2` CHECK ((`materialProcessingCompleted` in (0,1))),
  CONSTRAINT `machiningcompletedmaterialtransfer_chk_3` CHECK ((`planEndTime` > `planStartTime`))
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

/*Data for the table `machiningcompletedmaterialtransfer` */

insert  into `machiningcompletedmaterialtransfer`(`id`,`workOrder_code`,`productionLine_code`,`productionLine_name`,`productionStatus`,`product_code`,`product_name`,`productSpec`,`customer_code`,`customer_name`,`materialProcessingCompleted`,`planQty`,`planStartTime`,`planEndTime`,`targetWorkOrderNo`,`transferNo`,`processSection_code`,`workshop_code`,`workshop_name`,`workOrderGroupNo`,`org_code`,`org_name`,`remarks`,`modifier`,`modifierName`,`modifyTime`) values 
(2,'WO2024002','PL002','精密加工生产线2',1,'PROD013','精密阀门阀芯','不锈钢304 内腔抛光 公差±0.01mm','CUST001','广州电子科技有限公司',0,150,'2025-12-14 09:00:00','2025-12-14 16:30:00',NULL,'TR-MACH-COMP2025002','PS002','WS003','机械加工车间','WG2025021','ORG004','精密制造事业部',NULL,'USER004','赵六','2025-12-14 16:45:00'),
(3,'WO2024003','PL003','机械加工生产线1',1,'PROD014','工程机械连杆','合金结构钢 锻压成型 孔径φ25mm','CUST001','广州电子科技有限公司',1,300,'2025-12-20 08:30:00','2025-12-20 15:30:00',NULL,'TR-MACH-COMP2025003','PS003','WS003','机械加工车间','WG2025022','ORG002','重型机械事业部',NULL,'USER003','王五','2025-12-20 15:40:00'),
(4,'WO2024001','PL001','机械加工生产线1',1,'PROD012','工业电机轴','45号钢 φ40mm 长度200mm 精磨','CUST002','深圳机电设备有限公司',1,1000,'2025-12-17 08:00:00','2025-12-17 17:00:00',NULL,'TR-MACH-COMP2025001','PS001','WS003','机械加工车间','WG2025020','ORG002','重型机械事业部',NULL,'USER003','王五','2025-12-17 17:30:00');

/*Table structure for table `machiningpreproductiontransfer` */

DROP TABLE IF EXISTS `machiningpreproductiontransfer`;

CREATE TABLE `machiningpreproductiontransfer` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `workOrder_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '工单编码',
  `productionLine_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '产线编码',
  `productionLine_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '产线名称',
  `productionStatus` tinyint DEFAULT NULL COMMENT '生产状态(0：在产  1：清尾  )',
  `product_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '产品编码',
  `product_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '产品名称',
  `productSpec` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '产品规格',
  `customer_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '客户编码',
  `customer_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '客户名称',
  `workOrderType` tinyint NOT NULL COMMENT '工单类型(0：量产  1：试做  )',
  `workOrderMaterialPrepareStatus` tinyint NOT NULL COMMENT '工单备料状态（0：未备料  1：首套备料中）',
  `planQty` int DEFAULT NULL COMMENT '计划数量',
  `planStartTime` datetime DEFAULT NULL COMMENT '计划开始时间',
  `planEndTime` datetime DEFAULT NULL COMMENT '计划结束时间',
  `workOrderTransferStatus` tinyint NOT NULL COMMENT '工单转产状态（对于原工单，0：完工）',
  `materialTransferType` tinyint NOT NULL COMMENT '物料转产类型（0:剩余物料全部退仓  0',
  `retainMaterialFullUnbind` tinyint NOT NULL COMMENT '保留物料全部解绑（0：不选中  1：选中）',
  `sharedMaterialFullUnbind` tinyint NOT NULL COMMENT '共用物料全部解绑（0：不选中  1：选中）',
  `fixtureTransferType` tinyint NOT NULL COMMENT '极治具转产类型（0：全部下线）',
  `personnelTransferType` tinyint NOT NULL COMMENT '岗位人员转产类型（0：全部下岗）',
  `targetWorkOrderNo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '目的工单编码',
  `transferNo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '转产编码',
  `processSection_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '工艺段编码',
  `workshop_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '车间编码',
  `workshop_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '车间名称',
  `workOrderGroupNo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '工单组编码',
  `org_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '组织编码',
  `org_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '组织名称',
  `remarks` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `modifier` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人',
  `modifierName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人名称',
  `modifyTime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `workOrder_code` (`workOrder_code`) USING BTREE,
  KEY `productionLine_code` (`productionLine_code`) USING BTREE,
  KEY `customer_code` (`customer_code`) USING BTREE,
  KEY `processSection_code` (`processSection_code`) USING BTREE,
  KEY `workshop_code` (`workshop_code`) USING BTREE,
  KEY `org_code` (`org_code`) USING BTREE,
  CONSTRAINT `machiningpreproductiontransfer_ibfk_1` FOREIGN KEY (`workOrder_code`) REFERENCES `workordermaintain` (`workOrder_code`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `machiningpreproductiontransfer_ibfk_2` FOREIGN KEY (`productionLine_code`) REFERENCES `production_line` (`line_code`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `machiningpreproductiontransfer_ibfk_3` FOREIGN KEY (`customer_code`) REFERENCES `customermaintain` (`customer_code`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `machiningpreproductiontransfer_ibfk_4` FOREIGN KEY (`processSection_code`) REFERENCES `process_segment` (`segment_code`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `machiningpreproductiontransfer_ibfk_5` FOREIGN KEY (`workshop_code`) REFERENCES `workshop` (`workshop_code`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `machiningpreproductiontransfer_ibfk_6` FOREIGN KEY (`org_code`) REFERENCES `organizationmaintain` (`org_code`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `machiningpreproductiontransfer_chk_1` CHECK ((`productionStatus` in (0,1,2,3,4))),
  CONSTRAINT `machiningpreproductiontransfer_chk_10` CHECK ((`personnelTransferType` in (0,1))),
  CONSTRAINT `machiningpreproductiontransfer_chk_2` CHECK ((`workOrderType` in (0,1,2))),
  CONSTRAINT `machiningpreproductiontransfer_chk_3` CHECK ((`workOrderMaterialPrepareStatus` in (0,1,2))),
  CONSTRAINT `machiningpreproductiontransfer_chk_4` CHECK ((`planEndTime` > `planStartTime`)),
  CONSTRAINT `machiningpreproductiontransfer_chk_5` CHECK ((`workOrderTransferStatus` in (0,1))),
  CONSTRAINT `machiningpreproductiontransfer_chk_6` CHECK ((`materialTransferType` in (0,1,2,3))),
  CONSTRAINT `machiningpreproductiontransfer_chk_7` CHECK ((`retainMaterialFullUnbind` in (0,1))),
  CONSTRAINT `machiningpreproductiontransfer_chk_8` CHECK ((`sharedMaterialFullUnbind` in (0,1))),
  CONSTRAINT `machiningpreproductiontransfer_chk_9` CHECK ((`fixtureTransferType` in (0,1,2,3)))
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

/*Data for the table `machiningpreproductiontransfer` */

insert  into `machiningpreproductiontransfer`(`id`,`workOrder_code`,`productionLine_code`,`productionLine_name`,`productionStatus`,`product_code`,`product_name`,`productSpec`,`customer_code`,`customer_name`,`workOrderType`,`workOrderMaterialPrepareStatus`,`planQty`,`planStartTime`,`planEndTime`,`workOrderTransferStatus`,`materialTransferType`,`retainMaterialFullUnbind`,`sharedMaterialFullUnbind`,`fixtureTransferType`,`personnelTransferType`,`targetWorkOrderNo`,`transferNo`,`processSection_code`,`workshop_code`,`workshop_name`,`workOrderGroupNo`,`org_code`,`org_name`,`remarks`,`modifier`,`modifierName`,`modifyTime`) values 
(1,'WO2024001','PL001','机械加工生产线1',0,'PROD006','路由器金属外壳','铝合金 120*80*20mm 喷砂工艺','CUST002','深圳塑胶制品有限公司',0,1,800,'2025-12-11 08:00:00','2025-12-11 17:00:00',0,0,0,1,0,0,'WO2025016','TR-MACH2025001','PS001','WS003','机械加工车间','WG2025007','ORG002','塑胶加工事业部',NULL,'USER003','王五','2025-12-10 14:20:00'),
(2,'WO2024002','PL002','精密加工生产线2',1,'PROD010','精密传动齿轮','合金钢 φ30mm 模数2 淬火处理','CUST004','北京通信设备有限公司',1,0,200,'2025-12-12 09:00:00','2025-12-12 16:00:00',1,0,1,0,0,0,'WO2025017','TR-MACH2025002','PS002','WS003','机械加工车间','WG2025008','ORG004','精密制造事业部',NULL,'USER004','赵六','2025-12-11 10:30:00'),
(3,'WO2024003','PL003','机械加工生产线1',0,'PROD008','通信设备固定结构件','碳钢 200*150*10mm 钻孔4处','CUST004','北京通信设备有限公司',0,1,600,'2025-12-13 08:30:00','2025-12-13 16:30:00',0,0,0,1,0,0,'WO2025018','TR-MACH2025003','PS003','WS003','机械加工车间','WG2025009','ORG003','通信配件事业部',NULL,'USER001','张三','2025-12-12 09:15:00');

/*Table structure for table `machiningproductiontable` */

DROP TABLE IF EXISTS `machiningproductiontable`;

CREATE TABLE `machiningproductiontable` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `org_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '组织编码',
  `org_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '组织名称',
  `productionLine_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '产线编码',
  `	productionLine_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '产线名称',
  `workOrder_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '工单编码',
  `erpWorkOrder_code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'ERP工单编码',
  `workOrderType` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '工单类型',
  `product_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '产品编码',
  `product_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '产品名称',
  `productSpec` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '产品规格',
  `customer_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '客户编码',
  `customer_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '客户名称',
  `planQty` int DEFAULT NULL COMMENT '计划数量',
  `planStartTime` datetime DEFAULT NULL COMMENT '计划开始时间',
  `planEndTime` datetime DEFAULT NULL COMMENT '计划结束时间',
  `productionStatus` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '生产状态',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `org_code` (`org_code`) USING BTREE,
  KEY `productionLine_code` (`productionLine_code`) USING BTREE,
  KEY `workOrder_code` (`workOrder_code`) USING BTREE,
  KEY `customer_code` (`customer_code`) USING BTREE,
  CONSTRAINT `machiningproductiontable_ibfk_1` FOREIGN KEY (`org_code`) REFERENCES `organizationmaintain` (`org_code`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `machiningproductiontable_ibfk_2` FOREIGN KEY (`productionLine_code`) REFERENCES `production_line` (`line_code`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `machiningproductiontable_ibfk_3` FOREIGN KEY (`workOrder_code`) REFERENCES `workordermaintain` (`workOrder_code`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `machiningproductiontable_ibfk_4` FOREIGN KEY (`customer_code`) REFERENCES `customermaintain` (`customer_code`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

/*Data for the table `machiningproductiontable` */

insert  into `machiningproductiontable`(`id`,`org_code`,`org_name`,`productionLine_code`,`	productionLine_name`,`workOrder_code`,`erpWorkOrder_code`,`workOrderType`,`product_code`,`product_name`,`productSpec`,`customer_code`,`customer_name`,`planQty`,`planStartTime`,`planEndTime`,`productionStatus`) values 
(2,'ORG001','电子制造事业部','PL001','精密加工生产线2','WO2024002','ERP-WO-002','精密定制','PROD007','电源适配器精密轴','不锈钢 φ8mm*50mm 公差±0.01mm','CUST003','杭州电器贸易有限公司',1500,'2025-12-03 09:00:00','2025-12-03 18:00:00','待投产'),
(4,'ORG002','塑胶加工事业部','PL002','机械加工生产线1','WO2024001','ERP-WO-001','批量加工','PROD006','路由器金属外壳','铝合金 120*80*20mm 喷砂工艺','CUST002','深圳塑胶制品有限公司',800,'2025-12-02 08:00:00','2025-12-02 17:00:00','生产中'),
(5,'ORG003','通信配件事业部','PL003','机械加工生产线1','WO2024003','ERP-WO-003','常规加工','PROD008','通信设备固定结构件','碳钢 200*150*10mm 钻孔4处','CUST004','北京通信设备有限公司',600,'2025-12-04 08:30:00','2025-12-04 16:30:00','已完成');

/*Table structure for table `machiningsuspendedworkordertransfer` */

DROP TABLE IF EXISTS `machiningsuspendedworkordertransfer`;

CREATE TABLE `machiningsuspendedworkordertransfer` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `workOrder_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '工单编码',
  `productionLine_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '产线编码',
  `productionLine_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '产线名称',
  `productionStatus` tinyint DEFAULT NULL COMMENT '生产状态(1：停工)',
  `product_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '产品编码',
  `product_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '产品名称',
  `productSpec` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '产品规格',
  `customer_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '客户编码',
  `customer_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '客户名称',
  `workOrderType` tinyint NOT NULL COMMENT '工单类型(0：量产  1：试做  2:客退返工)',
  `workOrderMaterialPrepareStatus` tinyint NOT NULL COMMENT '工单备料状态(0：未备料  1：首套备料中)',
  `planQty` int DEFAULT NULL COMMENT '计划数量',
  `boardSurface` tinyint DEFAULT NULL COMMENT '版面',
  `planStartTime` datetime DEFAULT NULL COMMENT '计划开始时间',
  `planEndTime` datetime DEFAULT NULL COMMENT '计划结束时间',
  `workOrderTransferStatus` tinyint NOT NULL COMMENT '工单转产状态(对于原工单，0：完工 1:停工)',
  `materialTransferType` tinyint NOT NULL COMMENT '物料转产类型（0:剩余物料全部退仓 1：可共用物料转入新工单，不可共用物料退回仓库  2：剩余物料保留给原工单 3：可共用物料归入新工单，不可共用物料保留给原工单）',
  `targetWorkOrderNo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '目的工单编码',
  `transferNo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '转产编码',
  `processSection_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '工艺段编码',
  `workshop_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '车间编码',
  `workshop_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '车间名称',
  `workOrderGroupNo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '工单组编码',
  `org_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '组织编码',
  `org_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '组织名称',
  `remarks` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `modifier` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人',
  `modifierName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人名称',
  `modifyTime` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `workOrder_code` (`workOrder_code`) USING BTREE,
  KEY `	productionLine_code` (`productionLine_code`) USING BTREE,
  KEY `customer_code` (`customer_code`) USING BTREE,
  KEY `processSection_code` (`processSection_code`) USING BTREE,
  KEY `workshop_code` (`workshop_code`) USING BTREE,
  KEY `org_code` (`org_code`) USING BTREE,
  CONSTRAINT `machiningsuspendedworkordertransfer_ibfk_1` FOREIGN KEY (`workOrder_code`) REFERENCES `workordermaintain` (`workOrder_code`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `machiningsuspendedworkordertransfer_ibfk_2` FOREIGN KEY (`productionLine_code`) REFERENCES `production_line` (`line_code`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `machiningsuspendedworkordertransfer_ibfk_3` FOREIGN KEY (`customer_code`) REFERENCES `customermaintain` (`customer_code`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `machiningsuspendedworkordertransfer_ibfk_4` FOREIGN KEY (`processSection_code`) REFERENCES `process_segment` (`segment_code`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `machiningsuspendedworkordertransfer_ibfk_5` FOREIGN KEY (`workshop_code`) REFERENCES `workshop` (`workshop_code`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `machiningsuspendedworkordertransfer_ibfk_6` FOREIGN KEY (`org_code`) REFERENCES `organizationmaintain` (`org_code`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `machiningsuspendedworkordertransfer_chk_1` CHECK ((`productionStatus` = 1)),
  CONSTRAINT `machiningsuspendedworkordertransfer_chk_2` CHECK ((`workOrderType` in (0,1,2))),
  CONSTRAINT `machiningsuspendedworkordertransfer_chk_3` CHECK ((`workOrderMaterialPrepareStatus` in (0,1,2))),
  CONSTRAINT `machiningsuspendedworkordertransfer_chk_4` CHECK ((`boardSurface` = 1)),
  CONSTRAINT `machiningsuspendedworkordertransfer_chk_5` CHECK ((`workOrderTransferStatus` in (0,1))),
  CONSTRAINT `machiningsuspendedworkordertransfer_chk_6` CHECK ((`materialTransferType` in (0,1,2,3)))
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

/*Data for the table `machiningsuspendedworkordertransfer` */

insert  into `machiningsuspendedworkordertransfer`(`id`,`workOrder_code`,`productionLine_code`,`productionLine_name`,`productionStatus`,`product_code`,`product_name`,`productSpec`,`customer_code`,`customer_name`,`workOrderType`,`workOrderMaterialPrepareStatus`,`planQty`,`boardSurface`,`planStartTime`,`planEndTime`,`workOrderTransferStatus`,`materialTransferType`,`targetWorkOrderNo`,`transferNo`,`processSection_code`,`workshop_code`,`workshop_name`,`workOrderGroupNo`,`org_code`,`org_name`,`remarks`,`modifier`,`modifierName`,`modifyTime`) values 
(4,'WO2024001','PL001','机械加工生产线1',1,'PROD006','路由器金属外壳','铝合金 120*80*20mm 喷砂工艺','CUST002','深圳塑胶制品有限公司',0,1,800,1,'2025-12-20 08:00:00','2025-12-20 17:00:00',1,0,'WO2025008','TR-MACH-STOP2025001','PS001','WS003','机械加工车间','WG2025016','ORG002','塑胶加工事业部','数控车床刀具磨损停工，剩余铝合金原料全部退仓','USER003','王五','2025-12-19 14:10:00'),
(12,'WO2024002','PL002','精密加工生产线2',1,'PROD010','精密传动齿轮','合金钢 φ30mm 模数2 淬火处理','CUST004','北京通信设备有限公司',1,0,200,1,'2025-12-21 09:00:00','2025-12-21 16:00:00',1,1,'WO2025007','TR-MACH-STOP2025002','PS002','WS003','机械加工车间','WG2025017','ORG004','精密制造事业部','试做热处理硬度不达标停工，通用量具转入新工单','USER004','赵六','2025-12-20 10:30:00'),
(13,'WO2024003','PL003','机械加工生产线1',1,'PROD008','通信设备固定结构件','碳钢 200*150*10mm 钻孔4处','CUST004','北京通信设备有限公司',2,1,600,1,'2025-12-22 08:30:00','2025-12-22 16:30:00',1,2,'WO2025029','TR-MACH-STOP2025003','PS003','WS003','机械加工车间','WG2025018','ORG003','通信配件事业部','客退返工因治具故障停工，半成品及夹具保留原工单','USER004','赵六','2025-12-21 09:20:00');

/*Table structure for table `material_allocation` */

DROP TABLE IF EXISTS `material_allocation`;

CREATE TABLE `material_allocation` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `allocation_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '分配单号',
  `workorder_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '工单编码',
  `material_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '物料编码',
  `required_quantity` decimal(15,4) NOT NULL COMMENT '需求数量',
  `allocated_quantity` decimal(15,4) NOT NULL DEFAULT '0.0000' COMMENT '已分配数量',
  `issued_quantity` decimal(15,4) NOT NULL DEFAULT '0.0000' COMMENT '已发料数量',
  `returned_quantity` decimal(15,4) NOT NULL DEFAULT '0.0000' COMMENT '已退料数量',
  `unit` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '单位',
  `allocation_status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '待分配' COMMENT '分配状态(待分配,部分分配,已分配,已完成)',
  `priority` int NOT NULL DEFAULT '1' COMMENT '优先级',
  `planned_issue_time` datetime DEFAULT NULL COMMENT '计划发料时间',
  `actual_issue_time` datetime DEFAULT NULL COMMENT '实际发料时间',
  `production_line_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '产线编码',
  `production_line_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '产线名称',
  `workstation_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '工位编码',
  `workstation_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '工位名称',
  `remarks` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `creator` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
  `creator_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人名称',
  `creation_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifier` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人',
  `modifier_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人名称',
  `modification_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_allocation_code` (`allocation_code`) USING BTREE,
  KEY `idx_workorder_code` (`workorder_code`) USING BTREE,
  KEY `idx_material_code` (`material_code`) USING BTREE,
  KEY `idx_allocation_status` (`allocation_status`) USING BTREE,
  KEY `fk_ma_production_line` (`production_line_code`) USING BTREE,
  CONSTRAINT `fk_ma_material` FOREIGN KEY (`material_code`) REFERENCES `material_info` (`material_code`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_ma_production_line` FOREIGN KEY (`production_line_code`) REFERENCES `production_line` (`line_code`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_ma_workorder` FOREIGN KEY (`workorder_code`) REFERENCES `workordermaintain` (`workOrder_code`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='物料分配表';

/*Data for the table `material_allocation` */

insert  into `material_allocation`(`id`,`allocation_code`,`workorder_code`,`material_code`,`required_quantity`,`allocated_quantity`,`issued_quantity`,`returned_quantity`,`unit`,`allocation_status`,`priority`,`planned_issue_time`,`actual_issue_time`,`production_line_code`,`production_line_name`,`workstation_code`,`workstation_name`,`remarks`,`creator`,`creator_name`,`creation_time`,`modifier`,`modifier_name`,`modification_time`) values 
(1,'AL20250001','WO2024001','MAT001',100.0000,100.0000,80.0000,0.0000,'PCS','部分分配',1,'2025-01-25 08:00:00','2025-01-25 09:30:00','PL001','SMT生产线1','WS001','贴片工位','首件生产','admin','系统管理员','2025-11-21 11:25:00',NULL,NULL,'2025-11-21 11:25:00'),
(2,'AL20250002','WO2024001','MAT002',50.0000,50.0000,50.0000,0.0000,'PCS','已分配',1,'2025-01-25 08:00:00','2025-01-25 10:15:00','PL001','SMT生产线1','WS001','贴片工位','正常分配','admin','系统管理员','2025-11-21 11:25:00',NULL,NULL,'2025-11-21 11:25:00'),
(3,'AL20250003','WO2024002','MAT001',80.0000,60.0000,0.0000,0.0000,'PCS','待分配',2,'2025-02-01 09:00:00',NULL,'PL002','组装产线1','WS002','组装工位','等待物料','admin','系统管理员','2025-11-21 11:25:00',NULL,NULL,'2025-11-21 11:25:00'),
(4,'AL20250004','WO2024002','MAT002',30.0000,30.0000,30.0000,5.0000,'PCS','已完成',1,'2025-02-01 09:00:00','2025-02-01 11:20:00','PL002','组装产线1','WS002','组装工位','部分退料','admin','系统管理员','2025-11-21 11:25:00',NULL,NULL,'2025-11-21 11:25:00'),
(5,'AL20250005','WO2024003','MAT001',120.0000,100.0000,70.0000,0.0000,'PCS','部分分配',1,'2025-02-10 08:30:00','2025-02-10 10:45:00','PL003','测试产线1','WS003','测试工位','分批发料','admin','系统管理员','2025-11-21 11:25:00',NULL,NULL,'2025-11-21 11:25:00');

/*Table structure for table `material_allocation_detail` */

DROP TABLE IF EXISTS `material_allocation_detail`;

CREATE TABLE `material_allocation_detail` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `allocation_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '分配单号',
  `inventory_id` bigint NOT NULL COMMENT '库存ID',
  `material_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '物料编码',
  `batch_number` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '批次号',
  `warehouse_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '仓库编码',
  `storage_location_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '储位编码',
  `allocated_quantity` decimal(15,4) NOT NULL COMMENT '分配数量',
  `issued_quantity` decimal(15,4) NOT NULL DEFAULT '0.0000' COMMENT '已发料数量',
  `returned_quantity` decimal(15,4) NOT NULL DEFAULT '0.0000' COMMENT '已退料数量',
  `allocation_time` datetime DEFAULT NULL COMMENT '分配时间',
  `issue_time` datetime DEFAULT NULL COMMENT '发料时间',
  `return_time` datetime DEFAULT NULL COMMENT '退料时间',
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '已分配' COMMENT '状态(已分配,已发料,已退料,已取消)',
  `operator` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '操作人',
  `operator_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '操作人名称',
  `remarks` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `creation_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modification_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_allocation_code` (`allocation_code`) USING BTREE,
  KEY `idx_inventory_id` (`inventory_id`) USING BTREE,
  KEY `idx_material_code` (`material_code`) USING BTREE,
  KEY `idx_batch_number` (`batch_number`) USING BTREE,
  CONSTRAINT `fk_mad_allocation` FOREIGN KEY (`allocation_code`) REFERENCES `material_allocation` (`allocation_code`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_mad_inventory` FOREIGN KEY (`inventory_id`) REFERENCES `production_material_inventory` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='物料分配明细表';

/*Data for the table `material_allocation_detail` */

insert  into `material_allocation_detail`(`id`,`allocation_code`,`inventory_id`,`material_code`,`batch_number`,`warehouse_code`,`storage_location_code`,`allocated_quantity`,`issued_quantity`,`returned_quantity`,`allocation_time`,`issue_time`,`return_time`,`status`,`operator`,`operator_name`,`remarks`,`creation_time`,`modification_time`) values 
(11,'AL20250001',6,'MAT001','BATCH2025001','WH001','LOC001',50.0000,50.0000,0.0000,'2025-01-25 08:30:00','2025-01-25 09:00:00',NULL,'已发料','user01','张三','首批分配','2025-11-21 11:29:35','2025-11-21 11:29:35'),
(12,'AL20250001',7,'MAT001','BATCH2025001','WH001','LOC001',50.0000,30.0000,0.0000,'2025-01-25 08:30:00','2025-01-25 10:00:00',NULL,'已发料','user01','张三','第二批分配','2025-11-21 11:29:35','2025-11-21 11:29:35'),
(13,'AL20250002',8,'MAT002','BATCH2025002','WH001','LOC002',50.0000,50.0000,0.0000,'2025-01-25 09:00:00','2025-01-25 10:15:00',NULL,'已发料','user02','李四','完整分配','2025-11-21 11:29:35','2025-11-21 11:29:35'),
(14,'AL20250004',9,'MAT002','BATCH2025002','WH001','LOC002',30.0000,30.0000,5.0000,'2025-02-01 09:30:00','2025-02-01 11:20:00','2025-02-02 14:00:00','已退料','user03','王五','多余退料','2025-11-21 11:29:35','2025-11-21 11:29:35'),
(15,'AL20250005',10,'MAT001','BATCH2025004','WH002','LOC004',100.0000,70.0000,0.0000,'2025-02-10 09:00:00','2025-02-10 10:45:00',NULL,'已发料','user01','张三','新批次分配','2025-11-21 11:29:35','2025-11-21 11:29:35');

/*Table structure for table `material_info` */

DROP TABLE IF EXISTS `material_info`;

CREATE TABLE `material_info` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `global_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '全局编号',
  `material_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '物料编码',
  `material_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '物料名称',
  `material_specification` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '物料规格',
  `erp_material_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'ERP物料编码',
  `category_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '分类编码',
  `special_classification` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '特殊分类',
  `production_stage_classification` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '生产阶段分类',
  `process_segment_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '工艺段编码',
  `machine_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '机型',
  `minimum_packaging_quantity` decimal(10,4) DEFAULT NULL COMMENT '最小包装数',
  `minimum_safe_stock` decimal(10,4) DEFAULT NULL COMMENT '最低安全库存',
  `maximum_safe_stock` decimal(10,4) DEFAULT NULL COMMENT '最高安全库存',
  `abc_classification` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'ABC分类',
  `management_method` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '管理方式',
  `enable_sku_control` tinyint DEFAULT '0' COMMENT '启用SKU管控(0:否,1:是)',
  `unit` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '单位',
  `box_capacity` decimal(10,4) DEFAULT NULL COMMENT '箱容量',
  `moisture_sensitive_material` tinyint DEFAULT '0' COMMENT '湿敏物料(0:否,1:是)',
  `led_material` tinyint DEFAULT '0' COMMENT 'LED物料(0:否,1:是)',
  `shelf_life_plan_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '保质期方案编码',
  `container_mixed_loading` tinyint DEFAULT '0' COMMENT '容器混装(0:否,1:是)',
  `enable_bom_version_control` tinyint DEFAULT '0' COMMENT '启用BOM版本管控(0:否,1:是)',
  `no_feeding_control` tinyint DEFAULT '0' COMMENT '不管控上料(0:否,1:是)',
  `first_pass_yield_min` decimal(5,2) DEFAULT NULL COMMENT '直通率下限(%)',
  `defect_rate_max` decimal(5,2) DEFAULT NULL COMMENT '不良率上限(%)',
  `production_mixed_package` tinyint DEFAULT '0' COMMENT '生产混包(0:否,1:是)',
  `feeding_requires_inspection` tinyint DEFAULT '0' COMMENT '上料需检验(0:否,1:是)',
  `warehouse_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '仓库编码',
  `industry_attribute` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '行业属性',
  `enabled` tinyint NOT NULL DEFAULT '1' COMMENT '启用(0:否,1:是)',
  `remarks` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `creator` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
  `creator_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人名称',
  `creation_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifier` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人',
  `modifier_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人名称',
  `modification_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `category_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '分类名称',
  `unit_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '单位名称',
  `warehouse_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '仓库名称',
  `shelf_life_plan_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '保质期方案名称',
  `level_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '级别名称',
  `size_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '尺寸名称',
  `process_segment_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '工艺段名称',
  `process_segment_category` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '工艺段类别',
  `level_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '级别编码',
  `size_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '尺寸编码',
  `reflow_timeout_minutes` int DEFAULT NULL COMMENT '回温超时（分钟）',
  `reflow_timeout_control_mode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '回温超时管控模式',
  `reflow_time_hours` decimal(5,2) DEFAULT NULL COMMENT '回温时间（小时）',
  `solder_paste_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '锡膏类型',
  `stirring_time_minutes` int DEFAULT NULL COMMENT '搅拌时间（分钟）',
  `adhesion_value_min` decimal(10,4) DEFAULT NULL COMMENT '粘力值下限',
  `adhesion_value_max` decimal(10,4) DEFAULT NULL COMMENT '粘力值上限',
  `max_reflow_count` int DEFAULT NULL COMMENT '最大回温次数',
  `min_freezing_time_minutes` int DEFAULT NULL COMMENT '最小冷冻时间（分钟）',
  `solder_paste_glue_quantity_control_mode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '锡膏胶水数量管控模式',
  `return_must_stir_idle_time_minutes` int DEFAULT NULL COMMENT '归还后必须搅拌的闲置时间（分钟）',
  `opening_shelf_life_hours` decimal(5,2) DEFAULT NULL COMMENT '开封时效（小时）',
  `panel_production_sequence` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '板面生产顺序',
  `standard_point_defect_rate_ppm` decimal(10,4) DEFAULT NULL COMMENT '标准点位不良率（PPM）',
  `panel_quantity` int DEFAULT NULL COMMENT '拼板数量',
  `standard_waste_rate_per_mille` decimal(5,2) DEFAULT NULL COMMENT '标准抛料率（‰）',
  `drawing_number` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '图号',
  `material_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '物料类型',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `global_id` (`global_id`) USING BTREE,
  UNIQUE KEY `uk_material_code` (`material_code`) USING BTREE,
  KEY `fk_material_warehouse` (`warehouse_code`) USING BTREE,
  KEY `fk_material_shelf_life_plan` (`shelf_life_plan_code`) USING BTREE,
  KEY `fk_material_level` (`level_code`) USING BTREE,
  KEY `fk_material_size` (`size_code`) USING BTREE,
  KEY `fk_material_process_segment` (`process_segment_code`) USING BTREE,
  CONSTRAINT `fk_material_level` FOREIGN KEY (`level_code`) REFERENCES `moisture_sensitive_level` (`level_code`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_material_process_segment` FOREIGN KEY (`process_segment_code`) REFERENCES `process_segment` (`segment_code`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_material_shelf_life_plan` FOREIGN KEY (`shelf_life_plan_code`) REFERENCES `shelf_life_plan` (`shelf_life_plan_code`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_material_size` FOREIGN KEY (`size_code`) REFERENCES `moisture_sensitive_size` (`size_code`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_material_warehouse` FOREIGN KEY (`warehouse_code`) REFERENCES `warehouse` (`warehouse_code`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='物料信息维护表';

/*Data for the table `material_info` */

insert  into `material_info`(`id`,`global_id`,`material_code`,`material_name`,`material_specification`,`erp_material_code`,`category_code`,`special_classification`,`production_stage_classification`,`process_segment_code`,`machine_type`,`minimum_packaging_quantity`,`minimum_safe_stock`,`maximum_safe_stock`,`abc_classification`,`management_method`,`enable_sku_control`,`unit`,`box_capacity`,`moisture_sensitive_material`,`led_material`,`shelf_life_plan_code`,`container_mixed_loading`,`enable_bom_version_control`,`no_feeding_control`,`first_pass_yield_min`,`defect_rate_max`,`production_mixed_package`,`feeding_requires_inspection`,`warehouse_code`,`industry_attribute`,`enabled`,`remarks`,`creator`,`creator_name`,`creation_time`,`modifier`,`modifier_name`,`modification_time`,`category_name`,`unit_name`,`warehouse_name`,`shelf_life_plan_name`,`level_name`,`size_name`,`process_segment_name`,`process_segment_category`,`level_code`,`size_code`,`reflow_timeout_minutes`,`reflow_timeout_control_mode`,`reflow_time_hours`,`solder_paste_type`,`stirring_time_minutes`,`adhesion_value_min`,`adhesion_value_max`,`max_reflow_count`,`min_freezing_time_minutes`,`solder_paste_glue_quantity_control_mode`,`return_must_stir_idle_time_minutes`,`opening_shelf_life_hours`,`panel_production_sequence`,`standard_point_defect_rate_ppm`,`panel_quantity`,`standard_waste_rate_per_mille`,`drawing_number`,`material_type`) values 
(1,'1','MAT001','电阻-1K','1KΩ ±5%',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'PCS',NULL,0,0,NULL,0,0,0,NULL,NULL,0,0,'WH001',NULL,1,NULL,NULL,NULL,'2025-10-26 14:26:33',NULL,NULL,'2025-10-26 14:26:33',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(2,'2','MAT002','电容-10uF','10μF 50V',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'PCS',NULL,0,0,NULL,0,0,0,NULL,NULL,0,0,'WH001',NULL,1,NULL,NULL,NULL,'2025-10-26 14:26:33',NULL,NULL,'2025-10-26 14:26:33',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(3,'3','MAT003','成品主板','V1.0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'PCS',NULL,0,0,NULL,0,0,0,NULL,NULL,0,0,'WH002',NULL,1,NULL,NULL,NULL,'2025-10-26 14:26:33',NULL,NULL,'2025-10-26 14:26:33',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `material_receipt` */

DROP TABLE IF EXISTS `material_receipt`;

CREATE TABLE `material_receipt` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `receipt_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '收料单编码',
  `source_type` varchar(100) COLLATE utf8mb4_general_ci NOT NULL COMMENT '收料类型（采购订单收料/初始化收料/客退收料）',
  `material_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '物料编码',
  `batch_number` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '批次号',
  `quantity` decimal(15,4) NOT NULL COMMENT '收料数量',
  `unit` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '单位',
  `supplier_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '供应商编码',
  `supplier_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '供应商名称',
  `customer_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '客户编码',
  `customer_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '客户名称',
  `workOrder_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '关联工单',
  `warehouse_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '目标仓库',
  `suggested_location` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '建议储位',
  `quality_status` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '合格' COMMENT '质检状态（待检/合格/不合格）',
  `urgent` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '否' COMMENT '加急（是/否）',
  `receipt_status` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '已收货' COMMENT '收料状态（已收货/未收货）',
  `receipt_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '收料时间',
  `operator` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '操作人',
  `operator_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '操作人名称',
  `remarks` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_receipt_no` (`receipt_no`) USING BTREE,
  KEY `idx_material` (`material_code`) USING BTREE,
  KEY `idx_warehouse` (`warehouse_code`) USING BTREE,
  KEY `idx_workorder` (`workOrder_code`) USING BTREE,
  KEY `supplier_code` (`supplier_code`),
  KEY `customer_code` (`customer_code`),
  CONSTRAINT `fk_gr_material` FOREIGN KEY (`material_code`) REFERENCES `material_info` (`material_code`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_gr_warehouse` FOREIGN KEY (`warehouse_code`) REFERENCES `warehouse` (`warehouse_code`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_gr_workorder` FOREIGN KEY (`workOrder_code`) REFERENCES `workordermaintain` (`workOrder_code`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `material_receipt_ibfk_1` FOREIGN KEY (`supplier_code`) REFERENCES `suppliermaintain` (`supplier_code`),
  CONSTRAINT `material_receipt_ibfk_2` FOREIGN KEY (`customer_code`) REFERENCES `customermaintain` (`customer_code`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='收货单表';

/*Data for the table `material_receipt` */

insert  into `material_receipt`(`id`,`receipt_no`,`source_type`,`material_code`,`batch_number`,`quantity`,`unit`,`supplier_code`,`supplier_name`,`customer_code`,`customer_name`,`workOrder_code`,`warehouse_code`,`suggested_location`,`quality_status`,`urgent`,`receipt_status`,`receipt_time`,`operator`,`operator_name`,`remarks`) values 
(1,'GR20250001','采购订单收料','MAT001','BATCH2025001',1000.0000,'PCS','SUP001',NULL,'CUST001',NULL,'WO2024002','WH001','LOC001','合格','否','已收货','2025-01-20 10:00:00','user01','张三','常规采购入库'),
(2,'GR20250002','采购订单收料','MAT002','BATCH2025002',2000.0000,'PCS','SUP002',NULL,'CUST001',NULL,'WO2024001','WH001','LOC002','合格','是','已收货','2025-02-15 09:30:00','user02','李四','电子元件到货'),
(3,'GR20250003','初始化材料','MAT003','FPBATCH2025001',500.0000,'PCS','SUP003',NULL,'CUST002',NULL,'WO2024001','WH002','LOC001','合格','否','已收货','2025-01-25 16:00:00','user03','王五','成品入库'),
(4,'GR20250004','采购订单收料','MAT001','BATCH2025004',800.0000,'PCS','SUP001',NULL,'CUST003',NULL,'WO2024003','WH002','LOC003','合格','否','已收货','2025-04-05 14:00:00','user01','张三','新批次待检'),
(5,'GR20250005','客退收料','MAT002','BATCH2025005',100.0000,'PCS','SUP003',NULL,'CUST002',NULL,'WO2024001','WH001','LOC002','合格','否','已收货','2025-05-18 13:20:00','user02','李四','客户退货');

/*Table structure for table `material_sku` */

DROP TABLE IF EXISTS `material_sku`;

CREATE TABLE `material_sku` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `global_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '全局编号',
  `material_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '物料编码',
  `sku_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'SKU编码',
  `sku_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'SKU名称',
  `enabled` tinyint NOT NULL DEFAULT '1' COMMENT '启用(0:否,1:是)',
  `default_sku` tinyint DEFAULT '0' COMMENT '默认SKU(0:否,1:是)',
  `remarks` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `creator` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
  `creator_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人名称',
  `creation_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifier` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人',
  `modifier_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人名称',
  `modification_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `special_classification` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '特殊分类',
  `moisture_sensitive_material` tinyint DEFAULT '0' COMMENT '湿敏物料(0:否,1:是)',
  `led_material` tinyint DEFAULT '0' COMMENT 'LED物料(0:否,1:是)',
  `material_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '物料名称',
  `material_specification` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '物料规格',
  `organization_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '组织名称',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `global_id` (`global_id`) USING BTREE,
  KEY `fk_material_sku_material` (`material_code`) USING BTREE,
  CONSTRAINT `fk_material_sku_material` FOREIGN KEY (`material_code`) REFERENCES `material_info` (`material_code`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='物料SKU维护表';

/*Data for the table `material_sku` */

insert  into `material_sku`(`id`,`global_id`,`material_code`,`sku_code`,`sku_name`,`enabled`,`default_sku`,`remarks`,`creator`,`creator_name`,`creation_time`,`modifier`,`modifier_name`,`modification_time`,`special_classification`,`moisture_sensitive_material`,`led_material`,`material_name`,`material_specification`,`organization_name`) values 
(1,'1','MAT001','MAT001-SKU1','电阻-1K-0805',1,0,NULL,NULL,NULL,'2025-10-26 14:26:33',NULL,NULL,'2025-10-26 14:26:33',NULL,0,0,NULL,NULL,NULL),
(2,'2','MAT002','MAT002-SKU1','电容-10uF-1206',1,0,NULL,NULL,NULL,'2025-10-26 14:26:33',NULL,NULL,'2025-10-26 14:26:33',NULL,0,0,NULL,NULL,NULL),
(3,'3','MAT003','MAT003-SKU1','成品主板-V1.0',1,0,NULL,NULL,NULL,'2025-10-26 14:26:33',NULL,NULL,'2025-10-26 14:26:33',NULL,0,0,NULL,NULL,NULL);

/*Table structure for table `material_tracking` */

DROP TABLE IF EXISTS `material_tracking`;

CREATE TABLE `material_tracking` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `tracking_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '跟踪单号',
  `workorder_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '工单编码',
  `material_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '物料编码',
  `batch_number` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '批次号',
  `tracking_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '跟踪类型(领料,退料,消耗,报废)',
  `quantity` decimal(15,4) NOT NULL COMMENT '数量',
  `unit` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '单位',
  `from_warehouse_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '来源仓库',
  `from_storage_location_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '来源储位',
  `to_warehouse_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '目标仓库',
  `to_storage_location_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '目标储位',
  `production_line_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '产线编码',
  `workstation_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '工位编码',
  `operation_time` datetime DEFAULT NULL COMMENT '操作时间',
  `operator` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '操作人',
  `operator_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '操作人名称',
  `reference_doc_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '参考单据类型',
  `reference_doc_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '参考单据编码',
  `remarks` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `creation_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_tracking_code` (`tracking_code`) USING BTREE,
  KEY `idx_workorder_code` (`workorder_code`) USING BTREE,
  KEY `idx_material_code` (`material_code`) USING BTREE,
  KEY `idx_batch_number` (`batch_number`) USING BTREE,
  KEY `idx_tracking_type` (`tracking_type`) USING BTREE,
  KEY `idx_operation_time` (`operation_time`) USING BTREE,
  CONSTRAINT `fk_mt_material` FOREIGN KEY (`material_code`) REFERENCES `material_info` (`material_code`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_mt_workorder` FOREIGN KEY (`workorder_code`) REFERENCES `workordermaintain` (`workOrder_code`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='物料跟踪表';

/*Data for the table `material_tracking` */

insert  into `material_tracking`(`id`,`tracking_code`,`workorder_code`,`material_code`,`batch_number`,`tracking_type`,`quantity`,`unit`,`from_warehouse_code`,`from_storage_location_code`,`to_warehouse_code`,`to_storage_location_code`,`production_line_code`,`workstation_code`,`operation_time`,`operator`,`operator_name`,`reference_doc_type`,`reference_doc_code`,`remarks`,`creation_time`) values 
(1,'TRACK20250001','WO2024001','MAT001','BATCH2025001','领料',50.0000,'PCS','WH001','LOC001',NULL,NULL,'PL001','WS001','2025-01-25 09:00:00','user01','张三','分配单','AL20250001','生产领料','2025-11-21 11:26:29'),
(2,'TRACK20250002','WO2024001','MAT001','BATCH2025001','领料',30.0000,'PCS','WH001','LOC001',NULL,NULL,'PL001','WS001','2025-01-25 10:00:00','user01','张三','分配单','AL20250001','补充领料','2025-11-21 11:26:29'),
(3,'TRACK20250003','WO2024001','MAT002','BATCH2025002','领料',50.0000,'PCS','WH001','LOC002',NULL,NULL,'PL001','WS001','2025-01-25 10:15:00','user02','李四','分配单','AL20250002','正常领料','2025-11-21 11:26:29'),
(4,'TRACK20250004','WO2024002','MAT002','BATCH2025002','退料',5.0000,'PCS',NULL,NULL,'WH001','LOC002','PL002','WS002','2025-02-02 14:00:00','user03','王五','分配单','AL20250004','多余退料','2025-11-21 11:26:29'),
(5,'TRACK20250005','WO2024003','MAT001','BATCH2025004','领料',70.0000,'PCS','WH002','LOC004',NULL,NULL,'PL003','WS003','2025-02-10 10:45:00','user01','张三','分配单','AL20250005','新批次领料','2025-11-21 11:26:29');

/*Table structure for table `material_usage` */

DROP TABLE IF EXISTS `material_usage`;

CREATE TABLE `material_usage` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `workorder_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `material_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `usage_qty` int NOT NULL DEFAULT '0',
  `remain_qty` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `workorder_code` (`workorder_code`) USING BTREE,
  CONSTRAINT `material_usage_ibfk_1` FOREIGN KEY (`workorder_code`) REFERENCES `smt_dashboard` (`workorder_code`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

/*Data for the table `material_usage` */

insert  into `material_usage`(`id`,`workorder_code`,`material_code`,`usage_qty`,`remain_qty`) values 
(1,'MO230112015-SMT','08-5003-531044',76,99),
(2,'MO230112015-SMT','08-5005-534768',4,93);

/*Table structure for table `moisture_sensitive_level` */

DROP TABLE IF EXISTS `moisture_sensitive_level`;

CREATE TABLE `moisture_sensitive_level` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `global_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '全局编号',
  `level_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '级别编码',
  `level_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '级别名称',
  `enabled` tinyint NOT NULL DEFAULT '1' COMMENT '启用(0:否,1:是)',
  `exposure_time` int DEFAULT NULL COMMENT '可暴露时间',
  `unit` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '单位',
  `exposure_time_hours` int DEFAULT NULL COMMENT '可暴露时间（小时）',
  `return_material_exposure_remaining_hours` int DEFAULT NULL COMMENT '退料暴露剩余时间（小时）',
  `remarks` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `creator` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
  `creator_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人名称',
  `creation_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifier` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人',
  `modifier_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人名称',
  `modification_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `global_id` (`global_id`) USING BTREE,
  UNIQUE KEY `uk_level_code` (`level_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='湿敏元件级别维护表';

/*Data for the table `moisture_sensitive_level` */

insert  into `moisture_sensitive_level`(`id`,`global_id`,`level_code`,`level_name`,`enabled`,`exposure_time`,`unit`,`exposure_time_hours`,`return_material_exposure_remaining_hours`,`remarks`,`creator`,`creator_name`,`creation_time`,`modifier`,`modifier_name`,`modification_time`) values 
(1,'1','MSL1','1级',1,NULL,NULL,168,NULL,NULL,NULL,NULL,'2025-10-26 14:26:33',NULL,NULL,'2025-10-26 14:26:33'),
(2,'2','MSL2','2级',1,NULL,NULL,336,NULL,NULL,NULL,NULL,'2025-10-26 14:26:33',NULL,NULL,'2025-10-26 14:26:33'),
(3,'3','MSL3','3级',1,NULL,NULL,504,NULL,NULL,NULL,NULL,'2025-10-26 14:26:33',NULL,NULL,'2025-10-26 14:26:33');

/*Table structure for table `moisture_sensitive_size` */

DROP TABLE IF EXISTS `moisture_sensitive_size`;

CREATE TABLE `moisture_sensitive_size` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `global_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '全局编号',
  `size_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '尺寸编码',
  `size_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '尺寸名称',
  `enabled` tinyint NOT NULL DEFAULT '1' COMMENT '启用(0:否,1:是)',
  `remarks` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `creator` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
  `creator_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人名称',
  `creation_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifier` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人',
  `modifier_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人名称',
  `modification_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `global_id` (`global_id`) USING BTREE,
  UNIQUE KEY `uk_size_code` (`size_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='湿敏元件尺寸维护表';

/*Data for the table `moisture_sensitive_size` */

insert  into `moisture_sensitive_size`(`id`,`global_id`,`size_code`,`size_name`,`enabled`,`remarks`,`creator`,`creator_name`,`creation_time`,`modifier`,`modifier_name`,`modification_time`) values 
(1,'1','SIZE1','小尺寸',1,NULL,NULL,NULL,'2025-10-26 14:26:33',NULL,NULL,'2025-10-26 14:26:33'),
(2,'2','SIZE2','中尺寸',1,NULL,NULL,NULL,'2025-10-26 14:26:33',NULL,NULL,'2025-10-26 14:26:33'),
(3,'3','SIZE3','大尺寸',1,NULL,NULL,NULL,'2025-10-26 14:26:33',NULL,NULL,'2025-10-26 14:26:33');

/*Table structure for table `next_workorder` */

DROP TABLE IF EXISTS `next_workorder`;

CREATE TABLE `next_workorder` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `workorder_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `product_info` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `product_spec` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `plan_qty` int NOT NULL,
  `plan_start` datetime NOT NULL,
  `plan_end` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `workorder_code` (`workorder_code`) USING BTREE,
  CONSTRAINT `next_workorder_ibfk_1` FOREIGN KEY (`workorder_code`) REFERENCES `smt_dashboard` (`workorder_code`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

/*Data for the table `next_workorder` */

insert  into `next_workorder`(`id`,`workorder_code`,`product_info`,`product_spec`,`plan_qty`,`plan_start`,`plan_end`) values 
(1,'MO230112015-SMT','便携储能-PCBA-SMT','HTE032-M-A4 (MCU-N32G)',2000,'2023-02-03 14:07:00','2023-02-04 04:25:00');

/*Table structure for table `organizationmaintain` */

DROP TABLE IF EXISTS `organizationmaintain`;

CREATE TABLE `organizationmaintain` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `org_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '组织编码',
  `org_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '组织名称',
  `orgType` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '组织类型',
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '电话',
  `fax` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '传真',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '邮件',
  `enabled` tinyint NOT NULL COMMENT '启用(0：否  1：是)',
  `remarks` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `modifier` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人',
  `modifier_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人名称',
  `modify_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `org_code` (`org_code`) USING BTREE,
  CONSTRAINT `organizationmaintain_chk_1` CHECK ((`enabled` in (0,1)))
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

/*Data for the table `organizationmaintain` */

insert  into `organizationmaintain`(`id`,`org_code`,`org_name`,`orgType`,`phone`,`fax`,`email`,`enabled`,`remarks`,`modifier`,`modifier_name`,`modify_time`) values 
(1,'ORG001','电子制造事业部','生产制造类','13800138001','020-88888881','dzzbsyb@example.com',1,NULL,NULL,'管理员','2025-11-09 18:26:01'),
(2,'ORG002','塑胶加工事业部','生产制造类','13800138002','020-88888882','sjjgsyb@example.com',1,NULL,NULL,'管理员','2025-11-09 18:26:49'),
(3,'ORG003','通信配件事业部','生产制造类','13800138003','020-88888883','txpjbsyb@example.com',1,NULL,NULL,'管理员','2025-11-09 18:27:13'),
(4,'ORG004','综合管理部','职能管理类','13800138004','020-88888884','zhglb@example.com',1,NULL,NULL,'管理员','2025-11-09 18:27:30');

/*Table structure for table `picking_task` */

DROP TABLE IF EXISTS `picking_task`;

CREATE TABLE `picking_task` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `picking_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '拣货单号',
  `allocation_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '关联分配单号',
  `workOrder_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '工单编码',
  `material_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '物料编码',
  `required_quantity` decimal(15,4) NOT NULL COMMENT '需求数量',
  `picked_quantity` decimal(15,4) DEFAULT '0.0000' COMMENT '已拣数量',
  `suggested_location` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '建议储位',
  `actual_location` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '实际拣货储位',
  `batch_number` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '批次号',
  `picking_status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '待拣货' COMMENT '拣货状态（待拣货/拣货中/已拣货/已复核）',
  `assign_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '任务分配时间',
  `start_time` datetime DEFAULT NULL COMMENT '开始拣货时间',
  `complete_time` datetime DEFAULT NULL COMMENT '完成时间',
  `picker` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '拣货人',
  `picker_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '拣货人名称',
  `checker` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '复核人',
  `checker_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '复核人名称',
  `remarks` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_picking_no` (`picking_no`) USING BTREE,
  KEY `idx_allocation` (`allocation_code`) USING BTREE,
  KEY `idx_workorder` (`workOrder_code`) USING BTREE,
  KEY `idx_material` (`material_code`) USING BTREE,
  CONSTRAINT `fk_pt_alloc` FOREIGN KEY (`allocation_code`) REFERENCES `material_allocation` (`allocation_code`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_pt_material` FOREIGN KEY (`material_code`) REFERENCES `material_info` (`material_code`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_pt_workorder` FOREIGN KEY (`workOrder_code`) REFERENCES `workordermaintain` (`workOrder_code`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='拣货任务表';

/*Data for the table `picking_task` */

insert  into `picking_task`(`id`,`picking_no`,`allocation_code`,`workOrder_code`,`material_code`,`required_quantity`,`picked_quantity`,`suggested_location`,`actual_location`,`batch_number`,`picking_status`,`assign_time`,`start_time`,`complete_time`,`picker`,`picker_name`,`checker`,`checker_name`,`remarks`) values 
(1,'PK20250001','AL20250001','WO2024001','MAT001',100.0000,100.0000,'LOC001','LOC001','BATCH2025001','已复核','2025-01-25 08:00:00','2025-01-25 08:30:00','2025-01-25 09:20:00','user01','张三','user06','孙八','首件生产备料'),
(2,'PK20250002','AL20250002','WO2024001','MAT002',50.0000,50.0000,'LOC002','LOC002','BATCH2025002','已复核','2025-01-25 08:00:00','2025-01-25 09:00:00','2025-01-25 10:00:00','user02','李四','user06','孙八','同步发料'),
(3,'PK20250003','AL20250003','WO2024002','MAT001',80.0000,0.0000,'LOC001','LOC001','BATCH2025001','待拣货','2025-02-01 08:30:00','2025-11-27 14:11:42',NULL,NULL,NULL,NULL,NULL,'等待物料可用'),
(4,'PK20250004','AL20250004','WO2024002','MAT002',30.0000,30.0000,'LOC002','LOC002','BATCH2025002','已复核','2025-02-01 08:30:00','2025-02-01 09:30:00','2025-02-01 11:00:00','user03','王五','user06','孙八','组装线备料'),
(5,'PK20250005','AL20250005','WO2024003','MAT001',120.0000,100.0000,'LOC003','LOC003','BATCH2025004','拣货中','2025-02-10 08:00:00','2025-02-10 09:00:00',NULL,'user01','张三',NULL,NULL,'分批拣货');

/*Table structure for table `process` */

DROP TABLE IF EXISTS `process`;

CREATE TABLE `process` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `global_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '全局编号',
  `process_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '工序编码',
  `process_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '工序名称',
  `process_segment_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '工艺段编码',
  `process_segment_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '工艺段名称',
  `process_segment_category` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '工艺段类别',
  `defective_repair_process` tinyint NOT NULL DEFAULT '0' COMMENT '不良品维修工序(0:否,1:是)',
  `collection_process` tinyint NOT NULL DEFAULT '0' COMMENT '采集工序(0:否,1:是)',
  `batch_inspection_process` tinyint NOT NULL DEFAULT '0' COMMENT '批次检验工序(0:否,1:是)',
  `first_article_inspection_process` tinyint NOT NULL DEFAULT '0' COMMENT '首件检验工序(0:否,1:是)',
  `label_conversion_process` tinyint NOT NULL DEFAULT '0' COMMENT '转换标签工序(0:否,1:是)',
  `enabled` tinyint NOT NULL DEFAULT '1' COMMENT '启用(0:否,1:是)',
  `production_label_type_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '生产标签类型编码',
  `production_label_type_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '生产标签类型名称',
  `new_production_label_type_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '新生产标签类型编码',
  `new_production_label_type_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '新生产标签类型名称',
  `special_label_type_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '特殊标签类型编码',
  `lpn_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'LPN类型',
  `label_rule_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '标签规则编码',
  `physical_label_validation_rule_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '实物标签校验规则编码',
  `new_physical_label_validation_rule_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '新实物标签校验规则编码',
  `template_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '模板编码',
  `label_standard_capacity` decimal(10,2) DEFAULT NULL COMMENT '标签标准容量',
  `new_label_code_rule_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '新标签编码规则编码',
  `process_execution_time_control` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '工序执行时间控制',
  `conversion_method` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '转换方式',
  `batch_inspection_level` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '批次检验层级',
  `process_operation_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '工序作业类型',
  `process_classification` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '工序分类',
  `processing_classification` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '加工分类',
  `generation_method` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '生成方式',
  `new_label_generation_method` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '新标签生成方式',
  `remarks` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `creator` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
  `creator_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人名称',
  `creation_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifier` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人',
  `modifier_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人名称',
  `modification_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `global_id` (`global_id`) USING BTREE,
  UNIQUE KEY `uk_process_code` (`process_code`) USING BTREE,
  KEY `fk_process_segment` (`process_segment_code`) USING BTREE,
  CONSTRAINT `fk_process_segment` FOREIGN KEY (`process_segment_code`) REFERENCES `process_segment` (`segment_code`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='工序维护表';

/*Data for the table `process` */

insert  into `process`(`id`,`global_id`,`process_code`,`process_name`,`process_segment_code`,`process_segment_name`,`process_segment_category`,`defective_repair_process`,`collection_process`,`batch_inspection_process`,`first_article_inspection_process`,`label_conversion_process`,`enabled`,`production_label_type_code`,`production_label_type_name`,`new_production_label_type_code`,`new_production_label_type_name`,`special_label_type_code`,`lpn_type`,`label_rule_code`,`physical_label_validation_rule_code`,`new_physical_label_validation_rule_code`,`template_code`,`label_standard_capacity`,`new_label_code_rule_code`,`process_execution_time_control`,`conversion_method`,`batch_inspection_level`,`process_operation_type`,`process_classification`,`processing_classification`,`generation_method`,`new_label_generation_method`,`remarks`,`creator`,`creator_name`,`creation_time`,`modifier`,`modifier_name`,`modification_time`) values 
(1,'1','PROC001','贴片工序','PS001',NULL,NULL,0,0,0,0,0,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-10-26 14:26:33',NULL,NULL,'2025-10-26 14:26:33'),
(2,'2','PROC002','焊接工序','PS001',NULL,NULL,0,0,0,0,0,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-10-26 14:26:33',NULL,NULL,'2025-10-26 14:26:33'),
(3,'3','PROC003','功能测试','PS003',NULL,NULL,0,0,0,0,0,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-10-26 14:26:33',NULL,NULL,'2025-10-26 14:26:33');

/*Table structure for table `process_info` */

DROP TABLE IF EXISTS `process_info`;

CREATE TABLE `process_info` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `workorder_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `process_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `qualified` int NOT NULL DEFAULT '0',
  `unqualified` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `workorder_code` (`workorder_code`) USING BTREE,
  CONSTRAINT `process_info_ibfk_1` FOREIGN KEY (`workorder_code`) REFERENCES `smt_dashboard` (`workorder_code`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

/*Data for the table `process_info` */

insert  into `process_info`(`id`,`workorder_code`,`process_name`,`qualified`,`unqualified`) values 
(1,'MO230112015-SMT','SPI工序',20,0),
(2,'MO230112015-SMT','AOI工序',10,0),
(3,'MO230112015-SMT','SPI工序',2,0);

/*Table structure for table `process_segment` */

DROP TABLE IF EXISTS `process_segment`;

CREATE TABLE `process_segment` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `segment_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '工艺段编码',
  `segment_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '工艺段名称',
  `segment_category` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '工艺段类别',
  `scheduling_resource_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '排产资源类型',
  `resource_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '资源类型',
  `production_label_type_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '生产标签类型编码',
  `production_label_type_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '生产标签类型名称',
  `enabled` tinyint NOT NULL DEFAULT '1' COMMENT '启用(0:否,1:是)',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `segment_code` (`segment_code`) USING BTREE,
  UNIQUE KEY `uk_segment_code` (`segment_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='工艺段维护表';

/*Data for the table `process_segment` */

insert  into `process_segment`(`id`,`segment_code`,`segment_name`,`segment_category`,`scheduling_resource_type`,`resource_type`,`production_label_type_code`,`production_label_type_name`,`enabled`) values 
(1,'PS001','SMT工艺段','SMT',NULL,NULL,NULL,NULL,1),
(2,'PS002','组装工艺段','ASSEMBLY',NULL,NULL,NULL,NULL,1),
(3,'PS003','测试工艺段','TEST',NULL,NULL,NULL,NULL,1);

/*Table structure for table `product_process_material` */

DROP TABLE IF EXISTS `product_process_material`;

CREATE TABLE `product_process_material` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `process_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '工序编码',
  `material_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '物料编码',
  `is_main_material` tinyint NOT NULL DEFAULT '0' COMMENT '主料(0:否,1:是)',
  `main_material_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '主料编码',
  `quantity` decimal(10,4) NOT NULL COMMENT '用量',
  `product_base` decimal(10,4) NOT NULL COMMENT '产品基数',
  `sku_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'SKU编码',
  `sku_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'SKU名称',
  `placement` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '点位',
  `process_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '工序名称',
  `material_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '物料名称',
  `material_specification` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '物料规格',
  `special_classification` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '特殊分类',
  `production_stage_classification` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '生产阶段分类',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_ppm_process` (`process_code`) USING BTREE,
  KEY `fk_ppm_material` (`material_code`) USING BTREE,
  KEY `fk_ppm_main_material` (`main_material_code`) USING BTREE,
  CONSTRAINT `fk_ppm_main_material` FOREIGN KEY (`main_material_code`) REFERENCES `material_info` (`material_code`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_ppm_material` FOREIGN KEY (`material_code`) REFERENCES `material_info` (`material_code`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_ppm_process` FOREIGN KEY (`process_code`) REFERENCES `process` (`process_code`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='产品工序物料维护表';

/*Data for the table `product_process_material` */

insert  into `product_process_material`(`id`,`process_code`,`material_code`,`is_main_material`,`main_material_code`,`quantity`,`product_base`,`sku_code`,`sku_name`,`placement`,`process_name`,`material_name`,`material_specification`,`special_classification`,`production_stage_classification`) values 
(2,'PROC001','MAT001',0,NULL,10.0000,1.0000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(3,'PROC001','MAT002',0,NULL,5.0000,1.0000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(4,'PROC002','MAT003',0,NULL,1.0000,1.0000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `product_process_parameter` */

DROP TABLE IF EXISTS `product_process_parameter`;

CREATE TABLE `product_process_parameter` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `global_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '全局编号',
  `parameter_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '产品工序参数编码',
  `product_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '产品编码',
  `process_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '工序编码',
  `route_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '工艺路线编码',
  `sampling_process` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '抽测工序',
  `sampling_control_mode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '抽测管控方式',
  `sampling_ratio_numerator` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '抽测比例分子',
  `sampling_ratio_denominator` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '抽测比例分母',
  `sampling_defect_control_mode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '抽测出现不良时管控模式',
  `win_system_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '局胜制编码',
  `batch_inspection_sampling_control_mode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '批次检验且为抽测工序管控方式',
  `first_pass_yield_min` decimal(5,2) DEFAULT NULL COMMENT '直通率下限（%）',
  `defect_rate_max` decimal(5,2) DEFAULT NULL COMMENT '不良率上限（%）',
  `first_article_inspection_process` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '首件检验工序',
  `max_operation_time` decimal(10,2) DEFAULT NULL COMMENT '同工序内最大操作时间（分钟）',
  `min_operation_time` decimal(10,2) DEFAULT NULL COMMENT '同工序内最小操作时间（分钟）',
  `remarks` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `creator` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
  `creator_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人名称',
  `creation_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifier` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人',
  `modifier_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人名称',
  `modification_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `process_time_control` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '工序执行时间控制',
  `process_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '工序名称',
  `product_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '产品名称',
  `process_segment_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '工艺段编码',
  `route_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '工艺路线名称',
  `product_specification` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '产品规格',
  `process_segment_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '工艺段名称',
  `process_segment_category` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '工艺段类别',
  `production_stage_classification` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '生产阶段分类',
  `machine_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '机型',
  `label_conversion_process` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '转换标签工序',
  `batch_inspection_process` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '批次检验工序',
  `win_system_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '局胜制名称',
  `max_rounds` int DEFAULT NULL COMMENT '最大局数',
  `defective_repair_process` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '不良品维修工序',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `global_id` (`global_id`) USING BTREE,
  KEY `fk_ppp_product` (`product_code`) USING BTREE,
  KEY `fk_ppp_process` (`process_code`) USING BTREE,
  CONSTRAINT `fk_ppp_process` FOREIGN KEY (`process_code`) REFERENCES `process` (`process_code`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_ppp_product` FOREIGN KEY (`product_code`) REFERENCES `material_info` (`material_code`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='产品工序参数维护表';

/*Data for the table `product_process_parameter` */

insert  into `product_process_parameter`(`id`,`global_id`,`parameter_code`,`product_code`,`process_code`,`route_code`,`sampling_process`,`sampling_control_mode`,`sampling_ratio_numerator`,`sampling_ratio_denominator`,`sampling_defect_control_mode`,`win_system_code`,`batch_inspection_sampling_control_mode`,`first_pass_yield_min`,`defect_rate_max`,`first_article_inspection_process`,`max_operation_time`,`min_operation_time`,`remarks`,`creator`,`creator_name`,`creation_time`,`modifier`,`modifier_name`,`modification_time`,`process_time_control`,`process_name`,`product_name`,`process_segment_code`,`route_name`,`product_specification`,`process_segment_name`,`process_segment_category`,`production_stage_classification`,`machine_type`,`label_conversion_process`,`batch_inspection_process`,`win_system_name`,`max_rounds`,`defective_repair_process`) values 
(2,'1','PPP001','MAT003','PROC001',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-10-26 14:26:33',NULL,NULL,'2025-10-26 14:26:33',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(3,'2','PPP002','MAT003','PROC002',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-10-26 14:26:33',NULL,NULL,'2025-10-26 14:26:33',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(4,'3','PPP003','MAT003','PROC003',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-10-26 14:26:33',NULL,NULL,'2025-10-26 14:26:33',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `product_process_position` */

DROP TABLE IF EXISTS `product_process_position`;

CREATE TABLE `product_process_position` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `global_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '全局编号',
  `process_resource_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '工序人机料编码',
  `product_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '产品编码',
  `bom_version` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'BOM版本',
  `board_side` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '板面',
  `route_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '工艺路线编码',
  `enabled` tinyint NOT NULL DEFAULT '1' COMMENT '启用(0:否,1:是)',
  `remarks` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `creator` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
  `creator_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人名称',
  `creation_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifier` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人',
  `modifier_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人名称',
  `modification_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `type_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '类型值',
  `organization_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '组织名称',
  `machine_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '机型',
  `product_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '产品名称',
  `product_specification` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '产品规格',
  `production_stage_classification` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '生产阶段分类',
  `process_segment_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '工艺段编码',
  `enable_bom_version_control` tinyint DEFAULT '0' COMMENT '启用BOM版本管控(0:否,1:是)',
  `process_segment_category` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '工艺段类别',
  `route_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '工艺路线名称',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `global_id` (`global_id`) USING BTREE,
  KEY `fk_ppp_position_product` (`product_code`) USING BTREE,
  CONSTRAINT `fk_ppp_position_product` FOREIGN KEY (`product_code`) REFERENCES `material_info` (`material_code`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='产品工序岗位维护表';

/*Data for the table `product_process_position` */

/*Table structure for table `product_process_tooling` */

DROP TABLE IF EXISTS `product_process_tooling`;

CREATE TABLE `product_process_tooling` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `global_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '全局编号',
  `process_resource_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '工序人机料编码',
  `product_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '产品编码',
  `bom_version` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'BOM版本',
  `board_side` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '板面',
  `route_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '工艺路线编码',
  `enabled` tinyint NOT NULL DEFAULT '1' COMMENT '启用(0:否,1:是)',
  `remarks` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `creator` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
  `creator_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人名称',
  `creation_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifier` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人',
  `modifier_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人名称',
  `modification_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `type_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '类型值',
  `organization_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '组织名称',
  `machine_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '机型',
  `product_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '产品名称',
  `product_specification` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '产品规格',
  `production_stage_classification` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '生产阶段分类',
  `process_segment_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '工艺段编码',
  `enable_bom_version_control` tinyint DEFAULT '0' COMMENT '启用BOM版本管控(0:否,1:是)',
  `process_segment_category` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '工艺段类别',
  `route_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '工艺路线名称',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `global_id` (`global_id`) USING BTREE,
  KEY `fk_ppt_tooling_product` (`product_code`) USING BTREE,
  CONSTRAINT `fk_ppt_tooling_product` FOREIGN KEY (`product_code`) REFERENCES `material_info` (`material_code`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='产品工序工装维护表';

/*Data for the table `product_process_tooling` */

/*Table structure for table `production_line` */

DROP TABLE IF EXISTS `production_line`;

CREATE TABLE `production_line` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `line_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '产线编码',
  `line_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '产线名称',
  `workshop_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '车间编码',
  `workshop_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '车间名称',
  `process_segment_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '工艺段编码',
  `process_segment_category` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '工艺段类别',
  `line_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '产线类型',
  `mandatory_delivery_check` tinyint DEFAULT '0' COMMENT '强制配送核对(0:否,1:是)',
  `max_work_orders` int NOT NULL DEFAULT '1' COMMENT '同时最大在产工单数',
  `virtual_warehouse_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '虚拟库编码',
  `enabled` tinyint NOT NULL DEFAULT '1' COMMENT '启用(0:否,1:是)',
  `organization_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '组织名称',
  `remarks` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `modifier` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人',
  `modifier_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人名称',
  `modification_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `line_code` (`line_code`) USING BTREE,
  UNIQUE KEY `uk_line_code` (`line_code`) USING BTREE,
  KEY `fk_production_line_workshop` (`workshop_code`) USING BTREE,
  KEY `fk_production_line_process_segment` (`process_segment_code`) USING BTREE,
  CONSTRAINT `fk_production_line_process_segment` FOREIGN KEY (`process_segment_code`) REFERENCES `process_segment` (`segment_code`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_production_line_workshop` FOREIGN KEY (`workshop_code`) REFERENCES `workshop` (`workshop_code`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='产线维护表';

/*Data for the table `production_line` */

insert  into `production_line`(`id`,`line_code`,`line_name`,`workshop_code`,`workshop_name`,`process_segment_code`,`process_segment_category`,`line_type`,`mandatory_delivery_check`,`max_work_orders`,`virtual_warehouse_code`,`enabled`,`organization_name`,`remarks`,`modifier`,`modifier_name`,`modification_time`) values 
(2,'PL001','SMT产线1','WS001','SMT车间',NULL,NULL,NULL,0,1,NULL,1,NULL,NULL,NULL,NULL,'2025-10-26 14:26:33'),
(3,'PL002','组装产线1','WS002','组装车间',NULL,NULL,NULL,0,1,NULL,1,NULL,NULL,NULL,NULL,'2025-10-26 14:26:33'),
(4,'PL003','测试产线1','WS003','测试车间',NULL,NULL,NULL,0,1,NULL,1,NULL,NULL,NULL,NULL,'2025-10-26 14:26:33');

/*Table structure for table `production_material_inventory` */

DROP TABLE IF EXISTS `production_material_inventory`;

CREATE TABLE `production_material_inventory` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `material_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '物料编码',
  `warehouse_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '仓库编码',
  `storage_location_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '储位编码',
  `batch_number` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '批次号',
  `sku_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'SKU编码',
  `total_quantity` decimal(15,4) NOT NULL DEFAULT '0.0000' COMMENT '总数量',
  `available_quantity` decimal(15,4) NOT NULL DEFAULT '0.0000' COMMENT '可用数量',
  `locked_quantity` decimal(15,4) NOT NULL DEFAULT '0.0000' COMMENT '锁定数量',
  `allocated_quantity` decimal(15,4) NOT NULL DEFAULT '0.0000' COMMENT '已分配数量',
  `unit` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '单位',
  `supplier_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '供应商编码',
  `production_date` date DEFAULT NULL COMMENT '生产日期',
  `expiry_date` date DEFAULT NULL COMMENT '有效期至',
  `quality_status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '合格' COMMENT '质量状态(合格,不合格,待检)',
  `inventory_status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '正常' COMMENT '库存状态(正常,冻结,待处理)',
  `last_in_time` datetime DEFAULT NULL COMMENT '最后入库时间',
  `last_out_time` datetime DEFAULT NULL COMMENT '最后出库时间',
  `remarks` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `creator` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
  `creator_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人名称',
  `creation_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifier` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人',
  `modifier_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人名称',
  `modification_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_material_batch_location` (`material_code`,`batch_number`,`warehouse_code`,`storage_location_code`) USING BTREE,
  KEY `idx_material_code` (`material_code`) USING BTREE,
  KEY `idx_warehouse_code` (`warehouse_code`) USING BTREE,
  KEY `idx_batch_number` (`batch_number`) USING BTREE,
  KEY `idx_sku_code` (`sku_code`) USING BTREE,
  KEY `fk_pmi_storage_location` (`storage_location_code`) USING BTREE,
  CONSTRAINT `fk_pmi_material` FOREIGN KEY (`material_code`) REFERENCES `material_info` (`material_code`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_pmi_storage_location` FOREIGN KEY (`storage_location_code`) REFERENCES `storage_location` (`location_code`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_pmi_warehouse` FOREIGN KEY (`warehouse_code`) REFERENCES `warehouse` (`warehouse_code`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='生产物料库存表';

/*Data for the table `production_material_inventory` */

insert  into `production_material_inventory`(`id`,`material_code`,`warehouse_code`,`storage_location_code`,`batch_number`,`sku_code`,`total_quantity`,`available_quantity`,`locked_quantity`,`allocated_quantity`,`unit`,`supplier_code`,`production_date`,`expiry_date`,`quality_status`,`inventory_status`,`last_in_time`,`last_out_time`,`remarks`,`creator`,`creator_name`,`creation_time`,`modifier`,`modifier_name`,`modification_time`) values 
(6,'MAT001','WH001','LOC001','BATCH2025001','MAT001-SKU1',1000.0000,800.0000,100.0000,100.0000,'PCS','SUP001','2025-01-15','2026-01-15','合格','正常','2025-01-20 10:00:00','2025-01-25 14:30:00','常规库存','admin','系统管理员','2025-11-21 11:24:36',NULL,NULL,'2025-11-21 11:24:36'),
(7,'MAT002','WH001','LOC002','BATCH2025002','MAT002-SKU1',2000.0000,1500.0000,300.0000,200.0000,'PCS','SUP002','2025-02-10','2026-02-10','合格','正常','2025-02-15 09:30:00','2025-02-20 16:45:00','电子元件','admin','系统管理员','2025-11-21 11:24:36',NULL,NULL,'2025-11-21 11:24:36'),
(8,'MAT003','WH002','LOC003','BATCH2025003','MAT003-SKU1',500.0000,400.0000,50.0000,50.0000,'PCS','SUP003','2025-03-05','2026-03-05','合格','正常','2025-03-10 11:20:00','2025-03-15 10:15:00','成品库存','admin','系统管理员','2025-11-21 11:24:36',NULL,NULL,'2025-11-21 11:24:36'),
(9,'MAT001','WH002','LOC003','BATCH2025004','MAT001-SKU1',800.0000,600.0000,100.0000,100.0000,'PCS','SUP001','2025-04-01','2026-04-01','待检','待处理','2025-04-05 14:00:00',NULL,'新到货物','admin','系统管理员','2025-11-21 11:24:36',NULL,NULL,'2025-11-21 11:24:36'),
(10,'MAT002','WH001','LOC002','BATCH2025005','MAT002-SKU1',1500.0000,1200.0000,200.0000,100.0000,'PCS','SUP002','2025-05-12','2026-05-12','合格','冻结','2025-05-15 08:45:00','2025-05-18 13:20:00','质量抽检','admin','系统管理员','2025-11-21 11:24:36',NULL,NULL,'2025-11-21 11:24:36');

/*Table structure for table `productionscheduletable` */

DROP TABLE IF EXISTS `productionscheduletable`;

CREATE TABLE `productionscheduletable` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `productionLine_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '产线编码',
  `	productionLine_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '产线名称',
  `productionSeq` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '生产顺序',
  `workOrder_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '工单编码',
  `workshop_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '车间编码',
  `workshop_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '车间名称',
  `product_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '产品编码',
  `product_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '产品名称',
  `product_specification` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '产品规格',
  `planQty` int DEFAULT NULL COMMENT '计划数量',
  `productionQty` int DEFAULT NULL COMMENT '生产数量',
  `productionStatus` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '生产状态',
  `processSection_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '工艺段编码',
  `workOrderType` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '工单类型',
  `standardCapacity` decimal(10,0) DEFAULT NULL COMMENT '标准产能（生产数/小时）',
  `configuredPersonnelQty` int DEFAULT NULL COMMENT '配置人数',
  `planStart_time` datetime DEFAULT NULL COMMENT '计划开始时间',
  `planEnd_time` datetime DEFAULT NULL COMMENT '计划结束时间',
  `scheduleStart_time` datetime DEFAULT NULL COMMENT '排程开始时间',
  `scheduleEnd_time` datetime DEFAULT NULL COMMENT '排程结束时间',
  `productionStart_time` datetime DEFAULT NULL COMMENT '投产时间',
  `productionTransfer_time` datetime DEFAULT NULL COMMENT '转产时间',
  `remainingProduction_time` decimal(10,0) DEFAULT NULL COMMENT '生产剩余所需时间（分钟）',
  `estimatedEnd_time` datetime DEFAULT NULL COMMENT '预计结束时间',
  `deliveryDate` datetime DEFAULT NULL COMMENT '交货日期',
  `mainPlanNo` datetime DEFAULT NULL COMMENT '主计划编码',
  `erpWorkOrder_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'ERP工单编码',
  `customer_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '客户编码',
  `customer_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '客户名称',
  `outsourcing` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '外协',
  `supplier_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '供应商编码',
  `supplier_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '供应商名称',
  `processRoute_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '工艺路线编码',
  `processRoute_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '工艺路线名称',
  `workOrderMaterialPrepareStatus` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '工单备料状态',
  `firstSetMaterialPrepareStart_time` datetime DEFAULT NULL COMMENT '首套备料开始时间',
  `firstSetMaterialPrepareEnd_time` datetime DEFAULT NULL COMMENT '首套备料结束时间',
  `firstSetMaterialPrepare_time` bigint DEFAULT NULL COMMENT '首套备料用时',
  `programVerification` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '程序校验',
  `materialPickMode` tinyint NOT NULL COMMENT '领料模式(0-不启用领料；1-领料确认；2-领料交易)',
  `materialPickStatus` tinyint DEFAULT NULL COMMENT '领料状态(1-未领料)',
  `materialPickStart_time` datetime DEFAULT NULL COMMENT '领料开始时间',
  `materialPickEnd_time` datetime DEFAULT NULL COMMENT '领料完成时间',
  `productionTransferLock` tinyint(1) DEFAULT NULL COMMENT '转产锁定(1-是；0-否)',
  `productionTransferLockt_time` datetime DEFAULT NULL COMMENT '转产锁定时间',
  `productionSuspended` tinyint(1) NOT NULL COMMENT '停过工(1-是；0-否)',
  `materialProcessingCompleted` tinyint(1) NOT NULL COMMENT '物料处理完毕(1-是；0-否)',
  `remarks` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `org_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '组织编码',
  `org_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '组织名称',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `mainPlanNo` (`mainPlanNo`) USING BTREE,
  KEY `productionLine_code` (`productionLine_code`) USING BTREE,
  KEY `workOrder_code` (`workOrder_code`) USING BTREE,
  KEY `workshop_code` (`workshop_code`) USING BTREE,
  KEY `processSection_code` (`processSection_code`) USING BTREE,
  KEY `customer_code` (`customer_code`) USING BTREE,
  KEY `org_code` (`org_code`) USING BTREE,
  CONSTRAINT `productionscheduletable_ibfk_1` FOREIGN KEY (`productionLine_code`) REFERENCES `production_line` (`line_code`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `productionscheduletable_ibfk_2` FOREIGN KEY (`workOrder_code`) REFERENCES `workordermaintain` (`workOrder_code`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `productionscheduletable_ibfk_3` FOREIGN KEY (`workshop_code`) REFERENCES `workshop` (`workshop_code`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `productionscheduletable_ibfk_4` FOREIGN KEY (`processSection_code`) REFERENCES `process_segment` (`segment_code`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `productionscheduletable_ibfk_5` FOREIGN KEY (`customer_code`) REFERENCES `customermaintain` (`customer_code`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `productionscheduletable_ibfk_6` FOREIGN KEY (`org_code`) REFERENCES `organizationmaintain` (`org_code`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `productionscheduletable_chk_1` CHECK ((`planEnd_time` > `planStart_time`)),
  CONSTRAINT `productionscheduletable_chk_2` CHECK ((`scheduleEnd_time` > `scheduleStart_time`)),
  CONSTRAINT `productionscheduletable_chk_3` CHECK ((`firstSetMaterialPrepareEnd_time` > `firstSetMaterialPrepareStart_time`)),
  CONSTRAINT `productionscheduletable_chk_4` CHECK ((`materialPickMode` in (0,1,2))),
  CONSTRAINT `productionscheduletable_chk_5` CHECK ((`materialPickStatus` = 1)),
  CONSTRAINT `productionscheduletable_chk_6` CHECK ((`materialPickEnd_time` > `materialPickStart_time`)),
  CONSTRAINT `productionscheduletable_chk_7` CHECK ((`productionSuspended` in (0,1))),
  CONSTRAINT `productionscheduletable_chk_8` CHECK ((`materialProcessingCompleted` in (0,1)))
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

/*Data for the table `productionscheduletable` */

insert  into `productionscheduletable`(`id`,`productionLine_code`,`	productionLine_name`,`productionSeq`,`workOrder_code`,`workshop_code`,`workshop_name`,`product_code`,`product_name`,`product_specification`,`planQty`,`productionQty`,`productionStatus`,`processSection_code`,`workOrderType`,`standardCapacity`,`configuredPersonnelQty`,`planStart_time`,`planEnd_time`,`scheduleStart_time`,`scheduleEnd_time`,`productionStart_time`,`productionTransfer_time`,`remainingProduction_time`,`estimatedEnd_time`,`deliveryDate`,`mainPlanNo`,`erpWorkOrder_code`,`customer_code`,`customer_name`,`outsourcing`,`supplier_code`,`supplier_name`,`processRoute_code`,`processRoute_name`,`workOrderMaterialPrepareStatus`,`firstSetMaterialPrepareStart_time`,`firstSetMaterialPrepareEnd_time`,`firstSetMaterialPrepare_time`,`programVerification`,`materialPickMode`,`materialPickStatus`,`materialPickStart_time`,`materialPickEnd_time`,`productionTransferLock`,`productionTransferLockt_time`,`productionSuspended`,`materialProcessingCompleted`,`remarks`,`org_code`,`org_name`) values 
(1,'PL001','SMT生产线1','001','WO2024001','WS001','电子车间','PROD001','贴片电阻','0402 10KΩ ±1%',5000,0,'待投产','PS001','常规生产',1000,5,'2025-11-20 08:00:00','2025-11-20 18:00:00','2025-11-20 08:00:00','2025-11-20 18:00:00',NULL,NULL,600,'2025-11-20 18:00:00','2025-11-21 10:00:00','2025-11-19 15:00:00','ERP-WO-001','CUST001','广州电子科技有限公司','否','SUP001','深圳电子元件有限公司','ROUTE001','SMT标准工艺','已备料','2025-11-19 09:00:00','2025-11-19 10:30:00',90,'已校验',1,1,'2025-11-20 07:30:00','2025-11-20 07:50:00',0,NULL,0,1,NULL,'ORG001','电子制造事业部'),
(2,'PL002','注塑生产线2','002','WO2024002','WS002','注塑车间','PROD002','路由器外壳','ABS材质 白色 通用型',1200,0,'排程中','PS002','半成品生产',300,3,'2025-11-21 09:00:00','2025-11-21 16:00:00','2025-11-21 09:00:00','2025-11-21 16:00:00',NULL,NULL,420,'2025-11-21 16:00:00','2025-11-22 09:00:00','2025-11-20 14:00:00','ERP-WO-002','CUST002','深圳塑胶制品有限公司','否','SUP002','东莞塑胶原料厂','ROUTE002','注塑成型工艺','已备料','2025-11-20 10:00:00','2025-11-20 11:00:00',60,'已校验',2,1,'2025-11-21 08:30:00','2025-11-21 08:50:00',1,'2025-11-20 16:00:00',0,1,NULL,'ORG002','塑胶加工事业部'),
(3,'PL003','组装生产线3','003','WO2024003','WS001','电子车间','PROD003','电源适配器','220V转12V 3A',800,0,'待排程','PS003','成品组装',200,4,'2025-11-22 10:00:00','2025-11-22 18:00:00','2025-11-22 10:00:00','2025-11-22 18:00:00',NULL,NULL,480,'2025-11-22 18:00:00','2025-11-23 10:00:00','2025-11-21 10:00:00','ERP-WO-003','CUST003','杭州电器贸易有限公司','否','SUP001','深圳电子元件有限公司','ROUTE003','组装测试工艺','备料中','2025-11-21 14:00:00','2025-11-21 15:30:00',90,'待校验',0,1,'2025-11-22 09:30:00','2025-11-22 09:50:00',0,NULL,0,0,NULL,'ORG001','电子制造事业部'),
(6,'PL001','111','001','WO2024001','WS001','电子车间','PROD001','贴片电阻','0402 10KΩ ±1%',5000,0,'待投产','PS001','常规生产',1000,5,'2025-11-20 08:00:00','2025-11-20 18:00:00','2025-11-20 08:00:00','2025-11-20 18:00:00',NULL,NULL,600,'2025-11-20 18:00:00','2025-11-21 10:00:00',NULL,'ERP-WO-001','CUST001','广州电子科技有限公司','否','SUP001','深圳电子元件有限公司','ROUTE001','SMT标准工艺','已备料',NULL,NULL,90,'已校验',1,1,'2025-11-20 07:30:00','2025-11-20 07:50:00',0,NULL,0,1,NULL,'ORG001','电子制造事业部');

/*Table structure for table `productionstockinmaintain` */

DROP TABLE IF EXISTS `productionstockinmaintain`;

CREATE TABLE `productionstockinmaintain` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `productionStockIn_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '生产入库单编码',
  `workOrder_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '工单编码',
  `customer_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '客户编码',
  `customer_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '客户名称',
  `warehouse_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '仓库编码',
  `warehouse_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '仓库名称',
  `warehouseType` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '仓库类型',
  `product_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '产品编码',
  `product_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '产品名称',
  `product_specification` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '产品规格',
  `line_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '产线编码',
  `line_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '产线名称',
  `apply_time` datetime DEFAULT NULL COMMENT '申请时间',
  `stockInQty` int DEFAULT NULL COMMENT '入库数量',
  `stockInConfirm_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '入库确认单编码',
  `applyOrderStatus` tinyint NOT NULL COMMENT '申请单状态（0：制单中；1：已提交；2：已审核）',
  `org_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '组织编码',
  `org_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '组织名称',
  `remarks` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `modifier` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人',
  `modifier_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人名称',
  `modify_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `productionStockIn_code` (`productionStockIn_code`) USING BTREE,
  KEY `workOrder_code` (`workOrder_code`) USING BTREE,
  KEY `warehouse_code` (`warehouse_code`) USING BTREE,
  KEY `line_code` (`line_code`) USING BTREE,
  KEY `org_code` (`org_code`) USING BTREE,
  KEY `customer_code` (`customer_code`) USING BTREE,
  CONSTRAINT `productionstockinmaintain_ibfk_1` FOREIGN KEY (`workOrder_code`) REFERENCES `workordermaintain` (`workOrder_code`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `productionstockinmaintain_ibfk_2` FOREIGN KEY (`warehouse_code`) REFERENCES `warehouse` (`warehouse_code`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `productionstockinmaintain_ibfk_3` FOREIGN KEY (`line_code`) REFERENCES `production_line` (`line_code`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `productionstockinmaintain_ibfk_4` FOREIGN KEY (`org_code`) REFERENCES `organizationmaintain` (`org_code`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `productionstockinmaintain_ibfk_5` FOREIGN KEY (`customer_code`) REFERENCES `customermaintain` (`customer_code`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `productionstockinmaintain_chk_1` CHECK ((`applyOrderStatus` in (0,1,2)))
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

/*Data for the table `productionstockinmaintain` */

insert  into `productionstockinmaintain`(`id`,`productionStockIn_code`,`workOrder_code`,`customer_code`,`customer_name`,`warehouse_code`,`warehouse_name`,`warehouseType`,`product_code`,`product_name`,`product_specification`,`line_code`,`line_name`,`apply_time`,`stockInQty`,`stockInConfirm_code`,`applyOrderStatus`,`org_code`,`org_name`,`remarks`,`modifier`,`modifier_name`,`modify_time`) values 
(6,NULL,'WO2024001','CUST001','广州电子科技有限公司','WH001','一号成品仓库','成品仓','PROD001','贴片电阻','0402 10KΩ ±1%','PL001','SMT生产线1','2025-11-10 09:30:00',5000,'PSC2024001',2,'ORG001','电子制造事业部',NULL,NULL,'管理员','2025-11-10 10:15:00'),
(7,NULL,'WO2024002','CUST002','深圳塑胶制品有限公司','WH002','二号原料仓库','原料仓','PROD002','路由器外壳','ABS材质 白色 通用型','PL002','注塑生产线2','2025-11-11 14:20:00',1200,'PSC2024002',1,'ORG002','塑胶加工事业部',NULL,NULL,'管理员','2025-11-11 14:30:00'),
(8,NULL,'WO2024003','CUST003','杭州电器贸易有限公司','WH003','三号成品仓库','成品仓','PROD003','电源适配器','220V转12V 3A','PL003','电源组装线','2025-11-12 08:45:00',800,'PSC2024003',2,'ORG001','电子制造事业部',NULL,NULL,'管理员','2025-11-12 09:20:00');

/*Table structure for table `productionstockoutmaintain` */

DROP TABLE IF EXISTS `productionstockoutmaintain`;

CREATE TABLE `productionstockoutmaintain` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `stockOut_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '出库单编码',
  `	thirdPartyDoc_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '第三方单据编码',
  `docDate` datetime DEFAULT NULL COMMENT '单据日期',
  `product_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '产品编码',
  `product_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '产品名称',
  `product_specification` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '产品规格',
  `customer_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '客户编码',
  `customer_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '客户名称',
  `docPlanQty` int DEFAULT NULL COMMENT '单据计划数量',
  `docActualQty` int DEFAULT NULL COMMENT '单据实际数量',
  `specifiedMaterialAttr` tinyint NOT NULL COMMENT '指定物料属性(0：不指定；1：批次；2：批次+SKU；3：SKU)',
  `stockOutRule` tinyint NOT NULL COMMENT '出库规则(0：FIFO;1：LIFO;)',
  `bonded` tinyint(1) DEFAULT NULL COMMENT '保税(1=是；0=否)',
  `virtual_warehouse_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '虚拟库编码',
  `virtual_warehouse_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '虚拟库名称',
  `materialOverissueType` tinyint NOT NULL COMMENT '物料超发类型(0-默认参数控制；1-不允许超发；2-A材允许超发；BC材允许超发；ABC材允许超发)',
  `dept_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '部门编码',
  `dept_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '部门名称',
  `segment_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '工艺段编码',
  `segment_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '工艺段名称',
  `docStatus` tinyint DEFAULT NULL COMMENT '单据状态(1-制单中)',
  `stockOutStatus` tinyint DEFAULT NULL COMMENT '出库状态（1-已出库）',
  `stockOutStart_time` datetime DEFAULT NULL COMMENT '出库开始时间',
  `stockOutEnd_time` datetime DEFAULT NULL COMMENT '出库完成时间',
  `materialPickMode` tinyint NOT NULL COMMENT '领料模式(0-不启用领料；1-领料确认；2-领料交易)',
  `materialPickStatus` tinyint DEFAULT NULL COMMENT '领料状态(1-未领料)',
  `materialPickStart_time` datetime DEFAULT NULL COMMENT '领料开始时间',
  `materialPickEnd_time` datetime DEFAULT NULL COMMENT '领料完成时间',
  `	submitter` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '提交人',
  `	submitter_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '提交人名称',
  `submit_time` datetime DEFAULT NULL COMMENT '提交时间',
  `reviewer` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '审核人',
  `reviewer_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '审核人名称',
  `review_time` datetime DEFAULT NULL COMMENT '审核时间',
  `closer` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '关闭人',
  `closer_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '关闭人名称',
  `close_time` datetime DEFAULT NULL COMMENT '关闭时间',
  `dataSource` tinyint DEFAULT NULL COMMENT '数据来源（1-手动）',
  `org_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '组织编码',
  `org_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '组织名称',
  `remarks` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `modifier` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人',
  `modifier_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人名称',
  `modify_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `stockOut_code` (`stockOut_code`) USING BTREE,
  UNIQUE KEY `	thirdPartyDoc_code` (`	thirdPartyDoc_code`) USING BTREE,
  KEY `customer_code` (`customer_code`) USING BTREE,
  KEY `segment_code` (`segment_code`) USING BTREE,
  KEY `org_code` (`org_code`) USING BTREE,
  CONSTRAINT `productionstockoutmaintain_ibfk_1` FOREIGN KEY (`customer_code`) REFERENCES `customermaintain` (`customer_code`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `productionstockoutmaintain_ibfk_2` FOREIGN KEY (`segment_code`) REFERENCES `process_segment` (`segment_code`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `productionstockoutmaintain_ibfk_3` FOREIGN KEY (`org_code`) REFERENCES `organizationmaintain` (`org_code`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `productionstockoutmaintain_chk_1` CHECK ((`specifiedMaterialAttr` in (0,1,2,3))),
  CONSTRAINT `productionstockoutmaintain_chk_10` CHECK ((`materialPickEnd_time` > `materialPickStart_time`)),
  CONSTRAINT `productionstockoutmaintain_chk_11` CHECK ((`dataSource` = 1)),
  CONSTRAINT `productionstockoutmaintain_chk_2` CHECK ((`stockOutRule` in (0,1))),
  CONSTRAINT `productionstockoutmaintain_chk_3` CHECK ((`bonded` in (0,1))),
  CONSTRAINT `productionstockoutmaintain_chk_4` CHECK ((`materialOverissueType` in (0,1,2))),
  CONSTRAINT `productionstockoutmaintain_chk_5` CHECK ((`docStatus` = 1)),
  CONSTRAINT `productionstockoutmaintain_chk_6` CHECK ((`stockOutStatus` = 1)),
  CONSTRAINT `productionstockoutmaintain_chk_7` CHECK ((`stockOutEnd_time` > `stockOutStart_time`)),
  CONSTRAINT `productionstockoutmaintain_chk_8` CHECK ((`materialPickMode` in (0,1,2))),
  CONSTRAINT `productionstockoutmaintain_chk_9` CHECK ((`materialPickStatus` = 1))
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

/*Data for the table `productionstockoutmaintain` */

insert  into `productionstockoutmaintain`(`id`,`stockOut_code`,`	thirdPartyDoc_code`,`docDate`,`product_code`,`product_name`,`product_specification`,`customer_code`,`customer_name`,`docPlanQty`,`docActualQty`,`specifiedMaterialAttr`,`stockOutRule`,`bonded`,`virtual_warehouse_code`,`virtual_warehouse_name`,`materialOverissueType`,`dept_code`,`dept_name`,`segment_code`,`segment_name`,`docStatus`,`stockOutStatus`,`stockOutStart_time`,`stockOutEnd_time`,`materialPickMode`,`materialPickStatus`,`materialPickStart_time`,`materialPickEnd_time`,`	submitter`,`	submitter_name`,`submit_time`,`reviewer`,`reviewer_name`,`review_time`,`closer`,`closer_name`,`close_time`,`dataSource`,`org_code`,`org_name`,`remarks`,`modifier`,`modifier_name`,`modify_time`) values 
(1,'PSO2025001','TPD2025001','2025-11-15 09:00:00','MAT003','贴片电阻','0402 10KΩ ±1%','CUST001','广州电子科技有限公司',5000,5000,0,0,0,'VWH001','虚拟成品库1',0,'DEPT001','生产部','PS001','SMT工艺段',1,1,'2025-11-15 10:00:00','2025-11-15 11:30:00',1,1,'2025-11-15 09:30:00','2025-11-15 10:30:00','USER001','张三','2025-11-15 09:00:00','REV001','李四','2025-11-15 09:30:00','CLS001','关闭人王五','2025-11-15 11:30:00',1,'ORG001','电子制造事业部',NULL,NULL,'管理员','2025-11-15 10:00:00'),
(2,'PSO2025002','TPD2025002','2025-11-16 10:00:00','MAT003','路由器外壳','ABS材质 白色 通用型','CUST002','深圳塑胶制品有限公司',1200,1200,1,1,1,'VWH002','虚拟原料库1',1,'DEPT002','组装部','PS002','组装工艺段',1,1,'2025-11-16 11:00:00','2025-11-16 12:30:00',2,1,'2025-11-16 10:30:00','2025-11-16 11:30:00','USER002','李四','2025-11-16 10:00:00','REV002','王五','2025-11-16 10:30:00','CLS002','关闭人赵六','2025-11-16 12:30:00',1,'ORG002','塑胶加工事业部',NULL,NULL,'管理员','2025-11-16 11:00:00'),
(3,'PSO2025003','TPD2025003','2025-11-17 08:00:00','MAT003','电源适配器','220V转12V 3A','CUST003','杭州电器贸易有限公司',800,800,2,0,0,'VWH003','虚拟成品库2',2,'DEPT001','生产部','PS003','测试工艺段',1,1,'2025-11-17 09:00:00','2025-11-17 10:30:00',0,1,'2025-11-17 08:30:00','2025-11-17 09:30:00','USER001','张三','2025-11-17 08:00:00','REV001','李四','2025-11-17 08:30:00','CLS003','关闭人王五','2025-11-17 10:30:00',1,'ORG001','电子制造事业部',NULL,NULL,'管理员','2025-11-17 09:00:00');

/*Table structure for table `putaway_task` */

DROP TABLE IF EXISTS `putaway_task`;

CREATE TABLE `putaway_task` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `putaway_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '上架任务号',
  `receipt_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '关联收货单号',
  `material_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '物料编码',
  `batch_number` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '批次号',
  `quantity` decimal(15,4) NOT NULL COMMENT '上架数量',
  `from_location` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '源储位（通常为暂存区）',
  `to_location` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '目标储位',
  `task_status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '待上架' COMMENT '任务状态（待上架/已完成）',
  `assign_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '任务分配时间',
  `complete_time` datetime DEFAULT NULL COMMENT '完成时间',
  `operator` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '执行人',
  `operator_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '执行人名称',
  `remarks` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_putaway_no` (`putaway_no`) USING BTREE,
  KEY `idx_receipt` (`receipt_no`) USING BTREE,
  KEY `idx_to_location` (`to_location`) USING BTREE,
  CONSTRAINT `fk_pt_receipt` FOREIGN KEY (`receipt_no`) REFERENCES `material_receipt` (`receipt_no`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_pt_to_location` FOREIGN KEY (`to_location`) REFERENCES `storage_location` (`location_code`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='上架任务表';

/*Data for the table `putaway_task` */

insert  into `putaway_task`(`id`,`putaway_no`,`receipt_no`,`material_code`,`batch_number`,`quantity`,`from_location`,`to_location`,`task_status`,`assign_time`,`complete_time`,`operator`,`operator_name`,`remarks`) values 
(1,'PT20250001','GR20250001','MAT001','BATCH2025001',1000.0000,'STAGING01','LOC001','已完成','2025-01-20 10:10:00','2025-01-20 11:30:00','user04','赵六','标准上架'),
(2,'PT20250002','GR20250002','MAT002','BATCH2025002',2000.0000,'STAGING01','LOC002','已完成','2025-02-15 09:40:00','2025-02-15 11:00:00','user04','赵六','批量上架'),
(3,'PT20250003','GR20250003','MAT003','FPBATCH2025001',500.0000,'STAGING02','LOC001','已完成','2025-01-25 16:10:00','2025-01-25 17:20:00','user05','钱七','成品上架'),
(4,'PT20250004','GR20250004','MAT001','BATCH2025004',800.0000,'STAGING01','LOC003','待上架','2025-04-05 14:10:00',NULL,NULL,NULL,'待质检通过后上架'),
(5,'PT20250005','GR20250005','MAT002','BATCH2025005',100.0000,'STAGING01','LOC002','已完成','2025-05-18 13:30:00','2025-05-18 14:45:00','user04','赵六','退货上架');

/*Table structure for table `shelf_life_plan` */

DROP TABLE IF EXISTS `shelf_life_plan`;

CREATE TABLE `shelf_life_plan` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `global_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '全局编号',
  `shelf_life_plan_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '保质期方案编码',
  `shelf_life_plan_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '保质期方案名称',
  `shelf_life_days` int NOT NULL COMMENT '保质期（天）',
  `max_reinspection_count` int NOT NULL DEFAULT '0' COMMENT '最大超期复检次数',
  `enabled` tinyint NOT NULL DEFAULT '1' COMMENT '启用(0:否,1:是)',
  `remarks` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `creator` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
  `creator_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人名称',
  `creation_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifier` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人',
  `modifier_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人名称',
  `modification_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `global_id` (`global_id`) USING BTREE,
  UNIQUE KEY `uk_shelf_life_plan_code` (`shelf_life_plan_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='保质期方案维护表';

/*Data for the table `shelf_life_plan` */

insert  into `shelf_life_plan`(`id`,`global_id`,`shelf_life_plan_code`,`shelf_life_plan_name`,`shelf_life_days`,`max_reinspection_count`,`enabled`,`remarks`,`creator`,`creator_name`,`creation_time`,`modifier`,`modifier_name`,`modification_time`) values 
(2,'1','SLP001','标准保质期方案',365,0,1,NULL,NULL,NULL,'2025-10-26 14:26:33',NULL,NULL,'2025-10-26 14:26:33'),
(3,'2','SLP002','短期保质期方案',180,0,1,NULL,NULL,NULL,'2025-10-26 14:26:33',NULL,NULL,'2025-10-26 14:26:33'),
(4,'3','SLP003','长期保质期方案',730,0,1,NULL,NULL,NULL,'2025-10-26 14:26:33',NULL,NULL,'2025-10-26 14:26:33');

/*Table structure for table `sku_type` */

DROP TABLE IF EXISTS `sku_type`;

CREATE TABLE `sku_type` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `global_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '全局编号',
  `sku_type_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'SKU类型编码',
  `sku_type_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'SKU类型名称',
  `sku_special_classification` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'SKU特殊分类',
  `source` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '来源',
  `enabled` tinyint NOT NULL DEFAULT '1' COMMENT '启用(0:否,1:是)',
  `remarks` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `creator` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
  `creator_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人名称',
  `creation_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifier` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人',
  `modifier_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人名称',
  `modification_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `global_id` (`global_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='SKU类型维护表';

/*Data for the table `sku_type` */

insert  into `sku_type`(`id`,`global_id`,`sku_type_code`,`sku_type_name`,`sku_special_classification`,`source`,`enabled`,`remarks`,`creator`,`creator_name`,`creation_time`,`modifier`,`modifier_name`,`modification_time`) values 
(2,'1','SKUT001','标准SKU',NULL,NULL,1,NULL,NULL,NULL,'2025-10-26 14:26:33',NULL,NULL,'2025-10-26 14:26:33'),
(3,'2','SKUT002','定制SKU',NULL,NULL,1,NULL,NULL,NULL,'2025-10-26 14:26:33',NULL,NULL,'2025-10-26 14:26:33'),
(4,'3','SKUT003','特殊SKU',NULL,NULL,1,NULL,NULL,NULL,'2025-10-26 14:26:33',NULL,NULL,'2025-10-26 14:26:33');

/*Table structure for table `smt_completedmaterialtransfer` */

DROP TABLE IF EXISTS `smt_completedmaterialtransfer`;

CREATE TABLE `smt_completedmaterialtransfer` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `	workOrder_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '工单编码',
  `	productionLine_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '产线编码',
  `productionLine_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '产线名称',
  `productionStatus` tinyint DEFAULT NULL COMMENT '生产状态(1：完工)',
  `product_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '产品编码',
  `product_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '产品名称',
  `productSpec` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '产品规格',
  `customer_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '客户编码',
  `customer_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '客户名称',
  `materialProcessingCompleted` tinyint NOT NULL COMMENT '物料处理完毕(0：否  1：是)',
  `planQty` int DEFAULT NULL COMMENT '计划数量',
  `boardSurface` tinyint DEFAULT NULL COMMENT '版面(1-整体)',
  `planStartTime` datetime DEFAULT NULL COMMENT '计划开始时间',
  `planEndTime` datetime DEFAULT NULL COMMENT '计划结束时间',
  `targetWorkOrderNo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '目的工单编码',
  `transferNo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '转产编码',
  `processSection_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '工艺段编码',
  `workshop_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '车间编码',
  `workshop_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '车间名称',
  `workOrderGroupNo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '工单组编码',
  `org_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '组织编码',
  `org_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '组织名称',
  `remarks` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `modifier` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人',
  `modifierName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人名称',
  `modifyTime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `	workOrder_code` (`	workOrder_code`) USING BTREE,
  KEY `	productionLine_code` (`	productionLine_code`) USING BTREE,
  KEY `customer_code` (`customer_code`) USING BTREE,
  KEY `processSection_code` (`processSection_code`) USING BTREE,
  KEY `workshop_code` (`workshop_code`) USING BTREE,
  KEY `org_code` (`org_code`) USING BTREE,
  CONSTRAINT `smt_completedmaterialtransfer_ibfk_1` FOREIGN KEY (`	workOrder_code`) REFERENCES `workordermaintain` (`workOrder_code`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `smt_completedmaterialtransfer_ibfk_2` FOREIGN KEY (`	productionLine_code`) REFERENCES `production_line` (`line_code`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `smt_completedmaterialtransfer_ibfk_3` FOREIGN KEY (`customer_code`) REFERENCES `customermaintain` (`customer_code`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `smt_completedmaterialtransfer_ibfk_4` FOREIGN KEY (`processSection_code`) REFERENCES `process_segment` (`segment_code`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `smt_completedmaterialtransfer_ibfk_5` FOREIGN KEY (`workshop_code`) REFERENCES `workshop` (`workshop_code`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `smt_completedmaterialtransfer_ibfk_6` FOREIGN KEY (`org_code`) REFERENCES `organizationmaintain` (`org_code`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `smt_completedmaterialtransfer_chk_1` CHECK ((`productionStatus` = 1)),
  CONSTRAINT `smt_completedmaterialtransfer_chk_2` CHECK ((`materialProcessingCompleted` in (0,1))),
  CONSTRAINT `smt_completedmaterialtransfer_chk_3` CHECK ((`boardSurface` = 1)),
  CONSTRAINT `smt_completedmaterialtransfer_chk_4` CHECK ((`planEndTime` > `planStartTime`))
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

/*Data for the table `smt_completedmaterialtransfer` */

insert  into `smt_completedmaterialtransfer`(`id`,`	workOrder_code`,`	productionLine_code`,`productionLine_name`,`productionStatus`,`product_code`,`product_name`,`productSpec`,`customer_code`,`customer_name`,`materialProcessingCompleted`,`planQty`,`boardSurface`,`planStartTime`,`planEndTime`,`targetWorkOrderNo`,`transferNo`,`processSection_code`,`workshop_code`,`workshop_name`,`workOrderGroupNo`,`org_code`,`org_name`,`remarks`,`modifier`,`modifierName`,`modifyTime`) values 
(1,'WO2024001','PL001','SMT生产线1',1,'PROD001','贴片电阻','0402 10KΩ ±1%','CUST001','广州电子科技有限公司',1,5000,1,'2025-12-15 08:00:00','2025-12-16 18:00:00',NULL,'TR-SMT-COMP2025001','PS001','WS001','电子车间',NULL,'ORG001','电子制造事业部','量产完工，剩余物料退仓，合格产品入库','USER001','张三','2025-12-16 18:30:00'),
(2,'WO2024002','PL001','SMT生产线1',1,'PROD009','蓝牙模块电路板','BLE5.3 双面贴装','CUST004','北京通信设备有限公司',0,1200,1,'2025-12-15 09:00:00','2025-12-15 16:00:00',NULL,'TR-SMT-COMP2025002','PS001','WS001','电子车间',NULL,'ORG001','电子制造事业部',NULL,'USER002','李四','2025-12-27 16:15:00'),
(3,'WO2024003','PL001','SMT生产线1',1,'PROD004','控制电路板','双层板 100*80mm 高精度','CUST001','广州电子科技有限公司',1,300,1,'2025-12-28 08:30:00','2025-12-28 15:30:00',NULL,'TR-SMT-COMP2025003','PS001','WS001','电子车间',NULL,'ORG001','电子制造事业部',NULL,'USER003','王五','2025-12-28 15:40:00');

/*Table structure for table `smt_dashboard` */

DROP TABLE IF EXISTS `smt_dashboard`;

CREATE TABLE `smt_dashboard` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `product_spec` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `track1_produce` int NOT NULL DEFAULT '0',
  `track2_produce` int NOT NULL DEFAULT '0',
  `line_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `workorder_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `workorder_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `plan_qty` int NOT NULL,
  `product_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `material_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `plan_start` datetime NOT NULL,
  `plan_end` datetime NOT NULL,
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `workorder_code` (`workorder_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

/*Data for the table `smt_dashboard` */

insert  into `smt_dashboard`(`id`,`product_spec`,`track1_produce`,`track2_produce`,`line_code`,`workorder_code`,`workorder_type`,`plan_qty`,`product_name`,`material_no`,`plan_start`,`plan_end`,`create_time`) values 
(1,'HTE032-M-A4 (MCU-N32G)',2044,14,'SMT-Line1','MO230112015-SMT','量产',3000,'便携储能-PCBA-SMT','07-2104-100003','2023-02-02 14:21:00','2023-02-03 13:27:00','2025-11-13 21:50:59');

/*Table structure for table `smt_preproductiontransfer` */

DROP TABLE IF EXISTS `smt_preproductiontransfer`;

CREATE TABLE `smt_preproductiontransfer` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `workOrder_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '工单编码',
  `	productionLine_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '产线编码',
  `productionLine_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '产线名称',
  `productionStatus` tinyint NOT NULL COMMENT '生产状态(0：在产  1：清尾  )',
  `product_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '产品编码',
  `product_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '产品名称',
  `productSpec` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '产品规格',
  `customer_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '客户编码',
  `customer_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '客户名称',
  `workOrderType` tinyint NOT NULL COMMENT '工单类型(0：量产  1：试做  )',
  `workOrderMaterialPrepareStatus` tinyint NOT NULL COMMENT '工单备料状态(0：未备料  1：首套备料中)',
  `planQty` int DEFAULT NULL COMMENT '计划数量',
  `planStartTime` datetime DEFAULT NULL COMMENT '计划开始时间',
  `planEndTime` datetime DEFAULT NULL COMMENT '计划结束时间',
  `workOrderTransferType` tinyint NOT NULL COMMENT '工单转产类型(对于原工单，0：完工)',
  `materialTransferType` tinyint NOT NULL COMMENT '物料转产类型(0:剩余物料全部退仓  )',
  `retainMaterialFullUnbind` tinyint NOT NULL COMMENT '保留物料全部解绑(0：不选中  1：选中)',
  `sharedMaterialFullUnbind` tinyint NOT NULL COMMENT '共用物料全部解绑(0：不选中  1：选中)',
  `fixtureTransferType` tinyint NOT NULL COMMENT '极治具转产类型(0：全部下线)',
  `personnelTransferType` tinyint NOT NULL COMMENT '岗位人员转产类型(0：全部下岗)',
  `targetWorkOrderNo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '目的工单编码',
  `transferNo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '转产编码',
  `processSection_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '工艺段编码',
  `boardSurface` tinyint DEFAULT NULL COMMENT '版面(1-整体)',
  `workshop_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '车间编码',
  `workshop_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '车间名称',
  `workOrderGroupNo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '工单组编码',
  `org_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '组织编码',
  `org_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '组织名称',
  `remarks` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `modifier` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人',
  `modifierName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人名称',
  `modifyTime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `workOrder_code` (`workOrder_code`) USING BTREE,
  KEY `	productionLine_code` (`	productionLine_code`) USING BTREE,
  KEY `customer_code` (`customer_code`) USING BTREE,
  KEY `processSection_code` (`processSection_code`) USING BTREE,
  KEY `workshop_code` (`workshop_code`) USING BTREE,
  KEY `org_code` (`org_code`) USING BTREE,
  CONSTRAINT `smt_preproductiontransfer_ibfk_1` FOREIGN KEY (`workOrder_code`) REFERENCES `workordermaintain` (`workOrder_code`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `smt_preproductiontransfer_ibfk_2` FOREIGN KEY (`	productionLine_code`) REFERENCES `production_line` (`line_code`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `smt_preproductiontransfer_ibfk_3` FOREIGN KEY (`customer_code`) REFERENCES `customermaintain` (`customer_code`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `smt_preproductiontransfer_ibfk_4` FOREIGN KEY (`processSection_code`) REFERENCES `process_segment` (`segment_code`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `smt_preproductiontransfer_ibfk_5` FOREIGN KEY (`workshop_code`) REFERENCES `workshop` (`workshop_code`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `smt_preproductiontransfer_ibfk_6` FOREIGN KEY (`org_code`) REFERENCES `organizationmaintain` (`org_code`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `smt_preproductiontransfer_chk_1` CHECK ((`productionStatus` in (0,1,2,3,4))),
  CONSTRAINT `smt_preproductiontransfer_chk_10` CHECK ((`boardSurface` = 1)),
  CONSTRAINT `smt_preproductiontransfer_chk_11` CHECK ((`planEndTime` > `planStartTime`)),
  CONSTRAINT `smt_preproductiontransfer_chk_2` CHECK ((`workOrderType` in (0,1,2))),
  CONSTRAINT `smt_preproductiontransfer_chk_3` CHECK ((`workOrderMaterialPrepareStatus` in (0,1,2))),
  CONSTRAINT `smt_preproductiontransfer_chk_4` CHECK ((`workOrderTransferType` in (0,1))),
  CONSTRAINT `smt_preproductiontransfer_chk_5` CHECK ((`materialTransferType` in (0,1,2,3))),
  CONSTRAINT `smt_preproductiontransfer_chk_6` CHECK ((`retainMaterialFullUnbind` in (0,1))),
  CONSTRAINT `smt_preproductiontransfer_chk_7` CHECK ((`sharedMaterialFullUnbind` in (0,1))),
  CONSTRAINT `smt_preproductiontransfer_chk_8` CHECK ((`fixtureTransferType` in (0,1,2,3))),
  CONSTRAINT `smt_preproductiontransfer_chk_9` CHECK ((`personnelTransferType` in (0,1)))
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

/*Data for the table `smt_preproductiontransfer` */

insert  into `smt_preproductiontransfer`(`id`,`workOrder_code`,`	productionLine_code`,`productionLine_name`,`productionStatus`,`product_code`,`product_name`,`productSpec`,`customer_code`,`customer_name`,`workOrderType`,`workOrderMaterialPrepareStatus`,`planQty`,`planStartTime`,`planEndTime`,`workOrderTransferType`,`materialTransferType`,`retainMaterialFullUnbind`,`sharedMaterialFullUnbind`,`fixtureTransferType`,`personnelTransferType`,`targetWorkOrderNo`,`transferNo`,`processSection_code`,`boardSurface`,`workshop_code`,`workshop_name`,`workOrderGroupNo`,`org_code`,`org_name`,`remarks`,`modifier`,`modifierName`,`modifyTime`) values 
(1,'WO2024001','PL001','SMT生产线1',0,'PROD001','贴片电阻','0402 10KΩ ±1%','CUST001','广州电子科技有限公司',0,1,5000,'2025-12-08 08:00:00','2025-12-08 18:00:00',0,0,0,1,0,0,'WO2025013','TR-SMT2025001','PS001',1,'WS001','电子车间','WG2025004','ORG001','电子制造事业部',NULL,'USER001','张三','2025-12-07 16:20:00'),
(2,'WO2024002','PL001','SMT生产线1',1,'PROD009','蓝牙模块电路板','BLE5.3 双面贴装','CUST004','北京通信设备有限公司',1,0,1200,'2025-12-09 09:00:00','2025-12-09 16:00:00',1,0,1,0,0,0,'WO2025014','TR-SMT2025002','PS001',1,'WS001','电子车间','WG2025005','ORG001','电子制造事业部',NULL,'USER002','李四','2025-12-08 11:30:00'),
(3,'WO2024003','PL001','SMT生产线1',0,'PROD004','控制电路板','双层板 100*80mm 高精度','CUST001','广州电子科技有限公司',0,1,300,'2025-12-10 08:30:00','2025-12-10 15:30:00',0,0,0,1,0,0,'WO2025015','TR-SMT2025003','PS001',1,'WS001','电子车间','WG2025006','ORG001','电子制造事业部',NULL,'USER003','王五','2025-12-09 10:10:00');

/*Table structure for table `smt_rankingfinetuningtable` */

DROP TABLE IF EXISTS `smt_rankingfinetuningtable`;

CREATE TABLE `smt_rankingfinetuningtable` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `org_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '组织编码',
  `org_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '组织名称',
  `workOrder_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '工单编码',
  `mainPlan_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '主计划编码',
  `erpWorkOrder_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'ERP工单编码',
  `product_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '产品编码',
  `product_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '产品名称',
  `processSection_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '工艺段编码',
  `customer_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '客户编码',
  `customer_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '客户名称',
  `planQty` int DEFAULT NULL COMMENT '计划数量',
  `productionStatus` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '生产状态',
  `workOrderMaterialPrepareStatus` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '工单备料状态',
  `fineTuningType` tinyint NOT NULL COMMENT '微调类型(0-不管控上料调整；1-SKU调整；2-自动备料/上料调整；3-增加主料)',
  `fineTuning_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '微调编码',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `org_code` (`org_code`) USING BTREE,
  KEY `workOrder_code` (`workOrder_code`) USING BTREE,
  KEY `customer_code` (`customer_code`) USING BTREE,
  KEY `fineTuning_code` (`fineTuning_code`) USING BTREE,
  CONSTRAINT `smt_rankingfinetuningtable_ibfk_1` FOREIGN KEY (`org_code`) REFERENCES `organizationmaintain` (`org_code`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `smt_rankingfinetuningtable_ibfk_2` FOREIGN KEY (`workOrder_code`) REFERENCES `workordermaintain` (`workOrder_code`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `smt_rankingfinetuningtable_ibfk_3` FOREIGN KEY (`customer_code`) REFERENCES `customermaintain` (`customer_code`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `smt_rankingfinetuningtable_ibfk_4` FOREIGN KEY (`fineTuning_code`) REFERENCES `finetuningmasterlist` (`fineTuning_code`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `smt_rankingfinetuningtable_chk_1` CHECK ((`fineTuningType` in (0,1,2,3)))
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

/*Data for the table `smt_rankingfinetuningtable` */

insert  into `smt_rankingfinetuningtable`(`id`,`org_code`,`org_name`,`workOrder_code`,`mainPlan_code`,`erpWorkOrder_code`,`product_code`,`product_name`,`processSection_code`,`customer_code`,`customer_name`,`planQty`,`productionStatus`,`workOrderMaterialPrepareStatus`,`fineTuningType`,`fineTuning_code`) values 
(1,'ORG001','电子制造事业部','WO2024001','MP2025001','ERP-WO-001','PROD001','贴片电阻','PS001','CUST001','广州电子科技有限公司',5000,'生产中','已备料',0,'FT001'),
(2,'ORG001','电子制造事业部','WO2024002','MP2025004','ERP-WO-004','PROD004','控制电路板','PS001','CUST001','广州电子科技有限公司',300,'待投产','备料中',2,'FT002'),
(3,'ORG001','电子制造事业部','WO2024003','MP2025009','ERP-WO-003','PROD009','蓝牙模块电路板','PS001','CUST004','北京通信设备有限公司',1200,'排程中','待备料',3,'FT003');

/*Table structure for table `smt_suspendedworkordertransfer` */

DROP TABLE IF EXISTS `smt_suspendedworkordertransfer`;

CREATE TABLE `smt_suspendedworkordertransfer` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `workOrder_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '工单编码',
  `productionLine_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '产线编码',
  `productionLineName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '产线名称',
  `productionStatus` tinyint DEFAULT NULL COMMENT '生产状态（1：停工）',
  `product_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '产品编码',
  `productName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '产品名称',
  `productSpec` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '产品规格',
  `customer_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '客户编码',
  `customer_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '客户名称',
  `workOrderType` tinyint NOT NULL COMMENT '工单类型（0：量产  1：试做  2：客退返工 ）',
  `workOrderMaterialPrepareStatus` tinyint NOT NULL COMMENT '工单备料状态（0：未备料  1：首套备料中 2：首套备料完成）',
  `planQty` int DEFAULT NULL COMMENT '计划数量',
  `boardSurface` tinyint DEFAULT NULL COMMENT '版面（1-整体）',
  `planStartTime` datetime DEFAULT NULL COMMENT '计划开始时间',
  `planEndTime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '计划结束时间',
  `workOrderTransferStatus` tinyint NOT NULL COMMENT '工单转产状态（对于原工单，0：完工 1：停工）',
  `materialTransferType` tinyint NOT NULL COMMENT '物料转产类型(0:剩余物料全部退仓 1：可共用物料转入新工单,，不可共用物料退回仓库  2：剩余物料保留给原工单  3：可共用物料归入新工单，不可共用物料保留给原工单   )',
  `targetWorkOrderNo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '目的工单编码',
  `transferNo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '转产编码',
  `productionquantitymethod` int DEFAULT NULL COMMENT '计生产数方式',
  `processSection_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '工艺段编码',
  `workshop_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '车间编码',
  `workshop_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '车间名称',
  `workOrderGroupNo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '工单组编码',
  `org_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '组织编码',
  `org_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '组织名称',
  `remarks` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `modifier` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人',
  `modifierName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人名称',
  `modifyTime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `workOrder_code` (`workOrder_code`) USING BTREE,
  KEY `productionLine_code` (`productionLine_code`) USING BTREE,
  KEY `customer_code` (`customer_code`) USING BTREE,
  KEY `processSection_code` (`processSection_code`) USING BTREE,
  KEY `workshop_code` (`workshop_code`) USING BTREE,
  KEY `org_code` (`org_code`) USING BTREE,
  CONSTRAINT `smt_suspendedworkordertransfer_ibfk_1` FOREIGN KEY (`workOrder_code`) REFERENCES `workordermaintain` (`workOrder_code`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `smt_suspendedworkordertransfer_ibfk_2` FOREIGN KEY (`productionLine_code`) REFERENCES `production_line` (`line_code`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `smt_suspendedworkordertransfer_ibfk_3` FOREIGN KEY (`customer_code`) REFERENCES `customermaintain` (`customer_code`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `smt_suspendedworkordertransfer_ibfk_4` FOREIGN KEY (`processSection_code`) REFERENCES `process_segment` (`segment_code`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `smt_suspendedworkordertransfer_ibfk_5` FOREIGN KEY (`workshop_code`) REFERENCES `workshop` (`workshop_code`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `smt_suspendedworkordertransfer_ibfk_6` FOREIGN KEY (`org_code`) REFERENCES `organizationmaintain` (`org_code`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `smt_suspendedworkordertransfer_chk_1` CHECK ((`productionStatus` = 1)),
  CONSTRAINT `smt_suspendedworkordertransfer_chk_2` CHECK ((`workOrderType` in (0,1,2))),
  CONSTRAINT `smt_suspendedworkordertransfer_chk_3` CHECK ((`workOrderMaterialPrepareStatus` in (0,1,2))),
  CONSTRAINT `smt_suspendedworkordertransfer_chk_4` CHECK ((`boardSurface` = 1)),
  CONSTRAINT `smt_suspendedworkordertransfer_chk_5` CHECK ((`workOrderTransferStatus` in (0,1))),
  CONSTRAINT `smt_suspendedworkordertransfer_chk_6` CHECK ((`materialTransferType` in (0,1,2,3)))
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

/*Data for the table `smt_suspendedworkordertransfer` */

insert  into `smt_suspendedworkordertransfer`(`id`,`workOrder_code`,`productionLine_code`,`productionLineName`,`productionStatus`,`product_code`,`productName`,`productSpec`,`customer_code`,`customer_name`,`workOrderType`,`workOrderMaterialPrepareStatus`,`planQty`,`boardSurface`,`planStartTime`,`planEndTime`,`workOrderTransferStatus`,`materialTransferType`,`targetWorkOrderNo`,`transferNo`,`productionquantitymethod`,`processSection_code`,`workshop_code`,`workshop_name`,`workOrderGroupNo`,`org_code`,`org_name`,`remarks`,`modifier`,`modifierName`,`modifyTime`) values 
(1,'WO2024001','PL001','SMT生产线1',1,'PROD001','贴片电阻','0402 10KΩ ±1%','CUST001','广州电子科技有限公司',0,2,5000,1,'2025-12-17 08:00:00','2025-12-17 18:00:00',1,0,'WO2024002','TR-SMT-STOP2025001',1,'PS001','WS001','电子车间','WG2025013','ORG001','电子制造事业部',NULL,'USER001','张三','2025-12-16 14:30:00'),
(3,'WO2024003','PL001','SMT生产线1',1,'PROD004','控制电路板','双层板 100*80mm 高精度','CUST001','广州电子科技有限公司',2,2,300,1,'2025-12-19 08:30:00','2025-12-19 15:30:00',1,2,'WO2025010','TR-SMT-STOP2025003',1,'PS001','WS001','电子车间','WG2025015','ORG001','电子制造事业部',NULL,'USER003','王五','2025-12-18 09:20:00'),
(4,'WO2024002','PL001','SMT生产线1',1,'PROD009','蓝牙模块电路板','BLE5.3 双面贴装','CUST004','北京通信设备有限公司',1,1,1200,1,'2025-12-18 09:00:00','2025-12-18 16:00:00',1,1,'WO2025009','TR-SMT-STOP2025002',1,'PS001','WS001','电子车间','WG2025014','ORG001','电子制造事业部',NULL,'USER002','李四','2025-12-17 10:15:00');

/*Table structure for table `smtproductiontable` */

DROP TABLE IF EXISTS `smtproductiontable`;

CREATE TABLE `smtproductiontable` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `org_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '组织编码',
  `org_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '组织名称',
  `productionLine_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '产线编码',
  `productionLine_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '产线名称',
  `workOrder_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '工单编码',
  `erpWorkOrder_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'ERP工单编码',
  `workOrderType` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '工单类型',
  `product_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '产品编码',
  `product_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '产品名称',
  `productSpec` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '产品规格',
  `customer_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '客户编码',
  `customer_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '客户名称',
  `planQty` int DEFAULT NULL COMMENT '计划数量',
  `planStartTime` datetime DEFAULT NULL COMMENT '计划开始时间',
  `processRoute_code` datetime DEFAULT NULL COMMENT '计划结束时间',
  `processRoute_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '生产状态',
  `	boardSurface` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '板面',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `org_code` (`org_code`) USING BTREE,
  KEY `productionLine_code` (`productionLine_code`) USING BTREE,
  KEY `workOrder_code` (`workOrder_code`) USING BTREE,
  KEY `customer_code` (`customer_code`) USING BTREE,
  CONSTRAINT `smtproductiontable_ibfk_1` FOREIGN KEY (`org_code`) REFERENCES `organizationmaintain` (`org_code`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `smtproductiontable_ibfk_2` FOREIGN KEY (`productionLine_code`) REFERENCES `production_line` (`line_code`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `smtproductiontable_ibfk_3` FOREIGN KEY (`workOrder_code`) REFERENCES `workordermaintain` (`workOrder_code`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `smtproductiontable_ibfk_4` FOREIGN KEY (`customer_code`) REFERENCES `customermaintain` (`customer_code`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

/*Data for the table `smtproductiontable` */

insert  into `smtproductiontable`(`id`,`org_code`,`org_name`,`productionLine_code`,`productionLine_name`,`workOrder_code`,`erpWorkOrder_code`,`workOrderType`,`product_code`,`product_name`,`productSpec`,`customer_code`,`customer_name`,`planQty`,`planStartTime`,`processRoute_code`,`processRoute_name`,`	boardSurface`) values 
(1,'ORG001','电子制造事业部','PL001','SMT生产线1','WO2024001','ERP-WO-001','常规量产','PROD001','贴片电阻','0402 10KΩ ±1%','CUST001','广州电子科技有限公司',5000,'2025-11-30 08:00:00','2025-11-30 18:00:00','生产中','双面'),
(2,'ORG001','电子制造事业部','PL001','SMT生产线1','WO2024002','ERP-WO-004','定制生产','PROD004','控制电路板','双层板 100*80mm','CUST001','广州电子科技有限公司',300,'2025-12-01 09:00:00','2025-12-01 16:00:00','待投产','单面');

/*Table structure for table `spare_part_info` */

DROP TABLE IF EXISTS `spare_part_info`;

CREATE TABLE `spare_part_info` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `part_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '备件编码',
  `part_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '备件名称',
  `model_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '备件型号编码',
  `model_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '备件型号名称',
  `special_classification` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '特殊分类',
  `factory_serial_number` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '出厂序列号',
  `asset_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '资产编码',
  `location_status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '在库' COMMENT '位置状态',
  `status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '正常' COMMENT '状态',
  `warehouse_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '仓库编码',
  `storage_location_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '储位编码',
  `scrap_time` datetime DEFAULT NULL COMMENT '报废时间',
  `last_maintenance_date` date DEFAULT NULL COMMENT '最后保养日期',
  `maintenance_usage_count` int DEFAULT '0' COMMENT '保养后使用次数',
  `total_usage_count` int DEFAULT '0' COMMENT '总使用次数',
  `enabled` tinyint NOT NULL DEFAULT '1' COMMENT '启用(0:否,1:是)',
  `modifier` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人',
  `modifier_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人名称',
  `modification_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `part_code` (`part_code`) USING BTREE,
  KEY `fk_spare_part_model` (`model_code`) USING BTREE,
  KEY `fk_spare_part_warehouse` (`warehouse_code`) USING BTREE,
  KEY `fk_spare_part_storage_location` (`storage_location_code`) USING BTREE,
  CONSTRAINT `fk_spare_part_model` FOREIGN KEY (`model_code`) REFERENCES `spare_part_model` (`model_code`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_spare_part_storage_location` FOREIGN KEY (`storage_location_code`) REFERENCES `storage_location` (`location_code`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_spare_part_warehouse` FOREIGN KEY (`warehouse_code`) REFERENCES `warehouse` (`warehouse_code`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='备件信息维护表';

/*Data for the table `spare_part_info` */

insert  into `spare_part_info`(`id`,`part_code`,`part_name`,`model_code`,`model_name`,`special_classification`,`factory_serial_number`,`asset_code`,`location_status`,`status`,`warehouse_code`,`storage_location_code`,`scrap_time`,`last_maintenance_date`,`maintenance_usage_count`,`total_usage_count`,`enabled`,`modifier`,`modifier_name`,`modification_time`) values 
(1,'SP001','贴片机吸嘴1号','SPM001','贴片机吸嘴',NULL,NULL,NULL,'在库','正常',NULL,NULL,NULL,NULL,0,0,1,NULL,NULL,'2025-10-26 14:26:33'),
(2,'SP002','传送带1号','SPM002','传送带',NULL,NULL,NULL,'在库','正常',NULL,NULL,NULL,NULL,0,0,1,NULL,NULL,'2025-10-26 14:26:33'),
(3,'SP003','传感器1号','SPM003','传感器',NULL,NULL,NULL,'在库','正常',NULL,NULL,NULL,NULL,0,0,1,NULL,NULL,'2025-10-26 14:26:33');

/*Table structure for table `spare_part_model` */

DROP TABLE IF EXISTS `spare_part_model`;

CREATE TABLE `spare_part_model` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `model_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '备件型号编码',
  `model_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '备件型号名称',
  `special_classification` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '特殊分类',
  `management_method` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'ID管理' COMMENT '管理方式',
  `unit` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '单位',
  `default_warehouse_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '默认仓库编码',
  `default_storage_location_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '默认储位编码',
  `repair_method` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '可维修' COMMENT '维修方式',
  `maintenance_warning_usage_count` int DEFAULT '0' COMMENT '保养预警使用次数',
  `early_maintenance_warning_usage_count` int DEFAULT '0' COMMENT '提前保养预警使用次数',
  `maintenance_warning_days` int DEFAULT '0' COMMENT '保养预警使用天数',
  `early_maintenance_warning_days` int DEFAULT '0' COMMENT '提前保养预警使用天数',
  `early_scrap_warning_count` int DEFAULT '0' COMMENT '提前报废预警次数',
  `early_scrap_warning_days` int DEFAULT '0' COMMENT '提前报废预警天数',
  `scrap_count` int DEFAULT '0' COMMENT '报废次数',
  `scrap_days` int DEFAULT '0' COMMENT '报废天数',
  `part_usage_return_enabled` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '否' COMMENT '备件启用领用与归还',
  `inspection_item_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '检验项目编码',
  `feeder_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '供料器类型',
  `single_feeder_suffix` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '单供料器后缀',
  `multi_feeder_suffix_left` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '多供料器后缀（左）',
  `multi_feeder_suffix_middle` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '多供料器后缀（中）',
  `multi_feeder_suffix_right` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '多供料器后缀（右）',
  `feeder_specification` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '供料器规格',
  `enabled` tinyint NOT NULL DEFAULT '1' COMMENT '启用(0:否,1:是)',
  `modifier` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人',
  `modifier_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人名称',
  `modification_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `model_code` (`model_code`) USING BTREE,
  UNIQUE KEY `uk_model_code` (`model_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='备件型号维护表';

/*Data for the table `spare_part_model` */

insert  into `spare_part_model`(`id`,`model_code`,`model_name`,`special_classification`,`management_method`,`unit`,`default_warehouse_code`,`default_storage_location_code`,`repair_method`,`maintenance_warning_usage_count`,`early_maintenance_warning_usage_count`,`maintenance_warning_days`,`early_maintenance_warning_days`,`early_scrap_warning_count`,`early_scrap_warning_days`,`scrap_count`,`scrap_days`,`part_usage_return_enabled`,`inspection_item_code`,`feeder_type`,`single_feeder_suffix`,`multi_feeder_suffix_left`,`multi_feeder_suffix_middle`,`multi_feeder_suffix_right`,`feeder_specification`,`enabled`,`modifier`,`modifier_name`,`modification_time`) values 
(2,'SPM001','贴片机吸嘴',NULL,'ID管理','PCS',NULL,NULL,'可维修',0,0,0,0,0,0,0,0,'否',NULL,NULL,'0',NULL,NULL,NULL,NULL,1,NULL,NULL,'2025-10-26 14:26:33'),
(3,'SPM002','传送带',NULL,'ID管理','PCS',NULL,NULL,'可维修',0,0,0,0,0,0,0,0,'否',NULL,NULL,'0',NULL,NULL,NULL,NULL,1,NULL,NULL,'2025-10-26 14:26:33'),
(4,'SPM003','传感器',NULL,'ID管理','PCS',NULL,NULL,'可维修',0,0,0,0,0,0,0,0,'否',NULL,NULL,'0',NULL,NULL,NULL,NULL,1,NULL,NULL,'2025-10-26 14:26:33');

/*Table structure for table `stock_transfer` */

DROP TABLE IF EXISTS `stock_transfer`;

CREATE TABLE `stock_transfer` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `transfer_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调拨单号',
  `material_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '物料编码',
  `batch_number` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '批次号',
  `quantity` decimal(15,4) NOT NULL COMMENT '调拨数量',
  `from_warehouse` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调出仓库',
  `from_location` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调出储位',
  `to_warehouse` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调入仓库',
  `to_location` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调入储位',
  `transfer_reason` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '调拨原因',
  `transfer_status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '待调拨' COMMENT '调拨状态（待调拨/已调出/已接收）',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `outbound_time` datetime DEFAULT NULL COMMENT '出库时间',
  `inbound_time` datetime DEFAULT NULL COMMENT '入库时间',
  `operator` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '操作人',
  `operator_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '操作人名称',
  `remarks` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_transfer_no` (`transfer_no`) USING BTREE,
  KEY `idx_material` (`material_code`) USING BTREE,
  KEY `idx_from_location` (`from_location`) USING BTREE,
  KEY `idx_to_location` (`to_location`) USING BTREE,
  CONSTRAINT `fk_st_from_location` FOREIGN KEY (`from_location`) REFERENCES `storage_location` (`location_code`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_st_material` FOREIGN KEY (`material_code`) REFERENCES `material_info` (`material_code`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_st_to_location` FOREIGN KEY (`to_location`) REFERENCES `storage_location` (`location_code`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='库存调拨单表';

/*Data for the table `stock_transfer` */

insert  into `stock_transfer`(`id`,`transfer_no`,`material_code`,`batch_number`,`quantity`,`from_warehouse`,`from_location`,`to_warehouse`,`to_location`,`transfer_reason`,`transfer_status`,`create_time`,`outbound_time`,`inbound_time`,`operator`,`operator_name`,`remarks`) values 
(1,'ST20250001','MAT001','BATCH2025001',100.0000,'WH001','LOC001','WH002','LOC003','产线需求','已接收','2025-03-01 09:00:00','2025-03-01 10:30:00','2025-03-01 11:15:00','user01','张三','SMT线急需'),
(2,'ST20250002','MAT002','BATCH2025002',200.0000,'WH001','LOC002','WH001','LOC001','库位优化','已调出','2025-04-10 14:00:00','2025-04-10 15:20:00',NULL,'user04','赵六','移至高频区'),
(3,'ST20250003','MAT003','FPBATCH2025002',50.0000,'WH002','LOC002','WH003','LOC002','客户发货准备','待调拨','2025-05-20 08:30:00',NULL,NULL,'user02','李四','待物流安排'),
(4,'ST20250004','MAT001','BATCH2025004',300.0000,'WH002','LOC003','WH001','LOC002','质检合格后回退','已接收','2025-04-10 09:00:00','2025-04-10 10:00:00','2025-04-10 10:45:00','user05','钱七','待检转合格区'),
(5,'ST20250005','MAT002','BATCH2025005',50.0000,'WH001','LOC002','WH002','LOC001','跨仓支援','已调出','2025-05-25 11:00:00','2025-05-25 12:30:00',NULL,'user01','张三','通信事业部借用');

/*Table structure for table `storage_location` */

DROP TABLE IF EXISTS `storage_location`;

CREATE TABLE `storage_location` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `location_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '储位编码',
  `warehouse_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '仓库编码',
  `warehouse_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '仓库名称',
  `area_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '库区编码',
  `area_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '库区名称',
  `shelf_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '货架编码',
  `shelf_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '货架名称',
  `has_storage_equipment` tinyint NOT NULL DEFAULT '0' COMMENT '仓储设备储位(0:否,1:是)',
  `equipment_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '仓储设备编码',
  `layer_number` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '层号',
  `position_number` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '位号',
  `storage_status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '未知' COMMENT '仓储储位状态',
  `exception_info` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '异常信息',
  `enabled` tinyint NOT NULL DEFAULT '1' COMMENT '启用(0:否,1:是)',
  `remarks` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `modifier` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人',
  `modifier_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人名称',
  `modification_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `location_code` (`location_code`) USING BTREE,
  UNIQUE KEY `uk_location_code` (`location_code`) USING BTREE,
  KEY `fk_storage_location_warehouse` (`warehouse_code`) USING BTREE,
  CONSTRAINT `fk_storage_location_warehouse` FOREIGN KEY (`warehouse_code`) REFERENCES `warehouse` (`warehouse_code`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='储位表';

/*Data for the table `storage_location` */

insert  into `storage_location`(`id`,`location_code`,`warehouse_code`,`warehouse_name`,`area_code`,`area_name`,`shelf_code`,`shelf_name`,`has_storage_equipment`,`equipment_code`,`layer_number`,`position_number`,`storage_status`,`exception_info`,`enabled`,`remarks`,`modifier`,`modifier_name`,`modification_time`) values 
(9,'LOC001','WH001','原材料仓库',NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'未知',NULL,1,NULL,NULL,NULL,'2025-10-26 14:26:33'),
(10,'LOC002','WH001','原材料仓库',NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'未知',NULL,1,NULL,NULL,NULL,'2025-10-26 14:26:33'),
(11,'LOC003','WH002','成品仓库',NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'未知',NULL,1,NULL,NULL,NULL,'2025-10-26 14:26:33');

/*Table structure for table `suppliermaintain` */

DROP TABLE IF EXISTS `suppliermaintain`;

CREATE TABLE `suppliermaintain` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `supplier_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '供应商编码',
  `supplier_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '供应商名称',
  `supplierShort_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '供应商简称',
  `outsourceable` tinyint NOT NULL COMMENT '可委外(0：否  1：是)',
  `erpSupplier_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'ERP供应商编码',
  `incomingLPNLabelParsingScheme_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '来料LPN标签解析方案编码',
  `countryRegion_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '国家地区编码',
  `certificationStatus` tinyint DEFAULT NULL COMMENT '认证状态(0：未认证  1：已认证)',
  `enabled` tinyint DEFAULT NULL COMMENT '启用(0：否  1：是)',
  `remarks` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `modifier` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人',
  `modifier_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人名称',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `supplier_code` (`supplier_code`) USING BTREE,
  CONSTRAINT `suppliermaintain_chk_1` CHECK ((`outsourceable` in (0,1))),
  CONSTRAINT `suppliermaintain_chk_2` CHECK ((`certificationStatus` in (0,1))),
  CONSTRAINT `suppliermaintain_chk_3` CHECK ((`enabled` in (0,1)))
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

/*Data for the table `suppliermaintain` */

insert  into `suppliermaintain`(`id`,`supplier_code`,`supplier_name`,`supplierShort_name`,`outsourceable`,`erpSupplier_code`,`incomingLPNLabelParsingScheme_code`,`countryRegion_code`,`certificationStatus`,`enabled`,`remarks`,`modifier`,`modifier_name`,`modify_time`) values 
(1,'SUP001','深圳电子元件有限公司','深圳电子',1,'ERP-SUP-001','LPN-SCS001','CN-001',1,1,NULL,NULL,'管理员','2025-11-09 21:49:24'),
(2,'SUP002','东莞塑胶原料厂','东莞塑胶',0,'ERP-SUP-002','LPN-SCS002','CN-001',1,1,NULL,NULL,'管理员','2025-11-09 21:49:24'),
(3,'SUP003','上海通信配件供应商','上海通信',1,'ERP-SUP-003','LPN-SCS003','CN-002',0,1,NULL,NULL,'管理员','2025-11-09 21:49:24'),
(4,'SUP004','江苏五金制品厂','江苏五金',0,'ERP-SUP-004','LPN-SCS004','CN-003',1,0,NULL,NULL,'管理员','2025-11-09 21:49:24');

/*Table structure for table `tooling_info` */

DROP TABLE IF EXISTS `tooling_info`;

CREATE TABLE `tooling_info` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `tooling_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '工装编码',
  `tooling_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '工装名称',
  `tooling_model_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '工装型号编码',
  `tooling_model_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '工装型号名称',
  `special_classification` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '特殊分类',
  `factory_serial_number` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '出厂序列号',
  `asset_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '资产编码',
  `location_status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '在库' COMMENT '位置状态',
  `status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '正常' COMMENT '状态',
  `warehouse_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '仓库编码',
  `storage_location_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '储位编码',
  `last_maintenance_date` date DEFAULT NULL COMMENT '最后保养日期',
  `maintenance_usage_count` int DEFAULT '0' COMMENT '保养后使用次数',
  `total_usage_count` int DEFAULT '0' COMMENT '总使用次数',
  `production_line_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '产线编码',
  `process_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '工序编码',
  `equipment_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '设备编码',
  `need_calibration` tinyint NOT NULL DEFAULT '0' COMMENT '需校准(0:否,1:是)',
  `enabled` tinyint NOT NULL DEFAULT '1' COMMENT '启用(0:否,1:是)',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `tooling_code` (`tooling_code`) USING BTREE,
  KEY `fk_tooling_model` (`tooling_model_code`) USING BTREE,
  KEY `fk_tooling_warehouse` (`warehouse_code`) USING BTREE,
  KEY `fk_tooling_storage_location` (`storage_location_code`) USING BTREE,
  KEY `fk_tooling_production_line` (`production_line_code`) USING BTREE,
  KEY `fk_tooling_process` (`process_code`) USING BTREE,
  KEY `fk_tooling_equipment` (`equipment_code`) USING BTREE,
  CONSTRAINT `fk_tooling_equipment` FOREIGN KEY (`equipment_code`) REFERENCES `equipment_info` (`equipment_code`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_tooling_model` FOREIGN KEY (`tooling_model_code`) REFERENCES `tooling_model` (`tooling_model_code`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_tooling_process` FOREIGN KEY (`process_code`) REFERENCES `process` (`process_code`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_tooling_production_line` FOREIGN KEY (`production_line_code`) REFERENCES `production_line` (`line_code`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_tooling_storage_location` FOREIGN KEY (`storage_location_code`) REFERENCES `storage_location` (`location_code`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_tooling_warehouse` FOREIGN KEY (`warehouse_code`) REFERENCES `warehouse` (`warehouse_code`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='工装信息维护表';

/*Data for the table `tooling_info` */

insert  into `tooling_info`(`id`,`tooling_code`,`tooling_name`,`tooling_model_code`,`tooling_model_name`,`special_classification`,`factory_serial_number`,`asset_code`,`location_status`,`status`,`warehouse_code`,`storage_location_code`,`last_maintenance_date`,`maintenance_usage_count`,`total_usage_count`,`production_line_code`,`process_code`,`equipment_code`,`need_calibration`,`enabled`) values 
(1,'T001','测试治具1号','TM001','测试治具-A型',NULL,NULL,NULL,'在库','正常',NULL,NULL,NULL,0,0,NULL,NULL,NULL,0,1),
(2,'T002','定位夹具1号','TM002','定位夹具',NULL,NULL,NULL,'在库','正常',NULL,NULL,NULL,0,0,NULL,NULL,NULL,0,1),
(3,'T003','校准工具1号','TM003','校准工具',NULL,NULL,NULL,'在库','正常',NULL,NULL,NULL,0,0,NULL,NULL,NULL,0,1);

/*Table structure for table `tooling_model` */

DROP TABLE IF EXISTS `tooling_model`;

CREATE TABLE `tooling_model` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `tooling_model_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '工装型号编码',
  `tooling_model_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '工装型号名称',
  `tooling_category_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '工装分类编码',
  `tooling_category_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '工装分类名称',
  `special_classification` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '特殊分类',
  `default_warehouse_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '默认仓库编码',
  `default_storage_location_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '默认储位编码',
  `maintenance_warning_usage_count` int DEFAULT '0' COMMENT '保养预警使用次数',
  `early_maintenance_warning_usage_count` int DEFAULT '0' COMMENT '提前保养预警使用次数',
  `maintenance_warning_days` int DEFAULT '0' COMMENT '保养预警使用天数',
  `early_maintenance_warning_days` int DEFAULT '0' COMMENT '提前保养预警使用天数',
  `early_scrap_warning_count` int DEFAULT '0' COMMENT '提前报废预警次数',
  `scrap_count` int DEFAULT '0' COMMENT '报废次数',
  `scrap_days` int DEFAULT '0' COMMENT '报废天数',
  `tooling_usage_return_enabled` tinyint NOT NULL DEFAULT '0' COMMENT '工装启用领用与归还(0:否,1:是)',
  `tooling_inspection_enabled` tinyint NOT NULL DEFAULT '0' COMMENT '工装启用点检(0:否,1:是)',
  `need_calibration` tinyint NOT NULL DEFAULT '0' COMMENT '需校准(0:否,1:是)',
  `inspection_item_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '检验项目编码',
  `enabled` tinyint NOT NULL DEFAULT '1' COMMENT '启用(0:否,1:是)',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `tooling_model_code` (`tooling_model_code`) USING BTREE,
  UNIQUE KEY `uk_tooling_model_code` (`tooling_model_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='工装型号维护表';

/*Data for the table `tooling_model` */

insert  into `tooling_model`(`id`,`tooling_model_code`,`tooling_model_name`,`tooling_category_code`,`tooling_category_name`,`special_classification`,`default_warehouse_code`,`default_storage_location_code`,`maintenance_warning_usage_count`,`early_maintenance_warning_usage_count`,`maintenance_warning_days`,`early_maintenance_warning_days`,`early_scrap_warning_count`,`scrap_count`,`scrap_days`,`tooling_usage_return_enabled`,`tooling_inspection_enabled`,`need_calibration`,`inspection_item_code`,`enabled`) values 
(1,'TM001','测试治具-A型',NULL,'测试工装',NULL,NULL,NULL,0,0,0,0,0,0,0,0,0,0,NULL,1),
(2,'TM002','定位夹具',NULL,'组装工装',NULL,NULL,NULL,0,0,0,0,0,0,0,0,0,0,NULL,1),
(3,'TM003','校准工具',NULL,'校准工装',NULL,NULL,NULL,0,0,0,0,0,0,0,0,0,0,NULL,1);

/*Table structure for table `warehouse` */

DROP TABLE IF EXISTS `warehouse`;

CREATE TABLE `warehouse` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `organization_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '组织编码',
  `organization_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '组织名称',
  `warehouse_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '仓库编码',
  `warehouse_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '仓库名称',
  `erp_warehouse_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'ERP仓库编码',
  `warehouse_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '仓库类型',
  `attribute_category` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '属性类别',
  `virtual_warehouse` tinyint NOT NULL DEFAULT '0' COMMENT '虚拟仓(0:否,1:是)',
  `bonded` tinyint NOT NULL DEFAULT '0' COMMENT '保税(0:否,1:是)',
  `consignment_warehouse` tinyint NOT NULL DEFAULT '0' COMMENT '寄售仓(0:否,1:是)',
  `enabled` tinyint NOT NULL DEFAULT '1' COMMENT '启用(0:否,1:是)',
  `remarks` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `modifier` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人',
  `modifier_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人名称',
  `modification_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `warehouse_code` (`warehouse_code`) USING BTREE,
  UNIQUE KEY `uk_warehouse_code` (`warehouse_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='仓库表';

/*Data for the table `warehouse` */

insert  into `warehouse`(`id`,`organization_code`,`organization_name`,`warehouse_code`,`warehouse_name`,`erp_warehouse_code`,`warehouse_type`,`attribute_category`,`virtual_warehouse`,`bonded`,`consignment_warehouse`,`enabled`,`remarks`,`modifier`,`modifier_name`,`modification_time`) values 
(25,'ORG001','总部组织','WH001','原材料仓库',NULL,'MATERIAL','NORMAL',0,0,0,1,NULL,NULL,NULL,'2025-10-26 14:26:33'),
(26,'ORG001','总部组织','WH002','成品仓库',NULL,'FINISHED','NORMAL',0,0,0,1,NULL,NULL,NULL,'2025-10-26 14:26:33'),
(27,'ORG001','总部组织','WH003','备件仓库',NULL,'SPARE','NORMAL',0,0,0,1,NULL,NULL,NULL,'2025-10-26 14:26:33'),
(32,'ORG001','总部组织','WH004','SMT仓库',NULL,'SMT','NORMAL',0,0,0,1,NULL,NULL,NULL,'2025-11-26 21:10:48'),
(33,'ORG001','总部组织','WH005','机加类仓库',NULL,'Machine','NORMAL',0,0,0,1,NULL,NULL,NULL,'2025-11-26 21:40:12');

/*Table structure for table `workorderclosing` */

DROP TABLE IF EXISTS `workorderclosing`;

CREATE TABLE `workorderclosing` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `workOrder_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '工单编码',
  `erpWorkOrder_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'ERP工单编码',
  `productionStatus` tinyint NOT NULL COMMENT '生产状态(0：在产  1：清尾 2：停工  3：完工  4：队列 )',
  `product_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '产品编码',
  `product_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '产品名称',
  `productSpec` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '产品规格',
  `materialProcessingCompleted` tinyint NOT NULL COMMENT '物料处理完毕0：否  1：是',
  `customer_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '客户编码',
  `customer_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '客户名称',
  `planQty` int DEFAULT NULL COMMENT '计划数量',
  `totalProductionQty` int DEFAULT NULL COMMENT '总生产数量',
  `productionLine_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '产线编码',
  `productionLine_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '产线名称',
  `planStartTime` datetime DEFAULT NULL COMMENT '计划开始时间',
  `planEndTime` datetime DEFAULT NULL COMMENT '计划结束时间',
  `processSection_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '工艺段编码',
  `processSection_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '工艺段名称',
  `processSectionCategory` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '工艺段类别',
  `workshop_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '车间编码',
  `workshop_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '车间名称',
  `workOrderMaterialPrepareStatus` tinyint NOT NULL COMMENT '工单备料状态(0：未备料  1：首套备料中  2：首套备料完成)',
  `boardSurface` tinyint NOT NULL COMMENT '版面(1-整体)',
  `outsourcing` tinyint NOT NULL COMMENT '外协(0：否  1：是)',
  `supplier_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '供应商编码',
  `supplier_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '供应商名称',
  `org_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '组织编码',
  `org_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '组织名称',
  `remarks` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `modifier` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人',
  `modifierName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人名称',
  `modifyTime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `workOrder_code` (`workOrder_code`) USING BTREE,
  KEY `customer_code` (`customer_code`) USING BTREE,
  KEY `productionLine_code` (`productionLine_code`) USING BTREE,
  KEY `processSection_code` (`processSection_code`) USING BTREE,
  KEY `workshop_code` (`workshop_code`) USING BTREE,
  KEY `supplier_code` (`supplier_code`) USING BTREE,
  KEY `org_code` (`org_code`) USING BTREE,
  CONSTRAINT `workorderclosing_ibfk_1` FOREIGN KEY (`workOrder_code`) REFERENCES `workordermaintain` (`workOrder_code`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `workorderclosing_ibfk_2` FOREIGN KEY (`customer_code`) REFERENCES `customermaintain` (`customer_code`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `workorderclosing_ibfk_3` FOREIGN KEY (`productionLine_code`) REFERENCES `production_line` (`line_code`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `workorderclosing_ibfk_4` FOREIGN KEY (`processSection_code`) REFERENCES `process_segment` (`segment_code`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `workorderclosing_ibfk_5` FOREIGN KEY (`workshop_code`) REFERENCES `workshop` (`workshop_code`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `workorderclosing_ibfk_6` FOREIGN KEY (`supplier_code`) REFERENCES `suppliermaintain` (`supplier_code`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `workorderclosing_ibfk_7` FOREIGN KEY (`org_code`) REFERENCES `organizationmaintain` (`org_code`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `workorderclosing_chk_1` CHECK ((`productionStatus` in (0,1,2,3,4))),
  CONSTRAINT `workorderclosing_chk_2` CHECK ((`materialProcessingCompleted` in (0,1))),
  CONSTRAINT `workorderclosing_chk_3` CHECK ((`planEndTime` > `planStartTime`)),
  CONSTRAINT `workorderclosing_chk_4` CHECK ((`workOrderMaterialPrepareStatus` in (0,1,2))),
  CONSTRAINT `workorderclosing_chk_5` CHECK ((`boardSurface` = 1)),
  CONSTRAINT `workorderclosing_chk_6` CHECK ((`outsourcing` in (0,1)))
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

/*Data for the table `workorderclosing` */

insert  into `workorderclosing`(`id`,`workOrder_code`,`erpWorkOrder_code`,`productionStatus`,`product_code`,`product_name`,`productSpec`,`materialProcessingCompleted`,`customer_code`,`customer_name`,`planQty`,`totalProductionQty`,`productionLine_code`,`productionLine_name`,`planStartTime`,`planEndTime`,`processSection_code`,`processSection_name`,`processSectionCategory`,`workshop_code`,`workshop_name`,`workOrderMaterialPrepareStatus`,`boardSurface`,`outsourcing`,`supplier_code`,`supplier_name`,`org_code`,`org_name`,`remarks`,`modifier`,`modifierName`,`modifyTime`) values 
(1,'WO2024001','ERP-WO-001',3,'PROD001','贴片电阻','0402 10KΩ ±1%',1,'CUST001','广州电子科技有限公司',5000,5000,'PL001','SMT生产线1','2025-12-25 08:00:00','2025-12-25 18:00:00','PS001','SMT工艺段','电子装配','WS001','电子车间',2,1,0,NULL,NULL,'ORG001','电子制造事业部','量产工单全额完成，所有物料退仓或入库，工单正式结案','USER001','张三','2025-12-25 18:30:00'),
(2,'WO2024002','ERP-WO-002',1,'PROD012','工业电机轴','45号钢 φ40mm 长度200mm',0,'CUST002','深圳机电设备有限公司',1000,980,'PL002','机械加工生产线1','2025-12-26 09:00:00','2025-12-26 17:00:00','PS002','机械加工工艺段','金属切削','WS002','机械加工车间',2,1,0,NULL,NULL,'ORG002','重型机械事业部',NULL,'USER003','王五','2025-12-26 17:15:00'),
(4,'WO2024003','ERP-WO-003',2,'PROD005','USB Type-C连接器','10Gbps 防水型',0,'CUST004','北京通信设备有限公司',2000,0,'PL003','连接器生产线4','2025-12-27 08:30:00','2025-12-27 17:30:00','PS003','连接器装配工艺段','通信配件','WS003','通信车间',0,1,1,'SUP003','上海通信配件供应商','ORG003','通信配件事业部',NULL,'USER002','李四','2025-12-27 10:20:00');

/*Table structure for table `workordermaintain` */

DROP TABLE IF EXISTS `workordermaintain`;

CREATE TABLE `workordermaintain` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `workOrder_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '	工单编码',
  `workOrderType` tinyint NOT NULL COMMENT '工单类型(0:量产 1：试做 2：客退返工)',
  `erpWorkOrder_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '	ERP 工单编码',
  `product_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '	产品编码',
  `product_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '	产品名称',
  `line_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '	产线编码',
  `line_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '	产线名称',
  `process_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '工序编码',
  `process_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '	工序名称',
  `equipment_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '设备编码',
  `equipment_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '	设备名称',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `workOrder_code` (`workOrder_code`) USING BTREE,
  UNIQUE KEY `erpWorkOrder_code` (`erpWorkOrder_code`) USING BTREE,
  KEY `fk_WOM_ProductionLine` (`line_code`) USING BTREE,
  KEY `fk_WOM_process` (`process_code`) USING BTREE,
  KEY `fk_WOM_EquipmentInfo` (`equipment_code`) USING BTREE,
  CONSTRAINT `fk_WOM_EquipmentInfo` FOREIGN KEY (`equipment_code`) REFERENCES `equipment_info` (`equipment_code`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_WOM_process` FOREIGN KEY (`process_code`) REFERENCES `process` (`process_code`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_WOM_ProductionLine` FOREIGN KEY (`line_code`) REFERENCES `production_line` (`line_code`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `workordermaintain_chk_1` CHECK ((`workOrderType` in (0,1,2)))
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

/*Data for the table `workordermaintain` */

insert  into `workordermaintain`(`id`,`workOrder_code`,`workOrderType`,`erpWorkOrder_code`,`product_code`,`product_name`,`line_code`,`line_name`,`process_code`,`process_name`,`equipment_code`,`equipment_name`) values 
(7,'WO2024001',0,'ERP-WO-001','PROD001','贴片电阻','PL001','SMT生产线1','PROC001','贴片工序','EQ001','高速贴片机'),
(8,'WO2024002',0,'ERP-WO-002','PROD002','路由器外壳','PL002','注塑生产线2','PROC002','注塑成型','EQ002','卧式注塑机'),
(9,'WO2024003',0,'ERP-WO-003','PROD003','电源适配器','PL003','电源组装线','PROC003','焊接组装','EQ003','自动焊锡机');

/*Table structure for table `workshop` */

DROP TABLE IF EXISTS `workshop`;

CREATE TABLE `workshop` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `workshop_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '车间编码',
  `workshop_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '车间名称',
  `enabled` tinyint NOT NULL DEFAULT '1' COMMENT '启用(0:否,1:是)',
  `remarks` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `modifier` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人',
  `modifier_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人名称',
  `modification_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `workshop_code` (`workshop_code`) USING BTREE,
  UNIQUE KEY `uk_workshop_code` (`workshop_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='车间表';

/*Data for the table `workshop` */

insert  into `workshop`(`id`,`workshop_code`,`workshop_name`,`enabled`,`remarks`,`modifier`,`modifier_name`,`modification_time`) values 
(11,'WS001','SMT车间',1,NULL,NULL,NULL,'2025-10-26 14:26:33'),
(12,'WS002','组装车间',1,NULL,NULL,NULL,'2025-10-26 14:26:33'),
(13,'WS003','测试车间',1,NULL,NULL,NULL,'2025-10-26 14:26:33');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
