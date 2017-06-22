/*
Navicat MySQL Data Transfer

Source Server         : eryun
Source Server Version : 50622
Source Host           : 112.124.109.87:3306
Source Database       : demo

Target Server Type    : MYSQL
Target Server Version : 50622
File Encoding         : 65001

Date: 2016-12-23 10:04:44
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for wishing_wall
-- ----------------------------
DROP TABLE IF EXISTS `wishing_wall`;
CREATE TABLE `wishing_wall` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(200) NOT NULL,
  `color` int(3) DEFAULT '1',
  `xyz` varchar(100) DEFAULT NULL,
  `name` varchar(30) DEFAULT NULL,
  `is_check` tinyint(1) DEFAULT '0',
  `ord` int(5) DEFAULT '0',
  `addtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1266 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wishing_wall
-- ----------------------------
INSERT INTO `wishing_wall` VALUES ('1254', 'http://www.erdangjiade.com/', '1', '279|14|13', '二当家的', '0', '0', '2016-12-23 09:58:52');
INSERT INTO `wishing_wall` VALUES ('1256', '你好，世界。', '1', '538|5|11', 'helloworld', '0', '0', '2016-12-23 09:59:34');
INSERT INTO `wishing_wall` VALUES ('1257', '做一个善良的人', '1', '1091|0|10', '做一个善良的人', '0', '0', '2016-12-23 10:00:07');
INSERT INTO `wishing_wall` VALUES ('1258', '二当家的欢迎您', '3', '1407|39|13', 'erdangjiade', '0', '0', '2016-12-23 10:00:34');
INSERT INTO `wishing_wall` VALUES ('1259', '如果有一天，你成为技术的大牛，你会不会想起，那个曾经指点过你的朋友;', '1', '753|144|9', 'helloworlds', '0', '0', '2016-12-23 10:01:25');
INSERT INTO `wishing_wall` VALUES ('1260', '如果有一天，当技术要金钱交换，你会不会怀念，那时我们纯真到无所不谈;', '4', '101|260|12', '如果有一', '0', '0', '2016-12-23 10:01:48');
INSERT INTO `wishing_wall` VALUES ('1261', '如果有一天，当技术要金钱交换，你会不会怀念，那时我们纯真到无所不谈', '1', '1148|196|11', 'erdangjiade.com', '0', '0', '2016-12-23 10:02:15');
INSERT INTO `wishing_wall` VALUES ('1262', '如果有一天，有人问了你曾经请教过别人的问题，你会不会愿意，倾囊相授;', '1', '459|280|19', 'wang', '0', '0', '2016-12-23 10:02:38');
INSERT INTO `wishing_wall` VALUES ('1263', '如果不能帮人走路，你是否愿意给人指路;', '1', '824|363|18', 'ming', '0', '0', '2016-12-23 10:03:04');
INSERT INTO `wishing_wall` VALUES ('1264', '如果不能授人以鱼，你是否愿意授人以渔;', '1', '0|5|12', 'helloworlda', '0', '0', '2016-12-23 10:03:32');
INSERT INTO `wishing_wall` VALUES ('1265', '自反而缩，虽千万人吾往矣。', '2', '1513|247|16', 'liming', '0', '0', '2016-12-23 10:04:05');
