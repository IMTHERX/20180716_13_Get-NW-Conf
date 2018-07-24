-- SELECT Column1,Column2,... #需要的数据
-- FROM Table1,Table2,... #问谁
-- 相当于问Table1，Table2，Column1，Column2的data是什么。
-- /WHERE #达成条件的数据

-- 查询全部
SELECT * FROM sales;
SELECT * FROM shapping;

-- 按条件“或”查找
SELECT * FROM sales 
WHERE tran_id > 5
OR date > '2016-06-18';
-- 按条件“与”查找
SELECT * FROM sales 
WHERE tran_id > 5
AND date > '2016-06-18';
-- 查找所有不重复的值
SELECT DISTINCT product_id FROM sales; 

-- 找2016-6-1 以后的订单
SELECT * FROM sales
WHERE date > '2016-06-01';

-- 找2016-6-1至2016-6-8之间的订单
SELECT * FROM sales
WHERE date >= '2016-06-01'
AND date <= '2016-06-06';

SELECT * FROM sales
WHERE date BETWEEN '2016-06-01'
AND '2016-06-06';

SELECT * FROM sales
WHERE date IN('2016-06-01','2016-06-05');

-- 查询以..开头，以..结尾
SELECT * FROM product
WHERE CODE LIKE 'E%';

SELECT * FROM product
WHERE CODE LIKE '%P';

SELECT * FROM product
WHERE CODE LIKE 'E%P';

-- 查询以 "" 在中间
SELECT * FROM product
WHERE color LIKE '%A%';

SELECT * FROM product p
WHERE p.color LIKE '%A%';

-- 对查询的结果进行操作，例如打折
SELECT name,msrp * 0.9 as discount_msrp
FROM product;



