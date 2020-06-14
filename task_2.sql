-- п.2 Выведите список товаров products и разделов catalogs, который соответствует товару.

use shop;

select
	p.name as name_products,
	p.description,
	p.price,
	c.name as name_catalogs
from
	products as p
left join catalogs as c on
	p.catalog_id = c.id;