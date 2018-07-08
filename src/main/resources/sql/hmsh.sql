/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50522
Source Host           : localhost:3306
Source Database       : hmsh

Target Server Type    : MYSQL
Target Server Version : 50522
File Encoding         : 65001

Date: 2018-07-08 23:48:21
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sys_auth
-- ----------------------------
DROP TABLE IF EXISTS `sys_auth`;
CREATE TABLE `sys_auth` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '菜单id',
  `menuName` varchar(50) DEFAULT NULL COMMENT '菜单名称',
  `menuCode` varchar(50) DEFAULT NULL COMMENT '菜单编码',
  `menuUrl` varchar(50) DEFAULT NULL COMMENT '菜单地址',
  `description` varchar(50) DEFAULT NULL COMMENT '菜单描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_auth
-- ----------------------------
INSERT INTO `sys_auth` VALUES ('2', '百度', 'asgbsdgkjs564dfgsd', 'https://www.baidu.com', '百度');
INSERT INTO `sys_auth` VALUES ('8', '腾讯', '4s8d4f84gwq4fe9q', 'http://www.qq.com/', '还乱码吗腾讯');
INSERT INTO `sys_auth` VALUES ('9', '天气', '', 'http://tianqi.hao123.com/', '天气预报');
INSERT INTO `sys_auth` VALUES ('10', '搜狐', '', 'http://www.sohu.com/', '搜狐网的网址');
INSERT INTO `sys_auth` VALUES ('11', '网易', '', 'http://www.163.com/', '网易的网址');
INSERT INTO `sys_auth` VALUES ('12', '去哪网', '', 'https://www.qunar.com/', '去哪网的网址');
INSERT INTO `sys_auth` VALUES ('13', '12306', '', 'http://www.12306.cn/mormhweb/', '12306买票');
INSERT INTO `sys_auth` VALUES ('14', '凤凰网', '', 'http://www.ifeng.com/', '凤凰网');
INSERT INTO `sys_auth` VALUES ('15', '淘宝网', '', 'https://www.taobao.com/', '淘宝网来了，你的购物天堂');
INSERT INTO `sys_auth` VALUES ('16', '京东', '', 'https://www.jd.com/', '买电器，上京东');
INSERT INTO `sys_auth` VALUES ('17', '当当', '', 'http://www.dangdang.com/', '买图书，选当当网');
INSERT INTO `sys_auth` VALUES ('18', '游戏4399', '', 'http://www.4399.com/', '4399小游戏，玩的开心');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `dept_name` varchar(50) DEFAULT NULL COMMENT '部门名称',
  `dept_code` varchar(50) DEFAULT NULL COMMENT '部门编码',
  `pid` int(10) DEFAULT NULL COMMENT '上级部门id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES ('1', '水利局', 'asgbsdgkjs564dfgsd', null);
INSERT INTO `sys_dept` VALUES ('2', '水利二局', 'dfg645', '1');
INSERT INTO `sys_dept` VALUES ('3', '水利三局', '4b6rw5ht', '1');
INSERT INTO `sys_dept` VALUES ('4', '公安部', 'ga1fe54g', null);
INSERT INTO `sys_dept` VALUES ('5', '北京市公安局', '456ewg6we5', '4');
INSERT INTO `sys_dept` VALUES ('6', '北京市公安局海淀分局', '546q1g6reg', '5');
INSERT INTO `sys_dept` VALUES ('7', '北京市公安局朝阳分局', '46erg51845y64sa', '5');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `roleCode` varchar(50) DEFAULT NULL COMMENT '角色编码',
  `roleName` varchar(50) DEFAULT NULL COMMENT '角色名称',
  `description` varchar(50) DEFAULT NULL COMMENT '角色描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', 'g55w1qwh6', 'zhengfu', '政府角色');
INSERT INTO `sys_role` VALUES ('2', null, 'qiye', '企业角色');
INSERT INTO `sys_role` VALUES ('3', null, 'admin', '管理员角色');
INSERT INTO `sys_role` VALUES ('4', null, 'superadmin', '超管角色权限最大');

-- ----------------------------
-- Table structure for sys_role_auth
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_auth`;
CREATE TABLE `sys_role_auth` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `roleId` int(10) DEFAULT NULL COMMENT '角色ID',
  `authId` int(10) DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`),
  KEY `roleId` (`roleId`),
  KEY `authId` (`authId`),
  CONSTRAINT `sys_role_auth_ibfk_1` FOREIGN KEY (`roleId`) REFERENCES `sys_role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sys_role_auth_ibfk_2` FOREIGN KEY (`authId`) REFERENCES `sys_auth` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role_auth
-- ----------------------------
INSERT INTO `sys_role_auth` VALUES ('2', '3', '2');
INSERT INTO `sys_role_auth` VALUES ('3', '3', '8');
INSERT INTO `sys_role_auth` VALUES ('4', '3', '9');
INSERT INTO `sys_role_auth` VALUES ('5', '3', '10');
INSERT INTO `sys_role_auth` VALUES ('6', '3', '11');
INSERT INTO `sys_role_auth` VALUES ('7', '4', '8');
INSERT INTO `sys_role_auth` VALUES ('8', '4', '9');
INSERT INTO `sys_role_auth` VALUES ('9', '4', '10');
INSERT INTO `sys_role_auth` VALUES ('10', '4', '2');
INSERT INTO `sys_role_auth` VALUES ('11', '4', '11');
INSERT INTO `sys_role_auth` VALUES ('12', '4', '12');
INSERT INTO `sys_role_auth` VALUES ('13', '4', '13');
INSERT INTO `sys_role_auth` VALUES ('14', '4', '14');
INSERT INTO `sys_role_auth` VALUES ('15', '4', '15');
INSERT INTO `sys_role_auth` VALUES ('16', '4', '16');
INSERT INTO `sys_role_auth` VALUES ('17', '4', '17');
INSERT INTO `sys_role_auth` VALUES ('18', '4', '18');
INSERT INTO `sys_role_auth` VALUES ('19', '1', '14');
INSERT INTO `sys_role_auth` VALUES ('20', '2', '8');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `userName` varchar(40) NOT NULL COMMENT '用户名',
  `loginName` varchar(40) NOT NULL COMMENT '登录名',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `isActive` int(1) NOT NULL DEFAULT '0' COMMENT '0未激活，1激活状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `loginName` (`loginName`) USING BTREE,
  UNIQUE KEY `UQ_loginUser` (`loginName`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', '管理员', 'admin', 'e10adc3949ba59abbe56e057f20f883e', '1');
INSERT INTO `sys_user` VALUES ('2', '超级管理员', 'superadmin', 'e10adc3949ba59abbe56e057f20f883e', '1');
INSERT INTO `sys_user` VALUES ('5', '企业1', 'qiye1', 'e10adc3949ba59abbe56e057f20f883e', '1');
INSERT INTO `sys_user` VALUES ('6', '政府1', 'zhengfu1', 'e10adc3949ba59abbe56e057f20f883e', '1');

-- ----------------------------
-- Table structure for sys_user_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_dept`;
CREATE TABLE `sys_user_dept` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `userId` int(10) DEFAULT NULL COMMENT '用户ID',
  `deptId` int(10) DEFAULT NULL COMMENT '部门ID',
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  KEY `deptId` (`deptId`),
  CONSTRAINT `sys_user_dept_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `sys_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sys_user_dept_ibfk_2` FOREIGN KEY (`deptId`) REFERENCES `sys_dept` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user_dept
-- ----------------------------
INSERT INTO `sys_user_dept` VALUES ('1', '1', '4');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `userId` int(10) DEFAULT NULL COMMENT '用户id',
  `roleId` int(10) DEFAULT NULL COMMENT '角色id',
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  KEY `roleId` (`roleId`),
  CONSTRAINT `sys_user_role_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `sys_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sys_user_role_ibfk_2` FOREIGN KEY (`roleId`) REFERENCES `sys_role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1', '1', '3');
INSERT INTO `sys_user_role` VALUES ('2', '2', '4');
INSERT INTO `sys_user_role` VALUES ('3', '5', '1');
INSERT INTO `sys_user_role` VALUES ('4', '6', '2');
INSERT INTO `sys_user_role` VALUES ('5', '1', '1');
INSERT INTO `sys_user_role` VALUES ('6', '1', '2');

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
