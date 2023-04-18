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

commit;