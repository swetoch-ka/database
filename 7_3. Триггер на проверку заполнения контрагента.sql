/* с помощью триггера будем запрещать пользователю создавать и изменять документ, если в нем не заполнен контрагент, 
 * но только, если для вида документа значение реквизита "вести учет по контрагнетам" = 1.
*/
use document_management;
delimiter //
create trigger counterparty_on_insert before
insert
	on
	documents for each row begin if (
	select
		account_for_counterparties
	from
		document_types
	where
		id = new.document_type_id)= 1
	and new.counterparty_id is null then signal sqlstate '45000' set
	message_text = 'нужно заполнить контрагента для данного вида документа';
end if;
end //
delimiter;

insert
	into
	documents (document_type_id, title, author_id, company_id, counterparty_id)
values ('1', 'тестовый документ', '2', '3', null);

delimiter //

create trigger counterparty_on_update before
update
	on
	documents for each row begin if (
	select
		account_for_counterparties
	from
		document_types
	where
		id = new.document_type_id)= 1
	and new.counterparty_id is null then signal sqlstate '45000' set
	message_text = 'нужно заполнить контрагента для данного вида документа';
end if;
end //
delimiter //

update
	documents
set
	counterparty_id = null
where
	id = 1;