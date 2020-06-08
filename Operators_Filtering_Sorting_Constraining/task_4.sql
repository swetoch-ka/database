-- ќператоры, фильтраци€, сортировка и ограничение

-- 4. (по желанию) »з таблицы users необходимо извлечь пользователей, родившихс€ в августе и мае. ћес€цы заданы в виде списка английских названий ('may', 'august')

use shop;

select 
	name,
	birthday_at
from 
	users
where
	date_format(birthday_at, '%M') in ('may', 'august'); 