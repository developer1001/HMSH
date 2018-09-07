/*
Navicat MySQL Data Transfer

Source Server         : 120.92.21.177
Source Server Version : 50638
Source Host           : 120.92.21.177:3306
Source Database       : sdp2

Target Server Type    : MYSQL
Target Server Version : 50638
File Encoding         : 65001

Date: 2018-09-07 21:54:43
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
  `type` int(5) NOT NULL COMMENT '所属菜单库',
  `target` int(1) DEFAULT NULL COMMENT '打开方式:1本窗口；2新窗口',
  `remark` varchar(200) DEFAULT NULL COMMENT '描述',
  `url` varchar(200) DEFAULT NULL COMMENT '地址',
  `icon` varchar(100) DEFAULT NULL COMMENT '图标',
  `priority` int(11) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`),
  KEY `type` (`type`),
  CONSTRAINT `sys_menu_ibfk_1` FOREIGN KEY (`type`) REFERENCES `sys_menu_lib` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COMMENT='管理菜单表';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('6', '业务功能按钮定制', '1', '1', null, null, 'admin/auto/buttons!list.action', null, '5');
INSERT INTO `sys_menu` VALUES ('8', '模版定制', '1', '1', null, null, 'admin/auto/pattern!list.action', null, '1');
INSERT INTO `sys_menu` VALUES ('9', '附件库', '1', '1', null, null, 'file/library!go.action', null, '6');
INSERT INTO `sys_menu` VALUES ('10', '角色管理', '1', '1', null, null, 'sysmanager/role/role!list.action', null, '7');
INSERT INTO `sys_menu` VALUES ('11', '用户管理', '1', '1', null, null, 'sysmanager/user/user!list.action', null, '8');
INSERT INTO `sys_menu` VALUES ('12', '角色权限定制', '1', '1', null, null, 'sysmanager/permission/permission!view.action', null, '9');
INSERT INTO `sys_menu` VALUES ('13', '系统配置', '1', '1', null, null, 'sysmanager/config/config!list.action', null, '10');
INSERT INTO `sys_menu` VALUES ('14', '系统布局', '1', '1', null, null, 'admin/auto/layout!list.action', null, '11');
INSERT INTO `sys_menu` VALUES ('15', '系统定制', '1', '1', null, null, 'admin/auto/index!goLayoutIndex.action', null, '2');
INSERT INTO `sys_menu` VALUES ('16', '字典管理', '1', '1', null, null, 'sysmanager/dataDictionary!tree.action', null, '12');
INSERT INTO `sys_menu` VALUES ('17', '部门管理', '1', '1', null, null, 'sysmanager/dept!main.action', null, '13');
INSERT INTO `sys_menu` VALUES ('18', '流程管理', '1', '1', null, null, '/admin/process/process!list.action', null, '14');
INSERT INTO `sys_menu` VALUES ('19', '流程管理', null, '7', null, null, '/admin/process/process!list.action', null, null);
INSERT INTO `sys_menu` VALUES ('20', '流程管', '19', '7', null, '11111', '/admin/process/process!list.action', null, null);
INSERT INTO `sys_menu` VALUES ('21', '菜单1', '20', '7', null, '222222', 'qqqq', null, null);
INSERT INTO `sys_menu` VALUES ('23', '菜单3', '20', '7', null, '测试', 'https', null, null);
INSERT INTO `sys_menu` VALUES ('25', '菜单44', '20', '7', null, 'sdg', 'df', null, null);
INSERT INTO `sys_menu` VALUES ('26', '根节点2', '0', '7', null, '测试', 'htp', null, null);
INSERT INTO `sys_menu` VALUES ('27', '菜单5', '20', '7', null, '测试', 'hhp', null, null);
INSERT INTO `sys_menu` VALUES ('28', '菜单6', '27', '7', null, '', 'http:www', null, null);
INSERT INTO `sys_menu` VALUES ('29', '根节点', '0', '2', null, '测试', 'http://', null, null);
INSERT INTO `sys_menu` VALUES ('30', 'ssssx', '0', '5', null, 'dcccc', 'cccvv', null, null);
INSERT INTO `sys_menu` VALUES ('31', 'zxxzxcczcxeee', '30', '5', null, 'czvvzvxvz', 'cxzcxzfaafcz', null, null);
