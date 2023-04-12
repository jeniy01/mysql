-- 터미널 백슬래시 명령

-- 데이터베이스 선택
\c sample

-- Shell 빠져 나오기
\q

-- 데이터베이스 목록 확인하기
\l

-- 현재 DB 연결 정보 조회
\conninfo

-- 편집기 열기
\e

-- 저장된 파일 편집기로 열기
\e postgre.sql

-- 편집기 열기 - Function 생성
\ef

-- 편집기 열기 - View 생성
\ev

-- 현재 버퍼에 저장된 콘텐츠 보기
\p

-- 가장 마지막에 실행된 쿼리 실행
\g

-- 버퍼 사용 히스토리 조회 ( ~/.psql_history 파일에 저장된 내용을 보여줌 )
\s

-- 히스토리를 파일로 저장
\s {FILE}

-- 쿼리 버퍼 지우기
\r

-- 쿼리 버퍼를 파일로 생성
\w {FILENAME}

-- 환경 변수 설정
\setenv {Name} {Value}

-- shell에서 리눅스 명령어 실행
\! {COMMAND}
\! ls -al
\! pwd

-- 파일 안의 명령어 실행 \e 를 이용하여 저장했던 파일을 이용
\i FILE

-- 쿼리 결과 테이블의 컬럼을 한 행으로 보여줌
\x

-- 쿼리 결과 테이블이 긴 경우(long output) pager로 결과가 보여지는 설정 명령어 (on/off)
\pset pager

-- 쿼리 결과 테이블 rows 출력 (on/off) 
\pset footer

-- 테이블 내용을 SQL로 저장
\COPY ${table_name} TO ${filename} [option]

-- sql을 해당 테이블에 저장
\COPY ${table_name} FROM ${filename} [option]


-- 사용자 목록 보기
SELECT * FROM PG_SHADOW;
\du -- 터미널에서

-- 사용자 추가(최고관리자 등급으로)
CREATE USER test1 PASSWORD '1234' SUPERUSER;

-- 사용자 추가시 옵션 : SUPERUSER, CREATEDB, CREATEUSER, INHERIT, LOGIN,  
-- 사용자 변경 :  ALTER USER [user_name] [ [WITH] option [ . . . ] ] ;
-- 사용자 아이디(이름) 변경 :  ALTER USER [user_name] RENAME TO [new_user_name];
-- 사용자 비밀번호 변경 : ALTER USER [user_name] WITH PASSWORD 'new_password';
-- 사용자 권한(ROLE) 변경 : ALTER USER [user_name] WITH CREATEUSER REPLICATION;

-- 사용자 권한 부여
ALTER USER test1 SUPERUSER;

-- 특정 데이터베이스에 모든 권한 부여하기
GRANT ALL PRIVILEGES ON DATABASE sample TO test1;

-- 사용자 권한 롤(ROLE) : SUPERUSER, CREATE ROLE, CREATE DB, REPLICATION

-- 특정 데이터베이스에 사용자 권한 회수
REVOKE ALL PRIVILEGES ON DATABASE sample FROM test1;

-- 사용자 제거
DROP USER test1;

-- 테이블스페이스(물리저장소 위치지정) 명령
-- 테이블스페이스 저장공간 조회: \db
-- 테이블스페이스 생성 : CREATE TABLESPACE [tablespace_name];
-- 테이블스페이스 이름 변경 : ALTER TABLESPACE [ts_name] RENAME TO [new_tb_name];
-- 테이블스페이스 소유자 변경 : ALTER TABLESPACE [ts_name] OWNER TO [user_name]; 
-- 테이블스페이스 삭제 : DROP TABLESPACE [ts_name];

-- 스키마 관련 명령
-- 스키마 조회 : \dn
-- 스키마 생성 : CREATE SCHEMA [schema_name] AUTHORIZATION [user_name] [ schema_element [ . . . ] ];
-- 스키마 이름 변경 : ALTER SCHEMA [schema_name] RENAME TO [new_name];
-- 스키마 소유자 변경 :  ALTER SCHEMA [schema_name] OWNER TO [new_owner];
-- 스키마 삭제 : DROP SCHEMA [schema_name];

-- 데이터베이스 관련 명령
-- 데이터베이스 생성 : CREATE DATABASE db_name [OWNER user_name];
-- 데이터베이스 목록 보기 : \l
-- 데이터베이스 수정 명령 : ALTER DATABASE [db_name] [ [WITH] option [ . . . ] ];
-- 데이터베이스 이름 변경 : ALTER DATABASE [db_name] RENAME TO [new_db_name];
-- 데이터베이스 삭제 : DROP DATABASE [db_name];

-- 릴레이션 정보 확인 명령
-- database 내 table 조회 : \dt
-- relation 상세 조회 : \d+
-- System table 조회 : \dS
-- view 조회 : \dv :  
-- Large object 조회 : \dl
-- index 조회 : \di
-- function(함수) 조회 : \df
-- schema 조회 : \dn
-- 다른 데이터베이스 접속 : \c [db_name] 
-- psql 종료 : \q

-- 테이블 생성 : CREATE TABLE 테이블명(컬럼명1 타입 [제약조건],....);
-- 테이블 생성시 컬럼 타입 : Bigint, bit, Boolean, Date, Integer, Json, Money, Real, Smallint, Serial, Text, time, Xml 등 가능
-- 테이블 생성시 제시되는 제약 조건 : NOT NULL, UNIQUE, Primary key, Foreign key
-- 테이블 생성시 유니큐(중복 허용안함) 설정 : CREATE TABLE 테이블명(,.. 컬럼명 타입 UNIQUE,..);
-- 테이블 생성시 기본키 설정 : CREATE TABLE 테이블명(,.. 컬럼명 타입 PRIMARY KEY,..);
-- 테이블 생성시 외래키 설정 : CREATE TABLE 테이블명(,.. FOREIGN KEY (컬럼명) REFERENCES 참조테이블명 (참조기본키컬럼명),..);
-- 테이블 생성시 입력 유효성 제약 조건 설정 : CREATE TABLE 테이블명(,.. 컬럼명 타입 CHECK (조건식),..);
-- 테이블 컬럼 추가 : ALTER TABLE 테이블명 ADD COLUMN 컬럼명 타입(크기);
-- 테이블 컬럼명 변경 : ALTER TABLE 테이블명 RENAME COLUMN 변경전컬럼명 TO 변경후컬럼명;
-- 테이블 컬럼 타입 변경 : ALTER TABLE 테이블명 ALTER COLUMN 컬럼명 TYPE 변경할타입(크기);
-- 테이블 컬럼 삭제 : ALTER TABLE 테이블명 DROP COLUMN 전컬럼명;
-- 테이블 기본키 추가 : ALTER TABLE 테이블명 ADD CONSTRAINT 제약조건명 PRIMARY KEY 컬럼명;
-- 테이블 외래키 추가 : ALTER TABLE 테이블명 ADD CONSTRAINT 외래키명 FOREIGN KEY (컬럼명) REFERENCES 참조테이블명 (참조기본키컬럼명);
-- 테이블 입력 유효성 제약조건 추가 : ALTER TABLE 테이블명 ADD COLUMN 컬럼명 타입 CHECK(조건식);
-- 테이블 제약 조건 제거 : ALTER TABLE 테이블명 DROP CONSTRAINT 제약조건명;
-- 테이블 삭제 : DROP TABLE [IF EXISTS] 테이블명 [ CASCADE | RESTRICT ]

-- 뷰(View) : 실제로 존재하는 물리적인 테이블이 아닌 가상 테이블로서 검색식(SELECT문)만을 저장한다.
-- 뷰의 생성 : CREATE VIEW 뷰명 AS (SELECT문);
-- 뷰의 제거 : DROP VIEW 뷰명;
-- 뷰의 조회 : SELECT * FROM 뷰명;

-- 인덱스(Index) : 데이터 검색이 빠르고 쉽도록 특정 컬럼에 지정하는 것
-- 인덱스 생성 : CREATE INDEX 인덱스명 ON 테이블명(컬럼1,컬럼2...);
-- 인덱스 제거 : DROP INDEX 인덱스명;
-- 유니큐 인덱스 생성 : CREATE UNIQUE INDEX 인덱스명 ON 테이블명(컬럼1,컬럼2...);


-- 날짜 데이터로 캐스팅하기 
-- ex1) select '20190320'::date, '2019-01-02'::date
-- ex2) select date '2019-03-18'
-- ex3) select to_date('01022019','MMDDYYYY'), to_date('2018-12-25', 'YYYY-MM-DD')
-- ex4) select to_timestamp('2019-01-01 20:12:12', 'YYYY-MM-DD HH:MI:SS')
-- ex5) select to_char(now(), 'YYYY-MM-DD HH24:MI:SS');
-- ex6) select to_char(now(), 'MONTH:Month:month:MON:Mon:mon:WW:W:D')
-- ex7) select to_date( '20200401', 'YYYYMMDD' );

-- 현재시간 날짜 구하기 : select now(), current_date, current_time
-- day of year 구하기 : select extract(day from now());


-- 날짜와 시간의 연산하기
-- select '2019-01-01'::date + interval '2 sec', '2019-01-01'::date - interval '2 sec'
-- select '2019-01-01'::date + interval '2 min', '2019-01-01'::date - interval '2 min'
-- select '2019-01-01'::date + interval '2 hour', '2019-01-01'::date - interval '2 hour'
-- select '2019-01-01'::date + interval '2 day', '2019-01-01'::date - interval '2 day'
-- select '2019-01-01'::date + interval '2 week', '2019-01-01'::date - interval '2 week'
-- select '2019-01-01'::date + interval '2 month', '2019-01-01'::date - interval '2 month'
-- select '2019-01-01'::date + interval '2 year', '2019-01-01'::date - interval '2 year'
-- select ('2019-01-01'::date + interval '2 day') + interval '2 hour'
-- select now() + (600 * interval '1 sec'), now() + interval '600 sec'
-- select now(), now() + interval '15h 2m 12s'

-- 날짜 데이터 형식으로 변경하기
-- UPDATE [table_name] SET [column_name] = to_date( concat(year, '-', month, '-01'), 'YYYY-MM-DD');


-- DML(=CRUD)
-- SELECT 문법
-- SELECT [ ALL | DISTINCT [ ON ( expression [, ...] ) ] ]
--     [ * | expression [ [ AS ] output_name ] [, ...] ]
--     [ FROM from_item [, ...] ]
--     [ WHERE condition ]
--     [ GROUP BY expression [, ...] ]
--     [ HAVING condition [, ...] ]
--     [ WINDOW window_name AS ( window_definition ) [, ...] ]
--     [ { UNION | INTERSECT | EXCEPT } [ ALL | DISTINCT ] select ]
--     [ ORDER BY expression [ ASC | DESC | USING operator ] [ NULLS { FIRST | LAST } ] [, ...] 
--     [ LIMIT { count | ALL } ]
--     [ OFFSET start [ ROW | ROWS ] ]

-- SELECT ALL : 중복되는 열까지 결과값으로 출력해 주는 역할
-- SELECT DISTINCT ON : 중복되는 열들을 결과값에서 제거하는 역할
-- AS : alias의 약자로 선택한 column의 이름을 AS를 사용하면 새로운 이름으로 지정하여 출력할 수 있습니다.
-- FROM	: 한 개 또는 그 이상의 테이블을 지정할 수 있습니다.
-- WHERE : FROM절의 테이블 내에서 조건을 만족하는 행을 검사합니다.
-- GROUP BY	: 동일한 값을 가진 데이터를 그룹화하려고 할 경우 사용합니다.
-- HAVING : 그룹을 가지고 조건을 비교할 때 사용합니다. GROUP BY와 함께 쓰입니다.
-- UNION : 열의 개수가 동일하고 타입이 동일한 2개의 집합들의 결과값을 결합하여 반환합니다.
-- INTERSECT : 교집합과 같은 원리로 두 집합모두에 있는 열들을 반환합니다.
-- EXCEPT : 차집합과 같은 원리로 두 집합모두에 있는 열들을 반환합니다.
-- ORDER BY : 특정 컬럼을 중심으로 정렬하는데 ASC와 DESC를 사용하여 오름차순과 내림차순을 설정할 수 있습니다.
-- LIMIT : 쿼리결과의 개수를 제한할 수 있습니다.
-- OFFSET : 시작 행을 반환하기 전에 많은 행을 건너뛰는 역할을 합니다

-- SELECT * FROM table1;
-- SELECT col1, col2 FROM table1;
-- SELECT DISTINCT col1, col2 FROM table1;
-- SELECT * FROM table1 where col2=value;
-- SELECT * FROM table1 where col2>=value;
-- SELECT * FROM table1 where col2>=value1 and col2<=value2;
-- SELECT * FROM table1 where col2 between value1 and value2;
-- SELECT * FROM table1 where col2='string value';
-- SELECT * FROM table1 where col2='string1' or col2='string2';
-- SELECT * FROM table1 where col2 in (string, string,...);
-- SELECT * FROM table1 where col2 like 'string%';
-- SELECT * FROM table1 where col2 like '%string';
-- SELECT * FROM table1 where col2 like '%string%';
-- SELECT * FROM table1 order by col1;
-- SELECT * FROM table1 order by col1 asc;
-- SELECT * FROM table1 order by col1 desc;

-- 이중 쿼리(서브 쿼리) : 여러 테이블을 참조하거나 두 개 이상의 SELECT 문을 활용하는 쿼리
-- 일치 이중 쿼리 : SELECT * FROM table1 WHERE col1 in (SELECT col1 FROM table2);
-- 불일치 이중 쿼리 : SELECT * FROM table1 WHERE col1 not in (SELECT col1 FROM table2);
-- 연관 이중 쿼리 : SELECT tabl1.col1, table2.col2 FROM table1, table2 where tabl1.col3=table2.col3;


-- JOIN(결합) 쿼리
-- [INNER] JOIN : 테이블의 R1열의 값과 T2테이블에 R1열의 값이 같은 ROW를 반환하는 것
-- LEFT [OUTER] JOIN : JOIN문 왼쪽에 있는 T1테이블의 모든 결과를 가져온 후에 오른쪽 T2테이블의 데이터를 매칭하여 매칭되는 데이터가 없는 경우 NULL값을 넣는 것
-- RIGHT [OUTER] JOIN : JOIN문 오른쪽에 있는 T2테이블의 모든 결과를 가져온 후에 왼쪽 T1테이블의 데이터를 매칭하여 매칭되는 데이터가 없는 경우 NULL값을 넣는 것
-- FULL [OUTER] JOIN : 양쪽 T1, T2테이블의 모든 결과를 가져와서 매칭시키고 데이터가 없는 경우 NULL값을 넣는 것
-- CROSS JOIN : 양쪽 T1, T2테이블의 모든 결과를 가져와서 매칭시키고 데이터가 없는 경우 NULL값을 넣는 것
-- SELF JOIN : 하나의 테이블에서 특정 컬럼을 기준으로 매칭되는 컬럼을 출력하는 조인
-- NATURAL JOIN : 양쪽 T1, T2테이블의 같은 이름을 가진 컬럼 간의 내부 조인 집합 결과를 출력하는 조인

-- 내부조인 : SELECT a.col1, b.col2 FROM table1 a INNER JOIN table2 b on a.col3=b.col3;
-- 왼쪽 외부 조인 : SELECT a.col1, b.col2 FROM table1 a LEFT JOIN table2 b on a.col3=b.col3;
-- 오른쪽 외부 조인 : SELECT a.col1, b.col2 FROM table1 a RIGHT JOIN table2 b on a.col3=b.col3;
-- 완전 조인 : SELECT * FROM table1 a FULL OUTER JOIN table2 b on a.col3=b.col3;
-- 교차 조인 : SELECT * FROM table1 CROSS JOIN table2;
-- 셀프 조인 : SELECT a.col1, b.col2 FROM table1 a INNER JOIN table1 b on a.col3=b.col4;
-- 자연 조인 : SELECT * FROM table1 a NATURAL JOIN table1 b;

-- 집합 연산 : 컬럼과 데이터의 값이 차이로 인한 연산
-- 합집합(중복 안됨) : SELECT col1, col2 from table1 UNION SELECT col1, col2 from table2; 
-- 합집합(중복 허용) : SELECT col1, col2 from table1 UNION ALL SELECT col1, col2 from table2; 
-- 교집합 : SELECT col1, col2 from table1 INTERSECT SELECT col1, col2 from table2; 
-- 차집합(A-B) : SELECT col1, col2 from table1 EXCEPT SELECT col1, col2 from table2; 
-- 차집합(B-A) : SELECT col1, col2 from table2 EXCEPT SELECT col1, col2 from table1;

-- 테이블에 레코드(튜플) 추가 : INSERT INTO 테이블명(컬럼명1,...) values (값,...);
-- 테이블에 레코드(튜플) 갱신 : UPDATE 테이블명 SET 컬럼명1=값1[, 컬럼명2='값2'] [WHERE 조건식]
-- 테이블에 레코드(튜플) 삭제 : DELETE FROM 테이블명 [WHERE 조건식]

-- 실습 1일차

-- 데이터베이스 생성
create database sample;

-- 사원 (TBL_EMP_202108) 테이블
-- 컬럼ID 컬럼명 형태 길이 NULL 비고
-- EMPNO 사원번호 char 4 NOT NULL Primary key
-- EMPNAME 사원이름 varchar2 20
-- TEL1 전화번호1 char 3
-- TEL2 전화번호2 char 4
-- TEL3 전화번호3 number 4
-- DEPTCODE 부서번호 char 2
-- POSITION 위치(층) char 1

-- 테이블 생성
create table tbl_emp_202108(
	empno char(4) primary key, empname varchar(20),
	tel1 char(3), tel2 char(4),	tel3 int,
	deptcode char(2), position char(1)
);



-- 테이블 제거
-- drop table tbl_emp_202108;

-- [사원 테이블 샘플 데이터]
-- 사원번호 사원이름 전화번호1 전화번호2 전화번호3 부서번호 층
-- 1001 김사원 010 1234 1111 10 1
-- 1002 이사원 010 1234 2222 20 2
-- 1003 박사원 010 1234 3333 30 3
-- 1004 홍사원 010 1234 4444 10 4
-- 1005 조사원 010 1234 5555 20 1
-- 1006 정사원 010 1234 6666 30 2
-- 1007 황사원 010 1234 7777 10 3


-- 레코드 추가
INSERT INTO tbl_emp_202108 VALUES ('1001', '김사원', '010', '1234', 1111, '10', '1');
INSERT INTO tbl_emp_202108 VALUES ('1002', '이사원', '010', '1234', 2222, '20', '2');
INSERT INTO tbl_emp_202108 VALUES ('1003', '박사원', '010', '1234', 3333, '30', '3');
INSERT INTO tbl_emp_202108 VALUES ('1004', '홍사원', '010', '1234', 4444, '10', '4');
INSERT INTO tbl_emp_202108 VALUES ('1005', '조사원', '010', '1234', 5555, '20', '1');
INSERT INTO tbl_emp_202108 VALUES ('1006', '정사원', '010', '1234', 6666, '30', '2');
INSERT INTO tbl_emp_202108 VALUES ('1007', '황사원', '010', '1234', 7777, '10', '3');


-- 좌석(TBL_SEAT_202108) 테이블 
-- 컬럼ID 컬럼명 형태 길이 NULL 비고
-- SEATNO 좌석번호 char 4 NOT NULL Primary key
-- OFFICE 사무실 위치 varchar2 20
-- CALLNO 전화번호 varchar2 10
-- USEFLAG 사용여부 char 1

-- 테이블 생성
CREATE TABLE IF NOT EXISTS tbl_resv_202108(
    resvno char(8) PRIMARY KEY,
    empno char(4), 
    resvdate char(8),
    seatno char(4)
);

-- [좌석 테이블 샘플 데이터]
-- 좌석번호 사무실 위치 전화번호 사용여부
-- S001 1층 101호 777-0001 N
-- S002 1층 101호 777-0002 Y
-- S003 1층 101호 777-0003 Y
-- S004 1층 102호 777-0004 Y
-- S005 1층 102호 777-0005 Y
-- S006 1층 102호 777-0006 N
-- S007 1층 103호 777-0007 Y
-- S008 1층 103호 777-0008 Y
-- S009 1층 103호 777-0009 Y



-- 레코드 추가
INSERT INTO tbl_resv_202108 VALUES ('20210001', '1001', '20211004', 'S002');
INSERT INTO tbl_resv_202108 VALUES ('20210002', '1002', '20211004', 'S003');
INSERT INTO tbl_resv_202108 VALUES ('20210003', '1003', '20211004', 'S004');
INSERT INTO tbl_resv_202108 VALUES ('20210004', '1004', '20211004', 'S005');
INSERT INTO tbl_resv_202108 VALUES ('20210005', '1005', '20211005', 'S004');
INSERT INTO tbl_resv_202108 VALUES ('20210006', '1006', '20211005', 'S005');
INSERT INTO tbl_resv_202108 VALUES ('20210007', '1007', '20211005', 'S007');
INSERT INTO tbl_resv_202108 VALUES ('20210008', '1001', '20211005', 'S008');
INSERT INTO tbl_resv_202108 VALUES ('20210009', '1002', '20211006', 'S002');
INSERT INTO tbl_resv_202108 VALUES ('20210010', '1003', '20211006', 'S003');


-- 예약(TBL_RESV_202108) 테이블
-- 컬럼ID 컬럼명 형태 길이 NULL 비고
-- RESVNO 예약번호 char 8 NOT NULL Primary key
-- EMPNO 사원번호 char 4
-- RESVDATE 근무일자 char 8
-- SEATNO 좌석번호 char 4

-- 테이블 생성
CREATE TABLE IF NOT EXISTS tbl_seat_202108 (
    seatno char(4) PRIMARY KEY,
    office varchar(20),
    callno varchar(10),
    useflag char(1)
);

-- [예약 테이블 샘플 데이터]
-- 예약번호 사원번호 예약날짜 좌석번호
-- 20210001 1001 20211004 S002
-- 20210002 1002 20211004 S003
-- 20210003 1003 20211004 S004
-- 20210004 1004 20211004 S005
-- 20210005 1005 20211005 S004
-- 20210006 1006 20211005 S005
-- 20210007 1007 20211005 S007
-- 20210008 1001 20211005 S008
-- 20210009 1002 20211006 S002
-- 20210010 1003 20211006 S003

-- 레코드 추가
INSERT INTO tbl_seat_202108 VALUES ('S001', '1층 101호', '777-0001', 'N');
INSERT INTO tbl_seat_202108 VALUES ('S002', '1층 101호', '777-0002', 'Y');
INSERT INTO tbl_seat_202108 VALUES ('S003', '1층 101호', '777-0003', 'Y');
INSERT INTO tbl_seat_202108 VALUES ('S004', '1층 102호', '777-0004', 'Y');
INSERT INTO tbl_seat_202108 VALUES ('S005', '1층 102호', '777-0005', 'Y');
INSERT INTO tbl_seat_202108 VALUES ('S006', '1층 102호', '777-0006', 'N');
INSERT INTO tbl_seat_202108 VALUES ('S007', '1층 103호', '777-0007', 'Y');
INSERT INTO tbl_seat_202108 VALUES ('S008', '1층 103호', '777-0008', 'Y');
INSERT INTO tbl_seat_202108 VALUES ('S009', '1층 103호', '777-0009', 'Y');


-- 실행했던 테이블 데이터 별도의 sql 파일로 저장하기 : pg_dump -U 계정 -t 테이블명 -a -O --명령 -E UTF8 db명 > dump파일명
-- ex) pg_dump -U postgres -t tbl_emp_202108 -a -O --inserts -E UTF8 sample > d:\kim1\sample1.sql



-- 실습 2일차
-- 자동차 테이블(CARS)
-- 고유번호(ID)		SERIAL		기본키
-- 제작사(MAKER)		TEXT		널값 허용안함
-- 모델명(MODEL)		TEXT		널값 허용안함
-- 제작연도(YEAR)		INTEGER		널값 허용안함
-- 색상(COLOR)		TEXT		널값 허용안함
-- 출시일(CREATED_AT)	TIMESTAMP	기본값 오늘날짜, 널값 허용안함

CREATE TABLE cars (
  id serial PRIMARY KEY,
  make text NOT NULL,
  model text NOT NULL,
  year integer NOT NULL,
  color text NOT NULL,
  created_at timestamp DEFAULT now() NOT NULL
);

-- [자동차 테이블 샘플 데이터]
-- 제작사		모델명		제작연도		색상
-- kia		Seltos		2022		Silver
-- Hyundai		Sonata		2021		Black
-- Genesis		G80		2020		Red
-- SsangYong	Korando		2019		Blue

INSERT INTO cars (make, model, year, color) VALUES ('Kia', 'Seltos', 2022, 'Silver');
INSERT INTO cars (make, model, year, color) VALUES ('Hyundai', 'Sonata', 2021, 'Black');
INSERT INTO cars (make, model, year, color) VALUES ('Genesis', 'G80', 2020, 'Red');
INSERT INTO cars (make, model, year, color) VALUES ('SsangYong', 'Korando', 2019, 'Blue');

-- 임의의 데이터 3건의 레코드(튜플)을 더 추가하시오.
INSERT INTO cars (make, model, year, color) VALUES ('Kia', 'Sportage', 2023, 'White');
INSERT INTO cars (make, model, year, color) VALUES ('Hyundai', 'SantaFe', 2023, 'Gray');
INSERT INTO cars (make, model, year, color) VALUES ('Audi', 'A6', 2022, 'Beige');

-- 모델명이 Sonata인 레코드(튜플)에 대하여 출시일을 2023-01-01 12:00:00 로 변경하시오.
UPDATE cars SET created_at = '2023-01-01 12:00:00' WHERE model = 'Sonata';

-- 제작사가 Kia이고, 모델명이 Seltos인 레코드(튜플)에 대하여 색상을 Green으로 변경하시오.
UPDATE cars SET color = 'Green' WHERE make = 'Kia' AND model = 'Seltos';

-- 제작사가 Genesis이고, 모델명이 G80인 레코드(튜플)에 대하여 삭제하시오.
DELETE FROM cars WHERE make = 'Genesis' AND model = 'G80';

select * from cars;

-- 국가(countries) 테이블
-- 컬럼명					타입		크기	제약조건
-- 국가코드(country_code)	CHAR	2		기본키
-- 국가명(country_name)	TEXT			중복허용 안함

CREATE TABLE countries(
	country_code char(2) PRIMARY KEY,
    country_name text UNIQUE
);

-- [국가 테이블 샘플 데이터]
-- 국가코드		국가명
-- us		United States
-- ko		Republic of Korea
-- pk		People's Republic of Korea
-- jp		Japan
-- mx		Mexico
-- au		Austrailia
-- gb		United Kingdom
-- de		Germany
-- ll		Loompaland
-- ch		China
-- rc		Taiwan
-- tl		Thailand
-- fr		Frence
-- it		Italia
-- gr		Greece
-- es		Spain
-- ca		Canada

INSERT INTO countries (country_code, country_name)
VALUES ('us', 'United States'), ('mx', 'Mexico'), ('au', 'Austrailia'), 
('gb', 'United Kingdom'), ('de', 'Germany'), ('ll', 'Loompaland');

INSERT INTO countries (country_code, country_name)
VALUES ('ko', 'Republic of Korea'), ('pk', E'People\'s Republic of Korea'),('jp', 'Japan'), 
('ch', 'China'), ('rc', 'Taiwan'), ('tl', 'Thailand');
									 
INSERT INTO countries (country_code, country_name)
VALUES ('fr', 'Frence'), ('it', 'Italia'), ('gr', 'Greece'), 
('es', 'Spain'), ('ca', 'Canada');								 


select * from countries;

-- 도시(cites) 테이블
-- 도시명(name)			TEXT
-- 화물코드(postal_code)		VARCHAR	9	기본키
-- 국가코드(country_code)		CHAR		2	외래키

CREATE TABLE cities(
	name text NOT NULL,
	postal_code varchar(9) PRIMARY KEY,
	country_code char(2) REFERENCES countries
);

delete from cities;
-- [도시 테이블 샘플 데이터]
-- 도시명		화물코드		국가코드
-- Toronto		M4C1B5		ca
-- Portland		0187200		us
-- Newyork		0174200		us
-- Los Angeles	0142800		us
-- Washington	0118200		us
-- Tokyo		0811100		jp	
-- Pusan		0826200		ko
-- Seoul		0822100		ko
-- Daejeon		0824200		ko
-- Goyang		0823120		ko
-- Daegu		0826300		ko
-- Kwangju		0825200		ko
-- Sapporo		0812300		jp
-- Sanghi		0724210		ch
-- Beijing		0721100		ch
-- Mexico City	0281240		mx
-- Pyongyang	0828200		pk

insert into cities values('Toronto','M4C1B5','ca');
insert into cities values('Portland','0187200','us');
insert into cities values('Newyork','0174200','us');
insert into cities values('Los Angeles','0142800','us');
insert into cities values('Washington','0118200','us');
insert into cities values('Tokyo','0811100','jp');	
insert into cities values('Pusan','0826200','ko');
insert into cities values('Seoul','0822100','ko');
insert into cities values('Daejeon','0824200','ko');
insert into cities values('Goyang','0823120','ko');
insert into cities values('Daegu','0826300','ko');
insert into cities values('Kwangju','0825200','ko');
insert into cities values('Sapporo','0812300','jp');
insert into cities values('Sanghi','0724210','ch');
insert into cities values('Beijing','0721100','ch');
insert into cities values('Mexico City','0281240','mx');
insert into cities values('Pyongyang','0828200','pk');

select * from cities;

-- 내부 조인을 활용하여 국가코드, 국가명, 도시명을 검색하여라
SELECT cities.*, country_name 
FROM cities INNER JOIN countries 
ON cities.country_code = countries.country_code;

SELECT a.*, b.country_name 
FROM cities a INNER JOIN countries b
ON a.country_code = b.country_code;

-- 아래와 같이 개최지(venues) 테이블
-- 컬럼명					타입		크기		제약조건
-- 개최지아이디(venue_id)	SERIAL			기본키		
-- 주소(street_address)		TEXT	
-- 개최타입(type)			char	7		기본값 public, 입력제한(private, public)
-- 화물코드(postal_code)	varchar	9		외래키(도시테이블의 화물코드를 참조)
-- 국가코드(country_code)	char	2


CREATE TABLE venues (
	venue_id SERIAL PRIMARY KEY,
    name varchar(255),
    street_address text,
    type char(7) CHECK (type in ('public', 'private') ) DEFAULT 'public',
    postal_code varchar(9),
    country_code char(2),
    FOREIGN KEY (postal_code) REFERENCES cities(postal_code)
 );



-- [개최지 테이블 샘플 데이터]
-- 개최지명		화물코드		국가코드
-- Beijing		0721100		ch
-- Goyang		0823120		ko
-- Newyork		0174200		us
-- Sapporo		0812300		jp
-- Toronto		M4C1B5		ca

INSERT INTO venues (name, postal_code, country_code) VALUES ('Beijing','0721100','ch');
INSERT INTO venues (name, postal_code, country_code) VALUES ('Goyang','0823120','ko');
INSERT INTO venues (name, postal_code, country_code) VALUES ('Newyork','0174200','us');
INSERT INTO venues (name, postal_code, country_code) VALUES ('Sapporo','0812300','jp');
INSERT INTO venues (name, postal_code, country_code) VALUES ('Toronto','M4C1B5','ca');


-- [개최지 테이블의 주소 컬럼 데이터]
-- 개최지아이디	주소
-- 1		1 National Stadium S Rd, Chaoyang, China
-- 2		387-7, Songsan-ro, Ilsanseo-gu, Goyang-si, Gyeonggi-do, Republic of Korea
-- 3		1 East 161st Street, Newyork city, New York State, United States America
-- 4		1274, Miyanomori, Chuo-ku, Sapporo-shi, Hokkaido, Japan
-- 5		1 Blue Jays Way, Toronto city, Ontario State, Canada

UPDATE venues SET street_address='1 National Stadium S Rd, Chaoyang, China' WHERE venue_id=1;
UPDATE venues SET street_address='387-7, Songsan-ro, Ilsanseo-gu, Goyang-si, Gyeonggi-do, Republic of Korea' WHERE venue_id=2;
UPDATE venues SET street_address='1 East 161st Street, Newyork city, New York State, United States America' WHERE venue_id=3;
UPDATE venues SET street_address='1274, Miyanomori, Chuo-ku, Sapporo-shi, Hokkaido, Japan' WHERE venue_id=4;
UPDATE venues SET street_address='1 Blue Jays Way, Toronto city, Ontario State, Canada' WHERE venue_id=5;

select * from venues;
