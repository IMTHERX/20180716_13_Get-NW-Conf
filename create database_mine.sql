-- 创建数据库;
CREATE DATABASE fitbit_new;-- 注意“;”

-- 切换主数据库;
USE fitbit_new; -- 注意“;”

/* product */
-- 创建产品;
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
-- 描述 class pruduct;
describe product;
DROP TABLE IF EXISTS product;

-- 为name添加idx;
CREATE UNIQUE INDEX name_idx on product(name);
DROP INDEX name_idx ON product; -- delete idx

-- 修改表单；
ALTER TABLE product ADD COLUMN description VARCHAR(50) NOT NULL;
-- 修改表单插入指定位置；
ALTER TABLE product CHANGE COLUMN description `description` VARCHAR(200) NOT NULL AFTER name;
describe product;
-- 删除class中的desc;
ALTER TABLE product DROP COLUMN `description`;





/* client */
-- 创建客户;
CREATE TABLE IF NOT EXISTS client(
client_id INT NOT NULL,
name VARCHAR(100) NOT NULL,
type VARCHAR(45) NULL,
PRIMARY KEY (client_id),
UNIQUE KEY (name) -- 唯一标识,如果是ID则需要唯一ID
-- ，如果是姓名，则不需要，设计数据库的时候需要设计清楚。
);
describe client;





/* sales */
-- 创建订单;
CREATE TABLE IF NOT EXISTS sales (
tran_id INT UNSIGNED NOT NULL AUTO_INCREMENT, 
date  DATE NOT NULL,
product_id INT NOT NULL,
client_id INT NOT NULL,
price DECIMAL(9,2) NOT NULL,
quantity INT NULL DEFAULT 1,
PRIMARY KEY (`tran_id`),

CONSTRAINT fk_product_id FOREIGN KEY (product_id)
	REFERENCES product(product_id)
	ON DELETE CASCADE,

CONSTRAINT fk_client_id FOREIGN KEY (client_id)
	REFERENCES client(client_id)
	ON DELETE CASCADE,

CONSTRAINT check_price CHECK(price`PRIMARY` > 0)
);
describe sales;

SHOW TABLES; -- 如果没有GUI，也可以通过此方式来查看table


-- 增加一个对于update限制；如果无法修改，则可以先删除再添加
ALTER TABLE sales DROP FOREIGN KEY fk_product_id;
ALTER TABLE sales DROP FOREIGN KEY fk_client_id;

ALTER TABLE sales ADD CONSTRAINT fk_product_id 
	FOREIGN KEY (product_id)
	REFERENCES product(product_id)
	ON DELETE CASCADE
    ON UPDATE CASCADE;
ALTER TABLE sales ADD CONSTRAINT fk_client_id 
	FOREIGN KEY (client_id)
	REFERENCES client(client_id)
	ON DELETE CASCADE
    ON UPDATE CASCADE;

-- 创建view；
CREATE OR REPLACE VIEW sales_amount as
	SELECT *,price * quantity as amount
    from sales;
describe sales_amount;

-- 添加数据；