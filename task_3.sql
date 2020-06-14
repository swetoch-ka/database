-- �.3. ���������� ����� ���������� ������, ������� �������� 10 ����� ������� �������������.

use vk;

-- ��������� ������ 10 ����� ������� ������������� 
select
	*
from
	profiles
order by
	birthday desc
limit 10;

-- SELECT * FROM t1 JOIN (SELECT DISTINCT col2 FROM t2 WHERE x) t ON t1.col1=t.col2;

-- ��������� ����� 1 ����� ������� �������������
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


--  ������� 1. ���������� ���������� ������ � �������������� ���������� JOIN	
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

-- ������� 2. ���������� ���������� ������ � �������������� ������������. �� ���������������.	
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