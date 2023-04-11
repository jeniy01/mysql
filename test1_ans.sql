-- 사용자 추가 : 계정-test1, test2 각 비밀번호는 12345
create user test1 identified by 12345;
create user test2 identified by 12345;
-- select * from all_users;

-- 권한 부여 : 모든 권한 부여 - test1, test2
grant connect, resource, dba to test1;
grant connect, resource, dba to test2;
-- select * from dba_role_privs where grantee='TEST1';
-- select * from dba_role_privs where grantee='TEST2';


-- 권한 회수 : 모든 권한 회수 - test2
revoke connect, resource, dba from test2;

-- 사용자 제거 : test2
-- select * from all_users;
drop user test2; 

-- 해당 계정으로 로그인 - test1
commit;
conn test1/12345

-- 테이블 생성
-- [과정 정보 샘플 데이터] - tbl_class
-- 순번 	개강월 	과정번호 	캠퍼스 	수강료 	교사코드
-- 1 	202203 	10001 	서울본원 	100000 	100
-- 2 	202203 	10002 	성남분원 	100000 	100
-- 3 	202203 	10003 	부산분원 	200000 	200
-- 4 	202203 	20001 	광주분원 	150000 	300
-- 5 	202203 	20002 	대전분원 	200000 	400

create table tbl_class(class_seq number(4) not null, regist_month char(8) not null, c_no char(5) primary key, class_area varchar2(15), tution number(8), teacher_code char(3));
-- create table tbl_class_202201(class_seq number(4) not null, regist_month char(8) not null,
-- c_no char(5) not null, class_area varchar2(15), tution number(8), teacher_code char(3),
-- constraint tbl_pk primary key (regist_month, c_no));


insert into tbl_class values (1, '220203', '10001', '서울본원', 100000, '100');
insert into tbl_class values (2, '220203', '10002', '성남분원', 100000, '100');
insert into tbl_class values (3, '220203', '10003', '부산분원', 200000, '200');
insert into tbl_class values (4, '220203', '20001', '광주본원', 150000, '300');
insert into tbl_class values (5, '220203', '20002', '대전분원', 200000, '400');


-- [수강 신청 정보 샘플 데이터] - tbl_member
-- 순번 	과정코드 	수강생명 	전화번호 		주소 		수강등록일 	수강등급
-- 1 	10001 	이다영 	01022221111 	서울시 강남구 	20220101 	일반
-- 2 	10002 	이유섭 	01011112222 	서울시 성북구 	20220102 	일반
-- 3 	10003 	이재호 	01022223333 	성남시 분당구 	20220103 	일반
-- 4 	10004 	조태정 	01033334444 	부산시 서구 	20220104 	일반
-- 5 	20001 	황병준 	01044445555 	광주시 남구 	20220105 	VIP
-- 6 	20002 	전재영 	01055556666 	대전시 유성구 	20220106 	VIP

create table tbl_member(member_seq number(4) primary key, c_no char(5) not null, c_name varchar2(20), phone varchar2(11), address varchar2(100), regist_date char(8), c_type varchar2(12));

insert into tbl_member values (1, '10001', '이다영', '01022221111', '서울시 강남구', '20220101', '일반');
insert into tbl_member values (2, '10002', '이유섭', '01011112222', '서울시 성북구', '20220102', '일반');
insert into tbl_member values (3, '10003', '이재호', '01022223333', '성남시 분당구', '20220103', '일반');
insert into tbl_member values (4, '10004', '조태정', '01033334444', '부산시 서구', '20220104', '일반');
insert into tbl_member values (5, '20001', '황병준', '01044445555', '광주시 남구', '20220105', 'VIP');
insert into tbl_member values (6, '20002', '전재영', '01055556666', '대전시 유성구', '20220106', 'VIP');



-- [교사 정보 샘플 데이터] - tbl_teacher
--순번 	교사코드 	과정명 	교사명 	배정금액 	등록일         계약일
--5 	100 	초급반 	김초급 	100000 	20220101    XXXX/XX/XX
--6 	200 	중급반 	이중급 	200000 	20220102    XXXX/XX/XX
--7 	300 	고급반 	박고급 	300000 	20220103    XXXX/XX/XX
--8 	400 	심화반 	조심화 	400000 	20220104    XXXX/XX/XX

create table tbl_teacher(teacher_seq number(4) not null, teacher_code char(3) primary key, class_name  varchar2(12), teacher_name varchar2(12), class_price number(8) default 100000, teacher_regist_date char(8), contract date default sysdate);

insert into tbl_teacher(teacher_seq, teacher_code, class_name, teacher_name, teacher_regist_date) values (5, '100', '초급반', '김초급', '20220101');
-- 또는
insert into tbl_teacher values (1, '100', '초급반', '김초급', default, '20220101', default);

insert into tbl_teacher(teacher_seq, teacher_code, class_name, teacher_name, class_price, teacher_regist_date) values (6, '200', '중급반', '이중급', 200000, '20220101');
insert into tbl_teacher(teacher_seq, teacher_code, class_name, teacher_name, class_price, teacher_regist_date) values (7, '300', '고급반', '박고급', 300000, '20220101');
insert into tbl_teacher values (8, '400', '심화반', '조심화', 400000, '20220101', default);

-- [게시판 정보 샘플 데이터] - tbl_board
-- 순번 	제목 		내용 				작성자 	작성일
-- 1 	게시글1제목 	첫 번째 게시글에 대한 내용입니다. 	관리자 	2023/01/01
-- 2 	게시글제목2 	두 번째 공지사항입니다.		초급반	2023/01/02
-- 3 	게시글3제목 	세 번째 업로드 자료입니다.		고급반 	2023/01/03
-- 4 	게시글제목4 	네 번째 게시글의 내용입니다. 		조심화 	2023/01/04

create table tbl_board(board_seq number(4) primary key, 
title  varchar2(200), 
content varchar2(500), 
resdate date, 
author char(40));

insert into tbl_board values (1, '게시글1제목', '첫 번째 게시글에 대한 내용입니다.', '2023-01-01', '관리자');
insert into tbl_board values (2, '게시글제목2', '두 번째 공지사항입니다.', '2023-01-02', '초급반');
insert into tbl_board values (3, '게시글3제목', '세 번째 업로드 자료입니다.', '2023-01-03', '고급반');
insert into tbl_board values (4, '게시글제목4', '네 번째 게시글의 내용입니다.', '2023-01-04', '조심화');
alter table tbl_member add foreign key(c_no) references tbl_class(cno);
-- alter table tbl_member add constraint fk_mem foreign key(c_no) references tbl_class(cno);
commit;