SET NAMES utf8mb4;

-- 测试账号：手机号/用户名 13800138000，密码 abc123
SET @salt = 'testsalt1234567';
SET @pwd  = CONCAT(MD5('abc123'), @salt);

-- 1) 用户主表
INSERT INTO t_user (username, email, phone, salt, password, state, age, createtime, headImg)
VALUES (NULL, NULL, '13800138000', @salt, @pwd, 1, 18, NOW(), NULL);

SET @uid = LAST_INSERT_ID();

-- 2) 登录信息表（uid 指向上面的 user）
INSERT INTO t_logininfo (username, phone, email, password, type, disable, salt, uid)
VALUES ('13800138000', '13800138000', NULL, @pwd, 1, 1, @salt, @uid);
