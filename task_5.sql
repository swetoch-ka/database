-- п.5 Ќайти 10 пользователей, которые про€вл€ют наименьшую активность в использовании социальной сети.

use vk;

select
	user_id,
	sum(maincount) as reiting
from
	(
	select
		Count(id) as maincount, user_id
	from
		likes
	group by
		user_id
union all
	select
		count(distinct initiator_user_id), target_user_id
	from
		friend_requests
	where
		status = 'approved'
	group by
		target_user_id
union all
	select
		count(distinct target_user_id), initiator_user_id
	from
		friend_requests
	where
		status = 'approved'
	group by
		initiator_user_id
union all
	select
		Count(id) as maincount, user_id
	from
		media
	group by
		user_id
union all
	select
		Count(id) as maincount, from_user_id
	from
		messages
	group by
		from_user_id
union all
	select
		Count(distinct community_id) as maincount, user_id
	from
		users_communities
	group by
		user_id) as Total
group by
	user_id
order by
	reiting
limit 10;
