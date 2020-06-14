/* п.2. ѕусть задан некоторый пользователь. 
»з всех друзей этого пользовател€ найдите человека, который больше всех общалс€ с нашим пользователем.*/

use vk;

-- ѕусть задан пользователь с id = 71

-- посмотрим подтвержденных друзей пользовател€ с id = 71
select
	*
from
	friend_requests
where
	(initiator_user_id = 71
	or target_user_id = 71)
	and status = 'approved';

-- посмотрим все сообщени€, которые были направлены иои получены пользователем с id=71
select
	*
from
	messages
where
	from_user_id = 71
	or to_user_id = 71;


-- »з всех друзей нашего пользовател€ найдем человека (его id), который больше всех общалс€ с нашим пользователем
select
	count(id) as count_user_id,
	friend_id
from
	(
	select
		id, to_user_id as 'friend_id'
	from
		messages
	where
		from_user_id = 71
		and to_user_id in
		-- »ƒ сообщений, направленных от друзей нашему пользователю 
((
		select
			initiator_user_id
		from
			friend_requests
		where
			target_user_id = messages.from_user_id
			and status = 'approved')
		-- »ƒ друзей, за€вку которых подтвердил наш пользователь
union (
	select
		target_user_id
	from
		friend_requests
	where
		initiator_user_id = messages.from_user_id
		and status = 'approved'))
		-- »ƒ друзей, которые подтвердили за€вку нашего пользовател€
union
	select
		id, from_user_id
	from
		messages
	where
		to_user_id = 71
		and from_user_id in
		-- »ƒ сообщений,  направленных от нашего пользовател€ друзь€м 
((
		select
			initiator_user_id
		from
			friend_requests
		where
			target_user_id = messages.to_user_id
			and status = 'approved')
		-- »ƒ друзей, за€вку которых подтвердил наш пользователь
union (
	select
		target_user_id
	from
		friend_requests
	where
		initiator_user_id = messages.to_user_id
		and status = 'approved')))
	-- »ƒ друзей, которые подтвердили за€вку нашего пользовател€
 as messages_friend
group by
	friend_id
order by
	count_user_id desc
limit 1;
	
