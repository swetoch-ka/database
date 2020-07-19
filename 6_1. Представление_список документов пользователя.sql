/* Создадим представление - список документов, созданных пользователем пользователя с id = 1
  и список документов, на основании которых пользователю были направлены задачи.
*/
use document_management;

create view documents_view (document_type, title, registration_date, registration_number, company, counterparty) as (
select
	dt.name, doc.title, doc.registration_date, doc.registration_number, companies.name, counterparties.name
from
	documents as doc
join document_types as dt on
	doc.document_type_id = dt.id
left join companies as companies on
	doc.company_id = companies.id
left join counterparties as counterparties on
	doc.counterparty_id = counterparties.id
where
	doc.author_id = 1
union
select
	document_types.name, doc.title, doc.registration_date, doc.registration_number, companies.name, counterparties.name
from
	subjects as subjects
join tasks as tasks on
	subjects.task_id = tasks.id
join documents as doc on
	subjects.document_id = doc.id
join document_types as document_types on
	doc.document_type_id = dt.id
left join companies as companies on
	doc.company_id = companies.id
left join counterparties as counterparties on
	doc.counterparty_id = counterparties.id
where
	tasks.performer_id = 1);

select
	*
from
	documents_view;