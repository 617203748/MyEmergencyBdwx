/*
Navicat MySQL Data Transfer

Source Server         : MySql
Source Server Version : 50634
Source Host           : localhost:3306
Source Database       : bdlocal

Target Server Type    : MYSQL
Target Server Version : 50634
File Encoding         : 65001

Date: 2017-08-18 09:46:14
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `bds_bdcommand`
-- ----------------------------
DROP TABLE IF EXISTS `bds_bdcommand`;
CREATE TABLE `bds_bdcommand` (
  `BDC_MLBZ` int(8) NOT NULL AUTO_INCREMENT,
  `BDC_FSZH` int(8) DEFAULT '0',
  `BDC_JSZH` int(8) DEFAULT '0',
  `BDC_TXNR` varchar(560) DEFAULT NULL,
  `BDC_MLLX` int(1) DEFAULT '0',
  `BDC_FSLX` int(1) DEFAULT '0',
  `BDC_TXBM` int(2) DEFAULT '0',
  `BDC_SFTB` int(6) DEFAULT '0',
  `BDC_FSBZ` int(1) DEFAULT '0',
  `is_commit` int(1) DEFAULT '0',
  PRIMARY KEY (`BDC_MLBZ`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bds_bdcommand
-- ----------------------------
INSERT INTO `bds_bdcommand` VALUES ('1', '0', '142014', '你好', '0', '0', '2', '0', '0', '0');
INSERT INTO `bds_bdcommand` VALUES ('2', '0', '142014', 'lll', '0', '0', '2', '0', '0', '0');
INSERT INTO `bds_bdcommand` VALUES ('3', '0', '142014', 'A2', '0', '0', '1', '0', '0', '0');
INSERT INTO `bds_bdcommand` VALUES ('4', '0', '142014', '收到请回复', '0', '0', '2', '0', '0', '0');
INSERT INTO `bds_bdcommand` VALUES ('5', '0', '142014', '', '0', '0', '2', '0', '0', '0');
INSERT INTO `bds_bdcommand` VALUES ('6', '0', '161864', 'A2', '0', '0', '1', '0', '0', '0');
INSERT INTO `bds_bdcommand` VALUES ('7', '0', '142014', '', '0', '0', '2', '0', '0', '0');
INSERT INTO `bds_bdcommand` VALUES ('8', '0', '142016', 'A2', '0', '0', '1', '0', '0', '0');
INSERT INTO `bds_bdcommand` VALUES ('9', '0', '142016', 'A2', '0', '0', '1', '0', '0', '0');
INSERT INTO `bds_bdcommand` VALUES ('10', '0', '142016', 'A2', '0', '0', '1', '0', '0', '0');
INSERT INTO `bds_bdcommand` VALUES ('11', '0', '142016', 'A2', '0', '0', '1', '0', '0', '0');
INSERT INTO `bds_bdcommand` VALUES ('12', '0', '142016', 'A2', '0', '0', '1', '0', '0', '0');
INSERT INTO `bds_bdcommand` VALUES ('13', '0', '142014', 'A2', '0', '0', '1', '0', '0', '0');
INSERT INTO `bds_bdcommand` VALUES ('14', '0', '142016', 'A2', '0', '0', '1', '0', '0', '0');
INSERT INTO `bds_bdcommand` VALUES ('15', '0', '142016', 'A2', '0', '0', '1', '0', '0', '0');
INSERT INTO `bds_bdcommand` VALUES ('16', '0', '142016', 'A2', '0', '0', '1', '0', '0', '0');
INSERT INTO `bds_bdcommand` VALUES ('17', '0', '142016', 'sadasdasd', '0', '0', '2', '0', '0', '0');
INSERT INTO `bds_bdcommand` VALUES ('18', '0', '142016', 'A2', '0', '0', '1', '0', '0', '0');
INSERT INTO `bds_bdcommand` VALUES ('19', '0', '142016', 'A2', '0', '0', '1', '0', '0', '0');
INSERT INTO `bds_bdcommand` VALUES ('20', '0', '142016', '请问请问', '0', '0', '2', '0', '0', '0');
INSERT INTO `bds_bdcommand` VALUES ('21', '0', '142016', 'A2', '0', '0', '1', '0', '0', '0');
INSERT INTO `bds_bdcommand` VALUES ('22', '0', '142016', 'A2', '0', '0', '1', '0', '0', '0');
INSERT INTO `bds_bdcommand` VALUES ('23', '0', '142016', 'A2', '0', '0', '1', '0', '0', '0');
INSERT INTO `bds_bdcommand` VALUES ('24', '0', '142016', 'A2', '0', '0', '1', '0', '0', '0');
INSERT INTO `bds_bdcommand` VALUES ('25', '0', '142016', 'A2', '0', '0', '1', '0', '0', '0');
INSERT INTO `bds_bdcommand` VALUES ('26', '0', '142016', 'A2', '0', '0', '1', '0', '0', '0');
INSERT INTO `bds_bdcommand` VALUES ('27', '0', '142016', 'A2', '0', '0', '1', '0', '0', '0');
INSERT INTO `bds_bdcommand` VALUES ('28', '0', '142016', 'A2', '0', '0', '1', '0', '0', '0');
INSERT INTO `bds_bdcommand` VALUES ('29', '0', '142014', 'A2', '0', '0', '1', '0', '0', '0');
INSERT INTO `bds_bdcommand` VALUES ('30', '0', '142014', 'A2', '0', '0', '1', '0', '0', '0');
INSERT INTO `bds_bdcommand` VALUES ('31', '0', '142014', 'A2', '0', '0', '1', '0', '0', '0');
INSERT INTO `bds_bdcommand` VALUES ('32', '0', '142014', 'A2', '0', '0', '1', '0', '0', '0');
INSERT INTO `bds_bdcommand` VALUES ('33', '0', '142016', '呜呜呜呜', '0', '0', '2', '0', '0', '0');
INSERT INTO `bds_bdcommand` VALUES ('34', '0', '142016', 'A2', '0', '0', '1', '0', '0', '0');
INSERT INTO `bds_bdcommand` VALUES ('35', '0', '142014', 'A2', '0', '0', '1', '0', '0', '0');
INSERT INTO `bds_bdcommand` VALUES ('36', '0', '142014', 'A2', '0', '0', '1', '0', '0', '0');
INSERT INTO `bds_bdcommand` VALUES ('37', '0', '142014', '阿斯达所多', '0', '0', '2', '0', '0', '0');
INSERT INTO `bds_bdcommand` VALUES ('38', '0', '142014', 'A2', '0', '0', '1', '0', '0', '0');
INSERT INTO `bds_bdcommand` VALUES ('39', '0', '142014', 'A2', '0', '0', '1', '0', '0', '0');
INSERT INTO `bds_bdcommand` VALUES ('40', '0', '142014', 'asfdsad', '0', '0', '2', '0', '0', '0');
INSERT INTO `bds_bdcommand` VALUES ('41', '0', '142014', '123123', '0', '0', '2', '0', '0', '0');
INSERT INTO `bds_bdcommand` VALUES ('42', '0', '0', null, '0', '0', '2', '0', '0', '0');
INSERT INTO `bds_bdcommand` VALUES ('43', '0', '0', null, '0', '0', '2', '0', '0', '0');
INSERT INTO `bds_bdcommand` VALUES ('44', '0', '142014', 'A2', '0', '0', '1', '0', '0', '0');
INSERT INTO `bds_bdcommand` VALUES ('45', '0', '142014', '大', '0', '0', '2', '0', '0', '0');
INSERT INTO `bds_bdcommand` VALUES ('46', '0', '142014', 'A2', '0', '0', '1', '0', '0', '0');
INSERT INTO `bds_bdcommand` VALUES ('47', '0', '142014', '测试、测试、测试', '0', '0', '2', '0', '0', '0');
INSERT INTO `bds_bdcommand` VALUES ('48', '0', '142014', 'A2', '0', '0', '1', '0', '0', '0');

-- ----------------------------
-- Table structure for `bds_localbdusers`
-- ----------------------------
DROP TABLE IF EXISTS `bds_localbdusers`;
CREATE TABLE `bds_localbdusers` (
  `LCU_CARDID` int(8) DEFAULT NULL,
  `LCU_CARDFRQ` int(4) DEFAULT '0',
  `LCU_CARDTYPE` int(1) DEFAULT '0',
  `LCU_CPYLEVEL` int(1) DEFAULT '3',
  `LCU_SUPORID` int(8) DEFAULT '0',
  `LCU_ISLOCAL` int(1) DEFAULT '0',
  `LCU_ISENCRYPT` int(1) DEFAULT '0',
  `LCU_ISONLINE` int(4) DEFAULT '0',
  `LCU_ISFULL` int(4) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bds_localbdusers
-- ----------------------------
INSERT INTO `bds_localbdusers` VALUES ('456330', '50', '4', '3', '0', '1', '0', '0', '0');
INSERT INTO `bds_localbdusers` VALUES ('142012', '0', '0', '0', '456330', '0', '0', '0', '0');
INSERT INTO `bds_localbdusers` VALUES ('142013', '0', '0', '0', '456330', '0', '0', '0', '0');
INSERT INTO `bds_localbdusers` VALUES ('142014', '0', '0', '0', '456330', '0', '0', '0', '0');
INSERT INTO `bds_localbdusers` VALUES ('142015', '0', '0', '0', '456330', '0', '0', '0', '0');
INSERT INTO `bds_localbdusers` VALUES ('142016', '0', '0', '0', '456330', '0', '0', '0', '0');

-- ----------------------------
-- Table structure for `dev_msg`
-- ----------------------------
DROP TABLE IF EXISTS `dev_msg`;
CREATE TABLE `dev_msg` (
  `msg_id` int(11) NOT NULL AUTO_INCREMENT,
  `sim_no` varchar(80) DEFAULT NULL,
  `sim_recv` varchar(80) DEFAULT NULL,
  `msg_time` datetime DEFAULT NULL,
  `msg_type` int(11) DEFAULT NULL,
  `msg_coding` int(11) DEFAULT NULL,
  `msg_content` varchar(250) DEFAULT NULL,
  `recv_flag` int(11) DEFAULT NULL,
  `is_commit` int(1) DEFAULT '0',
  PRIMARY KEY (`msg_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dev_msg
-- ----------------------------

-- ----------------------------
-- Table structure for `dev_position`
-- ----------------------------
DROP TABLE IF EXISTS `dev_position`;
CREATE TABLE `dev_position` (
  `pos_id` int(11) NOT NULL AUTO_INCREMENT,
  `postype` int(11) DEFAULT '0',
  `longitude` double DEFAULT NULL,
  `longitudedir` int(11) DEFAULT '0',
  `latitude` double DEFAULT NULL,
  `latitudedir` int(11) DEFAULT NULL,
  `altitude` double DEFAULT NULL,
  `pos_prec` int(11) DEFAULT NULL,
  `fast_flag` int(11) DEFAULT NULL,
  `pos_time` datetime DEFAULT NULL,
  `sim_no` varchar(80) DEFAULT NULL,
  `sim_id` int(11) DEFAULT NULL,
  `is_change` int(1) DEFAULT '0',
  `is_commit` int(1) DEFAULT '0',
  PRIMARY KEY (`pos_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dev_position
-- ----------------------------
