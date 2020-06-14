-- �.2 �������� ������ ������� products � �������� catalogs, ������� ������������� ������.

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