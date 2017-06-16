/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : equisettle

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2017-06-14 23:29:29
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `case`
-- ----------------------------
DROP TABLE IF EXISTS `case`;
CREATE TABLE `case` (
  `CASE_ID` int(11) NOT NULL AUTO_INCREMENT,
  `CASE_TYPE_ID` int(11) DEFAULT NULL,
  `CASE_TITLE` varchar(255) DEFAULT NULL,
  `CASE_DESCRIPTION` varchar(255) DEFAULT NULL,
  `CASE_ADDRESS` varchar(255) DEFAULT NULL,
  `CASE_INITIATED_CLIENT_ID` int(11) DEFAULT NULL,
  `CASE_ON_CLIENT_ID` int(11) DEFAULT NULL,
  `CASE_STATUS_ID` int(11) DEFAULT NULL,
  `CLIENT_ID_WHO_VOWS_MONEY` int(11) DEFAULT NULL,
  `CLIENT_ID_WHO_CLAIMS_MONEY` int(11) DEFAULT NULL,
  `MAX_NEGOTIATION_ATTEMPTS_ALLOWED` int(11) DEFAULT NULL,
  `AUDIT_CREATED_DT_TIME` datetime DEFAULT NULL,
  `MEDIATOR_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`CASE_ID`),
  KEY `CASE_TYPE_ID` (`CASE_TYPE_ID`),
  KEY `CASE_INITIATED_CLIENT_ID` (`CASE_INITIATED_CLIENT_ID`),
  KEY `CASE_ON_CLIENT_ID` (`CASE_ON_CLIENT_ID`),
  KEY `CASE_STATUS_ID` (`CASE_STATUS_ID`),
  KEY `CLIENT_ID_WHO_VOWS_MONEY` (`CLIENT_ID_WHO_VOWS_MONEY`),
  KEY `CLIENT_ID_WHO_CLAIMS_MONEY` (`CLIENT_ID_WHO_CLAIMS_MONEY`),
  KEY `MEDIATOR_ID` (`MEDIATOR_ID`),
  CONSTRAINT `case_ibfk_1` FOREIGN KEY (`CASE_TYPE_ID`) REFERENCES `case_type` (`CASE_TYPE_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `case_ibfk_2` FOREIGN KEY (`CASE_INITIATED_CLIENT_ID`) REFERENCES `client` (`CLIENT_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `case_ibfk_3` FOREIGN KEY (`CASE_ON_CLIENT_ID`) REFERENCES `client` (`CLIENT_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `case_ibfk_4` FOREIGN KEY (`CASE_STATUS_ID`) REFERENCES `case_status` (`CASE_STATUS_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `case_ibfk_5` FOREIGN KEY (`CLIENT_ID_WHO_VOWS_MONEY`) REFERENCES `client` (`CLIENT_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `case_ibfk_6` FOREIGN KEY (`CLIENT_ID_WHO_CLAIMS_MONEY`) REFERENCES `client` (`CLIENT_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `case_ibfk_7` FOREIGN KEY (`MEDIATOR_ID`) REFERENCES `mediator` (`MEDIATOR_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of case
-- ----------------------------

-- ----------------------------
-- Table structure for `case_document`
-- ----------------------------
DROP TABLE IF EXISTS `case_document`;
CREATE TABLE `case_document` (
  `CASE_DOCUMENT_ID` int(11) NOT NULL AUTO_INCREMENT,
  `CASE_DOCUMENT_URL` varchar(255) DEFAULT NULL,
  `CASE_ID` int(11) DEFAULT NULL,
  `AUDIT_CREATED_DT_TIME` datetime DEFAULT NULL,
  PRIMARY KEY (`CASE_DOCUMENT_ID`),
  KEY `CASE_ID` (`CASE_ID`),
  CONSTRAINT `case_document_ibfk_1` FOREIGN KEY (`CASE_ID`) REFERENCES `case` (`CASE_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of case_document
-- ----------------------------

-- ----------------------------
-- Table structure for `case_negotiation`
-- ----------------------------
DROP TABLE IF EXISTS `case_negotiation`;
CREATE TABLE `case_negotiation` (
  `CASE_NEGOTIATION_ID` int(11) NOT NULL AUTO_INCREMENT,
  `CASE_NEGOTIATION_SENT_DATE` datetime DEFAULT NULL,
  `CASE_ATTEMPTED_BY_ID` int(11) DEFAULT NULL,
  `NEGOTIATION_AMOUNT` int(11) DEFAULT NULL,
  `NEGOTIATION_MESSAGE` int(11) DEFAULT NULL,
  `CASE_RESPONSE_BY_ID` int(11) DEFAULT NULL,
  `CASE_ID` int(11) DEFAULT NULL,
  `CASE_DOCUMENT_URL` varchar(255) DEFAULT NULL,
  `NEGOTIATION_COUNT` int(11) DEFAULT NULL,
  `AUDIT_CREATED_DT_TIME` datetime DEFAULT NULL,
  PRIMARY KEY (`CASE_NEGOTIATION_ID`),
  KEY `CASE_ATTEMPTED_BY_ID` (`CASE_ATTEMPTED_BY_ID`),
  KEY `CASE_RESPONSE_BY_ID` (`CASE_RESPONSE_BY_ID`),
  KEY `CASE_ID` (`CASE_ID`),
  CONSTRAINT `case_negotiation_ibfk_1` FOREIGN KEY (`CASE_ATTEMPTED_BY_ID`) REFERENCES `client` (`CLIENT_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `case_negotiation_ibfk_2` FOREIGN KEY (`CASE_RESPONSE_BY_ID`) REFERENCES `client` (`CLIENT_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `case_negotiation_ibfk_3` FOREIGN KEY (`CASE_ID`) REFERENCES `case` (`CASE_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of case_negotiation
-- ----------------------------

-- ----------------------------
-- Table structure for `case_status`
-- ----------------------------
DROP TABLE IF EXISTS `case_status`;
CREATE TABLE `case_status` (
  `CASE_STATUS_ID` int(11) NOT NULL AUTO_INCREMENT,
  `CASE_STATUS` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`CASE_STATUS_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of case_status
-- ----------------------------
INSERT INTO `case_status` VALUES ('1', 'CASE INITIATED');
INSERT INTO `case_status` VALUES ('2', 'CASE NEGOTIATION IN PROGRESS');
INSERT INTO `case_status` VALUES ('3', 'OFFER ACCEPTED');
INSERT INTO `case_status` VALUES ('4', 'OFFER REJECTED');
INSERT INTO `case_status` VALUES ('5', 'CASE IN FINAL OFFER ARBITRATION');
INSERT INTO `case_status` VALUES ('6', 'FINAL OFFER IS ASSIGNED BY ADMIN');
INSERT INTO `case_status` VALUES ('7', 'ESCROW PAYMENT INITIATED');
INSERT INTO `case_status` VALUES ('8', 'ESCROW PAYMENT COMPLETED');
INSERT INTO `case_status` VALUES ('9', 'MEDIATOR ASSIGNED');
INSERT INTO `case_status` VALUES ('10', 'CASE IS SETTLED BY MEDIATOR');
INSERT INTO `case_status` VALUES ('11', 'CASE IS NOT SETTLED BY MEDIATOR');

-- ----------------------------
-- Table structure for `case_type`
-- ----------------------------
DROP TABLE IF EXISTS `case_type`;
CREATE TABLE `case_type` (
  `CASE_TYPE_ID` int(11) NOT NULL AUTO_INCREMENT,
  `CASE_TYPE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`CASE_TYPE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of case_type
-- ----------------------------
INSERT INTO `case_type` VALUES ('1', 'FAMILY CASE');
INSERT INTO `case_type` VALUES ('2', 'VEHICLE CASE');
INSERT INTO `case_type` VALUES ('3', 'NEIGHBOUR CASE');

-- ----------------------------
-- Table structure for `client`
-- ----------------------------
DROP TABLE IF EXISTS `client`;
CREATE TABLE `client` (
  `CLIENT_ID` int(11) NOT NULL AUTO_INCREMENT,
  `FIRST_NAME` varchar(255) DEFAULT NULL,
  `LAST_NAME` varchar(255) DEFAULT NULL,
  `EMAIL` varchar(255) DEFAULT NULL,
  `ADDRESS` varchar(500) DEFAULT NULL,
  `CITY` varchar(255) DEFAULT NULL,
  `COUNTRY_ID` int(11) DEFAULT NULL,
  `USER_NAME` varchar(255) DEFAULT NULL,
  `PASSWORD` varchar(500) DEFAULT NULL,
  `LAST_LOGGED_IN` datetime DEFAULT NULL,
  `AUDIT_CREATED_DT_TIME` datetime DEFAULT NULL,
  PRIMARY KEY (`CLIENT_ID`),
  KEY `COUNTRY_ID` (`COUNTRY_ID`),
  CONSTRAINT `client_ibfk_1` FOREIGN KEY (`COUNTRY_ID`) REFERENCES `country` (`COUNTRY_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of client
-- ----------------------------

-- ----------------------------
-- Table structure for `country`
-- ----------------------------
DROP TABLE IF EXISTS `country`;
CREATE TABLE `country` (
  `COUNTRY_ID` int(11) NOT NULL,
  `COUNTRY` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`COUNTRY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of country
-- ----------------------------

-- ----------------------------
-- Table structure for `mediator`
-- ----------------------------
DROP TABLE IF EXISTS `mediator`;
CREATE TABLE `mediator` (
  `MEDIATOR_ID` int(11) NOT NULL AUTO_INCREMENT,
  `MEDIATOR_NAME` varchar(255) DEFAULT NULL,
  `MEDIATOR_ADDRESS` varchar(255) DEFAULT NULL,
  `MEDIATOR_TYPE_ID` int(11) DEFAULT NULL,
  `AUDIT_CRATED_DT_TIME` datetime DEFAULT NULL,
  PRIMARY KEY (`MEDIATOR_ID`),
  KEY `MEDIATOR_TYPE_ID` (`MEDIATOR_TYPE_ID`),
  CONSTRAINT `mediator_ibfk_1` FOREIGN KEY (`MEDIATOR_TYPE_ID`) REFERENCES `mediator_type` (`MEDIATOR_TYPE_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of mediator
-- ----------------------------

-- ----------------------------
-- Table structure for `mediator_type`
-- ----------------------------
DROP TABLE IF EXISTS `mediator_type`;
CREATE TABLE `mediator_type` (
  `MEDIATOR_TYPE_ID` int(11) NOT NULL AUTO_INCREMENT,
  `MEDIATOR_TYPE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`MEDIATOR_TYPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of mediator_type
-- ----------------------------
