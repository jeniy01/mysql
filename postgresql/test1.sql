create table TBL_EMP_202108(EMPNO char(4) not null primary key, EMPNAME varchar(20), TEL1 char(3), TEL2 char(4), TEL3 int, DEPTCODE char(2), POSITION char(1));
insert into TBL_EMP_202108 values('1001','김사원','010','1234',1111,'10','1');
insert into TBL_EMP_202108 values('1002','이사원','010','1234',2222,'20','2');
insert into TBL_EMP_202108 values('1003','박사원','010','1234',3333,'30','3');
insert into TBL_EMP_202108 values('1004','홍사원','010','1234',4444,'10','4');
insert into TBL_EMP_202108 values('1005','조사원','010','1234',5555,'20','1');
insert into TBL_EMP_202108 values('1006','정사원','010','1234',6666,'30','2');
insert into TBL_EMP_202108 values('1007','황사원','010','1234',7777,'10','3');
select * from TBL_EMP_202108;

create table tbl_seat_202108(seatno char(4) not null primary key, office varchar(20), callno varchar(10), useflag char(1));
insert into tbl_seat_202108 values('S001','1층 101호','777-0001','N');
insert into tbl_seat_202108 values('S002','1층 101호','777-0002','Y');
insert into tbl_seat_202108 values('S003','1층 101호','777-0003','Y');
insert into tbl_seat_202108 values('S004','1층 102호','777-0004','Y');
insert into tbl_seat_202108 values('S005','1층 102호','777-0005','Y');
insert into tbl_seat_202108 values('S006','1층 102호','777-0006','N');
insert into tbl_seat_202108 values('S007','1층 103호','777-0007','Y');
insert into tbl_seat_202108 values('S008','1층 103호','777-0008','Y');
insert into tbl_seat_202108 values('S009','1층 103호','777-0009','Y');
select * from tbl_seat_202108;

create table tbl_resv_202108(resvno char(8) not null primary key, empno char(4), resvdate char(8), seatno char(4));
insert into tbl_resv_202108 values('20210001','1001','20211004','S002');
insert into tbl_resv_202108 values('20210002','1002','20211004','S003');
insert into tbl_resv_202108 values('20210003','1003','20211004','S004');
insert into tbl_resv_202108 values('20210004','1004','20211004','S005');
insert into tbl_resv_202108 values('20210005','1005','20211005','S004');
insert into tbl_resv_202108 values('20210006','1006','20211005','S005');
insert into tbl_resv_202108 values('20210007','1007','20211005','S007');
insert into tbl_resv_202108 values('20210008','1001','20211005','S008');
insert into tbl_resv_202108 values('20210009','1002','20211006','S002');
insert into tbl_resv_202108 values('20210010','1003','20211006','S003');
select * from tbl_resv_202108;

-- 테이블 제거
-- drop table tbl_emp_202108;
-- drop table tbl_seat_202108;
-- drop table tbl_resv_202108;

select * from TBL_EMP_202108;
select * from tbl_seat_202108;
select * from tbl_resv_202108;

-- 트랜잭션 작업
-- 단순 트랜잭션
--begin;
	--select * from tbl_emp_202108;
	--update tbl_emp_202108 set empname='김대리' where empno='1001';
--ROLLBACK;

--begin;
	--select * from tbl_emp_202108;
	--savepoint my1;	-- 트랜잭션의 시작기점을 만드는 것
	--update tbl_emp_202108 set empname='김대리' where empno='1001';
	--delete tbl_emp_202108 where empno='1004';
	-- ROLLBACK to my1; 작업을 실패로 처리
	--update tbl_emp_202108 set empname='김상무' where empno='1001';
	-- COMMIT to my1; 작업을 성공적으로 처리
