--数据库文件--
SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for tw_parameters
-- ----------------------------
DROP TABLE IF EXISTS `tw_parameters`;
CREATE TABLE `tw_parameters` (
  `parameter_uuid` varchar(32) NOT NULL,
  `flag` int(11) DEFAULT NULL,
  `modify_time` datetime DEFAULT NULL,
  `parameter_class_name` longtext,
  `parameter_group` varchar(200) DEFAULT NULL,
  `parameter_key` longtext,
  `parameter_puuid` varchar(32) DEFAULT NULL,
  `parameter_value` longtext,
  PRIMARY KEY (`parameter_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tw_source
-- ----------------------------
DROP TABLE IF EXISTS `tw_source`;
CREATE TABLE `tw_source` (
  `source_uuid` varchar(32) NOT NULL,
  `source_channelname` varchar(200) DEFAULT NULL,
  `source_systemname` varchar(200) DEFAULT NULL,
  `source_type` int(11) DEFAULT NULL,
  PRIMARY KEY (`source_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- ----------------------------
-- Table structure for tw_session
-- ----------------------------
DROP TABLE IF EXISTS `tw_session`;
CREATE TABLE `tw_session` (
  `session_uuid` varchar(255) NOT NULL,
  `session_begin_time` datetime DEFAULT NULL,
  `session_end_time` datetime DEFAULT NULL,
  `session_param` varchar(255) DEFAULT NULL,
  `source_uuid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`session_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- ----------------------------
-- Table structure for tw_group
-- ----------------------------
DROP TABLE IF EXISTS `tw_group`;
CREATE TABLE `tw_group` (
  `group_uuid` varchar(32) NOT NULL,
  `flag` int(11) DEFAULT NULL,
  `group_name` varchar(200) DEFAULT NULL,
  `modify_time` datetime DEFAULT NULL,
  `source_uuid` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`group_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for tw_role
-- ----------------------------
DROP TABLE IF EXISTS `tw_role`;
CREATE TABLE `tw_role` (
  `role_uuid` varchar(32) NOT NULL,
  `flag` int(11) DEFAULT NULL,
  `modify_time` datetime DEFAULT NULL,
  `role_name` varchar(32) DEFAULT NULL,
  `source_uuid` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`role_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tw_resources
-- ----------------------------
DROP TABLE IF EXISTS `tw_resources`;
CREATE TABLE `tw_resources` (
  `resources_uuid` varchar(32) NOT NULL,
  `flag` int(11) DEFAULT NULL,
  `modify_time` datetime DEFAULT NULL,
  `resources_name` varchar(32) DEFAULT NULL,
  `resources_parameter` varchar(32) DEFAULT NULL,
  `source_uuid` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`resources_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



-- ----------------------------
-- Table structure for tw_group_role
-- ----------------------------
DROP TABLE IF EXISTS `tw_group_role`;
CREATE TABLE `tw_group_role` (
  `grouprole_uuid` varchar(32) NOT NULL,
  `group_uuid` varchar(32) DEFAULT NULL,
  `modify_time` datetime DEFAULT NULL,
  `role_uuid` varchar(32) DEFAULT NULL,
  `source_uuid` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`grouprole_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



-- ----------------------------
-- Table structure for tw_scope
-- ----------------------------
DROP TABLE IF EXISTS `tw_scope`;
CREATE TABLE `tw_scope` (
  `scope_uuid` varchar(32) NOT NULL,
  `modify_time` datetime DEFAULT NULL,
  `scope_name` varchar(200) DEFAULT NULL,
  `scope_puuid` varchar(32) DEFAULT NULL,
  `source_uuid` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`scope_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for tw_rolescopes
-- ----------------------------
DROP TABLE IF EXISTS `tw_rolescopes`;
CREATE TABLE `tw_rolescopes` (
  `rolepower_uuid` varchar(32) NOT NULL,
  `scope_uuid` varchar(32) NOT NULL,
  PRIMARY KEY (`rolepower_uuid`,`scope_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tw_role_power
-- ----------------------------
DROP TABLE IF EXISTS `tw_role_power`;
CREATE TABLE `tw_role_power` (
  `rolepower_uuid` varchar(32) NOT NULL,
  `resources_isscope` int(11) DEFAULT NULL,
  `resources_power` longtext,
  `resources_uuid` varchar(32) DEFAULT NULL,
  `role_uuid` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`rolepower_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tw_source_conf
-- ----------------------------
DROP TABLE IF EXISTS `tw_source_conf`;
CREATE TABLE `tw_source_conf` (
  `sourceconf_uuid` varchar(32) NOT NULL,
  `flag` int(11) DEFAULT NULL,
  `modify_time` datetime DEFAULT NULL,
  `sourceconf_groupname` varchar(200) DEFAULT NULL,
  `sourceconf_key` varchar(200) DEFAULT NULL,
  `sourceconf_value` longtext,
  `source_uuid` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`sourceconf_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tw_store
-- ----------------------------
DROP TABLE IF EXISTS `tw_store`;
CREATE TABLE `tw_store` (
  `store_uuid` varchar(32) NOT NULL,
  `modifytime` datetime DEFAULT NULL,
  `store_name` varchar(200) DEFAULT NULL,
  `store_parameter` longtext,
  `store_pwd` varchar(200) DEFAULT NULL,
  `store_timeout` int(11) DEFAULT NULL,
  `store_url` longtext,
  `store_username` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`store_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- ----------------------------
-- Table structure for tw_segment
-- ----------------------------
DROP TABLE IF EXISTS `tw_segment`;
CREATE TABLE `tw_segment` (
  `segment_uuid` varchar(32) NOT NULL,
  `segment_name` varchar(200) DEFAULT NULL,
  `segment_attr` longtext,
  `segment_pid` varchar(32) DEFAULT NULL,
  `modify_time` datetime DEFAULT NULL,
  PRIMARY KEY (`segment_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- ----------------------------
-- Table structure for tw_pub_attr
-- ----------------------------
DROP TABLE IF EXISTS `tw_pub_attr`;
CREATE TABLE `tw_pub_attr` (
  `pubattr_uuid` varchar(32) NOT NULL,
  `pubattr_datatype` varchar(200) DEFAULT NULL,
  `modify_time` datetime DEFAULT NULL,
  `pubattr_attrname` varchar(200) DEFAULT NULL,
  `source_uuid` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`pubattr_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- ----------------------------
-- Table structure for tw_user
-- ----------------------------
DROP TABLE IF EXISTS `tw_user`;
CREATE TABLE `tw_user` (
  `user_uuid` varchar(32) NOT NULL,
  `email` varchar(200) DEFAULT NULL,
  `flag` int(11) DEFAULT NULL,
  `mobile` varchar(200) DEFAULT NULL,
  `modify_time` datetime DEFAULT NULL,
  `store_uuid` varchar(32) DEFAULT NULL,
  `user_id` varchar(32) DEFAULT NULL,
  `user_name` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`user_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tw_pwd
-- ----------------------------
DROP TABLE IF EXISTS `tw_pwd`;
CREATE TABLE `tw_pwd` (
  `pwd_uuid` varchar(32) NOT NULL,
  `modify_time` datetime DEFAULT NULL,
  `pwd_policy` varchar(200) DEFAULT NULL,
  `pwd_word` longtext,
  `pwd_secuertiy` varchar(200) DEFAULT NULL,
  `user_uuid` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`pwd_uuid`),
  UNIQUE KEY `UK_rjjmb00tqwgvijs2f25o9dq8s` (`user_uuid`),
  KEY `FK_rjjmb00tqwgvijs2f25o9dq8s` (`user_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for tw_user_ext
-- ----------------------------
DROP TABLE IF EXISTS `tw_user_ext`;
CREATE TABLE `tw_user_ext` (
  `userext_uuid` varchar(32) NOT NULL,
  `private_attr` longtext,
  `user_uuid` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`userext_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tw_user_pubattr
-- ----------------------------
DROP TABLE IF EXISTS `tw_user_pubattr`;
CREATE TABLE `tw_user_pubattr` (
  `userpubattr_uuid` varchar(32) NOT NULL,
  `pubattr_uuid` varchar(32) DEFAULT NULL,
  `userpubattr_value` longtext,
  `user_uuid` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`userpubattr_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tw_user_role
-- ----------------------------
DROP TABLE IF EXISTS `tw_user_role`;
CREATE TABLE `tw_user_role` (
  `userrole_uuid` varchar(32) NOT NULL,
  `group_uuid` varchar(32) DEFAULT NULL,
  `modify_time` datetime DEFAULT NULL,
  `role_uuid` varchar(32) DEFAULT NULL,
  `user_uuid` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`userrole_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tw_user_segment
-- ----------------------------
DROP TABLE IF EXISTS `tw_user_segment`;
CREATE TABLE `tw_user_segment` (
  `user_uuid` varchar(32) NOT NULL,
  `segment_uuid` varchar(32) NOT NULL,
  PRIMARY KEY (`user_uuid`,`segment_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tw_user_state
-- ----------------------------
DROP TABLE IF EXISTS `tw_user_state`;
CREATE TABLE `tw_user_state` (
  `user_state_uuid` varchar(32) NOT NULL,
  `user_state_lastlogintime` datetime DEFAULT NULL,
  `user_state_lastlogouttime` datetime DEFAULT NULL,
  `user_state_pwd_chg_time` datetime DEFAULT NULL,
  `modify_time` datetime DEFAULT NULL,
  `user_state_endtime` datetime DEFAULT NULL,
  `user_state_fail_cnt` int(11) DEFAULT NULL,
  `user_state_starttime` datetime DEFAULT NULL,
  `user_state_status` varchar(200) DEFAULT NULL,
  `user_state_sucess_cnt` int(11) DEFAULT NULL,
  `user_uuid` varchar(32) DEFAULT NULL,
  `user_satae_endtime` datetime DEFAULT NULL,
  `user_satae_status` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`user_state_uuid`),
  UNIQUE KEY `UK_o5gfn6fl2nrn5rsqmfnxun1iq` (`user_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


ALTER TABLE `tw_resources` ADD CONSTRAINT `FK_resources_R_source` FOREIGN KEY (`source_uuid`) REFERENCES `tw_source` (`source_uuid`);
ALTER TABLE `tw_group` ADD CONSTRAINT `FK_group_R_source` FOREIGN KEY (`source_uuid`) REFERENCES `tw_source` (`source_uuid`);
ALTER TABLE `tw_role` ADD CONSTRAINT `FK_role_R_source` FOREIGN KEY (`source_uuid`) REFERENCES `tw_source` (`source_uuid`);
ALTER TABLE `tw_group_role` ADD  CONSTRAINT `FK_group_role_R_source` FOREIGN KEY (`source_uuid`) REFERENCES `tw_source` (`source_uuid`);
ALTER TABLE `tw_group_role` ADD  CONSTRAINT `FK_group_role_R_group` FOREIGN KEY (`group_uuid`) REFERENCES `tw_group` (`group_uuid`);
ALTER TABLE `tw_group_role` ADD  CONSTRAINT `FK_group_role_R_role` FOREIGN KEY (`role_uuid`) REFERENCES `tw_role` (`role_uuid`);
ALTER TABLE `tw_scope` ADD  CONSTRAINT `FK_scope_R_source` FOREIGN KEY (`source_uuid`) REFERENCES `tw_source` (`source_uuid`);
ALTER TABLE `tw_session` ADD CONSTRAINT `FK_session_R_source` FOREIGN KEY (`source_uuid`) REFERENCES `tw_source` (`source_uuid`);
ALTER TABLE `tw_source_conf` ADD CONSTRAINT `FK_source_conf_R_source` FOREIGN KEY (`source_uuid`) REFERENCES `tw_source` (`source_uuid`);
ALTER TABLE `tw_pub_attr` ADD  CONSTRAINT `FK_pub_attr_R_source` FOREIGN KEY (`source_uuid`) REFERENCES `tw_source` (`source_uuid`);


ALTER TABLE  `tw_rolescopes` ADD  CONSTRAINT `FK_rolescopes_R_scope` FOREIGN KEY (`scope_uuid`) REFERENCES `tw_scope` (`scope_uuid`);
ALTER TABLE  `tw_rolescopes` ADD   CONSTRAINT `FK_rolescopes_R_role_power` FOREIGN KEY (`rolepower_uuid`) REFERENCES `tw_role_power` (`rolepower_uuid`);

ALTER TABLE `tw_user` ADD CONSTRAINT `FK_user_R_store` FOREIGN KEY (`store_uuid`) REFERENCES `tw_store` (`store_uuid`);


ALTER TABLE `tw_role_power` ADD  CONSTRAINT `FK_role_power_R_role` FOREIGN KEY (`role_uuid`) REFERENCES `tw_role` (`role_uuid`);
ALTER TABLE `tw_role_power` ADD  CONSTRAINT `FK_role_power_R_resources` FOREIGN KEY (`resources_uuid`) REFERENCES `tw_resources` (`resources_uuid`);


ALTER TABLE  `tw_user_ext` ADD  CONSTRAINT `FK_user_ext_R_user` FOREIGN KEY (`user_uuid`) REFERENCES `tw_user` (`user_uuid`);

ALTER TABLE  `tw_user_pubattr` ADD CONSTRAINT `FK_user_pubattr_R_pub_attr` FOREIGN KEY (`pubattr_uuid`) REFERENCES `tw_pub_attr` (`pubattr_uuid`);
ALTER TABLE  `tw_user_pubattr` ADD CONSTRAINT `FK_user_pubattr_R_user` FOREIGN KEY (`user_uuid`) REFERENCES `tw_user` (`user_uuid`);



ALTER TABLE  `tw_user_role` ADD  CONSTRAINT `FK_user_role_R_role` FOREIGN KEY (`role_uuid`) REFERENCES `tw_role` (`role_uuid`);
ALTER TABLE  `tw_user_role` ADD CONSTRAINT `FK_user_role_R_group` FOREIGN KEY (`group_uuid`) REFERENCES `tw_group` (`group_uuid`);
ALTER TABLE  `tw_user_role` ADD CONSTRAINT `FK_user_role_R_user` FOREIGN KEY (`user_uuid`) REFERENCES `tw_user` (`user_uuid`);



ALTER TABLE  `tw_user_segment` ADD  CONSTRAINT `FK_user_segment_R_user` FOREIGN KEY (`user_uuid`) REFERENCES `tw_user` (`user_uuid`);
ALTER TABLE  `tw_user_segment` ADD   CONSTRAINT `FK_user_segment_R_segment` FOREIGN KEY (`segment_uuid`) REFERENCES `tw_segment` (`segment_uuid`);




 ALTER TABLE `tw_user_state` ADD CONSTRAINT `FK_user_state_R_user` FOREIGN KEY (`user_uuid`) REFERENCES `tw_user` (`user_uuid`);
 ALTER TABLE `tw_pwd` ADD CONSTRAINT `FK_pwd_R_user` FOREIGN KEY (`user_uuid`) REFERENCES `tw_user` (`user_uuid`);