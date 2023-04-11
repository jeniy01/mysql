show databases;
use sample;
show tables;
desc test1;
desc test2;
select * from test1;
select * from students;
show variables like 'char%';

-- select user, host, password from mysql.user;
select * from mysql.user;
-- create user 'test1'@'localhost' identified by '1234';
-- set password for 'test1'@localhost = password('a1234');

create table students(
	student_id int(11) not null auto_increment,
    student_name varchar(100) not null,
    student_address varchar(40) not null,
    admission_date date null default null,
    primary key(student_id));
alter table students add column pw varchar(100);
alter table students change pw student_pw varchar(100);
alter table students modify student_pw varchar(200) not null;
alter table students drop student_pw;

create table account_ledger(id int primary key auto_increment,
	transaction_name varchar(100), credit_accout varchar(100),
    credit_amount int, debit_account varchar(100), debit_amount int);
alter table account_ledger add constraint is_balanced check((debit_amount + credit_amount) = 0);
alter table account_ledger drop constraint is_balanced;
