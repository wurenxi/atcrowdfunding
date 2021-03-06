/*
 Navicat Premium Data Transfer

 Source Server         : mysql_localhost
 Source Server Type    : MySQL
 Source Server Version : 50734
 Source Host           : localhost:3306
 Source Schema         : project_crowd

 Target Server Type    : MySQL
 Target Server Version : 50734
 File Encoding         : 65001

 Date: 29/11/2021 15:40:35
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for inner_admin_role
-- ----------------------------
DROP TABLE IF EXISTS `inner_admin_role`;
CREATE TABLE `inner_admin_role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_id` int(11) NULL DEFAULT NULL,
  `role_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of inner_admin_role
-- ----------------------------
INSERT INTO `inner_admin_role` VALUES (17, 243, 237);
INSERT INTO `inner_admin_role` VALUES (18, 243, 239);
INSERT INTO `inner_admin_role` VALUES (19, 244, 238);
INSERT INTO `inner_admin_role` VALUES (20, 244, 240);

-- ----------------------------
-- Table structure for inner_role_auth
-- ----------------------------
DROP TABLE IF EXISTS `inner_role_auth`;
CREATE TABLE `inner_role_auth`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NULL DEFAULT NULL,
  `auth_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of inner_role_auth
-- ----------------------------
INSERT INTO `inner_role_auth` VALUES (9, 239, 1);
INSERT INTO `inner_role_auth` VALUES (10, 239, 8);
INSERT INTO `inner_role_auth` VALUES (11, 240, 4);
INSERT INTO `inner_role_auth` VALUES (12, 240, 5);
INSERT INTO `inner_role_auth` VALUES (13, 240, 3);

-- ----------------------------
-- Table structure for t_address
-- ----------------------------
DROP TABLE IF EXISTS `t_address`;
CREATE TABLE `t_address`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '??????',
  `receive_name` char(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '?????????',
  `phone_num` char(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '?????????',
  `address` char(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '????????????',
  `member_id` int(11) NULL DEFAULT NULL COMMENT '??????id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_address
-- ----------------------------
INSERT INTO `t_address` VALUES (1, 'tom', '188741557', '??????????????????', 1);
INSERT INTO `t_address` VALUES (2, 'jerry', '1887415157', '??????', 1);

-- ----------------------------
-- Table structure for t_admin
-- ----------------------------
DROP TABLE IF EXISTS `t_admin`;
CREATE TABLE `t_admin`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login_acct` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_pswd` char(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `login_acct`(`login_acct`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 249 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_admin
-- ----------------------------
INSERT INTO `t_admin` VALUES (1, 'tom', '$2a$10$g2EX3wFZ.IMEW7GOHxlXU.bUkp.PEhEL4XmBHisPxH3zYXk3eiV7W', '??????', 'tom@qq.com', NULL);
INSERT INTO `t_admin` VALUES (242, 'jerry', '$2a$10$AnwhwXn0JITeJJjQspGQEe9oWOYa/lwuJYMykvdRDq39z.qKUm5bG', 'jerry123', '5b693033@qq.com', '2021-11-13 18:07:06');
INSERT INTO `t_admin` VALUES (243, 'adminOperator', '$2a$10$g2EX3wFZ.IMEW7GOHxlXU.bUkp.PEhEL4XmBHisPxH3zYXk3eiV7W', 'AAOO', 'ao@qq.com', NULL);
INSERT INTO `t_admin` VALUES (244, 'roleOperator', '$2a$10$g2EX3wFZ.IMEW7GOHxlXU.bUkp.PEhEL4XmBHisPxH3zYXk3eiV7W', 'RROO', 'ro@qq.com', NULL);
INSERT INTO `t_admin` VALUES (245, 'admin01', '2222', 'admin01', 'aaa', NULL);
INSERT INTO `t_admin` VALUES (246, 'admin02', '2222', 'admin02', 'aaa', NULL);
INSERT INTO `t_admin` VALUES (247, 'admin03', '222', 'admin03', 'aaa', NULL);
INSERT INTO `t_admin` VALUES (248, 'uuu', '$2a$10$ggUvyS6AXyjmC459UFuGFOWBb4goeq4SKkknLgucdtDQ0YfqD8jSu', 'uuu', 'uuu@qq.com', '2021-11-13 21:13:00');

-- ----------------------------
-- Table structure for t_auth
-- ----------------------------
DROP TABLE IF EXISTS `t_auth`;
CREATE TABLE `t_auth`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `category_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_auth
-- ----------------------------
INSERT INTO `t_auth` VALUES (1, '', '????????????', NULL);
INSERT INTO `t_auth` VALUES (2, 'user:delete', '??????', 1);
INSERT INTO `t_auth` VALUES (3, 'user:get', '??????', 1);
INSERT INTO `t_auth` VALUES (4, '', '????????????', NULL);
INSERT INTO `t_auth` VALUES (5, 'role:delete', '??????', 4);
INSERT INTO `t_auth` VALUES (6, 'role:get', '??????', 4);
INSERT INTO `t_auth` VALUES (7, 'role:add', '??????', 4);
INSERT INTO `t_auth` VALUES (8, 'user:save', '??????', 1);

-- ----------------------------
-- Table structure for t_member
-- ----------------------------
DROP TABLE IF EXISTS `t_member`;
CREATE TABLE `t_member`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `loginacct` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `userpswd` char(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `authstatus` int(4) NULL DEFAULT NULL COMMENT '?????????????????? 0 - ??????????????????1 - ????????????????????????2 - ???????????????',
  `usertype` int(4) NULL DEFAULT NULL COMMENT '0 - ?????????1 - ??????',
  `realname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cardnum` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `accttype` int(4) NULL DEFAULT NULL COMMENT '0 - ?????????1 - ?????????2 - ?????????3 - ??????',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `loginacct`(`loginacct`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_member
-- ----------------------------
INSERT INTO `t_member` VALUES (1, 'jack', '$2a$10$i.M5NbYnWTPETJq3zUYpVuqF31I/PwJCrt7nhDgeaETOFUT6J6QGi', '??????', 'jack@qq.com', 1, 1, '??????', '123123', 2);
INSERT INTO `t_member` VALUES (2, 'jxf', '$2a$10$4QAAmiOLM1yZXml/6J1J6uTBk11E8szXPuGiD7wAPcVPtBfs8rgs6', 'jiuxiang', 'jiuxiang@qq.com', NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for t_member_confirm_info
-- ----------------------------
DROP TABLE IF EXISTS `t_member_confirm_info`;
CREATE TABLE `t_member_confirm_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `memberid` int(11) NULL DEFAULT NULL COMMENT '??????id',
  `paynum` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '?????????????????????',
  `cardnum` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '??????????????????',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_member_confirm_info
-- ----------------------------
INSERT INTO `t_member_confirm_info` VALUES (1, NULL, '1111111111111111111', 'wwwwwwwwwwwwwwwwwwwwwwwwwww');
INSERT INTO `t_member_confirm_info` VALUES (2, NULL, '11111111111111111', 'wwwwwwwwwwwwwwwwwwww');
INSERT INTO `t_member_confirm_info` VALUES (3, NULL, '11111111111111', '11111111111111111111111111');
INSERT INTO `t_member_confirm_info` VALUES (4, NULL, '11111111111111', 'qqqqqqqqqqqqqqqqqq');
INSERT INTO `t_member_confirm_info` VALUES (5, NULL, '11111111111111', 'qqqqqqqqqqqqqqqq');
INSERT INTO `t_member_confirm_info` VALUES (6, 1, '11111111111111', 'wwwwwwwwwww');

-- ----------------------------
-- Table structure for t_member_launch_info
-- ----------------------------
DROP TABLE IF EXISTS `t_member_launch_info`;
CREATE TABLE `t_member_launch_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `memberid` int(11) NULL DEFAULT NULL COMMENT '??????id',
  `description_simple` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '????????????',
  `description_detail` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '????????????',
  `phone_num` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '????????????',
  `service_num` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '????????????',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_member_launch_info
-- ----------------------------
INSERT INTO `t_member_launch_info` VALUES (1, 1, 'i am mao', '????????????', '123456', '654321');
INSERT INTO `t_member_launch_info` VALUES (2, 1, 'i am mao', '????????????', '123456', '654321');
INSERT INTO `t_member_launch_info` VALUES (3, 1, 'i am mao', '????????????', '123456', '654321');
INSERT INTO `t_member_launch_info` VALUES (4, 1, 'i am mao', '????????????', '123456', '654321');
INSERT INTO `t_member_launch_info` VALUES (5, 1, 'i am mao', '????????????', '123456', '654321');
INSERT INTO `t_member_launch_info` VALUES (6, 1, 'i am mao', '????????????', '123456', '654321');

-- ----------------------------
-- Table structure for t_menu
-- ----------------------------
DROP TABLE IF EXISTS `t_menu`;
CREATE TABLE `t_menu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NULL DEFAULT NULL,
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `icon` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_menu
-- ----------------------------
INSERT INTO `t_menu` VALUES (1, NULL, '??????????????????', NULL, 'glyphicon glyphicon-th-list');
INSERT INTO `t_menu` VALUES (2, 1, ' ???????????? ', 'main.htm', 'glyphicon glyphicon-dashboard');
INSERT INTO `t_menu` VALUES (3, 1, '????????????', NULL, 'glyphicon glyphicon glyphicon-tasks');
INSERT INTO `t_menu` VALUES (4, 3, ' ???????????? ', 'user/index.htm', 'glyphicon glyphicon-user');
INSERT INTO `t_menu` VALUES (5, 3, ' ???????????? ', 'role/index.htm', 'glyphicon glyphicon-king');
INSERT INTO `t_menu` VALUES (6, 3, ' ???????????? ', 'permission/index.htm', 'glyphicon glyphicon-lock');
INSERT INTO `t_menu` VALUES (7, 1, ' ???????????? ', NULL, 'glyphicon glyphicon-ok');
INSERT INTO `t_menu` VALUES (8, 7, ' ?????????????????? ', 'auth_cert/index.htm', 'glyphicon glyphicon-check');
INSERT INTO `t_menu` VALUES (9, 7, ' ???????????? ', 'auth_adv/index.htm', 'glyphicon glyphicon-check');
INSERT INTO `t_menu` VALUES (10, 7, ' ???????????? ', 'auth_project/index.htm', 'glyphicon glyphicon-check');
INSERT INTO `t_menu` VALUES (11, 1, ' ???????????? ', NULL, 'glyphicon glyphicon-th-large');
INSERT INTO `t_menu` VALUES (12, 11, ' ???????????? ', 'cert/index.htm', 'glyphicon glyphicon-picture');
INSERT INTO `t_menu` VALUES (13, 11, ' ???????????? ', 'certtype/index.htm', 'glyphicon glyphicon-equalizer');
INSERT INTO `t_menu` VALUES (14, 11, ' ???????????? ', 'process/index.htm', 'glyphicon glyphicon-random');
INSERT INTO `t_menu` VALUES (15, 11, ' ???????????? ', 'advert/index.htm', 'glyphicon glyphicon-hdd');
INSERT INTO `t_menu` VALUES (16, 11, ' ???????????? ', 'message/index.htm', 'glyphicon glyphicon-comment');
INSERT INTO `t_menu` VALUES (17, 11, ' ???????????? ', 'projectType/index.htm', 'glyphicon glyphicon-list');
INSERT INTO `t_menu` VALUES (18, 11, ' ???????????? ', 'tag/index.htm', 'glyphicon glyphicon-tags');
INSERT INTO `t_menu` VALUES (19, 1, ' ???????????? ', 'param/index.htm', 'glyphicon glyphicon-list-alt');

-- ----------------------------
-- Table structure for t_order
-- ----------------------------
DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '??????',
  `order_num` char(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '?????????',
  `pay_order_num` char(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '??????????????????',
  `order_amount` double(10, 5) NULL DEFAULT NULL COMMENT '????????????',
  `invoice` int(11) NULL DEFAULT NULL COMMENT '??????????????????0?????????1??????',
  `invoice_title` char(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '????????????',
  `order_remark` char(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '????????????',
  `address_id` char(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '????????????id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_order
-- ----------------------------
INSERT INTO `t_order` VALUES (1, '20211129100705FCB16B1BCA564E4E903E571C27A51376', NULL, 10.00000, 1, 'www', 'aaaa', NULL);
INSERT INTO `t_order` VALUES (2, '20211129104504F58567221E8C4BA288CDFECBF04BE280', '2021112922001448070501440089', 10.00000, 1, 'www', '11111', '2');

-- ----------------------------
-- Table structure for t_order_project
-- ----------------------------
DROP TABLE IF EXISTS `t_order_project`;
CREATE TABLE `t_order_project`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '??????',
  `project_name` char(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '????????????',
  `launch_name` char(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '?????????',
  `return_content` char(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '????????????',
  `return_count` int(11) NULL DEFAULT NULL COMMENT '????????????',
  `support_price` int(11) NULL DEFAULT NULL COMMENT '????????????',
  `freight` int(11) NULL DEFAULT NULL COMMENT '????????????',
  `order_id` int(11) NULL DEFAULT NULL COMMENT '??????????????????',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_order_project
-- ----------------------------
INSERT INTO `t_order_project` VALUES (1, 'brotherMao', 'i am mao', '????????????', 1, 10, 0, 1);
INSERT INTO `t_order_project` VALUES (2, 'brotherMao', 'i am mao', '????????????', 1, 10, 0, NULL);

-- ----------------------------
-- Table structure for t_project
-- ----------------------------
DROP TABLE IF EXISTS `t_project`;
CREATE TABLE `t_project`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '????????????',
  `project_description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '????????????',
  `money` bigint(11) NULL DEFAULT NULL COMMENT '????????????',
  `day` int(11) NULL DEFAULT NULL COMMENT '????????????',
  `status` int(4) NULL DEFAULT NULL COMMENT '0-???????????????1-????????????2-???????????????3-????????????',
  `deploydate` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '??????????????????',
  `supportmoney` bigint(11) NULL DEFAULT NULL COMMENT '?????????????????????',
  `supporter` int(11) NULL DEFAULT NULL COMMENT '????????????',
  `completion` int(3) NULL DEFAULT NULL COMMENT '??????????????????',
  `memberid` int(11) NULL DEFAULT NULL COMMENT '??????????????????id',
  `createdate` varchar(19) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '??????????????????',
  `follower` int(11) NULL DEFAULT NULL COMMENT '????????????',
  `header_picture_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '????????????',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_project
-- ----------------------------
INSERT INTO `t_project` VALUES (1, 'brotherMao', '????????????', NULL, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'http://211122atcrowdfunding.oss-cn-hangzhou.aliyuncs.com/20211125/5738f4d771614494a847711967eb322f.png');
INSERT INTO `t_project` VALUES (2, 'brotherMao123', '????????????123', NULL, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'http://211122atcrowdfunding.oss-cn-hangzhou.aliyuncs.com/20211125/94554f32cafc4f198d8e5924581df2ec.png');
INSERT INTO `t_project` VALUES (3, 'brotherMao', '????????????', NULL, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'http://211122atcrowdfunding.oss-cn-hangzhou.aliyuncs.com/20211125/d1d4fefb0f014a3aa980e39d192486d5.png');
INSERT INTO `t_project` VALUES (4, 'brotherMao', '????????????', NULL, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'http://211122atcrowdfunding.oss-cn-hangzhou.aliyuncs.com/20211125/4e98b07f4540419493f3ec645966c289.png');
INSERT INTO `t_project` VALUES (5, 'brotherMao', '????????????', NULL, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'http://211122atcrowdfunding.oss-cn-hangzhou.aliyuncs.com/20211125/b5aafd3579594a5c9b7ae6543dc2c732.png');
INSERT INTO `t_project` VALUES (6, 'brotherMao', '????????????', 100000, 30, 0, '2021-11-23', 80000, 444, NULL, 1, '2021-11-25', NULL, 'http://211122atcrowdfunding.oss-cn-hangzhou.aliyuncs.com/20211125/567fad7bafa14776b5d76f727f0e4432.png');

-- ----------------------------
-- Table structure for t_project_item_pic
-- ----------------------------
DROP TABLE IF EXISTS `t_project_item_pic`;
CREATE TABLE `t_project_item_pic`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `projectid` int(11) NULL DEFAULT NULL,
  `item_pic_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_project_item_pic
-- ----------------------------
INSERT INTO `t_project_item_pic` VALUES (1, 1, 'http://211122atcrowdfunding.oss-cn-hangzhou.aliyuncs.com/20211125/78110f565d8d448e859a3066b4aafbca.png');
INSERT INTO `t_project_item_pic` VALUES (2, 2, 'http://211122atcrowdfunding.oss-cn-hangzhou.aliyuncs.com/20211125/e799156f5ce24e12832792c22aa2d1bc.png');
INSERT INTO `t_project_item_pic` VALUES (3, 3, 'http://211122atcrowdfunding.oss-cn-hangzhou.aliyuncs.com/20211125/0ad2361007384bdfb26d6d9b49a57fe5.png');
INSERT INTO `t_project_item_pic` VALUES (4, 4, 'http://211122atcrowdfunding.oss-cn-hangzhou.aliyuncs.com/20211125/5ca1fbe0ce6744bd8c2f33a9adb0086e.png');
INSERT INTO `t_project_item_pic` VALUES (5, 5, 'http://211122atcrowdfunding.oss-cn-hangzhou.aliyuncs.com/20211125/fbdc6efa02874a27ac8798cb81d748e2.png');
INSERT INTO `t_project_item_pic` VALUES (6, 6, 'http://211122atcrowdfunding.oss-cn-hangzhou.aliyuncs.com/20211125/41cf6854d41d44e7bd8bafde0e92175e.png');

-- ----------------------------
-- Table structure for t_project_tag
-- ----------------------------
DROP TABLE IF EXISTS `t_project_tag`;
CREATE TABLE `t_project_tag`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `projectid` int(11) NULL DEFAULT NULL,
  `tagid` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_project_tag
-- ----------------------------
INSERT INTO `t_project_tag` VALUES (1, 1, 6);
INSERT INTO `t_project_tag` VALUES (2, 1, 8);
INSERT INTO `t_project_tag` VALUES (3, 1, 10);
INSERT INTO `t_project_tag` VALUES (4, 2, 5);
INSERT INTO `t_project_tag` VALUES (5, 2, 8);
INSERT INTO `t_project_tag` VALUES (6, 2, 10);
INSERT INTO `t_project_tag` VALUES (7, 3, 5);
INSERT INTO `t_project_tag` VALUES (8, 3, 8);
INSERT INTO `t_project_tag` VALUES (9, 3, 10);
INSERT INTO `t_project_tag` VALUES (10, 4, 6);
INSERT INTO `t_project_tag` VALUES (11, 4, 8);
INSERT INTO `t_project_tag` VALUES (12, 4, 10);
INSERT INTO `t_project_tag` VALUES (13, 5, 6);
INSERT INTO `t_project_tag` VALUES (14, 5, 8);
INSERT INTO `t_project_tag` VALUES (15, 5, 10);
INSERT INTO `t_project_tag` VALUES (16, 6, 6);
INSERT INTO `t_project_tag` VALUES (17, 6, 8);
INSERT INTO `t_project_tag` VALUES (18, 6, 10);

-- ----------------------------
-- Table structure for t_project_type
-- ----------------------------
DROP TABLE IF EXISTS `t_project_type`;
CREATE TABLE `t_project_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `projectid` int(11) NULL DEFAULT NULL,
  `typeid` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_project_type
-- ----------------------------
INSERT INTO `t_project_type` VALUES (1, 1, 2);
INSERT INTO `t_project_type` VALUES (2, 1, 4);
INSERT INTO `t_project_type` VALUES (3, 2, 2);
INSERT INTO `t_project_type` VALUES (4, 2, 4);
INSERT INTO `t_project_type` VALUES (5, 3, 2);
INSERT INTO `t_project_type` VALUES (6, 3, 4);
INSERT INTO `t_project_type` VALUES (7, 4, 2);
INSERT INTO `t_project_type` VALUES (8, 4, 4);
INSERT INTO `t_project_type` VALUES (9, 5, 2);
INSERT INTO `t_project_type` VALUES (10, 5, 4);
INSERT INTO `t_project_type` VALUES (11, 6, 2);
INSERT INTO `t_project_type` VALUES (12, 6, 4);

-- ----------------------------
-- Table structure for t_return
-- ----------------------------
DROP TABLE IF EXISTS `t_return`;
CREATE TABLE `t_return`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `projectid` int(11) NULL DEFAULT NULL,
  `type` int(4) NULL DEFAULT NULL COMMENT '0-???????????????1-??????????????????',
  `supportmoney` int(11) NULL DEFAULT NULL COMMENT '????????????',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '????????????',
  `count` int(11) NULL DEFAULT NULL COMMENT '????????????????????????0????????????????????????',
  `signalpurchase` int(11) NULL DEFAULT NULL COMMENT '????????????????????????',
  `purchase` int(11) NULL DEFAULT NULL COMMENT '??????????????????',
  `freight` int(11) NULL DEFAULT NULL COMMENT '????????????0????????????',
  `invoice` int(4) NULL DEFAULT NULL COMMENT '0-???????????????1-?????????',
  `returndate` int(11) NULL DEFAULT NULL COMMENT '????????????????????????????????????????????????',
  `describ_pic_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '??????????????????',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_return
-- ----------------------------
INSERT INTO `t_return` VALUES (1, 1, 0, 111, 'sfsaac', 9, NULL, 8, 0, 1, 15, NULL);
INSERT INTO `t_return` VALUES (2, 1, 0, 2222, 'fregsewdsc', 9, 0, 8, 0, 1, 15, NULL);
INSERT INTO `t_return` VALUES (3, 2, 0, 111, '????????????', 5, 1, 8, 0, 0, 15, 'http://211122atcrowdfunding.oss-cn-hangzhou.aliyuncs.com/20211125/92b8883c04c647088cfedda5b89be7d8.png');
INSERT INTO `t_return` VALUES (4, 3, 0, 10, '????????????', 5, 1, 8, 0, NULL, 15, NULL);
INSERT INTO `t_return` VALUES (5, 4, 0, 10, '????????????', 5, 1, 8, 0, NULL, 15, NULL);
INSERT INTO `t_return` VALUES (6, 5, 0, 10, '????????????', 5, NULL, 8, 0, NULL, 15, 'http://211122atcrowdfunding.oss-cn-hangzhou.aliyuncs.com/20211125/47a0b88f735b424298d30998082bb876.png');
INSERT INTO `t_return` VALUES (7, 6, 1, 10, '????????????', 5, 1, 8, 0, NULL, 15, NULL);

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 241 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES (237, '??????');
INSERT INTO `t_role` VALUES (238, '??????');
INSERT INTO `t_role` VALUES (239, '???????????????');
INSERT INTO `t_role` VALUES (240, '???????????????');

-- ----------------------------
-- Table structure for t_tag
-- ----------------------------
DROP TABLE IF EXISTS `t_tag`;
CREATE TABLE `t_tag`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_tag
-- ----------------------------

-- ----------------------------
-- Table structure for t_type
-- ----------------------------
DROP TABLE IF EXISTS `t_type`;
CREATE TABLE `t_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '????????????',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '????????????',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_type
-- ----------------------------
INSERT INTO `t_type` VALUES (1, '??????', '??????????????????');
INSERT INTO `t_type` VALUES (2, '??????', '??????????????????');
INSERT INTO `t_type` VALUES (3, '??????', '??????????????????');
INSERT INTO `t_type` VALUES (4, '??????', '??????????????????');

SET FOREIGN_KEY_CHECKS = 1;
