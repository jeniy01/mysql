show user;

create table tbl_class(class_seq number(4) not null, regist_month char(8) not null, c_no char(5) not null primary key, class_area varchar2(15), tution number(8), teacher_code char(3));
insert into tbl_class values (1, '202203', '10001', '서울본원', 100000, '100');
insert into tbl_class values (2, '202203', '10002', '성남분원', 100000, '100');
insert into tbl_class values (3, '202203', '10003', '부산분원', 200000, '200');
insert into tbl_class values (4, '202203', '20001', '광주분원', 150000, '300');
insert into tbl_class values (5, '202203', '20002', '대전분원', 200000, '400');
select * from tbl_class;
desc tbl_class;

create table tbl_member(member_seq number(4) not null primary key, c_no char(5) not null, c_name varchar2(12), phone varchar2(11), address varchar2(50), regist_date char(8), c_type varchar2(12));
insert into tbl_member values (1, '10001', '이다영', '01022221111', '서울시 강남구', '20220101', '일반');
insert into tbl_member values (2, '10002', '이유섭', '01011112222', '서울시 성북구', '20220102', '일반');
insert into tbl_member values (3, '10003', '이재호', '01022223333', '성남시 분당구', '20220103', '일반');
insert into tbl_member values (4, '10004', '조태정', '01033334444', '부산시 서구', '20220104', '일반');
insert into tbl_member values (5, '20001', '이상혁', '01044445555', '광주시 남구', '20220105', 'VIP');
insert into tbl_member values (6, '20002', '전재영', '01055556666', '대전시 유성구', '20220106', 'VIP');
select * from tbl_member;
desc tbl_member;

alter table tbl_class add(classroom  varchar2(10) default 'A201');
select * from tbl_class;
desc tbl_class;

alter table tbl_member rename column c_no to cno;
desc tbl_member;
drop table tbl_member;
create table tbl_member(member_seq number(4) not null, cno char(5) not null primary key, c_name varchar2(12), phone varchar2(11), address varchar2(50), regist_date char(8), c_type varchar2(12));
alter table tbl_member add constraint fk_cno foreign key(cno) references tbl_class (c_no);
select * from all_constraints where owner='TEST1';
drop table tbl_member;
create table tbl_member(member_seq number(4) not null, cno char(5) not null primary key, c_name varchar2(12), phone varchar2(11), address varchar2(50), regist_date char(8), c_type varchar2(12));
insert into tbl_member values (1, '10001', '이다영', '01022221111', '서울시 강남구', '20220101', '일반');
insert into tbl_member values (2, '10002', '이유섭', '01011112222', '서울시 성북구', '20220102', '일반');
insert into tbl_member values (3, '10003', '이재호', '01022223333', '성남시 분당구', '20220103', '일반');
insert into tbl_member values (4, '10004', '조태정', '01033334444', '부산시 서구', '20220104', '일반');
insert into tbl_member values (5, '20001', '이상혁', '01044445555', '광주시 남구', '20220105', 'VIP');
insert into tbl_member values (6, '20002', '전재영', '01055556666', '대전시 유성구', '20220106', 'VIP');

create table tbl_teacher(teacher_seq number(4) not null, teacher_code char(3) not null primary key, class_name varchar2(12), teacher_name varchar2(12), class_price number(8), teacher_regist_date char(8),  contract date default sysdate);
insert into tbl_teacher values (5, '100', '초급반', '김초급', 100000, '20220101', default);
insert into tbl_teacher values (6, '200', '중급반', '이중급', 200000, '20220102', default);
insert into tbl_teacher values (7, '300', '고급반', '박고급', 300000, '20220103', default);
insert into tbl_teacher values (8, '400', '심화반', '조심화', 400000, '20220104', default);
select * from tbl_teacher;
desc tbl_teacher;

insert into tbl_class values (6, '202203', '10004', '수원분원', 200000, '100', default);
insert into tbl_class values (7, '202203', '20003', '청주분원', 150000, '400', default);
insert into tbl_class values (8, '202203', '20004', '전주분원', 150000, '300', default);
insert into tbl_class values (9, '202203', '10005', '고양분원', 200000, '100', default);
insert into tbl_class values (10, '202203', '10006', '대구분원', 100000, '200', default);
select * from tbl_class;

create table tbl_course as select c_no, class_area, tution, teacher_code, classroom from tbl_class;
alter table tbl_course add primary key(c_no);
select * from tbl_course;
desc tbl_course;
alter table tbl_course drop primary key;
alter table tbl_course add constraint fk_code foreign key(teacher_code) references tbl_teacher (teacher_code);
select * from all_constraints where owner = 'TEST1';

alter table tbl_teacher drop column contract;
insert into tbl_teacher values (9, '500', '전문반', '최전문', 500000, '20220105');
select * from tbl_teacher;
desc tbl_teacher;
insert into tbl_course values ('20005', '서울본원', 250000, 500, 'A202');
select * from tbl_course;

create table tbl_class_2204 as select * from tbl_class;
delete from tbl_class_2204 where c_no=10002;
update tbl_class_2204 set class_area='의정부' where c_no=10003;
select * from tbl_class_2204;
 
update tbl_course set tution=tution+20000;
select * from tbl_course;
select c_no, class_area, teacher_code from tbl_course where tution between 200000 and 300000;

select c_no, tution, teacher_code from tbl_course where class_area like '%분원';

select cno, c_name, phone, c_type from tbl_member where address like '서울%' OR address LIKE '성남%' OR address LIKE '수원%';

select distinct cno, count(*) as 수강생인원수 from tbl_member group by cno;

select c_no, class_area, tution from tbl_course where c_no not in (select cno from tbl_member) order by c_no;

select teacher_code, class_name, teacher_name from tbl_teacher where teacher_code not in (select teacher_code from tbl_course);

select teacher_code, teacher_name, class_price from tbl_teacher where teacher_code in (select teacher_code from tbl_course where c_no in (select cno from tbl_member));

create view tbl_joint as select b.teacher_code, a.teacher_name, a.class_name, count(1) 배정된캠퍼스수 from tbl_teacher a inner join tbl_class b on a.teacher_code=b.teacher_code group by b.teacher_code, a.teacher_name, a.class_name; 
select * from tbl_joint;

select a.class_area, b.c_name, b.phone, b.address, b.c_type from tbl_course a inner join tbl_member b on a.c_no=b.cno;

select a.c_no, b.class_name, a.class_area, a.tution, b.teacher_name from tbl_course a inner join tbl_teacher b on a.teacher_code=b.teacher_code;

select a.class_area, b.c_name, b.phone, b.address, b.c_type from tbl_course a inner join tbl_member b on a.c_no=b.cno;

select a.member_seq, c.class_name, a.c_name, a.phone, a.address, b.class_area from tbl_member a inner join tbl_course b on a.cno=b.c_no inner join tbl_teacher c on b.teacher_code=c.teacher_code;

--tbl_course와 tbl_member를 참조하여 과정코드(a-member-cno), 과정명(c-teacher-class_name), 수강료합계(sum(b-course-tution))를 조회하는 쿼리를 작성하고 실행
select a.cno, c.class_name, sum(b.tution) 수강료합계 from tbl_member a inner join tbl_course b on a.cno=b.c_no inner join tbl_teacher c on b.teacher_code=c.teacher_code group by a.cno, b.tution, c.class_name;

create table tbl_member_2202 as select * from tbl_member;
savepoint a;
insert into tbl_member_2202 values(8,'10003','조교행','01027481234','고양시 일산서구','20220108','일반');
update tbl_member_2202 set address='서울시 서초구' where cno='10002';
select * from tbl_member_2202;
rollback to savepoint a;
select * from tbl_member_2202;

savepoint b;
insert into tbl_member_2202 values(9,'10002','손승기','01012345678','파주시 문산읍','20220109','일반');
update tbl_member_2202 set address='수원시 권선구' where member_seq=6;
select * from tbl_member_2202;
commit;
select * from tbl_member_2202;

create sequence member_seq;
update tbl_member set member_seq=member_seq.nextval;
select member_seq.currval from dual;
select * from tbl_member;

create sequence teacher_seq start with 5;
update tbl_teacher set teacher_seq=teacher_seq.nextval;
select teacher_seq.currval from dual;
select * from tbl_teacher;

create sequence class_seq start with 1;
update tbl_class set class_seq=class_seq.nextval;
select class_seq.currval from dual;
select * from tbl_class;

create index idx_member on tbl_member(member_seq);
create index idx_course on tbl_course(c_no);

select table_name, index_name, column_name from all_ind_columns where table_name='TBL_MEMBER';
select table_name, index_name, column_name from all_ind_columns where table_name='TBL_COURSE';

create view teacher_msl_view as (select b.c_no, b.class_area, a.class_name, a.teacher_name, b.tution, a.class_price from tbl_teacher a inner join tbl_course b on a.teacher_code=b.teacher_code);
select * from teacher_msl_view;

create view course_msl_view as (select c.c_name, b.class_area, a.class_name, a.teacher_name, b.classroom from tbl_member c inner join tbl_course b on c.cno=b.c_no inner join tbl_teacher a on b.teacher_code=a.teacher_code);
select * from course_msl_view;

create table tbl_member_2301 as select * from tbl_member where 1=2;
insert into tbl_member_2301 values (1,'10001','이자영','01022221111','서울시 강남구','20230101','일반');
insert into tbl_member_2301 values (2,'10002','이규섭','01011112222','서울시 성북구','20230102','일반');
insert into tbl_member_2301 values (3,'10003','이윤호','01022223333','성남시 분당구','20230103','일반');
insert into tbl_member_2301 values (4,'10004','조태철','01033334444','부산시 서구','20230104','일반');
insert into tbl_member_2301 values (5,'20001','황기준','01044445555','광주시 남구','20230105','VIP');
insert into tbl_member_2301 values (6,'20002','전소영','01055556666','대전시 유성구','20230106','VIP');
insert into tbl_member_2301 values (7,'10001','정혜진','01044445555','대구시 달성군','20230107','일반');
insert into tbl_member_2301 values (8,'10002','허무해','01088889999','천안시 서북구','20230108','일반');
insert into tbl_member_2301 values (9,'10003','김태종','01077771111','수원시 장안구','20230109','일반');
select * from tbl_member_2301;
desc tbl_member_2301;
create table tbl_member_2302 as select * from tbl_member where 1=2;
insert into tbl_member_2302 values (1,'10001','이자영','01022221111','서울시 강남구','20230201','일반');
insert into tbl_member_2302 values (2,'10002','이규섭','01011112222','서울시 성북구','20230202','일반');
insert into tbl_member_2302 values (3,'10003','이윤호','01022223333','성남시 분당구','20230203','일반');
insert into tbl_member_2302 values (4,'10004','조태철','01033334444','부산시 서구','20230204','일반');
insert into tbl_member_2302 values (5,'20001','백석준','01044445555','광주시 북구','20230205','VIP');
insert into tbl_member_2302 values (6,'20002','전소영','01055556666','대전시 유성구','20230206','VIP');
insert into tbl_member_2302 values (7,'10001','정혜진','01044445555','대구시 달성군','20230207','일반');
insert into tbl_member_2302 values (8,'10002','김시부','01088889999','고양시 일산동구','20230208','일반');
insert into tbl_member_2302 values (9,'10003','김태종','01077771111','수원시 장안구','20230209','일반');
select * from tbl_member_2302;
desc tbl_member_2302;

create view member_total as (select * from tbl_member_2301 UNION select * from tbl_member_2302);
select * from member_total;

create view member_legacy as (select * from tbl_member_2301 INTERSECT select * from tbl_member_2302);
select * from member_legacy;

create view member_new as (select * from tbl_member_2302 MINUS select * from tbl_member_2301);
select * from member_new;

desc tbl_member;

select * from user_tables;

select * from user_views;

select * from user_indexes;

commit;
