-- 과정 정보(tbl_class) 테이블에 가변문자열 10바이트크기로 강의실(classroom)컬럼을 추가하되, 기본값은 A201로 하고,
-- 그 기본값으로 이미 추가된 레코드에 반영될 수 있도록 하시오.
alter table tbl_class add classroom varchar2(10) default 'A201';
update tbl_class set classroom=default;

-- 수강 신청 정보(tbl_member) 테이블에 컬럼 중에서 c_no(과정코드)를 cno로 컬럼명을 변경하시오.
alter table tbl_member rename column c_no to cno;

-- 수강 신청 정보(tbl_member) 테이블에 컬럼 중에서 cno(과정코드)를 tbl_class 테이블의 c_no(과정번호)를 참조하는 외래키로 등록하시오.
-- select * from all_constraints where owner = 'TEST1'; -- TEST1 아이디가 작성한 제약조건 검색
-- select * from all_constraints where table_name = 'TBL_MEMBER'; -- 테이블명이 tbl_member에 설정된 제약조건 검색
-- select * from all_constraints where table_name = 'TBL_CLASS';   -- 테이블명이 tbl_class에 설정된 제약조건 검색
-- alter table tbl_class drop primary key;
-- alter table tbl_class add primary key (cno);
-- desc tbl_class;
-- desc tbl_member;
-- alter table tbl_member add foreign key(c_no) references tbl_class(cno);
alter table tbl_member add constraint fk_mem foreign key(cno) references tbl_class(c_no);


-- 교사 정보(tbl_teacher) 테이블에 존재하는 계약일 컬럼을 제거하시오.
alter table tbl_teacher drop column contract;


-- 게시판(tbl_board) 테이블을 복제하여 공지사항(tbl_notice) 테이블을 생성하고, 내용을 모두 삭제하시오.
create table tbl_notice as select * from tbl_board;
delete from tbl_notice;


-- 과정 정보(tbl_class) 테이블에 레코드를 추가하고, 게시판(tbl_board) 테이블을 삭제하시오.
-- (202203, 10004, 수원분원, 200000, 100)
-- (202203, 20003, 청주분원, 150000, 400)
-- (202203, 20004, 전주분원, 150000, 300)
-- (202203, 10005, 고양분원, 200000, 100)
-- (202203, 10006, 대구분원, 100000, 200)
insert into tbl_class values (6, '202203', '10004', '수원분원', 200000, '100', default);
insert into tbl_class values (7, '202203', '20003', '청주분원', 150000, '400', default);
insert into tbl_class values (8, '202203', '20004', '전주분원', 150000, '300', default);
insert into tbl_class values (9, '202203', '10005', '고양분원', 200000, '100', default);
insert into tbl_class values (10, '202203', '10006', '대구분원', 100000, '200', default);

drop table tbl_board;

-- 과정 정보(tbl_class) 테이블의 과정번호, 캠퍼스, 수강료, 교사코드, 강의실의 컬럼만 복제하여 과정 코스(tbl_course) 테이블을 만들고, 
-- 만들어진 테이블에 과정번호를 기본키로 등록하고, 교사코드는 교사 정보(tbl_teacher)의 교사코드를 참조하는 외래키로 등록하시오.

create table tbl_course as (select c_no, class_area, tution, teacher_code, classroom from tbl_class);
alter table tbl_course add primary key (c_no);
alter table tbl_course add constraint fk_course foreign key(teacher_code) references tbl_teacher(teacher_code);


-- 교사 정보(tbl_teacher) 테이블에 (500, 전문반, 최전문, 500000, 20220105) 의 새로운 레코드를 추가하고, 
-- 과정 코스(tbl_course) 테이블에는 새로운 레코드 (20005, 서울본원, 250000, 500, A202) 을 추가하시오.

insert into tbl_teacher values (9, '500', '전문반', '최전문', 500000, '20220105');
insert into tbl_course values ('20005', '서울본원', 250000, '500', 'A202');


-- 과정 정보(tbl_class)를 복제하여 tbl_class_2204 테이블을 생성하고, 과정번호 10002의 레코드를 삭제하고, 
-- 과정번호 10003의 캠퍼스명을 의정부로 변경하시오.

create table tbl_class_2204 as (select * from tbl_class);
delete from tbl_class_2204 where c_no='10002';
update tbl_class_2204 set c_no='10003' where class_area='의정부';



-- 과정 코스(tbl_course) 테이블에서 모든 과정의 수강료를 20000 더 인상되도록 변경하시오. 

update tbl_course set tution=tution+20000;



-- 과정 코스(tbl_course) 테이블에서 수강료가 200000~300000 인 과정을 조회하시오.
-- 과정번호        캠퍼스     교사코드

select c_no, class_area, teacher_code from tbl_course where tution between 200000 and 300000;


-- 과정 코스(tbl_course) 테이블에서 캠퍼스가 분원인 캠퍼스 정보를 조회하시오.
-- 과정번호        수강료     교사코드

select c_no, tution, teacher_code from tbl_course where class_area like '%분원';


-- 수강 신청 정보(tbl_member) 테이블에서 주소가 서울이거나 성남 또는 수원인 수강생을 조회하시오.
-- 과정코드     수강생명        전화번호        수강등급

-- select c_no, c_name, phone, c_type from tbl_member where address like in ('서울%', '성남', '수원%');
select cno, c_name, phone, c_type from tbl_member where address like '서울%' OR address LIKE '성남%' OR address LIKE '수원%';


-- 수강 신청 정보(tbl_member) 테이블에서 각 과정별 인원수를 조회하시오.
--  과정코드    수강생인원수
select distinct cno, count(*) as 수강생인원수 from tbl_member group by cno;


-- 수강 신청 정보(tbl_member) 테이블을 참고하여 수강생이 없는 과정 코스(tbl_course)를 조회하시오.
-- 과정번호     캠퍼스     수강료

select c_no, class_area, tution from tbl_course where c_no not in (select cno from tbl_member) order by c_no;
-- select a.c_no, a.class_area, a.tution from tbl_course a left outer join tbl_member b on a.c_no=b.cno order by a.c_no;

-- 과정 코스(tbl_course) 테이블을 참고하여 배정되지 않은 교사 정보(tbl_teacher)를 조회하시오. 
-- 교사코드     과정명     교사명

select teacher_code, class_name, teacher_name from tbl_teacher where teacher_code not in (select teacher_code from tbl_course);
-- select a.teacher_code, a.class_name, a.teacher_name from tbl_teacher a left outer join tbl_course b on a.teacher_code=b.teacher_code;


-- 수강 신청 정보(tbl_member) 테이블을 참고하여 강의하고 있지 않는 강사 정보(tbl_teacher)를 조회하시오. 
-- 교사코드    교사명      배정금액

select teacher_code, teacher_name, class_price from tbl_teacher where 
teacher_code not in (select teacher_code from tbl_course where c_no in (select cno from tbl_member));


-- select a.teacher_code, a.teacher_name, a.class_price from tbl_teacher a left outer join tbl_course b on a.teacher_code=b.teacher_code inner join tbl_member c on b.c_no=c.cno;
-- select a.teacher_code, a.teacher_name, a.class_price from tbl_teacher a, tbl_course b, tbl_member c where a.teacher_code=b.teacher_code and b.c_no=c.cno;


-- 교사 정보(tbl_teacher) 테이블과 과정 정보(tbl_class) 테이블을 참조하여 교사별 배정 내역(tbl_joint)이름의 뷰(view)를 생성하시오.
-- 교사코드     교사명     과정명     배정된캠퍼스수
create view tbl_joint as select b.teacher_code, a.teacher_name, a.class_name, count(1) 배정된캠퍼스수 from tbl_teacher a inner join tbl_class b on a.teacher_code=b.teacher_code group by b.teacher_code, a.teacher_name, a.class_name; 
select * from tbl_joint;

-- tbl_member와 tbl_course 를 참조하여 수강 내역을 아래와 같이 검색될 수 있도록 하시오.
-- 캠퍼스      수강생명    전화번호    주소      수강등급

select a.class_area, b.c_name, b.phone, b.address, b.c_type from tbl_course a inner join tbl_member b on a.c_no=b.cno; 
select (select class_area from tbl_course where tbl_course.c_no=tbl_member.cno) as class_area, tbl_member.c_name, tbl_member.phone, tbl_member.address from tbl_member;
select class_area, c_name, phone, address, c_type from (select tbl_course.class_area, tbl_member.c_name, tbl_member.phone, tbl_member.address, tbl_member.c_type from tbl_course, tbl_member where tbl_member.cno=tbl_course.c_no);
select class_area, c_name, phone, address, c_type from tbl_course, tbl_member where tbl_member.cno=tbl_course.c_no;



-- tbl_teacher와 tbl_course 를 참조하여 강사 배정 내역을 아래와 같이 검색될 수 있도록 하시오.
-- 과정번호     캠퍼스   과정명   교사명   수강료   배정금액

select a.c_no, a.class_area, b.class_name, b.teacher_name, a.tution, b.class_price from tbl_course a inner join tbl_teacher b on a.teacher_code=b.teacher_code; 
select c_no, class_area, class_name, teacher_name, tution, class_price from tbl_teacher, tbl_course where tbl_teacher.teacher_code=tbl_course.teacher_code;


-- tbl_member를 기준으로 tbl_teacher, tbl_course 를 참조하여 수강현황 내역을 아래와 같이 검색될 수 있도록 하시오.
-- 수강생명     캠퍼스   과정명   교사명   강의실
-- select x.컬럼이름A, y.컬럼이름B, z.컬럼이름C, ... from 테이블이름X x join 테이블이름Y y on x.컬럼이름M=y.컬럼이름N join 테이블이름Z z on y.컬럼이름O=z.컬럼이름Q;

select a.c_name, b.class_area, c.class_name, c.teacher_name, b.classroom from tbl_member a inner join tbl_course b on a.cno=b.c_no inner join tbl_teacher c on b.teacher_code=c.teacher_code; 
select c_name, class_area, class_name, teacher_name, classroom from tbl_member, tbl_course, tbl_teacher where tbl_member.cno=tbl_course.c_no and tbl_teacher.teacher_code=tbl_course.teacher_code;


-- tbl_member, tbl_teacher, tbl_course 를 참조하여 캠퍼스별 수강통계 내역을 아래와 같이 검색될 수 있도록 하시오.
--  캠퍼스     과정명     수강인원수
select b.class_area, c.class_name, count(a.c_name) 수강인원수 from tbl_member a inner join tbl_course b on a.cno=b.c_no inner join tbl_teacher c on b.teacher_code=c.teacher_code group by b.class_area, c.class_name, a.c_name; 
select class_area, class_name, count(c_name) 수강인원수 from tbl_member, tbl_course, tbl_teacher where tbl_member.cno=tbl_course.c_no and tbl_teacher.teacher_code=tbl_course.teacher_code group by tbl_course.class_area, tbl_teacher.class_name, tbl_member.c_name;


-- tbl_member, tbl_teacher, tbl_course 를 참조하여 교사별 통계 내역을 아래와 같이 검색될 수 있도록 하시오.
--  교사명     수강료합계

select c.teacher_name, sum(b.tution) 수강료합계 from tbl_member a inner join tbl_course b on a.cno=b.c_no inner join tbl_teacher c on b.teacher_code=c.teacher_code group by c.teacher_name, b.tution; 
select teacher_name, sum(tution) 수강료합계 from tbl_member, tbl_course, tbl_teacher where tbl_member.cno=tbl_course.c_no and tbl_teacher.teacher_code=tbl_course.teacher_code group by tbl_teacher.teacher_name, tbl_course.tution;


-- 과정 신청 정보(tbl_member) 테이블의 구조만 복제하여 tbl_member_2301 테이블과 tbl_member_2302 테이블을 생성하고, 아래와 지시사항과
-- 같이 작업하시오.
-- tbl_member_2301의 레코드 추가
-- 순번 	과정코드 	수강생명 	전화번호 		    주소 		    수강등록일 	수강등급
-- 1 	10001 	이자영 	01022221111 	서울시 강남구 	20230101 	일반
-- 2 	10002 	이규섭 	01011112222 	서울시 성북구 	20230102 	일반
-- 3 	10003 	이윤호 	01022223333 	성남시 분당구 	20230103 	일반
-- 4 	10004 	조태철 	01033334444 	부산시 서구 	    20230104 	일반
-- 5 	20001 	황기준 	01044445555 	광주시 남구 	    20230105 	VIP
-- 6 	20002 	전소영 	01055556666 	대전시 유성구 	20230106 	VIP
-- 7 	10001 	정혜진 	01044445555 	대구시 달성군 	20230107 	일반
-- 8    10002   허무해   01088889999     천안시 서북구 	20230108 	일반
-- 9    10003   김태종   01077771111     수원시 장안구 	20230109 	일반

-- tbl_member_2302의 레코드 추가
-- 순번 	과정코드 	수강생명 	전화번호 		    주소 		    수강등록일 	수강등급
-- 1 	10001 	이자영 	01022221111 	서울시 강남구 	20230201 	일반
-- 2 	10002 	이규섭 	01011112222 	서울시 성북구 	20230202 	일반
-- 3 	10003 	이윤호 	01022223333 	성남시 분당구 	20230203 	일반
-- 4 	10004 	조태철 	01033334444 	부산시 서구 	    20230204 	일반
-- 5 	20001 	백석준 	01044445555 	광주시 북구 	    20230205 	VIP
-- 6 	20002 	전소영 	01055556666 	대전시 유성구 	20230206 	VIP
-- 7 	10001 	장사진 	01055559999 	대구시 달성군 	20230207 	일반
-- 8    10002   김사부   01088889999     고양시 일산동구 	20230208 	일반
-- 9    10003   김태종   01077771111     수원시 장안구 	20230209 	일반

create table tbl_member_2301 as select * from tbl_member where 1=2;
create table tbl_member_2302 as select * from tbl_member where 1=2;

insert into tbl_member_2301 values (1,'10001','이자영','01022221111','서울시 강남구','20230101','일반');
insert into tbl_member_2301 values (2,'10002','이규섭','01011112222','서울시 성북구','20230102','일반');
insert into tbl_member_2301 values (3,'10003','이윤호','01022223333','성남시 분당구','20230103','일반');
insert into tbl_member_2301 values (4,'10004','조태철','01033334444','부산시 서구','20230104','일반');
insert into tbl_member_2301 values (5,'20001','황기준','01044445555','광주시 남구','20230105','VIP');
insert into tbl_member_2301 values (6,'20002','전소영','01055556666','대전시 유성구','20230106','VIP');
insert into tbl_member_2301 values (7,'10001','정혜진','01044445555','대구시 달성군','20230107','일반');
insert into tbl_member_2301 values (8,'10002','허무해','01088889999',' 천안시 서북구','20230108','일반');
insert into tbl_member_2301 values (9,'10003','김태종','01077771111','수원시 장안구','20230109','일반');
-- 
insert into tbl_member_2302 values (1,'10001','이자영','01022221111','서울시 강남구','20230201','일반');
insert into tbl_member_2302 values (2,'10002','이규섭','01011112222','서울시 성북구','20230102','일반');
insert into tbl_member_2302 values (3,'10003','이윤호','01022223333','성남시 분당구','20230103','일반');
insert into tbl_member_2302 values (4,'10004','조태철','01033334444','부산시 서구','20230104','일반');
insert into tbl_member_2302 values (5,'20001','백석준','01044445555','광주시 북구','20230205','VIP');
insert into tbl_member_2302 values (6,'20002','전소영','01055556666','대전시 유성구','20230106','VIP');
insert into tbl_member_2302 values (7,'10001','장사진','01055559999','대구시 달성군','20230207','일반');
insert into tbl_member_2302 values (8,'10002','김사부','01088889999','고양시 일산동구','20230208','일반');
insert into tbl_member_2302 values (9,'10003','김태종','01077771111','수원시 장안구','20230109','일반');
-- 

-- tbl_member_2301과 tbl_member_2302의 합집합을 구하여 member_total 이름으로 뷰(view)를 생성하시오.
create view member_total as (select * from tbl_member_2301 UNION select * from tbl_member_2302);

-- tbl_member_2301과 tbl_member_2302의 교집합을 구하여 member_legacy 이름으로 뷰(view)를 생성하시오.
create view member_legacy as (select * from tbl_member_2301 INTERSECT select * from tbl_member_2302);


-- tbl_member_2301과 tbl_member_2302의 차집합을 구하여 member_secession 이름으로 뷰(view)를 생성하시오.
create view member_secession as (select * from tbl_member_2301 MINUS select * from tbl_member_2302);


-- tbl_member_2302과 tbl_member_2301의 차집합을 구하여 member_new 이름으로 뷰(view)를 생성하시오.
create view member_new as (select * from tbl_member_2302 MINUS select * from tbl_member_2301);







