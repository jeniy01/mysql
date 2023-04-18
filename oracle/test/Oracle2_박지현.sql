grant connect, resource, dba to test1;
conn test1/1234;

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

commit;