-- јгрегаци€ данных

-- 2. ѕодсчитайте количество дней рождени€, которые приход€тс€ на каждый из дней недели. —ледует учесть, что необходимы дни недели текущего года, а не года рождени€.

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


