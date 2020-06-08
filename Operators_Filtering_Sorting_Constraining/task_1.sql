-- Операторы, фильтрация, сортировка и ограничение

-- 1. Пусть в таблице users поля created_at и updated_at оказались незаполненными. Заполните их текущими датой и временем.

use shop;

drop table users;
create table users(
	id serial primary key,
	name VARCHAR(255),
	birthday_at DATE,
	created_at DATETIME,
	updated_at DATETIME
);

 insert into 
 	users(name, birthday_at) 
 values
	('ivan', '1998-10-25'),
	('jon', '1988-05-01'),
	('stiv', '1997-08-02'),
	('georg', '1996-05-03'),
	('inna', '1996-08-10');


update users
set
	created_at = now(),
	updated_at = now();

select * from users;