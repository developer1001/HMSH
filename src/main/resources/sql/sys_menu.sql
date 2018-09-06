/*
Navicat MySQL Data Transfer

Source Server         : 120.92.21.177
Source Server Version : 50638
Source Host           : 120.92.21.177:3306
Source Database       : sdp2

Target Server Type    : MYSQL
Target Server Version : 50638
File Encoding         : 65001

Date: 2018-09-06 20:30:56
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `menu_name` varchar(200) DEFAULT NULL COMMENT '菜单名称',
  `pid` int(11) DEFAULT NULL COMMENT '父id',
  `remark` varchar(2000) DEFAULT NULL COMMENT '描述',
  `url` varchar(200) DEFAULT NULL COMMENT '地址',
  `priority` int(11) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='管理菜单表';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '定制管理系统', null, null, null, '1');
INSERT INTO `sys_menu` VALUES ('6', '业务功能按钮定制', '1', null, 'admin/auto/buttons!list.action', '5');
INSERT INTO `sys_menu` VALUES ('8', '模版定制', '1', null, 'admin/auto/pattern!list.action', '1');
INSERT INTO `sys_menu` VALUES ('9', '附件库', '1', null, 'file/library!go.action', '6');
INSERT INTO `sys_menu` VALUES ('10', '角色管理', '1', null, 'sysmanager/role/role!list.action', '7');
INSERT INTO `sys_menu` VALUES ('11', '用户管理', '1', null, 'sysmanager/user/user!list.action', '8');
INSERT INTO `sys_menu` VALUES ('12', '角色权限定制', '1', null, 'sysmanager/permission/permission!view.action', '9');
INSERT INTO `sys_menu` VALUES ('13', '系统配置', '1', null, 'sysmanager/config/config!list.action', '10');
INSERT INTO `sys_menu` VALUES ('14', '系统布局', '1', null, 'admin/auto/layout!list.action', '11');
INSERT INTO `sys_menu` VALUES ('15', '系统定制', '1', null, 'admin/auto/index!goLayoutIndex.action', '2');
INSERT INTO `sys_menu` VALUES ('16', '字典管理', '1', null, 'sysmanager/dataDictionary!tree.action', '12');
INSERT INTO `sys_menu` VALUES ('17', '部门管理', '1', null, 'sysmanager/dept!main.action', '13');
INSERT INTO `sys_menu` VALUES ('18', '流程管理', '1', null, '/admin/process/process!list.action', '14');
