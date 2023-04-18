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

commit;