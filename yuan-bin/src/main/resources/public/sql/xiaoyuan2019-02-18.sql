/*
Navicat MySQL Data Transfer

Source Server         : aliyun
Source Server Version : 50725
Source Host           : 120.79.164.63:3306
Source Database       : newpro

Target Server Type    : MYSQL
Target Server Version : 50725
File Encoding         : 65001

Date: 2019-02-18 17:25:01
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for family_base_info
-- ----------------------------
DROP TABLE IF EXISTS `family_base_info`;
CREATE TABLE `family_base_info` (
  `id` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `birthday` varchar(64) NOT NULL COMMENT '出生时间',
  `name` varchar(64) NOT NULL COMMENT '用户名',
  `created_man` varchar(64) NOT NULL COMMENT '创建人',
  `salt` varchar(36) DEFAULT NULL COMMENT '密码加密盐',
  `sex` tinyint(2) NOT NULL DEFAULT '0' COMMENT '性别',
  `age` tinyint(2) DEFAULT '0' COMMENT '年龄',
  `phone` varchar(20) DEFAULT NULL COMMENT '手机号',
  `user_type` tinyint(2) NOT NULL DEFAULT '0' COMMENT '用户类别',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '用户状态',
  `family_id` int(11) NOT NULL DEFAULT '0' COMMENT '所属家庭',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `url_path` varchar(500) DEFAULT NULL COMMENT '头像',
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDx_user_login_name` (`birthday`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='家主基本信息';

-- ----------------------------
-- Records of family_base_info
-- ----------------------------
INSERT INTO `family_base_info` VALUES ('1', 'a', 'admin', '58ce9b60004d7dec736f33edc725e4db', 'test', '0', '25', '18538062907', '0', '0', '1', '2015-12-06 13:14:05', null, '86521760@qq.com');
INSERT INTO `family_base_info` VALUES ('16', 'lugongqi', 'lugongqi', '20de4d231f7602057e11bd84fb1b23e5', 'b70adfa7-11c8-4519-a58f-d18f797ce52f', '0', '20', '18538062907', '0', '0', '6', '2017-09-03 16:02:31', null, 'jian.chen@zzzy.org');

-- ----------------------------
-- Table structure for QRTZ_BLOB_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_BLOB_TRIGGERS`;
CREATE TABLE `QRTZ_BLOB_TRIGGERS` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `blob_data` blob,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `QRTZ_BLOB_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of QRTZ_BLOB_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_CALENDARS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_CALENDARS`;
CREATE TABLE `QRTZ_CALENDARS` (
  `sched_name` varchar(120) NOT NULL,
  `calendar_name` varchar(200) NOT NULL,
  `calendar` blob NOT NULL,
  PRIMARY KEY (`sched_name`,`calendar_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of QRTZ_CALENDARS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_CRON_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_CRON_TRIGGERS`;
CREATE TABLE `QRTZ_CRON_TRIGGERS` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `cron_expression` varchar(200) NOT NULL,
  `time_zone_id` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `QRTZ_CRON_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of QRTZ_CRON_TRIGGERS
-- ----------------------------
INSERT INTO `QRTZ_CRON_TRIGGERS` VALUES ('RuoyiScheduler', '__TASK_CLASS_NAME__1', 'DEFAULT', '0 0 1 * * ?', 'Asia/Shanghai');
INSERT INTO `QRTZ_CRON_TRIGGERS` VALUES ('RuoyiScheduler', '__TASK_CLASS_NAME__2', 'DEFAULT', '0/20 * * * * ?', 'Asia/Shanghai');

-- ----------------------------
-- Table structure for QRTZ_FIRED_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_FIRED_TRIGGERS`;
CREATE TABLE `QRTZ_FIRED_TRIGGERS` (
  `sched_name` varchar(120) NOT NULL,
  `entry_id` varchar(95) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `instance_name` varchar(200) NOT NULL,
  `fired_time` bigint(13) NOT NULL,
  `sched_time` bigint(13) NOT NULL,
  `priority` int(11) NOT NULL,
  `state` varchar(16) NOT NULL,
  `job_name` varchar(200) DEFAULT NULL,
  `job_group` varchar(200) DEFAULT NULL,
  `is_nonconcurrent` varchar(1) DEFAULT NULL,
  `requests_recovery` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`sched_name`,`entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of QRTZ_FIRED_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_JOB_DETAILS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_JOB_DETAILS`;
CREATE TABLE `QRTZ_JOB_DETAILS` (
  `sched_name` varchar(120) NOT NULL,
  `job_name` varchar(200) NOT NULL,
  `job_group` varchar(200) NOT NULL,
  `description` varchar(250) DEFAULT NULL,
  `job_class_name` varchar(250) NOT NULL,
  `is_durable` varchar(1) NOT NULL,
  `is_nonconcurrent` varchar(1) NOT NULL,
  `is_update_data` varchar(1) NOT NULL,
  `requests_recovery` varchar(1) NOT NULL,
  `job_data` blob,
  PRIMARY KEY (`sched_name`,`job_name`,`job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of QRTZ_JOB_DETAILS
-- ----------------------------
INSERT INTO `QRTZ_JOB_DETAILS` VALUES ('RuoyiScheduler', '__TASK_CLASS_NAME__1', 'DEFAULT', null, 'com.project.quartz.util.ScheduleJob', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C770800000010000000017400135F5F5441534B5F50524F504552544945535F5F73720020636F6D2E70726F6A6563742E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000E63726F6E45787072657373696F6E7400124C6A6176612F6C616E672F537472696E673B4C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000A6D6574686F644E616D6571007E00094C000C6D6574686F64506172616D7371007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720022636F6D2E70726F6A6563742E636F6D6D6F6E2E626173652E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001622CDE29E0787074000070707074000B3020302031202A202A203F74000FE695B0E68DAEE5BA93E5A487E4BBBD7372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000000000000000174000672795461736B7400086261636B7570444274000074000130740001317800);
INSERT INTO `QRTZ_JOB_DETAILS` VALUES ('RuoyiScheduler', '__TASK_CLASS_NAME__2', 'DEFAULT', null, 'com.project.quartz.util.ScheduleJob', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C770800000010000000017400135F5F5441534B5F50524F504552544945535F5F73720020636F6D2E70726F6A6563742E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000E63726F6E45787072657373696F6E7400124C6A6176612F6C616E672F537472696E673B4C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000A6D6574686F644E616D6571007E00094C000C6D6574686F64506172616D7371007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720022636F6D2E70726F6A6563742E636F6D6D6F6E2E626173652E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001622CDE29E0787074000070707074000E302F3230202A202A202A202A203F74002CE695B0E68DAEE5BA93E681A2E5A48DEFBC88E99C80E5BD95E585A5E5A487E4BBBDE69687E4BBB66964EFBC897372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000000000000000274000672795461736B74000D7265636F766572444246696C657400103138313231323132313231333030323574000130740001317800);

-- ----------------------------
-- Table structure for QRTZ_LOCKS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_LOCKS`;
CREATE TABLE `QRTZ_LOCKS` (
  `sched_name` varchar(120) NOT NULL,
  `lock_name` varchar(40) NOT NULL,
  PRIMARY KEY (`sched_name`,`lock_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of QRTZ_LOCKS
-- ----------------------------
INSERT INTO `QRTZ_LOCKS` VALUES ('RuoyiScheduler', 'STATE_ACCESS');
INSERT INTO `QRTZ_LOCKS` VALUES ('RuoyiScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for QRTZ_PAUSED_TRIGGER_GRPS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_PAUSED_TRIGGER_GRPS`;
CREATE TABLE `QRTZ_PAUSED_TRIGGER_GRPS` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  PRIMARY KEY (`sched_name`,`trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of QRTZ_PAUSED_TRIGGER_GRPS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_SCHEDULER_STATE
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SCHEDULER_STATE`;
CREATE TABLE `QRTZ_SCHEDULER_STATE` (
  `sched_name` varchar(120) NOT NULL,
  `instance_name` varchar(200) NOT NULL,
  `last_checkin_time` bigint(13) NOT NULL,
  `checkin_interval` bigint(13) NOT NULL,
  PRIMARY KEY (`sched_name`,`instance_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of QRTZ_SCHEDULER_STATE
-- ----------------------------
INSERT INTO `QRTZ_SCHEDULER_STATE` VALUES ('RuoyiScheduler', 'USER-20181123JE1550481634252', '1550481900871', '15000');

-- ----------------------------
-- Table structure for QRTZ_SIMPLE_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SIMPLE_TRIGGERS`;
CREATE TABLE `QRTZ_SIMPLE_TRIGGERS` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `repeat_count` bigint(7) NOT NULL,
  `repeat_interval` bigint(12) NOT NULL,
  `times_triggered` bigint(10) NOT NULL,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `QRTZ_SIMPLE_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of QRTZ_SIMPLE_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_SIMPROP_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SIMPROP_TRIGGERS`;
CREATE TABLE `QRTZ_SIMPROP_TRIGGERS` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `str_prop_1` varchar(512) DEFAULT NULL,
  `str_prop_2` varchar(512) DEFAULT NULL,
  `str_prop_3` varchar(512) DEFAULT NULL,
  `int_prop_1` int(11) DEFAULT NULL,
  `int_prop_2` int(11) DEFAULT NULL,
  `long_prop_1` bigint(20) DEFAULT NULL,
  `long_prop_2` bigint(20) DEFAULT NULL,
  `dec_prop_1` decimal(13,4) DEFAULT NULL,
  `dec_prop_2` decimal(13,4) DEFAULT NULL,
  `bool_prop_1` varchar(1) DEFAULT NULL,
  `bool_prop_2` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `QRTZ_SIMPROP_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of QRTZ_SIMPROP_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_TRIGGERS`;
CREATE TABLE `QRTZ_TRIGGERS` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `job_name` varchar(200) NOT NULL,
  `job_group` varchar(200) NOT NULL,
  `description` varchar(250) DEFAULT NULL,
  `next_fire_time` bigint(13) DEFAULT NULL,
  `prev_fire_time` bigint(13) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `trigger_state` varchar(16) NOT NULL,
  `trigger_type` varchar(8) NOT NULL,
  `start_time` bigint(13) NOT NULL,
  `end_time` bigint(13) DEFAULT NULL,
  `calendar_name` varchar(200) DEFAULT NULL,
  `misfire_instr` smallint(2) DEFAULT NULL,
  `job_data` blob,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  KEY `sched_name` (`sched_name`,`job_name`,`job_group`),
  CONSTRAINT `QRTZ_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `QRTZ_JOB_DETAILS` (`sched_name`, `job_name`, `job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of QRTZ_TRIGGERS
-- ----------------------------
INSERT INTO `QRTZ_TRIGGERS` VALUES ('RuoyiScheduler', '__TASK_CLASS_NAME__1', 'DEFAULT', '__TASK_CLASS_NAME__1', 'DEFAULT', null, '1548349200000', '-1', '5', 'PAUSED', 'CRON', '1548266399000', '0', null, '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C770800000010000000017400135F5F5441534B5F50524F504552544945535F5F73720020636F6D2E70726F6A6563742E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000E63726F6E45787072657373696F6E7400124C6A6176612F6C616E672F537472696E673B4C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000A6D6574686F644E616D6571007E00094C000C6D6574686F64506172616D7371007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720022636F6D2E70726F6A6563742E636F6D6D6F6E2E626173652E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001622CDE29E0787074000070707074000B3020302031202A202A203F74000FE695B0E68DAEE5BA93E5A487E4BBBD7372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000000000000000174000672795461736B7400086261636B7570444274000074000130740001317800);
INSERT INTO `QRTZ_TRIGGERS` VALUES ('RuoyiScheduler', '__TASK_CLASS_NAME__2', 'DEFAULT', '__TASK_CLASS_NAME__2', 'DEFAULT', null, '1548266400000', '-1', '5', 'PAUSED', 'CRON', '1548266400000', '0', null, '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C770800000010000000017400135F5F5441534B5F50524F504552544945535F5F73720020636F6D2E70726F6A6563742E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000E63726F6E45787072657373696F6E7400124C6A6176612F6C616E672F537472696E673B4C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000A6D6574686F644E616D6571007E00094C000C6D6574686F64506172616D7371007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720022636F6D2E70726F6A6563742E636F6D6D6F6E2E626173652E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001622CDE29E0787074000070707074000E302F3230202A202A202A202A203F74002CE695B0E68DAEE5BA93E681A2E5A48DEFBC88E99C80E5BD95E585A5E5A487E4BBBDE69687E4BBB66964EFBC897372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000000000000000274000672795461736B74000D7265636F766572444246696C657400103138313231323132313231333030323574000130740001317800);

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `config_id` int(5) NOT NULL COMMENT '参数主键',
  `config_name` varchar(100) DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(100) DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='参数配置表';

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES ('1', '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2018-03-16 11:33:00', 'admin', '2019-01-24 23:09:34', '默认 skin-default、蓝色 skin-blue、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES ('2', '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '初始化密码 123456');

-- ----------------------------
-- Table structure for sys_cost_time
-- ----------------------------
DROP TABLE IF EXISTS `sys_cost_time`;
CREATE TABLE `sys_cost_time` (
  `id` bigint(16) NOT NULL COMMENT '主键',
  `class_name` varchar(255) NOT NULL COMMENT '类名',
  `method_name` varchar(32) NOT NULL COMMENT '方法名',
  `spend_time` bigint(16) NOT NULL COMMENT '消耗的时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统响应时间统计记录表（方便对响应时间长的进行优化）';

-- ----------------------------
-- Records of sys_cost_time
-- ----------------------------

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `dept_id` bigint(16) NOT NULL COMMENT '部门id',
  `parent_id` bigint(16) DEFAULT '0' COMMENT '父部门id',
  `jbdm` varchar(128) NOT NULL COMMENT '级别代码，每级从100开始，即需保证同级部门不能超过900个，方便统计用',
  `dept_name` varchar(30) DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `leader` varchar(20) DEFAULT '' COMMENT '负责人',
  `phone` varchar(11) DEFAULT '' COMMENT '联系电话',
  `email` varchar(50) DEFAULT '' COMMENT '邮箱',
  `status` char(1) DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE,
  KEY `index_dept_jbdm` (`jbdm`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='部门表';

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES ('1812121212120000', '0', '100', '笑缘项目', '0', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('1812121212120001', '1812121212120000', '100100', '深圳总公司', '1', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('1812121212120002', '1812121212120000', '100101', '长沙分公司', '2', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data` (
  `dict_code` bigint(16) NOT NULL COMMENT '字典编码',
  `dict_sort` int(4) DEFAULT '0' COMMENT '字典排序',
  `dict_label` varchar(100) DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) DEFAULT '' COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) DEFAULT '' COMMENT '表格回显样式',
  `is_default` char(1) DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`dict_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='字典数据表';

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES ('1812121212130000', '1', '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '性别男');
INSERT INTO `sys_dict_data` VALUES ('1812121212130001', '2', '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '性别女');
INSERT INTO `sys_dict_data` VALUES ('1812121212130002', '3', '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '性别未知');
INSERT INTO `sys_dict_data` VALUES ('1812121212130003', '1', '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '显示菜单');
INSERT INTO `sys_dict_data` VALUES ('1812121212130004', '2', '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES ('1812121212130005', '1', '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES ('1812121212130006', '2', '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '停用状态');
INSERT INTO `sys_dict_data` VALUES ('1812121212130007', '1', '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES ('1812121212130008', '2', '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '停用状态');
INSERT INTO `sys_dict_data` VALUES ('1812121212130009', '1', '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统默认是');
INSERT INTO `sys_dict_data` VALUES ('1812121212130010', '2', '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统默认否');
INSERT INTO `sys_dict_data` VALUES ('1812121212130011', '1', '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知');
INSERT INTO `sys_dict_data` VALUES ('1812121212130012', '2', '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '公告');
INSERT INTO `sys_dict_data` VALUES ('1812121212130013', '1', '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES ('1812121212130014', '2', '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '关闭状态');
INSERT INTO `sys_dict_data` VALUES ('1812121212130015', '1', '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '新增操作');
INSERT INTO `sys_dict_data` VALUES ('1812121212130016', '2', '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '修改操作');
INSERT INTO `sys_dict_data` VALUES ('1812121212130017', '3', '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '删除操作');
INSERT INTO `sys_dict_data` VALUES ('1812121212130018', '4', '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '授权操作');
INSERT INTO `sys_dict_data` VALUES ('1812121212130019', '5', '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '导出操作');
INSERT INTO `sys_dict_data` VALUES ('1812121212130020', '6', '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '导入操作');
INSERT INTO `sys_dict_data` VALUES ('1812121212130021', '7', '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '强退操作');
INSERT INTO `sys_dict_data` VALUES ('1812121212130022', '8', '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '生成操作');
INSERT INTO `sys_dict_data` VALUES ('1812121212130023', '8', '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '清空操作');
INSERT INTO `sys_dict_data` VALUES ('1812121212130024', '1', '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES ('1812121212130025', '2', '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '停用状态');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type` (
  `dict_id` bigint(16) NOT NULL COMMENT '字典主键',
  `dict_name` varchar(100) DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`dict_id`),
  UNIQUE KEY `dict_type` (`dict_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='字典类型表';

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES ('1812121212110000', '用户性别', 'sys_user_sex', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '用户性别列表');
INSERT INTO `sys_dict_type` VALUES ('1812121212110001', '菜单状态', 'sys_show_hide', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES ('1812121212110002', '系统开关', 'sys_normal_disable', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统开关列表');
INSERT INTO `sys_dict_type` VALUES ('1812121212110003', '任务状态', 'sys_job_status', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '任务状态列表');
INSERT INTO `sys_dict_type` VALUES ('1812121212110004', '系统是否', 'sys_yes_no', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统是否列表');
INSERT INTO `sys_dict_type` VALUES ('1812121212110005', '通知类型', 'sys_notice_type', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知类型列表');
INSERT INTO `sys_dict_type` VALUES ('1812121212110006', '通知状态', 'sys_notice_status', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知状态列表');
INSERT INTO `sys_dict_type` VALUES ('1812121212110007', '操作类型', 'sys_oper_type', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '操作类型列表');
INSERT INTO `sys_dict_type` VALUES ('1812121212110008', '系统状态', 'sys_common_status', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '登录状态列表');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job` (
  `job_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL DEFAULT '' COMMENT '任务组名',
  `method_name` varchar(500) DEFAULT '' COMMENT '任务方法',
  `method_params` varchar(200) DEFAULT '' COMMENT '方法参数',
  `cron_expression` varchar(255) DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) DEFAULT '0' COMMENT '计划执行错误策略（0默认 1继续 2等待 3放弃）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`,`job_name`,`job_group`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='定时任务调度表';

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES ('1', 'ryTask', '数据库备份', 'backupDB', '', '0 0 1 * * ?', '0', '1', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_job` VALUES ('2', 'ryTask', '数据库恢复（需录入备份文件id）', 'recoverDBFile', '1812121212130025', '0/20 * * * * ?', '0', '1', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log` (
  `job_log_id` bigint(16) NOT NULL COMMENT '任务日志ID',
  `job_name` varchar(64) NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL COMMENT '任务组名',
  `method_name` varchar(500) DEFAULT NULL COMMENT '任务方法',
  `method_params` varchar(200) DEFAULT '' COMMENT '方法参数',
  `job_message` varchar(500) DEFAULT NULL COMMENT '日志信息',
  `status` char(1) DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` text COMMENT '异常信息',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='定时任务调度日志表';

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------
INSERT INTO `sys_job_log` VALUES ('1901251352140007', 'ryTask', '数据库备份', 'backupDB', '', 'ryTask 总共耗时：277毫秒', '0', null, '2019-01-25 13:52:11');
INSERT INTO `sys_job_log` VALUES ('1901251353270010', 'ryTask', '数据库备份', 'backupDB', '', 'ryTask 总共耗时：46毫秒', '0', null, '2019-01-25 13:53:25');

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor` (
  `info_id` bigint(16) NOT NULL COMMENT '访问ID',
  `login_name` varchar(50) DEFAULT '' COMMENT '登录账号',
  `dept_id` bigint(16) DEFAULT '0' COMMENT '账号所属部门',
  `ipaddr` varchar(50) DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) DEFAULT '' COMMENT '操作系统',
  `status` char(1) DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) DEFAULT '' COMMENT '提示消息',
  `login_time` datetime DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统访问记录';

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES ('1901240200390000', 'admin', '1812121212120000', '127.0.0.1', 'XX XX', 'Firefox', 'Windows 7', '0', '登录成功', '2019-01-24 02:00:34');
INSERT INTO `sys_logininfor` VALUES ('1901242245260000', 'admin', '1812121212120000', '127.0.0.1', 'XX XX', 'Firefox', 'Windows 7', '0', '登录成功', '2019-01-24 22:45:20');
INSERT INTO `sys_logininfor` VALUES ('1901242313050009', 'jmjjmj', '1812121212120002', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 7', '0', '登录成功', '2019-01-24 23:12:59');
INSERT INTO `sys_logininfor` VALUES ('1901251006220000', 'admin', '1812121212120000', '127.0.0.1', 'XX XX', 'Firefox', 'Windows 7', '0', '登录成功', '2019-01-25 10:06:19');
INSERT INTO `sys_logininfor` VALUES ('1901251100330001', 'admin', '1812121212120000', '127.0.0.1', 'XX XX', 'Firefox', 'Windows 7', '0', '登录成功', '2019-01-25 11:00:30');
INSERT INTO `sys_logininfor` VALUES ('1901251345450002', 'admin', '1812121212120000', '127.0.0.1', 'XX XX', 'Firefox', 'Windows 7', '0', '登录成功', '2019-01-25 13:45:43');
INSERT INTO `sys_logininfor` VALUES ('1901270025070000', 'admin', '1812121212120000', '127.0.0.1', 'XX XX', 'Firefox', 'Windows 7', '0', '登录成功', '2019-01-27 00:24:56');
INSERT INTO `sys_logininfor` VALUES ('1901270046020001', 'admin', '1812121212120000', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 7', '0', '登录成功', '2019-01-27 00:45:51');
INSERT INTO `sys_logininfor` VALUES ('1901270046210002', 'jmjjmj', '1812121212120002', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 7', '0', '登录成功', '2019-01-27 00:46:10');
INSERT INTO `sys_logininfor` VALUES ('1901270101490000', 'admin', '1812121212120000', '127.0.0.1', 'XX XX', 'Firefox', 'Windows 7', '0', '登录成功', '2019-01-27 01:01:49');
INSERT INTO `sys_logininfor` VALUES ('1901270104270000', 'admin', '1812121212120000', '127.0.0.1', 'XX XX', 'Firefox', 'Windows 7', '0', '登录成功', '2019-01-27 01:04:27');
INSERT INTO `sys_logininfor` VALUES ('1901270105230000', 'admin', '1812121212120000', '127.0.0.1', 'XX XX', 'Firefox', 'Windows 7', '0', '登录成功', '2019-01-27 01:05:23');
INSERT INTO `sys_logininfor` VALUES ('1901270105410001', 'admin', '1812121212120000', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 7', '0', '登录成功', '2019-01-27 01:05:41');
INSERT INTO `sys_logininfor` VALUES ('1901271017530000', 'admin', '1812121212120000', '127.0.0.1', 'XX XX', 'Firefox', 'Windows 7', '0', '登录成功', '2019-01-27 10:17:52');
INSERT INTO `sys_logininfor` VALUES ('1901272028000001', 'admin', '1812121212120000', '127.0.0.1', 'XX XX', 'Firefox', 'Windows 7', '0', '登录成功', '2019-01-27 20:27:58');
INSERT INTO `sys_logininfor` VALUES ('1901280019310002', 'admin', '1812121212120000', '127.0.0.1', 'XX XX', 'Firefox', 'Windows 7', '0', '登录成功', '2019-01-28 00:19:29');
INSERT INTO `sys_logininfor` VALUES ('1901280029390000', 'admin', '1812121212120000', '127.0.0.1', 'XX XX', 'Firefox', 'Windows 7', '0', '登录成功', '2019-01-28 00:29:37');
INSERT INTO `sys_logininfor` VALUES ('1901280033010000', 'admin', '1812121212120000', '127.0.0.1', 'XX XX', 'Firefox', 'Windows 7', '0', '登录成功', '2019-01-28 00:32:59');
INSERT INTO `sys_logininfor` VALUES ('1901280045300000', 'admin', '1812121212120000', '127.0.0.1', 'XX XX', 'Firefox', 'Windows 7', '0', '登录成功', '2019-01-28 00:45:28');
INSERT INTO `sys_logininfor` VALUES ('1901281614380000', 'admin', '1812121212120000', '127.0.0.1', 'XX XX', 'Firefox', 'Windows 7', '0', '登录成功', '2019-01-28 16:14:32');
INSERT INTO `sys_logininfor` VALUES ('1901281619370006', 'admin', '1812121212120000', '127.0.0.1', 'XX XX', 'Firefox', 'Windows 7', '0', '登录成功', '2019-01-28 16:19:31');
INSERT INTO `sys_logininfor` VALUES ('1901281623470007', 'admin', '1812121212120000', '127.0.0.1', 'XX XX', 'Firefox', 'Windows 7', '0', '登录成功', '2019-01-28 16:23:41');
INSERT INTO `sys_logininfor` VALUES ('1902011735220000', 'admin', '1812121212120000', '127.0.0.1', 'XX XX', 'Firefox', 'Windows 7', '0', '登录成功', '2019-02-01 17:35:24');
INSERT INTO `sys_logininfor` VALUES ('1902021252550001', 'admin', '1812121212120000', '127.0.0.1', 'XX XX', 'Firefox', 'Windows 7', '0', '登录成功', '2019-02-02 12:52:59');
INSERT INTO `sys_logininfor` VALUES ('1902111348420001', 'admin', '1812121212120000', '127.0.0.1', 'XX XX', 'Firefox', 'Windows 7', '0', '退出成功', '2019-02-11 13:48:33');
INSERT INTO `sys_logininfor` VALUES ('1902181721000000', 'admin', '1812121212120000', '127.0.0.1', 'XX XX', 'Firefox', 'Windows 7', '0', '登录成功', '2019-02-18 17:20:59');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) NOT NULL COMMENT '菜单名称',
  `parent_id` int(11) DEFAULT '0' COMMENT '父菜单ID',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `url` varchar(200) DEFAULT '#' COMMENT '请求地址',
  `menu_type` char(1) DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `perms` varchar(100) DEFAULT '' COMMENT '权限标识',
  `icon` varchar(100) DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2004 DEFAULT CHARSET=utf8 COMMENT='菜单权限表';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '系统管理', '0', '2', '#', 'M', '0', '', 'fa fa-gear', 'admin', '2018-03-16 11:33:00', 'lugongqi', '2018-03-16 11:33:00', '系统管理目录');
INSERT INTO `sys_menu` VALUES ('2', '系统监控', '0', '3', '#', 'M', '0', '', 'fa fa-video-camera', 'admin', '2018-03-16 11:33:00', 'lugongqi', '2018-03-16 11:33:00', '系统监控目录');
INSERT INTO `sys_menu` VALUES ('3', '系统工具', '0', '4', '#', 'M', '0', '', 'fa fa-bars', 'admin', '2018-03-16 11:33:00', 'lugongqi', '2018-03-16 11:33:00', '系统工具目录');
INSERT INTO `sys_menu` VALUES ('4', '家族族谱', '0', '1', '#', 'M', '0', '', 'fa fa-gear', 'admin', '2018-03-16 11:33:00', 'lugongqi', '2018-03-16 11:33:00', '家族谱目录');
INSERT INTO `sys_menu` VALUES ('100', '用户管理', '1', '1', '/system/user', 'C', '0', 'system:user:view', '#', 'admin', '2018-03-16 11:33:00', 'lugongqi', '2018-03-16 11:33:00', '用户管理菜单');
INSERT INTO `sys_menu` VALUES ('101', '角色管理', '1', '2', '/system/role', 'C', '0', 'system:role:view', '#', 'admin', '2018-03-16 11:33:00', 'lugongqi', '2018-03-16 11:33:00', '角色管理菜单');
INSERT INTO `sys_menu` VALUES ('102', '菜单管理', '1', '3', '/system/menu', 'C', '0', 'system:menu:view', '#', 'admin', '2018-03-16 11:33:00', 'lugongqi', '2018-03-16 11:33:00', '菜单管理菜单');
INSERT INTO `sys_menu` VALUES ('103', '部门管理', '1', '4', '/system/dept', 'C', '0', 'system:dept:view', '#', 'admin', '2018-03-16 11:33:00', 'lugongqi', '2018-03-16 11:33:00', '部门管理菜单');
INSERT INTO `sys_menu` VALUES ('104', '岗位管理', '1', '5', '/system/post', 'C', '0', 'system:post:view', '#', 'admin', '2018-03-16 11:33:00', 'lugongqi', '2018-03-16 11:33:00', '岗位管理菜单');
INSERT INTO `sys_menu` VALUES ('105', '字典管理', '1', '6', '/system/dict', 'C', '0', 'system:dict:view', '#', 'admin', '2018-03-16 11:33:00', 'lugongqi', '2018-03-16 11:33:00', '字典管理菜单');
INSERT INTO `sys_menu` VALUES ('106', '参数设置', '1', '7', '/system/config', 'C', '0', 'system:config:view', '#', 'admin', '2018-03-16 11:33:00', 'lugongqi', '2018-03-16 11:33:00', '参数设置菜单');
INSERT INTO `sys_menu` VALUES ('107', '通知公告', '1', '8', '/system/notice', 'C', '0', 'system:notice:view', '#', 'admin', '2018-03-16 11:33:00', 'lugongqi', '2018-03-16 11:33:00', '通知公告菜单');
INSERT INTO `sys_menu` VALUES ('108', '日志管理', '1', '9', '#', 'M', '0', '', '#', 'admin', '2018-03-16 11:33:00', 'lugongqi', '2018-03-16 11:33:00', '日志管理菜单');
INSERT INTO `sys_menu` VALUES ('109', '在线用户', '2', '1', '/monitor/online', 'C', '0', 'monitor:online:view', '#', 'admin', '2018-03-16 11:33:00', 'lugongqi', '2018-03-16 11:33:00', '在线用户菜单');
INSERT INTO `sys_menu` VALUES ('110', '定时任务', '2', '2', '/monitor/job', 'C', '0', 'monitor:job:view', '#', 'admin', '2018-03-16 11:33:00', 'lugongqi', '2018-03-16 11:33:00', '定时任务菜单');
INSERT INTO `sys_menu` VALUES ('111', '数据监控', '2', '3', '/monitor/data', 'C', '0', 'monitor:data:view', '#', 'admin', '2018-03-16 11:33:00', 'lugongqi', '2018-03-16 11:33:00', '数据监控菜单');
INSERT INTO `sys_menu` VALUES ('112', '表单构建', '3', '1', '/tool/build', 'C', '0', 'tool:build:view', '#', 'admin', '2018-03-16 11:33:00', 'lugongqi', '2018-03-16 11:33:00', '表单构建菜单');
INSERT INTO `sys_menu` VALUES ('113', '代码生成', '3', '2', '/tool/gen', 'C', '0', 'tool:gen:view', '#', 'admin', '2018-03-16 11:33:00', 'lugongqi', '2018-03-16 11:33:00', '代码生成菜单');
INSERT INTO `sys_menu` VALUES ('114', '系统接口', '3', '3', '/tool/swagger', 'C', '0', 'tool:swagger:view', '#', 'admin', '2018-03-16 11:33:00', 'lugongqi', '2018-03-16 11:33:00', '系统接口菜单');
INSERT INTO `sys_menu` VALUES ('115', '响应监控', '2', '3', '/system/costTime', 'C', '0', 'system:costTime:view', '#', 'admin', '2018-03-16 11:33:00', 'lugongqi', '2018-03-16 11:33:00', '系统响应时间监控');
INSERT INTO `sys_menu` VALUES ('116', 'Excel导入', '1', '7', '/system/excelImport', 'C', '0', 'system:excelImport:view', '#', 'admin', '2018-03-16 11:33:00', 'lugongqi', '2018-03-16 11:33:00', '系统内所有的Excel导入功能');
INSERT INTO `sys_menu` VALUES ('117', '服务监控', '2', '3', '/monitor/server', 'C', '0', 'monitor:server:view', '#', 'admin', '2018-03-16 11:33:00', 'lugongqi', '2018-03-16 11:33:00', '服务监控菜单');
INSERT INTO `sys_menu` VALUES ('401', '家人信息', '4', '2', '/family/addBaseInfo', 'C', '0', 'family:baseinfo:add', '#', 'admin', '2018-03-16 11:33:00', 'lugongqi', '2018-03-16 11:33:00', '家人录入');
INSERT INTO `sys_menu` VALUES ('402', '家庭之主', '4', '1', '/family/familyMan', 'C', '0', 'family:apply:homeman', '#', 'admin', '2018-03-16 11:33:00', 'lugongqi', '2018-03-16 11:33:00', '家人录入');
INSERT INTO `sys_menu` VALUES ('500', '操作日志', '108', '1', '/monitor/operlog', 'C', '0', 'monitor:operlog:view', '#', 'admin', '2018-03-16 11:33:00', 'lugongqi', '2018-03-16 11:33:00', '操作日志菜单');
INSERT INTO `sys_menu` VALUES ('501', '登录日志', '108', '2', '/monitor/logininfor', 'C', '0', 'monitor:logininfor:view', '#', 'admin', '2018-03-16 11:33:00', 'lugongqi', '2018-03-16 11:33:00', '登录日志菜单');
INSERT INTO `sys_menu` VALUES ('1000', '用户查询', '100', '1', '#', 'F', '0', 'system:user:list', '#', 'admin', '2018-03-16 11:33:00', 'lugongqi', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1001', '用户新增', '100', '2', '#', 'F', '0', 'system:user:add', '#', 'admin', '2018-03-16 11:33:00', 'lugongqi', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1002', '用户修改', '100', '3', '#', 'F', '0', 'system:user:edit', '#', 'admin', '2018-03-16 11:33:00', 'lugongqi', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1003', '用户删除', '100', '4', '#', 'F', '0', 'system:user:remove', '#', 'admin', '2018-03-16 11:33:00', 'lugongqi', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1004', '用户导出', '100', '5', '#', 'F', '0', 'system:user:export', '#', 'admin', '2018-03-16 11:33:00', 'lugongqi', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1005', '重置密码', '100', '5', '#', 'F', '0', 'system:user:resetPwd', '#', 'admin', '2018-03-16 11:33:00', 'lugongqi', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1006', '角色查询', '101', '1', '#', 'F', '0', 'system:role:list', '#', 'admin', '2018-03-16 11:33:00', 'lugongqi', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1007', '角色新增', '101', '2', '#', 'F', '0', 'system:role:add', '#', 'admin', '2018-03-16 11:33:00', 'lugongqi', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1008', '角色修改', '101', '3', '#', 'F', '0', 'system:role:edit', '#', 'admin', '2018-03-16 11:33:00', 'lugongqi', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1009', '角色删除', '101', '4', '#', 'F', '0', 'system:role:remove', '#', 'admin', '2018-03-16 11:33:00', 'lugongqi', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1010', '角色导出', '101', '4', '#', 'F', '0', 'system:role:export', '#', 'admin', '2018-03-16 11:33:00', 'lugongqi', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1011', '菜单查询', '102', '1', '#', 'F', '0', 'system:menu:list', '#', 'admin', '2018-03-16 11:33:00', 'lugongqi', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1012', '菜单新增', '102', '2', '#', 'F', '0', 'system:menu:add', '#', 'admin', '2018-03-16 11:33:00', 'lugongqi', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1013', '菜单修改', '102', '3', '#', 'F', '0', 'system:menu:edit', '#', 'admin', '2018-03-16 11:33:00', 'lugongqi', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1014', '菜单删除', '102', '4', '#', 'F', '0', 'system:menu:remove', '#', 'admin', '2018-03-16 11:33:00', 'lugongqi', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1015', '部门查询', '103', '1', '#', 'F', '0', 'system:dept:list', '#', 'admin', '2018-03-16 11:33:00', 'lugongqi', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1016', '部门新增', '103', '2', '#', 'F', '0', 'system:dept:add', '#', 'admin', '2018-03-16 11:33:00', 'lugongqi', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1017', '部门修改', '103', '3', '#', 'F', '0', 'system:dept:edit', '#', 'admin', '2018-03-16 11:33:00', 'lugongqi', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1018', '部门删除', '103', '4', '#', 'F', '0', 'system:dept:remove', '#', 'admin', '2018-03-16 11:33:00', 'lugongqi', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1019', '岗位查询', '104', '1', '#', 'F', '0', 'system:post:list', '#', 'admin', '2018-03-16 11:33:00', 'lugongqi', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1020', '岗位新增', '104', '2', '#', 'F', '0', 'system:post:add', '#', 'admin', '2018-03-16 11:33:00', 'lugongqi', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1021', '岗位修改', '104', '3', '#', 'F', '0', 'system:post:edit', '#', 'admin', '2018-03-16 11:33:00', 'lugongqi', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1022', '岗位删除', '104', '4', '#', 'F', '0', 'system:post:remove', '#', 'admin', '2018-03-16 11:33:00', 'lugongqi', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1023', '岗位导出', '104', '4', '#', 'F', '0', 'system:post:export', '#', 'admin', '2018-03-16 11:33:00', 'lugongqi', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1024', '字典查询', '105', '1', '#', 'F', '0', 'system:dict:list', '#', 'admin', '2018-03-16 11:33:00', 'lugongqi', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1025', '字典新增', '105', '2', '#', 'F', '0', 'system:dict:add', '#', 'admin', '2018-03-16 11:33:00', 'lugongqi', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1026', '字典修改', '105', '3', '#', 'F', '0', 'system:dict:edit', '#', 'admin', '2018-03-16 11:33:00', 'lugongqi', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1027', '字典删除', '105', '4', '#', 'F', '0', 'system:dict:remove', '#', 'admin', '2018-03-16 11:33:00', 'lugongqi', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1028', '字典导出', '105', '4', '#', 'F', '0', 'system:dict:export', '#', 'admin', '2018-03-16 11:33:00', 'lugongqi', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1029', '参数查询', '106', '1', '#', 'F', '0', 'system:config:list', '#', 'admin', '2018-03-16 11:33:00', 'lugongqi', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1030', '参数新增', '106', '2', '#', 'F', '0', 'system:config:add', '#', 'admin', '2018-03-16 11:33:00', 'lugongqi', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1031', '参数修改', '106', '3', '#', 'F', '0', 'system:config:edit', '#', 'admin', '2018-03-16 11:33:00', 'lugongqi', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1032', '参数删除', '106', '4', '#', 'F', '0', 'system:config:remove', '#', 'admin', '2018-03-16 11:33:00', 'lugongqi', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1033', '参数导出', '106', '4', '#', 'F', '0', 'system:config:export', '#', 'admin', '2018-03-16 11:33:00', 'lugongqi', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1034', '公告查询', '107', '1', '#', 'F', '0', 'system:notice:list', '#', 'admin', '2018-03-16 11:33:00', 'lugongqi', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1035', '公告新增', '107', '2', '#', 'F', '0', 'system:notice:add', '#', 'admin', '2018-03-16 11:33:00', 'lugongqi', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1036', '公告修改', '107', '3', '#', 'F', '0', 'system:notice:edit', '#', 'admin', '2018-03-16 11:33:00', 'lugongqi', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1037', '公告删除', '107', '4', '#', 'F', '0', 'system:notice:remove', '#', 'admin', '2018-03-16 11:33:00', 'lugongqi', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1038', '操作查询', '500', '1', '#', 'F', '0', 'monitor:operlog:list', '#', 'admin', '2018-03-16 11:33:00', 'lugongqi', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1039', '操作删除', '500', '2', '#', 'F', '0', 'monitor:operlog:remove', '#', 'admin', '2018-03-16 11:33:00', 'lugongqi', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1040', '详细信息', '500', '3', '#', 'F', '0', 'monitor:operlog:detail', '#', 'admin', '2018-03-16 11:33:00', 'lugongqi', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1041', '日志导出', '500', '3', '#', 'F', '0', 'monitor:operlog:export', '#', 'admin', '2018-03-16 11:33:00', 'lugongqi', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1042', '登录查询', '501', '1', '#', 'F', '0', 'monitor:logininfor:list', '#', 'admin', '2018-03-16 11:33:00', 'lugongqi', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1043', '登录删除', '501', '2', '#', 'F', '0', 'monitor:logininfor:remove', '#', 'admin', '2018-03-16 11:33:00', 'lugongqi', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1044', '日志导出', '501', '2', '#', 'F', '0', 'monitor:logininfor:export', '#', 'admin', '2018-03-16 11:33:00', 'lugongqi', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1045', '在线查询', '109', '1', '#', 'F', '0', 'monitor:online:list', '#', 'admin', '2018-03-16 11:33:00', 'lugongqi', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1046', '批量强退', '109', '2', '#', 'F', '0', 'monitor:online:batchForceLogout', '#', 'admin', '2018-03-16 11:33:00', 'lugongqi', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1047', '单条强退', '109', '3', '#', 'F', '0', 'monitor:online:forceLogout', '#', 'admin', '2018-03-16 11:33:00', 'lugongqi', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1048', '任务查询', '110', '1', '#', 'F', '0', 'monitor:job:list', '#', 'admin', '2018-03-16 11:33:00', 'lugongqi', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1049', '任务新增', '110', '2', '#', 'F', '0', 'monitor:job:add', '#', 'admin', '2018-03-16 11:33:00', 'lugongqi', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1050', '任务修改', '110', '3', '#', 'F', '0', 'monitor:job:edit', '#', 'admin', '2018-03-16 11:33:00', 'lugongqi', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1051', '任务删除', '110', '4', '#', 'F', '0', 'monitor:job:remove', '#', 'admin', '2018-03-16 11:33:00', 'lugongqi', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1052', '状态修改', '110', '5', '#', 'F', '0', 'monitor:job:changeStatus', '#', 'admin', '2018-03-16 11:33:00', 'lugongqi', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1053', '任务导出', '110', '5', '#', 'F', '0', 'monitor:job:export', '#', 'admin', '2018-03-16 11:33:00', 'lugongqi', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1054', '生成查询', '113', '1', '#', 'F', '0', 'tool:gen:list', '#', 'admin', '2018-03-16 11:33:00', 'lugongqi', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1055', '生成代码', '113', '2', '#', 'F', '0', 'tool:gen:code', '#', 'admin', '2018-03-16 11:33:00', 'lugongqi', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1056', '监控删除', '115', '2', '#', 'F', '0', 'system:costTime:remove', '#', 'admin', '2018-03-16 11:33:00', 'lugongqi', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1057', '部门上级修改', '103', '5', '#', 'F', '0', 'system:dept:updateParentId', '#', 'admin', '2018-03-16 11:33:00', 'lugongqi', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('2000', '家主基本查询', '4', '1', '#', 'F', '0', 'module:baseInfo:list', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2001', '家主基本新增', '4', '2', '#', 'F', '0', 'module:baseInfo:add', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2002', '家主基本修改', '4', '3', '#', 'F', '0', 'module:baseInfo:edit', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2003', '家主基本删除', '4', '4', '#', 'F', '0', 'module:baseInfo:remove', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice` (
  `notice_id` bigint(16) NOT NULL COMMENT '公告ID',
  `notice_title` varchar(50) NOT NULL COMMENT '公告标题',
  `notice_type` char(2) NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` varchar(500) NOT NULL COMMENT '公告内容',
  `status` char(1) DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='通知公告表';

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES ('1901242310390005', '通知大家下雨收衣服啦', '2', '<p><span style=\"background-color: yellow;\"><span style=\"font-weight: bold;\">士大夫人的身份，下雨啦</span></span><br></p>', '0', 'admin', '2019-01-24 23:10:32', '', null, '');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log` (
  `oper_id` bigint(16) NOT NULL COMMENT '日志主键',
  `title` varchar(50) DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) DEFAULT '' COMMENT '方法名称',
  `operator_type` int(1) DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) DEFAULT '' COMMENT '操作人员',
  `dept_id` bigint(16) DEFAULT '0' COMMENT '部门id',
  `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(30) DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(255) DEFAULT '' COMMENT '请求参数',
  `status` int(1) DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='操作日志记录';

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES ('1901240205400002', '代码生成', '8', 'com.project.web.controller.tool.GenController.genCode()', '1', 'admin', '1812121212120000', '若依科技', '/tool/gen/genCode/sys_notice', '127.0.0.1', 'XX XX', '{ }', '0', null, '2019-01-24 02:05:36');
INSERT INTO `sys_oper_log` VALUES ('1901242248500002', '代码生成', '8', 'com.project.web.controller.tool.GenController.genCode()', '1', 'admin', '1812121212120000', '若依科技', '/tool/gen/genCode/sys_cost_time', '127.0.0.1', 'XX XX', '{ }', '0', null, '2019-01-24 22:48:44');
INSERT INTO `sys_oper_log` VALUES ('1901242309410004', '参数管理', '2', 'com.project.web.controller.system.ConfigController.editSave()', '1', 'admin', '1812121212120000', '若依科技', '/system/config/edit', '127.0.0.1', 'XX XX', '{  \"configId\" : [ \"1\" ],  \"configName\" : [ \"主框架页-默认皮肤样式名称\" ],  \"configKey\" : [ \"sys.index.skinName\" ],  \"configValue\" : [ \"skin-blue\" ],  \"configType\" : [ \"Y\" ],  \"remark\" : [ \"默认 skin-default、蓝色 skin-blue、黄色 skin-yellow\" ]}', '0', null, '2019-01-24 23:09:34');
INSERT INTO `sys_oper_log` VALUES ('1901242310390006', '通知公告', '1', 'com.project.web.controller.system.NoticeController.addSave()', '1', 'admin', '1812121212120000', '若依科技', '/system/notice/add', '127.0.0.1', 'XX XX', '{  \"noticeTitle\" : [ \"通知大家下雨收衣服啦\" ],  \"noticeType\" : [ \"2\" ],  \"noticeContent\" : [ \"<p><span style=\\\"background-color: yellow;\\\"><span style=\\\"font-weight: bold;\\\">士大夫人的身份，下雨啦</span></span><br></p>\" ],  \"status\" : [ \"0\" ]}', '0', null, '2019-01-24 23:10:33');
INSERT INTO `sys_oper_log` VALUES ('1901242312380008', '用户管理', '1', 'com.project.web.controller.system.UserController.addSave()', '1', 'admin', '1812121212120000', '若依科技', '/system/user/add', '127.0.0.1', 'XX XX', '{  \"deptId\" : [ \"1812121212120002\" ],  \"loginName\" : [ \"jmjjmj\" ],  \"userName\" : [ \"jmj\" ],  \"password\" : [ \"jmjjmj\" ],  \"email\" : [ \"\" ],  \"phonenumber\" : [ \"\" ],  \"sex\" : [ \"1\" ],  \"status\" : [ \"0\" ],  \"roleIds\" : [ \"1812120000000002\" ],  \"postIds\" : [ ', '0', null, '2019-01-24 23:12:32');
INSERT INTO `sys_oper_log` VALUES ('1901242314030010', '角色管理', '2', 'com.project.web.controller.system.RoleController.ruleSave()', '1', 'admin', '1812121212120000', '若依科技', '/system/role/rule', '127.0.0.1', 'XX XX', '{  \"roleId\" : [ \"1812120000000002\" ],  \"roleName\" : [ \"普通用户\" ],  \"roleKey\" : [ \"common\" ],  \"dataScope\" : [ \"3\" ],  \"deptIds\" : [ \"\" ]}', '0', null, '2019-01-24 23:13:56');
INSERT INTO `sys_oper_log` VALUES ('1901242317390011', '角色管理', '2', 'com.project.web.controller.system.RoleController.editSave()', '1', 'admin', '1812121212120000', '若依科技', '/system/role/edit', '127.0.0.1', 'XX XX', '{  \"roleId\" : [ \"1812120000000002\" ],  \"roleName\" : [ \"普通用户\" ],  \"roleKey\" : [ \"common\" ],  \"roleSort\" : [ \"1\" ],  \"status\" : [ \"0\" ],  \"remark\" : [ \"普通用户\" ],  \"menuIds\" : [ \"1,100,1000,1001,106,1029,1030,108,501,1042,1044,3,112\" ]}', '0', null, '2019-01-24 23:17:32');
INSERT INTO `sys_oper_log` VALUES ('1901251352130005', '定时任务', '2', 'com.project.web.controller.monitor.JobController.run()', '1', 'admin', '1812121212120000', '若依科技', '/monitor/job/run', '127.0.0.1', 'XX XX', '{  \"jobId\" : [ \"1\" ]}', '0', null, '2019-01-25 13:52:10');
INSERT INTO `sys_oper_log` VALUES ('1901251353270008', '定时任务', '2', 'com.project.web.controller.monitor.JobController.run()', '1', 'admin', '1812121212120000', '若依科技', '/monitor/job/run', '127.0.0.1', 'XX XX', '{  \"jobId\" : [ \"1\" ]}', '0', null, '2019-01-25 13:53:24');
INSERT INTO `sys_oper_log` VALUES ('1901251355530014', 'Excel导入-模版下载', '5', 'com.project.web.controller.system.ExcelImportController.downloadExcelModel()', '1', 'admin', '1812121212120000', '若依科技', '/system/excelImport/downloadExcelModel', '127.0.0.1', 'XX XX', '{  \"importType\" : [ \"1\" ]}', '0', null, '2019-01-25 13:55:50');
INSERT INTO `sys_oper_log` VALUES ('1901270048340003', '角色管理', '2', 'com.project.web.controller.system.RoleController.editSave()', '1', 'admin', null, null, '/system/role/edit', '127.0.0.1', 'XX XX', '{  \"roleId\" : [ \"1812120000000002\" ],  \"roleName\" : [ \"普通用户\" ],  \"roleKey\" : [ \"common\" ],  \"roleSort\" : [ \"1\" ],  \"status\" : [ \"0\" ],  \"remark\" : [ \"普通用户\" ],  \"menuIds\" : [ \"1,100,1000,1001,106,1029,1030,108,501,1042,1044,3,112,4,401,402\" ]}', '0', null, '2019-01-27 00:48:23');
INSERT INTO `sys_oper_log` VALUES ('1901270050320004', '角色管理', '2', 'com.project.web.controller.system.RoleController.editSave()', '1', 'admin', null, null, '/system/role/edit', '127.0.0.1', 'XX XX', '{  \"roleId\" : [ \"1812120000000002\" ],  \"roleName\" : [ \"普通用户\" ],  \"roleKey\" : [ \"common\" ],  \"roleSort\" : [ \"1\" ],  \"status\" : [ \"0\" ],  \"remark\" : [ \"普通用户\" ],  \"menuIds\" : [ \"1,100,1000,1001,106,1029,1030,108,501,1042,1044,4,401\" ]}', '0', null, '2019-01-27 00:50:21');
INSERT INTO `sys_oper_log` VALUES ('1901271033220000', '代码生成', '8', 'com.project.web.controller.tool.GenController.genCode()', '1', 'admin', null, null, '/tool/gen/genCode/family_base_info', '127.0.0.1', 'XX XX', '{ }', '0', null, '2019-01-27 10:33:21');
INSERT INTO `sys_oper_log` VALUES ('1901281615470001', '个人信息', '2', 'com.project.web.controller.system.ProfileController.update()', '1', 'admin', '1812121212120000', '若依科技', '/system/user/profile/update', '127.0.0.1', 'XX XX', '{  \"userId\" : [ \"1812120000000000\" ],  \"loginName\" : [ \"admin\" ],  \"dept.deptName\" : [ \"若依科技\" ],  \"userName\" : [ \"笑缘\" ],  \"email\" : [ \"281426107@qq.com\" ],  \"phonenumber\" : [ \"15237867818\" ],  \"sex\" : [ \"1\" ]}', '0', null, '2019-01-28 16:15:41');
INSERT INTO `sys_oper_log` VALUES ('1901281617060002', '个人信息', '2', 'com.project.web.controller.system.ProfileController.updateAvatar()', '1', 'admin', '1812121212120000', '若依科技', '/system/user/profile/updateAvatar', '127.0.0.1', 'XX XX', '{  \"userId\" : [ \"1812120000000000\" ]}', '0', null, '2019-01-28 16:17:00');
INSERT INTO `sys_oper_log` VALUES ('1901281617460003', '用户管理', '2', 'com.project.web.controller.system.UserController.editSave()', '1', 'admin', '1812121212120000', '若依科技', '/system/user/edit', '127.0.0.1', 'XX XX', '{  \"userId\" : [ \"1812120000000000\" ],  \"deptId\" : [ \"1812121212120000\" ],  \"userName\" : [ \"笑缘\" ],  \"email\" : [ \"281426107@qq.com\" ],  \"phonenumber\" : [ \"15237867818\" ],  \"sex\" : [ \"1\" ],  \"status\" : [ \"0\" ],  \"roleIds\" : [ \"1812120000000001\" ],  \"postIds\"', '0', null, '2019-01-28 16:17:40');
INSERT INTO `sys_oper_log` VALUES ('1901281617540004', '用户管理', '2', 'com.project.web.controller.system.UserController.editSave()', '1', 'admin', '1812121212120000', '若依科技', '/system/user/edit', '127.0.0.1', 'XX XX', '{  \"userId\" : [ \"1812120000000000\" ],  \"deptId\" : [ \"1812121212120000\" ],  \"userName\" : [ \"笑缘\" ],  \"email\" : [ \"281426107@qq.com\" ],  \"phonenumber\" : [ \"15237867818\" ],  \"sex\" : [ \"1\" ],  \"status\" : [ \"0\" ],  \"roleIds\" : [ \"1812120000000001\" ],  \"postIds\"', '0', null, '2019-01-28 16:17:48');
INSERT INTO `sys_oper_log` VALUES ('1901281618010005', '用户管理', '2', 'com.project.web.controller.system.UserController.editSave()', '1', 'admin', '1812121212120000', '若依科技', '/system/user/edit', '127.0.0.1', 'XX XX', '{  \"userId\" : [ \"1812120000000000\" ],  \"deptId\" : [ \"1812121212120000\" ],  \"userName\" : [ \"笑缘\" ],  \"email\" : [ \"281426107@qq.com\" ],  \"phonenumber\" : [ \"15237867818\" ],  \"sex\" : [ \"1\" ],  \"status\" : [ \"0\" ],  \"roleIds\" : [ \"1812120000000001\" ],  \"postIds\"', '0', null, '2019-01-28 16:17:55');
INSERT INTO `sys_oper_log` VALUES ('1901281650490000', '个人信息', '2', 'com.project.web.controller.system.ProfileController.updateAvatar()', '1', 'admin', '1812121212120000', '若依科技', '/system/user/profile/updateAvatar', '127.0.0.1', 'XX XX', '{  \"userId\" : [ \"1812120000000000\" ]}', '0', null, '2019-01-28 16:50:43');
INSERT INTO `sys_oper_log` VALUES ('1901281757430000', '个人信息', '2', 'com.project.web.controller.system.ProfileController.updateAvatar()', '1', 'admin', '1812121212120000', '若依科技', '/system/user/profile/updateAvatar', '127.0.0.1', 'XX XX', '{  \"userId\" : [ \"1812120000000000\" ]}', '0', null, '2019-01-28 17:57:37');
INSERT INTO `sys_oper_log` VALUES ('1901301645240000', '个人信息', '2', 'com.project.web.controller.system.ProfileController.updateAvatar()', '1', 'admin', '1812121212120000', '若依科技', '/system/user/profile/updateAvatar', '127.0.0.1', 'XX XX', '{  \"userId\" : [ \"1812120000000000\" ]}', '0', null, '2019-01-30 16:45:23');
INSERT INTO `sys_oper_log` VALUES ('1902111344450000', '系统响应时间统计记录', '3', 'com.project.web.controller.system.CostTimeController.remove()', '1', 'admin', '1812121212120000', '若依科技', '/system/costTime/remove', '127.0.0.1', 'XX XX', '{  \"ids\" : [ \"1901301456140000,1901301809210001,1901301520000002,1901301536030000,1901301553280000,1901301533290000,1901301516120001,1901301520180003,1901301505170000,1901301536520000,1901301534450001,1901301809360002,1901280034040001,1902021253110002,190', '0', null, '2019-02-11 13:44:37');

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post` (
  `post_id` bigint(16) NOT NULL COMMENT '岗位ID',
  `post_code` varchar(64) NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='岗位信息表';

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES ('1812121212120005', 'ceo', '系统开发工程师', '1', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` bigint(16) NOT NULL COMMENT '角色ID',
  `role_name` varchar(30) NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限）',
  `status` char(1) NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色信息表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1812120000000001', '内置管理员', 'admin', '1', '1', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '内置管理员');
INSERT INTO `sys_role` VALUES ('1812120000000002', '普通用户', 'common', '1', '3', '0', '0', 'common', '2018-03-16 11:33:00', 'admin', '2019-01-27 00:50:21', '普通用户');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept` (
  `role_id` bigint(16) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(16) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`,`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色和部门关联表';

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `role_id` bigint(16) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(16) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色和菜单关联表';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('1812120000000002', '1');
INSERT INTO `sys_role_menu` VALUES ('1812120000000002', '4');
INSERT INTO `sys_role_menu` VALUES ('1812120000000002', '100');
INSERT INTO `sys_role_menu` VALUES ('1812120000000002', '106');
INSERT INTO `sys_role_menu` VALUES ('1812120000000002', '108');
INSERT INTO `sys_role_menu` VALUES ('1812120000000002', '401');
INSERT INTO `sys_role_menu` VALUES ('1812120000000002', '501');
INSERT INTO `sys_role_menu` VALUES ('1812120000000002', '1000');
INSERT INTO `sys_role_menu` VALUES ('1812120000000002', '1001');
INSERT INTO `sys_role_menu` VALUES ('1812120000000002', '1029');
INSERT INTO `sys_role_menu` VALUES ('1812120000000002', '1030');
INSERT INTO `sys_role_menu` VALUES ('1812120000000002', '1042');
INSERT INTO `sys_role_menu` VALUES ('1812120000000002', '1044');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` bigint(16) NOT NULL COMMENT '用户ID',
  `dept_id` bigint(16) DEFAULT NULL COMMENT '部门ID',
  `login_name` varchar(30) NOT NULL COMMENT '登录账号',
  `user_name` varchar(30) NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) DEFAULT '' COMMENT '手机号码',
  `sex` char(1) DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) DEFAULT '' COMMENT '头像路径',
  `password` varchar(50) DEFAULT '' COMMENT '密码',
  `salt` varchar(20) DEFAULT '' COMMENT '盐加密',
  `status` char(1) DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(20) DEFAULT '' COMMENT '最后登陆IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登陆时间',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1812120000000000', '1812121212120000', 'admin', '笑缘', '00', '281426107@qq.com', '15237867818', '1', '365d41d739051409d47a8fa1d9bfdf18.jpg', '3d3e2e119996cedb7401025cced5c1b0', '111111', '0', '0', '127.0.0.1', '2019-02-18 17:21:00', 'admin', '2018-03-16 11:33:00', 'ry', '2019-02-18 17:20:58', '管理员');
INSERT INTO `sys_user` VALUES ('1901242312370007', '1812121212120002', 'jmjjmj', 'jmj', '00', '', '', '1', '', '1ea79922ef30079f9877d12d2b97f6ef', '800b33', '0', '0', '127.0.0.1', '2019-01-27 00:46:21', 'admin', '2019-01-24 23:12:31', '', '2019-01-27 00:46:09', '');

-- ----------------------------
-- Table structure for sys_user_copy
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_copy`;
CREATE TABLE `sys_user_copy` (
  `user_id` bigint(16) NOT NULL COMMENT '用户ID',
  `dept_id` bigint(16) DEFAULT NULL COMMENT '部门ID',
  `login_name` varchar(30) NOT NULL COMMENT '登录账号',
  `user_name` varchar(30) NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) DEFAULT '' COMMENT '手机号码',
  `sex` char(1) DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) DEFAULT '' COMMENT '头像路径',
  `password` varchar(50) DEFAULT '' COMMENT '密码',
  `salt` varchar(20) DEFAULT '' COMMENT '盐加密',
  `status` char(1) DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(20) DEFAULT '' COMMENT '最后登陆IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登陆时间',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- ----------------------------
-- Records of sys_user_copy
-- ----------------------------
INSERT INTO `sys_user_copy` VALUES ('1812120000000000', '1812121212120000', 'admin', '若依', '00', 'ry@163.com', '15888888888', '1', '', '3d3e2e119996cedb7401025cced5c1b0', '111111', '0', '0', '127.0.0.1', '2019-01-27 10:17:53', 'admin', '2018-03-16 11:33:00', 'ry', '2019-01-27 10:17:52', '管理员');
INSERT INTO `sys_user_copy` VALUES ('1901242312370007', '1812121212120002', 'jmjjmj', 'jmj', '00', '', '', '1', '', '1ea79922ef30079f9877d12d2b97f6ef', '800b33', '0', '0', '127.0.0.1', '2019-01-27 00:46:21', 'admin', '2019-01-24 23:12:31', '', '2019-01-27 00:46:09', '');

-- ----------------------------
-- Table structure for sys_user_online
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_online`;
CREATE TABLE `sys_user_online` (
  `sessionId` varchar(50) NOT NULL DEFAULT '' COMMENT '用户会话id',
  `login_name` varchar(50) DEFAULT '' COMMENT '登录账号',
  `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
  `ipaddr` varchar(50) DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) DEFAULT '' COMMENT '操作系统',
  `status` varchar(10) DEFAULT '' COMMENT '在线状态on_line在线off_line离线',
  `start_timestamp` datetime DEFAULT NULL COMMENT 'session创建时间',
  `last_access_time` datetime DEFAULT NULL COMMENT 'session最后访问时间',
  `expire_time` int(5) DEFAULT '0' COMMENT '超时时间，单位为分钟',
  PRIMARY KEY (`sessionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='在线用户记录';

-- ----------------------------
-- Records of sys_user_online
-- ----------------------------
INSERT INTO `sys_user_online` VALUES ('f36bbd20-ea7f-4372-aca5-b0796d30948c', 'admin', '笑缘项目', '127.0.0.1', 'XX XX', 'Firefox', 'Windows 7', 'on_line', '2019-02-18 17:20:56', '2019-02-18 17:21:01', '1800000');

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post` (
  `user_id` bigint(16) NOT NULL COMMENT '用户ID',
  `post_id` bigint(16) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`,`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户与岗位关联表';

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES ('1812120000000000', '1812121212120005');
INSERT INTO `sys_user_post` VALUES ('1901242312370007', '1812121212120005');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `user_id` bigint(16) NOT NULL COMMENT '用户ID',
  `role_id` bigint(16) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户和角色关联表';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1812120000000000', '1812120000000001');
INSERT INTO `sys_user_role` VALUES ('1901242312370007', '1812120000000002');
