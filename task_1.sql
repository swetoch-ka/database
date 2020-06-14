-- п.1 Составьте список пользователей users, которые осуществили хотя бы один заказ orders в интернет магазине.

use shop;

-- заполним таблицу orders
insert into orders (user_id) values 
(2), (3), (4), (5), (6), (7), (8), (9), (2), (12);

-- вариант 1
select
	*
from
	users
where
	exists (
	select
		1
	from
		orders
	where
		user_id = users.id);

-- вариат 2
select
	*
from
	users
where
	id in (
	select
		distinct user_id
	from
		orders
	where
		user_id is not null);