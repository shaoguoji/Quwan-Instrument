/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50051
Source Host           : localhost:3306
Source Database       : instrument

Target Server Type    : MYSQL
Target Server Version : 50051
File Encoding         : 65001

Date: 2016-11-07 21:40:09
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL auto_increment,
  `admin_username` varchar(50) default NULL,
  `admin_password` varchar(50) default NULL,
  `admin_dep` varchar(50) default NULL,
  `admin_level` int(11) default NULL,
  PRIMARY KEY  (`admin_id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'shaoguoji', 'ICy5YqxZB1uWSwcVLSNLcA==', 'sale', '1');
INSERT INTO `admin` VALUES ('2', 'caikaizhen', 'ICy5YqxZB1uWSwcVLSNLcA==', 'buy', '1');
INSERT INTO `admin` VALUES ('4', 'rotterzheng', 'ICy5YqxZB1uWSwcVLSNLcA==', 'data', '1');
INSERT INTO `admin` VALUES ('3', 'Jigiang', 'ICy5YqxZB1uWSwcVLSNLcA==', 'product', '1');
INSERT INTO `admin` VALUES ('5', 'yanghuiru', 'ICy5YqxZB1uWSwcVLSNLcA==', 'system', '1');
INSERT INTO `admin` VALUES ('11', 'wangcheng', 'ICy5YqxZB1uWSwcVLSNLcA==', 'super', '2');

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `comment_id` int(11) NOT NULL auto_increment,
  `product_id` int(11) default NULL,
  `user_id` int(11) default NULL,
  `comment_degree` varchar(10) default NULL,
  `comment_content` varchar(200) character set utf8 default NULL,
  `comment_date` date default NULL,
  PRIMARY KEY  (`comment_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('1', '1', '1', '5', '东西很好，音色不错，满意！！！', '2016-11-06');

-- ----------------------------
-- Table structure for deal
-- ----------------------------
DROP TABLE IF EXISTS `deal`;
CREATE TABLE `deal` (
  `deal_id` int(11) NOT NULL auto_increment,
  `deal_price` float default NULL,
  `deal_state` varchar(50) default NULL,
  `deal_create_date` date default NULL,
  `deal_send_date` date default NULL,
  `deal_receive_date` date default NULL,
  `deal_isdelete` bit(1) default NULL,
  PRIMARY KEY  (`deal_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of deal
-- ----------------------------
INSERT INTO `deal` VALUES ('1', '799', 'payed', '2016-11-06', '2016-11-06', '2016-11-06', '\0');

-- ----------------------------
-- Table structure for deal_shopping
-- ----------------------------
DROP TABLE IF EXISTS `deal_shopping`;
CREATE TABLE `deal_shopping` (
  `deal_shopping_id` int(11) NOT NULL auto_increment,
  `user_id` int(11) default NULL,
  `deal_id` int(11) default NULL,
  `deal_price` float default NULL,
  `product_id` int(11) default NULL,
  `priduct_count` int(11) default NULL,
  `shopping_number` varchar(50) default NULL,
  PRIMARY KEY  (`deal_shopping_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of deal_shopping
-- ----------------------------
INSERT INTO `deal_shopping` VALUES ('1', '1', '1', '799', '1', '1', '456345423467892345');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `product_id` int(11) NOT NULL auto_increment,
  `product_name` varchar(500) character set utf8 default NULL,
  `product_price` float default NULL,
  `product_color` varchar(50) character set utf8 default NULL,
  `product_size` varchar(50) character set utf8 default NULL,
  `product_type` varchar(50) character set utf8 default NULL,
  `product_level` varchar(50) character set utf8 default NULL,
  `product_sale_count` int(11) default NULL,
  `product_image` varchar(100) default NULL,
  `produxt_introdution` varchar(500) character set utf8 default NULL,
  `product_infomation` varchar(1000) character set utf8 default NULL,
  `product_is_sale` bit(1) default NULL,
  `product_show_date` date default NULL,
  PRIMARY KEY  (`product_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('1', 'YAMAHA 雅马哈 民谣吉他 F310', '799', '原木色', '41英寸', '民谣吉他', '熟悉者', '0', 'images/guitar_yamaha_f310.jpg', '品牌：YAMAHA 雅马哈\r\n\r\n型号：F310\r\nF系列的设计基于我们的FG系列吉他，具备杰出的耐用性和演奏表现力。', '品牌简介\r\n雅马哈公司是在1887年成立，具有悠久历史的公司。雅马哈通过全世界范围的销售公司，在世界市场占有稳固的位置。基于良好的开端，雅马哈公司逐渐发展成为全球的乐器制造商。随着公司的发展，雅马哈公司凭借其一直秉承的前沿技术和精湛的工艺，以音乐为原点培育技术与感染力，与全世界人民一起共创全新的感动和丰富的文化。', '', '2016-11-06');
INSERT INTO `product` VALUES ('2', 'TAKAMINE D5D 单板民谣吉他', '2409.9', '黑色', '41英寸', '民谣吉他', '专业者', '0', 'images/guitar_TAKAMINE_D5D.jpg', '此款吉他采用标准D型设计，采用单板云杉木面板，玫瑰木背侧板，具有经典的TAKAMINE音色，手感舒适，外型简约大方。', '品牌简介\r\n坐落在日本TAKAMINE山脉环抱中的TAKAMINE公司，已经有了40多年的箱琴改革和制造历史了，它从一个家庭作坊一直发展到今天成为全世界箱琴业界的领导企业之一，在全世界各地，有着无数的吉他手在购买和使用TAKAMINE的吉他。', '', '2016-11-06');
INSERT INTO `product` VALUES ('3', 'KAKA KUC-25D 23寸  单板尤克里里', '423.2', '原木色', '23英寸', '尤克里里', '初学者', '0', 'images/guitar_KAKA_KUC-25D.jpg', '此款吉他专门为初学者而定制，有助于吉他学习者提高演奏水平', '包装清单\r\nKAKA KUC-25D 23寸 单板尤克里里 小吉他', '', '2016-11-06');
INSERT INTO `product` VALUES ('7', 'TOTORO 40寸尖角民谣吉他', '598', '亮光', '40英寸', '电箱吉他', '初学者', '0', 'images/guita_TOTORO40.jpg', '尖角款吉他在于它是删繁就简的结果，更因为它是众多贴近人心的细节所堆积而成的结晶。面板与侧板的无缝接和技术挑战了传统工艺，琴身边缘的圆润倒角，让长时间的演奏变得简单', '让梦想触手可及——尖角吉他 岂止于美', '', '2016-11-07');
INSERT INTO `product` VALUES ('8', 'TOTORO 41寸尖角民谣吉他', '628', '亮光', '41英寸', '电箱吉他', '初学者', '0', 'images/guita_TOTORO41.jpg', '尖角款吉他在于它是删繁就简的结果，更因为它是众多贴近人心的细节所堆积而成的结晶。面板与侧板的无缝接和技术挑战了传统工艺，琴身边缘的圆润倒角，让长时间的演奏变得简单', '让梦想触手可及——尖角吉他 岂止于美', '', '2016-11-07');
INSERT INTO `product` VALUES ('9', 'YAMAHA 雅马哈 古典吉他 C70(原木色)', '847.9', '原木色', '39英寸', '古典吉他', '熟悉者', '0', 'images/guitar_yamaha_c70.jpg', 'YAMAHA 雅马哈 古典吉他 C70(原木色)\r\n\r\n品牌：YAMAHA 雅马哈\r\n\r\n型号：C70\r\nC系列是一款适合古典吉他学习进阶的经典型号', '品牌简介\r\n雅马哈公司是在1887年成立，具有悠久历史的公司。雅马哈通过全世界范围的销售公司，在世界市场占有稳固的位置。基于良好的开端，雅马哈公司逐渐发展成为全球的乐器制造商。随着公司的发展，雅马哈公司凭借其一直秉承的前沿技术和精湛的工艺，以音乐为原点培育技术与感染力，与全世界人民一起共创全新的感动和丰富的文化。\r\n\r\n详细参数\r\n面板：云杉木\r\n背板及侧板：柳安木\r\n琴颈：：那都木\r\n指板：玫瑰木\r\n琴桥：玫瑰木\r\n弦长：650mm\r\n卷弦器：金色\r\n抛光：高抛光\r\n箱体深：94-100mm\r\n品数：19\r\n旋钮：镀金\r\n颜色：原木色\r\n\r\n售后信息\r\n保修期2年\r\n客户服务电话：800-819-0161\r\n包装清单\r\n品牌简介\r\n雅马哈公司是在1887年成立，具有悠久历史的公司。雅马哈通过全世界范围的销售公司，在世界市场占有稳固的位置。基于良好的开端，雅马哈公司逐渐发展成为全球的乐器制造商。随着公司的发展，雅马哈公司凭借其一直秉承的前沿技术和精湛的工艺，以音乐为原点培育技术与感染力，与全世界人民一起共创全新的感动和丰富的文化。', '', '2016-11-07');
INSERT INTO `product` VALUES ('10', 'Glen Burton GE320-GLD Classic LP 风格电吉他', '1369.31', '棕褐色', '38英寸', '电吉他', '专业者', '0', 'images/guitar_GE320.jpg', 'Glen Burton Classic LP Style Electric Guitar, Gold with tan pick guard finish\r\nIncludes Solid Ash Body and Set Maple Neck with Rosewood Fretboard\r\nIncludes Rectangular Inlays and Dual Chrome Covered Humbucker Pickups\r\nIncludes 2 Volume 2 Tone Controls and 3 Way Toggle Switch', 'Glen Burton Classic LP Style Electric Guitar, Gold with tan pick guard finish\r\nIncludes Solid Ash Body and Set Maple Neck with Rosewood Fretboard\r\nIncludes Rectangular Inlays and Dual Chrome Covered Humbucker Pickups\r\nIncludes 2 Volume 2 Tone Controls and 3 Way Toggle Switch', '', '2016-11-07');

-- ----------------------------
-- Table structure for salebefore
-- ----------------------------
DROP TABLE IF EXISTS `salebefore`;
CREATE TABLE `salebefore` (
  `salebefore_id` int(11) NOT NULL auto_increment,
  `user_id` int(11) default NULL,
  `product_id` int(11) default NULL,
  `service_before` varchar(100) default NULL,
  `salebefore_is_handle` bit(1) default NULL,
  PRIMARY KEY  (`salebefore_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of salebefore
-- ----------------------------
INSERT INTO `salebefore` VALUES ('1', '1', '1', 'exchange', '\0');
INSERT INTO `salebefore` VALUES ('2', '2', '2', 'return', '\0');

-- ----------------------------
-- Table structure for salelater
-- ----------------------------
DROP TABLE IF EXISTS `salelater`;
CREATE TABLE `salelater` (
  `salelater_id` int(11) NOT NULL auto_increment,
  `user_id` int(11) default NULL,
  `product_id` int(11) default NULL,
  `deal_id` int(11) default NULL,
  `service_type` varchar(10) default NULL,
  `service_later` varchar(100) character set utf8 default NULL,
  `salelater_is_handle` bit(1) default NULL,
  PRIMARY KEY  (`salelater_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of salelater
-- ----------------------------
INSERT INTO `salelater` VALUES ('1', '1', '1', '1', 'exchange', 'exchange', '\0');
INSERT INTO `salelater` VALUES ('2', '2', '2', '2', 'return', 'return', '\0');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` int(11) NOT NULL auto_increment,
  `user_account` varchar(50) default NULL,
  `user_password` varchar(50) default NULL,
  `user_name` varchar(50) character set utf8 default NULL,
  `user_image` varchar(200) default NULL,
  `user_phone` varchar(50) default NULL,
  `user_email` varchar(100) default NULL,
  `user_address` varchar(300) character set utf8 default NULL,
  `user_point` int(11) default NULL,
  `user_vip` bit(1) default NULL,
  PRIMARY KEY  (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'shaoguoji', 'ICy5YqxZB1uWSwcVLSNLcA==', '邵国际', null, '18814142017', '752147916@qq.com', '广东省广州市海珠区仲恺路500号仲恺学生公寓', '400', '\0');
INSERT INTO `user` VALUES ('2', 'caikaizhen', 'ICy5YqxZB1uWSwcVLSNLcA==', '蔡楷臻', null, '12345678901', '111111111@qq.com', '广东省广州市海珠区仲恺路500号仲恺学生公寓', '500', '\0');
INSERT INTO `user` VALUES ('3', 'Jigiang', 'ICy5YqxZB1uWSwcVLSNLcA==', '钟志坚', null, '18835235123', '22222222@qq.com', '广东省广州市海珠区仲恺路500号仲恺学生公寓', '600', '\0');
