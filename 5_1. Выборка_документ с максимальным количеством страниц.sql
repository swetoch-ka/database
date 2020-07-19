/* Выведем заголовок и автора документа с максимальным количеством страниц
 */
use document_management;

select
	title,
	author_id,
	number_sheets
from
	documents
where
	number_sheets = (
	select
		max(number_sheets)
	from
		documents);
