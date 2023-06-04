#1 Используя операторы языка SQL, создайте табличку “sales”. Заполните ее данными
CREATE DATABASE hw_2;
USE hw_2;
CREATE TABLE sales
( 
id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
order_date DATE NOT NULL,
count_product INT NOT NULL
);

INSERT INTO sales (order_date,count_product)
VALUES ('2022-01-01',156),
('2022-01-02',180),
('2022-01-03',21),
('2022-01-04',124),
('2022-01-05',341);

/* 2 Для данных таблицы “sales” укажите тип заказа в зависимости от кол-ва : 
меньше 100 - "Маленький заказ"; от 100 до 300 - "Средний заказ"; 
больше 300 - "Большой заказ"*/

SELECT id AS "id заказа",
CASE 
	WHEN count_product <100 THEN "Маленький заказ"
    WHEN count_product BETWEEN 100 AND 300 THEN "Средний заказ"
    WHEN count_product >300 THEN "Большой заказ"
    ELSE "Не определено"
END AS "Тип заказа"
FROM sales;

/*3 Создайте таблицу “orders”, заполните ее значениями (см. презентацию). 
Выберите все заказы. В зависимости от поля order_status выведите столбец full_order_status: OPEN – «Order is in open state» ; 
CLOSED - «Order is closed»; CANCELLED - «Order is cancelled».*/
CREATE TABLE orders
(
id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
employee_id VARCHAR(25) NOT NULL,
amount FLOAT NOT NULL,
order_status VARCHAR (25) NOT NULL
);

INSERT INTO orders (employee_id,amount,order_status)
VALUES ('e03',15.00,'OPEN'),
('e01',25.50,'OPEN'),
('e05',100.70,'CLOSED'),
('e02',22.18,'OPEN'),
('e04',9.50,'CANCELLED');

SELECT * FROM orders;

SELECT id, employee_id,amount,order_status,
IF (order_status = 'OPEN', "Order is in open state",
	IF(order_status = 'CLOSED', "Order is closed",
		IF (order_status = 'CANCELLED', "Order is cancelled", "Не определено"))) AS "full_order_status"
FROM orders;

# 4.Чем NULL отличается от 0?
/*NULL - это значение, которое используется в SQL для обозначения отсутствия данных.
 Оно отличается от нулевого значения, так как NULL означает отсутствие какого-либо 
 значения в ячейке таблицы. А 0 является значением, константой.*/




