/*
Navicat MySQL Data Transfer

Source Server         : phpstudy
Source Server Version : 50726
Source Host           : localhost:3306
Source Database       : self

Target Server Type    : MYSQL
Target Server Version : 50726
File Encoding         : 65001

Date: 2020-11-02 08:19:26
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `ea_mall_abc`
-- ----------------------------
DROP TABLE IF EXISTS `ea_mall_abc`;
CREATE TABLE `ea_mall_abc` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(20) NOT NULL COMMENT '分类名',
  `sort` int(11) DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '状态(1:禁用,2:启用)',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注说明',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  `score` int(11) DEFAULT '0' COMMENT '每天奖励积分',
  `dec` int(11) DEFAULT '0' COMMENT '违背扣除积分',
  `continuous` int(11) DEFAULT '0' COMMENT '连续',
  `member_id` int(11) DEFAULT '0' COMMENT '会员',
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='商品分类';

-- ----------------------------
-- Records of ea_mall_abc
-- ----------------------------

-- ----------------------------
-- Table structure for `ea_mall_cate`
-- ----------------------------
DROP TABLE IF EXISTS `ea_mall_cate`;
CREATE TABLE `ea_mall_cate` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(20) NOT NULL DEFAULT '' COMMENT '分类名',
  `sort` int(11) DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '状态(1:禁用,2:启用)',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注说明',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  `delete_time` int(11) DEFAULT NULL COMMENT '删除时间',
  `end_time` varchar(10) DEFAULT NULL COMMENT '过期时间',
  `score` int(11) DEFAULT '0' COMMENT '积分',
  `dec` int(11) DEFAULT '0' COMMENT '过期后每日扣除',
  `left` int(11) DEFAULT '0' COMMENT '剩余积分',
  `member_id` int(11) DEFAULT '0' COMMENT '会员',
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='商品分类';

-- ----------------------------
-- Records of ea_mall_cate
-- ----------------------------

-- ----------------------------
-- Table structure for `ea_mall_cate_score`
-- ----------------------------
DROP TABLE IF EXISTS `ea_mall_cate_score`;
CREATE TABLE `ea_mall_cate_score` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `remark` varchar(255) DEFAULT NULL COMMENT '备注说明',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  `score` int(11) DEFAULT '0' COMMENT '需要积分',
  `consume` int(11) DEFAULT '0' COMMENT '每日消耗积分',
  `cate_id` int(11) DEFAULT '0',
  `member_id` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5002 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='商品分类';

-- ----------------------------
-- Records of ea_mall_cate_score
-- ----------------------------

-- ----------------------------
-- Table structure for `ea_mall_daily`
-- ----------------------------
DROP TABLE IF EXISTS `ea_mall_daily`;
CREATE TABLE `ea_mall_daily` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `pid` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '父id',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '名称',
  `sort` int(11) DEFAULT '0' COMMENT '菜单排序',
  `score` int(11) unsigned NOT NULL DEFAULT '1' COMMENT '积分',
  `remark` varchar(255) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  `cate_id` int(11) DEFAULT NULL COMMENT '项目',
  `abc_id` int(11) DEFAULT NULL COMMENT '原则',
  `status` tinyint(11) DEFAULT '0' COMMENT '状态',
  `member_id` int(11) DEFAULT '0' COMMENT '会员',
  PRIMARY KEY (`id`),
  KEY `title` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=275 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='系统菜单表';

-- ----------------------------
-- Records of ea_mall_daily
-- ----------------------------

-- ----------------------------
-- Table structure for `ea_mall_desire`
-- ----------------------------
DROP TABLE IF EXISTS `ea_mall_desire`;
CREATE TABLE `ea_mall_desire` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(20) NOT NULL COMMENT '分类名',
  `sort` int(11) DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '状态(1:禁用,2:启用)',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注说明',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  `score` int(11) DEFAULT '0' COMMENT '连续',
  `member_id` int(11) DEFAULT '0' COMMENT '会员',
  `end_time` varchar(50) DEFAULT '' COMMENT '过期时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='商品分类';

-- ----------------------------
-- Records of ea_mall_desire
-- ----------------------------

-- ----------------------------
-- Table structure for `ea_mall_log`
-- ----------------------------
DROP TABLE IF EXISTS `ea_mall_log`;
CREATE TABLE `ea_mall_log` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `score` varchar(11) DEFAULT '0' COMMENT '积分',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  `daily_id` int(11) DEFAULT '0' COMMENT '项目',
  `member_id` int(11) DEFAULT '0' COMMENT '会员',
  `desire_id` int(11) DEFAULT '0' COMMENT '愿望',
  `remark` varchar(50) DEFAULT NULL,
  `score_id` int(11) DEFAULT '0' COMMENT '等级',
  `cate_id` int(11) DEFAULT '0' COMMENT '项目',
  `abc_id` int(11) DEFAULT '0' COMMENT '原则',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=277 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='系统菜单表';

-- ----------------------------
-- Records of ea_mall_log
-- ----------------------------
INSERT INTO `ea_mall_log` VALUES ('276', '-100', '1604240650', null, '0', '2', '0', '项目过期', '0', '12', '0');

-- ----------------------------
-- Table structure for `ea_mall_weight`
-- ----------------------------
DROP TABLE IF EXISTS `ea_mall_weight`;
CREATE TABLE `ea_mall_weight` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `remark` varchar(255) DEFAULT NULL COMMENT '备注说明',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `score` int(11) DEFAULT '0' COMMENT '积分',
  `member_id` int(11) DEFAULT '0' COMMENT '会员',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='商品分类';

-- ----------------------------
-- Records of ea_mall_weight
-- ----------------------------

-- ----------------------------
-- Table structure for `ea_system_admin`
-- ----------------------------
DROP TABLE IF EXISTS `ea_system_admin`;
CREATE TABLE `ea_system_admin` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `auth_ids` varchar(255) DEFAULT NULL COMMENT '角色权限ID',
  `head_img` varchar(255) DEFAULT NULL COMMENT '头像',
  `username` varchar(50) NOT NULL DEFAULT '' COMMENT '用户登录名',
  `password` char(40) NOT NULL DEFAULT '' COMMENT '用户登录密码',
  `phone` varchar(16) DEFAULT NULL COMMENT '联系手机号',
  `remark` varchar(255) DEFAULT '' COMMENT '备注说明',
  `login_num` bigint(20) unsigned DEFAULT '0' COMMENT '登录次数',
  `sort` int(11) DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态(0:禁用,1:启用,)',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  `delete_time` int(11) DEFAULT NULL COMMENT '删除时间',
  `score` int(11) DEFAULT '0' COMMENT '积分',
  `score_id` int(11) DEFAULT '0' COMMENT '积分等级',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`) USING BTREE,
  KEY `phone` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='系统用户表';

-- ----------------------------
-- Records of ea_system_admin
-- ----------------------------
INSERT INTO `ea_system_admin` VALUES ('1', null, '/static/admin/images/head.jpg', 'admin', 'ed696eb5bba1f7460585cc6975e6cf9bf24903dd', null, '', '2', '0', '1', '1603637785', '1603946497', null, '0', '0');
INSERT INTO `ea_system_admin` VALUES ('2', '7', 'http://www.self.com/upload/20201029/cea1c94a095954b95ee75a44c474e845.jpg', 'shinji', 'ed696eb5bba1f7460585cc6975e6cf9bf24903dd', '', '', '1', '0', '1', '1603948137', '1604211882', null, '-303', '0');
INSERT INTO `ea_system_admin` VALUES ('3', '7', 'https://lxn-99php.oss-cn-shenzhen.aliyuncs.com/upload/20191111/2c412adf1b30c8be3a913e603c7b6e4a.jpg', 'test', '', '', '', '0', '0', '1', '1604211945', '1604211945', null, '0', '0');

-- ----------------------------
-- Table structure for `ea_system_auth`
-- ----------------------------
DROP TABLE IF EXISTS `ea_system_auth`;
CREATE TABLE `ea_system_auth` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(20) NOT NULL COMMENT '权限名称',
  `sort` int(11) DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '状态(1:禁用,2:启用)',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注说明',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  `delete_time` int(11) DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='系统权限表';

-- ----------------------------
-- Records of ea_system_auth
-- ----------------------------
INSERT INTO `ea_system_auth` VALUES ('1', '管理员', '1', '1', '测试管理员', '1588921753', '1589614331', null);
INSERT INTO `ea_system_auth` VALUES ('7', '会员', '0', '1', '', '1603946820', '1603946820', null);

-- ----------------------------
-- Table structure for `ea_system_auth_node`
-- ----------------------------
DROP TABLE IF EXISTS `ea_system_auth_node`;
CREATE TABLE `ea_system_auth_node` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `auth_id` bigint(20) unsigned DEFAULT NULL COMMENT '角色ID',
  `node_id` bigint(20) DEFAULT NULL COMMENT '节点ID',
  PRIMARY KEY (`id`),
  KEY `index_system_auth_auth` (`auth_id`) USING BTREE,
  KEY `index_system_auth_node` (`node_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='角色与节点关系表';

-- ----------------------------
-- Records of ea_system_auth_node
-- ----------------------------
INSERT INTO `ea_system_auth_node` VALUES ('1', '6', '1');
INSERT INTO `ea_system_auth_node` VALUES ('2', '6', '2');
INSERT INTO `ea_system_auth_node` VALUES ('3', '6', '9');
INSERT INTO `ea_system_auth_node` VALUES ('4', '6', '12');
INSERT INTO `ea_system_auth_node` VALUES ('5', '6', '18');
INSERT INTO `ea_system_auth_node` VALUES ('6', '6', '19');
INSERT INTO `ea_system_auth_node` VALUES ('7', '6', '21');
INSERT INTO `ea_system_auth_node` VALUES ('8', '6', '22');
INSERT INTO `ea_system_auth_node` VALUES ('9', '6', '29');
INSERT INTO `ea_system_auth_node` VALUES ('10', '6', '30');
INSERT INTO `ea_system_auth_node` VALUES ('11', '6', '38');
INSERT INTO `ea_system_auth_node` VALUES ('12', '6', '39');
INSERT INTO `ea_system_auth_node` VALUES ('13', '6', '45');
INSERT INTO `ea_system_auth_node` VALUES ('14', '6', '46');
INSERT INTO `ea_system_auth_node` VALUES ('15', '6', '52');
INSERT INTO `ea_system_auth_node` VALUES ('16', '6', '53');
INSERT INTO `ea_system_auth_node` VALUES ('17', '7', '45');
INSERT INTO `ea_system_auth_node` VALUES ('18', '7', '46');
INSERT INTO `ea_system_auth_node` VALUES ('19', '7', '47');
INSERT INTO `ea_system_auth_node` VALUES ('20', '7', '48');
INSERT INTO `ea_system_auth_node` VALUES ('21', '7', '49');
INSERT INTO `ea_system_auth_node` VALUES ('22', '7', '50');
INSERT INTO `ea_system_auth_node` VALUES ('23', '7', '51');
INSERT INTO `ea_system_auth_node` VALUES ('24', '7', '69');
INSERT INTO `ea_system_auth_node` VALUES ('25', '7', '70');
INSERT INTO `ea_system_auth_node` VALUES ('26', '7', '71');
INSERT INTO `ea_system_auth_node` VALUES ('27', '7', '72');
INSERT INTO `ea_system_auth_node` VALUES ('28', '7', '73');
INSERT INTO `ea_system_auth_node` VALUES ('29', '7', '74');
INSERT INTO `ea_system_auth_node` VALUES ('30', '7', '75');
INSERT INTO `ea_system_auth_node` VALUES ('31', '7', '76');
INSERT INTO `ea_system_auth_node` VALUES ('32', '7', '77');
INSERT INTO `ea_system_auth_node` VALUES ('33', '7', '78');
INSERT INTO `ea_system_auth_node` VALUES ('34', '7', '79');
INSERT INTO `ea_system_auth_node` VALUES ('35', '7', '80');
INSERT INTO `ea_system_auth_node` VALUES ('36', '7', '81');
INSERT INTO `ea_system_auth_node` VALUES ('37', '7', '82');
INSERT INTO `ea_system_auth_node` VALUES ('38', '7', '83');
INSERT INTO `ea_system_auth_node` VALUES ('39', '7', '84');
INSERT INTO `ea_system_auth_node` VALUES ('40', '7', '85');
INSERT INTO `ea_system_auth_node` VALUES ('41', '7', '86');
INSERT INTO `ea_system_auth_node` VALUES ('42', '7', '87');
INSERT INTO `ea_system_auth_node` VALUES ('43', '7', '88');
INSERT INTO `ea_system_auth_node` VALUES ('44', '7', '89');
INSERT INTO `ea_system_auth_node` VALUES ('45', '7', '90');
INSERT INTO `ea_system_auth_node` VALUES ('46', '7', '91');
INSERT INTO `ea_system_auth_node` VALUES ('47', '7', '92');
INSERT INTO `ea_system_auth_node` VALUES ('48', '7', '93');
INSERT INTO `ea_system_auth_node` VALUES ('49', '7', '94');
INSERT INTO `ea_system_auth_node` VALUES ('50', '7', '95');
INSERT INTO `ea_system_auth_node` VALUES ('51', '7', '96');
INSERT INTO `ea_system_auth_node` VALUES ('52', '7', '97');
INSERT INTO `ea_system_auth_node` VALUES ('53', '7', '98');
INSERT INTO `ea_system_auth_node` VALUES ('54', '7', '99');
INSERT INTO `ea_system_auth_node` VALUES ('55', '7', '100');
INSERT INTO `ea_system_auth_node` VALUES ('56', '7', '101');
INSERT INTO `ea_system_auth_node` VALUES ('57', '7', '102');
INSERT INTO `ea_system_auth_node` VALUES ('58', '7', '103');
INSERT INTO `ea_system_auth_node` VALUES ('59', '7', '104');
INSERT INTO `ea_system_auth_node` VALUES ('60', '7', '105');
INSERT INTO `ea_system_auth_node` VALUES ('61', '7', '106');
INSERT INTO `ea_system_auth_node` VALUES ('62', '7', '107');
INSERT INTO `ea_system_auth_node` VALUES ('63', '7', '108');
INSERT INTO `ea_system_auth_node` VALUES ('64', '7', '109');
INSERT INTO `ea_system_auth_node` VALUES ('65', '7', '110');
INSERT INTO `ea_system_auth_node` VALUES ('66', '7', '111');
INSERT INTO `ea_system_auth_node` VALUES ('67', '7', '112');
INSERT INTO `ea_system_auth_node` VALUES ('68', '7', '113');
INSERT INTO `ea_system_auth_node` VALUES ('69', '7', '114');
INSERT INTO `ea_system_auth_node` VALUES ('70', '7', '115');
INSERT INTO `ea_system_auth_node` VALUES ('71', '7', '116');
INSERT INTO `ea_system_auth_node` VALUES ('72', '7', '117');
INSERT INTO `ea_system_auth_node` VALUES ('73', '7', '118');

-- ----------------------------
-- Table structure for `ea_system_config`
-- ----------------------------
DROP TABLE IF EXISTS `ea_system_config`;
CREATE TABLE `ea_system_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '变量名',
  `group` varchar(30) NOT NULL DEFAULT '' COMMENT '分组',
  `value` text COMMENT '变量值',
  `remark` varchar(100) DEFAULT '' COMMENT '备注信息',
  `sort` int(10) DEFAULT '0',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `group` (`group`)
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='系统配置表';

-- ----------------------------
-- Records of ea_system_config
-- ----------------------------
INSERT INTO `ea_system_config` VALUES ('41', 'alisms_access_key_id', 'sms', '填你的', '阿里大于公钥', '0', null, null);
INSERT INTO `ea_system_config` VALUES ('42', 'alisms_access_key_secret', 'sms', '填你的', '阿里大鱼私钥', '0', null, null);
INSERT INTO `ea_system_config` VALUES ('55', 'upload_type', 'upload', 'local', '当前上传方式 （local,alioss,qnoss,txoss）', '0', null, null);
INSERT INTO `ea_system_config` VALUES ('56', 'upload_allow_ext', 'upload', 'doc,gif,ico,icon,jpg,mp3,mp4,p12,pem,png,rar,jpeg', '允许上传的文件类型', '0', null, null);
INSERT INTO `ea_system_config` VALUES ('57', 'upload_allow_size', 'upload', '1024000', '允许上传的大小', '0', null, null);
INSERT INTO `ea_system_config` VALUES ('58', 'upload_allow_mime', 'upload', 'image/gif,image/jpeg,video/x-msvideo,text/plain,image/png', '允许上传的文件mime', '0', null, null);
INSERT INTO `ea_system_config` VALUES ('59', 'upload_allow_type', 'upload', 'local,alioss,qnoss,txcos', '可用的上传文件方式', '0', null, null);
INSERT INTO `ea_system_config` VALUES ('60', 'alioss_access_key_id', 'upload', '填你的', '阿里云oss公钥', '0', null, null);
INSERT INTO `ea_system_config` VALUES ('61', 'alioss_access_key_secret', 'upload', '填你的', '阿里云oss私钥', '0', null, null);
INSERT INTO `ea_system_config` VALUES ('62', 'alioss_endpoint', 'upload', '填你的', '阿里云oss数据中心', '0', null, null);
INSERT INTO `ea_system_config` VALUES ('63', 'alioss_bucket', 'upload', '填你的', '阿里云oss空间名称', '0', null, null);
INSERT INTO `ea_system_config` VALUES ('64', 'alioss_domain', 'upload', '填你的', '阿里云oss访问域名', '0', null, null);
INSERT INTO `ea_system_config` VALUES ('65', 'logo_title', 'site', 'EasyAdmin', 'LOGO标题', '0', null, null);
INSERT INTO `ea_system_config` VALUES ('66', 'logo_image', 'site', '/favicon.ico', 'logo图片', '0', null, null);
INSERT INTO `ea_system_config` VALUES ('68', 'site_name', 'site', '自我管理系统', '站点名称', '0', null, null);
INSERT INTO `ea_system_config` VALUES ('69', 'site_ico', 'site', 'https://lxn-99php.oss-cn-shenzhen.aliyuncs.com/upload/20191111/7d32671f4c1d1b01b0b28f45205763f9.ico', '浏览器图标', '0', null, null);
INSERT INTO `ea_system_config` VALUES ('70', 'site_copyright', 'site', '©版权所有 2014-2018 叁贰柒工作室66', '版权信息', '0', null, null);
INSERT INTO `ea_system_config` VALUES ('71', 'site_beian', 'site', '粤ICP备16006642号-2', '备案信息', '0', null, null);
INSERT INTO `ea_system_config` VALUES ('72', 'site_version', 'site', '2.0.0', '版本信息', '0', null, null);
INSERT INTO `ea_system_config` VALUES ('75', 'sms_type', 'sms', 'alisms', '短信类型', '0', null, null);
INSERT INTO `ea_system_config` VALUES ('76', 'miniapp_appid', 'wechat', '填你的', '小程序公钥', '0', null, null);
INSERT INTO `ea_system_config` VALUES ('77', 'miniapp_appsecret', 'wechat', '填你的', '小程序私钥', '0', null, null);
INSERT INTO `ea_system_config` VALUES ('78', 'web_appid', 'wechat', '填你的', '公众号公钥', '0', null, null);
INSERT INTO `ea_system_config` VALUES ('79', 'web_appsecret', 'wechat', '填你的', '公众号私钥', '0', null, null);
INSERT INTO `ea_system_config` VALUES ('80', 'txcos_secret_id', 'upload', '填你的', '腾讯云cos密钥', '0', null, null);
INSERT INTO `ea_system_config` VALUES ('81', 'txcos_secret_key', 'upload', '填你的', '腾讯云cos私钥', '0', null, null);
INSERT INTO `ea_system_config` VALUES ('82', 'txcos_region', 'upload', '填你的', '存储桶地域', '0', null, null);
INSERT INTO `ea_system_config` VALUES ('83', 'tecos_bucket', 'upload', '填你的', '存储桶名称', '0', null, null);
INSERT INTO `ea_system_config` VALUES ('84', 'qnoss_access_key', 'upload', '填你的', '访问密钥', '0', null, null);
INSERT INTO `ea_system_config` VALUES ('85', 'qnoss_secret_key', 'upload', '填你的', '安全密钥', '0', null, null);
INSERT INTO `ea_system_config` VALUES ('86', 'qnoss_bucket', 'upload', '填你的', '存储空间', '0', null, null);
INSERT INTO `ea_system_config` VALUES ('87', 'qnoss_domain', 'upload', '填你的', '访问域名', '0', null, null);

-- ----------------------------
-- Table structure for `ea_system_log_202010`
-- ----------------------------
DROP TABLE IF EXISTS `ea_system_log_202010`;
CREATE TABLE `ea_system_log_202010` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `admin_id` int(10) unsigned DEFAULT '0' COMMENT '管理员ID',
  `url` varchar(1500) NOT NULL DEFAULT '' COMMENT '操作页面',
  `method` varchar(50) NOT NULL COMMENT '请求方法',
  `title` varchar(100) DEFAULT '' COMMENT '日志标题',
  `content` text NOT NULL COMMENT '内容',
  `ip` varchar(50) NOT NULL DEFAULT '' COMMENT 'IP',
  `useragent` varchar(255) DEFAULT '' COMMENT 'User-Agent',
  `create_time` int(10) DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=803 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='后台操作日志表 - 202010';

-- ----------------------------
-- Records of ea_system_log_202010
-- ----------------------------
INSERT INTO `ea_system_log_202010` VALUES ('630', null, '/admin/login/index.html', 'post', '', '{\"username\":\"admin\",\"password\":\"ed696eb5bba1f7460585cc6975e6cf9bf24903dd\",\"captcha\":\"tbsj\",\"keep_login\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1603637873');
INSERT INTO `ea_system_log_202010` VALUES ('631', null, '/admin/login/index.html', 'post', '', '{\"username\":\"admin\",\"password\":\"ed696eb5bba1f7460585cc6975e6cf9bf24903dd\",\"captcha\":\"wr2a\",\"keep_login\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1603946497');
INSERT INTO `ea_system_log_202010` VALUES ('632', '1', '/admin/system.uploadfile/delete', 'post', '', '{\"id\":[\"302\",\"301\",\"300\",\"299\",\"298\",\"297\",\"296\",\"291\"]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1603946555');
INSERT INTO `ea_system_log_202010` VALUES ('633', '1', '/admin/system.auth/add', 'post', '', '{\"title\":\"会员\",\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1603946820');
INSERT INTO `ea_system_log_202010` VALUES ('634', '1', '/admin/system.menu/edit?id=249', 'post', '', '{\"id\":\"249\",\"pid\":\"0\",\"title\":\"自我管理\",\"href\":\"\",\"icon\":\"fa fa-list\",\"target\":\"_self\",\"sort\":\"0\",\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1603947043');
INSERT INTO `ea_system_log_202010` VALUES ('635', '1', '/admin/system.menu/edit?id=250', 'post', '', '{\"id\":\"250\",\"pid\":\"249\",\"title\":\"等级\",\"href\":\"mall.cate\\/index\",\"icon\":\"fa fa-calendar-check-o\",\"target\":\"_self\",\"sort\":\"0\",\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1603947103');
INSERT INTO `ea_system_log_202010` VALUES ('636', '1', '/admin/system.menu/edit?id=250', 'post', '', '{\"id\":\"250\",\"pid\":\"249\",\"title\":\"等级管理\",\"href\":\"mall.cate\\/index\",\"icon\":\"fa fa-calendar-check-o\",\"target\":\"_self\",\"sort\":\"0\",\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1603947143');
INSERT INTO `ea_system_log_202010` VALUES ('637', '1', '/admin/system.menu/edit?id=251', 'post', '', '{\"id\":\"251\",\"pid\":\"249\",\"title\":\"日志管理\",\"href\":\"mall.goods\\/index\",\"icon\":\"fa fa-list\",\"target\":\"_self\",\"sort\":\"0\",\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1603947154');
INSERT INTO `ea_system_log_202010` VALUES ('638', '1', '/admin/mall.cate/edit?id=9', 'post', '', '{\"id\":\"9\",\"title\":\"SVIP0\",\"sort\":\"0\",\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1603947522');
INSERT INTO `ea_system_log_202010` VALUES ('639', '1', '/admin/mall.cate/edit?id=9', 'post', '', '{\"id\":\"9\",\"title\":\"SVIP0\",\"sort\":\"0\",\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1603947533');
INSERT INTO `ea_system_log_202010` VALUES ('640', '1', '/admin/mall.cate/edit?id=9', 'post', '', '{\"id\":\"9\",\"title\":\"SVIP0\",\"sort\":\"0\",\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1603947716');
INSERT INTO `ea_system_log_202010` VALUES ('641', '1', '/admin/mall.cate/add', 'post', '', '{\"title\":\"SVIP1\",\"sort\":\"0\",\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1603947734');
INSERT INTO `ea_system_log_202010` VALUES ('642', '1', '/admin/mall.cate/add', 'post', '', '{\"title\":\"SVIP2\",\"sort\":\"0\",\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1603947743');
INSERT INTO `ea_system_log_202010` VALUES ('643', '1', '/admin/mall.cate/add', 'post', '', '{\"title\":\"SVIP3\",\"sort\":\"0\",\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1603947752');
INSERT INTO `ea_system_log_202010` VALUES ('644', '1', '/admin/ajax/upload', 'post', '', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1603948113');
INSERT INTO `ea_system_log_202010` VALUES ('645', '1', '/admin/system.admin/add', 'post', '', '{\"head_img\":\"http:\\/\\/www.self.com\\/upload\\/20201029\\/cea1c94a095954b95ee75a44c474e845.jpg\",\"file\":\"\",\"username\":\"shinji\",\"phone\":\"\",\"auth_ids\":{\"7\":\"on\"},\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1603948137');
INSERT INTO `ea_system_log_202010` VALUES ('646', '1', '/admin/system.config/save', 'post', '', '{\"site_name\":\"自我管理系统\",\"site_ico\":\"https:\\/\\/lxn-99php.oss-cn-shenzhen.aliyuncs.com\\/upload\\/20191111\\/7d32671f4c1d1b01b0b28f45205763f9.ico\",\"file\":\"\",\"site_version\":\"2.0.0\",\"site_beian\":\"粤ICP备16006642号-2\",\"site_copyright\":\"©版权所有 2014-2018 叁贰柒工作室66\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1603949486');
INSERT INTO `ea_system_log_202010` VALUES ('647', '1', '/admin/system.menu/add?id=249', 'post', '', '{\"id\":\"249\",\"pid\":\"249\",\"title\":\"积分管理\",\"href\":\"system.menu\\/index\",\"icon\":\"fa fa-list\",\"target\":\"_self\",\"sort\":\"0\",\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1603949557');
INSERT INTO `ea_system_log_202010` VALUES ('648', '1', '/admin/system.menu/edit?id=254', 'post', '', '{\"id\":\"254\",\"pid\":\"249\",\"title\":\"积分管理\",\"href\":\"mall.score\\/index\",\"icon\":\"fa fa-list\",\"target\":\"_self\",\"sort\":\"0\",\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1603949576');
INSERT INTO `ea_system_log_202010` VALUES ('649', '1', '/admin/mall.score/modify', 'post', '', '{\"id\":\"4000\",\"field\":\"score\",\"value\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1603977618');
INSERT INTO `ea_system_log_202010` VALUES ('650', '1', '/admin/mall.score/modify', 'post', '', '{\"id\":\"2000\",\"field\":\"score\",\"value\":\"111\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1603977674');
INSERT INTO `ea_system_log_202010` VALUES ('651', '1', '/admin/mall.score/modify', 'post', '', '{\"id\":\"2000\",\"field\":\"consume\",\"value\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1603977677');
INSERT INTO `ea_system_log_202010` VALUES ('652', '1', '/admin/mall.score/modify', 'post', '', '{\"id\":\"1000\",\"field\":\"remark\",\"value\":\"222\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1603977681');
INSERT INTO `ea_system_log_202010` VALUES ('653', '1', '/admin/system.menu/delete?id=250', 'post', '', '{\"id\":\"250\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1603977751');
INSERT INTO `ea_system_log_202010` VALUES ('654', '1', '/admin/mall.score/delete?id=2000', 'post', '', '{\"id\":\"2000\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1603977805');
INSERT INTO `ea_system_log_202010` VALUES ('655', '1', '/admin/mall.score/modify', 'post', '', '{\"id\":\"1000\",\"field\":\"score\",\"value\":\"1000\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1603977871');
INSERT INTO `ea_system_log_202010` VALUES ('656', '1', '/admin/mall.score/modify', 'post', '', '{\"id\":\"1000\",\"field\":\"remark\",\"value\":\"1111\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1603977875');
INSERT INTO `ea_system_log_202010` VALUES ('657', '1', '/admin/mall.score/delete?id=1000', 'post', '', '{\"id\":\"1000\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1603977877');
INSERT INTO `ea_system_log_202010` VALUES ('658', '1', '/admin/mall.score/modify', 'post', '', '{\"id\":\"1000\",\"field\":\"score\",\"value\":\"1000\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1603977999');
INSERT INTO `ea_system_log_202010` VALUES ('659', '1', '/admin/system.menu/add?id=249', 'post', '', '{\"id\":\"249\",\"pid\":\"249\",\"title\":\"项目管理\",\"href\":\"mall.cate\\/index\",\"icon\":\"fa fa-list\",\"target\":\"_self\",\"sort\":\"0\",\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1603978076');
INSERT INTO `ea_system_log_202010` VALUES ('660', '1', '/admin/mall.cate/edit?id=12', 'post', '', '{\"id\":\"12\",\"title\":\"SVIP3\",\"sort\":\"0\",\"end_time\":\"2020-10-31\",\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1603980009');
INSERT INTO `ea_system_log_202010` VALUES ('661', '1', '/admin/mall.cate/edit?id=12', 'post', '', '{\"id\":\"12\",\"title\":\"SVIP3\",\"sort\":\"0\",\"end_time\":\"2020-10-31\",\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1603980068');
INSERT INTO `ea_system_log_202010` VALUES ('662', '1', '/admin/mall.cate/edit?id=12', 'post', '', '{\"id\":\"12\",\"title\":\"SVIP3\",\"sort\":\"0\",\"end_time\":\"2020-10-31\",\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1603980071');
INSERT INTO `ea_system_log_202010` VALUES ('663', '1', '/admin/mall.cate/edit?id=12', 'post', '', '{\"id\":\"12\",\"title\":\"SVIP3\",\"sort\":\"0\",\"end_time\":\"2020-10-31\",\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1603980077');
INSERT INTO `ea_system_log_202010` VALUES ('664', '1', '/admin/mall.cate/edit?id=12', 'post', '', '{\"id\":\"12\",\"title\":\"SVIP3\",\"sort\":\"0\",\"end_time\":\"2020-10-31\",\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1603980300');
INSERT INTO `ea_system_log_202010` VALUES ('665', '1', '/admin/mall.cate/edit?id=12', 'post', '', '{\"id\":\"12\",\"title\":\"SVIP3\",\"sort\":\"0\",\"end_time\":\"2020-10-31\",\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1603980335');
INSERT INTO `ea_system_log_202010` VALUES ('666', '1', '/admin/mall.cate/edit?id=12', 'post', '', '{\"id\":\"12\",\"title\":\"SVIP3\",\"sort\":\"0\",\"end_time\":\"2020-10-31\",\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1603980384');
INSERT INTO `ea_system_log_202010` VALUES ('667', '1', '/admin/mall.cate/edit?id=12', 'post', '', '{\"id\":\"12\",\"title\":\"SVIP3\",\"sort\":\"0\",\"end_time\":\"2020-10-31\",\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1603980459');
INSERT INTO `ea_system_log_202010` VALUES ('668', '1', '/admin/mall.cate/edit?id=12', 'post', '', '{\"id\":\"12\",\"title\":\"SVIP3\",\"sort\":\"0\",\"end_time\":\"2020-10-31\",\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1603980565');
INSERT INTO `ea_system_log_202010` VALUES ('669', '1', '/admin/mall.cate/modify', 'post', '', '{\"id\":\"12\",\"field\":\"dec\",\"value\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1603981466');
INSERT INTO `ea_system_log_202010` VALUES ('670', '1', '/admin/mall.cate/modify', 'post', '', '{\"id\":\"12\",\"field\":\"dec\",\"value\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1603981571');
INSERT INTO `ea_system_log_202010` VALUES ('671', '1', '/admin/system.menu/add?id=249', 'post', '', '{\"id\":\"249\",\"pid\":\"249\",\"title\":\"原则管理\",\"href\":\"\",\"icon\":\"fa fa-list\",\"target\":\"_self\",\"sort\":\"0\",\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1603981721');
INSERT INTO `ea_system_log_202010` VALUES ('672', '1', '/admin/system.menu/edit?id=256', 'post', '', '{\"id\":\"256\",\"pid\":\"249\",\"title\":\"原则管理\",\"href\":\"mall.abc\\/index\",\"icon\":\"fa fa-list\",\"target\":\"_self\",\"sort\":\"0\",\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1603982048');
INSERT INTO `ea_system_log_202010` VALUES ('673', '1', '/admin/mall.abc/modify', 'post', '', '{\"id\":\"12\",\"field\":\"score\",\"value\":\"10\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1603983213');
INSERT INTO `ea_system_log_202010` VALUES ('674', '1', '/admin/system.menu/add?id=249', 'post', '', '{\"id\":\"249\",\"pid\":\"249\",\"title\":\"日常管理\",\"href\":\"mall.daily\\/index\",\"icon\":\"fa fa-list\",\"target\":\"_self\",\"sort\":\"0\",\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1603984035');
INSERT INTO `ea_system_log_202010` VALUES ('675', '1', '/admin/mall.daily/delete?id=257', 'post', '', '{\"id\":\"257\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1603989922');
INSERT INTO `ea_system_log_202010` VALUES ('676', '1', '/admin/mall.daily/add?id=259', 'post', '', '{\"id\":\"259\",\"pid\":\"0\",\"title\":\"完成自我修养系统\",\"sort\":\"0\",\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1603995891');
INSERT INTO `ea_system_log_202010` VALUES ('677', '1', '/admin/mall.daily/add?id=259', 'post', '', '{\"id\":\"259\",\"pid\":\"0\",\"title\":\"完成自我修养系统\",\"sort\":\"0\",\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1603995920');
INSERT INTO `ea_system_log_202010` VALUES ('678', '1', '/admin/mall.abc/add', 'post', '', '{\"title\":\"不能手淫\",\"sort\":\"0\",\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1603996117');
INSERT INTO `ea_system_log_202010` VALUES ('679', '1', '/admin/mall.abc/delete?id=9', 'post', '', '{\"id\":\"9\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1603996126');
INSERT INTO `ea_system_log_202010` VALUES ('680', '1', '/admin/mall.abc/delete?id=10', 'post', '', '{\"id\":\"10\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1603996130');
INSERT INTO `ea_system_log_202010` VALUES ('681', '1', '/admin/mall.abc/delete?id=11', 'post', '', '{\"id\":\"11\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1603996136');
INSERT INTO `ea_system_log_202010` VALUES ('682', '1', '/admin/mall.abc/delete?id=12', 'post', '', '{\"id\":\"12\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1603996140');
INSERT INTO `ea_system_log_202010` VALUES ('683', '1', '/admin/mall.abc/modify', 'post', '', '{\"id\":\"13\",\"field\":\"score\",\"value\":\"10\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1603996146');
INSERT INTO `ea_system_log_202010` VALUES ('684', '1', '/admin/mall.abc/modify', 'post', '', '{\"id\":\"13\",\"field\":\"dec\",\"value\":\"100\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1603996156');
INSERT INTO `ea_system_log_202010` VALUES ('685', '1', '/admin/mall.abc/modify', 'post', '', '{\"id\":\"13\",\"field\":\"dec\",\"value\":\"400\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1603996170');
INSERT INTO `ea_system_log_202010` VALUES ('686', '1', '/admin/mall.cate/delete?id=9', 'post', '', '{\"id\":\"9\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1603996204');
INSERT INTO `ea_system_log_202010` VALUES ('687', '1', '/admin/mall.cate/delete?id=10', 'post', '', '{\"id\":\"10\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1603996208');
INSERT INTO `ea_system_log_202010` VALUES ('688', '1', '/admin/mall.cate/delete?id=11', 'post', '', '{\"id\":\"11\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1603996213');
INSERT INTO `ea_system_log_202010` VALUES ('689', '1', '/admin/mall.cate/edit?id=12', 'post', '', '{\"id\":\"12\",\"title\":\"自我计划系统\",\"sort\":\"0\",\"end_time\":\"2020-10-31\",\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1603996272');
INSERT INTO `ea_system_log_202010` VALUES ('690', '1', '/admin/mall.cate/modify', 'post', '', '{\"id\":\"12\",\"field\":\"score\",\"value\":\"500\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1603996295');
INSERT INTO `ea_system_log_202010` VALUES ('691', '1', '/admin/mall.cate/modify', 'post', '', '{\"id\":\"12\",\"field\":\"dec\",\"value\":\"100\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1603996300');
INSERT INTO `ea_system_log_202010` VALUES ('692', '1', '/admin/mall.cate/modify', 'post', '', '{\"id\":\"12\",\"field\":\"left\",\"value\":\"500\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1603996310');
INSERT INTO `ea_system_log_202010` VALUES ('693', '1', '/admin/mall.abc/add', 'post', '', '{\"title\":\"不浪费时间\",\"sort\":\"0\",\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1604032650');
INSERT INTO `ea_system_log_202010` VALUES ('694', '1', '/admin/mall.abc/modify', 'post', '', '{\"id\":\"14\",\"field\":\"score\",\"value\":\"20\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1604032657');
INSERT INTO `ea_system_log_202010` VALUES ('695', '1', '/admin/mall.abc/modify', 'post', '', '{\"id\":\"14\",\"field\":\"dec\",\"value\":\"50\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1604032662');
INSERT INTO `ea_system_log_202010` VALUES ('696', '1', '/admin/mall.cate/delete?id=9', 'post', '', '{\"id\":\"9\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1604034078');
INSERT INTO `ea_system_log_202010` VALUES ('697', '1', '/admin/mall.cate/delete?id=10', 'post', '', '{\"id\":\"10\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1604034083');
INSERT INTO `ea_system_log_202010` VALUES ('698', '1', '/admin/mall.cate/delete?id=11', 'post', '', '{\"id\":\"11\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1604034087');
INSERT INTO `ea_system_log_202010` VALUES ('699', '1', '/admin/mall.daily/add?id=260', 'post', '', '{\"id\":\"260\",\"pid\":\"260\",\"cate_id\":\"12\",\"abc_id\":\"0\",\"title\":\"日常管理修改\",\"score\":\"30\",\"sort\":\"0\",\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1604046329');
INSERT INTO `ea_system_log_202010` VALUES ('700', '1', '/admin/mall.daily/add?id=261', 'post', '', '{\"id\":\"261\",\"pid\":\"261\",\"cate_id\":\"12\",\"abc_id\":\"0\",\"title\":\"小页面\",\"score\":\"0\",\"sort\":\"0\",\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1604047285');
INSERT INTO `ea_system_log_202010` VALUES ('701', '1', '/admin/mall.daily/add?id=262', 'post', '', '{\"id\":\"262\",\"pid\":\"262\",\"cate_id\":\"12\",\"abc_id\":\"0\",\"title\":\"小小页面\",\"score\":\"0\",\"sort\":\"0\",\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1604047304');
INSERT INTO `ea_system_log_202010` VALUES ('702', '1', '/admin/mall.daily/add?id=263', 'post', '', '{\"id\":\"263\",\"pid\":\"263\",\"cate_id\":\"12\",\"abc_id\":\"0\",\"title\":\"小小小页面\",\"score\":\"0\",\"sort\":\"0\",\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1604047332');
INSERT INTO `ea_system_log_202010` VALUES ('703', '1', '/admin/mall.daily/modify', 'post', '', '{\"id\":\"259\",\"field\":\"remark\",\"value\":\"111\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1604048028');
INSERT INTO `ea_system_log_202010` VALUES ('704', '1', '/admin/mall.daily/modify', 'post', '', '{\"id\":\"259\",\"field\":\"sort\",\"value\":\"01\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1604048032');
INSERT INTO `ea_system_log_202010` VALUES ('705', '1', '/admin/mall.daily/modify', 'post', '', '{\"id\":\"259\",\"field\":\"sort\",\"value\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1604048035');
INSERT INTO `ea_system_log_202010` VALUES ('706', '1', '/admin/mall.daily/done', 'post', '', '{\"id\":[\"264\"]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1604051131');
INSERT INTO `ea_system_log_202010` VALUES ('707', '1', '/admin/mall.daily/done', 'post', '', '{\"id\":[\"264\"]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1604051179');
INSERT INTO `ea_system_log_202010` VALUES ('708', '1', '/admin/mall.daily/done', 'post', '', '{\"id\":[\"264\"]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1604051216');
INSERT INTO `ea_system_log_202010` VALUES ('709', '1', '/admin/mall.daily/done', 'post', '', '{\"id\":[\"263\"]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1604052300');
INSERT INTO `ea_system_log_202010` VALUES ('710', '1', '/admin/mall.daily/done', 'post', '', '{\"id\":[\"263\",\"264\"]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1604054198');
INSERT INTO `ea_system_log_202010` VALUES ('711', '1', '/admin/mall.daily/done', 'post', '', '{\"id\":[\"263\",\"264\"]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1604054212');
INSERT INTO `ea_system_log_202010` VALUES ('712', '1', '/admin/mall.daily/done', 'post', '', '{\"id\":[\"263\",\"264\"]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1604054265');
INSERT INTO `ea_system_log_202010` VALUES ('713', '1', '/admin/mall.daily/done', 'post', '', '{\"id\":[\"263\",\"264\"]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1604054317');
INSERT INTO `ea_system_log_202010` VALUES ('714', '1', '/admin/mall.daily/done', 'post', '', '{\"id\":[\"263\",\"264\"]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1604054331');
INSERT INTO `ea_system_log_202010` VALUES ('715', '1', '/admin/mall.daily/done', 'post', '', '{\"id\":[\"263\",\"264\"]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1604054382');
INSERT INTO `ea_system_log_202010` VALUES ('716', '1', '/admin/mall.daily/done', 'post', '', '{\"id\":[\"263\",\"264\"]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1604054406');
INSERT INTO `ea_system_log_202010` VALUES ('717', '1', '/admin/mall.daily/done', 'post', '', '{\"id\":[\"263\",\"264\"]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1604061741');
INSERT INTO `ea_system_log_202010` VALUES ('718', '1', '/admin/mall.daily/done', 'post', '', '{\"id\":[\"263\",\"264\"]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1604061769');
INSERT INTO `ea_system_log_202010` VALUES ('719', '1', '/admin/system.menu/add?id=249', 'post', '', '{\"id\":\"249\",\"pid\":\"249\",\"title\":\"愿望清单\",\"href\":\"\",\"icon\":\"fa fa-list\",\"target\":\"_self\",\"sort\":\"0\",\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1604062003');
INSERT INTO `ea_system_log_202010` VALUES ('720', '1', '/admin/system.menu/add?id=249', 'post', '', '{\"id\":\"249\",\"pid\":\"249\",\"title\":\"仪表盘\",\"href\":\"\",\"icon\":\"fa fa-list\",\"target\":\"_self\",\"sort\":\"0\",\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1604062025');
INSERT INTO `ea_system_log_202010` VALUES ('721', '1', '/admin/system.menu/edit?id=251', 'post', '', '{\"id\":\"251\",\"pid\":\"249\",\"title\":\"积分流水\",\"href\":\"mall.goods\\/index\",\"icon\":\"fa fa-list\",\"target\":\"_self\",\"sort\":\"0\",\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1604062046');
INSERT INTO `ea_system_log_202010` VALUES ('722', '1', '/admin/mall.daily/done', 'post', '', '{\"id\":[\"263\",\"264\"]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1604070766');
INSERT INTO `ea_system_log_202010` VALUES ('723', '1', '/admin/mall.daily/done', 'post', '', '{\"id\":[\"263\",\"264\"]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1604070830');
INSERT INTO `ea_system_log_202010` VALUES ('724', '1', '/admin/mall.daily/done', 'post', '', '{\"id\":[\"263\",\"264\"]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1604070883');
INSERT INTO `ea_system_log_202010` VALUES ('725', '1', '/admin/mall.daily/done', 'post', '', '{\"id\":[\"263\",\"264\"]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1604071416');
INSERT INTO `ea_system_log_202010` VALUES ('726', '1', '/admin/mall.daily/done', 'post', '', '{\"id\":[\"263\",\"264\"]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1604071424');
INSERT INTO `ea_system_log_202010` VALUES ('727', '1', '/admin/mall.daily/done', 'post', '', '{\"id\":[\"263\",\"264\"]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1604071845');
INSERT INTO `ea_system_log_202010` VALUES ('728', '1', '/admin/mall.daily/done', 'post', '', '{\"id\":[\"263\",\"264\"]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1604071905');
INSERT INTO `ea_system_log_202010` VALUES ('729', '1', '/admin/mall.daily/done', 'post', '', '{\"id\":[\"263\",\"264\"]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1604073936');
INSERT INTO `ea_system_log_202010` VALUES ('730', '1', '/admin/mall.daily/done', 'post', '', '{\"id\":[\"263\",\"264\"]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1604073942');
INSERT INTO `ea_system_log_202010` VALUES ('731', '1', '/admin/mall.daily/done', 'post', '', '{\"id\":[\"263\",\"264\"]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1604073960');
INSERT INTO `ea_system_log_202010` VALUES ('732', '1', '/admin/mall.daily/done', 'post', '', '{\"id\":[\"263\",\"264\"]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1604073986');
INSERT INTO `ea_system_log_202010` VALUES ('733', '1', '/admin/mall.daily/done', 'post', '', '{\"id\":[\"261\",\"262\",\"263\",\"264\"]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1604074050');
INSERT INTO `ea_system_log_202010` VALUES ('734', '1', '/admin/mall.daily/done', 'post', '', '{\"id\":[\"261\",\"262\",\"263\",\"264\"]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1604074147');
INSERT INTO `ea_system_log_202010` VALUES ('735', '1', '/admin/mall.daily/done', 'post', '', '{\"id\":[\"261\",\"262\",\"263\",\"264\"]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1604074240');
INSERT INTO `ea_system_log_202010` VALUES ('736', '1', '/admin/mall.daily/done', 'post', '', '{\"id\":[\"261\",\"262\",\"263\",\"264\"]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1604074334');
INSERT INTO `ea_system_log_202010` VALUES ('737', '1', '/admin/mall.daily/done', 'post', '', '{\"id\":[\"261\",\"262\",\"263\",\"264\"]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1604074355');
INSERT INTO `ea_system_log_202010` VALUES ('738', '1', '/admin/mall.daily/done', 'post', '', '{\"id\":[\"261\",\"262\",\"263\",\"264\"]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1604074406');
INSERT INTO `ea_system_log_202010` VALUES ('739', '1', '/admin/mall.daily/done', 'post', '', '{\"id\":[\"260\",\"261\",\"262\",\"263\",\"264\"]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1604074698');
INSERT INTO `ea_system_log_202010` VALUES ('740', '1', '/admin/mall.daily/done', 'post', '', '{\"id\":[\"260\",\"261\",\"262\",\"263\",\"264\"]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1604074767');
INSERT INTO `ea_system_log_202010` VALUES ('741', '1', '/admin/mall.daily/done', 'post', '', '{\"id\":[\"260\",\"261\",\"262\",\"263\",\"264\"]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1604075045');
INSERT INTO `ea_system_log_202010` VALUES ('742', '1', '/admin/mall.daily/edit?id=265', 'post', '', '{\"id\":\"265\",\"pid\":\"0\",\"abc_id\":\"0\",\"cate_id\":\"0\",\"title\":\"2020-10-31\",\"score\":\"1\",\"sort\":\"0\",\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1604075103');
INSERT INTO `ea_system_log_202010` VALUES ('743', '1', '/admin/mall.daily/add?id=266', 'post', '', '{\"id\":\"266\",\"pid\":\"0\",\"abc_id\":\"13\",\"cate_id\":\"12\",\"title\":\"11111\",\"score\":\"0\",\"sort\":\"0\",\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1604075206');
INSERT INTO `ea_system_log_202010` VALUES ('744', '1', '/admin/mall.daily/edit?id=266', 'post', '', '{\"id\":\"266\",\"pid\":\"0\",\"abc_id\":\"0\",\"cate_id\":\"0\",\"title\":\"2020-10-31\",\"score\":\"1\",\"sort\":\"0\",\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1604075216');
INSERT INTO `ea_system_log_202010` VALUES ('745', '1', '/admin/mall.daily/edit?id=267', 'post', '', '{\"id\":\"267\",\"pid\":\"0\",\"abc_id\":\"13\",\"cate_id\":\"0\",\"title\":\"11111\",\"score\":\"0\",\"sort\":\"0\",\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1604075465');
INSERT INTO `ea_system_log_202010` VALUES ('746', '1', '/admin/mall.daily/edit?id=267', 'post', '', '{\"id\":\"267\",\"pid\":\"0\",\"abc_id\":\"13\",\"cate_id\":\"0\",\"title\":\"11111\",\"score\":\"1\",\"sort\":\"0\",\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1604075471');
INSERT INTO `ea_system_log_202010` VALUES ('747', '1', '/admin/mall.daily/edit?id=266', 'post', '', '{\"id\":\"266\",\"pid\":\"0\",\"abc_id\":\"0\",\"cate_id\":\"0\",\"title\":\"2020-10-31\",\"score\":\"1\",\"sort\":\"0\",\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1604075480');
INSERT INTO `ea_system_log_202010` VALUES ('748', '1', '/admin/mall.daily/edit?id=267', 'post', '', '{\"id\":\"267\",\"pid\":\"0\",\"member_id\":\"2\",\"cate_id\":\"0\",\"abc_id\":\"13\",\"title\":\"11111\",\"score\":\"1\",\"sort\":\"0\",\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1604077272');
INSERT INTO `ea_system_log_202010` VALUES ('749', '1', '/admin/system.menu/edit?id=251', 'post', '', '{\"id\":\"251\",\"pid\":\"249\",\"title\":\"积分流水\",\"href\":\"mall.log\\/index\",\"icon\":\"fa fa-list\",\"target\":\"_self\",\"sort\":\"0\",\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1604077311');
INSERT INTO `ea_system_log_202010` VALUES ('750', '1', '/admin/mall.daily/edit?id=268', 'post', '', '{\"id\":\"268\",\"pid\":\"0\",\"member_id\":\"2\",\"cate_id\":\"0\",\"abc_id\":\"0\",\"title\":\"2020-10-31\",\"score\":\"1\",\"sort\":\"0\",\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1604110527');
INSERT INTO `ea_system_log_202010` VALUES ('751', '1', '/admin/mall.daily/edit?id=269', 'post', '', '{\"id\":\"269\",\"pid\":\"0\",\"member_id\":\"2\",\"cate_id\":\"0\",\"abc_id\":\"0\",\"title\":\"2020-10-31\",\"score\":\"1\",\"sort\":\"0\",\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1604110561');
INSERT INTO `ea_system_log_202010` VALUES ('752', '1', '/admin/mall.daily/edit?id=269', 'post', '', '{\"id\":\"269\",\"pid\":\"0\",\"member_id\":\"2\",\"cate_id\":\"0\",\"abc_id\":\"0\",\"title\":\"2020-10-31\",\"score\":\"1\",\"sort\":\"0\",\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1604110572');
INSERT INTO `ea_system_log_202010` VALUES ('753', '1', '/admin/mall.daily/edit?id=268', 'post', '', '{\"id\":\"268\",\"pid\":\"0\",\"member_id\":\"2\",\"cate_id\":\"0\",\"abc_id\":\"0\",\"title\":\"2020-10-31\",\"score\":\"1\",\"sort\":\"0\",\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1604110579');
INSERT INTO `ea_system_log_202010` VALUES ('754', '1', '/admin/mall.daily/edit?id=271', 'post', '', '{\"id\":\"271\",\"pid\":\"0\",\"member_id\":\"2\",\"cate_id\":\"0\",\"abc_id\":\"0\",\"title\":\"2020-10-31\",\"score\":\"1\",\"sort\":\"0\",\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1604115365');
INSERT INTO `ea_system_log_202010` VALUES ('755', '1', '/admin/mall.daily/edit?id=272', 'post', '', '{\"id\":\"272\",\"pid\":\"0\",\"member_id\":\"2\",\"cate_id\":\"0\",\"abc_id\":\"0\",\"title\":\"2020-10-31\",\"score\":\"1\",\"sort\":\"0\",\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1604115722');
INSERT INTO `ea_system_log_202010` VALUES ('756', '1', '/admin/mall.daily/delete', 'post', '', '{\"id\":[\"271\"]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1604115731');
INSERT INTO `ea_system_log_202010` VALUES ('757', '1', '/admin/mall.daily/edit?id=272', 'post', '', '{\"id\":\"272\",\"pid\":\"0\",\"member_id\":\"2\",\"cate_id\":\"0\",\"abc_id\":\"0\",\"title\":\"2020-10-31\",\"score\":\"1\",\"sort\":\"0\",\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1604115738');
INSERT INTO `ea_system_log_202010` VALUES ('758', '1', '/admin/system.menu/edit?id=258', 'post', '', '{\"id\":\"258\",\"pid\":\"249\",\"title\":\"愿望清单\",\"href\":\"mall.desire\\/index\",\"icon\":\"fa fa-list\",\"target\":\"_self\",\"sort\":\"0\",\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1604116699');
INSERT INTO `ea_system_log_202010` VALUES ('759', '1', '/admin/mall.desire/modify', 'post', '', '{\"id\":\"14\",\"field\":\"status\",\"value\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1604117687');
INSERT INTO `ea_system_log_202010` VALUES ('760', '1', '/admin/mall.desire/modify', 'post', '', '{\"id\":\"14\",\"field\":\"status\",\"value\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1604117688');
INSERT INTO `ea_system_log_202010` VALUES ('761', '1', '/admin/mall.desire/edit?id=14', 'post', '', '{\"id\":\"14\",\"member_id\":\"2\",\"title\":\"不浪费时间\",\"end_time\":\"2020-10-31\",\"sort\":\"0\",\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1604118627');
INSERT INTO `ea_system_log_202010` VALUES ('762', '1', '/admin/mall.desire/modify', 'post', '', '{\"id\":\"14\",\"field\":\"status\",\"value\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1604118953');
INSERT INTO `ea_system_log_202010` VALUES ('763', '1', '/admin/mall.desire/modify', 'post', '', '{\"id\":\"14\",\"field\":\"status\",\"value\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1604118954');
INSERT INTO `ea_system_log_202010` VALUES ('764', '1', '/admin/mall.desire/modify', 'post', '', '{\"id\":\"14\",\"field\":\"status\",\"value\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1604118956');
INSERT INTO `ea_system_log_202010` VALUES ('765', '1', '/admin/mall.desire/modify', 'post', '', '{\"id\":\"14\",\"field\":\"status\",\"value\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1604119268');
INSERT INTO `ea_system_log_202010` VALUES ('766', '1', '/admin/mall.desire/modify', 'post', '', '{\"id\":\"14\",\"field\":\"status\",\"value\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1604119269');
INSERT INTO `ea_system_log_202010` VALUES ('767', '1', '/admin/mall.desire/modify', 'post', '', '{\"id\":\"14\",\"field\":\"status\",\"value\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1604119270');
INSERT INTO `ea_system_log_202010` VALUES ('768', '1', '/admin/mall.desire/modify', 'post', '', '{\"id\":\"14\",\"field\":\"status\",\"value\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1604119270');
INSERT INTO `ea_system_log_202010` VALUES ('769', '1', '/admin/mall.desire/modify', 'post', '', '{\"id\":\"14\",\"field\":\"status\",\"value\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1604119310');
INSERT INTO `ea_system_log_202010` VALUES ('770', '1', '/admin/mall.desire/modify', 'post', '', '{\"id\":\"14\",\"field\":\"status\",\"value\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1604119311');
INSERT INTO `ea_system_log_202010` VALUES ('771', '1', '/admin/mall.desire/modify', 'post', '', '{\"id\":\"14\",\"field\":\"status\",\"value\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1604119311');
INSERT INTO `ea_system_log_202010` VALUES ('772', '1', '/admin/mall.desire/modify', 'post', '', '{\"id\":\"14\",\"field\":\"status\",\"value\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1604119323');
INSERT INTO `ea_system_log_202010` VALUES ('773', '1', '/admin/mall.desire/modify', 'post', '', '{\"id\":\"14\",\"field\":\"status\",\"value\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1604119497');
INSERT INTO `ea_system_log_202010` VALUES ('774', '1', '/admin/mall.desire/modify', 'post', '', '{\"id\":\"13\",\"field\":\"score\",\"value\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1604120316');
INSERT INTO `ea_system_log_202010` VALUES ('775', '1', '/admin/mall.desire/modify', 'post', '', '{\"id\":\"13\",\"field\":\"status\",\"value\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1604120318');
INSERT INTO `ea_system_log_202010` VALUES ('776', '1', '/admin/mall.desire/modify', 'post', '', '{\"id\":\"13\",\"field\":\"status\",\"value\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1604120329');
INSERT INTO `ea_system_log_202010` VALUES ('777', '1', '/admin/mall.desire/modify', 'post', '', '{\"id\":\"13\",\"field\":\"status\",\"value\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1604120333');
INSERT INTO `ea_system_log_202010` VALUES ('778', '1', '/admin/mall.desire/modify', 'post', '', '{\"id\":\"13\",\"field\":\"status\",\"value\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1604120413');
INSERT INTO `ea_system_log_202010` VALUES ('779', '1', '/admin/mall.desire/modify', 'post', '', '{\"id\":\"13\",\"field\":\"status\",\"value\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1604120421');
INSERT INTO `ea_system_log_202010` VALUES ('780', '1', '/admin/mall.desire/modify', 'post', '', '{\"id\":\"13\",\"field\":\"status\",\"value\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1604121295');
INSERT INTO `ea_system_log_202010` VALUES ('781', '1', '/admin/mall.desire/modify', 'post', '', '{\"id\":\"13\",\"field\":\"status\",\"value\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1604121319');
INSERT INTO `ea_system_log_202010` VALUES ('782', '1', '/admin/mall.desire/modify', 'post', '', '{\"id\":\"13\",\"field\":\"status\",\"value\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1604121347');
INSERT INTO `ea_system_log_202010` VALUES ('783', '1', '/admin/mall.desire/modify', 'post', '', '{\"id\":\"13\",\"field\":\"status\",\"value\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1604121548');
INSERT INTO `ea_system_log_202010` VALUES ('784', '1', '/admin/mall.desire/modify', 'post', '', '{\"id\":\"13\",\"field\":\"status\",\"value\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1604121580');
INSERT INTO `ea_system_log_202010` VALUES ('785', '1', '/admin/mall.desire/modify', 'post', '', '{\"id\":\"13\",\"field\":\"status\",\"value\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1604121684');
INSERT INTO `ea_system_log_202010` VALUES ('786', '1', '/admin/mall.desire/modify', 'post', '', '{\"id\":\"13\",\"field\":\"status\",\"value\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1604121760');
INSERT INTO `ea_system_log_202010` VALUES ('787', '1', '/admin/mall.desire/modify', 'post', '', '{\"id\":\"13\",\"field\":\"status\",\"value\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1604122002');
INSERT INTO `ea_system_log_202010` VALUES ('788', '1', '/admin/mall.desire/modify', 'post', '', '{\"id\":\"13\",\"field\":\"status\",\"value\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1604122026');
INSERT INTO `ea_system_log_202010` VALUES ('789', '1', '/admin/mall.desire/modify', 'post', '', '{\"id\":\"13\",\"field\":\"status\",\"value\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1604122045');
INSERT INTO `ea_system_log_202010` VALUES ('790', '1', '/admin/mall.desire/modify', 'post', '', '{\"id\":\"13\",\"field\":\"status\",\"value\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1604122049');
INSERT INTO `ea_system_log_202010` VALUES ('791', '1', '/admin/mall.desire/modify', 'post', '', '{\"id\":\"13\",\"field\":\"status\",\"value\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1604122066');
INSERT INTO `ea_system_log_202010` VALUES ('792', '1', '/admin/mall.desire/modify', 'post', '', '{\"id\":\"13\",\"field\":\"status\",\"value\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1604122080');
INSERT INTO `ea_system_log_202010` VALUES ('793', '1', '/admin/mall.desire/modify', 'post', '', '{\"id\":\"13\",\"field\":\"status\",\"value\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1604122151');
INSERT INTO `ea_system_log_202010` VALUES ('794', '1', '/admin/mall.desire/modify', 'post', '', '{\"id\":\"13\",\"field\":\"status\",\"value\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1604122156');
INSERT INTO `ea_system_log_202010` VALUES ('795', '1', '/admin/mall.desire/modify', 'post', '', '{\"id\":\"13\",\"field\":\"status\",\"value\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1604122160');
INSERT INTO `ea_system_log_202010` VALUES ('796', '1', '/admin/mall.desire/modify', 'post', '', '{\"id\":\"13\",\"field\":\"status\",\"value\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1604122191');
INSERT INTO `ea_system_log_202010` VALUES ('797', '1', '/admin/mall.desire/modify', 'post', '', '{\"id\":\"13\",\"field\":\"status\",\"value\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1604122192');
INSERT INTO `ea_system_log_202010` VALUES ('798', '1', '/admin/mall.desire/modify', 'post', '', '{\"id\":\"13\",\"field\":\"status\",\"value\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1604122295');
INSERT INTO `ea_system_log_202010` VALUES ('799', '1', '/admin/mall.desire/modify', 'post', '', '{\"id\":\"13\",\"field\":\"status\",\"value\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1604122413');
INSERT INTO `ea_system_log_202010` VALUES ('800', '1', '/admin/mall.desire/modify', 'post', '', '{\"id\":\"13\",\"field\":\"status\",\"value\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1604122532');
INSERT INTO `ea_system_log_202010` VALUES ('801', '1', '/admin/mall.desire/modify', 'post', '', '{\"id\":\"13\",\"field\":\"status\",\"value\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1604123020');
INSERT INTO `ea_system_log_202010` VALUES ('802', '1', '/admin/mall.desire/modify', 'post', '', '{\"id\":\"13\",\"field\":\"status\",\"value\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1604123025');

-- ----------------------------
-- Table structure for `ea_system_log_202011`
-- ----------------------------
DROP TABLE IF EXISTS `ea_system_log_202011`;
CREATE TABLE `ea_system_log_202011` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `admin_id` int(10) unsigned DEFAULT '0' COMMENT '管理员ID',
  `url` varchar(1500) NOT NULL DEFAULT '' COMMENT '操作页面',
  `method` varchar(50) NOT NULL COMMENT '请求方法',
  `title` varchar(100) DEFAULT '' COMMENT '日志标题',
  `content` text NOT NULL COMMENT '内容',
  `ip` varchar(50) NOT NULL DEFAULT '' COMMENT 'IP',
  `useragent` varchar(255) DEFAULT '' COMMENT 'User-Agent',
  `create_time` int(10) DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=644 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='后台操作日志表 - 202011';

-- ----------------------------
-- Records of ea_system_log_202011
-- ----------------------------
INSERT INTO `ea_system_log_202011` VALUES ('630', '1', '/admin/system.menu/add?id=249', 'post', '', '{\"id\":\"249\",\"pid\":\"249\",\"title\":\"体重管理\",\"href\":\"\",\"icon\":\"fa fa-list\",\"target\":\"_self\",\"sort\":\"0\",\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1604196809');
INSERT INTO `ea_system_log_202011` VALUES ('631', '1', '/admin/system.menu/edit?id=260', 'post', '', '{\"id\":\"260\",\"pid\":\"249\",\"title\":\"体重管理\",\"href\":\"mall.weigth\\/index\",\"icon\":\"fa fa-list\",\"target\":\"_self\",\"sort\":\"0\",\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1604207758');
INSERT INTO `ea_system_log_202011` VALUES ('632', '1', '/admin/system.menu/edit?id=260', 'post', '', '{\"id\":\"260\",\"pid\":\"249\",\"title\":\"体重管理\",\"href\":\"mall.weight\\/index\",\"icon\":\"fa fa-list\",\"target\":\"_self\",\"sort\":\"0\",\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1604208506');
INSERT INTO `ea_system_log_202011` VALUES ('633', '1', '/admin/mall.weight/add', 'post', '', '{\"member_id\":\"2\",\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1604208531');
INSERT INTO `ea_system_log_202011` VALUES ('634', '1', '/admin/system.menu/edit?id=259', 'post', '', '{\"id\":\"259\",\"pid\":\"249\",\"title\":\"仪表盘\",\"href\":\"mall.dashboard\\/index\",\"icon\":\"fa fa-list\",\"target\":\"_self\",\"sort\":\"0\",\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1604208700');
INSERT INTO `ea_system_log_202011` VALUES ('635', '1', '/admin/system.node/refreshNode?force=1', 'post', '', '{\"force\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1604211704');
INSERT INTO `ea_system_log_202011` VALUES ('636', '1', '/admin/system.node/clearNode', 'post', '', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1604211710');
INSERT INTO `ea_system_log_202011` VALUES ('637', '1', '/admin/system.auth/saveAuthorize', 'post', '', '{\"title\":\"会员\",\"node\":\"[45,46,47,48,49,50,51,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118]\",\"id\":\"7\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1604211748');
INSERT INTO `ea_system_log_202011` VALUES ('638', '1', '/admin/system.admin/password?id=2', 'post', '', '{\"id\":\"2\",\"username\":\"shinji\",\"password\":\"ed696eb5bba1f7460585cc6975e6cf9bf24903dd\",\"password_again\":\"ed696eb5bba1f7460585cc6975e6cf9bf24903dd\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1604211778');
INSERT INTO `ea_system_log_202011` VALUES ('639', null, '/admin/login/index.html', 'post', '', '{\"username\":\"shinji\",\"password\":\"ed696eb5bba1f7460585cc6975e6cf9bf24903dd\",\"captcha\":\"vfjx\",\"keep_login\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.81 Safari/537.36 SE 2.X MetaSr 1.0', '1604211882');
INSERT INTO `ea_system_log_202011` VALUES ('640', '1', '/admin/system.admin/add', 'post', '', '{\"head_img\":\"https:\\/\\/lxn-99php.oss-cn-shenzhen.aliyuncs.com\\/upload\\/20191111\\/2c412adf1b30c8be3a913e603c7b6e4a.jpg\",\"file\":\"\",\"username\":\"test\",\"phone\":\"\",\"auth_ids\":{\"7\":\"on\"},\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1604211945');
INSERT INTO `ea_system_log_202011` VALUES ('641', '2', '/admin/mall.daily/edit?id=273', 'post', '', '{\"id\":\"273\",\"pid\":\"0\",\"member_id\":\"2\",\"cate_id\":\"0\",\"abc_id\":\"0\",\"title\":\"2020-11-01\",\"score\":\"1\",\"sort\":\"0\",\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.81 Safari/537.36 SE 2.X MetaSr 1.0', '1604218593');
INSERT INTO `ea_system_log_202011` VALUES ('642', '2', '/admin/mall.cate/delete?id=13', 'post', '', '{\"id\":\"13\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.81 Safari/537.36 SE 2.X MetaSr 1.0', '1604230860');
INSERT INTO `ea_system_log_202011` VALUES ('643', '2', '/admin/mall.log/delete?id=275', 'post', '', '{\"id\":\"275\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.81 Safari/537.36 SE 2.X MetaSr 1.0', '1604240642');

-- ----------------------------
-- Table structure for `ea_system_menu`
-- ----------------------------
DROP TABLE IF EXISTS `ea_system_menu`;
CREATE TABLE `ea_system_menu` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `pid` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '父id',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '名称',
  `icon` varchar(100) NOT NULL DEFAULT '' COMMENT '菜单图标',
  `href` varchar(100) NOT NULL DEFAULT '' COMMENT '链接',
  `params` varchar(500) DEFAULT '' COMMENT '链接参数',
  `target` varchar(20) NOT NULL DEFAULT '_self' COMMENT '链接打开方式',
  `sort` int(11) DEFAULT '0' COMMENT '菜单排序',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态(0:禁用,1:启用)',
  `remark` varchar(255) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  `delete_time` int(11) DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`),
  KEY `title` (`title`),
  KEY `href` (`href`)
) ENGINE=InnoDB AUTO_INCREMENT=261 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='系统菜单表';

-- ----------------------------
-- Records of ea_system_menu
-- ----------------------------
INSERT INTO `ea_system_menu` VALUES ('227', '99999999', '后台首页', 'fa fa-home', 'index/welcome', '', '_self', '0', '1', null, null, '1573120497', null);
INSERT INTO `ea_system_menu` VALUES ('228', '0', '系统管理', 'fa fa-cog', '', '', '_self', '0', '1', '', null, '1588999529', null);
INSERT INTO `ea_system_menu` VALUES ('234', '228', '菜单管理', 'fa fa-tree', 'system.menu/index', '', '_self', '10', '1', '', null, '1588228555', null);
INSERT INTO `ea_system_menu` VALUES ('244', '228', '管理员管理', 'fa fa-user', 'system.admin/index', '', '_self', '12', '1', '', '1573185011', '1588228573', null);
INSERT INTO `ea_system_menu` VALUES ('245', '228', '角色管理', 'fa fa-bitbucket-square', 'system.auth/index', '', '_self', '11', '1', '', '1573435877', '1588228634', null);
INSERT INTO `ea_system_menu` VALUES ('246', '228', '节点管理', 'fa fa-list', 'system.node/index', '', '_self', '9', '1', '', '1573435919', '1588228648', null);
INSERT INTO `ea_system_menu` VALUES ('247', '228', '配置管理', 'fa fa-asterisk', 'system.config/index', '', '_self', '8', '1', '', '1573457448', '1588228566', null);
INSERT INTO `ea_system_menu` VALUES ('248', '228', '上传管理', 'fa fa-arrow-up', 'system.uploadfile/index', '', '_self', '0', '1', '', '1573542953', '1588228043', null);
INSERT INTO `ea_system_menu` VALUES ('249', '0', '自我管理', 'fa fa-list', '', '', '_self', '0', '1', '', '1589439884', '1603947043', null);
INSERT INTO `ea_system_menu` VALUES ('250', '249', '等级管理', 'fa fa-calendar-check-o', 'mall.cate/index', '', '_self', '0', '1', '', '1589439910', '1603977751', '1603977751');
INSERT INTO `ea_system_menu` VALUES ('251', '249', '积分流水', 'fa fa-list', 'mall.log/index', '', '_self', '0', '1', '', '1589439931', '1604077311', null);
INSERT INTO `ea_system_menu` VALUES ('252', '228', '快捷入口', 'fa fa-list', 'system.quick/index', '', '_self', '0', '1', '', '1589623683', '1589623683', null);
INSERT INTO `ea_system_menu` VALUES ('253', '228', '日志管理', 'fa fa-connectdevelop', 'system.log/index', '', '_self', '0', '1', '', '1589623684', '1589623684', null);
INSERT INTO `ea_system_menu` VALUES ('254', '249', '积分管理', 'fa fa-list', 'mall.score/index', '', '_self', '0', '1', '', '1603949558', '1603949576', null);
INSERT INTO `ea_system_menu` VALUES ('255', '249', '项目管理', 'fa fa-list', 'mall.cate/index', '', '_self', '0', '1', '', '1603978076', '1603978076', null);
INSERT INTO `ea_system_menu` VALUES ('256', '249', '原则管理', 'fa fa-list', 'mall.abc/index', '', '_self', '0', '1', '', '1603981722', '1603982048', null);
INSERT INTO `ea_system_menu` VALUES ('257', '249', '日常管理', 'fa fa-list', 'mall.daily/index', '', '_self', '0', '1', '', '1603984035', '1603984035', null);
INSERT INTO `ea_system_menu` VALUES ('258', '249', '愿望清单', 'fa fa-list', 'mall.desire/index', '', '_self', '0', '1', '', '1604062003', '1604116699', null);
INSERT INTO `ea_system_menu` VALUES ('259', '249', '仪表盘', 'fa fa-list', 'mall.dashboard/index', '', '_self', '0', '1', '', '1604062025', '1604208700', null);
INSERT INTO `ea_system_menu` VALUES ('260', '249', '体重管理', 'fa fa-list', 'mall.weight/index', '', '_self', '0', '1', '', '1604196810', '1604208506', null);

-- ----------------------------
-- Table structure for `ea_system_node`
-- ----------------------------
DROP TABLE IF EXISTS `ea_system_node`;
CREATE TABLE `ea_system_node` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `node` varchar(100) DEFAULT NULL COMMENT '节点代码',
  `title` varchar(500) DEFAULT NULL COMMENT '节点标题',
  `type` tinyint(1) DEFAULT '3' COMMENT '节点类型（1：控制器，2：节点）',
  `is_auth` tinyint(1) unsigned DEFAULT '1' COMMENT '是否启动RBAC权限控制',
  `create_time` int(10) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(10) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `node` (`node`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='系统节点表';

-- ----------------------------
-- Records of ea_system_node
-- ----------------------------
INSERT INTO `ea_system_node` VALUES ('1', 'system.admin', '管理员管理', '1', '1', '1589580432', '1589580432');
INSERT INTO `ea_system_node` VALUES ('2', 'system.admin/index', '列表', '2', '1', '1589580432', '1589580432');
INSERT INTO `ea_system_node` VALUES ('3', 'system.admin/add', '添加', '2', '1', '1589580432', '1589580432');
INSERT INTO `ea_system_node` VALUES ('4', 'system.admin/edit', '编辑', '2', '1', '1589580432', '1589580432');
INSERT INTO `ea_system_node` VALUES ('5', 'system.admin/password', '编辑', '2', '1', '1589580432', '1589580432');
INSERT INTO `ea_system_node` VALUES ('6', 'system.admin/delete', '删除', '2', '1', '1589580432', '1589580432');
INSERT INTO `ea_system_node` VALUES ('7', 'system.admin/modify', '属性修改', '2', '1', '1589580432', '1589580432');
INSERT INTO `ea_system_node` VALUES ('8', 'system.admin/export', '导出', '2', '1', '1589580432', '1589580432');
INSERT INTO `ea_system_node` VALUES ('9', 'system.auth', '角色权限管理', '1', '1', '1589580432', '1589580432');
INSERT INTO `ea_system_node` VALUES ('10', 'system.auth/authorize', '授权', '2', '1', '1589580432', '1589580432');
INSERT INTO `ea_system_node` VALUES ('11', 'system.auth/saveAuthorize', '授权保存', '2', '1', '1589580432', '1589580432');
INSERT INTO `ea_system_node` VALUES ('12', 'system.auth/index', '列表', '2', '1', '1589580432', '1589580432');
INSERT INTO `ea_system_node` VALUES ('13', 'system.auth/add', '添加', '2', '1', '1589580432', '1589580432');
INSERT INTO `ea_system_node` VALUES ('14', 'system.auth/edit', '编辑', '2', '1', '1589580432', '1589580432');
INSERT INTO `ea_system_node` VALUES ('15', 'system.auth/delete', '删除', '2', '1', '1589580432', '1589580432');
INSERT INTO `ea_system_node` VALUES ('16', 'system.auth/export', '导出', '2', '1', '1589580432', '1589580432');
INSERT INTO `ea_system_node` VALUES ('17', 'system.auth/modify', '属性修改', '2', '1', '1589580432', '1589580432');
INSERT INTO `ea_system_node` VALUES ('18', 'system.config', '系统配置管理', '1', '1', '1589580432', '1589580432');
INSERT INTO `ea_system_node` VALUES ('19', 'system.config/index', '列表', '2', '1', '1589580432', '1589580432');
INSERT INTO `ea_system_node` VALUES ('20', 'system.config/save', '保存', '2', '1', '1589580432', '1589580432');
INSERT INTO `ea_system_node` VALUES ('21', 'system.menu', '菜单管理', '1', '1', '1589580432', '1589580432');
INSERT INTO `ea_system_node` VALUES ('22', 'system.menu/index', '列表', '2', '1', '1589580432', '1589580432');
INSERT INTO `ea_system_node` VALUES ('23', 'system.menu/add', '添加', '2', '1', '1589580432', '1589580432');
INSERT INTO `ea_system_node` VALUES ('24', 'system.menu/edit', '编辑', '2', '1', '1589580432', '1589580432');
INSERT INTO `ea_system_node` VALUES ('25', 'system.menu/delete', '删除', '2', '1', '1589580432', '1589580432');
INSERT INTO `ea_system_node` VALUES ('26', 'system.menu/modify', '属性修改', '2', '1', '1589580432', '1589580432');
INSERT INTO `ea_system_node` VALUES ('27', 'system.menu/getMenuTips', '添加菜单提示', '2', '1', '1589580432', '1589580432');
INSERT INTO `ea_system_node` VALUES ('28', 'system.menu/export', '导出', '2', '1', '1589580432', '1589580432');
INSERT INTO `ea_system_node` VALUES ('29', 'system.node', '系统节点管理', '1', '1', '1589580432', '1589580432');
INSERT INTO `ea_system_node` VALUES ('30', 'system.node/index', '列表', '2', '1', '1589580432', '1589580432');
INSERT INTO `ea_system_node` VALUES ('31', 'system.node/refreshNode', '系统节点更新', '2', '1', '1589580432', '1589580432');
INSERT INTO `ea_system_node` VALUES ('32', 'system.node/clearNode', '清除失效节点', '2', '1', '1589580432', '1589580432');
INSERT INTO `ea_system_node` VALUES ('33', 'system.node/add', '添加', '2', '1', '1589580432', '1589580432');
INSERT INTO `ea_system_node` VALUES ('34', 'system.node/edit', '编辑', '2', '1', '1589580432', '1589580432');
INSERT INTO `ea_system_node` VALUES ('35', 'system.node/delete', '删除', '2', '1', '1589580432', '1589580432');
INSERT INTO `ea_system_node` VALUES ('36', 'system.node/export', '导出', '2', '1', '1589580432', '1589580432');
INSERT INTO `ea_system_node` VALUES ('37', 'system.node/modify', '属性修改', '2', '1', '1589580432', '1589580432');
INSERT INTO `ea_system_node` VALUES ('38', 'system.uploadfile', '上传文件管理', '1', '1', '1589580432', '1589580432');
INSERT INTO `ea_system_node` VALUES ('39', 'system.uploadfile/index', '列表', '2', '1', '1589580432', '1589580432');
INSERT INTO `ea_system_node` VALUES ('40', 'system.uploadfile/add', '添加', '2', '1', '1589580432', '1589580432');
INSERT INTO `ea_system_node` VALUES ('41', 'system.uploadfile/edit', '编辑', '2', '1', '1589580432', '1589580432');
INSERT INTO `ea_system_node` VALUES ('42', 'system.uploadfile/delete', '删除', '2', '1', '1589580432', '1589580432');
INSERT INTO `ea_system_node` VALUES ('43', 'system.uploadfile/export', '导出', '2', '1', '1589580432', '1589580432');
INSERT INTO `ea_system_node` VALUES ('44', 'system.uploadfile/modify', '属性修改', '2', '1', '1589580432', '1589580432');
INSERT INTO `ea_system_node` VALUES ('45', 'mall.cate', '项目管理', '1', '1', '1589580432', '1589580432');
INSERT INTO `ea_system_node` VALUES ('46', 'mall.cate/index', '列表', '2', '1', '1589580432', '1589580432');
INSERT INTO `ea_system_node` VALUES ('47', 'mall.cate/add', '添加', '2', '1', '1589580432', '1589580432');
INSERT INTO `ea_system_node` VALUES ('48', 'mall.cate/edit', '编辑', '2', '1', '1589580432', '1589580432');
INSERT INTO `ea_system_node` VALUES ('49', 'mall.cate/delete', '删除', '2', '1', '1589580432', '1589580432');
INSERT INTO `ea_system_node` VALUES ('50', 'mall.cate/export', '导出', '2', '1', '1589580432', '1589580432');
INSERT INTO `ea_system_node` VALUES ('51', 'mall.cate/modify', '属性修改', '2', '1', '1589580432', '1589580432');
INSERT INTO `ea_system_node` VALUES ('52', 'mall.goods', '商城商品管理', '1', '1', '1589580432', '1589580432');
INSERT INTO `ea_system_node` VALUES ('53', 'mall.goods/index', '列表', '2', '1', '1589580432', '1589580432');
INSERT INTO `ea_system_node` VALUES ('54', 'mall.goods/stock', '入库', '2', '1', '1589580432', '1589580432');
INSERT INTO `ea_system_node` VALUES ('55', 'mall.goods/add', '添加', '2', '1', '1589580432', '1589580432');
INSERT INTO `ea_system_node` VALUES ('56', 'mall.goods/edit', '编辑', '2', '1', '1589580432', '1589580432');
INSERT INTO `ea_system_node` VALUES ('57', 'mall.goods/delete', '删除', '2', '1', '1589580432', '1589580432');
INSERT INTO `ea_system_node` VALUES ('58', 'mall.goods/export', '导出', '2', '1', '1589580432', '1589580432');
INSERT INTO `ea_system_node` VALUES ('59', 'mall.goods/modify', '属性修改', '2', '1', '1589580432', '1589580432');
INSERT INTO `ea_system_node` VALUES ('60', 'system.quick', '快捷入口管理', '1', '1', '1589623188', '1589623188');
INSERT INTO `ea_system_node` VALUES ('61', 'system.quick/index', '列表', '2', '1', '1589623188', '1589623188');
INSERT INTO `ea_system_node` VALUES ('62', 'system.quick/add', '添加', '2', '1', '1589623188', '1589623188');
INSERT INTO `ea_system_node` VALUES ('63', 'system.quick/edit', '编辑', '2', '1', '1589623188', '1589623188');
INSERT INTO `ea_system_node` VALUES ('64', 'system.quick/delete', '删除', '2', '1', '1589623188', '1589623188');
INSERT INTO `ea_system_node` VALUES ('65', 'system.quick/export', '导出', '2', '1', '1589623188', '1589623188');
INSERT INTO `ea_system_node` VALUES ('66', 'system.quick/modify', '属性修改', '2', '1', '1589623188', '1589623188');
INSERT INTO `ea_system_node` VALUES ('67', 'system.log', '操作日志管理', '1', '1', '1589623188', '1589623188');
INSERT INTO `ea_system_node` VALUES ('68', 'system.log/index', '列表', '2', '1', '1589623188', '1589623188');
INSERT INTO `ea_system_node` VALUES ('69', 'mall.abc', '原则管理', '1', '1', '1604211705', '1604211705');
INSERT INTO `ea_system_node` VALUES ('70', 'mall.abc/index', '列表', '2', '1', '1604211705', '1604211705');
INSERT INTO `ea_system_node` VALUES ('71', 'mall.abc/add', '添加', '2', '1', '1604211705', '1604211705');
INSERT INTO `ea_system_node` VALUES ('72', 'mall.abc/edit', '编辑', '2', '1', '1604211705', '1604211705');
INSERT INTO `ea_system_node` VALUES ('73', 'mall.abc/delete', '删除', '2', '1', '1604211705', '1604211705');
INSERT INTO `ea_system_node` VALUES ('74', 'mall.abc/export', '导出', '2', '1', '1604211705', '1604211705');
INSERT INTO `ea_system_node` VALUES ('75', 'mall.abc/modify', '属性修改', '2', '1', '1604211705', '1604211705');
INSERT INTO `ea_system_node` VALUES ('76', 'mall.daily', '日常管理', '1', '1', '1604211705', '1604211705');
INSERT INTO `ea_system_node` VALUES ('77', 'mall.daily/index', '列表', '2', '1', '1604211705', '1604211705');
INSERT INTO `ea_system_node` VALUES ('78', 'mall.daily/add', '添加', '2', '1', '1604211705', '1604211705');
INSERT INTO `ea_system_node` VALUES ('79', 'mall.daily/edit', '编辑', '2', '1', '1604211705', '1604211705');
INSERT INTO `ea_system_node` VALUES ('80', 'mall.daily/done', '完成项目', '2', '1', '1604211705', '1604211705');
INSERT INTO `ea_system_node` VALUES ('81', 'mall.daily/delete', '删除', '2', '1', '1604211705', '1604211705');
INSERT INTO `ea_system_node` VALUES ('82', 'mall.daily/export', '导出', '2', '1', '1604211705', '1604211705');
INSERT INTO `ea_system_node` VALUES ('83', 'mall.daily/modify', '属性修改', '2', '1', '1604211705', '1604211705');
INSERT INTO `ea_system_node` VALUES ('84', 'mall.dashboard', '仪表盘', '1', '1', '1604211705', '1604211705');
INSERT INTO `ea_system_node` VALUES ('85', 'mall.dashboard/index', '列表', '2', '1', '1604211705', '1604211705');
INSERT INTO `ea_system_node` VALUES ('86', 'mall.dashboard/add', '添加', '2', '1', '1604211705', '1604211705');
INSERT INTO `ea_system_node` VALUES ('87', 'mall.dashboard/edit', '编辑', '2', '1', '1604211705', '1604211705');
INSERT INTO `ea_system_node` VALUES ('88', 'mall.dashboard/delete', '删除', '2', '1', '1604211705', '1604211705');
INSERT INTO `ea_system_node` VALUES ('89', 'mall.dashboard/export', '导出', '2', '1', '1604211705', '1604211705');
INSERT INTO `ea_system_node` VALUES ('90', 'mall.dashboard/modify', '属性修改', '2', '1', '1604211705', '1604211705');
INSERT INTO `ea_system_node` VALUES ('91', 'mall.desire', '欲望清单管理', '1', '1', '1604211705', '1604211705');
INSERT INTO `ea_system_node` VALUES ('92', 'mall.desire/index', '列表', '2', '1', '1604211705', '1604211705');
INSERT INTO `ea_system_node` VALUES ('93', 'mall.desire/modify', '属性修改', '2', '1', '1604211705', '1604211705');
INSERT INTO `ea_system_node` VALUES ('94', 'mall.desire/add', '添加', '2', '1', '1604211705', '1604211705');
INSERT INTO `ea_system_node` VALUES ('95', 'mall.desire/edit', '编辑', '2', '1', '1604211705', '1604211705');
INSERT INTO `ea_system_node` VALUES ('96', 'mall.desire/delete', '删除', '2', '1', '1604211705', '1604211705');
INSERT INTO `ea_system_node` VALUES ('97', 'mall.desire/export', '导出', '2', '1', '1604211705', '1604211705');
INSERT INTO `ea_system_node` VALUES ('98', 'mall.log', '积分流水管理', '1', '1', '1604211705', '1604211705');
INSERT INTO `ea_system_node` VALUES ('99', 'mall.log/index', '列表', '2', '1', '1604211705', '1604211705');
INSERT INTO `ea_system_node` VALUES ('100', 'mall.log/add', '添加', '2', '1', '1604211705', '1604211705');
INSERT INTO `ea_system_node` VALUES ('101', 'mall.log/edit', '编辑', '2', '1', '1604211705', '1604211705');
INSERT INTO `ea_system_node` VALUES ('102', 'mall.log/delete', '删除', '2', '1', '1604211705', '1604211705');
INSERT INTO `ea_system_node` VALUES ('103', 'mall.log/export', '导出', '2', '1', '1604211705', '1604211705');
INSERT INTO `ea_system_node` VALUES ('104', 'mall.log/modify', '属性修改', '2', '1', '1604211705', '1604211705');
INSERT INTO `ea_system_node` VALUES ('105', 'mall.score', '积分管理', '1', '1', '1604211705', '1604211705');
INSERT INTO `ea_system_node` VALUES ('106', 'mall.score/index', '列表', '2', '1', '1604211705', '1604211705');
INSERT INTO `ea_system_node` VALUES ('107', 'mall.score/modify', '属性修改', '2', '1', '1604211705', '1604211705');
INSERT INTO `ea_system_node` VALUES ('108', 'mall.score/add', '添加', '2', '1', '1604211705', '1604211705');
INSERT INTO `ea_system_node` VALUES ('109', 'mall.score/edit', '编辑', '2', '1', '1604211705', '1604211705');
INSERT INTO `ea_system_node` VALUES ('110', 'mall.score/delete', '删除', '2', '1', '1604211705', '1604211705');
INSERT INTO `ea_system_node` VALUES ('111', 'mall.score/export', '导出', '2', '1', '1604211705', '1604211705');
INSERT INTO `ea_system_node` VALUES ('112', 'mall.weight', '体重管理', '1', '1', '1604211705', '1604211705');
INSERT INTO `ea_system_node` VALUES ('113', 'mall.weight/index', '列表', '2', '1', '1604211705', '1604211705');
INSERT INTO `ea_system_node` VALUES ('114', 'mall.weight/add', '添加', '2', '1', '1604211705', '1604211705');
INSERT INTO `ea_system_node` VALUES ('115', 'mall.weight/edit', '编辑', '2', '1', '1604211705', '1604211705');
INSERT INTO `ea_system_node` VALUES ('116', 'mall.weight/delete', '删除', '2', '1', '1604211705', '1604211705');
INSERT INTO `ea_system_node` VALUES ('117', 'mall.weight/export', '导出', '2', '1', '1604211705', '1604211705');
INSERT INTO `ea_system_node` VALUES ('118', 'mall.weight/modify', '属性修改', '2', '1', '1604211705', '1604211705');

-- ----------------------------
-- Table structure for `ea_system_quick`
-- ----------------------------
DROP TABLE IF EXISTS `ea_system_quick`;
CREATE TABLE `ea_system_quick` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(20) NOT NULL COMMENT '快捷入口名称',
  `icon` varchar(100) DEFAULT NULL COMMENT '图标',
  `href` varchar(255) DEFAULT NULL COMMENT '快捷链接',
  `sort` int(11) DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '状态(1:禁用,2:启用)',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注说明',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  `delete_time` int(11) DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='系统快捷入口表';

-- ----------------------------
-- Records of ea_system_quick
-- ----------------------------
INSERT INTO `ea_system_quick` VALUES ('1', '管理员管理', 'fa fa-user', 'system.admin/index', '0', '1', '', '1589624097', '1589624792', null);
INSERT INTO `ea_system_quick` VALUES ('2', '角色管理', 'fa fa-bitbucket-square', 'system.auth/index', '0', '1', '', '1589624772', '1589624781', null);
INSERT INTO `ea_system_quick` VALUES ('3', '菜单管理', 'fa fa-tree', 'system.menu/index', '0', '1', null, '1589624097', '1589624792', null);
INSERT INTO `ea_system_quick` VALUES ('6', '节点管理', 'fa fa-list', 'system.node/index', '0', '1', null, '1589624772', '1589624781', null);
INSERT INTO `ea_system_quick` VALUES ('7', '配置管理', 'fa fa-asterisk', 'system.config/index', '0', '1', null, '1589624097', '1589624792', null);
INSERT INTO `ea_system_quick` VALUES ('8', '上传管理', 'fa fa-arrow-up', 'system.uploadfile/index', '0', '1', null, '1589624772', '1589624781', null);
INSERT INTO `ea_system_quick` VALUES ('10', '商品分类', 'fa fa-calendar-check-o', 'mall.cate/index', '0', '1', null, '1589624097', '1589624792', null);
INSERT INTO `ea_system_quick` VALUES ('11', '商品管理', 'fa fa-list', 'mall.goods/index', '0', '1', null, '1589624772', '1589624781', null);

-- ----------------------------
-- Table structure for `ea_system_uploadfile`
-- ----------------------------
DROP TABLE IF EXISTS `ea_system_uploadfile`;
CREATE TABLE `ea_system_uploadfile` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `upload_type` varchar(20) NOT NULL DEFAULT 'local' COMMENT '存储位置',
  `original_name` varchar(255) DEFAULT NULL COMMENT '文件原名',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '物理路径',
  `image_width` varchar(30) NOT NULL DEFAULT '' COMMENT '宽度',
  `image_height` varchar(30) NOT NULL DEFAULT '' COMMENT '高度',
  `image_type` varchar(30) NOT NULL DEFAULT '' COMMENT '图片类型',
  `image_frames` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '图片帧数',
  `mime_type` varchar(100) NOT NULL DEFAULT '' COMMENT 'mime类型',
  `file_size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `file_ext` varchar(100) DEFAULT NULL,
  `sha1` varchar(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  `create_time` int(10) DEFAULT NULL COMMENT '创建日期',
  `update_time` int(10) DEFAULT NULL COMMENT '更新时间',
  `upload_time` int(10) DEFAULT NULL COMMENT '上传时间',
  PRIMARY KEY (`id`),
  KEY `upload_type` (`upload_type`),
  KEY `original_name` (`original_name`)
) ENGINE=InnoDB AUTO_INCREMENT=304 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='上传文件表';

-- ----------------------------
-- Records of ea_system_uploadfile
-- ----------------------------
INSERT INTO `ea_system_uploadfile` VALUES ('286', 'alioss', 'image/jpeg', 'https://lxn-99php.oss-cn-shenzhen.aliyuncs.com/upload/20191111/0a6de1ac058ee134301501899b84ecb1.jpg', '', '', '', '0', 'image/jpeg', '0', 'jpg', '', null, null, null);
INSERT INTO `ea_system_uploadfile` VALUES ('287', 'alioss', 'image/jpeg', 'https://lxn-99php.oss-cn-shenzhen.aliyuncs.com/upload/20191111/46d7384f04a3bed331715e86a4095d15.jpg', '', '', '', '0', 'image/jpeg', '0', 'jpg', '', null, null, null);
INSERT INTO `ea_system_uploadfile` VALUES ('288', 'alioss', 'image/x-icon', 'https://lxn-99php.oss-cn-shenzhen.aliyuncs.com/upload/20191111/7d32671f4c1d1b01b0b28f45205763f9.ico', '', '', '', '0', 'image/x-icon', '0', 'ico', '', null, null, null);
INSERT INTO `ea_system_uploadfile` VALUES ('289', 'alioss', 'image/jpeg', 'https://lxn-99php.oss-cn-shenzhen.aliyuncs.com/upload/20191111/28cefa547f573a951bcdbbeb1396b06f.jpg', '', '', '', '0', 'image/jpeg', '0', 'jpg', '', null, null, null);
INSERT INTO `ea_system_uploadfile` VALUES ('290', 'alioss', 'image/jpeg', 'https://lxn-99php.oss-cn-shenzhen.aliyuncs.com/upload/20191111/2c412adf1b30c8be3a913e603c7b6e4a.jpg', '', '', '', '0', 'image/jpeg', '0', 'jpg', '', null, null, null);
INSERT INTO `ea_system_uploadfile` VALUES ('303', 'local', 'images (1).jpg', 'http://www.self.com/upload/20201029/cea1c94a095954b95ee75a44c474e845.jpg', '', '', '', '0', 'image/jpeg', '0', 'jpg', '', '1603948113', null, null);
