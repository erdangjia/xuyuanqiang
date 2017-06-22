/*
Navicat MySQL Data Transfer

Source Server         : eryun
Source Server Version : 50622
Source Host           : 112.124.109.87:3306
Source Database       : demo

Target Server Type    : MYSQL
Target Server Version : 50622
File Encoding         : 65001

Date: 2016-12-23 10:06:29
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for notes
-- ----------------------------
DROP TABLE IF EXISTS `notes`;
CREATE TABLE `notes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(200) NOT NULL,
  `color` enum('yellow','blue','green') NOT NULL DEFAULT 'yellow',
  `xyz` varchar(100) DEFAULT NULL,
  `name` varchar(30) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2034 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of notes
-- ----------------------------
INSERT INTO `notes` VALUES ('2003', '二当家的', 'green', '0|184|1787', '55', '2016-11-11 09:20:52');
INSERT INTO `notes` VALUES ('2026', '二当家的', 'yellow', '631|0|1783', '111111111111111111', '2016-11-25 09:30:03');
INSERT INTO `notes` VALUES ('2028', '二当家的', 'yellow', '808|0|1781', 'fsadfdsaf', '2016-11-26 15:38:53');
INSERT INTO `notes` VALUES ('2029', 'content', 'yellow', '145|0|1795', 'xingm', '2016-11-26 16:46:07');
INSERT INTO `notes` VALUES ('2030', '二当家的', 'yellow', '472|317|1794', '123456', '2016-11-26 23:52:34');
INSERT INTO `notes` VALUES ('2031', '123456', 'yellow', '187|297|1793', '123456', '2016-11-26 23:52:48');
INSERT INTO `notes` VALUES ('2021', '二当家的', 'blue', '629|179|1785', '二当家的', '2016-11-22 17:27:25');
INSERT INTO `notes` VALUES ('2032', '123456', 'yellow', '779|326|1797', '123456', '2016-11-26 23:53:04');
INSERT INTO `notes` VALUES ('2033', '123456', 'green', '0|0|1798', '123456', '2016-11-26 23:53:15');
INSERT INTO `notes` VALUES ('2008', '二当家的', 'green', '332|153|1791', 'adasdasdadas', '2016-11-16 09:27:22');
INSERT INTO `notes` VALUES ('2012', '二当家的', 'yellow', '805|179|1784', '爱迪生多', '2016-11-18 11:00:17');
