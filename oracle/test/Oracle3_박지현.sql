create table tbl_teacher(teacher_seq number(4) not null, teacher_code char(3) not null primary key, class_name varchar2(12), teacher_name varchar2(12), class_price number(8), teacher_regist_date char(8));
insert into tbl_teacher values (5, '100', '초급반', '김초급', 100000, '20220101', default);
insert into tbl_teacher values (6, '200', '중급반', '이중급', 200000, '20220102', default);
insert into tbl_teacher values (7, '300', '고급반', '박고급', 300000, '20220103', default);
insert into tbl_teacher values (8, '400', '심화반', '조심화', 400000, '20220104', default);
select * from tbl_teacher;
desc tbl_teacher;
alter table tbl_teacher add(contract date default sysdate);
select * from tbl_teacher;
desc tbl_teacher;

insert into tbl_class values (6, '202203', '10004', '수원분원', 200000, '100', default);
insert into tbl_class values (7, '202203', '20003', '청주분원', 150000, '400', default);
insert into tbl_class values (8, '202203', '20004', '전주분원', 150000, '300', default);
insert into tbl_class values (9, '202203', '10005', '고양분원', 200000, '100', default);
insert into tbl_class values (10, '202203', '10006', '대구분원', 100000, '200', default);
select * from tbl_class;

commit;