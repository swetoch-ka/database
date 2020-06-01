drop database if exists vk;
create database vk;

use vk;
drop table if exists users;
create table users(
id SERIAL primary key, -- BIGINT unsigned not null auto_increment unique,
firstname VARCHAR(50),
lastname VARCHAR(50),
email VARCHAR(100) UNIQUE,
phone BIGINT,
index users_phone_index (phone),
index users_name_index (firstname, lastname)
);

drop table if exists profiles;
create table profiles(
user_id SERIAL primary key,
gender CHAR(1),
birthday DATETIME,
photo_id BIGINT unsigned null,
created_at DATETIME default NOW(),
hometown VARCHAR(100),
foreign key (user_id) references users(id) 
);

drop table if exists messages;
create table messages(
id SERIAL primary key,
from_user_id BIGINT unsigned not null,
to_user_id BIGINT unsigned not null,
body TEXT,
created_at DATETIME default NOW(),
index messages_from_user_id (from_user_id),
index messages_to_user_id (to_user_id),
foreign key (from_user_id) references users(id),
foreign key (to_user_id) references users(id)
);

drop table if exists friend_requests;
create table friend_requests(
initiation_user_id BIGINT unsigned not null,
target_user_id BIGINT unsigned not null,
status ENUM('requested', 'approved', 'decline', 'unfriended') default 'requested',
requested_at DATETIME default NOW(),
confirmed_at DATETIME default NOW(),
primary key(initiation_user_id, target_user_id),
index initiation_user_id_index (initiation_user_id),
index target_user_id_id_index (target_user_id),
foreign key (initiation_user_id) references users(id),
foreign key (target_user_id) references users(id)
);

drop table if exists communities;
create table communities(
id SERIAL primary key,
name VARCHAR(150),
index communities_name_index(name)
);

drop table if exists users_communities;
create table users_communities(
user_id BIGINT unsigned not null,
community_id BIGINT unsigned not null,
primary key(user_id, community_id),
foreign key (user_id) references users(id),
foreign key (community_id) references communities(id)
);

drop table if exists media_types;
create table media_types(
id SERIAL primary key,
name VARCHAR(255),
created_at DATETIME default NOW(),
updated_at DATETIME default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP
);

drop table if exists media;
create table media(
id SERIAL primary key,
media_type_id BIGINT unsigned not null,
user_id BIGINT unsigned not null,
body TEXT,
filename VARCHAR(255),
size INT,
metadata JSON,
created_at DATETIME default NOW(),
updated_at DATETIME default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
INDEX(user_id),
foreign key (user_id) references users(id),
foreign key (media_type_id) references media_types(id)
);

drop table if exists likes;
create table likes(
user_id BIGINT unsigned not null,
media_id BIGINT unsigned not null,
created_at DATETIME default NOW(),
foreign key (user_id) references users(id),
foreign key (media_id) references media(id)
);

drop table if exists `photo_albums`;
create table `photo_albums`(
`id` SERIAL ,
`name` VARCHAR(255) default null,
`user_id` BIGINT unsigned not null,
foreign key (`user_id`) references users(id),
primary key (`id`)
);

drop table if exists `photos`;
create table `photos`(
`id` SERIAL primary key,
`album_id` BIGINT unsigned not null,
`media_id` BIGINT unsigned not null,
foreign key (`album_id`) references photo_albums(`id`),
foreign key (`media_id`) references media(id)
);

-- Домашняя работа

-- Создаем таблицу постов
drop table if exists posts;
create table posts(
	id serial primary key,
	title varchar(150) comment 'заголовок к посту',
	body text comment 'текст к посту', 
	user_id bigint unsigned not null ,
	media_id bigint unsigned not null comment 'медиафайл к посту', 
	metadata json,
	created_at datetime default now(),
	updated_at datetime default current_timestamp on update current_timestamp,
	foreign key(user_id) references users(id),
	foreign key(media_id) references media(id),
	index user_idx(user_id),
	index title_idx(title)
);


-- Создаем таблицу лайков для постов
drop table if exists likes_posts;
create table likes_posts(
	post_id bigint unsigned not null,
	user_id bigint unsigned not null,
	valuelike enum('like', 'dislike') default 'like',
	created_at datetime default now(),
	updated_at datetime default current_timestamp on update current_timestamp comment 'Дата изменения',
	primary key (post_id, user_id),
	foreign key(user_id) references users(id),
	foreign key(post_id) references posts(id)
);


-- Создаем таблицу лайков для пользователей
drop table if exists likes_users;
create table likes_users(
	user_id bigint unsigned not null,
	like_user_id bigint unsigned not null,
	value_like enum('like', 'dislike') default 'like',
	created_at datetime default now(),
	updated_at datetime default current_timestamp on update current_timestamp comment 'Дата изменения',
	primary key (user_id, like_user_id),
	foreign key(user_id) references users(id),
	foreign key(like_user_id) references users(id)
);