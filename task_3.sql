/* п.3 (по желанию) Пусть имеется таблица рейсов flights (id, from, to) и таблица городов cities (label, name). 
 Поля from, to и label содержат английские названия городов, поле name — русское. 
 Выведите список рейсов flights с русскими названиями городов. */

-- создадим новую базу данных
drop database if exists flights;
create database flights;
use flights;

-- создадим таблицу flights
drop table if exists flights;
create table flights(
	`id` serial primary key,
	`from` varchar(150),
	`to`  varchar(150)
);

-- заполним таблицу flights данными из практического задания
insert into flights (`from`, `to`) values
('moscow', 'omsk'),
('novgorod', 'kazan'),
('irkutsk', 'moscow'),
('omsk', 'irkutsk'),
('moscow', 'kazan');

-- создадим таблицу cities
drop table if exists cities;
create table cities(
	`label` varchar(150) primary key,
	`name` varchar(150)
);

insert into cities values
('moscow', 'Москва'),
('irkutsk', 'Иркутск'),
('novgorod', 'Новгород'),
('kazan', 'Казань'),
('omsk', 'Омск');


-- вариант 1.
select
	f.id,
	c1.name as `from`,
	c2.name as `to`
from
	flights as f
left join cities as c1 on
	f.`from` = c1.label
left join cities as c2 on
	f.`to` = c2.label;

-- вариант 2. Менее оптимальный
select
	id,
	(
	select
		name
	from
		cities
	where
		label = flights.`from`) as `from`,
	(
	select
		name
	from
		cities
	where
		label = flights.`to`) as `to`
from
	flights;





