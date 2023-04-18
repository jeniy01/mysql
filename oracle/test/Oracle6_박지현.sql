create view tbl_joint as select b.teacher_code, a.teacher_name, a.class_name, count(1) 배정된캠퍼스수 from tbl_teacher a inner join tbl_class b on a.teacher_code=b.teacher_code group by b.teacher_code, a.teacher_name, a.class_name; 
select * from tbl_joint;

select a.class_area, b.c_name, b.phone, b.address, b.c_type from tbl_course a inner join tbl_member b on a.c_no=b.cno;

select a.member_seq, c.class_name, a.c_name, a.phone, a.address, b.class_area from tbl_member a inner join tbl_course b on a.cno=b.c_no inner join tbl_teacher c on b.teacher_code=c.teacher_code;

select a.c_no, b.class_name, a.class_area, a.tution, b.teacher_name from tbl_course a inner join tbl_teacher b on a.teacher_code=b.teacher_code;

select a.cno, c.class_name, sum(b.tution) 수강료합계 from tbl_member a inner join tbl_course b on a.cno=b.c_no inner join tbl_teacher c on b.teacher_code=c.teacher_code group by a.cno, b.tution, c.class_name;

commit;