-- 사용자 추가(최고관리자 등급으로)
CREATE USER test1 PASSWORD '1234' SUPERUSER;

-- 사용자 권한 부여
ALTER USER test1 SUPERUSER;

-- 데이터베이스에 모든 권한 부여하기
GRANT ALL PRIVILEGES ON DATABASE sample TO test1;

-- 데이터베이스 생성
create database sample;

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

-- 테이블 생성
create table tbl_emp_202108(
	empno char(4) primary key, empname varchar(20),
	tel1 char(3), tel2 char(4),	tel3 int,
	deptcode char(2), position char(1)
);

-- 테이블 제거
drop table tbl_emp_202108;

