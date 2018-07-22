-- 创建数据库
CREATE DATABASE fitbit_new;-- 注意“;”

-- 切换主数据库
USE fitbit_new; -- 注意“;”

-- 创建table
CREATE TABLE IF NOT EXISTS product(
product_id INT			NOT NULL,
code       CHAR(5)		NOT NULL,
name	   VARCHAR(20)  NOT NULL,
class      VARCHAR(45)  NOT NULL,
color      VARCHAR(45)  NOT NULL,
has_clock  ENUM('Y','N') NOT NULL,-- 枚举只能Y/N
msrp	   DECIMAL(9,2)	NULL,  -- 小数点2位
PRIMARY KEY (product_id),-- 最后一个不需要“，”
UNIQUE KEY (code), -- 唯一标识
INDEX product_id_idx(product_id) -- 设置索引
);
-- 官网查询datatype，不需要背、查询说明；
-- 描述 class pruduct
describe product;
DROP TABLE IF EXISTS product;

-- 为name添加idx
CREATE UNIQUE INDEX name_idx on product(name);
DROP INDEX name_idx ON product; -- delete idx

-- 修改表单；
ALTER TABLE product ADD COLUMN description VARCHAR(50) NOT NULL;
-- 修改表单插入指定位置；
ALTER TABLE product CHANGE COLUMN description `description` VARCHAR(200) NOT NULL AFTER name;
describe product;
-- 删除class中的desc
ALTER TABLE product DROP COLUMN `description`;


