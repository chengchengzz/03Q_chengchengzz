-- ----------------------------------------
-- EyouCms MySQL Data Transfer 
-- 
-- Server         : 127.0.0.1_3306
-- Server Version : 5.5.40
-- Host           : 127.0.0.1:3306
-- Database       : e15
-- 
-- Part : #1
-- Date : 2018-08-30 15:14:39
-- -----------------------------------------

SET FOREIGN_KEY_CHECKS = 0;


-- -----------------------------
-- Table structure for `ey_ad`
-- -----------------------------
DROP TABLE IF EXISTS `ey_ad`;
CREATE TABLE `ey_ad` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '广告id',
  `pid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '广告位置ID',
  `media_type` tinyint(1) DEFAULT '0' COMMENT '广告类型',
  `title` varchar(60) DEFAULT '' COMMENT '广告名称',
  `links` varchar(255) DEFAULT '' COMMENT '广告链接',
  `litpic` varchar(255) DEFAULT '' COMMENT '图片地址',
  `start_time` int(11) DEFAULT '0' COMMENT '投放时间',
  `end_time` int(11) DEFAULT '0' COMMENT '结束时间',
  `intro` text COMMENT '描述',
  `link_man` varchar(60) DEFAULT '' COMMENT '添加人',
  `link_email` varchar(60) DEFAULT '' COMMENT '添加人邮箱',
  `link_phone` varchar(60) DEFAULT '' COMMENT '添加人联系电话',
  `click` int(11) DEFAULT '0' COMMENT '点击量',
  `bgcolor` varchar(30) DEFAULT '' COMMENT '背景颜色',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '1=显示，0=屏蔽',
  `sort_order` int(11) DEFAULT '0' COMMENT '排序',
  `target` varchar(50) DEFAULT '' COMMENT '是否开启浏览器新窗口',
  `add_time` int(11) DEFAULT '0' COMMENT '新增时间',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `position_id` (`pid`) USING BTREE,
  KEY `status` (`status`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `ey_ad`
-- -----------------------------
INSERT INTO `ey_ad` VALUES ('1', '1', '1', '幻灯二', 'http://www.eyoucms.com', '/public/upload/other/2018/06/21/1a02a3e10d04da9d722accd8fc673ebd.jpg', '1524215594', '0', '&lt;p&gt;填写广告的备注信息，方便于后期的跟进&lt;/p&gt;', '', '', '', '0', '', '1', '100', '0', '1524215652', '1529543119');
INSERT INTO `ey_ad` VALUES ('2', '1', '1', '幻灯一', 'http://www.eyoucms.com', '/public/upload/other/2018/06/21/b2d07df2a1324ae39aaf1b12ceb12cd1.jpg', '0', '0', '&lt;p&gt;填写广告的备注信息，方便于后期的跟进&lt;/p&gt;', '', '', '', '0', '', '1', '100', '0', '1524214017', '1529543137');
INSERT INTO `ey_ad` VALUES ('4', '3', '1', '幻灯一', '', '/public/upload/other/2018/06/21/3a7b78923b522e27fd351f7c41b39ae6.jpg', '0', '0', '', '', '', '', '0', '', '1', '100', '1', '1527667947', '1529543516');
INSERT INTO `ey_ad` VALUES ('5', '3', '1', '幻灯二', '', '/public/upload/other/2018/06/21/d097eeeb0f3e71b69d0f21f0a32e3098.jpg', '0', '0', '', '', '', '', '0', '', '1', '100', '1', '1527667963', '1529543501');

-- -----------------------------
-- Table structure for `ey_ad_position`
-- -----------------------------
DROP TABLE IF EXISTS `ey_ad_position`;
CREATE TABLE `ey_ad_position` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(60) DEFAULT '' COMMENT '广告位置名称',
  `width` smallint(5) unsigned DEFAULT '0' COMMENT '广告位宽度',
  `height` smallint(5) unsigned DEFAULT '0' COMMENT '广告位高度',
  `intro` text COMMENT '广告描述',
  `status` tinyint(1) DEFAULT '1' COMMENT '0关闭1开启',
  `add_time` int(11) DEFAULT '0' COMMENT '新增时间',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='广告位置表';

-- -----------------------------
-- Records of `ey_ad_position`
-- -----------------------------
INSERT INTO `ey_ad_position` VALUES ('1', 'PC端首页头部-大幻灯片', '1004', '360', '', '1', '1524209276', '1529736190');
INSERT INTO `ey_ad_position` VALUES ('3', '手机端首页头部幻灯', '640', '221', '', '1', '1527667904', '1529736161');

-- -----------------------------
-- Table structure for `ey_addonarticle`
-- -----------------------------
DROP TABLE IF EXISTS `ey_addonarticle`;
CREATE TABLE `ey_addonarticle` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `aid` int(11) DEFAULT '0' COMMENT '资讯ID',
  `add_time` int(11) DEFAULT '0' COMMENT '新增时间',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `news_id` (`aid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COMMENT='资讯内容表_存储正常内容';

-- -----------------------------
-- Records of `ey_addonarticle`
-- -----------------------------
INSERT INTO `ey_addonarticle` VALUES ('1', '4', '1526545072', '1526545072');
INSERT INTO `ey_addonarticle` VALUES ('2', '5', '1526545153', '1526545153');
INSERT INTO `ey_addonarticle` VALUES ('3', '6', '1526545254', '1526545254');
INSERT INTO `ey_addonarticle` VALUES ('4', '7', '1526545280', '1526545280');
INSERT INTO `ey_addonarticle` VALUES ('5', '9', '1526552582', '1526552582');
INSERT INTO `ey_addonarticle` VALUES ('6', '10', '1526552685', '1526552935');
INSERT INTO `ey_addonarticle` VALUES ('7', '12', '1526552714', '1526552714');
INSERT INTO `ey_addonarticle` VALUES ('8', '13', '1526608216', '1526608216');
INSERT INTO `ey_addonarticle` VALUES ('9', '14', '1526609496', '1526609496');
INSERT INTO `ey_addonarticle` VALUES ('10', '19', '1526610848', '1526610848');
INSERT INTO `ey_addonarticle` VALUES ('11', '20', '1526611606', '1526614271');
INSERT INTO `ey_addonarticle` VALUES ('12', '21', '1526611744', '1526611744');
INSERT INTO `ey_addonarticle` VALUES ('13', '36', '1526955610', '1526955610');
INSERT INTO `ey_addonarticle` VALUES ('14', '38', '1527664149', '1527664149');
INSERT INTO `ey_addonarticle` VALUES ('15', '39', '1527664280', '1527664280');
INSERT INTO `ey_addonarticle` VALUES ('16', '40', '1527664307', '1527664307');
INSERT INTO `ey_addonarticle` VALUES ('17', '41', '1527664331', '1527664331');
INSERT INTO `ey_addonarticle` VALUES ('18', '42', '1527664373', '1527664373');
INSERT INTO `ey_addonarticle` VALUES ('19', '43', '1527664459', '1527664459');
INSERT INTO `ey_addonarticle` VALUES ('20', '44', '1527664498', '1527664498');
INSERT INTO `ey_addonarticle` VALUES ('21', '45', '1527664551', '1527664551');
INSERT INTO `ey_addonarticle` VALUES ('22', '46', '1527664691', '1527664691');
INSERT INTO `ey_addonarticle` VALUES ('23', '47', '1527664728', '1527664728');
INSERT INTO `ey_addonarticle` VALUES ('24', '48', '1527664752', '1527664752');
INSERT INTO `ey_addonarticle` VALUES ('25', '49', '1527664776', '1527664776');
INSERT INTO `ey_addonarticle` VALUES ('26', '50', '1527664797', '1527664797');
INSERT INTO `ey_addonarticle` VALUES ('27', '51', '1527665029', '1527665029');
INSERT INTO `ey_addonarticle` VALUES ('28', '52', '1527665066', '1527665066');
INSERT INTO `ey_addonarticle` VALUES ('29', '53', '1527665090', '1527665090');
INSERT INTO `ey_addonarticle` VALUES ('30', '54', '1527665111', '1527665111');
INSERT INTO `ey_addonarticle` VALUES ('31', '55', '1527665145', '1527665145');
INSERT INTO `ey_addonarticle` VALUES ('32', '56', '1527665172', '1527665172');

-- -----------------------------
-- Table structure for `ey_addondownload`
-- -----------------------------
DROP TABLE IF EXISTS `ey_addondownload`;
CREATE TABLE `ey_addondownload` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `aid` int(11) DEFAULT '0' COMMENT '资讯ID',
  `add_time` int(11) DEFAULT '0' COMMENT '新增时间',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `news_id` (`aid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='资讯内容表_存储正常内容';

-- -----------------------------
-- Records of `ey_addondownload`
-- -----------------------------
INSERT INTO `ey_addondownload` VALUES ('1', '30', '1526614069', '1526614760');
INSERT INTO `ey_addondownload` VALUES ('2', '31', '1526614168', '1526614168');
INSERT INTO `ey_addondownload` VALUES ('3', '32', '1526614768', '1526614768');

-- -----------------------------
-- Table structure for `ey_addonimages`
-- -----------------------------
DROP TABLE IF EXISTS `ey_addonimages`;
CREATE TABLE `ey_addonimages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `aid` int(11) DEFAULT '0' COMMENT '资讯ID',
  `add_time` int(11) DEFAULT '0' COMMENT '新增时间',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `news_id` (`aid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='资讯内容表_存储正常内容';

-- -----------------------------
-- Records of `ey_addonimages`
-- -----------------------------
INSERT INTO `ey_addonimages` VALUES ('1', '15', '1526610243', '1526610381');
INSERT INTO `ey_addonimages` VALUES ('2', '16', '1526610525', '1526610571');
INSERT INTO `ey_addonimages` VALUES ('3', '17', '1526610590', '1526610617');
INSERT INTO `ey_addonimages` VALUES ('4', '18', '1526610698', '1526614247');
INSERT INTO `ey_addonimages` VALUES ('5', '22', '1526612277', '1526612311');
INSERT INTO `ey_addonimages` VALUES ('6', '23', '1526612316', '1526612342');
INSERT INTO `ey_addonimages` VALUES ('7', '24', '1526612386', '1526612407');
INSERT INTO `ey_addonimages` VALUES ('8', '25', '1526612412', '1526614313');
INSERT INTO `ey_addonimages` VALUES ('9', '26', '1526612433', '1526612476');

-- -----------------------------
-- Table structure for `ey_addonproduct`
-- -----------------------------
DROP TABLE IF EXISTS `ey_addonproduct`;
CREATE TABLE `ey_addonproduct` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `aid` int(11) DEFAULT '0' COMMENT '资讯ID',
  `spec` longtext COMMENT '规格参数',
  `packing` longtext COMMENT '包装',
  `add_time` int(11) DEFAULT '0' COMMENT '新增时间',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `news_id` (`aid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='产品附加表';

-- -----------------------------
-- Records of `ey_addonproduct`
-- -----------------------------
INSERT INTO `ey_addonproduct` VALUES ('1', '11', '', '', '1526567723', '1526567958');
INSERT INTO `ey_addonproduct` VALUES ('2', '27', '&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 0.8em; color: rgb(42, 51, 60); font-family: &amp;quot;Segoe UI&amp;quot;, &amp;quot;Lucida Grande&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, FreeSans, Arimo, &amp;quot;Droid Sans&amp;quot;, &amp;quot;wenquanyi micro hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Hiragino Sans GB W3&amp;quot;, Roboto, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;box-sizing: border-box; font-weight: 600;&quot;&gt;主体&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 0.8em; color: rgb(42, 51, 60); font-family: &amp;quot;Segoe UI&amp;quot;, &amp;quot;Lucida Grande&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, FreeSans, Arimo, &amp;quot;Droid Sans&amp;quot;, &amp;quot;wenquanyi micro hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Hiragino Sans GB W3&amp;quot;, Roboto, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;box-sizing: inherit;&quot;&gt;品牌&lt;span class=&quot;Apple-tab-span&quot; style=&quot;box-sizing: inherit; font-size: 14px;&quot;&gt;&lt;/span&gt;Honor&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 0.8em; color: rgb(42, 51, 60); font-family: &amp;quot;Segoe UI&amp;quot;, &amp;quot;Lucida Grande&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, FreeSans, Arimo, &amp;quot;Droid Sans&amp;quot;, &amp;quot;wenquanyi micro hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Hiragino Sans GB W3&amp;quot;, Roboto, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;box-sizing: inherit;&quot;&gt;型号&lt;span class=&quot;Apple-tab-span&quot; style=&quot;box-sizing: inherit; font-size: 14px;&quot;&gt;&lt;/span&gt;EDI-AL10&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 0.8em; color: rgb(42, 51, 60); font-family: &amp;quot;Segoe UI&amp;quot;, &amp;quot;Lucida Grande&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, FreeSans, Arimo, &amp;quot;Droid Sans&amp;quot;, &amp;quot;wenquanyi micro hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Hiragino Sans GB W3&amp;quot;, Roboto, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;box-sizing: inherit;&quot;&gt;传播名&lt;span class=&quot;Apple-tab-span&quot; style=&quot;box-sizing: inherit; font-size: 14px;&quot;&gt;&lt;/span&gt;荣耀 NOTE 8&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 0.8em; color: rgb(42, 51, 60); font-family: &amp;quot;Segoe UI&amp;quot;, &amp;quot;Lucida Grande&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, FreeSans, Arimo, &amp;quot;Droid Sans&amp;quot;, &amp;quot;wenquanyi micro hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Hiragino Sans GB W3&amp;quot;, Roboto, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;box-sizing: inherit;&quot;&gt;外观设计&lt;span class=&quot;Apple-tab-span&quot; style=&quot;box-sizing: inherit; font-size: 14px;&quot;&gt;&lt;/span&gt;直板&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 0.8em; color: rgb(42, 51, 60); font-family: &amp;quot;Segoe UI&amp;quot;, &amp;quot;Lucida Grande&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, FreeSans, Arimo, &amp;quot;Droid Sans&amp;quot;, &amp;quot;wenquanyi micro hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Hiragino Sans GB W3&amp;quot;, Roboto, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;box-sizing: inherit;&quot;&gt;智能手机&lt;span class=&quot;Apple-tab-span&quot; style=&quot;box-sizing: inherit; font-size: 14px;&quot;&gt;&lt;/span&gt;是&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 0.8em; color: rgb(42, 51, 60); font-family: &amp;quot;Segoe UI&amp;quot;, &amp;quot;Lucida Grande&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, FreeSans, Arimo, &amp;quot;Droid Sans&amp;quot;, &amp;quot;wenquanyi micro hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Hiragino Sans GB W3&amp;quot;, Roboto, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;box-sizing: inherit;&quot;&gt;操作系统&lt;span class=&quot;Apple-tab-span&quot; style=&quot;box-sizing: inherit; font-size: 14px;&quot;&gt;&lt;/span&gt;华为 EMUI 4.1 + Android 6.0&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 0.8em; color: rgb(42, 51, 60); font-family: &amp;quot;Segoe UI&amp;quot;, &amp;quot;Lucida Grande&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, FreeSans, Arimo, &amp;quot;Droid Sans&amp;quot;, &amp;quot;wenquanyi micro hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Hiragino Sans GB W3&amp;quot;, Roboto, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;box-sizing: inherit;&quot;&gt;用户界面&lt;span class=&quot;Apple-tab-span&quot; style=&quot;box-sizing: inherit; font-size: 14px;&quot;&gt;&lt;/span&gt;华为 EMUI 4.1&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 0.8em; color: rgb(42, 51, 60); font-family: &amp;quot;Segoe UI&amp;quot;, &amp;quot;Lucida Grande&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, FreeSans, Arimo, &amp;quot;Droid Sans&amp;quot;, &amp;quot;wenquanyi micro hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Hiragino Sans GB W3&amp;quot;, Roboto, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;box-sizing: inherit;&quot;&gt;CPU型号&lt;span class=&quot;Apple-tab-span&quot; style=&quot;box-sizing: inherit; font-size: 14px;&quot;&gt;&lt;/span&gt;麒麟955&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 0.8em; color: rgb(42, 51, 60); font-family: &amp;quot;Segoe UI&amp;quot;, &amp;quot;Lucida Grande&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, FreeSans, Arimo, &amp;quot;Droid Sans&amp;quot;, &amp;quot;wenquanyi micro hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Hiragino Sans GB W3&amp;quot;, Roboto, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;box-sizing: inherit;&quot;&gt;CPU核数&lt;span class=&quot;Apple-tab-span&quot; style=&quot;box-sizing: inherit; font-size: 14px;&quot;&gt;&lt;/span&gt;8核&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 0.8em; color: rgb(42, 51, 60); font-family: &amp;quot;Segoe UI&amp;quot;, &amp;quot;Lucida Grande&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, FreeSans, Arimo, &amp;quot;Droid Sans&amp;quot;, &amp;quot;wenquanyi micro hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Hiragino Sans GB W3&amp;quot;, Roboto, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;box-sizing: inherit;&quot;&gt;CPU主频&lt;span class=&quot;Apple-tab-span&quot; style=&quot;box-sizing: inherit; font-size: 14px;&quot;&gt;&lt;/span&gt;4*Cortex A72 2.5GHz + 4*Cortex A53 1.8GHz + 微智核I5&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 0.8em; color: rgb(42, 51, 60); font-family: &amp;quot;Segoe UI&amp;quot;, &amp;quot;Lucida Grande&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, FreeSans, Arimo, &amp;quot;Droid Sans&amp;quot;, &amp;quot;wenquanyi micro hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Hiragino Sans GB W3&amp;quot;, Roboto, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;box-sizing: inherit;&quot;&gt;GPU&lt;span class=&quot;Apple-tab-span&quot; style=&quot;box-sizing: inherit; font-size: 14px;&quot;&gt;&lt;/span&gt;Mali T880 MP4&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 0.8em; color: rgb(42, 51, 60); font-family: &amp;quot;Segoe UI&amp;quot;, &amp;quot;Lucida Grande&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, FreeSans, Arimo, &amp;quot;Droid Sans&amp;quot;, &amp;quot;wenquanyi micro hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Hiragino Sans GB W3&amp;quot;, Roboto, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;box-sizing: inherit;&quot;&gt;双卡&lt;span class=&quot;Apple-tab-span&quot; style=&quot;box-sizing: inherit; font-size: 14px;&quot;&gt;&lt;/span&gt;支持&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 0.8em; color: rgb(42, 51, 60); font-family: &amp;quot;Segoe UI&amp;quot;, &amp;quot;Lucida Grande&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, FreeSans, Arimo, &amp;quot;Droid Sans&amp;quot;, &amp;quot;wenquanyi micro hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Hiragino Sans GB W3&amp;quot;, Roboto, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;box-sizing: inherit;&quot;&gt;键盘类型&lt;span class=&quot;Apple-tab-span&quot; style=&quot;box-sizing: inherit; font-size: 14px;&quot;&gt;&lt;/span&gt;虚拟键盘&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 0.8em; color: rgb(42, 51, 60); font-family: &amp;quot;Segoe UI&amp;quot;, &amp;quot;Lucida Grande&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, FreeSans, Arimo, &amp;quot;Droid Sans&amp;quot;, &amp;quot;wenquanyi micro hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Hiragino Sans GB W3&amp;quot;, Roboto, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;box-sizing: inherit;&quot;&gt;输入方式&lt;span class=&quot;Apple-tab-span&quot; style=&quot;box-sizing: inherit; font-size: 14px;&quot;&gt;&lt;/span&gt;百度输入法华为版，华为Swype输入法，Android 键盘（AOSP）&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 0.8em; color: rgb(42, 51, 60); font-family: &amp;quot;Segoe UI&amp;quot;, &amp;quot;Lucida Grande&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, FreeSans, Arimo, &amp;quot;Droid Sans&amp;quot;, &amp;quot;wenquanyi micro hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Hiragino Sans GB W3&amp;quot;, Roboto, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;box-sizing: inherit;&quot;&gt;3G视频通话&lt;span class=&quot;Apple-tab-span&quot; style=&quot;box-sizing: inherit; font-size: 14px;&quot;&gt;&lt;/span&gt;不支持&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 0.8em; color: rgb(42, 51, 60); font-family: &amp;quot;Segoe UI&amp;quot;, &amp;quot;Lucida Grande&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, FreeSans, Arimo, &amp;quot;Droid Sans&amp;quot;, &amp;quot;wenquanyi micro hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Hiragino Sans GB W3&amp;quot;, Roboto, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;box-sizing: inherit;&quot;&gt;安全功能&lt;span class=&quot;Apple-tab-span&quot; style=&quot;box-sizing: inherit; font-size: 14px;&quot;&gt;&lt;/span&gt;保密柜&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 0.8em; color: rgb(42, 51, 60); font-family: &amp;quot;Segoe UI&amp;quot;, &amp;quot;Lucida Grande&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, FreeSans, Arimo, &amp;quot;Droid Sans&amp;quot;, &amp;quot;wenquanyi micro hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Hiragino Sans GB W3&amp;quot;, Roboto, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;box-sizing: inherit;&quot;&gt;特色功能&lt;span class=&quot;Apple-tab-span&quot; style=&quot;box-sizing: inherit; font-size: 14px;&quot;&gt;&lt;/span&gt;全向录音/指向回放、定向免提、指关节手势、分屏多窗口、语音控制、情景智能、单手操作、杂志锁屏、手机找回、无线WIFI打印、学生模式、多屏互动、运动健康&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 0.8em; color: rgb(42, 51, 60); font-family: &amp;quot;Segoe UI&amp;quot;, &amp;quot;Lucida Grande&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, FreeSans, Arimo, &amp;quot;Droid Sans&amp;quot;, &amp;quot;wenquanyi micro hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Hiragino Sans GB W3&amp;quot;, Roboto, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 0.8em; color: rgb(42, 51, 60); font-family: &amp;quot;Segoe UI&amp;quot;, &amp;quot;Lucida Grande&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, FreeSans, Arimo, &amp;quot;Droid Sans&amp;quot;, &amp;quot;wenquanyi micro hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Hiragino Sans GB W3&amp;quot;, Roboto, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;box-sizing: border-box; font-weight: 600;&quot;&gt;网络&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 0.8em; color: rgb(42, 51, 60); font-family: &amp;quot;Segoe UI&amp;quot;, &amp;quot;Lucida Grande&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, FreeSans, Arimo, &amp;quot;Droid Sans&amp;quot;, &amp;quot;wenquanyi micro hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Hiragino Sans GB W3&amp;quot;, Roboto, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;box-sizing: inherit;&quot;&gt;4G网络制式&lt;span class=&quot;Apple-tab-span&quot; style=&quot;box-sizing: inherit; font-size: 14px;&quot;&gt;&lt;/span&gt;主卡：移动4G（TDD-LTE）/联通4G（TDD-LTE/FDD-LTE）/电信4G（TDD-LTE/FDD-LTE）&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 0.8em; color: rgb(42, 51, 60); font-family: &amp;quot;Segoe UI&amp;quot;, &amp;quot;Lucida Grande&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, FreeSans, Arimo, &amp;quot;Droid Sans&amp;quot;, &amp;quot;wenquanyi micro hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Hiragino Sans GB W3&amp;quot;, Roboto, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;box-sizing: inherit;&quot;&gt;3G网络制式&lt;span class=&quot;Apple-tab-span&quot; style=&quot;box-sizing: inherit; font-size: 14px;&quot;&gt;&lt;/span&gt;主卡：移动3G（TD-SCDMA）/ 联通3G（WCDMA）/ 电信3G（CDMA 2000）。副卡：电信3G（CDMA2000）。备注：不能同时使用2张电信卡&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 0.8em; color: rgb(42, 51, 60); font-family: &amp;quot;Segoe UI&amp;quot;, &amp;quot;Lucida Grande&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, FreeSans, Arimo, &amp;quot;Droid Sans&amp;quot;, &amp;quot;wenquanyi micro hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Hiragino Sans GB W3&amp;quot;, Roboto, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;box-sizing: inherit;&quot;&gt;2G网络制式&lt;span class=&quot;Apple-tab-span&quot; style=&quot;box-sizing: inherit; font-size: 14px;&quot;&gt;&lt;/span&gt;主卡：移动2G（GSM）/联通2G（GSM）/电信2G（CDMA1X）；副卡：移动2G（GSM）/联通2G（GSM）/电信2G（CDMA1X）。备注：不能同时使用2张电信卡&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 0.8em; color: rgb(42, 51, 60); font-family: &amp;quot;Segoe UI&amp;quot;, &amp;quot;Lucida Grande&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, FreeSans, Arimo, &amp;quot;Droid Sans&amp;quot;, &amp;quot;wenquanyi micro hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Hiragino Sans GB W3&amp;quot;, Roboto, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;box-sizing: inherit;&quot;&gt;网络制式&lt;span class=&quot;Apple-tab-span&quot; style=&quot;box-sizing: inherit; font-size: 14px;&quot;&gt;&lt;/span&gt;支持移动4G+/4G/3G/2G，支持联通/电信 4G/3G/2G，备注：卡槽1、2可任意切换为主卡、副卡；不能同时使用2张电信卡&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 0.8em; color: rgb(42, 51, 60); font-family: &amp;quot;Segoe UI&amp;quot;, &amp;quot;Lucida Grande&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, FreeSans, Arimo, &amp;quot;Droid Sans&amp;quot;, &amp;quot;wenquanyi micro hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Hiragino Sans GB W3&amp;quot;, Roboto, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;box-sizing: inherit;&quot;&gt;网络频率&lt;span class=&quot;Apple-tab-span&quot; style=&quot;box-sizing: inherit; font-size: 14px;&quot;&gt;&lt;/span&gt;主卡：TDD-LTE：B38/B39/B40/B41（2555MHz~2655MHz）；FDD-LTE：B1/B3/B7；TD-SCDMA：B34/B39；WCDMA：B1/B2/B5/B8；CDMA2000/1X：BC0（800MHz）；GSM：850/900/1800/1900MHz；副卡：GSM：850/900/1800/1900MHz；备注：不能同时支持两张CDMA卡， 各个地区的网络和频段可能有所不同，具体取决于当地运营商以及您所在的位置&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 0.8em; color: rgb(42, 51, 60); font-family: &amp;quot;Segoe UI&amp;quot;, &amp;quot;Lucida Grande&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, FreeSans, Arimo, &amp;quot;Droid Sans&amp;quot;, &amp;quot;wenquanyi micro hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Hiragino Sans GB W3&amp;quot;, Roboto, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;box-sizing: inherit;&quot;&gt;数据业务&lt;span class=&quot;Apple-tab-span&quot; style=&quot;box-sizing: inherit; font-size: 14px;&quot;&gt;&lt;/span&gt;TDD-LTE/FDD-LTE/TD-SCDMA/WCDMA/HSPA+/DC-HSDPA/CDMA2000/CDMA1X/EDGE/GPRS；FDD-LTE：Cat4/Cat6；TDD-LTE：Cat4/Cat6&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 0.8em; color: rgb(42, 51, 60); font-family: &amp;quot;Segoe UI&amp;quot;, &amp;quot;Lucida Grande&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, FreeSans, Arimo, &amp;quot;Droid Sans&amp;quot;, &amp;quot;wenquanyi micro hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Hiragino Sans GB W3&amp;quot;, Roboto, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;box-sizing: inherit;&quot;&gt;浏览器&lt;span class=&quot;Apple-tab-span&quot; style=&quot;box-sizing: inherit; font-size: 14px;&quot;&gt;&lt;/span&gt;华为 EMUI 4.1 浏览器&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 0.8em; color: rgb(42, 51, 60); font-family: &amp;quot;Segoe UI&amp;quot;, &amp;quot;Lucida Grande&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, FreeSans, Arimo, &amp;quot;Droid Sans&amp;quot;, &amp;quot;wenquanyi micro hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Hiragino Sans GB W3&amp;quot;, Roboto, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;box-sizing: border-box; font-weight: 600;&quot;&gt;&lt;br/&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 0.8em; color: rgb(42, 51, 60); font-family: &amp;quot;Segoe UI&amp;quot;, &amp;quot;Lucida Grande&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, FreeSans, Arimo, &amp;quot;Droid Sans&amp;quot;, &amp;quot;wenquanyi micro hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Hiragino Sans GB W3&amp;quot;, Roboto, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;box-sizing: border-box; font-weight: 600;&quot;&gt;屏幕&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 0.8em; color: rgb(42, 51, 60); font-family: &amp;quot;Segoe UI&amp;quot;, &amp;quot;Lucida Grande&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, FreeSans, Arimo, &amp;quot;Droid Sans&amp;quot;, &amp;quot;wenquanyi micro hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Hiragino Sans GB W3&amp;quot;, Roboto, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;box-sizing: inherit;&quot;&gt;屏幕尺寸&lt;span class=&quot;Apple-tab-span&quot; style=&quot;box-sizing: inherit; font-size: 14px;&quot;&gt;&lt;/span&gt;6.6英寸&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 0.8em; color: rgb(42, 51, 60); font-family: &amp;quot;Segoe UI&amp;quot;, &amp;quot;Lucida Grande&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, FreeSans, Arimo, &amp;quot;Droid Sans&amp;quot;, &amp;quot;wenquanyi micro hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Hiragino Sans GB W3&amp;quot;, Roboto, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;box-sizing: inherit;&quot;&gt;屏幕色彩&lt;span class=&quot;Apple-tab-span&quot; style=&quot;box-sizing: inherit; font-size: 14px;&quot;&gt;&lt;/span&gt;1670万色&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 0.8em; color: rgb(42, 51, 60); font-family: &amp;quot;Segoe UI&amp;quot;, &amp;quot;Lucida Grande&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, FreeSans, Arimo, &amp;quot;Droid Sans&amp;quot;, &amp;quot;wenquanyi micro hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Hiragino Sans GB W3&amp;quot;, Roboto, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;box-sizing: inherit;&quot;&gt;屏幕类型&lt;span class=&quot;Apple-tab-span&quot; style=&quot;box-sizing: inherit; font-size: 14px;&quot;&gt;&lt;/span&gt;Super AMOLED显示屏&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 0.8em; color: rgb(42, 51, 60); font-family: &amp;quot;Segoe UI&amp;quot;, &amp;quot;Lucida Grande&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, FreeSans, Arimo, &amp;quot;Droid Sans&amp;quot;, &amp;quot;wenquanyi micro hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Hiragino Sans GB W3&amp;quot;, Roboto, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;box-sizing: inherit;&quot;&gt;分辨率&lt;span class=&quot;Apple-tab-span&quot; style=&quot;box-sizing: inherit; font-size: 14px;&quot;&gt;&lt;/span&gt;WQHD(2K) 2560×1440&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 0.8em; color: rgb(42, 51, 60); font-family: &amp;quot;Segoe UI&amp;quot;, &amp;quot;Lucida Grande&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, FreeSans, Arimo, &amp;quot;Droid Sans&amp;quot;, &amp;quot;wenquanyi micro hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Hiragino Sans GB W3&amp;quot;, Roboto, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;box-sizing: inherit;&quot;&gt;触摸屏&lt;span class=&quot;Apple-tab-span&quot; style=&quot;box-sizing: inherit; font-size: 14px;&quot;&gt;&lt;/span&gt;电容屏，多点触控&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 0.8em; color: rgb(42, 51, 60); font-family: &amp;quot;Segoe UI&amp;quot;, &amp;quot;Lucida Grande&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, FreeSans, Arimo, &amp;quot;Droid Sans&amp;quot;, &amp;quot;wenquanyi micro hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Hiragino Sans GB W3&amp;quot;, Roboto, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;box-sizing: inherit;&quot;&gt;屏幕像素密度PPI&lt;span class=&quot;Apple-tab-span&quot; style=&quot;box-sizing: inherit; font-size: 14px;&quot;&gt;&lt;/span&gt;443&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 0.8em; color: rgb(42, 51, 60); font-family: &amp;quot;Segoe UI&amp;quot;, &amp;quot;Lucida Grande&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, FreeSans, Arimo, &amp;quot;Droid Sans&amp;quot;, &amp;quot;wenquanyi micro hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Hiragino Sans GB W3&amp;quot;, Roboto, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;box-sizing: border-box; font-weight: 600;&quot;&gt;&lt;br/&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 0.8em; color: rgb(42, 51, 60); font-family: &amp;quot;Segoe UI&amp;quot;, &amp;quot;Lucida Grande&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, FreeSans, Arimo, &amp;quot;Droid Sans&amp;quot;, &amp;quot;wenquanyi micro hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Hiragino Sans GB W3&amp;quot;, Roboto, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;box-sizing: border-box; font-weight: 600;&quot;&gt;传感器&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 0.8em; color: rgb(42, 51, 60); font-family: &amp;quot;Segoe UI&amp;quot;, &amp;quot;Lucida Grande&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, FreeSans, Arimo, &amp;quot;Droid Sans&amp;quot;, &amp;quot;wenquanyi micro hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Hiragino Sans GB W3&amp;quot;, Roboto, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;box-sizing: inherit;&quot;&gt;重力感应器&lt;span class=&quot;Apple-tab-span&quot; style=&quot;box-sizing: inherit; font-size: 14px;&quot;&gt;&lt;/span&gt;支持&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 0.8em; color: rgb(42, 51, 60); font-family: &amp;quot;Segoe UI&amp;quot;, &amp;quot;Lucida Grande&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, FreeSans, Arimo, &amp;quot;Droid Sans&amp;quot;, &amp;quot;wenquanyi micro hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Hiragino Sans GB W3&amp;quot;, Roboto, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;box-sizing: inherit;&quot;&gt;光线传感器&lt;span class=&quot;Apple-tab-span&quot; style=&quot;box-sizing: inherit; font-size: 14px;&quot;&gt;&lt;/span&gt;支持&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 0.8em; color: rgb(42, 51, 60); font-family: &amp;quot;Segoe UI&amp;quot;, &amp;quot;Lucida Grande&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, FreeSans, Arimo, &amp;quot;Droid Sans&amp;quot;, &amp;quot;wenquanyi micro hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Hiragino Sans GB W3&amp;quot;, Roboto, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;box-sizing: inherit;&quot;&gt;距离感应器&lt;span class=&quot;Apple-tab-span&quot; style=&quot;box-sizing: inherit; font-size: 14px;&quot;&gt;&lt;/span&gt;支持&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 0.8em; color: rgb(42, 51, 60); font-family: &amp;quot;Segoe UI&amp;quot;, &amp;quot;Lucida Grande&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, FreeSans, Arimo, &amp;quot;Droid Sans&amp;quot;, &amp;quot;wenquanyi micro hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Hiragino Sans GB W3&amp;quot;, Roboto, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;box-sizing: inherit;&quot;&gt;指纹传感器&lt;span class=&quot;Apple-tab-span&quot; style=&quot;box-sizing: inherit; font-size: 14px;&quot;&gt;&lt;/span&gt;支持&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 0.8em; color: rgb(42, 51, 60); font-family: &amp;quot;Segoe UI&amp;quot;, &amp;quot;Lucida Grande&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, FreeSans, Arimo, &amp;quot;Droid Sans&amp;quot;, &amp;quot;wenquanyi micro hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Hiragino Sans GB W3&amp;quot;, Roboto, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;box-sizing: inherit;&quot;&gt;霍尔传感器&lt;span class=&quot;Apple-tab-span&quot; style=&quot;box-sizing: inherit; font-size: 14px;&quot;&gt;&lt;/span&gt;支持&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 0.8em; color: rgb(42, 51, 60); font-family: &amp;quot;Segoe UI&amp;quot;, &amp;quot;Lucida Grande&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, FreeSans, Arimo, &amp;quot;Droid Sans&amp;quot;, &amp;quot;wenquanyi micro hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Hiragino Sans GB W3&amp;quot;, Roboto, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;box-sizing: inherit;&quot;&gt;陀螺仪&lt;span class=&quot;Apple-tab-span&quot; style=&quot;box-sizing: inherit; font-size: 14px;&quot;&gt;&lt;/span&gt;支持&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 0.8em; color: rgb(42, 51, 60); font-family: &amp;quot;Segoe UI&amp;quot;, &amp;quot;Lucida Grande&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, FreeSans, Arimo, &amp;quot;Droid Sans&amp;quot;, &amp;quot;wenquanyi micro hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Hiragino Sans GB W3&amp;quot;, Roboto, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;box-sizing: inherit;&quot;&gt;指南针&lt;span class=&quot;Apple-tab-span&quot; style=&quot;box-sizing: inherit; font-size: 14px;&quot;&gt;&lt;/span&gt;支持&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 0.8em; color: rgb(42, 51, 60); font-family: &amp;quot;Segoe UI&amp;quot;, &amp;quot;Lucida Grande&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, FreeSans, Arimo, &amp;quot;Droid Sans&amp;quot;, &amp;quot;wenquanyi micro hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Hiragino Sans GB W3&amp;quot;, Roboto, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;box-sizing: inherit;&quot;&gt;气压计&lt;span class=&quot;Apple-tab-span&quot; style=&quot;box-sizing: inherit; font-size: 14px;&quot;&gt;&lt;/span&gt;支持&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 0.8em; color: rgb(42, 51, 60); font-family: &amp;quot;Segoe UI&amp;quot;, &amp;quot;Lucida Grande&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, FreeSans, Arimo, &amp;quot;Droid Sans&amp;quot;, &amp;quot;wenquanyi micro hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Hiragino Sans GB W3&amp;quot;, Roboto, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 0.8em; color: rgb(42, 51, 60); font-family: &amp;quot;Segoe UI&amp;quot;, &amp;quot;Lucida Grande&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, FreeSans, Arimo, &amp;quot;Droid Sans&amp;quot;, &amp;quot;wenquanyi micro hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Hiragino Sans GB W3&amp;quot;, Roboto, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;box-sizing: border-box; font-weight: 600;&quot;&gt;存储&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 0.8em; color: rgb(42, 51, 60); font-family: &amp;quot;Segoe UI&amp;quot;, &amp;quot;Lucida Grande&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, FreeSans, Arimo, &amp;quot;Droid Sans&amp;quot;, &amp;quot;wenquanyi micro hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Hiragino Sans GB W3&amp;quot;, Roboto, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;box-sizing: inherit;&quot;&gt;运行内存（RAM）&lt;span class=&quot;Apple-tab-span&quot; style=&quot;box-sizing: inherit; font-size: 14px;&quot;&gt;&lt;/span&gt;4GB&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 0.8em; color: rgb(42, 51, 60); font-family: &amp;quot;Segoe UI&amp;quot;, &amp;quot;Lucida Grande&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, FreeSans, Arimo, &amp;quot;Droid Sans&amp;quot;, &amp;quot;wenquanyi micro hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Hiragino Sans GB W3&amp;quot;, Roboto, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;box-sizing: inherit;&quot;&gt;机身内存（ROM）&lt;span class=&quot;Apple-tab-span&quot; style=&quot;box-sizing: inherit; font-size: 14px;&quot;&gt;&lt;/span&gt;128GB&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 0.8em; color: rgb(42, 51, 60); font-family: &amp;quot;Segoe UI&amp;quot;, &amp;quot;Lucida Grande&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, FreeSans, Arimo, &amp;quot;Droid Sans&amp;quot;, &amp;quot;wenquanyi micro hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Hiragino Sans GB W3&amp;quot;, Roboto, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;box-sizing: inherit;&quot;&gt;用户可用空间（ROM）&lt;span class=&quot;Apple-tab-span&quot; style=&quot;box-sizing: inherit; font-size: 14px;&quot;&gt;&lt;/span&gt;约剩余存储 110GB&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 0.8em; color: rgb(42, 51, 60); font-family: &amp;quot;Segoe UI&amp;quot;, &amp;quot;Lucida Grande&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, FreeSans, Arimo, &amp;quot;Droid Sans&amp;quot;, &amp;quot;wenquanyi micro hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Hiragino Sans GB W3&amp;quot;, Roboto, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;box-sizing: inherit;&quot;&gt;存储卡类型&lt;span class=&quot;Apple-tab-span&quot; style=&quot;box-sizing: inherit; font-size: 14px;&quot;&gt;&lt;/span&gt;microSD(TF)卡&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 0.8em; color: rgb(42, 51, 60); font-family: &amp;quot;Segoe UI&amp;quot;, &amp;quot;Lucida Grande&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, FreeSans, Arimo, &amp;quot;Droid Sans&amp;quot;, &amp;quot;wenquanyi micro hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Hiragino Sans GB W3&amp;quot;, Roboto, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;box-sizing: inherit;&quot;&gt;最大支持扩展&lt;span class=&quot;Apple-tab-span&quot; style=&quot;box-sizing: inherit; font-size: 14px;&quot;&gt;&lt;/span&gt;最高支持128GB（非标配）&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 0.8em; color: rgb(42, 51, 60); font-family: &amp;quot;Segoe UI&amp;quot;, &amp;quot;Lucida Grande&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, FreeSans, Arimo, &amp;quot;Droid Sans&amp;quot;, &amp;quot;wenquanyi micro hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Hiragino Sans GB W3&amp;quot;, Roboto, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 0.8em; color: rgb(42, 51, 60); font-family: &amp;quot;Segoe UI&amp;quot;, &amp;quot;Lucida Grande&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, FreeSans, Arimo, &amp;quot;Droid Sans&amp;quot;, &amp;quot;wenquanyi micro hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Hiragino Sans GB W3&amp;quot;, Roboto, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;box-sizing: border-box; font-weight: 600;&quot;&gt;娱乐功能&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 0.8em; color: rgb(42, 51, 60); font-family: &amp;quot;Segoe UI&amp;quot;, &amp;quot;Lucida Grande&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, FreeSans, Arimo, &amp;quot;Droid Sans&amp;quot;, &amp;quot;wenquanyi micro hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Hiragino Sans GB W3&amp;quot;, Roboto, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;box-sizing: inherit;&quot;&gt;音效&lt;span class=&quot;Apple-tab-span&quot; style=&quot;box-sizing: inherit; font-size: 14px;&quot;&gt;&lt;/span&gt;DTS&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 0.8em; color: rgb(42, 51, 60); font-family: &amp;quot;Segoe UI&amp;quot;, &amp;quot;Lucida Grande&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, FreeSans, Arimo, &amp;quot;Droid Sans&amp;quot;, &amp;quot;wenquanyi micro hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Hiragino Sans GB W3&amp;quot;, Roboto, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;box-sizing: inherit;&quot;&gt;电子书&lt;span class=&quot;Apple-tab-span&quot; style=&quot;box-sizing: inherit; font-size: 14px;&quot;&gt;&lt;/span&gt;支持&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 0.8em; color: rgb(42, 51, 60); font-family: &amp;quot;Segoe UI&amp;quot;, &amp;quot;Lucida Grande&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, FreeSans, Arimo, &amp;quot;Droid Sans&amp;quot;, &amp;quot;wenquanyi micro hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Hiragino Sans GB W3&amp;quot;, Roboto, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;box-sizing: inherit;&quot;&gt;收音机&lt;span class=&quot;Apple-tab-span&quot; style=&quot;box-sizing: inherit; font-size: 14px;&quot;&gt;&lt;/span&gt;支持&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 0.8em; color: rgb(42, 51, 60); font-family: &amp;quot;Segoe UI&amp;quot;, &amp;quot;Lucida Grande&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, FreeSans, Arimo, &amp;quot;Droid Sans&amp;quot;, &amp;quot;wenquanyi micro hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Hiragino Sans GB W3&amp;quot;, Roboto, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;box-sizing: inherit;&quot;&gt;内置软件&lt;span class=&quot;Apple-tab-span&quot; style=&quot;box-sizing: inherit; font-size: 14px;&quot;&gt;&lt;/span&gt;指南针、手电筒、镜子、日历、图库、音乐、视频、计算器、备忘录、录音机、天气、时钟、文件管理、手机管家&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 0.8em; color: rgb(42, 51, 60); font-family: &amp;quot;Segoe UI&amp;quot;, &amp;quot;Lucida Grande&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, FreeSans, Arimo, &amp;quot;Droid Sans&amp;quot;, &amp;quot;wenquanyi micro hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Hiragino Sans GB W3&amp;quot;, Roboto, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 0.8em; color: rgb(42, 51, 60); font-family: &amp;quot;Segoe UI&amp;quot;, &amp;quot;Lucida Grande&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, FreeSans, Arimo, &amp;quot;Droid Sans&amp;quot;, &amp;quot;wenquanyi micro hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Hiragino Sans GB W3&amp;quot;, Roboto, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;box-sizing: border-box; font-weight: 600;&quot;&gt;拍摄功能&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 0.8em; color: rgb(42, 51, 60); font-family: &amp;quot;Segoe UI&amp;quot;, &amp;quot;Lucida Grande&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, FreeSans, Arimo, &amp;quot;Droid Sans&amp;quot;, &amp;quot;wenquanyi micro hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Hiragino Sans GB W3&amp;quot;, Roboto, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;box-sizing: inherit;&quot;&gt;主摄像头&lt;span class=&quot;Apple-tab-span&quot; style=&quot;box-sizing: inherit; font-size: 14px;&quot;&gt;&lt;/span&gt;1300万像素 光学防抖&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 0.8em; color: rgb(42, 51, 60); font-family: &amp;quot;Segoe UI&amp;quot;, &amp;quot;Lucida Grande&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, FreeSans, Arimo, &amp;quot;Droid Sans&amp;quot;, &amp;quot;wenquanyi micro hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Hiragino Sans GB W3&amp;quot;, Roboto, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;box-sizing: inherit;&quot;&gt;副摄像头&lt;span class=&quot;Apple-tab-span&quot; style=&quot;box-sizing: inherit; font-size: 14px;&quot;&gt;&lt;/span&gt;800万像素&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 0.8em; color: rgb(42, 51, 60); font-family: &amp;quot;Segoe UI&amp;quot;, &amp;quot;Lucida Grande&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, FreeSans, Arimo, &amp;quot;Droid Sans&amp;quot;, &amp;quot;wenquanyi micro hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Hiragino Sans GB W3&amp;quot;, Roboto, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;box-sizing: inherit;&quot;&gt;传感器类型&lt;span class=&quot;Apple-tab-span&quot; style=&quot;box-sizing: inherit; font-size: 14px;&quot;&gt;&lt;/span&gt;CMOS&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 0.8em; color: rgb(42, 51, 60); font-family: &amp;quot;Segoe UI&amp;quot;, &amp;quot;Lucida Grande&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, FreeSans, Arimo, &amp;quot;Droid Sans&amp;quot;, &amp;quot;wenquanyi micro hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Hiragino Sans GB W3&amp;quot;, Roboto, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;box-sizing: inherit;&quot;&gt;闪光灯&lt;span class=&quot;Apple-tab-span&quot; style=&quot;box-sizing: inherit; font-size: 14px;&quot;&gt;&lt;/span&gt;双色温LED闪光灯&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 0.8em; color: rgb(42, 51, 60); font-family: &amp;quot;Segoe UI&amp;quot;, &amp;quot;Lucida Grande&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, FreeSans, Arimo, &amp;quot;Droid Sans&amp;quot;, &amp;quot;wenquanyi micro hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Hiragino Sans GB W3&amp;quot;, Roboto, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;box-sizing: inherit;&quot;&gt;视频拍摄&lt;span class=&quot;Apple-tab-span&quot; style=&quot;box-sizing: inherit; font-size: 14px;&quot;&gt;&lt;/span&gt;支持1080p全高清摄像&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 0.8em; color: rgb(42, 51, 60); font-family: &amp;quot;Segoe UI&amp;quot;, &amp;quot;Lucida Grande&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, FreeSans, Arimo, &amp;quot;Droid Sans&amp;quot;, &amp;quot;wenquanyi micro hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Hiragino Sans GB W3&amp;quot;, Roboto, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;box-sizing: inherit;&quot;&gt;连拍功能&lt;span class=&quot;Apple-tab-span&quot; style=&quot;box-sizing: inherit; font-size: 14px;&quot;&gt;&lt;/span&gt;支持&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 0.8em; color: rgb(42, 51, 60); font-family: &amp;quot;Segoe UI&amp;quot;, &amp;quot;Lucida Grande&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, FreeSans, Arimo, &amp;quot;Droid Sans&amp;quot;, &amp;quot;wenquanyi micro hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Hiragino Sans GB W3&amp;quot;, Roboto, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;box-sizing: inherit;&quot;&gt;防抖模式&lt;span class=&quot;Apple-tab-span&quot; style=&quot;box-sizing: inherit; font-size: 14px;&quot;&gt;&lt;/span&gt;光学防抖&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 0.8em; color: rgb(42, 51, 60); font-family: &amp;quot;Segoe UI&amp;quot;, &amp;quot;Lucida Grande&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, FreeSans, Arimo, &amp;quot;Droid Sans&amp;quot;, &amp;quot;wenquanyi micro hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Hiragino Sans GB W3&amp;quot;, Roboto, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;box-sizing: inherit;&quot;&gt;变焦模式&lt;span class=&quot;Apple-tab-span&quot; style=&quot;box-sizing: inherit; font-size: 14px;&quot;&gt;&lt;/span&gt;数码变焦，最大支持4X&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 0.8em; color: rgb(42, 51, 60); font-family: &amp;quot;Segoe UI&amp;quot;, &amp;quot;Lucida Grande&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, FreeSans, Arimo, &amp;quot;Droid Sans&amp;quot;, &amp;quot;wenquanyi micro hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Hiragino Sans GB W3&amp;quot;, Roboto, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;box-sizing: inherit;&quot;&gt;拍摄模式&lt;span class=&quot;Apple-tab-span&quot; style=&quot;box-sizing: inherit; font-size: 14px;&quot;&gt;&lt;/span&gt;流光快门（含车水马龙、光绘涂鸦、丝绢流水、绚丽星轨）、超级夜景、专业模式、滤镜拍照、美肤拍照(魅我)、美肤录像、全景、HDR、水印、有声照片、熄屏快拍、笑脸抓拍、声控拍照、定时拍照、触摸拍照、文档校正&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 0.8em; color: rgb(42, 51, 60); font-family: &amp;quot;Segoe UI&amp;quot;, &amp;quot;Lucida Grande&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, FreeSans, Arimo, &amp;quot;Droid Sans&amp;quot;, &amp;quot;wenquanyi micro hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Hiragino Sans GB W3&amp;quot;, Roboto, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;box-sizing: inherit;&quot;&gt;自动对焦&lt;span class=&quot;Apple-tab-span&quot; style=&quot;box-sizing: inherit; font-size: 14px;&quot;&gt;&lt;/span&gt;主摄像头支持&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 0.8em; color: rgb(42, 51, 60); font-family: &amp;quot;Segoe UI&amp;quot;, &amp;quot;Lucida Grande&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, FreeSans, Arimo, &amp;quot;Droid Sans&amp;quot;, &amp;quot;wenquanyi micro hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Hiragino Sans GB W3&amp;quot;, Roboto, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;box-sizing: inherit;&quot;&gt;声控拍照&lt;span class=&quot;Apple-tab-span&quot; style=&quot;box-sizing: inherit; font-size: 14px;&quot;&gt;&lt;/span&gt;支持&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 0.8em; color: rgb(42, 51, 60); font-family: &amp;quot;Segoe UI&amp;quot;, &amp;quot;Lucida Grande&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, FreeSans, Arimo, &amp;quot;Droid Sans&amp;quot;, &amp;quot;wenquanyi micro hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Hiragino Sans GB W3&amp;quot;, Roboto, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;box-sizing: inherit;&quot;&gt;有声拍照&lt;span class=&quot;Apple-tab-span&quot; style=&quot;box-sizing: inherit; font-size: 14px;&quot;&gt;&lt;/span&gt;支持&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 0.8em; color: rgb(42, 51, 60); font-family: &amp;quot;Segoe UI&amp;quot;, &amp;quot;Lucida Grande&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, FreeSans, Arimo, &amp;quot;Droid Sans&amp;quot;, &amp;quot;wenquanyi micro hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Hiragino Sans GB W3&amp;quot;, Roboto, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;box-sizing: inherit;&quot;&gt;拍照优化&lt;span class=&quot;Apple-tab-span&quot; style=&quot;box-sizing: inherit; font-size: 14px;&quot;&gt;&lt;/span&gt;ISP拍照优化&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 0.8em; color: rgb(42, 51, 60); font-family: &amp;quot;Segoe UI&amp;quot;, &amp;quot;Lucida Grande&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, FreeSans, Arimo, &amp;quot;Droid Sans&amp;quot;, &amp;quot;wenquanyi micro hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Hiragino Sans GB W3&amp;quot;, Roboto, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;box-sizing: inherit;&quot;&gt;人脸识别&lt;span class=&quot;Apple-tab-span&quot; style=&quot;box-sizing: inherit; font-size: 14px;&quot;&gt;&lt;/span&gt;支持&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 0.8em; color: rgb(42, 51, 60); font-family: &amp;quot;Segoe UI&amp;quot;, &amp;quot;Lucida Grande&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, FreeSans, Arimo, &amp;quot;Droid Sans&amp;quot;, &amp;quot;wenquanyi micro hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Hiragino Sans GB W3&amp;quot;, Roboto, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;box-sizing: inherit;&quot;&gt;笑脸抓拍&lt;span class=&quot;Apple-tab-span&quot; style=&quot;box-sizing: inherit; font-size: 14px;&quot;&gt;&lt;/span&gt;支持&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 0.8em; color: rgb(42, 51, 60); font-family: &amp;quot;Segoe UI&amp;quot;, &amp;quot;Lucida Grande&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, FreeSans, Arimo, &amp;quot;Droid Sans&amp;quot;, &amp;quot;wenquanyi micro hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Hiragino Sans GB W3&amp;quot;, Roboto, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;box-sizing: inherit;&quot;&gt;照片分辨率&lt;span class=&quot;Apple-tab-span&quot; style=&quot;box-sizing: inherit; font-size: 14px;&quot;&gt;&lt;/span&gt;最大支持4160×3120像素照片拍摄&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 0.8em; color: rgb(42, 51, 60); font-family: &amp;quot;Segoe UI&amp;quot;, &amp;quot;Lucida Grande&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, FreeSans, Arimo, &amp;quot;Droid Sans&amp;quot;, &amp;quot;wenquanyi micro hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Hiragino Sans GB W3&amp;quot;, Roboto, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 0.8em; color: rgb(42, 51, 60); font-family: &amp;quot;Segoe UI&amp;quot;, &amp;quot;Lucida Grande&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, FreeSans, Arimo, &amp;quot;Droid Sans&amp;quot;, &amp;quot;wenquanyi micro hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Hiragino Sans GB W3&amp;quot;, Roboto, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;box-sizing: border-box; font-weight: 600;&quot;&gt;传输功能&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 0.8em; color: rgb(42, 51, 60); font-family: &amp;quot;Segoe UI&amp;quot;, &amp;quot;Lucida Grande&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, FreeSans, Arimo, &amp;quot;Droid Sans&amp;quot;, &amp;quot;wenquanyi micro hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Hiragino Sans GB W3&amp;quot;, Roboto, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;box-sizing: inherit;&quot;&gt;WLAN&lt;span class=&quot;Apple-tab-span&quot; style=&quot;box-sizing: inherit; font-size: 14px;&quot;&gt;&lt;/span&gt;支持，802.11a/b/g/n/ac，2.4G和5G&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 0.8em; color: rgb(42, 51, 60); font-family: &amp;quot;Segoe UI&amp;quot;, &amp;quot;Lucida Grande&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, FreeSans, Arimo, &amp;quot;Droid Sans&amp;quot;, &amp;quot;wenquanyi micro hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Hiragino Sans GB W3&amp;quot;, Roboto, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;box-sizing: inherit;&quot;&gt;Wi-Fi功能&lt;span class=&quot;Apple-tab-span&quot; style=&quot;box-sizing: inherit; font-size: 14px;&quot;&gt;&lt;/span&gt;支持，802.11a/b/g/n/ac，2.4G和5G&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 0.8em; color: rgb(42, 51, 60); font-family: &amp;quot;Segoe UI&amp;quot;, &amp;quot;Lucida Grande&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, FreeSans, Arimo, &amp;quot;Droid Sans&amp;quot;, &amp;quot;wenquanyi micro hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Hiragino Sans GB W3&amp;quot;, Roboto, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;box-sizing: inherit;&quot;&gt;Wi-Fi热点&lt;span class=&quot;Apple-tab-span&quot; style=&quot;box-sizing: inherit; font-size: 14px;&quot;&gt;&lt;/span&gt;支持&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 0.8em; color: rgb(42, 51, 60); font-family: &amp;quot;Segoe UI&amp;quot;, &amp;quot;Lucida Grande&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, FreeSans, Arimo, &amp;quot;Droid Sans&amp;quot;, &amp;quot;wenquanyi micro hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Hiragino Sans GB W3&amp;quot;, Roboto, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;box-sizing: inherit;&quot;&gt;WiFi Display&lt;span class=&quot;Apple-tab-span&quot; style=&quot;box-sizing: inherit; font-size: 14px;&quot;&gt;&lt;/span&gt;支持&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 0.8em; color: rgb(42, 51, 60); font-family: &amp;quot;Segoe UI&amp;quot;, &amp;quot;Lucida Grande&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, FreeSans, Arimo, &amp;quot;Droid Sans&amp;quot;, &amp;quot;wenquanyi micro hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Hiragino Sans GB W3&amp;quot;, Roboto, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;box-sizing: inherit;&quot;&gt;WLAN Direct&lt;span class=&quot;Apple-tab-span&quot; style=&quot;box-sizing: inherit; font-size: 14px;&quot;&gt;&lt;/span&gt;支持&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 0.8em; color: rgb(42, 51, 60); font-family: &amp;quot;Segoe UI&amp;quot;, &amp;quot;Lucida Grande&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, FreeSans, Arimo, &amp;quot;Droid Sans&amp;quot;, &amp;quot;wenquanyi micro hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Hiragino Sans GB W3&amp;quot;, Roboto, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;box-sizing: inherit;&quot;&gt;多屏互动&lt;span class=&quot;Apple-tab-span&quot; style=&quot;box-sizing: inherit; font-size: 14px;&quot;&gt;&lt;/span&gt;支持&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 0.8em; color: rgb(42, 51, 60); font-family: &amp;quot;Segoe UI&amp;quot;, &amp;quot;Lucida Grande&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, FreeSans, Arimo, &amp;quot;Droid Sans&amp;quot;, &amp;quot;wenquanyi micro hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Hiragino Sans GB W3&amp;quot;, Roboto, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;box-sizing: inherit;&quot;&gt;蓝牙&lt;span class=&quot;Apple-tab-span&quot; style=&quot;box-sizing: inherit; font-size: 14px;&quot;&gt;&lt;/span&gt;BT4.2，支持BLE&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 0.8em; color: rgb(42, 51, 60); font-family: &amp;quot;Segoe UI&amp;quot;, &amp;quot;Lucida Grande&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, FreeSans, Arimo, &amp;quot;Droid Sans&amp;quot;, &amp;quot;wenquanyi micro hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Hiragino Sans GB W3&amp;quot;, Roboto, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;box-sizing: inherit;&quot;&gt;OTG&lt;span class=&quot;Apple-tab-span&quot; style=&quot;box-sizing: inherit; font-size: 14px;&quot;&gt;&lt;/span&gt;支持&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 0.8em; color: rgb(42, 51, 60); font-family: &amp;quot;Segoe UI&amp;quot;, &amp;quot;Lucida Grande&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, FreeSans, Arimo, &amp;quot;Droid Sans&amp;quot;, &amp;quot;wenquanyi micro hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Hiragino Sans GB W3&amp;quot;, Roboto, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;box-sizing: inherit;&quot;&gt;天际通&lt;span class=&quot;Apple-tab-span&quot; style=&quot;box-sizing: inherit; font-size: 14px;&quot;&gt;&lt;/span&gt;支持&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 0.8em; color: rgb(42, 51, 60); font-family: &amp;quot;Segoe UI&amp;quot;, &amp;quot;Lucida Grande&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, FreeSans, Arimo, &amp;quot;Droid Sans&amp;quot;, &amp;quot;wenquanyi micro hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Hiragino Sans GB W3&amp;quot;, Roboto, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;box-sizing: inherit;&quot;&gt;USB&lt;span class=&quot;Apple-tab-span&quot; style=&quot;box-sizing: inherit; font-size: 14px;&quot;&gt;&lt;/span&gt;USB2.0，480Mbit/s。支持USB共享网络，USB充电，OTG功能&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 0.8em; color: rgb(42, 51, 60); font-family: &amp;quot;Segoe UI&amp;quot;, &amp;quot;Lucida Grande&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, FreeSans, Arimo, &amp;quot;Droid Sans&amp;quot;, &amp;quot;wenquanyi micro hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Hiragino Sans GB W3&amp;quot;, Roboto, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;box-sizing: inherit;&quot;&gt;GPS&lt;span class=&quot;Apple-tab-span&quot; style=&quot;box-sizing: inherit; font-size: 14px;&quot;&gt;&lt;/span&gt;GPS/AGPS/Glonass/北斗&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 0.8em; color: rgb(42, 51, 60); font-family: &amp;quot;Segoe UI&amp;quot;, &amp;quot;Lucida Grande&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, FreeSans, Arimo, &amp;quot;Droid Sans&amp;quot;, &amp;quot;wenquanyi micro hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Hiragino Sans GB W3&amp;quot;, Roboto, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;box-sizing: inherit;&quot;&gt;导航软件&lt;span class=&quot;Apple-tab-span&quot; style=&quot;box-sizing: inherit; font-size: 14px;&quot;&gt;&lt;/span&gt;支持&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 0.8em; color: rgb(42, 51, 60); font-family: &amp;quot;Segoe UI&amp;quot;, &amp;quot;Lucida Grande&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, FreeSans, Arimo, &amp;quot;Droid Sans&amp;quot;, &amp;quot;wenquanyi micro hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Hiragino Sans GB W3&amp;quot;, Roboto, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;box-sizing: inherit;&quot;&gt;蜂窝网络定位&lt;span class=&quot;Apple-tab-span&quot; style=&quot;box-sizing: inherit; font-size: 14px;&quot;&gt;&lt;/span&gt;支持&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 0.8em; color: rgb(42, 51, 60); font-family: &amp;quot;Segoe UI&amp;quot;, &amp;quot;Lucida Grande&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, FreeSans, Arimo, &amp;quot;Droid Sans&amp;quot;, &amp;quot;wenquanyi micro hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Hiragino Sans GB W3&amp;quot;, Roboto, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;box-sizing: inherit;&quot;&gt;WLAN网络定位&lt;span class=&quot;Apple-tab-span&quot; style=&quot;box-sizing: inherit; font-size: 14px;&quot;&gt;&lt;/span&gt;支持&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 0.8em; color: rgb(42, 51, 60); font-family: &amp;quot;Segoe UI&amp;quot;, &amp;quot;Lucida Grande&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, FreeSans, Arimo, &amp;quot;Droid Sans&amp;quot;, &amp;quot;wenquanyi micro hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Hiragino Sans GB W3&amp;quot;, Roboto, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 0.8em; color: rgb(42, 51, 60); font-family: &amp;quot;Segoe UI&amp;quot;, &amp;quot;Lucida Grande&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, FreeSans, Arimo, &amp;quot;Droid Sans&amp;quot;, &amp;quot;wenquanyi micro hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Hiragino Sans GB W3&amp;quot;, Roboto, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;box-sizing: border-box; font-weight: 600;&quot;&gt;通话和信息功能&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 0.8em; color: rgb(42, 51, 60); font-family: &amp;quot;Segoe UI&amp;quot;, &amp;quot;Lucida Grande&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, FreeSans, Arimo, &amp;quot;Droid Sans&amp;quot;, &amp;quot;wenquanyi micro hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Hiragino Sans GB W3&amp;quot;, Roboto, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;box-sizing: inherit;&quot;&gt;语音&lt;span class=&quot;Apple-tab-span&quot; style=&quot;box-sizing: inherit; font-size: 14px;&quot;&gt;&lt;/span&gt;支持&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 0.8em; color: rgb(42, 51, 60); font-family: &amp;quot;Segoe UI&amp;quot;, &amp;quot;Lucida Grande&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, FreeSans, Arimo, &amp;quot;Droid Sans&amp;quot;, &amp;quot;wenquanyi micro hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Hiragino Sans GB W3&amp;quot;, Roboto, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;box-sizing: inherit;&quot;&gt;3G视频通话&lt;span class=&quot;Apple-tab-span&quot; style=&quot;box-sizing: inherit; font-size: 14px;&quot;&gt;&lt;/span&gt;支持4G高清语音视频通话，3G网络下不支持视频通话&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 0.8em; color: rgb(42, 51, 60); font-family: &amp;quot;Segoe UI&amp;quot;, &amp;quot;Lucida Grande&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, FreeSans, Arimo, &amp;quot;Droid Sans&amp;quot;, &amp;quot;wenquanyi micro hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Hiragino Sans GB W3&amp;quot;, Roboto, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;box-sizing: inherit;&quot;&gt;彩信&lt;span class=&quot;Apple-tab-span&quot; style=&quot;box-sizing: inherit; font-size: 14px;&quot;&gt;&lt;/span&gt;支持&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 0.8em; color: rgb(42, 51, 60); font-family: &amp;quot;Segoe UI&amp;quot;, &amp;quot;Lucida Grande&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, FreeSans, Arimo, &amp;quot;Droid Sans&amp;quot;, &amp;quot;wenquanyi micro hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Hiragino Sans GB W3&amp;quot;, Roboto, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 0.8em; color: rgb(42, 51, 60); font-family: &amp;quot;Segoe UI&amp;quot;, &amp;quot;Lucida Grande&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, FreeSans, Arimo, &amp;quot;Droid Sans&amp;quot;, &amp;quot;wenquanyi micro hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Hiragino Sans GB W3&amp;quot;, Roboto, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;box-sizing: border-box; font-weight: 600;&quot;&gt;个人助理&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 0.8em; color: rgb(42, 51, 60); font-family: &amp;quot;Segoe UI&amp;quot;, &amp;quot;Lucida Grande&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, FreeSans, Arimo, &amp;quot;Droid Sans&amp;quot;, &amp;quot;wenquanyi micro hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Hiragino Sans GB W3&amp;quot;, Roboto, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;box-sizing: inherit;&quot;&gt;云服务&lt;span class=&quot;Apple-tab-span&quot; style=&quot;box-sizing: inherit; font-size: 14px;&quot;&gt;&lt;/span&gt;云同步、云备份、手机找回&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 0.8em; color: rgb(42, 51, 60); font-family: &amp;quot;Segoe UI&amp;quot;, &amp;quot;Lucida Grande&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, FreeSans, Arimo, &amp;quot;Droid Sans&amp;quot;, &amp;quot;wenquanyi micro hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Hiragino Sans GB W3&amp;quot;, Roboto, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;box-sizing: inherit;&quot;&gt;Office&lt;span class=&quot;Apple-tab-span&quot; style=&quot;box-sizing: inherit; font-size: 14px;&quot;&gt;&lt;/span&gt;内置WPS Office，支持OFFICE文档查看和编辑，支持pdf文档查看等&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 0.8em; color: rgb(42, 51, 60); font-family: &amp;quot;Segoe UI&amp;quot;, &amp;quot;Lucida Grande&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, FreeSans, Arimo, &amp;quot;Droid Sans&amp;quot;, &amp;quot;wenquanyi micro hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Hiragino Sans GB W3&amp;quot;, Roboto, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;box-sizing: inherit;&quot;&gt;名片读取&lt;span class=&quot;Apple-tab-span&quot; style=&quot;box-sizing: inherit; font-size: 14px;&quot;&gt;&lt;/span&gt;支持&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 0.8em; color: rgb(42, 51, 60); font-family: &amp;quot;Segoe UI&amp;quot;, &amp;quot;Lucida Grande&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, FreeSans, Arimo, &amp;quot;Droid Sans&amp;quot;, &amp;quot;wenquanyi micro hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Hiragino Sans GB W3&amp;quot;, Roboto, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;box-sizing: inherit;&quot;&gt;电子邮件&lt;span class=&quot;Apple-tab-span&quot; style=&quot;box-sizing: inherit; font-size: 14px;&quot;&gt;&lt;/span&gt;POP3/IMAP/Exchange&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 0.8em; color: rgb(42, 51, 60); font-family: &amp;quot;Segoe UI&amp;quot;, &amp;quot;Lucida Grande&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, FreeSans, Arimo, &amp;quot;Droid Sans&amp;quot;, &amp;quot;wenquanyi micro hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Hiragino Sans GB W3&amp;quot;, Roboto, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;box-sizing: inherit;&quot;&gt;计算器&lt;span class=&quot;Apple-tab-span&quot; style=&quot;box-sizing: inherit; font-size: 14px;&quot;&gt;&lt;/span&gt;支持&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 0.8em; color: rgb(42, 51, 60); font-family: &amp;quot;Segoe UI&amp;quot;, &amp;quot;Lucida Grande&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, FreeSans, Arimo, &amp;quot;Droid Sans&amp;quot;, &amp;quot;wenquanyi micro hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Hiragino Sans GB W3&amp;quot;, Roboto, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;box-sizing: inherit;&quot;&gt;闹钟&lt;span class=&quot;Apple-tab-span&quot; style=&quot;box-sizing: inherit; font-size: 14px;&quot;&gt;&lt;/span&gt;支持&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 0.8em; color: rgb(42, 51, 60); font-family: &amp;quot;Segoe UI&amp;quot;, &amp;quot;Lucida Grande&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, FreeSans, Arimo, &amp;quot;Droid Sans&amp;quot;, &amp;quot;wenquanyi micro hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Hiragino Sans GB W3&amp;quot;, Roboto, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;box-sizing: inherit;&quot;&gt;录音&lt;span class=&quot;Apple-tab-span&quot; style=&quot;box-sizing: inherit; font-size: 14px;&quot;&gt;&lt;/span&gt;支持&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 0.8em; color: rgb(42, 51, 60); font-family: &amp;quot;Segoe UI&amp;quot;, &amp;quot;Lucida Grande&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, FreeSans, Arimo, &amp;quot;Droid Sans&amp;quot;, &amp;quot;wenquanyi micro hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Hiragino Sans GB W3&amp;quot;, Roboto, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;box-sizing: inherit;&quot;&gt;实用工具&lt;span class=&quot;Apple-tab-span&quot; style=&quot;box-sizing: inherit; font-size: 14px;&quot;&gt;&lt;/span&gt;指南针、手电筒、镜子、日历、图库、音乐、视频、计算器、备忘录、录音机、天气、时钟、文件管理、手机管家&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 0.8em; color: rgb(42, 51, 60); font-family: &amp;quot;Segoe UI&amp;quot;, &amp;quot;Lucida Grande&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, FreeSans, Arimo, &amp;quot;Droid Sans&amp;quot;, &amp;quot;wenquanyi micro hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Hiragino Sans GB W3&amp;quot;, Roboto, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;box-sizing: inherit;&quot;&gt;特色应用&lt;span class=&quot;Apple-tab-span&quot; style=&quot;box-sizing: inherit; font-size: 14px;&quot;&gt;&lt;/span&gt;全向录音/指向回放、定向免提、指关节手势、分屏多窗口、语音控制、情景智能、单手操作、杂志锁屏、手机找回、无线WIFI打印、学生模式、多屏互动、运动健康&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 0.8em; color: rgb(42, 51, 60); font-family: &amp;quot;Segoe UI&amp;quot;, &amp;quot;Lucida Grande&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, FreeSans, Arimo, &amp;quot;Droid Sans&amp;quot;, &amp;quot;wenquanyi micro hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Hiragino Sans GB W3&amp;quot;, Roboto, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 0.8em; color: rgb(42, 51, 60); font-family: &amp;quot;Segoe UI&amp;quot;, &amp;quot;Lucida Grande&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, FreeSans, Arimo, &amp;quot;Droid Sans&amp;quot;, &amp;quot;wenquanyi micro hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Hiragino Sans GB W3&amp;quot;, Roboto, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;box-sizing: inherit;&quot;&gt;其他&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 0.8em; color: rgb(42, 51, 60); font-family: &amp;quot;Segoe UI&amp;quot;, &amp;quot;Lucida Grande&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, FreeSans, Arimo, &amp;quot;Droid Sans&amp;quot;, &amp;quot;wenquanyi micro hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Hiragino Sans GB W3&amp;quot;, Roboto, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;box-sizing: inherit;&quot;&gt;电池类型&lt;span class=&quot;Apple-tab-span&quot; style=&quot;box-sizing: inherit; font-size: 14px;&quot;&gt;&lt;/span&gt;Li-Polymer 锂聚合物电池&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 0.8em; color: rgb(42, 51, 60); font-family: &amp;quot;Segoe UI&amp;quot;, &amp;quot;Lucida Grande&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, FreeSans, Arimo, &amp;quot;Droid Sans&amp;quot;, &amp;quot;wenquanyi micro hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Hiragino Sans GB W3&amp;quot;, Roboto, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;box-sizing: inherit;&quot;&gt;电池容量&lt;span class=&quot;Apple-tab-span&quot; style=&quot;box-sizing: inherit; font-size: 14px;&quot;&gt;&lt;/span&gt;4500mAh（典型值）&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 0.8em; color: rgb(42, 51, 60); font-family: &amp;quot;Segoe UI&amp;quot;, &amp;quot;Lucida Grande&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, FreeSans, Arimo, &amp;quot;Droid Sans&amp;quot;, &amp;quot;wenquanyi micro hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Hiragino Sans GB W3&amp;quot;, Roboto, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;box-sizing: inherit;&quot;&gt;电池更换&lt;span class=&quot;Apple-tab-span&quot; style=&quot;box-sizing: inherit; font-size: 14px;&quot;&gt;&lt;/span&gt;手机内置，不支持&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 0.8em; color: rgb(42, 51, 60); font-family: &amp;quot;Segoe UI&amp;quot;, &amp;quot;Lucida Grande&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, FreeSans, Arimo, &amp;quot;Droid Sans&amp;quot;, &amp;quot;wenquanyi micro hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Hiragino Sans GB W3&amp;quot;, Roboto, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;box-sizing: inherit;&quot;&gt;充电时间&lt;span class=&quot;Apple-tab-span&quot; style=&quot;box-sizing: inherit; font-size: 14px;&quot;&gt;&lt;/span&gt;约150分钟（华为9V2A适配器）&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 0.8em; color: rgb(42, 51, 60); font-family: &amp;quot;Segoe UI&amp;quot;, &amp;quot;Lucida Grande&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, FreeSans, Arimo, &amp;quot;Droid Sans&amp;quot;, &amp;quot;wenquanyi micro hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Hiragino Sans GB W3&amp;quot;, Roboto, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;box-sizing: inherit;&quot;&gt;数据线接口&lt;span class=&quot;Apple-tab-span&quot; style=&quot;box-sizing: inherit; font-size: 14px;&quot;&gt;&lt;/span&gt;USB TYPE-C&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 0.8em; color: rgb(42, 51, 60); font-family: &amp;quot;Segoe UI&amp;quot;, &amp;quot;Lucida Grande&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, FreeSans, Arimo, &amp;quot;Droid Sans&amp;quot;, &amp;quot;wenquanyi micro hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Hiragino Sans GB W3&amp;quot;, Roboto, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;box-sizing: inherit;&quot;&gt;耳机接口&lt;span class=&quot;Apple-tab-span&quot; style=&quot;box-sizing: inherit; font-size: 14px;&quot;&gt;&lt;/span&gt;3.5mm 耳机接口&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 0.8em; color: rgb(42, 51, 60); font-family: &amp;quot;Segoe UI&amp;quot;, &amp;quot;Lucida Grande&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, FreeSans, Arimo, &amp;quot;Droid Sans&amp;quot;, &amp;quot;wenquanyi micro hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Hiragino Sans GB W3&amp;quot;, Roboto, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;box-sizing: inherit;&quot;&gt;SIM卡类型&lt;span class=&quot;Apple-tab-span&quot; style=&quot;box-sizing: inherit; font-size: 14px;&quot;&gt;&lt;/span&gt;Nano SIM卡；卡槽1（内卡槽）、卡槽2（外卡槽）可通过双卡管理界面任意切换为主卡、副卡。卡槽2（外卡槽）支持Nano SIM和microSD二选一&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 0.8em; color: rgb(42, 51, 60); font-family: &amp;quot;Segoe UI&amp;quot;, &amp;quot;Lucida Grande&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, FreeSans, Arimo, &amp;quot;Droid Sans&amp;quot;, &amp;quot;wenquanyi micro hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Hiragino Sans GB W3&amp;quot;, Roboto, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;box-sizing: inherit;&quot;&gt;软件升级&lt;span class=&quot;Apple-tab-span&quot; style=&quot;box-sizing: inherit; font-size: 14px;&quot;&gt;&lt;/span&gt;HOTA 在线升级&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 0.8em; color: rgb(42, 51, 60); font-family: &amp;quot;Segoe UI&amp;quot;, &amp;quot;Lucida Grande&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, FreeSans, Arimo, &amp;quot;Droid Sans&amp;quot;, &amp;quot;wenquanyi micro hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Hiragino Sans GB W3&amp;quot;, Roboto, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;box-sizing: inherit;&quot;&gt;字体大小设置&lt;span class=&quot;Apple-tab-span&quot; style=&quot;box-sizing: inherit; font-size: 14px;&quot;&gt;&lt;/span&gt;支持&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 0.8em; color: rgb(42, 51, 60); font-family: &amp;quot;Segoe UI&amp;quot;, &amp;quot;Lucida Grande&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, FreeSans, Arimo, &amp;quot;Droid Sans&amp;quot;, &amp;quot;wenquanyi micro hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Hiragino Sans GB W3&amp;quot;, Roboto, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;box-sizing: inherit;&quot;&gt;语音助手&lt;span class=&quot;Apple-tab-span&quot; style=&quot;box-sizing: inherit; font-size: 14px;&quot;&gt;&lt;/span&gt;支持&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 0.8em; color: rgb(42, 51, 60); font-family: &amp;quot;Segoe UI&amp;quot;, &amp;quot;Lucida Grande&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, FreeSans, Arimo, &amp;quot;Droid Sans&amp;quot;, &amp;quot;wenquanyi micro hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Hiragino Sans GB W3&amp;quot;, Roboto, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;box-sizing: inherit;&quot;&gt;软件名称&lt;span class=&quot;Apple-tab-span&quot; style=&quot;box-sizing: inherit; font-size: 14px;&quot;&gt;&lt;/span&gt;华为终端智能设备人机交互通信软件V2.0&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 0.8em; color: rgb(42, 51, 60); font-family: &amp;quot;Segoe UI&amp;quot;, &amp;quot;Lucida Grande&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, FreeSans, Arimo, &amp;quot;Droid Sans&amp;quot;, &amp;quot;wenquanyi micro hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Hiragino Sans GB W3&amp;quot;, Roboto, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;box-sizing: inherit;&quot;&gt;机身尺寸&lt;span class=&quot;Apple-tab-span&quot; style=&quot;box-sizing: inherit; font-size: 14px;&quot;&gt;&lt;/span&gt;178.8mm×90.9mm×7.18mm&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 0.8em; color: rgb(42, 51, 60); font-family: &amp;quot;Segoe UI&amp;quot;, &amp;quot;Lucida Grande&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, FreeSans, Arimo, &amp;quot;Droid Sans&amp;quot;, &amp;quot;wenquanyi micro hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Hiragino Sans GB W3&amp;quot;, Roboto, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;box-sizing: inherit;&quot;&gt;机身重量&lt;span class=&quot;Apple-tab-span&quot; style=&quot;box-sizing: inherit; font-size: 14px;&quot;&gt;&lt;/span&gt;约219g&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '&lt;ul class=&quot; list-paddingleft-2&quot; style=&quot;box-sizing: border-box; margin-bottom: 1rem; color: rgb(42, 51, 60); font-family: &amp;quot;Segoe UI&amp;quot;, &amp;quot;Lucida Grande&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, FreeSans, Arimo, &amp;quot;Droid Sans&amp;quot;, &amp;quot;wenquanyi micro hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Hiragino Sans GB W3&amp;quot;, Roboto, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;li&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 0px;&quot;&gt;&lt;span style=&quot;box-sizing: inherit;&quot;&gt;手机（含内置电池） x 1&lt;/span&gt;&lt;/p&gt;&lt;/li&gt;&lt;li&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 0px;&quot;&gt;&lt;span style=&quot;box-sizing: inherit;&quot;&gt;快速指南 x 1&lt;/span&gt;&lt;/p&gt;&lt;/li&gt;&lt;li&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 0px;&quot;&gt;&lt;span style=&quot;box-sizing: inherit;&quot;&gt;三包凭证 x 1&lt;/span&gt;&lt;/p&gt;&lt;/li&gt;&lt;li&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 0px;&quot;&gt;&lt;span style=&quot;box-sizing: inherit;&quot;&gt;取卡针 x 1&lt;/span&gt;&lt;/p&gt;&lt;/li&gt;&lt;/ul&gt;', '1526613043', '1527507836');
INSERT INTO `ey_addonproduct` VALUES ('3', '28', '&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 0.8em; color: rgb(42, 51, 60); font-family: &amp;quot;Segoe UI&amp;quot;, &amp;quot;Lucida Grande&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, FreeSans, Arimo, &amp;quot;Droid Sans&amp;quot;, &amp;quot;wenquanyi micro hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Hiragino Sans GB W3&amp;quot;, Roboto, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;box-sizing: inherit;&quot;&gt;其他属性&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 0.8em; color: rgb(42, 51, 60); font-family: &amp;quot;Segoe UI&amp;quot;, &amp;quot;Lucida Grande&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, FreeSans, Arimo, &amp;quot;Droid Sans&amp;quot;, &amp;quot;wenquanyi micro hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Hiragino Sans GB W3&amp;quot;, Roboto, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;box-sizing: inherit;&quot;&gt;包装体积&lt;span class=&quot;Apple-tab-span&quot; style=&quot;box-sizing: inherit; font-size: 14px;&quot;&gt;&lt;/span&gt;&amp;nbsp;375mm*115mm*292mm&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 0.8em; color: rgb(42, 51, 60); font-family: &amp;quot;Segoe UI&amp;quot;, &amp;quot;Lucida Grande&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, FreeSans, Arimo, &amp;quot;Droid Sans&amp;quot;, &amp;quot;wenquanyi micro hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Hiragino Sans GB W3&amp;quot;, Roboto, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;box-sizing: inherit;&quot;&gt;是否PC平板二合一&lt;span class=&quot;Apple-tab-span&quot; style=&quot;box-sizing: inherit; font-size: 14px;&quot;&gt;&lt;/span&gt;&amp;nbsp;否&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 0.8em; color: rgb(42, 51, 60); font-family: &amp;quot;Segoe UI&amp;quot;, &amp;quot;Lucida Grande&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, FreeSans, Arimo, &amp;quot;Droid Sans&amp;quot;, &amp;quot;wenquanyi micro hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Hiragino Sans GB W3&amp;quot;, Roboto, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;box-sizing: inherit;&quot;&gt;适用场景&lt;span class=&quot;Apple-tab-span&quot; style=&quot;box-sizing: inherit; font-size: 14px;&quot;&gt;&lt;/span&gt;&amp;nbsp;女性定位 轻薄便携 学生 商务办公 高清游戏 家庭娱乐&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 0.8em; color: rgb(42, 51, 60); font-family: &amp;quot;Segoe UI&amp;quot;, &amp;quot;Lucida Grande&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, FreeSans, Arimo, &amp;quot;Droid Sans&amp;quot;, &amp;quot;wenquanyi micro hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Hiragino Sans GB W3&amp;quot;, Roboto, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;box-sizing: inherit;&quot;&gt;售后服务&lt;span class=&quot;Apple-tab-span&quot; style=&quot;box-sizing: inherit; font-size: 14px;&quot;&gt;&lt;/span&gt;&amp;nbsp;全国联保&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 0.8em; color: rgb(42, 51, 60); font-family: &amp;quot;Segoe UI&amp;quot;, &amp;quot;Lucida Grande&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, FreeSans, Arimo, &amp;quot;Droid Sans&amp;quot;, &amp;quot;wenquanyi micro hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Hiragino Sans GB W3&amp;quot;, Roboto, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;box-sizing: inherit;&quot;&gt;是否超极本&lt;span class=&quot;Apple-tab-span&quot; style=&quot;box-sizing: inherit; font-size: 14px;&quot;&gt;&lt;/span&gt;&amp;nbsp;是&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 0.8em; color: rgb(42, 51, 60); font-family: &amp;quot;Segoe UI&amp;quot;, &amp;quot;Lucida Grande&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, FreeSans, Arimo, &amp;quot;Droid Sans&amp;quot;, &amp;quot;wenquanyi micro hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Hiragino Sans GB W3&amp;quot;, Roboto, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;box-sizing: border-box; font-weight: 600;&quot;&gt;基本参数&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 0.8em; color: rgb(42, 51, 60); font-family: &amp;quot;Segoe UI&amp;quot;, &amp;quot;Lucida Grande&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, FreeSans, Arimo, &amp;quot;Droid Sans&amp;quot;, &amp;quot;wenquanyi micro hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Hiragino Sans GB W3&amp;quot;, Roboto, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;box-sizing: inherit;&quot;&gt;品牌&lt;span class=&quot;Apple-tab-span&quot; style=&quot;box-sizing: inherit; font-size: 14px;&quot;&gt;&lt;/span&gt;&amp;nbsp;Xiaomi/小米&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 0.8em; color: rgb(42, 51, 60); font-family: &amp;quot;Segoe UI&amp;quot;, &amp;quot;Lucida Grande&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, FreeSans, Arimo, &amp;quot;Droid Sans&amp;quot;, &amp;quot;wenquanyi micro hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Hiragino Sans GB W3&amp;quot;, Roboto, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;box-sizing: inherit;&quot;&gt;系列&lt;span class=&quot;Apple-tab-span&quot; style=&quot;box-sizing: inherit; font-size: 14px;&quot;&gt;&lt;/span&gt;&amp;nbsp;小米笔记本Air&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 0.8em; color: rgb(42, 51, 60); font-family: &amp;quot;Segoe UI&amp;quot;, &amp;quot;Lucida Grande&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, FreeSans, Arimo, &amp;quot;Droid Sans&amp;quot;, &amp;quot;wenquanyi micro hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Hiragino Sans GB W3&amp;quot;, Roboto, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;box-sizing: inherit;&quot;&gt;CPU&lt;span class=&quot;Apple-tab-span&quot; style=&quot;box-sizing: inherit; font-size: 14px;&quot;&gt;&lt;/span&gt;&amp;nbsp;Core/酷睿 i5 i5-6200U&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 0.8em; color: rgb(42, 51, 60); font-family: &amp;quot;Segoe UI&amp;quot;, &amp;quot;Lucida Grande&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, FreeSans, Arimo, &amp;quot;Droid Sans&amp;quot;, &amp;quot;wenquanyi micro hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Hiragino Sans GB W3&amp;quot;, Roboto, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;box-sizing: inherit;&quot;&gt;显卡类型&lt;span class=&quot;Apple-tab-span&quot; style=&quot;box-sizing: inherit; font-size: 14px;&quot;&gt;&lt;/span&gt;&amp;nbsp;独立显卡/NVIDIA GeForce 940MX&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 0.8em; color: rgb(42, 51, 60); font-family: &amp;quot;Segoe UI&amp;quot;, &amp;quot;Lucida Grande&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, FreeSans, Arimo, &amp;quot;Droid Sans&amp;quot;, &amp;quot;wenquanyi micro hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Hiragino Sans GB W3&amp;quot;, Roboto, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;box-sizing: inherit;&quot;&gt;重量&lt;span class=&quot;Apple-tab-span&quot; style=&quot;box-sizing: inherit; font-size: 14px;&quot;&gt;&lt;/span&gt;&amp;nbsp;1kg(含)-1.5kg(不含)&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 0.8em; color: rgb(42, 51, 60); font-family: &amp;quot;Segoe UI&amp;quot;, &amp;quot;Lucida Grande&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, FreeSans, Arimo, &amp;quot;Droid Sans&amp;quot;, &amp;quot;wenquanyi micro hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Hiragino Sans GB W3&amp;quot;, Roboto, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;box-sizing: inherit;&quot;&gt;锂电池电芯数量&lt;span class=&quot;Apple-tab-span&quot; style=&quot;box-sizing: inherit; font-size: 14px;&quot;&gt;&lt;/span&gt;&amp;nbsp;4芯锂电池&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 0.8em; color: rgb(42, 51, 60); font-family: &amp;quot;Segoe UI&amp;quot;, &amp;quot;Lucida Grande&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, FreeSans, Arimo, &amp;quot;Droid Sans&amp;quot;, &amp;quot;wenquanyi micro hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Hiragino Sans GB W3&amp;quot;, Roboto, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;box-sizing: inherit;&quot;&gt;颜色分类&lt;span class=&quot;Apple-tab-span&quot; style=&quot;box-sizing: inherit; font-size: 14px;&quot;&gt;&lt;/span&gt;&amp;nbsp;13.3&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 0.8em; color: rgb(42, 51, 60); font-family: &amp;quot;Segoe UI&amp;quot;, &amp;quot;Lucida Grande&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, FreeSans, Arimo, &amp;quot;Droid Sans&amp;quot;, &amp;quot;wenquanyi micro hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Hiragino Sans GB W3&amp;quot;, Roboto, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;box-sizing: inherit;&quot;&gt;上市时间&lt;span class=&quot;Apple-tab-span&quot; style=&quot;box-sizing: inherit; font-size: 14px;&quot;&gt;&lt;/span&gt;&amp;nbsp;2016年&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 0.8em; color: rgb(42, 51, 60); font-family: &amp;quot;Segoe UI&amp;quot;, &amp;quot;Lucida Grande&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, FreeSans, Arimo, &amp;quot;Droid Sans&amp;quot;, &amp;quot;wenquanyi micro hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Hiragino Sans GB W3&amp;quot;, Roboto, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;box-sizing: inherit;&quot;&gt;月份&lt;span class=&quot;Apple-tab-span&quot; style=&quot;box-sizing: inherit; font-size: 14px;&quot;&gt;&lt;/span&gt;&amp;nbsp;9月&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 0.8em; color: rgb(42, 51, 60); font-family: &amp;quot;Segoe UI&amp;quot;, &amp;quot;Lucida Grande&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, FreeSans, Arimo, &amp;quot;Droid Sans&amp;quot;, &amp;quot;wenquanyi micro hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Hiragino Sans GB W3&amp;quot;, Roboto, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;box-sizing: inherit;&quot;&gt;操作系统&lt;span class=&quot;Apple-tab-span&quot; style=&quot;box-sizing: inherit; font-size: 14px;&quot;&gt;&lt;/span&gt;&amp;nbsp;windows 10&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 0.8em; color: rgb(42, 51, 60); font-family: &amp;quot;Segoe UI&amp;quot;, &amp;quot;Lucida Grande&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, FreeSans, Arimo, &amp;quot;Droid Sans&amp;quot;, &amp;quot;wenquanyi micro hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Hiragino Sans GB W3&amp;quot;, Roboto, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;box-sizing: inherit;&quot;&gt;输入设备&lt;span class=&quot;Apple-tab-span&quot; style=&quot;box-sizing: inherit; font-size: 14px;&quot;&gt;&lt;/span&gt;&amp;nbsp;触摸板&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 0.8em; color: rgb(42, 51, 60); font-family: &amp;quot;Segoe UI&amp;quot;, &amp;quot;Lucida Grande&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, FreeSans, Arimo, &amp;quot;Droid Sans&amp;quot;, &amp;quot;wenquanyi micro hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Hiragino Sans GB W3&amp;quot;, Roboto, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;box-sizing: inherit;&quot;&gt;附加功能&lt;span class=&quot;Apple-tab-span&quot; style=&quot;box-sizing: inherit; font-size: 14px;&quot;&gt;&lt;/span&gt;&amp;nbsp;type-c接口 HDMI接口 摄像头功能 扬声器 USB 3.0&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 0.8em; color: rgb(42, 51, 60); font-family: &amp;quot;Segoe UI&amp;quot;, &amp;quot;Lucida Grande&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, FreeSans, Arimo, &amp;quot;Droid Sans&amp;quot;, &amp;quot;wenquanyi micro hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Hiragino Sans GB W3&amp;quot;, Roboto, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;box-sizing: inherit;&quot;&gt;是否内置电池&lt;span class=&quot;Apple-tab-span&quot; style=&quot;box-sizing: inherit; font-size: 14px;&quot;&gt;&lt;/span&gt;&amp;nbsp;内置电池&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 0.8em; color: rgb(42, 51, 60); font-family: &amp;quot;Segoe UI&amp;quot;, &amp;quot;Lucida Grande&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, FreeSans, Arimo, &amp;quot;Droid Sans&amp;quot;, &amp;quot;wenquanyi micro hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Hiragino Sans GB W3&amp;quot;, Roboto, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;box-sizing: border-box; font-weight: 600;&quot;&gt;存储&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 0.8em; color: rgb(42, 51, 60); font-family: &amp;quot;Segoe UI&amp;quot;, &amp;quot;Lucida Grande&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, FreeSans, Arimo, &amp;quot;Droid Sans&amp;quot;, &amp;quot;wenquanyi micro hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Hiragino Sans GB W3&amp;quot;, Roboto, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;box-sizing: inherit;&quot;&gt;显存容量&lt;span class=&quot;Apple-tab-span&quot; style=&quot;box-sizing: inherit; font-size: 14px;&quot;&gt;&lt;/span&gt;&amp;nbsp;1GB&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 0.8em; color: rgb(42, 51, 60); font-family: &amp;quot;Segoe UI&amp;quot;, &amp;quot;Lucida Grande&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, FreeSans, Arimo, &amp;quot;Droid Sans&amp;quot;, &amp;quot;wenquanyi micro hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Hiragino Sans GB W3&amp;quot;, Roboto, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;box-sizing: inherit;&quot;&gt;机械硬盘容量&lt;span class=&quot;Apple-tab-span&quot; style=&quot;box-sizing: inherit; font-size: 14px;&quot;&gt;&lt;/span&gt;&amp;nbsp;0&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 0.8em; color: rgb(42, 51, 60); font-family: &amp;quot;Segoe UI&amp;quot;, &amp;quot;Lucida Grande&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, FreeSans, Arimo, &amp;quot;Droid Sans&amp;quot;, &amp;quot;wenquanyi micro hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Hiragino Sans GB W3&amp;quot;, Roboto, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;box-sizing: inherit;&quot;&gt;固态硬盘&lt;span class=&quot;Apple-tab-span&quot; style=&quot;box-sizing: inherit; font-size: 14px;&quot;&gt;&lt;/span&gt;&amp;nbsp;256GB&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 0.8em; color: rgb(42, 51, 60); font-family: &amp;quot;Segoe UI&amp;quot;, &amp;quot;Lucida Grande&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, FreeSans, Arimo, &amp;quot;Droid Sans&amp;quot;, &amp;quot;wenquanyi micro hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Hiragino Sans GB W3&amp;quot;, Roboto, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;box-sizing: inherit;&quot;&gt;内存容量&lt;span class=&quot;Apple-tab-span&quot; style=&quot;box-sizing: inherit; font-size: 14px;&quot;&gt;&lt;/span&gt;&amp;nbsp;8g&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 0.8em; color: rgb(42, 51, 60); font-family: &amp;quot;Segoe UI&amp;quot;, &amp;quot;Lucida Grande&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, FreeSans, Arimo, &amp;quot;Droid Sans&amp;quot;, &amp;quot;wenquanyi micro hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Hiragino Sans GB W3&amp;quot;, Roboto, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;box-sizing: border-box; font-weight: 600;&quot;&gt;显示&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 0.8em; color: rgb(42, 51, 60); font-family: &amp;quot;Segoe UI&amp;quot;, &amp;quot;Lucida Grande&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, FreeSans, Arimo, &amp;quot;Droid Sans&amp;quot;, &amp;quot;wenquanyi micro hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Hiragino Sans GB W3&amp;quot;, Roboto, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;box-sizing: inherit;&quot;&gt;屏幕类型&lt;span class=&quot;Apple-tab-span&quot; style=&quot;box-sizing: inherit; font-size: 14px;&quot;&gt;&lt;/span&gt;&amp;nbsp;LED&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 0.8em; color: rgb(42, 51, 60); font-family: &amp;quot;Segoe UI&amp;quot;, &amp;quot;Lucida Grande&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, FreeSans, Arimo, &amp;quot;Droid Sans&amp;quot;, &amp;quot;wenquanyi micro hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Hiragino Sans GB W3&amp;quot;, Roboto, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;box-sizing: inherit;&quot;&gt;屏幕尺寸&lt;span class=&quot;Apple-tab-span&quot; style=&quot;box-sizing: inherit; font-size: 14px;&quot;&gt;&lt;/span&gt;&amp;nbsp;13.3英寸&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 0.8em; color: rgb(42, 51, 60); font-family: &amp;quot;Segoe UI&amp;quot;, &amp;quot;Lucida Grande&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, FreeSans, Arimo, &amp;quot;Droid Sans&amp;quot;, &amp;quot;wenquanyi micro hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Hiragino Sans GB W3&amp;quot;, Roboto, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;box-sizing: inherit;&quot;&gt;屏幕比例&lt;span class=&quot;Apple-tab-span&quot; style=&quot;box-sizing: inherit; font-size: 14px;&quot;&gt;&lt;/span&gt;&amp;nbsp;16:9&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 0.8em; color: rgb(42, 51, 60); font-family: &amp;quot;Segoe UI&amp;quot;, &amp;quot;Lucida Grande&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, FreeSans, Arimo, &amp;quot;Droid Sans&amp;quot;, &amp;quot;wenquanyi micro hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Hiragino Sans GB W3&amp;quot;, Roboto, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;box-sizing: inherit;&quot;&gt;分辨率&lt;span class=&quot;Apple-tab-span&quot; style=&quot;box-sizing: inherit; font-size: 14px;&quot;&gt;&lt;/span&gt;&amp;nbsp;1920x1080&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 0.8em; color: rgb(42, 51, 60); font-family: &amp;quot;Segoe UI&amp;quot;, &amp;quot;Lucida Grande&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, FreeSans, Arimo, &amp;quot;Droid Sans&amp;quot;, &amp;quot;wenquanyi micro hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Hiragino Sans GB W3&amp;quot;, Roboto, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;box-sizing: inherit;&quot;&gt;是否触摸屏&lt;span class=&quot;Apple-tab-span&quot; style=&quot;box-sizing: inherit; font-size: 14px;&quot;&gt;&lt;/span&gt;&amp;nbsp;非触摸屏&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 0.8em; color: rgb(42, 51, 60); font-family: &amp;quot;Segoe UI&amp;quot;, &amp;quot;Lucida Grande&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, FreeSans, Arimo, &amp;quot;Droid Sans&amp;quot;, &amp;quot;wenquanyi micro hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Hiragino Sans GB W3&amp;quot;, Roboto, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;box-sizing: inherit;&quot;&gt;笔记本电脑主机	1 件&amp;nbsp;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 0.8em; color: rgb(42, 51, 60); font-family: &amp;quot;Segoe UI&amp;quot;, &amp;quot;Lucida Grande&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, FreeSans, Arimo, &amp;quot;Droid Sans&amp;quot;, &amp;quot;wenquanyi micro hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Hiragino Sans GB W3&amp;quot;, Roboto, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;box-sizing: inherit;&quot;&gt;电源适配器	1 件&amp;nbsp;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 0.8em; color: rgb(42, 51, 60); font-family: &amp;quot;Segoe UI&amp;quot;, &amp;quot;Lucida Grande&amp;quot;, Helvetica, Arial, &amp;quot;Microsoft YaHei&amp;quot;, FreeSans, Arimo, &amp;quot;Droid Sans&amp;quot;, &amp;quot;wenquanyi micro hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Hiragino Sans GB W3&amp;quot;, Roboto, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;box-sizing: inherit;&quot;&gt;入门指南（三包凭证）	1 件&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '1526613271', '1526613547');
INSERT INTO `ey_addonproduct` VALUES ('4', '29', '&lt;p&gt;&lt;img src=&quot;/public/upload/remote/2018/05/18/5afe46f2674a3.png&quot;/&gt;&lt;/p&gt;', '&lt;p&gt;&lt;img src=&quot;/public/upload/remote/2018/05/18/5afe46fb39df5.png&quot;/&gt;&lt;/p&gt;', '1526613739', '1526613820');
INSERT INTO `ey_addonproduct` VALUES ('5', '37', '&lt;p&gt;&lt;img src=&quot;/public/upload/remote/2018/05/18/5afe46f2674a3.png&quot;/&gt;&lt;/p&gt;', '&lt;p&gt;&lt;img src=&quot;/public/upload/remote/2018/05/18/5afe46fb39df5.png&quot;/&gt;&lt;/p&gt;', '1527507844', '1527507984');

-- -----------------------------
-- Table structure for `ey_admin`
-- -----------------------------
DROP TABLE IF EXISTS `ey_admin`;
CREATE TABLE `ey_admin` (
  `admin_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `user_name` varchar(20) NOT NULL DEFAULT '' COMMENT '用户名',
  `true_name` varchar(20) DEFAULT '' COMMENT '真实姓名',
  `mobile` varchar(11) DEFAULT '' COMMENT '手机号码',
  `email` varchar(60) DEFAULT '' COMMENT 'email',
  `password` varchar(32) NOT NULL DEFAULT '' COMMENT '密码',
  `last_login` int(11) DEFAULT '0' COMMENT '最后登录时间',
  `last_ip` varchar(15) DEFAULT '' COMMENT '最后登录ip',
  `login_cnt` int(11) DEFAULT '0' COMMENT '登录次数',
  `session_id` varchar(50) DEFAULT '' COMMENT 'session_id',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态(0=屏蔽，1=正常)',
  `add_time` int(11) DEFAULT '0' COMMENT '添加时间',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`admin_id`),
  KEY `user_name` (`user_name`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `ey_admin`
-- -----------------------------
INSERT INTO `ey_admin` VALUES ('1', 'admin', 'admin', '', '', '7959ec68e999edd0380ff0809f76fa42', '1535613260', '127.0.0.1', '2', 'r8a17tuptdr6rr2e870rtqiuu5', '1', '1535613251', '0');

-- -----------------------------
-- Table structure for `ey_admin_log`
-- -----------------------------
DROP TABLE IF EXISTS `ey_admin_log`;
CREATE TABLE `ey_admin_log` (
  `log_id` bigint(16) unsigned NOT NULL AUTO_INCREMENT COMMENT '表id',
  `admin_id` int(10) DEFAULT NULL COMMENT '管理员id',
  `log_info` varchar(255) DEFAULT NULL COMMENT '日志描述',
  `log_ip` varchar(30) DEFAULT NULL COMMENT 'ip地址',
  `log_url` varchar(255) DEFAULT NULL COMMENT 'url',
  `log_time` int(10) DEFAULT NULL COMMENT '日志时间',
  PRIMARY KEY (`log_id`),
  KEY `admin_id` (`admin_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=724 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `ey_admin_log`
-- -----------------------------
INSERT INTO `ey_admin_log` VALUES ('1', '1', '删除管理员', '127.0.0.1', '/index.php/admin/Admin/admin_del.html', '1527297751');
INSERT INTO `ey_admin_log` VALUES ('2', '1', '退出后台', '127.0.0.1', '/index.php/admin/Admin/logout.html', '1527301818');
INSERT INTO `ey_admin_log` VALUES ('3', '1', '后台登录', '127.0.0.1', '/index.php/admin/Admin/login.html', '1527302280');
INSERT INTO `ey_admin_log` VALUES ('4', '1', '删除权限', '127.0.0.1', '/index.php/admin/Admin/rule_del.html', '1527306533');
INSERT INTO `ey_admin_log` VALUES ('5', '1', '删除模块', '127.0.0.1', '/index.php/admin/Admin/modular_del.html', '1527306573');
INSERT INTO `ey_admin_log` VALUES ('6', '1', '删除模块', '127.0.0.1', '/index.php/admin/Admin/modular_del.html', '1527306578');
INSERT INTO `ey_admin_log` VALUES ('7', '1', '删除模块', '127.0.0.1', '/index.php/admin/Admin/modular_del.html', '1527306582');
INSERT INTO `ey_admin_log` VALUES ('8', '1', '删除模块', '127.0.0.1', '/index.php/admin/Admin/modular_del.html', '1527306585');
INSERT INTO `ey_admin_log` VALUES ('9', '1', '删除模块', '127.0.0.1', '/index.php/admin/Admin/modular_del.html', '1527306588');
INSERT INTO `ey_admin_log` VALUES ('10', '1', '删除模块', '127.0.0.1', '/index.php/admin/Admin/modular_del.html', '1527306590');
INSERT INTO `ey_admin_log` VALUES ('11', '1', '删除模块', '127.0.0.1', '/index.php/admin/Admin/modular_del.html', '1527306593');
INSERT INTO `ey_admin_log` VALUES ('12', '1', '删除模块', '127.0.0.1', '/index.php/admin/Admin/modular_del.html', '1527306597');
INSERT INTO `ey_admin_log` VALUES ('13', '1', '删除模块', '127.0.0.1', '/index.php/admin/Admin/modular_del.html', '1527306599');
INSERT INTO `ey_admin_log` VALUES ('14', '1', '删除模块', '127.0.0.1', '/index.php/admin/Admin/modular_del.html', '1527306716');
INSERT INTO `ey_admin_log` VALUES ('15', '1', '删除模块', '127.0.0.1', '/index.php/admin/Admin/modular_del.html', '1527306775');
INSERT INTO `ey_admin_log` VALUES ('16', '1', '删除模块', '127.0.0.1', '/index.php/admin/Admin/modular_del.html', '1527306779');
INSERT INTO `ey_admin_log` VALUES ('17', '1', '删除模块', '127.0.0.1', '/index.php/admin/Admin/modular_del.html', '1527306794');
INSERT INTO `ey_admin_log` VALUES ('18', '1', '添加模块', '127.0.0.1', '/index.php/admin/Admin/modular_add.html', '1527306892');
INSERT INTO `ey_admin_log` VALUES ('19', '1', '编辑模块', '127.0.0.1', '/index.php/admin/Admin/modular_edit/id/12.html', '1527306913');
INSERT INTO `ey_admin_log` VALUES ('20', '1', '编辑模块', '127.0.0.1', '/index.php/admin/Admin/modular_edit/id/27.html', '1527306927');
INSERT INTO `ey_admin_log` VALUES ('21', '1', '编辑模块', '127.0.0.1', '/index.php/admin/Admin/modular_edit/id/481.html', '1527306945');
INSERT INTO `ey_admin_log` VALUES ('22', '1', '编辑模块', '127.0.0.1', '/index.php/admin/Admin/modular_edit/id/9.html', '1527306955');
INSERT INTO `ey_admin_log` VALUES ('23', '1', '编辑模块', '127.0.0.1', '/index.php/admin/Admin/modular_edit/id/14.html', '1527306984');
INSERT INTO `ey_admin_log` VALUES ('24', '1', '编辑模块', '127.0.0.1', '/index.php/admin/Admin/modular_edit/id/18.html', '1527306999');
INSERT INTO `ey_admin_log` VALUES ('25', '1', '编辑模块', '127.0.0.1', '/index.php/admin/Admin/modular_edit/id/17.html', '1527307004');
INSERT INTO `ey_admin_log` VALUES ('26', '1', '编辑模块', '127.0.0.1', '/index.php/admin/Admin/modular_edit/id/16.html', '1527307006');
INSERT INTO `ey_admin_log` VALUES ('27', '1', '编辑模块', '127.0.0.1', '/index.php/admin/Admin/modular_edit/id/15.html', '1527307009');
INSERT INTO `ey_admin_log` VALUES ('28', '1', '删除模块', '127.0.0.1', '/index.php/admin/Admin/modular_del.html', '1527307019');
INSERT INTO `ey_admin_log` VALUES ('29', '1', '编辑模块', '127.0.0.1', '/index.php/admin/Admin/modular_edit/id/19.html', '1527307033');
INSERT INTO `ey_admin_log` VALUES ('30', '1', '编辑模块', '127.0.0.1', '/index.php/admin/Admin/modular_edit/id/21.html', '1527307044');
INSERT INTO `ey_admin_log` VALUES ('31', '1', '删除模块', '127.0.0.1', '/index.php/admin/Admin/modular_del.html', '1527307085');
INSERT INTO `ey_admin_log` VALUES ('32', '1', '删除模块', '127.0.0.1', '/index.php/admin/Admin/modular_del.html', '1527307090');
INSERT INTO `ey_admin_log` VALUES ('33', '1', '删除模块', '127.0.0.1', '/index.php/admin/Admin/modular_del.html', '1527307092');
INSERT INTO `ey_admin_log` VALUES ('34', '1', '删除模块', '127.0.0.1', '/index.php/admin/Admin/modular_del.html', '1527307094');
INSERT INTO `ey_admin_log` VALUES ('35', '1', '删除模块', '127.0.0.1', '/index.php/admin/Admin/modular_del.html', '1527307098');
INSERT INTO `ey_admin_log` VALUES ('36', '1', '删除模块', '127.0.0.1', '/index.php/admin/Admin/modular_del.html', '1527307102');
INSERT INTO `ey_admin_log` VALUES ('37', '1', '删除模块', '127.0.0.1', '/index.php/admin/Admin/modular_del.html', '1527307106');
INSERT INTO `ey_admin_log` VALUES ('38', '1', '删除模块', '127.0.0.1', '/index.php/admin/Admin/modular_del.html', '1527307111');
INSERT INTO `ey_admin_log` VALUES ('39', '1', '编辑模块', '127.0.0.1', '/index.php/admin/Admin/modular_edit/id/41.html', '1527307162');
INSERT INTO `ey_admin_log` VALUES ('40', '1', '编辑模块', '127.0.0.1', '/index.php/admin/Admin/modular_edit/id/470.html', '1527307178');
INSERT INTO `ey_admin_log` VALUES ('41', '1', '删除模块', '127.0.0.1', '/index.php/admin/Admin/modular_del.html', '1527307184');
INSERT INTO `ey_admin_log` VALUES ('42', '1', '删除调试外观数据 e-id：204', '127.0.0.1', '/index.php/admin/Uiset/del.html', '1527318731');
INSERT INTO `ey_admin_log` VALUES ('43', '1', '删除调试外观数据 e-id：303', '127.0.0.1', '/index.php/admin/Uiset/del.html', '1527318779');
INSERT INTO `ey_admin_log` VALUES ('44', '1', '删除调试外观数据 e-id：301', '127.0.0.1', '/index.php/admin/Uiset/del.html', '1527318910');
INSERT INTO `ey_admin_log` VALUES ('45', '1', '删除调试外观数据 e-id：203205', '127.0.0.1', '/index.php/admin/Uiset/del.html', '1527318914');
INSERT INTO `ey_admin_log` VALUES ('46', '1', '删除调试外观数据 e-id：203302', '127.0.0.1', '/index.php/admin/Uiset/del.html', '1527318920');
INSERT INTO `ey_admin_log` VALUES ('47', '1', '删除调试外观数据 e-id：302204', '127.0.0.1', '/index.php/admin/Uiset/del.html', '1527319139');
INSERT INTO `ey_admin_log` VALUES ('48', '1', '删除调试外观数据 e-id：204203303301', '127.0.0.1', '/index.php/admin/Uiset/del.html', '1527321282');
INSERT INTO `ey_admin_log` VALUES ('49', '1', '删除调试外观数据 e-id：301303', '127.0.0.1', '/index.php/admin/Uiset/del.html', '1527321289');
INSERT INTO `ey_admin_log` VALUES ('50', '1', '后台登录', '127.0.0.1', '/index.php/admin/Admin/login.html', '1527388796');
INSERT INTO `ey_admin_log` VALUES ('51', '1', '后台登录', '127.0.0.1', '/index.php/admin/Admin/login.html', '1527410362');
INSERT INTO `ey_admin_log` VALUES ('52', '1', '后台登录', '127.0.0.1', '/index.php/admin/Admin/login.html', '1527488500');
INSERT INTO `ey_admin_log` VALUES ('53', '1', '新增留言表单：测试属性', '127.0.0.1', '/index.php/admin/Guestbook/attribute_add.html', '1527489879');
INSERT INTO `ey_admin_log` VALUES ('54', '1', '删除留言表单-id：8', '127.0.0.1', '/index.php/admin/Guestbook/attribute_del.html', '1527489912');
INSERT INTO `ey_admin_log` VALUES ('55', '1', '新增产品属性：规格参数', '127.0.0.1', '/index.php/admin/Product/attribute_add.html', '1527491562');
INSERT INTO `ey_admin_log` VALUES ('56', '1', '新增产品属性：包装', '127.0.0.1', '/index.php/admin/Product/attribute_add.html', '1527492622');
INSERT INTO `ey_admin_log` VALUES ('57', '1', '编辑产品：华为HUAWEI NOTE 8', '127.0.0.1', '/index.php/admin/Product/edit.html', '1527493071');
INSERT INTO `ey_admin_log` VALUES ('58', '1', '编辑产品：华为HUAWEI NOTE 8', '127.0.0.1', '/index.php/admin/Product/edit.html', '1527493101');
INSERT INTO `ey_admin_log` VALUES ('59', '1', '删除产品属性-id：9', '127.0.0.1', '/index.php/admin/Product/attribute_del.html', '1527501790');
INSERT INTO `ey_admin_log` VALUES ('60', '1', '删除产品属性-id：10', '127.0.0.1', '/index.php/admin/Product/attribute_del.html', '1527501795');
INSERT INTO `ey_admin_log` VALUES ('61', '1', '编辑栏目：关于我们', '127.0.0.1', '/index.php/admin/Arctype/edit.html', '1527502533');
INSERT INTO `ey_admin_log` VALUES ('62', '1', '编辑栏目：关于我们', '127.0.0.1', '/index.php/admin/Arctype/edit.html', '1527502607');
INSERT INTO `ey_admin_log` VALUES ('63', '1', '编辑栏目：预约面试', '127.0.0.1', '/index.php/admin/Arctype/edit.html', '1527503774');
INSERT INTO `ey_admin_log` VALUES ('64', '1', '编辑产品：华为HUAWEI NOTE 8', '127.0.0.1', '/index.php/admin/Product/edit.html', '1527507837');
INSERT INTO `ey_admin_log` VALUES ('65', '1', '新增产品：Apple iPhone 6s 16GB 玫瑰金色 移动联通电信4G手机', '127.0.0.1', '/index.php/admin/Product/add.html', '1527507984');
INSERT INTO `ey_admin_log` VALUES ('66', '1', '后台登录', '127.0.0.1', '/index.php/admin/Admin/login.html', '1527645354');
INSERT INTO `ey_admin_log` VALUES ('67', '1', '删除普通文章-id：36', '127.0.0.1', '/index.php/admin/Article/del.html', '1527645385');
INSERT INTO `ey_admin_log` VALUES ('68', '1', '删除栏目：dsafsf', '127.0.0.1', '/index.php/admin/Arctype/del.html', '1527645392');
INSERT INTO `ey_admin_log` VALUES ('69', '1', '删除栏目：纯单页一', '127.0.0.1', '/index.php/admin/Arctype/del.html', '1527645411');
INSERT INTO `ey_admin_log` VALUES ('70', '1', '删除栏目：纯单页', '127.0.0.1', '/index.php/admin/Arctype/del.html', '1527645414');
INSERT INTO `ey_admin_log` VALUES ('71', '1', '删除栏目：图集一', '127.0.0.1', '/index.php/admin/Arctype/del.html', '1527645466');
INSERT INTO `ey_admin_log` VALUES ('72', '1', '删除栏目：图集', '127.0.0.1', '/index.php/admin/Arctype/del.html', '1527645469');
INSERT INTO `ey_admin_log` VALUES ('73', '1', '删除栏目：文章一', '127.0.0.1', '/index.php/admin/Arctype/del.html', '1527645472');
INSERT INTO `ey_admin_log` VALUES ('74', '1', '删除栏目：文章', '127.0.0.1', '/index.php/admin/Arctype/del.html', '1527645476');
INSERT INTO `ey_admin_log` VALUES ('75', '1', '编辑栏目：联系我们', '127.0.0.1', '/index.php/admin/Arctype/edit.html', '1527645490');
INSERT INTO `ey_admin_log` VALUES ('76', '1', '删除留言-id：34,33,32,31,30,29,28,27,26,25,24,23,22,21,20', '127.0.0.1', '/index.php/admin/Guestbook/del.html', '1527645502');
INSERT INTO `ey_admin_log` VALUES ('77', '1', '删除留言-id：19,18,17', '127.0.0.1', '/index.php/admin/Guestbook/del.html', '1527645508');
INSERT INTO `ey_admin_log` VALUES ('78', '1', '编辑栏目：在线留言', '127.0.0.1', '/index.php/admin/Arctype/edit.html', '1527645545');
INSERT INTO `ey_admin_log` VALUES ('79', '1', '删除下载文章-id：32,31,30', '127.0.0.1', '/index.php/admin/Download/del.html', '1527645635');
INSERT INTO `ey_admin_log` VALUES ('80', '1', '删除栏目：资料下载', '127.0.0.1', '/index.php/admin/Arctype/del.html', '1527645642');
INSERT INTO `ey_admin_log` VALUES ('81', '1', '删除图集-id：26,24', '127.0.0.1', '/index.php/admin/Images/del.html', '1527645660');
INSERT INTO `ey_admin_log` VALUES ('82', '1', '删除栏目：客户案例', '127.0.0.1', '/index.php/admin/Arctype/del.html', '1527645668');
INSERT INTO `ey_admin_log` VALUES ('83', '1', '删除栏目：充电宝', '127.0.0.1', '/index.php/admin/Arctype/del.html', '1527645688');
INSERT INTO `ey_admin_log` VALUES ('84', '1', '删除栏目：音箱', '127.0.0.1', '/index.php/admin/Arctype/del.html', '1527645690');
INSERT INTO `ey_admin_log` VALUES ('85', '1', '删除产品-id：29', '127.0.0.1', '/index.php/admin/Product/del.html', '1527645702');
INSERT INTO `ey_admin_log` VALUES ('86', '1', '删除栏目：耳机', '127.0.0.1', '/index.php/admin/Arctype/del.html', '1527645718');
INSERT INTO `ey_admin_log` VALUES ('87', '1', '删除栏目：通用配件', '127.0.0.1', '/index.php/admin/Arctype/del.html', '1527645721');
INSERT INTO `ey_admin_log` VALUES ('88', '1', '删除产品-id：28', '127.0.0.1', '/index.php/admin/Product/del.html', '1527645730');
INSERT INTO `ey_admin_log` VALUES ('89', '1', '删除栏目：笔记本电脑', '127.0.0.1', '/index.php/admin/Arctype/del.html', '1527645746');
INSERT INTO `ey_admin_log` VALUES ('90', '1', '删除栏目：电脑', '127.0.0.1', '/index.php/admin/Arctype/del.html', '1527645755');
INSERT INTO `ey_admin_log` VALUES ('91', '1', '删除栏目：畅玩手机', '127.0.0.1', '/index.php/admin/Arctype/del.html', '1527645767');
INSERT INTO `ey_admin_log` VALUES ('92', '1', '删除产品-id：37,27', '127.0.0.1', '/index.php/admin/Product/del.html', '1527645781');
INSERT INTO `ey_admin_log` VALUES ('93', '1', '删除栏目：智能手机', '127.0.0.1', '/index.php/admin/Arctype/del.html', '1527645795');
INSERT INTO `ey_admin_log` VALUES ('94', '1', '删除栏目：手机', '127.0.0.1', '/index.php/admin/Arctype/del.html', '1527645798');
INSERT INTO `ey_admin_log` VALUES ('95', '1', '删除产品-id：11', '127.0.0.1', '/index.php/admin/Product/del.html', '1527645821');
INSERT INTO `ey_admin_log` VALUES ('96', '1', '删除栏目：产品展示', '127.0.0.1', '/index.php/admin/Arctype/del.html', '1527645827');
INSERT INTO `ey_admin_log` VALUES ('97', '1', '新增栏目：产品中心', '127.0.0.1', '/index.php/admin/Arctype/add.html', '1527645900');
INSERT INTO `ey_admin_log` VALUES ('98', '1', '编辑栏目：产品中心', '127.0.0.1', '/index.php/admin/Arctype/edit.html', '1527645910');
INSERT INTO `ey_admin_log` VALUES ('99', '1', '新增栏目：成功案例', '127.0.0.1', '/index.php/admin/Arctype/add.html', '1527645925');
INSERT INTO `ey_admin_log` VALUES ('100', '1', '编辑栏目：新闻动态', '127.0.0.1', '/index.php/admin/Arctype/edit.html', '1527645973');
INSERT INTO `ey_admin_log` VALUES ('101', '1', '新增栏目：行业资讯', '127.0.0.1', '/index.php/admin/Arctype/add.html', '1527645987');
INSERT INTO `ey_admin_log` VALUES ('102', '1', '编辑栏目：产品中心', '127.0.0.1', '/index.php/admin/Arctype/edit.html', '1527646054');
INSERT INTO `ey_admin_log` VALUES ('103', '1', '新增栏目：荣誉资质', '127.0.0.1', '/index.php/admin/Arctype/add.html', '1527646068');
INSERT INTO `ey_admin_log` VALUES ('104', '1', '编辑栏目：产品中心', '127.0.0.1', '/index.php/admin/Arctype/edit.html', '1527646128');
INSERT INTO `ey_admin_log` VALUES ('105', '1', '新增广告位：列表页banner图', '127.0.0.1', '/index.php/admin/AdPosition/add.html', '1527646854');
INSERT INTO `ey_admin_log` VALUES ('106', '1', '新增广告：列表页banner图', '127.0.0.1', '/index.php/admin/Ad/add.html', '1527646898');
INSERT INTO `ey_admin_log` VALUES ('107', '1', '编辑广告', '127.0.0.1', '/index.php/admin/Ad/edit.html', '1527647077');
INSERT INTO `ey_admin_log` VALUES ('108', '1', '编辑广告', '127.0.0.1', '/index.php/admin/Ad/edit.html', '1527647094');
INSERT INTO `ey_admin_log` VALUES ('109', '1', '编辑广告位：首页-大幻灯片', '127.0.0.1', '/index.php/admin/AdPosition/edit.html', '1527647145');
INSERT INTO `ey_admin_log` VALUES ('110', '1', '新增自定义变量：网站公告', '127.0.0.1', '/index.php', '1527647201');
INSERT INTO `ey_admin_log` VALUES ('111', '1', '新增栏目：第一系列', '127.0.0.1', '/index.php/admin/Arctype/add.html', '1527647518');
INSERT INTO `ey_admin_log` VALUES ('112', '1', '新增栏目：第二系列', '127.0.0.1', '/index.php/admin/Arctype/add.html', '1527647537');
INSERT INTO `ey_admin_log` VALUES ('113', '1', '新增栏目：第三系列', '127.0.0.1', '/index.php/admin/Arctype/add.html', '1527647554');
INSERT INTO `ey_admin_log` VALUES ('114', '1', '新增栏目：第四系列', '127.0.0.1', '/index.php/admin/Arctype/add.html', '1527647571');
INSERT INTO `ey_admin_log` VALUES ('115', '1', '新增栏目：第五系列', '127.0.0.1', '/index.php/admin/Arctype/add.html', '1527647587');
INSERT INTO `ey_admin_log` VALUES ('116', '1', '编辑栏目：关于我们', '127.0.0.1', '/index.php/admin/Arctype/edit.html', '1527648075');
INSERT INTO `ey_admin_log` VALUES ('117', '1', '删除留言-id：16,15', '127.0.0.1', '/index.php/admin/Guestbook/del.html', '1527648260');
INSERT INTO `ey_admin_log` VALUES ('118', '1', '新增自定义变量：电子邮箱', '127.0.0.1', '/index.php', '1527648864');
INSERT INTO `ey_admin_log` VALUES ('119', '1', '新增自定义变量：地址', '127.0.0.1', '/index.php', '1527648896');
INSERT INTO `ey_admin_log` VALUES ('120', '1', '新增自定义变量：传真', '127.0.0.1', '/index.php', '1527649405');
INSERT INTO `ey_admin_log` VALUES ('121', '1', '新增自定义变量：备案', '127.0.0.1', '/index.php', '1527649510');
INSERT INTO `ey_admin_log` VALUES ('122', '1', '移动文档-id：21,20,19,13,7,6,5,4,3', '127.0.0.1', '/index.php/admin/Article/move.html', '1527661963');
INSERT INTO `ey_admin_log` VALUES ('123', '1', '删除普通文章-id：3', '127.0.0.1', '/index.php/admin/Article/del.html', '1527662219');
INSERT INTO `ey_admin_log` VALUES ('124', '1', '删除留言表单-id：7', '127.0.0.1', '/index.php/admin/Guestbook/attribute_del.html', '1527663546');
INSERT INTO `ey_admin_log` VALUES ('125', '1', '新增留言表单：邮箱', '127.0.0.1', '/index.php/admin/Guestbook/attribute_add.html', '1527663559');
INSERT INTO `ey_admin_log` VALUES ('126', '1', '新增普通文章：荣誉证书一', '127.0.0.1', '/index.php/admin/Article/add.html', '1527664273');
INSERT INTO `ey_admin_log` VALUES ('127', '1', '新增普通文章：荣誉证书二', '127.0.0.1', '/index.php/admin/Article/add.html', '1527664303');
INSERT INTO `ey_admin_log` VALUES ('128', '1', '新增普通文章：荣誉证书三', '127.0.0.1', '/index.php/admin/Article/add.html', '1527664327');
INSERT INTO `ey_admin_log` VALUES ('129', '1', '新增普通文章：荣誉证书四', '127.0.0.1', '/index.php/admin/Article/add.html', '1527664350');
INSERT INTO `ey_admin_log` VALUES ('130', '1', '新增普通文章：产品名称一', '127.0.0.1', '/index.php/admin/Article/add.html', '1527664454');
INSERT INTO `ey_admin_log` VALUES ('131', '1', '新增普通文章：产品名称二', '127.0.0.1', '/index.php/admin/Article/add.html', '1527664494');
INSERT INTO `ey_admin_log` VALUES ('132', '1', '新增普通文章：产品名称三', '127.0.0.1', '/index.php/admin/Article/add.html', '1527664544');
INSERT INTO `ey_admin_log` VALUES ('133', '1', '新增普通文章：产品名称四', '127.0.0.1', '/index.php/admin/Article/add.html', '1527664578');
INSERT INTO `ey_admin_log` VALUES ('134', '1', '新增普通文章：谷歌总部扩建曝光细节图 像个透明帐篷', '127.0.0.1', '/index.php/admin/Article/add.html', '1527664720');
INSERT INTO `ey_admin_log` VALUES ('135', '1', '新增普通文章：IKEA宜家PS系列：家居可以怎样时尚表达？', '127.0.0.1', '/index.php/admin/Article/add.html', '1527664746');
INSERT INTO `ey_admin_log` VALUES ('136', '1', '新增普通文章：极简主义：你了解过“震颤教”吗？', '127.0.0.1', '/index.php/admin/Article/add.html', '1527664766');
INSERT INTO `ey_admin_log` VALUES ('137', '1', '新增普通文章：电子商务网站建设技术：怎样修改网站标题', '127.0.0.1', '/index.php/admin/Article/add.html', '1527664792');
INSERT INTO `ey_admin_log` VALUES ('138', '1', '新增普通文章：2017两会透露信号：智能卫浴或迎发展黄金期', '127.0.0.1', '/index.php/admin/Article/add.html', '1527664809');
INSERT INTO `ey_admin_log` VALUES ('139', '1', '移动文档-id：4', '127.0.0.1', '/index.php/admin/Article/move.html', '1527664843');
INSERT INTO `ey_admin_log` VALUES ('140', '1', '删除图集-id：23,22', '127.0.0.1', '/index.php/admin/Images/del.html', '1527664865');
INSERT INTO `ey_admin_log` VALUES ('141', '1', '删除栏目：风景图集', '127.0.0.1', '/index.php/admin/Arctype/del.html', '1527664874');
INSERT INTO `ey_admin_log` VALUES ('142', '1', '删除栏目：单页面', '127.0.0.1', '/index.php/admin/Arctype/del.html', '1527664880');
INSERT INTO `ey_admin_log` VALUES ('143', '1', '删除栏目：企业运营', '127.0.0.1', '/index.php/admin/Arctype/del.html', '1527664883');
INSERT INTO `ey_admin_log` VALUES ('144', '1', '删除栏目：媒体报道', '127.0.0.1', '/index.php/admin/Arctype/del.html', '1527664888');
INSERT INTO `ey_admin_log` VALUES ('145', '1', '删除栏目：SEO优化', '127.0.0.1', '/index.php/admin/Arctype/del.html', '1527664892');
INSERT INTO `ey_admin_log` VALUES ('146', '1', '删除普通文章-id：7,6,5', '127.0.0.1', '/index.php/admin/Article/del.html', '1527664991');
INSERT INTO `ey_admin_log` VALUES ('147', '1', '新增普通文章：案例展示一', '127.0.0.1', '/index.php/admin/Article/add.html', '1527665062');
INSERT INTO `ey_admin_log` VALUES ('148', '1', '新增普通文章：案例展示二', '127.0.0.1', '/index.php/admin/Article/add.html', '1527665085');
INSERT INTO `ey_admin_log` VALUES ('149', '1', '新增普通文章：案例展示三', '127.0.0.1', '/index.php/admin/Article/add.html', '1527665106');
INSERT INTO `ey_admin_log` VALUES ('150', '1', '新增普通文章：案例展示四', '127.0.0.1', '/index.php/admin/Article/add.html', '1527665129');
INSERT INTO `ey_admin_log` VALUES ('151', '1', '新增普通文章：案例展示五', '127.0.0.1', '/index.php/admin/Article/add.html', '1527665166');
INSERT INTO `ey_admin_log` VALUES ('152', '1', '新增普通文章：案例展示六', '127.0.0.1', '/index.php/admin/Article/add.html', '1527665191');
INSERT INTO `ey_admin_log` VALUES ('153', '1', '删除栏目：预约面试', '127.0.0.1', '/index.php/admin/Arctype/del.html', '1527665227');
INSERT INTO `ey_admin_log` VALUES ('154', '1', '删除普通文章-id：14,12,10,9', '127.0.0.1', '/index.php/admin/Article/del.html', '1527665241');
INSERT INTO `ey_admin_log` VALUES ('155', '1', '删除栏目：日志列表', '127.0.0.1', '/index.php/admin/Arctype/del.html', '1527665250');
INSERT INTO `ey_admin_log` VALUES ('156', '1', '删除图集-id：18', '127.0.0.1', '/index.php/admin/Images/del.html', '1527665268');
INSERT INTO `ey_admin_log` VALUES ('157', '1', '删除栏目：图集2', '127.0.0.1', '/index.php/admin/Arctype/del.html', '1527665278');
INSERT INTO `ey_admin_log` VALUES ('158', '1', '删除栏目：简介单页', '127.0.0.1', '/index.php/admin/Arctype/del.html', '1527665285');
INSERT INTO `ey_admin_log` VALUES ('159', '1', '删除图集-id：25,17,16,15', '127.0.0.1', '/index.php/admin/Images/del.html', '1527665296');
INSERT INTO `ey_admin_log` VALUES ('160', '1', '删除栏目：户外旅游', '127.0.0.1', '/index.php/admin/Arctype/del.html', '1527665353');
INSERT INTO `ey_admin_log` VALUES ('161', '1', '编辑栏目：企业文化', '127.0.0.1', '/index.php/admin/Arctype/edit.html', '1527665387');
INSERT INTO `ey_admin_log` VALUES ('162', '1', '新增栏目：发展历史', '127.0.0.1', '/index.php/admin/Arctype/add.html', '1527665417');
INSERT INTO `ey_admin_log` VALUES ('163', '1', '编辑栏目：发展历史', '127.0.0.1', '/index.php/admin/Arctype/edit.html', '1527665441');
INSERT INTO `ey_admin_log` VALUES ('164', '1', '编辑栏目：企业文化', '127.0.0.1', '/index.php/admin/Arctype/edit.html', '1527665517');
INSERT INTO `ey_admin_log` VALUES ('165', '1', '编辑栏目：关于我们', '127.0.0.1', '/index.php/admin/Arctype/edit.html', '1527665535');
INSERT INTO `ey_admin_log` VALUES ('166', '1', '编辑栏目：关于我们', '127.0.0.1', '/index.php/admin/Arctype/edit.html', '1527665555');
INSERT INTO `ey_admin_log` VALUES ('167', '1', '编辑栏目：关于我们', '127.0.0.1', '/index.php/admin/Arctype/edit.html', '1527665640');
INSERT INTO `ey_admin_log` VALUES ('168', '1', '编辑栏目：企业文化', '127.0.0.1', '/index.php/admin/Arctype/edit.html', '1527666211');
INSERT INTO `ey_admin_log` VALUES ('169', '1', '编辑栏目：联系我们', '127.0.0.1', '/index.php/admin/Arctype/edit.html', '1527666310');
INSERT INTO `ey_admin_log` VALUES ('170', '1', '新增自定义变量：网站手机端Logo', '127.0.0.1', '/index.php', '1527667770');
INSERT INTO `ey_admin_log` VALUES ('171', '1', '新增广告位：手机端首页头部幻灯', '127.0.0.1', '/index.php/admin/AdPosition/add.html', '1527667904');
INSERT INTO `ey_admin_log` VALUES ('172', '1', '新增广告：幻灯一', '127.0.0.1', '/index.php/admin/Ad/add.html', '1527667948');
INSERT INTO `ey_admin_log` VALUES ('173', '1', '新增广告：幻灯二', '127.0.0.1', '/index.php/admin/Ad/add.html', '1527667963');
INSERT INTO `ey_admin_log` VALUES ('174', '1', '编辑栏目：关于我们', '127.0.0.1', '/index.php/admin/Arctype/edit.html', '1527669616');
INSERT INTO `ey_admin_log` VALUES ('175', '1', '新增自定义变量：手机', '127.0.0.1', '/index.php', '1527670162');
INSERT INTO `ey_admin_log` VALUES ('176', '1', '编辑栏目：联系我们', '127.0.0.1', '/index.php/admin/Arctype/edit.html', '1527676970');
INSERT INTO `ey_admin_log` VALUES ('177', '1', '编辑栏目：荣誉资质', '127.0.0.1', '/index.php/admin/Arctype/edit.html', '1527677045');
INSERT INTO `ey_admin_log` VALUES ('178', '1', '编辑栏目：荣誉资质', '127.0.0.1', '/index.php/admin/Arctype/edit.html', '1527677065');
INSERT INTO `ey_admin_log` VALUES ('179', '1', '移动文档-id：45,44,43,42', '127.0.0.1', '/index.php/admin/Article/move.html', '1527677096');
INSERT INTO `ey_admin_log` VALUES ('180', '1', '后台登录', '127.0.0.1', '/index.php/admin/Admin/login.html', '1527727404');
INSERT INTO `ey_admin_log` VALUES ('181', '1', '删除调试外观数据 e-id：204', '127.0.0.1', '/index.php/admin/Uiset/del.html', '1527727998');
INSERT INTO `ey_admin_log` VALUES ('182', '1', '后台登录', '127.0.0.1', '/index.php/admin/Admin/login.html', '1527728239');
INSERT INTO `ey_admin_log` VALUES ('183', '1', '编辑栏目：关于我们', '127.0.0.1', '/index.php/admin/Arctype/edit.html', '1527732313');
INSERT INTO `ey_admin_log` VALUES ('184', '1', '编辑栏目：关于我们', '127.0.0.1', '/index.php/admin/Arctype/edit.html', '1527732323');
INSERT INTO `ey_admin_log` VALUES ('185', '1', '删除栏目：企业文化', '127.0.0.1', '/index.php/admin/Arctype/del.html', '1527732332');
INSERT INTO `ey_admin_log` VALUES ('186', '1', '删除栏目：发展历史', '127.0.0.1', '/index.php/admin/Arctype/del.html', '1527732339');
INSERT INTO `ey_admin_log` VALUES ('187', '1', '编辑普通文章：产品名称一', '127.0.0.1', '/index.php/admin/Article/edit.html', '1527732525');
INSERT INTO `ey_admin_log` VALUES ('188', '1', '编辑普通文章：产品名称二', '127.0.0.1', '/index.php/admin/Article/edit.html', '1527732574');
INSERT INTO `ey_admin_log` VALUES ('189', '1', '编辑普通文章：产品名称三', '127.0.0.1', '/index.php/admin/Article/edit.html', '1527732613');
INSERT INTO `ey_admin_log` VALUES ('190', '1', '编辑普通文章：产品名称四', '127.0.0.1', '/index.php/admin/Article/edit.html', '1527732652');
INSERT INTO `ey_admin_log` VALUES ('191', '1', '编辑广告', '127.0.0.1', '/index.php/admin/Ad/edit.html', '1527732728');
INSERT INTO `ey_admin_log` VALUES ('192', '1', '编辑广告', '127.0.0.1', '/index.php/admin/Ad/edit.html', '1527732745');
INSERT INTO `ey_admin_log` VALUES ('193', '1', '编辑广告位：首页-大幻灯片', '127.0.0.1', '/index.php/admin/AdPosition/edit.html', '1527732759');
INSERT INTO `ey_admin_log` VALUES ('194', '1', '编辑广告位：列表页banner图', '127.0.0.1', '/index.php/admin/AdPosition/edit.html', '1527732789');
INSERT INTO `ey_admin_log` VALUES ('195', '1', '编辑广告', '127.0.0.1', '/index.php/admin/Ad/edit.html', '1527732982');
INSERT INTO `ey_admin_log` VALUES ('196', '1', '编辑广告位：手机端首页头部幻灯', '127.0.0.1', '/index.php/admin/AdPosition/edit.html', '1527733053');
INSERT INTO `ey_admin_log` VALUES ('197', '1', '编辑广告', '127.0.0.1', '/index.php/admin/Ad/edit.html', '1527733072');
INSERT INTO `ey_admin_log` VALUES ('198', '1', '编辑广告', '127.0.0.1', '/index.php/admin/Ad/edit.html', '1527733086');
INSERT INTO `ey_admin_log` VALUES ('199', '1', '删除留言-id：36,35', '127.0.0.1', '/index.php/admin/Guestbook/del.html', '1527736605');
INSERT INTO `ey_admin_log` VALUES ('200', '1', '删除栏目：在线留言', '127.0.0.1', '/index.php/admin/Arctype/del.html', '1527736613');
INSERT INTO `ey_admin_log` VALUES ('201', '1', '新增栏目：技术支持', '127.0.0.1', '/index.php/admin/Arctype/add.html', '1527736655');
INSERT INTO `ey_admin_log` VALUES ('202', '1', '编辑栏目：技术支持', '127.0.0.1', '/index.php/admin/Arctype/edit.html', '1527736684');
INSERT INTO `ey_admin_log` VALUES ('203', '1', '后台登录', '127.0.0.1', '/index.php/admin/Admin/login.html', '1527747340');
INSERT INTO `ey_admin_log` VALUES ('204', '1', '后台登录', '127.0.0.1', '/index.php/admin/Admin/login.html', '1527751976');
INSERT INTO `ey_admin_log` VALUES ('205', '1', '编辑栏目：新闻动态', '127.0.0.1', '/index.php/admin/Arctype/edit.html', '1527752319');
INSERT INTO `ey_admin_log` VALUES ('206', '1', '编辑栏目：产品中心', '127.0.0.1', '/index.php/admin/Arctype/edit.html', '1527752654');
INSERT INTO `ey_admin_log` VALUES ('207', '1', '编辑栏目：第一系列', '127.0.0.1', '/index.php/admin/Arctype/edit.html', '1527752672');
INSERT INTO `ey_admin_log` VALUES ('208', '1', '编辑栏目：第二系列', '127.0.0.1', '/index.php/admin/Arctype/edit.html', '1527752685');
INSERT INTO `ey_admin_log` VALUES ('209', '1', '编辑栏目：第三系列', '127.0.0.1', '/index.php/admin/Arctype/edit.html', '1527752699');
INSERT INTO `ey_admin_log` VALUES ('210', '1', '编辑栏目：第四系列', '127.0.0.1', '/index.php/admin/Arctype/edit.html', '1527752722');
INSERT INTO `ey_admin_log` VALUES ('211', '1', '编辑栏目：第五系列', '127.0.0.1', '/index.php/admin/Arctype/edit.html', '1527752734');
INSERT INTO `ey_admin_log` VALUES ('212', '1', '编辑普通文章：2017两会透露信号：智能卫浴或迎发展黄金期', '127.0.0.1', '/index.php/admin/Article/edit.html', '1527754572');
INSERT INTO `ey_admin_log` VALUES ('213', '1', '编辑普通文章：电子商务网站建设技术：怎样修改网站标题', '127.0.0.1', '/index.php/admin/Article/edit.html', '1527754587');
INSERT INTO `ey_admin_log` VALUES ('214', '1', '编辑普通文章：2017两会透露信号：智能卫浴或迎发展黄金期', '127.0.0.1', '/index.php/admin/Article/edit.html', '1527754614');
INSERT INTO `ey_admin_log` VALUES ('215', '1', '编辑栏目：关于我们', '127.0.0.1', '/index.php/admin/Arctype/edit.html', '1527759545');
INSERT INTO `ey_admin_log` VALUES ('216', '1', '后台登录', '127.0.0.1', '/index.php/admin/Admin/login.html', '1527836303');
INSERT INTO `ey_admin_log` VALUES ('217', '1', '后台登录', '127.0.0.1', '/index.php/admin/Admin/login.html', '1527837435');
INSERT INTO `ey_admin_log` VALUES ('218', '1', '编辑广告', '127.0.0.1', '/index.php/admin/Ad/edit.html', '1527837780');
INSERT INTO `ey_admin_log` VALUES ('219', '1', '编辑广告', '127.0.0.1', '/index.php/admin/Ad/edit.html', '1527837792');
INSERT INTO `ey_admin_log` VALUES ('220', '1', '编辑广告位：首页-大幻灯片', '127.0.0.1', '/index.php/admin/AdPosition/edit.html', '1527837810');
INSERT INTO `ey_admin_log` VALUES ('221', '1', '编辑栏目：关于我们', '127.0.0.1', '/index.php/admin/Arctype/edit.html', '1527838139');
INSERT INTO `ey_admin_log` VALUES ('222', '1', '新增自定义变量：联系人', '127.0.0.1', '/index.php', '1527838415');
INSERT INTO `ey_admin_log` VALUES ('223', '1', '新增自定义变量：地图坐标', '127.0.0.1', '/index.php', '1527838673');
INSERT INTO `ey_admin_log` VALUES ('224', '1', '新增广告位：PC端首页产品栏目下部广告位', '127.0.0.1', '/index.php/admin/AdPosition/add.html', '1527839313');
INSERT INTO `ey_admin_log` VALUES ('225', '1', '新增广告：【首页】中部图片“负重攀越，只为一个全新高度”', '127.0.0.1', '/index.php/admin/Ad/add.html', '1527839409');
INSERT INTO `ey_admin_log` VALUES ('226', '1', '新增栏目：公司动态', '127.0.0.1', '/index.php/admin/Arctype/add.html', '1527839899');
INSERT INTO `ey_admin_log` VALUES ('227', '1', '新增栏目：行业资讯', '127.0.0.1', '/index.php/admin/Arctype/add.html', '1527839913');
INSERT INTO `ey_admin_log` VALUES ('228', '1', '新增栏目：常见问题', '127.0.0.1', '/index.php/admin/Arctype/add.html', '1527839926');
INSERT INTO `ey_admin_log` VALUES ('229', '1', '移动文档-id：21,20,19,13', '127.0.0.1', '/index.php/admin/Article/move.html', '1527839961');
INSERT INTO `ey_admin_log` VALUES ('230', '1', '移动文档-id：50,49,48,47,46,4', '127.0.0.1', '/index.php/admin/Article/move.html', '1527839985');
INSERT INTO `ey_admin_log` VALUES ('231', '1', '编辑栏目：公司动态', '127.0.0.1', '/index.php/admin/Arctype/edit.html', '1527842067');
INSERT INTO `ey_admin_log` VALUES ('232', '1', '编辑栏目：行业资讯', '127.0.0.1', '/index.php/admin/Arctype/edit.html', '1527842085');
INSERT INTO `ey_admin_log` VALUES ('233', '1', '编辑栏目：常见问题', '127.0.0.1', '/index.php/admin/Arctype/edit.html', '1527842100');
INSERT INTO `ey_admin_log` VALUES ('234', '1', '删除自定义变量：web_attr_1', '127.0.0.1', '/index.php', '1527843335');
INSERT INTO `ey_admin_log` VALUES ('235', '1', '新增自定义变量：网站PC端底部Logo', '127.0.0.1', '/index.php', '1527843377');
INSERT INTO `ey_admin_log` VALUES ('236', '1', '编辑广告', '127.0.0.1', '/index.php/admin/Ad/edit.html', '1527845076');
INSERT INTO `ey_admin_log` VALUES ('237', '1', '删除栏目：行业资讯', '127.0.0.1', '/index.php/admin/Arctype/del.html', '1527845098');
INSERT INTO `ey_admin_log` VALUES ('238', '1', '编辑普通文章：产品名称四', '127.0.0.1', '/index.php/admin/Article/edit.html', '1527845613');
INSERT INTO `ey_admin_log` VALUES ('239', '1', '编辑广告', '127.0.0.1', '/index.php/admin/Ad/edit.html', '1527846097');
INSERT INTO `ey_admin_log` VALUES ('240', '1', '编辑广告', '127.0.0.1', '/index.php/admin/Ad/edit.html', '1527846113');
INSERT INTO `ey_admin_log` VALUES ('241', '1', '编辑广告位：手机端首页头部幻灯', '127.0.0.1', '/index.php/admin/AdPosition/edit.html', '1527846130');
INSERT INTO `ey_admin_log` VALUES ('242', '1', '新增普通文章：共享，正从风口到风险', '127.0.0.1', '/index.php/admin/Article/add.html', '1527850833');
INSERT INTO `ey_admin_log` VALUES ('243', '1', '新增普通文章：在人工智能炒热机器人时，也被人把风带进了教', '127.0.0.1', '/index.php/admin/Article/add.html', '1527850851');
INSERT INTO `ey_admin_log` VALUES ('244', '1', '新增普通文章：阿里影业为未来增持淘票票，但眼下“烧钱”依', '127.0.0.1', '/index.php/admin/Article/add.html', '1527850868');
INSERT INTO `ey_admin_log` VALUES ('245', '1', '新增普通文章：比特币价格回稳，但考验才刚刚开始……', '127.0.0.1', '/index.php/admin/Article/add.html', '1527850888');
INSERT INTO `ey_admin_log` VALUES ('246', '1', '新增普通文章：谈谈用户体验与风控的平衡性', '127.0.0.1', '/index.php/admin/Article/add.html', '1527850907');
INSERT INTO `ey_admin_log` VALUES ('247', '1', '移动文档-id：4', '127.0.0.1', '/index.php/admin/Article/move.html', '1527850943');
INSERT INTO `ey_admin_log` VALUES ('248', '1', '编辑普通文章：产品名称一', '127.0.0.1', '/index.php/admin/Article/edit.html', '1527851865');
INSERT INTO `ey_admin_log` VALUES ('249', '1', '编辑普通文章：产品名称二', '127.0.0.1', '/index.php/admin/Article/edit.html', '1527851916');
INSERT INTO `ey_admin_log` VALUES ('250', '1', '编辑普通文章：产品名称三', '127.0.0.1', '/index.php/admin/Article/edit.html', '1527851950');
INSERT INTO `ey_admin_log` VALUES ('251', '1', '编辑普通文章：产品名称四', '127.0.0.1', '/index.php/admin/Article/edit.html', '1527851976');
INSERT INTO `ey_admin_log` VALUES ('252', '1', '新增普通文章：产品名称五', '127.0.0.1', '/index.php/admin/Article/add.html', '1527852003');
INSERT INTO `ey_admin_log` VALUES ('253', '1', '新增普通文章：产品名称六', '127.0.0.1', '/index.php/admin/Article/add.html', '1527852031');
INSERT INTO `ey_admin_log` VALUES ('254', '1', '编辑栏目：产品中心', '127.0.0.1', '/index.php/admin/Arctype/edit.html', '1527852083');
INSERT INTO `ey_admin_log` VALUES ('255', '1', '编辑栏目：成功案例', '127.0.0.1', '/index.php/admin/Arctype/edit.html', '1527852122');
INSERT INTO `ey_admin_log` VALUES ('256', '1', '后台登录', '127.0.0.1', '/index.php/admin/Admin/login.html', '1527890153');
INSERT INTO `ey_admin_log` VALUES ('257', '1', '新增自定义变量：微博地址', '127.0.0.1', '/index.php', '1527890184');
INSERT INTO `ey_admin_log` VALUES ('258', '1', '编辑栏目：关于我们', '127.0.0.1', '/index.php/admin/Arctype/edit.html', '1527890456');
INSERT INTO `ey_admin_log` VALUES ('259', '1', '编辑广告', '127.0.0.1', '/index.php/admin/Ad/edit.html', '1527890502');
INSERT INTO `ey_admin_log` VALUES ('260', '1', '编辑广告', '127.0.0.1', '/index.php/admin/Ad/edit.html', '1527890517');
INSERT INTO `ey_admin_log` VALUES ('261', '1', '编辑广告位：首页-大幻灯片', '127.0.0.1', '/index.php/admin/AdPosition/edit.html', '1527890532');
INSERT INTO `ey_admin_log` VALUES ('262', '1', '删除栏目：技术支持', '127.0.0.1', '/index.php/admin/Arctype/del.html', '1527890584');
INSERT INTO `ey_admin_log` VALUES ('263', '1', '删除广告-id：3', '127.0.0.1', '/index.php/admin/Ad/del.html', '1527893951');
INSERT INTO `ey_admin_log` VALUES ('264', '1', '删除广告-id：6', '127.0.0.1', '/index.php/admin/Ad/del.html', '1527893955');
INSERT INTO `ey_admin_log` VALUES ('265', '1', '删除广告位-id：4,2', '127.0.0.1', '/index.php/admin/AdPosition/del.html', '1527893965');
INSERT INTO `ey_admin_log` VALUES ('266', '1', '编辑自定义变量：固话', '127.0.0.1', '/index.php', '1527897969');
INSERT INTO `ey_admin_log` VALUES ('267', '1', '编辑自定义变量：手机端地图', '127.0.0.1', '/index.php', '1527898066');
INSERT INTO `ey_admin_log` VALUES ('268', '1', '编辑普通文章：案例展示一', '127.0.0.1', '/index.php/admin/Article/edit.html', '1527899526');
INSERT INTO `ey_admin_log` VALUES ('269', '1', '编辑普通文章：案例展示二', '127.0.0.1', '/index.php/admin/Article/edit.html', '1527899548');
INSERT INTO `ey_admin_log` VALUES ('270', '1', '编辑普通文章：案例展示三', '127.0.0.1', '/index.php/admin/Article/edit.html', '1527899570');
INSERT INTO `ey_admin_log` VALUES ('271', '1', '编辑普通文章：案例展示四', '127.0.0.1', '/index.php/admin/Article/edit.html', '1527899588');
INSERT INTO `ey_admin_log` VALUES ('272', '1', '编辑普通文章：案例展示五', '127.0.0.1', '/index.php/admin/Article/edit.html', '1527899609');
INSERT INTO `ey_admin_log` VALUES ('273', '1', '编辑普通文章：案例展示六', '127.0.0.1', '/index.php/admin/Article/edit.html', '1527899629');
INSERT INTO `ey_admin_log` VALUES ('274', '1', '删除普通文章-id：63,62,61,60,59', '127.0.0.1', '/index.php/admin/Article/del.html', '1527899713');
INSERT INTO `ey_admin_log` VALUES ('275', '1', '删除栏目：常见问题', '127.0.0.1', '/index.php/admin/Arctype/del.html', '1527899728');
INSERT INTO `ey_admin_log` VALUES ('276', '1', '删除普通文章-id：21,20,19,13,4', '127.0.0.1', '/index.php/admin/Article/del.html', '1527899740');
INSERT INTO `ey_admin_log` VALUES ('277', '1', '删除普通文章-id：50,49,48,47,46', '127.0.0.1', '/index.php/admin/Article/del.html', '1527899754');
INSERT INTO `ey_admin_log` VALUES ('278', '1', '新增普通文章：腾讯游戏营收比重连续两个季度下降，支付、云计算等业务营收涨348%', '127.0.0.1', '/index.php/admin/Article/add.html', '1527899801');
INSERT INTO `ey_admin_log` VALUES ('279', '1', '新增普通文章：获 3800 万元 A+ 轮投资，乐摇摇科技利用抓娃娃机做线下版的广点通', '127.0.0.1', '/index.php/admin/Article/add.html', '1527899841');
INSERT INTO `ey_admin_log` VALUES ('280', '1', '新增普通文章：借网生大势赚了两年快钱后，考拉娱乐开始切入女性人群做点“慢”内容', '127.0.0.1', '/index.php/admin/Article/add.html', '1527899871');
INSERT INTO `ey_admin_log` VALUES ('281', '1', '新增普通文章：传滴滴即将接入ofo，共享单车大战格局或生变', '127.0.0.1', '/index.php/admin/Article/add.html', '1527899901');
INSERT INTO `ey_admin_log` VALUES ('282', '1', '新增普通文章：点击在线求助，应答的却都是机器人，这样真的好吗？', '127.0.0.1', '/index.php/admin/Article/add.html', '1527899926');
INSERT INTO `ey_admin_log` VALUES ('283', '1', '新增普通文章：美业信息化规模将现，门庭管店为他们提供了一套SaaS管理软件', '127.0.0.1', '/index.php/admin/Article/add.html', '1527899951');
INSERT INTO `ey_admin_log` VALUES ('284', '1', '新增普通文章：腾讯500万美元领投AI创企ObEN，进一步布局社交AI', '127.0.0.1', '/index.php/admin/Article/add.html', '1527899983');
INSERT INTO `ey_admin_log` VALUES ('285', '1', '新增普通文章：无人便利店风口正当时，“便利家”获联创永宣冯涛数百万元天使投资', '127.0.0.1', '/index.php/admin/Article/add.html', '1527900014');
INSERT INTO `ey_admin_log` VALUES ('286', '1', '新增普通文章：旅游市场将迎来内容红利？河马旅居想做旅游界的“小红书”', '127.0.0.1', '/index.php/admin/Article/add.html', '1527900047');
INSERT INTO `ey_admin_log` VALUES ('287', '1', '删除自定义变量：web_attr_63', '127.0.0.1', '/index.php', '1527901655');
INSERT INTO `ey_admin_log` VALUES ('288', '1', '删除自定义变量：web_attr_54', '127.0.0.1', '/index.php', '1527901678');
INSERT INTO `ey_admin_log` VALUES ('289', '1', '新增自定义变量：手机站二维码', '127.0.0.1', '/index.php', '1528182029');
INSERT INTO `ey_admin_log` VALUES ('290', '1', '编辑自定义变量：网站公告', '127.0.0.1', '/index.php', '1528182392');
INSERT INTO `ey_admin_log` VALUES ('291', '1', '编辑栏目：关于我们', '127.0.0.1', '/index.php/admin/Arctype/edit.html', '1528183456');
INSERT INTO `ey_admin_log` VALUES ('292', '1', '编辑广告', '127.0.0.1', '/index.php/admin/Ad/edit.html', '1528183533');
INSERT INTO `ey_admin_log` VALUES ('293', '1', '编辑广告', '127.0.0.1', '/index.php/admin/Ad/edit.html', '1528183544');
INSERT INTO `ey_admin_log` VALUES ('294', '1', '编辑广告位：头部-大幻灯片', '127.0.0.1', '/index.php/admin/AdPosition/edit.html', '1528183594');
INSERT INTO `ey_admin_log` VALUES ('295', '1', '新增栏目：客户留言', '127.0.0.1', '/index.php/admin/Arctype/add.html', '1528183914');
INSERT INTO `ey_admin_log` VALUES ('296', '1', '编辑广告', '127.0.0.1', '/index.php/admin/Ad/edit.html', '1528184164');
INSERT INTO `ey_admin_log` VALUES ('297', '1', '编辑广告', '127.0.0.1', '/index.php/admin/Ad/edit.html', '1528184177');
INSERT INTO `ey_admin_log` VALUES ('298', '1', '编辑栏目：关于我们', '127.0.0.1', '/index.php/admin/Arctype/edit.html', '1528184314');
INSERT INTO `ey_admin_log` VALUES ('299', '1', '编辑栏目：关于我们', '127.0.0.1', '/index.php/admin/Arctype/edit.html', '1528184345');
INSERT INTO `ey_admin_log` VALUES ('300', '1', '编辑栏目：新闻动态', '127.0.0.1', '/index.php/admin/Arctype/edit.html', '1528184556');
INSERT INTO `ey_admin_log` VALUES ('301', '1', '删除友情链接：fdgf', '127.0.0.1', '/index.php/admin/Links/del.html', '1528184953');
INSERT INTO `ey_admin_log` VALUES ('302', '1', '删除友情链接：dagfdgfd', '127.0.0.1', '/index.php/admin/Links/del.html', '1528184957');
INSERT INTO `ey_admin_log` VALUES ('303', '1', '编辑友情链接：素材58', '127.0.0.1', '/index.php/admin/Links/edit.html', '1528184985');
INSERT INTO `ey_admin_log` VALUES ('304', '1', '编辑友情链接：区块链是什么', '127.0.0.1', '/index.php/admin/Links/edit.html', '1528185028');
INSERT INTO `ey_admin_log` VALUES ('305', '1', '编辑友情链接：易优CMS', '127.0.0.1', '/index.php/admin/Links/edit.html', '1528185051');
INSERT INTO `ey_admin_log` VALUES ('306', '1', '编辑友情链接：微信小程序开发教程', '127.0.0.1', '/index.php/admin/Links/edit.html', '1528185058');
INSERT INTO `ey_admin_log` VALUES ('307', '1', '新增留言表单：您的姓名', '127.0.0.1', '/index.php/admin/Guestbook/attribute_add.html', '1528187013');
INSERT INTO `ey_admin_log` VALUES ('308', '1', '新增留言表单：联系电话', '127.0.0.1', '/index.php/admin/Guestbook/attribute_add.html', '1528187026');
INSERT INTO `ey_admin_log` VALUES ('309', '1', '新增留言表单：电子邮件', '127.0.0.1', '/index.php/admin/Guestbook/attribute_add.html', '1528187038');
INSERT INTO `ey_admin_log` VALUES ('310', '1', '新增留言表单：信息反馈', '127.0.0.1', '/index.php/admin/Guestbook/attribute_add.html', '1528187048');
INSERT INTO `ey_admin_log` VALUES ('311', '1', '编辑普通文章：产品名称一', '127.0.0.1', '/index.php/admin/Article/edit.html', '1528187825');
INSERT INTO `ey_admin_log` VALUES ('312', '1', '编辑普通文章：产品名称二', '127.0.0.1', '/index.php/admin/Article/edit.html', '1528187855');
INSERT INTO `ey_admin_log` VALUES ('313', '1', '编辑普通文章：产品名称三', '127.0.0.1', '/index.php/admin/Article/edit.html', '1528187882');
INSERT INTO `ey_admin_log` VALUES ('314', '1', '编辑普通文章：产品名称四', '127.0.0.1', '/index.php/admin/Article/edit.html', '1528187911');
INSERT INTO `ey_admin_log` VALUES ('315', '1', '编辑普通文章：产品名称五', '127.0.0.1', '/index.php/admin/Article/edit.html', '1528187935');
INSERT INTO `ey_admin_log` VALUES ('316', '1', '编辑普通文章：产品名称六', '127.0.0.1', '/index.php/admin/Article/edit.html', '1528187961');
INSERT INTO `ey_admin_log` VALUES ('317', '1', '新增普通文章：产品名称七', '127.0.0.1', '/index.php/admin/Article/add.html', '1528187990');
INSERT INTO `ey_admin_log` VALUES ('318', '1', '新增普通文章：产品名称八', '127.0.0.1', '/index.php/admin/Article/add.html', '1528188018');
INSERT INTO `ey_admin_log` VALUES ('319', '1', '删除自定义变量：web_attr_62', '127.0.0.1', '/index.php', '1528188782');
INSERT INTO `ey_admin_log` VALUES ('320', '1', '编辑广告', '127.0.0.1', '/index.php/admin/Ad/edit.html', '1528189031');
INSERT INTO `ey_admin_log` VALUES ('321', '1', '编辑广告', '127.0.0.1', '/index.php/admin/Ad/edit.html', '1528189052');
INSERT INTO `ey_admin_log` VALUES ('322', '1', '编辑广告位：手机端首页头部幻灯', '127.0.0.1', '/index.php/admin/AdPosition/edit.html', '1528189064');
INSERT INTO `ey_admin_log` VALUES ('323', '1', '新增栏目：合作加盟', '127.0.0.1', '/index.php/admin/Arctype/add.html', '1528189320');
INSERT INTO `ey_admin_log` VALUES ('324', '1', '编辑栏目：合作加盟', '127.0.0.1', '/index.php/admin/Arctype/edit.html', '1528189337');
INSERT INTO `ey_admin_log` VALUES ('325', '1', '后台登录', '127.0.0.1', '/index.php/admin/Admin/login.html', '1528246213');
INSERT INTO `ey_admin_log` VALUES ('326', '1', '编辑栏目：服务套餐', '127.0.0.1', '/index.php/admin/Arctype/edit.html', '1528246593');
INSERT INTO `ey_admin_log` VALUES ('327', '1', '删除栏目：客户留言', '127.0.0.1', '/index.php/admin/Arctype/del.html', '1528246602');
INSERT INTO `ey_admin_log` VALUES ('328', '1', '编辑广告', '127.0.0.1', '/index.php/admin/Ad/edit.html', '1528247023');
INSERT INTO `ey_admin_log` VALUES ('329', '1', '编辑广告', '127.0.0.1', '/index.php/admin/Ad/edit.html', '1528247048');
INSERT INTO `ey_admin_log` VALUES ('330', '1', '编辑栏目：新闻动态', '127.0.0.1', '/index.php/admin/Arctype/edit.html', '1528247205');
INSERT INTO `ey_admin_log` VALUES ('331', '1', '编辑栏目：服务套餐', '127.0.0.1', '/index.php/admin/Arctype/edit.html', '1528247220');
INSERT INTO `ey_admin_log` VALUES ('332', '1', '新增自定义变量：首页视频展示地址', '127.0.0.1', '/index.php', '1528248101');
INSERT INTO `ey_admin_log` VALUES ('333', '1', '编辑栏目：产品中心', '127.0.0.1', '/index.php/admin/Arctype/edit.html', '1528248762');
INSERT INTO `ey_admin_log` VALUES ('334', '1', '编辑栏目：技术支持', '127.0.0.1', '/index.php/admin/Arctype/edit.html', '1528249063');
INSERT INTO `ey_admin_log` VALUES ('335', '1', '新增栏目：服务套餐', '127.0.0.1', '/index.php/admin/Arctype/add.html', '1528249090');
INSERT INTO `ey_admin_log` VALUES ('336', '1', '编辑栏目：技术支持', '127.0.0.1', '/index.php/admin/Arctype/edit.html', '1528249138');
INSERT INTO `ey_admin_log` VALUES ('337', '1', '编辑栏目：联系我们', '127.0.0.1', '/index.php/admin/Arctype/edit.html', '1528249149');
INSERT INTO `ey_admin_log` VALUES ('338', '1', '编辑栏目：服务套餐', '127.0.0.1', '/index.php/admin/Arctype/edit.html', '1528249160');
INSERT INTO `ey_admin_log` VALUES ('339', '1', '删除自定义变量：web_attr_65', '127.0.0.1', '/index.php', '1528249908');
INSERT INTO `ey_admin_log` VALUES ('340', '1', '新增广告位：PC端栏目页幻灯', '127.0.0.1', '/index.php/admin/AdPosition/add.html', '1528250145');
INSERT INTO `ey_admin_log` VALUES ('341', '1', '新增广告：栏目幻灯一', '127.0.0.1', '/index.php/admin/Ad/add.html', '1528250242');
INSERT INTO `ey_admin_log` VALUES ('342', '1', '新增广告：栏目幻灯二', '127.0.0.1', '/index.php/admin/Ad/add.html', '1528250260');
INSERT INTO `ey_admin_log` VALUES ('343', '1', '编辑栏目：服务项目', '127.0.0.1', '/index.php/admin/Arctype/edit.html', '1528252846');
INSERT INTO `ey_admin_log` VALUES ('344', '1', '编辑普通文章：产品名称八', '127.0.0.1', '/index.php/admin/Article/edit.html', '1528253201');
INSERT INTO `ey_admin_log` VALUES ('345', '1', '编辑普通文章：产品名称七', '127.0.0.1', '/index.php/admin/Article/edit.html', '1528253256');
INSERT INTO `ey_admin_log` VALUES ('346', '1', '编辑普通文章：产品名称六', '127.0.0.1', '/index.php/admin/Article/edit.html', '1528253282');
INSERT INTO `ey_admin_log` VALUES ('347', '1', '编辑普通文章：产品名称五', '127.0.0.1', '/index.php/admin/Article/edit.html', '1528253316');
INSERT INTO `ey_admin_log` VALUES ('348', '1', '编辑普通文章：产品名称四', '127.0.0.1', '/index.php/admin/Article/edit.html', '1528253342');
INSERT INTO `ey_admin_log` VALUES ('349', '1', '编辑普通文章：产品名称三', '127.0.0.1', '/index.php/admin/Article/edit.html', '1528253374');
INSERT INTO `ey_admin_log` VALUES ('350', '1', '编辑普通文章：产品名称二', '127.0.0.1', '/index.php/admin/Article/edit.html', '1528253405');
INSERT INTO `ey_admin_log` VALUES ('351', '1', '编辑普通文章：产品名称一', '127.0.0.1', '/index.php/admin/Article/edit.html', '1528253415');
INSERT INTO `ey_admin_log` VALUES ('352', '1', '编辑普通文章：案例展示六', '127.0.0.1', '/index.php/admin/Article/edit.html', '1528253886');
INSERT INTO `ey_admin_log` VALUES ('353', '1', '新增栏目：人才招聘', '127.0.0.1', '/index.php/admin/Arctype/add.html', '1528254071');
INSERT INTO `ey_admin_log` VALUES ('354', '1', '编辑栏目：人才招聘', '127.0.0.1', '/index.php/admin/Arctype/edit.html', '1528254099');
INSERT INTO `ey_admin_log` VALUES ('355', '1', '编辑栏目：人才招聘', '127.0.0.1', '/index.php/admin/Arctype/edit.html', '1528254137');
INSERT INTO `ey_admin_log` VALUES ('356', '1', '编辑普通文章：腾讯500万美元领投AI创企ObEN，进一步布局社交AI', '127.0.0.1', '/index.php/admin/Article/edit.html', '1528254238');
INSERT INTO `ey_admin_log` VALUES ('357', '1', '编辑普通文章：无人便利店风口正当时，“便利家”获联创永宣冯涛数百万元天使投资', '127.0.0.1', '/index.php/admin/Article/edit.html', '1528254325');
INSERT INTO `ey_admin_log` VALUES ('358', '1', '编辑普通文章：旅游市场将迎来内容红利？河马旅居想做旅游界的“小红书”', '127.0.0.1', '/index.php/admin/Article/edit.html', '1528254351');
INSERT INTO `ey_admin_log` VALUES ('359', '1', '新增普通文章：珍爱智商，远离“区块链”', '127.0.0.1', '/index.php/admin/Article/add.html', '1528266298');
INSERT INTO `ey_admin_log` VALUES ('360', '1', '新增普通文章：传统企业如何向新零售转型？', '127.0.0.1', '/index.php/admin/Article/add.html', '1528266327');
INSERT INTO `ey_admin_log` VALUES ('361', '1', '新增普通文章：比特币价格回稳，但考验才刚刚开始……', '127.0.0.1', '/index.php/admin/Article/add.html', '1528266369');
INSERT INTO `ey_admin_log` VALUES ('362', '1', '新增普通文章：刮着大风的人工智能，躺着赚钱的自动驾驶', '127.0.0.1', '/index.php/admin/Article/add.html', '1528266411');
INSERT INTO `ey_admin_log` VALUES ('363', '1', '编辑广告', '127.0.0.1', '/index.php/admin/Ad/edit.html', '1528267116');
INSERT INTO `ey_admin_log` VALUES ('364', '1', '编辑广告', '127.0.0.1', '/index.php/admin/Ad/edit.html', '1528267133');
INSERT INTO `ey_admin_log` VALUES ('365', '1', '编辑广告位：手机端首页头部幻灯', '127.0.0.1', '/index.php/admin/AdPosition/edit.html', '1528267147');
INSERT INTO `ey_admin_log` VALUES ('366', '1', '删除栏目：服务套餐', '127.0.0.1', '/index.php/admin/Arctype/del.html', '1528272075');
INSERT INTO `ey_admin_log` VALUES ('367', '1', '新增栏目：在线留言', '127.0.0.1', '/index.php/admin/Arctype/add.html', '1528272138');
INSERT INTO `ey_admin_log` VALUES ('368', '1', '编辑广告', '127.0.0.1', '/index.php/admin/Ad/edit.html', '1528272959');
INSERT INTO `ey_admin_log` VALUES ('369', '1', '编辑广告', '127.0.0.1', '/index.php/admin/Ad/edit.html', '1528272972');
INSERT INTO `ey_admin_log` VALUES ('370', '1', '新增栏目：产品FAQ', '127.0.0.1', '/index.php/admin/Arctype/add.html', '1528273554');
INSERT INTO `ey_admin_log` VALUES ('371', '1', '新增留言表单：您的姓名', '127.0.0.1', '/index.php/admin/Guestbook/attribute_add.html', '1528276243');
INSERT INTO `ey_admin_log` VALUES ('372', '1', '新增留言表单：您的电话', '127.0.0.1', '/index.php/admin/Guestbook/attribute_add.html', '1528276257');
INSERT INTO `ey_admin_log` VALUES ('373', '1', '新增留言表单：邮箱地址', '127.0.0.1', '/index.php/admin/Guestbook/attribute_add.html', '1528276274');
INSERT INTO `ey_admin_log` VALUES ('374', '1', '新增留言表单：留言内容', '127.0.0.1', '/index.php/admin/Guestbook/attribute_add.html', '1528276287');
INSERT INTO `ey_admin_log` VALUES ('375', '1', '删除栏目：技术支持', '127.0.0.1', '/index.php/admin/Arctype/del.html', '1528276407');
INSERT INTO `ey_admin_log` VALUES ('376', '1', '编辑普通文章：产品名称一', '127.0.0.1', '/index.php/admin/Article/edit.html', '1528277879');
INSERT INTO `ey_admin_log` VALUES ('377', '1', '编辑普通文章：产品名称二', '127.0.0.1', '/index.php/admin/Article/edit.html', '1528277901');
INSERT INTO `ey_admin_log` VALUES ('378', '1', '编辑普通文章：产品名称三', '127.0.0.1', '/index.php/admin/Article/edit.html', '1528277931');
INSERT INTO `ey_admin_log` VALUES ('379', '1', '编辑普通文章：产品名称四', '127.0.0.1', '/index.php/admin/Article/edit.html', '1528277957');
INSERT INTO `ey_admin_log` VALUES ('380', '1', '编辑普通文章：产品名称五', '127.0.0.1', '/index.php/admin/Article/edit.html', '1528277986');
INSERT INTO `ey_admin_log` VALUES ('381', '1', '编辑普通文章：产品名称六', '127.0.0.1', '/index.php/admin/Article/edit.html', '1528278011');
INSERT INTO `ey_admin_log` VALUES ('382', '1', '编辑普通文章：产品名称七', '127.0.0.1', '/index.php/admin/Article/edit.html', '1528278035');
INSERT INTO `ey_admin_log` VALUES ('383', '1', '编辑普通文章：产品名称八', '127.0.0.1', '/index.php/admin/Article/edit.html', '1528278057');
INSERT INTO `ey_admin_log` VALUES ('384', '1', '编辑普通文章：腾讯500万美元领投AI创企ObEN，进一步布局社交AI', '127.0.0.1', '/index.php/admin/Article/edit.html', '1528278103');
INSERT INTO `ey_admin_log` VALUES ('385', '1', '编辑普通文章：无人便利店风口正当时，“便利家”获联创永宣冯涛数百万元天使投资', '127.0.0.1', '/index.php/admin/Article/edit.html', '1528278120');
INSERT INTO `ey_admin_log` VALUES ('386', '1', '编辑普通文章：旅游市场将迎来内容红利？河马旅居想做旅游界的“小红书”', '127.0.0.1', '/index.php/admin/Article/edit.html', '1528278133');
INSERT INTO `ey_admin_log` VALUES ('387', '1', '编辑普通文章：美业信息化规模将现，门庭管店为他们提供了一套SaaS管理软件', '127.0.0.1', '/index.php/admin/Article/edit.html', '1528278150');
INSERT INTO `ey_admin_log` VALUES ('388', '1', '新增普通文章：电脑清洗小技巧', '127.0.0.1', '/index.php/admin/Article/add.html', '1528278216');
INSERT INTO `ey_admin_log` VALUES ('389', '1', '新增普通文章：白色布鞋清洗技巧', '127.0.0.1', '/index.php/admin/Article/add.html', '1528278277');
INSERT INTO `ey_admin_log` VALUES ('390', '1', '新增普通文章：油烟机清洗小窍门', '127.0.0.1', '/index.php/admin/Article/add.html', '1528278300');
INSERT INTO `ey_admin_log` VALUES ('391', '1', '新增普通文章：清洁玻璃窗户小窍门', '127.0.0.1', '/index.php/admin/Article/add.html', '1528278327');
INSERT INTO `ey_admin_log` VALUES ('392', '1', '新增普通文章：清洁洗衣机小技巧', '127.0.0.1', '/index.php/admin/Article/add.html', '1528278362');
INSERT INTO `ey_admin_log` VALUES ('393', '1', '新增普通文章：清洗纱窗小技巧', '127.0.0.1', '/index.php/admin/Article/add.html', '1528278384');
INSERT INTO `ey_admin_log` VALUES ('394', '1', '新增普通文章：清洁马桶小技巧', '127.0.0.1', '/index.php/admin/Article/add.html', '1528278412');
INSERT INTO `ey_admin_log` VALUES ('395', '1', '编辑普通文章：案例展示一', '127.0.0.1', '/index.php/admin/Article/edit.html', '1528278699');
INSERT INTO `ey_admin_log` VALUES ('396', '1', '编辑普通文章：案例展示二', '127.0.0.1', '/index.php/admin/Article/edit.html', '1528278731');
INSERT INTO `ey_admin_log` VALUES ('397', '1', '编辑普通文章：案例展示三', '127.0.0.1', '/index.php/admin/Article/edit.html', '1528278757');
INSERT INTO `ey_admin_log` VALUES ('398', '1', '编辑普通文章：案例展示四', '127.0.0.1', '/index.php/admin/Article/edit.html', '1528278787');
INSERT INTO `ey_admin_log` VALUES ('399', '1', '编辑普通文章：案例展示五', '127.0.0.1', '/index.php/admin/Article/edit.html', '1528278817');
INSERT INTO `ey_admin_log` VALUES ('400', '1', '编辑普通文章：案例展示六', '127.0.0.1', '/index.php/admin/Article/edit.html', '1528278843');
INSERT INTO `ey_admin_log` VALUES ('401', '1', '删除广告-id：7', '127.0.0.1', '/index.php/admin/Ad/del.html', '1528279535');
INSERT INTO `ey_admin_log` VALUES ('402', '1', '删除广告-id：8', '127.0.0.1', '/index.php/admin/Ad/del.html', '1528279539');
INSERT INTO `ey_admin_log` VALUES ('403', '1', '删除广告位-id：5', '127.0.0.1', '/index.php/admin/AdPosition/del.html', '1528279546');
INSERT INTO `ey_admin_log` VALUES ('404', '1', '编辑广告', '127.0.0.1', '/index.php/admin/Ad/edit.html', '1528279564');
INSERT INTO `ey_admin_log` VALUES ('405', '1', '编辑广告', '127.0.0.1', '/index.php/admin/Ad/edit.html', '1528279577');
INSERT INTO `ey_admin_log` VALUES ('406', '1', '编辑广告位：手机端首页头部幻灯', '127.0.0.1', '/index.php/admin/AdPosition/edit.html', '1528279612');
INSERT INTO `ey_admin_log` VALUES ('407', '1', '编辑广告位：头部-大幻灯片', '127.0.0.1', '/index.php/admin/AdPosition/edit.html', '1528279627');
INSERT INTO `ey_admin_log` VALUES ('408', '1', '删除留言-id：40', '127.0.0.1', '/index.php/admin/Guestbook/del.html', '1528280686');
INSERT INTO `ey_admin_log` VALUES ('409', '1', '编辑栏目：服务项目', '127.0.0.1', '/index.php/admin/Arctype/edit.html', '1528295834');
INSERT INTO `ey_admin_log` VALUES ('410', '1', '新增自定义变量：首页中部广告图片', '127.0.0.1', '/index.php', '1528296155');
INSERT INTO `ey_admin_log` VALUES ('411', '1', '新增普通文章：案例展示七', '127.0.0.1', '/index.php/admin/Article/add.html', '1528296641');
INSERT INTO `ey_admin_log` VALUES ('412', '1', '新增普通文章：案例展示八', '127.0.0.1', '/index.php/admin/Article/add.html', '1528296673');
INSERT INTO `ey_admin_log` VALUES ('413', '1', '编辑自定义变量：手机官网二维码', '127.0.0.1', '/index.php', '1528296850');
INSERT INTO `ey_admin_log` VALUES ('414', '1', '新增普通文章：案例展示九', '127.0.0.1', '/index.php/admin/Article/add.html', '1528331740');
INSERT INTO `ey_admin_log` VALUES ('415', '1', '新增广告位：PC端栏目页banner图', '127.0.0.1', '/index.php/admin/AdPosition/add.html', '1528332605');
INSERT INTO `ey_admin_log` VALUES ('416', '1', '新增广告：banner图', '127.0.0.1', '/index.php/admin/Ad/add.html', '1528332666');
INSERT INTO `ey_admin_log` VALUES ('417', '1', '编辑栏目：技术支持', '127.0.0.1', '/index.php/admin/Arctype/edit.html', '1528333827');
INSERT INTO `ey_admin_log` VALUES ('418', '1', '删除普通文章-id：92', '127.0.0.1', '/index.php/admin/Article/del.html', '1528338187');
INSERT INTO `ey_admin_log` VALUES ('419', '1', '编辑栏目：产品中心', '127.0.0.1', '/index.php/admin/Arctype/edit.html', '1528338247');
INSERT INTO `ey_admin_log` VALUES ('420', '1', '编辑栏目：关于我们', '127.0.0.1', '/index.php/admin/Arctype/edit.html', '1528338268');
INSERT INTO `ey_admin_log` VALUES ('421', '1', '编辑普通文章：产品名称一', '127.0.0.1', '/index.php/admin/Article/edit.html', '1528338353');
INSERT INTO `ey_admin_log` VALUES ('422', '1', '编辑普通文章：产品名称二', '127.0.0.1', '/index.php/admin/Article/edit.html', '1528338384');
INSERT INTO `ey_admin_log` VALUES ('423', '1', '编辑普通文章：产品名称三', '127.0.0.1', '/index.php/admin/Article/edit.html', '1528338409');
INSERT INTO `ey_admin_log` VALUES ('424', '1', '编辑普通文章：产品名称四', '127.0.0.1', '/index.php/admin/Article/edit.html', '1528338432');
INSERT INTO `ey_admin_log` VALUES ('425', '1', '编辑普通文章：产品名称五', '127.0.0.1', '/index.php/admin/Article/edit.html', '1528338492');
INSERT INTO `ey_admin_log` VALUES ('426', '1', '编辑普通文章：产品名称六', '127.0.0.1', '/index.php/admin/Article/edit.html', '1528338517');
INSERT INTO `ey_admin_log` VALUES ('427', '1', '编辑普通文章：产品名称七', '127.0.0.1', '/index.php/admin/Article/edit.html', '1528338567');
INSERT INTO `ey_admin_log` VALUES ('428', '1', '编辑普通文章：产品名称八', '127.0.0.1', '/index.php/admin/Article/edit.html', '1528338593');
INSERT INTO `ey_admin_log` VALUES ('429', '1', '编辑普通文章：旅游市场将迎来内容红利？河马旅居想做旅游界的“小红书”', '127.0.0.1', '/index.php/admin/Article/edit.html', '1528339663');
INSERT INTO `ey_admin_log` VALUES ('430', '1', '编辑普通文章：无人便利店风口正当时，“便利家”获联创永宣冯涛数百万元天使投资', '127.0.0.1', '/index.php/admin/Article/edit.html', '1528339681');
INSERT INTO `ey_admin_log` VALUES ('431', '1', '编辑普通文章：美业信息化规模将现，门庭管店为他们提供了一套SaaS管理软件', '127.0.0.1', '/index.php/admin/Article/edit.html', '1528339695');
INSERT INTO `ey_admin_log` VALUES ('432', '1', '编辑普通文章：腾讯500万美元领投AI创企ObEN，进一步布局社交AI', '127.0.0.1', '/index.php/admin/Article/edit.html', '1528339705');
INSERT INTO `ey_admin_log` VALUES ('433', '1', '删除留言-id：42,41,39', '127.0.0.1', '/index.php/admin/Guestbook/del.html', '1528339760');
INSERT INTO `ey_admin_log` VALUES ('434', '1', '删除留言-id：43', '127.0.0.1', '/index.php/admin/Guestbook/del.html', '1528339957');
INSERT INTO `ey_admin_log` VALUES ('435', '1', '编辑广告', '127.0.0.1', '/index.php/admin/Ad/edit.html', '1528355928');
INSERT INTO `ey_admin_log` VALUES ('436', '1', '编辑广告', '127.0.0.1', '/index.php/admin/Ad/edit.html', '1528355942');
INSERT INTO `ey_admin_log` VALUES ('437', '1', '删除栏目：产品FAQ', '127.0.0.1', '/index.php/admin/Arctype/del.html', '1528356609');
INSERT INTO `ey_admin_log` VALUES ('438', '1', '后台登录', '127.0.0.1', '/index.php/admin/Admin/login.html', '1528439457');
INSERT INTO `ey_admin_log` VALUES ('439', '1', '编辑广告', '127.0.0.1', '/index.php/admin/Ad/edit.html', '1528682991');
INSERT INTO `ey_admin_log` VALUES ('440', '1', '编辑广告', '127.0.0.1', '/index.php/admin/Ad/edit.html', '1528683002');
INSERT INTO `ey_admin_log` VALUES ('441', '1', '编辑广告位：头部-大幻灯片', '127.0.0.1', '/index.php/admin/AdPosition/edit.html', '1528683070');
INSERT INTO `ey_admin_log` VALUES ('442', '1', '编辑栏目：关于我们', '127.0.0.1', '/index.php/admin/Arctype/edit.html', '1528683430');
INSERT INTO `ey_admin_log` VALUES ('443', '1', '删除留言-id：46,45,44', '127.0.0.1', '/index.php/admin/Guestbook/del.html', '1528686417');
INSERT INTO `ey_admin_log` VALUES ('444', '1', '编辑普通文章：荣誉证书一', '127.0.0.1', '/index.php/admin/Article/edit.html', '1528686742');
INSERT INTO `ey_admin_log` VALUES ('445', '1', '编辑普通文章：荣誉证书二', '127.0.0.1', '/index.php/admin/Article/edit.html', '1528686761');
INSERT INTO `ey_admin_log` VALUES ('446', '1', '编辑普通文章：荣誉证书三', '127.0.0.1', '/index.php/admin/Article/edit.html', '1528686782');
INSERT INTO `ey_admin_log` VALUES ('447', '1', '编辑普通文章：荣誉证书四', '127.0.0.1', '/index.php/admin/Article/edit.html', '1528686801');
INSERT INTO `ey_admin_log` VALUES ('448', '1', '编辑普通文章：案例展示一', '127.0.0.1', '/index.php/admin/Article/edit.html', '1528686903');
INSERT INTO `ey_admin_log` VALUES ('449', '1', '编辑普通文章：案例展示二', '127.0.0.1', '/index.php/admin/Article/edit.html', '1528686927');
INSERT INTO `ey_admin_log` VALUES ('450', '1', '编辑普通文章：案例展示三', '127.0.0.1', '/index.php/admin/Article/edit.html', '1528686948');
INSERT INTO `ey_admin_log` VALUES ('451', '1', '编辑普通文章：案例展示四', '127.0.0.1', '/index.php/admin/Article/edit.html', '1528686969');
INSERT INTO `ey_admin_log` VALUES ('452', '1', '编辑普通文章：案例展示五', '127.0.0.1', '/index.php/admin/Article/edit.html', '1528686994');
INSERT INTO `ey_admin_log` VALUES ('453', '1', '编辑普通文章：案例展示六', '127.0.0.1', '/index.php/admin/Article/edit.html', '1528687014');
INSERT INTO `ey_admin_log` VALUES ('454', '1', '编辑普通文章：案例展示七', '127.0.0.1', '/index.php/admin/Article/edit.html', '1528687039');
INSERT INTO `ey_admin_log` VALUES ('455', '1', '编辑普通文章：案例展示八', '127.0.0.1', '/index.php/admin/Article/edit.html', '1528687060');
INSERT INTO `ey_admin_log` VALUES ('456', '1', '编辑普通文章：旅游市场将迎来内容红利？河马旅居想做旅游界的“小红书”', '127.0.0.1', '/index.php/admin/Article/edit.html', '1528687127');
INSERT INTO `ey_admin_log` VALUES ('457', '1', '编辑普通文章：腾讯游戏营收比重连续两个季度下降，支付、云计算等业务营收涨348%', '127.0.0.1', '/index.php/admin/Article/edit.html', '1528687144');
INSERT INTO `ey_admin_log` VALUES ('458', '1', '编辑普通文章：获 3800 万元 A+ 轮投资，乐摇摇科技利用抓娃娃机做线下版的广点通', '127.0.0.1', '/index.php/admin/Article/edit.html', '1528687174');
INSERT INTO `ey_admin_log` VALUES ('459', '1', '编辑普通文章：借网生大势赚了两年快钱后，考拉娱乐开始切入女性人群做点“慢”内容', '127.0.0.1', '/index.php/admin/Article/edit.html', '1528687187');
INSERT INTO `ey_admin_log` VALUES ('460', '1', '编辑普通文章：传滴滴即将接入ofo，共享单车大战格局或生变', '127.0.0.1', '/index.php/admin/Article/edit.html', '1528687202');
INSERT INTO `ey_admin_log` VALUES ('461', '1', '编辑普通文章：点击在线求助，应答的却都是机器人，这样真的好吗？', '127.0.0.1', '/index.php/admin/Article/edit.html', '1528687215');
INSERT INTO `ey_admin_log` VALUES ('462', '1', '编辑普通文章：美业信息化规模将现，门庭管店为他们提供了一套SaaS管理软件', '127.0.0.1', '/index.php/admin/Article/edit.html', '1528687228');
INSERT INTO `ey_admin_log` VALUES ('463', '1', '编辑普通文章：腾讯500万美元领投AI创企ObEN，进一步布局社交AI', '127.0.0.1', '/index.php/admin/Article/edit.html', '1528687244');
INSERT INTO `ey_admin_log` VALUES ('464', '1', '编辑普通文章：无人便利店风口正当时，“便利家”获联创永宣冯涛数百万元天使投资', '127.0.0.1', '/index.php/admin/Article/edit.html', '1528687259');
INSERT INTO `ey_admin_log` VALUES ('465', '1', '编辑普通文章：旅游市场将迎来内容红利？河马旅居想做旅游界的“小红书”', '127.0.0.1', '/index.php/admin/Article/edit.html', '1528687268');
INSERT INTO `ey_admin_log` VALUES ('466', '1', '编辑普通文章：产品名称一', '127.0.0.1', '/index.php/admin/Article/edit.html', '1528698279');
INSERT INTO `ey_admin_log` VALUES ('467', '1', '编辑普通文章：产品名称二', '127.0.0.1', '/index.php/admin/Article/edit.html', '1528698300');
INSERT INTO `ey_admin_log` VALUES ('468', '1', '编辑普通文章：产品名称三', '127.0.0.1', '/index.php/admin/Article/edit.html', '1528698326');
INSERT INTO `ey_admin_log` VALUES ('469', '1', '编辑普通文章：产品名称四', '127.0.0.1', '/index.php/admin/Article/edit.html', '1528698356');
INSERT INTO `ey_admin_log` VALUES ('470', '1', '编辑普通文章：产品名称五', '127.0.0.1', '/index.php/admin/Article/edit.html', '1528698383');
INSERT INTO `ey_admin_log` VALUES ('471', '1', '编辑普通文章：产品名称六', '127.0.0.1', '/index.php/admin/Article/edit.html', '1528698415');
INSERT INTO `ey_admin_log` VALUES ('472', '1', '编辑普通文章：产品名称七', '127.0.0.1', '/index.php/admin/Article/edit.html', '1528698440');
INSERT INTO `ey_admin_log` VALUES ('473', '1', '编辑普通文章：产品名称八', '127.0.0.1', '/index.php/admin/Article/edit.html', '1528698457');
INSERT INTO `ey_admin_log` VALUES ('474', '1', '新增广告位：测试幻灯', '127.0.0.1', '/index.php/admin/AdPosition/add.html', '1528701020');
INSERT INTO `ey_admin_log` VALUES ('475', '1', '删除广告位-id：7', '127.0.0.1', '/index.php/admin/AdPosition/del.html', '1528701060');
INSERT INTO `ey_admin_log` VALUES ('476', '1', '删除广告-id：9', '127.0.0.1', '/index.php/admin/Ad/del.html', '1528701109');
INSERT INTO `ey_admin_log` VALUES ('477', '1', '编辑广告', '127.0.0.1', '/index.php/admin/Ad/edit.html', '1528701137');
INSERT INTO `ey_admin_log` VALUES ('478', '1', '编辑广告', '127.0.0.1', '/index.php/admin/Ad/edit.html', '1528701149');
INSERT INTO `ey_admin_log` VALUES ('479', '1', '删除广告位-id：6', '127.0.0.1', '/index.php/admin/AdPosition/del.html', '1528701185');
INSERT INTO `ey_admin_log` VALUES ('480', '1', '后台登录', '127.0.0.1', '/index.php/admin/Admin/login.html', '1528852789');
INSERT INTO `ey_admin_log` VALUES ('481', '1', '删除自定义变量：web_attr_67', '127.0.0.1', '/index.php', '1528852841');
INSERT INTO `ey_admin_log` VALUES ('482', '1', '删除自定义变量：web_attr_66', '127.0.0.1', '/index.php', '1528852868');
INSERT INTO `ey_admin_log` VALUES ('483', '1', '编辑广告', '127.0.0.1', '/index.php/admin/Ad/edit.html', '1528941136');
INSERT INTO `ey_admin_log` VALUES ('484', '1', '编辑广告', '127.0.0.1', '/index.php/admin/Ad/edit.html', '1528941148');
INSERT INTO `ey_admin_log` VALUES ('485', '1', '编辑广告位：PC端头部-大幻灯片', '127.0.0.1', '/index.php/admin/AdPosition/edit.html', '1528941187');
INSERT INTO `ey_admin_log` VALUES ('486', '1', '新增自定义变量：PC端首页中部加盟咨询图片', '127.0.0.1', '/index.php', '1528941251');
INSERT INTO `ey_admin_log` VALUES ('487', '1', '编辑普通文章：腾讯500万美元领投AI创企ObEN，进一步布局社交AI', '127.0.0.1', '/index.php/admin/Article/edit.html', '1528941305');
INSERT INTO `ey_admin_log` VALUES ('488', '1', '编辑普通文章：点击在线求助，应答的却都是机器人，这样真的好吗？', '127.0.0.1', '/index.php/admin/Article/edit.html', '1528941314');
INSERT INTO `ey_admin_log` VALUES ('489', '1', '新增自定义变量：PC端底部Logo', '127.0.0.1', '/index.php', '1528941426');
INSERT INTO `ey_admin_log` VALUES ('490', '1', '新增广告位：PC端栏目页banner图', '127.0.0.1', '/index.php/admin/AdPosition/add.html', '1528942104');
INSERT INTO `ey_admin_log` VALUES ('491', '1', '编辑广告位：PC端首页头部-大幻灯片', '127.0.0.1', '/index.php/admin/AdPosition/edit.html', '1528942122');
INSERT INTO `ey_admin_log` VALUES ('492', '1', '新增广告：栏目banner图', '127.0.0.1', '/index.php/admin/Ad/add.html', '1528942150');
INSERT INTO `ey_admin_log` VALUES ('493', '1', '新增自定义变量：地图坐标', '127.0.0.1', '/index.php', '1528942176');
INSERT INTO `ey_admin_log` VALUES ('494', '1', '编辑普通文章：产品名称一', '127.0.0.1', '/index.php/admin/Article/edit.html', '1528942432');
INSERT INTO `ey_admin_log` VALUES ('495', '1', '编辑普通文章：产品名称二', '127.0.0.1', '/index.php/admin/Article/edit.html', '1528942462');
INSERT INTO `ey_admin_log` VALUES ('496', '1', '编辑普通文章：产品名称三', '127.0.0.1', '/index.php/admin/Article/edit.html', '1528942484');
INSERT INTO `ey_admin_log` VALUES ('497', '1', '编辑普通文章：产品名称四', '127.0.0.1', '/index.php/admin/Article/edit.html', '1528942504');
INSERT INTO `ey_admin_log` VALUES ('498', '1', '编辑普通文章：产品名称五', '127.0.0.1', '/index.php/admin/Article/edit.html', '1528942525');
INSERT INTO `ey_admin_log` VALUES ('499', '1', '编辑普通文章：产品名称六', '127.0.0.1', '/index.php/admin/Article/edit.html', '1528942545');
INSERT INTO `ey_admin_log` VALUES ('500', '1', '编辑普通文章：产品名称七', '127.0.0.1', '/index.php/admin/Article/edit.html', '1528942569');
INSERT INTO `ey_admin_log` VALUES ('501', '1', '编辑普通文章：产品名称八', '127.0.0.1', '/index.php/admin/Article/edit.html', '1528942590');
INSERT INTO `ey_admin_log` VALUES ('502', '1', '编辑自定义变量：栏目页左部地图坐标', '127.0.0.1', '/index.php', '1528943937');
INSERT INTO `ey_admin_log` VALUES ('503', '1', '编辑广告', '127.0.0.1', '/index.php/admin/Ad/edit.html', '1528944009');
INSERT INTO `ey_admin_log` VALUES ('504', '1', '编辑广告', '127.0.0.1', '/index.php/admin/Ad/edit.html', '1528944022');
INSERT INTO `ey_admin_log` VALUES ('505', '1', '编辑广告位：手机端首页头部幻灯', '127.0.0.1', '/index.php/admin/AdPosition/edit.html', '1528944041');
INSERT INTO `ey_admin_log` VALUES ('506', '1', '编辑广告', '127.0.0.1', '/index.php/admin/Ad/edit.html', '1529112960');
INSERT INTO `ey_admin_log` VALUES ('507', '1', '编辑广告', '127.0.0.1', '/index.php/admin/Ad/edit.html', '1529112971');
INSERT INTO `ey_admin_log` VALUES ('508', '1', '编辑广告位：PC端首页头部-大幻灯片', '127.0.0.1', '/index.php/admin/AdPosition/edit.html', '1529113001');
INSERT INTO `ey_admin_log` VALUES ('509', '1', '编辑栏目：关于我们', '127.0.0.1', '/index.php/admin/Arctype/edit.html', '1529113359');
INSERT INTO `ey_admin_log` VALUES ('510', '1', '移动文档-id：69,68,67,66', '127.0.0.1', '/index.php/admin/Article/move.html', '1529113719');
INSERT INTO `ey_admin_log` VALUES ('511', '1', '删除自定义变量：web_attr_70', '127.0.0.1', '/index.php', '1529115290');
INSERT INTO `ey_admin_log` VALUES ('512', '1', '删除自定义变量：web_attr_69', '127.0.0.1', '/index.php', '1529115295');
INSERT INTO `ey_admin_log` VALUES ('513', '1', '删除自定义变量：web_attr_68', '127.0.0.1', '/index.php', '1529115299');
INSERT INTO `ey_admin_log` VALUES ('514', '1', '删除留言-id：48,47', '127.0.0.1', '/index.php/admin/Guestbook/del.html', '1529115319');
INSERT INTO `ey_admin_log` VALUES ('515', '1', '编辑普通文章：产品名称一', '127.0.0.1', '/index.php/admin/Article/edit.html', '1529115608');
INSERT INTO `ey_admin_log` VALUES ('516', '1', '编辑普通文章：产品名称二', '127.0.0.1', '/index.php/admin/Article/edit.html', '1529115626');
INSERT INTO `ey_admin_log` VALUES ('517', '1', '编辑普通文章：产品名称三', '127.0.0.1', '/index.php/admin/Article/edit.html', '1529115641');
INSERT INTO `ey_admin_log` VALUES ('518', '1', '编辑普通文章：产品名称四', '127.0.0.1', '/index.php/admin/Article/edit.html', '1529115661');
INSERT INTO `ey_admin_log` VALUES ('519', '1', '编辑普通文章：产品名称五', '127.0.0.1', '/index.php/admin/Article/edit.html', '1529115702');
INSERT INTO `ey_admin_log` VALUES ('520', '1', '编辑普通文章：产品名称六', '127.0.0.1', '/index.php/admin/Article/edit.html', '1529115718');
INSERT INTO `ey_admin_log` VALUES ('521', '1', '编辑普通文章：产品名称七', '127.0.0.1', '/index.php/admin/Article/edit.html', '1529115732');
INSERT INTO `ey_admin_log` VALUES ('522', '1', '编辑普通文章：产品名称八', '127.0.0.1', '/index.php/admin/Article/edit.html', '1529115750');
INSERT INTO `ey_admin_log` VALUES ('523', '1', '删除广告-id：10', '127.0.0.1', '/index.php/admin/Ad/del.html', '1529116281');
INSERT INTO `ey_admin_log` VALUES ('524', '1', '删除广告位-id：8', '127.0.0.1', '/index.php/admin/AdPosition/del.html', '1529116287');
INSERT INTO `ey_admin_log` VALUES ('525', '1', '编辑广告', '127.0.0.1', '/index.php/admin/Ad/edit.html', '1529116304');
INSERT INTO `ey_admin_log` VALUES ('526', '1', '编辑广告', '127.0.0.1', '/index.php/admin/Ad/edit.html', '1529116321');
INSERT INTO `ey_admin_log` VALUES ('527', '1', '编辑广告位：手机端首页头部幻灯', '127.0.0.1', '/index.php/admin/AdPosition/edit.html', '1529116335');
INSERT INTO `ey_admin_log` VALUES ('528', '1', '删除自定义变量：web_attr_61', '127.0.0.1', '/index.php', '1529121068');
INSERT INTO `ey_admin_log` VALUES ('529', '1', '后台登录', '127.0.0.1', '/index.php/admin/Admin/login.html', '1529131680');
INSERT INTO `ey_admin_log` VALUES ('530', '1', '编辑广告', '127.0.0.1', '/index.php/admin/Ad/edit.html', '1529131741');
INSERT INTO `ey_admin_log` VALUES ('531', '1', '编辑广告', '127.0.0.1', '/index.php/admin/Ad/edit.html', '1529131753');
INSERT INTO `ey_admin_log` VALUES ('532', '1', '编辑广告位：PC端首页头部-大幻灯片', '127.0.0.1', '/index.php/admin/AdPosition/edit.html', '1529131786');
INSERT INTO `ey_admin_log` VALUES ('533', '1', '编辑广告位：手机端首页头部幻灯', '127.0.0.1', '/index.php/admin/AdPosition/edit.html', '1529131831');
INSERT INTO `ey_admin_log` VALUES ('534', '1', '编辑广告', '127.0.0.1', '/index.php/admin/Ad/edit.html', '1529131848');
INSERT INTO `ey_admin_log` VALUES ('535', '1', '编辑广告', '127.0.0.1', '/index.php/admin/Ad/edit.html', '1529131865');
INSERT INTO `ey_admin_log` VALUES ('536', '1', '编辑栏目：关于我们', '127.0.0.1', '/index.php/admin/Arctype/edit.html', '1529133190');
INSERT INTO `ey_admin_log` VALUES ('537', '1', '删除留言-id：49', '127.0.0.1', '/index.php/admin/Guestbook/del.html', '1529135614');
INSERT INTO `ey_admin_log` VALUES ('538', '1', '编辑普通文章：产品名称一', '127.0.0.1', '/index.php/admin/Article/edit.html', '1529136702');
INSERT INTO `ey_admin_log` VALUES ('539', '1', '编辑普通文章：产品名称二', '127.0.0.1', '/index.php/admin/Article/edit.html', '1529136720');
INSERT INTO `ey_admin_log` VALUES ('540', '1', '编辑普通文章：产品名称三', '127.0.0.1', '/index.php/admin/Article/edit.html', '1529136737');
INSERT INTO `ey_admin_log` VALUES ('541', '1', '编辑普通文章：产品名称四', '127.0.0.1', '/index.php/admin/Article/edit.html', '1529136753');
INSERT INTO `ey_admin_log` VALUES ('542', '1', '编辑普通文章：产品名称五', '127.0.0.1', '/index.php/admin/Article/edit.html', '1529136772');
INSERT INTO `ey_admin_log` VALUES ('543', '1', '编辑普通文章：产品名称六', '127.0.0.1', '/index.php/admin/Article/edit.html', '1529136791');
INSERT INTO `ey_admin_log` VALUES ('544', '1', '编辑普通文章：产品名称七', '127.0.0.1', '/index.php/admin/Article/edit.html', '1529136807');
INSERT INTO `ey_admin_log` VALUES ('545', '1', '编辑普通文章：产品名称八', '127.0.0.1', '/index.php/admin/Article/edit.html', '1529136822');
INSERT INTO `ey_admin_log` VALUES ('546', '1', '后台登录', '127.0.0.1', '/index.php/admin/Admin/login.html', '1529368795');
INSERT INTO `ey_admin_log` VALUES ('547', '1', '后台登录', '127.0.0.1', '/index.php/admin/Admin/login.html', '1529370889');
INSERT INTO `ey_admin_log` VALUES ('548', '1', '编辑广告', '127.0.0.1', '/index.php/admin/Ad/edit.html', '1529371484');
INSERT INTO `ey_admin_log` VALUES ('549', '1', '编辑广告', '127.0.0.1', '/index.php/admin/Ad/edit.html', '1529371497');
INSERT INTO `ey_admin_log` VALUES ('550', '1', '编辑广告位：PC端首页头部-大幻灯片', '127.0.0.1', '/index.php/admin/AdPosition/edit.html', '1529371513');
INSERT INTO `ey_admin_log` VALUES ('551', '1', '编辑栏目：关于我们', '127.0.0.1', '/index.php/admin/Arctype/edit.html', '1529371864');
INSERT INTO `ey_admin_log` VALUES ('552', '1', '新增广告位：PC端栏目页banner图', '127.0.0.1', '/index.php/admin/AdPosition/add.html', '1529374021');
INSERT INTO `ey_admin_log` VALUES ('553', '1', '新增广告：栏目banner图', '127.0.0.1', '/index.php/admin/Ad/add.html', '1529374168');
INSERT INTO `ey_admin_log` VALUES ('554', '1', '删除留言-id：50', '127.0.0.1', '/index.php/admin/Guestbook/del.html', '1529378038');
INSERT INTO `ey_admin_log` VALUES ('555', '1', '编辑普通文章：产品名称一', '127.0.0.1', '/index.php/admin/Article/edit.html', '1529378315');
INSERT INTO `ey_admin_log` VALUES ('556', '1', '编辑普通文章：产品名称二', '127.0.0.1', '/index.php/admin/Article/edit.html', '1529378332');
INSERT INTO `ey_admin_log` VALUES ('557', '1', '编辑普通文章：产品名称三', '127.0.0.1', '/index.php/admin/Article/edit.html', '1529378349');
INSERT INTO `ey_admin_log` VALUES ('558', '1', '编辑普通文章：产品名称四', '127.0.0.1', '/index.php/admin/Article/edit.html', '1529378378');
INSERT INTO `ey_admin_log` VALUES ('559', '1', '编辑普通文章：产品名称五', '127.0.0.1', '/index.php/admin/Article/edit.html', '1529378398');
INSERT INTO `ey_admin_log` VALUES ('560', '1', '编辑普通文章：产品名称六', '127.0.0.1', '/index.php/admin/Article/edit.html', '1529378497');
INSERT INTO `ey_admin_log` VALUES ('561', '1', '编辑普通文章：产品名称七', '127.0.0.1', '/index.php/admin/Article/edit.html', '1529378577');
INSERT INTO `ey_admin_log` VALUES ('562', '1', '编辑普通文章：产品名称八', '127.0.0.1', '/index.php/admin/Article/edit.html', '1529378594');
INSERT INTO `ey_admin_log` VALUES ('563', '1', '后台登录', '127.0.0.1', '/index.php/admin/Admin/login.html', '1529389937');
INSERT INTO `ey_admin_log` VALUES ('564', '1', '编辑广告', '127.0.0.1', '/index.php/admin/Ad/edit.html', '1529393288');
INSERT INTO `ey_admin_log` VALUES ('565', '1', '编辑广告', '127.0.0.1', '/index.php/admin/Ad/edit.html', '1529393312');
INSERT INTO `ey_admin_log` VALUES ('566', '1', '编辑广告位：手机端首页头部幻灯', '127.0.0.1', '/index.php/admin/AdPosition/edit.html', '1529393339');
INSERT INTO `ey_admin_log` VALUES ('567', '1', '后台登录', '127.0.0.1', '/index.php/admin/Admin/login.html', '1529403380');
INSERT INTO `ey_admin_log` VALUES ('568', '1', '编辑广告', '127.0.0.1', '/index.php/admin/Ad/edit.html', '1529403936');
INSERT INTO `ey_admin_log` VALUES ('569', '1', '编辑广告', '127.0.0.1', '/index.php/admin/Ad/edit.html', '1529403951');
INSERT INTO `ey_admin_log` VALUES ('570', '1', '编辑广告', '127.0.0.1', '/index.php/admin/Ad/edit.html', '1529404309');
INSERT INTO `ey_admin_log` VALUES ('571', '1', '编辑广告', '127.0.0.1', '/index.php/admin/Ad/edit.html', '1529404325');
INSERT INTO `ey_admin_log` VALUES ('572', '1', '编辑广告位：PC端首页头部-大幻灯片', '127.0.0.1', '/index.php/admin/AdPosition/edit.html', '1529404340');
INSERT INTO `ey_admin_log` VALUES ('573', '1', '编辑广告', '127.0.0.1', '/index.php/admin/Ad/edit.html', '1529406191');
INSERT INTO `ey_admin_log` VALUES ('574', '1', '编辑普通文章：产品名称一', '127.0.0.1', '/index.php/admin/Article/edit.html', '1529408110');
INSERT INTO `ey_admin_log` VALUES ('575', '1', '编辑普通文章：产品名称二', '127.0.0.1', '/index.php/admin/Article/edit.html', '1529408127');
INSERT INTO `ey_admin_log` VALUES ('576', '1', '编辑普通文章：产品名称三', '127.0.0.1', '/index.php/admin/Article/edit.html', '1529408143');
INSERT INTO `ey_admin_log` VALUES ('577', '1', '编辑普通文章：产品名称四', '127.0.0.1', '/index.php/admin/Article/edit.html', '1529408159');
INSERT INTO `ey_admin_log` VALUES ('578', '1', '编辑普通文章：产品名称五', '127.0.0.1', '/index.php/admin/Article/edit.html', '1529408178');
INSERT INTO `ey_admin_log` VALUES ('579', '1', '编辑普通文章：产品名称六', '127.0.0.1', '/index.php/admin/Article/edit.html', '1529408196');
INSERT INTO `ey_admin_log` VALUES ('580', '1', '编辑普通文章：产品名称七', '127.0.0.1', '/index.php/admin/Article/edit.html', '1529408211');
INSERT INTO `ey_admin_log` VALUES ('581', '1', '编辑普通文章：产品名称八', '127.0.0.1', '/index.php/admin/Article/edit.html', '1529408228');
INSERT INTO `ey_admin_log` VALUES ('582', '1', '编辑广告', '127.0.0.1', '/index.php/admin/Ad/edit.html', '1529408755');
INSERT INTO `ey_admin_log` VALUES ('583', '1', '编辑广告', '127.0.0.1', '/index.php/admin/Ad/edit.html', '1529408772');
INSERT INTO `ey_admin_log` VALUES ('584', '1', '编辑广告位：手机端首页头部幻灯', '127.0.0.1', '/index.php/admin/AdPosition/edit.html', '1529408785');
INSERT INTO `ey_admin_log` VALUES ('585', '1', '后台登录', '127.0.0.1', '/index.php/admin/Admin/login.html', '1529461742');
INSERT INTO `ey_admin_log` VALUES ('586', '1', '编辑广告', '127.0.0.1', '/index.php/admin/Ad/edit.html', '1529462321');
INSERT INTO `ey_admin_log` VALUES ('587', '1', '编辑广告', '127.0.0.1', '/index.php/admin/Ad/edit.html', '1529462338');
INSERT INTO `ey_admin_log` VALUES ('588', '1', '编辑广告位：PC端首页头部-大幻灯片', '127.0.0.1', '/index.php/admin/AdPosition/edit.html', '1529462367');
INSERT INTO `ey_admin_log` VALUES ('589', '1', '删除广告-id：11', '127.0.0.1', '/index.php/admin/Ad/del.html', '1529462381');
INSERT INTO `ey_admin_log` VALUES ('590', '1', '删除广告位-id：9', '127.0.0.1', '/index.php/admin/AdPosition/del.html', '1529462388');
INSERT INTO `ey_admin_log` VALUES ('591', '1', '新增栏目：施工流程', '127.0.0.1', '/index.php/admin/Arctype/add.html', '1529462422');
INSERT INTO `ey_admin_log` VALUES ('592', '1', '编辑栏目：施工流程', '127.0.0.1', '/index.php/admin/Arctype/edit.html', '1529462441');
INSERT INTO `ey_admin_log` VALUES ('593', '1', '编辑栏目：施工流程', '127.0.0.1', '/index.php/admin/Arctype/edit.html', '1529462598');
INSERT INTO `ey_admin_log` VALUES ('594', '1', '删除留言-id：52,51', '127.0.0.1', '/index.php/admin/Guestbook/del.html', '1529464597');
INSERT INTO `ey_admin_log` VALUES ('595', '1', '编辑普通文章：产品名称一', '127.0.0.1', '/index.php/admin/Article/edit.html', '1529473003');
INSERT INTO `ey_admin_log` VALUES ('596', '1', '编辑普通文章：产品名称二', '127.0.0.1', '/index.php/admin/Article/edit.html', '1529473021');
INSERT INTO `ey_admin_log` VALUES ('597', '1', '编辑普通文章：产品名称三', '127.0.0.1', '/index.php/admin/Article/edit.html', '1529473040');
INSERT INTO `ey_admin_log` VALUES ('598', '1', '编辑普通文章：产品名称四', '127.0.0.1', '/index.php/admin/Article/edit.html', '1529473057');
INSERT INTO `ey_admin_log` VALUES ('599', '1', '编辑普通文章：产品名称五', '127.0.0.1', '/index.php/admin/Article/edit.html', '1529473078');
INSERT INTO `ey_admin_log` VALUES ('600', '1', '编辑普通文章：产品名称六', '127.0.0.1', '/index.php/admin/Article/edit.html', '1529473096');
INSERT INTO `ey_admin_log` VALUES ('601', '1', '编辑普通文章：产品名称七', '127.0.0.1', '/index.php/admin/Article/edit.html', '1529473119');
INSERT INTO `ey_admin_log` VALUES ('602', '1', '编辑普通文章：产品名称八', '127.0.0.1', '/index.php/admin/Article/edit.html', '1529473147');
INSERT INTO `ey_admin_log` VALUES ('603', '1', '编辑广告', '127.0.0.1', '/index.php/admin/Ad/edit.html', '1529473612');
INSERT INTO `ey_admin_log` VALUES ('604', '1', '编辑广告', '127.0.0.1', '/index.php/admin/Ad/edit.html', '1529473624');
INSERT INTO `ey_admin_log` VALUES ('605', '1', '后台登录', '127.0.0.1', '/index.php/admin/Admin/login.html', '1529543067');
INSERT INTO `ey_admin_log` VALUES ('606', '1', '编辑广告', '127.0.0.1', '/index.php/admin/Ad/edit.html', '1529543119');
INSERT INTO `ey_admin_log` VALUES ('607', '1', '编辑广告', '127.0.0.1', '/index.php/admin/Ad/edit.html', '1529543137');
INSERT INTO `ey_admin_log` VALUES ('608', '1', '编辑广告位：PC端首页头部-大幻灯片', '127.0.0.1', '/index.php/admin/AdPosition/edit.html', '1529543150');
INSERT INTO `ey_admin_log` VALUES ('609', '1', '编辑普通文章：产品名称一', '127.0.0.1', '/index.php/admin/Article/edit.html', '1529543184');
INSERT INTO `ey_admin_log` VALUES ('610', '1', '编辑普通文章：产品名称二', '127.0.0.1', '/index.php/admin/Article/edit.html', '1529543200');
INSERT INTO `ey_admin_log` VALUES ('611', '1', '编辑普通文章：产品名称三', '127.0.0.1', '/index.php/admin/Article/edit.html', '1529543218');
INSERT INTO `ey_admin_log` VALUES ('612', '1', '编辑普通文章：产品名称四', '127.0.0.1', '/index.php/admin/Article/edit.html', '1529543239');
INSERT INTO `ey_admin_log` VALUES ('613', '1', '编辑普通文章：产品名称五', '127.0.0.1', '/index.php/admin/Article/edit.html', '1529543258');
INSERT INTO `ey_admin_log` VALUES ('614', '1', '编辑普通文章：产品名称五', '127.0.0.1', '/index.php/admin/Article/edit.html', '1529543353');
INSERT INTO `ey_admin_log` VALUES ('615', '1', '编辑普通文章：产品名称六', '127.0.0.1', '/index.php/admin/Article/edit.html', '1529543373');
INSERT INTO `ey_admin_log` VALUES ('616', '1', '编辑普通文章：产品名称七', '127.0.0.1', '/index.php/admin/Article/edit.html', '1529543396');
INSERT INTO `ey_admin_log` VALUES ('617', '1', '编辑普通文章：产品名称八', '127.0.0.1', '/index.php/admin/Article/edit.html', '1529543413');
INSERT INTO `ey_admin_log` VALUES ('618', '1', '编辑广告', '127.0.0.1', '/index.php/admin/Ad/edit.html', '1529543501');
INSERT INTO `ey_admin_log` VALUES ('619', '1', '编辑广告', '127.0.0.1', '/index.php/admin/Ad/edit.html', '1529543516');
INSERT INTO `ey_admin_log` VALUES ('620', '1', '编辑广告位：手机端首页头部幻灯', '127.0.0.1', '/index.php/admin/AdPosition/edit.html', '1529543533');
INSERT INTO `ey_admin_log` VALUES ('621', '1', '编辑栏目：关于我们', '127.0.0.1', '/index.php/admin/Arctype/edit.html', '1529546553');
INSERT INTO `ey_admin_log` VALUES ('622', '1', '后台登录', '127.0.0.1', '/index.php/admin/Admin/login.html', '1529548568');
INSERT INTO `ey_admin_log` VALUES ('623', '1', '编辑普通文章：案例展示一', '127.0.0.1', '/index.php/admin/Article/edit.html', '1529562734');
INSERT INTO `ey_admin_log` VALUES ('624', '1', '编辑普通文章：案例展示二', '127.0.0.1', '/index.php/admin/Article/edit.html', '1529562749');
INSERT INTO `ey_admin_log` VALUES ('625', '1', '编辑普通文章：案例展示三', '127.0.0.1', '/index.php/admin/Article/edit.html', '1529562761');
INSERT INTO `ey_admin_log` VALUES ('626', '1', '编辑普通文章：案例展示四', '127.0.0.1', '/index.php/admin/Article/edit.html', '1529562776');
INSERT INTO `ey_admin_log` VALUES ('627', '1', '编辑普通文章：案例展示五', '127.0.0.1', '/index.php/admin/Article/edit.html', '1529562789');
INSERT INTO `ey_admin_log` VALUES ('628', '1', '编辑普通文章：案例展示六', '127.0.0.1', '/index.php/admin/Article/edit.html', '1529562802');
INSERT INTO `ey_admin_log` VALUES ('629', '1', '编辑普通文章：案例展示七', '127.0.0.1', '/index.php/admin/Article/edit.html', '1529562813');
INSERT INTO `ey_admin_log` VALUES ('630', '1', '编辑普通文章：案例展示八', '127.0.0.1', '/index.php/admin/Article/edit.html', '1529562825');
INSERT INTO `ey_admin_log` VALUES ('631', '1', '后台登录', '127.0.0.1', '/index.php/admin/Admin/login.html', '1529564452');
INSERT INTO `ey_admin_log` VALUES ('632', '1', '删除栏目：施工流程', '127.0.0.1', '/index.php/admin/Arctype/del.html', '1529565573');
INSERT INTO `ey_admin_log` VALUES ('633', '1', '编辑栏目：关于我们', '127.0.0.1', '/index.php/admin/Arctype/edit.html', '1529565744');
INSERT INTO `ey_admin_log` VALUES ('634', '1', '删除留言-id：54,53', '127.0.0.1', '/index.php/admin/Guestbook/del.html', '1529568280');
INSERT INTO `ey_admin_log` VALUES ('635', '1', '编辑普通文章：产品名称一', '127.0.0.1', '/index.php/admin/Article/edit.html', '1529568509');
INSERT INTO `ey_admin_log` VALUES ('636', '1', '编辑普通文章：产品名称二', '127.0.0.1', '/index.php/admin/Article/edit.html', '1529568526');
INSERT INTO `ey_admin_log` VALUES ('637', '1', '编辑普通文章：产品名称三', '127.0.0.1', '/index.php/admin/Article/edit.html', '1529568542');
INSERT INTO `ey_admin_log` VALUES ('638', '1', '编辑普通文章：产品名称四', '127.0.0.1', '/index.php/admin/Article/edit.html', '1529568561');
INSERT INTO `ey_admin_log` VALUES ('639', '1', '编辑普通文章：产品名称五', '127.0.0.1', '/index.php/admin/Article/edit.html', '1529568578');
INSERT INTO `ey_admin_log` VALUES ('640', '1', '编辑普通文章：产品名称六', '127.0.0.1', '/index.php/admin/Article/edit.html', '1529568607');
INSERT INTO `ey_admin_log` VALUES ('641', '1', '编辑普通文章：产品名称七', '127.0.0.1', '/index.php/admin/Article/edit.html', '1529568626');
INSERT INTO `ey_admin_log` VALUES ('642', '1', '编辑普通文章：产品名称八', '127.0.0.1', '/index.php/admin/Article/edit.html', '1529568641');
INSERT INTO `ey_admin_log` VALUES ('643', '1', '后台登录', '127.0.0.1', '/index.php/admin/Admin/login.html', '1529574970');
INSERT INTO `ey_admin_log` VALUES ('644', '1', '编辑普通文章：产品名称一', '127.0.0.1', '/index.php/admin/Article/edit.html', '1529575797');
INSERT INTO `ey_admin_log` VALUES ('645', '1', '编辑普通文章：产品名称二', '127.0.0.1', '/index.php/admin/Article/edit.html', '1529575834');
INSERT INTO `ey_admin_log` VALUES ('646', '1', '编辑普通文章：产品名称三', '127.0.0.1', '/index.php/admin/Article/edit.html', '1529575853');
INSERT INTO `ey_admin_log` VALUES ('647', '1', '编辑普通文章：产品名称四', '127.0.0.1', '/index.php/admin/Article/edit.html', '1529575871');
INSERT INTO `ey_admin_log` VALUES ('648', '1', '编辑普通文章：产品名称五', '127.0.0.1', '/index.php/admin/Article/edit.html', '1529575890');
INSERT INTO `ey_admin_log` VALUES ('649', '1', '编辑普通文章：产品名称六', '127.0.0.1', '/index.php/admin/Article/edit.html', '1529575909');
INSERT INTO `ey_admin_log` VALUES ('650', '1', '编辑普通文章：产品名称七', '127.0.0.1', '/index.php/admin/Article/edit.html', '1529575930');
INSERT INTO `ey_admin_log` VALUES ('651', '1', '编辑普通文章：产品名称八', '127.0.0.1', '/index.php/admin/Article/edit.html', '1529575948');
INSERT INTO `ey_admin_log` VALUES ('652', '1', '删除留言-id：55', '127.0.0.1', '/index.php/admin/Guestbook/del.html', '1529651962');
INSERT INTO `ey_admin_log` VALUES ('653', '1', '新增广告位：PC端栏目页banner图', '127.0.0.1', '/index.php/admin/AdPosition/add.html', '1529654318');
INSERT INTO `ey_admin_log` VALUES ('654', '1', '新增广告：栏目幻灯一', '127.0.0.1', '/index.php/admin/Ad/add.html', '1529654359');
INSERT INTO `ey_admin_log` VALUES ('655', '1', '新增广告：栏目幻灯二', '127.0.0.1', '/index.php/admin/Ad/add.html', '1529654379');
INSERT INTO `ey_admin_log` VALUES ('656', '1', '后台登录', '127.0.0.1', '/index.php/admin/Admin/login.html', '1529656008');
INSERT INTO `ey_admin_log` VALUES ('657', '1', '删除广告-id：13', '127.0.0.1', '/index.php/admin/Ad/del.html', '1529656182');
INSERT INTO `ey_admin_log` VALUES ('658', '1', '编辑广告', '127.0.0.1', '/index.php/admin/Ad/edit.html', '1529656215');
INSERT INTO `ey_admin_log` VALUES ('659', '1', '编辑栏目：关于我们', '127.0.0.1', '/index.php/admin/Arctype/edit.html', '1529656385');
INSERT INTO `ey_admin_log` VALUES ('660', '1', '删除普通文章-id：76', '127.0.0.1', '/index.php/admin/Article/del.html', '1529656435');
INSERT INTO `ey_admin_log` VALUES ('661', '1', '编辑普通文章：产品名称一', '127.0.0.1', '/index.php/admin/Article/edit.html', '1529656459');
INSERT INTO `ey_admin_log` VALUES ('662', '1', '编辑普通文章：产品名称二', '127.0.0.1', '/index.php/admin/Article/edit.html', '1529656485');
INSERT INTO `ey_admin_log` VALUES ('663', '1', '编辑普通文章：产品名称三', '127.0.0.1', '/index.php/admin/Article/edit.html', '1529656507');
INSERT INTO `ey_admin_log` VALUES ('664', '1', '编辑普通文章：产品名称四', '127.0.0.1', '/index.php/admin/Article/edit.html', '1529656526');
INSERT INTO `ey_admin_log` VALUES ('665', '1', '编辑普通文章：产品名称五', '127.0.0.1', '/index.php/admin/Article/edit.html', '1529656543');
INSERT INTO `ey_admin_log` VALUES ('666', '1', '编辑普通文章：产品名称六', '127.0.0.1', '/index.php/admin/Article/edit.html', '1529656562');
INSERT INTO `ey_admin_log` VALUES ('667', '1', '编辑普通文章：产品名称七', '127.0.0.1', '/index.php/admin/Article/edit.html', '1529656580');
INSERT INTO `ey_admin_log` VALUES ('668', '1', '编辑栏目：服务流程', '127.0.0.1', '/index.php/admin/Arctype/edit.html', '1529657909');
INSERT INTO `ey_admin_log` VALUES ('669', '1', '新增栏目：电话咨询', '127.0.0.1', '/index.php/admin/Arctype/add.html', '1529657923');
INSERT INTO `ey_admin_log` VALUES ('670', '1', '删除栏目：电话咨询', '127.0.0.1', '/index.php/admin/Arctype/del.html', '1529657934');
INSERT INTO `ey_admin_log` VALUES ('671', '1', '新增栏目：电话咨询', '127.0.0.1', '/index.php/admin/Arctype/add.html', '1529657951');
INSERT INTO `ey_admin_log` VALUES ('672', '1', '新增栏目：现场勘测', '127.0.0.1', '/index.php/admin/Arctype/add.html', '1529657969');
INSERT INTO `ey_admin_log` VALUES ('673', '1', '新增栏目：问题诊断、检测', '127.0.0.1', '/index.php/admin/Arctype/add.html', '1529657985');
INSERT INTO `ey_admin_log` VALUES ('674', '1', '新增栏目：解决方案', '127.0.0.1', '/index.php/admin/Arctype/add.html', '1529658001');
INSERT INTO `ey_admin_log` VALUES ('675', '1', '新增栏目：现场调试、供货', '127.0.0.1', '/index.php/admin/Arctype/add.html', '1529658016');
INSERT INTO `ey_admin_log` VALUES ('676', '1', '新增栏目：完成', '127.0.0.1', '/index.php/admin/Arctype/add.html', '1529658030');
INSERT INTO `ey_admin_log` VALUES ('677', '1', '编辑栏目：联系我们', '127.0.0.1', '/index.php/admin/Arctype/edit.html', '1529659578');
INSERT INTO `ey_admin_log` VALUES ('678', '1', '删除留言-id：56', '127.0.0.1', '/index.php/admin/Guestbook/del.html', '1529661112');
INSERT INTO `ey_admin_log` VALUES ('679', '1', '后台登录', '127.0.0.1', '/index.php/admin/Admin/login.html', '1529715886');
INSERT INTO `ey_admin_log` VALUES ('680', '1', '编辑栏目：关于我们', '127.0.0.1', '/index.php/admin/Arctype/edit.html', '1529717867');
INSERT INTO `ey_admin_log` VALUES ('681', '1', '删除留言-id：57', '127.0.0.1', '/index.php/admin/Guestbook/del.html', '1529721301');
INSERT INTO `ey_admin_log` VALUES ('682', '1', '编辑普通文章：产品名称一', '127.0.0.1', '/index.php/admin/Article/edit.html', '1529721699');
INSERT INTO `ey_admin_log` VALUES ('683', '1', '编辑普通文章：产品名称二', '127.0.0.1', '/index.php/admin/Article/edit.html', '1529721719');
INSERT INTO `ey_admin_log` VALUES ('684', '1', '编辑普通文章：产品名称三', '127.0.0.1', '/index.php/admin/Article/edit.html', '1529721736');
INSERT INTO `ey_admin_log` VALUES ('685', '1', '编辑普通文章：产品名称四', '127.0.0.1', '/index.php/admin/Article/edit.html', '1529721757');
INSERT INTO `ey_admin_log` VALUES ('686', '1', '编辑普通文章：产品名称五', '127.0.0.1', '/index.php/admin/Article/edit.html', '1529721776');
INSERT INTO `ey_admin_log` VALUES ('687', '1', '编辑普通文章：产品名称六', '127.0.0.1', '/index.php/admin/Article/edit.html', '1529721795');
INSERT INTO `ey_admin_log` VALUES ('688', '1', '编辑普通文章：产品名称七', '127.0.0.1', '/index.php/admin/Article/edit.html', '1529721822');
INSERT INTO `ey_admin_log` VALUES ('689', '1', '删除栏目：服务流程', '127.0.0.1', '/index.php/admin/Arctype/del.html', '1529723335');
INSERT INTO `ey_admin_log` VALUES ('690', '1', '新增栏目：技术支持', '127.0.0.1', '/index.php/admin/Arctype/add.html', '1529723379');
INSERT INTO `ey_admin_log` VALUES ('691', '1', '编辑栏目：技术支持', '127.0.0.1', '/index.php/admin/Arctype/edit.html', '1529723391');
INSERT INTO `ey_admin_log` VALUES ('692', '1', '后台登录', '127.0.0.1', '/index.php/admin/Admin/login.html', '1529735999');
INSERT INTO `ey_admin_log` VALUES ('693', '1', '编辑广告位：手机端首页头部幻灯', '127.0.0.1', '/index.php/admin/AdPosition/edit.html', '1529736161');
INSERT INTO `ey_admin_log` VALUES ('694', '1', '编辑广告位：PC端首页头部-大幻灯片', '127.0.0.1', '/index.php/admin/AdPosition/edit.html', '1529736178');
INSERT INTO `ey_admin_log` VALUES ('695', '1', '编辑广告位：PC端首页头部-大幻灯片', '127.0.0.1', '/index.php/admin/AdPosition/edit.html', '1529736190');
INSERT INTO `ey_admin_log` VALUES ('696', '1', '删除广告-id：12', '127.0.0.1', '/index.php/admin/Ad/del.html', '1529736200');
INSERT INTO `ey_admin_log` VALUES ('697', '1', '删除广告位-id：10', '127.0.0.1', '/index.php/admin/AdPosition/del.html', '1529736206');
INSERT INTO `ey_admin_log` VALUES ('698', '1', '编辑普通文章：产品名称一', '127.0.0.1', '/index.php/admin/Article/edit.html', '1529736329');
INSERT INTO `ey_admin_log` VALUES ('699', '1', '编辑普通文章：产品名称二', '127.0.0.1', '/index.php/admin/Article/edit.html', '1529736345');
INSERT INTO `ey_admin_log` VALUES ('700', '1', '编辑普通文章：产品名称三', '127.0.0.1', '/index.php/admin/Article/edit.html', '1529736470');
INSERT INTO `ey_admin_log` VALUES ('701', '1', '编辑普通文章：产品名称四', '127.0.0.1', '/index.php/admin/Article/edit.html', '1529736487');
INSERT INTO `ey_admin_log` VALUES ('702', '1', '编辑普通文章：产品名称五', '127.0.0.1', '/index.php/admin/Article/edit.html', '1529736506');
INSERT INTO `ey_admin_log` VALUES ('703', '1', '编辑普通文章：产品名称六', '127.0.0.1', '/index.php/admin/Article/edit.html', '1529736527');
INSERT INTO `ey_admin_log` VALUES ('704', '1', '编辑普通文章：产品名称七', '127.0.0.1', '/index.php/admin/Article/edit.html', '1529736548');
INSERT INTO `ey_admin_log` VALUES ('705', '1', '新增普通文章：产品名称八', '127.0.0.1', '/index.php/admin/Article/add.html', '1529736576');
INSERT INTO `ey_admin_log` VALUES ('706', '1', '编辑栏目：业务范围', '127.0.0.1', '/index.php/admin/Arctype/edit.html', '1529737571');
INSERT INTO `ey_admin_log` VALUES ('707', '1', '新增栏目：商业演出', '127.0.0.1', '/index.php/admin/Arctype/add.html', '1529737724');
INSERT INTO `ey_admin_log` VALUES ('708', '1', '新增栏目：舞台搭建  ', '127.0.0.1', '/index.php/admin/Arctype/add.html', '1529737763');
INSERT INTO `ey_admin_log` VALUES ('709', '1', '删除栏目：舞台搭建  ', '127.0.0.1', '/index.php/admin/Arctype/del.html', '1529737775');
INSERT INTO `ey_admin_log` VALUES ('710', '1', '新增栏目：舞台搭建  ', '127.0.0.1', '/index.php/admin/Arctype/add.html', '1529737883');
INSERT INTO `ey_admin_log` VALUES ('711', '1', '新增栏目：视频录制  ', '127.0.0.1', '/index.php/admin/Arctype/add.html', '1529738011');
INSERT INTO `ey_admin_log` VALUES ('712', '1', '新增栏目：灯光音响工程  ', '127.0.0.1', '/index.php/admin/Arctype/add.html', '1529738046');
INSERT INTO `ey_admin_log` VALUES ('713', '1', '新增栏目：设备播放 ', '127.0.0.1', '/index.php/admin/Arctype/add.html', '1529738094');
INSERT INTO `ey_admin_log` VALUES ('714', '1', '删除留言-id：58', '127.0.0.1', '/index.php/admin/Guestbook/del.html', '1529740674');
INSERT INTO `ey_admin_log` VALUES ('715', '1', '编辑栏目：商业演出', '127.0.0.1', '/index.php/admin/Arctype/edit.html', '1529740907');
INSERT INTO `ey_admin_log` VALUES ('716', '1', '编辑栏目：舞台搭建  ', '127.0.0.1', '/index.php/admin/Arctype/edit.html', '1529741061');
INSERT INTO `ey_admin_log` VALUES ('717', '1', '编辑栏目：视频录制  ', '127.0.0.1', '/index.php/admin/Arctype/edit.html', '1529741205');
INSERT INTO `ey_admin_log` VALUES ('718', '1', '编辑栏目：灯光音响工程  ', '127.0.0.1', '/index.php/admin/Arctype/edit.html', '1529741413');
INSERT INTO `ey_admin_log` VALUES ('719', '1', '编辑栏目：设备播放 ', '127.0.0.1', '/index.php/admin/Arctype/edit.html', '1529741529');
INSERT INTO `ey_admin_log` VALUES ('720', '1', '后台登录', '127.0.0.1', '/index.php/admin/Admin/login.html', '1531793338');
INSERT INTO `ey_admin_log` VALUES ('721', '1', '后台登录', '127.0.0.1', '/index.php/admin/Admin/login.html', '1531793718');
INSERT INTO `ey_admin_log` VALUES ('722', '1', '删除自定义变量：web_attr_58', '127.0.0.1', '/index.php', '1531793903');
INSERT INTO `ey_admin_log` VALUES ('723', '1', '后台登录', '127.0.0.1', '/index.php/admin/Admin/login.html', '1535613260');

-- -----------------------------
-- Table structure for `ey_archives`
-- -----------------------------
DROP TABLE IF EXISTS `ey_archives`;
CREATE TABLE `ey_archives` (
  `aid` int(10) NOT NULL AUTO_INCREMENT,
  `typeid` int(10) NOT NULL DEFAULT '0' COMMENT '当前栏目',
  `channel` int(10) NOT NULL DEFAULT '0' COMMENT '模型ID',
  `is_b` tinyint(1) DEFAULT '0' COMMENT '加粗',
  `title` varchar(200) DEFAULT '' COMMENT '标题',
  `litpic` varchar(250) DEFAULT '' COMMENT '封面图',
  `is_head` tinyint(1) DEFAULT '0' COMMENT 'ͷ����0=��1=�ǣ�',
  `is_special` tinyint(1) DEFAULT '0' COMMENT '�ؼ���0=��1=�ǣ�',
  `is_top` tinyint(1) DEFAULT '0' COMMENT '置顶（0=否，1=是）',
  `is_recom` tinyint(1) DEFAULT '0' COMMENT '推荐（0=否，1=是）',
  `is_jump` tinyint(1) DEFAULT '0' COMMENT '跳转链接（0=否，1=是）',
  `author` varchar(200) DEFAULT '' COMMENT '编辑者',
  `click` int(10) DEFAULT '0' COMMENT '浏览量',
  `arcrank` tinyint(1) DEFAULT '0' COMMENT '阅读权限：0=开放浏览，-1=待审核稿件',
  `jumplinks` varchar(200) DEFAULT '' COMMENT '外链跳转',
  `ismake` tinyint(1) DEFAULT '0' COMMENT '是否静态页面（0=动态，1=静态）',
  `seo_title` varchar(200) DEFAULT '' COMMENT 'SEO标题',
  `seo_keywords` varchar(200) DEFAULT '' COMMENT 'SEO关键词',
  `seo_description` text COMMENT 'SEO描述',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态(0=屏蔽，1=正常)',
  `sort_order` int(10) DEFAULT '0' COMMENT '排序号',
  `add_time` int(11) DEFAULT '0' COMMENT '新增时间',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`aid`),
  KEY `aid` (`typeid`,`channel`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=107 DEFAULT CHARSET=utf8 COMMENT='资讯表';

-- -----------------------------
-- Records of `ey_archives`
-- -----------------------------
INSERT INTO `ey_archives` VALUES ('1', '1', '6', '0', '关于我们', '', '0', '0', '0', '0', '0', '', '0', '0', '', '0', '', '', '', '1', '100', '1526539465', '1529717867');
INSERT INTO `ey_archives` VALUES ('38', '38', '1', '0', '荣誉证书一', '/public/upload/news/2018/06/11/6a7f9afdfc6733401cdd4f36037e03f9.jpg', '0', '0', '0', '0', '0', '', '113', '0', '', '0', '', '', '', '1', '100', '1527664149', '1528686741');
INSERT INTO `ey_archives` VALUES ('56', '36', '1', '0', '案例展示六', '/public/upload/news/2018/06/11/9cee02be477928d80fff0bfa9a318475.jpg', '0', '0', '0', '0', '0', '', '150', '0', '', '0', '', '', '公司认为客户、供应商、公司股东、公司员工等一切和自身有合作关系的单位和个人都是自己的合作伙伴，并只有通过努力为合作伙伴创造价值，才能体现自身的价值并获得发展和成功。关于“诚实、宽容、创新、服务”公司认为诚信是一切合作的基础，宽容是解决问题的前提，创新是发展事业的利器，服务是创造价值的根本。公司会坚持持续改进、满足顾客期望、确保品质第一、开拓全球市场。', '1', '100', '1527665172', '1529562801');
INSERT INTO `ey_archives` VALUES ('53', '36', '1', '0', '案例展示三', '/public/upload/news/2018/06/11/bc24218aa9fd2fb6621f43686f73954b.jpg', '0', '0', '0', '0', '0', '', '196', '0', '', '0', '', '', '公司认为客户、供应商、公司股东、公司员工等一切和自身有合作关系的单位和个人都是自己的合作伙伴，并只有通过努力为合作伙伴创造价值，才能体现自身的价值并获得发展和成功。关于“诚实、宽容、创新、服务”公司认为诚信是一切合作的基础，宽容是解决问题的前提，创新是发展事业的利器，服务是创造价值的根本。公司会坚持持续改进、满足顾客期望、确保品质第一、开拓全球市场。', '1', '100', '1527665090', '1529562760');
INSERT INTO `ey_archives` VALUES ('54', '36', '1', '0', '案例展示四', '/public/upload/news/2018/06/11/573e5fd14507abfb1a25d59c84689baa.jpg', '0', '0', '0', '0', '0', '', '101', '0', '', '0', '', '', '公司认为客户、供应商、公司股东、公司员工等一切和自身有合作关系的单位和个人都是自己的合作伙伴，并只有通过努力为合作伙伴创造价值，才能体现自身的价值并获得发展和成功。关于“诚实、宽容、创新、服务”公司认为诚信是一切合作的基础，宽容是解决问题的前提，创新是发展事业的利器，服务是创造价值的根本。公司会坚持持续改进、满足顾客期望、确保品质第一、开拓全球市场。', '1', '100', '1527665111', '1529562775');
INSERT INTO `ey_archives` VALUES ('55', '36', '1', '0', '案例展示五', '/public/upload/news/2018/06/11/71acf5e17086486311d36b5a924520f8.jpg', '0', '0', '0', '0', '0', '', '184', '0', '', '0', '', '', '公司认为客户、供应商、公司股东、公司员工等一切和自身有合作关系的单位和个人都是自己的合作伙伴，并只有通过努力为合作伙伴创造价值，才能体现自身的价值并获得发展和成功。关于“诚实、宽容、创新、服务”公司认为诚信是一切合作的基础，宽容是解决问题的前提，创新是发展事业的利器，服务是创造价值的根本。公司会坚持持续改进、满足顾客期望、确保品质第一、开拓全球市场。', '1', '100', '1527665145', '1529562787');
INSERT INTO `ey_archives` VALUES ('51', '36', '1', '0', '案例展示一', '/public/upload/news/2018/06/11/8682aa5d528aaee53557d2b7aa0ed549.jpg', '0', '0', '0', '0', '0', '', '136', '0', '', '0', '', '', '公司认为客户、供应商、公司股东、公司员工等一切和自身有合作关系的单位和个人都是自己的合作伙伴，并只有通过努力为合作伙伴创造价值，才能体现自身的价值并获得发展和成功。关于“诚实、宽容、创新、服务”公司认为诚信是一切合作的基础，宽容是解决问题的前提，创新是发展事业的利器，服务是创造价值的根本。公司会坚持持续改进、满足顾客期望、确保品质第一、开拓全球市场。', '1', '100', '1527665029', '1529562733');
INSERT INTO `ey_archives` VALUES ('52', '36', '1', '0', '案例展示二', '/public/upload/news/2018/06/11/93778c15a0a494b17bb30ca3f3562d55.jpg', '0', '0', '0', '0', '0', '', '258', '0', '', '0', '', '', '公司认为客户、供应商、公司股东、公司员工等一切和自身有合作关系的单位和个人都是自己的合作伙伴，并只有通过努力为合作伙伴创造价值，才能体现自身的价值并获得发展和成功。关于“诚实、宽容、创新、服务”公司认为诚信是一切合作的基础，宽容是解决问题的前提，创新是发展事业的利器，服务是创造价值的根本。公司会坚持持续改进、满足顾客期望、确保品质第一、开拓全球市场。', '1', '100', '1527665066', '1529562748');
INSERT INTO `ey_archives` VALUES ('8', '15', '6', '0', '联系我们', '', '0', '0', '0', '0', '0', '', '0', '0', '', '0', '', '', '', '1', '100', '1526551000', '1529659578');
INSERT INTO `ey_archives` VALUES ('39', '38', '1', '0', '荣誉证书二', '/public/upload/news/2018/06/11/54ed9c9d5ba8163f6a460fc4c4b3e605.jpg', '0', '0', '0', '0', '0', '', '208', '0', '', '0', '', '', '', '1', '100', '1527664280', '1528686760');
INSERT INTO `ey_archives` VALUES ('71', '46', '1', '0', '美业信息化规模将现，门庭管店为他们提供了一套SaaS管理软件', '/public/upload/news/2018/06/11/7dea0a87cc486b73b6406a5699fe13fe.jpg', '0', '0', '0', '0', '0', '', '258', '0', '', '0', '', '', '数据显示，2015年，我国服务业同比增长8.3%，分别高于国内生产总值和第二产业增加值增速1.4和2.3个百分点，占国内生产总值的比重达到50.5%，首次过半，而与发达国家相比，我国服务业仍有20%-30%的发展空间。美业属于实体服务业，整个市场有上千亿的规模，但是信息化程度和零售餐饮业相比着实比较低。其中的原因就是餐饮和零售客流量大，触达人群广，而美业客流量相对小，加上从业人员素质导致信息化程度低、管理效率低。美业现在的主要管理方式是纸质账本和简单的收银、结算软件，纸质管理约占行业客户的90%，功能简单只能用于管理会员卡的单机版管理软件约占9%。美业的客户与店面的粘性比较高，虽然是低频次消费，但是一旦用户选择一家店，在接收到较好服务之后很难再转向其它店，因此美业在预约管理、客户管理等需求上要高于餐饮和零售，应用的软件形态并不一定以结算收银为主，重点是CRM系统、收银、绩效考核、预约为一体的管理软件。36氪近日了解的门庭管店是一款美业SaaS产品，主要功能有 SCRM会员管理、智能预约、绩效工资、营销卡券、全能收银等。门庭管店产品在客户方是微信公众号和小程序；美容师端是用于客', '1', '100', '1527899934', '1528687227');
INSERT INTO `ey_archives` VALUES ('44', '39', '1', '0', '产品名称三', '/public/upload/news/2018/06/23/146dee08e8fc7237a27e0095a05cb7ed.jpg', '0', '0', '0', '0', '0', '', '184', '0', '', '0', '', '', '为客户降低采购成本和风险，为客户投资提供切实保障。追求永续发展的目标，并把它建立在客户满意的基础上。', '1', '100', '1527664498', '1529736469');
INSERT INTO `ey_archives` VALUES ('41', '38', '1', '0', '荣誉证书四', '/public/upload/news/2018/06/11/ca6063b0afd76aa7e3720daeda356aa6.jpg', '0', '0', '0', '0', '0', '', '122', '0', '', '0', '', '', '', '1', '100', '1527664331', '1528686800');
INSERT INTO `ey_archives` VALUES ('42', '39', '1', '0', '产品名称一', '/public/upload/news/2018/06/23/4f2515aac418e45eb210f85d286229f4.jpg', '0', '0', '0', '0', '0', '', '247', '0', '', '0', '', '', '为客户降低采购成本和风险，为客户投资提供切实保障。追求永续发展的目标，并把它建立在客户满意的基础上。', '1', '100', '1527664373', '1529736328');
INSERT INTO `ey_archives` VALUES ('43', '39', '1', '0', '产品名称二', '/public/upload/news/2018/06/23/ce32928af19f78afd1d29c1d5dd501e0.jpg', '0', '0', '0', '0', '0', '', '167', '0', '', '0', '', '', '为客户降低采购成本和风险，为客户投资提供切实保障。追求永续发展的目标，并把它建立在客户满意的基础上。', '1', '100', '1527664459', '1529736344');
INSERT INTO `ey_archives` VALUES ('40', '38', '1', '0', '荣誉证书三', '/public/upload/news/2018/06/11/dd02bbaa37c73a84f76be7cce9d56c07.jpg', '0', '0', '0', '0', '0', '', '225', '0', '', '0', '', '', '', '1', '100', '1527664307', '1528686781');
INSERT INTO `ey_archives` VALUES ('45', '39', '1', '0', '产品名称四', '/public/upload/news/2018/06/23/3650fe5523d8bb9b639bfb625eb0497c.jpg', '0', '0', '0', '0', '0', 'admin', '296', '0', '', '0', '', '', '为客户降低采购成本和风险，为客户投资提供切实保障。追求永续发展的目标，并把它建立在客户满意的基础上。', '1', '100', '1527664551', '1529736486');
INSERT INTO `ey_archives` VALUES ('70', '46', '1', '0', '点击在线求助，应答的却都是机器人，这样真的好吗？', '/public/upload/news/2018/06/11/8e8b8b59ed19686fdd835fc026e8417a.jpg', '1', '0', '0', '0', '0', '', '110', '0', '', '0', '', '', '编者按：人工智能技术的发展正在不断地改变着人们的生活与工作方式，它在一定程度上推动了社会的发展与进步，这一点是毋庸置疑的。但人工智能并不是万能的，因为机器并不具备人类的思维与情绪。当你打开网站上的在线求助窗口，却发现回答你的只是冷冰冰的机器人的时候，恐怕应该会很失望吧。2016年4月，马克·扎克伯格在Facebook的F8会议上为Messenger上的开发者们描述了一个光明的未来，并宣布将进入“像和朋友一样与机器人聊天”的新时代。世界各地的开发人员，这些开发人员都拥有Facebook、Google和Microsoft等大公司的认证，都声称独立移动应用程序的时代结束了，并一起庆祝新的方式的到来——对话商务（ConversationalCommerce）和聊天机器人（Chatbots）。11个月前，Facebook宣布其官方开发的聊天机器人“M”的beta测试中AI失败率为70％，随后便更新了其平台，并建议开发人员在Messenger中开发更轻量级的应用程序，同时禁用会话输入。关于Wordhop.io，一直以来我们都知道两件事。第一件事就是，AI真的很难，要实现让机器人100％像朋友一样与', '1', '100', '1527899912', '1528941313');
INSERT INTO `ey_archives` VALUES ('69', '47', '1', '0', '传滴滴即将接入ofo，共享单车大战格局或生变', '/public/upload/news/2018/06/11/f5ad299f04a6170983618631ba16d808.jpg', '0', '0', '0', '0', '0', '', '123', '0', '', '0', '', '', '36氪从ofo内部获得消息，可能在今年4月份，ofo将会接入到滴滴出行的App上，届时用户可以直接在滴滴上面使用ofo的服务。“这件事最近被频繁地提上日程，内部消息是下个月就有可能接入。”一名ofo内部员工说。36氪向滴滴官方、ofo官方求证了此消息，但截止发稿时，两家公司均未对此确认或否认。ofo创始人戴威曾在去年12月表示，何时接入滴滴APP，没有明确的时间表。“ofo的模式是没有GPS的，用户看到车就用，整个逻辑跟滴滴平台打车的逻辑不太一样，但近期我们会跟滴滴联合推出一些东西。”不过类似的接入并非没有先例。今年2月，微信联合摩拜单车宣布，用户通过微信“扫一扫”扫描摩拜单车车身上的二维码，就可直接进入摩拜单车微信小程序，点击开锁即可用车。这并不是第一次传出ofo会接入滴滴的消息，也不是两个平台的第一次深度绑定。此前，滴滴参与了ofo最近三轮的融资。根据腾讯科技的报道，一位共享单车投资人透露，ofo经过多轮融资以后，滴滴已经成为ofo最大股东，占股超过30%。“这意味着，滴滴在ofo的话语权更强了，同时，ofo的成与败，滴滴将是最大利息相关方。”这也不难理解，滴滴将ofo接入之后，将', '1', '100', '1527899881', '1529113718');
INSERT INTO `ey_archives` VALUES ('68', '47', '1', '0', '借网生大势赚了两年快钱后，考拉娱乐开始切入女性人群做点“慢”内容', '/public/upload/news/2018/06/11/8f62bf5b238aa11e6f2232286f585d5d.jpg', '0', '0', '0', '1', '0', '', '209', '0', '', '0', '', '', '从2014年起，网络大电影这个词逐渐进入人们的眼球，当时满地都是几十万制作成本博得百万票房的故事，考拉娱乐便是在那个网生内容的蛮荒时代入的局。在接受36氪采访时，考拉娱乐创始人钱伟坦言借过去的势他们赚到了不少钱，“我们有个片子8万成本，最后回收了一百多万的票房。”在过去的两年间，他们平均一年能做20多部大电影，在各大视频网站上收益排名Top10中，你很容易就能发现考拉出品的好几部片子，也给他们积累了很多渠道资源。但当时间跨入今年后，网络大电影市场开始洗牌，去年整个市场上600多部片子突然激增到2000部以上，四两拨千斤的时代已经过去了，你会发现排名靠前的网大制作成本基本都在百万以上，已经达到了二三线院线水平。近期推出的黄金赌城系列市场红利期过去后，考拉娱乐在今年就开始了他们新的布局：瞄准女性市场，做精品网生内容。“这个其实是之前就规划好的，洗牌是肯定的。”钱伟说今年他们上半年基本没有怎么发片子，都在为今后的“慢”内容做准备。考拉娱乐首先改变的是IP孵化方式，他们组建了一支漫画团队，定位是连载时间在三年以上的长篇大世界观作品，当这些作品经过市场验证后，逐步推出相应的网络剧、大电影等衍生内', '1', '100', '1527899852', '1529113718');
INSERT INTO `ey_archives` VALUES ('66', '47', '1', '0', '腾讯游戏营收比重连续两个季度下降，支付、云计算等业务营收涨348%', '/public/upload/news/2018/06/11/c867ec923686240cdf9213126552a5e5.jpg', '0', '0', '0', '0', '0', '', '233', '0', '', '0', '', '', '腾讯不仅在阿里怂恿大家花钱的双十一之际高调派钱，如今财报的高速增长业务也刚好跟支付宝和阿里云对标。今日晚间，腾讯发布今天公布未经审核的第三季度财报。报告显示，腾讯三季度总收入同比增长52%，增速与上季度持平；净利润增速有所下滑。值得注意的是，腾讯游戏营收比重已经连续两个季度下降，三季度网络游戏收入仅占总营收的45%；而支付和云计算等新兴业务的比重则继续上升，首次超过10%，达到12%。净利润增速下滑总体财务状况方面，腾讯三季度总收入为人民币403.88亿元（60.48亿美元），同比增长52%，增速与上季度持平。但是盈利增速却有所下滑，期内盈利为人民币107.76亿元（16.14亿美元），比去年同期增长42%；净利润率由去年同期的29%降至27%。游戏营收占比连续两个季度下滑分部业务方面，包括网络游戏和社交网络在内的增值业务依然是腾讯收入的大头，占比约八成。然而，一向被视为腾讯摇钱树的游戏业务，其收入占比却连续两季下降，如今占总营收比重仅有45%左右，该项业务在2015年一度占腾讯营收六成。而社交网络收入增速则在逐步增长，占比一直稳定在23-24%。再往细看，手游已经成了游戏业务的主力，', '1', '100', '1527899765', '1529113718');
INSERT INTO `ey_archives` VALUES ('67', '47', '1', '0', '获 3800 万元 A+ 轮投资，乐摇摇科技利用抓娃娃机做线下版的广点通', '/public/upload/news/2018/06/11/da74caedc582e6d19731b8259b4b4a90.jpg', '0', '0', '0', '1', '0', '', '176', '0', '', '0', '', '', '36氪获悉，线下公众号推广公司乐摇摇科技已完成3800万元A+轮融资，投资方为广发信德。众所周知，如今线上流量昂贵，大家的目光开始聚焦线下。除了传统的地铁、电梯广告，线下也已经有一些新的广告模式，比如通过商业Wi-Fi获客，代表公司有迈外迪；比如现在餐饮店外常见的照片打印机，是专门服务公众号的效果广告。乐摇摇科技则选择利用抓娃娃机做流量分发。之所以从抓娃娃机切入，创始人陈耿豪认为主要原因有两点：首先，抓娃娃机国内存量有200万台，包括其在内的所有投币类设备存量约2000万台，这些机器无法进行移动支付，消费者和商家的痛点需要被解决；第二，抓娃娃机多在商场、KTV等地，用户群体是16到35岁女性，广告投放更精准。从广告受众的角度可以看出，乐摇摇比WI-FI获客更精准；而从乐摇摇的业务模式看，他们不像市面上的照片打印机那样自己生产机器，而是和机器生产厂家合作，只提供硬件盒子，因此业务模式更轻。具体看乐摇摇的业务模式，他们免费给机器提供硬件盒子和SaaS系统，由厂家安装好盒子后发货给商家，据统计，实现移动支付后的抓娃娃机能增加28%的收入。用户想抓娃娃时，先用微信扫码，这时有两种模式供选择，第', '1', '100', '1527899807', '1529113718');
INSERT INTO `ey_archives` VALUES ('65', '39', '1', '0', '产品名称六', '/public/upload/news/2018/06/23/3502cd0156ac059810f3e7121e6d4d45.jpg', '0', '0', '0', '0', '0', '', '151', '0', '', '0', '', '', '为客户降低采购成本和风险，为客户投资提供切实保障。追求永续发展的目标，并把它建立在客户满意的基础上。', '1', '100', '1527852009', '1529736525');
INSERT INTO `ey_archives` VALUES ('75', '39', '1', '0', '产品名称七', '/public/upload/news/2018/06/23/8fec7c3d860b8f91f27212d915becb30.jpg', '0', '0', '0', '0', '0', '', '247', '0', '', '0', '', '', '为客户降低采购成本和风险，为客户投资提供切实保障。追求永续发展的目标，并把它建立在客户满意的基础上。', '1', '100', '1528187966', '1529736547');
INSERT INTO `ey_archives` VALUES ('64', '39', '1', '0', '产品名称五', '/public/upload/news/2018/06/23/36e12210fb7ff5abab24e0da40f5d097.jpg', '0', '0', '0', '0', '0', '', '155', '0', '', '0', '', '', '为客户降低采购成本和风险，为客户投资提供切实保障。追求永续发展的目标，并把它建立在客户满意的基础上。', '1', '100', '1527851982', '1529736505');
INSERT INTO `ey_archives` VALUES ('74', '46', '1', '0', '旅游市场将迎来内容红利？河马旅居想做旅游界的“小红书”', '/public/upload/news/2018/06/11/b35688c9666a3ad6ee733e2b63224727.jpg', '0', '0', '0', '0', '0', '', '200', '0', '', '0', '', '', '“内容为王”这句话在哪个时代都不会过时。随着消费升级，日益庞大的中国高端群体对高品质的生活方式与旅行体验的需求为高端出境旅游市场带来巨大市场机遇。现今的旅游产品也更向个性化、定制化、品质化靠拢，对内容创新提出更高的要求。内地的旅游内容市场仍有5-10倍的增长空间。最近36氪接触了一家做移动端旅游社区电商的团队——河马旅居指南。河马旅居定位中等收入人群18-34岁的年轻群体，想通过碎片化的PGC或UGC内容培养用户粘性，由内容社区模式切入出境游市场。传统的旅游内容多是以长图文的游记形式呈现，河马旅居并不刻意强调旅游路线或整个游历过程的感受，在内容呈现上更加碎片化、个性化、移动化以及品质化，以小众或特色地点作为维度输出内容，建立内容社区，类似于旅游界的“小红书”或“什么值得买”。河马旅居在部分海外旅游城市有一个4到5人的自媒体小团队定期生产PGC内容，每月更新一次内容，以优质的内容导流。目前河马的获客成本低至2-3元/人。优质的内容利于培养高粘性度的用户，当累计到一定数量的优质内容生产者，达到一定的用户规模时，将由PGC内容带动UGC内容的自发产出，进而开始搭建旅游内容社区，最后完成向旅游', '1', '100', '1527900027', '1528687267');
INSERT INTO `ey_archives` VALUES ('73', '46', '1', '0', '无人便利店风口正当时，“便利家”获联创永宣冯涛数百万元天使投资', '/public/upload/news/2018/06/11/579143274445b8f597e24409ffa6b9c9.jpg', '0', '0', '0', '0', '0', '', '268', '0', '', '0', '', '', '36氪获悉，无人便利店“便利家”已获得数百万人民币天使轮投资，资方为联创永宣冯涛。无人便利店风口正当时，缤果盒子、F5未来商店、深兰科技、EasyGo等一众玩家云集，亚马逊、罗森、阿里巴巴、沃尔玛等巨头亦纷纷试水。 “便利家”创立于2017年3月，位于上海。便利家有微型无人便利店和中型无人便利店两款产品，和一众玩家相比，便利家的差异化在于：灵活。 便利家的“微型无人便利店”，最小单位占地面积不到1平方米（0.68平方米），投放地点更加灵活，包括地铁站、写字楼、高校等，一个最小单位便利店的成本约为1.3万元（批量化生产后可能更低）。最小单位的无人便利店，可以根据人流量的分布，“拼”起来更大单位面积的便利店。低于100人，可放置一个；100人左右，可以拼两个；大于500人，可以拼四个。便利家的“中型无人便利店”，是由6个微型便利店拼起来的，同时在空间里增设桌椅，为消费者提供休憩区间，可放置在地理位置相对开阔的小区、公园等。技术上，便利家在每一层货架中设置了RFID，并在各个角落缝隙做了密封屏蔽，让识别率更高。流程很简单，用支付宝扫码开门，拿完即走，支付宝自动扣款（微信正', '1', '100', '1527899992', '1528687258');
INSERT INTO `ey_archives` VALUES ('72', '46', '1', '0', '腾讯500万美元领投AI创企ObEN，进一步布局社交AI', '/public/upload/news/2018/06/11/6e66c76069ead2ca283b8423de5c87c2.jpg', '1', '0', '0', '0', '0', '', '259', '0', '', '0', '', '', '除了做基础技术的研究外，腾讯曾表示要通过业务驱动来推动各种应用场景的人工智能化。结合腾讯的主营业务，也不难猜到未来公司要在游戏、社交、内容和平台工具型四大应用方向发力。尤其是在社交领域，去年扎克伯格曾表示要推出VR版的Facebook，并展示了虚拟人物形象工具OculusAvatars；今年7月，Facebook表示FacebookAR工作室将与美图合作，向其提供三款AR相机特效。如今，腾讯也要有所行动了。7月18日晚间，人工智能初创公司ObEN宣布获得500万美元战略投资。该轮融资由腾讯领投，CMC董事长黎瑞刚及峰尚资本跟投。投融资信息平台crunchbase的数据显示，目前ObEN共完成四轮融资，总金额达到1370万美元。此前的投资人还包括S如山资本、软银韩国风险投资公司和HTCVIVEX等。公开资料介绍，ObEN创办于2014年，可以通过构建个性化的虚拟声音、形象和个性来创造用户的人工智能虚拟形象，并帮助用户在新兴的数字世界中存储、管理、运营他们的虚拟形象。也就是说，ObEN可以利用人工智能工具，根据用户的照片和声音创建虚拟形象，从而让用户有不同的AR、VR社交体验。以前ObEN', '1', '100', '1527899964', '1528941304');
INSERT INTO `ey_archives` VALUES ('90', '36', '1', '0', '案例展示七', '/public/upload/news/2018/06/11/672f6530e41a8d8b9b3fd4367b78b91d.jpg', '0', '0', '0', '0', '0', '', '293', '0', '', '0', '', '', '公司认为客户、供应商、公司股东、公司员工等一切和自身有合作关系的单位和个人都是自己的合作伙伴，并只有通过努力为合作伙伴创造价值，才能体现自身的价值并获得发展和成功。关于“诚实、宽容、创新、服务”公司认为诚信是一切合作的基础，宽容是解决问题的前提，创新是发展事业的利器，服务是创造价值的根本。公司会坚持持续改进、满足顾客期望、确保品质第一、开拓全球市场。', '1', '100', '1528296618', '1529562812');
INSERT INTO `ey_archives` VALUES ('91', '36', '1', '0', '案例展示八', '/public/upload/news/2018/06/11/2e22291148fca8aa86b3690970ecdf6c.jpg', '0', '0', '0', '0', '0', '', '137', '0', '', '0', '', '', '公司认为客户、供应商、公司股东、公司员工等一切和自身有合作关系的单位和个人都是自己的合作伙伴，并只有通过努力为合作伙伴创造价值，才能体现自身的价值并获得发展和成功。关于“诚实、宽容、创新、服务”公司认为诚信是一切合作的基础，宽容是解决问题的前提，创新是发展事业的利器，服务是创造价值的根本。公司会坚持持续改进、满足顾客期望、确保品质第一、开拓全球市场。', '1', '100', '1528296656', '1529562824');
INSERT INTO `ey_archives` VALUES ('100', '63', '6', '0', '业务范围', '', '0', '0', '0', '0', '0', '', '0', '0', '', '0', '', '', '', '1', '100', '1529723379', '1529737571');
INSERT INTO `ey_archives` VALUES ('101', '39', '1', '0', '产品名称八', '/public/upload/news/2018/06/23/893fa9b4863f1c369db79bb6d81cdc24.jpg', '0', '0', '0', '0', '0', '', '216', '0', '', '0', '', '', '为客户降低采购成本和风险，为客户投资提供切实保障。追求永续发展的目标，并把它建立在客户满意的基础上。', '1', '100', '1529736553', '1529736553');
INSERT INTO `ey_archives` VALUES ('102', '64', '6', '0', '商业演出', '', '0', '0', '0', '0', '0', '', '0', '0', '', '0', '', '', '', '1', '100', '1529737724', '1529740907');
INSERT INTO `ey_archives` VALUES ('103', '66', '6', '0', '舞台搭建  ', '', '0', '0', '0', '0', '0', '', '0', '0', '', '0', '', '', '', '1', '100', '1529737883', '1529741061');
INSERT INTO `ey_archives` VALUES ('104', '67', '6', '0', '视频录制  ', '', '0', '0', '0', '0', '0', '', '0', '0', '', '0', '', '', '', '1', '100', '1529738011', '1529741205');
INSERT INTO `ey_archives` VALUES ('105', '68', '6', '0', '灯光音响工程  ', '', '0', '0', '0', '0', '0', '', '0', '0', '', '0', '', '', '', '1', '100', '1529738046', '1529741413');
INSERT INTO `ey_archives` VALUES ('106', '69', '6', '0', '设备播放 ', '', '0', '0', '0', '0', '0', '', '0', '0', '', '0', '', '', '', '1', '100', '1529738094', '1529741529');

-- -----------------------------
-- Table structure for `ey_arcrank`
-- -----------------------------
DROP TABLE IF EXISTS `ey_arcrank`;
CREATE TABLE `ey_arcrank` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '权限ID',
  `rank` smallint(6) DEFAULT '0' COMMENT '权限值',
  `name` char(20) DEFAULT '' COMMENT '会员名称',
  `add_time` int(11) DEFAULT '0' COMMENT '新增时间',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='文档阅读权限表';

-- -----------------------------
-- Records of `ey_arcrank`
-- -----------------------------
INSERT INTO `ey_arcrank` VALUES ('1', '0', '开放浏览', '0', '0');
INSERT INTO `ey_arcrank` VALUES ('2', '-1', '待审核稿件', '0', '0');

-- -----------------------------
-- Table structure for `ey_arctype`
-- -----------------------------
DROP TABLE IF EXISTS `ey_arctype`;
CREATE TABLE `ey_arctype` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `channeltype` int(10) DEFAULT '0' COMMENT '栏目顶级模型ID',
  `current_channel` int(10) DEFAULT '0' COMMENT '栏目当前模型ID',
  `parent_id` int(10) DEFAULT '0' COMMENT '栏目上级ID',
  `typename` varchar(200) DEFAULT '' COMMENT '栏目名称',
  `dirname` varchar(200) DEFAULT '' COMMENT '目录英文名',
  `dirpath` varchar(200) DEFAULT '' COMMENT '目录存放HTML路径',
  `englist_name` varchar(200) DEFAULT '' COMMENT '栏目英文名',
  `grade` tinyint(1) DEFAULT '0' COMMENT '栏目等级',
  `typelink` varchar(200) DEFAULT '' COMMENT '栏目链接',
  `litpic` varchar(250) DEFAULT '' COMMENT '栏目图片',
  `templist` varchar(200) DEFAULT '' COMMENT '列表模板文件名',
  `tempview` varchar(200) DEFAULT '' COMMENT '文档模板文件名',
  `seo_title` varchar(200) DEFAULT '' COMMENT 'SEO标题',
  `seo_keywords` varchar(200) DEFAULT '' COMMENT 'seo关键字',
  `seo_description` text COMMENT 'seo描述',
  `sort_order` int(10) DEFAULT '0' COMMENT '排序号',
  `is_hidden` tinyint(1) DEFAULT '0' COMMENT '是否隐藏栏目：0=显示，1=隐藏',
  `is_part` tinyint(1) DEFAULT '0' COMMENT '栏目属性：0=内容栏目，1=外部链接',
  `status` tinyint(1) DEFAULT '1' COMMENT '启用 (1=正常，0=屏蔽)',
  `add_time` int(11) DEFAULT '0' COMMENT '新增时间',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `dirname` (`dirname`) USING BTREE,
  UNIQUE KEY `dirpath` (`dirpath`,`id`) USING BTREE,
  KEY `parent_id` (`channeltype`,`parent_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=70 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `ey_arctype`
-- -----------------------------
INSERT INTO `ey_arctype` VALUES ('1', '6', '6', '0', '关于我们', 'guanyuwomen', '/html/guanyuwomen', 'ABOUT US', '0', '', '/public/upload/arctype/2018/06/23/53b789b3d0edffd913ca815672e30673.jpg', 'lists_single.htm', '', '', '', '', '1', '0', '0', '1', '1526539465', '1529717867');
INSERT INTO `ey_arctype` VALUES ('2', '1', '1', '0', '新闻动态', 'xinwendongtai', '/html/xinwendongtai', 'NEWS', '0', '', '/public/upload/arctype/2018/06/05/9f1a1ddd0052b10246b14d1279240198.jpg', 'lists_article.htm', 'view_article.htm', '', '', '', '3', '0', '0', '1', '1526539487', '1528247205');
INSERT INTO `ey_arctype` VALUES ('35', '1', '1', '0', '产品中心', 'chanpinzhongxin', '/html/chanpinzhongxin', 'PRDUCTS', '0', '', '/public/upload/arctype/2018/06/06/c4f5689431a6c711a440d47ed08e3ef7.jpg', 'lists_article_img.htm', 'view_article.htm', '', '', '', '2', '0', '0', '1', '1527645900', '1528338247');
INSERT INTO `ey_arctype` VALUES ('36', '1', '1', '0', '成功案例', 'chenggonganli', '/html/chenggonganli', 'CASE', '0', '', '', 'lists_article_img.htm', 'view_article.htm', '', '', '', '4', '0', '0', '1', '1527645925', '1527852122');
INSERT INTO `ey_arctype` VALUES ('15', '6', '6', '0', '联系我们', 'lianxiwomen', '/html/danye', 'CONTACT', '0', '', '/public/upload/arctype/2018/06/22/f6bd67fb47521ac6afd640cd9fdcbee9.jpg', 'lists_single.htm', '', '', '', '', '9', '0', '0', '1', '1526551000', '1529659578');
INSERT INTO `ey_arctype` VALUES ('43', '1', '1', '35', '第五系列', 'diwuxilie', '/html/chanpinzhongxin/diwuxilie', '', '1', '', '', 'lists_article_img.htm', 'view_article.htm', '', '', '', '100', '0', '0', '1', '1527647587', '1528338247');
INSERT INTO `ey_arctype` VALUES ('38', '1', '1', '0', '荣誉资质', 'rongyuzizhi', '/html/rongyuzizhi', 'HONOR', '0', '', '', 'lists_article_img.htm', 'view_article.htm', '', '', '', '6', '0', '0', '1', '1527646068', '1527677065');
INSERT INTO `ey_arctype` VALUES ('39', '1', '1', '35', '第一系列', 'diyixilie', '/html/chanpinzhongxin/diyixilie', '', '1', '', '', 'lists_article_img.htm', 'view_article.htm', '', '', '', '100', '0', '0', '1', '1527647518', '1528338247');
INSERT INTO `ey_arctype` VALUES ('40', '1', '1', '35', '第二系列', 'dierxilie', '/html/chanpinzhongxin/dierxilie', '', '1', '', '', 'lists_article_img.htm', 'view_article.htm', '', '', '', '100', '0', '0', '1', '1527647537', '1528338247');
INSERT INTO `ey_arctype` VALUES ('41', '1', '1', '35', '第三系列', 'disanxilie', '/html/chanpinzhongxin/disanxilie', '', '1', '', '', 'lists_article_img.htm', 'view_article.htm', '', '', '', '100', '0', '0', '1', '1527647554', '1528338247');
INSERT INTO `ey_arctype` VALUES ('42', '1', '1', '35', '第四系列', 'disixilie', '/html/chanpinzhongxin/disixilie', '', '1', '', '', 'lists_article_img.htm', 'view_article.htm', '', '', '', '100', '0', '0', '1', '1527647571', '1528338247');
INSERT INTO `ey_arctype` VALUES ('46', '1', '1', '2', '公司动态', 'gongsidongtai', '/html/xinwendongtai/gongsidongtai', '', '1', '', '/public/upload/arctype/2018/06/01/317a3a657677312966c60ccb95914c02.jpg', 'lists_article.htm', 'view_article.htm', '', '', '', '100', '0', '0', '1', '1527839899', '1528247205');
INSERT INTO `ey_arctype` VALUES ('47', '1', '1', '2', '行业资讯', 'xingyezixun', '/html/xinwendongtai/xingyezixun', '', '1', '', '/public/upload/arctype/2018/06/01/55162609e53f65c52fc2434808cb4201.jpg', 'lists_article.htm', 'view_article.htm', '', '', '', '100', '0', '0', '1', '1527839913', '1528247205');
INSERT INTO `ey_arctype` VALUES ('53', '8', '8', '0', '在线留言', 'zaixianliuyan', '/html/zaixianliuyan', '', '0', '', '', 'lists_guestbook.htm', '', '', '', '', '100', '0', '0', '1', '1528272137', '1528272137');
INSERT INTO `ey_arctype` VALUES ('63', '6', '6', '0', '业务范围', 'yewufanwei', '/html/jishuzhichi', 'BUSINESS', '0', '', '', 'lists_single.htm', '', '', '', '', '7', '0', '0', '1', '1529723379', '1529737571');
INSERT INTO `ey_arctype` VALUES ('64', '6', '6', '63', '商业演出', 'shangyeyanchu', '/html/jishuzhichi/shangyeyanchu', 'PERFORMANCE', '1', '', '/public/upload/arctype/2018/06/23/e1d471df2974d9a6304bb60f92aa967d.png', 'lists_single.htm', '', '', '', '', '100', '0', '0', '1', '1529737724', '1529740907');
INSERT INTO `ey_arctype` VALUES ('66', '6', '6', '63', '舞台搭建  ', 'wutaidajian', '/html/jishuzhichi/wutaidajian', 'STAGE SET UP', '1', '', '/public/upload/arctype/2018/06/23/c404ab30c356c0b97643db0b4849cea5.png', 'lists_single.htm', '', '', '', '', '100', '0', '0', '1', '1529737883', '1529741061');
INSERT INTO `ey_arctype` VALUES ('67', '6', '6', '63', '视频录制  ', 'shipinluzhi', '/html/jishuzhichi/shipinluzhi', 'VIDEO RECORDING', '1', '', '/public/upload/arctype/2018/06/23/dade4570c0a18b7343710bebaa29d0eb.png', 'lists_single.htm', '', '', '', '', '100', '0', '0', '1', '1529738011', '1529741205');
INSERT INTO `ey_arctype` VALUES ('68', '6', '6', '63', '灯光音响工程  ', 'dengguangyinxianggongcheng', '/html/jishuzhichi/dengguangyinxianggongcheng', 'LIGHT&amp;SOUND PROJECTS', '1', '', '/public/upload/arctype/2018/06/23/047f54b7ba448141063d3994b2e02fe6.png', 'lists_single.htm', '', '', '', '', '100', '0', '0', '1', '1529738046', '1529741413');
INSERT INTO `ey_arctype` VALUES ('69', '6', '6', '63', '设备播放 ', 'shebeibofang', '/html/jishuzhichi/shebeibofang', 'EQUIPMENT LEASING', '1', '', '/public/upload/arctype/2018/06/23/573f826d23b850721763bca3c4a528d3.png', 'lists_single.htm', '', '', '', '', '100', '0', '0', '1', '1529738094', '1529741529');

-- -----------------------------
-- Table structure for `ey_article_content`
-- -----------------------------
DROP TABLE IF EXISTS `ey_article_content`;
CREATE TABLE `ey_article_content` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `aid` int(10) DEFAULT '0' COMMENT '文档ID',
  `content` longtext COMMENT '内容详情',
  `add_time` int(11) DEFAULT '0' COMMENT '新增时间',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `news_id` (`aid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=66 DEFAULT CHARSET=utf8 COMMENT='资讯内容表_存储正常内容';

-- -----------------------------
-- Records of `ey_article_content`
-- -----------------------------
INSERT INTO `ey_article_content` VALUES ('27', '51', '&lt;p style=&quot;text-align: center;&quot;&gt;&lt;img src=&quot;/public/upload/article/2018/06/11/abde68bcfb63ff0a8448e951247957cc.jpg&quot; title=&quot;abde68bcfb63ff0a8448e951247957cc.jpg&quot; alt=&quot;abde68bcfb63ff0a8448e951247957cc.jpg&quot;/&gt;&lt;/p&gt;&lt;p&gt;公司认为客户、供应商、公司股东、公司员工等一切和自身有合作关系的单位和个人都是自己的合作伙伴，并只有通过努力为合作伙伴创造价值，才能体现自身的价值并获得发展和成功。&lt;/p&gt;&lt;p&gt;关于“诚实、宽容、创新、服务”&lt;/p&gt;&lt;p&gt;公司认为诚信是一切合作的基础，宽容是解决问题的前提，创新是发展事业的利器，服务是创造价值的根本。公司会坚持持续改进、满足顾客期望、 确保品质第一、开拓全球市场。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '1527665029', '1529562733');
INSERT INTO `ey_article_content` VALUES ('28', '52', '&lt;p style=&quot;white-space: normal; text-align: center;&quot;&gt;&lt;img src=&quot;/public/upload/article/2018/06/11/a3a309928d117c7e33d8b835b650ec0b.jpg&quot; title=&quot;a3a309928d117c7e33d8b835b650ec0b.jpg&quot; alt=&quot;a3a309928d117c7e33d8b835b650ec0b.jpg&quot;/&gt;&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;公司认为客户、供应商、公司股东、公司员工等一切和自身有合作关系的单位和个人都是自己的合作伙伴，并只有通过努力为合作伙伴创造价值，才能体现自身的价值并获得发展和成功。&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;关于“诚实、宽容、创新、服务”&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;公司认为诚信是一切合作的基础，宽容是解决问题的前提，创新是发展事业的利器，服务是创造价值的根本。公司会坚持持续改进、满足顾客期望、 确保品质第一、开拓全球市场。&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;', '1527665066', '1529562748');
INSERT INTO `ey_article_content` VALUES ('29', '53', '&lt;p style=&quot;white-space: normal; text-align: center;&quot;&gt;&lt;img src=&quot;/public/upload/article/2018/06/11/f0c269cc50ed9a276c48990b9d95b927.jpg&quot; title=&quot;f0c269cc50ed9a276c48990b9d95b927.jpg&quot; alt=&quot;f0c269cc50ed9a276c48990b9d95b927.jpg&quot;/&gt;&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;公司认为客户、供应商、公司股东、公司员工等一切和自身有合作关系的单位和个人都是自己的合作伙伴，并只有通过努力为合作伙伴创造价值，才能体现自身的价值并获得发展和成功。&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;关于“诚实、宽容、创新、服务”&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;公司认为诚信是一切合作的基础，宽容是解决问题的前提，创新是发展事业的利器，服务是创造价值的根本。公司会坚持持续改进、满足顾客期望、 确保品质第一、开拓全球市场。&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;', '1527665090', '1529562760');
INSERT INTO `ey_article_content` VALUES ('30', '54', '&lt;p style=&quot;white-space: normal; text-align: center;&quot;&gt;&lt;img src=&quot;/public/upload/article/2018/06/11/346c97b52393856c3dbf4bc9c7ac894f.jpg&quot; title=&quot;346c97b52393856c3dbf4bc9c7ac894f.jpg&quot; alt=&quot;346c97b52393856c3dbf4bc9c7ac894f.jpg&quot;/&gt;&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;公司认为客户、供应商、公司股东、公司员工等一切和自身有合作关系的单位和个人都是自己的合作伙伴，并只有通过努力为合作伙伴创造价值，才能体现自身的价值并获得发展和成功。&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;关于“诚实、宽容、创新、服务”&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;公司认为诚信是一切合作的基础，宽容是解决问题的前提，创新是发展事业的利器，服务是创造价值的根本。公司会坚持持续改进、满足顾客期望、 确保品质第一、开拓全球市场。&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;', '1527665111', '1529562775');
INSERT INTO `ey_article_content` VALUES ('31', '55', '&lt;p style=&quot;white-space: normal; text-align: center;&quot;&gt;&lt;img src=&quot;/public/upload/article/2018/06/11/1109d4f19b0a4950a2b050f99831c099.jpg&quot; title=&quot;1109d4f19b0a4950a2b050f99831c099.jpg&quot; alt=&quot;1109d4f19b0a4950a2b050f99831c099.jpg&quot;/&gt;&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;公司认为客户、供应商、公司股东、公司员工等一切和自身有合作关系的单位和个人都是自己的合作伙伴，并只有通过努力为合作伙伴创造价值，才能体现自身的价值并获得发展和成功。&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;关于“诚实、宽容、创新、服务”&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;公司认为诚信是一切合作的基础，宽容是解决问题的前提，创新是发展事业的利器，服务是创造价值的根本。公司会坚持持续改进、满足顾客期望、 确保品质第一、开拓全球市场。&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;', '1527665145', '1529562787');
INSERT INTO `ey_article_content` VALUES ('32', '56', '&lt;p style=&quot;white-space: normal; text-align: center;&quot;&gt;&lt;img src=&quot;/public/upload/article/2018/06/11/38a80f4b86c36b8ef51b4435b019c545.jpg&quot; title=&quot;38a80f4b86c36b8ef51b4435b019c545.jpg&quot; alt=&quot;38a80f4b86c36b8ef51b4435b019c545.jpg&quot;/&gt;&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;公司认为客户、供应商、公司股东、公司员工等一切和自身有合作关系的单位和个人都是自己的合作伙伴，并只有通过努力为合作伙伴创造价值，才能体现自身的价值并获得发展和成功。&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;关于“诚实、宽容、创新、服务”&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;公司认为诚信是一切合作的基础，宽容是解决问题的前提，创新是发展事业的利器，服务是创造价值的根本。公司会坚持持续改进、满足顾客期望、 确保品质第一、开拓全球市场。&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;', '1527665172', '1529562801');
INSERT INTO `ey_article_content` VALUES ('14', '38', '&lt;p style=&quot;text-align: center;&quot;&gt;&lt;img src=&quot;/public/upload/article/2018/06/11/8732a1ac73f626e46d70e676efa3abd9.jpg&quot; title=&quot;8732a1ac73f626e46d70e676efa3abd9.jpg&quot; alt=&quot;8732a1ac73f626e46d70e676efa3abd9.jpg&quot;/&gt;&lt;/p&gt;', '1527664149', '1528686741');
INSERT INTO `ey_article_content` VALUES ('15', '39', '&lt;p style=&quot;text-align: center;&quot;&gt;&lt;img src=&quot;/public/upload/article/2018/06/11/0bb491e8bcef824bdbd3daa62882f524.jpg&quot; title=&quot;0bb491e8bcef824bdbd3daa62882f524.jpg&quot; alt=&quot;0bb491e8bcef824bdbd3daa62882f524.jpg&quot;/&gt;&lt;/p&gt;', '1527664280', '1528686760');
INSERT INTO `ey_article_content` VALUES ('16', '40', '&lt;p style=&quot;text-align: center;&quot;&gt;&lt;img src=&quot;/public/upload/article/2018/06/11/52a68662062815531189d6759399f5cb.jpg&quot; title=&quot;52a68662062815531189d6759399f5cb.jpg&quot; alt=&quot;52a68662062815531189d6759399f5cb.jpg&quot;/&gt;&lt;/p&gt;', '1527664307', '1528686781');
INSERT INTO `ey_article_content` VALUES ('17', '41', '&lt;p style=&quot;text-align: center;&quot;&gt;&lt;img src=&quot;/public/upload/article/2018/06/11/688a6224856f4eeeed4ec8eb64fec72c.jpg&quot; title=&quot;688a6224856f4eeeed4ec8eb64fec72c.jpg&quot; alt=&quot;688a6224856f4eeeed4ec8eb64fec72c.jpg&quot;/&gt;&lt;/p&gt;', '1527664331', '1528686800');
INSERT INTO `ey_article_content` VALUES ('18', '42', '&lt;p style=&quot;text-align: center;&quot;&gt;&lt;img src=&quot;/public/upload/article/2018/06/23/25e0599fbe719d48c9497c0704a7e224.jpg&quot; title=&quot;25e0599fbe719d48c9497c0704a7e224.jpg&quot; alt=&quot;25e0599fbe719d48c9497c0704a7e224.jpg&quot;/&gt;&lt;/p&gt;&lt;p&gt;为客户降低采购成本和风险，为客户投资提供切实保障。 追求永续发展的目标，并把它建立在客户满意的基础上。&lt;/p&gt;', '1527664373', '1529736328');
INSERT INTO `ey_article_content` VALUES ('19', '43', '&lt;p style=&quot;text-align: center;&quot;&gt;&lt;img src=&quot;/public/upload/article/2018/06/23/50970d502e7e05214a30e0015875caeb.jpg&quot; title=&quot;50970d502e7e05214a30e0015875caeb.jpg&quot; alt=&quot;50970d502e7e05214a30e0015875caeb.jpg&quot;/&gt;&lt;/p&gt;&lt;p&gt;为客户降低采购成本和风险，为客户投资提供切实保障。 追求永续发展的目标，并把它建立在客户满意的基础上。&lt;br/&gt;&lt;/p&gt;', '1527664459', '1529736344');
INSERT INTO `ey_article_content` VALUES ('20', '44', '&lt;p style=&quot;text-align: center;&quot;&gt;&lt;img src=&quot;/public/upload/article/2018/06/23/1acf742bef94ef26f3677a3bd92e6fbb.jpg&quot; title=&quot;1acf742bef94ef26f3677a3bd92e6fbb.jpg&quot; alt=&quot;1acf742bef94ef26f3677a3bd92e6fbb.jpg&quot;/&gt;&lt;/p&gt;&lt;p&gt;为客户降低采购成本和风险，为客户投资提供切实保障。 追求永续发展的目标，并把它建立在客户满意的基础上。&lt;/p&gt;', '1527664498', '1529736469');
INSERT INTO `ey_article_content` VALUES ('21', '45', '&lt;p style=&quot;text-align: center;&quot;&gt;&lt;img src=&quot;/public/upload/article/2018/06/23/bef7927703a58b48c2178b73b31b906d.jpg&quot; title=&quot;bef7927703a58b48c2178b73b31b906d.jpg&quot; alt=&quot;bef7927703a58b48c2178b73b31b906d.jpg&quot;/&gt;&lt;/p&gt;&lt;p&gt;为客户降低采购成本和风险，为客户投资提供切实保障。 追求永续发展的目标，并把它建立在客户满意的基础上。&lt;/p&gt;', '1527664551', '1529736486');
INSERT INTO `ey_article_content` VALUES ('38', '64', '&lt;p style=&quot;text-align: center;&quot;&gt;&lt;img src=&quot;/public/upload/article/2018/06/23/6dc25ad1b43289f194bdc4d008ed723c.jpg&quot; title=&quot;6dc25ad1b43289f194bdc4d008ed723c.jpg&quot; alt=&quot;6dc25ad1b43289f194bdc4d008ed723c.jpg&quot;/&gt;&lt;/p&gt;&lt;p&gt;为客户降低采购成本和风险，为客户投资提供切实保障。 追求永续发展的目标，并把它建立在客户满意的基础上。&lt;/p&gt;', '1527851982', '1529736505');
INSERT INTO `ey_article_content` VALUES ('39', '65', '&lt;p style=&quot;text-align: center;&quot;&gt;&lt;img src=&quot;/public/upload/article/2018/06/23/1c5d6ce1855e409b216055e2fc072c66.jpg&quot; title=&quot;1c5d6ce1855e409b216055e2fc072c66.jpg&quot; alt=&quot;1c5d6ce1855e409b216055e2fc072c66.jpg&quot;/&gt;&lt;/p&gt;&lt;p&gt;为客户降低采购成本和风险，为客户投资提供切实保障。 追求永续发展的目标，并把它建立在客户满意的基础上。&lt;/p&gt;', '1527852009', '1529736525');
INSERT INTO `ey_article_content` VALUES ('49', '75', '&lt;p style=&quot;text-align: center;&quot;&gt;&lt;img src=&quot;/public/upload/article/2018/06/23/17cec659a688322836c2bcc8013a645c.jpg&quot; title=&quot;17cec659a688322836c2bcc8013a645c.jpg&quot; alt=&quot;17cec659a688322836c2bcc8013a645c.jpg&quot;/&gt;&lt;/p&gt;&lt;p&gt;为客户降低采购成本和风险，为客户投资提供切实保障。 追求永续发展的目标，并把它建立在客户满意的基础上。&lt;/p&gt;', '1528187966', '1529736547');
INSERT INTO `ey_article_content` VALUES ('40', '66', '&lt;p&gt;腾讯不仅在阿里怂恿大家花钱的双十一之际高调派钱，如今财报的高速增长业务也刚好跟支付宝和阿里云对标。&lt;/p&gt;&lt;p&gt;今日晚间，腾讯发布今天公布未经审核的第三季度财报。报告显示，腾讯三季度总收入同比增长52%，增速与上季度持平；净利润增速有所下滑。&lt;/p&gt;&lt;p&gt;值得注意的是，腾讯游戏营收比重已经连续两个季度下降，三季度网络游戏收入仅占总营收的45%；而支付和云计算等新兴业务的比重则继续上升，首次超过10%，达到12%。&lt;/p&gt;&lt;h3&gt;净利润增速下滑&lt;/h3&gt;&lt;p&gt;总体财务状况方面，腾讯三季度总收入为人民币403.88亿元（60.48亿美元），同比增长52%，增速与上季度持平。但是盈利增速却有所下滑，期内盈利为人民币107.76亿元（16.14亿美元），比去年同期增长42%；净利润率由去年同期的29%降至27%。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;h3&gt;游戏营收占比连续两个季度下滑&lt;/h3&gt;&lt;p&gt;分部业务方面，包括网络游戏和社交网络在内的增值业务依然是腾讯收入的大头，占比约八成。然而，一向被视为腾讯摇钱树的游戏业务，其收入占比却连续两季下降，如今占总营收比重仅有45%左右，该项业务在2015年一度占腾讯营收六成。而社交网络收入增速则在逐步增长，占比一直稳定在23-24%。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;再往细看，手游已经成了游戏业务的主力，在181亿元的游戏业务收入中，手游为99亿元，同比增长87%；端游收入同比增长仅有10%，而且据财报显示，端游的平均同时在线用户还有下降，因此，腾讯正将工作重点从增加用户在游戏内的时长转至扩展用户互动方式。&lt;/p&gt;&lt;p&gt;网络广告收入的占比同样较稳定，约占集团收入17%。其中，效果广告收入增长明显，增速达83%，主要由于来自微信朋友圈、移动端新闻应用及微信公众账号广告收入的贡献。微信也不断在探索朋友圈变现的方式，包括其最近上线的朋友圈的LBS本地推广广告和原生推广页广告。&lt;/p&gt;&lt;p&gt;此外，在QQ月活跃用户（8.77亿，比去年同期增长2%）见顶的背景下，微信和WeChat的合并月活跃账户数依然在继续增长，达到8.46亿，比去年同期增长30%。然而，与QQ的月活用户数相比，如果微信未能进一步国际化，其用户见顶之日显然已经不远了，因此，微信目前的工作重心已经不再是增加微信的用户，而是想办法如何让用户们留在微信上，将所有时间都花在这个应用里。因此，微信正在测试“小程序”，让用户无需离开微信界面便可进行低频次互动。&lt;/p&gt;&lt;h3&gt;其他业务收入增长348%&lt;/h3&gt;&lt;p&gt;增长最亮眼的是包括支付及云服务在内的其他业务，同比增长348%，至人民币49.64亿元。至此，其他业务占集团收入的比重已经达到12%，首次超过10%。&lt;/p&gt;&lt;p&gt;阿里和腾讯本来在国内已是两大支付巨头，前者依靠电商，后者依靠社交，展开了多次支付减免大战。支付宝最近更是出海动作频频，腾讯也已经继支付宝之后，开始布局东南亚的支付市场。&lt;/p&gt;&lt;p&gt;同时，虽然其中云服务的具体收入没有披露，但即便是在国内公有云市场一家独大的阿里云，其占阿里总营收也不过只有4%，加上这个市场才刚刚开始，坐拥强大资本的腾讯在游戏这个垂直领域上有着自身的优势，又有布局人工智能领域的意思，要奋起直追也并非难事。&lt;/p&gt;&lt;p&gt;如此看来，尽管腾讯曾在电商领域受挫，影业方面也未有阿里的大动作，但在支付和云计算两个阿里的明星业务上，与腾讯可能还得迎来几场血战。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '1527899765', '1528687143');
INSERT INTO `ey_article_content` VALUES ('41', '67', '&lt;p&gt;36氪获悉，线下公众号推广公司乐摇摇科技已完成 3800 万元 A+ 轮融资，投资方为广发信德。&lt;/p&gt;&lt;p&gt;众所周知，如今线上流量昂贵，大家的目光开始聚焦线下。除了传统的地铁、电梯广告，线下也已经有一些新的广告模式，比如通过商业 Wi-Fi 获客，代表公司有迈外迪；比如现在餐饮店外常见的照片打印机，是专门服务公众号的效果广告。乐摇摇科技则选择利用抓娃娃机做流量分发。&lt;/p&gt;&lt;p&gt;之所以从抓娃娃机切入，创始人陈耿豪认为主要原因有两点：首先，抓娃娃机国内存量有 200 万台，包括其在内的所有投币类设备存量约 2000 万台，这些机器无法进行移动支付，消费者和商家的痛点需要被解决；第二，抓娃娃机多在商场、KTV 等地，用户群体是 16 到 35 岁女性，广告投放更精准。&lt;/p&gt;&lt;p&gt;从广告受众的角度可以看出，乐摇摇比 WI-FI 获客更精准；而从乐摇摇的业务模式看，他们不像市面上的照片打印机那样自己生产机器，而是和机器生产厂家合作，只提供硬件盒子，因此业务模式更轻。&lt;/p&gt;&lt;p&gt;具体看乐摇摇的业务模式，他们免费给机器提供硬件盒子和 SaaS 系统，由厂家安装好盒子后发货给商家，据统计，实现移动支付后的抓娃娃机能增加 28% 的收入。用户想抓娃娃时，先用微信扫码，这时有两种模式供选择，第一种是充值使用，用户充值后即可花 1 元抓娃娃；第二种是免费使用，用户选择此模式后，关注一个广告主的微信公众号，即可免费抓一次娃娃，通常用户会看到三、四个广告主的公众号。&lt;/p&gt;&lt;p&gt;&lt;/p&gt;&lt;p&gt;通过这种方式，乐摇摇（目前安装了 30000 台机器）每台机器平均每天分发广告 10 次，整个平台每天能为公众号涨粉约 30 万个，平均每个号 7、8 万个，一周的平均留存率为 65%。通常使用广点通的获客成本是接近 3 元一个，使用乐摇摇则是 1 元多一个。除了价格便宜，陈耿豪认为线下互动产生的流量会比线上更真实，更具有场景化，不过他也介绍说，乐摇摇和广点通并非替代关系，公众号一般会结合不同的方式获取用户。&lt;/p&gt;&lt;p&gt;据陈耿豪介绍，全国大部分抓娃娃机的厂家都在广州番禺，他们已合作了 300 多家，基本覆盖所有厂家，前面提到他们已安装 3 万台机器，覆盖中国 291 个城市，他们计划在 2017 年达到 10 万台。在此之后，他们会扩展到其他游戏类投币机。&lt;/p&gt;&lt;p&gt;目前乐摇摇已经合作的公众号超过 100 个，客户包括广州潮生活、同道大叔、新榜等内容创业者，以及碧桂园、蜜芽等品牌公众号。广告订单为几千万元，乐摇摇按一定比例抽取利润。陈耿豪认为，目前公众号需求量最大，今后小程序也可以成为他们的客户。&lt;/p&gt;&lt;p&gt;除了广告分发变现之外，乐摇摇还希望在未来尝试更多变现方式。在沉淀用户数足够多时，计划通过用户运营变现，可能会尝试游戏、电商等方式；目前月流水为 4000 万元，未来计划开展支付金融和产业链整合业务。&lt;/p&gt;&lt;p&gt;团队方面，创始人陈耿豪曾在联合利华和惠普有 3 年营销工作经验，2011 年曾创立营销互动公司微电互动，2015 年被某上公司并购。CMO徐德强曾是搜狐焦点威海站南通站总经理；CTO杨凯然曾任职于甲骨文；业务VP张杰波是平安保险高管。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '1527899807', '1528687172');
INSERT INTO `ey_article_content` VALUES ('42', '68', '&lt;p&gt;从2014年起，网络大电影这个词逐渐进入人们的眼球，当时满地都是几十万制作成本博得百万票房的故事，考拉娱乐便是在那个网生内容的蛮荒时代入的局。&lt;/p&gt;&lt;p&gt;在接受36氪采访时，考拉娱乐创始人钱伟坦言借过去的势他们赚到了不少钱，“我们有个片子8万成本，最后回收了一百多万的票房。”在过去的两年间，他们平均一年能做20多部大电影，在各大视频网站上收益排名Top10中，你很容易就能发现考拉出品的好几部片子，也给他们积累了很多渠道资源。&lt;/p&gt;&lt;p&gt;但当时间跨入今年后，网络大电影市场开始洗牌，去年整个市场上600多部片子突然激增到2000部以上，四两拨千斤的时代已经过去了，你会发现排名靠前的网大制作成本基本都在百万以上，已经达到了二三线院线水平。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;近期推出的黄金赌城系列&lt;/p&gt;&lt;p&gt;市场红利期过去后，考拉娱乐在今年就开始了他们新的布局：瞄准女性市场，做精品网生内容。“这个其实是之前就规划好的，洗牌是肯定的。”钱伟说今年他们上半年基本没有怎么发片子，都在为今后的“慢”内容做准备。&lt;/p&gt;&lt;p&gt;考拉娱乐首先改变的是IP孵化方式，他们组建了一支漫画团队，定位是连载时间在三年以上的长篇大世界观作品，当这些作品经过市场验证后，逐步推出相应的网络剧、大电影等衍生内容。&lt;/p&gt;&lt;p&gt;其上半年验证这个模式的作品《极品修真少年》目前连载52话就超过3.5亿人气，同名大电影也已经开拍，“根粉丝对于这种做法反馈非常良好。”钱伟说未来自家头部的女性向作品都会以这种模式推出，做IP放大，然后去做游戏等方面的衍生，他们也已经跟一些游戏、影视公司达成了合作。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;在开始规划长线IP的同时，考拉娱乐还在构建自己的渠道，“跟当年手游潮一样，开始洗牌后渠道会越来越强势，CP的话语权会下降。”钱伟说这也是在为未来做打算，不让自己完全受制于平台，现在考拉的做法是做女性向的PGC直播内容。&lt;/p&gt;&lt;p&gt;目前他们已经接入微信小程序，自主开发了一个PGC直播频道，跟一些女性向大号联合推出定制的直播内容，满足这些大号图文内容向视频内容升级需求同时积攒垂直领域的流量，为今后自家女性向的漫画、网生内容做准备。现在这个频道仍在测试中，只在每晚8点进行直播，平均在线人数在几千左右。&lt;/p&gt;&lt;p&gt;“合作过的公众号反馈都还OK，未来希望把它变成一个全天直播的女性频道。”钱伟表示这个平台并不需要很大，目的是形成IP孵化、渠道推广、变现的内部循环。当然，构建自家渠道并不意味着考拉要放弃平台渠道，接下来他们出品的几部作品都跟平台有深度的合作。&lt;/p&gt;&lt;p&gt;在确定新的内容孵化和渠道推广模式后，钱伟表示他们在核心的网生内容生产上也完成了升级，现在考拉在制作上也采用了编剧和制片人核心制，过去推出的大量作品其实是在做人才筛选，“比如不能适应这种模式的导演被我们淘汰掉了。”钱伟说在合作的几十位导演中，他们只留下了两位。&lt;/p&gt;&lt;p&gt;未来考拉娱乐会以每年10部左右网络大电影的节奏推进，一部分是以漫画为源头的女性向慢内容，做长线的IP变现，另一部分则为保证考拉品牌活跃度以及创造流水的市场向内容。&lt;/p&gt;&lt;p&gt;团队方面，钱伟是投资人出身，曾担任创东方投资总监，环宇互动传媒创始人。负责公司整体布局和影视原创内容的规划，在漫画和直播方面则有另外两位合伙人负责，漫画合伙人付韬曾担任西山居游戏制作人。&lt;/p&gt;&lt;p&gt;此前他们已经获得由合一资本和创东方投资的数千万A轮融资，目前正在准备A+轮。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '1527899852', '1528687186');
INSERT INTO `ey_article_content` VALUES ('43', '69', '&lt;p&gt;36氪从ofo内部获得消息，可能在今年4月份，ofo将会接入到滴滴出行的App上，届时用户可以直接在滴滴上面使用ofo的服务。&lt;/p&gt;&lt;p&gt;“这件事最近被频繁地提上日程，内部消息是下个月就有可能接入。”一名ofo内部员工说。36氪向滴滴官方、ofo官方求证了此消息，但截止发稿时，两家公司均未对此确认或否认。&lt;/p&gt;&lt;p&gt;ofo创始人戴威曾在去年12月表示，何时接入滴滴APP，没有明确的时间表。“ofo的模式是没有GPS的，用户看到车就用，整个逻辑跟滴滴平台打车的逻辑不太一样，但近期我们会跟滴滴联合推出一些东西。”&lt;/p&gt;&lt;p&gt;不过类似的接入并非没有先例。今年2月，微信联合摩拜单车宣布，用户通过微信“扫一扫”扫描摩拜单车车身上的二维码，就可直接进入摩拜单车微信小程序，点击开锁即可用车。&lt;/p&gt;&lt;p&gt;这并不是第一次传出ofo会接入滴滴的消息，也不是两个平台的第一次深度绑定。此前，滴滴参与了ofo最近三轮的融资。根据腾讯科技的报道，一位共享单车投资人透露，ofo经过多轮融资以后，滴滴已经成为ofo最大股东，占股超过30%。“这意味着，滴滴在ofo的话语权更强了，同时，ofo的成与败，滴滴将是最大利息相关方。”&lt;/p&gt;&lt;p&gt;这也不难理解，滴滴将ofo接入之后，将作为巨大的用户流量入口为其导流，而ofo则进一步巩固生意体量，在滴滴的加持下提高行业地位和想象空间。&lt;/p&gt;&lt;p&gt;而且，如果真的将ofo接入进来，也意味着滴滴及其背后的资本在进一步弥补自己在出行领域的缺口。&lt;/p&gt;&lt;p&gt;有知情人向36氪透露，曾经滴滴也想做共享单车，但是出于某些原因没能实现，最终只能作为ofo的投资方。不过这并不意味着滴滴不会更进一步涉足这个市场。&lt;/p&gt;&lt;p&gt;滴滴投资ofo，无非是瞄准了“最后三公里”的机会。&lt;/p&gt;&lt;p&gt;当前国内在“最后三公里”领域仍是一个非常初级的阶段，也没有系统性服务商。而在北上广的一线城市，交通的繁复令各大出行平台对“最后三公里”争夺日趋激烈。&lt;/p&gt;&lt;p&gt;“从出发地到目的地3公里，到底是打车还是骑车，这对于用户来说是可以选择的，选哪一个都说得过去。”一名ofo内部员工说，而滴滴的做法就是自己要把不同的选项全部覆盖。&lt;/p&gt;&lt;p&gt;在滴滴和ofo及其投资人看来，共享单车领域已经迎来了一个快速增长期。Ofo的一名公关曾对媒体表示，以专车和快车为例，2012 年之后的这几年，发展速度是非常快的。ofo 则是在 1 年的时间里，把日订单量从 200 单做到了50万单，“过去的专车快车，现在的 ofo 都是经历着高速的增长，这个势头是类似的”。上述公关人员说。&lt;/p&gt;&lt;p&gt;去年12月末，ofo联合滴滴推出红包活动，这是ofo被滴滴战略投资后双方首次进行大规模合作。而活动采取的红包策略，也被认为是滴滴历来进行市场推广的利器之一。&lt;/p&gt;&lt;p&gt;按照滴滴方的说法，2017年仍旧会将主要精力放在出行领域，希望能够打通每个人的出行。这意味着所有的出行方式都将会被覆盖到，共享单车也会是滴滴发力的方向之一。&lt;/p&gt;&lt;p&gt;36氪认为，滴滴进一步接入共享单车还有一个重要的原因在于，与“苛刻”的互联网专车规定相比，共享单车发展初期便受到了政策鼓励，约束条件也颇为合理。而去年至今一直受网约车新政影响的滴滴出行无论是从政策角度，还是从新的业务增长角度来看，都有可能会更进一步从共享单车的风口上分得一杯羹。&lt;/p&gt;&lt;p&gt;不过，36氪还有疑问，没有导航的ofo要怎么接入滴滴，以及接入之后到底会给用户带来哪些影响？&lt;/p&gt;&lt;p&gt;“据我了解到的情况是，滴滴可能会把技术和导航这快的事情承包给第三方公司。”上述ofo内部员工说，接入滴滴之后的ofo可能依旧没有导航，用户在页面上主要行使扫码开锁和支付功能。&lt;/p&gt;&lt;p&gt;至于用户体验方面，上述内部员工表示，“本来ofo的主体功能就比较单一，操作起来非常的简单，相信可以无缝对接到滴滴平台上，”他强调，“毕竟未来的趋势是，人们手机上装载的app数量将会越来越少”。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '1527899881', '1528687201');
INSERT INTO `ey_article_content` VALUES ('44', '70', '&lt;p&gt;编者按：人工智能技术的发展正在不断地改变着人们的生活与工作方式，它在一定程度上推动了社会的发展与进步，这一点是毋庸置疑的。但人工智能并不是万能的，因为机器并不具备人类的思维与情绪。当你打开网站上的在线求助窗口，却发现回答你的只是冷冰冰的机器人的时候，恐怕应该会很失望吧。&lt;/p&gt;&lt;p&gt;2016年4月，马克·扎克伯格在Facebook的F8会议上为Messenger上的开发者们描述了一个光明的未来，并宣布将进入“像和朋友一样与机器人聊天”的新时代。世界各地的开发人员，这些开发人员都拥有Facebook、Google和Microsoft等大公司的认证，都声称独立移动应用程序的时代结束了，并一起庆祝新的方式的到来——对话商务（Conversational Commerce）和聊天机器人（Chatbots）。11个月前，Facebook宣布其官方开发的聊天机器人“M”的beta测试中AI失败率为70％，随后便更新了其平台，并建议开发人员在Messenger中开发更轻量级的应用程序，同时禁用会话输入。&lt;/p&gt;&lt;p&gt;关于Wordhop.io，一直以来我们都知道两件事。第一件事就是，AI真的很难，要实现让机器人100％像朋友一样与人类交流还需要很多年。毕竟，机器人不能像人一样产生共鸣。第二，Facebook消费者不会因为他们想购物或对天气感兴趣而给一个企业发送消息。这些体验是以具备聊天机器人为前提条件的，并且还需要已从信息传递领域拓展到社交网络领域的行业数据的支撑。&lt;/p&gt;&lt;p&gt;Facebook用户真正想要的就是，在有问题的时候可以迅速得到商家的回复。&lt;/p&gt;&lt;p&gt;消费者在Facebook上给商家发送消息的主要原因是想要获得服务。其他的一切都是浮云。这样的交互式预售可能从客户的发问开始，及时的答复可以推进交易的进行。如果客户联系销售客服，通常是因为他们真的有问题需要请教客服。一些答案可以由机器人回答，而更复杂的问题可以交给人来解决，在有得力工具的情况下，人类的回复速度可以媲美机器人。&lt;/p&gt;&lt;p&gt;然而许多机器人开发者没有将注意力集中在最有需求的那部分上，而是寻求创造新的用户体验，或重新开发升级旧的关于chatbot的概念。如果机器人开发者觉得参与率低，这可能不是因为AI失败了，而是因为他们把消费者往一条最开始就不想走的路上引。没有利用已存在的消费者行为模式，也没有训练机器人回应客户的需求，AI的作用只是，实现机器人开发商想象中的创造性体验并指导消费者通过该体验来进行交互。&lt;/p&gt;&lt;p&gt;Facebook现在建议机器人开发人员完全禁用会话输入。&lt;/p&gt;&lt;p&gt;我个人并不认为，像Facebook建议的那样禁用聊天输入是针对AI和NLP的技术限制的正确解决方案。无对话能力的通信机器人对于新闻机器人是可以接受的，这其中的体验由通知和内容消费驱动。但是，如果是以服务为基础的业务的话，则需要为用户提供一个可以与你友好互动的平台。如果文字输入是Messenger的主要方式，那么就会限制客户的沟通意愿和能动性，并迫使他们寻求你能想象到的其他方式的客户服务，又或者只是延迟回复都会让客户更加失望。想一想IVR吧，每次听完菜单选项后，你要按几下“0”。&lt;/p&gt;&lt;p&gt;商界应该采用自动和人工相结合的方式，这样才能满足Facebook用户的需求。&lt;/p&gt;&lt;p&gt;中国的微信的小程序是整合于消息互动的，这满足了开发者对聊天机器人的期待，但是这是东方的文化现象，而西方企业则应该首先利用已有的消费者行为，并且要更好地利用这样的行为数据。如果你不是“聊天机器人会取代人工服务”这一概念的拥趸，只是坚守开业之初对顾客的承诺，那么引入这样的科技就可以帮助你加强与客户间的交流。如果你能够实现现在Facebook消费者们的期望，那么随着时间的推移，你也可以增加新的功能，并将消费者往你所期待的方向引领。最终你很可能会满足他们的需求。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '1527899912', '1528941313');
INSERT INTO `ey_article_content` VALUES ('45', '71', '&lt;p&gt;数据显示，2015年，我国服务业同比增长8.3%，分别高于国内生产总值和第二产业增加值增速1.4和2.3个百分点，占国内生产总值的比重达到50.5%，首次过半，而与发达国家相比，我国服务业仍有20%-30%的发展空间。美业属于实体服务业，整个市场有上千亿的规模，但是信息化程度和零售餐饮业相比着实比较低。其中的原因就是餐饮和零售客流量大，触达人群广，而美业客流量相对小，加上从业人员素质导致信息化程度低、管理效率低。&lt;/p&gt;&lt;p&gt;美业现在的主要管理方式是纸质账本和简单的收银、结算软件，纸质管理约占行业客户的90%，功能简单只能用于管理会员卡的单机版管理软件约占9%。美业的客户与店面的粘性比较高，虽然是低频次消费，但是一旦用户选择一家店，在接收到较好服务之后很难再转向其它店，因此美业在预约管理、客户管理等需求上要高于餐饮和零售，应用的软件形态并不一定以结算收银为主，重点是CRM系统、收银、绩效考核、预约为一体的管理软件。&lt;/p&gt;&lt;p&gt;36氪近日了解的门庭管店是一款美业 SaaS 产品，主要功能有&amp;nbsp;SCRM 会员管理、智能预约、绩效工资、 营销卡券、全能收银等。门庭管店产品在客户方是微信公众号和小程序；美容师端是用于客户关系维系、工资查询和预约的移动端；前台端是 Upad，主要是收银和预约；还有一个店长用的总后台，主要是 PC 或者一体化智能机，做整体的数据管理。&lt;/p&gt;&lt;p&gt;其实管理的过程也是沉淀数据的过程，也是开发闭环和生态的过程，CEO 孟凡刚告知记者，门庭管店现在先用营销工具+SaaS 系统，切入线下美业门店，建立强关系，然后通过收银系统嵌入微信、支付宝支付，将门店的线上流水导入平台沉垫大量资金，最后在基于 SaaS 交易数据、消费行为数据进行大数据分析延伸美业产品、项目供应链。比如门庭管店最近正在做韩国的皮肤检测仪，检测完之后放在客户档案里，综合到智能管理平台，这样顾客再来的时候就可以针对个人特点进行服务。&lt;/p&gt;&lt;p&gt;美业的变革形成了两个阵营，一个阵营是大型会所，积累了很多老顾客，老顾客随着年龄的增长对养生的需求越来越强烈，一旦切入了养生，就和80、90这些互联网主力军有些脱离；还有一类是近两年新开的店，新开的店没有老会员的资源，那么如何针对80、90人群做服务就变成了主要任务 ，年轻人属于互联网使用场景人群，因此新店更容易植入 SaaS 软件。门庭管店更偏向于年轻化的店，在积累了一段时间的经验和资金之后再做老店。&lt;/p&gt;&lt;p&gt;对于没有信息化的店，前期的数据录入是最麻烦的，门庭管店会派客服帮助整理数据，时间大概是2-3天。其次就是软件使用的普及，关于这一点，门庭管店有专门的培训，包括音视频的远程培训。收费模式上分为私有云部署和公有云，公有云不过万元，之后每年有1000元维护费用。整个软件的安装大概能为门店省下一个人的成本。&lt;/p&gt;&lt;p&gt;门庭管店的客户包括克丽缇娜、丝域养发、庆熙美学、千禧鸟、自然美等。&lt;/p&gt;&lt;p&gt;行业竞品方面，美业 SaaS 提供商还包括博卡、喔噻、美约汇、美丽加、点美、美业邦等。&lt;/p&gt;&lt;p&gt;孟凡刚认为做美业 SaaS 的一个门槛就是软件研发能力，只有有比较强的研发能力才能开发出页面简洁、功能齐全、适用于管理的产品，客户与公司粘性才会提高，所以门庭管店来的想法是以做出更智能化的产品；其次一点就是销售能力，门庭管店现在采用合伙人方式，代理渠道可以发展自己的客户，目前门庭合伙人有100多个。&lt;/p&gt;&lt;p&gt;团队现在30人，一半以上为技术人员，CEO 孟凡刚曾任会友科技 CEO、随车记 CEO，有8年的互联网及移动互联网运营管理经验。公司已经完成了天使轮融资，计划进行下一轮融资。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '1527899934', '1528687227');
INSERT INTO `ey_article_content` VALUES ('46', '72', '&lt;p&gt;除了做基础技术的研究外，腾讯曾表示要通过业务驱动来推动各种应用场景的人工智能化。&lt;/p&gt;&lt;p&gt;结合腾讯的主营业务，也不难猜到未来公司要在游戏、社交、内容和平台工具型四大应用方向发力。&lt;/p&gt;&lt;p&gt;尤其是在社交领域，去年扎克伯格曾表示要推出VR版的Facebook，并展示了虚拟人物形象工具Oculus Avatars；今年7月，Facebook表示Facebook AR工作室将与美图合作，向其提供三款AR相机特效。如今，腾讯也要有所行动了。&lt;/p&gt;&lt;p&gt;7月18日晚间，人工智能初创公司ObEN宣布获得500万美元战略投资。该轮融资由腾讯领投，CMC董事长黎瑞刚及峰尚资本跟投。投融资信息平台crunchbase的数据显示，目前ObEN共完成四轮融资，总金额达到1370万美元。此前的投资人还包括S如山资本、软银韩国风险投资公司和HTC VIVE X等。&lt;/p&gt;&lt;p&gt;公开资料介绍，ObEN创办于2014年，可以通过构建个性化的虚拟声音、形象和个性来创造用户的人工智能虚拟形象，并帮助用户在新兴的数字世界中存储、管理、运营他们的虚拟形象。也就是说，ObEN可以利用人工智能工具，根据用户的照片和声音创建虚拟形象，从而让用户有不同的AR、VR社交体验。&lt;/p&gt;&lt;p&gt;以前ObEN主要帮助游戏玩家创建虚拟形象，如今公司将重点转向于帮助明星打造虚拟形象。通过该虚拟形象，明星可以与粉丝进行实时互动。未来某一天，也许粉丝还可以向明星寻求建议并得到相应的反馈。另外，这一虚拟形象不仅与明星长的非常像，而且说话的方式也是一样的。总的来说，这样一个虚拟形象总好过于一个聊天机器人。&lt;/p&gt;&lt;p&gt;据介绍，ObEN还首次融合了语音、计算视觉以及自然语言处理技术，研发了全栈式虚拟明星所需要的虚拟声音、三维形象及个性化技术。如今ObEN正在打造一个全新的商业平台。在这里，明星和粉丝可以通过个性化的人工智能在移动端、增强现实、虚拟现实以及智能设备、物联网等平台上直接互动。ObEN的个性化的人工智能产品预计将在今年晚些时候发布。&lt;/p&gt;&lt;p&gt;而最新一轮融资，将被用于加速ObEN的产品开发，并帮助推动其明星人工智能版权平台广泛应用到各类数字平台上。对于这次合作，腾讯投资的执行董事姚磊文说道，ObEN将带来由明星人工智能驱动的全新娱乐方式和内容。&lt;/p&gt;&lt;p&gt;早前，ObEN就曾表示要做“每个人的人工智能社交平台”。在这方面，公司已经先后进行过多次布局。&lt;/p&gt;&lt;p&gt;在今年3月的HTC Vive生态圈大会上，ObEN宣布与HTC Vive合作，开发了一个让用户一起VR游玩、VR“K歌”的微信小程序。在这一程序中，VR用户可以向好友发送邀请；接到邀请的好友可以上传自拍和音频，最终使用建成的形象与邀请者一起漫步海滩，或者参观景点。&lt;/p&gt;&lt;p&gt;随后的4月底，ObEN推出了一个整合有VR社交体验的微信聊天服务短片，当然用户需要戴上HTC Vive头显。在短片中，用户需要先拍一张自拍，上传到微信制作虚拟形象，然后带上HTC Vive，就可以接收微信好友发来的信息，并可以用语音直接进行回复。未来，拥有VR、AR功能的微信或许又可以收割大量亚洲用户。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;6月底，ObEN又宣布与韩国SM娱乐成立合资公司幻星有限公司（AI Stars）。据悉，ObEN要利用人工智能技术为SM娱乐旗下的知名艺人制作AI虚拟形象，而幻星有限公司正是管理这些”AI明星“的经纪公司。&lt;/p&gt;&lt;p&gt;这次腾讯领投ObEN，是否可以进一步推动公司社交业务的人工智能化。如今，各大公司不仅在忙于建立人工智能实验室，而且像Facebook这样的公司已经成立了更具象的Facebook AR实验室。另外，据说苹果很快就会推出ARKit平台。未来，腾讯是否还会成立单独的AR实验室，进一步布局社交AI业务？&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '1527899964', '1528941304');
INSERT INTO `ey_article_content` VALUES ('47', '73', '&lt;p&gt;36氪获悉，无人便利店“便利家”已获得数百万人民币天使轮投资，资方为联创永宣冯涛。&lt;/p&gt;&lt;p&gt;无人便利店风口正当时，缤果盒子、F5未来商店、深兰科技、Easy Go等一众玩家云集，亚马逊、罗森、阿里巴巴、沃尔玛等巨头亦纷纷试水。&amp;nbsp;&lt;/p&gt;&lt;p&gt;“便利家”创立于2017年3月，位于上海。便利家有微型无人便利店和中型无人便利店两款产品，和一众玩家相比，便利家的差异化在于：灵活。&amp;nbsp;&lt;/p&gt;&lt;p&gt;便利家的“微型无人便利店”，最小单位占地面积不到1平方米（0.68平方米），投放地点更加灵活，包括地铁站、写字楼、高校等，一个最小单位便利店的成本约为1.3万元（批量化生产后可能更低）。最小单位的无人便利店，可以根据人流量的分布，“拼”起来更大单位面积的便利店。低于100人，可放置一个；100人左右，可以拼两个；大于500人，可以拼四个。便利家的“中型无人便利店”，是由6个微型便利店拼起来的，同时在空间里增设桌椅，为消费者提供休憩区间，可放置在地理位置相对开阔的小区、公园等。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;技术上，便利家在每一层货架中设置了RFID，并在各个角落缝隙做了密封屏蔽，让识别率更高。流程很简单，用支付宝扫码开门，拿完即走，支付宝自动扣款（微信正在洽谈中）。未来，便利家希望在门把手上做掌纹识别，当消费者进行“拉开门”这个动作的时候，就能够进行识别。&lt;/p&gt;&lt;p&gt;概念上，便利家其实更接近于售货机，创始人范韶伟认为，便利家是对传统售货机的一个改进。一方面，传统售货机的经营品类大多以饮料和固定包装零食为主，而便利家将以符合健康趋势的“鲜食类”为主；另一方面，传统售货机的出货流程是先付款、再出货，管道的陈列方式使得空间利用率低，如果是鲜食类商品，还有可能在掉下来的过程中发生变形。而便利家为先拿货、再扣款，可以叠放、密集排列，使得空间利用率更高。“同等面积下，我们的放货率比传统售货机多一倍。”&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;便利家的选品逻辑是，根据不同的场地，选择不同的商品，比如在写字楼满足白领的早午餐需求，提供便当、三明治、沙拉等等；在高校提供零食、卤味、面包等等。比照全家的平均客单价（14元），便利家将平均客单价设定在10元左右。此外，通过小程序，消费者可以反馈自己想吃的食物，根据数据反向指导品类的选择。&lt;/p&gt;&lt;p&gt;微型、中型便利店之外，便利家还有第三个方面的业务——对于传统夫妻店的改造。线下夫妻店的特点在于大小不一、面积不一，便利家提供的无人便利店改造方案，一是夫妻店共享场地资源，进行销售分成；二是加盟方式，收益比例更高。一方面，小店店主不需要一天十几个小时守着门店，另一方面，在无人售卖之外，还可以延展其它的生意获得更多利润，比如奶茶、咖啡等。&lt;/p&gt;&lt;p&gt;“不管是无人零售还是有人零售，本质上还是零售的生意。”范韶伟说。既然是零售的生意，在网点的布局上，需要站在全局的角度，“最怕东一榔头、西一棒子。”&lt;/p&gt;&lt;p&gt;点、线、面的合理布局，才能最大程度的降低运营成本和物流成本。这其中需要考虑两个重要因素：人流量以及铺设点位的协同。便利家的思路是，在人流量密集的地方布一个中型无人便利店，再在周围100米的范围内，去布局10个微型无人便利店，形成“最小补货单元”， 1个人可以负责20台设备的补货。&lt;/p&gt;&lt;p&gt;至于RFID贴标签的成本问题，范韶伟持有乐观的态度，目前标签成本在0.5-0.6元，但随着RFID在零售市场的普及，RFID标签的价格一定会降低。&lt;/p&gt;&lt;p&gt;本轮融资后，便利家将在上海建立试运营点，中型+微型无人便利店，预期铺设20个网点。目前，便利家正在寻求Pre-A轮融资，用于扩大量产和投放运营。&lt;/p&gt;&lt;p&gt;团队方面，CEO范韶伟毕业于哈尔滨工业大学，曾任商派软件渠道部北部大区经理，是一位连续创业者。COO吴威为上海交通大学硕士，在快消品领域连续创业；CTO彭庚庚毕业于上海大学计算机工程专业，曾任腾讯OMG事业群广告平台部高级工程师。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '1527899992', '1528687258');
INSERT INTO `ey_article_content` VALUES ('48', '74', '&lt;p&gt;“内容为王”这句话在哪个时代都不会过时。随着消费升级，日益庞大的中国高端群体对高品质的生活方式与旅行体验的需求为高端出境旅游市场带来巨大市场机遇。现今的旅游产品也更向个性化、定制化、品质化靠拢，对内容创新提出更高的要求。内地的旅游内容市场仍有5-10倍的增长空间。最近36氪接触了一家做移动端旅游社区电商的团队——河马旅居指南。&lt;/p&gt;&lt;p&gt;河马旅居定位中等收入人群18-34岁的年轻群体，想通过碎片化的PGC或UGC内容培养用户粘性，由内容社区模式切入出境游市场。传统的旅游内容多是以长图文的游记形式呈现，河马旅居并不刻意强调旅游路线或整个游历过程的感受，在内容呈现上更加碎片化、个性化、移动化以及品质化，以小众或特色地点作为维度输出内容，建立内容社区，类似于旅游界的“小红书”或“什么值得买”。&lt;/p&gt;&lt;p&gt;河马旅居在部分海外旅游城市有一个4到5人的自媒体小团队定期生产PGC内容，每月更新一次内容，以优质的内容导流。目前河马的获客成本低至2-3元/人。&lt;/p&gt;&lt;p&gt;优质的内容利于培养高粘性度的用户，当累计到一定数量的优质内容生产者，达到一定的用户规模时，将由PGC内容带动UGC内容的自发产出，进而开始搭建旅游内容社区，最后完成向旅游社区电商的转型，形成交易闭环。&lt;/p&gt;&lt;p&gt;目前河马旅居的流量较为分散，微信公众号累计粉丝3万，MONO 5万，豆瓣 1万，C端获客主要来自微博、豆瓣，上周刚上线微信小程序。后期需考虑转化用户集中流量，现阶段团队正尝试跟移动WiFi租赁和签证业务团队资源置换，互相增加入口。&lt;/p&gt;&lt;p&gt;商业模式上，河马旅居打算分两步走，第一阶段，先帮助用户解决去哪里玩的问题。河马打算与当地的旅游局或航空公司合作，帮助他们做中国市场的整体营销，宣传当地旅游资源。第二阶段，解决用户怎么玩的问题。平台可通过用户的行为数据分析社区调性从而推荐相应的特色化旅游产品，例如在京都的寺院坐禅、学习茶道、参观日本酒的蒸馏厂等等。&lt;/p&gt;&lt;p&gt;此外，河马旅居也在尝试开拓知识付费的营收渠道。从体验、艺术、咖啡、酒吧、餐厅、酒店等六个维度切入，做成各旅游城市的PDF版官方性质PGC攻略。3月份售出800多本，每本单价15元。&lt;/p&gt;&lt;p&gt;河马旅居创始人余晓盼表示，河马旅居的核心竞争力还是个性化的内容表达。“传统旅游社区把内容做的太死气沉沉了。人美、景美但流水账似的内容很无趣。好的内容本身就是门槛。原创的有趣的才有生命力。”&lt;/p&gt;&lt;p&gt;内容+电商并不是一个新概念，如今传统OTA、头部电商平台以及媒体型电商都在加码内容，但要持续产出有价值的内容并非易事，需要足够规模的内容生产团队长时间的内容积累，而具有极强传播力的爆款内容更是可遇而不可求，营造内容社区所花费的精力也许正是其门槛所在。&lt;/p&gt;&lt;p&gt;河马旅居目前的管理团队为4人，内容产出团队20人。创始人余晓盼任河马主编兼运营，曾任职于私募、资管、律师事务所，为《美食侦探系列》旅行畅销书作者。团队目前正在寻求天使轮融资。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '1527900027', '1528687267');
INSERT INTO `ey_article_content` VALUES ('62', '90', '&lt;p style=&quot;white-space: normal; text-align: center;&quot;&gt;&lt;img src=&quot;/public/upload/article/2018/06/11/ca1408951acd92fab8950e5328ae92ed.jpg&quot; title=&quot;ca1408951acd92fab8950e5328ae92ed.jpg&quot; alt=&quot;ca1408951acd92fab8950e5328ae92ed.jpg&quot;/&gt;&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;公司认为客户、供应商、公司股东、公司员工等一切和自身有合作关系的单位和个人都是自己的合作伙伴，并只有通过努力为合作伙伴创造价值，才能体现自身的价值并获得发展和成功。&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;关于“诚实、宽容、创新、服务”&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;公司认为诚信是一切合作的基础，宽容是解决问题的前提，创新是发展事业的利器，服务是创造价值的根本。公司会坚持持续改进、满足顾客期望、 确保品质第一、开拓全球市场。&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;', '1528296618', '1529562812');
INSERT INTO `ey_article_content` VALUES ('63', '91', '&lt;p style=&quot;white-space: normal; text-align: center;&quot;&gt;&lt;img src=&quot;/public/upload/article/2018/06/11/fa502a5635b1e7873e480c473f56898a.jpg&quot; title=&quot;fa502a5635b1e7873e480c473f56898a.jpg&quot; alt=&quot;fa502a5635b1e7873e480c473f56898a.jpg&quot;/&gt;&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;公司认为客户、供应商、公司股东、公司员工等一切和自身有合作关系的单位和个人都是自己的合作伙伴，并只有通过努力为合作伙伴创造价值，才能体现自身的价值并获得发展和成功。&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;关于“诚实、宽容、创新、服务”&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;公司认为诚信是一切合作的基础，宽容是解决问题的前提，创新是发展事业的利器，服务是创造价值的根本。公司会坚持持续改进、满足顾客期望、 确保品质第一、开拓全球市场。&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;', '1528296656', '1529562824');
INSERT INTO `ey_article_content` VALUES ('65', '101', '&lt;p style=&quot;text-align: center;&quot;&gt;&lt;img src=&quot;/public/upload/article/2018/06/23/86e7eea9092c523432a24eb7741fc7e7.jpg&quot; title=&quot;86e7eea9092c523432a24eb7741fc7e7.jpg&quot; alt=&quot;86e7eea9092c523432a24eb7741fc7e7.jpg&quot;/&gt;&lt;/p&gt;&lt;p&gt;为客户降低采购成本和风险，为客户投资提供切实保障。 追求永续发展的目标，并把它建立在客户满意的基础上。&lt;/p&gt;', '1529736553', '1529736553');

-- -----------------------------
-- Table structure for `ey_auth_access`
-- -----------------------------
DROP TABLE IF EXISTS `ey_auth_access`;
CREATE TABLE `ey_auth_access` (
  `role_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '角色ID',
  `rule_id` int(11) NOT NULL DEFAULT '0' COMMENT '权限ID',
  KEY `role_id` (`role_id`) USING BTREE,
  KEY `rule_id` (`rule_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='权限授权表';

-- -----------------------------
-- Records of `ey_auth_access`
-- -----------------------------
INSERT INTO `ey_auth_access` VALUES ('12', '176');
INSERT INTO `ey_auth_access` VALUES ('12', '177');
INSERT INTO `ey_auth_access` VALUES ('12', '178');
INSERT INTO `ey_auth_access` VALUES ('12', '179');
INSERT INTO `ey_auth_access` VALUES ('12', '180');
INSERT INTO `ey_auth_access` VALUES ('12', '181');
INSERT INTO `ey_auth_access` VALUES ('12', '182');
INSERT INTO `ey_auth_access` VALUES ('12', '183');
INSERT INTO `ey_auth_access` VALUES ('12', '184');
INSERT INTO `ey_auth_access` VALUES ('12', '185');
INSERT INTO `ey_auth_access` VALUES ('12', '186');
INSERT INTO `ey_auth_access` VALUES ('12', '187');
INSERT INTO `ey_auth_access` VALUES ('12', '188');
INSERT INTO `ey_auth_access` VALUES ('12', '189');
INSERT INTO `ey_auth_access` VALUES ('12', '190');
INSERT INTO `ey_auth_access` VALUES ('12', '191');
INSERT INTO `ey_auth_access` VALUES ('12', '192');
INSERT INTO `ey_auth_access` VALUES ('12', '193');
INSERT INTO `ey_auth_access` VALUES ('12', '194');
INSERT INTO `ey_auth_access` VALUES ('12', '195');
INSERT INTO `ey_auth_access` VALUES ('12', '196');
INSERT INTO `ey_auth_access` VALUES ('12', '197');
INSERT INTO `ey_auth_access` VALUES ('12', '198');
INSERT INTO `ey_auth_access` VALUES ('12', '81');
INSERT INTO `ey_auth_access` VALUES ('12', '62');
INSERT INTO `ey_auth_access` VALUES ('12', '61');
INSERT INTO `ey_auth_access` VALUES ('12', '8');
INSERT INTO `ey_auth_access` VALUES ('12', '70');
INSERT INTO `ey_auth_access` VALUES ('12', '71');
INSERT INTO `ey_auth_access` VALUES ('12', '72');
INSERT INTO `ey_auth_access` VALUES ('11', '176');
INSERT INTO `ey_auth_access` VALUES ('11', '177');
INSERT INTO `ey_auth_access` VALUES ('11', '178');
INSERT INTO `ey_auth_access` VALUES ('11', '179');
INSERT INTO `ey_auth_access` VALUES ('11', '180');
INSERT INTO `ey_auth_access` VALUES ('11', '181');
INSERT INTO `ey_auth_access` VALUES ('11', '182');
INSERT INTO `ey_auth_access` VALUES ('11', '184');
INSERT INTO `ey_auth_access` VALUES ('11', '185');
INSERT INTO `ey_auth_access` VALUES ('11', '186');
INSERT INTO `ey_auth_access` VALUES ('11', '187');
INSERT INTO `ey_auth_access` VALUES ('11', '188');
INSERT INTO `ey_auth_access` VALUES ('11', '189');
INSERT INTO `ey_auth_access` VALUES ('11', '191');
INSERT INTO `ey_auth_access` VALUES ('11', '192');
INSERT INTO `ey_auth_access` VALUES ('11', '193');
INSERT INTO `ey_auth_access` VALUES ('11', '194');
INSERT INTO `ey_auth_access` VALUES ('11', '195');
INSERT INTO `ey_auth_access` VALUES ('11', '196');
INSERT INTO `ey_auth_access` VALUES ('11', '197');
INSERT INTO `ey_auth_access` VALUES ('11', '198');
INSERT INTO `ey_auth_access` VALUES ('11', '199');
INSERT INTO `ey_auth_access` VALUES ('11', '200');
INSERT INTO `ey_auth_access` VALUES ('11', '201');
INSERT INTO `ey_auth_access` VALUES ('11', '202');
INSERT INTO `ey_auth_access` VALUES ('11', '203');
INSERT INTO `ey_auth_access` VALUES ('11', '204');
INSERT INTO `ey_auth_access` VALUES ('11', '205');
INSERT INTO `ey_auth_access` VALUES ('11', '206');
INSERT INTO `ey_auth_access` VALUES ('11', '207');
INSERT INTO `ey_auth_access` VALUES ('11', '208');
INSERT INTO `ey_auth_access` VALUES ('11', '209');
INSERT INTO `ey_auth_access` VALUES ('11', '210');
INSERT INTO `ey_auth_access` VALUES ('11', '211');
INSERT INTO `ey_auth_access` VALUES ('11', '125');
INSERT INTO `ey_auth_access` VALUES ('11', '126');
INSERT INTO `ey_auth_access` VALUES ('11', '127');
INSERT INTO `ey_auth_access` VALUES ('11', '62');
INSERT INTO `ey_auth_access` VALUES ('11', '136');
INSERT INTO `ey_auth_access` VALUES ('11', '137');
INSERT INTO `ey_auth_access` VALUES ('11', '138');
INSERT INTO `ey_auth_access` VALUES ('11', '139');
INSERT INTO `ey_auth_access` VALUES ('11', '140');
INSERT INTO `ey_auth_access` VALUES ('11', '141');
INSERT INTO `ey_auth_access` VALUES ('11', '142');
INSERT INTO `ey_auth_access` VALUES ('11', '143');
INSERT INTO `ey_auth_access` VALUES ('11', '61');
INSERT INTO `ey_auth_access` VALUES ('11', '212');
INSERT INTO `ey_auth_access` VALUES ('11', '8');
INSERT INTO `ey_auth_access` VALUES ('11', '70');
INSERT INTO `ey_auth_access` VALUES ('11', '71');
INSERT INTO `ey_auth_access` VALUES ('11', '72');
INSERT INTO `ey_auth_access` VALUES ('11', '9');
INSERT INTO `ey_auth_access` VALUES ('11', '77');
INSERT INTO `ey_auth_access` VALUES ('11', '78');
INSERT INTO `ey_auth_access` VALUES ('11', '79');
INSERT INTO `ey_auth_access` VALUES ('11', '148');
INSERT INTO `ey_auth_access` VALUES ('11', '149');
INSERT INTO `ey_auth_access` VALUES ('11', '150');
INSERT INTO `ey_auth_access` VALUES ('11', '151');
INSERT INTO `ey_auth_access` VALUES ('11', '144');
INSERT INTO `ey_auth_access` VALUES ('11', '145');
INSERT INTO `ey_auth_access` VALUES ('11', '146');
INSERT INTO `ey_auth_access` VALUES ('11', '147');
INSERT INTO `ey_auth_access` VALUES ('11', '155');
INSERT INTO `ey_auth_access` VALUES ('11', '156');
INSERT INTO `ey_auth_access` VALUES ('11', '157');
INSERT INTO `ey_auth_access` VALUES ('11', '158');
INSERT INTO `ey_auth_access` VALUES ('11', '159');

-- -----------------------------
-- Table structure for `ey_auth_modular`
-- -----------------------------
DROP TABLE IF EXISTS `ey_auth_modular`;
CREATE TABLE `ey_auth_modular` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT '0' COMMENT '父级ID',
  `name` varchar(50) DEFAULT '' COMMENT '名称',
  `controller` varchar(50) DEFAULT '' COMMENT '控制器',
  `action` varchar(50) DEFAULT '' COMMENT '操作名',
  `grade` tinyint(1) DEFAULT '0' COMMENT '级别',
  `url` varchar(200) DEFAULT '' COMMENT '链接',
  `sort_order` int(11) DEFAULT '0' COMMENT '排序号',
  `is_menu` tinyint(1) DEFAULT '1' COMMENT '显示菜单(1=是，0=否)',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态(1=正常，0=屏蔽)',
  `add_time` int(11) DEFAULT '0' COMMENT '新增时间',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=515 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `ey_auth_modular`
-- -----------------------------
INSERT INTO `ey_auth_modular` VALUES ('513', '481', 'SEO优化', 'Seo', 'index', '2', '', '100', '1', '1', '1524208193', '0');
INSERT INTO `ey_auth_modular` VALUES ('9', '514', '高级选项', '', '', '1', '', '0', '1', '1', '1503301507', '1527306955');
INSERT INTO `ey_auth_modular` VALUES ('12', '514', '基本信息', 'System', 'index', '1', '', '1', '1', '1', '0', '1527306913');
INSERT INTO `ey_auth_modular` VALUES ('13', '9', '修改密码', 'Admin', 'admin_pwd', '2', '', '3', '1', '1', '1503301723', '0');
INSERT INTO `ey_auth_modular` VALUES ('14', '9', '管理员列表', 'Admin', 'index', '2', '', '0', '1', '1', '1503301765', '1527306984');
INSERT INTO `ey_auth_modular` VALUES ('15', '9', '角色列表', 'Admin', 'role', '2', '', '0', '1', '1', '1503301781', '1527307009');
INSERT INTO `ey_auth_modular` VALUES ('16', '9', '模块列表', 'Admin', 'modular', '2', '', '0', '1', '1', '1503301793', '1527307006');
INSERT INTO `ey_auth_modular` VALUES ('17', '9', '权限列表', 'Admin', 'rule', '2', '', '0', '1', '1', '1503301805', '1527307004');
INSERT INTO `ey_auth_modular` VALUES ('18', '9', '日志列表', 'Admin', 'log', '2', '', '0', '1', '1', '1503301840', '1527306999');
INSERT INTO `ey_auth_modular` VALUES ('19', '9', '数据备份', 'Tools', 'index', '2', '', '0', '1', '1', '1503301857', '1527307033');
INSERT INTO `ey_auth_modular` VALUES ('21', '9', '数据还原', 'Tools', 'restore', '2', '', '0', '1', '1', '1503302091', '1527307044');
INSERT INTO `ey_auth_modular` VALUES ('22', '9', '地区列表', 'System', 'region', '2', '', '2', '0', '1', '1505441023', '0');
INSERT INTO `ey_auth_modular` VALUES ('23', '0', '常规', '', '', '0', '', '0', '1', '1', '1503308630', '1503367345');
INSERT INTO `ey_auth_modular` VALUES ('27', '514', '调试外观', '', '', '1', '', '1', '1', '1', '0', '1527306927');
INSERT INTO `ey_auth_modular` VALUES ('28', '27', '电脑版', 'Uiset', 'pc', '2', '/index.php/home/Index/index.html?ui_set=on', '0', '1', '1', '1503368313', '1523432343');
INSERT INTO `ey_auth_modular` VALUES ('30', '27', '手机版', 'Uiset', 'mobile', '2', '', '0', '1', '1', '1503368589', '1509093563');
INSERT INTO `ey_auth_modular` VALUES ('35', '9', '清除缓存', 'System', 'clearCache', '2', '', '20', '1', '1', '1503655673', '0');
INSERT INTO `ey_auth_modular` VALUES ('41', '23', '设置栏目', 'Arctype', 'index', '1', '', '0', '1', '1', '1503999661', '1527307162');
INSERT INTO `ey_auth_modular` VALUES ('62', '9', '邮件模板', 'EmailTemplate', 'index', '2', '', '5', '1', '1', '1505204834', '1509090070');
INSERT INTO `ey_auth_modular` VALUES ('64', '9', '短信模板', 'SmsTemplate', 'index', '2', '', '4', '1', '1', '1505204889', '1509086592');
INSERT INTO `ey_auth_modular` VALUES ('470', '23', '发布文档', 'Channeltype', 'index', '1', '', '0', '1', '1', '1505726990', '1527307178');
INSERT INTO `ey_auth_modular` VALUES ('480', '481', '友情链接', 'Links', 'index', '2', '', '7', '1', '1', '1505803829', '1522996913');
INSERT INTO `ey_auth_modular` VALUES ('481', '514', '营销设置', '', '', '1', '', '0', '1', '1', '1505873468', '1527306945');
INSERT INTO `ey_auth_modular` VALUES ('482', '481', '广告列表', 'Ad', 'index', '2', '', '0', '1', '1', '1505873498', '0');
INSERT INTO `ey_auth_modular` VALUES ('483', '481', '广告位置', 'AdPosition', 'index', '2', '', '0', '1', '1', '1505873675', '0');
INSERT INTO `ey_auth_modular` VALUES ('514', '0', '设置', '', '', '0', '', '100', '1', '1', '1527306892', '0');

-- -----------------------------
-- Table structure for `ey_auth_role`
-- -----------------------------
DROP TABLE IF EXISTS `ey_auth_role`;
CREATE TABLE `ey_auth_role` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL COMMENT '角色名称',
  `pid` smallint(6) DEFAULT '0' COMMENT '父角色ID',
  `grade` tinyint(1) DEFAULT '0' COMMENT '级别',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '状态(1=正常，0=屏蔽)',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `add_time` int(11) unsigned DEFAULT '0' COMMENT '新增时间',
  `update_time` int(11) unsigned DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `parentId` (`pid`) USING BTREE,
  KEY `status` (`status`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='角色表';

-- -----------------------------
-- Records of `ey_auth_role`
-- -----------------------------
INSERT INTO `ey_auth_role` VALUES ('11', '管理员', '0', '0', '1', '', '1503625240', '1519370604');
INSERT INTO `ey_auth_role` VALUES ('12', '编辑主管', '11', '1', '1', '', '1503625339', '1519369769');

-- -----------------------------
-- Table structure for `ey_auth_role_admin`
-- -----------------------------
DROP TABLE IF EXISTS `ey_auth_role_admin`;
CREATE TABLE `ey_auth_role_admin` (
  `role_id` int(11) DEFAULT '0' COMMENT '角色 id',
  `admin_id` int(11) DEFAULT '0' COMMENT '用户id',
  KEY `role_id` (`role_id`) USING BTREE,
  KEY `admin_id` (`admin_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户角色对应表';

-- -----------------------------
-- Records of `ey_auth_role_admin`
-- -----------------------------
INSERT INTO `ey_auth_role_admin` VALUES ('-1', '1');
INSERT INTO `ey_auth_role_admin` VALUES ('11', '22');
INSERT INTO `ey_auth_role_admin` VALUES ('12', '17');
INSERT INTO `ey_auth_role_admin` VALUES ('12', '16');

-- -----------------------------
-- Table structure for `ey_auth_rule`
-- -----------------------------
DROP TABLE IF EXISTS `ey_auth_rule`;
CREATE TABLE `ey_auth_rule` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `modular_id` int(11) DEFAULT '0' COMMENT '所属模块',
  `name` varchar(50) DEFAULT '' COMMENT '权限名字',
  `right` text COMMENT '权限码(控制器+操作)',
  `remark` varchar(255) DEFAULT '' COMMENT '备注',
  `is_del` tinyint(1) DEFAULT '0' COMMENT '删除状态 1删除,0正常',
  `add_time` int(11) DEFAULT '0' COMMENT '新增时间',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  `sort_order` int(11) DEFAULT '0' COMMENT '排序号',
  `is_menu` tinyint(1) DEFAULT '1' COMMENT '是否为菜单(1=是，0=否)',
  `group` varchar(20) DEFAULT '' COMMENT '应用名称app',
  `status` tinyint(1) DEFAULT '1' COMMENT '显示(1=正常，0=屏蔽)',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=213 DEFAULT CHARSET=utf8 COMMENT='后台权限菜单表';

-- -----------------------------
-- Records of `ey_auth_rule`
-- -----------------------------
INSERT INTO `ey_auth_rule` VALUES ('6', '17', '权限列表', 'Admin@rule', '', '0', '0', '1503390907', '0', '1', 'system', '1');
INSERT INTO `ey_auth_rule` VALUES ('8', '14', '管理员列表', 'Admin@index', '', '0', '0', '1503392270', '0', '1', 'system', '1');
INSERT INTO `ey_auth_rule` VALUES ('9', '15', '角色列表', 'Admin@role', '', '0', '0', '1503392666', '0', '1', 'system', '1');
INSERT INTO `ey_auth_rule` VALUES ('38', '19', '数据备份列表', 'Tools@index', '', '0', '0', '1504515434', '0', '1', 'tools', '1');
INSERT INTO `ey_auth_rule` VALUES ('39', '21', '数据还原列表', 'Tools@restore', '', '0', '0', '1504515452', '0', '1', 'tools', '1');
INSERT INTO `ey_auth_rule` VALUES ('49', '18', '管理员日志', 'Admin@log', '', '0', '0', '1504485820', '0', '1', 'system', '1');
INSERT INTO `ey_auth_rule` VALUES ('61', '35', '清除页面缓存', 'System@clearCache,System@clearHtmlCache', '', '0', '0', '1519357846', '0', '1', 'system', '1');
INSERT INTO `ey_auth_rule` VALUES ('62', '13', '修改管理员密码', 'Admin@admin_pwd', '', '0', '0', '1504485678', '0', '1', 'system', '1');
INSERT INTO `ey_auth_rule` VALUES ('65', '17', '新增权限', 'Admin@rule_add', '', '0', '1503390930', '1503391981', '0', '1', '', '1');
INSERT INTO `ey_auth_rule` VALUES ('66', '17', '编辑权限', 'Admin@rule_edit,Index@changeTableVal', '', '0', '1503390947', '1503392474', '0', '1', '', '1');
INSERT INTO `ey_auth_rule` VALUES ('67', '17', '删除权限', 'Admin@rule_del', '', '0', '1503390965', '0', '0', '1', '', '1');
INSERT INTO `ey_auth_rule` VALUES ('70', '14', '新增管理员', 'Admin@admin_add', '', '0', '1503392290', '0', '0', '1', '', '1');
INSERT INTO `ey_auth_rule` VALUES ('71', '14', '编辑管理员', 'Admin@admin_edit,Index@changeTableVal', '', '0', '1503392302', '1517986419', '0', '1', '', '1');
INSERT INTO `ey_auth_rule` VALUES ('72', '14', '删除管理员', 'Admin@admin_del', '', '0', '1503392315', '1504578385', '0', '1', '', '1');
INSERT INTO `ey_auth_rule` VALUES ('73', '16', '模块列表', 'Admin@modular', '', '0', '1503392570', '0', '0', '1', '', '1');
INSERT INTO `ey_auth_rule` VALUES ('74', '16', '新增模块', 'Admin@modular_add', '', '0', '1503392591', '0', '0', '1', '', '1');
INSERT INTO `ey_auth_rule` VALUES ('75', '16', '编辑模块', 'Admin@modular_edit,Index@changeTableVal', '', '0', '1503392610', '0', '0', '1', '', '1');
INSERT INTO `ey_auth_rule` VALUES ('76', '16', '删除模块', 'Admin@modular_del', '', '0', '1503392626', '0', '0', '1', '', '1');
INSERT INTO `ey_auth_rule` VALUES ('77', '15', '新增角色', 'Admin@role_add', '', '0', '1503392691', '0', '0', '1', '', '1');
INSERT INTO `ey_auth_rule` VALUES ('78', '15', '编辑角色', 'Admin@role_edit,Index@changeTableVal', '', '0', '1503392718', '1517986448', '0', '1', '', '1');
INSERT INTO `ey_auth_rule` VALUES ('79', '15', '删除角色', 'Admin@role_del', '', '0', '1503392736', '0', '0', '1', '', '1');
INSERT INTO `ey_auth_rule` VALUES ('81', '12', '平台设置', 'System@index,System@handle', '', '0', '1504486050', '0', '0', '1', '', '1');
INSERT INTO `ey_auth_rule` VALUES ('117', '19', '备份数据', 'Tools@export', '', '0', '1504514716', '0', '0', '1', '', '1');
INSERT INTO `ey_auth_rule` VALUES ('118', '19', '优化数据', 'Tools@optimize', '', '0', '1504514788', '0', '0', '1', '', '1');
INSERT INTO `ey_auth_rule` VALUES ('119', '19', '修复数据', 'Tools@repair', '', '0', '1504514809', '0', '0', '1', '', '1');
INSERT INTO `ey_auth_rule` VALUES ('120', '21', '导入sql文件', 'Tools@restoreUpload', '', '0', '1504515139', '0', '0', '1', '', '1');
INSERT INTO `ey_auth_rule` VALUES ('121', '21', '恢复数据 ', 'Tools@import', '', '0', '1504515184', '0', '0', '1', '', '1');
INSERT INTO `ey_auth_rule` VALUES ('122', '21', '下载数据', 'Tools@downFile', '', '0', '1504515311', '0', '0', '1', '', '1');
INSERT INTO `ey_auth_rule` VALUES ('123', '21', '删除数据', 'Tools@del', '', '0', '1504515399', '0', '0', '1', '', '1');
INSERT INTO `ey_auth_rule` VALUES ('128', '64', '短信模板列表', 'SmsTemplate@index', '', '0', '1517987270', '0', '0', '1', '', '1');
INSERT INTO `ey_auth_rule` VALUES ('129', '64', '新增短信模板', 'SmsTemplate@add', '', '0', '1517987289', '0', '0', '1', '', '1');
INSERT INTO `ey_auth_rule` VALUES ('130', '64', '编辑短信模板', 'SmsTemplate@edit,Index@changeTableVal', '', '0', '1517987336', '0', '0', '1', '', '1');
INSERT INTO `ey_auth_rule` VALUES ('131', '64', '删除短信模板', 'SmsTemplate@del', '', '0', '1517987359', '0', '0', '1', '', '1');
INSERT INTO `ey_auth_rule` VALUES ('132', '62', '邮件模板列表', 'EmailTemplate@index', '', '0', '1517987387', '0', '0', '1', '', '1');
INSERT INTO `ey_auth_rule` VALUES ('133', '62', '新增邮件模板', 'EmailTemplate@add', '', '0', '1517994951', '0', '0', '1', '', '1');
INSERT INTO `ey_auth_rule` VALUES ('134', '62', '编辑邮件模板', 'EmailTemplate@edit,Index@changeTableVal', '', '0', '1517994976', '0', '0', '1', '', '1');
INSERT INTO `ey_auth_rule` VALUES ('135', '62', '删除邮件模板', 'EmailTemplate@del', '', '0', '1517995005', '0', '0', '1', '', '1');
INSERT INTO `ey_auth_rule` VALUES ('140', '480', '友情链接列表', 'Links@index', '', '0', '1517995297', '0', '0', '1', '', '1');
INSERT INTO `ey_auth_rule` VALUES ('141', '480', '新增友情链接', 'Links@add', '', '0', '1517995311', '0', '0', '1', '', '1');
INSERT INTO `ey_auth_rule` VALUES ('142', '480', '编辑友情链接', 'Links@edit,Index@changeTableVal', '', '0', '1517995329', '0', '0', '1', '', '1');
INSERT INTO `ey_auth_rule` VALUES ('143', '480', '删除友情链接', 'Links@del', '', '0', '1517995344', '0', '0', '1', '', '1');
INSERT INTO `ey_auth_rule` VALUES ('144', '483', '广告位列表', 'AdPosition@index', '', '0', '1517995508', '0', '0', '1', '', '1');
INSERT INTO `ey_auth_rule` VALUES ('145', '483', '新增广告位', 'AdPosition@add', '', '0', '1517995525', '0', '0', '1', '', '1');
INSERT INTO `ey_auth_rule` VALUES ('146', '483', '编辑广告位', 'AdPosition@edit,Index@changeTableVal', '', '0', '1517995544', '0', '0', '1', '', '1');
INSERT INTO `ey_auth_rule` VALUES ('147', '483', '删除广告位', 'AdPosition@del', '', '0', '1517995556', '0', '0', '1', '', '1');
INSERT INTO `ey_auth_rule` VALUES ('148', '482', '广告列表', 'Ad@index', '', '0', '1517995581', '0', '0', '1', '', '1');
INSERT INTO `ey_auth_rule` VALUES ('149', '482', '新增广告', 'Ad@add', '', '0', '1517995595', '0', '0', '1', '', '1');
INSERT INTO `ey_auth_rule` VALUES ('150', '482', '编辑广告', 'Ad@edit,Index@changeTableVal', '', '0', '1517995612', '0', '0', '1', '', '1');
INSERT INTO `ey_auth_rule` VALUES ('151', '482', '删除广告', 'Ad@del', '', '0', '1517995626', '0', '0', '1', '', '1');
INSERT INTO `ey_auth_rule` VALUES ('212', '35', '清除数据缓存', 'System@clearCache,System@clearSystemCache,System@fastClearCache', '', '0', '1519357889', '0', '0', '1', '', '1');

-- -----------------------------
-- Table structure for `ey_channelfield`
-- -----------------------------
DROP TABLE IF EXISTS `ey_channelfield`;
CREATE TABLE `ey_channelfield` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '字段名称',
  `channel_id` int(10) NOT NULL DEFAULT '0' COMMENT '所属文档模型id',
  `title` varchar(32) NOT NULL DEFAULT '' COMMENT '字段标题',
  `dtype` varchar(32) NOT NULL DEFAULT '' COMMENT '字段类型',
  `define` varchar(128) NOT NULL DEFAULT '' COMMENT '字段定义',
  `maxlength` int(10) NOT NULL DEFAULT '0' COMMENT '最大长度，文本数据必须填写，大于255为text类型',
  `dfvalue` varchar(1000) NOT NULL DEFAULT '' COMMENT '默认值',
  `dfvalue_unit` varchar(50) NOT NULL DEFAULT '' COMMENT '数值单位',
  `remark` varchar(256) NOT NULL DEFAULT '' COMMENT '提示说明',
  `ifeditable` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否在编辑页显示',
  `ifrequire` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否必填',
  `ifsystem` tinyint(1) NOT NULL DEFAULT '0' COMMENT '字段分类，1=系统(不可修改)，0=自定义',
  `ifmain` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否主表字段',
  `sort_order` int(5) NOT NULL DEFAULT '100' COMMENT '排序',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `add_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`,`channel_id`)
) ENGINE=MyISAM AUTO_INCREMENT=52 DEFAULT CHARSET=utf8 COMMENT='自定义字段表';

-- -----------------------------
-- Records of `ey_channelfield`
-- -----------------------------
INSERT INTO `ey_channelfield` VALUES ('1', 'add_time', '0', '新增时间', 'datetime', 'int(11)', '250', '', '', '', '1', '0', '1', '1', '100', '1', '1533091575', '1533091575');
INSERT INTO `ey_channelfield` VALUES ('2', 'update_time', '0', '更新时间', 'datetime', 'int(11)', '250', '', '', '', '1', '0', '1', '1', '100', '1', '1533091601', '1533091601');
INSERT INTO `ey_channelfield` VALUES ('3', 'aid', '0', '文档ID', 'int', 'int(11)', '250', '', '', '', '1', '0', '1', '1', '100', '1', '1533091624', '1533091624');
INSERT INTO `ey_channelfield` VALUES ('4', 'typeid', '0', '当前栏目ID', 'int', 'int(11)', '250', '', '', '', '1', '0', '1', '1', '100', '1', '1533091930', '1533091930');
INSERT INTO `ey_channelfield` VALUES ('5', 'channel', '0', '模型ID', 'int', 'int(11)', '250', '', '', '', '1', '0', '1', '1', '100', '1', '1533092214', '1533092214');
INSERT INTO `ey_channelfield` VALUES ('6', 'is_b', '0', '是否加粗', 'switch', 'tinyint(1)', '250', '', '', '', '1', '0', '1', '1', '100', '1', '1533092246', '1533092246');
INSERT INTO `ey_channelfield` VALUES ('7', 'title', '0', '文档标题', 'text', 'varchar(250)', '250', '', '', '', '1', '0', '1', '1', '100', '1', '1533092381', '1533092381');
INSERT INTO `ey_channelfield` VALUES ('8', 'litpic', '0', '封面图', 'img', 'varchar(250)', '250', '', '', '', '1', '0', '1', '1', '100', '1', '1533092398', '1533092398');
INSERT INTO `ey_channelfield` VALUES ('9', 'is_head', '0', '是否头条', 'switch', 'tinyint(1)', '250', '', '', '', '1', '0', '1', '1', '100', '1', '1533092420', '1533092420');
INSERT INTO `ey_channelfield` VALUES ('10', 'is_special', '0', '是否特荐', 'switch', 'tinyint(1)', '250', '', '', '', '1', '0', '1', '1', '100', '1', '1533092439', '1533092439');
INSERT INTO `ey_channelfield` VALUES ('11', 'is_top', '0', '是否置顶', 'switch', 'tinyint(1)', '250', '', '', '', '1', '0', '1', '1', '100', '1', '1533092454', '1533092454');
INSERT INTO `ey_channelfield` VALUES ('12', 'is_recom', '0', '是否推荐', 'switch', 'tinyint(1)', '250', '', '', '', '1', '0', '1', '1', '100', '1', '1533092468', '1533092468');
INSERT INTO `ey_channelfield` VALUES ('13', 'is_jump', '0', '是否跳转', 'switch', 'tinyint(1)', '250', '', '', '', '1', '0', '1', '1', '100', '1', '1533092484', '1533092484');
INSERT INTO `ey_channelfield` VALUES ('14', 'author', '0', '编辑者', 'text', 'varchar(250)', '250', '', '', '', '1', '0', '1', '1', '100', '1', '1533092498', '1533092498');
INSERT INTO `ey_channelfield` VALUES ('15', 'click', '0', '浏览量', 'int', 'int(11)', '250', '', '', '', '1', '0', '1', '1', '100', '1', '1533092512', '1533092512');
INSERT INTO `ey_channelfield` VALUES ('16', 'arcrank', '0', '阅读权限', 'select', 'tinyint(1)', '250', '', '', '', '1', '0', '1', '1', '100', '1', '1533092534', '1533092534');
INSERT INTO `ey_channelfield` VALUES ('17', 'jumplinks', '0', '跳转链接', 'text', 'varchar(250)', '250', '', '', '', '1', '0', '1', '1', '100', '1', '1533092553', '1533092553');
INSERT INTO `ey_channelfield` VALUES ('18', 'ismake', '0', '是否静态页面', 'switch', 'tinyint(1)', '250', '', '', '', '1', '0', '1', '1', '100', '1', '1533092698', '1533092698');
INSERT INTO `ey_channelfield` VALUES ('19', 'seo_title', '0', 'SEO标题', 'text', 'varchar(250)', '250', '', '', '', '1', '0', '1', '1', '100', '1', '1533092713', '1533092713');
INSERT INTO `ey_channelfield` VALUES ('20', 'seo_keywords', '0', 'SEO关键词', 'text', 'varchar(250)', '250', '', '', '', '1', '0', '1', '1', '100', '1', '1533092725', '1533092725');
INSERT INTO `ey_channelfield` VALUES ('21', 'seo_description', '0', 'SEO描述', 'text', 'varchar(250)', '250', '', '', '', '1', '0', '1', '1', '100', '1', '1533092739', '1533092739');
INSERT INTO `ey_channelfield` VALUES ('22', 'status', '0', '状态', 'switch', 'tinyint(1)', '250', '', '', '', '1', '0', '1', '1', '100', '1', '1533092753', '1533092753');
INSERT INTO `ey_channelfield` VALUES ('23', 'sort_order', '0', '排序号', 'int', 'int(11)', '250', '', '', '', '1', '0', '1', '1', '100', '1', '1533092766', '1533092766');
INSERT INTO `ey_channelfield` VALUES ('24', 'content', '2', '内容', 'htmltext', 'longtext', '250', '', '', '', '1', '0', '1', '0', '100', '1', '1533359739', '1533359739');
INSERT INTO `ey_channelfield` VALUES ('25', 'content', '3', '内容详情', 'htmltext', 'longtext', '250', '', '', '', '1', '0', '1', '0', '100', '1', '1533359588', '1533359588');
INSERT INTO `ey_channelfield` VALUES ('26', 'content', '4', '内容详情', 'htmltext', 'longtext', '250', '', '', '', '1', '0', '1', '0', '100', '1', '1533359752', '1533359752');
INSERT INTO `ey_channelfield` VALUES ('27', 'content', '6', '内容详情', 'htmltext', 'longtext', '250', '', '', '', '1', '0', '1', '0', '100', '1', '1533464715', '1533464715');
INSERT INTO `ey_channelfield` VALUES ('29', 'content', '1', '内容详情', 'htmltext', 'longtext', '250', '', '', '', '1', '0', '1', '0', '100', '1', '1533464713', '1533464713');
INSERT INTO `ey_channelfield` VALUES ('30', 'update_time', '-99', '更新时间', 'datetime', 'int(11)', '11', '0', '', '', '1', '0', '1', '1', '100', '1', '1533524780', '1533524780');
INSERT INTO `ey_channelfield` VALUES ('31', 'add_time', '-99', '新增时间', 'datetime', 'int(11)', '11', '0', '', '', '1', '0', '1', '1', '100', '1', '1533524780', '1533524780');
INSERT INTO `ey_channelfield` VALUES ('32', 'status', '-99', '启用 (1=正常，0=屏蔽)', 'switch', 'tinyint(1)', '1', '1', '', '', '1', '0', '1', '1', '100', '1', '1533524780', '1533524780');
INSERT INTO `ey_channelfield` VALUES ('33', 'is_part', '-99', '栏目属性：0=内容栏目，1=外部链接', 'switch', 'tinyint(1)', '1', '0', '', '', '1', '0', '1', '1', '100', '1', '1533524780', '1533524780');
INSERT INTO `ey_channelfield` VALUES ('34', 'is_hidden', '-99', '是否隐藏栏目：0=显示，1=隐藏', 'switch', 'tinyint(1)', '1', '0', '', '', '1', '0', '1', '1', '100', '1', '1533524780', '1533524780');
INSERT INTO `ey_channelfield` VALUES ('35', 'sort_order', '-99', '排序号', 'int', 'int(10)', '10', '0', '', '', '1', '0', '1', '1', '100', '1', '1533524780', '1533524780');
INSERT INTO `ey_channelfield` VALUES ('36', 'seo_description', '-99', 'seo描述', 'multitext', 'text', '0', '', '', '', '1', '0', '1', '1', '100', '1', '1533524780', '1533524780');
INSERT INTO `ey_channelfield` VALUES ('37', 'seo_keywords', '-99', 'seo关键字', 'text', 'varchar(200)', '200', '', '', '', '1', '0', '1', '1', '100', '1', '1533524780', '1533524780');
INSERT INTO `ey_channelfield` VALUES ('38', 'seo_title', '-99', 'SEO标题', 'text', 'varchar(200)', '200', '', '', '', '1', '0', '1', '1', '100', '1', '1533524780', '1533524780');
INSERT INTO `ey_channelfield` VALUES ('39', 'tempview', '-99', '文档模板文件名', 'text', 'varchar(200)', '200', '', '', '', '1', '0', '1', '1', '100', '1', '1533524780', '1533524780');
INSERT INTO `ey_channelfield` VALUES ('40', 'templist', '-99', '列表模板文件名', 'text', 'varchar(200)', '200', '', '', '', '1', '0', '1', '1', '100', '1', '1533524780', '1533524780');
INSERT INTO `ey_channelfield` VALUES ('41', 'litpic', '-99', '栏目图片', 'img', 'varchar(250)', '250', '', '', '', '1', '0', '1', '1', '100', '1', '1533524780', '1533524780');
INSERT INTO `ey_channelfield` VALUES ('42', 'typelink', '-99', '栏目链接', 'text', 'varchar(200)', '200', '', '', '', '1', '0', '1', '1', '100', '1', '1533524780', '1533524780');
INSERT INTO `ey_channelfield` VALUES ('43', 'grade', '-99', '栏目等级', 'switch', 'tinyint(1)', '1', '0', '', '', '1', '0', '1', '1', '100', '1', '1533524780', '1533524780');
INSERT INTO `ey_channelfield` VALUES ('44', 'englist_name', '-99', '栏目英文名', 'text', 'varchar(200)', '200', '', '', '', '1', '0', '1', '1', '100', '1', '1533524780', '1533524780');
INSERT INTO `ey_channelfield` VALUES ('45', 'dirpath', '-99', '目录存放HTML路径', 'text', 'varchar(200)', '200', '', '', '', '1', '0', '1', '1', '100', '1', '1533524780', '1533524780');
INSERT INTO `ey_channelfield` VALUES ('46', 'dirname', '-99', '目录英文名', 'text', 'varchar(200)', '200', '', '', '', '1', '0', '1', '1', '100', '1', '1533524780', '1533524780');
INSERT INTO `ey_channelfield` VALUES ('47', 'typename', '-99', '栏目名称', 'text', 'varchar(200)', '200', '', '', '', '1', '0', '1', '1', '100', '1', '1533524780', '1533524780');
INSERT INTO `ey_channelfield` VALUES ('48', 'parent_id', '-99', '栏目上级ID', 'int', 'int(10)', '10', '0', '', '', '1', '0', '1', '1', '100', '1', '1533524780', '1533524780');
INSERT INTO `ey_channelfield` VALUES ('49', 'current_channel', '-99', '栏目当前模型ID', 'int', 'int(10)', '10', '0', '', '', '1', '0', '1', '1', '100', '1', '1533524780', '1533524780');
INSERT INTO `ey_channelfield` VALUES ('50', 'channeltype', '-99', '栏目顶级模型ID', 'int', 'int(10)', '10', '0', '', '', '1', '0', '1', '1', '100', '1', '1533524780', '1533524780');
INSERT INTO `ey_channelfield` VALUES ('51', 'id', '-99', '栏目ID', 'int', 'int(10)', '10', '', '', '', '1', '0', '1', '1', '100', '1', '1533524780', '1533524780');

-- -----------------------------
-- Table structure for `ey_channeltype`
-- -----------------------------
DROP TABLE IF EXISTS `ey_channeltype`;
CREATE TABLE `ey_channeltype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nid` varchar(50) NOT NULL DEFAULT '' COMMENT '识别id',
  `title` varchar(30) DEFAULT '' COMMENT '名称',
  `ntitle` varchar(30) DEFAULT '' COMMENT '左侧菜单名称',
  `table` varchar(50) DEFAULT '' COMMENT '表名',
  `ctl_name` varchar(50) DEFAULT '' COMMENT '控制器名称（区分大小写）',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态(1=启用，0=屏蔽)',
  `sort_order` smallint(6) DEFAULT '50' COMMENT '排序',
  `add_time` int(11) DEFAULT '0' COMMENT '新增时间',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idention` (`nid`) USING BTREE,
  UNIQUE KEY `ctl_name` (`ctl_name`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `ey_channeltype`
-- -----------------------------
INSERT INTO `ey_channeltype` VALUES ('1', 'article', '文章模型', '文章', 'article', 'Article', '1', '1', '0', '1535613273');
INSERT INTO `ey_channeltype` VALUES ('4', 'download', '下载模型', '下载', 'download', 'Download', '0', '4', '0', '1535613273');
INSERT INTO `ey_channeltype` VALUES ('2', 'product', '产品模型', '产品', 'product', 'Product', '0', '2', '0', '1535613273');
INSERT INTO `ey_channeltype` VALUES ('8', 'guestbook', '留言模型', '留言', 'guestbook', 'Guestbook', '1', '8', '1509197711', '1535613273');
INSERT INTO `ey_channeltype` VALUES ('6', 'single', '单页模型', '单页', 'single', 'Single', '1', '6', '1523091961', '1535613273');
INSERT INTO `ey_channeltype` VALUES ('3', 'images', '图集模型', '图集', 'images', 'Images', '0', '3', '1523929121', '1535613273');

-- -----------------------------
-- Table structure for `ey_config`
-- -----------------------------
DROP TABLE IF EXISTS `ey_config`;
CREATE TABLE `ey_config` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT COMMENT '表id',
  `name` varchar(50) DEFAULT '' COMMENT '配置的key键名',
  `value` varchar(512) DEFAULT '' COMMENT '配置的val值',
  `inc_type` varchar(64) DEFAULT '' COMMENT '配置分组',
  `desc` varchar(50) DEFAULT '' COMMENT '描述',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=479 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `ey_config`
-- -----------------------------
INSERT INTO `ey_config` VALUES ('16', 'is_mark', '0', 'water', '');
INSERT INTO `ey_config` VALUES ('17', 'mark_txt', '易优Cms', 'water', '');
INSERT INTO `ey_config` VALUES ('18', 'mark_img', '/public/upload/water/2018/05/08/93806077e5a4c4e12ceed30df5cde761.png', 'water', '');
INSERT INTO `ey_config` VALUES ('19', 'mark_width', '200', 'water', '');
INSERT INTO `ey_config` VALUES ('20', 'mark_height', '50', 'water', '');
INSERT INTO `ey_config` VALUES ('21', 'mark_degree', '54', 'water', '');
INSERT INTO `ey_config` VALUES ('22', 'mark_quality', '56', 'water', '');
INSERT INTO `ey_config` VALUES ('23', 'mark_sel', '9', 'water', '');
INSERT INTO `ey_config` VALUES ('28', 'sms_time_out', '120', 'sms', '');
INSERT INTO `ey_config` VALUES ('183', 'theme_style', '1', 'basic', '');
INSERT INTO `ey_config` VALUES ('184', 'file_size', '500', 'basic', '');
INSERT INTO `ey_config` VALUES ('185', 'image_type', 'jpg|gif|png|bmp|jpeg|ico', 'basic', '');
INSERT INTO `ey_config` VALUES ('186', 'file_type', 'zip|gz|rar|iso|doc|xsl|ppt|wps', 'basic', '');
INSERT INTO `ey_config` VALUES ('187', 'media_type', 'swf|mpg|mp3|rm|rmvb|wmv|wma|wav|mid|mov|mp4', 'basic', '');
INSERT INTO `ey_config` VALUES ('188', 'web_keywords', '文化传媒策划演出网站模板 - Powered by EyouCms', 'web', '');
INSERT INTO `ey_config` VALUES ('451', 'web_status_pc', '0', 'web', '');
INSERT INTO `ey_config` VALUES ('346', 'sms_platform', '1', 'sms', '');
INSERT INTO `ey_config` VALUES ('351', 'seo_viewtitle_format', '2', 'seo', '');
INSERT INTO `ey_config` VALUES ('60', 'smtp_server', 'smtp.qq.com', 'smtp', '');
INSERT INTO `ey_config` VALUES ('61', 'smtp_port', '465', 'smtp', '');
INSERT INTO `ey_config` VALUES ('62', 'smtp_user', 'xxxxxxxxx@qq.com', 'smtp', '');
INSERT INTO `ey_config` VALUES ('63', 'smtp_pwd', 'xxxxxxxxxxx', 'smtp', '');
INSERT INTO `ey_config` VALUES ('92', 'inc_type', 'smtp', 'smtp', '');
INSERT INTO `ey_config` VALUES ('101', 'mark_type', 'img', 'water', '');
INSERT INTO `ey_config` VALUES ('102', 'mark_txt_size', '30', 'water', '');
INSERT INTO `ey_config` VALUES ('103', 'mark_txt_color', '#000000', 'water', '');
INSERT INTO `ey_config` VALUES ('340', 'oss_switch', '0', 'oss', '');
INSERT INTO `ey_config` VALUES ('164', 'web_name', '易优Cms', 'web', '');
INSERT INTO `ey_config` VALUES ('165', 'web_logo', '/public/upload/system/2018/06/23/e2c951468b570538ccdf9f79109dffb0.png', 'web', '');
INSERT INTO `ey_config` VALUES ('166', 'web_ico', '/favicon.ico', 'web', '');
INSERT INTO `ey_config` VALUES ('167', 'web_basehost', 'http://127.0.0.15', 'web', '');
INSERT INTO `ey_config` VALUES ('169', 'web_description', '', 'web', '');
INSERT INTO `ey_config` VALUES ('478', 'web_recordnum', '粤IP**********', 'web', '');
INSERT INTO `ey_config` VALUES ('170', 'web_copyright', 'Copyright © 2002-2017 EYOUCMS. 易优CMS 版权所有', 'web', '');
INSERT INTO `ey_config` VALUES ('171', 'web_thirdcode_pc', '', 'web', '');
INSERT INTO `ey_config` VALUES ('172', 'web_thirdcode_wap', '', 'web', '');
INSERT INTO `ey_config` VALUES ('178', 'web_address', '海南省海口市', 'web', '');
INSERT INTO `ey_config` VALUES ('179', 'web_contact', '0898-66969005', 'web', '');
INSERT INTO `ey_config` VALUES ('318', 'web_qq', '970003436', 'web', '');
INSERT INTO `ey_config` VALUES ('319', 'seo_arcdir', '/html', 'seo', '');
INSERT INTO `ey_config` VALUES ('320', 'seo_pseudo', '1', 'seo', '');
INSERT INTO `ey_config` VALUES ('321', 'list_symbol', '&gt;', 'basic', '');
INSERT INTO `ey_config` VALUES ('332', 'sitemap_auto', '1', 'sitemap', '');
INSERT INTO `ey_config` VALUES ('333', 'sitemap_not1', '0', 'sitemap', '');
INSERT INTO `ey_config` VALUES ('334', 'sitemap_not2', '1', 'sitemap', '');
INSERT INTO `ey_config` VALUES ('335', 'sitemap_xml', '1', 'sitemap', '');
INSERT INTO `ey_config` VALUES ('336', 'sitemap_txt', '0', 'sitemap', '');
INSERT INTO `ey_config` VALUES ('337', 'sitemap_zzbaidutoken', '', 'sitemap', '');
INSERT INTO `ey_config` VALUES ('338', 'seo_expires_in', '7200', 'seo', '');
INSERT INTO `ey_config` VALUES ('229', 'web_name', '易优Cms', 'web', '');
INSERT INTO `ey_config` VALUES ('292', 'web_logo', '/public/upload/system/2018/06/23/e2c951468b570538ccdf9f79109dffb0.png', 'web', '');
INSERT INTO `ey_config` VALUES ('293', 'web_ico', '/favicon.ico', 'web', '');
INSERT INTO `ey_config` VALUES ('297', 'web_copyright', 'Copyright © 2002-2017 EYOUCMS. 易优CMS 版权所有', 'web', '');
INSERT INTO `ey_config` VALUES ('244', 'web_name', '易优Cms', 'web', '');
INSERT INTO `ey_config` VALUES ('317', 'web_qrcode', '/public/upload/system/2018/04/20/08505c268a1345a54873380dc0be23b4.jpg', 'web', '');
INSERT INTO `ey_config` VALUES ('307', 'web_title', '易优CMS', 'web', '');
INSERT INTO `ey_config` VALUES ('314', 'smtp_test_eamil', 'xxxxxxxx@qq.com', 'smtp', '');
INSERT INTO `ey_config` VALUES ('374', 'web_authortoken', '6e27af8a47788c33317c98fd9b0d8e03', 'web', '');
INSERT INTO `ey_config` VALUES ('368', 'web_attr_3', '1234567890', 'web', '');
INSERT INTO `ey_config` VALUES ('367', 'web_attr_2', '400-123-4657', 'web', '');
INSERT INTO `ey_config` VALUES ('371', 'web_attr_4', '/public/upload/system/2018/06/21/e93316694b679f7b9186050f3acda88e.jpg', 'web', '');
INSERT INTO `ey_config` VALUES ('375', 'seo_inlet', '1', 'seo', '');
INSERT INTO `ey_config` VALUES ('380', 'web_cmspath', '', 'web', '');
INSERT INTO `ey_config` VALUES ('381', 'web_sqldatapath', '/data/sqldata', 'web', '');
INSERT INTO `ey_config` VALUES ('445', 'web_cmsurl', '', 'web', '');
INSERT INTO `ey_config` VALUES ('446', 'web_templets_dir', '/template', 'web', '');
INSERT INTO `ey_config` VALUES ('447', 'web_templeturl', '/template', 'web', '');
INSERT INTO `ey_config` VALUES ('448', 'web_templets_pc', '/template/pc', 'web', '');
INSERT INTO `ey_config` VALUES ('449', 'web_templets_m', '/template/mobile', 'web', '');
INSERT INTO `ey_config` VALUES ('450', 'web_eyoucms', 'http://www.eyoucms.com', 'web', '');
INSERT INTO `ey_config` VALUES ('452', 'web_status_m', '0', 'web', '');
INSERT INTO `ey_config` VALUES ('453', 'web_attr_48', '', 'web', '');
INSERT INTO `ey_config` VALUES ('454', 'web_attr_49', '', 'web', '');
INSERT INTO `ey_config` VALUES ('455', 'web_attr_50', '', 'web', '');
INSERT INTO `ey_config` VALUES ('456', 'web_attr_53', '', 'web', '');
INSERT INTO `ey_config` VALUES ('458', 'web_attr_55', 'admin@eyoucms.com', 'web', '');
INSERT INTO `ey_config` VALUES ('459', 'web_attr_56', '广东省广州市天河区88号', 'web', '');
INSERT INTO `ey_config` VALUES ('460', 'web_attr_57', '+86-123-4567', 'web', '');
INSERT INTO `ey_config` VALUES ('462', 'web_attr_59', '/public/upload/system/2018/06/23/540f59f03205936888ce27de410f7482.png', 'web', '');
INSERT INTO `ey_config` VALUES ('463', 'web_attr_60', '13800000000', 'web', '');
INSERT INTO `ey_config` VALUES ('464', 'web_status', '0', 'web', '');
INSERT INTO `ey_config` VALUES ('468', 'web_attr_64', '诚信为本，市场在变，诚信永远不变...', 'web', '');
INSERT INTO `ey_config` VALUES ('472', '_cmscopyright', 'HAkhGSiaogxg1qdf9Mxa8iFy', 'php', '');
INSERT INTO `ey_config` VALUES ('473', '_cmscopyright', 'HAkhGSiaogxg1qdf9Mxa8iFy', 'php', '');
INSERT INTO `ey_config` VALUES ('477', 'seo_liststitle_format', '2', 'seo', '');

-- -----------------------------
-- Table structure for `ey_config_attribute`
-- -----------------------------
DROP TABLE IF EXISTS `ey_config_attribute`;
CREATE TABLE `ey_config_attribute` (
  `attr_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '表单id',
  `inc_type` varchar(20) DEFAULT '' COMMENT '变量分组',
  `attr_name` varchar(60) DEFAULT '' COMMENT '变量标题',
  `attr_var_name` varchar(50) DEFAULT '' COMMENT '变量名',
  `attr_input_type` tinyint(1) unsigned DEFAULT '0' COMMENT ' 0=文本框，1=下拉框，2=多行文本框，3=上传图片',
  `add_time` int(11) DEFAULT '0' COMMENT '新增时间',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`attr_id`),
  KEY `attr_prefix` (`inc_type`,`attr_var_name`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=71 DEFAULT CHARSET=utf8 COMMENT='留言表单属性';

-- -----------------------------
-- Records of `ey_config_attribute`
-- -----------------------------
INSERT INTO `ey_config_attribute` VALUES ('2', 'web', '固话', 'web_attr_2', '0', '1525962600', '1527897967');
INSERT INTO `ey_config_attribute` VALUES ('3', 'web', 'QQ号码', 'web_attr_3', '0', '1525962624', '1525962624');
INSERT INTO `ey_config_attribute` VALUES ('4', 'web', '微信二维码', 'web_attr_4', '3', '1525999090', '1526008783');
INSERT INTO `ey_config_attribute` VALUES ('55', 'web', '电子邮箱', 'web_attr_55', '0', '1527648863', '1527648863');
INSERT INTO `ey_config_attribute` VALUES ('56', 'web', '地址', 'web_attr_56', '0', '1527648895', '1527648895');
INSERT INTO `ey_config_attribute` VALUES ('57', 'web', '传真', 'web_attr_57', '0', '1527649404', '1527649404');
INSERT INTO `ey_config_attribute` VALUES ('59', 'web', '网站手机端Logo', 'web_attr_59', '3', '1527667768', '1527667768');
INSERT INTO `ey_config_attribute` VALUES ('60', 'web', '手机', 'web_attr_60', '0', '1527670161', '1527670161');
INSERT INTO `ey_config_attribute` VALUES ('64', 'web', '网站公告', 'web_attr_64', '0', '1527890183', '1528182391');

-- -----------------------------
-- Table structure for `ey_download_content`
-- -----------------------------
DROP TABLE IF EXISTS `ey_download_content`;
CREATE TABLE `ey_download_content` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `aid` int(10) DEFAULT '0' COMMENT '文档ID',
  `content` longtext COMMENT '内容详情',
  `add_time` int(11) DEFAULT '0' COMMENT '新增时间',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `news_id` (`aid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='资讯内容表_存储正常内容';


-- -----------------------------
-- Table structure for `ey_download_file`
-- -----------------------------
DROP TABLE IF EXISTS `ey_download_file`;
CREATE TABLE `ey_download_file` (
  `file_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `aid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '产品ID',
  `title` varchar(200) DEFAULT '' COMMENT '产品标题',
  `file_url` varchar(255) DEFAULT '' COMMENT '文件存储路径',
  `file_size` varchar(255) DEFAULT '' COMMENT '文件大小',
  `file_ext` varchar(50) DEFAULT '' COMMENT '文件后缀名',
  `file_name` varchar(200) DEFAULT '' COMMENT '文件名',
  `file_mime` varchar(200) DEFAULT '' COMMENT '文件类型',
  `uhash` varchar(200) DEFAULT '' COMMENT '自定义的一种加密方式，用于文件下载权限验证',
  `md5file` varchar(200) DEFAULT '' COMMENT 'md5_file加密，可以检测上传/下载的文件包是否损坏',
  `sort_order` smallint(5) DEFAULT '0' COMMENT '排序',
  `add_time` int(10) unsigned DEFAULT '0' COMMENT '上传时间',
  PRIMARY KEY (`file_id`),
  KEY `arcid` (`aid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;


-- -----------------------------
-- Table structure for `ey_email_template`
-- -----------------------------
DROP TABLE IF EXISTS `ey_email_template`;
CREATE TABLE `ey_email_template` (
  `tpl_id` mediumint(8) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `tpl_title` varchar(100) DEFAULT '' COMMENT '邮件标题',
  `tpl_content` text COMMENT '发送邮件内容',
  `send_scene` varchar(100) DEFAULT '' COMMENT '邮件发送场景',
  `add_time` int(11) DEFAULT NULL COMMENT '添加时间',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`tpl_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `ey_email_template`
-- -----------------------------
INSERT INTO `ey_email_template` VALUES ('1', '您有新的邮件，请注意查收！', '<p>亲爱的会员：</p><p>${content}</p>', '1', '1509268284', '1509281095');

-- -----------------------------
-- Table structure for `ey_field_type`
-- -----------------------------
DROP TABLE IF EXISTS `ey_field_type`;
CREATE TABLE `ey_field_type` (
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '字段类型',
  `title` varchar(64) NOT NULL DEFAULT '' COMMENT '中文类型名',
  `ifoption` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否需要设置选项',
  `sort_order` int(10) NOT NULL DEFAULT '0' COMMENT '排序',
  `add_time` int(11) NOT NULL DEFAULT '0' COMMENT '新增时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`name`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='字段类型表';

-- -----------------------------
-- Records of `ey_field_type`
-- -----------------------------
INSERT INTO `ey_field_type` VALUES ('text', '单行文本', '0', '1', '1532485708', '1532485708');
INSERT INTO `ey_field_type` VALUES ('checkbox', '多选项', '1', '5', '1532485708', '1532485708');
INSERT INTO `ey_field_type` VALUES ('multitext', '多行文本', '0', '2', '1532485708', '1532485708');
INSERT INTO `ey_field_type` VALUES ('radio', '单选项', '1', '4', '1532485708', '1532485708');
INSERT INTO `ey_field_type` VALUES ('switch', '开关', '0', '13', '1532485708', '1532485708');
INSERT INTO `ey_field_type` VALUES ('select', '下拉框', '1', '6', '1532485708', '1532485708');
INSERT INTO `ey_field_type` VALUES ('img', '单张图', '0', '10', '1532485708', '1532485708');
INSERT INTO `ey_field_type` VALUES ('int', '整数类型', '0', '7', '1532485708', '1532485708');
INSERT INTO `ey_field_type` VALUES ('datetime', '日期和时间', '0', '12', '1532485708', '1532485708');
INSERT INTO `ey_field_type` VALUES ('htmltext', 'HTML文本', '0', '3', '1532485708', '1532485708');
INSERT INTO `ey_field_type` VALUES ('imgs', '多张图', '0', '11', '1532485708', '1532485708');
INSERT INTO `ey_field_type` VALUES ('decimal', '金额类型', '0', '9', '1532485708', '1532485708');
INSERT INTO `ey_field_type` VALUES ('float', '小数类型', '0', '8', '1532485708', '1532485708');

-- -----------------------------
-- Table structure for `ey_guestbook`
-- -----------------------------
DROP TABLE IF EXISTS `ey_guestbook`;
CREATE TABLE `ey_guestbook` (
  `aid` int(11) NOT NULL AUTO_INCREMENT,
  `typeid` int(11) DEFAULT '0' COMMENT '栏目ID',
  `channel` smallint(5) DEFAULT '0' COMMENT '模型ID',
  `ip` varchar(255) DEFAULT '' COMMENT 'ip地址',
  `add_time` int(11) DEFAULT '0' COMMENT '新增时间',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`aid`)
) ENGINE=MyISAM AUTO_INCREMENT=60 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `ey_guestbook`
-- -----------------------------
INSERT INTO `ey_guestbook` VALUES ('59', '53', '8', '127.0.0.1', '1529740657', '1529740657');

-- -----------------------------
-- Table structure for `ey_guestbook_attr`
-- -----------------------------
DROP TABLE IF EXISTS `ey_guestbook_attr`;
CREATE TABLE `ey_guestbook_attr` (
  `guest_attr_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '留言表单id自增',
  `aid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '留言id',
  `attr_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '表单id',
  `attr_value` text COMMENT '表单值',
  `add_time` int(11) DEFAULT '0' COMMENT '新增时间',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`guest_attr_id`),
  KEY `attr_id` (`attr_id`) USING BTREE,
  KEY `guest_id` (`aid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=153 DEFAULT CHARSET=utf8 COMMENT='留言表单属性值';

-- -----------------------------
-- Records of `ey_guestbook_attr`
-- -----------------------------
INSERT INTO `ey_guestbook_attr` VALUES ('149', '59', '14', '张生', '1529740657', '1529740657');
INSERT INTO `ey_guestbook_attr` VALUES ('150', '59', '15', '13800000000', '1529740657', '1529740657');
INSERT INTO `ey_guestbook_attr` VALUES ('151', '59', '16', 'admin@eyoucms.com', '1529740657', '1529740657');
INSERT INTO `ey_guestbook_attr` VALUES ('152', '59', '17', '测试', '1529740657', '1529740657');

-- -----------------------------
-- Table structure for `ey_guestbook_attribute`
-- -----------------------------
DROP TABLE IF EXISTS `ey_guestbook_attribute`;
CREATE TABLE `ey_guestbook_attribute` (
  `attr_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '表单id',
  `attr_name` varchar(60) DEFAULT '' COMMENT '表单名称',
  `typeid` int(11) unsigned DEFAULT '0' COMMENT '栏目ID',
  `attr_input_type` tinyint(1) unsigned DEFAULT '0' COMMENT ' 0=文本框，1=下拉框，2=多行文本框',
  `attr_values` text COMMENT '可选值列表',
  `sort_order` int(11) unsigned DEFAULT '0' COMMENT '表单排序',
  `add_time` int(11) DEFAULT '0' COMMENT '新增时间',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`attr_id`),
  KEY `guest_id` (`typeid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='留言表单属性';

-- -----------------------------
-- Records of `ey_guestbook_attribute`
-- -----------------------------
INSERT INTO `ey_guestbook_attribute` VALUES ('1', '姓名', '30', '0', '', '100', '1526616441', '1526616441');
INSERT INTO `ey_guestbook_attribute` VALUES ('2', '手机号码', '30', '0', '', '100', '1526616453', '1526616453');
INSERT INTO `ey_guestbook_attribute` VALUES ('3', '约谈对象', '30', '1', '隔壁老王\r\n前台美女\r\n扫地阿姨', '100', '1526616497', '1526616812');
INSERT INTO `ey_guestbook_attribute` VALUES ('4', '姓名', '6', '0', '', '100', '1526634369', '1526874914');
INSERT INTO `ey_guestbook_attribute` VALUES ('5', '联系方式', '6', '0', '', '100', '1526634383', '1526634383');
INSERT INTO `ey_guestbook_attribute` VALUES ('6', '备注信息', '6', '2', '', '100', '1526634393', '1526875056');
INSERT INTO `ey_guestbook_attribute` VALUES ('9', '邮箱', '6', '0', '', '100', '1527663557', '1527663557');
INSERT INTO `ey_guestbook_attribute` VALUES ('14', '您的姓名', '53', '0', '', '100', '1528276242', '1528276242');
INSERT INTO `ey_guestbook_attribute` VALUES ('15', '您的电话', '53', '0', '', '100', '1528276256', '1528276256');
INSERT INTO `ey_guestbook_attribute` VALUES ('16', '邮箱地址', '53', '0', '', '100', '1528276273', '1528276273');
INSERT INTO `ey_guestbook_attribute` VALUES ('17', '留言内容', '53', '2', '', '100', '1528276286', '1528276286');

-- -----------------------------
-- Table structure for `ey_hooks`
-- -----------------------------
DROP TABLE IF EXISTS `ey_hooks`;
CREATE TABLE `ey_hooks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '钩子名称',
  `description` text COMMENT '描述',
  `module` varchar(50) DEFAULT '' COMMENT '钩子挂载的插件',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '状态：0=无效，1=有效',
  `add_time` int(10) DEFAULT NULL,
  `update_time` int(10) unsigned DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `name` (`name`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='插件钩子表';


-- -----------------------------
-- Table structure for `ey_images_content`
-- -----------------------------
DROP TABLE IF EXISTS `ey_images_content`;
CREATE TABLE `ey_images_content` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `aid` int(10) DEFAULT '0' COMMENT '文档ID',
  `content` longtext COMMENT '内容详情',
  `add_time` int(11) DEFAULT '0' COMMENT '新增时间',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `news_id` (`aid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='资讯内容表_存储正常内容';


-- -----------------------------
-- Table structure for `ey_images_upload`
-- -----------------------------
DROP TABLE IF EXISTS `ey_images_upload`;
CREATE TABLE `ey_images_upload` (
  `img_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `aid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '图集ID',
  `title` varchar(200) DEFAULT '' COMMENT '产品标题',
  `image_url` varchar(255) DEFAULT '' COMMENT '文件存储路径',
  `width` int(11) DEFAULT '0' COMMENT '图片宽度',
  `height` int(11) DEFAULT '0' COMMENT '图片高度',
  `filesize` mediumint(8) unsigned DEFAULT '0' COMMENT '文件大小',
  `mime` varchar(50) DEFAULT '' COMMENT '图片类型',
  `sort_order` smallint(5) DEFAULT '0' COMMENT '排序',
  `add_time` int(10) unsigned DEFAULT '0' COMMENT '上传时间',
  PRIMARY KEY (`img_id`),
  KEY `arcid` (`aid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;


-- -----------------------------
-- Table structure for `ey_links`
-- -----------------------------
DROP TABLE IF EXISTS `ey_links`;
CREATE TABLE `ey_links` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `typeid` tinyint(1) DEFAULT '1' COMMENT '类型：1=文字链接，2=图片链接',
  `title` varchar(50) DEFAULT '' COMMENT '网站标题',
  `url` varchar(100) DEFAULT '' COMMENT '网站地址',
  `logo` varchar(255) DEFAULT '' COMMENT '网站LOGO',
  `sort_order` int(11) DEFAULT '0' COMMENT '排序号',
  `target` tinyint(1) DEFAULT '0' COMMENT '是否开启浏览器新窗口',
  `email` varchar(50) DEFAULT NULL,
  `intro` text COMMENT '网站简况',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态(1=显示，0=屏蔽)',
  `delete_time` int(11) DEFAULT '0' COMMENT '软删除时间',
  `add_time` int(11) DEFAULT '0' COMMENT '新增时间',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `ey_links`
-- -----------------------------
INSERT INTO `ey_links` VALUES ('2', '1', '易优CMS', 'http://www.eyoucms.com', '', '100', '1', '', '', '1', '0', '1524975826', '1528185050');
INSERT INTO `ey_links` VALUES ('3', '1', '素材58', 'http://www.sucai58.com', 'http://www.eyoucms.dev/public/upload/system/2018/04/29/814ece093a0ba636209255dc20bd6e62.png', '100', '1', '', '', '1', '0', '1524976095', '1528184984');
INSERT INTO `ey_links` VALUES ('4', '1', '区块链是什么', 'http://www.yiyocms.com/', '', '100', '1', '', '', '1', '0', '1525266497', '1528185027');
INSERT INTO `ey_links` VALUES ('5', '1', '微信小程序开发教程', 'http://www.yiyongtong.com', '', '100', '1', '', '', '1', '0', '1525748425', '1528185056');

-- -----------------------------
-- Table structure for `ey_plugin`
-- -----------------------------
DROP TABLE IF EXISTS `ey_plugin`;
CREATE TABLE `ey_plugin` (
  `code` varchar(13) DEFAULT NULL COMMENT '插件编码',
  `name` varchar(55) DEFAULT NULL COMMENT '中文名字',
  `version` varchar(255) DEFAULT NULL COMMENT '插件的版本',
  `author` varchar(30) DEFAULT NULL COMMENT '插件作者',
  `config` text COMMENT '配置信息',
  `config_value` text COMMENT '配置值信息',
  `desc` varchar(255) DEFAULT NULL COMMENT '插件描述',
  `status` tinyint(1) DEFAULT '0' COMMENT '是否启用',
  `type` varchar(50) DEFAULT NULL COMMENT '插件类型 payment支付 login 登陆 shipping物流',
  `icon` varchar(255) DEFAULT NULL COMMENT '图标',
  `bank_code` text COMMENT '网银配置信息',
  `scene` tinyint(1) DEFAULT '0' COMMENT '使用场景 0PC+手机 1手机 2PC 3APP 4小程序',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `ey_plugin`
-- -----------------------------
INSERT INTO `ey_plugin` VALUES ('alipayMobile', '手机网站支付宝', '1.0', '宇宙人', 'a:6:{i:0;a:4:{s:4:\"name\";s:14:\"alipay_account\";s:5:\"label\";s:15:\"支付宝帐户\";s:4:\"type\";s:4:\"text\";s:5:\"value\";s:0:\"\";}i:1;a:4:{s:4:\"name\";s:10:\"alipay_key\";s:5:\"label\";s:21:\"交易安全校验码\";s:4:\"type\";s:4:\"text\";s:5:\"value\";s:0:\"\";}i:2;a:4:{s:4:\"name\";s:14:\"alipay_partner\";s:5:\"label\";s:17:\"合作者身份ID\";s:4:\"type\";s:4:\"text\";s:5:\"value\";s:0:\"\";}i:3;a:4:{s:4:\"name\";s:18:\"alipay_private_key\";s:5:\"label\";s:6:\"秘钥\";s:4:\"type\";s:8:\"textarea\";s:5:\"value\";s:0:\"\";}i:4;a:4:{s:4:\"name\";s:17:\"alipay_pay_method\";s:5:\"label\";s:19:\" 选择接口类型\";s:4:\"type\";s:6:\"select\";s:6:\"option\";a:2:{i:0;s:24:\"使用担保交易接口\";i:1;s:30:\"使用即时到帐交易接口\";}}i:5;a:4:{s:4:\"name\";s:7:\"is_bank\";s:5:\"label\";s:18:\"是否开通网银\";s:4:\"type\";s:6:\"select\";s:6:\"option\";a:2:{i:0;s:3:\"否\";i:1;s:3:\"是\";}}}', '', '手机端网站支付宝 ', '0', 'payment', 'logo.jpg', 'N;', '1', '0');
INSERT INTO `ey_plugin` VALUES ('cod', '到货付款', '1.0', 'IT宇宙人', 'a:1:{i:0;a:4:{s:4:\"name\";s:9:\"code_desc\";s:5:\"label\";s:12:\"配送描述\";s:4:\"type\";s:4:\"text\";s:5:\"value\";s:0:\"\";}}', '', '货到付款插件 ', '0', 'payment', 'logo.jpg', 'N;', '0', '0');
INSERT INTO `ey_plugin` VALUES ('miniAppPay', '微信小程序支付', '1.0', 'lhb', 'a:4:{i:0;a:5:{s:4:\"name\";s:5:\"appid\";s:5:\"label\";s:20:\"绑定支付的APPID\";s:4:\"type\";s:4:\"text\";s:5:\"value\";s:0:\"\";s:4:\"hint\";s:0:\"\";}i:1;a:4:{s:4:\"name\";s:5:\"mchid\";s:5:\"label\";s:9:\"商户号\";s:4:\"type\";s:4:\"text\";s:5:\"value\";s:0:\"\";}i:2;a:4:{s:4:\"name\";s:3:\"key\";s:5:\"label\";s:18:\"商户支付密钥\";s:4:\"type\";s:4:\"text\";s:5:\"value\";s:0:\"\";}i:3;a:4:{s:4:\"name\";s:9:\"appsecret\";s:5:\"label\";s:15:\"小程序secret\";s:4:\"type\";s:4:\"text\";s:5:\"value\";s:0:\"\";}}', '', '微信小程序支付信息', '0', 'payment', 'logo.jpg', 'N;', '4', '0');
INSERT INTO `ey_plugin` VALUES ('appWeixinPay', 'App微信支付', '1.0', 'wangqh', 'a:3:{i:0;a:5:{s:4:\"name\";s:5:\"appid\";s:5:\"label\";s:20:\"绑定支付的APPID\";s:4:\"type\";s:4:\"text\";s:5:\"value\";s:0:\"\";s:4:\"hint\";s:0:\"\";}i:1;a:4:{s:4:\"name\";s:5:\"mchid\";s:5:\"label\";s:9:\"商户号\";s:4:\"type\";s:4:\"text\";s:5:\"value\";s:0:\"\";}i:2;a:4:{s:4:\"name\";s:3:\"key\";s:5:\"label\";s:18:\"商户支付密钥\";s:4:\"type\";s:4:\"text\";s:5:\"value\";s:0:\"\";}}', '', '微信开放平台支付信息', '0', 'payment', 'logo.jpg', 'N;', '3', '0');
INSERT INTO `ey_plugin` VALUES ('tenpay', 'PC端财付通', '1.0', 'IT宇宙人', 'a:2:{i:0;a:4:{s:4:\"name\";s:7:\"partner\";s:5:\"label\";s:7:\"partner\";s:4:\"type\";s:4:\"text\";s:5:\"value\";s:0:\"\";}i:1;a:4:{s:4:\"name\";s:3:\"key\";s:5:\"label\";s:3:\"key\";s:4:\"type\";s:4:\"text\";s:5:\"value\";s:0:\"\";}}', '', 'PC端财付通插件 ', '0', 'payment', 'logo.jpg', 'N;', '2', '0');
INSERT INTO `ey_plugin` VALUES ('alipay', 'PC端支付宝', '1.0', 'jy_pwn', 'a:6:{i:0;a:4:{s:4:\"name\";s:14:\"alipay_account\";s:5:\"label\";s:15:\"支付宝帐户\";s:4:\"type\";s:4:\"text\";s:5:\"value\";s:0:\"\";}i:1;a:4:{s:4:\"name\";s:10:\"alipay_key\";s:5:\"label\";s:21:\"交易安全校验码\";s:4:\"type\";s:4:\"text\";s:5:\"value\";s:0:\"\";}i:2;a:4:{s:4:\"name\";s:14:\"alipay_partner\";s:5:\"label\";s:17:\"合作者身份ID\";s:4:\"type\";s:4:\"text\";s:5:\"value\";s:0:\"\";}i:3;a:4:{s:4:\"name\";s:18:\"alipay_private_key\";s:5:\"label\";s:6:\"秘钥\";s:4:\"type\";s:8:\"textarea\";s:5:\"value\";s:0:\"\";}i:4;a:4:{s:4:\"name\";s:17:\"alipay_pay_method\";s:5:\"label\";s:19:\" 选择接口类型\";s:4:\"type\";s:6:\"select\";s:6:\"option\";a:2:{i:0;s:24:\"使用担保交易接口\";i:1;s:30:\"使用即时到帐交易接口\";}}i:5;a:4:{s:4:\"name\";s:7:\"is_bank\";s:5:\"label\";s:18:\"是否开通网银\";s:4:\"type\";s:6:\"select\";s:6:\"option\";a:2:{i:0;s:3:\"否\";i:1;s:3:\"是\";}}}', '', 'PC端支付宝插件 ', '0', 'payment', 'logo.jpg', 'a:8:{s:12:\"招商银行\";s:9:\"CMB-DEBIT\";s:18:\"中国工商银行\";s:10:\"ICBC-DEBIT\";s:12:\"交通银行\";s:10:\"COMM-DEBIT\";s:18:\"中国建设银行\";s:9:\"CCB-DEBIT\";s:18:\"中国民生银行\";s:4:\"CMBC\";s:12:\"中国银行\";s:9:\"BOC-DEBIT\";s:18:\"中国农业银行\";s:3:\"ABC\";s:12:\"上海银行\";s:6:\"SHBANK\";}', '2', '0');
INSERT INTO `ey_plugin` VALUES ('unionpay', '银联在线支付', '1.0', '奇闻科技', 'a:4:{i:0;a:4:{s:4:\"name\";s:12:\"unionpay_mid\";s:5:\"label\";s:9:\"商户号\";s:4:\"type\";s:4:\"text\";s:5:\"value\";s:15:\"777290058130619\";}i:1;a:4:{s:4:\"name\";s:21:\"unionpay_cer_password\";s:5:\"label\";s:25:\" 商户私钥证书密码\";s:4:\"type\";s:4:\"text\";s:5:\"value\";s:6:\"000000\";}i:2;a:4:{s:4:\"name\";s:13:\"unionpay_user\";s:5:\"label\";s:19:\" 企业网银账号\";s:4:\"type\";s:4:\"text\";s:5:\"value\";s:12:\"123456789001\";}i:3;a:4:{s:4:\"name\";s:17:\"unionpay_password\";s:5:\"label\";s:19:\" 企业网银密码\";s:4:\"type\";s:4:\"text\";s:5:\"value\";s:6:\"789001\";}}', '', '银联在线支付插件 ', '0', 'payment', 'logo.jpg', 'N;', '0', '0');
INSERT INTO `ey_plugin` VALUES ('weixin', '微信支付', '1.0', 'IT宇宙人', 'a:5:{i:0;a:4:{s:4:\"name\";s:5:\"appid\";s:5:\"label\";s:20:\"绑定支付的APPID\";s:4:\"type\";s:4:\"text\";s:5:\"value\";s:0:\"\";}i:1;a:4:{s:4:\"name\";s:5:\"mchid\";s:5:\"label\";s:9:\"商户号\";s:4:\"type\";s:4:\"text\";s:5:\"value\";s:0:\"\";}i:2;a:4:{s:4:\"name\";s:3:\"key\";s:5:\"label\";s:18:\"商户支付密钥\";s:4:\"type\";s:4:\"text\";s:5:\"value\";s:0:\"\";}i:3;a:4:{s:4:\"name\";s:9:\"appsecret\";s:5:\"label\";s:57:\"公众帐号secert（仅JSAPI支付的时候需要配置)\";s:4:\"type\";s:4:\"text\";s:5:\"value\";s:0:\"\";}i:4;a:4:{s:4:\"name\";s:6:\"smchid\";s:5:\"label\";s:48:\"服务商商户号，企业在线付款需用到\";s:4:\"type\";s:4:\"text\";s:5:\"value\";s:0:\"\";}}', '', 'PC端+微信公众号支付', '0', 'payment', 'logo.jpg', 'N;', '0', '0');
INSERT INTO `ey_plugin` VALUES ('helloworld', 'HelloWorld插件', 'v2.0.5,v2.0.7', '惹妹子生气了', '', '', '适合v2.0.5 , v2.0.7', '0', 'function', 'logo.jpg', 'N;', '0', '0');
INSERT INTO `ey_plugin` VALUES ('weixin', '微信登录', '1.0', '彭老师', 'a:3:{i:0;a:4:{s:4:\"name\";s:5:\"appid\";s:5:\"label\";s:17:\"开放平台appid\";s:4:\"type\";s:4:\"text\";s:5:\"value\";s:0:\"\";}i:1;a:4:{s:4:\"name\";s:6:\"secret\";s:5:\"label\";s:18:\"开放平台secret\";s:4:\"type\";s:4:\"text\";s:5:\"value\";s:0:\"\";}i:2;a:4:{s:4:\"name\";s:10:\"return_url\";s:5:\"label\";s:9:\"回调URL\";s:4:\"type\";s:4:\"text\";s:5:\"value\";s:0:\"\";}}', 'a:3:{s:5:\"appid\";s:18:\"wx0f0ff39efd386c42\";s:6:\"secret\";s:32:\"fc878c9641346adc9b7d7e299572ba42\";s:10:\"return_url\";s:67:\"http://www.lvxing1788.com/index/LoginApi/callback/oauth/weixin.html\";}', '微信扫码登录插件 ', '1', 'login', 'logo.jpg', 'N;', '0', '1513556648');
INSERT INTO `ey_plugin` VALUES ('qq', 'QQ登录', '1.0', '彭老师', 'a:3:{i:0;a:4:{s:4:\"name\";s:6:\"app_id\";s:5:\"label\";s:6:\"app_id\";s:4:\"type\";s:4:\"text\";s:5:\"value\";s:0:\"\";}i:1;a:4:{s:4:\"name\";s:10:\"app_secret\";s:5:\"label\";s:10:\"app_secret\";s:4:\"type\";s:4:\"text\";s:5:\"value\";s:0:\"\";}i:2;a:4:{s:4:\"name\";s:10:\"return_url\";s:5:\"label\";s:9:\"回调URL\";s:4:\"type\";s:4:\"text\";s:5:\"value\";s:0:\"\";}}', '', 'QQ登录插件 ', '1', 'login', 'logo.jpg', 'N;', '0', '0');

-- -----------------------------
-- Table structure for `ey_product_attr`
-- -----------------------------
DROP TABLE IF EXISTS `ey_product_attr`;
CREATE TABLE `ey_product_attr` (
  `product_attr_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '产品属性id自增',
  `aid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '产品id',
  `attr_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '属性id',
  `attr_value` text COMMENT '属性值',
  `attr_price` varchar(255) DEFAULT '' COMMENT '属性价格',
  `add_time` int(11) DEFAULT '0' COMMENT '新增时间',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`product_attr_id`),
  KEY `aid` (`aid`) USING BTREE,
  KEY `attr_id` (`attr_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;


-- -----------------------------
-- Table structure for `ey_product_attribute`
-- -----------------------------
DROP TABLE IF EXISTS `ey_product_attribute`;
CREATE TABLE `ey_product_attribute` (
  `attr_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '属性id',
  `attr_name` varchar(60) DEFAULT '' COMMENT '属性名称',
  `typeid` int(11) unsigned DEFAULT '0' COMMENT '栏目id',
  `attr_index` tinyint(1) unsigned DEFAULT '0' COMMENT '0不需要检索 1关键字检索 2范围检索',
  `attr_input_type` tinyint(1) unsigned DEFAULT '0' COMMENT ' 0=文本框，1=下拉框，2=多行文本框',
  `attr_values` text COMMENT '可选值列表',
  `sort_order` int(11) unsigned DEFAULT '0' COMMENT '属性排序',
  `add_time` int(11) DEFAULT '0' COMMENT '新增时间',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`attr_id`),
  KEY `cat_id` (`typeid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `ey_product_attribute`
-- -----------------------------
INSERT INTO `ey_product_attribute` VALUES ('1', '用户界面', '24', '0', '0', '', '100', '1526612774', '1526612774');
INSERT INTO `ey_product_attribute` VALUES ('2', '操作系统', '24', '0', '0', '', '10', '1526612785', '1526612785');
INSERT INTO `ey_product_attribute` VALUES ('3', '键盘类型', '24', '0', '0', '', '100', '1526613004', '1526613004');
INSERT INTO `ey_product_attribute` VALUES ('4', ' 型号', '24', '0', '0', '', '100', '1526613011', '1526613011');
INSERT INTO `ey_product_attribute` VALUES ('5', '屏幕大小', '26', '0', '0', '', '100', '1526613252', '1526613252');
INSERT INTO `ey_product_attribute` VALUES ('6', '重量', '26', '0', '0', '', '100', '1526613259', '1526613259');
INSERT INTO `ey_product_attribute` VALUES ('7', '型号', '27', '0', '0', '', '100', '1526613668', '1526613668');
INSERT INTO `ey_product_attribute` VALUES ('8', '支持蓝牙', '27', '0', '0', '', '100', '1526613732', '1526613732');

-- -----------------------------
-- Table structure for `ey_product_content`
-- -----------------------------
DROP TABLE IF EXISTS `ey_product_content`;
CREATE TABLE `ey_product_content` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `aid` int(10) DEFAULT '0' COMMENT '文档ID',
  `content` longtext COMMENT '内容详情',
  `add_time` int(11) DEFAULT '0' COMMENT '新增时间',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `news_id` (`aid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='资讯内容表_存储正常内容';


-- -----------------------------
-- Table structure for `ey_product_img`
-- -----------------------------
DROP TABLE IF EXISTS `ey_product_img`;
CREATE TABLE `ey_product_img` (
  `img_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `aid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '产品ID',
  `title` varchar(200) DEFAULT '' COMMENT '产品标题',
  `image_url` varchar(255) DEFAULT '' COMMENT '文件存储路径',
  `width` int(11) DEFAULT '0' COMMENT '图片宽度',
  `height` int(11) DEFAULT '0' COMMENT '图片高度',
  `filesize` varchar(255) DEFAULT '' COMMENT '文件大小',
  `mime` varchar(50) DEFAULT '' COMMENT '图片类型',
  `sort_order` smallint(5) DEFAULT '0' COMMENT '排序',
  `add_time` int(10) unsigned DEFAULT '0' COMMENT '上传时间',
  PRIMARY KEY (`img_id`),
  KEY `arcid` (`aid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;


-- -----------------------------
-- Table structure for `ey_single_content`
-- -----------------------------
DROP TABLE IF EXISTS `ey_single_content`;
CREATE TABLE `ey_single_content` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `aid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文档ID',
  `typeid` int(10) DEFAULT '0' COMMENT '栏目ID',
  `content` longtext COMMENT '内容详情',
  `add_time` int(11) DEFAULT '0' COMMENT '新增时间',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `aid` (`aid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `ey_single_content`
-- -----------------------------
INSERT INTO `ey_single_content` VALUES ('1', '1', '1', '&lt;p&gt;核心价值观：诚信、创新、服务&lt;/p&gt;&lt;p&gt;企业核心： 诚信&amp;nbsp;&lt;/p&gt;&lt;p&gt;企业精神： 团结拼搏、开拓求实、满足用户、科技进步。&lt;/p&gt;&lt;p&gt;&amp;nbsp;&lt;/p&gt;&lt;p&gt;客户：为客户提供高质量和最大价值的专业化产品和服务，以真诚和实力赢得客户的理解、尊重和支持。&lt;/p&gt;&lt;p&gt;市场：为客户降低采购成本和风险，为客户投资提供切实保障。&amp;nbsp;&lt;/p&gt;&lt;p&gt;发展：追求永续发展的目标，并把它建立在客户满意的基础上。&lt;/p&gt;&lt;p&gt;&amp;nbsp;&lt;/p&gt;&lt;p&gt;关于“为合作伙伴创造价值”&lt;/p&gt;&lt;p&gt;公司认为客户、供应商、公司股东、公司员工等一切和自身有合作关系的单位和个人都是自己的合作伙伴，并只有通过努力为合作伙伴创造价值，才能体现自身的价值并获得发展和成功。&lt;/p&gt;&lt;p&gt;关于“诚实、宽容、创新、服务”&lt;/p&gt;&lt;p&gt;公司认为诚信是一切合作的基础，宽容是解决问题的前提，创新是发展事业的利器，服务是创造价值的根本。公司会坚持持续改进、满足顾客期望、 确保品质第一、开拓全球市场。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '0', '1529717867');
INSERT INTO `ey_single_content` VALUES ('4', '8', '15', '&lt;p style=&quot;text-align: center;&quot;&gt;地址：这里是您的公司地址&amp;nbsp;&lt;/p&gt;&lt;p style=&quot;text-align: center;&quot;&gt;电话：400-123-4567&lt;/p&gt;&lt;p style=&quot;text-align: center;&quot;&gt;传真：+86-123-4567&lt;/p&gt;&lt;p style=&quot;text-align: center;&quot;&gt;邮编：000000&lt;/p&gt;&lt;p style=&quot;text-align: center;&quot;&gt;邮箱：这里是您公司的邮箱地址&lt;/p&gt;&lt;p style=&quot;text-align: center;&quot;&gt;&amp;nbsp;&lt;iframe class=&quot;ueditor_baidumap&quot; src=&quot;http://127.0.0.32/public/plugins/Ueditor/dialogs/map/show.html#center=113.368509,23.130358&amp;zoom=13&amp;width=530&amp;height=340&amp;markers=113.368509,23.130358&amp;markerStyles=l,A&quot; frameborder=&quot;0&quot; width=&quot;534&quot; height=&quot;344&quot;&gt;&lt;/iframe&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '0', '1529659578');
INSERT INTO `ey_single_content` VALUES ('19', '100', '63', '&lt;p&gt;技术支持分售前技术支持和售后技术支持，售前技术支持是指在销售遇到无法解答的产品问题时，售前技术支持给予帮助；售后技术支持是指产品公司为其产品用户提供的售后服务的一种形式，帮助用户诊断并解决其在使用产品过程中出现的有明显症状的，可能由产品导致的技术问题。&lt;/p&gt;&lt;p&gt;在21世纪的当代，技术支持已经成为服务的一部分，也成为公司企业形象的重要组成部分。&lt;/p&gt;&lt;p&gt;技术的支持不仅仅是以解决技术问题为目的，更重要的是在客户的心里建立起企业的形象，让人们记住的是企业的形象，进一步记住所用产品的品牌，最后达成服务与品牌的完美结合。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '1529723379', '1529737571');
INSERT INTO `ey_single_content` VALUES ('20', '102', '64', '&lt;p&gt;商业演出活动策划流程：&lt;/p&gt;&lt;p&gt;1.首先制定出可行的活动实施的计划：如活动推进表，活动物料项目推进表，前期广告投放宣传，依据市场部的资料分析组织进行活动策划。&lt;/p&gt;&lt;p&gt;2.确立明确活动方案（包括备选方案）&lt;/p&gt;&lt;p&gt;3.与各种媒体沟通整合：如软硬新闻、商品广告、有偿新闻、媒体支持等。主要洽谈对象包括：当地各大报纸期刊杂志、广播电台、电视台、网络等。&lt;/p&gt;&lt;p&gt;4.采购部门与供应商进行洽谈，对象包括：厂家、省包、国包及与公司业务需求紧密相关的其他个人或单位。洽谈内容有：商品价格、商品供货数量、供货条件、赞助费用、文艺活动、供应商独立活动、广告赞助。&lt;/p&gt;&lt;p&gt;5.市场部提出相关广告策划方案、活动方案及费用预算，内容包括时间、地点、活动形式、宣传、媒体、广告和宣传品设计方案、公司配合部门、单项费用预算和总额费用等内容。由市场部组织公司主管总经理、销售部、执行部及相关部门对广告策划的方案、费用预算、广告及宣传品设计方案进行评审，从而形成业务评审表&lt;/p&gt;&lt;p&gt;6.活动前软硬广告的撰写设计、排期投放等都必须做好，为即将开始的活动预热。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '1529737724', '1529740907');
INSERT INTO `ey_single_content` VALUES ('21', '103', '66', '&lt;p&gt;舞台是展现表演的地方，是展示艺术的方向。舞台是庆典活动中最常用的设备，也是所有活动必备的项目，舞台是展现人员风貌，活动规格，体现活动宏达场面的奠基石。所以舞台搭建的重要性不言而喻。规格：可根据客户需要订做所需要的尺寸。舞台高度：20cm、40cm、60cm、80cm、1M。舞台踏步分别有一层、两层、三层等，也可以根据舞台尺寸订做。&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;舞台产品的特性：&lt;/p&gt;&lt;p&gt;1、舞台支架全部可拆，方便存储和运输,可随用随装，方便快捷。&lt;/p&gt;&lt;p&gt;2、稳定性好，承重量大，舞台板加支架，每平方可以承重700KG&lt;/p&gt;&lt;p&gt;3、高度可根据需要进行调节，很好的解决了地面不平，上下楼梯高矮不一等问题，是临时&lt;/p&gt;&lt;p&gt;演出，展览搭建最理想的器材之一。&lt;/p&gt;&lt;p&gt;4、舞台立柱：同脚手架所用钢管的规格一样，底部的固定螺丝与调节底座固定一起。&lt;/p&gt;&lt;p&gt;5、舞台连接板：用于连接相邻的四块舞台板。&lt;/p&gt;&lt;p&gt;6、舞台斜撑：所用斜撑表面热镀锌处理，区别于冷镀锌斜撑，经久耐用，不会生锈。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '1529737883', '1529741061');
INSERT INTO `ey_single_content` VALUES ('22', '104', '67', '&lt;p&gt;电商产品宣传片也就是商家在淘宝、天猫、京东等平台上使用的，展示商品细节的短视频，适合在移动和短期休闲场所观看，有完整的策划和专业的拍摄制作。电商产品宣传片拍摄体现了“三微”：微时间、微生产周期和微资金投入，一般说来电商视频的时长集中在10秒到1分钟，最长也不会超过10分钟，主要在互联网和手机上展示和传播。&lt;/p&gt;&lt;p&gt;&lt;/p&gt;&lt;p&gt;随着市场需求的逐渐增多，电商视频拍摄团队也像雨后春笋般迅速增长。电商视频发展势头强劲、发展前景广阔。但是，如何建立科学可行的行业标准，是点上视频拍摄制作在可持续发展的道路上稳步成长，是值得每个制作团队认真思考的问题。基于平台资源整合，以定制为导向主体、质量内容为保证、明星话题为亮点、主流价值观传播为核心、系列传播为形式，应该是该行业做大做强的正确发展方向。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;电商产品宣传片拍摄应当遵循两个原则：&lt;/p&gt;&lt;p&gt;1 .电商产品宣传片拍摄图像应使电影观众有身临其境的直观感受，并对宣传的内在气质和突出特点有深入了解。&lt;br/&gt;&lt;/p&gt;&lt;p&gt;2 .有效结合整体电商产品宣传片拍摄策划方案。主要途径是通过画面营造场景氛围，更好地向公众展示资源、功能、服务和优势，诠释和翻译他们的文化理念。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;事实上，每一条电商产品宣传片拍摄都是广告，应该有宣传功能，但不同的是有的侧重于宣传有形产品，有的侧重于宣传无形服务或精神理念。因此，相对而言，它不像有形产品的宣传那样侧重于产品的功能特性，而是侧重于服务或企业品牌的内涵和附加值。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '1529738011', '1529741205');
INSERT INTO `ey_single_content` VALUES ('23', '105', '68', '&lt;p&gt;我们始终坚持以专业、质量、服务、管理为己任，竭诚为每位客户提供满意的产品和服务，建立起良好的合作关系。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;拥有建声学、电学、美学、视频、设备定位及匹配、设备调试的专业技术，我们不是简单的出售产品给客户，而是通过我们专业的技术和一流的服务为客户提供整体的解决方案，从方案设计、产品选型、安装调试、客户培训、维修保养、系统升级，给客户全方位的服务，为客户提供安全便捷的产品。&lt;br/&gt;&lt;br/&gt;&lt;br/&gt;&lt;br/&gt;公司为了做出让客户满意的方案和产品，引进了国内持有最高THX认证的影音设计师、智能控制设计师以及isf认证的视频设计师，平均从业年龄超过二十年，有专业的技术和丰富的经验。公司的服务宗旨是“以人为本，以技术为后盾”，本着信誉第一，服务至上的原则，竭诚为每一位客户提供人性化的朋友式服务，与客户建立良好的合作关系，相互帮助，寻求共赢。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;致力于打造最专业音视频工程的高科技企业。公司通过十余年的发展，获得了所有客户的好评以及在音响界良好的口碑。因为精心，专业，诚信，公司获得了音响工程、声频工程、视频工程的综合技术能力资质。我们可以为您提供专业的舞台灯光音响设备、设计方案、安装及调试。致力于会议厅、多功能厅、宴会厅、剧场、剧院、礼堂、影院、私人影院、卡拉OK、KTV、LED大屏、多媒体视频会议室、多媒体实验室、录音室、酒吧、高端会所、私人会所、远程视频音频等智能设备的工程设计、安装、调试等一站式服务。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '1529738046', '1529741413');
INSERT INTO `ey_single_content` VALUES ('24', '106', '69', '&lt;p&gt;技术支持分售前技术支持和售后技术支持，售前技术支持是指在销售遇到无法解答的产品问题时，售前技术支持给予帮助；售后技术支持是指产品公司为其产品用户提供的售后服务的一种形式，帮助用户诊断并解决其在使用产品过程中出现的有明显症状的，可能由产品导致的技术问题。&lt;/p&gt;&lt;p&gt;在21世纪的当代，技术支持已经成为服务的一部分，也成为公司企业形象的重要组成部分。&lt;/p&gt;&lt;p&gt;技术的支持不仅仅是以解决技术问题为目的，更重要的是在客户的心里建立起企业的形象，让人们记住的是企业的形象，进一步记住所用产品的品牌，最后达成服务与品牌的完美结合。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '1529738094', '1529741529');

-- -----------------------------
-- Table structure for `ey_sms_log`
-- -----------------------------
DROP TABLE IF EXISTS `ey_sms_log`;
CREATE TABLE `ey_sms_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '表id',
  `mobile` varchar(11) DEFAULT '' COMMENT '手机号',
  `session_id` varchar(128) DEFAULT '' COMMENT 'session_id',
  `add_time` int(11) DEFAULT '0' COMMENT '发送时间',
  `code` varchar(10) DEFAULT '' COMMENT '验证码',
  `status` int(1) NOT NULL DEFAULT '0' COMMENT '发送状态,1:成功,0:失败',
  `msg` varchar(255) DEFAULT NULL COMMENT '短信内容',
  `scene` int(1) DEFAULT '0' COMMENT '发送场景,1:用户注册,2:找回密码,3:客户下单,4:客户支付,5:商家发货,6:身份验证',
  `error_msg` text COMMENT '发送短信异常内容',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


-- -----------------------------
-- Table structure for `ey_sms_template`
-- -----------------------------
DROP TABLE IF EXISTS `ey_sms_template`;
CREATE TABLE `ey_sms_template` (
  `tpl_id` mediumint(8) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `sms_sign` varchar(50) DEFAULT '' COMMENT '短信签名',
  `sms_tpl_code` varchar(100) DEFAULT '' COMMENT '短信模板ID',
  `tpl_content` varchar(512) DEFAULT '' COMMENT '发送短信内容',
  `send_scene` varchar(100) DEFAULT '' COMMENT '短信发送场景',
  `add_time` int(11) DEFAULT NULL COMMENT '添加时间',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`tpl_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


-- -----------------------------
-- Table structure for `ey_tagindex`
-- -----------------------------
DROP TABLE IF EXISTS `ey_tagindex`;
CREATE TABLE `ey_tagindex` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tag` varchar(20) NOT NULL DEFAULT '',
  `typeid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `count` int(10) unsigned DEFAULT '0',
  `total` int(10) unsigned DEFAULT '0',
  `weekcc` int(10) unsigned DEFAULT '0',
  `monthcc` int(10) unsigned DEFAULT '0',
  `weekup` int(10) unsigned DEFAULT '0',
  `monthup` int(10) unsigned DEFAULT '0',
  `add_time` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `typeid` (`typeid`) USING BTREE,
  KEY `count` (`count`,`total`,`weekcc`,`monthcc`,`weekup`,`monthup`,`add_time`) USING BTREE,
  KEY `tag` (`tag`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `ey_tagindex`
-- -----------------------------
INSERT INTO `ey_tagindex` VALUES ('24', 'TAG标签', '10', '0', '0', '0', '0', '0', '0', '1526544706');
INSERT INTO `ey_tagindex` VALUES ('25', '对的', '10', '0', '0', '0', '0', '0', '0', '1526544706');
INSERT INTO `ey_tagindex` VALUES ('26', '替换稿件', '10', '0', '0', '0', '0', '0', '0', '1526544706');
INSERT INTO `ey_tagindex` VALUES ('27', '杨靖宇', '10', '0', '0', '0', '0', '0', '0', '1526544706');
INSERT INTO `ey_tagindex` VALUES ('28', '网站', '12', '0', '0', '0', '0', '0', '0', '1526608291');
INSERT INTO `ey_tagindex` VALUES ('29', '建设', '12', '0', '0', '0', '0', '0', '0', '1526608291');
INSERT INTO `ey_tagindex` VALUES ('30', '五大核心', '12', '0', '0', '0', '0', '0', '0', '1526608291');
INSERT INTO `ey_tagindex` VALUES ('31', '要素', '12', '0', '0', '0', '0', '0', '0', '1526608291');
INSERT INTO `ey_tagindex` VALUES ('32', '华为', '24', '0', '0', '0', '0', '0', '0', '1526613161');
INSERT INTO `ey_tagindex` VALUES ('33', 'HUAWEI', '24', '0', '0', '0', '0', '0', '0', '1526613161');
INSERT INTO `ey_tagindex` VALUES ('34', 'NOTE 8', '24', '0', '0', '0', '0', '0', '0', '1526613161');
INSERT INTO `ey_tagindex` VALUES ('35', '宅男', '5', '0', '0', '0', '0', '0', '0', '1526614158');
INSERT INTO `ey_tagindex` VALUES ('36', '女神', '5', '0', '0', '0', '0', '0', '0', '1526614158');
INSERT INTO `ey_tagindex` VALUES ('37', '一号', '5', '0', '0', '0', '0', '0', '0', '1526614158');

-- -----------------------------
-- Table structure for `ey_taglist`
-- -----------------------------
DROP TABLE IF EXISTS `ey_taglist`;
CREATE TABLE `ey_taglist` (
  `tid` int(10) unsigned NOT NULL DEFAULT '0',
  `aid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文章ID',
  `typeid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '栏目ID',
  `tag` varchar(12) DEFAULT '' COMMENT 'tag内容',
  `arcrank` tinyint(1) DEFAULT '0' COMMENT '阅读权限',
  `add_time` int(11) DEFAULT '0' COMMENT '新增时间',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`tid`,`aid`),
  KEY `aid` (`aid`,`typeid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文章标签表';


-- -----------------------------
-- Table structure for `ey_ui_config`
-- -----------------------------
DROP TABLE IF EXISTS `ey_ui_config`;
CREATE TABLE `ey_ui_config` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '表id',
  `md5key` varchar(100) NOT NULL DEFAULT '' COMMENT '唯一键值（由 theme_style、page、name）组成',
  `theme_style` varchar(20) DEFAULT 'pc' COMMENT '模板风格',
  `page` varchar(64) DEFAULT '' COMMENT '页面分组',
  `type` varchar(50) DEFAULT '' COMMENT '编辑类型',
  `name` varchar(50) DEFAULT '' COMMENT '与页面的e-id对应',
  `value` text COMMENT '页面美化的val值',
  `add_time` int(11) DEFAULT '0' COMMENT '新增时间',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `md5key` (`md5key`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='页面美化参数设置';


-- -----------------------------
-- Table structure for `ey_weapp`
-- -----------------------------
DROP TABLE IF EXISTS `ey_weapp`;
CREATE TABLE `ey_weapp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) DEFAULT '' COMMENT '插件标识',
  `name` varchar(55) DEFAULT '' COMMENT '中文名字',
  `author` varchar(30) DEFAULT '' COMMENT '插件作者',
  `config` text COMMENT '配置信息',
  `description` varchar(255) DEFAULT '' COMMENT '插件描述',
  `min_version` varchar(200) DEFAULT '' COMMENT '最低系统版本支持',
  `status` tinyint(1) DEFAULT '0' COMMENT '状态：0=未安装，1=启用，-1=禁用',
  `scene` tinyint(1) DEFAULT '0' COMMENT '使用场景 0=PC+手机，1=手机，2=PC，3=APP，4=小程序',
  `thorough` tinyint(1) DEFAULT '0' COMMENT '彻底卸载：0=是，1=否',
  `add_time` int(11) DEFAULT '0' COMMENT '新增时间',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `code` (`code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='插件应用表';

