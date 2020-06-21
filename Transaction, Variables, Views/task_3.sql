/*Транзакции, переменные, представления
 * по желанию) Пусть имеется таблица с календарным полем created_at. 
 * В ней размещены разряженые календарные записи за август 2018 года '2018-08-01', '2016-08-04', '2018-08-16' и 2018-08-17. 
 * Составьте запрос, который выводит полный список дат за август, выставляя в соседнем поле значение 1, если дата присутствует в исходном таблице и 0, если она отсутствует.
 */

use shop;

-- добавим в таблицу orders записи с значениями дат из задания
insert into orders (user_id, created_at) values
(2, '2018-08-01'),
(3, '2018-08-04'),
(4, '2018-08-16'),
(2, '2018-08-17');

-- создадим временную таблицу с днями месяца
CREATE TEMPORARY TABLE if not exists days (day_month INT);
INSERT INTO days
VALUES (0), (1), (2), (3), (4), (5), (6), (7), (8), (9), (10),
       (11), (12), (13), (14), (15), (16), (17), (18), (19), (20),
       (21), (22), (23), (24), (25), (26), (27), (28), (29), (30);

      
select date('2018-08-01' + interval day_month day) from days;      

-- создадим запрос, который выводит полный список дат за август, выставляя в соседнем поле значение 1, если дата присутствует в исходном таблице и 0, если она отсутствует. 
select distinct
	date('2018-08-01' + interval d.day_month day) as date_august,
	case
		when o.created_at is null then 0
		else 1
	end found_day,
	date_format(o.created_at, '%Y-%m-%d') as created_at
from
	days as d
left join 
	orders as o 
on
	date('2018-08-01' + interval d.day_month day) = date_format(o.created_at, '%Y-%m-%d')
order by date_august;
