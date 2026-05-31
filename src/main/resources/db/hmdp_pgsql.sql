-- PostgreSQL version of hmdp database schema

-- ----------------------------
-- Table structure for tb_blog
-- ----------------------------
DROP TABLE IF EXISTS tb_blog;
CREATE TABLE tb_blog (
  id BIGSERIAL PRIMARY KEY,
  shop_id BIGINT NOT NULL,
  user_id BIGINT NOT NULL,
  title VARCHAR(255) NOT NULL,
  images VARCHAR(2048) NOT NULL,
  content VARCHAR(2048) NOT NULL,
  liked INTEGER DEFAULT 0,
  comments INTEGER DEFAULT NULL,
  create_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  update_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- ----------------------------
-- Table structure for tb_blog_comments
-- ----------------------------
DROP TABLE IF EXISTS tb_blog_comments;
CREATE TABLE tb_blog_comments (
  id BIGSERIAL PRIMARY KEY,
  user_id BIGINT NOT NULL,
  blog_id BIGINT NOT NULL,
  parent_id BIGINT NOT NULL,
  answer_id BIGINT NOT NULL,
  content VARCHAR(255) NOT NULL,
  liked INTEGER DEFAULT NULL,
  status SMALLINT DEFAULT NULL,
  create_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  update_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- ----------------------------
-- Table structure for tb_follow
-- ----------------------------
DROP TABLE IF EXISTS tb_follow;
CREATE TABLE tb_follow (
  id BIGSERIAL PRIMARY KEY,
  user_id BIGINT NOT NULL,
  follow_user_id BIGINT NOT NULL,
  create_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- ----------------------------
-- Table structure for tb_seckill_voucher
-- ----------------------------
DROP TABLE IF EXISTS tb_seckill_voucher;
CREATE TABLE tb_seckill_voucher (
  voucher_id BIGINT NOT NULL PRIMARY KEY,
  stock INTEGER NOT NULL,
  create_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  begin_time TIMESTAMP NOT NULL DEFAULT '1970-01-01 00:00:00',
  end_time TIMESTAMP NOT NULL DEFAULT '1970-01-01 00:00:00',
  update_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- ----------------------------
-- Table structure for tb_shop
-- ----------------------------
DROP TABLE IF EXISTS tb_shop;
CREATE TABLE tb_shop (
  id BIGSERIAL PRIMARY KEY,
  name VARCHAR(128) NOT NULL,
  type_id BIGINT NOT NULL,
  images VARCHAR(1024) NOT NULL,
  area VARCHAR(128) DEFAULT NULL,
  address VARCHAR(255) NOT NULL,
  x DOUBLE PRECISION NOT NULL,
  y DOUBLE PRECISION NOT NULL,
  avg_price BIGINT DEFAULT NULL,
  sold INTEGER NOT NULL DEFAULT 0,
  comments INTEGER NOT NULL DEFAULT 0,
  score INTEGER NOT NULL DEFAULT 0,
  open_hours VARCHAR(32) DEFAULT NULL,
  create_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  update_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE INDEX idx_shop_type_id ON tb_shop(type_id);

-- ----------------------------
-- Table structure for tb_shop_type
-- ----------------------------
DROP TABLE IF EXISTS tb_shop_type;
CREATE TABLE tb_shop_type (
  id BIGSERIAL PRIMARY KEY,
  name VARCHAR(32) DEFAULT NULL,
  icon VARCHAR(255) DEFAULT NULL,
  sort INTEGER DEFAULT NULL,
  create_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  update_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ----------------------------
-- Table structure for tb_sign
-- ----------------------------
DROP TABLE IF EXISTS tb_sign;
CREATE TABLE tb_sign (
  id BIGSERIAL PRIMARY KEY,
  user_id BIGINT NOT NULL,
  year INTEGER NOT NULL,
  month SMALLINT NOT NULL,
  date DATE NOT NULL,
  is_backup SMALLINT DEFAULT NULL
);

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS tb_user;
CREATE TABLE tb_user (
  id BIGSERIAL PRIMARY KEY,
  phone VARCHAR(11) NOT NULL,
  password VARCHAR(128) DEFAULT '',
  nick_name VARCHAR(32) DEFAULT '',
  icon VARCHAR(255) DEFAULT '',
  create_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  update_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);
CREATE UNIQUE INDEX uniqe_key_phone ON tb_user(phone);

-- ----------------------------
-- Table structure for tb_user_info
-- ----------------------------
DROP TABLE IF EXISTS tb_user_info;
CREATE TABLE tb_user_info (
  user_id BIGINT NOT NULL PRIMARY KEY,
  city VARCHAR(64) DEFAULT '',
  introduce VARCHAR(128) DEFAULT NULL,
  fans INTEGER DEFAULT 0,
  followee INTEGER DEFAULT 0,
  gender SMALLINT DEFAULT 0,
  birthday DATE DEFAULT NULL,
  credits INTEGER DEFAULT 0,
  level SMALLINT DEFAULT 0,
  create_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  update_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- ----------------------------
-- Table structure for tb_voucher
-- ----------------------------
DROP TABLE IF EXISTS tb_voucher;
CREATE TABLE tb_voucher (
  id BIGSERIAL PRIMARY KEY,
  shop_id BIGINT DEFAULT NULL,
  title VARCHAR(255) NOT NULL,
  sub_title VARCHAR(255) DEFAULT NULL,
  rules VARCHAR(1024) DEFAULT NULL,
  pay_value BIGINT NOT NULL,
  actual_value BIGINT NOT NULL,
  type SMALLINT NOT NULL DEFAULT 0,
  status SMALLINT NOT NULL DEFAULT 1,
  create_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  update_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- ----------------------------
-- Table structure for tb_voucher_order
-- ----------------------------
DROP TABLE IF EXISTS tb_voucher_order;
CREATE TABLE tb_voucher_order (
  id BIGINT NOT NULL PRIMARY KEY,
  user_id BIGINT NOT NULL,
  voucher_id BIGINT NOT NULL,
  pay_type SMALLINT NOT NULL DEFAULT 1,
  status SMALLINT NOT NULL DEFAULT 1,
  create_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  pay_time TIMESTAMP DEFAULT NULL,
  use_time TIMESTAMP DEFAULT NULL,
  refund_time TIMESTAMP DEFAULT NULL,
  update_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);
