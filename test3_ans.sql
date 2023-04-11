-- 테이블 복제
create table tbl_member_2303 as select * from tbl_member_2302;

-- 인덱스 생성
create index idx_member_2303 on tbl_member_2303(cno);

-- 인덱스 조회
select table_name, index_name, column_name from all_ind_columns where table_name='TBL_MEMBER_2303';

-- 인덱스 삭제
drop index idx_member_2303;

select * from tbl_member_2303;

-- 그룹별 집계
select cno, count(c_name) as cnt from tbl_member_2303 group by cno order by cno;

-- 그룹별 집계 뷰(가상 테이블)의 생성
create view cno_group as select cno, count(c_name) as cnt from tbl_member_2303 group by cno order by cno;

-- 그룹별 집계 뷰의 조회
select * from cno_group;

-- 그룹별 집계 뷰의 삭제
drop view cno_group;

-- 테이블 복제
create table tbl_course_2303 as (select * from tbl_course);
create table tbl_teacher_2303 as (select * from tbl_teacher);

-- 테이블 구조 변경
-- 기본키 추가
alter table tbl_course_2303 add primary key (c_no);
alter table tbl_teacher_2303 add primary key (teacher_code);
alter table tbl_member_2303 add primary key (member_seq);

-- 정렬 검색
select * from tbl_member_2303 order by member_seq, c_name;
select * from tbl_course_2303 order by c_no;
select * from tbl_teacher_2303 order by teacher_code;

-- 외래키 추가
alter table tbl_course_2303 add constraint fk_crs foreign key(teacher_code) references tbl_teacher_2303(teacher_code);
alter table tbl_member_2303 add constraint fk_mem foreign key(cno) references tbl_course_2303(c_no);




delete from tbl_course_2303 where c_no='20005';

-- 서브쿼리
-- 일치 검색
select * from tbl_teacher_2303 where teacher_code in (select teacher_code from tbl_course_2303);
select * from tbl_course_2303 where teacher_code in (select teacher_code from tbl_teacher_2303);

-- 수강생이 있는 과정 코스(tbl_course_2303)를 조회
select * from tbl_course_2303 where c_no in (select cno from tbl_member_2303);
-- 배정된 교사 정보(tbl_teacher_2303) 조회
select * from tbl_teacher_2303 where teacher_code in (select teacher_code from tbl_course_2303);
-- 교사(tbl_teacher_2303)가 강의하고 있는 강의 정보(tbl_course_2303)를 조회
select * from tbl_course_2303 where teacher_code in (select teacher_code from tbl_teacher_2303);
-- 수강생이 있어 개강예정인 교사 정보를 출력
select * from tbl_teacher_2303 where teacher_code in(select teacher_code from tbl_course_2303 where c_no in 
(select cno from tbl_member_2303));

-- 불일치 검색
select * from tbl_teacher_2303 where teacher_code not in (select teacher_code from tbl_course_2303);
select * from tbl_course_2303 where teacher_code not in (select teacher_code from tbl_teacher_2303);

-- 수강생이 없는 과정 코스(tbl_course_2303)
select * from tbl_course_2303 where c_no not in (select cno from tbl_member_2303);
-- 배정되지 않은 교사 정보(tbl_teacher_2303) 조회
select * from tbl_teacher_2303 where teacher_code not in (select teacher_code from tbl_course_2303);
-- 교사(tbl_teacher_2303)가 강의하고 않은 강의 정보(tbl_course_2303)를 조회
select * from tbl_course_2303 where teacher_code not in (select teacher_code from tbl_teacher_2303);
-- 수강생이 없어 휴강예정인 교사 정보를 출력
select * from tbl_teacher_2303 where teacher_code not in(select teacher_code from tbl_course_2303 where c_no not in 
(select cno from tbl_member_2303));

-- 내부 조인
-- 강의별 과정이름, 교사명, 강의실 검색 
select a.class_name, a.teacher_name, b.classroom from tbl_teacher_2303 a inner join tbl_course_2303 b
on a.teacher_code=b.teacher_code;

-- 수강생이 있는 과정 코스(tbl_course_2303)를 조회
select a.* from tbl_course_2303 a inner join tbl_member_2303 b on a.c_no=b.cno;
-- 배정된 교사 정보(tbl_teacher_2303) 조회
select a.* from tbl_teacher_2303 a inner join tbl_course_2303 b on a.teacher_code=b.teacher_code;
-- 교사(tbl_teacher_2303)가 강의하고 있는 강의 정보(tbl_course_2303)를 조회
select a.* from tbl_course_2303 a inner join tbl_teacher_2303 b on a.teacher_code=b.teacher_code;


commit;







