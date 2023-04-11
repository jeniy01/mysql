show databases;
use company;
show tables;

create table course_tbl(id varchar(5) primary key,
name varchar(80),
credit int(6),
lecturer varchar(10),
week int(2),
start_hour int(4),
end_end int(4));

insert into course_tbl values('10001', '프로그래밍', 2, '1', 1, 0900, 1100);
insert into course_tbl values('10002', '객체지향 프로그래밍', 2, '2', 2, 0900, 1200);
insert into course_tbl values('10003', '자료구조', 3, '4', 3, 0900, 1200);
insert into course_tbl values('10004', '알고리즘', 3, '4', 4, 0900, 1200);
insert into course_tbl values('20001', '시스템 프로그래밍', 2, '5', 1, 1300, 1600);
insert into course_tbl values('20002', '운영체제', 3, '5', 2, 1500, 1800);
insert into course_tbl values('20003', '오토마타와 컴파일러', 3, '5', 3, 1330, 1630);
insert into course_tbl values('30001', '소프트웨어 공학', 2, '3', 4, 1330, 1530);
insert into course_tbl values('30002', '시스템 분석 및 설계', 3, '3', 5, 0900, 1200);
insert into course_tbl values('40001', '데이터베이스', 3, '2', 5, 1300, 1600);

create table lecturer_tbl(idx int(6) primary key,
name varchar(20),
major varchar(40),
field varchar(40));

insert into lecturer_tbl values (1, '김교수', '소프트웨어공학', '알고리즘');
insert into lecturer_tbl values (2, '이교수', '소프트웨어공학', '인공지능');
insert into lecturer_tbl values (3, '박교수', '소프트웨어공학', '소프트웨어공학');
insert into lecturer_tbl values (4, '우교수', '소프트웨어공학', '알고리즘');
insert into lecturer_tbl values (5, '최교수', '응용컴퓨터공학', '임베디드 시스템');
insert into lecturer_tbl values (6, '강교수', '응용컴퓨터공학', '멀티미디어');
insert into lecturer_tbl values (7, '황교수', '모바일시스템공학', '네트워크');
insert into lecturer_tbl values (8, '정교수', '모바일시스템공학', '모바일운영체제');
desc course_tbl;
select * from course_tbl;

insert into course_tbl values('40002', '모바일운영체제', 3, '3', 4, 1400, 1700);
-- insert into course_tbl values(?, ?, ?, ?, ?, ?, ?);
-- id, name, credit, lecturer, week, start_hour, end_end

update course_tbl set week=3, start_hour=1300, end_end=1600 where id='40002';
-- update course_tbl set week=?, start_hour=?, end_end=? where id=?;
-- week, start_hour, end_end, id

delete from course_tbl where id='40002';
-- delete from course_tbl where id=?;
-- id

select * from lecturer_tbl;


commit;

