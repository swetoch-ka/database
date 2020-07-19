/* Выведем среднее время, затраченное на  выполнение задач в часах по видам документов,
 * Если задача еще не выполнена, то рассчитывать время выполнения как разницу между текущим моментом времени и датой старта выполнения задачи
 */
use document_management;

select
	doc_types.name,
	avg(case when (tasks.execution_date is not null) then TIMESTAMPDIFF(hour, tasks.start_date, tasks.execution_date) else TIMESTAMPDIFF(hour, tasks.start_date, now()) end) as time_execution
from
	tasks as tasks
join subjects as sub on
	tasks.id = sub.task_id
join documents as doc on
	sub.document_id = doc.id
join document_types as doc_types on
	doc.document_type_id = doc_types.id
group by
	doc_types.id;