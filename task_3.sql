-- п.3. ѕодсчитать общее количество лайков, которые получили 10 самых молодых пользователей.

use vk;

-- посмотрим список 10 самых молодых пользователей 
select
	*
from
	profiles
order by
	birthday desc
limit 10;

-- SELECT * FROM t1 JOIN (SELECT DISTINCT col2 FROM t2 WHERE x) t ON t1.col1=t.col2;

-- посмотрим медиа 1 самых молодых пользователей
select
	*
from
	media m
join (
	select
		user_id
	from
		profiles
	order by
		birthday desc
	limit 10) p on
	m.user_id = p.user_id ;


--  ¬ариант 1. подсчитаем количество лайков с использованием соединени€ JOIN	
select
	count(*) as count_likes
from
	likes
where
	media_id in (
	select
		id
	from
		media m
	join (
		select
			user_id
		from
			profiles
		order by
			birthday desc
		limit 10) p on
		m.user_id = p.user_id);

-- ¬ариант 2. ѕодсчитаем количество лайков с использованием подзапросами. Ќе производительно.	
select
	Count(id) as count_likes
from
	likes
where
	media_id in (
	select
		id
	from
		media
	where
		user_id in (
		select
			*
		from
			(
			select
				user_id
			from
				profiles
			order by
				birthday desc
			limit 10) filter_user_id) );