-- ќператоры, фильтраци€, сортировка и ограничение

/* 3. ¬ таблице складских запасов storehouses_products в поле value могут встречатьс€ самые разные цифры: 
 0, если товар закончилс€ и выше нул€, если на складе имеютс€ запасы. Ќеобходимо отсортировать записи таким образом, 
 чтобы они выводились в пор€дке увеличени€ значени€ value. ќднако, нулевые запасы должны выводитьс€ в конце, после всех записей.*/

use shop;

drop table if exists storehouses_products;

-- добавим таблицу storehouses_products дл€ воспроизведени€ исходных данных
create table storehouses_products(
	id serial primary key,  
	storehouse_id int unsigned,
	product_id int unsigned,
	value int unsigned comment '«апас товарной позиции на складе',
	created_at datetime default current_timestamp comment 'ƒата создани€',
	updated_at datetime default current_timestamp on update current_timestamp comment 'ƒата изменени€'
) comment = '«апасы на складе';

-- заполним таблицу, значени€ value берем из задани€
insert into
	storehouses_products(storehouse_id, product_id, value)
values
	(1, 10, 0),
	(1, 20, 2500),
	(1, 30, 0),
	(1, 40, 30),
	(1, 50, 500),
	(1, 60, 1);

-- сортируем данные по услови€м задани€
select 
	* 
from 
	storehouses_products
order by
	if(value > 0, 0, 1),
	value;
