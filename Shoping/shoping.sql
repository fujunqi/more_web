/*
SQLyog  v12.2.6 (64 bit)
MySQL - 5.7.3-m13 : Database - shopping
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`shopping` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `shopping`;

/*Table structure for table `adress` */

DROP TABLE IF EXISTS `adress`;

CREATE TABLE `adress` (
  `u_id` int(11) NOT NULL COMMENT '外键',
  `u_adress` varchar(100) NOT NULL COMMENT '地址',
  PRIMARY KEY (`u_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `adress` */

/*Table structure for table `car` */

DROP TABLE IF EXISTS `car`;

CREATE TABLE `car` (
  `c_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '购物车id 用来删除用',
  `g_id` int(11) DEFAULT NULL COMMENT '商品ID',
  `u_username` varchar(20) DEFAULT NULL COMMENT '用户名',
  `c_pay` varchar(10) DEFAULT NULL COMMENT '是否支付',
  PRIMARY KEY (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `car` */

/*Table structure for table `goods` */

DROP TABLE IF EXISTS `goods`;

CREATE TABLE `goods` (
  `g_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品id',
  `g_name` varchar(50) NOT NULL COMMENT '商品名字',
  `g_detail` varchar(50) NOT NULL COMMENT '详情信息',
  `g_cost` int(11) NOT NULL COMMENT '原价',
  `g_price` int(11) NOT NULL COMMENT '现价',
  `g_brand` varchar(20) NOT NULL COMMENT '品牌',
  `g_color` varchar(10) NOT NULL COMMENT '颜色',
  `g_color_o` varchar(10) NOT NULL COMMENT '颜色2',
  `g_color_t` varchar(10) NOT NULL COMMENT '颜色1',
  `g_address` varchar(50) NOT NULL COMMENT '厂家',
  `g_picture` varchar(50) NOT NULL COMMENT '照片',
  `g_picture2` varchar(50) DEFAULT NULL,
  `g_picture3` varchar(50) DEFAULT NULL,
  `g_picture4` varchar(50) DEFAULT NULL,
  `g_picture5` varchar(50) DEFAULT NULL,
  `g_info` varchar(500) DEFAULT NULL COMMENT '详情信息',
  `g_size` varchar(500) DEFAULT NULL COMMENT '规格',
  PRIMARY KEY (`g_id`),
  KEY `g_id` (`g_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `goods` */

/*Table structure for table `info_order` */

DROP TABLE IF EXISTS `info_order`;

CREATE TABLE `info_order` (
  `o_id` int(11) NOT NULL COMMENT '订单外键',
  `g_id` int(11) NOT NULL COMMENT '商品ID',
  `i_price` float NOT NULL COMMENT '价格'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `info_order` */

/*Table structure for table `order` */

DROP TABLE IF EXISTS `order`;

CREATE TABLE `order` (
  `o_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单编号',
  `u_username` varchar(20) DEFAULT NULL COMMENT '用户名',
  `u_name` varchar(10) DEFAULT NULL COMMENT '姓名',
  `o_time` varchar(50) DEFAULT NULL COMMENT '支付时间',
  `o_price` int(11) DEFAULT NULL COMMENT '金额',
  `u_address` varchar(50) DEFAULT NULL COMMENT '地址',
  `o_pay` varchar(50) DEFAULT NULL COMMENT '支付方式',
  PRIMARY KEY (`o_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `order` */

/*Table structure for table `userinfo` */

DROP TABLE IF EXISTS `userinfo`;

CREATE TABLE `userinfo` (
  `u_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id编号',
  `u_username` varchar(20) NOT NULL DEFAULT '' COMMENT '用户名',
  `u_password` varchar(50) NOT NULL DEFAULT '' COMMENT '密码',
  `u_name` varchar(10) NOT NULL,
  `u_sex` tinyint(4) NOT NULL,
  `u_phone` varchar(11) DEFAULT NULL COMMENT '手机号码',
  `u_email` varchar(20) DEFAULT NULL COMMENT '邮箱号码',
  `u_power` int(11) NOT NULL,
  `u_adress_id` int(11) NOT NULL,
  PRIMARY KEY (`u_username`,`u_adress_id`),
  KEY `id` (`u_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `userinfo` */

insert  into `userinfo`(`u_id`,`u_username`,`u_password`,`u_name`,`u_sex`,`u_phone`,`u_email`,`u_power`,`u_adress_id`) values 
(1,'admin','admin','',0,'0000','000000000@qq.com',0,0);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
