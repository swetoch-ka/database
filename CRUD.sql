use vk;

-- CREATE

/*insert INTO users (id, firstname, lastname, email, phone) 
VALUES ('101', 'Kris', 'Farm', '123@mail.ru', '12345678');*/

insert into users (firstname, lastname, email, phone) 
values ('Kris', 'Farm', '123@mail.ru', '12345678');

/*create table `insert`(
 id serial primary key,
 name varchar(255)
);*/

insert into users values
(102, 'Sw', 'Fr', 'swfr1@google.com', null),
(103, 'Sw', 'Fr', 'swfr2@google.com', null),
(104, 'Sw', 'Fr', 'swfr3@google.com', null),
(105, 'Sw', 'Fr', 'swfr4@google.com', null)
;

insert into users
set
	firstname = 'Ivan',
	lastname = 'Ivanpov',
	email = 'ivan@mail.ru',
	phone = '987654321'
;

insert into users 
	(firstname, lastname, email, phone) 
select 
 	firstname, lastname, email, phone
from vk1.users
where id > 97 and id < 100
;

-- READ

select 10+20;

select lastname, firstname from users;

select * 
from users;


select distinct	lastname, firstname 
from users;
	
select * 
from users
where id = 5 or firstname = 'Ivan';

select * 
from users
where id in (5, 10, 14, 56);

select * 
from users
limit 5 offset 5;

select * 
from users
limit 3, 5;

-- UPDATE

insert into friend_requests (initiation_user_id, target_user_id, status)
values ('5', '6', 'requested');

insert into friend_requests (initiation_user_id, target_user_id, status)
values ('5', '7', 'requested');

insert into friend_requests (initiation_user_id, target_user_id, status)
values ('5', '8', 'requested');

insert into friend_requests (initiation_user_id, target_user_id, status)
values ('5', '58', 'requested');

select * 
from friend_requests
where initiation_user_id = 5 and target_user_id = 8;

update friend_requests
set 
	status = 'decline',
	confirmed_at = now()
where
	initiation_user_id = 5 and target_user_id = 8;

-- DELETE

insert into messages (from_user_id, to_user_id, body) values
('5','8','messages 1'),
('5','9','messages 2'),
('5','10','messages 3'),
('5','45','messages 4'),
('5','54','messages 5');

select * 
from messages
where from_user_id = 5;


delete from messages
where from_user_id = 5;

-- TRUNCATE

truncate table messages;
