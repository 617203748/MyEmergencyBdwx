/*
Navicat MySQL Data Transfer

Source Server         : MySql
Source Server Version : 50634
Source Host           : localhost:3306
Source Database       : taxi

Target Server Type    : MYSQL
Target Server Version : 50634
File Encoding         : 65001

Date: 2017-08-07 17:14:53
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_admin`
-- ----------------------------
DROP TABLE IF EXISTS `t_admin`;
CREATE TABLE `t_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '管理员 ID',
  `admin_username` varchar(50) DEFAULT '' COMMENT '用户名',
  `admin_password` varchar(50) DEFAULT '' COMMENT '密码',
  `admin_name` varchar(50) DEFAULT '' COMMENT '姓名',
  `admin_telphone` varchar(50) DEFAULT '' COMMENT '手机号',
  `admin_qq` varchar(50) DEFAULT '' COMMENT 'QQ',
  `admin_mail` varchar(50) DEFAULT '' COMMENT '邮箱',
  `admin_level` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_admin
-- ----------------------------
INSERT INTO `t_admin` VALUES ('1', 'superadmin', 'bleach', '超级管理员', '18135110832', '617203748', '617203748@qq.com', '1');

-- ----------------------------
-- Table structure for `t_bi_order`
-- ----------------------------
DROP TABLE IF EXISTS `t_bi_order`;
CREATE TABLE `t_bi_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `day` date NOT NULL DEFAULT '0000-00-00',
  `applyTotal` smallint(6) DEFAULT '0',
  `applySuccess` smallint(6) DEFAULT '0',
  `applyFailed` smallint(6) DEFAULT '0',
  `applyWait` smallint(6) DEFAULT '0',
  `orderTotal` smallint(6) DEFAULT '0',
  `orderSuccess` smallint(6) DEFAULT '0',
  `orderWait` smallint(6) DEFAULT '0',
  `orderFailed` smallint(6) DEFAULT '0',
  `totalFee` float DEFAULT '0',
  `city_code` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_bi_order
-- ----------------------------
INSERT INTO `t_bi_order` VALUES ('1', '2017-07-07', '0', '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `t_bi_order` VALUES ('2', '2017-07-06', '0', '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `t_bi_order` VALUES ('3', '2017-07-05', '0', '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `t_bi_order` VALUES ('4', '2017-07-04', '0', '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `t_bi_order` VALUES ('5', '2017-07-03', '0', '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `t_bi_order` VALUES ('6', '2017-07-02', '0', '0', '0', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `t_bi_order` VALUES ('7', '2017-07-01', '0', '0', '0', '0', '0', '0', '0', '0', '0', null);

-- ----------------------------
-- Table structure for `t_despire`
-- ----------------------------
DROP TABLE IF EXISTS `t_despire`;
CREATE TABLE `t_despire` (
  `despire_id` int(11) NOT NULL DEFAULT '0',
  `order_id` int(11) NOT NULL DEFAULT '-1',
  `user_id` int(11) NOT NULL DEFAULT '-1',
  `who_user_id` int(11) NOT NULL DEFAULT '-1' COMMENT '猜人者id',
  `who_lon` varchar(255) NOT NULL DEFAULT '-1',
  `who_lat` varchar(255) NOT NULL DEFAULT '-1',
  `is_commit` int(11) NOT NULL DEFAULT '-1',
  `time_frozen` varchar(255) NOT NULL DEFAULT '-1',
  `time_unlock` varchar(255) NOT NULL DEFAULT '-1',
  `time_create` varchar(255) NOT NULL DEFAULT '-1',
  `time_update` varchar(255) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`despire_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_despire
-- ----------------------------

-- ----------------------------
-- Table structure for `t_institution`
-- ----------------------------
DROP TABLE IF EXISTS `t_institution`;
CREATE TABLE `t_institution` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_institution
-- ----------------------------
INSERT INTO `t_institution` VALUES ('5', '第一条', '定位不准找石家庄飞歌经销商修机器');
INSERT INTO `t_institution` VALUES ('6', '第二条', '内容');
INSERT INTO `t_institution` VALUES ('7', '第三条', '内容');
INSERT INTO `t_institution` VALUES ('8', '第四条', '测试内容');
INSERT INTO `t_institution` VALUES ('9', '第五条', '乘客爽约直接封号');

-- ----------------------------
-- Table structure for `t_missuser`
-- ----------------------------
DROP TABLE IF EXISTS `t_missuser`;
CREATE TABLE `t_missuser` (
  `missuser_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '-1',
  `order_id` int(11) NOT NULL DEFAULT '-1',
  `time_frozen` varchar(255) NOT NULL DEFAULT '-1',
  `time_unlock` varchar(255) NOT NULL DEFAULT '-1',
  `time_create` varchar(255) NOT NULL DEFAULT '-1',
  `time_update` varchar(255) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`missuser_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_missuser
-- ----------------------------

-- ----------------------------
-- Table structure for `t_order`
-- ----------------------------
DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单号',
  `serialnumber` int(11) NOT NULL DEFAULT '-1' COMMENT '当日订单串号',
  `tel_passenger` varchar(255) NOT NULL DEFAULT '-1' COMMENT '乘客手机号',
  `voice` varchar(255) NOT NULL DEFAULT '-1' COMMENT '录音文件路径',
  `is_push` int(11) NOT NULL DEFAULT '-1' COMMENT '是否推送了 0否 1是',
  `user_id` int(11) NOT NULL DEFAULT '-1' COMMENT '抢单司机id',
  `lon` varchar(255) NOT NULL DEFAULT '-1' COMMENT '接单位置',
  `lat` varchar(255) NOT NULL DEFAULT '-1' COMMENT '接单位置',
  `timecha` varchar(11) NOT NULL DEFAULT '-1' COMMENT '听单后几秒接单',
  `time_create` varchar(255) NOT NULL DEFAULT '-1' COMMENT '创建时间',
  `time_update` varchar(255) NOT NULL DEFAULT '-1' COMMENT '修改时间',
  PRIMARY KEY (`order_id`,`user_id`),
  KEY `order_createtime` (`time_create`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_order
-- ----------------------------
INSERT INTO `t_order` VALUES ('1', '1', '018135110832', '/2017-08-07/111.amr', '1', '-1', '-1', '-1', '-1', '2017-08-07 14:19:50', '2017-08-07 14:19:50');
INSERT INTO `t_order` VALUES ('2', '2', '018135110832', '/2017-08-07/111.amr', '1', '-1', '-1', '-1', '-1', '2017-08-07 14:22:29', '2017-08-07 14:22:29');
INSERT INTO `t_order` VALUES ('3', '3', '018135110832', '/2017-08-07/111.amr', '1', '-1', '-1', '-1', '-1', '2017-08-07 16:25:36', '2017-08-07 16:25:36');
INSERT INTO `t_order` VALUES ('4', '4', '018135110832', '/2017-08-07/111.amr', '1', '-1', '-1', '-1', '-1', '2017-08-07 16:26:10', '2017-08-07 16:26:10');
INSERT INTO `t_order` VALUES ('5', '5', '018135110832', '/2017-08-07/111.amr', '1', '-1', '-1', '-1', '-1', '2017-08-07 16:26:10', '2017-08-07 16:26:30');
INSERT INTO `t_order` VALUES ('6', '6', '018135110832', '/2017-08-07/111.amr', '1', '-1', '-1', '-1', '-1', '2017-08-07 16:26:10', '2017-08-07 16:26:50');
INSERT INTO `t_order` VALUES ('7', '7', '018135110832', '/2017-08-07/111.amr', '1', '-1', '-1', '-1', '-1', '2017-08-07 16:26:11', '2017-08-07 16:27:10');
INSERT INTO `t_order` VALUES ('8', '8', '018135110832', '/2017-08-07/111.amr', '1', '-1', '-1', '-1', '-1', '2017-08-07 16:26:11', '2017-08-07 16:27:30');
INSERT INTO `t_order` VALUES ('9', '9', '018135110832', '/2017-08-07/111.amr', '1', '-1', '-1', '-1', '-1', '2017-08-07 16:26:11', '2017-08-07 16:27:50');
INSERT INTO `t_order` VALUES ('10', '10', '018135110832', '/2017-08-07/111.amr', '1', '-1', '-1', '-1', '-1', '2017-08-07 16:26:17', '2017-08-07 16:28:10');

-- ----------------------------
-- Table structure for `t_position`
-- ----------------------------
DROP TABLE IF EXISTS `t_position`;
CREATE TABLE `t_position` (
  `position_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '-1',
  `lat` varchar(255) NOT NULL DEFAULT '-1',
  `lon` varchar(255) NOT NULL DEFAULT '-1',
  `time_create` varchar(255) NOT NULL DEFAULT '-1',
  `time_update` varchar(255) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`position_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_position
-- ----------------------------

-- ----------------------------
-- Table structure for `t_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `carlicense` varchar(255) NOT NULL DEFAULT '-1',
  `realname` varchar(255) NOT NULL DEFAULT '-1',
  `tel` varchar(255) NOT NULL DEFAULT '-1',
  `username` varchar(255) NOT NULL DEFAULT '-1',
  `password` varchar(255) NOT NULL DEFAULT '-1',
  `company` varchar(255) NOT NULL DEFAULT '-1',
  `type` int(11) NOT NULL DEFAULT '-1' COMMENT '0无平台 1手机 2车载',
  `num_today` int(11) NOT NULL DEFAULT '-1',
  `num_totle` int(11) NOT NULL DEFAULT '-1',
  `bind_device` varchar(255) NOT NULL DEFAULT '-1' COMMENT '绑定的设备',
  `bind_rongyun` varchar(255) NOT NULL DEFAULT '-1' COMMENT '融云token',
  `time_create` varchar(255) NOT NULL DEFAULT '-1',
  `time_update` varchar(255) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`user_id`,`carlicense`)
) ENGINE=InnoDB AUTO_INCREMENT=890 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('888', '晋AQQ444', '张忠政', '18135110832', '18135110832', '123456', '其他', '1', '0', '12', '', '', '1497121006', '1497121006');
INSERT INTO `t_user` VALUES ('889', '晋AQQ555', '张国平', '15343406720', '15343406720', '123456', '其他', '1', '0', '4', '', '', '1497121006', '1497121006');

-- ----------------------------
-- Table structure for `t_user_np`
-- ----------------------------
DROP TABLE IF EXISTS `t_user_np`;
CREATE TABLE `t_user_np` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `carlicense` varchar(255) DEFAULT '',
  `realname` varchar(255) DEFAULT '',
  `tel` varchar(255) DEFAULT '',
  `tel_unicom` varchar(255) DEFAULT '',
  `password` varchar(255) NOT NULL DEFAULT '',
  `despire_id` int(11) DEFAULT '0',
  `company` varchar(255) DEFAULT '',
  `type` int(11) DEFAULT '0' COMMENT '0无平台 1手机 2车载',
  `num_today` int(11) DEFAULT '0',
  `num_totle` int(11) DEFAULT '0',
  `deviceId` varchar(255) DEFAULT '',
  `token` varchar(255) DEFAULT '',
  `time_frozen` varchar(255) DEFAULT '',
  `time_unlock` varchar(255) DEFAULT '',
  `rongyun_token` varchar(255) DEFAULT '-1',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=890 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user_np
-- ----------------------------
INSERT INTO `t_user_np` VALUES ('1', '冀JCG853', '赵建峰', '15231754166', '18632729002', '754166ym', '0', '沧运集团', '2', '0', '0', '861012034355795', '63f4f617a71d099f8aac956cb4189d2b', '', '', 'qS3h/lM40MAQSv/8A+7xpul0xcjFVEywoPcu4eTFAKaZcY+swFl2ybREdrXk6l2D4NLudjfSlowToDJ0pfkqllLp0mDJxRFZ');
INSERT INTO `t_user_np` VALUES ('2', '冀JBW792', '王振', '13463171738', '', '123456', '0', '沧运集团', '0', '0', '0', '', 'e1848d0c71c080c122168e8cbbfee52a', '', '', '');
INSERT INTO `t_user_np` VALUES ('3', '冀JBU765', '肖红普', '13931712752', '', '123456', '0', '沧运集团', '0', '0', '0', '', 'e1848d0c71c080c122168e8cbbfee52a', '', '', '');
INSERT INTO `t_user_np` VALUES ('4', '冀JBW783', '李炳瑞', '18730729515', '', '123456', '0', '沧运集团', '0', '0', '0', '', 'e1848d0c71c080c122168e8cbbfee52a', '', '', '');
INSERT INTO `t_user_np` VALUES ('5', '冀JBS535', '李秋林', '15076773296', '18632727653', '123456', '0', '沧运集团', '3', '1', '40', '869654013008077', '43b1bc7cc6f6f300264108e11129330e', '', '', 'QAtGMbDFgE4Fjg+ZgTk4n/hYfPELNhbtAGGi7mVAQFI7Agc/wV5bdIw8glWsxw/vA+O1KL1uZQC3G4XGxScjQQDYshGHe/Mb');
INSERT INTO `t_user_np` VALUES ('6', '冀J3577F', '齐延成', '13393384951', '18631799792', '529243', '0', '沧运集团', '3', '4', '219', '869654012727230', 'bf174c80beb11679ac6b3a9de5147104', '', '', '4UTAE8ZG0mK7LbdoPZorC/hYfPELNhbtAGGi7mVAQFI7Agc/wV5bdK65QZE7FSXxG+qnjnquq9opGW9U3ujk9FZDPTFnCW6w');
INSERT INTO `t_user_np` VALUES ('7', '冀JCG931', '周庆霞', '15031770552', '13180300350', '123456', '0', '沧运集团', '3', '0', '85', '869654013165661', 'bb3e492ebd731c454224bb88c074edc0', '', '', '5NPrm5aS+ck7A+Cx5MYWn0aUFUBfyqzjlnEW8dotaIjwONoFiYDjap1nfSfUyVUkWEbtZnqwWO9piMHccu1imCW2S1Tz3kh7');
INSERT INTO `t_user_np` VALUES ('8', '冀JBS303', '于石刚', '13463748997', '18632727715', '123456', '0', '沧运集团', '4', '1', '302', '869654012697219', '37a03d54a598395d4a94aafac77767a1', '', '', 'tKXv18LoxTlb/tbQ34RF0PhYfPELNhbtAGGi7mVAQFI7Agc/wV5bdMMxXzN/38v/G+qnjnquq9ogseumuzyewKaXcdDSiqo2');
INSERT INTO `t_user_np` VALUES ('9', '冀JBS592', '刘广强', '13932755897', '18632728081', '1976', '0', '沧运集团', '3', '6', '318', '869654012696708', '381fe46ac8b772abf4c4f9ed566a75c1', '', '', 'JtRhjkshSEBLyaN5AQWhevhYfPELNhbtAGGi7mVAQFI7Agc/wV5bdOp5mlpKmSj6rtRIxKT7QbjE0c5Gh1AAtfzUiII1owow');
INSERT INTO `t_user_np` VALUES ('10', '冀J7013F', '蔡红星', '13633370243', '18632729731', '123456', '0', '沧运集团', '3', '2', '110', '869654013254655', 'eab8cb306556189e57f475b82a709876', '', '', 'ps6u1QbmBJC2SJwmZqY+AfhYfPELNhbtAGGi7mVAQFL1ctwYttAWXiXgEuurDza1IwDI3Enyh6hhN+h7rDGLeBQb7MRTdijI');
INSERT INTO `t_user_np` VALUES ('11', '冀JBU780', '崔志国', '13784156825', '18632727680', '123456', '0', '沧运集团', '3', '0', '0', '869654012697227', '812b967f5b4d38acbbf74ee1bf6a028b', '', '', 'HG71ifwXbgyrZ5KaJlfUREaUFUBfyqzjlnEW8dotaIjsK2t856wMY8byMqoA9Zi5P+XtAx3uuB/TlXgLWVpAbQxDsfq07UMM');
INSERT INTO `t_user_np` VALUES ('12', '冀JBS517', '张春华', '15127737348', '', '123456', '0', '沧运集团', '0', '0', '0', '', 'e1848d0c71c080c122168e8cbbfee52a', '', '', '');
INSERT INTO `t_user_np` VALUES ('13', '冀JCM953', '董福仓', '13333072162', '', '123456', '0', '沧运集团', '0', '0', '0', '', 'e1848d0c71c080c122168e8cbbfee52a', '', '', '');
INSERT INTO `t_user_np` VALUES ('14', '冀JBS317', '付立军', '13473712298', '', '', '0', '沧运集团', '0', '0', '0', '', '4f591b3c7145db6faaaf2e3cefc4d242', '', '', '');
INSERT INTO `t_user_np` VALUES ('15', '冀JBS351', '张兵兵', '13785721529', '18632729180', '123456', '0', '沧运集团', '3', '0', '11', '869654012787507', 'c01b4a80b0ce2969b24559784083c61d', '', '', 'aprYuVcWf/GDnkqp4FZHFvhYfPELNhbtAGGi7mVAQFI7Agc/wV5bdCvDlBJCpwrxrtRIxKT7Qbh8eBmTfsKBk7a9LrzcZxtD');
INSERT INTO `t_user_np` VALUES ('16', '冀JBU772', '催志杰', '13830774467', '', '123456', '0', '沧运集团', '0', '0', '0', '', 'e1848d0c71c080c122168e8cbbfee52a', '', '', '');
INSERT INTO `t_user_np` VALUES ('17', '冀JCJ512', '梁彬', '13930700811', '18632729511', '123456', '0', '沧运集团', '6', '9', '390', '869654012727537', 'aca93e83aecac8b5edbe72a103e05218', '2017-06-30 23:42:16', '2017-07-03 23:42:16', 'EdlKzT657WUV+XOR4p4mkUaUFUBfyqzjlnEW8dotaIi+d5jwRWokxGo0vuV24TCPP+XtAx3uuB/B2hrqP8o0/U2DuEO24Bmc');
INSERT INTO `t_user_np` VALUES ('18', '冀JBS581', '柴红霞', '18931783289', '18632727822', '123456', '0', '沧运集团', '4', '7', '320', '869654012697136', '9d09fcc890143868a797207facdc8473', '', '', '2y7VuBJrkJHCxUwfy3KSlEaUFUBfyqzjlnEW8dotaIic6p0gxa0yRH3kM6jvprGrP+XtAx3uuB+w038WdPIrpG1Krq3HwRrH');
INSERT INTO `t_user_np` VALUES ('19', '冀JBS583', '高桂波', '15131703499', '13166562793', '123456', '0', '沧运集团', '4', '12', '489', '869654012695320', '3f9006aeafdbdc1c68d8e8f326890386', '', '', 'gp/Mfz08k3NNmKidoPwi3EaUFUBfyqzjlnEW8dotaIic6p0gxa0yRHBz6tTsU2mys83bVL1SY/DP3qJYOyJ1Uqs6Ab2PxSHn');
INSERT INTO `t_user_np` VALUES ('20', '冀J267QV', '刘兵', '13315709272', '', '123456', '0', '沧运集团', '0', '0', '0', '', 'e1848d0c71c080c122168e8cbbfee52a', '', '', '');
INSERT INTO `t_user_np` VALUES ('21', '冀JBS381', '范增树', '13111756879', '', '123456', '0', '沧运集团', '0', '0', '0', '', 'e1848d0c71c080c122168e8cbbfee52a', '', '', '');
INSERT INTO `t_user_np` VALUES ('22', '冀JBS312', '董艳忠', '13231721225', '', '123456', '0', '沧运集团', '0', '0', '0', '', 'e1848d0c71c080c122168e8cbbfee52a', '', '', '');
INSERT INTO `t_user_np` VALUES ('23', '冀J6356W', '周永财', '18232747339', '18632728200', '123456', '0', '沧运集团', '3', '5', '179', '869654013007202', '1c586b89152ad1562206d89a0d013eff', '', '', 'drq+CIxViAPfPxN2qIu6VkaUFUBfyqzjlnEW8dotaIic6p0gxa0yRLJ8aGV2PAdSP+XtAx3uuB///VgtfllBLwxDsfq07UMM');
INSERT INTO `t_user_np` VALUES ('24', '冀JBS582', '杨士忠', '13833729061', '18632728020', '729061', '0', '沧运集团', '4', '2', '113', '869654012696393', '8a266c9573819073da44c7b42fb53099', '', '', 's5MFiLSTGPjOWTrI9RRsyfhYfPELNhbtAGGi7mVAQFI7Agc/wV5bdNjbBc67i7eF1564ZM7yIOvE0c5Gh1AAtT0JWc0LBEEg');
INSERT INTO `t_user_np` VALUES ('25', '冀JCH725', '杨国刚', '13011993862', '13166562931', '123456', '0', '沧运集团', '4', '0', '36', '869654013007715', 'a7357e2c0e0ef12221ad029a7208a866', '', '', 'D7Z1myKddd47A+Cx5MYWn0aUFUBfyqzjlnEW8dotaIic6p0gxa0yRO+9jFAfNyUws83bVL1SY/DOrIm+VTvQ4XL0Ganetrv1');
INSERT INTO `t_user_np` VALUES ('26', '冀JBS331', '张均鹏', '15127724656', '18632727833', '995276', '0', '沧运集团', '4', '1', '356', '869654012696401', '0293777b34f2824c4d000a98f96ac029', '2017-07-03 10:32:53', '2017-07-06 10:32:53', 'NlgjUGJweH2rZ5KaJlfUREaUFUBfyqzjlnEW8dotaIic6p0gxa0yRBJzT/hcyWqUP+XtAx3uuB+w038WdPIrpFlh1C+4Pdsa');
INSERT INTO `t_user_np` VALUES ('27', '冀JBS510', '田洪民', '15731776332', '18632729297', '719920', '0', '沧运集团', '4', '0', '117', '869654012727222', '10bbbe6c838d04799bc9c7f981566aa7', '', '', 'NxHhnOA4IxVN8M9tn2oHgPhYfPELNhbtAGGi7mVAQFI7Agc/wV5bdGS2XBxu77sTG+qnjnquq9pwOO1ILHZa34rFPsSNdlyS');
INSERT INTO `t_user_np` VALUES ('28', '冀J8112D', '许伟', '13513496986', '18632727623', '123456', '0', '沧运集团', '4', '10', '437', '869654012644567', '18de0aac21976ea17ce9e22b8300c425', '2017-06-29 22:58:34', '2017-07-02 22:58:34', 'RwbMsynJPan+nentpjexSfhYfPELNhbtAGGi7mVAQFI7Agc/wV5bdEcdpUogXHsy5T7F7au1frW3G4XGxScjQaOAk3LBE4QH');
INSERT INTO `t_user_np` VALUES ('29', '冀JBS327', '齐遵先', '18713795789', '18632729587', '123456', '0', '沧运集团', '3', '4', '211', '869654013254671', '3a832a8d79d6b1b2ae5bef68090a6234', '2017-07-03 10:41:39', '2017-07-06 10:41:39', 'Pmzts8pjLwy6l0zHXc38NvhYfPELNhbtAGGi7mVAQFI7Agc/wV5bdFuWlFLuocfeT8sZjq/m1gWZeb+aAlaZaNCTmHuWcVAd');
INSERT INTO `t_user_np` VALUES ('30', '冀JBS370', '杨占松', '13231721872', '18632728370', '123456', '0', '沧运集团', '3', '0', '0', '869654012695551', '6f6cf33866cd156e79af74c364fe63b4', '', '', 'ojLZ3M6lNyZY4lgaq/zfM0aUFUBfyqzjlnEW8dotaIjsK2t856wMY7yBhy+iOlGrP+XtAx3uuB9oHUWWFwShXte1h1OsneDW');
INSERT INTO `t_user_np` VALUES ('31', '冀JBW705', '郭智红', '13313375816', '', '123456', '0', '沧运集团', '0', '0', '0', '', 'e1848d0c71c080c122168e8cbbfee52a', '', '', '');
INSERT INTO `t_user_np` VALUES ('32', '冀JNE365', '刘建树', '18632727738', '18632727738', '123456', '0', '沧运集团', '4', '4', '184', '869654012695593', 'd19ca1e771ff57b33475b9353eb89ea9', '2017-06-26 16:05:29', '2017-06-29 16:05:29', 'W/mgu+QRzJjCxUwfy3KSlEaUFUBfyqzjlnEW8dotaIic6p0gxa0yRCKRWBZflMktP+XtAx3uuB9rMhMsWYDsqzkzed7cGHqF');
INSERT INTO `t_user_np` VALUES ('33', '冀JCG713', '周振海', '13011987097', '13111711380', '123456', '0', '沧运集团', '3', '9', '137', '869654013007228', 'ac0745c59f7cc9158b85b112f1105c04', '2017-06-06 08:35:34', '2017-06-09 08:35:34', 's7/aRgwzKYlQt/DEj5YXFul0xcjFVEywoPcu4eTFAKaZcY+swFl2yfZDIrPSi0V/DYsEqHjnUkAkGrWeCxtdL/6U3wk/Y900');
INSERT INTO `t_user_np` VALUES ('34', '冀JBW736', '赵桂生', '15931718546', '18632727990', '8732839', '0', '沧运集团', '3', '2', '426', '869654012696666', 'f7979b37619fa1c964b820687eb13882', '', '', 'mep7IQmBU9KtuO93eis9V+l0xcjFVEywoPcu4eTFAKaZcY+swFl2yTJu1VhyxQZLeHX6w38F4HidH632szWbeTPq5RxAp0Db');
INSERT INTO `t_user_np` VALUES ('35', '冀JBS362', '郭玉慧', '13832769710', '18632727705', '123456', '0', '沧运集团', '4', '5', '92', '869654012696203', '0ca444711582d1f3097c1e79595ef568', '', '', '0PWxC8+rXDTxC+5mpwhGdPhYfPELNhbtAGGi7mVAQFI7Agc/wV5bdCjtXDkLhVhF1564ZM7yIOsgseumuzyewIvs55ndY1NX');
INSERT INTO `t_user_np` VALUES ('36', '冀JCJ673', '刘光正', '13931794568', '15613789225', '123456', '0', '沧运集团', '3', '2', '7', '869654013254366', '20f4ef7026f8d05614b0a9ec61110e7a', '', '', 'yvHNOqwVtKnadDJ5ZxzkW/hYfPELNhbtAGGi7mVAQFLNwhjOlUgVEIFE+2FHiptyADnGwlGeSLpdYhaKKTJdrFX10LUo56oP');
INSERT INTO `t_user_np` VALUES ('37', '冀JBU332', '董风贤', '13931794568', '18632729022', '123456', '0', '沧运集团', '3', '10', '362', '869654013165430', '21ebea6b1784b6e9298dc1a98e5af50d', '2017-06-11 10:06:22', '2017-06-14 10:06:22', 'aKEu4RjS229sFLv87t1Jnul0xcjFVEywoPcu4eTFAKaZcY+swFl2ye8pvpPZ6Z8XBx4ndxD1IiAToDJ0pfkqlnKuDQCCMdWt');
INSERT INTO `t_user_np` VALUES ('38', '冀JCK215', '贾利娜', '13931767945', '', '123456', '0', '沧运集团', '0', '0', '0', '', 'e1848d0c71c080c122168e8cbbfee52a', '', '', '');
INSERT INTO `t_user_np` VALUES ('39', '冀JCG723', '王文胜', '15832700400', '', '123456', '0', '沧运集团', '0', '0', '0', '', 'e1848d0c71c080c122168e8cbbfee52a', '', '', '');
INSERT INTO `t_user_np` VALUES ('40', '冀JCJ651', '张森栋', '13131729386', '18632728586', '123456', '0', '沧运集团', '5', '0', '7', '869654012726976', '14a697b3536a29ddd60c7feede2c529e', '2017-06-22 08:55:21', '2017-06-25 08:55:21', 'QM/NKIzXqX6nIw3A8i6OgfhYfPELNhbtAGGi7mVAQFL1ctwYttAWXvz8natlLhJ21564ZM7yIOut+KXqSp/yS9VQdIE7sgQe');
INSERT INTO `t_user_np` VALUES ('41', '冀JCG935', '靳彦才', '13785716582', '18632727997', '197588', '0', '沧运集团', '5', '4', '121', '869654012696385', '150a16ea5ccb16bea79edcfca98e780e', '', '', 'YVBidnPG4bbthyizB8HjI+l0xcjFVEywoPcu4eTFAKaZcY+swFl2ya/3g560kNMJItSPTNavdwOdH632szWbebzDDc7QLBrT');
INSERT INTO `t_user_np` VALUES ('42', '冀JCG725', '马晓冬', '13111755175', '18632727911', '123456', '0', '沧运集团', '4', '2', '53', '869654013007806', 'abec51fd2f8587610673a066b819ad45', '', '', 'B6f0aAdC/ICimzDk8HdZdUaUFUBfyqzjlnEW8dotaIic6p0gxa0yRBmsOPJJ4UdxP+XtAx3uuB+pQNFByjy0TU2DuEO24Bmc');
INSERT INTO `t_user_np` VALUES ('43', '冀JCG951', '代士升', '13780271584', '18632728951', '197231', '0', '沧运集团', '4', '0', '29', '869654012695338', 'cd93ec119275bc845b892221c46903b1', '', '', '4OrCKHhKKP5NmKidoPwi3EaUFUBfyqzjlnEW8dotaIic6p0gxa0yRHkqCwQAPs4/P+XtAx3uuB8kj3vLKOIwyE2DuEO24Bmc');
INSERT INTO `t_user_np` VALUES ('44', '冀JCJ625', '胡长海', '13932792248', '18632727638', '831411', '0', '沧运集团', '3', '1', '211', '869654012696468', 'f13b593fefc13d0bb8422c7261df84e1', '', '', 'gDDNvyas16TxzeT6fswH5PhYfPELNhbtAGGi7mVAQFI7Agc/wV5bdGQVy+hMb6QvU/PoLrY5KRO3G4XGxScjQSCiBsDT33xB');
INSERT INTO `t_user_np` VALUES ('45', '冀JCM937', '史洪利', '15833366399', '18631713873', '123456', '0', '沧运集团', '3', '2', '212', '869654012695312', '5887d71d6bffbcfceb4d2f5176407673', '', '', 'vZTx+rNcx4AMSyo2/cbzcOl0xcjFVEywoPcu4eTFAKaZcY+swFl2yWIuuuYskT3sO/wTBAY3IJlwS8od7Cbi/moMMXBAvtr0');
INSERT INTO `t_user_np` VALUES ('46', '冀JCH053', '侯松树', '13231707982', '18632728730', '123456', '0', '沧运集团', '3', '2', '222', '869654012727305', '05533bed8b9a9e85f4048f41a6d695f9', '', '', 'onRKqJ7mPWfCxUwfy3KSlEaUFUBfyqzjlnEW8dotaIic6p0gxa0yRB8QF3FS9V5IP+XtAx3uuB/AHNbRaJNCvte1h1OsneDW');
INSERT INTO `t_user_np` VALUES ('47', '冀JCE103', '郭建国', '18731713328', '18632728552', '123456', '0', '沧运集团', '3', '9', '213', '869654013008150', 'a49c9d12296c87ee13b610153feb18d6', '2017-06-18 07:37:28', '2017-06-21 07:37:28', '9zUNAH2GHUE7A+Cx5MYWn0aUFUBfyqzjlnEW8dotaIic6p0gxa0yRKN1KYu3PzT0P+XtAx3uuB8e/9WdeH3XZiDCVQzn+Dpv');
INSERT INTO `t_user_np` VALUES ('48', '冀JBU322', '尚明', '13503179490', '', '', '0', '沧运集团', '0', '0', '0', '', '298e2ed7bc6c56d7734a7dd93eba6687', '', '', '');
INSERT INTO `t_user_np` VALUES ('49', '冀JBS302', '王帅', '15030798568', '18632727750', '135246', '0', '沧运集团', '4', '2', '311', '869654012787671', '972a681535db8fca5603980145c0efa9', '', '', 'xmlT69dT0PD66EQRMljhl/hYfPELNhbtAGGi7mVAQFI7Agc/wV5bdEKVjaRjnzNCA+O1KL1uZQAgseumuzyewL7fG9ZM5x85');
INSERT INTO `t_user_np` VALUES ('50', '冀JCM853', '齐明辉', '15031736745', '', '123456', '0', '沧运集团', '0', '0', '0', '', 'e1848d0c71c080c122168e8cbbfee52a', '', '', '');
INSERT INTO `t_user_np` VALUES ('51', '冀JCJ522', '王润峰', '18833755166', '18632728817', '123456', '0', '沧运集团', '4', '2', '81', '869654012727446', 'f554b0fc2c889064bd1b8d6f04f79d06', '', '', 'JWty9m9Eis2YWTy6pBUGjvhYfPELNhbtAGGi7mVAQFI7Agc/wV5bdOmURx1wpSt75T7F7au1frXzzXP0WYFqjzJeA+KEzgs0');
INSERT INTO `t_user_np` VALUES ('52', '冀JQZ044', '张洪亮', '13931742219', '18632729589', '8854008', '0', '沧运集团', '4', '6', '395', '869654013007947', 'e3c2712c2ab68718372ab4da270c6abb', '', '', 'IeOg+FHQnzgo3RioUulx1vhYfPELNhbtAGGi7mVAQFI7Agc/wV5bdNxLs42OZUQxIwDI3Enyh6iZeb+aAlaZaCLOrbaNKWfF');
INSERT INTO `t_user_np` VALUES ('53', '冀JBS373', '穆俊荣', '15030758900', '', '123456', '0', '沧运集团', '0', '0', '0', '', 'e1848d0c71c080c122168e8cbbfee52a', '', '', '');
INSERT INTO `t_user_np` VALUES ('54', '冀JCL803', '于庆云', '13931766857', '18632727665', '123456', '0', '沧运集团', '4', '4', '12', '869654012696757', '56a1cdcd0061c557ca1e0e1871a5de35', '', '', 'In9gr5vdk4PoBK2hUEYGXPhYfPELNhbtAGGi7mVAQFI7Agc/wV5bdCjJSDqIA8Zs1564ZM7yIOu3G4XGxScjQSwfQBTysE4B');
INSERT INTO `t_user_np` VALUES ('55', '冀JCM931', '肖同良', '13832790695', '18632728736', '123456', '0', '沧运集团', '4', '9', '268', '869654012697268', 'f26b3b103300abb0a740dd7e20e6ac99', '2017-07-05 08:50:07', '2017-07-08 08:50:07', '/dDgzZRx2+XTykxcH9kb+PhYfPELNhbtAGGi7mVAQFI7Agc/wV5bdOsgJOXDCDUWIwDI3Enyh6giMFXumd19Q0WOfSgpSaRC');
INSERT INTO `t_user_np` VALUES ('56', '冀JBS323', '候彦宾', '13730575119', '13111711917', '123456', '0', '沧运集团', '3', '3', '96', '869654010293755', '2d8fca57ee6639e603cfa6ac88098e0f', '2017-06-20 20:27:53', '2017-06-23 20:27:53', 'v10F2N0Tth/v/2wDm5A65kaUFUBfyqzjlnEW8dotaIgWil487tkshRKkjZDiFP6mXHCV90Zlbt3CyGEOibUxDIEpiECRBJhX');
INSERT INTO `t_user_np` VALUES ('57', '冀JBS397', '安国敏', '15033171169', '', '123456', '0', '沧运集团', '0', '0', '0', '', 'e1848d0c71c080c122168e8cbbfee52a', '', '', '');
INSERT INTO `t_user_np` VALUES ('58', '冀JBS501', '孙勇', '13700380660', '18632728795', '134631', '0', '沧运集团', '5', '6', '130', '869654012697052', 'cbbc5940538cf3a0e2b9099cc802815e', '', '', 'VIiIMUHwj6+/Jr7HfcUjnfhYfPELNhbtAGGi7mVAQFI7Agc/wV5bdOFNl1GO7Oq72Ta0GjsoLKEiMFXumd19Q9R9pUO+UD2r');
INSERT INTO `t_user_np` VALUES ('59', '冀JCH051', '李荣艳', '13932730639', '18632727926', '123456', '0', '沧运集团', '3', '0', '69', '869654012696070', '6d48ae512d79a67bddd80109c8c187ca', '2017-06-27 17:02:37', '2017-06-30 17:02:37', '800TbIYV1bSm8t9jI7T65/hYfPELNhbtAGGi7mVAQFI7Agc/wV5bdCd8ZtsY8SXdG+qnjnquq9qQrgP5Qyz4NAJiwl0BmIVc');
INSERT INTO `t_user_np` VALUES ('60', '冀JBW710', '陈继强', '13930711220', '', '123456', '0', '沧运集团', '0', '0', '0', '', 'e1848d0c71c080c122168e8cbbfee52a', '', '', '');
INSERT INTO `t_user_np` VALUES ('61', '冀JCG783', '于永胜', '13932706765', '', '123456', '0', '沧运集团', '0', '0', '0', '', 'e1848d0c71c080c122168e8cbbfee52a', '', '', '');
INSERT INTO `t_user_np` VALUES ('62', '冀JBS593', '吴希胜', '15831885583', '18632729715', '123456', '0', '沧运集团', '3', '0', '73', '869654013254390', 'd0c9aea976502793e141d98097ba169c', '2017-07-04 22:20:57', '2017-07-07 22:20:57', 'elFfS27ty3x6uBgXnFB1NPhYfPELNhbtAGGi7mVAQFL1ctwYttAWXvRAXjnG4kQv5T7F7au1frVhN+h7rDGLeKaXcdDSiqo2');
INSERT INTO `t_user_np` VALUES ('63', '冀JBS395', '田庆芳', '13785738843', '18632728639', '395395', '0', '沧运集团', '3', '8', '357', '869654012696971', '0584d2d2896a2e78a3828227846d2ec5', '', '', 'uDkSBVlr0INupec6wlukMOl0xcjFVEywoPcu4eTFAKaZcY+swFl2yb8aqPGlAbVEzMnqxkM6IjRrai6w+SEG/SYSh4ZSgSxx');
INSERT INTO `t_user_np` VALUES ('64', '冀J8126D', '李铁刚', '13932730639', '', '123456', '0', '沧运集团', '0', '0', '0', '', 'e1848d0c71c080c122168e8cbbfee52a', '', '', '');
INSERT INTO `t_user_np` VALUES ('65', '冀JBS313', '王连峰', '13785729906', '18632728665', '123456', '0', '沧运集团', '4', '0', '40', '869654012696955', '6569a52a54d1aa5b564ba5e232513b68', '', '', 'aSolzqd1PrFNmKidoPwi3EaUFUBfyqzjlnEW8dotaIic6p0gxa0yRIQsIQF88A8rP+XtAx3uuB8VJkoInSf93gFJFVK3+FLp');
INSERT INTO `t_user_np` VALUES ('66', '冀JBW738', '盖金国', '15103376353', '18632728653', '123456', '0', '沧运集团', '3', '6', '370', '869654013007871', 'c3c4b312353d5b9cdf96c10911e59eae', '', '', 'JL8q+6lkpOI6tI/klScNx/hYfPELNhbtAGGi7mVAQFI7Agc/wV5bdM0XKZV9AJjgY/FaDb9LFbpSBRFikUbGpwDYshGHe/Mb');
INSERT INTO `t_user_np` VALUES ('67', '冀JCH037', '王润峰', '18833755166', '18632728916', '812888', '0', '沧运集团', '4', '0', '95', '869654012695775', 'a5d2a1eef8e446b55c688b4307a17f9b', '', '', 'k/RjYXMn0X3v/2wDm5A65kaUFUBfyqzjlnEW8dotaIic6p0gxa0yROR3vYydbE96P+XtAx3uuB/AvKB0I7hoUZcqCLG0TVQy');
INSERT INTO `t_user_np` VALUES ('68', '冀JCM653', '何翔', '15832760816', '18632728836', '222222', '0', '沧运集团', '4', '0', '195', '869654012696120', 'c438ab57f6677c436049849821cf80b2', '', '', 'bbHRJIHtWtdYVJV64JRovOl0xcjFVEywoPcu4eTFAKaZcY+swFl2yS7b3OD1erjGws/8Mc+20cdrai6w+SEG/bWpTOn4IZHz');
INSERT INTO `t_user_np` VALUES ('69', '冀JCJ032', '王建亮', '18733066289', '', '123456', '0', '沧运集团', '0', '0', '0', '', 'e1848d0c71c080c122168e8cbbfee52a', '', '', '');
INSERT INTO `t_user_np` VALUES ('70', '冀JBU751', '彭晨晓', '15231763664', '18631713637', '123456', '0', '沧运集团', '4', '1', '146', '869654012726927', '626faef4afe134fbbdc2e62b56dea8f7', '', '', 'r5F1QK0tmMLxheWz1pBdHul0xcjFVEywoPcu4eTFAKaZcY+swFl2yay9tHc7aYQfiTsisGSSglhwS8od7Cbi/lEzwIbj1qdg');
INSERT INTO `t_user_np` VALUES ('71', '冀JBU775', '朱连勇', '13393371833', '18632728389', '123456', '0', '沧运集团', '3', '0', '258', '869654012695940', '38b0d6d4dcf4b31a94d8218660881d24', '2017-06-30 23:29:09', '2017-07-03 23:29:09', 'tn4m8Hk79Ya7LbdoPZorC/hYfPELNhbtAGGi7mVAQFI7Agc/wV5bdOhJvkaM7o66A+O1KL1uZQDHXgaU0qU0giLOrbaNKWfF');
INSERT INTO `t_user_np` VALUES ('72', '冀JBU773', '张建户', '13084525882', '18632728551', '198754', '0', '沧运集团', '6', '0', '253', '869654012695627', '189a999d79972456ceaadc70f7bc56a4', '', '', 'VJt69Qa0CqEUBrx4PpRjzul0xcjFVEywoPcu4eTFAKaZcY+swFl2yenmxVgrNoAAtZP+dtQMItJrai6w+SEG/WmV9pgpRkTV');
INSERT INTO `t_user_np` VALUES ('73', '冀JCG952', '王爱国', '13180312669', '18632728057', '123456', '0', '沧运集团', '3', '3', '166', '869654012727453', 'abcb42d4ad5b99d5198590c79faf9501', '2017-06-23 06:11:31', '2017-06-26 06:11:31', 'bFCBbpZLdlNjHAlqCrJb8ul0xcjFVEywoPcu4eTFAKaZcY+swFl2ya1OsAV20dGJO/wTBAY3IJlrai6w+SEG/UDxw9tHwDR3');
INSERT INTO `t_user_np` VALUES ('74', '冀JBS385', '陆艳芹', '15832772830', '', '123456', '0', '沧运集团', '0', '0', '0', '', 'e1848d0c71c080c122168e8cbbfee52a', '', '', '');
INSERT INTO `t_user_np` VALUES ('75', '冀JBW795', '尹国庆', '13831780320', '18632729295', '123456', '0', '沧运集团', '3', '7', '287', '869654012727404', '46bc9dbede8b4a91b8d76ac3362831f8', '', '', 'E5UOm0LiSHTCxUwfy3KSlEaUFUBfyqzjlnEW8dotaIic6p0gxa0yRPl/ijUkO5I7P+XtAx3uuB/1DJOecP8kyDDeCrwGbnxg');
INSERT INTO `t_user_np` VALUES ('76', '冀JCG712', '路纯新', '13832775809', '', '123456', '0', '沧运集团', '0', '0', '0', '', 'e1848d0c71c080c122168e8cbbfee52a', '', '', '');
INSERT INTO `t_user_np` VALUES ('77', '冀JBU771', '陈伟', '13833782595', '', '123456', '0', '沧运集团', '0', '0', '0', '', 'e1848d0c71c080c122168e8cbbfee52a', '', '', '');
INSERT INTO `t_user_np` VALUES ('78', '冀JCG873', '张洪利', '15028618567', '', '123456', '0', '沧运集团', '0', '0', '0', '', 'e1848d0c71c080c122168e8cbbfee52a', '', '', '');
INSERT INTO `t_user_np` VALUES ('79', '冀JHK150', '朱国庆', '13784835981', '', '123456', '0', '沧运集团', '0', '0', '0', '', 'e1848d0c71c080c122168e8cbbfee52a', '', '', '');
INSERT INTO `t_user_np` VALUES ('80', '冀JBS383', '董洪超', '13503178403', '18632728890', '198282', '0', '沧运集团', '3', '0', '40', '869654012696807', 'f9a37de4ef64e38e0a92410cef1dee01', '', '', 'm6hcLHxVPB3CxUwfy3KSlEaUFUBfyqzjlnEW8dotaIic6p0gxa0yRDOfqjFjO+tYP+XtAx3uuB9aVzPtDFQjGCW2S1Tz3kh7');
INSERT INTO `t_user_np` VALUES ('81', '冀JBS213', '张全胜', '13833708939', '', '123456', '0', '沧运集团', '0', '0', '0', '', 'e1848d0c71c080c122168e8cbbfee52a', '', '', '');
INSERT INTO `t_user_np` VALUES ('82', '', '张永高', '13932730639', '', '123456', '0', '沧运集团', '0', '0', '0', '', '88fb641849e39dcd9a4facfac6afc613', '', '', '');
INSERT INTO `t_user_np` VALUES ('83', '冀JBW735', '朱连勇', '13191920745', '18632727872', '123456', '0', '沧运集团', '3', '0', '345', '869654012695650', '25f84c915c2b4f47a577f006a53c5e01', '2017-06-30 10:40:07', '2017-07-03 10:40:07', 'K0Iwd8olfo/v/2wDm5A65kaUFUBfyqzjlnEW8dotaIic6p0gxa0yRIApYmbj5D9/P+XtAx3uuB8Tb3wHQw2J/TxYPALrw5Gd');
INSERT INTO `t_user_np` VALUES ('84', '冀JBU731', '许平', '13722701260', '', '123456', '0', '沧运集团', '0', '0', '0', '', 'e1848d0c71c080c122168e8cbbfee52a', '', '', '');
INSERT INTO `t_user_np` VALUES ('85', '冀JCJ583', '白元杰', '15231779607', '18632727627', '123456', '0', '沧运集团', '6', '4', '106', '869654012697003', 'a804138c5ef3a6093b7c2648ccd552d6', '', '', 'B8jym0VOvYPv1N2NCAOeYvhYfPELNhbtAGGi7mVAQFLNwhjOlUgVEOt2V9rNuijpY/FaDb9LFbq3G4XGxScjQYZW4maGB8G4');
INSERT INTO `t_user_np` VALUES ('86', '冀JBU762', '齐立柱', '13785727857', '18632728300', '137857', '0', '沧运集团', '4', '0', '10', '869654012695908', '45b1600d17bab2fd64bc17930c5b1bf0', '', '', 'HXVY8eF7Jbw6tI/klScNx/hYfPELNhbtAGGi7mVAQFI7Agc/wV5bdBHAvBgw7R2dG+qnjnquq9rHXgaU0qU0gt/s1/sOIfQ+');
INSERT INTO `t_user_np` VALUES ('87', '冀JSD087', '张宝党', '13633179675', '18632727895', '780501', '0', '沧运集团', '4', '9', '138', '869654012695601', 'be19782001ab7477677c4c1f8c04b529', '2017-07-05 10:00:21', '2017-07-08 10:00:21', 'Ve6Rz6qHzqUfCXbGDOiVawrefYIE2gosfFC6nnZpTdLjczj7dLVSG1Z2V7kt2MNmYVM95wXKJa0tz5WlrX0/Nagfsi6JZaZX');
INSERT INTO `t_user_np` VALUES ('88', '冀JBS570', '吕国全', '13930716082', '18632728570', '123456', '0', '沧运集团', '3', '1', '698', '869654012696880', 'fece66d980a39038aa4b0cc3b64bba44', '2017-06-17 15:34:27', '2017-06-20 15:34:27', 'yddvdxAfDRO7LbdoPZorC/hYfPELNhbtAGGi7mVAQFI7Agc/wV5bdGfaN/RJLInxU/PoLrY5KROt+KXqSp/yS93zvdgwmJmm');
INSERT INTO `t_user_np` VALUES ('89', '冀JCJ510', '许爱东', '15076694369', '18632728783', '123456', '0', '沧运集团', '3', '0', '163', '869654012696302', 'f9d24c9566900eae5d0a08e85b7d267a', '', '', '6G7iVtx5HRUo3RioUulx1vhYfPELNhbtAGGi7mVAQFI7Agc/wV5bdFUN61zM60UsU/PoLrY5KRMiMFXumd19Q7nlc1Th7z/i');
INSERT INTO `t_user_np` VALUES ('90', '冀JBS235', '赵立海', '13932741296', '18632727829', '972700', '0', '沧运集团', '3', '0', '85', '869654012696369', '659300b78af80b9f723686ed6fb9b6b7', '', '', 'WFPiJc6n6u+DOrjfcSe/VPhYfPELNhbtAGGi7mVAQFI7Agc/wV5bdD3h0C3rO3T8Y/FaDb9LFbrYrT6enyKVDke44AZdTGdp');
INSERT INTO `t_user_np` VALUES ('91', '冀JBS305', '李桂兵', '13931723028', '15613789578', '123456', '0', '沧运集团', '4', '5', '249', '869654012695635', 'b1ef37bfd2e4047825e081dae7a0af55', '', '', 'V2g3hs8Aw00NBad4MQe5hOl0xcjFVEywoPcu4eTFAKaZcY+swFl2yT8WELNKVYsPBcGjBitRUctNCjFTQnUC2fWbKg+hmFTC');
INSERT INTO `t_user_np` VALUES ('92', '冀J3992G', '李贻桩', '18713063488', '18632729069', '332211', '0', '沧运集团', '3', '1', '191', '869654012727370', '6d1d8760a603408df2a0eb84ec1e25f7', '2017-06-14 18:21:37', '2017-06-17 18:21:37', 'hu+ncSGbhpcCT0WvqNQJR+l0xcjFVEywoPcu4eTFAKaZcY+swFl2yVhJc5yLD+Th6LCCyzjXiYYToDJ0pfkqlic1B/rZkpzu');
INSERT INTO `t_user_np` VALUES ('93', '冀J9699G', '庞志立', '15100754958', '1863272798', '123456', '0', '沧运集团', '4', '0', '308', '869654012697235', '4c7788edd9425f5540758bb9d9c9a42e', '', '', 'DDuq/HsfnTVSqvSCE0EHHvhYfPELNhbtAGGi7mVAQFI7Agc/wV5bdKU3ZwR1uBSP5T7F7au1frWQrgP5Qyz4NNCTmHuWcVAd');
INSERT INTO `t_user_np` VALUES ('94', '冀J5793E', '蒋志勇', '18931717985', '18632728927', '456123', '0', '沧运集团', '6', '3', '347', '869654012727974', 'be83cd55639524a499f67181c1265500', '', '', 'fjSVf9xq3L7OxTUo/iDaRPhYfPELNhbtAGGi7mVAQFI7Agc/wV5bdNAxAnOexqcVIwDI3Enyh6g6iHrG97UrhoZW4maGB8G4');
INSERT INTO `t_user_np` VALUES ('95', '冀J5023E', '李秀梅', '13803233509', '18632729562', '123456', '0', '沧运集团', '3', '1', '37', '869654013254374', '8462e45a4c24fa92390eae0c9f10ce83', '2017-06-22 20:15:09', '2017-06-25 20:15:09', 'jOdOVpOBnhRY4lgaq/zfM0aUFUBfyqzjlnEW8dotaIgkUCOkAxDsDFtPf/1YN3VKP+XtAx3uuB87a2zdNvWAvW1Krq3HwRrH');
INSERT INTO `t_user_np` VALUES ('96', '冀J5329E', '高金丽', '15333370016', '18632728895', '123456', '0', '沧运集团', '4', '2', '167', '869654012728709', '99c6a4dad0af772ad0dfe84120b957cf', '2017-06-15 15:37:45', '2017-06-18 15:37:45', '4ejNIJDmxMbxzeT6fswH5PhYfPELNhbtAGGi7mVAQFI7Agc/wV5bdEg6p3o9SL2cA+O1KL1uZQDzzXP0WYFqj9R9pUO+UD2r');
INSERT INTO `t_user_np` VALUES ('97', '冀J6935E', '寇雷', '15233178040', '18632728322', '147258', '0', '沧运集团', '4', '0', '128', '869654012696583', '625856dc6f2f7f667d3da4981c12a3f7', '', '', 'aipoFxSRcKz2qbIzrxphnPhYfPELNhbtAGGi7mVAQFI7Agc/wV5bdBGYCyUDbmcY5T7F7au1frXHXgaU0qU0gq4Lp5SDmJwb');
INSERT INTO `t_user_np` VALUES ('98', '冀JCM721', '肖遵彪', '13731739515', '', '123456', '0', '沧运集团', '0', '0', '0', '', 'e1848d0c71c080c122168e8cbbfee52a', '', '', '');
INSERT INTO `t_user_np` VALUES ('99', '冀J0190E', '霍文军', '13722470728', '18632728963', '006250', '0', '沧运集团', '4', '9', '260', '869654012696252', '84cd20fe3f351550732530a0ae493e25', '2017-07-01 13:56:26', '2017-07-04 13:56:26', '0Xi/VW3apozX3IsVgDFpgPhYfPELNhbtAGGi7mVAQFI7Agc/wV5bdKhMCv+oRZEl5T7F7au1frU6iHrG97Urhla5c0W5p3Rx');
INSERT INTO `t_user_np` VALUES ('100', '冀J2532E', '穆林', '13931712836', '', '123456', '0', '沧运集团', '0', '0', '0', '', 'e1848d0c71c080c122168e8cbbfee52a', '', '', '');
INSERT INTO `t_user_np` VALUES ('101', '冀J8667H', '丁云涛', '13785770030', '', '123456', '0', '沧运集团', '0', '0', '0', '', 'e1848d0c71c080c122168e8cbbfee52a', '', '', '');
INSERT INTO `t_user_np` VALUES ('102', '冀JCM652', '宋德义', '13630844948', '', '123456', '0', '沧运集团', '0', '0', '0', '', 'e1848d0c71c080c122168e8cbbfee52a', '', '', '');
INSERT INTO `t_user_np` VALUES ('103', '冀J1936H', '周蕾', '18731739432', '18632728125', '123458', '0', '沧运集团', '3', '0', '0', '', 'a9e77bf74b9e73fa82b7ec514851df56', '', '', '');
INSERT INTO `t_user_np` VALUES ('104', '冀J2510F', '刘志权', '13393073550', '', '123456', '0', '沧运集团', '0', '0', '0', '', 'e1848d0c71c080c122168e8cbbfee52a', '', '', '');
INSERT INTO `t_user_np` VALUES ('105', '冀J6572F', '李猛', '13831752830', '18632728238', '03178888', '0', '沧运集团', '3', '0', '96', '869654012695536', '1d6c5229da5b1c9de319d32ad7fabf7e', '', '', 'EjRNoVczw280gb5AIP85oOl0xcjFVEywoPcu4eTFAKaZcY+swFl2yWC4AjTFvyxF6LCCyzjXiYZrai6w+SEG/Y62L8pl+BSB');
INSERT INTO `t_user_np` VALUES ('106', '冀J3165H', '陈凤刚', '13833745957', '18632729218', '123456', '0', '沧运集团', '3', '10', '389', '869654012787770', 'e5ae2b1a5ec51823ca217d6ce3ef2c10', '2017-06-28 18:45:48', '2017-07-01 18:45:48', '9UHYdL6SjVBKgtE8yvILiPhYfPELNhbtAGGi7mVAQFI7Agc/wV5bdM6Z+9LaXubd5T7F7au1frVwOO1ILHZa36fX3d6Ihfxm');
INSERT INTO `t_user_np` VALUES ('107', '冀JAY664', '崔俊鹏', '15931710655', '13180300396', '521314', '0', '沧运集团', '4', '1', '212', '869654013008663', '1b221c286d7847b1091c8cb1e89f7a0f', '', '', 'hT5SmFH4wlxlBWXULXcR/el0xcjFVEywoPcu4eTFAKaZcY+swFl2yayDZwMnuFikyEBkAS2lGMdnsv/2SVovLkTAx119lgmC');
INSERT INTO `t_user_np` VALUES ('108', '冀J081MX', '孟庆伟', '15100751555', '18632729383', '123456', '0', '沧运集团', '4', '3', '97', '869654013254218', 'd4f71476bb4e52a0a4f3960b903e7c4a', '2017-06-27 05:59:11', '2017-06-30 05:59:11', 'nLEZMZ8USVwV+XOR4p4mkUaUFUBfyqzjlnEW8dotaIg67gaW3LhHJT/jFBTnPbwLP+XtAx3uuB+1D69cszDBpJNXkvi/LIgo');
INSERT INTO `t_user_np` VALUES ('109', '冀J0727H', '张英磊', '13932700152', '18632729196', '123456', '0', '沧运集团', '4', '1', '198', '869654012787465', '3c655485d4044b7344d205a86732c20f', '', '', 'ntNnsQlfHKHcQ8igdnI7wul0xcjFVEywoPcu4eTFAKaZcY+swFl2yRkMzdlhuqbsiAPTkDc0YUYToDJ0pfkqlnm+DSWs/dXs');
INSERT INTO `t_user_np` VALUES ('110', '冀J9111G', '张沛玉', '13730582228', '18632729591', '123456', '0', '沧运集团', '3', '1', '112', '869654012696765', 'cf205304b9e26d6785ed0a5bdc137c84', '', '', 'pVkZBxJebT5HqAtRrtUHfPhYfPELNhbtAGGi7mVAQFI7Agc/wV5bdMxD5cb97/QT2Ta0GjsoLKGZeb+aAlaZaK3W9bNf1tuM');
INSERT INTO `t_user_np` VALUES ('111', '冀JCM793', '肖厚仓', '15716899580', '', '123456', '0', '沧运集团', '0', '0', '0', '', 'e1848d0c71c080c122168e8cbbfee52a', '', '', '');
INSERT INTO `t_user_np` VALUES ('112', '冀J729MV', '边书防', '15530490140', '18632729050', '123456', '0', '沧运集团', '3', '4', '303', '869654012727164', '17317e7cda1619ce6cc3dfee5a3c220d', '2017-06-24 06:23:56', '2017-06-27 06:23:56', 'E9sIrudNR6iKlwczuI+FT/hYfPELNhbtAGGi7mVAQFI7Agc/wV5bdAlKs+QdQgZJT8sZjq/m1gXzGh6XHstDWL7fG9ZM5x85');
INSERT INTO `t_user_np` VALUES ('113', '冀JCM921', '巩书正', '13803237037', '', '123456', '0', '沧运集团', '0', '0', '0', '', 'e1848d0c71c080c122168e8cbbfee52a', '', '', '');
INSERT INTO `t_user_np` VALUES ('114', '冀J5125E', '孙金红', '13483838868', '', '123456', '0', '沧运集团', '0', '0', '0', '', 'e1848d0c71c080c122168e8cbbfee52a', '', '', '');
INSERT INTO `t_user_np` VALUES ('115', '冀J3053D', '张洪兴', '13831761413', '18632728990', '197488', '0', '沧运集团', '3', '4', '70', '869654012886689', '6d90d42510be47cfd4159b2b62c10e03', '', '', 'KPEIXHI1E3gnEjhi+fI7Zel0xcjFVEywoPcu4eTFAKaZcY+swFl2ycHIn4OR2e2VbvCSll4TkT1rai6w+SEG/TPq5RxAp0Db');
INSERT INTO `t_user_np` VALUES ('116', '冀J3115D', '孙金波', '13784759510', '', '123456', '0', '沧运集团', '0', '0', '0', '', 'e1848d0c71c080c122168e8cbbfee52a', '', '', '');
INSERT INTO `t_user_np` VALUES ('117', '冀J5653E', '郑培众', '13833735246', '', '123456', '0', '沧运集团', '0', '0', '0', '', 'e1848d0c71c080c122168e8cbbfee52a', '', '', '');
INSERT INTO `t_user_np` VALUES ('118', '冀J6212F', '王延重', '13832736996', '13292744131', '123456', '0', '沧运集团', '4', '4', '209', '869654013116060', '57d74c372cf30d2c1c336664acc207b7', '', '', '4Udg1KErVTzv/2wDm5A65kaUFUBfyqzjlnEW8dotaIjcHyYK7REHzIb134NNKYhY03ETsMtgsdRbIfVvbo4AYnL0Ganetrv1');
INSERT INTO `t_user_np` VALUES ('119', '冀J6192E', '刘石柱', '15830471397', '18632728033', '123456', '0', '沧运集团', '3', '3', '72', '869654012697177', 'da692308969052e99b1a1e887bd4b27d', '', '', 'ukoiUBoHAeZEvC5iyTnq50aUFUBfyqzjlnEW8dotaIic6p0gxa0yRE4TNX5B4SvoP+XtAx3uuB9/QwtFqmViollh1C+4Pdsa');
INSERT INTO `t_user_np` VALUES ('120', '冀J6253E', '王延胜', '13730572564', '18632728985', '669777', '0', '沧运集团', '3', '2', '134', '869654012696443', '62daebecc9c34f8f7a76e5eec40a0025', '2017-07-01 23:15:20', '2017-07-04 23:15:20', 'a2mFHarCV50fCXbGDOiVawrefYIE2gosfFC6nnZpTdLjczj7dLVSG3+KBl9tsqT1YVM95wXKJa1oFQwK07EWMqgfsi6JZaZX');
INSERT INTO `t_user_np` VALUES ('121', '冀J9376D', '高建法', '13731722356', '18632728010', '137317', '0', '沧运集团', '3', '10', '310', '869654012695957', '00cacb4c3581cbcbbae9f0765b4ff606', '', '', 'WD9Ko0DmQ9vEp2+KulZIDul0xcjFVEywoPcu4eTFAKaZcY+swFl2yU+e/QB8kWgX0qWzKZFTiblrai6w+SEG/a/a+hMHWRZf');
INSERT INTO `t_user_np` VALUES ('122', '冀J5183D', '崔宗峰', '13582733633', '18632728276', '123456abc', '0', '沧运集团', '3', '1', '95', '869654012696211', '753bdc29caf141594a1074e10c3d949a', '', '', 'NbEBiEOw16LhzCVZaT9Bael0xcjFVEywoPcu4eTFAKaZcY+swFl2yeDhVpzb47H/esxapOE0zo5rai6w+SEG/RTUSHy21Bar');
INSERT INTO `t_user_np` VALUES ('123', '冀J3699G', '侯贵明', '18230179287', '18632729507', '123456', '0', '沧运集团', '4', '7', '156', '869654013254226', '917f2f12454d2b6fc94438953b098e58', '2017-07-04 16:57:23', '2017-07-07 16:57:23', '5jaRlQ3z1hPd35G83+WJ/vhYfPELNhbtAGGi7mVAQFL1ctwYttAWXuK8kPq/qLG72Ta0GjsoLKGZeb+aAlaZaJc6yIXrd85J');
INSERT INTO `t_user_np` VALUES ('124', '冀JCM730', '孙文峰', '13932750038', '18631713753', '123456', '0', '沧运集团', '3', '3', '80', '869654013007541', '5fd9877e5fce85a83eef36a5628eabb1', '2017-07-03 19:32:45', '2017-07-06 19:32:45', '6kxXVvNWIUDTykxcH9kb+PhYfPELNhbtAGGi7mVAQFI7Agc/wV5bdLAN4D7Eg0EDT8sZjq/m1gUSmeElhAObmQDYshGHe/Mb');
INSERT INTO `t_user_np` VALUES ('125', '冀J6183F', '宋文国', '15933288655', '18632727952', '123456', '0', '沧运集团', '3', '1', '57', '869654012727149', '87cb024b36dee9fbcde89792b847ae08', '', '', 'GyYh7/7xk/T7mwlnlWFutul0xcjFVEywoPcu4eTFAKaZcY+swFl2yY6ccX7gVVVnO/wTBAY3IJmdH632szWbeQuqTa19V6Ce');
INSERT INTO `t_user_np` VALUES ('126', '冀J9757F', '王朋桥', '13084508211', '', '123456', '0', '沧运集团', '0', '0', '0', '', 'e1848d0c71c080c122168e8cbbfee52a', '', '', '');
INSERT INTO `t_user_np` VALUES ('127', '冀J1129D', '陈国庆', '13785496362', '', '123456', '0', '沧运集团', '0', '0', '0', '', 'e1848d0c71c080c122168e8cbbfee52a', '', '', '');
INSERT INTO `t_user_np` VALUES ('128', '冀J3692H', '王建亮', '18733066289', '', '123456', '0', '沧运集团', '0', '0', '0', '', 'e1848d0c71c080c122168e8cbbfee52a', '', '', '');
INSERT INTO `t_user_np` VALUES ('129', '冀J5231E', '潘治国', '15530767703', '18632727763', '123456', '0', '沧运集团', '3', '3', '193', '869654013008325', '39dcff120b6de6dcbf8b62e1b7f926f8', '', '', 'lSo0kXLVb5kfCXbGDOiVawrefYIE2gosfFC6nnZpTdLjczj7dLVSG18qw4NV6rlYYVM95wXKJa1axOfRqabekvZ0TF4E5JFB');
INSERT INTO `t_user_np` VALUES ('130', '冀J992TM', '邢夫贵', '13833987975', '18632728657', '123456', '0', '沧运集团', '3', '6', '287', '869654012696260', 'a8cc112d6ce848e6a7aa1883584f08e5', '2017-06-17 12:51:15', '2017-06-20 12:51:15', 'RzfAkHmC/Rw7A+Cx5MYWn0aUFUBfyqzjlnEW8dotaIic6p0gxa0yRBUceY0Pt011P+XtAx3uuB8VJkoInSf93oEpiECRBJhX');
INSERT INTO `t_user_np` VALUES ('131', '冀J2398D', '张华', '15131715888', '', '123456', '0', '沧运集团', '0', '0', '0', '', 'e1848d0c71c080c122168e8cbbfee52a', '', '', '');
INSERT INTO `t_user_np` VALUES ('132', '冀J8692F', '鄢悦周', '13722717161', '18632728526', '112233', '0', '沧运集团', '4', '0', '133', '869654012696484', '15df5ec8909e40dac17a1ea0d71a07cb', '2017-06-27 09:52:15', '2017-06-30 09:52:15', 'nG5WI5cx2rKN2f7LSjle5Ol0xcjFVEywoPcu4eTFAKaZcY+swFl2yaWU29WGhcIa1H1AKtU4GfJrai6w+SEG/YaEI7genAcj');
INSERT INTO `t_user_np` VALUES ('133', '冀J3089G', '郝永生', '13930767388', '', '123456', '0', '沧运集团', '0', '0', '0', '', 'e1848d0c71c080c122168e8cbbfee52a', '', '', '');
INSERT INTO `t_user_np` VALUES ('134', '冀J7561F', '朱俊香', '15075708816', '18632729053', '15532792854', '0', '沧运集团', '3', '7', '273', '869654012727891', 'c00feee0eb45d846a5ca5c34fca6f34d', '2017-06-16 17:12:19', '2017-06-19 17:12:19', 'k1U740YgmGN4+6jGImLmjel0xcjFVEywoPcu4eTFAKaZcY+swFl2yag1kOR8TVUSv7Gyb/uEbYQToDJ0pfkqlk99LRXPrc6+');
INSERT INTO `t_user_np` VALUES ('135', '冀J7061F', '张遵学', '13831780457', '18632728528', '147258', '0', '沧运集团', '5', '2', '136', '869654012697128', '66b8b84810547e5876e4433d6aea57fe', '', '', '/Ck+P5SpdBGqOsjcuj0qBPhYfPELNhbtAGGi7mVAQFI7Agc/wV5bdLWBkVW1ZIQlIwDI3Enyh6it+KXqSp/ySyKl16SpURc3');
INSERT INTO `t_user_np` VALUES ('136', '冀J2672D', '张建军', '13832702364', '18632728682', '123456', '0', '沧运集团', '3', '4', '295', '869654012696989', '948bb064082039a79629d777c4c5fa90', '', '', '5Nl1s1ffUr1MaH/wtR9XOfhYfPELNhbtAGGi7mVAQFI7Agc/wV5bdOWvB2m6gF3s5T7F7au1frVSBRFikUbGp8UFJ+AYC7Bg');
INSERT INTO `t_user_np` VALUES ('137', '冀J3879D', '张中原', '13833758940', '', '123456', '0', '沧运集团', '0', '0', '0', '', 'e1848d0c71c080c122168e8cbbfee52a', '', '', '');
INSERT INTO `t_user_np` VALUES ('138', '冀J6897G', '许才坤', '13785729570', '', '123456', '0', '沧运集团', '0', '0', '0', '', 'e1848d0c71c080c122168e8cbbfee52a', '', '', '');
INSERT INTO `t_user_np` VALUES ('139', '冀JCM631', '唐金英', '13603339909', '18632728019', '123456', '0', '沧运集团', '4', '10', '170', '869654012696831', 'd1b6166c83df2d2f35eee9f0802adb1c', '', '', '4J7i6Kr3zpvkshdEQb2YzfhYfPELNhbtAGGi7mVAQFI7Agc/wV5bdIxHtYYien+N5T7F7au1frXE0c5Gh1AAtdSR6M0HW/m7');
INSERT INTO `t_user_np` VALUES ('140', '冀J2373D', '周云强', '18733040012', '', '123456', '0', '沧运集团', '0', '0', '0', '', 'e1848d0c71c080c122168e8cbbfee52a', '', '', '');
INSERT INTO `t_user_np` VALUES ('141', '冀J0297E', '冯长海', '15030731859', '18632729267', '123456', '0', '沧运集团', '4', '0', '74', '869654013254234', '8775eb3ebfee0192991469be5fe1b515', '2017-06-29 15:50:33', '2017-07-02 15:50:33', '1s2tAZ2kcXZWH5eGgULrgPhYfPELNhbtAGGi7mVAQFL1ctwYttAWXokkXKDFtDHKU/PoLrY5KRNwOO1ILHZa3yBJLenkOBRa');
INSERT INTO `t_user_np` VALUES ('142', '冀J7535F', '张红雨', '13803233878', '18631710367', '123456', '0', '沧运集团', '3', '0', '179', '869654013008499', '50cd5bfa0e4382149f203d6d65b7250f', '', '', 'za1NIp4DYDUeC5kOPgrpWvhYfPELNhbtAGGi7mVAQFI7Agc/wV5bdPpMf5x3TCVdT8sZjq/m1gULRcc1Inf5LiBJLenkOBRa');
INSERT INTO `t_user_np` VALUES ('143', '冀J3552E', '杨军', '15731733553', '18632728722', '521420', '0', '沧运集团', '3', '0', '137', '869654012696294', '8edb892c42e6a5e8cd8743df28b6574a', '2017-06-27 17:56:32', '2017-06-30 17:56:32', 'Lc7oA9qbt2VY4lgaq/zfM0aUFUBfyqzjlnEW8dotaIic6p0gxa0yREhP3Ptt2xoNP+XtAx3uuB/AHNbRaJNCvm1Krq3HwRrH');
INSERT INTO `t_user_np` VALUES ('144', '冀J6387D', '王宝合', '13630845619', '18632728360', '123456', '0', '沧运集团', '3', '0', '221', '869654012696450', 'd5304c337f0a3fee0eaab6ac96d37dc2', '2017-06-29 21:06:52', '2017-07-02 21:06:52', 'bPr7Jk3hRIJY4lgaq/zfM0aUFUBfyqzjlnEW8dotaIic6p0gxa0yRDChwBXNSOjXP+XtAx3uuB9oHUWWFwShXhaaz5dDvSqz');
INSERT INTO `t_user_np` VALUES ('145', '冀J9391E', '孙瑞庭', '15231720688', '', '123456', '0', '沧运集团', '0', '0', '0', '', 'e1848d0c71c080c122168e8cbbfee52a', '', '', '');
INSERT INTO `t_user_np` VALUES ('146', '冀J2852F', '徐国珍', '15131737771', '13292774706', '123456', '74', '沧运集团', '3', '0', '84', '869654012644872', '30ed8caaa168acd4c31959c0c80ece57', '2017-07-07 17:47:09', '2017-07-10 17:47:09', 'IGa/bwXlLAx9coM/tV/Jzel0xcjFVEywoPcu4eTFAKaZcY+swFl2yRyJHSjKHRzjtcgjkf1jT5yydV5W7hbNtA43H9ofMgGI');
INSERT INTO `t_user_np` VALUES ('147', '冀J0067H', '肖宝玉', '13231705728', '18632729031', '123456', '0', '沧运集团', '3', '6', '86', '869654013165109', '70ec72234118e6f42172318c31903e69', '', '', 'sTSlHUnZRIf7uPQA5HvCwPhYfPELNhbtAGGi7mVAQFI7Agc/wV5bdGTcgCQZWF/51564ZM7yIOvzGh6XHstDWBQb7MRTdijI');
INSERT INTO `t_user_np` VALUES ('148', '冀J7298D', '张中岐', '13803231341', '18632729032', '123456', '0', '沧运集团', '3', '2', '206', '869654012696682', 'de1f8befc91c7d592ab2867fdae45b46', '2017-06-17 06:46:24', '2017-06-20 06:46:24', 'Ox1ltRp3r7QD2t+LwejGj/hYfPELNhbtAGGi7mVAQFI7Agc/wV5bdKTuvKx9ErxlY/FaDb9LFbrzGh6XHstDWFplW5dmuBEk');
INSERT INTO `t_user_np` VALUES ('149', '冀J3297F', '黄小琼', '13111759669', '18632727969', '885319', '0', '沧运集团', '4', '1', '66', '869654012695668', '3a914675f23920b8e8bc0075a31e7d2f', '', '', 'vkHqFWHj7iNbnMnikY/mgul0xcjFVEywoPcu4eTFAKaZcY+swFl2yXuBpEEJ2oom4NLudjfSloydH632szWbeXn7iIAsEX6Z');
INSERT INTO `t_user_np` VALUES ('150', '冀J8889H', '陈文玲', '13722476722', '13166852869', '123456', '0', '沧运集团', '3', '0', '0', '', '6ae27b67bb1148b920887940702d08de', '', '', '');
INSERT INTO `t_user_np` VALUES ('151', '冀J8723D', '王超', '13833733727', '18632728569', '123456', '0', '沧运集团', '4', '0', '292', '869654012887240', '48579cbe0fa7c9a61de41fe1d00914a5', '', '', 'u7p9NPa/tckI3OlKGpvRA/hYfPELNhbtAGGi7mVAQFI7Agc/wV5bdEDm0N44ew6M5T7F7au1frWt+KXqSp/yS4GsYGw8CQbN');
INSERT INTO `t_user_np` VALUES ('152', '冀J3863D', '葛葆义', '15033364642', '18632728769', '123456', '0', '沧运集团', '3', '0', '42', '869654012695346', '521c1597e88cbcfa014c0eeec3b0d310', '2017-06-01 10:07:49', '2017-06-04 10:07:49', 'TseMQa6QzY3adDJ5ZxzkW/hYfPELNhbtAGGi7mVAQFI7Agc/wV5bdKGIdZDP/FUT1564ZM7yIOsiMFXumd19Q4GsYGw8CQbN');
INSERT INTO `t_user_np` VALUES ('153', '冀J2822F', '常金良', '18732796211', '18632728135', '110110', '0', '沧运集团', '3', '2', '83', '869654012697250', '74b47f2a8fd8e2c62a3542de3080b790', '2017-06-23 12:24:02', '2017-06-26 12:24:02', 'BDtPHFP3pphY4lgaq/zfM0aUFUBfyqzjlnEW8dotaIic6p0gxa0yRBKGxf2w/HyCP+XtAx3uuB+AArunyMNFNp4Z8PL8kVIo');
INSERT INTO `t_user_np` VALUES ('154', '冀J7095D', '崔均明', '15130791338', '13166562978', '123456', '0', '沧运集团', '4', '8', '138', '869654013007533', '309e0605bfed1044a940793b0aa3797f', '2017-06-01 18:03:40', '2017-06-04 18:03:40', 'Aqc7njvO5CpLyaN5AQWhevhYfPELNhbtAGGi7mVAQFI7Agc/wV5bdHIpyvgjpKzLTGR3zLa2CgShnegWga4FN8Xndw3rtV7q');
INSERT INTO `t_user_np` VALUES ('155', '冀JCM723', '乔立平', '13831704826', '13230704992', '123456', '0', '沧运集团', '3', '4', '63', '869654012697243', '6780c6f13df2097ff728d315e6bba222', '', '', '6OYHwwaYFz3Ut61DvGmJHvhYfPELNhbtAGGi7mVAQFI7Agc/wV5bdE9vzbRc0eGna17wvSQbIdzaouk0lzCvklZDPTFnCW6w');
INSERT INTO `t_user_np` VALUES ('156', '冀J309QK', '王磊', '13630844948', '15690268918', '123456', '0', '沧运集团', '4', '6', '169', '869654013008770', 'b1469954a0957b047c4291ba485c19c5', '', '', 'dqVlpR5rm2YQfLxwSXNUVfhYfPELNhbtAGGi7mVAQFLNwhjOlUgVEES6cqNIJCk5r8BwWeLlrZsv+lIFLSgBAafX3d6Ihfxm');
INSERT INTO `t_user_np` VALUES ('157', '冀J9303E', '许可森', '13931728582', '', '123456', '0', '沧运集团', '0', '0', '0', '', 'e1848d0c71c080c122168e8cbbfee52a', '', '', '');
INSERT INTO `t_user_np` VALUES ('158', '冀J2893E', '王建立', '13293428858', '18632728958', '581971', '0', '沧运集团', '3', '0', '74', '869654012696724', '3d818f60f3c6be7f3dd75e03900cd7b2', '', '', 't9gdOBTl2v+UoZlUyIz/0+l0xcjFVEywoPcu4eTFAKaZcY+swFl2yUh5zG8pBxIE6ncNReLOu6Brai6w+SEG/aCvjwFqxyhM');
INSERT INTO `t_user_np` VALUES ('159', '冀J6966J', '周银库', '13673272924', '', '123456', '0', '沧运集团', '0', '0', '0', '', 'e1848d0c71c080c122168e8cbbfee52a', '', '', '');
INSERT INTO `t_user_np` VALUES ('160', '冀J6198F', '王凤玲', '13833760847', '', '19801116', '0', '沧运集团', '0', '0', '0', '', '5a69fb4a5f8e33d020618f9793516a0e', '', '', '');
INSERT INTO `t_user_np` VALUES ('161', '冀J6771F', '吕名洋', '15732778390', '13111706670', '123456', '0', '沧运集团', '3', '0', '399', '869654013008655', 'e5a26958e1b6438a6cad7c6a77b1f0b9', '2017-07-05 09:55:08', '2017-07-08 09:55:08', 'UBGaTQw6FWuimzDk8HdZdUaUFUBfyqzjlnEW8dotaIic6p0gxa0yRGXxr9ejyjCXXHCV90Zlbt2RIeaVuJXK0Ne1h1OsneDW');
INSERT INTO `t_user_np` VALUES ('162', '冀JCM792', '隋淑杰', '13013226223', '', '123456', '0', '沧运集团', '0', '0', '0', '', 'e1848d0c71c080c122168e8cbbfee52a', '', '', '');
INSERT INTO `t_user_np` VALUES ('163', '冀JCM951', '董谊森', '15931721081', '', '123456', '0', '沧运集团', '0', '0', '0', '', 'c0a5578e0bbae5db5838e1b582762238', '', '', '');
INSERT INTO `t_user_np` VALUES ('164', '冀J1362D', '张健', '13931765084', '', '123456', '0', '沧运集团', '0', '0', '0', '', 'e1848d0c71c080c122168e8cbbfee52a', '', '', '');
INSERT INTO `t_user_np` VALUES ('165', '冀J5393E', '王国良', '13832772474', '18632728513', '158666', '0', '沧运集团', '4', '5', '146', '869654012696351', '9c456308ca0e53c6290ebc83e88d1ca8', '', '', 'XtzG4Bqtdm9SqvSCE0EHHvhYfPELNhbtAGGi7mVAQFI7Agc/wV5bdJwfPNcHW27EY/FaDb9LFbqt+KXqSp/yS9LGM2qnzkur');
INSERT INTO `t_user_np` VALUES ('166', '冀J2372E', '刘勇', '13930794375', '', '123456', '0', '沧运集团', '0', '0', '0', '', 'e1848d0c71c080c122168e8cbbfee52a', '', '', '');
INSERT INTO `t_user_np` VALUES ('167', '冀J0897J', '赵洪力', '13932750386', '15613776186', '123456', '0', '沧运集团', '3', '7', '260', '869654013254481', '45a781a8d918476bf21fb24a570ea6d9', '2017-07-05 08:37:55', '2017-07-08 08:37:55', 'jta1ebbFhdqob1int4QQnPhYfPELNhbtAGGi7mVAQFI7Agc/wV5bdB/Vlvewfw6U0mOYrGm7i7Oekh+ztV4TItVQdIE7sgQe');
INSERT INTO `t_user_np` VALUES ('168', '冀J7902E', '何秀霞', '13785757390', '', '123456', '0', '沧运集团', '0', '0', '0', '', 'e1848d0c71c080c122168e8cbbfee52a', '', '', '');
INSERT INTO `t_user_np` VALUES ('169', '冀J7932D', '刘书芳', '13131703822', '18632728095', '123456', '0', '沧运集团', '3', '7', '86', '869654012696856', '59c49b47ea09eabd8f178b007b055a57', '', '', 'Zkpu90TxN1AfCXbGDOiVawrefYIE2gosfFC6nnZpTdL2ES8X9s3d0KJiEuiO3XPsYVM95wXKJa0Ia0yDwEZZH6gfsi6JZaZX');
INSERT INTO `t_user_np` VALUES ('170', '冀J3095D', '王建强', '15130748660', '18632728336', '132928', '0', '沧运集团', '4', '3', '93', '869654012696823', 'f9938c7dd86201e75a5b3b2083161916', '', '', 'zW+521xpmJNkDzTiQAG2/ul0xcjFVEywoPcu4eTFAKaZcY+swFl2yW3YyS7kROoJoClZJ3jaojBrai6w+SEG/djMbciOytqR');
INSERT INTO `t_user_np` VALUES ('171', '冀J2925E', '陈文玲', '13722476722', '13166562869', '123456', '0', '沧运集团', '4', '0', '0', '', '11e6efaaa28e8fab152da97dd711a0e1', '', '', '');
INSERT INTO `t_user_np` VALUES ('172', '冀J5635E', '刘柱', '13803236875', '18632728309', '113120', '0', '沧运集团', '4', '4', '247', '869654012696641', '3f3ed6e7791653798931aa0c9bc2e324', '', '', 'ghzDvl2e06EYaBXoq0sCYel0xcjFVEywoPcu4eTFAKaZcY+swFl2yfe4x/Kef8N45EcoNTrDRz9rai6w+SEG/ao0s7nA7Kf5');
INSERT INTO `t_user_np` VALUES ('173', '冀J6597H', '吴晓宇', '13323172188', '18632727765', '20150316', '0', '沧运集团', '4', '5', '162', '869654012696633', 'd3247fccb519d77d1d77f4fdf50023b2', '', '', '4Gxa21tjoYrKf6jiUv96vOl0xcjFVEywoPcu4eTFAKaZcY+swFl2ya8B+nstXaVMG+VDba91IHudH632szWbeYDO9mZzJR6A');
INSERT INTO `t_user_np` VALUES ('174', '冀J6871F', '刘义鹏', '13932711740', '18632729003', '040511', '0', '沧运集团', '4', '7', '362', '869654012697201', 'db3de3a40a3b0165733658e8e394870f', '2017-06-22 12:25:26', '2017-06-25 12:25:26', 'Srmydoc8YYSimzDk8HdZdUaUFUBfyqzjlnEW8dotaIic6p0gxa0yRFhzDOlFTXMpP+XtAx3uuB8FJxBXBwrqD5NXkvi/LIgo');
INSERT INTO `t_user_np` VALUES ('175', '冀J7701F', '李希明', '15931726905', '18632729107', '031231', '0', '沧运集团', '4', '3', '74', '869654013008341', '54db1442f688b8304be3b45e0f1ba266', '2017-06-28 18:50:31', '2017-07-01 18:50:31', 'EZsvzb6Kl7d4v3HTNqOROPhYfPELNhbtAGGi7mVAQFL1ctwYttAWXuJx3JAZV/mKT8sZjq/m1gV8eBmTfsKBk5c6yIXrd85J');
INSERT INTO `t_user_np` VALUES ('176', '冀J5132D', '刘桂英', '13733271389', '', '123456', '0', '沧运集团', '0', '0', '0', '', 'e1848d0c71c080c122168e8cbbfee52a', '', '', '');
INSERT INTO `t_user_np` VALUES ('177', '冀J3755F', '董洪明', '13730585007', '18632728521', '120403', '0', '沧运集团', '4', '1', '101', '869654012696187', '46c830264bd0ba38768bcbfa23c9c0aa', '2017-07-03 21:33:26', '2017-07-06 21:33:26', 'gNxvd1XEE02DOrjfcSe/VPhYfPELNhbtAGGi7mVAQFI7Agc/wV5bdJ5eDIqXnrf52Ta0GjsoLKGt+KXqSp/ySxShZJ+ERiw3');
INSERT INTO `t_user_np` VALUES ('178', '冀J2975D', '蔡桂成', '13722701673', '13111703328', '123456', '0', '沧运集团', '4', '1', '138', '869654013008895', 'eb95d8450e021969672a17d81fdd9c4a', '2017-06-25 16:05:34', '2017-06-28 16:05:34', '6o/szXxDZJRWikGbl1sjjOl0xcjFVEywoPcu4eTFAKaZcY+swFl2ySx5gCWn2eQiTSS0p8HrDdVwjArTnc02KCmSQu9RtoVs');
INSERT INTO `t_user_np` VALUES ('179', '冀JCK235', '提洪亮', '13230787688', '18632728503', '123456', '0', '沧运集团', '4', '5', '249', '869654013008374', 'd8a5871eff04405a0e07c59bc171ca8d', '2017-06-16 04:50:41', '2017-06-19 04:50:41', 'eUu9uGzeqzEsUUGh+gYTFvhYfPELNhbtAGGi7mVAQFI7Agc/wV5bdA/UMVBzMo8I5T7F7au1frWt+KXqSp/yS3EIjAzEo/av');
INSERT INTO `t_user_np` VALUES ('180', '冀JBS532', '黄跃升', '18832719886', '', '123456', '0', '沧运集团', '0', '0', '0', '', 'e1848d0c71c080c122168e8cbbfee52a', '', '', '');
INSERT INTO `t_user_np` VALUES ('181', '冀J7683D', '张俊芳', '13831729977', '', '123456', '0', '沧运集团', '0', '0', '0', '', 'e1848d0c71c080c122168e8cbbfee52a', '', '', '');
INSERT INTO `t_user_np` VALUES ('182', '冀JCM803', '邢玉发', '13930715485', '18632728729', '123456', '0', '沧运集团', '3', '8', '302', '869654012696849', '5868f04c73a7d7a856f83598fec226bf', '', '', 'b/dDzgizcN0sZxRIfF5hrel0xcjFVEywoPcu4eTFAKaZcY+swFl2yZzgFHnR92OFZNpR2ZXz4+1rai6w+SEG/bVY1ydSjhXz');
INSERT INTO `t_user_np` VALUES ('183', '冀J7112F', '苗玉民', '13582748762', '18631799217', '123456', '0', '沧运集团', '3', '0', '66', '869654012727024', 'c400ec2098017edd7aeec93cd3a24959', '', '', 'NCnvBPFe1Env/2wDm5A65kaUFUBfyqzjlnEW8dotaIic6p0gxa0yRJwUW5C11hs5P+XtAx3uuB98HWmxfGdS2oEpiECRBJhX');
INSERT INTO `t_user_np` VALUES ('184', '冀J3583E', '刘鹏', '13722702636', '18632728826', '123456', '0', '沧运集团', '3', '10', '465', '869654012696906', '069cebed22e84dc37212889b74a20881', '2017-06-28 20:36:24', '2017-07-01 20:36:24', 'aJDe3h7PP5a+vmq8AO/JePhYfPELNhbtAGGi7mVAQFI7Agc/wV5bdHq/kD6XScrd5T7F7au1frXzzXP0WYFqjwJiwl0BmIVc');
INSERT INTO `t_user_np` VALUES ('185', '冀J8725E', '张德林', '18731739432', '18632728263', '040511', '0', '沧运集团', '5', '1', '317', '869654012727297', 'f9ee432e411daf737cd7afa498a65919', '2017-07-05 13:28:13', '2017-07-08 13:28:13', 'TyRB7LCZhPCIMWTgIln8mOl0xcjFVEywoPcu4eTFAKaZcY+swFl2yf9U49RXqWK0zDmQ5EAod3hrai6w+SEG/dKbKEVWPeAX');
INSERT INTO `t_user_np` VALUES ('186', '冀J6576D', '叶建永', '13831753561', '18632728165', '123321', '0', '沧运集团', '3', '4', '219', '869654012697193', 'd14138326463ea4864baf046a494b67c', '', '', 'oB62aK6AW3DfPxN2qIu6VkaUFUBfyqzjlnEW8dotaIic6p0gxa0yREF8oL0YjSrJP+XtAx3uuB/zqlqrE6g6hQFJFVK3+FLp');
INSERT INTO `t_user_np` VALUES ('187', '冀J7726D', '张国强', '13833754977', '18632728758', '772618', '0', '沧运集团', '4', '7', '506', '869654012697185', '33723793019b322940227004e8890d8d', '2017-06-06 10:25:58', '2017-06-09 10:25:58', '8oU6hVtx59sfF5aMdey+XvhYfPELNhbtAGGi7mVAQFI7Agc/wV5bdOWjQ7iBNXPMIwDI3Enyh6giMFXumd19Q93b11fQLevw');
INSERT INTO `t_user_np` VALUES ('188', '冀J9271F', '李龙飞', '15226711006', '18632728315', '123456', '0', '沧运集团', '4', '0', '106', '869654012696153', 'e4040a6415ba5b2fa379fbeb62ef1773', '', '', 'g3bovl7Rf4aDKzMK9JYUw+l0xcjFVEywoPcu4eTFAKaZcY+swFl2yaxuHv2j2Ja1N/BnBchl4P9rai6w+SEG/XtMWKGpiSS7');
INSERT INTO `t_user_np` VALUES ('189', '冀JCG923', '张华新', '13831797985', '17692727923', '920209', '0', '沧运集团', '3', '0', '74', '869654012696963', 'b776a965287f390151efc12d9c566a95', '2017-06-29 19:35:07', '2017-07-02 19:35:07', 'yxXXGpUHKNd3bMHDCmJB4el0xcjFVEywoPcu4eTFAKaZcY+swFl2ybQXZgSilGE3XxyEH/yrNA9maQVloVDDkTj5JdP7liOf');
INSERT INTO `t_user_np` VALUES ('190', '冀JBS367', '李立勇', '13831752830', '15632723830', '13831752830', '0', '沧运集团', '5', '3', '271', '869654012728774', '27d3b96d37853e1f1ce3805d4e1dec96', '', '', 'I2zAAE9BFrFNmKidoPwi3EaUFUBfyqzjlnEW8dotaIic6p0gxa0yRPDmvb+Sh7FVISkUoqtn8/CgcVnHSRaCute1h1OsneDW');
INSERT INTO `t_user_np` VALUES ('191', '冀J6533J', '刘小兵', '18730798725', '', '123456', '0', '沧运集团', '0', '0', '0', '', 'e1848d0c71c080c122168e8cbbfee52a', '', '', '');
INSERT INTO `t_user_np` VALUES ('192', '冀JCM703', '张晓苗', '18031731159', '18632729661', '921129', '0', '沧运集团', '3', '14', '385', '869654013116128', 'e06b1cfe9e2fea4fa51f0a10bfd6da39', '', '', '3uoOMuD6fmFWikGbl1sjjOl0xcjFVEywoPcu4eTFAKaZcY+swFl2yRLt/HL1fPxWN/BnBchl4P8ToDJ0pfkqls1JFi7PA7BU');
INSERT INTO `t_user_np` VALUES ('193', '冀JCM725', '孙建中', '13393372718', '18632729569', '123456', '0', '沧运集团', '3', '2', '67', '869654012788497', 'bdf4e28c4edfd3bb33d30242c4344ed2', '', '', 'TqBgRPq5B0HACsUuDNxEsul0xcjFVEywoPcu4eTFAKaZcY+swFl2yePXreRSlfcLOTNHUrNEtm0ToDJ0pfkqlgIds3BjfJCU');
INSERT INTO `t_user_np` VALUES ('194', '冀JTE527', '高红智', '15075786338', '18632728022', '123456', '0', '沧运集团', '4', '0', '140', '869654012696732', '2dc0fd3bab1eda34d5ae698bbaa4db27', '', '', 'JvBnA7LtlmfsVIM43nhqRPhYfPELNhbtAGGi7mVAQFI7Agc/wV5bdFr0fe6SI/0kT8sZjq/m1gXE0c5Gh1AAta4Lp5SDmJwb');
INSERT INTO `t_user_np` VALUES ('195', '冀J992NA', '付行亭', '13831702718', '18632728195', '631020', '0', '沧运集团', '3', '1', '42', '869654012695965', '9dbb721de490ca04ed11486c0f495f7c', '', '', '7vAMbpJegafDX7Vt10kdFel0xcjFVEywoPcu4eTFAKaZcY+swFl2yc1FjRjHzZ6TjvZlfttY+JZrai6w+SEG/UY/EOT+I3Wu');
INSERT INTO `t_user_np` VALUES ('196', '冀J2651A', '张洪义', '13931721191', '18632728128', '35168', '0', '沧运集团', '4', '3', '150', '869654012697045', '95923affcb76f78b8a074233b1d68d63', '2017-06-18 18:47:52', '2017-06-21 18:47:52', '9vdyZYTC+ILfPxN2qIu6VkaUFUBfyqzjlnEW8dotaIic6p0gxa0yRHPZQMtCez8NP+XtAx3uuB+AArunyMNFNom0TDf42adu');
INSERT INTO `t_user_np` VALUES ('197', '冀JCK775', '张金生', '13833737440', '18631710375', '123456', '0', '沧运集团', '4', '2', '193', '869654013116516', 'aac80c85eb418a65e25f9089e5447b73', '', '', 'TjzhezYFuK3X+yqxzR/Hrel0xcjFVEywoPcu4eTFAKaZcY+swFl2ye2EnjKb3BIIDFhDjVjFme8Q2GzCdc4tDgtk2HeCLPQm');
INSERT INTO `t_user_np` VALUES ('198', '冀JGQ795', '张春华', '13700385599', '', '123456', '0', '沧运集团', '0', '0', '0', '', 'e1848d0c71c080c122168e8cbbfee52a', '', '', '');
INSERT INTO `t_user_np` VALUES ('199', '冀J28C88', '尹建军', '13832750515', '18632728500', '258369', '0', '沧运集团', '4', '0', '289', '869654012695692', 'a573ea7c998b5de62730e338d22cd4de', '', '', 'svwyx/tmyPMfCXbGDOiVawrefYIE2gosfFC6nnZpTdLjczj7dLVSG29uZ903L6HRYVM95wXKJa1Hh6JY3M2Ix2AtjP0p50xD');
INSERT INTO `t_user_np` VALUES ('200', '冀JQL693', '李建强', '13131749566', '18632728619', '000000', '0', '沧运集团', '4', '1', '100', '869654012696948', '47d6b47729408a12b68483dfa48179d7', '', '', 'jWA/cAQgccmlQciCGik71Ol0xcjFVEywoPcu4eTFAKaZcY+swFl2yWoHvcOoSGRYRbRaLd6lEwprai6w+SEG/eoxdrzwtfSo');
INSERT INTO `t_user_np` VALUES ('201', '冀J8510J', '李国栋', '13832764944', '18632727739', '789789', '0', '沧运集团', '4', '3', '80', '869654012695817', '87bc80464f8cd11826eec2bd7facf03c', '', '', 'k8nQSUODiSNEvC5iyTnq50aUFUBfyqzjlnEW8dotaIic6p0gxa0yRGqGrMTsIfWjP+XtAx3uuB9rMhMsWYDsqy8PxBPlxCuS');
INSERT INTO `t_user_np` VALUES ('202', '冀J3703D', '张德路', '15132721167', '', '123456', '0', '沧运集团', '0', '0', '0', '', 'e1848d0c71c080c122168e8cbbfee52a', '', '', '');
INSERT INTO `t_user_np` VALUES ('203', '冀J151KA', '苗玉健', '17732392567', '18632729233', '123456', '0', '沧运集团', '3', '4', '237', '869654013164961', '1444a084d2c9382d8daee5df441d3477', '2017-07-01 16:59:56', '2017-07-04 16:59:56', '03vt55N8x8Tv1N2NCAOeYvhYfPELNhbtAGGi7mVAQFLNwhjOlUgVEG2hFWc/F9YO1564ZM7yIOtwOO1ILHZa36H4RaxIDBhc');
INSERT INTO `t_user_np` VALUES ('204', '冀J729NM', '张伟', '13363698771', '18631717752', '123456', '0', '沧运集团', '3', '3', '120', '869654013007558', 'bbd82465637b242bf50f276bb9524eaf', '', '', 'u26P0xNVfBxY4lgaq/zfM0aUFUBfyqzjlnEW8dotaIjsK2t856wMYwYm/Rw8ZJjNP+XtAx3uuB+DrtyL0NpDoSDCVQzn+Dpv');
INSERT INTO `t_user_np` VALUES ('205', '冀J6952F', '尚生', '18632728900', '18632728900', '198403053911', '0', '沧运集团', '3', '5', '197', '869654012696898', '38d4f1256e52db2815dbe5877f88b0df', '', '', 'Qx3dGMqpjTTX3IsVgDFpgPhYfPELNhbtAGGi7mVAQFI7Agc/wV5bdLUwDZ6OGS7n1564ZM7yIOs6iHrG97Urht/s1/sOIfQ+');
INSERT INTO `t_user_np` VALUES ('206', '冀J2867F', '曹厚清', '13231779399', '18632728672', '123456', '0', '沧运集团', '3', '1', '56', '869654012696864', '9331c81280b65a3cbc1fc7fb8ee67f3f', '', '', 'V4/DXp5UMUJ5mtZGx34cPPhYfPELNhbtAGGi7mVAQFI7Agc/wV5bdPrQJtqpfPqcIwDI3Enyh6hSBRFikUbGp6h8ILsp8eIS');
INSERT INTO `t_user_np` VALUES ('207', '冀J2908H', '周俊合', '13931768106', '18632728005', '123456', '0', '沧运集团', '4', '2', '28', '869654012696328', 'd7691468c5665cf499db54070112af83', '2017-06-04 12:10:18', '2017-06-07 12:10:18', 'KUkyCSz/SRSxWVs7ueT68el0xcjFVEywoPcu4eTFAKaZcY+swFl2ySsds9l7L+VHKYZdPgUcd5trai6w+SEG/UWCXt9fXrTu');
INSERT INTO `t_user_np` VALUES ('888', '晋AQQ444', '张忠政', '18135110832', '18135110832', '123456', '0', '其他', '3', '0', '12', '864394010582510', 'bd2b59eb582c4c1e5f725bae555f16ea', '', '', 'YXFTySjL8SJpcvT9xMC+mOl0xcjFVEywoPcu4eTFAKaZcY+swFl2yQOdMfbMDaH+FdDqxGQ/w8kQe/HephsCQcTMwIXTLXQV');
INSERT INTO `t_user_np` VALUES ('889', '晋AQQ555', '张国平', '15343406720', '15343406720', '123456', '0', '其他', '2', '0', '4', '', '325b3ea544bda9399f352f903769f4e6', '', '', '');
