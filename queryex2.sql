show databases;
use company;
show tables;

select * from course_tbl;
desc course_tbl;
-- select * from course_tbl where start_hour=900 order by id desc;
-- select start_hour, count(start_hour) as cnt from course_tbl group by start_hour;
-- 11시 후~13시 전에 수업중인 과정 코스를 검색
select * from course_tbl where start_hour<1300 and end_end>1100;
-- 기간이 2주 이하면서 하루 소요시간이 2시간 이내인 아이디, 과정명, 교수코드를 검색
select id, name, lecturer from course_tbl where week<=2 and (end_end - start_hour) <= 200;
-- 교수코드가 이교수, 박교수, 우교수인 과정의 아이디, 과정명, 주, 시작시간을 검색
select id, name, week, start_hour from course_tbl where lecturer in ('2','3','4');
-- 시작시간이 12시 부터 14시 까지인 아이디, 과정명, 시작시간, 종료시간을 검색
select id, name, start_hour, end_end from course_tbl where start_hour between 1200 and 1400;
-- 아이디가 1로 끝나는 아이디, 과정명, 시작시간, 종료시간, 교수코드, 학점을 검색
select id, name, start_hour, end_end, lecturer, credit from course_tbl where id like '%1';

select * from lecturer_tbl;
desc lecturer_tbl;

-- 전공(major)별 교수의 인원수를 구하여 뷰(major_view)를 생성하고 검색하시오
create view marjor_view as (select major, count(major) as cnt from lecturer_tbl group by major);
-- 연구분야(field)가 알고리즘이거나 운영체제인 교수의 번호, 강사명, 전공을 검색하되, 번호별로 내림차순 정렬하여 뷰(order_view)를 생성하고 검색하시오
create view order_view as (select idx, name, major from lecturer_tbl where field='알고리즘' or field like '%운영체제%' order by idx desc);
-- 과목명, 강사명, 전공, 학점, 시작, 종료를 검색하되, course_tbl의 lecturer(강사)와 lecturer_tbl의 idx(번호)를 참조하여 검색하시오
select course_tbl.name, lecturer_tbl.name, lecturer_tbl.major, course_tbl.credit, course_tbl.start_hour, course_tbl.end_end from course_tbl 
inner join lecturer_tbl on course_tbl.lecturer=lecturer_tbl.idx;
-- 각 과정에 배정된 강사의 강사명과 전공을 검색하되, course_tbl의 lecturer(강사)와 lecturer_tbl의 idx(번호)를 참조하여 구하는 뷰(lecturer_view1)를 생성하고 검색하시오
create view lecturer_view1 as 
(select distinct name, major from lecturer_tbl where idx in(select lecturer 
 from course_tbl));
select * from lecturer_view1;
-- 각 과정에 배정되지 않은 강사의 강사명과 전공을 검색하되, course_tbl의 lecturer(강사)와 lecturer_tbl의 idx(번호)를 참조하여 구하는 뷰(lecturer_view2)를 생성하고 검색하시오
create view lecturer_view2 as 
(select distinct name, major from lecturer_tbl where idx not in(select lecturer 
 from course_tbl));
select * from lecturer_view2;
-- 각 과정에 가장 많이 배정된 강사의 강사명과 전공을 검색하되, course_tbl의 lecturer(강사)와 lecturer_tbl의 idx(번호)를 참조하여 구하는 뷰(lecturer_view3)를 생성하고 검색하시오
 select name, major from lecturer_tbl where idx in (select count(lecturer) as cnt from course_tbl);
-- 월요일에 배정된 강사의 name(과목명), credit(학점), name(강사명), major(전공), field(세부전공) 등을 구하는 뷰(monday_course_view)를 생성하고 검색하시오
select course_tbl.name, course_tbl.credit, lecturer_tbl.name,
 lecturer_tbl.major, lecturer_tbl.field
 from course_tbl inner join lecturer_tbl
 on course_tbl.lecturer=lecturer_tbl.idx where course_tbl.week=1;
-- 학점이 3학점인 과목의 과목id, 과목명, 강사명, 요일, 세부전공 등을 검색하여 구하는 뷰(credit3_view)를 생성하고 검색하시오
select course_tbl.id, course_tbl.name, lecturer_tbl.name, course_tbl.week, 
lecturer_tbl.field from lecturer_tbl inner join course_tbl
 on lecturer_tbl.idx=course_tbl.lecturer where course_tbl.credit = 3;
-- 일주일에 4시간 이상 강의하는 강사의 강사명, 전공, 세부전공 등을 검색하여 구하는 뷰(lecturer_view4)를 생성하고 검색하시오
select lecturer_tbl.name, lecturer_tbl.major, lecturer_tbl.field
 from lecturer_tbl, course_tbl
 where lecturer_tbl.idx=course_tbl.lecturer and (course_tbl.end_end - course_tbl.start_hour) >= 300;
-- 각 요일(week)별로 진행하는 과목명, 학점, 강사명, 전공 등을 검색하여 구하는 뷰(course_view2)를 생성하고 검색하시오
select week, count(course_tbl.name) as 과목수, sum(course_tbl.credit) 총학점, 
count(course_tbl.lecturer) 해당강사수 from course_tbl group by course_tbl.week;
create view course_view2 as select week, count(course_tbl.name) as 과목수, sum(course_tbl.credit) 총학점, 
count(course_tbl.lecturer) 해당강사수 from course_tbl group by course_tbl.week;
select * from course_view2;

commit;