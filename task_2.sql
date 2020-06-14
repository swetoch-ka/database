/* �.2. ����� ����� ��������� ������������. 
�� ���� ������ ����� ������������ ������� ��������, ������� ������ ���� ������� � ����� �������������.*/

use vk;

-- ����� ����� ������������ � id = 71

-- ��������� �������������� ������ ������������ � id = 71
select
	*
from
	friend_requests
where
	(initiator_user_id = 71
	or target_user_id = 71)
	and status = 'approved';

-- ��������� ��� ���������, ������� ���� ���������� ��� �������� ������������� � id=71
select
	*
from
	messages
where
	from_user_id = 71
	or to_user_id = 71;


-- �� ���� ������ ������ ������������ ������ �������� (��� id), ������� ������ ���� ������� � ����� �������������
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
		-- �� ���������, ������������ �� ������ ������ ������������ 
((
		select
			initiator_user_id
		from
			friend_requests
		where
			target_user_id = messages.from_user_id
			and status = 'approved')
		-- �� ������, ������ ������� ���������� ��� ������������
union (
	select
		target_user_id
	from
		friend_requests
	where
		initiator_user_id = messages.from_user_id
		and status = 'approved'))
		-- �� ������, ������� ����������� ������ ������ ������������
union
	select
		id, from_user_id
	from
		messages
	where
		to_user_id = 71
		and from_user_id in
		-- �� ���������,  ������������ �� ������ ������������ ������� 
((
		select
			initiator_user_id
		from
			friend_requests
		where
			target_user_id = messages.to_user_id
			and status = 'approved')
		-- �� ������, ������ ������� ���������� ��� ������������
union (
	select
		target_user_id
	from
		friend_requests
	where
		initiator_user_id = messages.to_user_id
		and status = 'approved')))
	-- �� ������, ������� ����������� ������ ������ ������������
 as messages_friend
group by
	friend_id
order by
	count_user_id desc
limit 1;
	
