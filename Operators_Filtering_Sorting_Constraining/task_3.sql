-- ���������, ����������, ���������� � �����������

/* 3. � ������� ��������� ������� storehouses_products � ���� value ����� ����������� ����� ������ �����: 
 0, ���� ����� ���������� � ���� ����, ���� �� ������ ������� ������. ���������� ������������� ������ ����� �������, 
 ����� ��� ���������� � ������� ���������� �������� value. ������, ������� ������ ������ ���������� � �����, ����� ���� �������.*/

use shop;

drop table if exists storehouses_products;

-- ������� ������� storehouses_products ��� ��������������� �������� ������
create table storehouses_products(
	id serial primary key,  
	storehouse_id int unsigned,
	product_id int unsigned,
	value int unsigned comment '����� �������� ������� �� ������',
	created_at datetime default current_timestamp comment '���� ��������',
	updated_at datetime default current_timestamp on update current_timestamp comment '���� ���������'
) comment = '������ �� ������';

-- �������� �������, �������� value ����� �� �������
insert into
	storehouses_products(storehouse_id, product_id, value)
values
	(1, 10, 0),
	(1, 20, 2500),
	(1, 30, 0),
	(1, 40, 30),
	(1, 50, 500),
	(1, 60, 1);

-- ��������� ������ �� �������� �������
select 
	* 
from 
	storehouses_products
order by
	if(value > 0, 0, 1),
	value;
