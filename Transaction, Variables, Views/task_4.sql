/*Транзакции, переменные, представления
 * п. 4. (по желанию) Пусть имеется любая таблица с календарным полем created_at. 
 * Создайте запрос, который удаляет устаревшие записи из таблицы, оставляя только 5 самых свежих записей.
  */

use shop;

START TRANSACTION;

drop table if exists temp;
create temporary table temp (id bigint); 

insert into temp
select id 
from orders
order by created_at desc, id desc
limit 5; 

select * from temp;

delete from orders as o
where o.id not in (select id from temp);

COMMIT;