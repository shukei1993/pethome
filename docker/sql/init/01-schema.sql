/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50525
Source Host           : localhost:3306
Source Database       : pethome

Target Server Type    : MYSQL
Target Server Version : 50525
File Encoding         : 65001

Date: 2020-07-02 10:03:09
*/

SET FOREIGN_KEY_CHECKS=0;
-- ‌统一设置客户端、连接和结果字符集 2026.11.13
SET NAMES utf8mb4;

-- ----------------------------
-- Table structure for `t_department`
-- ----------------------------
DROP TABLE IF EXISTS `t_department`;
CREATE TABLE `t_department` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sn` varchar(255) NOT NULL COMMENT '部门编号',
  `name` varchar(255) NOT NULL COMMENT '部门名称',
  `state` int(20) DEFAULT NULL COMMENT '部门状态，0正常，1禁用',
  `manager_id` bigint(20) DEFAULT NULL COMMENT '部门管理员，关联Employee表id',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '上级部门',
  PRIMARY KEY (`id`),
  KEY `manager_id` (`manager_id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_department
-- ----------------------------
INSERT INTO `t_department` VALUES ('3', '001', '开发部', '1', '1', null);
INSERT INTO `t_department` VALUES ('7', '002', '测试一部', '1', '3', '3');
INSERT INTO `t_department` VALUES ('8', '002', '测试2部', '1', '4', '3');
INSERT INTO `t_department` VALUES ('9', '003', '测试3部', '1', '5', '9');

-- ----------------------------
-- Table structure for `t_employee`
-- ----------------------------
DROP TABLE IF EXISTS `t_employee`;
CREATE TABLE `t_employee` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `state` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=316 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_employee
-- ----------------------------
INSERT INTO `t_employee` VALUES ('1', 'admin', 'admin@itsource.com', null, '831d092d59f6e305ebcfa77e05135eac', '34', '1');
INSERT INTO `t_employee` VALUES ('2', 'roleAdmin', 'roleAdmin@itsource.cn', null, '831d092d59f6e305ebcfa77e05135eac', '25', '1');
INSERT INTO `t_employee` VALUES ('3', 'admin1', 'amdin1@itsource.cn', null, '831d092d59f6e305ebcfa77e05135eac', '25', '1');
INSERT INTO `t_employee` VALUES ('4', 'admin2', 'amdin2@itsource.cn', null, '831d092d59f6e305ebcfa77e05135eac', '25', '0');
INSERT INTO `t_employee` VALUES ('5', 'admin3', 'amdin3@itsource.cn', null, '89335a5f0fdd015113e9acf90727cdce', '25', '-1');
INSERT INTO `t_employee` VALUES ('6', 'admin4', 'amdin4@itsource.cn', null, '12e4dc60e1813184b3e4552dedd7bf9b', '25', '1');
INSERT INTO `t_employee` VALUES ('7', 'admin5', 'amdin5@itsource.cn', null, '02f9b7f759b5654d421c0ce458d16c28', '25', '1');
INSERT INTO `t_employee` VALUES ('8', 'admin6', 'amdin6@itsource.cn', null, '138e943e0987d1fff7a4c367deedd4e3', '6', '1');
INSERT INTO `t_employee` VALUES ('9', 'admin7', 'amdin7@itsource.cn', null, '53bf9cd2cb250a9d82c3260b6d398d73', '25', '1');
INSERT INTO `t_employee` VALUES ('13', 'admin11', 'amdin11@itsource.cn', null, 'c953909c87335d7fbc0f004c850d5899', '25', '1');
INSERT INTO `t_employee` VALUES ('14', 'admin12', 'amdin12@itsource.cn', null, '57c15b685c731241ceb257436da984ce', '10', '1');
INSERT INTO `t_employee` VALUES ('15', 'admin13', 'amdin13@itsource.cn', null, '72b5871658a55870f55c7cedcdbfc750', '25', '1');
INSERT INTO `t_employee` VALUES ('16', 'admin14', 'amdin14@itsource.cn', null, '3aaae1c105814d0e3b6de8f4e7befe3f', '25', '1');
INSERT INTO `t_employee` VALUES ('17', 'admin15', 'amdin15@itsource.cn', null, 'ec466277d5e194ce58b4be14de342e0d', '25', '1');
INSERT INTO `t_employee` VALUES ('18', 'admin16', 'amdin16@itsource.cn', null, '0f49d0f9f47fbdbe311b90b39d071389', '25', '1');
INSERT INTO `t_employee` VALUES ('19', 'admin17', 'amdin17@itsource.cn', null, '684e22f740a05d25f63a16ed9b22bd3a', '25', '1');
INSERT INTO `t_employee` VALUES ('20', 'admin18', 'amdin18@itsource.cn', null, '6b3f18873b8c1fa7948d2eefd236f0b0', '25', '1');
INSERT INTO `t_employee` VALUES ('21', 'admin19', 'amdin19@itsource.cn', null, '6ed03e3efc7f62c780e5a5f05327c2dd', '25', '1');
INSERT INTO `t_employee` VALUES ('22', 'admin20', 'amdin20@itsource.cn', null, 'b19bb9f57188bb9017a5f1e334f6cad4', '25', '1');
INSERT INTO `t_employee` VALUES ('23', 'admin21', 'amdin21@itsource.cn', null, '8d366e02c4373f215e5fae12ef04ecb2', '25', '1');
INSERT INTO `t_employee` VALUES ('24', 'admin22', 'amdin22@itsource.cn', null, '8a27c7cc380d853babd2c04c9d72625f', '25', '1');
INSERT INTO `t_employee` VALUES ('25', 'admin23', 'amdin23@itsource.cn', null, '1a9687e7f1d50e800b2ece459e654408', '25', '1');
INSERT INTO `t_employee` VALUES ('26', 'admin24', 'amdin24@itsource.cn', null, '4f3d03f2d6eaa67ee678cb25ab6f30fd', '25', '1');
INSERT INTO `t_employee` VALUES ('27', 'admin25', 'amdin25@itsource.cn', null, '8309757711ae53bf971ada0eb756fcad', '25', '1');
INSERT INTO `t_employee` VALUES ('28', 'admin26', 'amdin26@itsource.cn', null, '65faa932744343a804d2644d6725c809', '25', '1');
INSERT INTO `t_employee` VALUES ('29', 'admin27', 'amdin27@itsource.cn', null, 'c37e2a159c4104b5efafeb48c4d3f8a8', '25', '1');
INSERT INTO `t_employee` VALUES ('30', 'admin28', 'amdin28@itsource.cn', null, 'b4d8369858ca62b1871f611a17ab6c85', '25', '1');
INSERT INTO `t_employee` VALUES ('31', 'admin29', 'amdin29@itsource.cn', null, '32761f6f732cbd3a9b1395f3d0282361', '25', '1');
INSERT INTO `t_employee` VALUES ('32', 'admin30', 'amdin30@itsource.cn', null, '2bde47bd1a502737c2bf7ef8bca461e7', '25', '1');
INSERT INTO `t_employee` VALUES ('33', 'admin31', 'amdin31@itsource.cn', null, '1024d7721d427b5625ad0dd73a22d839', '25', '1');
INSERT INTO `t_employee` VALUES ('34', 'admin32', 'amdin32@itsource.cn', null, '67b6c36942783249382c2871fbcc1cb5', '25', '1');
INSERT INTO `t_employee` VALUES ('35', 'admin33', 'amdin33@itsource.cn', null, '8fda601d305b34e693f41b0f8cb4267e', '25', '1');
INSERT INTO `t_employee` VALUES ('36', 'admin34', 'amdin34@itsource.cn', null, 'fab9a4475f7ee7e49890cdf3b2f157bf', '25', '1');
INSERT INTO `t_employee` VALUES ('37', 'admin35', 'amdin35@itsource.cn', null, 'dd90df5259c45dab53823aa2b5ac5ab9', '25', '1');
INSERT INTO `t_employee` VALUES ('38', 'admin36', 'amdin36@itsource.cn', null, 'c265ec550b72583d14cf66f5874d3679', '25', '1');
INSERT INTO `t_employee` VALUES ('39', 'admin37', 'amdin37@itsource.cn', null, '1dbb67fa18836c047c87fa1fbffacd6b', '25', '1');
INSERT INTO `t_employee` VALUES ('40', 'admin38', 'amdin38@itsource.cn', null, '2bd08251c9aba4e1057bbe877164cbe1', '25', '1');
INSERT INTO `t_employee` VALUES ('41', 'admin39', 'amdin39@itsource.cn', null, '4b56537a50ebe8e4814e7e684ec7e938', '25', '1');
INSERT INTO `t_employee` VALUES ('42', 'admin40', 'amdin40@itsource.cn', null, 'ab9d29a6001519fe0ae60064c350760a', '25', '1');
INSERT INTO `t_employee` VALUES ('43', 'admin41', 'amdin41@itsource.cn', null, '36d035b690b5d06002f3e26cc8cc02aa', '25', '1');
INSERT INTO `t_employee` VALUES ('44', 'admin42', 'amdin42@itsource.cn', null, '6189eeb659b66c0121d8e6c5865865a8', '25', '1');
INSERT INTO `t_employee` VALUES ('45', 'admin43', 'amdin43@itsource.cn', null, '7c436b40cc462818481ba1ef64f4a4ca', '25', '1');
INSERT INTO `t_employee` VALUES ('46', 'admin44', 'amdin44@itsource.cn', null, '97d22105abec0c9672d503723e136100', '25', '1');
INSERT INTO `t_employee` VALUES ('47', 'admin45', 'amdin45@itsource.cn', null, 'c8db7f4d490c177925c3c86f11ece83c', '25', '1');
INSERT INTO `t_employee` VALUES ('48', 'admin46', 'amdin46@itsource.cn', null, 'b78114c2399ae23a624b72de85d7cf51', '25', '1');
INSERT INTO `t_employee` VALUES ('49', 'admin47', 'amdin47@itsource.cn', null, 'c00cfd28ef690dc6920d1c9b251f42d8', '25', '1');
INSERT INTO `t_employee` VALUES ('50', 'admin48', 'amdin48@itsource.cn', null, '214b22a99efeef099b1867874c337108', '25', '1');
INSERT INTO `t_employee` VALUES ('51', 'admin49', 'amdin49@itsource.cn', null, '128dad1c555bf4ede2e26206dc92ce1b', '25', '1');
INSERT INTO `t_employee` VALUES ('52', 'admin50', 'amdin50@itsource.cn', null, '062f6299b738b135a73e4c3a64a13a15', '25', '1');
INSERT INTO `t_employee` VALUES ('53', 'admin51', 'amdin51@itsource.cn', null, '3d2f81419d5288c127ec815dfe9e4522', '25', '1');
INSERT INTO `t_employee` VALUES ('54', 'admin52', 'amdin52@itsource.cn', null, '480870bc0920e59dde8998ceba258c03', '25', '1');
INSERT INTO `t_employee` VALUES ('55', 'admin53', 'amdin53@itsource.cn', null, 'b4dc6f1821a2a3332a4bcb3b89490997', '25', '1');
INSERT INTO `t_employee` VALUES ('56', 'admin54', 'amdin54@itsource.cn', null, '9933c8cddd2577281c92b70aa9025f04', '25', '1');
INSERT INTO `t_employee` VALUES ('57', 'admin55', 'amdin55@itsource.cn', null, '52d52dbf39f8459f5a716ce39aff4864', '25', '1');
INSERT INTO `t_employee` VALUES ('58', 'admin56', 'amdin56@itsource.cn', null, 'fcb2b6a672577d89f1227d07b78fcaef', '25', '1');
INSERT INTO `t_employee` VALUES ('59', 'admin57', 'amdin57@itsource.cn', null, 'f2e3452ad0c170f7c5dc307f02012007', '25', '1');
INSERT INTO `t_employee` VALUES ('60', 'admin58', 'amdin58@itsource.cn', null, 'bb8c525fa0dc184229ed2d99d9a6601e', '25', '1');
INSERT INTO `t_employee` VALUES ('61', 'admin59', 'amdin59@itsource.cn', null, 'ba8189906a9cc50bf156c62a8d55f835', '25', '1');
INSERT INTO `t_employee` VALUES ('62', 'admin60', 'amdin60@itsource.cn', null, 'a1cf16ba52327acee543ade45fe2a408', '25', '1');
INSERT INTO `t_employee` VALUES ('63', 'admin61', 'amdin61@itsource.cn', null, 'b38de8af165c14b7b68fb0dcdaea0e28', '25', '1');
INSERT INTO `t_employee` VALUES ('64', 'admin62', 'amdin62@itsource.cn', null, '8f2531b74f008cd456696da6d6a909d7', '25', '1');
INSERT INTO `t_employee` VALUES ('65', 'admin63', 'amdin63@itsource.cn', null, 'bb16c7f9cbea20dafd0fe4f3e404c5fc', '25', '1');
INSERT INTO `t_employee` VALUES ('66', 'admin64', 'amdin64@itsource.cn', null, 'dfeab8b4b419cc4806545a3a1160023e', '25', '1');
INSERT INTO `t_employee` VALUES ('67', 'admin65', 'amdin65@itsource.cn', null, 'd7b78f460b9559557c13af5e637ea921', '25', '1');
INSERT INTO `t_employee` VALUES ('68', 'admin66', 'amdin66@itsource.cn', null, '6b892f86125ed46422b582718bccbaa3', '25', '1');
INSERT INTO `t_employee` VALUES ('69', 'admin67', 'amdin67@itsource.cn', null, '89186a2ef55c1e92160d40eac0358fa4', '25', '1');
INSERT INTO `t_employee` VALUES ('70', 'admin68', 'amdin68@itsource.cn', null, '724beb114c3e0094974b4a495861534f', '25', '1');
INSERT INTO `t_employee` VALUES ('71', 'admin69', 'amdin69@itsource.cn', null, 'a2311a2b59adbb74ddaa8131993e8963', '25', '1');
INSERT INTO `t_employee` VALUES ('72', 'admin70', 'amdin70@itsource.cn', null, '7b8a5667d10bb57744138f5cd6eb3411', '25', '1');
INSERT INTO `t_employee` VALUES ('73', 'admin71', 'amdin71@itsource.cn', null, '927165e67ed3039642578e4f18a65f3c', '25', '1');
INSERT INTO `t_employee` VALUES ('74', 'admin72', 'amdin72@itsource.cn', null, '028615d0a82f39b32ef8df6d7ec9e6d5', '25', '1');
INSERT INTO `t_employee` VALUES ('75', 'admin73', 'amdin73@itsource.cn', null, 'b561bc012063aaf336eddc132564b39b', '25', '1');
INSERT INTO `t_employee` VALUES ('76', 'admin74', 'amdin74@itsource.cn', null, 'fa33a53cf7b3ff49e31da3671d421ad4', '25', '1');
INSERT INTO `t_employee` VALUES ('77', 'admin75', 'amdin75@itsource.cn', null, 'cf4eb8cd0d65a61d0acf0212cb98719f', '25', '1');
INSERT INTO `t_employee` VALUES ('78', 'admin76', 'amdin76@itsource.cn', null, 'e7b06297d2c6fb7426c19a184006ea04', '25', '1');
INSERT INTO `t_employee` VALUES ('79', 'admin77', 'amdin77@itsource.cn', null, '7cc040d1d56a399597a1ca1105a8f392', '25', '1');
INSERT INTO `t_employee` VALUES ('80', 'admin78', 'amdin78@itsource.cn', null, '0afc812c6e7f064a0581c7ac8823e4e1', '25', '1');
INSERT INTO `t_employee` VALUES ('81', 'admin79', 'amdin79@itsource.cn', null, 'df2fc7fd6a88ab389a8997b4f979227f', '25', '1');
INSERT INTO `t_employee` VALUES ('82', 'admin80', 'amdin80@itsource.cn', null, '917edbaba9dd839940f1ea6115b81fb4', '25', '1');
INSERT INTO `t_employee` VALUES ('84', 'admin82', 'amdin82@itsource.cn', null, '23f556879c4d48b62685a4c74462ff20', '25', '1');
INSERT INTO `t_employee` VALUES ('85', 'admin83', 'amdin83@itsource.cn', null, '278bb2a5264784023e10479286bf6ad1', '25', '1');
INSERT INTO `t_employee` VALUES ('86', 'admin84', 'amdin84@itsource.cn', null, '4b646957feea88bd919786b53308e5fe', '25', '1');
INSERT INTO `t_employee` VALUES ('87', 'admin85', 'amdin85@itsource.cn', null, '89e268a7194c186542a2462e9067803f', '25', '1');
INSERT INTO `t_employee` VALUES ('88', 'admin86', 'amdin86@itsource.cn', null, 'df286298bac9ae074263804dcc4b6746', '25', '1');
INSERT INTO `t_employee` VALUES ('89', 'admin87', 'amdin87@itsource.cn', null, 'efe3f582c67ad9c5990d684370b2091b', '25', '1');
INSERT INTO `t_employee` VALUES ('90', 'admin88', 'amdin88@itsource.cn', null, '2442a32ec232ccdd526e1187ca8b8e63', '25', '1');
INSERT INTO `t_employee` VALUES ('91', 'admin89', 'amdin89@itsource.cn', null, '9d02d47995b34e23466ea3f884123b92', '25', '1');
INSERT INTO `t_employee` VALUES ('92', 'admin90', 'amdin90@itsource.cn', null, '361f59cad3911de5f5dc8c0eb0edc837', '25', '1');
INSERT INTO `t_employee` VALUES ('94', 'admin92', 'amdin92@itsource.cn', null, '5a9e4a3970e5dfe918119678b219776f', '25', '1');
INSERT INTO `t_employee` VALUES ('95', 'admin93', 'amdin93@itsource.cn', null, '0668938be4636952839cd7ac3327b710', '25', '1');
INSERT INTO `t_employee` VALUES ('96', 'admin94', 'amdin94@itsource.cn', null, 'b0515c6643d36d015d818bacabb3fa75', '25', '1');
INSERT INTO `t_employee` VALUES ('97', 'admin95', 'amdin95@itsource.cn', null, '9fe8133f960ada5d89d04206e0d6cacf', '25', '1');
INSERT INTO `t_employee` VALUES ('98', 'admin96', 'amdin96@itsource.cn', null, '16f7780cba2e0894b556f784cad4f9e6', '25', '1');
INSERT INTO `t_employee` VALUES ('99', 'admin97', 'amdin97@itsource.cn', null, 'b2038b73d0c2ae5d7fa69f8500dbf0b9', '25', '1');
INSERT INTO `t_employee` VALUES ('100', 'admin98', 'amdin98@itsource.cn', null, '93a4828f14a6d6b583d73e3c32660f69', '25', '1');
INSERT INTO `t_employee` VALUES ('101', 'admin99', 'amdin99@itsource.cn', null, '211660364fa51c7ae846fef09527a957', '25', '1');
INSERT INTO `t_employee` VALUES ('174', '左右', '23123', null, 'd5a3fedf6c59c2ecbe7f7a6c1a22da37', null, '1');
INSERT INTO `t_employee` VALUES ('175', '顶替', '234', null, '50ef600f543c4773eb7c4fa53d6e783b', null, '1');
INSERT INTO `t_employee` VALUES ('176', '234', '234234', null, '586b3891775a181dd42777da93014c66', null, '1');
INSERT INTO `t_employee` VALUES ('177', 'aaaa', '23434', null, null, '44', '1');
INSERT INTO `t_employee` VALUES ('178', 'sdf', '123', null, '123', null, '1');
INSERT INTO `t_employee` VALUES ('179', 'ewr', '123', null, null, '34', '1');
INSERT INTO `t_employee` VALUES ('181', 'admin77', 'amdin7@itsource.cn', null, null, '25', '1');
INSERT INTO `t_employee` VALUES ('184', 'asdf', '234', null, 'sd', null, '1');
INSERT INTO `t_employee` VALUES ('190', 'sdfasdf', '', null, 'sdafdf', null, '1');
INSERT INTO `t_employee` VALUES ('191', 'sfsdaf', '', null, '', null, '1');
INSERT INTO `t_employee` VALUES ('192', 'sdfa', '', null, '', null, '1');
INSERT INTO `t_employee` VALUES ('198', 'admin811c5f', 'lsq@itsource.cn', null, '123456', '25', '1');
INSERT INTO `t_employee` VALUES ('199', 'admin185c14d', 'amdin1@itsource.cn', null, '123456', '60', '1');
INSERT INTO `t_employee` VALUES ('200', 'admin5d6c610', 'amdin5@itsource.cn', null, '123456', '25', '1');
INSERT INTO `t_employee` VALUES ('201', 'admin11d639b3', 'amdin11@itsource.cn', null, '123456', '25', '1');
INSERT INTO `t_employee` VALUES ('204', 'fasdfasdf', '', null, '123', null, '1');
INSERT INTO `t_employee` VALUES ('208', 'sadfsdf', null, null, null, null, '1');
INSERT INTO `t_employee` VALUES ('210', 'sadfdfwe', null, null, null, null, '1');
INSERT INTO `t_employee` VALUES ('229', 'aaaaa', '', null, '', null, '1');
INSERT INTO `t_employee` VALUES ('230', 'bbbb', '213', null, '111111', '23', '1');
INSERT INTO `t_employee` VALUES ('233', 'dfsdf', 'sdfsdf', null, 'sdf', '324', '1');
INSERT INTO `t_employee` VALUES ('234', 'sfafs', 'wer', null, '234234', '23', '1');
INSERT INTO `t_employee` VALUES ('235', 'wer', 'wer', null, 'wer', '34', '1');
INSERT INTO `t_employee` VALUES ('236', '222222', 'qe', null, 'eqwe', '23', '1');
INSERT INTO `t_employee` VALUES ('240', '123222', '123@qq.com', null, '123', '21', '1');
INSERT INTO `t_employee` VALUES ('245', 'admin1111', '', null, '111111', null, '1');
INSERT INTO `t_employee` VALUES ('246', 'sfsfsf', '123@qq.com', null, '12345', '123', '1');
INSERT INTO `t_employee` VALUES ('247', 'sfsfsf', '', null, '12345', null, '1');
INSERT INTO `t_employee` VALUES ('262', 'asdf23', 'wqe@qq.com', null, '123', '31', '1');
INSERT INTO `t_employee` VALUES ('263', 'asdfxx', 'sdf@qq.com', null, '123', '34', '1');
INSERT INTO `t_employee` VALUES ('264', 'sad12', 'sdf@qq.com', null, 'd5a3fedf6c59c2ecbe7f7a6c1a22da37', '34', '1');
INSERT INTO `t_employee` VALUES ('265', 'sdfasfasdf', 'sdf@qq.com', null, 'd5a3fedf6c59c2ecbe7f7a6c1a22da37', '23', '1');
INSERT INTO `t_employee` VALUES ('266', 'admin063-1756-4e3c-8ecb-33fe746ae077', 'lsq@itsource.cn', null, '48d05cc43f3bfe2510394e8dfcef919a', '25', '1');
INSERT INTO `t_employee` VALUES ('267', 'monkey500eec-fe27-4ff1-91ef-82d34c400b8f', 'amdin1@itsource.cn', null, '6a4876827226fb87ffeb78edb2b1e7ad', '60', '1');
INSERT INTO `t_employee` VALUES ('268', 'admin5d93-266a-4bcd-9852-15586484ea1d', 'amdin5@itsource.cn', null, '02f9b7f759b5654d421c0ce458d16c28', '25', '1');
INSERT INTO `t_employee` VALUES ('269', 'admin1188c-220e-4e42-b364-1439e008eded', 'amdin11@itsource.cn', null, 'c953909c87335d7fbc0f004c850d5899', '25', '1');
INSERT INTO `t_employee` VALUES ('270', 'adminf0d-408f-4859-a454-ac51604ae0fd', 'lsq@itsource.cn', null, '48d05cc43f3bfe2510394e8dfcef919a', '25', '1');
INSERT INTO `t_employee` VALUES ('271', 'monkey50083b-0ca2-4bd3-8e31-df2248b5ede7', 'amdin1@itsource.cn', null, '6a4876827226fb87ffeb78edb2b1e7ad', '60', '1');
INSERT INTO `t_employee` VALUES ('272', 'admin50b4-cac6-4f70-b404-2276dade3d34', 'amdin5@itsource.cn', null, '02f9b7f759b5654d421c0ce458d16c28', '25', '1');
INSERT INTO `t_employee` VALUES ('274', 'root', '1322156', null, 'admin', '20', '1');
INSERT INTO `t_employee` VALUES ('275', 'root', '1322156', null, 'admin', '20', '1');
INSERT INTO `t_employee` VALUES ('276', 'root', '1322156', null, 'admin', '20', '1');
INSERT INTO `t_employee` VALUES ('277', 'root', '1322156', null, 'admin', '20', '1');
INSERT INTO `t_employee` VALUES ('278', 'root', '1322156', null, 'admin', '20', '1');
INSERT INTO `t_employee` VALUES ('279', 'root', '1322156', null, 'admin', '20', '1');
INSERT INTO `t_employee` VALUES ('280', 'root', '1322156', null, 'admin', '20', '1');
INSERT INTO `t_employee` VALUES ('281', 'root', '1322156', null, 'admin', '20', '1');
INSERT INTO `t_employee` VALUES ('282', 'root', '1322156', null, 'admin', '20', '1');
INSERT INTO `t_employee` VALUES ('283', 'root', '1322156', null, 'admin', '20', '1');
INSERT INTO `t_employee` VALUES ('284', 'root2', 'egngwmip', null, 'admin', '20', '0');
INSERT INTO `t_employee` VALUES ('285', 'root2', 'egngwmip', null, 'admin', '20', '1');
INSERT INTO `t_employee` VALUES ('296', 'dsdbds', 'sbdbsds', null, 'a5c31aadfdef19b33c3f35f443003ea3', '2254', '1');
INSERT INTO `t_employee` VALUES ('299', 'hmtest', 'amdin8@itsource.cn', null, '831d092d59f6e305ebcfa77e05135eac', '20', '1');
INSERT INTO `t_employee` VALUES ('305', 'roleAdmin@itsource.cn', 'roleAdmin@itsource.cn', null, '8d4f18fb2457bf6f8e1825d0ad916bfc', '25', '1');
INSERT INTO `t_employee` VALUES ('308', 'yhptest', null, null, '7ee369c48d89b697ada174fbf5cc19f3', null, '1');
INSERT INTO `t_employee` VALUES ('309', '1', null, '1', '7ee369c48d89b697ada174fbf5cc19f3', null, '1');
INSERT INTO `t_employee` VALUES ('310', '1', null, '13330964748', 'ca9368e6680b9e6da8a8474064b91ea2', null, '1');
INSERT INTO `t_employee` VALUES ('311', '3', null, '13330964748', '71abc75c7a89ef16992041dfc0f3f3bc', null, '1');
INSERT INTO `t_employee` VALUES ('312', '4', 'a@a.com', '13330964748', '321fac84756d38d2916997de17426eeb', null, '1');
INSERT INTO `t_employee` VALUES ('313', 'hmtest', '64009120@qq.com', '15008495702', '123456', '0', '1');
INSERT INTO `t_employee` VALUES ('314', '44444', '66666', '55555', '77777', null, '0');
INSERT INTO `t_employee` VALUES ('315', '4444', '6666', '5555', '77777', null, '0');

-- ----------------------------
-- Table structure for `t_employee_role`
-- ----------------------------
DROP TABLE IF EXISTS `t_employee_role`;
CREATE TABLE `t_employee_role` (
  `employee_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  PRIMARY KEY (`employee_id`,`role_id`),
  KEY `FK87184F674D26E00F` (`role_id`),
  KEY `FK87184F6710B1828F` (`employee_id`),
  CONSTRAINT `FK87184F6710B1828F` FOREIGN KEY (`employee_id`) REFERENCES `t_employee` (`id`),
  CONSTRAINT `FK87184F674D26E00F` FOREIGN KEY (`role_id`) REFERENCES `t_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_employee_role
-- ----------------------------
INSERT INTO `t_employee_role` VALUES ('1', '1');
INSERT INTO `t_employee_role` VALUES ('2', '2');
INSERT INTO `t_employee_role` VALUES ('3', '4');

-- ----------------------------
-- Table structure for `t_logininfo`
-- ----------------------------
DROP TABLE IF EXISTS `t_logininfo`;
CREATE TABLE `t_logininfo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `type` bit(1) DEFAULT NULL,
  `disable` bit(1) DEFAULT NULL,
  `salt` varchar(255) DEFAULT NULL,
  `uid` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=306 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_logininfo
-- ----------------------------
INSERT INTO `t_logininfo` VALUES ('1', 'admin', null, 'admin@itsource.com', '831d092d59f6e305ebcfa77e05135eac', null, null, null, null);
INSERT INTO `t_logininfo` VALUES ('2', 'roleAdmin', null, 'roleAdmin@itsource.cn', '831d092d59f6e305ebcfa77e05135eac', null, null, null, null);
INSERT INTO `t_logininfo` VALUES ('3', 'admin1', null, 'amdin1@itsource.cn', '6a4876827226fb87ffeb78edb2b1e7ad', null, null, null, null);
INSERT INTO `t_logininfo` VALUES ('4', 'admin2', null, 'amdin2@itsource.cn', 'd157d747dc2f6740e81ca9d84b669272', null, null, null, null);
INSERT INTO `t_logininfo` VALUES ('5', 'admin3', null, 'amdin3@itsource.cn', '89335a5f0fdd015113e9acf90727cdce', null, null, null, null);
INSERT INTO `t_logininfo` VALUES ('6', 'admin4', null, 'amdin4@itsource.cn', '12e4dc60e1813184b3e4552dedd7bf9b', null, null, null, null);
INSERT INTO `t_logininfo` VALUES ('7', 'admin5', null, 'amdin5@itsource.cn', '02f9b7f759b5654d421c0ce458d16c28', null, null, null, null);
INSERT INTO `t_logininfo` VALUES ('8', 'admin6', null, 'amdin6@itsource.cn', '138e943e0987d1fff7a4c367deedd4e3', null, null, null, null);
INSERT INTO `t_logininfo` VALUES ('9', 'admin7', null, 'amdin7@itsource.cn', '53bf9cd2cb250a9d82c3260b6d398d73', null, null, null, null);
INSERT INTO `t_logininfo` VALUES ('10', 'admin8', null, 'amdin8@itsource.cn', 'f6bd6e8ca007216fef1ddd9652e5d42f', null, null, null, null);
INSERT INTO `t_logininfo` VALUES ('11', 'admin9', null, 'amdin9@itsource.cn', 'bc9ee22de9d477a4dc21527fb5288e09', null, null, null, null);
INSERT INTO `t_logininfo` VALUES ('12', 'admin10', null, 'amdin10@itsource.cn', '4af867a168f310ac9f542fb27d088412', null, null, null, null);
INSERT INTO `t_logininfo` VALUES ('13', 'admin11', null, 'amdin11@itsource.cn', 'c953909c87335d7fbc0f004c850d5899', null, null, null, null);
INSERT INTO `t_logininfo` VALUES ('14', 'admin12', null, 'amdin12@itsource.cn', '57c15b685c731241ceb257436da984ce', null, null, null, null);
INSERT INTO `t_logininfo` VALUES ('15', 'admin13', null, 'amdin13@itsource.cn', '72b5871658a55870f55c7cedcdbfc750', null, null, null, null);
INSERT INTO `t_logininfo` VALUES ('16', 'admin14', null, 'amdin14@itsource.cn', '3aaae1c105814d0e3b6de8f4e7befe3f', null, null, null, null);
INSERT INTO `t_logininfo` VALUES ('17', 'admin15', null, 'amdin15@itsource.cn', 'ec466277d5e194ce58b4be14de342e0d', null, null, null, null);
INSERT INTO `t_logininfo` VALUES ('18', 'admin16', null, 'amdin16@itsource.cn', '0f49d0f9f47fbdbe311b90b39d071389', null, null, null, null);
INSERT INTO `t_logininfo` VALUES ('19', 'admin17', null, 'amdin17@itsource.cn', '684e22f740a05d25f63a16ed9b22bd3a', null, null, null, null);
INSERT INTO `t_logininfo` VALUES ('20', 'admin18', null, 'amdin18@itsource.cn', '6b3f18873b8c1fa7948d2eefd236f0b0', null, null, null, null);
INSERT INTO `t_logininfo` VALUES ('21', 'admin19', null, 'amdin19@itsource.cn', '6ed03e3efc7f62c780e5a5f05327c2dd', null, null, null, null);
INSERT INTO `t_logininfo` VALUES ('22', 'admin20', null, 'amdin20@itsource.cn', 'b19bb9f57188bb9017a5f1e334f6cad4', null, null, null, null);
INSERT INTO `t_logininfo` VALUES ('23', 'admin21', null, 'amdin21@itsource.cn', '8d366e02c4373f215e5fae12ef04ecb2', null, null, null, null);
INSERT INTO `t_logininfo` VALUES ('24', 'admin22', null, 'amdin22@itsource.cn', '8a27c7cc380d853babd2c04c9d72625f', null, null, null, null);
INSERT INTO `t_logininfo` VALUES ('25', 'admin23', null, 'amdin23@itsource.cn', '1a9687e7f1d50e800b2ece459e654408', null, null, null, null);
INSERT INTO `t_logininfo` VALUES ('26', 'admin24', null, 'amdin24@itsource.cn', '4f3d03f2d6eaa67ee678cb25ab6f30fd', null, null, null, null);
INSERT INTO `t_logininfo` VALUES ('27', 'admin25', null, 'amdin25@itsource.cn', '8309757711ae53bf971ada0eb756fcad', null, null, null, null);
INSERT INTO `t_logininfo` VALUES ('28', 'admin26', null, 'amdin26@itsource.cn', '65faa932744343a804d2644d6725c809', null, null, null, null);
INSERT INTO `t_logininfo` VALUES ('29', 'admin27', null, 'amdin27@itsource.cn', 'c37e2a159c4104b5efafeb48c4d3f8a8', null, null, null, null);
INSERT INTO `t_logininfo` VALUES ('30', 'admin28', null, 'amdin28@itsource.cn', 'b4d8369858ca62b1871f611a17ab6c85', null, null, null, null);
INSERT INTO `t_logininfo` VALUES ('31', 'admin29', null, 'amdin29@itsource.cn', '32761f6f732cbd3a9b1395f3d0282361', null, null, null, null);
INSERT INTO `t_logininfo` VALUES ('32', 'admin30', null, 'amdin30@itsource.cn', '2bde47bd1a502737c2bf7ef8bca461e7', null, null, null, null);
INSERT INTO `t_logininfo` VALUES ('33', 'admin31', null, 'amdin31@itsource.cn', '1024d7721d427b5625ad0dd73a22d839', null, null, null, null);
INSERT INTO `t_logininfo` VALUES ('34', 'admin32', null, 'amdin32@itsource.cn', '67b6c36942783249382c2871fbcc1cb5', null, null, null, null);
INSERT INTO `t_logininfo` VALUES ('35', 'admin33', null, 'amdin33@itsource.cn', '8fda601d305b34e693f41b0f8cb4267e', null, null, null, null);
INSERT INTO `t_logininfo` VALUES ('36', 'admin34', null, 'amdin34@itsource.cn', 'fab9a4475f7ee7e49890cdf3b2f157bf', null, null, null, null);
INSERT INTO `t_logininfo` VALUES ('37', 'admin35', null, 'amdin35@itsource.cn', 'dd90df5259c45dab53823aa2b5ac5ab9', null, null, null, null);
INSERT INTO `t_logininfo` VALUES ('38', 'admin36', null, 'amdin36@itsource.cn', 'c265ec550b72583d14cf66f5874d3679', null, null, null, null);
INSERT INTO `t_logininfo` VALUES ('39', 'admin37', null, 'amdin37@itsource.cn', '1dbb67fa18836c047c87fa1fbffacd6b', null, null, null, null);
INSERT INTO `t_logininfo` VALUES ('40', 'admin38', null, 'amdin38@itsource.cn', '2bd08251c9aba4e1057bbe877164cbe1', null, null, null, null);
INSERT INTO `t_logininfo` VALUES ('41', 'admin39', null, 'amdin39@itsource.cn', '4b56537a50ebe8e4814e7e684ec7e938', null, null, null, null);
INSERT INTO `t_logininfo` VALUES ('42', 'admin40', null, 'amdin40@itsource.cn', 'ab9d29a6001519fe0ae60064c350760a', null, null, null, null);
INSERT INTO `t_logininfo` VALUES ('43', 'admin41', null, 'amdin41@itsource.cn', '36d035b690b5d06002f3e26cc8cc02aa', null, null, null, null);
INSERT INTO `t_logininfo` VALUES ('44', 'admin42', null, 'amdin42@itsource.cn', '6189eeb659b66c0121d8e6c5865865a8', null, null, null, null);
INSERT INTO `t_logininfo` VALUES ('45', 'admin43', null, 'amdin43@itsource.cn', '7c436b40cc462818481ba1ef64f4a4ca', null, null, null, null);
INSERT INTO `t_logininfo` VALUES ('46', 'admin44', null, 'amdin44@itsource.cn', '97d22105abec0c9672d503723e136100', null, null, null, null);
INSERT INTO `t_logininfo` VALUES ('47', 'admin45', null, 'amdin45@itsource.cn', 'c8db7f4d490c177925c3c86f11ece83c', null, null, null, null);
INSERT INTO `t_logininfo` VALUES ('48', 'admin46', null, 'amdin46@itsource.cn', 'b78114c2399ae23a624b72de85d7cf51', null, null, null, null);
INSERT INTO `t_logininfo` VALUES ('49', 'admin47', null, 'amdin47@itsource.cn', 'c00cfd28ef690dc6920d1c9b251f42d8', null, null, null, null);
INSERT INTO `t_logininfo` VALUES ('50', 'admin48', null, 'amdin48@itsource.cn', '214b22a99efeef099b1867874c337108', null, null, null, null);
INSERT INTO `t_logininfo` VALUES ('51', 'admin49', null, 'amdin49@itsource.cn', '128dad1c555bf4ede2e26206dc92ce1b', null, null, null, null);
INSERT INTO `t_logininfo` VALUES ('52', 'admin50', null, 'amdin50@itsource.cn', '062f6299b738b135a73e4c3a64a13a15', null, null, null, null);
INSERT INTO `t_logininfo` VALUES ('53', 'admin51', null, 'amdin51@itsource.cn', '3d2f81419d5288c127ec815dfe9e4522', null, null, null, null);
INSERT INTO `t_logininfo` VALUES ('54', 'admin52', null, 'amdin52@itsource.cn', '480870bc0920e59dde8998ceba258c03', null, null, null, null);
INSERT INTO `t_logininfo` VALUES ('55', 'admin53', null, 'amdin53@itsource.cn', 'b4dc6f1821a2a3332a4bcb3b89490997', null, null, null, null);
INSERT INTO `t_logininfo` VALUES ('56', 'admin54', null, 'amdin54@itsource.cn', '9933c8cddd2577281c92b70aa9025f04', null, null, null, null);
INSERT INTO `t_logininfo` VALUES ('57', 'admin55', null, 'amdin55@itsource.cn', '52d52dbf39f8459f5a716ce39aff4864', null, null, null, null);
INSERT INTO `t_logininfo` VALUES ('58', 'admin56', null, 'amdin56@itsource.cn', 'fcb2b6a672577d89f1227d07b78fcaef', null, null, null, null);
INSERT INTO `t_logininfo` VALUES ('59', 'admin57', null, 'amdin57@itsource.cn', 'f2e3452ad0c170f7c5dc307f02012007', null, null, null, null);
INSERT INTO `t_logininfo` VALUES ('60', 'admin58', null, 'amdin58@itsource.cn', 'bb8c525fa0dc184229ed2d99d9a6601e', null, null, null, null);
INSERT INTO `t_logininfo` VALUES ('61', 'admin59', null, 'amdin59@itsource.cn', 'ba8189906a9cc50bf156c62a8d55f835', null, null, null, null);
INSERT INTO `t_logininfo` VALUES ('62', 'admin60', null, 'amdin60@itsource.cn', 'a1cf16ba52327acee543ade45fe2a408', null, null, null, null);
INSERT INTO `t_logininfo` VALUES ('63', 'admin61', null, 'amdin61@itsource.cn', 'b38de8af165c14b7b68fb0dcdaea0e28', null, null, null, null);
INSERT INTO `t_logininfo` VALUES ('64', 'admin62', null, 'amdin62@itsource.cn', '8f2531b74f008cd456696da6d6a909d7', null, null, null, null);
INSERT INTO `t_logininfo` VALUES ('65', 'admin63', null, 'amdin63@itsource.cn', 'bb16c7f9cbea20dafd0fe4f3e404c5fc', null, null, null, null);
INSERT INTO `t_logininfo` VALUES ('66', 'admin64', null, 'amdin64@itsource.cn', 'dfeab8b4b419cc4806545a3a1160023e', null, null, null, null);
INSERT INTO `t_logininfo` VALUES ('67', 'admin65', null, 'amdin65@itsource.cn', 'd7b78f460b9559557c13af5e637ea921', null, null, null, null);
INSERT INTO `t_logininfo` VALUES ('68', 'admin66', null, 'amdin66@itsource.cn', '6b892f86125ed46422b582718bccbaa3', null, null, null, null);
INSERT INTO `t_logininfo` VALUES ('69', 'admin67', null, 'amdin67@itsource.cn', '89186a2ef55c1e92160d40eac0358fa4', null, null, null, null);
INSERT INTO `t_logininfo` VALUES ('70', 'admin68', null, 'amdin68@itsource.cn', '724beb114c3e0094974b4a495861534f', null, null, null, null);
INSERT INTO `t_logininfo` VALUES ('71', 'admin69', null, 'amdin69@itsource.cn', 'a2311a2b59adbb74ddaa8131993e8963', null, null, null, null);
INSERT INTO `t_logininfo` VALUES ('72', 'admin70', null, 'amdin70@itsource.cn', '7b8a5667d10bb57744138f5cd6eb3411', null, null, null, null);
INSERT INTO `t_logininfo` VALUES ('73', 'admin71', null, 'amdin71@itsource.cn', '927165e67ed3039642578e4f18a65f3c', null, null, null, null);
INSERT INTO `t_logininfo` VALUES ('74', 'admin72', null, 'amdin72@itsource.cn', '028615d0a82f39b32ef8df6d7ec9e6d5', null, null, null, null);
INSERT INTO `t_logininfo` VALUES ('75', 'admin73', null, 'amdin73@itsource.cn', 'b561bc012063aaf336eddc132564b39b', null, null, null, null);
INSERT INTO `t_logininfo` VALUES ('76', 'admin74', null, 'amdin74@itsource.cn', 'fa33a53cf7b3ff49e31da3671d421ad4', null, null, null, null);
INSERT INTO `t_logininfo` VALUES ('77', 'admin75', null, 'amdin75@itsource.cn', 'cf4eb8cd0d65a61d0acf0212cb98719f', null, null, null, null);
INSERT INTO `t_logininfo` VALUES ('78', 'admin76', null, 'amdin76@itsource.cn', 'e7b06297d2c6fb7426c19a184006ea04', null, null, null, null);
INSERT INTO `t_logininfo` VALUES ('79', 'admin77', null, 'amdin77@itsource.cn', '7cc040d1d56a399597a1ca1105a8f392', null, null, null, null);
INSERT INTO `t_logininfo` VALUES ('80', 'admin78', null, 'amdin78@itsource.cn', '0afc812c6e7f064a0581c7ac8823e4e1', null, null, null, null);
INSERT INTO `t_logininfo` VALUES ('81', 'admin79', null, 'amdin79@itsource.cn', 'df2fc7fd6a88ab389a8997b4f979227f', null, null, null, null);
INSERT INTO `t_logininfo` VALUES ('82', 'admin80', null, 'amdin80@itsource.cn', '917edbaba9dd839940f1ea6115b81fb4', null, null, null, null);
INSERT INTO `t_logininfo` VALUES ('84', 'admin82', null, 'amdin82@itsource.cn', '23f556879c4d48b62685a4c74462ff20', null, null, null, null);
INSERT INTO `t_logininfo` VALUES ('85', 'admin83', null, 'amdin83@itsource.cn', '278bb2a5264784023e10479286bf6ad1', null, null, null, null);
INSERT INTO `t_logininfo` VALUES ('86', 'admin84', null, 'amdin84@itsource.cn', '4b646957feea88bd919786b53308e5fe', null, null, null, null);
INSERT INTO `t_logininfo` VALUES ('87', 'admin85', null, 'amdin85@itsource.cn', '89e268a7194c186542a2462e9067803f', null, null, null, null);
INSERT INTO `t_logininfo` VALUES ('88', 'admin86', null, 'amdin86@itsource.cn', 'df286298bac9ae074263804dcc4b6746', null, null, null, null);
INSERT INTO `t_logininfo` VALUES ('89', 'admin87', null, 'amdin87@itsource.cn', 'efe3f582c67ad9c5990d684370b2091b', null, null, null, null);
INSERT INTO `t_logininfo` VALUES ('90', 'admin88', null, 'amdin88@itsource.cn', '2442a32ec232ccdd526e1187ca8b8e63', null, null, null, null);
INSERT INTO `t_logininfo` VALUES ('91', 'admin89', null, 'amdin89@itsource.cn', '9d02d47995b34e23466ea3f884123b92', null, null, null, null);
INSERT INTO `t_logininfo` VALUES ('92', 'admin90', null, 'amdin90@itsource.cn', '361f59cad3911de5f5dc8c0eb0edc837', null, null, null, null);
INSERT INTO `t_logininfo` VALUES ('94', 'admin92', null, 'amdin92@itsource.cn', '5a9e4a3970e5dfe918119678b219776f', null, null, null, null);
INSERT INTO `t_logininfo` VALUES ('95', 'admin93', null, 'amdin93@itsource.cn', '0668938be4636952839cd7ac3327b710', null, null, null, null);
INSERT INTO `t_logininfo` VALUES ('96', 'admin94', null, 'amdin94@itsource.cn', 'b0515c6643d36d015d818bacabb3fa75', null, null, null, null);
INSERT INTO `t_logininfo` VALUES ('97', 'admin95', null, 'amdin95@itsource.cn', '9fe8133f960ada5d89d04206e0d6cacf', null, null, null, null);
INSERT INTO `t_logininfo` VALUES ('98', 'admin96', null, 'amdin96@itsource.cn', '16f7780cba2e0894b556f784cad4f9e6', null, null, null, null);
INSERT INTO `t_logininfo` VALUES ('99', 'admin97', null, 'amdin97@itsource.cn', 'b2038b73d0c2ae5d7fa69f8500dbf0b9', null, null, null, null);
INSERT INTO `t_logininfo` VALUES ('100', 'admin98', null, 'amdin98@itsource.cn', '93a4828f14a6d6b583d73e3c32660f69', null, null, null, null);
INSERT INTO `t_logininfo` VALUES ('101', 'admin99', null, 'amdin99@itsource.cn', '211660364fa51c7ae846fef09527a957', null, null, null, null);
INSERT INTO `t_logininfo` VALUES ('174', '左右', null, '23123', 'd5a3fedf6c59c2ecbe7f7a6c1a22da37', null, null, null, null);
INSERT INTO `t_logininfo` VALUES ('175', '顶替', null, '234', '50ef600f543c4773eb7c4fa53d6e783b', null, null, null, null);
INSERT INTO `t_logininfo` VALUES ('176', '234', null, '234234', '586b3891775a181dd42777da93014c66', null, null, null, null);
INSERT INTO `t_logininfo` VALUES ('177', 'aaaa', null, '23434', null, null, null, null, null);
INSERT INTO `t_logininfo` VALUES ('178', 'sdf', null, '123', '123', null, null, null, null);
INSERT INTO `t_logininfo` VALUES ('179', 'ewr', null, '123', null, null, null, null, null);
INSERT INTO `t_logininfo` VALUES ('181', 'admin77', null, 'amdin7@itsource.cn', null, null, null, null, null);
INSERT INTO `t_logininfo` VALUES ('184', 'asdf', null, '234', 'sd', null, null, null, null);
INSERT INTO `t_logininfo` VALUES ('190', 'sdfasdf', null, '', 'sdafdf', null, null, null, null);
INSERT INTO `t_logininfo` VALUES ('191', 'sfsdaf', null, '', '', null, null, null, null);
INSERT INTO `t_logininfo` VALUES ('192', 'sdfa', null, '', '', null, null, null, null);
INSERT INTO `t_logininfo` VALUES ('198', 'admin811c5f', null, 'lsq@itsource.cn', '123456', null, null, null, null);
INSERT INTO `t_logininfo` VALUES ('199', 'admin185c14d', null, 'amdin1@itsource.cn', '123456', null, null, null, null);
INSERT INTO `t_logininfo` VALUES ('200', 'admin5d6c610', null, 'amdin5@itsource.cn', '123456', null, null, null, null);
INSERT INTO `t_logininfo` VALUES ('201', 'admin11d639b3', null, 'amdin11@itsource.cn', '123456', null, null, null, null);
INSERT INTO `t_logininfo` VALUES ('204', 'fasdfasdf', null, '', '123', null, null, null, null);
INSERT INTO `t_logininfo` VALUES ('208', 'sadfsdf', null, null, null, null, null, null, null);
INSERT INTO `t_logininfo` VALUES ('210', 'sadfdfwe', null, null, null, null, null, null, null);
INSERT INTO `t_logininfo` VALUES ('229', 'aaaaa', null, '', '', null, null, null, null);
INSERT INTO `t_logininfo` VALUES ('230', 'bbbb', null, '213', '111111', null, null, null, null);
INSERT INTO `t_logininfo` VALUES ('233', 'dfsdf', null, 'sdfsdf', 'sdf', null, null, null, null);
INSERT INTO `t_logininfo` VALUES ('234', 'sfafs', null, 'wer', '234234', null, null, null, null);
INSERT INTO `t_logininfo` VALUES ('235', 'wer', null, 'wer', 'wer', null, null, null, null);
INSERT INTO `t_logininfo` VALUES ('236', '222222', null, 'qe', 'eqwe', null, null, null, null);
INSERT INTO `t_logininfo` VALUES ('240', '123222', null, '123@qq.com', '123', null, null, null, null);
INSERT INTO `t_logininfo` VALUES ('245', 'admin1111', null, '', '111111', null, null, null, null);
INSERT INTO `t_logininfo` VALUES ('246', 'sfsfsf', null, '123@qq.com', '12345', null, null, null, null);
INSERT INTO `t_logininfo` VALUES ('247', 'sfsfsf', null, '', '12345', null, null, null, null);
INSERT INTO `t_logininfo` VALUES ('262', 'asdf23', null, 'wqe@qq.com', '123', null, null, null, null);
INSERT INTO `t_logininfo` VALUES ('263', 'asdfxx', null, 'sdf@qq.com', '123', null, null, null, null);
INSERT INTO `t_logininfo` VALUES ('264', 'sad12', null, 'sdf@qq.com', 'd5a3fedf6c59c2ecbe7f7a6c1a22da37', null, null, null, null);
INSERT INTO `t_logininfo` VALUES ('265', 'sdfasfasdf', null, 'sdf@qq.com', 'd5a3fedf6c59c2ecbe7f7a6c1a22da37', null, null, null, null);
INSERT INTO `t_logininfo` VALUES ('266', 'admin063-1756-4e3c-8ecb-33fe746ae077', null, 'lsq@itsource.cn', '48d05cc43f3bfe2510394e8dfcef919a', null, null, null, null);
INSERT INTO `t_logininfo` VALUES ('267', 'monkey500eec-fe27-4ff1-91ef-82d34c400b8f', null, 'amdin1@itsource.cn', '6a4876827226fb87ffeb78edb2b1e7ad', null, null, null, null);
INSERT INTO `t_logininfo` VALUES ('268', 'admin5d93-266a-4bcd-9852-15586484ea1d', null, 'amdin5@itsource.cn', '02f9b7f759b5654d421c0ce458d16c28', null, null, null, null);
INSERT INTO `t_logininfo` VALUES ('269', 'admin1188c-220e-4e42-b364-1439e008eded', null, 'amdin11@itsource.cn', 'c953909c87335d7fbc0f004c850d5899', null, null, null, null);
INSERT INTO `t_logininfo` VALUES ('270', 'adminf0d-408f-4859-a454-ac51604ae0fd', null, 'lsq@itsource.cn', '48d05cc43f3bfe2510394e8dfcef919a', null, null, null, null);
INSERT INTO `t_logininfo` VALUES ('271', 'monkey50083b-0ca2-4bd3-8e31-df2248b5ede7', null, 'amdin1@itsource.cn', '6a4876827226fb87ffeb78edb2b1e7ad', null, null, null, null);
INSERT INTO `t_logininfo` VALUES ('272', 'admin50b4-cac6-4f70-b404-2276dade3d34', null, 'amdin5@itsource.cn', '02f9b7f759b5654d421c0ce458d16c28', null, null, null, null);
INSERT INTO `t_logininfo` VALUES ('274', 'root', null, '1322156', 'admin', null, null, null, null);
INSERT INTO `t_logininfo` VALUES ('275', 'root', null, '1322156', 'admin', null, null, null, null);
INSERT INTO `t_logininfo` VALUES ('276', 'root', null, '1322156', 'admin', null, null, null, null);
INSERT INTO `t_logininfo` VALUES ('277', 'root', null, '1322156', 'admin', null, null, null, null);
INSERT INTO `t_logininfo` VALUES ('278', 'root', null, '1322156', 'admin', null, null, null, null);
INSERT INTO `t_logininfo` VALUES ('279', 'root', null, '1322156', 'admin', null, null, null, null);
INSERT INTO `t_logininfo` VALUES ('280', 'root', null, '1322156', 'admin', null, null, null, null);
INSERT INTO `t_logininfo` VALUES ('281', 'root', null, '1322156', 'admin', null, null, null, null);
INSERT INTO `t_logininfo` VALUES ('282', 'root', null, '1322156', 'admin', null, null, null, null);
INSERT INTO `t_logininfo` VALUES ('283', 'root', null, '1322156', 'admin', null, null, null, null);
INSERT INTO `t_logininfo` VALUES ('284', 'root2', null, 'egngwmip', 'admin', null, null, null, null);
INSERT INTO `t_logininfo` VALUES ('285', 'root2', null, 'egngwmip', 'admin', null, null, null, null);
INSERT INTO `t_logininfo` VALUES ('296', 'dsdbds', null, 'sbdbsds', 'a5c31aadfdef19b33c3f35f443003ea3', null, null, null, null);
INSERT INTO `t_logininfo` VALUES ('299', 'hmtest', null, 'amdin8@itsource.cn', '831d092d59f6e305ebcfa77e05135eac', null, null, null, null);
INSERT INTO `t_logininfo` VALUES ('305', 'roleAdmin@itsource.cn', null, 'roleAdmin@itsource.cn', '8d4f18fb2457bf6f8e1825d0ad916bfc', null, null, null, null);

-- ----------------------------
-- Table structure for `t_menu`
-- ----------------------------
DROP TABLE IF EXISTS `t_menu`;
CREATE TABLE `t_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `index` int(11) DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK24897F76799044` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_menu
-- ----------------------------
INSERT INTO `t_menu` VALUES ('18', '员工管理', '/employee', null, '1', '19');
INSERT INTO `t_menu` VALUES ('19', '组织机构', null, null, '1', null);
INSERT INTO `t_menu` VALUES ('20', '部门管理', '/departemnt', null, '3', '19');
INSERT INTO `t_menu` VALUES ('21', '门店管理', '/shop', null, '2', '19');

-- ----------------------------
-- Table structure for `t_order_address`
-- ----------------------------
DROP TABLE IF EXISTS `t_order_address`;
CREATE TABLE `t_order_address` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createTime` datetime DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  `order_id` bigint(20) DEFAULT NULL,
  `orderSn` varchar(255) DEFAULT NULL,
  `contacts` varchar(200) DEFAULT NULL COMMENT '收货人',
  `areaCode` varchar(200) NOT NULL COMMENT '区域',
  `address` varchar(200) DEFAULT NULL COMMENT '详细地址',
  `fullAddress` varchar(200) DEFAULT NULL COMMENT '全地址',
  `phone` char(11) NOT NULL COMMENT '手机号码',
  `phoneBack` varchar(11) DEFAULT NULL COMMENT '备用手机号',
  `tel` varchar(11) DEFAULT NULL COMMENT '固定电话',
  `postCode` varchar(6) DEFAULT NULL COMMENT '邮编',
  `email` varchar(30) DEFAULT NULL COMMENT '电子邮件',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COMMENT='订单地址';

-- ----------------------------
-- Records of t_order_address
-- ----------------------------
INSERT INTO `t_order_address` VALUES ('10', '2020-06-12 15:05:31', null, '43', '6034143972', '艾迪 ', '湖北省 武汉市 洪山区', '雄楚大道666号(中南财经政法大学)', '湖北省武汉市洪山区雄楚大道666号', '15888888888', '15888888888', null, '637500', 'yhptest@itsource.cn');
INSERT INTO `t_order_address` VALUES ('11', '2020-06-12 15:05:31', null, '44', '6034365922', '艾迪 ', '湖北省 武汉市 洪山区', '雄楚大道666号(中南财经政法大学)', '湖北省武汉市洪山区雄楚大道666号', '15888888888', '15888888888', null, '637500', 'yhptest@itsource.cn');
INSERT INTO `t_order_address` VALUES ('12', '2020-06-12 15:05:31', null, '45', '6034748948', '艾迪 ', '湖北省 武汉市 洪山区', '雄楚大道666号(中南财经政法大学)', '湖北省武汉市洪山区雄楚大道666号', '15888888888', '15888888888', null, '637500', 'yhptest@itsource.cn');
INSERT INTO `t_order_address` VALUES ('13', '2020-06-12 15:05:31', null, '46', '6034311950', '艾迪 ', '湖北省 武汉市 洪山区', '雄楚大道666号(中南财经政法大学)', '湖北省武汉市洪山区雄楚大道666号', '15888888888', '15888888888', null, '637500', 'yhptest@itsource.cn');
INSERT INTO `t_order_address` VALUES ('14', '2020-06-12 15:05:31', null, '47', '6034730357', '艾迪 ', '湖北省 武汉市 洪山区', '雄楚大道666号(中南财经政法大学)', '湖北省武汉市洪山区雄楚大道666号', '15888888888', '15888888888', null, '637500', 'yhptest@itsource.cn');
INSERT INTO `t_order_address` VALUES ('15', '2020-06-12 15:05:31', null, '48', '6034143506', '艾迪 ', '湖北省 武汉市 洪山区', '雄楚大道666号(中南财经政法大学)', '湖北省武汉市洪山区雄楚大道666号', '15888888888', '15888888888', null, '637500', 'yhptest@itsource.cn');
INSERT INTO `t_order_address` VALUES ('16', '2020-06-12 15:05:31', null, '49', '6034813787', '艾迪 ', '湖北省 武汉市 洪山区', '雄楚大道666号(中南财经政法大学)', '湖北省武汉市洪山区雄楚大道666号', '15888888888', '15888888888', null, '637500', 'yhptest@itsource.cn');
INSERT INTO `t_order_address` VALUES ('17', '2020-06-12 15:05:31', null, '50', '6034105342', '艾迪 ', '湖北省 武汉市 洪山区', '雄楚大道666号(中南财经政法大学)', '湖北省武汉市洪山区雄楚大道666号', '15888888888', '15888888888', null, '637500', 'yhptest@itsource.cn');
INSERT INTO `t_order_address` VALUES ('18', '2020-06-12 15:05:31', null, '51', '6034136728', '艾迪 ', '湖北省 武汉市 洪山区', '雄楚大道666号(中南财经政法大学)', '湖北省武汉市洪山区雄楚大道666号', '15888888888', '15888888888', null, '637500', 'yhptest@itsource.cn');
INSERT INTO `t_order_address` VALUES ('19', '2020-06-12 15:05:31', null, '52', '6034102423', '艾迪 ', '湖北省 武汉市 洪山区', '雄楚大道666号(中南财经政法大学)', '湖北省武汉市洪山区雄楚大道666号', '15888888888', '15888888888', null, '637500', 'yhptest@itsource.cn');
INSERT INTO `t_order_address` VALUES ('20', '2020-06-12 15:05:31', null, '53', '6040833418', '艾迪 ', '湖北省 武汉市 洪山区', '雄楚大道666号(中南财经政法大学)', '湖北省武汉市洪山区雄楚大道666号', '15888888888', '15888888888', null, '637500', 'yhptest@itsource.cn');
INSERT INTO `t_order_address` VALUES ('21', '2020-06-12 15:05:31', null, '54', '6043137656', '艾迪 ', '湖北省 武汉市 洪山区', '雄楚大道666号(中南财经政法大学)', '湖北省武汉市洪山区雄楚大道666号', '15888888888', '15888888888', null, '637500', 'yhptest@itsource.cn');

-- ----------------------------
-- Table structure for `t_order_adopt`
-- ----------------------------
DROP TABLE IF EXISTS `t_order_adopt`;
CREATE TABLE `t_order_adopt` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `digest` varchar(255) DEFAULT NULL COMMENT '摘要',
  `state` int(11) DEFAULT NULL COMMENT '待支付 已完成',
  `price` decimal(10,0) DEFAULT NULL,
  `orderSn` varchar(255) DEFAULT NULL,
  `paySn` varchar(255) DEFAULT NULL,
  `lastPayTime` datetime DEFAULT NULL,
  `lastConfirmTime` datetime DEFAULT NULL,
  `pet_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `shop_id` bigint(20) DEFAULT NULL,
  `address_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_order_adopt
-- ----------------------------
INSERT INTO `t_order_adopt` VALUES ('18', '基础版洗澡', '0', '1', '20201589006361776', null, null, null, '8', '25', null, null);
INSERT INTO `t_order_adopt` VALUES ('19', '基础版洗澡', '0', '1', '20201589006565438', null, null, null, '8', '24', null, null);
INSERT INTO `t_order_adopt` VALUES ('20', '基础版洗澡', '0', '20', '20201589008910966', null, null, null, '8', '0', null, null);
INSERT INTO `t_order_adopt` VALUES ('24', '基础版洗澡', '0', '30', '20201589251196292', null, null, null, '8', '23', null, null);
INSERT INTO `t_order_adopt` VALUES ('25', '基础版洗澡', '2', '30', '20201589251468624', null, null, null, '8', '24', null, null);
INSERT INTO `t_order_adopt` VALUES ('26', '基础版洗澡', '2', '30', '20201589255035118', null, null, null, '8', '24', null, null);
INSERT INTO `t_order_adopt` VALUES ('27', '高级洗澡', '2', '1000', '20201589255052276', null, null, null, '12', '25', null, null);

-- ----------------------------
-- Table structure for `t_order_goods`
-- ----------------------------
DROP TABLE IF EXISTS `t_order_goods`;
CREATE TABLE `t_order_goods` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `digest` varchar(255) DEFAULT NULL COMMENT '摘要',
  `state` int(11) DEFAULT NULL COMMENT '待支付 已完成',
  `price` decimal(10,0) DEFAULT NULL,
  `orderSn` varchar(255) DEFAULT NULL,
  `paySn` varchar(255) DEFAULT NULL,
  `lastPayTime` datetime DEFAULT NULL,
  `lastConfirmTime` datetime DEFAULT NULL,
  `goods_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `shop_id` bigint(20) DEFAULT NULL,
  `address_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_order_goods
-- ----------------------------
INSERT INTO `t_order_goods` VALUES ('18', '基础版洗澡', '0', '1', '20201589006361776', null, null, null, '8', '25', null, null);
INSERT INTO `t_order_goods` VALUES ('19', '基础版洗澡', '0', '1', '20201589006565438', null, null, null, '8', '24', null, null);
INSERT INTO `t_order_goods` VALUES ('20', '基础版洗澡', '0', '20', '20201589008910966', null, null, null, '8', '0', null, null);
INSERT INTO `t_order_goods` VALUES ('24', '基础版洗澡', '0', '30', '20201589251196292', null, null, null, '8', '23', null, null);
INSERT INTO `t_order_goods` VALUES ('25', '基础版洗澡', '2', '30', '20201589251468624', null, null, null, '8', '24', null, null);
INSERT INTO `t_order_goods` VALUES ('26', '基础版洗澡', '2', '30', '20201589255035118', null, null, null, '8', '24', null, null);
INSERT INTO `t_order_goods` VALUES ('27', '高级洗澡', '2', '1000', '20201589255052276', null, null, null, '12', '25', null, null);

-- ----------------------------
-- Table structure for `t_order_goods_detail`
-- ----------------------------
DROP TABLE IF EXISTS `t_order_goods_detail`;
CREATE TABLE `t_order_goods_detail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `digest` varchar(255) DEFAULT NULL COMMENT '摘要',
  `state` int(11) DEFAULT NULL COMMENT '待支付 已完成',
  `price` decimal(10,0) DEFAULT NULL,
  `orderSn` varchar(255) DEFAULT NULL,
  `paySn` varchar(255) DEFAULT NULL,
  `lastPayTime` datetime DEFAULT NULL,
  `lastConfirmTime` datetime DEFAULT NULL,
  `goods_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_order_goods_detail
-- ----------------------------
INSERT INTO `t_order_goods_detail` VALUES ('18', '基础版洗澡', '0', '1', '20201589006361776', null, null, null, '8', '25');
INSERT INTO `t_order_goods_detail` VALUES ('19', '基础版洗澡', '0', '1', '20201589006565438', null, null, null, '8', '24');
INSERT INTO `t_order_goods_detail` VALUES ('20', '基础版洗澡', '0', '20', '20201589008910966', null, null, null, '8', '0');
INSERT INTO `t_order_goods_detail` VALUES ('24', '基础版洗澡', '0', '30', '20201589251196292', null, null, null, '8', '23');
INSERT INTO `t_order_goods_detail` VALUES ('25', '基础版洗澡', '2', '30', '20201589251468624', null, null, null, '8', '24');
INSERT INTO `t_order_goods_detail` VALUES ('26', '基础版洗澡', '2', '30', '20201589255035118', null, null, null, '8', '24');
INSERT INTO `t_order_goods_detail` VALUES ('27', '高级洗澡', '2', '1000', '20201589255052276', null, null, null, '12', '25');

-- ----------------------------
-- Table structure for `t_order_pet_acquisition`
-- ----------------------------
DROP TABLE IF EXISTS `t_order_pet_acquisition`;
CREATE TABLE `t_order_pet_acquisition` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `digest` varchar(255) DEFAULT NULL COMMENT '摘要',
  `state` int(11) DEFAULT NULL COMMENT '待支付 待报账 待打款 已完成 已取消',
  `price` decimal(10,0) DEFAULT NULL,
  `orderSn` varchar(255) DEFAULT NULL,
  `paySn` varchar(255) DEFAULT NULL,
  `pet_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `paytype` int(11) DEFAULT '0' COMMENT '0垫付 1余额 2银行转账',
  `shop_id` bigint(20) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `emp_id` bigint(20) DEFAULT NULL COMMENT '店员id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_order_pet_acquisition
-- ----------------------------
INSERT INTO `t_order_pet_acquisition` VALUES ('28', '[摘要]对旺财1号收购订单！', '0', '0', '6032427416', null, '56', '26', '0', '27', '四川省成都市龙泉驿区蒲草路', '1');

-- ----------------------------
-- Table structure for `t_order_product`
-- ----------------------------
DROP TABLE IF EXISTS `t_order_product`;
CREATE TABLE `t_order_product` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `digest` varchar(255) DEFAULT NULL COMMENT '摘要',
  `state` int(11) DEFAULT NULL COMMENT '待支付0 待消费1 待确认2 完成3 取消-1',
  `price` decimal(10,0) DEFAULT NULL,
  `orderSn` varchar(255) DEFAULT NULL,
  `paySn` varchar(255) DEFAULT NULL,
  `lastPayTime` datetime DEFAULT NULL,
  `lastConfirmTime` datetime DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `shop_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_order_product
-- ----------------------------
INSERT INTO `t_order_product` VALUES ('43', '[服务订单]购买3次基础版洗澡服务！', '0', '9000', '6034143972', null, '2020-06-13 16:26:32', null, '8', '26', '27');
INSERT INTO `t_order_product` VALUES ('44', '[服务订单]购买3次基础版洗澡服务！', '0', '9000', '6034365922', null, '2020-06-13 16:44:44', null, '8', '26', '27');
INSERT INTO `t_order_product` VALUES ('45', '[服务订单]购买3次基础版洗澡服务！', '0', '9000', '6034748948', null, '2020-06-13 16:46:56', null, '8', '26', '27');
INSERT INTO `t_order_product` VALUES ('46', '[服务订单]购买3次基础版洗澡服务！', '0', '9000', '6034311950', null, '2020-06-13 16:52:10', null, '8', '26', '27');
INSERT INTO `t_order_product` VALUES ('47', '[服务订单]购买3次基础版洗澡服务！', '0', '9000', '6034730357', null, '2020-06-13 16:55:34', null, '8', '26', '27');
INSERT INTO `t_order_product` VALUES ('48', '[服务订单]购买3次基础版洗澡服务！', '0', '9000', '6034143506', null, '2020-06-13 16:57:34', null, '8', '26', '27');
INSERT INTO `t_order_product` VALUES ('49', '[服务订单]购买3次精华版洗澡2服务！', '0', '300000', '6034813787', null, '2020-06-13 17:26:18', null, '70', '26', '27');
INSERT INTO `t_order_product` VALUES ('50', '[服务订单]购买3次精华版洗澡2服务！', '0', '300000', '6034105342', null, '2020-06-13 17:32:28', null, '70', '26', '27');
INSERT INTO `t_order_product` VALUES ('51', '[服务订单]购买3次精华版洗澡0服务！', '0', '300000', '6034136728', null, '2020-06-13 17:35:45', null, '68', '26', '27');
INSERT INTO `t_order_product` VALUES ('52', '[服务订单]购买3次精华版洗澡0服务！', '0', '300000', '6034102423', null, '2020-06-13 17:46:50', null, '68', '26', '27');
INSERT INTO `t_order_product` VALUES ('53', '[服务订单]购买3次精华版洗澡0服务！', '1', '300000', '6040833418', null, '2020-06-15 09:42:52', null, '68', '26', '27');
INSERT INTO `t_order_product` VALUES ('54', '[服务订单]购买3次精华版洗澡0服务！', '-1', '300000', '6043137656', '200616030633513', '2020-06-16 15:07:32', null, '68', '26', '27');

-- ----------------------------
-- Table structure for `t_order_product_detail`
-- ----------------------------
DROP TABLE IF EXISTS `t_order_product_detail`;
CREATE TABLE `t_order_product_detail` (
  `id` bigint(2) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '服务名称',
  `resources` varchar(255) DEFAULT NULL COMMENT '存放fastdfs地址，多个资源使用，分割',
  `saleprice` decimal(19,2) DEFAULT NULL,
  `offsaletime` datetime DEFAULT NULL,
  `onsaletime` datetime DEFAULT NULL,
  `state` bigint(2) DEFAULT NULL COMMENT '状态：0下架 1上架',
  `costprice` varchar(255) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  `salecount` bigint(20) DEFAULT NULL,
  `order_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=189 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_order_product_detail
-- ----------------------------
INSERT INTO `t_order_product_detail` VALUES ('177', '基础版洗澡', '/group1/M00/00/00/wKgABF7CJ0uAU12WAAL5x3kjuBU629.png,/group1/M00/00/00/rBEABV6z2OqAJ0kHAAK0qdoKbvA711.jpg', '30.00', '2020-06-06 16:30:51', '2020-06-06 16:30:59', '1', '50', '2020-05-05 15:38:54', '10', '43');
INSERT INTO `t_order_product_detail` VALUES ('178', '基础版洗澡', '/group1/M00/00/00/wKgABF7CJ0uAU12WAAL5x3kjuBU629.png,/group1/M00/00/00/rBEABV6z2OqAJ0kHAAK0qdoKbvA711.jpg', '30.00', '2020-06-06 16:30:51', '2020-06-06 16:30:59', '1', '50', '2020-05-05 15:38:54', '10', '44');
INSERT INTO `t_order_product_detail` VALUES ('179', '基础版洗澡', '/group1/M00/00/00/wKgABF7CJ0uAU12WAAL5x3kjuBU629.png,/group1/M00/00/00/rBEABV6z2OqAJ0kHAAK0qdoKbvA711.jpg', '30.00', '2020-06-06 16:30:51', '2020-06-06 16:30:59', '1', '50', '2020-05-05 15:38:54', '10', '45');
INSERT INTO `t_order_product_detail` VALUES ('180', '基础版洗澡', '/group1/M00/00/00/wKgABF7CJ0uAU12WAAL5x3kjuBU629.png,/group1/M00/00/00/rBEABV6z2OqAJ0kHAAK0qdoKbvA711.jpg', '30.00', '2020-06-06 16:30:51', '2020-06-06 16:30:59', '1', '50', '2020-05-05 15:38:54', '10', '46');
INSERT INTO `t_order_product_detail` VALUES ('181', '基础版洗澡', '/group1/M00/00/00/wKgABF7CJ0uAU12WAAL5x3kjuBU629.png,/group1/M00/00/00/rBEABV6z2OqAJ0kHAAK0qdoKbvA711.jpg', '30.00', '2020-06-06 16:30:51', '2020-06-06 16:30:59', '1', '50', '2020-05-05 15:38:54', '10', '47');
INSERT INTO `t_order_product_detail` VALUES ('182', '基础版洗澡', '/group1/M00/00/00/wKgABF7CJ0uAU12WAAL5x3kjuBU629.png,/group1/M00/00/00/rBEABV6z2OqAJ0kHAAK0qdoKbvA711.jpg', '30.00', '2020-06-06 16:30:51', '2020-06-06 16:30:59', '1', '50', '2020-05-05 15:38:54', '10', '48');
INSERT INTO `t_order_product_detail` VALUES ('183', '精华版洗澡2', '/group1/M00/00/07/wKgABF7bN9aAUr5jAABMYp1lVaA616.jpg,/group1/M00/00/07/wKgABF7bN_2AcnCmAABMYp1lVaA428.jpg', '1000.00', '2020-06-06 16:30:51', '2020-06-06 16:30:59', '1', '1000', null, null, '49');
INSERT INTO `t_order_product_detail` VALUES ('184', '精华版洗澡2', '/group1/M00/00/07/wKgABF7bN9aAUr5jAABMYp1lVaA616.jpg,/group1/M00/00/07/wKgABF7bN_2AcnCmAABMYp1lVaA428.jpg', '1000.00', '2020-06-06 16:30:51', '2020-06-06 16:30:59', '1', '1000', null, null, '50');
INSERT INTO `t_order_product_detail` VALUES ('185', '精华版洗澡0', '/group1/M00/00/07/wKgABF7bN9aAUr5jAABMYp1lVaA616.jpg,/group1/M00/00/07/wKgABF7bN_2AcnCmAABMYp1lVaA428.jpg', '1000.00', '2020-06-06 16:30:51', '2020-06-06 16:30:59', '1', '1000', null, null, '51');
INSERT INTO `t_order_product_detail` VALUES ('186', '精华版洗澡0', '/group1/M00/00/07/wKgABF7bN9aAUr5jAABMYp1lVaA616.jpg,/group1/M00/00/07/wKgABF7bN_2AcnCmAABMYp1lVaA428.jpg', '1000.00', '2020-06-06 16:30:51', '2020-06-06 16:30:59', '1', '1000', null, null, '52');
INSERT INTO `t_order_product_detail` VALUES ('187', '精华版洗澡0', '/group1/M00/00/07/wKgABF7bN9aAUr5jAABMYp1lVaA616.jpg,/group1/M00/00/07/wKgABF7bN_2AcnCmAABMYp1lVaA428.jpg', '1000.00', '2020-06-06 16:30:51', '2020-06-06 16:30:59', '1', '1000', null, null, '53');
INSERT INTO `t_order_product_detail` VALUES ('188', '精华版洗澡0', '/group1/M00/00/07/wKgABF7bN9aAUr5jAABMYp1lVaA616.jpg,/group1/M00/00/07/wKgABF7bN_2AcnCmAABMYp1lVaA428.jpg', '1000.00', '2020-06-06 16:30:51', '2020-06-06 16:30:59', '1', '1000', null, null, '54');

-- ----------------------------
-- Table structure for `t_order_recharge`
-- ----------------------------
DROP TABLE IF EXISTS `t_order_recharge`;
CREATE TABLE `t_order_recharge` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `digest` varchar(255) DEFAULT NULL COMMENT '摘要',
  `state` int(11) DEFAULT NULL COMMENT '待支付 已完成',
  `money` decimal(10,0) DEFAULT NULL,
  `orderSn` varchar(255) DEFAULT NULL,
  `paySn` varchar(255) DEFAULT NULL,
  `lastPayTime` datetime DEFAULT NULL,
  `lastConfirmTime` datetime DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_order_recharge
-- ----------------------------
INSERT INTO `t_order_recharge` VALUES ('18', '基础版洗澡', '0', '1', '20201589006361776', null, null, null, '25');
INSERT INTO `t_order_recharge` VALUES ('19', '基础版洗澡', '0', '1', '20201589006565438', null, null, null, '24');
INSERT INTO `t_order_recharge` VALUES ('20', '基础版洗澡', '0', '20', '20201589008910966', null, null, null, '0');
INSERT INTO `t_order_recharge` VALUES ('24', '基础版洗澡', '0', '30', '20201589251196292', null, null, null, '23');
INSERT INTO `t_order_recharge` VALUES ('25', '基础版洗澡', '2', '30', '20201589251468624', null, null, null, '24');
INSERT INTO `t_order_recharge` VALUES ('26', '基础版洗澡', '2', '30', '20201589255035118', null, null, null, '24');
INSERT INTO `t_order_recharge` VALUES ('27', '高级洗澡', '2', '1000', '20201589255052276', null, null, null, '25');

-- ----------------------------
-- Table structure for `t_pay_account`
-- ----------------------------
DROP TABLE IF EXISTS `t_pay_account`;
CREATE TABLE `t_pay_account` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createTime` datetime DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `useableBalance` int(11) NOT NULL DEFAULT '0' COMMENT '可用金额',
  `frozenBalance` int(11) NOT NULL DEFAULT '0' COMMENT '冻结金额',
  `creditBanance` int(11) NOT NULL DEFAULT '0' COMMENT '积分',
  `payPassword` char(32) NOT NULL COMMENT '支付密码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户账户';

-- ----------------------------
-- Records of t_pay_account
-- ----------------------------

-- ----------------------------
-- Table structure for `t_pay_account_flow`
-- ----------------------------
DROP TABLE IF EXISTS `t_pay_account_flow`;
CREATE TABLE `t_pay_account_flow` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createTime` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `nickName` varchar(20) DEFAULT NULL COMMENT '用户姓名',
  `money` decimal(11,2) NOT NULL COMMENT '金额',
  `type` tinyint(4) NOT NULL COMMENT '支付方式',
  `businessType` varchar(4) NOT NULL COMMENT '业务类型',
  `businessName` varchar(20) NOT NULL COMMENT '业务名',
  `businessKey` bigint(20) NOT NULL COMMENT '关联业务键',
  `payChannel` tinyint(4) NOT NULL,
  `payChannelName` varchar(20) NOT NULL,
  `note` varchar(50) DEFAULT NULL COMMENT '备注',
  `digest` varchar(100) DEFAULT NULL,
  `unionPaySeq` char(15) DEFAULT NULL COMMENT '统一支付单号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户支付流水';

-- ----------------------------
-- Records of t_pay_account_flow
-- ----------------------------

-- ----------------------------
-- Table structure for `t_pay_alipay_info`
-- ----------------------------
DROP TABLE IF EXISTS `t_pay_alipay_info`;
CREATE TABLE `t_pay_alipay_info` (
  `merchant_private_key` varchar(2500) DEFAULT NULL,
  `appid` varchar(255) DEFAULT NULL,
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `alipay_public_key` varchar(2500) DEFAULT NULL,
  `shop_id` bigint(20) DEFAULT NULL,
  `shopName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_pay_alipay_info
-- ----------------------------
INSERT INTO `t_pay_alipay_info` VALUES ('MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCKhUpfCn+mk90pAZrTTqU0uqADE17rTZUCay6PZOS7liockFf/5EUWEBO6S4NQV7Mq+XHzwVO73qALnXvYxQKttsMt0AWuXdGqxtMsfBv0Fa9V+xX6Nyf37Mip9j4VK3vWkOWMHkdrRWV3fznZyNnvxs1tJLvliAXEGGdcLQo0iOmClFLMPJqCeoDvjXQcyaGTPkjX5c/BiAyQ5iHVEb7lSy9WSFnoXZcxnO3bxgr6r66ZqC7mc9Zogu6BZM/o+bRSWk77BFRe9Afr3hk4kyK2b0wa91pzNy/meVk7HkDey01bD5/BdM17jtyGQh7ny0PdWhjGEQ7bcFjhvVPTGQdPAgMBAAECggEAJg5KiWPkAAq9hueG9qizoJHpJg8rU7AD0R9LMmAAqzytIx3Q31+CT3ZpRRQ75lXBxnuzf8lMTN/zzl0cykgN3VXJt4tgFDB4StfG6oDKWTuf6RpLRmvi0i0+T9tz4PMKWb+DIQSskF8HalYMubWBkmtmwqaF7KB7HQ2rT9qb5CSUgt2mGqaVZ1H6vmiPkZcOHzpxS7+WBKJS9FW/0kcofFzH7Vy8kFvU2m55JrrAsbAlKMshEFClGksDdGLgSGaZAkfDcT6NUiY0epxa5AYYaKSi0Tawhz/JK+d9xE5kr1q9bq0iWt0ec8MUN5xbKdvwnIGWdvrz4bNNsHVO1SxnIQKBgQDbCSJ8kam6dv559Vj0K9NjNtysYoL2Eb6dov2E6AnX/uDUNrUM5MrWICcyOCWEtp4h3hzxkEW3QqnixrBWzken06byHfrX30yN7EAqsCB2pX7OLimUO4K7bp6tj2Dl4aYFnUHIwHBLYiGtgqftlTmsQL58GWSG7cC9ME6Xuz2B/wKBgQCh5bbsgSwBVMnXy621+5aZ83FCDlkV8Mm1lbPjsJp+5nRN+86Xkr7iejcqDi4eRGXaH59KFYioXojQ0Tx5vXtx33kzIfeiZQQSPHWSvASPRyOLDPVVTASyaEo7WXEo6moDr9Vq8fQnFwB4lXWcvQ/mkt2SLGBk4qZjokL+xSHasQKBgEPjs+26VEo4Qa3ZbuXXg6CXy5QewIq2e0du0ndUWGC7XkJIZpuFep0dwChfoLlexOqoZn41AnbH0dI5VUTCkREil/cpdatdSeQfWtAgYR+FMiWDx11riJzBr6sJ6rW11/ibgl1P0D59PwUBnz0TaJnMQ35BfJgZrwi0pVeAMJNPAoGAJJzTmna34fEv2GqKdV5ZN6WzVlHyWaDjrPoW/YYB2nL5mG060lJwcr1a3lromRW0xvhhyJpIFnOSk07OU2XDlgQI38RtwT8BBbLAkBePHGvlINwkW07evQ4Sw4s9qRgiM4U/SXlAUtrD04FRYMns36MVEqqQfiA3qs6WQhGIz3ECgYEAybusDX7SOupRqbMVISjKi6VYYr3nMjCL9wjToBGVyDazVIZnFyRhThujc5dD40LrdwZH4waT02RjlSoeghWFD7Fo/n9oChWd5TBYt4iI8MvqqJZSeHVbbCU2veFsRaedzx+t1BrGsaohoxGuXcacU4mo3cSdf86QQeFD230tF+4=', '2016082100302609', '1', 'MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAyGZj7CFzHOkv0JIYADbGmHyNY4KoehGPmDF+YqosUcKr+AZ/VezF1fhKXQJ7pkVDb3T7ZbDGf6iLxoNAft/FLlmpKxyt5uq1kqzQ4PSAdk4ogqKYtawJQx3lfv1Gz+/0OFTbOHyLm/MieXF7I2MvkWUAq7cECDmpcDLHB9x71BaLyQ8hbPqiq95d7EIWFBdKC9bsWC5k8HXd4kafrlfMhSeMwo9Oe/QQIjauBBMRUPMGwsVG0+HtLG2h1+GzU6gItmQDaoXcIkY0z3+3BXilPnx9AWVAujNNU4Xi8aNNHmR/LeedCmXTwEEBKe0dzzqd4NbeG+bl8TTMiyapJDtHLwIDAQAB', '27', 'dbl公司');

-- ----------------------------
-- Table structure for `t_pay_bill`
-- ----------------------------
DROP TABLE IF EXISTS `t_pay_bill`;
CREATE TABLE `t_pay_bill` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `digest` varchar(100) DEFAULT NULL COMMENT '交易摘要',
  `money` decimal(11,2) NOT NULL COMMENT '金额',
  `state` tinyint(4) NOT NULL DEFAULT '0' COMMENT '支付状态 待支付 已支付 取消',
  `lastPayTime` datetime DEFAULT NULL,
  `payChannel` tinyint(4) NOT NULL COMMENT '支付方式 余额 三方支付',
  `createTime` datetime DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `nickName` varchar(255) DEFAULT NULL,
  `unionPaySn` char(15) DEFAULT NULL COMMENT '统一支付单号',
  `businessType` varchar(255) NOT NULL COMMENT '业务类型',
  `businessKey` bigint(20) NOT NULL COMMENT '关联业务键',
  `shop_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='支付单';

-- ----------------------------
-- Records of t_pay_bill
-- ----------------------------
INSERT INTO `t_pay_bill` VALUES ('2', '[服务订单]购买3次基础版洗澡服务！', '9000.00', '0', '2020-06-13 16:26:32', '1', '2020-06-13 15:56:32', null, '26', '13330964748', '200613035699107', 'businesstype_product', '43', '27');
INSERT INTO `t_pay_bill` VALUES ('3', '[服务订单]购买3次基础版洗澡服务！', '9000.00', '0', '2020-06-13 16:44:44', '1', '2020-06-13 16:14:44', null, '26', '13330964748', '200613041412930', 'businesstype_product', '44', '27');
INSERT INTO `t_pay_bill` VALUES ('4', '[服务订单]购买3次基础版洗澡服务！', '9000.00', '0', '2020-06-13 16:46:56', '1', '2020-06-13 16:16:56', null, '26', '13330964748', '200613041684781', 'businesstype_product', '45', '27');
INSERT INTO `t_pay_bill` VALUES ('5', '[服务订单]购买3次基础版洗澡服务！', '9000.00', '0', '2020-06-13 16:52:10', '1', '2020-06-13 16:22:11', null, '26', '13330964748', '200613042236934', 'businesstype_product', '46', '27');
INSERT INTO `t_pay_bill` VALUES ('6', '[服务订单]购买3次基础版洗澡服务！', '9000.00', '0', '2020-06-13 16:55:34', '1', '2020-06-13 16:25:34', null, '26', '13330964748', '200613042562640', 'businesstype_product', '47', '27');
INSERT INTO `t_pay_bill` VALUES ('7', '[服务订单]购买3次基础版洗澡服务！', '9000.00', '0', '2020-06-13 16:57:34', '1', '2020-06-13 16:27:34', null, '26', '13330964748', '200613042789019', 'businesstype_product', '48', '27');
INSERT INTO `t_pay_bill` VALUES ('8', '[服务订单]购买3次精华版洗澡2服务！', '300000.00', '0', '2020-06-13 17:26:18', '1', '2020-06-13 16:56:18', null, '26', '13330964748', '200613045610490', 'businesstype_product', '49', '27');
INSERT INTO `t_pay_bill` VALUES ('9', '[服务订单]购买3次精华版洗澡2服务！', '300000.00', '0', '2020-06-13 17:32:28', '1', '2020-06-13 17:02:28', null, '26', '13330964748', '200613050214395', 'businesstype_product', '50', '27');
INSERT INTO `t_pay_bill` VALUES ('10', '[服务订单]购买3次精华版洗澡0服务！', '300000.00', '0', '2020-06-13 17:35:45', '1', '2020-06-13 17:05:45', null, '26', '13330964748', '200613050515733', 'businesstype_product', '51', '27');
INSERT INTO `t_pay_bill` VALUES ('11', '[服务订单]购买3次精华版洗澡0服务！', '300000.00', '0', '2020-06-13 17:46:50', '1', '2020-06-13 17:16:50', null, '26', '13330964748', '200613051698196', 'businesstype_product', '52', '27');
INSERT INTO `t_pay_bill` VALUES ('12', '[服务订单]购买3次精华版洗澡0服务！', '300000.00', '1', '2020-06-15 09:42:52', '1', '2020-06-15 09:12:54', null, '26', '13330964748', '200615091264400', 'businesstype_product', '53', '27');
INSERT INTO `t_pay_bill` VALUES ('13', '[服务订单]购买3次精华版洗澡0服务！', '300000.00', '-1', '2020-06-16 15:07:32', '1', '2020-06-16 15:06:32', null, '26', '13330964748', '200616030633513', 'businesstype_product', '54', '27');

-- ----------------------------
-- Table structure for `t_permission`
-- ----------------------------
DROP TABLE IF EXISTS `t_permission`;
CREATE TABLE `t_permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `descs` varchar(255) DEFAULT NULL,
  `sn` varchar(255) DEFAULT NULL,
  `menu_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `menu_id` (`menu_id`),
  CONSTRAINT `t_permission_ibfk_1` FOREIGN KEY (`menu_id`) REFERENCES `t_menu` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_permission
-- ----------------------------
INSERT INTO `t_permission` VALUES ('26', '员工管理', '/employee', null, 'employee:*', '19');
INSERT INTO `t_permission` VALUES ('27', '部门管理', '/department', null, 'department:*', '20');
INSERT INTO `t_permission` VALUES ('28', '门店管理', '/shop', null, 'shop:*', '21');

-- ----------------------------
-- Table structure for `t_pet`
-- ----------------------------
DROP TABLE IF EXISTS `t_pet`;
CREATE TABLE `t_pet` (
  `adopt_id` bigint(20) NOT NULL,
  `id` bigint(2) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `resources` varchar(255) DEFAULT NULL,
  `saleprice` decimal(19,2) DEFAULT NULL,
  `offsaletime` datetime DEFAULT NULL,
  `onsaletime` datetime DEFAULT NULL,
  `state` bigint(2) DEFAULT NULL COMMENT '状态：0下架 1上架',
  `costprice` varchar(255) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  `type_id` bigint(20) DEFAULT NULL COMMENT '类型id',
  `shop_id` bigint(20) DEFAULT NULL COMMENT '店铺Id 如果被领养店铺id为null',
  `user_id` bigint(20) DEFAULT NULL COMMENT '如果被领养为领养用户id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_pet
-- ----------------------------
INSERT INTO `t_pet` VALUES ('0', '4', '小狗子', '/group1/M00/00/07/wKgABF7bN9aAUr5jAABMYp1lVaA616.jpg,/group1/M00/00/07/wKgABF7bN_2AcnCmAABMYp1lVaA428.jpg', '100.00', null, '2020-06-10 14:29:53', '1', '100', '2020-05-10 10:49:13', '1', '27', null);
INSERT INTO `t_pet` VALUES ('0', '6', '小狗子1', '/group1/M00/00/07/wKgABF7bN9aAUr5jAABMYp1lVaA616.jpg,/group1/M00/00/07/wKgABF7bN_2AcnCmAABMYp1lVaA428.jpg', '100.00', null, '2020-06-10 14:29:53', '1', '100', '2020-05-10 10:50:45', '1', '27', null);
INSERT INTO `t_pet` VALUES ('0', '7', '小狗子2', '/group1/M00/00/07/wKgABF7bN9aAUr5jAABMYp1lVaA616.jpg,/group1/M00/00/07/wKgABF7bN_2AcnCmAABMYp1lVaA428.jpg', '100.00', null, '2020-06-10 14:29:53', '1', '100', '2020-05-10 10:50:45', '1', null, '26');
INSERT INTO `t_pet` VALUES ('0', '8', '小狗子3', '/group1/M00/00/07/wKgABF7bN9aAUr5jAABMYp1lVaA616.jpg,/group1/M00/00/07/wKgABF7bN_2AcnCmAABMYp1lVaA428.jpg', '100.00', null, '2020-06-10 14:29:53', '1', '100', '2020-05-10 10:50:45', '1', null, '26');
INSERT INTO `t_pet` VALUES ('0', '9', '小狗子4', '/group1/M00/00/07/wKgABF7bN9aAUr5jAABMYp1lVaA616.jpg,/group1/M00/00/07/wKgABF7bN_2AcnCmAABMYp1lVaA428.jpg', '100.00', null, '2020-06-10 14:29:53', '1', '100', '2020-05-10 10:50:45', '1', null, '26');
INSERT INTO `t_pet` VALUES ('0', '10', '小狗子5', '/group1/M00/00/07/wKgABF7bN9aAUr5jAABMYp1lVaA616.jpg,/group1/M00/00/07/wKgABF7bN_2AcnCmAABMYp1lVaA428.jpg', '100.00', null, '2020-06-10 14:29:53', '1', '100', '2020-05-10 10:50:45', '1', '27', null);
INSERT INTO `t_pet` VALUES ('0', '11', '小狗子6', '/group1/M00/00/07/wKgABF7bN9aAUr5jAABMYp1lVaA616.jpg,/group1/M00/00/07/wKgABF7bN_2AcnCmAABMYp1lVaA428.jpg', '100.00', null, '2020-06-10 14:29:53', '1', '100', '2020-05-10 10:50:45', '1', '27', null);
INSERT INTO `t_pet` VALUES ('0', '12', '小狗子7', '/group1/M00/00/07/wKgABF7bN9aAUr5jAABMYp1lVaA616.jpg,/group1/M00/00/07/wKgABF7bN_2AcnCmAABMYp1lVaA428.jpg', '100.00', null, '2020-06-10 14:29:53', '1', '100', '2020-05-10 10:50:45', '1', '27', null);
INSERT INTO `t_pet` VALUES ('0', '13', '小狗子8', '/group1/M00/00/07/wKgABF7bN9aAUr5jAABMYp1lVaA616.jpg,/group1/M00/00/07/wKgABF7bN_2AcnCmAABMYp1lVaA428.jpg', '100.00', null, null, '0', '100', '2020-05-10 10:50:45', '1', '27', null);
INSERT INTO `t_pet` VALUES ('0', '14', '小狗子9', '/group1/M00/00/07/wKgABF7bN9aAUr5jAABMYp1lVaA616.jpg,/group1/M00/00/07/wKgABF7bN_2AcnCmAABMYp1lVaA428.jpg', '100.00', null, null, '0', '100', '2020-05-10 10:50:45', '1', '27', null);
INSERT INTO `t_pet` VALUES ('0', '15', '小狗子10', '/group1/M00/00/07/wKgABF7bN9aAUr5jAABMYp1lVaA616.jpg,/group1/M00/00/07/wKgABF7bN_2AcnCmAABMYp1lVaA428.jpg', '100.00', null, null, '0', '100', '2020-05-10 10:50:45', '1', '27', null);
INSERT INTO `t_pet` VALUES ('0', '16', '小狗子11', '/group1/M00/00/07/wKgABF7bN9aAUr5jAABMYp1lVaA616.jpg,/group1/M00/00/07/wKgABF7bN_2AcnCmAABMYp1lVaA428.jpg', '100.00', null, null, '0', '100', '2020-05-10 10:50:45', '1', '27', null);
INSERT INTO `t_pet` VALUES ('0', '17', '小狗子12', '/group1/M00/00/07/wKgABF7bN9aAUr5jAABMYp1lVaA616.jpg,/group1/M00/00/07/wKgABF7bN_2AcnCmAABMYp1lVaA428.jpg', '100.00', null, null, '0', '100', '2020-05-10 10:50:45', '1', '27', null);
INSERT INTO `t_pet` VALUES ('0', '18', '小狗子13', '/group1/M00/00/07/wKgABF7bN9aAUr5jAABMYp1lVaA616.jpg,/group1/M00/00/07/wKgABF7bN_2AcnCmAABMYp1lVaA428.jpg', '100.00', null, null, '0', '100', '2020-05-10 10:50:45', '1', '27', null);
INSERT INTO `t_pet` VALUES ('0', '19', '小狗子14', '/group1/M00/00/07/wKgABF7bN9aAUr5jAABMYp1lVaA616.jpg,/group1/M00/00/07/wKgABF7bN_2AcnCmAABMYp1lVaA428.jpg', '100.00', null, null, '0', '100', '2020-05-10 10:50:45', '1', '27', null);
INSERT INTO `t_pet` VALUES ('0', '20', '小狗子15', '/group1/M00/00/07/wKgABF7bN9aAUr5jAABMYp1lVaA616.jpg,/group1/M00/00/07/wKgABF7bN_2AcnCmAABMYp1lVaA428.jpg', '100.00', null, null, '0', '100', '2020-05-10 10:50:45', '1', '27', null);
INSERT INTO `t_pet` VALUES ('0', '21', '小狗子16', '/group1/M00/00/07/wKgABF7bN9aAUr5jAABMYp1lVaA616.jpg,/group1/M00/00/07/wKgABF7bN_2AcnCmAABMYp1lVaA428.jpg', '100.00', null, null, '1', '100', '2020-05-10 10:50:45', '1', '27', null);
INSERT INTO `t_pet` VALUES ('0', '22', '小狗子17', '/group1/M00/00/07/wKgABF7bN9aAUr5jAABMYp1lVaA616.jpg,/group1/M00/00/07/wKgABF7bN_2AcnCmAABMYp1lVaA428.jpg', '100.00', null, null, '0', '100', '2020-05-10 10:50:45', '1', '27', null);
INSERT INTO `t_pet` VALUES ('0', '23', '小狗子18', '/group1/M00/00/07/wKgABF7bN9aAUr5jAABMYp1lVaA616.jpg,/group1/M00/00/07/wKgABF7bN_2AcnCmAABMYp1lVaA428.jpg', '100.00', null, null, '0', '100', '2020-05-10 10:50:45', '1', '27', null);
INSERT INTO `t_pet` VALUES ('0', '24', '小狗子19', '/group1/M00/00/07/wKgABF7bN9aAUr5jAABMYp1lVaA616.jpg,/group1/M00/00/07/wKgABF7bN_2AcnCmAABMYp1lVaA428.jpg', '100.00', null, null, '0', '100', '2020-05-10 10:50:46', '1', '27', null);
INSERT INTO `t_pet` VALUES ('0', '25', '小狗子20', '/group1/M00/00/07/wKgABF7bN9aAUr5jAABMYp1lVaA616.jpg,/group1/M00/00/07/wKgABF7bN_2AcnCmAABMYp1lVaA428.jpg', '100.00', null, null, '0', '100', '2020-05-10 10:50:46', '1', '27', null);
INSERT INTO `t_pet` VALUES ('0', '26', '小狗子21', '/group1/M00/00/07/wKgABF7bN9aAUr5jAABMYp1lVaA616.jpg,/group1/M00/00/07/wKgABF7bN_2AcnCmAABMYp1lVaA428.jpg', '100.00', null, null, '0', '100', '2020-05-10 10:50:46', '1', '27', null);
INSERT INTO `t_pet` VALUES ('0', '27', '小狗子22', '/group1/M00/00/07/wKgABF7bN9aAUr5jAABMYp1lVaA616.jpg,/group1/M00/00/07/wKgABF7bN_2AcnCmAABMYp1lVaA428.jpg', '100.00', null, null, '1', '100', '2020-05-10 10:50:46', '1', '27', null);
INSERT INTO `t_pet` VALUES ('0', '28', '小狗子23', '/group1/M00/00/07/wKgABF7bN9aAUr5jAABMYp1lVaA616.jpg,/group1/M00/00/07/wKgABF7bN_2AcnCmAABMYp1lVaA428.jpg', '100.00', null, null, '0', '100', '2020-05-10 10:50:46', '1', '27', null);
INSERT INTO `t_pet` VALUES ('0', '29', '小狗子24', '/group1/M00/00/07/wKgABF7bN9aAUr5jAABMYp1lVaA616.jpg,/group1/M00/00/07/wKgABF7bN_2AcnCmAABMYp1lVaA428.jpg', '100.00', null, null, '0', '100', '2020-05-10 10:50:46', '1', '27', null);
INSERT INTO `t_pet` VALUES ('0', '30', '小狗子25', '/group1/M00/00/07/wKgABF7bN9aAUr5jAABMYp1lVaA616.jpg,/group1/M00/00/07/wKgABF7bN_2AcnCmAABMYp1lVaA428.jpg', '100.00', null, null, '0', '100', '2020-05-10 10:50:46', '1', '27', null);
INSERT INTO `t_pet` VALUES ('0', '31', '小狗子26', '/group1/M00/00/07/wKgABF7bN9aAUr5jAABMYp1lVaA616.jpg,/group1/M00/00/07/wKgABF7bN_2AcnCmAABMYp1lVaA428.jpg', '100.00', null, null, '0', '100', '2020-05-10 10:50:46', '1', '27', null);
INSERT INTO `t_pet` VALUES ('0', '32', '小狗子27', '/group1/M00/00/07/wKgABF7bN9aAUr5jAABMYp1lVaA616.jpg,/group1/M00/00/07/wKgABF7bN_2AcnCmAABMYp1lVaA428.jpg', '100.00', null, null, '0', '100', '2020-05-10 10:50:46', '1', '27', null);
INSERT INTO `t_pet` VALUES ('0', '33', '小狗子28', '/group1/M00/00/07/wKgABF7bN9aAUr5jAABMYp1lVaA616.jpg,/group1/M00/00/07/wKgABF7bN_2AcnCmAABMYp1lVaA428.jpg', '100.00', null, null, '0', '100', '2020-05-10 10:50:46', '1', '27', null);
INSERT INTO `t_pet` VALUES ('0', '34', '小狗子29', '/group1/M00/00/07/wKgABF7bN9aAUr5jAABMYp1lVaA616.jpg,/group1/M00/00/07/wKgABF7bN_2AcnCmAABMYp1lVaA428.jpg', '100.00', null, null, '0', '100', '2020-05-10 10:50:46', '1', '27', null);
INSERT INTO `t_pet` VALUES ('0', '35', '小狗子30', '/group1/M00/00/07/wKgABF7bN9aAUr5jAABMYp1lVaA616.jpg,/group1/M00/00/07/wKgABF7bN_2AcnCmAABMYp1lVaA428.jpg', '100.00', null, null, '0', '100', '2020-05-10 10:50:46', '1', '27', null);
INSERT INTO `t_pet` VALUES ('0', '36', '小狗子31', '/group1/M00/00/07/wKgABF7bN9aAUr5jAABMYp1lVaA616.jpg,/group1/M00/00/07/wKgABF7bN_2AcnCmAABMYp1lVaA428.jpg', '100.00', null, null, '0', '100', '2020-05-10 10:50:46', '1', '27', null);
INSERT INTO `t_pet` VALUES ('0', '37', '小狗子32', '/group1/M00/00/07/wKgABF7bN9aAUr5jAABMYp1lVaA616.jpg,/group1/M00/00/07/wKgABF7bN_2AcnCmAABMYp1lVaA428.jpg', '100.00', null, null, '0', '100', '2020-05-10 10:50:46', '1', '27', null);
INSERT INTO `t_pet` VALUES ('0', '38', '小狗子33', '/group1/M00/00/07/wKgABF7bN9aAUr5jAABMYp1lVaA616.jpg,/group1/M00/00/07/wKgABF7bN_2AcnCmAABMYp1lVaA428.jpg', '100.00', null, null, '0', '100', '2020-05-10 10:50:46', '1', '27', null);
INSERT INTO `t_pet` VALUES ('0', '39', '小狗子34', '/group1/M00/00/07/wKgABF7bN9aAUr5jAABMYp1lVaA616.jpg,/group1/M00/00/07/wKgABF7bN_2AcnCmAABMYp1lVaA428.jpg', '100.00', null, null, '0', '100', '2020-05-10 10:50:46', '1', '27', null);
INSERT INTO `t_pet` VALUES ('0', '40', '小狗子35', '/group1/M00/00/07/wKgABF7bN9aAUr5jAABMYp1lVaA616.jpg,/group1/M00/00/07/wKgABF7bN_2AcnCmAABMYp1lVaA428.jpg', '100.00', null, null, '0', '100', '2020-05-10 10:50:46', '1', '27', null);
INSERT INTO `t_pet` VALUES ('0', '41', '小狗子36', '/group1/M00/00/07/wKgABF7bN9aAUr5jAABMYp1lVaA616.jpg,/group1/M00/00/07/wKgABF7bN_2AcnCmAABMYp1lVaA428.jpg', '100.00', null, null, '0', '100', '2020-05-10 10:50:46', '1', '27', null);
INSERT INTO `t_pet` VALUES ('0', '42', '小狗子37', '/group1/M00/00/07/wKgABF7bN9aAUr5jAABMYp1lVaA616.jpg,/group1/M00/00/07/wKgABF7bN_2AcnCmAABMYp1lVaA428.jpg', '100.00', null, null, '0', '100', '2020-05-10 10:50:46', '1', '27', null);
INSERT INTO `t_pet` VALUES ('0', '43', '小狗子38', '/group1/M00/00/07/wKgABF7bN9aAUr5jAABMYp1lVaA616.jpg,/group1/M00/00/07/wKgABF7bN_2AcnCmAABMYp1lVaA428.jpg', '100.00', null, null, '0', '100', '2020-05-10 10:50:46', '1', '27', null);
INSERT INTO `t_pet` VALUES ('0', '44', '小狗子39', '/group1/M00/00/07/wKgABF7bN9aAUr5jAABMYp1lVaA616.jpg,/group1/M00/00/07/wKgABF7bN_2AcnCmAABMYp1lVaA428.jpg', '100.00', null, null, '0', '100', '2020-05-10 10:50:46', '1', '27', null);
INSERT INTO `t_pet` VALUES ('0', '45', '小狗子40', '/group1/M00/00/07/wKgABF7bN9aAUr5jAABMYp1lVaA616.jpg,/group1/M00/00/07/wKgABF7bN_2AcnCmAABMYp1lVaA428.jpg', '100.00', null, null, '0', '100', '2020-05-10 10:50:46', '1', '27', null);
INSERT INTO `t_pet` VALUES ('0', '46', '小狗子41', '/group1/M00/00/07/wKgABF7bN9aAUr5jAABMYp1lVaA616.jpg,/group1/M00/00/07/wKgABF7bN_2AcnCmAABMYp1lVaA428.jpg', '100.00', null, null, '0', '100', '2020-05-10 10:50:46', '1', '27', null);
INSERT INTO `t_pet` VALUES ('0', '47', '小狗子42', '/group1/M00/00/07/wKgABF7bN9aAUr5jAABMYp1lVaA616.jpg,/group1/M00/00/07/wKgABF7bN_2AcnCmAABMYp1lVaA428.jpg', '100.00', null, null, '0', '100', '2020-05-10 10:50:46', '1', '27', null);
INSERT INTO `t_pet` VALUES ('0', '48', '小狗子43', '/group1/M00/00/07/wKgABF7bN9aAUr5jAABMYp1lVaA616.jpg,/group1/M00/00/07/wKgABF7bN_2AcnCmAABMYp1lVaA428.jpg', '100.00', null, null, '0', '100', '2020-05-10 10:50:46', '1', '27', null);
INSERT INTO `t_pet` VALUES ('0', '49', '小狗子44', '/group1/M00/00/07/wKgABF7bN9aAUr5jAABMYp1lVaA616.jpg,/group1/M00/00/07/wKgABF7bN_2AcnCmAABMYp1lVaA428.jpg', '100.00', null, null, '0', '100', '2020-05-10 10:50:46', '1', '27', null);
INSERT INTO `t_pet` VALUES ('0', '50', '小狗子45', '/group1/M00/00/07/wKgABF7bN9aAUr5jAABMYp1lVaA616.jpg,/group1/M00/00/07/wKgABF7bN_2AcnCmAABMYp1lVaA428.jpg', '100.00', null, null, '0', '100', '2020-05-10 10:50:46', '1', '27', null);
INSERT INTO `t_pet` VALUES ('0', '51', '小狗子46', '/group1/M00/00/07/wKgABF7bN9aAUr5jAABMYp1lVaA616.jpg,/group1/M00/00/07/wKgABF7bN_2AcnCmAABMYp1lVaA428.jpg', '100.00', null, null, '0', '100', '2020-05-10 10:50:46', '1', '27', null);
INSERT INTO `t_pet` VALUES ('0', '52', '小狗子47', '/group1/M00/00/07/wKgABF7bN9aAUr5jAABMYp1lVaA616.jpg,/group1/M00/00/07/wKgABF7bN_2AcnCmAABMYp1lVaA428.jpg', '100.00', null, null, '0', '100', '2020-05-10 10:50:46', '1', '27', null);
INSERT INTO `t_pet` VALUES ('0', '53', '小狗子48', '/group1/M00/00/07/wKgABF7bN9aAUr5jAABMYp1lVaA616.jpg,/group1/M00/00/07/wKgABF7bN_2AcnCmAABMYp1lVaA428.jpg', '100.00', null, null, '0', '100', '2020-05-10 10:50:46', '1', '27', null);
INSERT INTO `t_pet` VALUES ('0', '54', '小狗子49', '/group1/M00/00/07/wKgABF7bN9aAUr5jAABMYp1lVaA616.jpg,/group1/M00/00/07/wKgABF7bN_2AcnCmAABMYp1lVaA428.jpg', '100.00', null, null, '0', '100', '2020-05-10 10:50:46', '1', '27', null);
INSERT INTO `t_pet` VALUES ('24', '55', '旺财', '/group1/M00/00/07/wKgABF7bN9aAUr5jAABMYp1lVaA616.jpg,/group1/M00/00/07/wKgABF7bN_2AcnCmAABMYp1lVaA428.jpg', '30.00', null, null, null, '0', null, '1', '27', null);
INSERT INTO `t_pet` VALUES ('213', '56', '旺财1号', '/group1/M00/00/07/wKgABF7bN9aAUr5jAABMYp1lVaA616.jpg,/group1/M00/00/07/wKgABF7bN_2AcnCmAABMYp1lVaA428.jpg', '0.00', null, null, null, '0', null, '1', '27', null);

-- ----------------------------
-- Table structure for `t_pet_detail`
-- ----------------------------
DROP TABLE IF EXISTS `t_pet_detail`;
CREATE TABLE `t_pet_detail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `pet_id` bigint(20) DEFAULT NULL,
  `adoptNotice` text,
  `intro` text COMMENT '简介',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_pet_detail
-- ----------------------------
INSERT INTO `t_pet_detail` VALUES ('1', '1', null, '<p>1</p><p><img src=\"http://121.37.194.36//group1/M00/00/00/wKgABF7CLeaAdIVhAAOpbD3B5L4818.png\"></p>');
INSERT INTO `t_pet_detail` VALUES ('3', '3', null, '<p>1</p><p><img src=\"http://121.37.194.36//group1/M00/00/00/wKgABF7CLeaAdIVhAAOpbD3B5L4818.png\"></p>');
INSERT INTO `t_pet_detail` VALUES ('4', '4', null, '<p>1</p><p><img src=\"http://121.37.194.36//group1/M00/00/00/wKgABF7CLeaAdIVhAAOpbD3B5L4818.png\"></p>');
INSERT INTO `t_pet_detail` VALUES ('6', '6', null, '<p>1</p><p><img src=\"http://121.37.194.36//group1/M00/00/00/wKgABF7CLeaAdIVhAAOpbD3B5L4818.png\"></p>');
INSERT INTO `t_pet_detail` VALUES ('7', '7', null, '<p>1</p><p><img src=\"http://121.37.194.36//group1/M00/00/00/wKgABF7CLeaAdIVhAAOpbD3B5L4818.png\"></p>');
INSERT INTO `t_pet_detail` VALUES ('8', '8', null, '<p>1</p><p><img src=\"http://121.37.194.36//group1/M00/00/00/wKgABF7CLeaAdIVhAAOpbD3B5L4818.png\"></p>');
INSERT INTO `t_pet_detail` VALUES ('9', '9', null, '<p>1</p><p><img src=\"http://121.37.194.36//group1/M00/00/00/wKgABF7CLeaAdIVhAAOpbD3B5L4818.png\"></p>');
INSERT INTO `t_pet_detail` VALUES ('10', '10', null, '<p>1</p><p><img src=\"http://121.37.194.36//group1/M00/00/00/wKgABF7CLeaAdIVhAAOpbD3B5L4818.png\"></p>');
INSERT INTO `t_pet_detail` VALUES ('11', '11', null, '<p>1</p><p><img src=\"http://121.37.194.36//group1/M00/00/00/wKgABF7CLeaAdIVhAAOpbD3B5L4818.png\"></p>');
INSERT INTO `t_pet_detail` VALUES ('12', '12', null, '<p>1</p><p><img src=\"http://121.37.194.36//group1/M00/00/00/wKgABF7CLeaAdIVhAAOpbD3B5L4818.png\"></p>');
INSERT INTO `t_pet_detail` VALUES ('13', '13', null, '<p>1</p><p><img src=\"http://121.37.194.36//group1/M00/00/00/wKgABF7CLeaAdIVhAAOpbD3B5L4818.png\"></p>');
INSERT INTO `t_pet_detail` VALUES ('14', '14', null, '<p>1</p><p><img src=\"http://121.37.194.36//group1/M00/00/00/wKgABF7CLeaAdIVhAAOpbD3B5L4818.png\"></p>');
INSERT INTO `t_pet_detail` VALUES ('15', '15', null, '<p>1</p><p><img src=\"http://121.37.194.36//group1/M00/00/00/wKgABF7CLeaAdIVhAAOpbD3B5L4818.png\"></p>');
INSERT INTO `t_pet_detail` VALUES ('16', '16', null, '<p>1</p><p><img src=\"http://121.37.194.36//group1/M00/00/00/wKgABF7CLeaAdIVhAAOpbD3B5L4818.png\"></p>');
INSERT INTO `t_pet_detail` VALUES ('17', '17', null, '<p>1</p><p><img src=\"http://121.37.194.36//group1/M00/00/00/wKgABF7CLeaAdIVhAAOpbD3B5L4818.png\"></p>');
INSERT INTO `t_pet_detail` VALUES ('18', '18', null, '<p>1</p><p><img src=\"http://121.37.194.36//group1/M00/00/00/wKgABF7CLeaAdIVhAAOpbD3B5L4818.png\"></p>');
INSERT INTO `t_pet_detail` VALUES ('19', '19', null, '<p>1</p><p><img src=\"http://121.37.194.36//group1/M00/00/00/wKgABF7CLeaAdIVhAAOpbD3B5L4818.png\"></p>');
INSERT INTO `t_pet_detail` VALUES ('20', '20', null, '<p>1</p><p><img src=\"http://121.37.194.36//group1/M00/00/00/wKgABF7CLeaAdIVhAAOpbD3B5L4818.png\"></p>');
INSERT INTO `t_pet_detail` VALUES ('21', '21', null, '<p>1</p><p><img src=\"http://121.37.194.36//group1/M00/00/00/wKgABF7CLeaAdIVhAAOpbD3B5L4818.png\"></p>');
INSERT INTO `t_pet_detail` VALUES ('22', '22', null, '<p>1</p><p><img src=\"http://121.37.194.36//group1/M00/00/00/wKgABF7CLeaAdIVhAAOpbD3B5L4818.png\"></p>');
INSERT INTO `t_pet_detail` VALUES ('23', '23', null, '<p>1</p><p><img src=\"http://121.37.194.36//group1/M00/00/00/wKgABF7CLeaAdIVhAAOpbD3B5L4818.png\"></p>');
INSERT INTO `t_pet_detail` VALUES ('24', '24', null, '<p>1</p><p><img src=\"http://121.37.194.36//group1/M00/00/00/wKgABF7CLeaAdIVhAAOpbD3B5L4818.png\"></p>');
INSERT INTO `t_pet_detail` VALUES ('25', '25', null, '<p>1</p><p><img src=\"http://121.37.194.36//group1/M00/00/00/wKgABF7CLeaAdIVhAAOpbD3B5L4818.png\"></p>');
INSERT INTO `t_pet_detail` VALUES ('26', '26', null, '<p>1</p><p><img src=\"http://121.37.194.36//group1/M00/00/00/wKgABF7CLeaAdIVhAAOpbD3B5L4818.png\"></p>');
INSERT INTO `t_pet_detail` VALUES ('27', '27', null, '<p>1</p><p><img src=\"http://121.37.194.36//group1/M00/00/00/wKgABF7CLeaAdIVhAAOpbD3B5L4818.png\"></p>');
INSERT INTO `t_pet_detail` VALUES ('28', '28', null, '<p>1</p><p><img src=\"http://121.37.194.36//group1/M00/00/00/wKgABF7CLeaAdIVhAAOpbD3B5L4818.png\"></p>');
INSERT INTO `t_pet_detail` VALUES ('29', '29', null, '<p>1</p><p><img src=\"http://121.37.194.36//group1/M00/00/00/wKgABF7CLeaAdIVhAAOpbD3B5L4818.png\"></p>');
INSERT INTO `t_pet_detail` VALUES ('30', '30', null, '<p>1</p><p><img src=\"http://121.37.194.36//group1/M00/00/00/wKgABF7CLeaAdIVhAAOpbD3B5L4818.png\"></p>');
INSERT INTO `t_pet_detail` VALUES ('31', '31', null, '<p>1</p><p><img src=\"http://121.37.194.36//group1/M00/00/00/wKgABF7CLeaAdIVhAAOpbD3B5L4818.png\"></p>');
INSERT INTO `t_pet_detail` VALUES ('32', '32', null, '<p>1</p><p><img src=\"http://121.37.194.36//group1/M00/00/00/wKgABF7CLeaAdIVhAAOpbD3B5L4818.png\"></p>');
INSERT INTO `t_pet_detail` VALUES ('33', '33', null, '<p>1</p><p><img src=\"http://121.37.194.36//group1/M00/00/00/wKgABF7CLeaAdIVhAAOpbD3B5L4818.png\"></p>');
INSERT INTO `t_pet_detail` VALUES ('34', '34', null, '<p>1</p><p><img src=\"http://121.37.194.36//group1/M00/00/00/wKgABF7CLeaAdIVhAAOpbD3B5L4818.png\"></p>');
INSERT INTO `t_pet_detail` VALUES ('35', '35', null, '<p>1</p><p><img src=\"http://121.37.194.36//group1/M00/00/00/wKgABF7CLeaAdIVhAAOpbD3B5L4818.png\"></p>');
INSERT INTO `t_pet_detail` VALUES ('36', '36', null, '<p>1</p><p><img src=\"http://121.37.194.36//group1/M00/00/00/wKgABF7CLeaAdIVhAAOpbD3B5L4818.png\"></p>');
INSERT INTO `t_pet_detail` VALUES ('37', '37', null, '<p>1</p><p><img src=\"http://121.37.194.36//group1/M00/00/00/wKgABF7CLeaAdIVhAAOpbD3B5L4818.png\"></p>');
INSERT INTO `t_pet_detail` VALUES ('38', '38', null, '<p>1</p><p><img src=\"http://121.37.194.36//group1/M00/00/00/wKgABF7CLeaAdIVhAAOpbD3B5L4818.png\"></p>');
INSERT INTO `t_pet_detail` VALUES ('39', '39', null, '<p>1</p><p><img src=\"http://121.37.194.36//group1/M00/00/00/wKgABF7CLeaAdIVhAAOpbD3B5L4818.png\"></p>');
INSERT INTO `t_pet_detail` VALUES ('40', '40', null, '<p>1</p><p><img src=\"http://121.37.194.36//group1/M00/00/00/wKgABF7CLeaAdIVhAAOpbD3B5L4818.png\"></p>');
INSERT INTO `t_pet_detail` VALUES ('41', '41', null, '<p>1</p><p><img src=\"http://121.37.194.36//group1/M00/00/00/wKgABF7CLeaAdIVhAAOpbD3B5L4818.png\"></p>');
INSERT INTO `t_pet_detail` VALUES ('42', '42', null, '<p>1</p><p><img src=\"http://121.37.194.36//group1/M00/00/00/wKgABF7CLeaAdIVhAAOpbD3B5L4818.png\"></p>');
INSERT INTO `t_pet_detail` VALUES ('43', '43', null, '<p>1</p><p><img src=\"http://121.37.194.36//group1/M00/00/00/wKgABF7CLeaAdIVhAAOpbD3B5L4818.png\"></p>');
INSERT INTO `t_pet_detail` VALUES ('44', '44', null, '<p>1</p><p><img src=\"http://121.37.194.36//group1/M00/00/00/wKgABF7CLeaAdIVhAAOpbD3B5L4818.png\"></p>');
INSERT INTO `t_pet_detail` VALUES ('45', '45', null, '<p>1</p><p><img src=\"http://121.37.194.36//group1/M00/00/00/wKgABF7CLeaAdIVhAAOpbD3B5L4818.png\"></p>');
INSERT INTO `t_pet_detail` VALUES ('46', '46', null, '<p>1</p><p><img src=\"http://121.37.194.36//group1/M00/00/00/wKgABF7CLeaAdIVhAAOpbD3B5L4818.png\"></p>');
INSERT INTO `t_pet_detail` VALUES ('47', '47', null, '<p>1</p><p><img src=\"http://121.37.194.36//group1/M00/00/00/wKgABF7CLeaAdIVhAAOpbD3B5L4818.png\"></p>');
INSERT INTO `t_pet_detail` VALUES ('48', '48', null, '<p>1</p><p><img src=\"http://121.37.194.36//group1/M00/00/00/wKgABF7CLeaAdIVhAAOpbD3B5L4818.png\"></p>');
INSERT INTO `t_pet_detail` VALUES ('49', '49', null, '<p>1</p><p><img src=\"http://121.37.194.36//group1/M00/00/00/wKgABF7CLeaAdIVhAAOpbD3B5L4818.png\"></p>');
INSERT INTO `t_pet_detail` VALUES ('50', '50', null, '<p>1</p><p><img src=\"http://121.37.194.36//group1/M00/00/00/wKgABF7CLeaAdIVhAAOpbD3B5L4818.png\"></p>');
INSERT INTO `t_pet_detail` VALUES ('51', '51', null, '<p>1</p><p><img src=\"http://121.37.194.36//group1/M00/00/00/wKgABF7CLeaAdIVhAAOpbD3B5L4818.png\"></p>');
INSERT INTO `t_pet_detail` VALUES ('52', '52', null, '<p>1</p><p><img src=\"http://121.37.194.36//group1/M00/00/00/wKgABF7CLeaAdIVhAAOpbD3B5L4818.png\"></p>');
INSERT INTO `t_pet_detail` VALUES ('53', '53', null, '<p>1</p><p><img src=\"http://121.37.194.36//group1/M00/00/00/wKgABF7CLeaAdIVhAAOpbD3B5L4818.png\"></p>');
INSERT INTO `t_pet_detail` VALUES ('54', '54', null, '<p>1</p><p><img src=\"http://121.37.194.36//group1/M00/00/00/wKgABF7CLeaAdIVhAAOpbD3B5L4818.png\"></p>');
INSERT INTO `t_pet_detail` VALUES ('55', '55', '<p>1</p>', '<p>1</p>');
INSERT INTO `t_pet_detail` VALUES ('56', '56', '<p>1</p>', '<p>1</p>');

-- ----------------------------
-- Table structure for `t_pet_type`
-- ----------------------------
DROP TABLE IF EXISTS `t_pet_type`;
CREATE TABLE `t_pet_type` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `pid` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_pet_type
-- ----------------------------
INSERT INTO `t_pet_type` VALUES ('1', '狗', '狗....', null);

-- ----------------------------
-- Table structure for `t_product`
-- ----------------------------
DROP TABLE IF EXISTS `t_product`;
CREATE TABLE `t_product` (
  `id` bigint(2) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '服务名称',
  `resources` varchar(255) DEFAULT NULL COMMENT '存放fastdfs地址，多个资源使用，分割',
  `saleprice` decimal(19,2) DEFAULT NULL,
  `offsaletime` datetime DEFAULT NULL,
  `onsaletime` datetime DEFAULT NULL,
  `state` bigint(2) DEFAULT NULL COMMENT '状态：0下架 1上架',
  `costprice` varchar(255) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  `salecount` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=170 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_product
-- ----------------------------
INSERT INTO `t_product` VALUES ('8', '基础版洗澡', '/group1/M00/00/00/wKgABF7CJ0uAU12WAAL5x3kjuBU629.png,/group1/M00/00/00/rBEABV6z2OqAJ0kHAAK0qdoKbvA711.jpg', '30.00', '2020-06-06 16:30:51', '2020-06-06 16:30:59', '1', '50', '2020-05-05 15:38:54', '10');
INSERT INTO `t_product` VALUES ('16', '高级洗澡0', '/group1/M00/00/00/wKgABF7CJ0uAU12WAAL5x3kjuBU629.png', '1000.00', '2020-06-06 16:30:51', '2020-06-06 16:30:59', '1', '1000', '2020-05-08 09:00:52', '20');
INSERT INTO `t_product` VALUES ('66', '精品洗澡折扣套餐', '/group1/M00/00/00/wKgABF7CKVSAcjUfAAUeKI8nNOI352.png', '99.00', '2020-06-06 16:30:51', '2020-06-06 16:30:59', '1', '199', '2020-05-18 14:21:50', '30');
INSERT INTO `t_product` VALUES ('67', '精华版洗澡', '/group1/M00/00/07/wKgABF7bN9aAUr5jAABMYp1lVaA616.jpg,/group1/M00/00/07/wKgABF7bN_2AcnCmAABMYp1lVaA428.jpg', '1000.00', '2020-06-06 16:30:51', '2020-06-06 16:30:59', '1', '1000', null, '40');
INSERT INTO `t_product` VALUES ('68', '精华版洗澡0', '/group1/M00/00/07/wKgABF7bN9aAUr5jAABMYp1lVaA616.jpg,/group1/M00/00/07/wKgABF7bN_2AcnCmAABMYp1lVaA428.jpg', '1000.00', '2020-06-06 16:30:51', '2020-06-06 16:30:59', '1', '1000', null, null);
INSERT INTO `t_product` VALUES ('69', '精华版洗澡1', '/group1/M00/00/07/wKgABF7bN9aAUr5jAABMYp1lVaA616.jpg,/group1/M00/00/07/wKgABF7bN_2AcnCmAABMYp1lVaA428.jpg', '1000.00', '2020-06-06 16:30:51', '2020-06-06 16:30:59', '0', '1000', null, null);
INSERT INTO `t_product` VALUES ('70', '精华版洗澡2', '/group1/M00/00/07/wKgABF7bN9aAUr5jAABMYp1lVaA616.jpg,/group1/M00/00/07/wKgABF7bN_2AcnCmAABMYp1lVaA428.jpg', '1000.00', '2020-06-06 16:30:51', '2020-06-06 16:30:59', '1', '1000', null, null);
INSERT INTO `t_product` VALUES ('71', '精华版洗澡3', '/group1/M00/00/07/wKgABF7bN9aAUr5jAABMYp1lVaA616.jpg,/group1/M00/00/07/wKgABF7bN_2AcnCmAABMYp1lVaA428.jpg', '1000.00', '2020-06-06 16:30:51', '2020-06-06 16:30:59', '0', '1000', null, null);
INSERT INTO `t_product` VALUES ('72', '精华版洗澡4', '/group1/M00/00/07/wKgABF7bN9aAUr5jAABMYp1lVaA616.jpg,/group1/M00/00/07/wKgABF7bN_2AcnCmAABMYp1lVaA428.jpg', '1000.00', '2020-06-06 16:30:51', '2020-06-06 16:30:59', '1', '1000', null, null);
INSERT INTO `t_product` VALUES ('73', '精华版洗澡5', '/group1/M00/00/07/wKgABF7bN9aAUr5jAABMYp1lVaA616.jpg,/group1/M00/00/07/wKgABF7bN_2AcnCmAABMYp1lVaA428.jpg', '1000.00', '2020-06-06 16:30:51', '2020-06-06 16:30:59', '0', '1000', null, null);
INSERT INTO `t_product` VALUES ('74', '精华版洗澡6', '/group1/M00/00/07/wKgABF7bN9aAUr5jAABMYp1lVaA616.jpg,/group1/M00/00/07/wKgABF7bN_2AcnCmAABMYp1lVaA428.jpg', '1000.00', '2020-06-06 16:30:51', '2020-06-06 16:30:59', '1', '1000', null, null);
INSERT INTO `t_product` VALUES ('75', '精华版洗澡7', '/group1/M00/00/07/wKgABF7bN9aAUr5jAABMYp1lVaA616.jpg,/group1/M00/00/07/wKgABF7bN_2AcnCmAABMYp1lVaA428.jpg', '1000.00', '2020-06-06 16:30:51', '2020-06-06 16:30:59', '0', '1000', null, null);
INSERT INTO `t_product` VALUES ('76', '精华版洗澡8', '/group1/M00/00/07/wKgABF7bN9aAUr5jAABMYp1lVaA616.jpg,/group1/M00/00/07/wKgABF7bN_2AcnCmAABMYp1lVaA428.jpg', '1000.00', '2020-06-06 16:30:51', '2020-06-06 16:30:59', '1', '1000', null, null);
INSERT INTO `t_product` VALUES ('77', '精华版洗澡9', '/group1/M00/00/07/wKgABF7bN9aAUr5jAABMYp1lVaA616.jpg,/group1/M00/00/07/wKgABF7bN_2AcnCmAABMYp1lVaA428.jpg', '1000.00', '2020-06-06 16:30:51', '2020-06-06 16:30:59', '0', '1000', null, null);
INSERT INTO `t_product` VALUES ('78', '精华版洗澡10', '/group1/M00/00/07/wKgABF7bN9aAUr5jAABMYp1lVaA616.jpg,/group1/M00/00/07/wKgABF7bN_2AcnCmAABMYp1lVaA428.jpg', '1000.00', '2020-06-06 16:30:51', '2020-06-06 16:30:59', '1', '1000', null, null);
INSERT INTO `t_product` VALUES ('79', '精华版洗澡11', '/group1/M00/00/07/wKgABF7bN9aAUr5jAABMYp1lVaA616.jpg,/group1/M00/00/07/wKgABF7bN_2AcnCmAABMYp1lVaA428.jpg', '1000.00', '2020-06-06 16:30:51', '2020-06-06 16:30:59', '0', '1000', null, null);
INSERT INTO `t_product` VALUES ('80', '精华版洗澡12', '/group1/M00/00/07/wKgABF7bN9aAUr5jAABMYp1lVaA616.jpg,/group1/M00/00/07/wKgABF7bN_2AcnCmAABMYp1lVaA428.jpg', '1000.00', '2020-06-06 16:30:51', '2020-06-06 16:30:59', '1', '1000', null, null);
INSERT INTO `t_product` VALUES ('81', '精华版洗澡13', '/group1/M00/00/07/wKgABF7bN9aAUr5jAABMYp1lVaA616.jpg,/group1/M00/00/07/wKgABF7bN_2AcnCmAABMYp1lVaA428.jpg', '1000.00', '2020-06-06 16:30:51', '2020-06-06 16:30:59', '0', '1000', null, null);
INSERT INTO `t_product` VALUES ('82', '精华版洗澡14', '/group1/M00/00/07/wKgABF7bN9aAUr5jAABMYp1lVaA616.jpg,/group1/M00/00/07/wKgABF7bN_2AcnCmAABMYp1lVaA428.jpg', '1000.00', '2020-06-06 16:30:51', '2020-06-06 16:30:59', '1', '1000', null, null);
INSERT INTO `t_product` VALUES ('83', '精华版洗澡15', '/group1/M00/00/07/wKgABF7bN9aAUr5jAABMYp1lVaA616.jpg,/group1/M00/00/07/wKgABF7bN_2AcnCmAABMYp1lVaA428.jpg', '1000.00', '2020-06-06 16:30:51', '2020-06-06 16:30:59', '0', '1000', null, null);
INSERT INTO `t_product` VALUES ('84', '精华版洗澡16', '/group1/M00/00/07/wKgABF7bN9aAUr5jAABMYp1lVaA616.jpg,/group1/M00/00/07/wKgABF7bN_2AcnCmAABMYp1lVaA428.jpg', '1000.00', '2020-06-06 16:30:51', '2020-06-06 16:30:59', '1', '1000', null, null);
INSERT INTO `t_product` VALUES ('85', '精华版洗澡17', '/group1/M00/00/07/wKgABF7bN9aAUr5jAABMYp1lVaA616.jpg,/group1/M00/00/07/wKgABF7bN_2AcnCmAABMYp1lVaA428.jpg', '1000.00', '2020-06-06 16:30:51', '2020-06-06 16:30:59', '0', '1000', null, null);
INSERT INTO `t_product` VALUES ('86', '精华版洗澡18', '/group1/M00/00/07/wKgABF7bN9aAUr5jAABMYp1lVaA616.jpg,/group1/M00/00/07/wKgABF7bN_2AcnCmAABMYp1lVaA428.jpg', '1000.00', '2020-06-06 16:30:51', '2020-06-06 16:30:59', '1', '1000', null, null);
INSERT INTO `t_product` VALUES ('87', '精华版洗澡19', '/group1/M00/00/07/wKgABF7bN9aAUr5jAABMYp1lVaA616.jpg,/group1/M00/00/07/wKgABF7bN_2AcnCmAABMYp1lVaA428.jpg', '1000.00', '2020-06-06 16:30:51', '2020-06-06 16:30:59', '0', '1000', null, null);
INSERT INTO `t_product` VALUES ('88', '精华版洗澡20', '/group1/M00/00/07/wKgABF7bN9aAUr5jAABMYp1lVaA616.jpg,/group1/M00/00/07/wKgABF7bN_2AcnCmAABMYp1lVaA428.jpg', '1000.00', '2020-06-06 16:30:51', '2020-06-06 16:30:59', '1', '1000', null, null);
INSERT INTO `t_product` VALUES ('89', '精华版洗澡21', '/group1/M00/00/07/wKgABF7bN9aAUr5jAABMYp1lVaA616.jpg,/group1/M00/00/07/wKgABF7bN_2AcnCmAABMYp1lVaA428.jpg', '1000.00', '2020-06-06 16:30:51', '2020-06-06 16:30:59', '0', '1000', null, null);
INSERT INTO `t_product` VALUES ('90', '精华版洗澡22', '/group1/M00/00/07/wKgABF7bN9aAUr5jAABMYp1lVaA616.jpg,/group1/M00/00/07/wKgABF7bN_2AcnCmAABMYp1lVaA428.jpg', '1000.00', '2020-06-06 16:30:51', '2020-06-06 16:30:59', '1', '1000', null, null);
INSERT INTO `t_product` VALUES ('91', '精华版洗澡23', '/group1/M00/00/07/wKgABF7bN9aAUr5jAABMYp1lVaA616.jpg,/group1/M00/00/07/wKgABF7bN_2AcnCmAABMYp1lVaA428.jpg', '1000.00', '2020-06-06 16:30:51', '2020-06-06 16:30:59', '0', '1000', null, null);
INSERT INTO `t_product` VALUES ('92', '精华版洗澡24', '/group1/M00/00/07/wKgABF7bN9aAUr5jAABMYp1lVaA616.jpg,/group1/M00/00/07/wKgABF7bN_2AcnCmAABMYp1lVaA428.jpg', '1000.00', '2020-06-06 16:30:51', '2020-06-06 16:30:59', '1', '1000', null, null);
INSERT INTO `t_product` VALUES ('93', '精华版洗澡25', '/group1/M00/00/07/wKgABF7bN9aAUr5jAABMYp1lVaA616.jpg,/group1/M00/00/07/wKgABF7bN_2AcnCmAABMYp1lVaA428.jpg', '1000.00', '2020-06-06 16:30:51', '2020-06-06 16:30:59', '0', '1000', null, null);
INSERT INTO `t_product` VALUES ('94', '精华版洗澡26', '/group1/M00/00/07/wKgABF7bN9aAUr5jAABMYp1lVaA616.jpg,/group1/M00/00/07/wKgABF7bN_2AcnCmAABMYp1lVaA428.jpg', '1000.00', '2020-06-06 16:30:51', '2020-06-06 16:30:59', '1', '1000', null, null);
INSERT INTO `t_product` VALUES ('95', '精华版洗澡27', '/group1/M00/00/07/wKgABF7bN9aAUr5jAABMYp1lVaA616.jpg,/group1/M00/00/07/wKgABF7bN_2AcnCmAABMYp1lVaA428.jpg', '1000.00', '2020-06-06 16:30:51', '2020-06-06 16:30:59', '0', '1000', null, null);
INSERT INTO `t_product` VALUES ('96', '精华版洗澡28', '/group1/M00/00/07/wKgABF7bN9aAUr5jAABMYp1lVaA616.jpg,/group1/M00/00/07/wKgABF7bN_2AcnCmAABMYp1lVaA428.jpg', '1000.00', '2020-06-06 16:30:51', '2020-06-06 16:30:59', '1', '1000', null, null);
INSERT INTO `t_product` VALUES ('97', '精华版洗澡29', '/group1/M00/00/07/wKgABF7bN9aAUr5jAABMYp1lVaA616.jpg,/group1/M00/00/07/wKgABF7bN_2AcnCmAABMYp1lVaA428.jpg', '1000.00', '2020-06-06 16:30:51', '2020-06-06 16:30:59', '0', '1000', null, null);
INSERT INTO `t_product` VALUES ('98', '精华版洗澡30', '/group1/M00/00/07/wKgABF7bN9aAUr5jAABMYp1lVaA616.jpg,/group1/M00/00/07/wKgABF7bN_2AcnCmAABMYp1lVaA428.jpg', '1000.00', '2020-06-06 16:30:51', '2020-06-06 16:30:59', '1', '1000', null, null);
INSERT INTO `t_product` VALUES ('99', '精华版洗澡31', '/group1/M00/00/07/wKgABF7bN9aAUr5jAABMYp1lVaA616.jpg,/group1/M00/00/07/wKgABF7bN_2AcnCmAABMYp1lVaA428.jpg', '1000.00', '2020-06-06 16:30:51', '2020-06-06 16:30:59', '0', '1000', null, null);
INSERT INTO `t_product` VALUES ('100', '精华版洗澡32', '/group1/M00/00/07/wKgABF7bN9aAUr5jAABMYp1lVaA616.jpg,/group1/M00/00/07/wKgABF7bN_2AcnCmAABMYp1lVaA428.jpg', '1000.00', '2020-06-06 16:30:51', '2020-06-06 16:30:59', '1', '1000', null, null);
INSERT INTO `t_product` VALUES ('101', '精华版洗澡33', '/group1/M00/00/07/wKgABF7bN9aAUr5jAABMYp1lVaA616.jpg,/group1/M00/00/07/wKgABF7bN_2AcnCmAABMYp1lVaA428.jpg', '1000.00', '2020-06-06 16:30:51', '2020-06-06 16:30:59', '0', '1000', null, null);
INSERT INTO `t_product` VALUES ('102', '精华版洗澡34', '/group1/M00/00/07/wKgABF7bN9aAUr5jAABMYp1lVaA616.jpg,/group1/M00/00/07/wKgABF7bN_2AcnCmAABMYp1lVaA428.jpg', '1000.00', '2020-06-06 16:30:51', '2020-06-06 16:30:59', '1', '1000', null, null);
INSERT INTO `t_product` VALUES ('103', '精华版洗澡35', '/group1/M00/00/07/wKgABF7bN9aAUr5jAABMYp1lVaA616.jpg,/group1/M00/00/07/wKgABF7bN_2AcnCmAABMYp1lVaA428.jpg', '1000.00', '2020-06-06 16:30:51', '2020-06-06 16:30:59', '0', '1000', null, null);
INSERT INTO `t_product` VALUES ('104', '精华版洗澡36', '/group1/M00/00/07/wKgABF7bN9aAUr5jAABMYp1lVaA616.jpg,/group1/M00/00/07/wKgABF7bN_2AcnCmAABMYp1lVaA428.jpg', '1000.00', '2020-06-06 16:30:51', '2020-06-06 16:30:59', '1', '1000', null, null);
INSERT INTO `t_product` VALUES ('105', '精华版洗澡37', '/group1/M00/00/07/wKgABF7bN9aAUr5jAABMYp1lVaA616.jpg,/group1/M00/00/07/wKgABF7bN_2AcnCmAABMYp1lVaA428.jpg', '1000.00', '2020-06-06 16:30:51', '2020-06-06 16:30:59', '0', '1000', null, null);
INSERT INTO `t_product` VALUES ('106', '精华版洗澡38', '/group1/M00/00/07/wKgABF7bN9aAUr5jAABMYp1lVaA616.jpg,/group1/M00/00/07/wKgABF7bN_2AcnCmAABMYp1lVaA428.jpg', '1000.00', '2020-06-06 16:30:51', '2020-06-06 16:30:59', '1', '1000', null, null);
INSERT INTO `t_product` VALUES ('107', '精华版洗澡39', '/group1/M00/00/07/wKgABF7bN9aAUr5jAABMYp1lVaA616.jpg,/group1/M00/00/07/wKgABF7bN_2AcnCmAABMYp1lVaA428.jpg', '1000.00', '2020-06-06 16:30:51', '2020-06-06 16:30:59', '0', '1000', null, null);
INSERT INTO `t_product` VALUES ('108', '精华版洗澡40', '/group1/M00/00/07/wKgABF7bN9aAUr5jAABMYp1lVaA616.jpg,/group1/M00/00/07/wKgABF7bN_2AcnCmAABMYp1lVaA428.jpg', '1000.00', '2020-06-06 16:30:51', '2020-06-06 16:30:59', '1', '1000', null, null);
INSERT INTO `t_product` VALUES ('109', '精华版洗澡41', '/group1/M00/00/07/wKgABF7bN9aAUr5jAABMYp1lVaA616.jpg,/group1/M00/00/07/wKgABF7bN_2AcnCmAABMYp1lVaA428.jpg', '1000.00', '2020-06-06 16:30:51', '2020-06-06 16:30:59', '0', '1000', null, null);
INSERT INTO `t_product` VALUES ('110', '精华版洗澡42', '/group1/M00/00/07/wKgABF7bN9aAUr5jAABMYp1lVaA616.jpg,/group1/M00/00/07/wKgABF7bN_2AcnCmAABMYp1lVaA428.jpg', '1000.00', '2020-06-06 16:30:51', '2020-06-06 16:30:59', '1', '1000', null, null);
INSERT INTO `t_product` VALUES ('111', '精华版洗澡43', '/group1/M00/00/07/wKgABF7bN9aAUr5jAABMYp1lVaA616.jpg,/group1/M00/00/07/wKgABF7bN_2AcnCmAABMYp1lVaA428.jpg', '1000.00', '2020-06-06 16:30:51', '2020-06-06 16:30:59', '0', '1000', null, null);
INSERT INTO `t_product` VALUES ('112', '精华版洗澡44', '/group1/M00/00/07/wKgABF7bN9aAUr5jAABMYp1lVaA616.jpg,/group1/M00/00/07/wKgABF7bN_2AcnCmAABMYp1lVaA428.jpg', '1000.00', '2020-06-06 16:30:51', '2020-06-06 16:30:59', '1', '1000', null, null);
INSERT INTO `t_product` VALUES ('113', '精华版洗澡45', '/group1/M00/00/07/wKgABF7bN9aAUr5jAABMYp1lVaA616.jpg,/group1/M00/00/07/wKgABF7bN_2AcnCmAABMYp1lVaA428.jpg', '1000.00', '2020-06-06 16:30:51', '2020-06-06 16:30:59', '0', '1000', null, null);
INSERT INTO `t_product` VALUES ('114', '精华版洗澡46', '/group1/M00/00/07/wKgABF7bN9aAUr5jAABMYp1lVaA616.jpg,/group1/M00/00/07/wKgABF7bN_2AcnCmAABMYp1lVaA428.jpg', '1000.00', '2020-06-06 16:30:51', '2020-06-06 16:30:59', '1', '1000', null, null);
INSERT INTO `t_product` VALUES ('115', '精华版洗澡47', '/group1/M00/00/07/wKgABF7bN9aAUr5jAABMYp1lVaA616.jpg,/group1/M00/00/07/wKgABF7bN_2AcnCmAABMYp1lVaA428.jpg', '1000.00', '2020-06-06 16:30:51', '2020-06-06 16:30:59', '0', '1000', null, null);
INSERT INTO `t_product` VALUES ('116', '精华版洗澡48', '/group1/M00/00/07/wKgABF7bN9aAUr5jAABMYp1lVaA616.jpg,/group1/M00/00/07/wKgABF7bN_2AcnCmAABMYp1lVaA428.jpg', '1000.00', '2020-06-06 16:30:51', '2020-06-06 16:30:59', '1', '1000', null, null);
INSERT INTO `t_product` VALUES ('117', '精华版洗澡49', '/group1/M00/00/07/wKgABF7bN9aAUr5jAABMYp1lVaA616.jpg,/group1/M00/00/07/wKgABF7bN_2AcnCmAABMYp1lVaA428.jpg', '1000.00', '2020-06-06 16:30:51', '2020-06-06 16:30:59', '0', '1000', null, null);
INSERT INTO `t_product` VALUES ('118', '精华版洗澡50', '/group1/M00/00/07/wKgABF7bN9aAUr5jAABMYp1lVaA616.jpg,/group1/M00/00/07/wKgABF7bN_2AcnCmAABMYp1lVaA428.jpg', '1000.00', '2020-06-06 16:30:51', '2020-06-06 16:30:59', '1', '1000', null, null);
INSERT INTO `t_product` VALUES ('119', '精华版洗澡51', '/group1/M00/00/07/wKgABF7bN9aAUr5jAABMYp1lVaA616.jpg,/group1/M00/00/07/wKgABF7bN_2AcnCmAABMYp1lVaA428.jpg', '1000.00', '2020-06-06 16:30:51', '2020-06-06 16:30:59', '0', '1000', null, null);
INSERT INTO `t_product` VALUES ('120', '精华版洗澡52', '/group1/M00/00/07/wKgABF7bN9aAUr5jAABMYp1lVaA616.jpg,/group1/M00/00/07/wKgABF7bN_2AcnCmAABMYp1lVaA428.jpg', '1000.00', '2020-06-06 16:30:51', '2020-06-06 16:30:59', '1', '1000', null, null);
INSERT INTO `t_product` VALUES ('121', '精华版洗澡53', '/group1/M00/00/07/wKgABF7bN9aAUr5jAABMYp1lVaA616.jpg,/group1/M00/00/07/wKgABF7bN_2AcnCmAABMYp1lVaA428.jpg', '1000.00', '2020-06-06 16:30:51', '2020-06-06 16:30:59', '0', '1000', null, null);
INSERT INTO `t_product` VALUES ('122', '精华版洗澡54', '/group1/M00/00/07/wKgABF7bN9aAUr5jAABMYp1lVaA616.jpg,/group1/M00/00/07/wKgABF7bN_2AcnCmAABMYp1lVaA428.jpg', '1000.00', '2020-06-06 16:30:51', '2020-06-06 16:30:59', '1', '1000', null, null);
INSERT INTO `t_product` VALUES ('123', '精华版洗澡55', '/group1/M00/00/07/wKgABF7bN9aAUr5jAABMYp1lVaA616.jpg,/group1/M00/00/07/wKgABF7bN_2AcnCmAABMYp1lVaA428.jpg', '1000.00', '2020-06-06 16:30:51', '2020-06-06 16:30:59', '0', '1000', null, null);
INSERT INTO `t_product` VALUES ('124', '精华版洗澡56', '/group1/M00/00/07/wKgABF7bN9aAUr5jAABMYp1lVaA616.jpg,/group1/M00/00/07/wKgABF7bN_2AcnCmAABMYp1lVaA428.jpg', '1000.00', '2020-06-06 16:30:51', '2020-06-06 16:30:59', '1', '1000', null, null);
INSERT INTO `t_product` VALUES ('125', '精华版洗澡57', '/group1/M00/00/07/wKgABF7bN9aAUr5jAABMYp1lVaA616.jpg,/group1/M00/00/07/wKgABF7bN_2AcnCmAABMYp1lVaA428.jpg', '1000.00', '2020-06-06 16:30:51', '2020-06-06 16:30:59', '0', '1000', null, '10');
INSERT INTO `t_product` VALUES ('126', '精华版洗澡58', '/group1/M00/00/07/wKgABF7bN9aAUr5jAABMYp1lVaA616.jpg,/group1/M00/00/07/wKgABF7bN_2AcnCmAABMYp1lVaA428.jpg', '1000.00', '2020-06-06 16:30:51', '2020-06-06 16:30:59', '1', '1000', null, '20');
INSERT INTO `t_product` VALUES ('127', '精华版洗澡59', '/group1/M00/00/07/wKgABF7bN9aAUr5jAABMYp1lVaA616.jpg,/group1/M00/00/07/wKgABF7bN_2AcnCmAABMYp1lVaA428.jpg', '1000.00', '2020-06-06 16:30:51', '2020-06-06 16:30:59', '0', '1000', null, '30');
INSERT INTO `t_product` VALUES ('128', '精华版洗澡60', '/group1/M00/00/07/wKgABF7bN9aAUr5jAABMYp1lVaA616.jpg,/group1/M00/00/07/wKgABF7bN_2AcnCmAABMYp1lVaA428.jpg', '1000.00', '2020-06-06 16:30:51', '2020-06-06 16:30:59', '1', '1000', null, null);
INSERT INTO `t_product` VALUES ('129', '精华版洗澡61', '/group1/M00/00/07/wKgABF7bN9aAUr5jAABMYp1lVaA616.jpg,/group1/M00/00/07/wKgABF7bN_2AcnCmAABMYp1lVaA428.jpg', '1000.00', '2020-06-06 16:30:51', '2020-06-06 16:30:59', '0', '1000', null, null);
INSERT INTO `t_product` VALUES ('130', '精华版洗澡62', '/group1/M00/00/07/wKgABF7bN9aAUr5jAABMYp1lVaA616.jpg,/group1/M00/00/07/wKgABF7bN_2AcnCmAABMYp1lVaA428.jpg', '1000.00', '2020-06-06 16:30:51', '2020-06-06 16:30:59', '1', '1000', null, null);
INSERT INTO `t_product` VALUES ('131', '精华版洗澡63', '/group1/M00/00/07/wKgABF7bN9aAUr5jAABMYp1lVaA616.jpg,/group1/M00/00/07/wKgABF7bN_2AcnCmAABMYp1lVaA428.jpg', '1000.00', '2020-06-06 16:30:51', '2020-06-06 16:30:59', '0', '1000', null, null);
INSERT INTO `t_product` VALUES ('132', '精华版洗澡64', '/group1/M00/00/07/wKgABF7bN9aAUr5jAABMYp1lVaA616.jpg,/group1/M00/00/07/wKgABF7bN_2AcnCmAABMYp1lVaA428.jpg', '1000.00', '2020-06-06 16:30:51', '2020-06-06 16:30:59', '1', '1000', null, null);
INSERT INTO `t_product` VALUES ('133', '精华版洗澡65', '/group1/M00/00/07/wKgABF7bN9aAUr5jAABMYp1lVaA616.jpg,/group1/M00/00/07/wKgABF7bN_2AcnCmAABMYp1lVaA428.jpg', '1000.00', '2020-06-06 16:30:51', '2020-06-06 16:30:59', '0', '1000', null, null);
INSERT INTO `t_product` VALUES ('134', '精华版洗澡66', '/group1/M00/00/07/wKgABF7bN9aAUr5jAABMYp1lVaA616.jpg,/group1/M00/00/07/wKgABF7bN_2AcnCmAABMYp1lVaA428.jpg', '1000.00', '2020-06-06 16:30:51', '2020-06-06 16:30:59', '1', '1000', null, null);
INSERT INTO `t_product` VALUES ('135', '精华版洗澡67', '/group1/M00/00/07/wKgABF7bN9aAUr5jAABMYp1lVaA616.jpg,/group1/M00/00/07/wKgABF7bN_2AcnCmAABMYp1lVaA428.jpg', '1000.00', '2020-06-06 16:30:51', '2020-06-06 16:30:59', '0', '1000', null, null);
INSERT INTO `t_product` VALUES ('136', '精华版洗澡68', '/group1/M00/00/07/wKgABF7bN9aAUr5jAABMYp1lVaA616.jpg,/group1/M00/00/07/wKgABF7bN_2AcnCmAABMYp1lVaA428.jpg', '1000.00', '2020-06-06 16:30:51', '2020-06-06 16:30:59', '1', '1000', null, null);
INSERT INTO `t_product` VALUES ('137', '精华版洗澡69', '/group1/M00/00/07/wKgABF7bN9aAUr5jAABMYp1lVaA616.jpg,/group1/M00/00/07/wKgABF7bN_2AcnCmAABMYp1lVaA428.jpg', '1000.00', '2020-06-06 16:30:51', '2020-06-06 16:30:59', '0', '1000', null, null);
INSERT INTO `t_product` VALUES ('138', '精华版洗澡70', '/group1/M00/00/07/wKgABF7bN9aAUr5jAABMYp1lVaA616.jpg,/group1/M00/00/07/wKgABF7bN_2AcnCmAABMYp1lVaA428.jpg', '1000.00', '2020-06-06 16:30:51', '2020-06-06 16:30:59', '1', '1000', null, null);
INSERT INTO `t_product` VALUES ('139', '精华版洗澡71', '/group1/M00/00/07/wKgABF7bN9aAUr5jAABMYp1lVaA616.jpg,/group1/M00/00/07/wKgABF7bN_2AcnCmAABMYp1lVaA428.jpg', '1000.00', '2020-06-06 16:30:51', '2020-06-06 16:30:59', '0', '1000', null, null);
INSERT INTO `t_product` VALUES ('140', '精华版洗澡72', '/group1/M00/00/07/wKgABF7bN9aAUr5jAABMYp1lVaA616.jpg,/group1/M00/00/07/wKgABF7bN_2AcnCmAABMYp1lVaA428.jpg', '1000.00', '2020-06-06 16:30:51', '2020-06-06 16:30:59', '1', '1000', null, null);
INSERT INTO `t_product` VALUES ('141', '精华版洗澡73', '/group1/M00/00/07/wKgABF7bN9aAUr5jAABMYp1lVaA616.jpg,/group1/M00/00/07/wKgABF7bN_2AcnCmAABMYp1lVaA428.jpg', '1000.00', '2020-06-06 16:30:51', '2020-06-06 16:30:59', '0', '1000', null, null);
INSERT INTO `t_product` VALUES ('142', '精华版洗澡74', '/group1/M00/00/07/wKgABF7bN9aAUr5jAABMYp1lVaA616.jpg,/group1/M00/00/07/wKgABF7bN_2AcnCmAABMYp1lVaA428.jpg', '1000.00', '2020-06-06 16:30:51', '2020-06-06 16:30:59', '1', '1000', null, null);
INSERT INTO `t_product` VALUES ('143', '精华版洗澡75', '/group1/M00/00/07/wKgABF7bN9aAUr5jAABMYp1lVaA616.jpg,/group1/M00/00/07/wKgABF7bN_2AcnCmAABMYp1lVaA428.jpg', '1000.00', '2020-06-06 16:30:51', '2020-06-06 16:30:59', '0', '1000', null, null);
INSERT INTO `t_product` VALUES ('144', '精华版洗澡76', '/group1/M00/00/07/wKgABF7bN9aAUr5jAABMYp1lVaA616.jpg,/group1/M00/00/07/wKgABF7bN_2AcnCmAABMYp1lVaA428.jpg', '1000.00', '2020-06-06 16:30:51', '2020-06-06 16:30:59', '1', '1000', null, null);
INSERT INTO `t_product` VALUES ('145', '精华版洗澡77', '/group1/M00/00/07/wKgABF7bN9aAUr5jAABMYp1lVaA616.jpg,/group1/M00/00/07/wKgABF7bN_2AcnCmAABMYp1lVaA428.jpg', '1000.00', '2020-06-06 16:30:51', '2020-06-06 16:30:59', '0', '1000', null, null);
INSERT INTO `t_product` VALUES ('146', '精华版洗澡78', '/group1/M00/00/07/wKgABF7bN9aAUr5jAABMYp1lVaA616.jpg,/group1/M00/00/07/wKgABF7bN_2AcnCmAABMYp1lVaA428.jpg', '1000.00', '2020-06-06 16:30:51', '2020-06-06 16:30:59', '1', '1000', null, null);
INSERT INTO `t_product` VALUES ('147', '精华版洗澡79', '/group1/M00/00/07/wKgABF7bN9aAUr5jAABMYp1lVaA616.jpg,/group1/M00/00/07/wKgABF7bN_2AcnCmAABMYp1lVaA428.jpg', '1000.00', '2020-06-06 16:30:51', '2020-06-06 16:30:59', '0', '1000', null, null);
INSERT INTO `t_product` VALUES ('148', '精华版洗澡80', '/group1/M00/00/07/wKgABF7bN9aAUr5jAABMYp1lVaA616.jpg,/group1/M00/00/07/wKgABF7bN_2AcnCmAABMYp1lVaA428.jpg', '1000.00', '2020-06-06 16:30:51', '2020-06-06 16:30:59', '1', '1000', null, null);
INSERT INTO `t_product` VALUES ('149', '精华版洗澡81', '/group1/M00/00/07/wKgABF7bN9aAUr5jAABMYp1lVaA616.jpg,/group1/M00/00/07/wKgABF7bN_2AcnCmAABMYp1lVaA428.jpg', '1000.00', '2020-06-06 16:30:51', '2020-06-06 16:30:59', '0', '1000', null, null);
INSERT INTO `t_product` VALUES ('150', '精华版洗澡82', '/group1/M00/00/07/wKgABF7bN9aAUr5jAABMYp1lVaA616.jpg,/group1/M00/00/07/wKgABF7bN_2AcnCmAABMYp1lVaA428.jpg', '1000.00', '2020-06-06 16:30:51', '2020-06-06 16:30:59', '1', '1000', null, null);
INSERT INTO `t_product` VALUES ('151', '精华版洗澡83', '/group1/M00/00/07/wKgABF7bN9aAUr5jAABMYp1lVaA616.jpg,/group1/M00/00/07/wKgABF7bN_2AcnCmAABMYp1lVaA428.jpg', '1000.00', '2020-06-06 16:30:51', '2020-06-06 16:30:59', '0', '1000', null, null);
INSERT INTO `t_product` VALUES ('152', '精华版洗澡84', '/group1/M00/00/07/wKgABF7bN9aAUr5jAABMYp1lVaA616.jpg,/group1/M00/00/07/wKgABF7bN_2AcnCmAABMYp1lVaA428.jpg', '1000.00', '2020-06-06 16:30:51', '2020-06-06 16:30:59', '1', '1000', null, null);
INSERT INTO `t_product` VALUES ('153', '精华版洗澡85', '/group1/M00/00/07/wKgABF7bN9aAUr5jAABMYp1lVaA616.jpg,/group1/M00/00/07/wKgABF7bN_2AcnCmAABMYp1lVaA428.jpg', '1000.00', '2020-06-06 16:30:51', '2020-06-06 16:30:59', '0', '1000', null, null);
INSERT INTO `t_product` VALUES ('154', '精华版洗澡86', '/group1/M00/00/07/wKgABF7bN9aAUr5jAABMYp1lVaA616.jpg,/group1/M00/00/07/wKgABF7bN_2AcnCmAABMYp1lVaA428.jpg', '1000.00', '2020-06-06 16:30:51', '2020-06-06 16:30:59', '1', '1000', null, null);
INSERT INTO `t_product` VALUES ('155', '精华版洗澡87', '/group1/M00/00/07/wKgABF7bN9aAUr5jAABMYp1lVaA616.jpg,/group1/M00/00/07/wKgABF7bN_2AcnCmAABMYp1lVaA428.jpg', '1000.00', '2020-06-06 16:30:51', '2020-06-06 16:30:59', '0', '1000', null, null);
INSERT INTO `t_product` VALUES ('156', '精华版洗澡88', '/group1/M00/00/07/wKgABF7bN9aAUr5jAABMYp1lVaA616.jpg,/group1/M00/00/07/wKgABF7bN_2AcnCmAABMYp1lVaA428.jpg', '1000.00', '2020-06-06 16:30:51', '2020-06-06 16:30:59', '1', '1000', null, null);
INSERT INTO `t_product` VALUES ('157', '精华版洗澡89', '/group1/M00/00/07/wKgABF7bN9aAUr5jAABMYp1lVaA616.jpg,/group1/M00/00/07/wKgABF7bN_2AcnCmAABMYp1lVaA428.jpg', '1000.00', '2020-06-06 16:30:51', '2020-06-06 16:30:59', '0', '1000', null, null);
INSERT INTO `t_product` VALUES ('158', '精华版洗澡90', '/group1/M00/00/07/wKgABF7bN9aAUr5jAABMYp1lVaA616.jpg,/group1/M00/00/07/wKgABF7bN_2AcnCmAABMYp1lVaA428.jpg', '1000.00', '2020-06-06 16:30:51', '2020-06-06 16:30:59', '1', '1000', null, null);
INSERT INTO `t_product` VALUES ('159', '精华版洗澡91', '/group1/M00/00/07/wKgABF7bN9aAUr5jAABMYp1lVaA616.jpg,/group1/M00/00/07/wKgABF7bN_2AcnCmAABMYp1lVaA428.jpg', '1000.00', '2020-06-06 16:30:51', '2020-06-06 16:30:59', '0', '1000', null, null);
INSERT INTO `t_product` VALUES ('169', '11116', '44443', '22225.00', null, null, null, '33334', '2020-07-01 21:46:14', null);

-- ----------------------------
-- Table structure for `t_product_comment`
-- ----------------------------
DROP TABLE IF EXISTS `t_product_comment`;
CREATE TABLE `t_product_comment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createTime` bigint(20) DEFAULT NULL,
  `updateTime` bigint(20) DEFAULT NULL,
  `orderId` bigint(20) NOT NULL COMMENT '订单',
  `productId` bigint(20) NOT NULL COMMENT '产品ID',
  `score` int(11) NOT NULL DEFAULT '10' COMMENT '得分',
  `comment` varchar(100) DEFAULT NULL COMMENT '评论',
  `level` tinyint(4) NOT NULL COMMENT '等级',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='产品评价';

-- ----------------------------
-- Records of t_product_comment
-- ----------------------------

-- ----------------------------
-- Table structure for `t_product_detail`
-- ----------------------------
DROP TABLE IF EXISTS `t_product_detail`;
CREATE TABLE `t_product_detail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) DEFAULT NULL,
  `intro` text COMMENT '简介',
  `orderNotice` text COMMENT '预约须知',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=160 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_product_detail
-- ----------------------------
INSERT INTO `t_product_detail` VALUES ('2', '12', '<p><img src=\"http://121.37.194.36//group1/M00/00/00/wKgABF7CKWWADQa9AAN9vCLUELI544.png\"></p>', '<p>2</p><p><img src=\"http://122.51.119.246//group1/M00/00/00/rBEABV6zp8yAWLW7AAB412tWQ-s121.png\"></p>');
INSERT INTO `t_product_detail` VALUES ('6', '16', '<p><img src=\"http://121.37.194.36//group1/M00/00/00/wKgABF7CKWWADQa9AAN9vCLUELI544.png\"></p>', '<p>2</p><p><img src=\"http://122.51.119.246//group1/M00/00/00/rBEABV6zp8yAWLW7AAB412tWQ-s121.png\"></p>');
INSERT INTO `t_product_detail` VALUES ('7', '17', '<p><img src=\"http://121.37.194.36//group1/M00/00/00/wKgABF7CKWWADQa9AAN9vCLUELI544.png\"></p>', '<p>2</p><p><img src=\"http://122.51.119.246//group1/M00/00/00/rBEABV6zp8yAWLW7AAB412tWQ-s121.png\"></p>');
INSERT INTO `t_product_detail` VALUES ('8', '18', '<p><img src=\"http://121.37.194.36//group1/M00/00/00/wKgABF7CKWWADQa9AAN9vCLUELI544.png\"></p>', '<p>2</p><p><img src=\"http://122.51.119.246//group1/M00/00/00/rBEABV6zp8yAWLW7AAB412tWQ-s121.png\"></p>');
INSERT INTO `t_product_detail` VALUES ('9', '19', '<p><img src=\"http://121.37.194.36//group1/M00/00/00/wKgABF7CKWWADQa9AAN9vCLUELI544.png\"></p>', '<p>2</p><p><img src=\"http://122.51.119.246//group1/M00/00/00/rBEABV6zp8yAWLW7AAB412tWQ-s121.png\"></p>');
INSERT INTO `t_product_detail` VALUES ('10', '20', '<p><img src=\"http://121.37.194.36//group1/M00/00/00/wKgABF7CKWWADQa9AAN9vCLUELI544.png\"></p>', '<p>2</p><p><img src=\"http://122.51.119.246//group1/M00/00/00/rBEABV6zp8yAWLW7AAB412tWQ-s121.png\"></p>');
INSERT INTO `t_product_detail` VALUES ('11', '21', '<p><img src=\"http://121.37.194.36//group1/M00/00/00/wKgABF7CKWWADQa9AAN9vCLUELI544.png\"></p>', '<p>2</p><p><img src=\"http://122.51.119.246//group1/M00/00/00/rBEABV6zp8yAWLW7AAB412tWQ-s121.png\"></p>');
INSERT INTO `t_product_detail` VALUES ('12', '22', '<p><img src=\"http://121.37.194.36//group1/M00/00/00/wKgABF7CKWWADQa9AAN9vCLUELI544.png\"></p>', '<p>2</p><p><img src=\"http://122.51.119.246//group1/M00/00/00/rBEABV6zp8yAWLW7AAB412tWQ-s121.png\"></p>');
INSERT INTO `t_product_detail` VALUES ('13', '23', '<p><img src=\"http://121.37.194.36//group1/M00/00/00/wKgABF7CKWWADQa9AAN9vCLUELI544.png\"></p>', '<p>2</p><p><img src=\"http://122.51.119.246//group1/M00/00/00/rBEABV6zp8yAWLW7AAB412tWQ-s121.png\"></p>');
INSERT INTO `t_product_detail` VALUES ('14', '24', '<p><img src=\"http://121.37.194.36//group1/M00/00/00/wKgABF7CKWWADQa9AAN9vCLUELI544.png\"></p>', '<p>2</p><p><img src=\"http://122.51.119.246//group1/M00/00/00/rBEABV6zp8yAWLW7AAB412tWQ-s121.png\"></p>');
INSERT INTO `t_product_detail` VALUES ('15', '25', '<p><img src=\"http://121.37.194.36//group1/M00/00/00/wKgABF7CKWWADQa9AAN9vCLUELI544.png\"></p>', '<p>2</p><p><img src=\"http://122.51.119.246//group1/M00/00/00/rBEABV6zp8yAWLW7AAB412tWQ-s121.png\"></p>');
INSERT INTO `t_product_detail` VALUES ('16', '26', '<p><img src=\"http://121.37.194.36//group1/M00/00/00/wKgABF7CKWWADQa9AAN9vCLUELI544.png\"></p>', '<p>2</p><p><img src=\"http://122.51.119.246//group1/M00/00/00/rBEABV6zp8yAWLW7AAB412tWQ-s121.png\"></p>');
INSERT INTO `t_product_detail` VALUES ('17', '27', '<p><img src=\"http://121.37.194.36//group1/M00/00/00/wKgABF7CKWWADQa9AAN9vCLUELI544.png\"></p>', '<p>2</p><p><img src=\"http://122.51.119.246//group1/M00/00/00/rBEABV6zp8yAWLW7AAB412tWQ-s121.png\"></p>');
INSERT INTO `t_product_detail` VALUES ('18', '28', '<p><img src=\"http://121.37.194.36//group1/M00/00/00/wKgABF7CKWWADQa9AAN9vCLUELI544.png\"></p>', '<p>2</p><p><img src=\"http://122.51.119.246//group1/M00/00/00/rBEABV6zp8yAWLW7AAB412tWQ-s121.png\"></p>');
INSERT INTO `t_product_detail` VALUES ('19', '29', '<p><img src=\"http://121.37.194.36//group1/M00/00/00/wKgABF7CKWWADQa9AAN9vCLUELI544.png\"></p>', '<p>2</p><p><img src=\"http://122.51.119.246//group1/M00/00/00/rBEABV6zp8yAWLW7AAB412tWQ-s121.png\"></p>');
INSERT INTO `t_product_detail` VALUES ('20', '30', '<p><img src=\"http://121.37.194.36//group1/M00/00/00/wKgABF7CKWWADQa9AAN9vCLUELI544.png\"></p>', '<p>2</p><p><img src=\"http://122.51.119.246//group1/M00/00/00/rBEABV6zp8yAWLW7AAB412tWQ-s121.png\"></p>');
INSERT INTO `t_product_detail` VALUES ('21', '31', '<p><img src=\"http://121.37.194.36//group1/M00/00/00/wKgABF7CKWWADQa9AAN9vCLUELI544.png\"></p>', '<p>2</p><p><img src=\"http://122.51.119.246//group1/M00/00/00/rBEABV6zp8yAWLW7AAB412tWQ-s121.png\"></p>');
INSERT INTO `t_product_detail` VALUES ('22', '32', '<p><img src=\"http://121.37.194.36//group1/M00/00/00/wKgABF7CKWWADQa9AAN9vCLUELI544.png\"></p>', '<p>2</p><p><img src=\"http://122.51.119.246//group1/M00/00/00/rBEABV6zp8yAWLW7AAB412tWQ-s121.png\"></p>');
INSERT INTO `t_product_detail` VALUES ('23', '33', '<p><img src=\"http://121.37.194.36//group1/M00/00/00/wKgABF7CKWWADQa9AAN9vCLUELI544.png\"></p>', '<p>2</p><p><img src=\"http://122.51.119.246//group1/M00/00/00/rBEABV6zp8yAWLW7AAB412tWQ-s121.png\"></p>');
INSERT INTO `t_product_detail` VALUES ('24', '34', '<p><img src=\"http://121.37.194.36//group1/M00/00/00/wKgABF7CKWWADQa9AAN9vCLUELI544.png\"></p>', '<p>2</p><p><img src=\"http://122.51.119.246//group1/M00/00/00/rBEABV6zp8yAWLW7AAB412tWQ-s121.png\"></p>');
INSERT INTO `t_product_detail` VALUES ('25', '35', '<p><img src=\"http://121.37.194.36//group1/M00/00/00/wKgABF7CKWWADQa9AAN9vCLUELI544.png\"></p>', '<p>2</p><p><img src=\"http://122.51.119.246//group1/M00/00/00/rBEABV6zp8yAWLW7AAB412tWQ-s121.png\"></p>');
INSERT INTO `t_product_detail` VALUES ('26', '36', '<p><img src=\"http://121.37.194.36//group1/M00/00/00/wKgABF7CKWWADQa9AAN9vCLUELI544.png\"></p>', '<p>2</p><p><img src=\"http://122.51.119.246//group1/M00/00/00/rBEABV6zp8yAWLW7AAB412tWQ-s121.png\"></p>');
INSERT INTO `t_product_detail` VALUES ('27', '37', '<p><img src=\"http://121.37.194.36//group1/M00/00/00/wKgABF7CKWWADQa9AAN9vCLUELI544.png\"></p>', '<p>2</p><p><img src=\"http://122.51.119.246//group1/M00/00/00/rBEABV6zp8yAWLW7AAB412tWQ-s121.png\"></p>');
INSERT INTO `t_product_detail` VALUES ('28', '38', '<p><img src=\"http://121.37.194.36//group1/M00/00/00/wKgABF7CKWWADQa9AAN9vCLUELI544.png\"></p>', '<p>2</p><p><img src=\"http://122.51.119.246//group1/M00/00/00/rBEABV6zp8yAWLW7AAB412tWQ-s121.png\"></p>');
INSERT INTO `t_product_detail` VALUES ('29', '39', '<p><img src=\"http://121.37.194.36//group1/M00/00/00/wKgABF7CKWWADQa9AAN9vCLUELI544.png\"></p>', '<p>2</p><p><img src=\"http://122.51.119.246//group1/M00/00/00/rBEABV6zp8yAWLW7AAB412tWQ-s121.png\"></p>');
INSERT INTO `t_product_detail` VALUES ('30', '40', '<p><img src=\"http://121.37.194.36//group1/M00/00/00/wKgABF7CKWWADQa9AAN9vCLUELI544.png\"></p>', '<p>2</p><p><img src=\"http://122.51.119.246//group1/M00/00/00/rBEABV6zp8yAWLW7AAB412tWQ-s121.png\"></p>');
INSERT INTO `t_product_detail` VALUES ('31', '41', '<p><img src=\"http://121.37.194.36//group1/M00/00/00/wKgABF7CKWWADQa9AAN9vCLUELI544.png\"></p>', '<p>2</p><p><img src=\"http://122.51.119.246//group1/M00/00/00/rBEABV6zp8yAWLW7AAB412tWQ-s121.png\"></p>');
INSERT INTO `t_product_detail` VALUES ('32', '42', '<p><img src=\"http://121.37.194.36//group1/M00/00/00/wKgABF7CKWWADQa9AAN9vCLUELI544.png\"></p>', '<p>2</p><p><img src=\"http://122.51.119.246//group1/M00/00/00/rBEABV6zp8yAWLW7AAB412tWQ-s121.png\"></p>');
INSERT INTO `t_product_detail` VALUES ('33', '43', '<p><img src=\"http://121.37.194.36//group1/M00/00/00/wKgABF7CKWWADQa9AAN9vCLUELI544.png\"></p>', '<p>2</p><p><img src=\"http://122.51.119.246//group1/M00/00/00/rBEABV6zp8yAWLW7AAB412tWQ-s121.png\"></p>');
INSERT INTO `t_product_detail` VALUES ('34', '44', '<p><img src=\"http://121.37.194.36//group1/M00/00/00/wKgABF7CKWWADQa9AAN9vCLUELI544.png\"></p>', '<p>2</p><p><img src=\"http://122.51.119.246//group1/M00/00/00/rBEABV6zp8yAWLW7AAB412tWQ-s121.png\"></p>');
INSERT INTO `t_product_detail` VALUES ('35', '45', '<p><img src=\"http://121.37.194.36//group1/M00/00/00/wKgABF7CKWWADQa9AAN9vCLUELI544.png\"></p>', '<p>2</p><p><img src=\"http://122.51.119.246//group1/M00/00/00/rBEABV6zp8yAWLW7AAB412tWQ-s121.png\"></p>');
INSERT INTO `t_product_detail` VALUES ('36', '46', '<p><img src=\"http://121.37.194.36//group1/M00/00/00/wKgABF7CKWWADQa9AAN9vCLUELI544.png\"></p>', '<p>2</p><p><img src=\"http://122.51.119.246//group1/M00/00/00/rBEABV6zp8yAWLW7AAB412tWQ-s121.png\"></p>');
INSERT INTO `t_product_detail` VALUES ('37', '47', '<p><img src=\"http://121.37.194.36//group1/M00/00/00/wKgABF7CKWWADQa9AAN9vCLUELI544.png\"></p>', '<p>2</p><p><img src=\"http://122.51.119.246//group1/M00/00/00/rBEABV6zp8yAWLW7AAB412tWQ-s121.png\"></p>');
INSERT INTO `t_product_detail` VALUES ('38', '48', '<p><img src=\"http://121.37.194.36//group1/M00/00/00/wKgABF7CKWWADQa9AAN9vCLUELI544.png\"></p>', '<p>2</p><p><img src=\"http://122.51.119.246//group1/M00/00/00/rBEABV6zp8yAWLW7AAB412tWQ-s121.png\"></p>');
INSERT INTO `t_product_detail` VALUES ('39', '49', '<p><img src=\"http://121.37.194.36//group1/M00/00/00/wKgABF7CKWWADQa9AAN9vCLUELI544.png\"></p>', '<p>2</p><p><img src=\"http://122.51.119.246//group1/M00/00/00/rBEABV6zp8yAWLW7AAB412tWQ-s121.png\"></p>');
INSERT INTO `t_product_detail` VALUES ('40', '50', '<p><img src=\"http://121.37.194.36//group1/M00/00/00/wKgABF7CKWWADQa9AAN9vCLUELI544.png\"></p>', '<p>2</p><p><img src=\"http://122.51.119.246//group1/M00/00/00/rBEABV6zp8yAWLW7AAB412tWQ-s121.png\"></p>');
INSERT INTO `t_product_detail` VALUES ('41', '51', '<p><img src=\"http://121.37.194.36//group1/M00/00/00/wKgABF7CKWWADQa9AAN9vCLUELI544.png\"></p>', '<p>2</p><p><img src=\"http://122.51.119.246//group1/M00/00/00/rBEABV6zp8yAWLW7AAB412tWQ-s121.png\"></p>');
INSERT INTO `t_product_detail` VALUES ('42', '52', '<p><img src=\"http://121.37.194.36//group1/M00/00/00/wKgABF7CKWWADQa9AAN9vCLUELI544.png\"></p>', '<p>2</p><p><img src=\"http://122.51.119.246//group1/M00/00/00/rBEABV6zp8yAWLW7AAB412tWQ-s121.png\"></p>');
INSERT INTO `t_product_detail` VALUES ('43', '53', '<p><img src=\"http://121.37.194.36//group1/M00/00/00/wKgABF7CKWWADQa9AAN9vCLUELI544.png\"></p>', '<p>2</p><p><img src=\"http://122.51.119.246//group1/M00/00/00/rBEABV6zp8yAWLW7AAB412tWQ-s121.png\"></p>');
INSERT INTO `t_product_detail` VALUES ('44', '54', '<p><img src=\"http://121.37.194.36//group1/M00/00/00/wKgABF7CKWWADQa9AAN9vCLUELI544.png\"></p>', '<p>2</p><p><img src=\"http://122.51.119.246//group1/M00/00/00/rBEABV6zp8yAWLW7AAB412tWQ-s121.png\"></p>');
INSERT INTO `t_product_detail` VALUES ('45', '55', '<p><img src=\"http://121.37.194.36//group1/M00/00/00/wKgABF7CKWWADQa9AAN9vCLUELI544.png\"></p>', '<p>2</p><p><img src=\"http://122.51.119.246//group1/M00/00/00/rBEABV6zp8yAWLW7AAB412tWQ-s121.png\"></p>');
INSERT INTO `t_product_detail` VALUES ('46', '56', '<p><img src=\"http://121.37.194.36//group1/M00/00/00/wKgABF7CKWWADQa9AAN9vCLUELI544.png\"></p>', '<p>2</p><p><img src=\"http://122.51.119.246//group1/M00/00/00/rBEABV6zp8yAWLW7AAB412tWQ-s121.png\"></p>');
INSERT INTO `t_product_detail` VALUES ('47', '57', '<p><img src=\"http://121.37.194.36//group1/M00/00/00/wKgABF7CKWWADQa9AAN9vCLUELI544.png\"></p>', '<p>2</p><p><img src=\"http://122.51.119.246//group1/M00/00/00/rBEABV6zp8yAWLW7AAB412tWQ-s121.png\"></p>');
INSERT INTO `t_product_detail` VALUES ('48', '58', '<p><img src=\"http://121.37.194.36//group1/M00/00/00/wKgABF7CKWWADQa9AAN9vCLUELI544.png\"></p>', '<p>2</p><p><img src=\"http://122.51.119.246//group1/M00/00/00/rBEABV6zp8yAWLW7AAB412tWQ-s121.png\"></p>');
INSERT INTO `t_product_detail` VALUES ('49', '59', '<p><img src=\"http://121.37.194.36//group1/M00/00/00/wKgABF7CKWWADQa9AAN9vCLUELI544.png\"></p>', '<p>2</p><p><img src=\"http://122.51.119.246//group1/M00/00/00/rBEABV6zp8yAWLW7AAB412tWQ-s121.png\"></p>');
INSERT INTO `t_product_detail` VALUES ('50', '60', '<p><img src=\"http://121.37.194.36//group1/M00/00/00/wKgABF7CKWWADQa9AAN9vCLUELI544.png\"></p>', '<p>2</p><p><img src=\"http://122.51.119.246//group1/M00/00/00/rBEABV6zp8yAWLW7AAB412tWQ-s121.png\"></p>');
INSERT INTO `t_product_detail` VALUES ('51', '61', '<p><img src=\"http://121.37.194.36//group1/M00/00/00/wKgABF7CKWWADQa9AAN9vCLUELI544.png\"></p>', '<p>2</p><p><img src=\"http://122.51.119.246//group1/M00/00/00/rBEABV6zp8yAWLW7AAB412tWQ-s121.png\"></p>');
INSERT INTO `t_product_detail` VALUES ('52', '62', '<p><img src=\"http://121.37.194.36//group1/M00/00/00/wKgABF7CKWWADQa9AAN9vCLUELI544.png\"></p>', '<p>2</p><p><img src=\"http://122.51.119.246//group1/M00/00/00/rBEABV6zp8yAWLW7AAB412tWQ-s121.png\"></p>');
INSERT INTO `t_product_detail` VALUES ('53', '63', '<p><img src=\"http://121.37.194.36//group1/M00/00/00/wKgABF7CKWWADQa9AAN9vCLUELI544.png\"></p>', '<p>2</p><p><img src=\"http://122.51.119.246//group1/M00/00/00/rBEABV6zp8yAWLW7AAB412tWQ-s121.png\"></p>');
INSERT INTO `t_product_detail` VALUES ('54', '64', '<p><img src=\"http://121.37.194.36//group1/M00/00/00/wKgABF7CKWWADQa9AAN9vCLUELI544.png\"></p>', '<p>2</p><p><img src=\"http://122.51.119.246//group1/M00/00/00/rBEABV6zp8yAWLW7AAB412tWQ-s121.png\"></p>');
INSERT INTO `t_product_detail` VALUES ('55', '65', '<p><img src=\"http://121.37.194.36//group1/M00/00/00/wKgABF7CKWWADQa9AAN9vCLUELI544.png\"></p>', '<p>2</p><p><img src=\"http://122.51.119.246//group1/M00/00/00/rBEABV6zp8yAWLW7AAB412tWQ-s121.png\"></p>');
INSERT INTO `t_product_detail` VALUES ('56', '66', '<p><img src=\"http://121.37.194.36//group1/M00/00/00/wKgABF7CKWWADQa9AAN9vCLUELI544.png\"></p>', '<p><img src=\"http://121.37.194.36//group1/M00/00/00/wKgABF7CKXSAPI24AAL5x3kjuBU074.png\"></p>');
INSERT INTO `t_product_detail` VALUES ('57', '67', '<p><strong style=\"color: rgb(230, 0, 0);\"><img src=\"http://121.37.194.36//group1/M00/00/07/wKgABF7bRxWAXOXaAABMYp1lVaA989.jpg\">3</strong></p>', '<p><span style=\"color: rgb(194, 133, 255);\">3</span></p>');
INSERT INTO `t_product_detail` VALUES ('58', '68', '<p><strong style=\"color: rgb(230, 0, 0);\"><img src=\"http://121.37.194.36//group1/M00/00/07/wKgABF7bRxWAXOXaAABMYp1lVaA989.jpg\">3</strong></p>', '<p><span style=\"color: rgb(194, 133, 255);\">3</span></p>');
INSERT INTO `t_product_detail` VALUES ('59', '69', '<p><strong style=\"color: rgb(230, 0, 0);\"><img src=\"http://121.37.194.36//group1/M00/00/07/wKgABF7bRxWAXOXaAABMYp1lVaA989.jpg\">3</strong></p>', '<p><span style=\"color: rgb(194, 133, 255);\">3</span></p>');
INSERT INTO `t_product_detail` VALUES ('60', '70', '<p><strong style=\"color: rgb(230, 0, 0);\"><img src=\"http://121.37.194.36//group1/M00/00/07/wKgABF7bRxWAXOXaAABMYp1lVaA989.jpg\">3</strong></p>', '<p><span style=\"color: rgb(194, 133, 255);\">3</span></p>');
INSERT INTO `t_product_detail` VALUES ('61', '71', '<p><strong style=\"color: rgb(230, 0, 0);\"><img src=\"http://121.37.194.36//group1/M00/00/07/wKgABF7bRxWAXOXaAABMYp1lVaA989.jpg\">3</strong></p>', '<p><span style=\"color: rgb(194, 133, 255);\">3</span></p>');
INSERT INTO `t_product_detail` VALUES ('62', '72', '<p><strong style=\"color: rgb(230, 0, 0);\"><img src=\"http://121.37.194.36//group1/M00/00/07/wKgABF7bRxWAXOXaAABMYp1lVaA989.jpg\">3</strong></p>', '<p><span style=\"color: rgb(194, 133, 255);\">3</span></p>');
INSERT INTO `t_product_detail` VALUES ('63', '73', '<p><strong style=\"color: rgb(230, 0, 0);\"><img src=\"http://121.37.194.36//group1/M00/00/07/wKgABF7bRxWAXOXaAABMYp1lVaA989.jpg\">3</strong></p>', '<p><span style=\"color: rgb(194, 133, 255);\">3</span></p>');
INSERT INTO `t_product_detail` VALUES ('64', '74', '<p><strong style=\"color: rgb(230, 0, 0);\"><img src=\"http://121.37.194.36//group1/M00/00/07/wKgABF7bRxWAXOXaAABMYp1lVaA989.jpg\">3</strong></p>', '<p><span style=\"color: rgb(194, 133, 255);\">3</span></p>');
INSERT INTO `t_product_detail` VALUES ('65', '75', '<p><strong style=\"color: rgb(230, 0, 0);\"><img src=\"http://121.37.194.36//group1/M00/00/07/wKgABF7bRxWAXOXaAABMYp1lVaA989.jpg\">3</strong></p>', '<p><span style=\"color: rgb(194, 133, 255);\">3</span></p>');
INSERT INTO `t_product_detail` VALUES ('66', '76', '<p><strong style=\"color: rgb(230, 0, 0);\"><img src=\"http://121.37.194.36//group1/M00/00/07/wKgABF7bRxWAXOXaAABMYp1lVaA989.jpg\">3</strong></p>', '<p><span style=\"color: rgb(194, 133, 255);\">3</span></p>');
INSERT INTO `t_product_detail` VALUES ('67', '77', '<p><strong style=\"color: rgb(230, 0, 0);\"><img src=\"http://121.37.194.36//group1/M00/00/07/wKgABF7bRxWAXOXaAABMYp1lVaA989.jpg\">3</strong></p>', '<p><span style=\"color: rgb(194, 133, 255);\">3</span></p>');
INSERT INTO `t_product_detail` VALUES ('68', '78', '<p><strong style=\"color: rgb(230, 0, 0);\"><img src=\"http://121.37.194.36//group1/M00/00/07/wKgABF7bRxWAXOXaAABMYp1lVaA989.jpg\">3</strong></p>', '<p><span style=\"color: rgb(194, 133, 255);\">3</span></p>');
INSERT INTO `t_product_detail` VALUES ('69', '79', '<p><strong style=\"color: rgb(230, 0, 0);\"><img src=\"http://121.37.194.36//group1/M00/00/07/wKgABF7bRxWAXOXaAABMYp1lVaA989.jpg\">3</strong></p>', '<p><span style=\"color: rgb(194, 133, 255);\">3</span></p>');
INSERT INTO `t_product_detail` VALUES ('70', '80', '<p><strong style=\"color: rgb(230, 0, 0);\"><img src=\"http://121.37.194.36//group1/M00/00/07/wKgABF7bRxWAXOXaAABMYp1lVaA989.jpg\">3</strong></p>', '<p><span style=\"color: rgb(194, 133, 255);\">3</span></p>');
INSERT INTO `t_product_detail` VALUES ('71', '81', '<p><strong style=\"color: rgb(230, 0, 0);\"><img src=\"http://121.37.194.36//group1/M00/00/07/wKgABF7bRxWAXOXaAABMYp1lVaA989.jpg\">3</strong></p>', '<p><span style=\"color: rgb(194, 133, 255);\">3</span></p>');
INSERT INTO `t_product_detail` VALUES ('72', '82', '<p><strong style=\"color: rgb(230, 0, 0);\"><img src=\"http://121.37.194.36//group1/M00/00/07/wKgABF7bRxWAXOXaAABMYp1lVaA989.jpg\">3</strong></p>', '<p><span style=\"color: rgb(194, 133, 255);\">3</span></p>');
INSERT INTO `t_product_detail` VALUES ('73', '83', '<p><strong style=\"color: rgb(230, 0, 0);\"><img src=\"http://121.37.194.36//group1/M00/00/07/wKgABF7bRxWAXOXaAABMYp1lVaA989.jpg\">3</strong></p>', '<p><span style=\"color: rgb(194, 133, 255);\">3</span></p>');
INSERT INTO `t_product_detail` VALUES ('74', '84', '<p><strong style=\"color: rgb(230, 0, 0);\"><img src=\"http://121.37.194.36//group1/M00/00/07/wKgABF7bRxWAXOXaAABMYp1lVaA989.jpg\">3</strong></p>', '<p><span style=\"color: rgb(194, 133, 255);\">3</span></p>');
INSERT INTO `t_product_detail` VALUES ('75', '85', '<p><strong style=\"color: rgb(230, 0, 0);\"><img src=\"http://121.37.194.36//group1/M00/00/07/wKgABF7bRxWAXOXaAABMYp1lVaA989.jpg\">3</strong></p>', '<p><span style=\"color: rgb(194, 133, 255);\">3</span></p>');
INSERT INTO `t_product_detail` VALUES ('76', '86', '<p><strong style=\"color: rgb(230, 0, 0);\"><img src=\"http://121.37.194.36//group1/M00/00/07/wKgABF7bRxWAXOXaAABMYp1lVaA989.jpg\">3</strong></p>', '<p><span style=\"color: rgb(194, 133, 255);\">3</span></p>');
INSERT INTO `t_product_detail` VALUES ('77', '87', '<p><strong style=\"color: rgb(230, 0, 0);\"><img src=\"http://121.37.194.36//group1/M00/00/07/wKgABF7bRxWAXOXaAABMYp1lVaA989.jpg\">3</strong></p>', '<p><span style=\"color: rgb(194, 133, 255);\">3</span></p>');
INSERT INTO `t_product_detail` VALUES ('78', '88', '<p><strong style=\"color: rgb(230, 0, 0);\"><img src=\"http://121.37.194.36//group1/M00/00/07/wKgABF7bRxWAXOXaAABMYp1lVaA989.jpg\">3</strong></p>', '<p><span style=\"color: rgb(194, 133, 255);\">3</span></p>');
INSERT INTO `t_product_detail` VALUES ('79', '89', '<p><strong style=\"color: rgb(230, 0, 0);\"><img src=\"http://121.37.194.36//group1/M00/00/07/wKgABF7bRxWAXOXaAABMYp1lVaA989.jpg\">3</strong></p>', '<p><span style=\"color: rgb(194, 133, 255);\">3</span></p>');
INSERT INTO `t_product_detail` VALUES ('80', '90', '<p><strong style=\"color: rgb(230, 0, 0);\"><img src=\"http://121.37.194.36//group1/M00/00/07/wKgABF7bRxWAXOXaAABMYp1lVaA989.jpg\">3</strong></p>', '<p><span style=\"color: rgb(194, 133, 255);\">3</span></p>');
INSERT INTO `t_product_detail` VALUES ('81', '91', '<p><strong style=\"color: rgb(230, 0, 0);\"><img src=\"http://121.37.194.36//group1/M00/00/07/wKgABF7bRxWAXOXaAABMYp1lVaA989.jpg\">3</strong></p>', '<p><span style=\"color: rgb(194, 133, 255);\">3</span></p>');
INSERT INTO `t_product_detail` VALUES ('82', '92', '<p><strong style=\"color: rgb(230, 0, 0);\"><img src=\"http://121.37.194.36//group1/M00/00/07/wKgABF7bRxWAXOXaAABMYp1lVaA989.jpg\">3</strong></p>', '<p><span style=\"color: rgb(194, 133, 255);\">3</span></p>');
INSERT INTO `t_product_detail` VALUES ('83', '93', '<p><strong style=\"color: rgb(230, 0, 0);\"><img src=\"http://121.37.194.36//group1/M00/00/07/wKgABF7bRxWAXOXaAABMYp1lVaA989.jpg\">3</strong></p>', '<p><span style=\"color: rgb(194, 133, 255);\">3</span></p>');
INSERT INTO `t_product_detail` VALUES ('84', '94', '<p><strong style=\"color: rgb(230, 0, 0);\"><img src=\"http://121.37.194.36//group1/M00/00/07/wKgABF7bRxWAXOXaAABMYp1lVaA989.jpg\">3</strong></p>', '<p><span style=\"color: rgb(194, 133, 255);\">3</span></p>');
INSERT INTO `t_product_detail` VALUES ('85', '95', '<p><strong style=\"color: rgb(230, 0, 0);\"><img src=\"http://121.37.194.36//group1/M00/00/07/wKgABF7bRxWAXOXaAABMYp1lVaA989.jpg\">3</strong></p>', '<p><span style=\"color: rgb(194, 133, 255);\">3</span></p>');
INSERT INTO `t_product_detail` VALUES ('86', '96', '<p><strong style=\"color: rgb(230, 0, 0);\"><img src=\"http://121.37.194.36//group1/M00/00/07/wKgABF7bRxWAXOXaAABMYp1lVaA989.jpg\">3</strong></p>', '<p><span style=\"color: rgb(194, 133, 255);\">3</span></p>');
INSERT INTO `t_product_detail` VALUES ('87', '97', '<p><strong style=\"color: rgb(230, 0, 0);\"><img src=\"http://121.37.194.36//group1/M00/00/07/wKgABF7bRxWAXOXaAABMYp1lVaA989.jpg\">3</strong></p>', '<p><span style=\"color: rgb(194, 133, 255);\">3</span></p>');
INSERT INTO `t_product_detail` VALUES ('88', '98', '<p><strong style=\"color: rgb(230, 0, 0);\"><img src=\"http://121.37.194.36//group1/M00/00/07/wKgABF7bRxWAXOXaAABMYp1lVaA989.jpg\">3</strong></p>', '<p><span style=\"color: rgb(194, 133, 255);\">3</span></p>');
INSERT INTO `t_product_detail` VALUES ('89', '99', '<p><strong style=\"color: rgb(230, 0, 0);\"><img src=\"http://121.37.194.36//group1/M00/00/07/wKgABF7bRxWAXOXaAABMYp1lVaA989.jpg\">3</strong></p>', '<p><span style=\"color: rgb(194, 133, 255);\">3</span></p>');
INSERT INTO `t_product_detail` VALUES ('90', '100', '<p><strong style=\"color: rgb(230, 0, 0);\"><img src=\"http://121.37.194.36//group1/M00/00/07/wKgABF7bRxWAXOXaAABMYp1lVaA989.jpg\">3</strong></p>', '<p><span style=\"color: rgb(194, 133, 255);\">3</span></p>');
INSERT INTO `t_product_detail` VALUES ('91', '101', '<p><strong style=\"color: rgb(230, 0, 0);\"><img src=\"http://121.37.194.36//group1/M00/00/07/wKgABF7bRxWAXOXaAABMYp1lVaA989.jpg\">3</strong></p>', '<p><span style=\"color: rgb(194, 133, 255);\">3</span></p>');
INSERT INTO `t_product_detail` VALUES ('92', '102', '<p><strong style=\"color: rgb(230, 0, 0);\"><img src=\"http://121.37.194.36//group1/M00/00/07/wKgABF7bRxWAXOXaAABMYp1lVaA989.jpg\">3</strong></p>', '<p><span style=\"color: rgb(194, 133, 255);\">3</span></p>');
INSERT INTO `t_product_detail` VALUES ('93', '103', '<p><strong style=\"color: rgb(230, 0, 0);\"><img src=\"http://121.37.194.36//group1/M00/00/07/wKgABF7bRxWAXOXaAABMYp1lVaA989.jpg\">3</strong></p>', '<p><span style=\"color: rgb(194, 133, 255);\">3</span></p>');
INSERT INTO `t_product_detail` VALUES ('94', '104', '<p><strong style=\"color: rgb(230, 0, 0);\"><img src=\"http://121.37.194.36//group1/M00/00/07/wKgABF7bRxWAXOXaAABMYp1lVaA989.jpg\">3</strong></p>', '<p><span style=\"color: rgb(194, 133, 255);\">3</span></p>');
INSERT INTO `t_product_detail` VALUES ('95', '105', '<p><strong style=\"color: rgb(230, 0, 0);\"><img src=\"http://121.37.194.36//group1/M00/00/07/wKgABF7bRxWAXOXaAABMYp1lVaA989.jpg\">3</strong></p>', '<p><span style=\"color: rgb(194, 133, 255);\">3</span></p>');
INSERT INTO `t_product_detail` VALUES ('96', '106', '<p><strong style=\"color: rgb(230, 0, 0);\"><img src=\"http://121.37.194.36//group1/M00/00/07/wKgABF7bRxWAXOXaAABMYp1lVaA989.jpg\">3</strong></p>', '<p><span style=\"color: rgb(194, 133, 255);\">3</span></p>');
INSERT INTO `t_product_detail` VALUES ('97', '107', '<p><strong style=\"color: rgb(230, 0, 0);\"><img src=\"http://121.37.194.36//group1/M00/00/07/wKgABF7bRxWAXOXaAABMYp1lVaA989.jpg\">3</strong></p>', '<p><span style=\"color: rgb(194, 133, 255);\">3</span></p>');
INSERT INTO `t_product_detail` VALUES ('98', '108', '<p><strong style=\"color: rgb(230, 0, 0);\"><img src=\"http://121.37.194.36//group1/M00/00/07/wKgABF7bRxWAXOXaAABMYp1lVaA989.jpg\">3</strong></p>', '<p><span style=\"color: rgb(194, 133, 255);\">3</span></p>');
INSERT INTO `t_product_detail` VALUES ('99', '109', '<p><strong style=\"color: rgb(230, 0, 0);\"><img src=\"http://121.37.194.36//group1/M00/00/07/wKgABF7bRxWAXOXaAABMYp1lVaA989.jpg\">3</strong></p>', '<p><span style=\"color: rgb(194, 133, 255);\">3</span></p>');
INSERT INTO `t_product_detail` VALUES ('100', '110', '<p><strong style=\"color: rgb(230, 0, 0);\"><img src=\"http://121.37.194.36//group1/M00/00/07/wKgABF7bRxWAXOXaAABMYp1lVaA989.jpg\">3</strong></p>', '<p><span style=\"color: rgb(194, 133, 255);\">3</span></p>');
INSERT INTO `t_product_detail` VALUES ('101', '111', '<p><strong style=\"color: rgb(230, 0, 0);\"><img src=\"http://121.37.194.36//group1/M00/00/07/wKgABF7bRxWAXOXaAABMYp1lVaA989.jpg\">3</strong></p>', '<p><span style=\"color: rgb(194, 133, 255);\">3</span></p>');
INSERT INTO `t_product_detail` VALUES ('102', '112', '<p><strong style=\"color: rgb(230, 0, 0);\"><img src=\"http://121.37.194.36//group1/M00/00/07/wKgABF7bRxWAXOXaAABMYp1lVaA989.jpg\">3</strong></p>', '<p><span style=\"color: rgb(194, 133, 255);\">3</span></p>');
INSERT INTO `t_product_detail` VALUES ('103', '113', '<p><strong style=\"color: rgb(230, 0, 0);\"><img src=\"http://121.37.194.36//group1/M00/00/07/wKgABF7bRxWAXOXaAABMYp1lVaA989.jpg\">3</strong></p>', '<p><span style=\"color: rgb(194, 133, 255);\">3</span></p>');
INSERT INTO `t_product_detail` VALUES ('104', '114', '<p><strong style=\"color: rgb(230, 0, 0);\"><img src=\"http://121.37.194.36//group1/M00/00/07/wKgABF7bRxWAXOXaAABMYp1lVaA989.jpg\">3</strong></p>', '<p><span style=\"color: rgb(194, 133, 255);\">3</span></p>');
INSERT INTO `t_product_detail` VALUES ('105', '115', '<p><strong style=\"color: rgb(230, 0, 0);\"><img src=\"http://121.37.194.36//group1/M00/00/07/wKgABF7bRxWAXOXaAABMYp1lVaA989.jpg\">3</strong></p>', '<p><span style=\"color: rgb(194, 133, 255);\">3</span></p>');
INSERT INTO `t_product_detail` VALUES ('106', '116', '<p><strong style=\"color: rgb(230, 0, 0);\"><img src=\"http://121.37.194.36//group1/M00/00/07/wKgABF7bRxWAXOXaAABMYp1lVaA989.jpg\">3</strong></p>', '<p><span style=\"color: rgb(194, 133, 255);\">3</span></p>');
INSERT INTO `t_product_detail` VALUES ('107', '117', '<p><strong style=\"color: rgb(230, 0, 0);\"><img src=\"http://121.37.194.36//group1/M00/00/07/wKgABF7bRxWAXOXaAABMYp1lVaA989.jpg\">3</strong></p>', '<p><span style=\"color: rgb(194, 133, 255);\">3</span></p>');
INSERT INTO `t_product_detail` VALUES ('108', '118', '<p><strong style=\"color: rgb(230, 0, 0);\"><img src=\"http://121.37.194.36//group1/M00/00/07/wKgABF7bRxWAXOXaAABMYp1lVaA989.jpg\">3</strong></p>', '<p><span style=\"color: rgb(194, 133, 255);\">3</span></p>');
INSERT INTO `t_product_detail` VALUES ('109', '119', '<p><strong style=\"color: rgb(230, 0, 0);\"><img src=\"http://121.37.194.36//group1/M00/00/07/wKgABF7bRxWAXOXaAABMYp1lVaA989.jpg\">3</strong></p>', '<p><span style=\"color: rgb(194, 133, 255);\">3</span></p>');
INSERT INTO `t_product_detail` VALUES ('110', '120', '<p><strong style=\"color: rgb(230, 0, 0);\"><img src=\"http://121.37.194.36//group1/M00/00/07/wKgABF7bRxWAXOXaAABMYp1lVaA989.jpg\">3</strong></p>', '<p><span style=\"color: rgb(194, 133, 255);\">3</span></p>');
INSERT INTO `t_product_detail` VALUES ('111', '121', '<p><strong style=\"color: rgb(230, 0, 0);\"><img src=\"http://121.37.194.36//group1/M00/00/07/wKgABF7bRxWAXOXaAABMYp1lVaA989.jpg\">3</strong></p>', '<p><span style=\"color: rgb(194, 133, 255);\">3</span></p>');
INSERT INTO `t_product_detail` VALUES ('112', '122', '<p><strong style=\"color: rgb(230, 0, 0);\"><img src=\"http://121.37.194.36//group1/M00/00/07/wKgABF7bRxWAXOXaAABMYp1lVaA989.jpg\">3</strong></p>', '<p><span style=\"color: rgb(194, 133, 255);\">3</span></p>');
INSERT INTO `t_product_detail` VALUES ('113', '123', '<p><strong style=\"color: rgb(230, 0, 0);\"><img src=\"http://121.37.194.36//group1/M00/00/07/wKgABF7bRxWAXOXaAABMYp1lVaA989.jpg\">3</strong></p>', '<p><span style=\"color: rgb(194, 133, 255);\">3</span></p>');
INSERT INTO `t_product_detail` VALUES ('114', '124', '<p><strong style=\"color: rgb(230, 0, 0);\"><img src=\"http://121.37.194.36//group1/M00/00/07/wKgABF7bRxWAXOXaAABMYp1lVaA989.jpg\">3</strong></p>', '<p><span style=\"color: rgb(194, 133, 255);\">3</span></p>');
INSERT INTO `t_product_detail` VALUES ('115', '125', '<p><strong style=\"color: rgb(230, 0, 0);\"><img src=\"http://121.37.194.36//group1/M00/00/07/wKgABF7bRxWAXOXaAABMYp1lVaA989.jpg\">3</strong></p>', '<p><span style=\"color: rgb(194, 133, 255);\">3</span></p>');
INSERT INTO `t_product_detail` VALUES ('116', '126', '<p><strong style=\"color: rgb(230, 0, 0);\"><img src=\"http://121.37.194.36//group1/M00/00/07/wKgABF7bRxWAXOXaAABMYp1lVaA989.jpg\">3</strong></p>', '<p><span style=\"color: rgb(194, 133, 255);\">3</span></p>');
INSERT INTO `t_product_detail` VALUES ('117', '127', '<p><strong style=\"color: rgb(230, 0, 0);\"><img src=\"http://121.37.194.36//group1/M00/00/07/wKgABF7bRxWAXOXaAABMYp1lVaA989.jpg\">3</strong></p>', '<p><span style=\"color: rgb(194, 133, 255);\">3</span></p>');
INSERT INTO `t_product_detail` VALUES ('118', '128', '<p><strong style=\"color: rgb(230, 0, 0);\"><img src=\"http://121.37.194.36//group1/M00/00/07/wKgABF7bRxWAXOXaAABMYp1lVaA989.jpg\">3</strong></p>', '<p><span style=\"color: rgb(194, 133, 255);\">3</span></p>');
INSERT INTO `t_product_detail` VALUES ('119', '129', '<p><strong style=\"color: rgb(230, 0, 0);\"><img src=\"http://121.37.194.36//group1/M00/00/07/wKgABF7bRxWAXOXaAABMYp1lVaA989.jpg\">3</strong></p>', '<p><span style=\"color: rgb(194, 133, 255);\">3</span></p>');
INSERT INTO `t_product_detail` VALUES ('120', '130', '<p><strong style=\"color: rgb(230, 0, 0);\"><img src=\"http://121.37.194.36//group1/M00/00/07/wKgABF7bRxWAXOXaAABMYp1lVaA989.jpg\">3</strong></p>', '<p><span style=\"color: rgb(194, 133, 255);\">3</span></p>');
INSERT INTO `t_product_detail` VALUES ('121', '131', '<p><strong style=\"color: rgb(230, 0, 0);\"><img src=\"http://121.37.194.36//group1/M00/00/07/wKgABF7bRxWAXOXaAABMYp1lVaA989.jpg\">3</strong></p>', '<p><span style=\"color: rgb(194, 133, 255);\">3</span></p>');
INSERT INTO `t_product_detail` VALUES ('122', '132', '<p><strong style=\"color: rgb(230, 0, 0);\"><img src=\"http://121.37.194.36//group1/M00/00/07/wKgABF7bRxWAXOXaAABMYp1lVaA989.jpg\">3</strong></p>', '<p><span style=\"color: rgb(194, 133, 255);\">3</span></p>');
INSERT INTO `t_product_detail` VALUES ('123', '133', '<p><strong style=\"color: rgb(230, 0, 0);\"><img src=\"http://121.37.194.36//group1/M00/00/07/wKgABF7bRxWAXOXaAABMYp1lVaA989.jpg\">3</strong></p>', '<p><span style=\"color: rgb(194, 133, 255);\">3</span></p>');
INSERT INTO `t_product_detail` VALUES ('124', '134', '<p><strong style=\"color: rgb(230, 0, 0);\"><img src=\"http://121.37.194.36//group1/M00/00/07/wKgABF7bRxWAXOXaAABMYp1lVaA989.jpg\">3</strong></p>', '<p><span style=\"color: rgb(194, 133, 255);\">3</span></p>');
INSERT INTO `t_product_detail` VALUES ('125', '135', '<p><strong style=\"color: rgb(230, 0, 0);\"><img src=\"http://121.37.194.36//group1/M00/00/07/wKgABF7bRxWAXOXaAABMYp1lVaA989.jpg\">3</strong></p>', '<p><span style=\"color: rgb(194, 133, 255);\">3</span></p>');
INSERT INTO `t_product_detail` VALUES ('126', '136', '<p><strong style=\"color: rgb(230, 0, 0);\"><img src=\"http://121.37.194.36//group1/M00/00/07/wKgABF7bRxWAXOXaAABMYp1lVaA989.jpg\">3</strong></p>', '<p><span style=\"color: rgb(194, 133, 255);\">3</span></p>');
INSERT INTO `t_product_detail` VALUES ('127', '137', '<p><strong style=\"color: rgb(230, 0, 0);\"><img src=\"http://121.37.194.36//group1/M00/00/07/wKgABF7bRxWAXOXaAABMYp1lVaA989.jpg\">3</strong></p>', '<p><span style=\"color: rgb(194, 133, 255);\">3</span></p>');
INSERT INTO `t_product_detail` VALUES ('128', '138', '<p><strong style=\"color: rgb(230, 0, 0);\"><img src=\"http://121.37.194.36//group1/M00/00/07/wKgABF7bRxWAXOXaAABMYp1lVaA989.jpg\">3</strong></p>', '<p><span style=\"color: rgb(194, 133, 255);\">3</span></p>');
INSERT INTO `t_product_detail` VALUES ('129', '139', '<p><strong style=\"color: rgb(230, 0, 0);\"><img src=\"http://121.37.194.36//group1/M00/00/07/wKgABF7bRxWAXOXaAABMYp1lVaA989.jpg\">3</strong></p>', '<p><span style=\"color: rgb(194, 133, 255);\">3</span></p>');
INSERT INTO `t_product_detail` VALUES ('130', '140', '<p><strong style=\"color: rgb(230, 0, 0);\"><img src=\"http://121.37.194.36//group1/M00/00/07/wKgABF7bRxWAXOXaAABMYp1lVaA989.jpg\">3</strong></p>', '<p><span style=\"color: rgb(194, 133, 255);\">3</span></p>');
INSERT INTO `t_product_detail` VALUES ('131', '141', '<p><strong style=\"color: rgb(230, 0, 0);\"><img src=\"http://121.37.194.36//group1/M00/00/07/wKgABF7bRxWAXOXaAABMYp1lVaA989.jpg\">3</strong></p>', '<p><span style=\"color: rgb(194, 133, 255);\">3</span></p>');
INSERT INTO `t_product_detail` VALUES ('132', '142', '<p><strong style=\"color: rgb(230, 0, 0);\"><img src=\"http://121.37.194.36//group1/M00/00/07/wKgABF7bRxWAXOXaAABMYp1lVaA989.jpg\">3</strong></p>', '<p><span style=\"color: rgb(194, 133, 255);\">3</span></p>');
INSERT INTO `t_product_detail` VALUES ('133', '143', '<p><strong style=\"color: rgb(230, 0, 0);\"><img src=\"http://121.37.194.36//group1/M00/00/07/wKgABF7bRxWAXOXaAABMYp1lVaA989.jpg\">3</strong></p>', '<p><span style=\"color: rgb(194, 133, 255);\">3</span></p>');
INSERT INTO `t_product_detail` VALUES ('134', '144', '<p><strong style=\"color: rgb(230, 0, 0);\"><img src=\"http://121.37.194.36//group1/M00/00/07/wKgABF7bRxWAXOXaAABMYp1lVaA989.jpg\">3</strong></p>', '<p><span style=\"color: rgb(194, 133, 255);\">3</span></p>');
INSERT INTO `t_product_detail` VALUES ('135', '145', '<p><strong style=\"color: rgb(230, 0, 0);\"><img src=\"http://121.37.194.36//group1/M00/00/07/wKgABF7bRxWAXOXaAABMYp1lVaA989.jpg\">3</strong></p>', '<p><span style=\"color: rgb(194, 133, 255);\">3</span></p>');
INSERT INTO `t_product_detail` VALUES ('136', '146', '<p><strong style=\"color: rgb(230, 0, 0);\"><img src=\"http://121.37.194.36//group1/M00/00/07/wKgABF7bRxWAXOXaAABMYp1lVaA989.jpg\">3</strong></p>', '<p><span style=\"color: rgb(194, 133, 255);\">3</span></p>');
INSERT INTO `t_product_detail` VALUES ('137', '147', '<p><strong style=\"color: rgb(230, 0, 0);\"><img src=\"http://121.37.194.36//group1/M00/00/07/wKgABF7bRxWAXOXaAABMYp1lVaA989.jpg\">3</strong></p>', '<p><span style=\"color: rgb(194, 133, 255);\">3</span></p>');
INSERT INTO `t_product_detail` VALUES ('138', '148', '<p><strong style=\"color: rgb(230, 0, 0);\"><img src=\"http://121.37.194.36//group1/M00/00/07/wKgABF7bRxWAXOXaAABMYp1lVaA989.jpg\">3</strong></p>', '<p><span style=\"color: rgb(194, 133, 255);\">3</span></p>');
INSERT INTO `t_product_detail` VALUES ('139', '149', '<p><strong style=\"color: rgb(230, 0, 0);\"><img src=\"http://121.37.194.36//group1/M00/00/07/wKgABF7bRxWAXOXaAABMYp1lVaA989.jpg\">3</strong></p>', '<p><span style=\"color: rgb(194, 133, 255);\">3</span></p>');
INSERT INTO `t_product_detail` VALUES ('140', '150', '<p><strong style=\"color: rgb(230, 0, 0);\"><img src=\"http://121.37.194.36//group1/M00/00/07/wKgABF7bRxWAXOXaAABMYp1lVaA989.jpg\">3</strong></p>', '<p><span style=\"color: rgb(194, 133, 255);\">3</span></p>');
INSERT INTO `t_product_detail` VALUES ('141', '151', '<p><strong style=\"color: rgb(230, 0, 0);\"><img src=\"http://121.37.194.36//group1/M00/00/07/wKgABF7bRxWAXOXaAABMYp1lVaA989.jpg\">3</strong></p>', '<p><span style=\"color: rgb(194, 133, 255);\">3</span></p>');
INSERT INTO `t_product_detail` VALUES ('142', '152', '<p><strong style=\"color: rgb(230, 0, 0);\"><img src=\"http://121.37.194.36//group1/M00/00/07/wKgABF7bRxWAXOXaAABMYp1lVaA989.jpg\">3</strong></p>', '<p><span style=\"color: rgb(194, 133, 255);\">3</span></p>');
INSERT INTO `t_product_detail` VALUES ('143', '153', '<p><strong style=\"color: rgb(230, 0, 0);\"><img src=\"http://121.37.194.36//group1/M00/00/07/wKgABF7bRxWAXOXaAABMYp1lVaA989.jpg\">3</strong></p>', '<p><span style=\"color: rgb(194, 133, 255);\">3</span></p>');
INSERT INTO `t_product_detail` VALUES ('144', '154', '<p><strong style=\"color: rgb(230, 0, 0);\"><img src=\"http://121.37.194.36//group1/M00/00/07/wKgABF7bRxWAXOXaAABMYp1lVaA989.jpg\">3</strong></p>', '<p><span style=\"color: rgb(194, 133, 255);\">3</span></p>');
INSERT INTO `t_product_detail` VALUES ('145', '155', '<p><strong style=\"color: rgb(230, 0, 0);\"><img src=\"http://121.37.194.36//group1/M00/00/07/wKgABF7bRxWAXOXaAABMYp1lVaA989.jpg\">3</strong></p>', '<p><span style=\"color: rgb(194, 133, 255);\">3</span></p>');
INSERT INTO `t_product_detail` VALUES ('146', '156', '<p><strong style=\"color: rgb(230, 0, 0);\"><img src=\"http://121.37.194.36//group1/M00/00/07/wKgABF7bRxWAXOXaAABMYp1lVaA989.jpg\">3</strong></p>', '<p><span style=\"color: rgb(194, 133, 255);\">3</span></p>');
INSERT INTO `t_product_detail` VALUES ('147', '157', '<p><strong style=\"color: rgb(230, 0, 0);\"><img src=\"http://121.37.194.36//group1/M00/00/07/wKgABF7bRxWAXOXaAABMYp1lVaA989.jpg\">3</strong></p>', '<p><span style=\"color: rgb(194, 133, 255);\">3</span></p>');
INSERT INTO `t_product_detail` VALUES ('148', '158', '<p><strong style=\"color: rgb(230, 0, 0);\"><img src=\"http://121.37.194.36//group1/M00/00/07/wKgABF7bRxWAXOXaAABMYp1lVaA989.jpg\">3</strong></p>', '<p><span style=\"color: rgb(194, 133, 255);\">3</span></p>');
INSERT INTO `t_product_detail` VALUES ('149', '159', '<p><strong style=\"color: rgb(230, 0, 0);\"><img src=\"http://121.37.194.36//group1/M00/00/07/wKgABF7bRxWAXOXaAABMYp1lVaA989.jpg\">3</strong></p>', '<p><span style=\"color: rgb(194, 133, 255);\">3</span></p>');
INSERT INTO `t_product_detail` VALUES ('159', '169', '55552', '66661');

-- ----------------------------
-- Table structure for `t_role`
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `sn` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES ('1', '超级管理员', 'admin');
INSERT INTO `t_role` VALUES ('2', '角色管理员', 'guest');
INSERT INTO `t_role` VALUES ('4', '人事经理', 'renShiBu');
INSERT INTO `t_role` VALUES ('10', '市场部门', 'asdasdasda');
INSERT INTO `t_role` VALUES ('11', '开发部', 'IT');
INSERT INTO `t_role` VALUES ('13', 'ceshi', 'ceshi');

-- ----------------------------
-- Table structure for `t_role_permission`
-- ----------------------------
DROP TABLE IF EXISTS `t_role_permission`;
CREATE TABLE `t_role_permission` (
  `role_id` bigint(20) NOT NULL,
  `permission_id` bigint(20) NOT NULL,
  PRIMARY KEY (`role_id`,`permission_id`),
  KEY `FKAEE599B74D26E00F` (`role_id`),
  KEY `FKAEE599B7C854068F` (`permission_id`),
  CONSTRAINT `FKAEE599B74D26E00F` FOREIGN KEY (`role_id`) REFERENCES `t_role` (`id`),
  CONSTRAINT `FKAEE599B7C854068F` FOREIGN KEY (`permission_id`) REFERENCES `t_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role_permission
-- ----------------------------
INSERT INTO `t_role_permission` VALUES ('1', '26');
INSERT INTO `t_role_permission` VALUES ('1', '27');
INSERT INTO `t_role_permission` VALUES ('1', '28');
INSERT INTO `t_role_permission` VALUES ('4', '26');
INSERT INTO `t_role_permission` VALUES ('4', '27');
INSERT INTO `t_role_permission` VALUES ('10', '28');

-- ----------------------------
-- Table structure for `t_search_master_message`
-- ----------------------------
DROP TABLE IF EXISTS `t_search_master_message`;
CREATE TABLE `t_search_master_message` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `price` double(10,3) DEFAULT NULL,
  `age` varchar(255) DEFAULT NULL,
  `gender` tinyint(1) DEFAULT NULL,
  `coat_color` varchar(255) DEFAULT NULL COMMENT '毛色',
  `resources` varchar(255) DEFAULT NULL,
  `pet_type` bigint(255) DEFAULT NULL COMMENT '类型',
  `address` varchar(255) DEFAULT '',
  `state` int(11) DEFAULT '0',
  `title` varchar(255) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `shop_id` bigint(20) DEFAULT NULL COMMENT '店铺id 消息分配的店铺',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=312 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_search_master_message
-- ----------------------------
INSERT INTO `t_search_master_message` VALUES ('24', '旺财', '0.000', '13', '1', '红色', '/group1/M00/00/07/wKgABF7bN9aAUr5jAABMYp1lVaA616.jpg,/group1/M00/00/07/wKgABF7bN_2AcnCmAABMYp1lVaA428.jpg', '1', '四川省成都市龙泉驿区蒲草路', '1', '波斯猫', '26', '27');
INSERT INTO `t_search_master_message` VALUES ('212', '旺财0号', '0.000', '2', '1', '红色', '/group1/M00/00/07/wKgABF7bN9aAUr5jAABMYp1lVaA616.jpg,/group1/M00/00/07/wKgABF7bN_2AcnCmAABMYp1lVaA428.jpg', '1', '四川省成都市龙泉驿区蒲草路', '1', '波斯猫', '26', '27');
INSERT INTO `t_search_master_message` VALUES ('213', '旺财1号', '0.000', '1', '0', '红色', '/group1/M00/00/07/wKgABF7bN9aAUr5jAABMYp1lVaA616.jpg,/group1/M00/00/07/wKgABF7bN_2AcnCmAABMYp1lVaA428.jpg', '1', '四川省成都市龙泉驿区蒲草路', '1', '波斯猫', '26', '27');
INSERT INTO `t_search_master_message` VALUES ('214', '旺财2号', '0.000', '2', '1', '红色', '/group1/M00/00/07/wKgABF7bN9aAUr5jAABMYp1lVaA616.jpg,/group1/M00/00/07/wKgABF7bN_2AcnCmAABMYp1lVaA428.jpg', '1', '四川省成都市龙泉驿区蒲草路', '1', '波斯猫', '26', '27');
INSERT INTO `t_search_master_message` VALUES ('215', '旺财3号', '0.000', '1', '0', '红色', '/group1/M00/00/07/wKgABF7bN9aAUr5jAABMYp1lVaA616.jpg,/group1/M00/00/07/wKgABF7bN_2AcnCmAABMYp1lVaA428.jpg', '1', '四川省成都市龙泉驿区蒲草路', '0', '波斯猫', '26', '27');
INSERT INTO `t_search_master_message` VALUES ('216', '旺财4号', '0.000', '2', '1', '红色', '', '1', '四川省成都市龙泉驿区蒲草路', '1', '波斯猫', '26', '27');
INSERT INTO `t_search_master_message` VALUES ('217', '旺财5号', '0.000', '1', '0', '红色', '', '1', '四川省成都市龙泉驿区蒲草路', '0', '波斯猫', '26', '27');
INSERT INTO `t_search_master_message` VALUES ('218', '旺财6号', '0.000', '2', '1', '红色', '', '1', '四川省成都市龙泉驿区蒲草路', '1', '波斯猫', '26', '27');
INSERT INTO `t_search_master_message` VALUES ('219', '旺财7号', '0.000', '1', '0', '红色', '', '1', '四川省成都市龙泉驿区蒲草路', '0', '波斯猫', '26', '27');
INSERT INTO `t_search_master_message` VALUES ('220', '旺财8号', '0.000', '2', '1', '红色', '', '1', '四川省成都市龙泉驿区蒲草路', '1', '波斯猫', '26', '27');
INSERT INTO `t_search_master_message` VALUES ('221', '旺财9号', '0.000', '1', '0', '红色', '', '1', '四川省成都市龙泉驿区蒲草路', '0', '波斯猫', '26', '27');
INSERT INTO `t_search_master_message` VALUES ('222', '旺财10号', '0.000', '2', '1', '红色', '', '1', '四川省成都市龙泉驿区蒲草路', '1', '波斯猫', '26', '27');
INSERT INTO `t_search_master_message` VALUES ('223', '旺财11号', '0.000', '1', '0', '红色', '', '1', '四川省成都市龙泉驿区蒲草路', '0', '波斯猫', '26', '27');
INSERT INTO `t_search_master_message` VALUES ('224', '旺财12号', '0.000', '2', '1', '红色', '', '1', '四川省成都市龙泉驿区蒲草路', '1', '波斯猫', '26', '27');
INSERT INTO `t_search_master_message` VALUES ('225', '旺财13号', '0.000', '1', '0', '红色', '', '1', '四川省成都市龙泉驿区蒲草路', '0', '波斯猫', '26', '27');
INSERT INTO `t_search_master_message` VALUES ('226', '旺财14号', '0.000', '2', '1', '红色', '', '1', '四川省成都市龙泉驿区蒲草路', '1', '波斯猫', '26', '27');
INSERT INTO `t_search_master_message` VALUES ('227', '旺财15号', '0.000', '1', '0', '红色', '', '1', '四川省成都市龙泉驿区蒲草路', '0', '波斯猫', '26', '27');
INSERT INTO `t_search_master_message` VALUES ('228', '旺财16号', '0.000', '2', '1', '红色', '', '1', '四川省成都市龙泉驿区蒲草路', '1', '波斯猫', '26', '27');
INSERT INTO `t_search_master_message` VALUES ('229', '旺财17号', '0.000', '1', '0', '红色', '', '1', '四川省成都市龙泉驿区蒲草路', '0', '波斯猫', '26', '27');
INSERT INTO `t_search_master_message` VALUES ('230', '旺财18号', '0.000', '2', '1', '红色', '', '1', '四川省成都市龙泉驿区蒲草路', '1', '波斯猫', '26', '27');
INSERT INTO `t_search_master_message` VALUES ('231', '旺财19号', '0.000', '1', '0', '红色', '', '1', '四川省成都市龙泉驿区蒲草路', '0', '波斯猫', '26', '27');
INSERT INTO `t_search_master_message` VALUES ('232', '旺财20号', '0.000', '2', '1', '红色', '', '1', '四川省成都市龙泉驿区蒲草路', '1', '波斯猫', '26', '27');
INSERT INTO `t_search_master_message` VALUES ('233', '旺财21号', '0.000', '1', '0', '红色', '', '1', '四川省成都市龙泉驿区蒲草路', '0', '波斯猫', '26', '27');
INSERT INTO `t_search_master_message` VALUES ('234', '旺财22号', '0.000', '2', '1', '红色', '', '1', '四川省成都市龙泉驿区蒲草路', '1', '波斯猫', '26', '27');
INSERT INTO `t_search_master_message` VALUES ('235', '旺财23号', '0.000', '1', '0', '红色', '', '1', '四川省成都市龙泉驿区蒲草路', '0', '波斯猫', '26', '27');
INSERT INTO `t_search_master_message` VALUES ('236', '旺财24号', '0.000', '2', '1', '红色', '', '1', '四川省成都市龙泉驿区蒲草路', '1', '波斯猫', '26', '27');
INSERT INTO `t_search_master_message` VALUES ('237', '旺财25号', '0.000', '1', '0', '红色', '', '1', '四川省成都市龙泉驿区蒲草路', '0', '波斯猫', '26', '27');
INSERT INTO `t_search_master_message` VALUES ('238', '旺财26号', '0.000', '2', '1', '红色', '', '1', '四川省成都市龙泉驿区蒲草路', '1', '波斯猫', '26', '27');
INSERT INTO `t_search_master_message` VALUES ('239', '旺财27号', '0.000', '1', '0', '红色', '', '1', '四川省成都市龙泉驿区蒲草路', '0', '波斯猫', '26', '27');
INSERT INTO `t_search_master_message` VALUES ('240', '旺财28号', '0.000', '2', '1', '红色', '', '1', '四川省成都市龙泉驿区蒲草路', '1', '波斯猫', '26', '27');
INSERT INTO `t_search_master_message` VALUES ('241', '旺财29号', '0.000', '1', '0', '红色', '', '1', '四川省成都市龙泉驿区蒲草路', '0', '波斯猫', '26', '27');
INSERT INTO `t_search_master_message` VALUES ('242', '旺财30号', '0.000', '2', '1', '红色', '', '1', '四川省成都市龙泉驿区蒲草路', '1', '波斯猫', '26', '27');
INSERT INTO `t_search_master_message` VALUES ('243', '旺财31号', '0.000', '1', '0', '红色', '', '1', '四川省成都市龙泉驿区蒲草路', '0', '波斯猫', '26', '27');
INSERT INTO `t_search_master_message` VALUES ('244', '旺财32号', '0.000', '2', '1', '红色', '', '1', '四川省成都市龙泉驿区蒲草路', '1', '波斯猫', '26', '27');
INSERT INTO `t_search_master_message` VALUES ('245', '旺财33号', '0.000', '1', '0', '红色', '', '1', '四川省成都市龙泉驿区蒲草路', '0', '波斯猫', '26', '27');
INSERT INTO `t_search_master_message` VALUES ('246', '旺财34号', '0.000', '2', '1', '红色', '', '1', '四川省成都市龙泉驿区蒲草路', '1', '波斯猫', '26', '27');
INSERT INTO `t_search_master_message` VALUES ('247', '旺财35号', '0.000', '1', '0', '红色', '', '1', '四川省成都市龙泉驿区蒲草路', '0', '波斯猫', '26', '27');
INSERT INTO `t_search_master_message` VALUES ('248', '旺财36号', '0.000', '2', '1', '红色', '', '1', '四川省成都市龙泉驿区蒲草路', '1', '波斯猫', '26', '27');
INSERT INTO `t_search_master_message` VALUES ('249', '旺财37号', '0.000', '1', '0', '红色', '', '1', '四川省成都市龙泉驿区蒲草路', '0', '波斯猫', '26', '27');
INSERT INTO `t_search_master_message` VALUES ('250', '旺财38号', '0.000', '2', '1', '红色', '', '1', '四川省成都市龙泉驿区蒲草路', '1', '波斯猫', '26', '27');
INSERT INTO `t_search_master_message` VALUES ('251', '旺财39号', '0.000', '1', '0', '红色', '', '1', '四川省成都市龙泉驿区蒲草路', '0', '波斯猫', '26', '27');
INSERT INTO `t_search_master_message` VALUES ('252', '旺财40号', '0.000', '2', '1', '红色', '', '1', '四川省成都市龙泉驿区蒲草路', '1', '波斯猫', '26', '27');
INSERT INTO `t_search_master_message` VALUES ('253', '旺财41号', '0.000', '1', '0', '红色', '', '1', '四川省成都市龙泉驿区蒲草路', '0', '波斯猫', '26', '27');
INSERT INTO `t_search_master_message` VALUES ('254', '旺财42号', '0.000', '2', '1', '红色', '', '1', '四川省成都市龙泉驿区蒲草路', '1', '波斯猫', '26', '27');
INSERT INTO `t_search_master_message` VALUES ('255', '旺财43号', '0.000', '1', '0', '红色', '', '1', '四川省成都市龙泉驿区蒲草路', '0', '波斯猫', '26', '27');
INSERT INTO `t_search_master_message` VALUES ('256', '旺财44号', '0.000', '2', '1', '红色', '', '1', '四川省成都市龙泉驿区蒲草路', '1', '波斯猫', '26', '27');
INSERT INTO `t_search_master_message` VALUES ('257', '旺财45号', '0.000', '1', '0', '红色', '', '1', '四川省成都市龙泉驿区蒲草路', '0', '波斯猫', '26', '27');
INSERT INTO `t_search_master_message` VALUES ('258', '旺财46号', '0.000', '2', '1', '红色', '', '1', '四川省成都市龙泉驿区蒲草路', '1', '波斯猫', '26', '27');
INSERT INTO `t_search_master_message` VALUES ('259', '旺财47号', '0.000', '1', '0', '红色', '', '1', '四川省成都市龙泉驿区蒲草路', '0', '波斯猫', '26', '27');
INSERT INTO `t_search_master_message` VALUES ('260', '旺财48号', '0.000', '2', '1', '红色', '', '1', '四川省成都市龙泉驿区蒲草路', '1', '波斯猫', '26', '27');
INSERT INTO `t_search_master_message` VALUES ('261', '旺财49号', '0.000', '1', '0', '红色', '', '1', '四川省成都市龙泉驿区蒲草路', '0', '波斯猫', '26', '27');
INSERT INTO `t_search_master_message` VALUES ('262', '旺财50号', '0.000', '2', '1', '红色', '', '1', '四川省成都市龙泉驿区蒲草路', '1', '波斯猫', '26', '27');
INSERT INTO `t_search_master_message` VALUES ('263', '旺财51号', '0.000', '1', '0', '红色', '', '1', '四川省成都市龙泉驿区蒲草路', '0', '波斯猫', '26', '27');
INSERT INTO `t_search_master_message` VALUES ('264', '旺财52号', '0.000', '2', '1', '红色', '', '1', '四川省成都市龙泉驿区蒲草路', '1', '波斯猫', '26', '27');
INSERT INTO `t_search_master_message` VALUES ('265', '旺财53号', '0.000', '1', '0', '红色', '', '1', '四川省成都市龙泉驿区蒲草路', '0', '波斯猫', '26', '27');
INSERT INTO `t_search_master_message` VALUES ('266', '旺财54号', '0.000', '2', '1', '红色', '', '1', '四川省成都市龙泉驿区蒲草路', '1', '波斯猫', '26', '27');
INSERT INTO `t_search_master_message` VALUES ('267', '旺财55号', '0.000', '1', '0', '红色', '', '1', '四川省成都市龙泉驿区蒲草路', '0', '波斯猫', '26', '27');
INSERT INTO `t_search_master_message` VALUES ('268', '旺财56号', '0.000', '2', '1', '红色', '', '1', '四川省成都市龙泉驿区蒲草路', '1', '波斯猫', '26', '27');
INSERT INTO `t_search_master_message` VALUES ('269', '旺财57号', '0.000', '1', '0', '红色', '', '1', '四川省成都市龙泉驿区蒲草路', '0', '波斯猫', '26', '27');
INSERT INTO `t_search_master_message` VALUES ('270', '旺财58号', '0.000', '2', '1', '红色', '', '1', '四川省成都市龙泉驿区蒲草路', '1', '波斯猫', '26', '27');
INSERT INTO `t_search_master_message` VALUES ('271', '旺财59号', '0.000', '1', '0', '红色', '', '1', '四川省成都市龙泉驿区蒲草路', '0', '波斯猫', '26', '27');
INSERT INTO `t_search_master_message` VALUES ('272', '旺财60号', '0.000', '2', '1', '红色', '', '1', '四川省成都市龙泉驿区蒲草路', '1', '波斯猫', '26', '27');
INSERT INTO `t_search_master_message` VALUES ('273', '旺财61号', '0.000', '1', '0', '红色', '', '1', '四川省成都市龙泉驿区蒲草路', '0', '波斯猫', '26', '27');
INSERT INTO `t_search_master_message` VALUES ('274', '旺财62号', '0.000', '2', '1', '红色', '', '1', '四川省成都市龙泉驿区蒲草路', '1', '波斯猫', '26', '27');
INSERT INTO `t_search_master_message` VALUES ('275', '旺财63号', '0.000', '1', '0', '红色', '', '1', '四川省成都市龙泉驿区蒲草路', '0', '波斯猫', '26', '27');
INSERT INTO `t_search_master_message` VALUES ('276', '旺财64号', '0.000', '2', '1', '红色', '', '1', '四川省成都市龙泉驿区蒲草路', '1', '波斯猫', '26', '27');
INSERT INTO `t_search_master_message` VALUES ('277', '旺财65号', '0.000', '1', '0', '红色', '', '1', '四川省成都市龙泉驿区蒲草路', '0', '波斯猫', '26', '27');
INSERT INTO `t_search_master_message` VALUES ('278', '旺财66号', '0.000', '2', '1', '红色', '', '1', '四川省成都市龙泉驿区蒲草路', '1', '波斯猫', '26', '27');
INSERT INTO `t_search_master_message` VALUES ('279', '旺财67号', '0.000', '1', '0', '红色', '', '1', '四川省成都市龙泉驿区蒲草路', '0', '波斯猫', '26', '27');
INSERT INTO `t_search_master_message` VALUES ('280', '旺财68号', '0.000', '2', '1', '红色', '', '1', '四川省成都市龙泉驿区蒲草路', '1', '波斯猫', '26', '27');
INSERT INTO `t_search_master_message` VALUES ('281', '旺财69号', '0.000', '1', '0', '红色', '', '1', '四川省成都市龙泉驿区蒲草路', '0', '波斯猫', '26', '27');
INSERT INTO `t_search_master_message` VALUES ('282', '旺财70号', '0.000', '2', '1', '红色', '', '1', '四川省成都市龙泉驿区蒲草路', '1', '波斯猫', '26', '27');
INSERT INTO `t_search_master_message` VALUES ('283', '旺财71号', '0.000', '1', '0', '红色', '', '1', '四川省成都市龙泉驿区蒲草路', '0', '波斯猫', '26', '27');
INSERT INTO `t_search_master_message` VALUES ('284', '旺财72号', '0.000', '2', '1', '红色', '', '1', '四川省成都市龙泉驿区蒲草路', '1', '波斯猫', '26', '27');
INSERT INTO `t_search_master_message` VALUES ('285', '旺财73号', '0.000', '1', '0', '红色', '', '1', '四川省成都市龙泉驿区蒲草路', '0', '波斯猫', '26', '27');
INSERT INTO `t_search_master_message` VALUES ('286', '旺财74号', '0.000', '2', '1', '红色', '', '1', '四川省成都市龙泉驿区蒲草路', '1', '波斯猫', '26', '27');
INSERT INTO `t_search_master_message` VALUES ('287', '旺财75号', '0.000', '1', '0', '红色', '', '1', '四川省成都市龙泉驿区蒲草路', '0', '波斯猫', '26', '27');
INSERT INTO `t_search_master_message` VALUES ('288', '旺财76号', '0.000', '2', '1', '红色', '', '1', '四川省成都市龙泉驿区蒲草路', '1', '波斯猫', '26', '27');
INSERT INTO `t_search_master_message` VALUES ('289', '旺财77号', '0.000', '1', '0', '红色', '', '1', '四川省成都市龙泉驿区蒲草路', '0', '波斯猫', '26', '27');
INSERT INTO `t_search_master_message` VALUES ('290', '旺财78号', '0.000', '2', '1', '红色', '', '1', '四川省成都市龙泉驿区蒲草路', '1', '波斯猫', '26', '27');
INSERT INTO `t_search_master_message` VALUES ('291', '旺财79号', '0.000', '1', '0', '红色', '', '1', '四川省成都市龙泉驿区蒲草路', '0', '波斯猫', '26', '27');
INSERT INTO `t_search_master_message` VALUES ('292', '旺财80号', '0.000', '2', '1', '红色', '', '1', '四川省成都市龙泉驿区蒲草路', '1', '波斯猫', '26', '27');
INSERT INTO `t_search_master_message` VALUES ('293', '旺财81号', '0.000', '1', '0', '红色', '', '1', '四川省成都市龙泉驿区蒲草路', '0', '波斯猫', '26', '27');
INSERT INTO `t_search_master_message` VALUES ('294', '旺财82号', '0.000', '2', '1', '红色', '', '1', '四川省成都市龙泉驿区蒲草路', '1', '波斯猫', '26', '27');
INSERT INTO `t_search_master_message` VALUES ('295', '旺财83号', '0.000', '1', '0', '红色', '', '1', '四川省成都市龙泉驿区蒲草路', '0', '波斯猫', '26', '27');
INSERT INTO `t_search_master_message` VALUES ('296', '旺财84号', '0.000', '2', '1', '红色', '', '1', '四川省成都市龙泉驿区蒲草路', '1', '波斯猫', '26', '27');
INSERT INTO `t_search_master_message` VALUES ('297', '旺财85号', '0.000', '1', '0', '红色', '', '1', '四川省成都市龙泉驿区蒲草路', '0', '波斯猫', '26', '27');
INSERT INTO `t_search_master_message` VALUES ('298', '旺财86号', '0.000', '2', '1', '红色', '', '1', '四川省成都市龙泉驿区蒲草路', '1', '波斯猫', '26', '27');
INSERT INTO `t_search_master_message` VALUES ('299', '旺财87号', '0.000', '1', '0', '红色', '', '1', '四川省成都市龙泉驿区蒲草路', '0', '波斯猫', '26', '27');
INSERT INTO `t_search_master_message` VALUES ('300', '旺财88号', '0.000', '2', '1', '红色', '', '1', '四川省成都市龙泉驿区蒲草路', '1', '波斯猫', '26', '27');
INSERT INTO `t_search_master_message` VALUES ('301', '旺财89号', '0.000', '1', '0', '红色', '', '1', '四川省成都市龙泉驿区蒲草路', '0', '波斯猫', '26', '27');
INSERT INTO `t_search_master_message` VALUES ('302', '旺财90号', '0.000', '2', '1', '红色', '', '1', '四川省成都市龙泉驿区蒲草路', '1', '波斯猫', '26', '27');
INSERT INTO `t_search_master_message` VALUES ('303', '旺财91号', '0.000', '1', '0', '红色', '', '1', '四川省成都市龙泉驿区蒲草路', '0', '波斯猫', '26', '27');
INSERT INTO `t_search_master_message` VALUES ('304', '旺财92号', '0.000', '2', '1', '红色', '', '1', '四川省成都市龙泉驿区蒲草路', '1', '波斯猫', '26', '27');
INSERT INTO `t_search_master_message` VALUES ('305', '旺财93号', '0.000', '1', '0', '红色', '', '1', '四川省成都市龙泉驿区蒲草路', '0', '波斯猫', '26', '27');
INSERT INTO `t_search_master_message` VALUES ('306', '旺财94号', '0.000', '2', '1', '红色', '', '1', '四川省成都市龙泉驿区蒲草路', '1', '波斯猫', '26', '27');
INSERT INTO `t_search_master_message` VALUES ('307', '旺财95号', '0.000', '1', '0', '红色', '', '1', '四川省成都市龙泉驿区蒲草路', '0', '波斯猫', '26', '27');
INSERT INTO `t_search_master_message` VALUES ('308', '旺财96号', '0.000', '2', '1', '红色', '', '1', '四川省成都市龙泉驿区蒲草路', '1', '波斯猫', '26', '27');
INSERT INTO `t_search_master_message` VALUES ('309', '旺财97号', '0.000', '1', '0', '红色', '', '1', '四川省成都市龙泉驿区蒲草路', '0', '波斯猫', '26', '27');
INSERT INTO `t_search_master_message` VALUES ('310', '旺财98号', '0.000', '2', '1', '红色', '', '1', '四川省成都市龙泉驿区蒲草路', '1', '波斯猫', '26', '27');
INSERT INTO `t_search_master_message` VALUES ('311', '旺财99号', '0.000', '1', '0', '红色', '', '1', '四川省成都市龙泉驿区蒲草路', '0', '波斯猫', '26', '27');

-- ----------------------------
-- Table structure for `t_shop`
-- ----------------------------
DROP TABLE IF EXISTS `t_shop`;
CREATE TABLE `t_shop` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `registerTime` date DEFAULT NULL,
  `state` int(1) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `admin_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_shop
-- ----------------------------
INSERT INTO `t_shop` VALUES ('27', 'dbl公司', '028777888', '2019-09-02', '0', '成都市高新区府城大道西段399号天府新谷1号楼6F', 'jjj', '0');
INSERT INTO `t_shop` VALUES ('28', '111111', '22222', '2020-06-22', '0', '33333', '', '314');
INSERT INTO `t_shop` VALUES ('29', '11111', '2222', '2020-06-23', '0', '3333', '/group1/M00/00/1F/wKgABF7xWWCAA8PhAAD86QO7kgQ128.jpg', '315');

-- ----------------------------
-- Table structure for `t_systemdictionarydetail`
-- ----------------------------
DROP TABLE IF EXISTS `t_systemdictionarydetail`;
CREATE TABLE `t_systemdictionarydetail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `types_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK81BC50F6718C93B5` (`types_id`),
  CONSTRAINT `FK81BC50F6718C93B5` FOREIGN KEY (`types_id`) REFERENCES `t_systemdictionarytype` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_systemdictionarydetail
-- ----------------------------
INSERT INTO `t_systemdictionarydetail` VALUES ('1', '七匹狼', '1');
INSERT INTO `t_systemdictionarydetail` VALUES ('2', '耐克', '1');
INSERT INTO `t_systemdictionarydetail` VALUES ('3', '条', '2');
INSERT INTO `t_systemdictionarydetail` VALUES ('4', '斤', '2');

-- ----------------------------
-- Table structure for `t_systemdictionarytype`
-- ----------------------------
DROP TABLE IF EXISTS `t_systemdictionarytype`;
CREATE TABLE `t_systemdictionarytype` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sn` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sn` (`sn`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_systemdictionarytype
-- ----------------------------
INSERT INTO `t_systemdictionarytype` VALUES ('1', 'productBrand', '产品品牌');
INSERT INTO `t_systemdictionarytype` VALUES ('2', 'productUnit', '产品单位');

-- ----------------------------
-- Table structure for `t_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `salt` varchar(255) DEFAULT NULL COMMENT '盐值',
  `password` varchar(255) DEFAULT NULL COMMENT '密码，md5加密加盐',
  `state` int(11) DEFAULT NULL,
  `age` int(2) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  `headImg` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('23', 'yqhm15', null, null, null, '94f7dee1af272fb6a097e476d04e1821', '1', null, null, null);
INSERT INTO `t_user` VALUES ('24', 'root', null, null, null, '94f7dee1af272fb6a097e476d04e1821', '1', null, null, null);
INSERT INTO `t_user` VALUES ('25', 'test', null, null, null, '94f7dee1af272fb6a097e476d04e1821', '1', null, null, null);
INSERT INTO `t_user` VALUES ('26', '13330964748', null, '13330964748', 'QU5gfaVqbMB6HhJw2j2hR1FILIMZETaW', 'd079fd77e056e3a489de1e0168d3ab7a', '1', null, '2020-06-03 10:22:30', null);
INSERT INTO `t_user` VALUES ('27', '13330964749', null, null, 'eflSvH11MXHG8WfLB86CPotX3XH0zasH', '647227c2b548a670061244b7a690c22f', '1', null, '2020-06-04 18:13:55', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83epjZc7AHuYMbXMhdSkdB90wiaEUibvFZuB0iaDFLQNUHiaAfo46Dg0OibOmOxbGm9MW2Ijntd3n97cBLnw/132');
INSERT INTO `t_user` VALUES ('28', null, null, null, '38426495910403226611434870134939', '12345638426495910403226611434870134939', '1', null, '2020-06-23 15:54:47', null);
INSERT INTO `t_user` VALUES ('29', null, null, null, '80300289156387880511499825773640', '12345680300289156387880511499825773640', '1', null, '2020-06-23 15:55:58', null);
INSERT INTO `t_user` VALUES ('30', null, null, null, '68134580361391559073762948557817', '12345668134580361391559073762948557817', '1', null, '2020-06-23 15:56:57', null);
INSERT INTO `t_user` VALUES ('32', '13980620812', null, '13980620812', 'l7RiZFzRnEE2mZrsMbO7eqpDG8R9FNVD', '1414580f9a4382f197a01c2b5d5e6904', '1', null, '2020-06-23 16:00:52', null);

-- ----------------------------
-- Table structure for `t_user_address`
-- ----------------------------
DROP TABLE IF EXISTS `t_user_address`;
CREATE TABLE `t_user_address` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createTime` datetime DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  `contacts` varchar(15) NOT NULL COMMENT '联系人-就是姓名',
  `areaCode` varchar(200) NOT NULL COMMENT '区域-定位到街道',
  `address` varchar(200) DEFAULT NULL COMMENT '详细地址',
  `user_id` bigint(20) DEFAULT NULL,
  `fullAddress` varchar(200) DEFAULT NULL COMMENT '全地址 areaCode+address',
  `phone` char(11) NOT NULL COMMENT '手机号码',
  `phoneBack` varchar(11) DEFAULT NULL COMMENT '备用手机号',
  `tel` varchar(11) DEFAULT NULL COMMENT '固定电话',
  `postCode` varchar(6) DEFAULT NULL COMMENT '邮编',
  `email` varchar(30) DEFAULT NULL COMMENT '电子邮件',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='订单地址';

-- ----------------------------
-- Records of t_user_address
-- ----------------------------
INSERT INTO `t_user_address` VALUES ('1', '2020-06-12 15:05:31', null, '艾迪 ', '湖北省 武汉市 洪山区', '雄楚大道666号(中南财经政法大学)', '26', '湖北省武汉市洪山区雄楚大道666号', '15888888888', '15888888888', null, '637500', 'yhptest@itsource.cn');
INSERT INTO `t_user_address` VALUES ('2', '2020-06-12 15:05:31', null, '艾迪 ', '湖北省 武汉市 洪山区', '雄楚大道666号(中南财经政法大学)', '26', '湖北省 武汉市 洪山区 雄楚大道666号(中南财经政法大学)', '15888888888', '15888888888', null, '637500', 'yhptest@itsource.cn');

-- ----------------------------
-- Table structure for `t_wxuser`
-- ----------------------------
DROP TABLE IF EXISTS `t_wxuser`;
CREATE TABLE `t_wxuser` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `openid` varchar(255) DEFAULT NULL,
  `nickname` varchar(255) DEFAULT NULL,
  `sex` int(11) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `headimgurl` varchar(255) DEFAULT NULL,
  `unionid` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_wxuser
-- ----------------------------
INSERT INTO `t_wxuser` VALUES ('29', 'oa9wA0zJst5_geE_qpVF6Sr17pvg', 'è±å¼', '0', null, 'http://thirdwx.qlogo.cn/mmopen/vi_32/uHIWUauTYQV0gApDLEhSN2eHyN7Fk1aU8crDqXIUQ447RmmGibVQZKfytIWBubnKZJW5N8hLSicicXJibnMIsfm41A/132', 'ovnCWwx9BPtaB6fjCzjEIKjN1QhY', '26');
INSERT INTO `t_wxuser` VALUES ('30', 'oa9wA0_LJUOh4Z8-ZzkG_lPVwKpI', 'è¥è°·', '1', null, 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83epjZc7AHuYMbXMhdSkdB90wiaEUibvFZuB0iaDFLQNUHiaAfo46Dg0OibOmOxbGm9MW2Ijntd3n97cBLnw/132', 'ovnCWw3yJmJr72jP3TkL0eEAnpr0', '27');
INSERT INTO `t_wxuser` VALUES ('34', 'oa9wA08rj2ApI2XX5Q9MB3AckicY', '三下五除二', '1', 'SichuanChengdu', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLdMT1kJ9SgBgnKpUkUFZB3hhTKxyPjXzjLuXhicja361P8nlgLMXh8HwpxTzSsap1VbuNQiaCL1SVg/132', 'ovnCWw7zTq1WeSOIN-Jgc-4KwMk8', '32');
