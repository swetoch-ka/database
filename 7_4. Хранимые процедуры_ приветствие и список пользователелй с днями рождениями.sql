/* Создадим хранимую процедуру, которая будет возвращать приветствие, в зависимости от текущего времени суток.  с 6:00 до 12:00 функция должна возвращать фразу "доброе утро",  * с 12:00 до 18:00 функция должна возвращать фразу "добрый день",  * с 18:00 до 00:00 — "добрый вечер",  * с 00:00 до 6:00 — "доброй ночи".
* создадим хранимую процедуру, которая будет возвращать список пользователей, у которых день рождения в ближайшие 3 дня
*/
use document_management;

drop procedure if exists document_management.hello;
delimiter //
create procedure hello (in today_time datetime) begin declare time1 int;

set
time1 = hour(today_time);

if(time1 >= 6
and time1 < 12) then
select
	'доброе утро!';

elseif (time1 >= 12
and time1 < 18) then
select
	'добрый день!';

elseif (time1 >= 18
and time1 <= 23) then
select
	'добрый вечер!';

elseif (time1 >= 0
and time1 < 6) then
select
	'доброй ночи!';
else
select
	'ошибка';
end if;
end //
delimiter ;
call hello(now());

drop temporary table if exists temp_birthday_users;

create temporary table temp_birthday_users (id int, name varchar(255), birthday date);
delimiter //
drop procedure if exists get_birthday_users // create procedure get_birthday_users(in day_birthday date) begin declare id int;

declare is_end int default 0;

declare name tinytext;

declare birthday tinytext;

declare curcat cursor for
select
	u.id,
	concat(u.firstname, ' ', u.lastname) as name,
	p.birthday
from
	users as u
join profiles as p on
	u.id = p.user_id
where
	timestampdiff(day, date_add(p.birthday, interval year(day_birthday)-year(p.birthday) year), day_birthday) between 0 and 3;

declare continue handler for not found set
is_end = 1;

open curcat;

cycle : loop fetch curcat
into
	id,
	name,
	birthday;

if is_end then leave cycle;
end if;

insert
	into
	temp_birthday_users
values(id, name, birthday);
end loop cycle;

close curcat;
end //
delimiter ;
call get_birthday_users(now());

select
	*
from
	temp_birthday_users;
