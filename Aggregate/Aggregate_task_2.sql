-- ��������� ������

-- 2. ����������� ���������� ���� ��������, ������� ���������� �� ������ �� ���� ������. ������� ������, ��� ���������� ��� ������ �������� ����, � �� ���� ��������.

use shop;

select 
	date_format(DATE(concat_ws('-', year(now()), month (birthday_at ), day(birthday_at))), '%W') as day_of_the_week,
	count(*) as total 
from 
	users
group by
	day_of_the_week
order by 
	total;


