/*“Транзакции, переменные, представления”
 * п.2 Создайте представление, которое выводит название name товарной позиции из таблицы products и соответствующее название каталога name из таблицы catalogs.
*/

use shop;

CREATE VIEW cat_view (name_products, name_catalogs)
AS SELECT  p.name, c.name
FROM products as p
join
catalogs as c
on p.catalog_id = c.id;

select * from caT_view;