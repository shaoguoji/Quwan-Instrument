/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50051
Source Host           : localhost:3306
Source Database       : instrument

Target Server Type    : MYSQL
Target Server Version : 50051
File Encoding         : 65001

Date: 2016-11-06 03:58:26
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
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'shaoguoji', '123', 'sale', '1');
INSERT INTO `admin` VALUES ('2', 'caikaizhen', '123', 'buy', '1');
INSERT INTO `admin` VALUES ('4', 'rotterzheng', '123', 'data', '1');
INSERT INTO `admin` VALUES ('3', 'Jigiang', '123', 'product', '1');
INSERT INTO `admin` VALUES ('5', 'yanghuiru', '123', 'system', '1');

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
  `product_id` int(11) default NULL,
  `product_count` int(11) default NULL,
  `deal_create_date` date default NULL,
  `deal_send_date` date default NULL,
  `deal_receive_date` date default NULL,
  `deal_isdelete` bit(1) default NULL,
  PRIMARY KEY  (`deal_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of deal
-- ----------------------------
INSERT INTO `deal` VALUES ('1', '799', 'payed', '1', '1', '2016-11-06', '2016-11-06', '2016-11-06', '\0');

-- ----------------------------
-- Table structure for deal_shopping
-- ----------------------------
DROP TABLE IF EXISTS `deal_shopping`;
CREATE TABLE `deal_shopping` (
  `deal_shopping_id` int(11) NOT NULL auto_increment,
  `user_id` int(11) default NULL,
  `deal_id` int(11) default NULL,
  `product_id` int(11) default NULL,
  `priduct_count` int(11) default NULL,
  `shopping_number` varchar(50) default NULL,
  `shopping_isbuy` bit(1) default NULL,
  PRIMARY KEY  (`deal_shopping_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of deal_shopping
-- ----------------------------
INSERT INTO `deal_shopping` VALUES ('1', '1', '1', '1', '1', '456345423467892345', '\0');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `product_id` int(11) NOT NULL auto_increment,
  `property_id` int(11) default NULL,
  `product_name` varchar(50) character set utf8 default NULL,
  `product_image` varchar(50) default NULL,
  `produxt_introdution` varchar(500) character set utf8 default NULL,
  `product_infomation` varchar(1000) character set utf8 default NULL,
  `product_is_sale` bit(1) default NULL,
  `product_show_date` date default NULL,
  `product_great` bit(1) default NULL,
  `product_new` bit(1) default NULL,
  PRIMARY KEY  (`product_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('1', '1', 'YAMAHA 雅马哈 民谣吉他 F310', 'images/guitar_yamaha_f310.jpg', '品牌：YAMAHA 雅马哈\r\n\r\n型号：F310\r\nF系列的设计基于我们的FG系列吉他，具备杰出的耐用性和演奏表现力。', '品牌简介\r\n雅马哈公司是在1887年成立，具有悠久历史的公司。雅马哈通过全世界范围的销售公司，在世界市场占有稳固的位置。基于良好的开端，雅马哈公司逐渐发展成为全球的乐器制造商。随着公司的发展，雅马哈公司凭借其一直秉承的前沿技术和精湛的工艺，以音乐为原点培育技术与感染力，与全世界人民一起共创全新的感动和丰富的文化。', '', '2016-11-06', '', '');
INSERT INTO `product` VALUES ('2', '2', 'TAKAMINE D5D 单板民谣吉他', 'images/guitar_TAKAMINE_D5D.jpg', '此款吉他采用标准D型设计，采用单板云杉木面板，玫瑰木背侧板，具有经典的TAKAMINE音色，手感舒适，外型简约大方。', '品牌简介\r\n坐落在日本TAKAMINE山脉环抱中的TAKAMINE公司，已经有了40多年的箱琴改革和制造历史了，它从一个家庭作坊一直发展到今天成为全世界箱琴业界的领导企业之一，在全世界各地，有着无数的吉他手在购买和使用TAKAMINE的吉他。', '', '2016-11-06', '', '');
INSERT INTO `product` VALUES ('3', '3', 'KAKA KUC-25D 23寸 单板尤克里里 小吉他', 'images/guitar_KAKA_KUC-25D.jpg', '适合初学者使用', '包装清单\r\nKAKA KUC-25D 23寸 单板尤克里里 小吉他', '', '2016-11-06', '', '');
INSERT INTO `product` VALUES ('4', '4', 'YAMAHA 雅马哈 ARIUS系列 YDP-162R 数码钢琴(含琴凳 配套琴架及三踏板) ', 'images/piano_yamaha_YDP-162R.jpg', '产品特点：-带有合成象牙表面琴键GH（渐层式配重）键盘 -四层动态采样的RGE标准音源 -发音数128 -10种逼真实用的音色 -两轨乐曲录音功能 -智能声学优化 -双音色与双人演奏功能', '全新的琴体高度 随着演奏水准的提升，您或许需要一款更适合自己的数码钢琴作为练习用琴，YDP-162就是这么一款您所需要的产品。仿象牙表面的GH键盘，只有在古董钢琴上才能体验到的手感，在这款YDP-162上却可以充分感受到。如果你的终极目标是钢琴演奏家的话，这款配备了雅马哈音乐会三角钢琴CFIIIS音色的数码钢琴，绝对是您的不二选择。 雅马哈品质的钢琴音色 拥有雅马哈***音乐会三角钢琴CFIIIS的采样，并且在动态层次上做到了尽可能丰富，从极强到极弱的各种力度一应俱全，细微之处可见一斑。 全新琴体高度 较之前的Arius系列产品，YDP-162在琴体高度上有了变化（含琴架）。加高的琴体尺寸，让琴箱能传导更低沉的钢琴音色，提高了演奏体验。 智能声学优化 智能声学优化系统是雅马哈较新的独创，通过物理结构的变化来影响声音传导，同时通过内部数字技术的革新，使在极小的音量下依旧能够获得清晰真实的声音表现力。 录制自己的演奏 内置两轨录音功能，可以很好的记录您的弹奏。通过左右手分轨录制，可以更好得进行演奏练习。同时还可以调节速度进行录制，让歌曲的速度更适合自己的演奏状态。', '', '2016-11-06', '', '');

-- ----------------------------
-- Table structure for product_property
-- ----------------------------
DROP TABLE IF EXISTS `product_property`;
CREATE TABLE `product_property` (
  `product_property_id` int(11) NOT NULL auto_increment,
  `product_price` float default NULL,
  `product_color` varchar(50) character set utf8 default NULL,
  `product_size` varchar(50) character set utf8 default NULL,
  `product_type` varchar(50) character set utf8 default NULL,
  `product_level` varchar(50) default NULL,
  `product_sale_count` int(11) default NULL,
  PRIMARY KEY  (`product_property_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of product_property
-- ----------------------------
INSERT INTO `product_property` VALUES ('1', '799', '原木色', '41寸', 'guitar', '2', '0');
INSERT INTO `product_property` VALUES ('2', '2409.9', '黑色', '41寸', 'guitar', '3', '0');
INSERT INTO `product_property` VALUES ('3', '423.2', '原木色', '23寸', 'guitar', '1', '0');
INSERT INTO `product_property` VALUES ('4', null, null, null, null, null, null);

-- ----------------------------
-- Table structure for salebefore
-- ----------------------------
DROP TABLE IF EXISTS `salebefore`;
CREATE TABLE `salebefore` (
  `salebefore_id` int(11) NOT NULL auto_increment,
  `user_id` int(11) default NULL,
  `product_id` int(11) default NULL,
  `service_before` varchar(100) default NULL,
  PRIMARY KEY  (`salebefore_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of salebefore
-- ----------------------------
INSERT INTO `salebefore` VALUES ('1', '1', '1', 'exchange');
INSERT INTO `salebefore` VALUES ('2', '2', '2', 'return');

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
  PRIMARY KEY  (`salelater_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of salelater
-- ----------------------------
INSERT INTO `salelater` VALUES ('1', '1', '1', '1', 'exchange', 'exchange');
INSERT INTO `salelater` VALUES ('2', '2', '2', '2', 'return', 'return');

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
INSERT INTO `user` VALUES ('1', 'shaoguoji', '123', '邵国际', null, '18814142017', '752147916@qq.com', '广东省广州市海珠区仲恺路500号仲恺学生公寓', '0', '\0');
INSERT INTO `user` VALUES ('2', 'caikaizhen', '123', '蔡楷臻', null, '12345678901', '111111111@qq.com', '广东省广州市海珠区仲恺路500号仲恺学生公寓', '0', '\0');
INSERT INTO `user` VALUES ('3', 'Jigiang', '123', '钟志坚', null, '18835235123', '22222222@qq.com', '广东省广州市海珠区仲恺路500号仲恺学生公寓', '0', '\0');
