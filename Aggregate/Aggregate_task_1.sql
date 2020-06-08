-- Агрегация данных

-- 1. Подсчитайте средний возраст пользователей в таблице users

use shop;

select 
	avg(TIMESTAMPDIFF(year, birthday_at, now())) as age
from 
	users;


