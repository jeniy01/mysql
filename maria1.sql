show databases;
use company;
show tables;

create table lecturer_tbl(idx int(6) not null primary key, name varchar(20), major varchar(40), field varchar(40));
insert into lecturer_tbl values (1,'김교수','소프트웨어공학','알고리즘');
insert into lecturer_tbl values (2,'이교수','소프트웨어공학','인공지능');
insert into lecturer_tbl values (3,'박교수','소프트웨어공학','소프트웨어공학');
insert into lecturer_tbl values (4,'우교수','소프트웨어공학','알고리즘');
insert into lecturer_tbl values (5,'최교수','응용컴퓨터공학','임베디드 시스템');
insert into lecturer_tbl values (6,'강교수','응용컴퓨터공학','멀티미디어');
insert into lecturer_tbl values (7,'황교수','모바일시스템공학','네트워크');
select * from lecturer_tbl;