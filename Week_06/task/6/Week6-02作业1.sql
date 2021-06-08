drop table if exists `activity_invite_record`;
CREATE TABLE `activity_invite_record`
(
    `id`                bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
    `activity_id`       bigint unsigned NOT NULL COMMENT '活动ID',
    `activity_type`     tinyint                  DEFAULT NULL COMMENT '活动类型',
    `channel_code`      varchar(50)              DEFAULT NULL COMMENT '渠道编码',
    `inviter_id`        bigint unsigned          DEFAULT NULL COMMENT '邀请人用户ID',
    `inviter_name`      varchar(30)              DEFAULT NULL COMMENT '邀请人姓名',
    `inviter_nickname`  varchar(50)              DEFAULT NULL COMMENT '邀请人昵称',
    `inviter_telephone` varchar(11)              DEFAULT NULL COMMENT '邀请人手机号码',
    `invitee_id`        bigint unsigned          DEFAULT NULL COMMENT '受邀人用户ID',
    `invitee_name`      varchar(30)              DEFAULT NULL COMMENT '受邀人姓名',
    `invitee_nickname`  varchar(50)              DEFAULT NULL COMMENT '受邀人手机号码',
    `invitee_telephone` varchar(11)              DEFAULT NULL COMMENT '受邀人手机号码',
    `invite_time`       datetime                 DEFAULT NULL COMMENT '邀请时间',
    `attend_time`       datetime                 DEFAULT NULL COMMENT '参与时间',
    `invite_status`     tinyint unsigned         DEFAULT NULL COMMENT '邀请状态（待绑定-0、已绑定-1、已生效-2、已失效-3）',
    `status`            tinyint unsigned         DEFAULT NULL COMMENT '状态,1生效，0删除',
    `create_time`       datetime        NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `modify_time`       datetime        NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
    PRIMARY KEY (`id`),
    KEY `idx_activity_id` (`activity_id`, `inviter_telephone`) USING BTREE,
    KEY `idx_inviter_id` (`inviter_id`),
    KEY `idx_invitee_id` (`invitee_id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 0
  DEFAULT CHARSET = utf8mb4 COMMENT ='邀请有礼邀请记录';
#手机号长度固定，使用char类型代替varchar：少存储一个字节（varchar的长度），数据变更时不用计算长度了，减少了计算；
#手机号使用默认值代替null，列为null不走索引，不利于以后数据列添加索引；
#时间字段使用了int代替了datetime：减少存储（int:4byte,datetime:8byte）,便于计算
#所有default null的字段加上默认值
alter table activity_invite_record
    change `activity_type` `activity_type` tinyint DEFAULT 0 COMMENT '活动类型' after activity_id;
alter table activity_invite_record
    add column `biz_id` varchar(50) DEFAULT '' COMMENT '业务线ID' after activity_type;
alter table activity_invite_record
    change `channel_code` `channel_code` varchar(50) DEFAULT '' COMMENT '渠道编码' after biz_id;
alter table activity_invite_record
    change `inviter_id` `inviter_id` bigint unsigned DEFAULT 0 COMMENT '邀请人用户ID' after channel_code;
alter table activity_invite_record
    change `inviter_name` `inviter_name` varchar(30) DEFAULT '' COMMENT '邀请人姓名' after inviter_id;
alter table activity_invite_record
    change `inviter_nickname` `inviter_nickname` varchar(50) DEFAULT '' COMMENT '邀请人昵称' after inviter_name;
alter table activity_invite_record
    change `inviter_telephone` `inviter_telephone` char(12) DEFAULT '' COMMENT '邀请人手机号码' after inviter_nickname;
alter table activity_invite_record
    change `invitee_id` `invitee_id` bigint unsigned DEFAULT 0 COMMENT '受邀人用户ID' after inviter_telephone;
alter table activity_invite_record
    change `invitee_name` `invitee_name` varchar(30) DEFAULT '' COMMENT '受邀人姓名' after invitee_id;
alter table activity_invite_record
    change `invitee_nickname` `invitee_nickname` varchar(50) DEFAULT '' COMMENT '受邀人手机号码' after invitee_name;
alter table activity_invite_record
    change `invitee_telephone` `invitee_telephone` char(12) DEFAULT '' COMMENT '邀请人手机号码' after invitee_nickname;
alter table activity_invite_record
    change `invite_status` `invite_status` tinyint unsigned DEFAULT 0 COMMENT '邀请状态（待绑定-0、已绑定-1、已生效-2、已失效-3）' after invitee_telephone;
alter table activity_invite_record
    change `invite_time` `invite_time` int unsigned DEFAULT 0 COMMENT '邀请时间' after invite_status;
alter table activity_invite_record
    change `attend_time` `attend_time` int unsigned DEFAULT 0 COMMENT '参与时间' after invite_time;
alter table activity_invite_record
    change `status` `status` tinyint unsigned DEFAULT 0 COMMENT '状态,1生效，0删除' after attend_time;
alter table activity_invite_record
    change `create_time` `create_time` int unsigned DEFAULT 0 COMMENT '创建时间' after status;
alter table activity_invite_record
    change `modify_time` `modify_time` int unsigned DEFAULT 0 COMMENT '修改时间' after create_time;


drop table if exists `activity_award_record`;
CREATE TABLE `activity_award_record`
(
    `id`                     bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
    `activity_id`            bigint unsigned NOT NULL COMMENT '活动ID',
    `biz_id`                 varchar(50)              DEFAULT NULL COMMENT '业务线ID',
    `activity_type`          varchar(100)             DEFAULT NULL COMMENT '活动类型',
    `channel_code`           varchar(50)              DEFAULT NULL COMMENT '渠道编码',
    `user_id`                bigint unsigned          DEFAULT NULL COMMENT '邀请人用户ID',
    `relation_user_id`       bigint unsigned          DEFAULT NULL COMMENT '受邀人用户ID',
    `status`                 tinyint(3) unsigned      DEFAULT '1' COMMENT '状态,1生效，0删除',
    `award_status`           tinyint(3)               DEFAULT NULL COMMENT '奖励状态',
    `award_reason`           tinyint(3)               DEFAULT NULL COMMENT '奖励原因',
    `award_description`      varchar(255)             DEFAULT NULL COMMENT '奖励描述',
    `award_type`             tinyint(3)               DEFAULT NULL COMMENT '奖励类型',
    `instance_id`            varchar(255)             DEFAULT NULL COMMENT '奖励实例ID',
    `award_amount`           int(10)                  DEFAULT NULL COMMENT '奖励金额',
    `remark`                 varchar(255)             DEFAULT NULL COMMENT '备注',
    `invite_invalid_time`    datetime                 DEFAULT NULL COMMENT '邀请失效时间',
    `create_time`            datetime        NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `modify_time`            datetime        NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
    `user_identity_snapshot` tinyint(3)               DEFAULT NULL COMMENT '用户身份快照',
    PRIMARY KEY (`id`),
    KEY `idx_activity_id` (`activity_id`),
    KEY `idx_relation_user_id` (`relation_user_id`),
    KEY `idx_ua_ac_id` (`user_id`, `activity_id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 0
  DEFAULT CHARSET = utf8mb4 COMMENT ='邀请有礼邀请记录';

alter table `activity_award_record` drop index idx_relation_user_id;
alter table `activity_award_record` drop index idx_ua_ac_id;
alter table `activity_award_record` drop index idx_activity_id;
alter table `activity_award_record`
    change `activity_type` `activity_type` varchar(100) DEFAULT '' COMMENT '活动类型' after activity_id;
alter table `activity_award_record`
    change `biz_id` `biz_id` varchar(50) DEFAULT '' COMMENT '业务线ID' after activity_type;
alter table `activity_award_record`
    change `channel_code` `channel_code` varchar(50) DEFAULT '' COMMENT '渠道编码' after biz_id;
alter table `activity_award_record`
    change `award_type` `award_type` tinyint DEFAULT 0 COMMENT '奖励类型' after channel_code;
alter table `activity_award_record`
    change `award_status` `award_status` tinyint DEFAULT 0 COMMENT '奖励状态' after award_type;
alter table `activity_award_record`
    change `instance_id` `award_instance` varchar(255) DEFAULT '' COMMENT '奖励实例ID' after award_status;
alter table `activity_award_record`
    change `award_amount` `award_amount` int DEFAULT 0 COMMENT '奖励金额' after award_instance;
alter table `activity_award_record`
    change `award_reason` `award_reason` tinyint DEFAULT 0 COMMENT '奖励原因' after award_amount;
alter table `activity_award_record`
    change `award_description` `award_description` varchar(255) DEFAULT '' COMMENT '奖励描述' after award_reason;
alter table `activity_award_record`
    change `user_id` `award_user_id` bigint unsigned DEFAULT 0 COMMENT '领奖人用户ID' after award_description;
alter table `activity_award_record`
    change `user_identity_snapshot` `award_user_state` tinyint DEFAULT 0 COMMENT '领奖人用户身份' after award_user_id;
alter table `activity_award_record`
    change `relation_user_id` `extend_attribute1` bigint unsigned DEFAULT 0 COMMENT '扩展属性' after award_user_state;
alter table `activity_award_record`
    change `remark` `remark` varchar(255) DEFAULT '' COMMENT '备注' after extend_attribute1;
alter table `activity_award_record`
    change `status` `status` tinyint unsigned DEFAULT 1 COMMENT '状态1生效，0删除' after remark;
alter table activity_award_record
    change `create_time` `create_time` int unsigned DEFAULT 0 COMMENT '创建时间' after status;
alter table activity_award_record
    change `modify_time` `modify_time` int unsigned DEFAULT 0 COMMENT '修改时间' after create_time;
alter table `activity_award_record` add index idx_ac_ua_id(activity_id,award_user_id);
alter table `activity_award_record` drop column `invite_invalid_time`;
