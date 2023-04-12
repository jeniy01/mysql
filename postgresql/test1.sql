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

create table cars(id serial primary key, maker text not null, model text not null, year integer not null, color text not null, created_at timestamp default now() not null);
insert into cars values(default,'Kia','Seltos',2022,'Silver',default);
insert into cars values(default,'Hyundai','Sonata',2021,'Black',default);
insert into cars values(default,'Genesis','G80',2020,'Red',default);
insert into cars values(default,'SsangYong','Korando',2019,'Blue',default);
insert into cars values(default,'Benz','EQE',2023,'White',default);
insert into cars values(default,'Audi','A3',2021,'Silver',default);
insert into cars values(default,'Mini','Hatch',2022,'Yellow',default);
update cars set created_at='2023-01-01 12:00:00' where model='Sonata';
update cars set color='Green' where maker='Kia' and model='Seltos';
delete from cars where maker='Genesis' and model='G80';
select * from cars;

create table countries(country_code char(2) primary key, country_name text unique);
insert into countries values('us','United States');
insert into countries values('ca','Canada');
insert into countries values('ko','Republic of Korea');
update countries set country_name=E'People\'s Republic of Korea' where country_code='pk';
insert into countries values('jp','Japen');
insert into countries values('mx','Mexico');
insert into countries values('au','Austrailia');
insert into countries values('gb','United Kingdom');
insert into countries values('de','Germany');
insert into countries values('ll','Loompaland');
insert into countries values('ch','China');
insert into countries values('rc','Taiwan');
insert into countries values('tl','Thailand');
insert into countries values('fr','Frence');
insert into countries values('it','ltalia');
insert into countries values('gr','Greece');
insert into countries values('es','Spain');
select * from countries;

create table cities(name text, postal_code varchar(9) primary key, country_code char(2) constraint fk_code references countries(country_code));
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
select cities.*, country_name from cities inner join countries on cities.country_code=countries.country_code;

create table venues(venue_id serial primary key, name varchar(255), street_address text, type char(7) 
					check(type in('public','private')) default 'public', postal_code varchar(9) 
					constraint fk_vn references cities(postal_code), country_code char(2));
insert into venues values(default,'Baijing',default,default,'0721100','ch');
insert into venues values(default,'Goyang',default,default,'0823120','ko');
insert into venues values(default,'Newyork',default,default,'0174200','us');
insert into venues values(default,'Sapporo',default,default,'0812300','jp');
insert into venues values(default,'Toronto',default,default,'M4C1B5','ca');
update venues set venue_id=1, street_address='1 National Stadium S Rd, Chaoyang, China' where name='Baijing';
update venues set venue_id=2, street_address='387-7, Songsan-ro, ilsanseo-gu, Goyang-si, Gyeonggi-do, Republic of Korea' where name='Goyang';
update venues set venue_id=3, street_address='1 East 161st Street, Newyork city, New York State, United States Ameria' where name='Newyork';
update venues set venue_id=4, street_address='1274, Miyanomori, Chuo-ku, Sapporo-shi, Hokkaido, Japan' where name='Sapporo';
update venues set venue_id=5, street_address='1 Blue Jays Way, Toronto city, Ontario State, Canada' where name='Toronto';
select * from venues;
