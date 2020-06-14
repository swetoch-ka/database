-- �.1 ��������� ������ ������������� users, ������� ����������� ���� �� ���� ����� orders � �������� ��������.

use shop;

-- �������� ������� orders
insert into orders (user_id) values 
(2), (3), (4), (5), (6), (7), (8), (9), (2), (12);

-- ������� 1
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

-- ������ 2
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