/*Практическое задание по теме “Хранимые процедуры и функции, триггеры"
 * Создайте хранимую функцию hello(), которая будет возвращать приветствие, в зависимости от текущего времени суток. 
 * С 6:00 до 12:00 функция должна возвращать фразу "Доброе утро", 
 * с 12:00 до 18:00 функция должна возвращать фразу "Добрый день", 
 * с 18:00 до 00:00 — "Добрый вечер", 
 * с 00:00 до 6:00 — "Доброй ночи".
*/

 
DROP PROCEDURE IF EXISTS shop.hello;

DELIMITER //

create procedure hello (in today_time datetime)
begin
	 declare time1 int;
	 set time1 = HOUR(today_time);
	if(time1 >= 6 and time1 < 12) then
		select 'Доброе утро!';
	elseif (time1 >= 12 and time1 < 18) then
		select 'Добрый день!';
	elseif (time1 >= 18 and time1 <= 23) then
		select 'Добрый вечер!';
	elseif (time1 >= 0 and time1 < 6) then
		select 'Доброй ночи!';
	else select 'Ошибка';
	end if;
end //
DELIMITER ;

call hello(now());