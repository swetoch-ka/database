
/* Транзакции, переменные, представления
 * п.1. В базе данных shop и sample присутствуют одни и те же таблицы, учебной базы данных.
 *  Переместите запись id = 1 из таблицы shop.users в таблицу sample.users. Используйте транзакции. */

-- добавим в БД shop таблицу users
use shop;

drop table if exists users;
create table users(
id SERIAL primary key,
name VARCHAR(255) COMMENT 'Имя покупателя',
birthday_at DATE COMMENT 'Дата рождения',
created_at DATETIME default CURRENT_TIMESTAMP,
updated_at DATETIME default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP
) COMMENT = 'Покупатели';

-- добавим в таблицу users строку с id = 1
insert into users (id, name, birthday_at) values (1, 'hello', '1979-01-27');
select * from users;

-- добавим в БД samles таблицу users
use sample;

drop table if exists users;
create table users(
id SERIAL primary key,
name VARCHAR(255) COMMENT 'Имя покупателя',
birthday_at DATE COMMENT 'Дата рождения',
created_at DATETIME default CURRENT_TIMESTAMP,
updated_at DATETIME default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP
) COMMENT = 'Покупатели';

-- переместим пользователя с id = 1 из БД shop в БД samles
START TRANSACTION;

insert into 
	sample.users
SELECT * FROM shop.users WHERE id = 1;

delete from shop.users WHERE id = 1;

COMMIT;
