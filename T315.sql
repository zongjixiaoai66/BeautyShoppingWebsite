/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb3 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

DROP DATABASE IF EXISTS `t315`;
CREATE DATABASE IF NOT EXISTS `t315` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `t315`;

DROP TABLE IF EXISTS `address`;
CREATE TABLE IF NOT EXISTS `address` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键 ',
  `yonghu_id` int NOT NULL COMMENT '创建用户',
  `address_name` varchar(200) NOT NULL COMMENT '收货人 ',
  `address_phone` varchar(200) NOT NULL COMMENT '电话 ',
  `address_dizhi` varchar(200) NOT NULL COMMENT '地址 ',
  `isdefault_types` int NOT NULL COMMENT '是否默认地址 ',
  `insert_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间 show3',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COMMENT='收货地址';

DELETE FROM `address`;
INSERT INTO `address` (`id`, `yonghu_id`, `address_name`, `address_phone`, `address_dizhi`, `isdefault_types`, `insert_time`, `update_time`, `create_time`) VALUES
	(1, 1, '收货人1', '17703786901', '地址1', 1, '2022-04-25 08:44:56', '2022-04-25 08:44:56', '2022-04-25 08:44:56'),
	(2, 2, '收货人2', '17703786902', '地址2', 1, '2022-04-25 08:44:56', '2022-04-25 08:44:56', '2022-04-25 08:44:56'),
	(3, 1, '收货人3', '17703786903', '地址3', 2, '2022-04-25 08:44:56', '2022-04-25 08:58:27', '2022-04-25 08:44:56'),
	(4, 3, '收货人4', '17703786904', '地址4', 1, '2022-04-25 08:44:56', '2022-04-25 08:44:56', '2022-04-25 08:44:56'),
	(5, 3, '收货人5', '17703786905', '地址5', 1, '2022-04-25 08:44:56', '2022-04-25 08:44:56', '2022-04-25 08:44:56');

DROP TABLE IF EXISTS `cart`;
CREATE TABLE IF NOT EXISTS `cart` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `yonghu_id` int DEFAULT NULL COMMENT '所属用户',
  `meizhuang_id` int DEFAULT NULL COMMENT '商品',
  `buy_number` int DEFAULT NULL COMMENT '购买数量',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '添加时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COMMENT='购物车';

DELETE FROM `cart`;

DROP TABLE IF EXISTS `config`;
CREATE TABLE IF NOT EXISTS `config` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) NOT NULL COMMENT '配置参数名称',
  `value` varchar(100) DEFAULT NULL COMMENT '配置参数值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COMMENT='配置文件';

DELETE FROM `config`;
INSERT INTO `config` (`id`, `name`, `value`) VALUES
	(1, '轮播图1', 'http://localhost:8080/meizhaunggouwuwangzhan/upload/config1.jpg'),
	(2, '轮播图2', 'http://localhost:8080/meizhaunggouwuwangzhan/upload/config2.jpg'),
	(3, '轮播图3', 'http://localhost:8080/meizhaunggouwuwangzhan/upload/config3.jpg');

DROP TABLE IF EXISTS `dianying`;
CREATE TABLE IF NOT EXISTS `dianying` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键 ',
  `dianying_name` varchar(200) DEFAULT NULL COMMENT '电影名称  Search111 ',
  `dianying_photo` varchar(200) DEFAULT NULL COMMENT '电影照片',
  `dianying_types` int DEFAULT NULL COMMENT '电影类型 Search111',
  `zuowei_number` int DEFAULT NULL COMMENT '电影座位',
  `dianying_old_money` decimal(10,2) DEFAULT NULL COMMENT '原价 ',
  `dianying_new_money` decimal(10,2) DEFAULT NULL COMMENT '现价',
  `zan_number` int DEFAULT NULL COMMENT '赞 ',
  `cai_number` int DEFAULT NULL COMMENT '踩 ',
  `shangxia_types` int DEFAULT NULL COMMENT '是否上架 ',
  `dianying_delete` int DEFAULT NULL COMMENT '逻辑删除',
  `dianying_content` text COMMENT '电影简介 ',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间  show1 show2 photoShow',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3 COMMENT='电影';

DELETE FROM `dianying`;
INSERT INTO `dianying` (`id`, `dianying_name`, `dianying_photo`, `dianying_types`, `zuowei_number`, `dianying_old_money`, `dianying_new_money`, `zan_number`, `cai_number`, `shangxia_types`, `dianying_delete`, `dianying_content`, `create_time`) VALUES
	(1, '电影名称1', 'http://localhost:8080/dianyingdingpiao/upload/1645096978456.jpg', 4, 22, 953.73, 455.46, 50, 33, 1, 1, '<p>电影简介1</p>', '2022-02-17 11:18:22'),
	(2, '电影名称2', 'http://localhost:8080/dianyingdingpiao/upload/1645096969558.jpg', 1, 22, 628.58, 191.16, 60, 254, 1, 1, '<p>电影简介2</p>', '2022-02-17 11:18:22'),
	(3, '电影名称3', 'http://localhost:8080/dianyingdingpiao/upload/1645096962159.jpg', 4, 22, 758.66, 328.49, 20, 278, 1, 1, '<p>电影简介3</p>', '2022-02-17 11:18:22'),
	(4, '电影名称4', 'http://localhost:8080/dianyingdingpiao/upload/1645096953965.jpg', 4, 22, 568.12, 391.81, 36, 132, 1, 1, '<p>电影简介4</p>', '2022-02-17 11:18:22'),
	(5, '电影名称5', 'http://localhost:8080/dianyingdingpiao/upload/1645096944146.jpg', 2, 22, 725.37, 220.37, 78, 381, 1, 1, '<p>电影简介5</p>', '2022-02-17 11:18:22'),
	(6, '电影名称6', 'http://localhost:8080/dianyingdingpiao/upload/1645096937254.jpg', 2, 22, 941.48, 15.70, 37, 409, 1, 1, '<p>电影简介6</p>', '2022-02-17 11:18:22');

DROP TABLE IF EXISTS `dianying_collection`;
CREATE TABLE IF NOT EXISTS `dianying_collection` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `dianying_id` int DEFAULT NULL COMMENT '电影',
  `yonghu_id` int DEFAULT NULL COMMENT '用户',
  `dianying_collection_types` int DEFAULT NULL COMMENT '类型',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '收藏时间',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间 show3 photoShow',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3 COMMENT='电影收藏';

DELETE FROM `dianying_collection`;
INSERT INTO `dianying_collection` (`id`, `dianying_id`, `yonghu_id`, `dianying_collection_types`, `insert_time`, `create_time`) VALUES
	(2, 2, 2, 1, '2022-02-17 11:18:22', '2022-02-17 11:18:22'),
	(3, 3, 2, 1, '2022-02-17 11:18:22', '2022-02-17 11:18:22'),
	(5, 5, 1, 1, '2022-02-17 11:18:22', '2022-02-17 11:18:22'),
	(6, 6, 1, 1, '2022-02-17 11:18:22', '2022-02-17 11:18:22'),
	(15, 4, 1, 1, '2022-02-17 12:20:50', '2022-02-17 12:20:50');

DROP TABLE IF EXISTS `dianying_commentback`;
CREATE TABLE IF NOT EXISTS `dianying_commentback` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `dianying_id` int DEFAULT NULL COMMENT '电影',
  `yonghu_id` int DEFAULT NULL COMMENT '用户',
  `dianying_commentback_text` text COMMENT '评价内容',
  `reply_text` text COMMENT '回复内容',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '评价时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '回复时间',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb3 COMMENT='电影评价';

DELETE FROM `dianying_commentback`;
INSERT INTO `dianying_commentback` (`id`, `dianying_id`, `yonghu_id`, `dianying_commentback_text`, `reply_text`, `insert_time`, `update_time`, `create_time`) VALUES
	(1, 1, 1, '评价内容1', '回复信息1', '2022-02-17 11:18:22', '2022-02-17 11:18:22', '2022-02-17 11:18:22'),
	(2, 2, 2, '评价内容2', '回复信息2', '2022-02-17 11:18:22', '2022-02-17 11:18:22', '2022-02-17 11:18:22'),
	(3, 3, 2, '评价内容3', '回复信息3', '2022-02-17 11:18:22', '2022-02-17 11:18:22', '2022-02-17 11:18:22'),
	(4, 4, 3, '评价内容4', '回复信息4', '2022-02-17 11:18:22', '2022-02-17 11:18:22', '2022-02-17 11:18:22'),
	(5, 5, 1, '评价内容5', '回复信息5', '2022-02-17 11:18:22', '2022-02-17 11:18:22', '2022-02-17 11:18:22'),
	(6, 6, 3, '评价内容6', '回复信息6', '2022-02-17 11:18:22', '2022-02-17 11:18:22', '2022-02-17 11:18:22'),
	(12, 6, 1, '评价内容11111', NULL, '2022-02-17 12:01:28', NULL, '2022-02-17 12:01:28'),
	(14, 4, 1, '9999', NULL, '2022-02-17 12:43:01', NULL, '2022-02-17 12:43:01');

DROP TABLE IF EXISTS `dianying_order`;
CREATE TABLE IF NOT EXISTS `dianying_order` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `dianying_order_uuid_number` varchar(200) DEFAULT NULL COMMENT '订单号',
  `dianying_id` int DEFAULT NULL COMMENT '电影',
  `yonghu_id` int DEFAULT NULL COMMENT '用户',
  `buy_zuowei_number` varchar(200) DEFAULT NULL COMMENT '购买的座位 ',
  `buy_zuowei_time` date DEFAULT NULL COMMENT '购买的日期 ',
  `dianying_order_true_price` decimal(10,2) DEFAULT NULL COMMENT '实付价格',
  `dianying_order_types` int DEFAULT NULL COMMENT '订单类型',
  `dianying_order_payment_types` int DEFAULT NULL COMMENT '支付类型',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '订单创建时间',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间 show3',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COMMENT='电影订单';

DELETE FROM `dianying_order`;
INSERT INTO `dianying_order` (`id`, `dianying_order_uuid_number`, `dianying_id`, `yonghu_id`, `buy_zuowei_number`, `buy_zuowei_time`, `dianying_order_true_price`, `dianying_order_types`, `dianying_order_payment_types`, `insert_time`, `create_time`) VALUES
	(1, '1645098194713', 6, 1, '6,16', '2022-02-17', 31.40, 1, 1, '2022-02-17 11:43:19', '2022-02-17 11:43:19'),
	(2, '1645100366554', 6, 1, '3,4,13,14', '2022-02-17', 62.80, 1, 1, '2022-02-17 12:19:35', '2022-02-17 12:19:35'),
	(3, '1645100961241', 4, 1, '3,4,5,6,7,8', '2022-02-17', 2350.86, 1, 1, '2022-02-17 12:29:23', '2022-02-17 12:29:23');

DROP TABLE IF EXISTS `dictionary`;
CREATE TABLE IF NOT EXISTS `dictionary` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `dic_code` varchar(200) DEFAULT NULL COMMENT '字段',
  `dic_name` varchar(200) DEFAULT NULL COMMENT '字段名',
  `code_index` int DEFAULT NULL COMMENT '编码',
  `index_name` varchar(200) DEFAULT NULL COMMENT '编码名字  Search111 ',
  `super_id` int DEFAULT NULL COMMENT '父字段id',
  `beizhu` varchar(200) DEFAULT NULL COMMENT '备注',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb3 COMMENT='字典';

DELETE FROM `dictionary`;
INSERT INTO `dictionary` (`id`, `dic_code`, `dic_name`, `code_index`, `index_name`, `super_id`, `beizhu`, `create_time`) VALUES
	(1, 'meizhuang_types', '商品类型', 1, '商品类型1', NULL, NULL, '2022-04-25 08:44:44'),
	(2, 'meizhuang_types', '商品类型', 2, '商品类型2', NULL, NULL, '2022-04-25 08:44:44'),
	(3, 'meizhuang_types', '商品类型', 3, '商品类型3', NULL, NULL, '2022-04-25 08:44:44'),
	(4, 'meizhuang_erji_types', '商品二级类型', 1, '商品类型1.1', 1, NULL, '2022-04-25 08:44:44'),
	(5, 'meizhuang_erji_types', '商品二级类型', 2, '商品类型2.1', 2, NULL, '2022-04-25 08:44:44'),
	(6, 'meizhuang_erji_types', '商品二级类型', 3, '商品类型3.1', 3, NULL, '2022-04-25 08:44:44'),
	(7, 'meizhuang_erji_types', '商品二级类型', 4, '商品类型1.2', 1, NULL, '2022-04-25 08:44:44'),
	(8, 'meizhuang_erji_types', '商品二级类型', 5, '商品类型2.2', 2, NULL, '2022-04-25 08:44:44'),
	(9, 'meizhuang_erji_types', '商品二级类型', 6, '商品类型3.2', 3, NULL, '2022-04-25 08:44:44'),
	(10, 'meizhuang_yesno_types', '审核', 1, '未审核', NULL, NULL, '2022-04-25 08:44:44'),
	(11, 'meizhuang_yesno_types', '审核', 2, '通过', NULL, NULL, '2022-04-25 08:44:44'),
	(12, 'meizhuang_yesno_types', '审核', 3, '拒绝', NULL, NULL, '2022-04-25 08:44:44'),
	(13, 'shangxia_types', '上下架', 1, '上架', NULL, NULL, '2022-04-25 08:44:44'),
	(14, 'shangxia_types', '上下架', 2, '下架', NULL, NULL, '2022-04-25 08:44:44'),
	(15, 'meizhuang_order_types', '订单类型', 1, '已支付', NULL, NULL, '2022-04-25 08:44:44'),
	(16, 'meizhuang_order_types', '订单类型', 2, '退款', NULL, NULL, '2022-04-25 08:44:44'),
	(17, 'meizhuang_order_types', '订单类型', 3, '已发货', NULL, NULL, '2022-04-25 08:44:44'),
	(18, 'meizhuang_order_types', '订单类型', 4, '已收货', NULL, NULL, '2022-04-25 08:44:44'),
	(19, 'meizhuang_order_types', '订单类型', 5, '已评价', NULL, NULL, '2022-04-25 08:44:44'),
	(20, 'meizhuang_order_payment_types', '订单支付类型', 1, '现金', NULL, NULL, '2022-04-25 08:44:44'),
	(21, 'meizhuang_collection_types', '收藏表类型', 1, '收藏', NULL, NULL, '2022-04-25 08:44:45'),
	(22, 'isdefault_types', '是否默认地址', 1, '否', NULL, NULL, '2022-04-25 08:44:45'),
	(23, 'isdefault_types', '是否默认地址', 2, '是', NULL, NULL, '2022-04-25 08:44:45'),
	(24, 'shangjia_xingji_types', '商家信用类型', 1, '一级', NULL, NULL, '2022-04-25 08:44:45'),
	(25, 'shangjia_xingji_types', '商家信用类型', 2, '二级', NULL, NULL, '2022-04-25 08:44:45'),
	(26, 'shangjia_xingji_types', '商家信用类型', 3, '三级', NULL, NULL, '2022-04-25 08:44:45'),
	(27, 'shangjia_yesno_types', '审核', 1, '未审核', NULL, NULL, '2022-04-25 08:44:45'),
	(28, 'shangjia_yesno_types', '审核', 2, '通过', NULL, NULL, '2022-04-25 08:44:45'),
	(29, 'shangjia_yesno_types', '审核', 3, '拒绝', NULL, NULL, '2022-04-25 08:44:45'),
	(30, 'sex_types', '性别类型', 1, '男', NULL, NULL, '2022-04-25 08:44:45'),
	(31, 'sex_types', '性别类型', 2, '女', NULL, NULL, '2022-04-25 08:44:45'),
	(32, 'huiyuandengji_types', '会员等级类型', 1, '青铜会员', NULL, '0.98', '2022-04-25 08:44:45'),
	(33, 'huiyuandengji_types', '会员等级类型', 2, '白银会员', NULL, '0.96', '2022-04-25 08:44:45'),
	(34, 'huiyuandengji_types', '会员等级类型', 3, '黄金会员', NULL, '0.94', '2022-04-25 08:44:45'),
	(35, 'news_types', '公告类型', 1, '公告类型1', NULL, NULL, '2022-04-25 08:44:45'),
	(36, 'news_types', '公告类型', 2, '公告类型2', NULL, NULL, '2022-04-25 08:44:45'),
	(37, 'news_types', '公告类型', 3, '活动信息', NULL, NULL, '2022-04-25 08:44:45'),
	(38, 'forum_state_types', '帖子状态', 1, '发帖', NULL, NULL, '2022-04-25 08:44:45'),
	(39, 'forum_state_types', '帖子状态', 2, '回帖', NULL, NULL, '2022-04-25 08:44:45');

DROP TABLE IF EXISTS `forum`;
CREATE TABLE IF NOT EXISTS `forum` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `forum_name` varchar(200) DEFAULT NULL COMMENT '帖子标题  Search111 ',
  `yonghu_id` int DEFAULT NULL COMMENT '用户',
  `shangjia_id` int DEFAULT NULL COMMENT '商家',
  `users_id` int DEFAULT NULL COMMENT '管理员',
  `forum_content` text COMMENT '发布内容',
  `super_ids` int DEFAULT NULL COMMENT '父id',
  `forum_state_types` int DEFAULT NULL COMMENT '帖子状态',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '发帖时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间 show2',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3 COMMENT='论坛';

DELETE FROM `forum`;
INSERT INTO `forum` (`id`, `forum_name`, `yonghu_id`, `shangjia_id`, `users_id`, `forum_content`, `super_ids`, `forum_state_types`, `insert_time`, `update_time`, `create_time`) VALUES
	(1, '帖子标题1', 2, NULL, NULL, '发布内容1', NULL, 1, '2022-04-25 08:44:56', '2022-04-25 08:44:56', '2022-04-25 08:44:56'),
	(2, '帖子标题2', 3, NULL, NULL, '发布内容2', NULL, 1, '2022-04-25 08:44:56', '2022-04-25 08:44:56', '2022-04-25 08:44:56'),
	(3, '帖子标题3', 2, NULL, NULL, '发布内容3', NULL, 1, '2022-04-25 08:44:56', '2022-04-25 08:44:56', '2022-04-25 08:44:56'),
	(4, '帖子标题4', 1, NULL, NULL, '发布内容4', NULL, 1, '2022-04-25 08:44:56', '2022-04-25 08:44:56', '2022-04-25 08:44:56'),
	(5, '帖子标题5', 1, NULL, NULL, '发布内容5', NULL, 1, '2022-04-25 08:44:56', '2022-04-25 08:44:56', '2022-04-25 08:44:56'),
	(6, NULL, NULL, 1, NULL, '123', 5, 2, '2022-04-25 09:00:18', NULL, '2022-04-25 09:00:18'),
	(7, NULL, NULL, NULL, 1, '321', 5, 2, '2022-04-25 09:02:42', NULL, '2022-04-25 09:02:42');

DROP TABLE IF EXISTS `meizhuang`;
CREATE TABLE IF NOT EXISTS `meizhuang` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键 ',
  `shangjia_id` int DEFAULT NULL COMMENT '商家',
  `meizhuang_uuid_number` varchar(200) DEFAULT NULL COMMENT '商品编号  Search111 ',
  `meizhuang_name` varchar(200) DEFAULT NULL COMMENT '商品名称  Search111 ',
  `meizhuang_photo` varchar(200) DEFAULT NULL COMMENT '商品照片',
  `meizhuang_pinpai` varchar(200) DEFAULT NULL COMMENT '品牌 Search111',
  `meizhuang_types` int DEFAULT NULL COMMENT '商品类型 Search111',
  `meizhuang_erji_types` int DEFAULT NULL COMMENT '商品二级类型 Search111',
  `meizhuang_price` int DEFAULT NULL COMMENT '购买获得积分 ',
  `meizhuang_kucun_number` int DEFAULT NULL COMMENT '商品库存',
  `meizhuang_old_money` decimal(10,2) DEFAULT NULL COMMENT '商品原价 ',
  `meizhuang_new_money` decimal(10,2) DEFAULT NULL COMMENT '现价 ',
  `meizhuang_clicknum` int DEFAULT NULL COMMENT '点击次数 ',
  `meizhuang_yesno_types` int DEFAULT NULL COMMENT '商品审核',
  `meizhuang_content` text COMMENT '商品介绍 ',
  `shangxia_types` int DEFAULT NULL COMMENT '是否上架 ',
  `meizhuang_delete` int DEFAULT NULL COMMENT '逻辑删除',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间  show1 show2 photoShow',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COMMENT='商品';

DELETE FROM `meizhuang`;
INSERT INTO `meizhuang` (`id`, `shangjia_id`, `meizhuang_uuid_number`, `meizhuang_name`, `meizhuang_photo`, `meizhuang_pinpai`, `meizhuang_types`, `meizhuang_erji_types`, `meizhuang_price`, `meizhuang_kucun_number`, `meizhuang_old_money`, `meizhuang_new_money`, `meizhuang_clicknum`, `meizhuang_yesno_types`, `meizhuang_content`, `shangxia_types`, `meizhuang_delete`, `create_time`) VALUES
	(1, 2, '165087629608738', '商品名称1', 'http://localhost:8080/meizhaunggouwuwangzhan/upload/meizhuang1.jpg', '品牌1', 1, 4, 212, 101, 716.97, 94.57, 401, 2, '商品介绍1', 1, 1, '2022-04-25 08:44:56'),
	(2, 2, '165087629608751', '商品名称2', 'http://localhost:8080/meizhaunggouwuwangzhan/upload/meizhuang2.jpg', '品牌2', 2, 5, 446, 102, 521.44, 127.70, 64, 2, '商品介绍2', 1, 1, '2022-04-25 08:44:56'),
	(3, 3, '165087629608761', '商品名称3', 'http://localhost:8080/meizhaunggouwuwangzhan/upload/meizhuang3.jpg', '品牌3', 3, 3, 237, 103, 666.83, 87.72, 253, 2, '商品介绍3', 1, 1, '2022-04-25 08:44:56'),
	(4, 1, '165087629608749', '商品名称4', 'http://localhost:8080/meizhaunggouwuwangzhan/upload/meizhuang4.jpg', '品牌4', 2, 2, 50, 103, 931.57, 427.72, 323, 2, '商品介绍4', 1, 1, '2022-04-25 08:44:56'),
	(5, 2, '165087629608769', '商品名称5', 'http://localhost:8080/meizhaunggouwuwangzhan/upload/meizhuang5.jpg', '品牌5', 1, 1, 142, 104, 986.33, 241.38, 41, 2, '商品介绍5', 1, 1, '2022-04-25 08:44:56');

DROP TABLE IF EXISTS `meizhuang_collection`;
CREATE TABLE IF NOT EXISTS `meizhuang_collection` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `meizhuang_id` int DEFAULT NULL COMMENT '商品',
  `yonghu_id` int DEFAULT NULL COMMENT '用户',
  `meizhuang_collection_types` int DEFAULT NULL COMMENT '类型',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '收藏时间',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间 show3 photoShow',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COMMENT='商品收藏';

DELETE FROM `meizhuang_collection`;
INSERT INTO `meizhuang_collection` (`id`, `meizhuang_id`, `yonghu_id`, `meizhuang_collection_types`, `insert_time`, `create_time`) VALUES
	(1, 1, 2, 1, '2022-04-25 08:44:56', '2022-04-25 08:44:56'),
	(2, 2, 1, 1, '2022-04-25 08:44:56', '2022-04-25 08:44:56'),
	(3, 3, 1, 1, '2022-04-25 08:44:56', '2022-04-25 08:44:56'),
	(4, 4, 2, 1, '2022-04-25 08:44:56', '2022-04-25 08:44:56'),
	(5, 5, 1, 1, '2022-04-25 08:44:56', '2022-04-25 08:44:56'),
	(6, 1, 1, 1, '2022-04-25 08:57:54', '2022-04-25 08:57:54');

DROP TABLE IF EXISTS `meizhuang_commentback`;
CREATE TABLE IF NOT EXISTS `meizhuang_commentback` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `meizhuang_id` int DEFAULT NULL COMMENT '商品',
  `yonghu_id` int DEFAULT NULL COMMENT '用户',
  `meizhuang_commentback_text` text COMMENT '评价内容',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '评价时间',
  `reply_text` text COMMENT '回复内容',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '回复时间',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COMMENT='商品评价';

DELETE FROM `meizhuang_commentback`;
INSERT INTO `meizhuang_commentback` (`id`, `meizhuang_id`, `yonghu_id`, `meizhuang_commentback_text`, `insert_time`, `reply_text`, `update_time`, `create_time`) VALUES
	(1, 1, 2, '评价内容1', '2022-04-25 08:44:56', '回复信息1', '2022-04-25 08:44:56', '2022-04-25 08:44:56'),
	(2, 2, 2, '评价内容2', '2022-04-25 08:44:56', '回复信息2', '2022-04-25 08:44:56', '2022-04-25 08:44:56'),
	(3, 3, 3, '评价内容3', '2022-04-25 08:44:56', '回复信息3', '2022-04-25 08:44:56', '2022-04-25 08:44:56'),
	(4, 4, 2, '评价内容4', '2022-04-25 08:44:56', '回复信息4', '2022-04-25 08:44:56', '2022-04-25 08:44:56'),
	(5, 5, 1, '评价内容5', '2022-04-25 08:44:56', '回复信息5', '2022-04-25 08:44:56', '2022-04-25 08:44:56'),
	(6, 4, 1, '评论12', '2022-04-25 09:01:10', '312', '2022-04-25 09:01:27', '2022-04-25 09:01:10');

DROP TABLE IF EXISTS `meizhuang_order`;
CREATE TABLE IF NOT EXISTS `meizhuang_order` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `meizhuang_order_uuid_number` varchar(200) DEFAULT NULL COMMENT '订单号 Search111 ',
  `address_id` int DEFAULT NULL COMMENT '收货地址 ',
  `meizhuang_id` int DEFAULT NULL COMMENT '商品',
  `yonghu_id` int DEFAULT NULL COMMENT '用户',
  `buy_number` int DEFAULT NULL COMMENT '购买数量',
  `meizhuang_order_true_price` decimal(10,2) DEFAULT NULL COMMENT '实付价格',
  `meizhuang_order_courier_name` varchar(200) DEFAULT NULL COMMENT '快递公司',
  `meizhuang_order_courier_number` varchar(200) DEFAULT NULL COMMENT '订单快递单号',
  `meizhuang_order_types` int DEFAULT NULL COMMENT '订单类型 Search111 ',
  `meizhuang_order_payment_types` int DEFAULT NULL COMMENT '支付类型',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '订单创建时间',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间 show3',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COMMENT='商品订单';

DELETE FROM `meizhuang_order`;
INSERT INTO `meizhuang_order` (`id`, `meizhuang_order_uuid_number`, `address_id`, `meizhuang_id`, `yonghu_id`, `buy_number`, `meizhuang_order_true_price`, `meizhuang_order_courier_name`, `meizhuang_order_courier_number`, `meizhuang_order_types`, `meizhuang_order_payment_types`, `insert_time`, `create_time`) VALUES
	(1, '1650877119179', 3, 5, 1, 1, 236.55, NULL, NULL, 1, 1, '2022-04-25 08:58:39', '2022-04-25 08:58:39'),
	(2, '1650877119179', 3, 4, 1, 1, 419.17, '京东', 'JD:123412312512534647', 5, 1, '2022-04-25 08:58:39', '2022-04-25 08:58:39'),
	(3, '1650877119179', 3, 1, 1, 1, 92.68, NULL, NULL, 2, 1, '2022-04-25 08:58:39', '2022-04-25 08:58:39');

DROP TABLE IF EXISTS `news`;
CREATE TABLE IF NOT EXISTS `news` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `news_name` varchar(200) DEFAULT NULL COMMENT '公告标题  Search111 ',
  `news_types` int DEFAULT NULL COMMENT '公告类型  Search111 ',
  `news_photo` varchar(200) DEFAULT NULL COMMENT '公告图片',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '添加时间',
  `news_content` text COMMENT '公告详情',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间 show1 show2 nameShow',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COMMENT='公告信息';

DELETE FROM `news`;
INSERT INTO `news` (`id`, `news_name`, `news_types`, `news_photo`, `insert_time`, `news_content`, `create_time`) VALUES
	(1, '公告标题1', 3, 'http://localhost:8080/meizhaunggouwuwangzhan/upload/news1.jpg', '2022-04-25 08:44:56', '公告详情1', '2022-04-25 08:44:56'),
	(2, '公告标题2', 2, 'http://localhost:8080/meizhaunggouwuwangzhan/upload/news2.jpg', '2022-04-25 08:44:56', '公告详情2', '2022-04-25 08:44:56'),
	(3, '公告标题3', 1, 'http://localhost:8080/meizhaunggouwuwangzhan/upload/news3.jpg', '2022-04-25 08:44:56', '公告详情3', '2022-04-25 08:44:56'),
	(4, '公告标题4', 3, 'http://localhost:8080/meizhaunggouwuwangzhan/upload/news4.jpg', '2022-04-25 08:44:56', '公告详情4', '2022-04-25 08:44:56'),
	(5, '公告标题5', 2, 'http://localhost:8080/meizhaunggouwuwangzhan/upload/news5.jpg', '2022-04-25 08:44:56', '公告详情5', '2022-04-25 08:44:56');

DROP TABLE IF EXISTS `shangjia`;
CREATE TABLE IF NOT EXISTS `shangjia` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键 ',
  `username` varchar(200) DEFAULT NULL COMMENT '账户 ',
  `password` varchar(200) DEFAULT NULL COMMENT '密码 ',
  `shangjia_name` varchar(200) DEFAULT NULL COMMENT '商家名称 Search111 ',
  `shangjia_phone` varchar(200) DEFAULT NULL COMMENT '联系方式',
  `shangjia_email` varchar(200) DEFAULT NULL COMMENT '邮箱',
  `shangjia_photo` varchar(200) DEFAULT NULL COMMENT '营业执照展示 ',
  `shangjia_xingji_types` int DEFAULT NULL COMMENT '商家信用类型',
  `new_money` decimal(10,2) DEFAULT NULL COMMENT '现有余额',
  `shangjia_yesno_types` int DEFAULT NULL COMMENT '审核',
  `shangjia_content` text COMMENT '商家简介 ',
  `shangjia_delete` int DEFAULT NULL COMMENT '逻辑删除',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COMMENT='商家';

DELETE FROM `shangjia`;
INSERT INTO `shangjia` (`id`, `username`, `password`, `shangjia_name`, `shangjia_phone`, `shangjia_email`, `shangjia_photo`, `shangjia_xingji_types`, `new_money`, `shangjia_yesno_types`, `shangjia_content`, `shangjia_delete`, `create_time`) VALUES
	(1, '商家1', '123456', '商家名称1', '17703786901', '1@qq.com', 'http://localhost:8080/meizhaunggouwuwangzhan/upload/shangjia1.jpg', 1, 844.45, 2, '<p>商家简介1</p>', 1, '2022-04-25 08:44:56'),
	(2, '商家2', '123456', '商家名称2', '17703786902', '2@qq.com', 'http://localhost:8080/meizhaunggouwuwangzhan/upload/shangjia2.jpg', 3, 754.38, 2, '商家简介2', 1, '2022-04-25 08:44:56'),
	(3, '商家3', '123456', '商家名称3', '17703786903', '3@qq.com', 'http://localhost:8080/meizhaunggouwuwangzhan/upload/shangjia3.jpg', 3, 727.99, 2, '商家简介3', 1, '2022-04-25 08:44:56');

DROP TABLE IF EXISTS `token`;
CREATE TABLE IF NOT EXISTS `token` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userid` bigint NOT NULL COMMENT '用户id',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `tablename` varchar(100) DEFAULT NULL COMMENT '表名',
  `role` varchar(100) DEFAULT NULL COMMENT '角色',
  `token` varchar(200) NOT NULL COMMENT '密码',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  `expiratedtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '过期时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COMMENT='token表';

DELETE FROM `token`;
INSERT INTO `token` (`id`, `userid`, `username`, `tablename`, `role`, `token`, `addtime`, `expiratedtime`) VALUES
	(1, 1, 'admin', 'users', '管理员', 'mp39i6fexqhl8wnupmsiv7ex56pgnvom', '2022-04-25 08:04:29', '2022-04-25 10:01:34'),
	(2, 1, 'a1', 'yonghu', '用户', '9lkjo6983snp15n0aklu7ie6fgtdoix8', '2022-04-25 08:04:39', '2022-04-25 10:00:46'),
	(3, 1, 'a1', 'shangjia', '商家', 'aglqjhd7psl9t6y6errt71fxkt1c4oi1', '2022-04-25 08:59:29', '2022-04-25 10:01:19');

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `role` varchar(100) DEFAULT '管理员' COMMENT '角色',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COMMENT='用户表';

DELETE FROM `users`;
INSERT INTO `users` (`id`, `username`, `password`, `role`, `addtime`) VALUES
	(1, 'admin', '123456', '管理员', '2022-04-30 16:00:00');

DROP TABLE IF EXISTS `yonghu`;
CREATE TABLE IF NOT EXISTS `yonghu` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(200) DEFAULT NULL COMMENT '账户',
  `password` varchar(200) DEFAULT NULL COMMENT '密码',
  `yonghu_name` varchar(200) DEFAULT NULL COMMENT '用户姓名 Search111 ',
  `yonghu_phone` varchar(200) DEFAULT NULL COMMENT '用户手机号',
  `yonghu_id_number` varchar(200) DEFAULT NULL COMMENT '用户身份证号',
  `yonghu_photo` varchar(200) DEFAULT NULL COMMENT '用户头像',
  `sex_types` int DEFAULT NULL COMMENT '性别',
  `yonghu_email` varchar(200) DEFAULT NULL COMMENT '电子邮箱',
  `new_money` decimal(10,2) DEFAULT NULL COMMENT '余额 ',
  `yonghu_sum_jifen` decimal(10,2) DEFAULT NULL COMMENT '总积分',
  `yonghu_new_jifen` decimal(10,2) DEFAULT NULL COMMENT '现积分',
  `huiyuandengji_types` int DEFAULT NULL COMMENT '会员等级',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COMMENT='用户';

DELETE FROM `yonghu`;
INSERT INTO `yonghu` (`id`, `username`, `password`, `yonghu_name`, `yonghu_phone`, `yonghu_id_number`, `yonghu_photo`, `sex_types`, `yonghu_email`, `new_money`, `yonghu_sum_jifen`, `yonghu_new_jifen`, `huiyuandengji_types`, `create_time`) VALUES
	(1, '用户1', '123456', '用户姓名1', '17703786901', '410224199610232001', 'http://localhost:8080/meizhaunggouwuwangzhan/upload/yonghu1.jpg', 1, '1@qq.com', 9670.87, 728.70, 589.81, 1, '2022-04-25 08:44:56'),
	(2, '用户2', '123456', '用户姓名2', '17703786902', '410224199610232002', 'http://localhost:8080/meizhaunggouwuwangzhan/upload/yonghu2.jpg', 2, '2@qq.com', 722.48, 849.52, 402.63, 1, '2022-04-25 08:44:56'),
	(3, '用户3', '123456', '用户姓名3', '17703786903', '410224199610232003', 'http://localhost:8080/meizhaunggouwuwangzhan/upload/yonghu3.jpg', 1, '3@qq.com', 378.38, 527.25, 488.59, 1, '2022-04-25 08:44:56');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
