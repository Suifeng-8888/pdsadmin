/*
Navicat MySQL Data Transfer

Source Server         : 192.168.11.4
Source Server Version : 50553
Source Host           : 192.168.11.4:3306
Source Database       : pds_admin

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2018-07-31 17:23:49
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `nj_ioput_record`
-- ----------------------------
DROP TABLE IF EXISTS `nj_ioput_record`;
CREATE TABLE `nj_ioput_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '出入库信息id',
  `record_type` tinyint(1) NOT NULL COMMENT '出入库类别  1 入库 2 出库',
  `odd_number` varchar(200) DEFAULT NULL COMMENT '出入库单号',
  `order_number` varchar(200) DEFAULT NULL COMMENT '采购单号',
  `type` varchar(200) NOT NULL COMMENT '类别',
  `name` varchar(200) NOT NULL COMMENT '名称',
  `get_name` varchar(200) DEFAULT NULL COMMENT '领用人',
  `unit` varchar(200) DEFAULT NULL COMMENT '计量单位',
  `number` varchar(200) DEFAULT NULL COMMENT '出入/  数量',
  `time` varchar(200) DEFAULT NULL COMMENT '出入/ 时间',
  `operator` varchar(200) DEFAULT NULL COMMENT '经办人',
  `bz` text COMMENT '备注信息',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COMMENT='出入库信息表';

-- ----------------------------
-- Records of nj_ioput_record
-- ----------------------------
INSERT INTO `nj_ioput_record` VALUES ('34', '1', '1001', 'cg01', '样品', '苹果', null, 'g', '15', '2018-05-30', '超级管理员', '');
INSERT INTO `nj_ioput_record` VALUES ('35', '1', '10002', '102', '样品', '香蕉', null, 'g', '20', '2018-05-30', '超级管理员', '');
INSERT INTO `nj_ioput_record` VALUES ('36', '1', '10003', '103', '仪器', '离子色谱仪', null, '个', '5', '2018-05-30', '超级管理员', '');

-- ----------------------------
-- Table structure for `nj_norm`
-- ----------------------------
DROP TABLE IF EXISTS `nj_norm`;
CREATE TABLE `nj_norm` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '标准id',
  `norm_number` varchar(200) DEFAULT NULL COMMENT '标准编号',
  `norm_name` varchar(200) DEFAULT NULL COMMENT '标准名称',
  `norm_type` varchar(200) DEFAULT NULL COMMENT '标准类别',
  `award_dept` varchar(200) DEFAULT NULL COMMENT '颁发部门',
  `create_time` varchar(200) DEFAULT NULL COMMENT '创建时间',
  `norm_creator` varchar(200) DEFAULT NULL COMMENT '标准创建者',
  `norm_explain` text COMMENT '标准备注说明',
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='标准表';

-- ----------------------------
-- Records of nj_norm
-- ----------------------------
INSERT INTO `nj_norm` VALUES ('1', 'bz01', '标准01', '111', null, '2018-06-13', '超级管理员', '111');
INSERT INTO `nj_norm` VALUES ('2', 'gb01', '国家标准', '1111', null, '2018-07-20', '超级管理员', '测试');
INSERT INTO `nj_norm` VALUES ('3', 'sz001', '省级标准', '2222', null, '2018-07-20', '超级管理员', '测试');
INSERT INTO `nj_norm` VALUES ('4', 'gz01', '国际标准ISO9001', '333', null, '2018-07-20', '超级管理员', '测试');

-- ----------------------------
-- Table structure for `nj_norm_detail`
-- ----------------------------
DROP TABLE IF EXISTS `nj_norm_detail`;
CREATE TABLE `nj_norm_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '检测标准详情id',
  `norm_id` int(11) NOT NULL COMMENT '执行标准id',
  `detail_object` varchar(100) DEFAULT NULL COMMENT '执行标准的检测对象',
  `detail_options` varchar(100) DEFAULT NULL COMMENT '执行标准的检测项',
  `detail_value` varchar(100) DEFAULT NULL COMMENT '执行标准的检测标准值',
  `value_updown` varchar(100) DEFAULT NULL COMMENT '检测上下限(范围)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8 COMMENT='标准详情';

-- ----------------------------
-- Records of nj_norm_detail
-- ----------------------------
INSERT INTO `nj_norm_detail` VALUES ('47', '22', 'aa', 'aa', '1.0', '1.0');
INSERT INTO `nj_norm_detail` VALUES ('48', '23', '菠菜', '农药残留', '1.0', '1.0~1.1');
INSERT INTO `nj_norm_detail` VALUES ('49', '24', '苹果', '农药残留', '0.2', '0.3');
INSERT INTO `nj_norm_detail` VALUES ('50', '25', '葡萄', '农药残留', '0.5', '0.6');
INSERT INTO `nj_norm_detail` VALUES ('51', '1', '苹果', '农药残留', '0.1', '0.1');
INSERT INTO `nj_norm_detail` VALUES ('52', '1', '火龙果', '农药残留', '0.2', '0.3');
INSERT INTO `nj_norm_detail` VALUES ('53', '1', '火龙果', '666', '0.1', '0.1');
INSERT INTO `nj_norm_detail` VALUES ('54', '2', '香蕉', '维生素c', '0.1', '0.1');
INSERT INTO `nj_norm_detail` VALUES ('55', '2', '香蕉', '淀粉含量', '0.2', '0.1');
INSERT INTO `nj_norm_detail` VALUES ('56', '4', '牛奶', '三聚氰胺', '0.3', '0.1~0.3');
INSERT INTO `nj_norm_detail` VALUES ('57', '4', '牛奶', '氮含量', '0.3', '0.2~0.4');

-- ----------------------------
-- Table structure for `nj_repertory`
-- ----------------------------
DROP TABLE IF EXISTS `nj_repertory`;
CREATE TABLE `nj_repertory` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '库存信息主键id',
  `category` varchar(200) DEFAULT NULL COMMENT '库存类别',
  `name` varchar(200) NOT NULL COMMENT '库存名称',
  `unit` varchar(200) DEFAULT NULL COMMENT '计量单位',
  `stock` varchar(200) NOT NULL COMMENT '库存量',
  `storage` varchar(200) DEFAULT NULL COMMENT '储存位置',
  `warning` varchar(200) DEFAULT NULL COMMENT '预警值',
  `specification` varchar(200) DEFAULT NULL COMMENT '规格',
  `provenance` varchar(200) DEFAULT NULL COMMENT '生产厂家',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COMMENT='库存信息表';

-- ----------------------------
-- Records of nj_repertory
-- ----------------------------
INSERT INTO `nj_repertory` VALUES ('22', '样品', '苹果', 'g', '15', 'B区', '5', '100g/个', '永辉超市');
INSERT INTO `nj_repertory` VALUES ('25', '样品', '香蕉', 'g', '20', 'B区', '5', '50g/个', '大润发超市');
INSERT INTO `nj_repertory` VALUES ('26', '仪器', '离子色谱仪', '个', '5', 'A区', '2', '见说明书', '瑞士万通中国有限公司');

-- ----------------------------
-- Table structure for `nj_report`
-- ----------------------------
DROP TABLE IF EXISTS `nj_report`;
CREATE TABLE `nj_report` (
  `record_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '检测报告id',
  `serial_number` varchar(255) DEFAULT NULL COMMENT '报告编号',
  `item_number` varchar(255) DEFAULT NULL COMMENT '样品编号',
  `specimen_name` varchar(255) DEFAULT NULL COMMENT '样品名称',
  `norm_id` varchar(255) DEFAULT NULL COMMENT '检测标准',
  `accept_unit` varchar(255) DEFAULT NULL COMMENT '受检单位',
  `detection_type` varchar(255) DEFAULT NULL COMMENT '检验类别',
  `specimen_number` varchar(255) DEFAULT NULL COMMENT '样品编号',
  `production_unit` varchar(255) DEFAULT NULL COMMENT '生产单位',
  `sample_status` varchar(255) DEFAULT NULL COMMENT '样品状态',
  `sampling_site` varchar(255) DEFAULT NULL COMMENT '抽样地点',
  `give_time` varchar(255) DEFAULT NULL COMMENT '送样时间',
  `specimen_amount` varchar(255) DEFAULT NULL COMMENT '样品数量',
  `sampling_number` varchar(255) DEFAULT NULL COMMENT '抽样基数',
  `condition` varchar(255) DEFAULT NULL COMMENT '实验室条件',
  `inspect_time` varchar(255) DEFAULT NULL COMMENT '检验日期',
  `employ_facility` varchar(255) DEFAULT NULL COMMENT '使用仪器设备',
  `model` varchar(255) DEFAULT NULL COMMENT '使用仪器设备型号',
  `mach_id` varchar(255) DEFAULT NULL COMMENT '使用仪器设备编号',
  `inspect_gist` varchar(255) DEFAULT NULL COMMENT '检查依据',
  `judge_gist` varchar(255) DEFAULT NULL COMMENT '判定依据',
  `sign_time` varchar(255) DEFAULT NULL COMMENT '签发日期',
  `conclusion` varchar(255) DEFAULT NULL COMMENT '检验结论',
  `comment` text COMMENT '备注',
  `lister` varchar(255) DEFAULT NULL COMMENT '制表人',
  `auditor` varchar(255) DEFAULT NULL COMMENT '审核人',
  `ratify` varchar(255) DEFAULT NULL COMMENT '批准人',
  `status` bigint(1) DEFAULT '1' COMMENT '状态 1未审核 2 已审核 3 已批准',
  PRIMARY KEY (`record_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='检测报告';

-- ----------------------------
-- Records of nj_report
-- ----------------------------
INSERT INTO `nj_report` VALUES ('1', 'bg01', 'bh001', '苹果', '1', 'a', 'a', null, 'a', 'a', 'a', null, '1', 'a', 'aa', '2018-06-13', '原子吸收光谱仪', 'AA-7000', 'PNJYQ004', 'aa', 'aa', '2018-06-13', 'aa', 'aa', '超级管理员', '超级管理员', null, '2');
INSERT INTO `nj_report` VALUES ('3', 'hlg', 'sh1001', '火龙果', '1', '神农基地', '测试', null, '神农基地', '完好', '建安区', '2018-07-02', '10', '1000', 'fef', '2018-07-16', '原子荧光光谱仪,原子吸收光谱仪', 'AFS-9230,AA-7000', 'PNJYQ003,PNJYQ004', 'fef', 'fe', '2018-07-30', 'fe', '测试', '超级管理员', '超级管理员', null, '2');

-- ----------------------------
-- Table structure for `nj_report_detail`
-- ----------------------------
DROP TABLE IF EXISTS `nj_report_detail`;
CREATE TABLE `nj_report_detail` (
  `details_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '检测详情id',
  `record_id` bigint(20) DEFAULT NULL COMMENT '检测报告id',
  `detection_item` varchar(255) DEFAULT NULL COMMENT '检测项目',
  `norm_claim` varchar(255) DEFAULT NULL COMMENT '标准要求',
  `detection_result` varchar(255) DEFAULT NULL COMMENT '检验结果',
  `detection_limit` varchar(255) DEFAULT NULL COMMENT '检出限',
  `only_verdict` varchar(255) DEFAULT NULL COMMENT '单项结论',
  PRIMARY KEY (`details_id`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8 COMMENT='检测报告详情表';

-- ----------------------------
-- Records of nj_report_detail
-- ----------------------------
INSERT INTO `nj_report_detail` VALUES ('85', '55', '农药残留', '1.0', '0.8', '1.0~1.1', '合格');
INSERT INTO `nj_report_detail` VALUES ('86', '56', '农药残留', '1.0', '0.7', '1.0~1.1', '有效');
INSERT INTO `nj_report_detail` VALUES ('87', '57', '农药残留', '0.2', null, '0.3', null);
INSERT INTO `nj_report_detail` VALUES ('88', '1', '农药残留', '0.1', 'bb', '0.1', 'bb');
INSERT INTO `nj_report_detail` VALUES ('89', '1', '666', '0.1', 'aa', '0.1', 'aa');
INSERT INTO `nj_report_detail` VALUES ('90', '3', '农药残留', '0.2', null, '0.3', null);
INSERT INTO `nj_report_detail` VALUES ('91', '3', '666', '0.1', null, '0.1', null);

-- ----------------------------
-- Table structure for `nj_report_statistics`
-- ----------------------------
DROP TABLE IF EXISTS `nj_report_statistics`;
CREATE TABLE `nj_report_statistics` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '报告统计id',
  `serial_number` varchar(255) NOT NULL COMMENT '报告编号',
  `template_name` varchar(255) DEFAULT NULL COMMENT '使用报告模板',
  `path` varchar(255) NOT NULL COMMENT '报告文档位置',
  `creat_time` datetime NOT NULL COMMENT '报告生成时间',
  `down_number` int(11) NOT NULL DEFAULT '1' COMMENT '下载次数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8 COMMENT='报告统计表';

-- ----------------------------
-- Records of nj_report_statistics
-- ----------------------------
INSERT INTO `nj_report_statistics` VALUES ('34', 'BG-002', '报告模板002', 'attached/file/20180612/test2003-1820180612105133.doc', '2018-06-08 00:00:00', '1');
INSERT INTO `nj_report_statistics` VALUES ('35', 'BG-002', '报告模板002', 'attached/file/20180612/test2003-1820180612105133.doc', '2018-06-09 00:00:00', '1');
INSERT INTO `nj_report_statistics` VALUES ('36', 'BG-002', '报告模板002', 'attached/file/20180612/test2003-1820180612105133.doc', '2018-06-12 00:00:00', '1');
INSERT INTO `nj_report_statistics` VALUES ('37', 'BG-002', '报告模板002', 'attached/file/20180612/test2003-1820180612105133.doc', '2018-06-10 00:00:00', '1');
INSERT INTO `nj_report_statistics` VALUES ('38', 'BG-002', '报告模板002', 'attached/file/20180612/test2003-1820180612105133.doc', '2018-04-11 00:00:00', '1');
INSERT INTO `nj_report_statistics` VALUES ('39', 'BG-002', '报告模板002', 'attached/file/20180612/test2003-1820180612105133.doc', '2018-03-12 00:00:00', '1');
INSERT INTO `nj_report_statistics` VALUES ('40', 'BG-002', '报告模板002', 'attached/file/20180612/test2003-1820180612105133.doc', '2018-02-12 00:00:00', '1');
INSERT INTO `nj_report_statistics` VALUES ('41', 'BG-002', '报告模板002', 'attached/file/20180612/test2003-1820180612105133.doc', '2018-02-12 00:00:00', '1');
INSERT INTO `nj_report_statistics` VALUES ('42', 'BG-002', '报告模板002', 'attached/file/20180612/test2003-1820180612105133.doc', '2018-07-11 00:00:00', '1');
INSERT INTO `nj_report_statistics` VALUES ('43', 'BG-002', '报告模板002', 'attached/file/20180612/test2003-1820180612105133.doc', '2018-07-11 00:00:00', '1');
INSERT INTO `nj_report_statistics` VALUES ('44', 'BG-002', '报告模板002', 'attached/file/20180612/test2003-1820180612105133.doc', '2018-07-12 00:00:00', '1');
INSERT INTO `nj_report_statistics` VALUES ('45', 'BG-002', '报告模板002', 'attached/file/20180612/test2003-1820180612105133.doc', '2018-07-12 00:00:00', '1');
INSERT INTO `nj_report_statistics` VALUES ('46', 'BG-002', '报告模板002', 'attached/file/20180612/test2003-1820180612105133.doc', '2018-07-12 00:00:00', '1');
INSERT INTO `nj_report_statistics` VALUES ('47', 'BG-002', '报告模板002', 'attached/file/20180612/test2003-1820180612105133.doc', '2018-07-13 00:00:00', '1');
INSERT INTO `nj_report_statistics` VALUES ('48', 'BG-002', '报告模板002', 'attached/file/20180612/test2003-1820180612105133.doc', '2018-07-14 00:00:00', '1');
INSERT INTO `nj_report_statistics` VALUES ('49', 'BG-002', '报告模板002', 'attached/file/20180612/test2003-1820180612105133.doc', '2018-07-14 00:00:00', '1');
INSERT INTO `nj_report_statistics` VALUES ('50', 'BG-002', '报告模板002', 'attached/file/20180612/test2003-1820180612105133.doc', '2018-07-15 00:00:00', '1');
INSERT INTO `nj_report_statistics` VALUES ('51', 'BG-002', '报告模板002', 'attached/file/20180612/test2003-1820180612105133.doc', '2018-07-15 00:00:00', '1');
INSERT INTO `nj_report_statistics` VALUES ('52', 'BG-002', '报告模板002', 'attached/file/20180612/test2003-1820180612105133.doc', '2018-07-16 00:00:00', '1');
INSERT INTO `nj_report_statistics` VALUES ('53', 'BG-002', '报告模板002', 'attached/file/20180612/test2003-1820180612105133.doc', '2018-07-16 00:00:00', '1');
INSERT INTO `nj_report_statistics` VALUES ('54', 'BG-002', '报告模板002', 'attached/file/20180612/test2003-1820180612105133.doc', '2018-07-17 00:00:00', '1');
INSERT INTO `nj_report_statistics` VALUES ('55', 'BG-002', '报告模板002', 'attached/file/20180612/test2003-1820180612105133.doc', '2018-07-17 00:00:00', '1');
INSERT INTO `nj_report_statistics` VALUES ('56', 'BG-002', '报告模板002', 'attached/file/20180612/test2003-1820180612105133.doc', '2018-07-17 00:00:00', '1');
INSERT INTO `nj_report_statistics` VALUES ('57', 'BG-002', '报告模板002', 'attached/file/20180612/test2003-1820180612105133.doc', '2018-07-17 00:00:00', '1');

-- ----------------------------
-- Table structure for `nj_report_template`
-- ----------------------------
DROP TABLE IF EXISTS `nj_report_template`;
CREATE TABLE `nj_report_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL COMMENT '模板名称',
  `version` varchar(200) DEFAULT NULL COMMENT '版本',
  `path` varchar(200) DEFAULT NULL COMMENT '保存路径',
  `up_name` varchar(200) DEFAULT NULL COMMENT '上传人',
  `time` varchar(200) DEFAULT NULL COMMENT '上传时间',
  `bz` varchar(200) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='报告模板表';

-- ----------------------------
-- Records of nj_report_template
-- ----------------------------
INSERT INTO `nj_report_template` VALUES ('1', 'mb', null, 'attached/file/20180626/test2003-36.doc', '超级管理员', '2018-06-26', 'aaa');

-- ----------------------------
-- Table structure for `sys_dept`
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pId` varchar(50) DEFAULT '0' COMMENT '上级id',
  `theID` varchar(50) DEFAULT NULL COMMENT '部门编码',
  `name` varchar(50) DEFAULT NULL COMMENT '部门名称',
  `bz` varchar(200) DEFAULT NULL COMMENT '备注',
  `user` varchar(50) DEFAULT NULL COMMENT '部门领导',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_dept_name` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES ('11', '0', 'bm_01', '平顶山农产品检测中心', '顶级部门', 'admin');
INSERT INTO `sys_dept` VALUES ('12', '11', 'xz_01', '行政部', '行政部', 'zgl');
INSERT INTO `sys_dept` VALUES ('15', '11', 'cw-01', '财务部', '财务部', 'smy');
INSERT INTO `sys_dept` VALUES ('16', '11', 'hy-01', '检测化验中心', '检测化验中心', 'cc');
INSERT INTO `sys_dept` VALUES ('17', '16', 'qy_01', '样品部', '样品取样，存储', 'zy');
INSERT INTO `sys_dept` VALUES ('18', '16', 'hy_01', '化验部', '样品化验工作', 'xc');
INSERT INTO `sys_dept` VALUES ('19', '11', 'sheb_01', '设备部', '设备采购维护', 'zf');
INSERT INTO `sys_dept` VALUES ('20', '11', 'yw_01', '业务部', '业务部门', 'cc');
INSERT INTO `sys_dept` VALUES ('21', '12', '1111', '宣称部', '宣称推广公司产品', 'admin');
INSERT INTO `sys_dept` VALUES ('22', '11', 'zhuisu', '追溯', '追溯', 'zy');
INSERT INTO `sys_dept` VALUES ('23', '22', 'zhuisu1', '追溯1', '追溯1', 'zy');

-- ----------------------------
-- Table structure for `sys_dic`
-- ----------------------------
DROP TABLE IF EXISTS `sys_dic`;
CREATE TABLE `sys_dic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(200) NOT NULL COMMENT '类别',
  `name` varchar(200) NOT NULL COMMENT '名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='字典表';

-- ----------------------------
-- Records of sys_dic
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_menu`
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` int(11) NOT NULL COMMENT '菜单id',
  `menu_name` varchar(255) DEFAULT NULL COMMENT '菜单名称',
  `menu_url` varchar(255) DEFAULT '' COMMENT '菜单url',
  `menu_order` varchar(100) DEFAULT NULL COMMENT '排序',
  `menu_icon` varchar(60) DEFAULT NULL COMMENT '图标',
  `menu_type` varchar(10) DEFAULT NULL COMMENT '类型',
  `menu_state` int(1) DEFAULT '0' COMMENT '状态 0 启用 1禁用',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('10', '系统管理', '#', '100000', 'fa fa-cog fa-lg', '1', '0');
INSERT INTO `sys_menu` VALUES ('30', '样品管理', '#', '300000', 'fa fa-tasks fa-lg', '1', '0');
INSERT INTO `sys_menu` VALUES ('31', '标准管理', '#', '310000', 'fa fa-font-awesome fa-lg', '1', '0');
INSERT INTO `sys_menu` VALUES ('32', '报告管理', '#', '320000', 'fa fa-stethoscope fa-lg', '1', '0');
INSERT INTO `sys_menu` VALUES ('33', '采购管理', '#', '330000', 'fa fa-shopping-cart fa-lg', '1', '0');
INSERT INTO `sys_menu` VALUES ('34', '仪器管理', '#', '340000', 'fa fa-university fa-lg', '1', '0');
INSERT INTO `sys_menu` VALUES ('40', '追溯管理', '#', '930000', 'fa fa-tasks fa-lg', '1', '0');
INSERT INTO `sys_menu` VALUES ('60', '库存管理', '#', '600000', 'fa fa-database fa-lg', '1', '0');
INSERT INTO `sys_menu` VALUES ('90', '统计查询', '#', '900000', 'fa fa-th-list fa-lg', '1', '0');
INSERT INTO `sys_menu` VALUES ('91', '追溯配置', '#', '910000', 'fa fa-cog fa-lg', '1', '0');
INSERT INTO `sys_menu` VALUES ('99', '其它', '#', '990000', 'fa fa-leaf fa-lg', '1', '1');
INSERT INTO `sys_menu` VALUES ('1001', '用户管理', 'user/toPage', '100100', 'fa fa-users fa-lg', '1', '0');
INSERT INTO `sys_menu` VALUES ('1002', '角色管理', 'role/toPage', '100200', 'fa fa-user-circle fa-lg', '1', '0');
INSERT INTO `sys_menu` VALUES ('1003', '菜单管理', 'menu/toPage', '100300', 'fa fa-desktop fa-lg', '1', '0');
INSERT INTO `sys_menu` VALUES ('1004', '字典管理', 'dic/toPage', '100400', 'fa fa-font fa-lg', '1', '1');
INSERT INTO `sys_menu` VALUES ('1005', '部门管理', 'dept/toPage', '100500', 'fa fa-bars fa-lg', '1', '0');
INSERT INTO `sys_menu` VALUES ('1006', '系统监控', 'druid', '100600', 'fa fa-laptop fa-lg', '1', '1');
INSERT INTO `sys_menu` VALUES ('1007', '消息管理', 'msg/toPage', '100700', 'fa fa-commenting fa-lg', '1', '0');
INSERT INTO `sys_menu` VALUES ('3001', '样品详情', 'item/toPage', '300100', 'fa fa-outdent fa-lg', '1', '0');
INSERT INTO `sys_menu` VALUES ('3002', '样品分类', 'cate/toPage', '300200', 'fa fa-glass fa-lg', '1', '0');
INSERT INTO `sys_menu` VALUES ('3003', '送检详情', 'send/toPage', '300300', 'fa fa-check-circle-o fa-lg', '1', '0');
INSERT INTO `sys_menu` VALUES ('3101', '标准维护', 'norm/toPage', '310100', 'fa fa-legal fa-lg', '1', '0');
INSERT INTO `sys_menu` VALUES ('3102', '标准详情', 'normDetail/toPage', '310200', 'fa fa-wpforms fa-lg', '1', '0');
INSERT INTO `sys_menu` VALUES ('3201', '报告录入', 'report/toPage', '320100', 'fa fa-file-text-o fa-lg', '1', '0');
INSERT INTO `sys_menu` VALUES ('3202', '报告详情', 'reportDetail/toPage', '320200', 'fa fa-file-text-o fa-lg', '1', '0');
INSERT INTO `sys_menu` VALUES ('3203', '报告模板', 'template/toPage', '320300', 'fa fa-file-text-o fa-lg', '1', '0');
INSERT INTO `sys_menu` VALUES ('3204', '报告文档', 'statistics/toPage', '320400', 'fa fa-file-text-o fa-lg', '1', '0');
INSERT INTO `sys_menu` VALUES ('3301', '采购申请表', 'plan/toPage', '330100', 'fa fa-snowflake-o fa-lg', '1', '0');
INSERT INTO `sys_menu` VALUES ('3302', '采购审批表', 'approve/toPage', '330200', 'fa fa-thumbs-up fa-lg', '1', '0');
INSERT INTO `sys_menu` VALUES ('3303', '采购备案表', 'inquiry/toPage', '330300', 'fa fa-credit-card fa-lg', '1', '0');
INSERT INTO `sys_menu` VALUES ('3304', '财务审批表', 'finance/toPage', '330400', 'fa fa-money fa-lg', '1', '0');
INSERT INTO `sys_menu` VALUES ('3305', '采购结果表', 'result/toPage', '330500', 'fa fa-rebel fa-lg', '1', '0');
INSERT INTO `sys_menu` VALUES ('3306', '供应商信息表', 'supply/toPage', '330600', 'fa fa-male fa-lg', '1', '0');
INSERT INTO `sys_menu` VALUES ('3307', '产品信息表', 'product/toPage', '330700', 'fa fa-product-hunt fa-lg', '1', '0');
INSERT INTO `sys_menu` VALUES ('3401', '仪器列表', 'machine/toPage', '340100', 'fa fa-empire fa-lg', '1', '0');
INSERT INTO `sys_menu` VALUES ('3403', '使用记录', 'record/toPage', '340300', 'fa fa-check-square fa-lg', '1', '0');
INSERT INTO `sys_menu` VALUES ('3404', '维修申请', 'fix/toPage', '340400', 'fa fa-history fa-lg', '1', '0');
INSERT INTO `sys_menu` VALUES ('3405', '检定信息表', 'check/toPage', '340500', 'fa fa-wrench fa-lg', '1', '0');
INSERT INTO `sys_menu` VALUES ('3406', '检定记录表', 'ckrecord/toPage', '340600', 'fa fa-check fa-lg', '1', '0');
INSERT INTO `sys_menu` VALUES ('4001', '进货管理', 'zsImport/toPage', '400100', '', '1', '0');
INSERT INTO `sys_menu` VALUES ('4002', '生产记录管理', 'pro_record/toPage', '400200', '', '1', '0');
INSERT INTO `sys_menu` VALUES ('4003', '批次用料管理', 'batch/toPage', '400300', '', '1', '0');
INSERT INTO `sys_menu` VALUES ('4004', '关键点控制管理', 'keypoint/toPage', '400400', '', '1', '0');
INSERT INTO `sys_menu` VALUES ('4005', '订单管理', 'order/toPage', '400500', '', '1', '0');
INSERT INTO `sys_menu` VALUES ('4006', '产品管理(临时)', 'zsProduct/toPage', '400600', null, '1', '0');
INSERT INTO `sys_menu` VALUES ('6001', '库存信息', 'repertory/toPage', '600100', 'fa fa-cubes fa-lg', '1', '0');
INSERT INTO `sys_menu` VALUES ('6002', '出入库记录', 'putRecord/toPage', '600200', 'fa fa-bars fa-lg', '1', '0');
INSERT INTO `sys_menu` VALUES ('9001', '周报告统计', 'summary/week', '900100', 'fa fa-bug fa-lg', '1', '0');
INSERT INTO `sys_menu` VALUES ('9002', '月报告统计', 'summary/month', '900200', 'fa fa-th fa-lg', '1', '0');
INSERT INTO `sys_menu` VALUES ('9101', '企业资质管理', 'aptitude/toPage', '910100', null, '1', '0');
INSERT INTO `sys_menu` VALUES ('9102', '供应商管理', 'provide/toPage', '910200', null, '1', '0');
INSERT INTO `sys_menu` VALUES ('9103', '销售商管理', 'retailer/toPage', '910300', null, '1', '0');
INSERT INTO `sys_menu` VALUES ('9104', '生产地址配置', 'produce_site/toPage', '910400', null, '1', '0');
INSERT INTO `sys_menu` VALUES ('9901', '模版查询', 'temp/toPage', '990100', 'fa fa-star fa-lg', '1', '1');
INSERT INTO `sys_menu` VALUES ('9902', '模版创建', 'tempFiled/toPage', '990200', 'fa fa-star fa-lg', '1', '1');
INSERT INTO `sys_menu` VALUES ('100101', '用户添加', 'user/add', '100101', null, '2', '0');
INSERT INTO `sys_menu` VALUES ('100102', '用户修改', 'user/update', '100102', null, '2', '0');
INSERT INTO `sys_menu` VALUES ('100103', '用户删除', 'user/delete', '100103', null, '2', '0');
INSERT INTO `sys_menu` VALUES ('100104', '用户导出', 'user/export', '100104', '', '2', '0');
INSERT INTO `sys_menu` VALUES ('100201', '角色添加', 'role/add', '100201', '', '2', '0');
INSERT INTO `sys_menu` VALUES ('100202', '角色修改', 'role/update', '100202', '', '2', '0');
INSERT INTO `sys_menu` VALUES ('100203', '角色删除', 'role/delete', '100203', '', '2', '0');
INSERT INTO `sys_menu` VALUES ('100301', '菜单添加', 'menu/add', '100301', '', '2', '0');
INSERT INTO `sys_menu` VALUES ('100302', '菜单修改', 'menu/update', '100302', '', '2', '0');
INSERT INTO `sys_menu` VALUES ('100303', '菜单删除', 'menu/delete', '100303', '', '2', '0');
INSERT INTO `sys_menu` VALUES ('100401', '字典添加', 'dic/add', '100401', '', '2', '1');
INSERT INTO `sys_menu` VALUES ('100402', '字典修改', 'dic/update', '100402', '', '2', '1');
INSERT INTO `sys_menu` VALUES ('100403', '字典删除', 'dic/delete', '100403', '', '2', '1');
INSERT INTO `sys_menu` VALUES ('100501', '部门添加', 'dept/add', '100501', '', '2', '0');
INSERT INTO `sys_menu` VALUES ('100502', '部门修改', 'dept/update', '100502', '', '2', '0');
INSERT INTO `sys_menu` VALUES ('100503', '部门删除', 'dept/delete', '100503', '', '2', '0');
INSERT INTO `sys_menu` VALUES ('100701', '删除消息', 'msg/delete', '100701', null, '2', '0');
INSERT INTO `sys_menu` VALUES ('300101', '样品明细添加', 'item/add', '300101', null, '2', '0');
INSERT INTO `sys_menu` VALUES ('300102', '样品明细\r\n', 'item/update', '300102', null, '2', '0');
INSERT INTO `sys_menu` VALUES ('300103', '样品明细删除', 'item/delete', '300103', null, '2', '0');
INSERT INTO `sys_menu` VALUES ('300201', '样品分类添加', 'cate/add', '300201', null, '2', '0');
INSERT INTO `sys_menu` VALUES ('300202', '样品分类修改', 'cate/update', '300202', null, '2', '0');
INSERT INTO `sys_menu` VALUES ('300203', '样品分类删除', 'cate/delete', '300203', null, '2', '0');
INSERT INTO `sys_menu` VALUES ('300301', '编辑送检', 'send/update', '300301', null, '2', '0');
INSERT INTO `sys_menu` VALUES ('300302', '删除送检', 'send/delete', '300302', null, '2', '0');
INSERT INTO `sys_menu` VALUES ('310101', '标准添加', 'norm/add', '310101', null, '2', '0');
INSERT INTO `sys_menu` VALUES ('310102', '标准修改', 'norm/update', '310102', null, '2', '0');
INSERT INTO `sys_menu` VALUES ('310103', '标准删除', 'norm/delete', '310103', null, '2', '0');
INSERT INTO `sys_menu` VALUES ('310201', '标准详情添加', 'normDetail/add', '310201', null, '2', '0');
INSERT INTO `sys_menu` VALUES ('310202', '标准详情修改', 'normDetail/update', '310202', null, '2', '0');
INSERT INTO `sys_menu` VALUES ('310203', '标准详情删除', 'normDetail/delete', '310203', null, '2', '0');
INSERT INTO `sys_menu` VALUES ('320101', '检测报告添加', 'report/add', '320101', null, '2', '0');
INSERT INTO `sys_menu` VALUES ('320102', '检测报告修改', 'report/update', '320102', null, '2', '0');
INSERT INTO `sys_menu` VALUES ('320103', '检测报告删除', 'report/delete', '320103', null, '2', '0');
INSERT INTO `sys_menu` VALUES ('320104', '检测报告审核', 'report/upaudit', '320104', null, '2', '0');
INSERT INTO `sys_menu` VALUES ('320201', '报告详情添加', 'reportDetail/add', '320201', null, '2', '0');
INSERT INTO `sys_menu` VALUES ('320202', '报告详情修改', 'reportDetail/update', '320202', null, '2', '0');
INSERT INTO `sys_menu` VALUES ('320203', '报告详情删除', 'reportDetail/delete', '320203', null, '2', '0');
INSERT INTO `sys_menu` VALUES ('330101', '新增采购申请', 'plan/add', '330101', null, '2', '0');
INSERT INTO `sys_menu` VALUES ('330102', '编辑采购申请', 'plan/update', '330102', null, '2', '0');
INSERT INTO `sys_menu` VALUES ('330103', '删除采购申请', 'plan/delete', '330103', null, '2', '0');
INSERT INTO `sys_menu` VALUES ('330104', '采购审批', 'plan/approve', '330104', null, '2', '0');
INSERT INTO `sys_menu` VALUES ('330202', '删除审批', 'approve/delete', '330202', null, '2', '0');
INSERT INTO `sys_menu` VALUES ('330203', '去询价', 'approve/price', '330203', null, '2', '0');
INSERT INTO `sys_menu` VALUES ('330301', '采购单编辑', 'inquiry/update', '330301', null, '2', '0');
INSERT INTO `sys_menu` VALUES ('330302', '采购单删除', 'inquiry/delete', '330302', null, '2', '0');
INSERT INTO `sys_menu` VALUES ('330401', '财务审批编辑', 'finance/update', '330401', null, '2', '0');
INSERT INTO `sys_menu` VALUES ('330402', '财务删除', 'finance/delete', '330402', null, '2', '0');
INSERT INTO `sys_menu` VALUES ('330501', '编辑采购', 'result/update', '330501', null, '2', '0');
INSERT INTO `sys_menu` VALUES ('330502', '采购删除', 'result/delete', '330502', null, '2', '0');
INSERT INTO `sys_menu` VALUES ('330601', '供应商添加', 'supply/add', '330601', null, '2', '0');
INSERT INTO `sys_menu` VALUES ('330602', '供应商修改', 'supply/update', '330602', null, '2', '0');
INSERT INTO `sys_menu` VALUES ('330603', '供应商删除', 'supply/delete', '330603', null, '2', '0');
INSERT INTO `sys_menu` VALUES ('330604', '供应商信息导出', 'supply/export', '330604', null, '2', '0');
INSERT INTO `sys_menu` VALUES ('330701', '产品添加', 'product/add', '330701', null, '2', '0');
INSERT INTO `sys_menu` VALUES ('330702', '产品修改', 'product/update', '330702', null, '2', '0');
INSERT INTO `sys_menu` VALUES ('330703', '产品删除', 'product/delete', '330703', null, '2', '0');
INSERT INTO `sys_menu` VALUES ('340101', '新增仪器', 'machine/add', '340101', null, '2', '0');
INSERT INTO `sys_menu` VALUES ('340102', '编辑仪器', 'machine/update', '340102', null, '2', '0');
INSERT INTO `sys_menu` VALUES ('340103', '删除仪器', 'machine/delete', '340103', null, '2', '0');
INSERT INTO `sys_menu` VALUES ('340301', '新增使用记录', 'record/add', '340301', null, '2', '0');
INSERT INTO `sys_menu` VALUES ('340302', '编辑使用记录', 'record/update', '340302', null, '2', '0');
INSERT INTO `sys_menu` VALUES ('340303', '删除使用记录', 'record/delete', '340303', null, '2', '0');
INSERT INTO `sys_menu` VALUES ('340401', '维修新增', 'fix/add', '340401', null, '2', '0');
INSERT INTO `sys_menu` VALUES ('340402', '维修编辑', 'fix/update', '340402', null, '2', '0');
INSERT INTO `sys_menu` VALUES ('340403', '维修删除', 'fix/delete', '340403', null, '2', '0');
INSERT INTO `sys_menu` VALUES ('340404', '审批维修', 'fix/approve', '340404', null, '2', '0');
INSERT INTO `sys_menu` VALUES ('340501', '新增检定计划', 'check/add', '340501', null, '2', '0');
INSERT INTO `sys_menu` VALUES ('340502', '编辑检定计划', 'check/update', '340502', null, '2', '0');
INSERT INTO `sys_menu` VALUES ('340503', '删除检定计划', 'check/delete', '340503', null, '2', '0');
INSERT INTO `sys_menu` VALUES ('340601', '新增检定记录', 'ckrecord/add', '340601', null, '2', '0');
INSERT INTO `sys_menu` VALUES ('340602', '编辑检定记录', 'ckrecord/update', '340602', null, '2', '0');
INSERT INTO `sys_menu` VALUES ('340603', '删除检定记录', 'ckrecord/delete', '340603', null, '2', '0');
INSERT INTO `sys_menu` VALUES ('400101', '新增进货', 'zsImport/add', '400101', null, '2', '0');
INSERT INTO `sys_menu` VALUES ('400102', '修改进货', 'zsImport/update', '400102', null, '2', '0');
INSERT INTO `sys_menu` VALUES ('400103', '删除进货', 'zsImport/delete', '400103', null, '2', '0');
INSERT INTO `sys_menu` VALUES ('400201', '新增记录', 'pro_record/add', '400201', null, '2', '0');
INSERT INTO `sys_menu` VALUES ('400202', '修改记录', 'pro_record/update', '400202', null, '2', '0');
INSERT INTO `sys_menu` VALUES ('400203', '删除记录', 'pro_record/delete', '400203', null, '2', '0');
INSERT INTO `sys_menu` VALUES ('400301', '新增批次', 'batch/add', '400301', null, '2', '0');
INSERT INTO `sys_menu` VALUES ('400302', '修改批次', 'batch/update', '400302', null, '2', '0');
INSERT INTO `sys_menu` VALUES ('400303', '删除批次', 'batch/delete', '400303', null, '2', '0');
INSERT INTO `sys_menu` VALUES ('400401', '新增产品关键点', 'keypoint/add', '400401', null, '2', '0');
INSERT INTO `sys_menu` VALUES ('400402', '修改产品关键点', 'keypoint/update', '400402', null, '2', '0');
INSERT INTO `sys_menu` VALUES ('400403', '删除产品', 'keypoint/delete', '400403', null, '2', '0');
INSERT INTO `sys_menu` VALUES ('400501', '新增订单', 'order/add', '400501', null, '2', '0');
INSERT INTO `sys_menu` VALUES ('400502', '修改订单', 'order/update', '400502', null, '2', '0');
INSERT INTO `sys_menu` VALUES ('400503', '删除订单', 'order/delete', '400503', null, '2', '0');
INSERT INTO `sys_menu` VALUES ('400601', '新增产品', 'zsProduct/add', '400601', null, '2', '0');
INSERT INTO `sys_menu` VALUES ('400602', '修改产品', 'zsProduct/update', '400602', null, '2', '0');
INSERT INTO `sys_menu` VALUES ('400603', '删除产品', 'zsProduct/delete', '400603', null, '2', '0');
INSERT INTO `sys_menu` VALUES ('600101', '入库', 'repertory/save', '600101', null, '2', '0');
INSERT INTO `sys_menu` VALUES ('600102', '出库', 'repertory/out', '600102', null, '2', '0');
INSERT INTO `sys_menu` VALUES ('600103', '库存记录导出', 'repertory/export', '600103', null, '2', '0');
INSERT INTO `sys_menu` VALUES ('600201', '出入库记录导出', 'putRecord/export', '600201', null, '2', '0');
INSERT INTO `sys_menu` VALUES ('990101', '模版添加', 'temp/add', '990101', null, '2', '1');
INSERT INTO `sys_menu` VALUES ('990102', '模版修改', 'temp/update', '990101', null, '2', '1');
INSERT INTO `sys_menu` VALUES ('990103', '模版删除', 'temp/delete', '990101', null, '2', '1');
INSERT INTO `sys_menu` VALUES ('990201', '模版明细添加', 'tempFiled/add', '990201', null, '2', '1');
INSERT INTO `sys_menu` VALUES ('990202', '模版明细修改', 'tempFiled/update', '990202', null, '2', '1');
INSERT INTO `sys_menu` VALUES ('990203', '模版明细删除', 'tempFiled/delete', '990203', null, '2', '1');

-- ----------------------------
-- Table structure for `sys_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色id',
  `role_name` varchar(100) DEFAULT NULL COMMENT '角色姓名',
  `rights` varchar(1000) DEFAULT NULL COMMENT '角色权限',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '超级管理员', '#');
INSERT INTO `sys_role` VALUES ('10', '化验员', '30,3001,300101,300102,300103,3002,300201,300202,300203,3003,300301,300302,40,4001,400101,400102,400103,4003,400301,400302,400303,4004,400401,400402,400403,400404,4005,400501,400502,400503,4006,400601,400602,400603,70,7001,700101,700102,700103,7002,700201,700202,700203,80,8001,800101,800102,800103,800104,8002,800201,800202,800203,8003,8004,');
INSERT INTO `sys_role` VALUES ('11', '采购员', '50,5001,500101,500102,500103,500104,5002,500202,500203,5003,500301,500302,5004,500401,500402,5005,500501,500502,500503,500504,5006,500601,500602,500603,60,6001,600101,600102,600103,6002,600201,');
INSERT INTO `sys_role` VALUES ('12', '管理员', '10,1001,100101,100102,100103,100104,1005,100501,100502,100503,30,3001,300101,300102,300103,3002,300201,300202,300203,3003,300301,300302,40,4001,400101,400102,400103,4003,400301,400302,400303,4004,400401,400402,400403,400404,4005,400501,400502,400503,4006,400601,400602,400603,50,5001,500101,500102,500103,500104,5002,500202,500203,5003,500301,500302,5004,500401,500402,5005,500501,500502,500503,500504,5006,500601,500602,500603,60,6001,600101,600102,600103,6002,600201,70,7001,700101,700102,700103,7002,700201,700202,700203,80,8001,800101,800102,800103,800104,8002,800201,800202,800203,8003,8004,');
INSERT INTO `sys_role` VALUES ('18', '审计员', '40,4005,400501,400502,400503,4006,400601,400602,400603,4007,400701,50,5001,500101,500102,500103,500104,5004,500401,500402,5005,500501,500502,500503,500504,80,8001,800104,');
INSERT INTO `sys_role` VALUES ('19', '检定负责人', '0,10,1007,100701,30,3001,300101,300102,300103,3002,300201,300202,300203,3003,300301,300302,40,4001,400101,400102,400103,4003,400301,400302,400303,4004,400401,400402,400403,400404,4005,400501,400502,400503,4006,400601,400602,400603,');
INSERT INTO `sys_role` VALUES ('20', '追溯人员', '0,91,9101,9102,9103,9104,40,4001,400101,400102,400103,4002,400201,400202,400203,4003,400301,400302,400303,4004,400401,400402,400403,4005,400501,400502,400503,4006,400601,400602,400603,99,9901,990101,990102,990103,9902,990201,990202,990203,');

-- ----------------------------
-- Table structure for `sys_user`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(100) NOT NULL COMMENT '账户id',
  `username` varchar(100) NOT NULL COMMENT '账户名',
  `password` varchar(100) DEFAULT NULL COMMENT '密码',
  `phone` varchar(32) DEFAULT NULL COMMENT '电话',
  `email` varchar(32) DEFAULT NULL COMMENT '邮箱',
  `bz` varchar(100) DEFAULT NULL COMMENT '备注',
  `state` varchar(32) DEFAULT '0' COMMENT '状态 0正常 1禁用',
  `create_time` date DEFAULT NULL COMMENT '登录时间',
  `role_id` varchar(100) DEFAULT NULL COMMENT '角色',
  `dept_id` varchar(50) DEFAULT NULL COMMENT '部门名称',
  `user_img` varchar(100) DEFAULT NULL COMMENT '用户头像',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'admin', '超级管理员', 'de41b7fb99201d8334c23c014db35ecd92df81bc', '15090287580', '543352844@qq.com', '543352844@qq.com', '0', '2018-03-27', '1', '11', 'static/images/user/user.png');
INSERT INTO `sys_user` VALUES ('15', 'zf', '张飞', '537a7d3808be4fb5179c215ffdbf65313193b6ba', '15090287580', '123456@qq.com', '123456@qq.com', '0', null, '20', '16', 'static/images/user/user.png');
INSERT INTO `sys_user` VALUES ('16', 'gy', '关羽', '202df96c062b39b359404de0e33a3bc494ea0515', '15090287580', '543352844@qq.com', '543352844@qq.com', '0', null, '10', '18', 'static/images/user/user.png');
INSERT INTO `sys_user` VALUES ('17', 'lb', '刘备', '4593488ae6e69b135c0d92ed950bc910271c0416', '15090287580', '543352844@qq.com', '543352844@qq.com', '0', null, '12', '12', 'static/images/user/user.png');
INSERT INTO `sys_user` VALUES ('18', 'zgl', '诸葛亮', '48dbe8536c16668a18c26eafd95fadb039ba87dc', '15090287580', '543352844@qq.com', '543352844@qq.com', '0', null, '11', '20', 'static/images/user/user.png');
INSERT INTO `sys_user` VALUES ('20', 'cc', '曹操', 'b6c1e8b453a3b8ce8e564334ebb51df96a8c6802', '15090287580', '543352844@qq.com', '543352844@qq.com', '0', null, '12', '12', 'static/images/user/user.png');
INSERT INTO `sys_user` VALUES ('21', 'smy', '司马懿', 'f91391388db902bc54fc57e0b49537f0ec8fc68a', '15090287580', '543352844@qq.com', '543352844@qq.com', '0', null, '12', '15', 'static/images/user/user.png');
INSERT INTO `sys_user` VALUES ('22', 'zy', '赵云', '9c6fa4c1f313858741594fcce98acfb47b8b3b85', '15090287580', '543352844@qq.com', '543352844@qq.com', '0', null, '18', '15', 'static/images/user/user.png');
INSERT INTO `sys_user` VALUES ('23', 'xhc', '夏侯淳', '4a429a65b24484d7c572066a11253dd377bb4250', '15090287580', '543352844@qq.com', '543352844@qq.com', '0', null, '18', '15', 'static/images/user/user.png');
INSERT INTO `sys_user` VALUES ('24', 'xc', '许褚', 'ac9cb3fb0816345e3a93faf9fafd44650d60126b', '15090287580', '543352844@qq.com', '543352844@qq.com', '0', null, '10', '17', 'static/images/user/user.png');
INSERT INTO `sys_user` VALUES ('25', 'xhy', '夏侯渊', 'ea92a9cabb995822bb353a3fe3ff34c2b7667e5b', '1231254365', '543352844@qq.com', '543352844@qq.com', '0', null, '10', '18', 'static/images/user/user.png');
INSERT INTO `sys_user` VALUES ('26', 'zs', '周杰伦', '5a3d64f201da730264f0da6392ce7383e6cc5ca6', '123', '123', '123', '0', null, '20', '23', 'static/images/user/user.png');

-- ----------------------------
-- Table structure for `tb_check_fix`
-- ----------------------------
DROP TABLE IF EXISTS `tb_check_fix`;
CREATE TABLE `tb_check_fix` (
  `id` bigint(50) NOT NULL AUTO_INCREMENT COMMENT '申请ID',
  `mach_id` varchar(50) NOT NULL COMMENT '仪器编号',
  `mach_name` varchar(50) DEFAULT NULL COMMENT '仪器名称',
  `analysis` varchar(255) DEFAULT NULL COMMENT '故障分析',
  `applyer` varchar(50) DEFAULT NULL COMMENT '申请人',
  `app_time` varchar(20) DEFAULT NULL COMMENT '申请日期',
  `method` varchar(50) DEFAULT NULL COMMENT '申请维修的方法',
  `cost` double(20,2) DEFAULT NULL COMMENT '申请维修费用',
  `status` int(1) DEFAULT '2' COMMENT '审批状态,0 通过,1 未通过 2 待审批',
  `type` int(1) DEFAULT NULL COMMENT '维修or检测  0维修 1 检测',
  `appver` varchar(30) DEFAULT NULL COMMENT '审批人',
  `approve_time` varchar(20) DEFAULT NULL COMMENT '审批时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='维修or检测申请表';

-- ----------------------------
-- Records of tb_check_fix
-- ----------------------------
INSERT INTO `tb_check_fix` VALUES ('4', 'PNJYQ011', '伏安极谱仪', '零部件老化', '李睿', '2018-05-05', '返厂维修', '5000.00', '0', '1', '超级管理员', '2018-05-16 14:43:22');
INSERT INTO `tb_check_fix` VALUES ('5', 'PNJYQ002', '空气采样器', '仪器精度不够', '张三', '2018-05-16', '返厂维修', '500.00', '2', '0', null, null);
INSERT INTO `tb_check_fix` VALUES ('6', 'PNJYQ004', '原子吸收光谱仪', '零部件老化', '李四', '2018-05-25', '在线指导', '10.00', '1', '1', '超级管理员', '2018-05-24 15:21:25');

-- ----------------------------
-- Table structure for `tb_item`
-- ----------------------------
DROP TABLE IF EXISTS `tb_item`;
CREATE TABLE `tb_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `item_number` varchar(255) DEFAULT NULL COMMENT '样品编号',
  `item_sort` varchar(255) DEFAULT NULL COMMENT '样品分类',
  `item_name` varchar(255) DEFAULT NULL COMMENT '样品名称',
  `item_state` varchar(255) DEFAULT NULL COMMENT '样品状态',
  `item_num` varchar(255) DEFAULT NULL COMMENT '样品数量',
  `send_person` varchar(255) DEFAULT NULL COMMENT '抽/送样人',
  `send_unit` varchar(255) DEFAULT NULL COMMENT '抽/送样单位',
  `send_site` varchar(255) DEFAULT NULL COMMENT '抽/送样地点',
  `send_number` varchar(255) DEFAULT NULL COMMENT '抽/送样基数',
  `send_time` varchar(255) DEFAULT NULL COMMENT '抽/送样时间',
  `testing_time` varchar(255) DEFAULT NULL COMMENT '检测时间',
  `detection_name` varchar(255) DEFAULT NULL COMMENT '检测人',
  `detection_type` varchar(255) DEFAULT NULL COMMENT '检测类别',
  `norm_id` varchar(255) DEFAULT NULL COMMENT '使用标准id',
  `use_standard` varchar(255) DEFAULT NULL COMMENT '检测使用标准',
  `checked` int(11) DEFAULT '0' COMMENT '是否已检测 0 未送检 1 已送检',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='样品明细表';

-- ----------------------------
-- Records of tb_item
-- ----------------------------
INSERT INTO `tb_item` VALUES ('1', 'bh001', '蔬菜类', '苹果', 'a', '1', 'a', 'a', 'a', 'a', '2018-07-25', '2018-06-13', 'a', 'a', '1', '标准01', '1');
INSERT INTO `tb_item` VALUES ('3', 'sh1001', '蔬菜类', '火龙果', '完好', '10', '张三', '神农基地', '建安区', '1000', '2018-07-02', '2018-07-16', 'xxx', '测试', '1', '标准01', '1');
INSERT INTO `tb_item` VALUES ('4', 'NM001', '奶制品类', '牛奶', '完好', '20', '李四', '三鹿集团', '广东天河区', '10000', '2018-07-18', '2018-07-25', 'xxxx', '蛋白质含量', '4', '国际标准ISO9001', '1');
INSERT INTO `tb_item` VALUES ('5', 'HM01', '谷物类', '黑米', '测试', '10kg', '王五', '测试', '神农科技', '100000kg', '2018-07-18', '2018-07-23', 'xxx', '测试', '2', '国家标准', '0');

-- ----------------------------
-- Table structure for `tb_item_cate`
-- ----------------------------
DROP TABLE IF EXISTS `tb_item_cate`;
CREATE TABLE `tb_item_cate` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `type_name` varchar(255) DEFAULT NULL COMMENT '分类名称',
  `person` varchar(255) DEFAULT '' COMMENT '添加人或更改人',
  `createTime` varchar(255) DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='样品分类表';

-- ----------------------------
-- Records of tb_item_cate
-- ----------------------------
INSERT INTO `tb_item_cate` VALUES ('1', '蔬菜类', '超级管理员', '2018-06-12');
INSERT INTO `tb_item_cate` VALUES ('2', '水果类', '超级管理员', '2018-07-20');
INSERT INTO `tb_item_cate` VALUES ('3', '谷物类', '超级管理员', '2018-07-20');
INSERT INTO `tb_item_cate` VALUES ('4', '奶制品类', '超级管理员', '2018-07-20');
INSERT INTO `tb_item_cate` VALUES ('5', '调料类', '超级管理员', '2018-07-20');

-- ----------------------------
-- Table structure for `tb_machine`
-- ----------------------------
DROP TABLE IF EXISTS `tb_machine`;
CREATE TABLE `tb_machine` (
  `mach_id` varchar(50) NOT NULL COMMENT '仪器编号',
  `model` varchar(50) DEFAULT NULL COMMENT '仪器型号',
  `factory` varchar(50) DEFAULT NULL COMMENT '制造商',
  `out_num` varchar(50) DEFAULT NULL COMMENT '出厂编号',
  `attach` varchar(200) DEFAULT NULL COMMENT '附件',
  `mach_name` varchar(50) DEFAULT NULL COMMENT '仪器名称',
  `for_use` varchar(50) DEFAULT NULL COMMENT '用途',
  `arrive_time` varchar(50) DEFAULT NULL COMMENT '到达时间',
  `use_time` varchar(50) DEFAULT NULL COMMENT '启用时间',
  `address` varchar(255) DEFAULT NULL COMMENT '存放位置',
  `situation` int(2) DEFAULT NULL COMMENT '0在用,1停用,2限用',
  `person` varchar(100) DEFAULT NULL COMMENT '责任人',
  `bz` varchar(100) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`mach_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='仪器一览表';

-- ----------------------------
-- Records of tb_machine
-- ----------------------------
INSERT INTO `tb_machine` VALUES ('1222220001', '10001', '10001', '10025501', 'attached/file/20180529/2.docx', 'aassasss', 'ssss', '2018-05-16', '2018-05-25', 'fefefe', '0', 'fefe', 'fefe');
INSERT INTO `tb_machine` VALUES ('PNJYQ001', '930', '瑞士万通中国有限公司', '201784', 'attached/file/20180509163128/2.docx,', '离子色谱仪', '阴离子测定', '2018-03-05', '2018-05-10', '色谱1室', '0', '李四', '其他');
INSERT INTO `tb_machine` VALUES ('PNJYQ002', '930', '瑞士万通中国有限公司', '201784', 'attached/file/20180509163128/2.docx,', '离子色谱仪', '阴离子测定', '2018-03-05', '2018-05-10', '色谱1室', '0', '李四', '其他');
INSERT INTO `tb_machine` VALUES ('PNJYQ003', 'AFS-9230', '北京吉天仪器有限公司', '9230-1609348', 'attached/file/20180516/test2003-18.doc,', '原子荧光光谱仪', '重金属检测', '2018-05-01', '2018-05-03', '光谱1室', '0', '孟帅磊', '其他');
INSERT INTO `tb_machine` VALUES ('PNJYQ004', 'AA-7000', '岛津中国有限公司', 'A30935400155', 'attached/file/20180516/test2003-18.doc,', '原子吸收光谱仪', '重金属检测', '2018-04-17', '2018-04-19', '光谱1室', '2', '孟帅磊', '其他');
INSERT INTO `tb_machine` VALUES ('PNJYQ005', 'TU-1901', '北京普析通用仪器有限公司', '18-1901-01-0411', 'attached/file/20180516/test2003-18.doc,', '紫外可见光光度计', '亚硝酸盐含量检测', '2018-04-11', '2018-05-01', '光谱1室', '1', '李瑞瑞', '其他');
INSERT INTO `tb_machine` VALUES ('PNJYQ006', '1260infinity', '安捷伦科技有限公司', 'DEagf11371', 'attached/file/20180516/test2003-18.doc,', '液相色谱仪', '农残检测', '2018-05-01', '2018-05-03', '色谱1室', '0', '胡延勋', '其他');
INSERT INTO `tb_machine` VALUES ('PNJYQ007', 'GC-2010PLUS', '岛津仪器设备有限公司', 'C11805412005SA', 'attached/file/20180516/test2003-18.doc,', '气相色谱仪', '农产品（蔬菜）农药残留检测', '2018-04-11', '2018-05-03', '色谱2室', '2', '潘子健', '其他');
INSERT INTO `tb_machine` VALUES ('PNJYQ008', 'GC-2010PLUS', '岛津仪器设备有限公司', 'C11805412005SA', 'attached/file/20180516/test2003-18.doc,', '气相色谱仪', '农产品（蔬菜）农药残留检测', '2018-04-11', '2018-05-03', '色谱2室', '2', '潘子健', '其他');
INSERT INTO `tb_machine` VALUES ('PNJYQ009', 'GC-2010PLUS', '岛津仪器设备有限公司', 'C12095201288SA', 'attached/file/20180516/test2003-18.doc,', '气相色谱仪', '农产品（蔬菜）农药残留检测', '2018-04-21', '2018-05-13', '色谱2室', '0', '潘子健', '其他');
INSERT INTO `tb_machine` VALUES ('PNJYQ010', 'GCMS-TQ8040', '岛津仪器设备有限公司', '021155300526AE', 'attached/file/20180516/test2003-18.doc,', '气相色谱仪三重四级杆联用仪', '农产品（蔬菜）农药残留检测', '2018-04-11', '2018-04-13', '色谱2室', '1', '潘子健', '其他');
INSERT INTO `tb_machine` VALUES ('PNJYQ011', 'MetrohmMVA-3', '瑞士万通中国有限公司', '1843002025158', 'attached/file/20180516/test2003-18.doc,', '伏安极谱仪', '重金属含量检定', '2018-04-15', '2018-04-16', '光谱2室', '0', '王妹丽', '其他');
INSERT INTO `tb_machine` VALUES ('PNJYQ012', 'JJ2000B', '双杰测试仪器厂', '242017523655', 'attached/file/20180516/test2003-18.doc,', '电子天平', '称重', '2018-05-15', '2018-05-18', '色谱前处理', '1', '朱冠利', '其他');
INSERT INTO `tb_machine` VALUES ('PNJYQ013', 'PHS-3BW', '上海般特仪器制造有限公司', '160164-11', 'attached/file/20180516/test2003-18.doc,', '酸度计', 'PH测试', '2018-05-15', '2018-05-18', '色谱前处理', '2', '朱冠利', '其他');

-- ----------------------------
-- Table structure for `tb_mach_buy_apply`
-- ----------------------------
DROP TABLE IF EXISTS `tb_mach_buy_apply`;
CREATE TABLE `tb_mach_buy_apply` (
  `apply_id` varchar(50) NOT NULL COMMENT '申请购买编号',
  `mach_name` varchar(50) DEFAULT NULL COMMENT '仪器名称',
  `mach_model` varchar(50) DEFAULT NULL COMMENT '仪器型号',
  `fate` double(5,3) DEFAULT NULL COMMENT '仪器精度或准确度',
  `factory` varchar(50) DEFAULT NULL COMMENT '制造商',
  `price` double(11,2) DEFAULT NULL COMMENT '仪器单价',
  `apply_num` int(11) DEFAULT NULL COMMENT '购买数量',
  `apply_time` varchar(20) DEFAULT NULL COMMENT '申请购买时间',
  `status` int(1) DEFAULT '2' COMMENT '申请状态 0 审批通过 1审批未通过,2 待审批',
  `applyer` varchar(20) DEFAULT NULL COMMENT '申请人',
  `reason` varchar(100) DEFAULT NULL COMMENT ' 申请原因',
  `cment` double(10,2) DEFAULT NULL COMMENT '杂费',
  `bz` varchar(255) DEFAULT NULL COMMENT '备注',
  `approver` varchar(30) DEFAULT NULL COMMENT '审批人',
  `approve_time` varchar(20) DEFAULT NULL COMMENT '审批时间',
  PRIMARY KEY (`apply_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='仪器购买申请表';

-- ----------------------------
-- Records of tb_mach_buy_apply
-- ----------------------------
INSERT INTO `tb_mach_buy_apply` VALUES ('1', 'ph测试机22', 'AII1234', '0.998', '大力神机械制造', '534.25', '2', null, '2', '李四', '之前的那个坏了', '101.00', null, null, null);
INSERT INTO `tb_mach_buy_apply` VALUES ('2', '测试机', 'A2014', '0.995', '精密制造', '349.00', '2', null, '2', '张三', '实验需要', '50.35', '其他', '超级管理员', '2018-04-18');
INSERT INTO `tb_mach_buy_apply` VALUES ('3', '测量仪', 'Bii2015', '0.999', '飞天科技', '512.36', '5', '2018-04-16', '2', '王五', '测试', '122.50', '其他', '超级管理员', null);
INSERT INTO `tb_mach_buy_apply` VALUES ('4', '测试', '测试', '0.950', '测试', '12.00', '500', '2018-05-03 17:32:20', '0', '测试', 'attached/file/20180503173641/1.docx,attached/file/20180503173641/2.docx,', '500.00', null, '超级管理员', '2018-05-11');

-- ----------------------------
-- Table structure for `tb_mach_check`
-- ----------------------------
DROP TABLE IF EXISTS `tb_mach_check`;
CREATE TABLE `tb_mach_check` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `mach_id` varchar(50) DEFAULT NULL COMMENT '仪器编号',
  `period` varchar(20) DEFAULT NULL COMMENT '检定周期',
  `check_unit` varchar(50) DEFAULT NULL COMMENT '检定单位',
  `check_time` varchar(20) DEFAULT NULL COMMENT '到期检定时间',
  `status` int(1) DEFAULT '1' COMMENT '是否已送检 0 已送检 1未送检',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='仪器周期检定计划表';

-- ----------------------------
-- Records of tb_mach_check
-- ----------------------------
INSERT INTO `tb_mach_check` VALUES ('9', 'PNJYQ001', '半年', '北京迪捷姆', '2018-10-25', '1');
INSERT INTO `tb_mach_check` VALUES ('10', 'PNJYQ003', '半年', '平顶山检测中心', '2018-09-21', '0');
INSERT INTO `tb_mach_check` VALUES ('11', 'PNJYQ006', '三个月', '许昌农产品研究院', '2018-06-10', '0');
INSERT INTO `tb_mach_check` VALUES ('12', 'PNJYQ005', '半年', '北京福利分析有限公司', '2018-08-23', '1');
INSERT INTO `tb_mach_check` VALUES ('13', 'PNJYQ002', '半年', '北京托利有限公司', '2019-01-30', '0');

-- ----------------------------
-- Table structure for `tb_mach_check_record`
-- ----------------------------
DROP TABLE IF EXISTS `tb_mach_check_record`;
CREATE TABLE `tb_mach_check_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `mach_id` varchar(50) DEFAULT NULL COMMENT '仪器编号',
  `mach_name` varchar(50) DEFAULT NULL COMMENT '仪器名称',
  `model` varchar(50) DEFAULT NULL COMMENT '仪器型号',
  `factory` varchar(50) DEFAULT NULL COMMENT '生产厂家',
  `check_time` varchar(20) DEFAULT NULL COMMENT '到期检定时间',
  `period` varchar(50) DEFAULT NULL COMMENT '检定周期',
  `sender` varchar(30) DEFAULT NULL COMMENT '送检人',
  `send_time` varchar(20) DEFAULT NULL COMMENT '送检时间',
  `check_unit` varchar(50) DEFAULT NULL COMMENT '检测机构',
  `checked_time` varchar(50) DEFAULT NULL COMMENT '检定时间',
  `checker` varchar(30) DEFAULT NULL COMMENT '检定人',
  `check_num` varchar(50) DEFAULT NULL COMMENT '检定证书号',
  `check_state` int(1) DEFAULT '1' COMMENT '是否已检定 0已检定 1未检定',
  `bz` varchar(250) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 COMMENT='仪器周期检定记录表';

-- ----------------------------
-- Records of tb_mach_check_record
-- ----------------------------
INSERT INTO `tb_mach_check_record` VALUES ('28', 'PNJYQ005', '紫外可见光光度计', 'TU-1901', '北京普析通用仪器有限公司', '2018-05-09', '半年', '超级管理员', '2018-05-16', '平顶山检测中心', '2018-05-18', '王丽', 'JP1253245632', '0', '合格');
INSERT INTO `tb_mach_check_record` VALUES ('36', 'PNJYQ001', '离子色谱仪', '930', '瑞士万通中国有限公司', '2018-05-24', '半年', '超级管理员', '2018-05-24', '北京迪捷姆', null, null, null, '1', null);
INSERT INTO `tb_mach_check_record` VALUES ('37', 'PNJYQ006', '液相色谱仪', '1260infinity', '安捷伦科技有限公司', '2018-02-15', '三个月', '超级管理员', '2018-05-24', '许昌农产品研究院', null, null, null, '1', null);
INSERT INTO `tb_mach_check_record` VALUES ('38', 'PNJYQ003', '原子荧光光谱仪', 'AFS-9230', '北京吉天仪器有限公司', '', '半年', '超级管理员', '2018-05-24', '平顶山检测中心', null, null, null, '1', null);
INSERT INTO `tb_mach_check_record` VALUES ('39', 'PNJYQ003', '原子荧光光谱仪', 'AFS-9230', '北京吉天仪器有限公司', '2018-05-29', '半年', '超级管理员', '2018-05-30', '平顶山检测中心', null, null, null, '1', null);
INSERT INTO `tb_mach_check_record` VALUES ('40', 'PNJYQ006', '液相色谱仪', '1260infinity', '安捷伦科技有限公司', '2018-08-10', '三个月', '超级管理员', '2018-05-30', '许昌农产品研究院', null, null, null, '1', null);
INSERT INTO `tb_mach_check_record` VALUES ('41', 'PNJYQ002', '离子色谱仪', '930', '瑞士万通中国有限公司', '2019-01-30', '半年', '超级管理员', '2018-07-18', '北京托利有限公司', null, null, null, '1', null);
INSERT INTO `tb_mach_check_record` VALUES ('42', 'PNJYQ003', '原子荧光光谱仪', 'AFS-9230', '北京吉天仪器有限公司', '2018-09-21', '半年', '超级管理员', '2018-07-19', '平顶山检测中心', null, null, null, '0', null);

-- ----------------------------
-- Table structure for `tb_mach_record`
-- ----------------------------
DROP TABLE IF EXISTS `tb_mach_record`;
CREATE TABLE `tb_mach_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `mach_ids` varchar(50) DEFAULT NULL COMMENT '仪器编号',
  `mach_names` varchar(255) DEFAULT NULL COMMENT '所使用的仪器名称',
  `begin_time` varchar(50) DEFAULT NULL COMMENT '开始使用时间',
  `for_use` varchar(100) DEFAULT NULL COMMENT '用途',
  `people` varchar(30) DEFAULT NULL COMMENT '使用人',
  `status` int(1) DEFAULT NULL COMMENT '使用状态 0正常 1故障',
  `bz` varchar(50) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COMMENT='仪器使用记录表';

-- ----------------------------
-- Records of tb_mach_record
-- ----------------------------
INSERT INTO `tb_mach_record` VALUES ('25', 'PNJYQ001', '离子色谱仪', '2018-05-24 03:16:05', '测试', '张三', '0', '测');
INSERT INTO `tb_mach_record` VALUES ('26', 'PNJYQ002', '空气采样器', '2018-05-24 03:16:05', '测试', '张三', '0', '测');
INSERT INTO `tb_mach_record` VALUES ('27', 'PNJYQ002', '空气采样器', '2018-05-24 02:03:03', '实验检测', '张三', '1', '仪器需要维修');
INSERT INTO `tb_mach_record` VALUES ('28', 'PNJYQ003', '原子荧光光谱仪', '2018-05-24 02:03:03', '实验检测', '张三', '1', '仪器需要维修');
INSERT INTO `tb_mach_record` VALUES ('29', '1222220001', 'aassasss', null, null, null, '0', null);
INSERT INTO `tb_mach_record` VALUES ('30', 'PNJYQ001', '离子色谱仪', null, null, null, '0', null);
INSERT INTO `tb_mach_record` VALUES ('31', 'PNJYQ002', '空气采样器', null, null, null, '0', null);
INSERT INTO `tb_mach_record` VALUES ('32', 'PNJYQ003', '原子荧光光谱仪', null, null, null, '0', null);
INSERT INTO `tb_mach_record` VALUES ('33', 'PNJYQ004', '原子吸收光谱仪', null, null, null, '0', null);
INSERT INTO `tb_mach_record` VALUES ('34', 'PNJYQ005', '紫外可见光光度计', null, null, null, '0', null);
INSERT INTO `tb_mach_record` VALUES ('35', 'PNJYQ006', '液相色谱仪', null, null, null, '0', null);
INSERT INTO `tb_mach_record` VALUES ('36', 'PNJYQ007', '液相色谱仪', null, null, null, '0', null);
INSERT INTO `tb_mach_record` VALUES ('37', 'PNJYQ008', '气相色谱仪', null, null, null, '0', null);
INSERT INTO `tb_mach_record` VALUES ('38', 'PNJYQ009', '气相色谱仪', null, null, null, '0', null);

-- ----------------------------
-- Table structure for `tb_sendcheck`
-- ----------------------------
DROP TABLE IF EXISTS `tb_sendcheck`;
CREATE TABLE `tb_sendcheck` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `item_number` varchar(255) DEFAULT NULL COMMENT '样品编号',
  `item_name` varchar(255) DEFAULT NULL COMMENT '样品名称',
  `serial_number` varchar(255) DEFAULT NULL COMMENT '检测报告编号',
  `test_results` int(1) DEFAULT NULL COMMENT '检测结果',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='样品检测信息记录';

-- ----------------------------
-- Records of tb_sendcheck
-- ----------------------------
INSERT INTO `tb_sendcheck` VALUES ('1', 'bh001', '苹果', 'bg01', '0');
INSERT INTO `tb_sendcheck` VALUES ('2', 'sh1001', '火龙果', 'bg01', '1');
INSERT INTO `tb_sendcheck` VALUES ('3', 'NM001', '牛奶', '', '2');

-- ----------------------------
-- Table structure for `trace_aptitude`
-- ----------------------------
DROP TABLE IF EXISTS `trace_aptitude`;
CREATE TABLE `trace_aptitude` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `number` varchar(255) DEFAULT NULL COMMENT '企业资质代码',
  `type` tinyint(1) DEFAULT NULL COMMENT '企业资质类型  1 营业执照 2 生产许可证 3 其它',
  `unit` varchar(255) DEFAULT NULL COMMENT '发证单位',
  `time` varchar(255) DEFAULT NULL COMMENT '发证时间',
  `in_date` varchar(255) DEFAULT NULL COMMENT '有效期',
  `scope` varchar(255) DEFAULT NULL COMMENT '许可范围',
  `certificate` varchar(255) DEFAULT NULL COMMENT '资质证书',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='企业资质信息';

-- ----------------------------
-- Records of trace_aptitude
-- ----------------------------
INSERT INTO `trace_aptitude` VALUES ('1', 'zz001aaa', '1', '中国物品编码中心', '2012-12-12', '2015-12-12', '奶制品', 'static/images/user/user.png');

-- ----------------------------
-- Table structure for `trace_attach_material`
-- ----------------------------
DROP TABLE IF EXISTS `trace_attach_material`;
CREATE TABLE `trace_attach_material` (
  `attach_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '附件材料序号',
  `mat_type` varchar(50) DEFAULT NULL COMMENT '用料类型',
  `mat_batch` varchar(50) DEFAULT NULL COMMENT '用料批次号',
  `mat_sup` varchar(50) DEFAULT NULL COMMENT '原料供应商',
  `sup_id` varchar(50) DEFAULT NULL COMMENT '供应商id',
  `use_num` varchar(50) DEFAULT NULL COMMENT '原材料料使用量',
  PRIMARY KEY (`attach_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='批次用料所用附属原材料信息表';

-- ----------------------------
-- Records of trace_attach_material
-- ----------------------------

-- ----------------------------
-- Table structure for `trace_bag`
-- ----------------------------
DROP TABLE IF EXISTS `trace_bag`;
CREATE TABLE `trace_bag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pId` varchar(50) DEFAULT '0' COMMENT '上级id',
  `theID` varchar(50) DEFAULT NULL COMMENT '材料编码',
  `name` varchar(50) DEFAULT NULL COMMENT '材料名称',
  `bz` varchar(200) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='生产加工材料表';

-- ----------------------------
-- Records of trace_bag
-- ----------------------------
INSERT INTO `trace_bag` VALUES ('11', '0', 'bm_01', '生产加工', '顶级');
INSERT INTO `trace_bag` VALUES ('12', '11', 'xz_01', '原材料', '二级');
INSERT INTO `trace_bag` VALUES ('13', '11', 'hy-01', '包装材料', '二级');
INSERT INTO `trace_bag` VALUES ('14', '13', 'qy_01', '包装材料', '三级');
INSERT INTO `trace_bag` VALUES ('15', '12', '2222', '主要材料', '三级');
INSERT INTO `trace_bag` VALUES ('16', '12', '1111', '辅料', '三级');
INSERT INTO `trace_bag` VALUES ('17', '12', '3333', '添加剂', '三级');
INSERT INTO `trace_bag` VALUES ('18', '12', '4444', '其他', '三级');

-- ----------------------------
-- Table structure for `trace_batch_material`
-- ----------------------------
DROP TABLE IF EXISTS `trace_batch_material`;
CREATE TABLE `trace_batch_material` (
  `batch_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自动增长',
  `record_id` int(11) DEFAULT NULL COMMENT '生产记录id(关联trace_pro_record表)',
  `record_num` varchar(50) DEFAULT NULL COMMENT '生产记录号',
  `pro_code` varchar(50) DEFAULT NULL COMMENT '产品条码',
  `pro_name` varchar(50) DEFAULT NULL COMMENT '产品名称',
  `batch` varchar(50) DEFAULT NULL COMMENT '产品批次号',
  `batch_num` varchar(50) DEFAULT NULL COMMENT '加工数量',
  `btime` varchar(50) DEFAULT NULL COMMENT '加工日期',
  PRIMARY KEY (`batch_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='批次用料信息表';

-- ----------------------------
-- Records of trace_batch_material
-- ----------------------------
INSERT INTO `trace_batch_material` VALUES ('1', '2', '14', '100016102', '桃子', '201802106', '23101', '2018-07-10');
INSERT INTO `trace_batch_material` VALUES ('2', '3', '12', '2018ii11880', '苹果', 'py12405', '300', '2018-07-11');

-- ----------------------------
-- Table structure for `trace_box`
-- ----------------------------
DROP TABLE IF EXISTS `trace_box`;
CREATE TABLE `trace_box` (
  `id` varchar(30) NOT NULL COMMENT '箱品序号',
  `box_name` varchar(50) DEFAULT NULL COMMENT '项目名称',
  `box_unit` varchar(50) DEFAULT NULL COMMENT '箱品规格尺寸',
  `bz` varchar(50) DEFAULT NULL COMMENT '备用字段',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='箱品信息表';

-- ----------------------------
-- Records of trace_box
-- ----------------------------

-- ----------------------------
-- Table structure for `trace_data`
-- ----------------------------
DROP TABLE IF EXISTS `trace_data`;
CREATE TABLE `trace_data` (
  `dat_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '追溯填报序号',
  `fill_time` varchar(50) DEFAULT NULL COMMENT '记录时间',
  `mat_type` varchar(50) DEFAULT NULL COMMENT '用料类型',
  `attach_id` int(11) DEFAULT NULL COMMENT '附件材料序号(关联trace_attach_material表)',
  `bz` varchar(50) DEFAULT NULL COMMENT '备注',
  `page_id` int(20) DEFAULT NULL COMMENT '材料所属包装分类(trace_package)',
  `batch_id` int(20) DEFAULT NULL COMMENT '所属产品批次id',
  PRIMARY KEY (`dat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='追溯对象-填报数据表';

-- ----------------------------
-- Records of trace_data
-- ----------------------------
INSERT INTO `trace_data` VALUES ('1', '2018-07-05', '进货', '2', '进货_劲酒2_2018062500_中国劲酒有限公司_30', '15', '1');
INSERT INTO `trace_data` VALUES ('3', '2018-06-15', '出货', '1', '出货_劲酒_2018062524_中国劲酒有限公司_中国劲酒有限公司', '14', '1');
INSERT INTO `trace_data` VALUES ('4', '2018-06-25', '出货', '1', '进货_劲酒4_2018062500_中国劲酒有限公司_40', '14', '1');
INSERT INTO `trace_data` VALUES ('5', '2018-07-03', '出货', '2', '进货_劲酒4_2018062500_中国劲酒有限公司_90', '17', '2');
INSERT INTO `trace_data` VALUES ('6', '2018-07-03', '进货', '1', '进货_劲酒_2018062524_中国劲酒有限公司_200', '16', '1');
INSERT INTO `trace_data` VALUES ('8', '2018-07-10', '进货', '1', '进货_劲酒_2018062524_中国劲酒有限公司_100', '17', '1');
INSERT INTO `trace_data` VALUES ('9', '2018-07-02', '测试', '1', '测试_劲酒_2018062524_中国劲酒有限公司_300', '18', '2');
INSERT INTO `trace_data` VALUES ('11', '2018-07-02', '进货', '1', '进货_劲酒_2018062524_中国劲酒有限公司_200', '15', '1');
INSERT INTO `trace_data` VALUES ('12', '2018-07-02', '出货', '1', '出货_劲酒_2018062524_中国劲酒有限公司_500', '16', '2');

-- ----------------------------
-- Table structure for `trace_im_product`
-- ----------------------------
DROP TABLE IF EXISTS `trace_im_product`;
CREATE TABLE `trace_im_product` (
  `im_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '进货id主键',
  `pro_name` varchar(50) DEFAULT NULL COMMENT '货物名称',
  `bar_code` varchar(50) DEFAULT NULL COMMENT '商品条码',
  `sup_id` varchar(50) DEFAULT NULL COMMENT '供应商id(关联trace_supplier)',
  `sup_name` varchar(50) DEFAULT NULL COMMENT '供应商名称',
  `im_patch` varchar(50) DEFAULT NULL COMMENT '进货批次号',
  `sup_patch` varchar(50) DEFAULT NULL COMMENT '供应商出货批次号',
  `recipient` varchar(50) DEFAULT NULL COMMENT '验收负责人',
  `im_time` varchar(50) DEFAULT NULL COMMENT '进货日期',
  `im_num` varchar(50) DEFAULT NULL COMMENT '进货数量(单位)',
  `result` int(2) DEFAULT NULL COMMENT '验收结论 0合格 1不合格',
  `rest` int(2) DEFAULT '1' COMMENT '是否用完 0已用完 1 未用完',
  `report` varchar(100) DEFAULT NULL COMMENT '验收报告',
  `attach_file` varchar(100) DEFAULT NULL COMMENT '附件',
  PRIMARY KEY (`im_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='进货信息表';

-- ----------------------------
-- Records of trace_im_product
-- ----------------------------
INSERT INTO `trace_im_product` VALUES ('1', '劲酒', '1001170', '1', '中国劲酒有限公司', '2018062524', 'YII241536', '张三', '2018-06-24', '30瓶', '1', '1', null, null);
INSERT INTO `trace_im_product` VALUES ('2', '大白兔', '1001172', null, '大白兔有限公司', 'yii2018456', '123456', '李四', '2018-06-28', '250', '0', '0', '1546', 'attached/file/20180627/1.docx');

-- ----------------------------
-- Table structure for `trace_key_control`
-- ----------------------------
DROP TABLE IF EXISTS `trace_key_control`;
CREATE TABLE `trace_key_control` (
  `ctr_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `im_id` int(11) DEFAULT NULL COMMENT '进货管理id(trace_im_product)',
  `pro_name` varchar(50) DEFAULT NULL COMMENT '产品名称',
  `im_patch` varchar(50) DEFAULT NULL COMMENT '产品批次号',
  `ctr_name` varchar(50) DEFAULT NULL COMMENT '控制点名称',
  `ctr_point` varchar(50) DEFAULT NULL COMMENT '控制点数及单位',
  `ctr_start` varchar(50) DEFAULT NULL COMMENT '控制开始时间',
  `ctr_end` varchar(50) DEFAULT NULL COMMENT '控制结束时间',
  `ctr_num` varchar(20) DEFAULT NULL COMMENT ' 监控次数',
  `person` varchar(50) DEFAULT NULL COMMENT '责任人',
  `result` int(2) DEFAULT NULL COMMENT '监控结论 0合格 1不合格',
  PRIMARY KEY (`ctr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='关键控制点管理';

-- ----------------------------
-- Records of trace_key_control
-- ----------------------------
INSERT INTO `trace_key_control` VALUES ('1', '1', '劲酒', '2018062524', '温度', '15度', '2018-06-12', '2018-06-28', '2', '张三', null);

-- ----------------------------
-- Table structure for `trace_order`
-- ----------------------------
DROP TABLE IF EXISTS `trace_order`;
CREATE TABLE `trace_order` (
  `order_num` varchar(50) NOT NULL COMMENT '订单编号',
  `sale_id` varchar(50) DEFAULT NULL COMMENT '销售商id',
  `sale_name` varchar(50) DEFAULT NULL COMMENT '销售商名称',
  `create_time` varchar(50) DEFAULT NULL COMMENT '订单创建时间',
  `send_time` varchar(50) DEFAULT NULL COMMENT '发货时间',
  `sender` varchar(50) DEFAULT NULL COMMENT '发货人',
  `recever` varchar(50) DEFAULT '' COMMENT '收货人',
  `begin_address` varchar(50) DEFAULT NULL COMMENT '货物始发地',
  `end_address` varchar(50) DEFAULT NULL COMMENT '目的地',
  `batch_id` varchar(50) DEFAULT NULL COMMENT '产品批次id(trace_batch_material)',
  `batch_num` varchar(50) DEFAULT NULL COMMENT '产品数量',
  `batch_name` varchar(50) DEFAULT NULL COMMENT '产品名字',
  `batch` varchar(50) DEFAULT NULL COMMENT '产品批次号',
  `tray_id` varchar(50) DEFAULT NULL COMMENT '托盘id(trace_tray)',
  `tray_name` varchar(50) DEFAULT NULL COMMENT '托盘信息',
  `box_id` varchar(50) DEFAULT NULL COMMENT '箱品id(trace_box)',
  PRIMARY KEY (`order_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单信息表';

-- ----------------------------
-- Records of trace_order
-- ----------------------------
INSERT INTO `trace_order` VALUES ('201821045', '1', '中国移动', '2018-07-06', '2018-07-09', '王五', '马六', '许昌', '苏桥', '2', '300', '苹果', 'py12405', null, null, null);
INSERT INTO `trace_order` VALUES ('2018ii10086', '1', '中国移动', null, '2018-07-08', '张三1', '李四1', '广东', '北京', '1,2', '23101,300', '桃子,苹果', '201802106,py12405', null, null, null);

-- ----------------------------
-- Table structure for `trace_produce_site`
-- ----------------------------
DROP TABLE IF EXISTS `trace_produce_site`;
CREATE TABLE `trace_produce_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `uid` int(11) DEFAULT NULL COMMENT '关联id  备用',
  `type` varchar(255) DEFAULT NULL COMMENT '类型  备用',
  `site` varchar(255) DEFAULT NULL COMMENT '生产地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='生产地址表';

-- ----------------------------
-- Records of trace_produce_site
-- ----------------------------

-- ----------------------------
-- Table structure for `trace_productor`
-- ----------------------------
DROP TABLE IF EXISTS `trace_productor`;
CREATE TABLE `trace_productor` (
  `pro_id` varchar(50) NOT NULL COMMENT '产品id',
  `pro_name` varchar(50) DEFAULT NULL COMMENT '产品名称',
  `pro_code` varchar(50) DEFAULT NULL COMMENT '商品条码',
  `isfinish` int(2) DEFAULT NULL COMMENT '是否半成品 0 成品 1半成品',
  `pro_type` varchar(11) DEFAULT NULL COMMENT '产品分类',
  `pro_statu` int(2) DEFAULT NULL COMMENT '产品状态 0在产 1停产',
  `stand_num` varchar(50) DEFAULT NULL COMMENT '标准号',
  `stand_name` varchar(50) DEFAULT NULL COMMENT '标准名称',
  `stand_type` varchar(30) DEFAULT NULL COMMENT '标准分类',
  `pro_mark` varchar(50) DEFAULT NULL COMMENT '产品商标',
  `pro_unit` varchar(30) DEFAULT NULL COMMENT '产品规格',
  `end_time` varchar(50) DEFAULT NULL COMMENT '保质期',
  `forge_id` varchar(50) DEFAULT NULL COMMENT '防伪标识(关联防伪表)',
  `pro_img` varchar(50) DEFAULT NULL COMMENT '产品图片信息',
  `net_weight` varchar(50) DEFAULT NULL COMMENT '净含量',
  PRIMARY KEY (`pro_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='产品信息表';

-- ----------------------------
-- Records of trace_productor
-- ----------------------------
INSERT INTO `trace_productor` VALUES ('1', '桃子', '100100', '0', null, '0', null, null, null, null, null, null, null, null, null);
INSERT INTO `trace_productor` VALUES ('2', '苹果', '100101', '1', null, '1', null, null, null, null, null, null, null, null, null);
INSERT INTO `trace_productor` VALUES ('3', '香蕉', '100102', '0', null, '0', null, null, null, null, null, null, null, null, null);
INSERT INTO `trace_productor` VALUES ('5', '雪碧', '152368', '0', null, '0', null, null, null, null, null, null, null, null, null);
INSERT INTO `trace_productor` VALUES ('6', '果汁', '200131', '0', null, '0', null, null, null, null, null, null, null, null, null);
INSERT INTO `trace_productor` VALUES ('7', '蓝莓', '200133', '0', null, '0', null, null, null, null, null, null, null, null, null);
INSERT INTO `trace_productor` VALUES ('8', '可乐', '200130', '1', null, '1', null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for `trace_provide`
-- ----------------------------
DROP TABLE IF EXISTS `trace_provide`;
CREATE TABLE `trace_provide` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) DEFAULT NULL COMMENT '供应商名称',
  `licence` varchar(255) DEFAULT NULL COMMENT '生产许可证号',
  `organization` varchar(255) DEFAULT NULL COMMENT '组织机构代码',
  `site` varchar(255) DEFAULT NULL COMMENT '地址',
  `phone` varchar(255) DEFAULT NULL COMMENT '电话',
  `email` varchar(255) DEFAULT NULL COMMENT '邮箱',
  `contact` varchar(255) DEFAULT NULL COMMENT '联系人',
  `publicity` tinyint(1) DEFAULT NULL COMMENT '是否向公众公开  1是  2 否',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='供应商信息';

-- ----------------------------
-- Records of trace_provide
-- ----------------------------
INSERT INTO `trace_provide` VALUES ('9', '神州机械制造有限公司', 'SH885940099001', 'sfeji10213265', '建安区白枫路59号', '0.374-88591', 'mingchao@163.com', '张三', '1');

-- ----------------------------
-- Table structure for `trace_pro_record`
-- ----------------------------
DROP TABLE IF EXISTS `trace_pro_record`;
CREATE TABLE `trace_pro_record` (
  `rec_id` int(11) NOT NULL AUTO_INCREMENT,
  `rec_num` varchar(50) DEFAULT NULL COMMENT '生产记录号',
  `patch_num` varchar(50) DEFAULT NULL COMMENT '生产批次',
  `address` varchar(100) DEFAULT NULL COMMENT '生产地址',
  `st_time` varchar(50) DEFAULT NULL COMMENT '开始生产日期',
  `end_time` varchar(50) DEFAULT NULL COMMENT '结束生产日期',
  `pro_id` varchar(50) DEFAULT NULL COMMENT '商品id(trace_productor)',
  `pro_name` varchar(50) DEFAULT NULL COMMENT '产品名称',
  `pro_code` varchar(50) DEFAULT NULL COMMENT '商品条码',
  PRIMARY KEY (`rec_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='生产记录表';

-- ----------------------------
-- Records of trace_pro_record
-- ----------------------------
INSERT INTO `trace_pro_record` VALUES ('1', '11', '222', '中山1', '2018-03-26', '2018-06-20', '1011', '小白龙', 'YII2016574');
INSERT INTO `trace_pro_record` VALUES ('2', '14', '200', '武汉', '2018-06-12', '2018-06-26', '1', '桃子', '100100');
INSERT INTO `trace_pro_record` VALUES ('3', '12', '15', null, '2018-06-12', '2018-06-26', '2', '苹果', '100101');
INSERT INTO `trace_pro_record` VALUES ('5', '13', '23', '北京', '2018-06-12', '2018-06-29', '1', '桃子', '100100');
INSERT INTO `trace_pro_record` VALUES ('6', '20134', '3', '许昌', '2018-07-03', '2018-07-10', '2', '苹果', '100101');
INSERT INTO `trace_pro_record` VALUES ('7', '20134', '3', '许昌', '2018-07-03', '2018-07-10', '3', '香蕉', '100102');

-- ----------------------------
-- Table structure for `trace_retailer`
-- ----------------------------
DROP TABLE IF EXISTS `trace_retailer`;
CREATE TABLE `trace_retailer` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) DEFAULT NULL COMMENT '销售商名称',
  `licence` varchar(255) DEFAULT NULL COMMENT '销售许可证号',
  `organization` varchar(255) DEFAULT NULL COMMENT '销售商组织机构代码',
  `site` varchar(255) DEFAULT NULL COMMENT '销售商地址',
  `phone` varchar(255) DEFAULT NULL COMMENT '联系电话',
  `email` varchar(255) DEFAULT NULL COMMENT '邮箱',
  `contact` varchar(255) DEFAULT NULL COMMENT '联系人',
  `publicity` tinyint(1) DEFAULT NULL COMMENT '是否向公众公开  1 是  2  否',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='销售商信息';

-- ----------------------------
-- Records of trace_retailer
-- ----------------------------
INSERT INTO `trace_retailer` VALUES ('1', '中国移动', '10086', '10086', '建安区魏庄街', '10086', '10086@qq.com', '10086', '2');

-- ----------------------------
-- Table structure for `trace_tray`
-- ----------------------------
DROP TABLE IF EXISTS `trace_tray`;
CREATE TABLE `trace_tray` (
  `tray_id` varchar(50) NOT NULL COMMENT '托盘序号',
  `tray_name` varchar(50) DEFAULT NULL COMMENT '托盘名字',
  `tray_unit` varchar(50) DEFAULT NULL COMMENT '托盘规格尺寸',
  `bz` varchar(50) DEFAULT NULL COMMENT '备用信息',
  PRIMARY KEY (`tray_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='托盘信息表';

-- ----------------------------
-- Records of trace_tray
-- ----------------------------

-- ----------------------------
-- Table structure for `t_demo`
-- ----------------------------
DROP TABLE IF EXISTS `t_demo`;
CREATE TABLE `t_demo` (
  `id` int(11) NOT NULL,
  `val1` varchar(100) DEFAULT NULL,
  `val2` varchar(100) DEFAULT NULL,
  `val3` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_demo
-- ----------------------------

-- ----------------------------
-- Table structure for `t_demo_count`
-- ----------------------------
DROP TABLE IF EXISTS `t_demo_count`;
CREATE TABLE `t_demo_count` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_demo_count
-- ----------------------------
INSERT INTO `t_demo_count` VALUES ('1', '1');
INSERT INTO `t_demo_count` VALUES ('2', '2');
INSERT INTO `t_demo_count` VALUES ('3', '3');
INSERT INTO `t_demo_count` VALUES ('4', '4');
INSERT INTO `t_demo_count` VALUES ('5', '5');
INSERT INTO `t_demo_count` VALUES ('6', '6');
INSERT INTO `t_demo_count` VALUES ('7', '7');

-- ----------------------------
-- Table structure for `t_finance_approve`
-- ----------------------------
DROP TABLE IF EXISTS `t_finance_approve`;
CREATE TABLE `t_finance_approve` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `pro_name` varchar(100) DEFAULT NULL COMMENT '采购的产品',
  `pur_batch` varchar(20) DEFAULT NULL COMMENT '购买批次',
  `pur_num` varchar(50) DEFAULT NULL,
  `price` varchar(50) DEFAULT NULL COMMENT '购买价格',
  `approve` varchar(30) DEFAULT NULL COMMENT '审批人',
  `approve_time` varchar(20) DEFAULT NULL COMMENT '审批时间',
  `state` int(1) DEFAULT '2' COMMENT '审批状态 0审批通过 1审批驳回 2待审批',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COMMENT='财务审批表';

-- ----------------------------
-- Records of t_finance_approve
-- ----------------------------
INSERT INTO `t_finance_approve` VALUES ('29', '鱼油,饼干,矿泉水', '20180426115101295', '545', '2350', '超级管理员', '2018-05-29 17:55:15', '1');
INSERT INTO `t_finance_approve` VALUES ('30', '鱼油,饼干,矿泉水', '20180511093125907', '545', '15650', '超级管理员', '2018-05-29 17:58:34', '0');
INSERT INTO `t_finance_approve` VALUES ('31', '桶面,矿泉水', '20180426112658358', '60', '900', null, null, '2');

-- ----------------------------
-- Table structure for `t_fontawesome`
-- ----------------------------
DROP TABLE IF EXISTS `t_fontawesome`;
CREATE TABLE `t_fontawesome` (
  `id` int(11) NOT NULL,
  `key` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `type` varchar(10) DEFAULT NULL,
  `bz` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_fontawesome
-- ----------------------------
INSERT INTO `t_fontawesome` VALUES ('1', '1', '1', '1', '1');

-- ----------------------------
-- Table structure for `t_product`
-- ----------------------------
DROP TABLE IF EXISTS `t_product`;
CREATE TABLE `t_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `pro_id` varchar(50) DEFAULT NULL COMMENT '产品编号',
  `pro_name` varchar(50) DEFAULT NULL COMMENT '产品名',
  `bar_code` varchar(50) DEFAULT NULL COMMENT '产品条形码',
  `pro_unit` varchar(20) DEFAULT NULL COMMENT '产品规格',
  `statement` varchar(50) DEFAULT NULL COMMENT '说明',
  `bz` varchar(50) DEFAULT NULL COMMENT '临时采购的单价',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COMMENT='采购产品相关基本信息';

-- ----------------------------
-- Records of t_product
-- ----------------------------
INSERT INTO `t_product` VALUES ('1', '1', '鱼油', '11023', '100粒/瓶', '降低心脏血糖', '');
INSERT INTO `t_product` VALUES ('26', '4', '大豆', '11025', '500g', '高脂食品', '100');
INSERT INTO `t_product` VALUES ('27', '5', '黑美人西瓜', '11026', '2kg', '果皮薄而坚韧，果肉红色肉质鲜嫩多汁', '1000');
INSERT INTO `t_product` VALUES ('28', '6', '沙糖桔', '11027', '500g', '皮薄，味清甜', '30');
INSERT INTO `t_product` VALUES ('29', '7', '山楂', '11028', '300g', '肉质较硬而致密，酸味强', null);
INSERT INTO `t_product` VALUES ('30', '8', '菠萝', '11029', '500g', '香味浓郁，甜酸适口', null);
INSERT INTO `t_product` VALUES ('31', '9', '荔枝', '11030', '500g', '肉厚，质爽脆，多汁', null);
INSERT INTO `t_product` VALUES ('32', '10', '柿子', '11031', '500g', '果汁清亮透明，味甜如蜜', null);
INSERT INTO `t_product` VALUES ('33', '11', '猕猴桃', '11032', '150g', '肉质鲜嫩、香甜清爽', null);
INSERT INTO `t_product` VALUES ('34', '12', '空心菜', '11033', '500g', '茎粗大，黄白色，节疏', null);
INSERT INTO `t_product` VALUES ('35', '13', '油麦菜', '11034', '500g', '质地脆嫩，口感极为鲜嫩', null);
INSERT INTO `t_product` VALUES ('36', '14', '香菜', '11035', '500g', '嫩株味浓，纤维少', null);
INSERT INTO `t_product` VALUES ('37', '15', '铁棍山药', '11036', '500g', '肉极细腻，白里透黄', null);

-- ----------------------------
-- Table structure for `t_purchase_apply`
-- ----------------------------
DROP TABLE IF EXISTS `t_purchase_apply`;
CREATE TABLE `t_purchase_apply` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `pro_id` varchar(100) DEFAULT NULL COMMENT '采购产品id',
  `pro_name` varchar(50) DEFAULT NULL COMMENT '采购品名',
  `pur_num` varchar(50) DEFAULT NULL COMMENT '采购数量(如果多个产品则分别对象数量)',
  `pur_reason` varchar(50) DEFAULT NULL COMMENT '采购原因',
  `status` int(1) DEFAULT '2' COMMENT '申请状态 0 审批通过 1审批驳回 2待审批 ',
  `applyer` varchar(30) DEFAULT NULL COMMENT '申请人',
  `apply_time` varchar(20) DEFAULT NULL COMMENT '申请时间',
  `approver` varchar(30) DEFAULT NULL COMMENT '审批人',
  `approve_time` varchar(20) DEFAULT NULL COMMENT '审批时间',
  `bz` varchar(50) DEFAULT NULL COMMENT '审批批次号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COMMENT='采购计划申请表';

-- ----------------------------
-- Records of t_purchase_apply
-- ----------------------------
INSERT INTO `t_purchase_apply` VALUES ('17', '3,4', '桶面,矿泉水', '20,40', '库存不足', '0', '潘子健', '2018-04-26 11:26:58', null, null, '20180426112658358');
INSERT INTO `t_purchase_apply` VALUES ('19', '1,2,4', '鱼油,饼干,矿泉水', '25,20,500', '库存不足', '0', '孟帅磊', '2018-05-11 09:31:25', null, null, '20180511093125907');
INSERT INTO `t_purchase_apply` VALUES ('23', '3', '桶面', '30', '上次采购不够', '1', '李磊', '2018-05-17 10:01:03', null, null, '20180517100103112');
INSERT INTO `t_purchase_apply` VALUES ('24', '1,2', '鱼油,饼干', '250,200', '库存不足', '2', '王明', '2018-05-17 10:13:31', null, null, '20180517101331378');

-- ----------------------------
-- Table structure for `t_purchase_approve`
-- ----------------------------
DROP TABLE IF EXISTS `t_purchase_approve`;
CREATE TABLE `t_purchase_approve` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `pro_id` varchar(100) DEFAULT NULL COMMENT '采购产品id',
  `pro_name` varchar(100) DEFAULT NULL,
  `pur_num` varchar(50) DEFAULT NULL COMMENT '采购数量',
  `applyer` varchar(30) DEFAULT NULL COMMENT '采购申请人',
  `apply_time` varchar(30) DEFAULT NULL COMMENT '申请时间',
  `approver` varchar(30) DEFAULT NULL COMMENT '审批人',
  `approve_time` varchar(20) DEFAULT NULL COMMENT '审批时间',
  `pur_batch` varchar(20) DEFAULT NULL COMMENT '采购批次,默认当天日期+随机数 为批次号',
  `purchaser` varchar(20) DEFAULT NULL COMMENT '采购执行人',
  `state` int(1) DEFAULT '1' COMMENT '是否已询价 0 已询价 1待询价',
  `bz` varchar(50) DEFAULT NULL COMMENT '备用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COMMENT='采购审批表';

-- ----------------------------
-- Records of t_purchase_approve
-- ----------------------------
INSERT INTO `t_purchase_approve` VALUES ('27', '3,4', '桶面,矿泉水', '20,40', '张三', '2018-04-26 11:26:58', '超级管理员', '2018-04-26', '20180426112658358', '超级管理员', '1', null);
INSERT INTO `t_purchase_approve` VALUES ('33', '1,2,4', '鱼油,饼干,矿泉水', '25,20,500', '孟帅磊', '2018-05-11 09:31:25', '超级管理员', '2018-05-17', '20180511093125907', '超级管理员', '1', null);

-- ----------------------------
-- Table structure for `t_purchase_record`
-- ----------------------------
DROP TABLE IF EXISTS `t_purchase_record`;
CREATE TABLE `t_purchase_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '询价采购序号',
  `pro_id` varchar(100) DEFAULT NULL COMMENT '商品编号',
  `pro_name` varchar(100) DEFAULT NULL COMMENT '采购商品名',
  `pur_num` varchar(50) DEFAULT NULL COMMENT '采购数量',
  `pur_batch` varchar(50) DEFAULT NULL COMMENT '采购批次号',
  `supply_id` varchar(50) DEFAULT NULL COMMENT '采购供应商ID',
  `supply_name` varchar(200) DEFAULT NULL COMMENT '供应商名字',
  `price` varchar(50) DEFAULT NULL COMMENT '采购价格',
  `buyer` varchar(30) DEFAULT NULL COMMENT '采购人',
  `record` int(1) DEFAULT '1' COMMENT '是否进行财务备案 0 已备案 1未备案 ',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COMMENT='采购询价表';

-- ----------------------------
-- Records of t_purchase_record
-- ----------------------------
INSERT INTO `t_purchase_record` VALUES ('17', '3', '桶面', '20', '20180516143325793', '01', '好运食品有限公司', '5', '超级管理员', '1');
INSERT INTO `t_purchase_record` VALUES ('18', '1,2,4', '鱼油,饼干,矿泉水', '25,20,500', '20180426115101295', '03', '卫龙食品有限公司', '50,5,2', '超级管理员', '0');
INSERT INTO `t_purchase_record` VALUES ('21', '3,4', '桶面,矿泉水', '20,40', '20180426112658358', '03', '卫龙食品有限公司', '5,20', '超级管理员', '0');
INSERT INTO `t_purchase_record` VALUES ('22', '1,2,4', '鱼油,饼干,矿泉水', '25,20,500', '20180511093125907', '01', '好运食品有限公司', '10,20,30', '超级管理员', '0');

-- ----------------------------
-- Table structure for `t_quartz_msg`
-- ----------------------------
DROP TABLE IF EXISTS `t_quartz_msg`;
CREATE TABLE `t_quartz_msg` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `entity_id` varchar(50) DEFAULT NULL COMMENT '消息内容对应的主体ID',
  `flag` varchar(20) DEFAULT NULL COMMENT '消息分类如:0检定消息 1报告消息,2审核消息等',
  `rolename` varchar(50) DEFAULT NULL COMMENT '角色名',
  `msg` varchar(150) DEFAULT NULL COMMENT '消息留言',
  `msg_time` varchar(30) DEFAULT NULL COMMENT '提示时间',
  `rdstate` int(1) DEFAULT '1' COMMENT '是否已读 0已读 1未读',
  `cancel` int(1) DEFAULT '0' COMMENT '取消,表示不再提醒的状态 0提醒,1取消',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='任务定时器提醒的消息';

-- ----------------------------
-- Records of t_quartz_msg
-- ----------------------------
INSERT INTO `t_quartz_msg` VALUES ('1', 'PNJYQ001', '仪器检定信息', '检定负责人', '仪器再有45天就到检定期了', '2018-06-11', '0', '0');
INSERT INTO `t_quartz_msg` VALUES ('2', 'PNJYQ003', '原子光谱仪', '检定负责人', '仪器再有30天就到检定期了', '2018-05-15', '1', '0');
INSERT INTO `t_quartz_msg` VALUES ('3', 'PNJYQ007', '气相色谱仪', '检定负责人', '仪器再有50天就到检定期了', '2018-06-21', '1', '0');

-- ----------------------------
-- Table structure for `t_result`
-- ----------------------------
DROP TABLE IF EXISTS `t_result`;
CREATE TABLE `t_result` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '询价采购序号',
  `pro_id` varchar(100) DEFAULT NULL COMMENT '商品编号',
  `pro_name` varchar(100) DEFAULT NULL COMMENT '采购商品名',
  `pur_num` varchar(50) DEFAULT NULL COMMENT '采购数量',
  `pur_batch` varchar(50) DEFAULT NULL COMMENT '采购批次号',
  `price` varchar(50) DEFAULT NULL COMMENT '采购价格',
  `buyer` varchar(30) DEFAULT NULL COMMENT '采购人',
  `status` int(1) DEFAULT '0' COMMENT '采购状态 0 待采购 1 已采购 2 作废',
  `buy_time` varchar(30) DEFAULT NULL COMMENT '采购时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COMMENT='采购结果表';

-- ----------------------------
-- Records of t_result
-- ----------------------------
INSERT INTO `t_result` VALUES ('35', '3', '桶面', '20', '20180516143325793', '5', '超级管理员', '0', null);
INSERT INTO `t_result` VALUES ('36', '1,2,4', '鱼油,饼干,矿泉水', '25,20,500', '20180426115101295', '50,5,2', '超级管理员', '2', null);
INSERT INTO `t_result` VALUES ('38', '1,2,4', '鱼油,饼干,矿泉水', '25,20,500', '20180511093125907', '10,20,30', '超级管理员', '1', '2018-05-29');

-- ----------------------------
-- Table structure for `t_supplier`
-- ----------------------------
DROP TABLE IF EXISTS `t_supplier`;
CREATE TABLE `t_supplier` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `sup_id` varchar(20) DEFAULT NULL COMMENT '供应商ID',
  `name` varchar(100) DEFAULT NULL COMMENT '供应商名字',
  `address` varchar(100) DEFAULT NULL COMMENT '供应商地址',
  `contacts` varchar(50) DEFAULT NULL COMMENT '联系人',
  `telephone` varchar(20) DEFAULT NULL COMMENT '手机号',
  `email` varchar(50) DEFAULT NULL COMMENT '电子邮箱',
  `temp_price` varchar(20) DEFAULT NULL COMMENT '供应商报价',
  `bz` varchar(100) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 COMMENT='供应商信息表';

-- ----------------------------
-- Records of t_supplier
-- ----------------------------
INSERT INTO `t_supplier` VALUES ('1', '01', '好运食品有限公司', '许昌市祥云大道105号东段', '刘强', '17856489652', '12306@163.com', '10', null);
INSERT INTO `t_supplier` VALUES ('13', '02', '哇哈哈有限公司', '洛阳市洛龙区开元广场50号', '王敏', '15695684856', '12306@163.com', '20', null);
INSERT INTO `t_supplier` VALUES ('38', '03', '卫龙食品有限公司', '许昌市魏都区文峰路18号', '刘蕊', '15635845685', '1452@163.com', '15', null);
INSERT INTO `t_supplier` VALUES ('39', '04', '小龙食品有限公司', '许昌市建安区八一路路106号', '刘明', '13568456852', '125@qq.cn', null, null);
INSERT INTO `t_supplier` VALUES ('41', '05', '国联水产有限公司', '许昌市浒湾镇', '崔盼盼', '13569547852', '168415@qq.com', null, null);

-- ----------------------------
-- Table structure for `t_temp`
-- ----------------------------
DROP TABLE IF EXISTS `t_temp`;
CREATE TABLE `t_temp` (
  `id` int(11) NOT NULL DEFAULT '0',
  `temp_id` varchar(50) DEFAULT NULL COMMENT '模版KEY',
  `temp_name` varchar(50) DEFAULT NULL COMMENT '模版名称',
  `temp_comment` varchar(50) DEFAULT NULL COMMENT '模版注释',
  PRIMARY KEY (`id`),
  KEY `t_temp_index1` (`temp_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_temp
-- ----------------------------
INSERT INTO `t_temp` VALUES ('0', '1', '22', '3');

-- ----------------------------
-- Table structure for `t_temp_filed`
-- ----------------------------
DROP TABLE IF EXISTS `t_temp_filed`;
CREATE TABLE `t_temp_filed` (
  `id` int(11) NOT NULL COMMENT '主键KEY',
  `temp_id` varchar(50) DEFAULT NULL COMMENT '模版主表KEY',
  `filed_id` varchar(50) DEFAULT NULL COMMENT 'Key',
  `filed_name` varchar(50) DEFAULT NULL COMMENT '名称',
  `filed_type` varchar(10) DEFAULT 'varchar' COMMENT '类型',
  `filed_order` int(3) DEFAULT '0' COMMENT '长度',
  `filed_comment` varchar(50) DEFAULT NULL COMMENT '注释',
  `filed_default` varchar(50) DEFAULT NULL COMMENT '默认值',
  `filed_check` varchar(10) DEFAULT NULL COMMENT '验证',
  PRIMARY KEY (`id`),
  KEY `t_temp_filed_index1` (`temp_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_temp_filed
-- ----------------------------
INSERT INTO `t_temp_filed` VALUES ('0', '1', '2', '3', '4', '5', '6', '7', '8');

-- ----------------------------
-- Table structure for `t_test`
-- ----------------------------
DROP TABLE IF EXISTS `t_test`;
CREATE TABLE `t_test` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `theID` varchar(50) DEFAULT NULL COMMENT '唯一键',
  `theName` varchar(200) DEFAULT NULL COMMENT '名称',
  `date1` date DEFAULT NULL COMMENT 'date类型',
  `date2` time DEFAULT NULL COMMENT 'time类型',
  `date3` datetime DEFAULT NULL COMMENT 'datetime类型',
  `date4` timestamp NULL DEFAULT NULL COMMENT '时间戳',
  `num1` decimal(10,2) DEFAULT '0.00' COMMENT '数字',
  PRIMARY KEY (`id`),
  KEY `t_test_index1` (`theID`),
  KEY `t_test_index2` (`theID`,`theName`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='测试创建表SQL';

-- ----------------------------
-- Records of t_test
-- ----------------------------
INSERT INTO `t_test` VALUES ('1', null, null, null, null, null, null, '0.00');
INSERT INTO `t_test` VALUES ('2', null, null, null, null, null, null, '0.00');
INSERT INTO `t_test` VALUES ('3', null, null, null, null, null, null, '0.00');

-- ----------------------------
-- Procedure structure for `createBean`
-- ----------------------------
DROP PROCEDURE IF EXISTS `createBean`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `createBean`(IN `the_name` varchar(50))
BEGIN
	set @the_name = '';
	if `the_name` is not null THEN
		set @the_name = `the_name`;
	end if;
	#Routine body goes here...
	SELECT  GROUP_CONCAT(column_name separator ',') as 'rs'
	from information_schema.columns
	where  TABLE_SCHEMA='pds_admin' 
	and TABLE_NAME = @the_name;
END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for `getSplitSting`
-- ----------------------------
DROP FUNCTION IF EXISTS `getSplitSting`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getSplitSting`(f_string varchar(1000),f_delimiter varchar(5),f_order int) RETURNS varchar(255) CHARSET utf8
BEGIN
      return reverse(substring_index(reverse(substring_index(f_string,f_delimiter,f_order)),f_delimiter,1));
END
;;
DELIMITER ;
