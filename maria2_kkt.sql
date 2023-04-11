-- 캐릭터셋 보기
SHOW variables like 'char%';

-- UTF-8로 캐릭터셋 변경
-- C:\Program Files\MariaDB 10.10\data로 이동하여 my.ini 파일을 열고, 아래와 같이 수정 후 서비스 재기동
[mysqld]
datadir=C:/Program Files/MariaDB 10.10/data
port=3308
innodb_buffer_pool_size=2039M
init_connect="SET collation = utf8_general_ci"
init_connect="SET NAMES utf8"
character-set-server=utf8

[client]
port=3308
plugin-dir=C:/Program Files/MariaDB 10.10/lib/plugin
default-character-set = utf8

[mysqldump]
default-character-set = utf8

[mysql]
default-character-set = utf8


-- 현재 사용자 보기
SELECT user, host, password FROM mysql.user;
SELECT * FROM mysql.user;

-- 사용자 추가
CREATE USER 'test1'@'localhost' IDENTIFIED BY '1234';

-- 기 생성된 사용자의 비밀번호 수정
SET PASSWORD FOR 'test1'@localhost = PASSWORD('a1234');

-- DB 권한 부여
GRANT ALL PRIVILEGES ON *.* to 'test1'@'localhost';

-- 특정 DB에만 권한 부여
-- GRANT ALL PRIVILEGES ON company.* to 'test1'@'localhost'; 

-- 특정 DB에 select 권한만 주기
-- GRANT SELECT ON company.* TO 'test1'@'localhost' IDENTIFIED BY 'a1234'; 

-- 권한에 대한 내용을 적용하려면 반드시 권한 테이블의 적용을 해야함
FLUSH PRIVILEGES;

-- 특정 사용자의 권한 부여된 정보 보기
SHOW GRANTS FOR 'test1'@'localhost';

-- 사용자 권한 회수
REVOKE ALL PRIVILEGES ON *.* FROM 'test1'@'localhost';

-- 사용자 삭제
DROP USER 'test1'@'localhost';

-- MariaDB의 컬럼 타입
-- 문자
-- 255 문자까지만 저장 가능한 타입 : char(size), varchar(size), tinytext(size), binary(size)
-- text(size) - 65535, mediumtext(size) - 16777215, longtext(size) - 4294967295

-- 날짜
-- date : 1000-01-01~9999-12-31 (yyyy-mm-dd)
-- datetime : 1000-01-01 00:00:00 ~ 9999-12-31 23:59:59 (yyyy-mm-dd hh:mm:ss)
-- timestamp(m) : 1970-01-01 00:00:01 ~ 2038-01-19 03:14:07 utc 기준 (yyyy-mm-dd hh:mm:ss)
-- time : -838:59:59 ~ 838:59:59 (hh:mm:ss)
-- year[(2 | 4)] : 연도 값은 2자리 숫자 또는 4자리 숫자 (기본값은 4자리)

-- 숫자
-- bit : 0 또는 1
-- tinyint(m) : -128~127
-- smallint(m) : -32768~32767
-- mediumint(m) : -8388608~8388607
-- int(m) : -2147493648~2147493647
-- integer(m) : -2147493648~2147493647
-- bigint(m) : -9223372036854775808~9223372036854775807
-- decimal(m, d) : 고정 소수점 - 10진 정수
-- numeric(m, d) : 고정 소수점 - 10진 정수
-- fixed(m, d) : 고정 소수점 - 10진 정수
-- float(m, d) : 단정도 부동 소숫점 - 실수
-- double(m, d) : 배정도 부동 소수점 - 실수
-- double precision(m, d) : 배정도 부동 소수점 - 실수
-- real(m, d) : 배정도 부동 소수점 - 실수
-- bool : 0 또는 1
-- boolean : 0 또는 1

-- 객체 타입
-- tinyblob : 최대 255 바이트
-- blob(size) : 최대 64KB(65536 바이트)
-- mediumblob : 최대 16MB(16777215 바이트)
-- longtext : 최대 4GB(4294967295 바이트) 

-- 테이블 생성
-- create [or replace] table [if not exists] 테이블명(컬럼명1 컬럼타입 제약조건,...);
use company;
CREATE TABLE students (
    student_id INT(11) NOT NULL AUTO_INCREMENT,
    student_name VARCHAR(100) NOT NULL,
    student_address VARCHAR(40) NOT NULL,
    admission_date DATE NULL DEFAULT NULL,
    PRIMARY KEY (student_id)
);
CREATE TABLE students (
    student_id INT(11) PRIMARY KEY AUTO_INCREMENT,
    student_name VARCHAR(100) NOT NULL,
    student_address VARCHAR(40) NOT NULL,
    admission_date DATE NULL DEFAULT NULL
);

desc students;

-- 컬럼 추가
ALTER TABLE students ADD COLUMN pw VARCHAR(100);

-- 컬럼명과 타입을 동시에 변경
ALTER TABLE students CHANGE pw student_pw VARCHAR(100); 

-- 컬럼 타입 변경
ALTER TABLE students MODIFY student_pw VARCHAR(200) NOT NULL; 

-- 컬럼 삭제
ALTER TABLE students DROP student_pw;

CREATE TABLE account_ledger (id INT PRIMARY KEY AUTO_INCREMENT,
    transaction_name VARCHAR(100), credit_account VARCHAR(100),
    credit_amount INT, debit_account VARCHAR(100), debit_amount INT);

-- 이미 해당 테이블이 있을 경우 만들지 않고, 없는 경우 생성
CREATE TABLE IF NOT EXISTS account_ledger (id INT PRIMARY KEY AUTO_INCREMENT,
    transaction_name VARCHAR(100), credit_account VARCHAR(100),
    credit_amount INT, debit_account VARCHAR(100), debit_amount INT);

-- 기본키 또는 제약조건 추가
ALTER TABLE account_ledger
 ADD CONSTRAINT is_balanced CHECK(debit_amount >= 0);

-- 키본키 또는 제약조건 삭제
ALTER TABLE account_ledger DROP CONSTRAINT is_balanced;

-- 인덱스 생성
-- create index 인덱스명 on 테이블명(컬럼명);

-- 인덱스 제거
-- drop index 인덱스명;

-- 뷰 생성
-- create view 뷰명 as (select~);

-- 뷰 삭제
-- drop view 뷰명;

-- 테이블 삭제
-- drop table 테이블명 [cascade | restrict]

-- 뷰 조회
-- select * from 뷰명;

-- 데이터베이스 목록 보기
-- show databases;

-- 데이터베이스 선택
-- use 데이터베이스명;

-- 해당 데이터베이스의 테이블 목록 보기
-- show tables;

-- 테이블 구조 보기
-- desc 테이블명;
desc course_tbl;
desc lecturer_tbl;

-- 데이터(레코드) 검색
-- select [distinct] 컬럼명,.... 
-- from 테이블명 [where 조건식] [group by 그룹화컬럼명 [having 조건절]] 
-- [order by 정렬컬럼명 asc | desc]; 

select * from course_tbl;

-- 과정 코스에서 시작시간이 9시인 코스 레코드(튜플)를 검색하되 아이디(id) 항목을 기준으로 내림차순 정렬
select * from course_tbl where start_hour=900 order by id desc;

-- 시작 시간대별로 그룹화하여 표시
select start_hour, count(start_hour) as cnt from course_tbl group by start_hour;
-- 그룹화항목시 사용가능한 함수 : count, sum, avg, min, max

-- 11시 후~13시 전에 수업 중인 과정 코스를 검색
select * from course_tbl where start_hour<1300 and end_end>1100;
-- 기간이 화요일 이전이면서 하루 소요시간이 2시간 이내인 아이디, 과정명, 교수코드 를 검색
select id, name, lecturer from course_tbl
 where week<=2 and (end_end - start_hour) <= 200;
-- 교수코드가 이교수, 박교수, 우교수인 과정의 아이디, 과정명, 주, 시작시간을 검색
select id, name, week, start_hour from course_tbl
 where lecturer in ('2', '3', '4'); 
-- 시작시간이 12시 부터 14시 까지인 아이디, 과정명, 시작시간, 종료시간을 검색
select id, name, start_hour, end_end from course_tbl
 where start_hour between 1200 and 1400;
-- 아이디가 1로 끝나는 아이디, 과정명, 시작시간, 종료시간, 교수코드, 학점을 검색
select id, name, start_hour, end_end, lecturer, credit from course_tbl
 where id like '%1';

select * from lecturer_tbl;

-- 전공(major)별 교수의 인원수를 구하여 뷰(major_view)를 생성하고, 검색하시오.
create view major_view as (select major, count(major) as cnt
 from lecturer_tbl group by major);
select * from major_view;

-- 연구분야(field)가 알고리즘이거나 운영체제인 교수의 번호, 강사명, 전공을 검색하되,
-- 번호별로 내림차순 정렬하여 뷰(order_view)를 생성하고, 검색하시오.
create view order_view as (select idx, name, major from lecturer_tbl
 where field='알고리즘' or field like '%운영체제%' order by idx desc);
select * from order_view;

-- 과목명, 강사명, 전공, 학점, 시작, 종료 를 검색하되, course_tbl의 lecturer(강사)와
-- lecturer_tbl의 idx(번호)를 참조하여 검색하시오.
select course_tbl.name, lecturer_tbl.name, lecturer_tbl.major, course_tbl.credit, 
 course_tbl.start_hour, course_tbl.end_end
 from course_tbl, lecturer_tbl where course_tbl.lecturer=lecturer_tbl.idx;

select course_tbl.name, lecturer_tbl.name, lecturer_tbl.major, course_tbl.credit, 
 course_tbl.start_hour, course_tbl.end_end
 from course_tbl inner join lecturer_tbl on course_tbl.lecturer=lecturer_tbl.idx;
 
 

-- 각 과정에 배정된 강사의 강사명과 전공을 검색하되, course_tbl의 lecturer(강사)와
-- lecturer_tbl의 idx(번호)를 참조하여 구하는 뷰(lecturer_view1)을 생성하고, 검색하시오.
create view lecturer_view1 as 
(select distinct name, major from lecturer_tbl where idx in(select lecturer 
 from course_tbl));
select * from lecturer_view1;

-- 각 과정에 배정되지 않은 강사의 강사명과 전공을 검색하되, course_tbl의 lecturer(강사)와
-- lecturer_tbl의 idx(번호)를 참조하여 구하는 뷰(lecturer_view2)을 생성하고, 검색하시오.
create view lecturer_view2 as 
(select distinct name, major from lecturer_tbl where idx not in(select lecturer 
 from course_tbl));
select * from lecturer_view2;

-- 각 과정에 가장 많이 배정된 강사의 강사명과 전공을 검색하되, course_tbl의 lecturer(강사)와
-- lecturer_tbl의 idx(번호)를 참조하여 구하는 뷰(lecturer_view3)을 생성하고, 검색하시오.
 select name, major from lecturer_tbl where idx in 
  (select count(lecturer) as cnt from course_tbl);
  
	-- 과목 테이블에서 강사별 배정된 과목수 => 3
	select lecturer, count(lecturer) as cnt from course_tbl group by lecturer;

	-- 과목 테이블에서 강사별 배정된 과목이 가장 많은 강사의 코드의 뷰 만들기
	create view max_lec as (select lecturer, count(lecturer) as cnt 
	 from course_tbl group by lecturer having cnt=3);

	-- 배정 과목이 가장 많은 강사의 뷰에서 해당 강사명과 전공을 불러오기
	select name, major from lecturer_tbl where idx in (select lecturer from max_lec);

create view lecturer_view3 as select name, major from lecturer_tbl where idx in (select lecturer from max_lec);
select * from lecturer_view3;


-- 월요일에 배정된 강사의 name(과목명), credit(학점), name(강사명), major(전공), 
-- field(세부전공) 등을 구하는 뷰(monday_course_view)를 생성하고, 검색하시오.

-- 방법1. 이중 쿼리
select course_tbl.name, course_tbl.credit, lecturer_tbl.name,
 lecturer_tbl.major, lecturer_tbl.field 
 from course_tbl, lecturer_tbl 
 where course_tbl.lecturer=lecturer_tbl.idx and course_tbl.week=1;

-- 방법2. 내부 조인
select course_tbl.name, course_tbl.credit, lecturer_tbl.name,
 lecturer_tbl.major, lecturer_tbl.field
 from course_tbl inner join lecturer_tbl
 on course_tbl.lecturer=lecturer_tbl.idx where course_tbl.week=1;
 
create view monday_course_view as (select course_tbl.name, course_tbl.credit, lecturer_tbl.name, lecturer_tbl.major, lecturer_tbl.field from course_tbl inner join lecturer_tbl on course_tbl.lecturer=lecturer_tbl.idx where course_tbl.week=1);
select * from monday_course_view;

-- 학점이 3학점인 과목의 과목ID, 과목명, 강사명, 요일, 세부전공 등을 검색하여 구하는
-- 뷰(credit3_view)를 생성하고, 검색하시오.

-- 방법1. 이중 쿼리
select course_tbl.id, course_tbl.name, lecturer_tbl.name, course_tbl.week, 
lecturer_tbl.field from lecturer_tbl, course_tbl
 where lecturer_tbl.idx=course_tbl.lecturer and course_tbl.credit = 3;

-- 방법2. 내부 조인
select course_tbl.id, course_tbl.name, lecturer_tbl.name, course_tbl.week, 
lecturer_tbl.field from lecturer_tbl inner join course_tbl
 on lecturer_tbl.idx=course_tbl.lecturer where course_tbl.credit = 3;


-- 일주일에 4시간 이상 강의하는 강사의 강사명, 전공, 세부전공 등을 검색하여 구하는
-- 뷰(lecturer_view4) 를 생성하고, 검색하시오.

-- 방법1. 이중쿼리 
select lecturer_tbl.name, lecturer_tbl.major, lecturer_tbl.field
 from lecturer_tbl, course_tbl
 where lecturer_tbl.idx=course_tbl.lecturer and (course_tbl.end_end - course_tbl.start_hour) >= 300;

-- 방법2. 내부조인
select lecturer_tbl.name, lecturer_tbl.major, lecturer_tbl.field
 from lecturer_tbl inner join course_tbl
 on lecturer_tbl.idx=course_tbl.lecturer where (course_tbl.end_end - course_tbl.start_hour) >= 300;

create view lecturer_view4 as select lecturer_tbl.name, lecturer_tbl.major, lecturer_tbl.field from lecturer_tbl inner join course_tbl on lecturer_tbl.idx=course_tbl.lecturer where (course_tbl.end_end - course_tbl.start_hour) >= 300;
select * from lecturer_view4;

-- 각 요일(week)별로 진행하는 요일, 과목수, 총학점, 해당강사수 등을 검색하여 구하는
-- 뷰(course_view2) 를 생성하고, 검색하시오.

select week, count(course_tbl.name) as 과목수, sum(course_tbl.credit) 총학점, 
count(course_tbl.lecturer) 해당강사수 from course_tbl group by course_tbl.week;

create view course_view2 as select week, count(course_tbl.name) as 과목수, sum(course_tbl.credit) 총학점, 
count(course_tbl.lecturer) 해당강사수 from course_tbl group by course_tbl.week;

select * from course_view2;



-- 데이터(레코드) 삽입
-- insert into 테이블명(컬럼명1,..) values (값1,...);

-- 데이터(레코드) 수정
-- update 테이블명 set 변경할컬럼명=변경할값 [where 조건식];

-- 데이터(레코드) 삭제
-- delete from 테이블명 [where 조건식];

