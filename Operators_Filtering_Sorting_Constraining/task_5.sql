-- ���������, ����������, ���������� � �����������

-- 5. (�� �������) �� ������� catalogs ����������� ������ ��� ������ �������. SELECT * FROM catalogs WHERE id IN (5, 1, 2); ������������ ������ � �������, �������� � ������ IN.

use shop;

select 
	*
from 
	catalogs
where
	id in (5, 1, 2) 
order by 
	field(id, 5,1,2);