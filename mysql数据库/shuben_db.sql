/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50051
Source Host           : localhost:3306
Source Database       : shuben_db

Target Server Type    : MYSQL
Target Server Version : 50051
File Encoding         : 65001

Date: 2018-04-02 18:38:30
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `username` varchar(20) NOT NULL default '',
  `password` varchar(32) default NULL,
  PRIMARY KEY  (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('a', 'a');

-- ----------------------------
-- Table structure for `t_comment`
-- ----------------------------
DROP TABLE IF EXISTS `t_comment`;
CREATE TABLE `t_comment` (
  `commentId` int(11) NOT NULL auto_increment COMMENT '评论id',
  `productObj` int(11) NOT NULL COMMENT '被评商品',
  `content` varchar(1000) NOT NULL COMMENT '评论内容',
  `userObj` varchar(30) NOT NULL COMMENT '评论用户',
  `commentTime` varchar(20) default NULL COMMENT '评论时间',
  PRIMARY KEY  (`commentId`),
  KEY `productObj` (`productObj`),
  KEY `userObj` (`userObj`),
  CONSTRAINT `t_comment_ibfk_1` FOREIGN KEY (`productObj`) REFERENCES `t_product` (`productId`),
  CONSTRAINT `t_comment_ibfk_2` FOREIGN KEY (`userObj`) REFERENCES `t_userinfo` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_comment
-- ----------------------------
INSERT INTO `t_comment` VALUES ('1', '1', '这个书讲得很好！', 'user1', '2018-04-01 14:15:13');
INSERT INTO `t_comment` VALUES ('2', '1', '非常好，讲解全面！', 'user1', '2018-04-01 22:31:11');

-- ----------------------------
-- Table structure for `t_leaveword`
-- ----------------------------
DROP TABLE IF EXISTS `t_leaveword`;
CREATE TABLE `t_leaveword` (
  `leaveWordId` int(11) NOT NULL auto_increment COMMENT '留言id',
  `leaveTitle` varchar(80) NOT NULL COMMENT '留言标题',
  `leaveContent` varchar(2000) NOT NULL COMMENT '留言内容',
  `userObj` varchar(30) NOT NULL COMMENT '留言人',
  `leaveTime` varchar(20) default NULL COMMENT '留言时间',
  `replyContent` varchar(1000) default NULL COMMENT '管理回复',
  `replyTime` varchar(20) default NULL COMMENT '回复时间',
  PRIMARY KEY  (`leaveWordId`),
  KEY `userObj` (`userObj`),
  CONSTRAINT `t_leaveword_ibfk_1` FOREIGN KEY (`userObj`) REFERENCES `t_userinfo` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_leaveword
-- ----------------------------
INSERT INTO `t_leaveword` VALUES ('1', '111', '222', 'user1', '2018-04-01 23:46:29', '333', '2018-04-01 23:46:33');
INSERT INTO `t_leaveword` VALUES ('2', 'aa', 'bb', 'user1', '2018-04-01 23:08:02', '很好', '2018-04-01 23:28:01');

-- ----------------------------
-- Table structure for `t_notice`
-- ----------------------------
DROP TABLE IF EXISTS `t_notice`;
CREATE TABLE `t_notice` (
  `noticeId` int(11) NOT NULL auto_increment COMMENT '公告id',
  `title` varchar(80) NOT NULL COMMENT '标题',
  `content` varchar(5000) NOT NULL COMMENT '公告内容',
  `publishDate` varchar(20) default NULL COMMENT '发布时间',
  PRIMARY KEY  (`noticeId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_notice
-- ----------------------------
INSERT INTO `t_notice` VALUES ('1', 'aaaa', '<p>bbbb</p>', '2018-04-01 23:47:02');

-- ----------------------------
-- Table structure for `t_orderinfo`
-- ----------------------------
DROP TABLE IF EXISTS `t_orderinfo`;
CREATE TABLE `t_orderinfo` (
  `orderNo` varchar(30) NOT NULL COMMENT 'orderNo',
  `userObj` varchar(30) NOT NULL COMMENT '下单用户',
  `totalMoney` float NOT NULL COMMENT '订单总金额',
  `payWay` varchar(20) NOT NULL COMMENT '支付方式',
  `orderStateObj` varchar(20) NOT NULL COMMENT '订单状态',
  `orderTime` varchar(20) default NULL COMMENT '下单时间',
  `receiveName` varchar(20) NOT NULL COMMENT '收货人',
  `telephone` varchar(20) NOT NULL COMMENT '收货人电话',
  `address` varchar(80) NOT NULL COMMENT '收货人地址',
  `orderMemo` varchar(500) default NULL COMMENT '订单备注',
  PRIMARY KEY  (`orderNo`),
  KEY `userObj` (`userObj`),
  CONSTRAINT `t_orderinfo_ibfk_1` FOREIGN KEY (`userObj`) REFERENCES `t_userinfo` (`user_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_orderinfo
-- ----------------------------
INSERT INTO `t_orderinfo` VALUES ('14433334433', 'user1', '180', '支付宝', '已付款', '2018-04-01 15:13:14', '马云林', '13958398343', '四川成都万年场13号', 'test');
INSERT INTO `t_orderinfo` VALUES ('user120180122225749', 'user1', '92.5', '支付宝', '已发货', '2018-04-01 22:57:49', '双鱼林', '13598308394', '四川成都红星路13号', '尽快发货哦！');
INSERT INTO `t_orderinfo` VALUES ('user120180123234311', 'user1', '99.5', '支付宝', '已付款', '2018-04-01 23:43:11', '王忠强', '13598308394', '四川成都红星路13号', 'test333');
INSERT INTO `t_orderinfo` VALUES ('user120180124170109', 'user1', '102.1', '支付宝', '已付款', '2018-04-01 17:01:09', '李明霞', '13598308394', '四川成都红星路13号', '测试订单');
INSERT INTO `t_orderinfo` VALUES ('user120180402183257', 'user1', '350', '支付宝', '已发货', '2018-04-02 18:32:57', '双鱼林', '13598308394', '四川成都红星路13号', '我要买书啊！');

-- ----------------------------
-- Table structure for `t_orderitem`
-- ----------------------------
DROP TABLE IF EXISTS `t_orderitem`;
CREATE TABLE `t_orderitem` (
  `itemId` int(11) NOT NULL auto_increment COMMENT '条目id',
  `orderObj` varchar(30) NOT NULL COMMENT '所属订单',
  `productObj` int(11) NOT NULL COMMENT '订单商品',
  `price` float NOT NULL COMMENT '商品单价',
  `orderNumer` int(11) NOT NULL COMMENT '购买数量',
  PRIMARY KEY  (`itemId`),
  KEY `orderObj` (`orderObj`),
  KEY `productObj` (`productObj`),
  CONSTRAINT `t_orderitem_ibfk_1` FOREIGN KEY (`orderObj`) REFERENCES `t_orderinfo` (`orderNo`),
  CONSTRAINT `t_orderitem_ibfk_2` FOREIGN KEY (`productObj`) REFERENCES `t_product` (`productId`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_orderitem
-- ----------------------------
INSERT INTO `t_orderitem` VALUES ('1', '14433334433', '1', '28.5', '2');
INSERT INTO `t_orderitem` VALUES ('2', 'user120180122225749', '1', '28.5', '2');
INSERT INTO `t_orderitem` VALUES ('3', 'user120180122225749', '2', '35.5', '1');
INSERT INTO `t_orderitem` VALUES ('4', 'user120180123234311', '2', '35.5', '2');
INSERT INTO `t_orderitem` VALUES ('5', 'user120180123234311', '1', '28.5', '1');
INSERT INTO `t_orderitem` VALUES ('6', 'user120180124170109', '5', '36.8', '2');
INSERT INTO `t_orderitem` VALUES ('7', 'user120180124170109', '1', '28.5', '1');
INSERT INTO `t_orderitem` VALUES ('8', 'user120180402183257', '4', '268', '1');
INSERT INTO `t_orderitem` VALUES ('9', 'user120180402183257', '3', '41', '2');

-- ----------------------------
-- Table structure for `t_product`
-- ----------------------------
DROP TABLE IF EXISTS `t_product`;
CREATE TABLE `t_product` (
  `productId` int(11) NOT NULL auto_increment COMMENT '商品id',
  `productClassObj` int(11) NOT NULL COMMENT '商品类别',
  `productName` varchar(50) NOT NULL COMMENT '商品名称',
  `mainPhoto` varchar(60) NOT NULL COMMENT '商品图片',
  `productNum` int(11) NOT NULL COMMENT '商品库存',
  `price` float NOT NULL COMMENT '商品价格',
  `recommandFlag` varchar(20) NOT NULL COMMENT '是否推荐',
  `recipeFlag` varchar(20) NOT NULL COMMENT '是否处方药',
  `productDesc` varchar(5000) NOT NULL COMMENT '商品描述',
  `addTime` varchar(20) default NULL COMMENT '发布时间',
  PRIMARY KEY  (`productId`),
  KEY `productClassObj` (`productClassObj`),
  CONSTRAINT `t_product_ibfk_1` FOREIGN KEY (`productClassObj`) REFERENCES `t_productclass` (`classId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_product
-- ----------------------------
INSERT INTO `t_product` VALUES ('1', '1', 'PHP7实践指南', 'upload/93dba8a3-dea2-4b16-9f9f-eb5fb2edc6af.jpg', '100', '28.5', '是', '否', '<ul style=\"list-style-type: none;\" class=\" list-paddingleft-2\"><li><p>产品名称：PHP</p></li><li><p>是否是套装:&nbsp;否</p></li><li><p>书名:&nbsp;PHP</p></li><li><p>定价:&nbsp;28.5元</p></li><li><p>出版社名称:&nbsp;清华大学出版社</p></li><li><p>作者:&nbsp;无</p></li><li><p>编者:&nbsp;刘玉红 蒲娟</p></li><li><p>书名:&nbsp;PHP</p></li><li><p>ISBN编号:&nbsp;9787302428862</p></li></ul><p><br/></p>', '2018-04-01 23:43:22');
INSERT INTO `t_product` VALUES ('2', '2', '中国古代史 上下册', 'upload/162433cf-ecf1-47fc-bb16-a74ee26293b1.jpg', '100', '35.5', '是', '否', '<ul style=\"list-style-type: none;\" class=\" list-paddingleft-2\"><li><p>产品名称：中国古代史</p></li><li><p>是否是套装:&nbsp;否</p></li><li><p>书名:&nbsp;中国古代史</p></li><li><p>定价:&nbsp;35.5元</p></li><li><p>出版社名称:&nbsp;北京师范大学出版社</p></li><li><p>作者:&nbsp;宁欣</p></li><li><p>书名:&nbsp;中国古代史</p></li><li><p>ISBN编号:&nbsp;9787303041879</p></li></ul><p><br/></p>', '2018-04-01 22:57:14');
INSERT INTO `t_product` VALUES ('3', '1', 'HTML5游戏开发案例教程', 'upload/36c7de40-1f8a-40a9-b4e8-9243dcf9a951.jpg', '200', '41', '是', '否', '<ul style=\"list-style-type: none;\" class=\" list-paddingleft-2\"><li><p>产品名称：HTML5游戏开发案例教程</p></li><li><p>是否是套装:&nbsp;否</p></li><li><p>书名:&nbsp;HTML5游戏开发案例教程</p></li><li><p>定价:&nbsp;41.00元</p></li><li><p>出版社名称:&nbsp;人民邮电出版社</p></li><li><p>出版时间:&nbsp;2016年9月</p></li><li><p>作者:&nbsp;无</p></li><li><p>开本:&nbsp;16开</p></li><li><p>书名:&nbsp;HTML5游戏开发案例教程</p></li><li><p>ISBN编号:&nbsp;9787115426727</p></li></ul><p><br/></p>', '2018-04-01 16:47:30');
INSERT INTO `t_product` VALUES ('4', '3', 'CMOS模拟集成电路设计', 'upload/c12312d2-bf5d-4bcf-b5f3-3fcff093e11e.jpg', '240', '268', '是', '否', '<p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><strong><span style=\"color:blue\">基本信息</span></strong></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">书名:CMOS模拟集成电路设计（第二版）——国外电子与通信教材系列</p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">作者:艾伦</p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">出版社：电子工业出版社</p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">出版日期：2005-3-1</p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">ISBN：9787121006418</p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">字数：1056000</p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">页码：644</p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">版次：1</p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">装帧：平装</p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">开本：</p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">商品标识：</p><p><br/></p>', '2018-04-01 16:52:54');
INSERT INTO `t_product` VALUES ('5', '4', '三国演义(上下)', 'upload/bad005d1-f7ac-49ac-aba7-4b3ede7c3838.jpg', '260', '36.8', '是', '是', '<ul style=\"list-style-type: none;\" class=\" list-paddingleft-2\"><li><p>产品名称：三国演义(上下)</p></li><li><p>是否是套装:&nbsp;是</p></li><li><p>书名:&nbsp;三国演义(上下)</p></li><li><p>定价:&nbsp;36.80元</p></li><li><p>出版社名称:&nbsp;人民文学出版社</p></li><li><p>出版时间:&nbsp;2010年09月</p></li><li><p>作者:&nbsp;罗贯中</p></li><li><p>书名:&nbsp;三国演义(上下)</p></li><li><p>ISBN编号:&nbsp;9787020008728</p></li></ul><p><br/></p>', '2018-04-01 16:55:19');

-- ----------------------------
-- Table structure for `t_productclass`
-- ----------------------------
DROP TABLE IF EXISTS `t_productclass`;
CREATE TABLE `t_productclass` (
  `classId` int(11) NOT NULL auto_increment COMMENT '类别id',
  `className` varchar(40) NOT NULL COMMENT '类别名称',
  `classDesc` varchar(500) NOT NULL COMMENT '类别描述',
  PRIMARY KEY  (`classId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_productclass
-- ----------------------------
INSERT INTO `t_productclass` VALUES ('1', '计算机类', '计算机类');
INSERT INTO `t_productclass` VALUES ('2', '历史类', '历史类');
INSERT INTO `t_productclass` VALUES ('3', '电子技术类', '电子技术类');
INSERT INTO `t_productclass` VALUES ('4', '文学类', '文学类');

-- ----------------------------
-- Table structure for `t_recharge`
-- ----------------------------
DROP TABLE IF EXISTS `t_recharge`;
CREATE TABLE `t_recharge` (
  `rechargeId` int(11) NOT NULL auto_increment COMMENT '充值id',
  `userObj` varchar(30) NOT NULL COMMENT '充值用户',
  `rechargeMoney` float NOT NULL COMMENT '充值金额',
  `rechargeMemo` varchar(500) default NULL COMMENT '充值备注',
  `rechargeTime` varchar(20) default NULL COMMENT '充值时间',
  PRIMARY KEY  (`rechargeId`),
  KEY `userObj` (`userObj`),
  CONSTRAINT `t_recharge_ibfk_1` FOREIGN KEY (`userObj`) REFERENCES `t_userinfo` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_recharge
-- ----------------------------
INSERT INTO `t_recharge` VALUES ('1', 'user1', '100', 'test', '2018-04-01 23:46:49');
INSERT INTO `t_recharge` VALUES ('2', 'user1', '50', 'test22', '2018-04-01 23:31:50');
INSERT INTO `t_recharge` VALUES ('3', 'user1', '50', '333', '2018-04-01 23:33:05');
INSERT INTO `t_recharge` VALUES ('4', 'user1', '1000', '给用户充值', '2018-04-02 18:31:39');

-- ----------------------------
-- Table structure for `t_recipel`
-- ----------------------------
DROP TABLE IF EXISTS `t_recipel`;
CREATE TABLE `t_recipel` (
  `recipelId` int(11) NOT NULL auto_increment COMMENT '处方id',
  `recipelPhoto` varchar(60) NOT NULL COMMENT '处方照片',
  `userObj` varchar(30) NOT NULL COMMENT '上传用户',
  `recipelMemo` varchar(500) default NULL COMMENT '处方备注',
  `handState` varchar(20) NOT NULL COMMENT '处理状态',
  `addTime` varchar(20) default NULL COMMENT '上传时间',
  PRIMARY KEY  (`recipelId`),
  KEY `userObj` (`userObj`),
  CONSTRAINT `t_recipel_ibfk_1` FOREIGN KEY (`userObj`) REFERENCES `t_userinfo` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_recipel
-- ----------------------------
INSERT INTO `t_recipel` VALUES ('1', 'upload/NoImage.jpg', 'user1', 'gassaffa', '待处理', '2018-04-01 23:46:00');
INSERT INTO `t_recipel` VALUES ('2', 'upload/NoImage.jpg', 'user1', 'gafsfsff', '已处理', '2018-04-01 22:51:44');

-- ----------------------------
-- Table structure for `t_shopcart`
-- ----------------------------
DROP TABLE IF EXISTS `t_shopcart`;
CREATE TABLE `t_shopcart` (
  `cartId` int(11) NOT NULL auto_increment COMMENT '购物车id',
  `productObj` int(11) NOT NULL COMMENT '商品',
  `userObj` varchar(30) NOT NULL COMMENT '用户',
  `price` float NOT NULL COMMENT '单价',
  `buyNum` int(11) NOT NULL COMMENT '购买数量',
  PRIMARY KEY  (`cartId`),
  KEY `productObj` (`productObj`),
  KEY `userObj` (`userObj`),
  CONSTRAINT `t_shopcart_ibfk_1` FOREIGN KEY (`productObj`) REFERENCES `t_product` (`productId`),
  CONSTRAINT `t_shopcart_ibfk_2` FOREIGN KEY (`userObj`) REFERENCES `t_userinfo` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_shopcart
-- ----------------------------

-- ----------------------------
-- Table structure for `t_userinfo`
-- ----------------------------
DROP TABLE IF EXISTS `t_userinfo`;
CREATE TABLE `t_userinfo` (
  `user_name` varchar(30) NOT NULL COMMENT 'user_name',
  `password` varchar(30) NOT NULL COMMENT '登录密码',
  `name` varchar(20) NOT NULL COMMENT '姓名',
  `gender` varchar(4) NOT NULL COMMENT '性别',
  `birthDate` varchar(20) default NULL COMMENT '出生日期',
  `userPhoto` varchar(60) NOT NULL COMMENT '用户照片',
  `telephone` varchar(20) NOT NULL COMMENT '联系电话',
  `email` varchar(50) NOT NULL COMMENT '邮箱',
  `address` varchar(80) default NULL COMMENT '家庭地址',
  `userMoney` float NOT NULL COMMENT '账户余额',
  `regTime` varchar(20) default NULL COMMENT '注册时间',
  PRIMARY KEY  (`user_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_userinfo
-- ----------------------------
INSERT INTO `t_userinfo` VALUES ('user1', '123', '双鱼林', '男', '2018-01-02', 'upload/2a4f0e05-2407-44d0-b510-0b04a8cfa620.jpg', '13598308394', 'dashen@163.com', '四川成都红星路13号', '748.4', '2018-04-01 23:41:53');
