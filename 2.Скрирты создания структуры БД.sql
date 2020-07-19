drop database if exists document_management;
create database document_management;

use document_management;

drop table if exists users;
create table users(
id serial primary key, -- bigint unsigned not null auto_increment unique,
firstname varchar(50),
lastname varchar(50),
created_at datetime default now(),
updated_at datetime default current_timestamp on update current_timestamp,
index users_name_index (firstname, lastname)
);

drop table if exists departments;
create table departments(
id serial primary key,
name varchar(255) not null,
superior_department_id bigint unsigned,
department_head_id bigint unsigned not null,
created_at datetime default now(),
updated_at datetime default current_timestamp on update current_timestamp,
foreign key (superior_department_id) references departments(id),
foreign key (department_head_id) references users(id) 
);

drop table if exists positions;
create table positions(
id serial primary key,
name varchar(255) not null,
created_at datetime default now(),
updated_at datetime default current_timestamp on update current_timestamp
);

drop table if exists profiles;
create table profiles(
user_id serial primary key,
department_id bigint unsigned,
positions_id bigint unsigned,
gender char(1),
birthday date,
email varchar(100) unique,
phone bigint unsigned,
created_at datetime default now(),
updated_at datetime default current_timestamp on update current_timestamp,
index users_phone_index (phone),
foreign key (user_id) references users(id),
foreign key (department_id) references departments(id),
foreign key (positions_id) references positions(id)
);

drop table if exists companies;
create table companies(
id serial primary key,
name varchar(255) not null,
email varchar(100),
phone bigint unsigned,
tin smallint unsigned,
created_at datetime default now(),
updated_at datetime default current_timestamp on update current_timestamp
);

drop table if exists counterparties;
create table counterparties(
id serial primary key,
name varchar(255) not null,
counterparty_type enum('legal_entity', 'individual') default 'legal_entity',
tin smallint unsigned,
email varchar(100),
phone bigint unsigned,
created_at datetime default now(),
updated_at datetime default current_timestamp on update current_timestamp
);

drop table if exists document_types;
create table document_types(
id serial primary key,
name varchar(255) not null,
account_for_counterparties tinyint(1) default 0 not null,
account_for_companies tinyint(1) default 0 not null,
account_for_case_files tinyint(1) default 0 not null,
created_at datetime default now(),
updated_at datetime default current_timestamp on update current_timestamp
);

drop table if exists case_files_catalog;
create table case_files_catalog(
id serial primary key,
name varchar(255) not null,
year_of_case_files smallint(4) unsigned not null,
index_of_case_files varchar(25) not null,
company_id bigint unsigned not null,
retention_period smallint(3) unsigned not null,
created_at datetime default now(),
updated_at datetime default current_timestamp on update current_timestamp,
index in_index_of_case_files (index_of_case_files),
foreign key (company_id) references companies(id)
);

drop table if exists documents;
create table documents(
id serial primary key,
document_type_id bigint unsigned not null,
title varchar(150) not null,
author_id bigint unsigned not null,
department_id bigint unsigned,
registration_date datetime,
registration_number varchar(40),
company_id bigint unsigned,
counterparty_id bigint unsigned,
number_sheets smallint unsigned,
content varchar(255),
responsible_id bigint unsigned,
case_files_catalog_id bigint unsigned,
dossier_number smallint unsigned,
created_at datetime default now(),
updated_at datetime default current_timestamp on update current_timestamp,
index in_document_type_id (document_type_id),
index in_author_id (author_id),
index in_department_id (department_id),
index in_company_id(company_id),
index in_responsible_id(responsible_id),
index in_counterparty_id(counterparty_id),
index in_case_files_catalog_id(case_files_catalog_id),
foreign key (document_type_id) references document_types(id),
foreign key (author_id) references users(id),
foreign key (department_id) references departments(id),
foreign key (company_id) references companies(id),
foreign key (counterparty_id) references counterparties(id),
foreign key (responsible_id) references users(id),
foreign key (case_files_catalog_id) references case_files_catalog(id)
);

drop table if exists files;
create table files(
id serial primary key,
name varchar(150) not null,
author_id bigint unsigned not null,
document_id bigint unsigned not null,
extension varchar(10) not null,
file_path varchar(1000) not null,
created_at datetime default now(),
updated_at datetime default current_timestamp on update current_timestamp,
index in_author_id(author_id),
index in_document_id(document_id),
foreign key (author_id) references users(id),
foreign key (document_id) references documents(id)
);

drop table if exists tasks;
create table tasks(
id serial primary key,
name varchar(250) not null,
author_id bigint unsigned not null,
performer_id bigint unsigned not null,
details varchar(400),
importance enum('high_importance', 'normal_importance', 'low_importance') default 'normal_importance',
term datetime,
start_date datetime not null,
execution_date datetime,
execution_result varchar(255),
executed tinyint(1) default 0 not null,
created_at datetime default now(),
updated_at datetime default current_timestamp on update current_timestamp,
index in_author_id(author_id),
index in_performer_id(performer_id),
index in_importance(importance),
foreign key (author_id) references users(id),
foreign key (performer_id) references users(id)
);

drop table if exists subjects;
create table subjects(
task_id bigint unsigned not null,
document_id bigint unsigned not null,
index in_task_id(task_id),
index in_document_id(document_id),
foreign key (task_id) references tasks(id),
foreign key (document_id) references documents(id)
);
