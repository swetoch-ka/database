/* Выведем номенклатуру дел, отсротированную по организации, году и индексу, 
 * и в отдельных колонках выведем количество документов по номенклатуре и количество вссех листов документам по номенклатуре.
  */
use document_management;

select
	case_cat.name,
	count(*) as count_docs,
	sum(doc.number_sheets) as number_sheets
from
	documents as doc
join case_files_catalog as case_cat on
	doc.case_files_catalog_id = case_cat.id
where
	doc.registration_number is not null
	and doc.case_files_catalog_id is not null
order by
	case_cat.company_id,
	case_cat.year_of_case_files,
	case_cat.index_of_case_files;
