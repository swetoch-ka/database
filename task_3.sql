/* �.3 (�� �������) ����� ������� ������� ������ flights (id, from, to) � ������� ������� cities (label, name). 
 ���� from, to � label �������� ���������� �������� �������, ���� name � �������. 
 �������� ������ ������ flights � �������� ���������� �������. */

-- �������� ����� ���� ������
drop database if exists flights;
create database flights;
use flights;

-- �������� ������� flights
drop table if exists flights;
create table flights(
	`id` serial primary key,
	`from` varchar(150),
	`to`  varchar(150)
);

-- �������� ������� flights ������� �� ������������� �������
insert into flights (`from`, `to`) values
('moscow', 'omsk'),
('novgorod', 'kazan'),
('irkutsk', 'moscow'),
('omsk', 'irkutsk'),
('moscow', 'kazan');

-- �������� ������� cities
drop table if exists cities;
create table cities(
	`label` varchar(150) primary key,
	`name` varchar(150)
);

insert into cities values
('moscow', '������'),
('irkutsk', '�������'),
('novgorod', '��������'),
('kazan', '������'),
('omsk', '����');


-- ������� 1.
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

-- ������� 2. ����� �����������
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





