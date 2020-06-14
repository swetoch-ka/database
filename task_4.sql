-- п.4. Определить кто больше поставил лайков (всего) - мужчины или женщины?

use vk;

select
	count(*) as count_likes,
	(
	select
		case
			(gender) when 'm' then 'male'
			when 'f' then 'female'
		end as gender
	from
		profiles
	where
		user_id = likes.user_id ) as gender
from
	likes
group by
	gender
order by
	count_likes desc
limit 1;