create database es;

create table user
(
    id           bigint signed not null auto_increment comment '主键',
    user_no      char(64)      not null comment '账号',
    user_name    varchar(100)           default null comment '用户名',
    sex          char(1)                default 'M' comment '性别,M:男性,F:女性',
    birthday     date                   default null comment '生日',
    email        varchar(100)           default null comment '电子邮箱',
    mobile_phone char(11)               default null comment '手机号',
    nick_name    varchar(200)           default null comment '昵称',
    login_url    varchar(255)           default null comment '头像图片url',
    real_name    varchar(200)           default null comment '真实姓名',
    is_certify   tinyint signed         default 0 comment '是否已实名,1:已实名,0,未实名',
    create_time  datetime      not null default current_timestamp comment '创建时间',
    update_time  datetime      not null default current_timestamp on update current_timestamp comment '更新时间',
    primary key (id)
) engine = innodb
  charset = utf8mb4
  auto_increment = 0 comment '用户信息表';

create table product
(
    id           bigint signed not null auto_increment comment '主键',
    product_code char(20)      not null comment '商品编号',
    product_name varchar(255)           default null comment '商品名称',
    create_time  datetime      not null default current_timestamp comment '创建时间',
    update_time  datetime      not null default current_timestamp on update current_timestamp comment '更新时间',
    primary key (id)
) engine = innodb
  charset = utf8mb4
  auto_increment = 0 comment '产品信息表';

create table product_item
(
    id           bigint signed not null auto_increment comment '主键',
    product_code char(20)      not null comment '商品编号',
    item_name    varchar(100)           default null comment '产品属性名称',
    item_value   varchar(100)           default null comment '产品属性值',
    item_desc    varchar(255)           default null comment '产品描述',
    create_time  datetime      not null default current_timestamp comment '创建时间',
    update_time  datetime      not null default current_timestamp on update current_timestamp comment '更新时间',
    primary key (id)
) engine = innodb
  charset = utf8mb4
  auto_increment = 0 comment '产品属性表';


create table product_price
(
    id           bigint signed not null auto_increment comment '主键',
    product_code char(20)      not null comment '商品编号',
    price        decimal(18, 2) signed  default null comment '价格',

    create_time  datetime      not null default current_timestamp comment '创建时间',
    update_time  datetime      not null default current_timestamp on update current_timestamp comment '更新时间',
    primary key (id)
) engine = innodb
  charset = utf8mb4
  auto_increment = 0 comment '产品价格表';

create table product_stock
(
    id           bigint signed not null auto_increment comment '主键',
    product_code char(20)      not null comment '商品编号',
    stock        bigint signed          default null comment '库存',

    create_time  datetime      not null default current_timestamp comment '创建时间',
    update_time  datetime      not null default current_timestamp on update current_timestamp comment '更新时间',
    primary key (id)
) engine = innodb
  charset = utf8mb4
  auto_increment = 0 comment '产品库存表';



create table `order`
(
    id              bigint signed  not null auto_increment comment '主键',
    order_no        char(20)       not null comment '编号',
    order_amount    decimal(18, 2)          default null comment '订单金额',
    coupon_amour    decimal(18, 2)          default null comment '优惠金额',
    order_status    tinyint signed not null comment '交易状态',

    product_code    char(20)       not null comment '商品编号',
    count           int signed              default null comment '数量',
    price           decimal(18, 2) signed   default null comment '单价',

    order_time      datetime                default null comment '下单时间',
    pay_time        datetime                default null comment '支付时间',
    deliver_time    datetime                default null comment '发货时间',
    finish_time     datetime                default null comment '完成时间',

    deliver_address varchar(255)            default null comment '配送地址',

    create_time     datetime       not null default current_timestamp comment '创建时间',
    update_time     datetime       not null default current_timestamp on update current_timestamp comment '更新时间',
    primary key (id)
) engine = innodb
  charset = utf8mb4
  auto_increment = 0 comment '产品属性表';

