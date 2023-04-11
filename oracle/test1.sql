show user;

create table tbl_class(class_seq number(4), regist_month char(8), class_no char(5), class_area varchar2(15), tution number(8), teacher_code char(3));
create sequence class_seq;
insert into tbl_class values (class_seq.nextval, '202203', '10001', '서울본원', 100000, '100');
insert into tbl_class values (class_seq.nextval, '202203', '10002', '성남분원', 100000, '100');
insert into tbl_class values (class_seq.nextval, '202203', '10003', '부산분원', 200000, '200');
insert into tbl_class values (class_seq.nextval, '202203', '20001', '광주분원', 150000, '300');
insert into tbl_class values (class_seq.nextval, '202203', '20002', '대전분원', 200000, '400');
select * from tbl_class;
desc tbl_class;

create table tbl_member(member_seq number(4), member_no char(5), c_name varchar2(12), phone varchar2(11), address varchar2(50), regist_date char(8), member_type varchar2(12));
create sequence member_seq;
insert into tbl_member values (member_seq.nextval, '10001', '이다영', '01022221111', '서울시 강남구', '20220101', '일반');
insert into tbl_member values (member_seq.nextval, '10002', '이유섭', '01011112222', '서울시 성북구', '20220102', '일반');
insert into tbl_member values (member_seq.nextval, '10003', '이재호', '01022223333', '성남시 분당구', '20220103', '일반');
insert into tbl_member values (member_seq.nextval, '10004', '조태정', '01033334444', '부산시 서구', '20220104', '일반');
insert into tbl_member values (member_seq.nextval, '20001', '황병준', '01044445555', '광주시 남구', '20220105', 'VIP');
insert into tbl_member values (member_seq.nextval, '20002', '전재영', '01055556666', '대전시 유성구', '20220106', 'VIP');
select * from tbl_member;
desc tbl_member;

create table tbl_teacher(teacher_seq number(4), teacher_code char(3), class_name varchar2(12), teacher_name varchar2(11), class_price number(8) default 100000, teacher_regist_date char(8), contract date default sysdate);
create sequence teacher_seq start with 5;
insert into tbl_teacher values (teacher_seq.nextval, '100', '초급반', '김초급', 100000, '20220101', default);
insert into tbl_teacher values (teacher_seq.nextval, '200', '중급반', '이중급', 200000, '20220102', default);
insert into tbl_teacher values (teacher_seq.nextval, '300', '고급반', '박고급', 300000, '20220103', default);
insert into tbl_teacher values (teacher_seq.nextval, '400', '심화반', '조심화', 400000, '20220104', default);
select * from tbl_teacher;
desc tbl_teacher;

commit;

create table tbl_board(board_seq number(4), title varchar2(200), content varchar2(500), author char(40), resdate date);
create sequence board_seq;
insert into tbl_board values (board_seq.nextval, '게시글1제목', '첫 번째 게시글에 대한 내용입니다.', '관리자', '2023-01-01');
insert into tbl_board values (board_seq.nextval, '게시글제목2', '두 번째 공지사항입니다.', '초급반', '2023-01-02');
insert into tbl_board values (board_seq.nextval, '게시글3제목', '세 번째 업로드 자료입니다.', '고급반', '2023-01-03');
insert into tbl_board values (board_seq.nextval, '게시글제목4', '네 번째 게시글의 내용입니다.', '조심화', '2023-01-04');
select board_seq, title, content, author, to_char(resdate, 'YYYY/MM/DD') as resdate from tbl_board;
desc tbl_board;

commit;

show user;

alter table tbl_class add(classroom  varchar2(10) default 'A201');
select * from tbl_class;
desc tbl_class;

alter table tbl_member rename column member_no to cno;
desc tbl_member;

alter table tbl_teacher drop column contract;
desc tbl_teacher;

drop sequence member_seq;
drop table tbl_member;
create table tbl_member(member_seq number(4), member_no char(5), c_name varchar2(12), phone varchar2(11), address varchar2(50), regist_date char(8), member_type varchar2(12));
create sequence member_seq;
alter table tbl_member rename column member_no to cno;
alter table tbl_member add primary key(cno);
alter table tbl_class add primary key(class_no);
alter table tbl_member add constraint fk_cno foreign key(cno) references tbl_class (class_no);
select * from all_constraints where owner = 'TEST1';
select * from all_constraints where table_name = 'tbl_member';
select * from all_constraints where table_name = 'tbl_class';
alter table tbl_member drop constraint fk_cno;
insert into tbl_member values (member_seq.nextval, '10001', '이다영', '01022221111', '서울시 강남구', '20220101', '일반');
insert into tbl_member values (member_seq.nextval, '10002', '이유섭', '01011112222', '서울시 성북구', '20220102', '일반');
insert into tbl_member values (member_seq.nextval, '10003', '이재호', '01022223333', '성남시 분당구', '20220103', '일반');
insert into tbl_member values (member_seq.nextval, '10004', '조태정', '01033334444', '부산시 서구', '20220104', '일반');
insert into tbl_member values (member_seq.nextval, '20001', '황병준', '01044445555', '광주시 남구', '20220105', 'VIP');
insert into tbl_member values (member_seq.nextval, '20002', '전재영', '01055556666', '대전시 유성구', '20220106', 'VIP');
select * from tbl_member;
desc tbl_member;

create table tbl_notice as select * from tbl_board;
delete from tbl_notice;
select * from tbl_notice;

insert into tbl_class values (class_seq.nextval, '202203', '10004', '수원분원', 200000, '100', default);
insert into tbl_class values (class_seq.nextval, '202203', '20003', '청주분원', 150000, '400', default);
insert into tbl_class values (class_seq.nextval, '202203', '20004', '전주분원', 150000, '300', default);
insert into tbl_class values (class_seq.nextval, '202203', '10005', '고양분원', 200000, '100', default);
insert into tbl_class values (class_seq.nextval, '202203', '10006', '대구분원', 100000, '200', default);
select * from tbl_class;
drop table tbl_board;
select * from user_tables;

create table tbl_course as select class_no, class_area, tution, teacher_code, classroom from tbl_class;
alter table tbl_course add primary key(class_no);
alter table tbl_course drop primary key;
--alter table tbl_course add primary key(teacher_code);
alter table tbl_teacher add primary key(teacher_code);
alter table tbl_course add constraint fk_code foreign key(teacher_code) references tbl_teacher (teacher_code);
select * from all_constraints where owner = 'TEST1';
select * from all_constraints where table_name = 'tbl_source';
select * from all_constraints where table_name = 'tbl_teacher';
--alter table tbl_member drop constraint fk_code;

insert into tbl_teacher values (teacher_seq.nextval, '500', '전문반', '최전문', 500000, '20220105');
select * from tbl_teacher;
insert into tbl_course values ('20003', '서울본원', 250000, 500, 'A202');
select * from tbl_course;

create table tbl_class_2204 as select * from tbl_class;
select * from tbl_class_2204;
delete from tbl_class_2204 where class_no=10002;
select * from tbl_class_2204;
update tbl_class_2204 set class_area='의정부' where class_no=10003;
select * from tbl_class_2204;
 
update tbl_course set tution=tution+20000;
select * from tbl_course;

commit;

alter table tbl_class rename column class_no to c_no;
alter table tbl_course rename column class_no to c_no;
alter table tbl_member rename column member_type to c_type;

select c_no, class_area, teacher_code from tbl_course where tution between 200000 and 300000;

select c_no, tution, teacher_code from tbl_course where class_area like '%분원';

select cno, c_name, phone, c_type from tbl_member where address like '서울%' OR address LIKE '성남%' OR address LIKE '수원%';

select distinct cno, count(*) as 수강생인원수 from tbl_member group by cno;

select c_no, class_area, tution from tbl_course where c_no not in (select cno from tbl_member) order by c_no;

select teacher_code, class_name, teacher_name from tbl_teacher where teacher_code not in (select teacher_code from tbl_course);

select teacher_code, teacher_name, class_price from tbl_teacher where 
teacher_code not in (select teacher_code from tbl_course where c_no in (select cno from tbl_member));

create view tbl_joint as select b.teacher_code, a.teacher_name, a.class_name, count(1) 배정된캠퍼스수 from 
tbl_teacher a inner join tbl_class b on a.teacher_code=b.teacher_code group by b.teacher_code, a.teacher_name, a.class_name; 
select * from tbl_joint;

select a.class_area, b.c_name, b.phone, b.address, b.c_type from tbl_course a inner join tbl_member b on a.c_no=b.cno;

select a.c_no, a.class_area, b.class_name, b.teacher_name, a.tution, b.class_price from tbl_course a inner join tbl_teacher b on a.teacher_code=b.teacher_code;

select a.c_name, b.class_area, c.class_name, c.teacher_name, b.classroom from tbl_member a inner join tbl_course b on a.cno=b.c_no inner join tbl_teacher c on b.teacher_code=c.teacher_code;

select b.class_area, c.class_name, count(a.c_name) 수강인원수 from tbl_member a inner join tbl_course b on a.cno=b.c_no inner join 
tbl_teacher c on b.teacher_code=c.teacher_code group by b.class_area, c.class_name, a.c_name;

select c.teacher_name, sum(b.tution) 수강료합계 from tbl_member a inner join tbl_course b on a.cno=b.c_no inner join 
tbl_teacher c on b.teacher_code=c.teacher_code group by c.teacher_name, b.tution;

commit;

drop view member_new;
drop view member_secession;
drop view member_legacy;
drop view member_total;
drop table tbl_member_2301;
drop table tbl_member_2302;

create table tbl_member_2301 as select * from tbl_member where 1=2;
create table tbl_member_2302 as select * from tbl_member where 1=2;

insert into tbl_member_2301 values (1,'10001','이자영','01022221111','서울시 강남구','20230101','일반');
insert into tbl_member_2301 values (2,'10002','이규섭','01011112222','서울시 성북구','20230102','일반');
insert into tbl_member_2301 values (3,'10003','이윤호','01022223333','성남시 분당구','20230103','일반');
insert into tbl_member_2301 values (4,'10004','조태철','01033334444','부산시 서구','20230104','일반');
insert into tbl_member_2301 values (5,'20001','황기준','01044445555','광주시 남구','20230105','일반');
insert into tbl_member_2301 values (6,'20002','전소영','01055556666','대전시 유성구','20230106','일반');
insert into tbl_member_2301 values (7,'10001','정혜진','01044445555','대구시 달성군','20230107','일반');
insert into tbl_member_2301 values (8,'10002','허무해','01088889999','천안시 서북구','20230108','일반');
insert into tbl_member_2301 values (9,'10003','김태종','01077771111','수원시 장안구','20230109','일반');

insert into tbl_member_2302 values (1,'10001','이자영','01022221111','서울시 강남구','20230201','일반');
insert into tbl_member_2302 values (2,'10002','이규섭','01011112222','서울시 성북구','20230102','일반');
insert into tbl_member_2302 values (3,'10003','이윤호','01022223333','성남시 분당구','20230103','일반');
insert into tbl_member_2302 values (4,'10004','조태철','01033334444','부산시 서구','20230104','일반');
insert into tbl_member_2302 values (5,'20001','황기준','01044445555','광주시 남구','20230105','일반');
insert into tbl_member_2302 values (6,'20002','전소영','01055556666','대전시 유성구','20230106','일반');
insert into tbl_member_2302 values (7,'10001','정혜진','01044445555','대구시 달성군','20230107','일반');
insert into tbl_member_2302 values (8,'10002','허무해','01088889999','천안시 서북구','20230108','일반');
insert into tbl_member_2302 values (9,'10003','김태종','01077771111','수원시 장안구','20230109','일반');

select * from tbl_member_2301;
select * from tbl_member_2302;
desc tbl_member_2301;
desc tbl_member_2302;

create view member_total as (select * from tbl_member_2301 UNION select * from tbl_member_2302);
select * from member_total;

create view member_legacy as (select * from tbl_member_2301 INTERSECT select * from tbl_member_2302);
select * from member_legacy;

create view member_secession as (select * from tbl_member_2301 MINUS select * from tbl_member_2302);
select * from member_secession;

create view member_new as (select * from tbl_member_2302 MINUS select * from tbl_member_2301);
select * from member_new;

commit;
















