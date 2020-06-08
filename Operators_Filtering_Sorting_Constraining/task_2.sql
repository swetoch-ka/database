-- ���������, ����������, ���������� � �����������

/* 2. ������� users ���� �������� ��������������. ������ created_at � updated_at ���� ������ ����� VARCHAR 
 � � ��� ������ ����� ���������� �������� � ������� "20.10.2017 8:10". ���������� ������������� ���� � ���� DATETIME, �������� �������� ����� ��������.*/


use shop;

drop table users;

-- ��������� ����� ������� users ��� ���������������� �������� ������
create table users(
	id serial primary key,
	name VARCHAR(255),
	birthday_at DATE,
	created_at VARCHAR(255),
	updated_at VARCHAR(255)
);

-- ��������� ������� �������
 insert into 
 	users(name, birthday_at, created_at, updated_at) 
 values
	('ivan', '1998-10-25','20.10.2017 8:56', '20.10.2017 8:56'),
	('jon', '1988-05-01','20.10.2018 10:10', '20.10.2018 10:10' ),
	('stiv', '1997-08-02', '20.10.2017 8:10','20.10.2017 8:10'),
	('georg', '1996-05-03','20.10.2019 8:10','20.10.2019 8:10' ),
	('inna', '1996-08-10','20.10.2019 12:59','20.10.2019 12:59' );


 -- ����������� ���� � ��������� ����� created_at � updated_at � ������ ������ ����
  update 
  	users
  set 
     created_at = str_to_date(created_at,'%d.%m.%Y %k:%i'),
     updated_at = str_to_date(updated_at,'%d.%m.%Y %k:%i');
    
 -- �������� ������ �������� created_at � updated_at
alter table
	users
change 
 	created_at created_at DATETIME default CURRENT_TIMESTAMP;
 	
 alter table
	users
change 
 	updated_at updated_at DATETIME default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP;
    
 select * from users;