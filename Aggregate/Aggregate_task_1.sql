-- ��������� ������

-- 1. ����������� ������� ������� ������������� � ������� users

use shop;

select 
	avg(TIMESTAMPDIFF(year, birthday_at, now())) as age
from 
	users;


