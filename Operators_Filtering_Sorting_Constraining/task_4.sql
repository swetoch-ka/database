-- ���������, ����������, ���������� � �����������

-- 4. (�� �������) �� ������� users ���������� ������� �������������, ���������� � ������� � ���. ������ ������ � ���� ������ ���������� �������� ('may', 'august')

use shop;

select 
	name,
	birthday_at
from 
	users
where
	date_format(birthday_at, '%M') in ('may', 'august'); 