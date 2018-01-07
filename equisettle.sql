/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : equisettle

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2018-01-07 15:31:19
*/

SET FOREIGN_KEY_CHECKS=0;

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
  CONSTRAINT `case_document_ibfk_1` FOREIGN KEY (`CASE_ID`) REFERENCES `equisettle_case` (`CASE_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
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
  `CASE_ATTEMPTED_NEGOTIATION_AMOUNT` int(11) DEFAULT NULL,
  `NEGOTIATION_MESSAGE` varchar(500) DEFAULT NULL,
  `CASE_RESPONSE_BY_ID` int(11) DEFAULT NULL,
  `CASE_RESPONSE_NEGOTIATION_AMOUNT` int(11) DEFAULT NULL,
  `COUNTER_NEGOTIATION_MESSAGE` varchar(500) DEFAULT NULL,
  `CASE_ID` int(11) DEFAULT NULL,
  `CASE_DOCUMENT_URL` varchar(255) DEFAULT NULL,
  `NEGOTIATION_COUNT` int(11) DEFAULT NULL,
  `RESPONDED_DT_TIME` datetime DEFAULT NULL,
  `AUDIT_CREATED_DT_TIME` datetime DEFAULT NULL,
  `SETTLED_AMOUNT` int(11) DEFAULT NULL,
  `NEGOTIATION_STATUS_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`CASE_NEGOTIATION_ID`),
  KEY `CASE_ATTEMPTED_BY_ID` (`CASE_ATTEMPTED_BY_ID`),
  KEY `CASE_RESPONSE_BY_ID` (`CASE_RESPONSE_BY_ID`),
  KEY `CASE_ID` (`CASE_ID`),
  CONSTRAINT `case_negotiation_ibfk_1` FOREIGN KEY (`CASE_ATTEMPTED_BY_ID`) REFERENCES `client` (`CLIENT_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `case_negotiation_ibfk_2` FOREIGN KEY (`CASE_RESPONSE_BY_ID`) REFERENCES `client` (`CLIENT_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `case_negotiation_ibfk_3` FOREIGN KEY (`CASE_ID`) REFERENCES `equisettle_case` (`CASE_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of case_negotiation
-- ----------------------------
INSERT INTO `case_negotiation` VALUES ('1', '2017-07-09 19:03:49', '6', '500', 'i am offering 500 USD', '3', '200', 'i can only give 200 USD', '1', null, '1', '2017-07-11 10:19:25', '2017-07-09 19:03:49', null, '1');
INSERT INTO `case_negotiation` VALUES ('2', '2017-07-11 10:22:36', '6', '400', 'Atleast give me 400 $', '3', '300', 'ok  this is my best i can give $300', '1', null, '2', '2017-07-11 10:27:35', '2017-07-11 10:22:36', null, '1');
INSERT INTO `case_negotiation` VALUES ('3', '2017-07-11 10:33:47', '6', '350', 'finally i can give $350 . if you are not giving we shall meet in the court  From Equisettle : Case is settled for $350 ', null, '350', 'finally i can give $350 . if you are not giving we shall meet in the court  From Equisettle : Case is settled for $350  From Equisettle : Case is settled for $350 ', '1', null, '3', null, '2017-07-11 10:33:47', '350', '2');
INSERT INTO `case_negotiation` VALUES ('4', '2017-07-11 12:23:28', '6', '1000', 'i want $1000  From Equisettle : Case is settled for $800 ', '3', '800', 'i cannot give more than $800 From Equisettle : Case is settled for $800 ', '2', null, '1', '2017-07-11 12:22:46', '2017-07-11 12:21:20', '800', '2');
INSERT INTO `case_negotiation` VALUES ('5', '2017-07-11 12:40:25', '6', '5000', 'i will give 5000 for the vehicle damage we shall settle it here itself', '3', '8000', 'i want atleast 8000', '3', null, '1', '2017-07-11 12:41:30', '2017-07-11 12:40:25', null, '3');
INSERT INTO `case_negotiation` VALUES ('6', '2017-07-11 12:42:54', '6', '6000', 'best i can offer is $6000 | Equisettle says: Case is settled for $6000 ', null, '6000', ' From Equisettle : Case is settled for $6000 ', '3', null, '2', '2017-07-11 12:43:17', '2017-07-11 12:42:54', '6000', '2');
INSERT INTO `case_negotiation` VALUES ('7', '2017-07-11 14:38:36', '3', '20000', 'i want 20000 usd .. we can settle the case off the court', '6', '10000', 'i can only offer $10000 ', '4', null, '1', '2017-07-11 14:39:25', '2017-07-11 14:38:36', null, '3');
INSERT INTO `case_negotiation` VALUES ('8', '2017-07-11 14:40:59', '3', '18000', 'atleast 18000 i need | Equisettle says: Case is settled for $18000 ', '6', '18000', ' From Equisettle : Case is settled for $18000 ', '4', null, '2', '2017-07-11 14:41:23', '2017-07-11 14:40:59', '18000', '2');
INSERT INTO `case_negotiation` VALUES ('9', '2017-07-11 18:01:48', '7', '8000', 'Please give Jeevaraj', null, null, null, '8', null, '1', null, '2017-07-11 18:01:48', null, '1');
INSERT INTO `case_negotiation` VALUES ('10', '2017-07-11 18:27:09', '7', '2000', 'please give  2000 usd', '8', '1800', '$1800 i can give ', '9', null, '1', '2017-07-11 19:48:04', '2017-07-11 18:27:08', null, '3');
INSERT INTO `case_negotiation` VALUES ('11', '2017-07-11 19:51:34', '7', '1900', 'atleast give me 1900', '8', '1800', 'i can give only 1800', '9', null, '2', '2017-07-13 22:11:59', '2017-07-11 19:51:34', null, '3');
INSERT INTO `case_negotiation` VALUES ('12', '2017-07-13 22:24:14', '7', '1850', 'kljgkjl', '8', '1825', 'final', '9', null, '3', '2017-07-13 22:26:35', '2017-07-13 22:24:14', null, '3');

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
INSERT INTO `case_status` VALUES ('3', 'OFFER ACCEPTED - CASE IS SETTLED');
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of case_type
-- ----------------------------
INSERT INTO `case_type` VALUES ('1', 'Banking');
INSERT INTO `case_type` VALUES ('2', 'Civil Law');
INSERT INTO `case_type` VALUES ('3', 'Consumer Matter');
INSERT INTO `case_type` VALUES ('4', 'Criminal Case');
INSERT INTO `case_type` VALUES ('5', 'Matrimonial Case');
INSERT INTO `case_type` VALUES ('6', 'Property Matter');
INSERT INTO `case_type` VALUES ('7', 'Rental Matter');
INSERT INTO `case_type` VALUES ('8', 'Others');

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
  `MOBILE_NO` varchar(255) DEFAULT NULL,
  `PASSWORD` varchar(500) DEFAULT NULL,
  `LAST_LOGGED_IN` datetime DEFAULT NULL,
  `EMAIL_OTP` varchar(255) DEFAULT NULL,
  `AUDIT_CREATED_DT_TIME` datetime DEFAULT NULL,
  PRIMARY KEY (`CLIENT_ID`),
  KEY `COUNTRY_ID` (`COUNTRY_ID`),
  CONSTRAINT `client_ibfk_1` FOREIGN KEY (`COUNTRY_ID`) REFERENCES `country` (`COUNTRY_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of client
-- ----------------------------
INSERT INTO `client` VALUES ('1', 'hemanth', null, 'kuar@gmai.com', 'sdafasdf', 'bangalfo', '97', 'hemanth', null, 'HsPkKUCJPzgQrTz0Y/D6Sw==', null, null, '2017-06-20 20:22:18');
INSERT INTO `client` VALUES ('2', 'hemanth', null, 'jasdfkkj@gail.vom', 'no 80 1st man sdfasdfaf', 'bangalore', '97', 'hemanth123', null, 'HsPkKUCJPzgQrTz0Y/D6Sw==', null, null, '2017-06-21 06:08:12');
INSERT INTO `client` VALUES ('3', 'bhaskar', null, 'hemanthkumars.india@gmail.com', 'kjkjkjdfkgjsk', 'bangalore', '97', 'hemanth1', null, 'jHvW5p9mYHl4bJjvXSDePQ==', null, 'NXo9pzOZsY270h0zSl/j0A==', '2017-06-25 15:11:46');
INSERT INTO `client` VALUES ('4', 'hemanth', null, 'hemanthkk@gmail.com', 'asfasdf', 'bangalor', '97', 'hemanth32', null, 'jHvW5p9mYHl4bJjvXSDePQ==', null, null, '2017-06-25 15:14:02');
INSERT INTO `client` VALUES ('5', 'hemanth', null, 'sadfsadf@gmgial.com', 'fasdfa', 'bagnalore', '97', 'chaturya', null, 'jHvW5p9mYHl4bJjvXSDePQ==', null, null, '2017-06-25 19:43:03');
INSERT INTO `client` VALUES ('6', 'hemanth', null, 'hemanth@gmail.com', 'sdadfasf', 'bangalore', '97', '', null, 'jHvW5p9mYHl4bJjvXSDePQ==', null, null, '2017-06-29 10:51:33');
INSERT INTO `client` VALUES ('7', 'Bhaskaran', null, 'bhaskaran0907@gmail.com', '146 OMBR Layout', 'Bangalore', '97', '', '7878787878', 'JU8gQvPhy6AYiYJpAX5jsg==', null, null, '2017-07-11 17:37:37');
INSERT INTO `client` VALUES ('8', 'jeevaraj', '', 'jeevaraj@jeeva.com', 'no 80 jayanagar', 'Bangalore', '97', 'jeevaraj@jeeva@gmail.com', '7878787878', 'jHvW5p9mYHl4bJjvXSDePQ==', null, null, '2017-07-11 17:53:47');

-- ----------------------------
-- Table structure for `country`
-- ----------------------------
DROP TABLE IF EXISTS `country`;
CREATE TABLE `country` (
  `COUNTRY_ID` int(11) NOT NULL AUTO_INCREMENT,
  `COUNTRY` varchar(255) DEFAULT NULL,
  `COUNTRY_CODE` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`COUNTRY_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=235 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of country
-- ----------------------------
INSERT INTO `country` VALUES ('1', 'Afghanistan', 'AF');
INSERT INTO `country` VALUES ('2', 'Albania', 'AL');
INSERT INTO `country` VALUES ('3', 'Algeria', 'DZ');
INSERT INTO `country` VALUES ('4', 'American Samoa', 'AS');
INSERT INTO `country` VALUES ('5', 'Andorra', 'AD');
INSERT INTO `country` VALUES ('6', 'Angola', 'AO');
INSERT INTO `country` VALUES ('7', 'Anguilla', 'AI');
INSERT INTO `country` VALUES ('8', 'Argentina', 'AR');
INSERT INTO `country` VALUES ('9', 'Armenia', 'AM');
INSERT INTO `country` VALUES ('10', 'Aruba', 'AW');
INSERT INTO `country` VALUES ('11', 'Australia', 'AU');
INSERT INTO `country` VALUES ('12', 'Austria', 'AT');
INSERT INTO `country` VALUES ('13', 'Azerbaijan', 'AZ');
INSERT INTO `country` VALUES ('14', 'Bahamas', 'BS');
INSERT INTO `country` VALUES ('15', 'Bahrain', 'BH');
INSERT INTO `country` VALUES ('16', 'Bangladesh', 'BD');
INSERT INTO `country` VALUES ('17', 'Barbados', 'BB');
INSERT INTO `country` VALUES ('18', 'Belarus', 'BY');
INSERT INTO `country` VALUES ('19', 'Belgium', 'BE');
INSERT INTO `country` VALUES ('20', 'Belize', 'BZ');
INSERT INTO `country` VALUES ('21', 'Benin', 'BJ');
INSERT INTO `country` VALUES ('22', 'Bermuda', 'BM');
INSERT INTO `country` VALUES ('23', 'Bhutan', 'BT');
INSERT INTO `country` VALUES ('24', 'Bolivia', 'BO');
INSERT INTO `country` VALUES ('25', 'Bosnia and Herzegowina', 'BA');
INSERT INTO `country` VALUES ('26', 'Botswana', 'BW');
INSERT INTO `country` VALUES ('27', 'Bouvet Island', 'BV');
INSERT INTO `country` VALUES ('28', 'Brazil', 'BR');
INSERT INTO `country` VALUES ('29', 'British Indian Ocean Territory', 'IO');
INSERT INTO `country` VALUES ('30', 'Brunei Darussalam', 'BN');
INSERT INTO `country` VALUES ('31', 'Bulgaria', 'BG');
INSERT INTO `country` VALUES ('32', 'Burkina Faso', 'BF');
INSERT INTO `country` VALUES ('33', 'Burundi', 'BI');
INSERT INTO `country` VALUES ('34', 'Cambodia', 'KH');
INSERT INTO `country` VALUES ('35', 'Cameroon', 'CM');
INSERT INTO `country` VALUES ('36', 'Canada', 'CA');
INSERT INTO `country` VALUES ('37', 'Cape Verde', 'CV');
INSERT INTO `country` VALUES ('38', 'Cayman Islands', 'KY');
INSERT INTO `country` VALUES ('39', 'Central African Republic', 'CF');
INSERT INTO `country` VALUES ('40', 'Chad', 'TD');
INSERT INTO `country` VALUES ('41', 'Chile', 'CL');
INSERT INTO `country` VALUES ('42', 'China', 'CN');
INSERT INTO `country` VALUES ('43', 'Christmas Island', 'CX');
INSERT INTO `country` VALUES ('44', 'Cocos (Keeling) Islands', 'CC');
INSERT INTO `country` VALUES ('45', 'Colombia', 'CO');
INSERT INTO `country` VALUES ('46', 'Comoros', 'KM');
INSERT INTO `country` VALUES ('47', 'Congo', 'CG');
INSERT INTO `country` VALUES ('48', 'Congo, the Democratic Republic of the', 'CD');
INSERT INTO `country` VALUES ('49', 'Cook Islands', 'CK');
INSERT INTO `country` VALUES ('50', 'Costa Rica', 'CR');
INSERT INTO `country` VALUES ('51', 'Cote d\'Ivoire', 'CI');
INSERT INTO `country` VALUES ('52', 'Croatia (Hrvatska)', 'HR');
INSERT INTO `country` VALUES ('53', 'Cuba', 'CU');
INSERT INTO `country` VALUES ('54', 'Cyprus', 'CY');
INSERT INTO `country` VALUES ('55', 'Czech Republic', 'CZ');
INSERT INTO `country` VALUES ('56', 'Denmark', 'DK');
INSERT INTO `country` VALUES ('57', 'Djibouti', 'DJ');
INSERT INTO `country` VALUES ('58', 'Dominica', 'DM');
INSERT INTO `country` VALUES ('59', 'Dominican Republic', 'DO');
INSERT INTO `country` VALUES ('60', 'Ecuador', 'EC');
INSERT INTO `country` VALUES ('61', 'Egypt', 'EG');
INSERT INTO `country` VALUES ('62', 'El Salvador', 'SV');
INSERT INTO `country` VALUES ('63', 'Equatorial Guinea', 'GQ');
INSERT INTO `country` VALUES ('64', 'Eritrea', 'ER');
INSERT INTO `country` VALUES ('65', 'Estonia', 'EE');
INSERT INTO `country` VALUES ('66', 'Ethiopia', 'ET');
INSERT INTO `country` VALUES ('67', 'Falkland Islands (Malvinas)', 'FK');
INSERT INTO `country` VALUES ('68', 'Faroe Islands', 'FO');
INSERT INTO `country` VALUES ('69', 'Fiji', 'FJ');
INSERT INTO `country` VALUES ('70', 'Finland', 'FI');
INSERT INTO `country` VALUES ('71', 'France', 'FR');
INSERT INTO `country` VALUES ('72', 'French Guiana', 'GF');
INSERT INTO `country` VALUES ('73', 'French Polynesia', 'PF');
INSERT INTO `country` VALUES ('74', 'French Southern Territories', 'TF');
INSERT INTO `country` VALUES ('75', 'Gabon', 'GA');
INSERT INTO `country` VALUES ('76', 'Gambia', 'GM');
INSERT INTO `country` VALUES ('77', 'Georgia', 'GE');
INSERT INTO `country` VALUES ('78', 'Germany', 'DE');
INSERT INTO `country` VALUES ('79', 'Ghana', 'GH');
INSERT INTO `country` VALUES ('80', 'Gibraltar', 'GI');
INSERT INTO `country` VALUES ('81', 'Greece', 'GR');
INSERT INTO `country` VALUES ('82', 'Greenland', 'GL');
INSERT INTO `country` VALUES ('83', 'Grenada', 'GD');
INSERT INTO `country` VALUES ('84', 'Guadeloupe', 'GP');
INSERT INTO `country` VALUES ('85', 'Guam', 'GU');
INSERT INTO `country` VALUES ('86', 'Guatemala', 'GT');
INSERT INTO `country` VALUES ('87', 'Guinea', 'GN');
INSERT INTO `country` VALUES ('88', 'Guinea-Bissau', 'GW');
INSERT INTO `country` VALUES ('89', 'Guyana', 'GY');
INSERT INTO `country` VALUES ('90', 'Haiti', 'HT');
INSERT INTO `country` VALUES ('91', 'Heard and Mc Donald Islands', 'HM');
INSERT INTO `country` VALUES ('92', 'Holy See (Vatican City State)', 'VA');
INSERT INTO `country` VALUES ('93', 'Honduras', 'HN');
INSERT INTO `country` VALUES ('94', 'Hong Kong', 'HK');
INSERT INTO `country` VALUES ('95', 'Hungary', 'HU');
INSERT INTO `country` VALUES ('96', 'Iceland', 'IS');
INSERT INTO `country` VALUES ('97', 'India', 'IN');
INSERT INTO `country` VALUES ('98', 'Indonesia', 'ID');
INSERT INTO `country` VALUES ('99', 'Iran (Islamic Republic of)', 'IR');
INSERT INTO `country` VALUES ('100', 'Iraq', 'IQ');
INSERT INTO `country` VALUES ('101', 'Ireland', 'IE');
INSERT INTO `country` VALUES ('102', 'Israel', 'IL');
INSERT INTO `country` VALUES ('103', 'Italy', 'IT');
INSERT INTO `country` VALUES ('104', 'Jamaica', 'JM');
INSERT INTO `country` VALUES ('105', 'Japan', 'JP');
INSERT INTO `country` VALUES ('106', 'Jordan', 'JO');
INSERT INTO `country` VALUES ('107', 'Kazakhstan', 'KZ');
INSERT INTO `country` VALUES ('108', 'Kenya', 'KE');
INSERT INTO `country` VALUES ('109', 'Kiribati', 'KI');
INSERT INTO `country` VALUES ('110', 'Korea, Democratic People\'s Republic of', 'KP');
INSERT INTO `country` VALUES ('111', 'Korea, Republic of', 'KR');
INSERT INTO `country` VALUES ('112', 'Kuwait', 'KW');
INSERT INTO `country` VALUES ('113', 'Kyrgyzstan', 'KG');
INSERT INTO `country` VALUES ('114', 'Lao People\'s Democratic Republic', 'LA');
INSERT INTO `country` VALUES ('115', 'Latvia', 'LV');
INSERT INTO `country` VALUES ('116', 'Lebanon', 'LB');
INSERT INTO `country` VALUES ('117', 'Lesotho', 'LS');
INSERT INTO `country` VALUES ('118', 'Liberia', 'LR');
INSERT INTO `country` VALUES ('119', 'Libyan Arab Jamahiriya', 'LY');
INSERT INTO `country` VALUES ('120', 'Liechtenstein', 'LI');
INSERT INTO `country` VALUES ('121', 'Lithuania', 'LT');
INSERT INTO `country` VALUES ('122', 'Luxembourg', 'LU');
INSERT INTO `country` VALUES ('123', 'Macau', 'MO');
INSERT INTO `country` VALUES ('124', 'Macedonia, The Former Yugoslav Republic of', 'MK');
INSERT INTO `country` VALUES ('125', 'Madagascar', 'MG');
INSERT INTO `country` VALUES ('126', 'Malawi', 'MW');
INSERT INTO `country` VALUES ('127', 'Malaysia', 'MY');
INSERT INTO `country` VALUES ('128', 'Maldives', 'MV');
INSERT INTO `country` VALUES ('129', 'Mali', 'ML');
INSERT INTO `country` VALUES ('130', 'Malta', 'MT');
INSERT INTO `country` VALUES ('131', 'Marshall Islands', 'MH');
INSERT INTO `country` VALUES ('132', 'Martinique', 'MQ');
INSERT INTO `country` VALUES ('133', 'Mauritania', 'MR');
INSERT INTO `country` VALUES ('134', 'Mauritius', 'MU');
INSERT INTO `country` VALUES ('135', 'Mayotte', 'YT');
INSERT INTO `country` VALUES ('136', 'Mexico', 'MX');
INSERT INTO `country` VALUES ('137', 'Micronesia, Federated States of', 'FM');
INSERT INTO `country` VALUES ('138', 'Moldova, Republic of', 'MD');
INSERT INTO `country` VALUES ('139', 'Monaco', 'MC');
INSERT INTO `country` VALUES ('140', 'Mongolia', 'MN');
INSERT INTO `country` VALUES ('141', 'Montserrat', 'MS');
INSERT INTO `country` VALUES ('142', 'Morocco', 'MA');
INSERT INTO `country` VALUES ('143', 'Mozambique', 'MZ');
INSERT INTO `country` VALUES ('144', 'Myanmar', 'MM');
INSERT INTO `country` VALUES ('145', 'Namibia', 'NA');
INSERT INTO `country` VALUES ('146', 'Nauru', 'NR');
INSERT INTO `country` VALUES ('147', 'Nepal', 'NP');
INSERT INTO `country` VALUES ('148', 'Netherlands', 'NL');
INSERT INTO `country` VALUES ('149', 'Netherlands Antilles', 'AN');
INSERT INTO `country` VALUES ('150', 'New Caledonia', 'NC');
INSERT INTO `country` VALUES ('151', 'New Zealand', 'NZ');
INSERT INTO `country` VALUES ('152', 'Nicaragua', 'NI');
INSERT INTO `country` VALUES ('153', 'Niger', 'NE');
INSERT INTO `country` VALUES ('154', 'Nigeria', 'NG');
INSERT INTO `country` VALUES ('155', 'Niue', 'NU');
INSERT INTO `country` VALUES ('156', 'Norfolk Island', 'NF');
INSERT INTO `country` VALUES ('157', 'Northern Mariana Islands', 'MP');
INSERT INTO `country` VALUES ('158', 'Norway', 'NO');
INSERT INTO `country` VALUES ('159', 'Oman', 'OM');
INSERT INTO `country` VALUES ('160', 'Pakistan', 'PK');
INSERT INTO `country` VALUES ('161', 'Palau', 'PW');
INSERT INTO `country` VALUES ('162', 'Panama', 'PA');
INSERT INTO `country` VALUES ('163', 'Papua New Guinea', 'PG');
INSERT INTO `country` VALUES ('164', 'Paraguay', 'PY');
INSERT INTO `country` VALUES ('165', 'Peru', 'PE');
INSERT INTO `country` VALUES ('166', 'Philippines', 'PH');
INSERT INTO `country` VALUES ('167', 'Pitcairn', 'PN');
INSERT INTO `country` VALUES ('168', 'Poland', 'PL');
INSERT INTO `country` VALUES ('169', 'Portugal', 'PT');
INSERT INTO `country` VALUES ('170', 'Puerto Rico', 'PR');
INSERT INTO `country` VALUES ('171', 'Qatar', 'QA');
INSERT INTO `country` VALUES ('172', 'Reunion', 'RE');
INSERT INTO `country` VALUES ('173', 'Romania', 'RO');
INSERT INTO `country` VALUES ('174', 'Russian Federation', 'RU');
INSERT INTO `country` VALUES ('175', 'Rwanda', 'RW');
INSERT INTO `country` VALUES ('176', 'Saint Kitts and Nevis', 'KN');
INSERT INTO `country` VALUES ('177', 'Saint LUCIA', 'LC');
INSERT INTO `country` VALUES ('178', 'Saint Vincent and the Grenadines', 'VC');
INSERT INTO `country` VALUES ('179', 'Samoa', 'WS');
INSERT INTO `country` VALUES ('180', 'San Marino', 'SM');
INSERT INTO `country` VALUES ('181', 'Sao Tome and Principe', 'ST');
INSERT INTO `country` VALUES ('182', 'Saudi Arabia', 'SA');
INSERT INTO `country` VALUES ('183', 'Senegal', 'SN');
INSERT INTO `country` VALUES ('184', 'Seychelles', 'SC');
INSERT INTO `country` VALUES ('185', 'Sierra Leone', 'SL');
INSERT INTO `country` VALUES ('186', 'Singapore', 'SG');
INSERT INTO `country` VALUES ('187', 'Slovakia (Slovak Republic)', 'SK');
INSERT INTO `country` VALUES ('188', 'Slovenia', 'SI');
INSERT INTO `country` VALUES ('189', 'Solomon Islands', 'SB');
INSERT INTO `country` VALUES ('190', 'Somalia', 'SO');
INSERT INTO `country` VALUES ('191', 'South Africa', 'ZA');
INSERT INTO `country` VALUES ('192', 'South Georgia and the South Sandwich Islands', 'GS');
INSERT INTO `country` VALUES ('193', 'Spain', 'ES');
INSERT INTO `country` VALUES ('194', 'Sri Lanka', 'LK');
INSERT INTO `country` VALUES ('195', 'St. Helena', 'SH');
INSERT INTO `country` VALUES ('196', 'St. Pierre and Miquelon', 'PM');
INSERT INTO `country` VALUES ('197', 'Sudan', 'SD');
INSERT INTO `country` VALUES ('198', 'Suriname', 'SR');
INSERT INTO `country` VALUES ('199', 'Svalbard and Jan Mayen Islands', 'SJ');
INSERT INTO `country` VALUES ('200', 'Swaziland', 'SZ');
INSERT INTO `country` VALUES ('201', 'Sweden', 'SE');
INSERT INTO `country` VALUES ('202', 'Switzerland', 'CH');
INSERT INTO `country` VALUES ('203', 'Syrian Arab Republic', 'SY');
INSERT INTO `country` VALUES ('204', 'Taiwan, Province of China', 'TW');
INSERT INTO `country` VALUES ('205', 'Tajikistan', 'TJ');
INSERT INTO `country` VALUES ('206', 'Tanzania, United Republic of', 'TZ');
INSERT INTO `country` VALUES ('207', 'Thailand', 'TH');
INSERT INTO `country` VALUES ('208', 'Togo', 'TG');
INSERT INTO `country` VALUES ('209', 'Tokelau', 'TK');
INSERT INTO `country` VALUES ('210', 'Tonga', 'TO');
INSERT INTO `country` VALUES ('211', 'Trinidad and Tobago', 'TT');
INSERT INTO `country` VALUES ('212', 'Tunisia', 'TN');
INSERT INTO `country` VALUES ('213', 'Turkey', 'TR');
INSERT INTO `country` VALUES ('214', 'Turkmenistan', 'TM');
INSERT INTO `country` VALUES ('215', 'Turks and Caicos Islands', 'TC');
INSERT INTO `country` VALUES ('216', 'Tuvalu', 'TV');
INSERT INTO `country` VALUES ('217', 'Uganda', 'UG');
INSERT INTO `country` VALUES ('218', 'Ukraine', 'UA');
INSERT INTO `country` VALUES ('219', 'United Arab Emirates', 'AE');
INSERT INTO `country` VALUES ('220', 'United Kingdom', 'GB');
INSERT INTO `country` VALUES ('221', 'United States', 'US');
INSERT INTO `country` VALUES ('222', 'United States Minor Outlying Islands', 'UM');
INSERT INTO `country` VALUES ('223', 'Uruguay', 'UY');
INSERT INTO `country` VALUES ('224', 'Uzbekistan', 'UZ');
INSERT INTO `country` VALUES ('225', 'Vanuatu', 'VU');
INSERT INTO `country` VALUES ('226', 'Venezuela', 'VE');
INSERT INTO `country` VALUES ('227', 'Viet Nam', 'VN');
INSERT INTO `country` VALUES ('228', 'Virgin Islands (British)', 'VG');
INSERT INTO `country` VALUES ('229', 'Virgin Islands (U.S.)', 'VI');
INSERT INTO `country` VALUES ('230', 'Wallis and Futuna Islands', 'WF');
INSERT INTO `country` VALUES ('231', 'Western Sahara', 'EH');
INSERT INTO `country` VALUES ('232', 'Yemen', 'YE');
INSERT INTO `country` VALUES ('233', 'Zambia', 'ZM');
INSERT INTO `country` VALUES ('234', 'Zimbabwe', 'ZW');

-- ----------------------------
-- Table structure for `equisettle_case`
-- ----------------------------
DROP TABLE IF EXISTS `equisettle_case`;
CREATE TABLE `equisettle_case` (
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
  CONSTRAINT `equisettle_case_ibfk_1` FOREIGN KEY (`CASE_TYPE_ID`) REFERENCES `case_type` (`CASE_TYPE_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `equisettle_case_ibfk_2` FOREIGN KEY (`CASE_INITIATED_CLIENT_ID`) REFERENCES `client` (`CLIENT_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `equisettle_case_ibfk_3` FOREIGN KEY (`CASE_ON_CLIENT_ID`) REFERENCES `client` (`CLIENT_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `equisettle_case_ibfk_4` FOREIGN KEY (`CASE_STATUS_ID`) REFERENCES `case_status` (`CASE_STATUS_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `equisettle_case_ibfk_5` FOREIGN KEY (`CLIENT_ID_WHO_VOWS_MONEY`) REFERENCES `client` (`CLIENT_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `equisettle_case_ibfk_6` FOREIGN KEY (`CLIENT_ID_WHO_CLAIMS_MONEY`) REFERENCES `client` (`CLIENT_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `equisettle_case_ibfk_7` FOREIGN KEY (`MEDIATOR_ID`) REFERENCES `mediator` (`MEDIATOR_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of equisettle_case
-- ----------------------------
INSERT INTO `equisettle_case` VALUES ('1', '2', 'vehicle case', 'ddsggsd', 'asdsafaa', '6', '3', '3', '3', '6', null, '2017-06-29 12:09:59', null);
INSERT INTO `equisettle_case` VALUES ('2', '1', 'vehicle case1', 'dfsfsdsd', 'sdfsafsddf', '6', '3', '3', '3', '6', null, '2017-06-29 12:18:04', null);
INSERT INTO `equisettle_case` VALUES ('3', '1', 'vehicle33', 'sadfsdf', 'nosdfasdf', '6', '3', '3', '3', '6', null, '2017-07-01 14:58:22', null);
INSERT INTO `equisettle_case` VALUES ('4', '8', 'Property Case', 'property case', 'no 80 1st main', '3', '6', '3', '6', '3', null, '2017-07-11 14:37:42', null);
INSERT INTO `equisettle_case` VALUES ('5', '8', 'property case2', 'dsgsdfgsfdgsgd', 'sdafasdfsdafsdafasdf', '6', '3', '1', '3', '6', null, '2017-07-11 14:58:27', null);
INSERT INTO `equisettle_case` VALUES ('8', '1', 'credit card settlement', 'case details', 'no 80 jayanagar', '7', '8', '1', '8', '7', null, '2017-07-11 17:53:47', null);
INSERT INTO `equisettle_case` VALUES ('9', '8', 'vehicle accident case', 'vehicle accident case details', 'no 80 jayanagar', '7', '8', '4', '8', '7', null, '2017-07-11 18:26:28', null);

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
