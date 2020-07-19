/* с помощью триггера, при добавлении записи о файле, будем заполнять путь к файлу в каталоге c:\users\tom
 */
use document_management;

delimiter //
create trigger auto_insert_files_on_insert before
insert
	on
	files for each row begin if new.file_path is null then set
	new.file_path = concat('c:\users\tom', '\\', new.name, '.', new.extension);
end if;
end //
delimiter ;

INSERT into
	files (name, author_id, document_id, extension)
values ('тестовый файл', '2', '3', 'doc');
