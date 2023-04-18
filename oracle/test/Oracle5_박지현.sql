select cno, c_name, phone, c_type from tbl_member where address like '서울%' OR address LIKE '성남%' OR address LIKE '수원%';

select distinct cno, count(*) as 수강생인원수 from tbl_member group by cno;

select c_no, class_area, tution from tbl_course where c_no not in (select cno from tbl_member) order by c_no;

select teacher_code, class_name, teacher_name from tbl_teacher where teacher_code not in (select teacher_code from tbl_course);

select teacher_code, teacher_name, class_price from tbl_teacher where teacher_code in (select teacher_code from tbl_course where c_no in (select cno from tbl_member));

commit;