/* Выведем список не выполненных задач пользователя с id = 1.
  В отдельной колонке "Состояние срока" будем выводить следующие значения:
  "Просрочено", если срок выполнения задачи прошел, 
  "Срок сегодня", если срок выпонения задачи - наступил или наступит в этот день,
  "Срок через 3 дня", если срок выполнения наступит черерз 3 дня,
  "Бессрочно", если срок выполнения задачи не заполнен
  */
use document_management;

create view tasks_view (start_date, author, name, importance, term, term_status) as
select
	t.start_date,
	concat(u.firstname, ' ', u.lastname),
	t.name,
	t.importance,
	t.term,
	case
		when (t.term is not null
		and t.term < curdate()) then 'Просрочено'
		when (t.term <=> null
		and date(t.term) = curdate()) then 'Срок сегодня'
		when (t.term <=> null
		and date(t.term) = date_add(curdate(), interval 3 day)) then 'Срок через 3 дня'
		when (t.term is null) then 'Бессрочно'
	end as term_status
from
	tasks as t
join users as u on
	t.author_id = u.id
where
	t.performer_id = 1
	and t.executed = 0;

select
	*
from
	tasks_view;
