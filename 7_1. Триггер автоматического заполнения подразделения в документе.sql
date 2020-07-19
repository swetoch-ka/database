/* С помощью триггера будем заполнять подразделение, при добавлении и изменении документа, равное подразделению автора документа.
*/
use document_management;
delimiter //
create trigger auto_insert_department_on_insert before
insert
	on
	documents for each row begin if new.author_id is not null then 
set
	new.department_id = (
	select
		department_id
	from
		profiles
	where
		user_id = new.author_id);
end if;
end //
delimiter ;

insert
	into
	documents (document_type_id, title, author_id, company_id, counterparty_id)
values ('1', 'тестовый документ', '2', '3', '2');

delimiter //
create trigger auto_update_department_id_on_update before
update
	on
	documents for each row begin if new.author_id is not null then 
set
	new.department_id = (
	select
		department_id
	from
		profiles
	where
		user_id = new.author_id);
end if;
end //
delimiter ;

update
	documents
set
	author_id = 5
where
	id = 1;
