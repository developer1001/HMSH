/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50522
Source Host           : localhost:3306
Source Database       : hmsh

Target Server Type    : MYSQL
Target Server Version : 50522
File Encoding         : 65001

Date: 2018-07-01 16:01:04
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `userName` varchar(40) NOT NULL,
  `loginName` varchar(40) NOT NULL,
  `password` varchar(100) NOT NULL,
  `department_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `loginName` (`loginName`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'admin', 'admin', 'e10adc3949ba59abbe56e057f20f883e', null);
INSERT INTO `sys_user` VALUES ('2', 'superadmin', 'superadmin', 'e10adc3949ba59abbe56e057f20f883e', null);

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(40) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `age` int(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', '老杨头', 'e10adc3949ba59abbe56e057f20f883e', '26');
INSERT INTO `t_user` VALUES ('2', '贺平', 'b4d687b8089de728319718ff7f514f3e', '30');
INSERT INTO `t_user` VALUES ('3', '张迪', '3a4b559f7a4a97f00346191c93cc158c', '26');
INSERT INTO `t_user` VALUES ('7', '老赵', '238c84dcef4be4ed4e20937591adbeaf', '35');
INSERT INTO `t_user` VALUES ('9', '八哥', '78d08f1b86bd916291876fed2d25ea76', '10000');
