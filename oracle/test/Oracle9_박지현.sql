create view teacher_msl_view as (select b.c_no, b.class_area, a.class_name, a.teacher_name, b.tution, a.class_price from tbl_teacher a inner join tbl_course b on a.teacher_code=b.teacher_code);
select * from teacher_msl_view;

create view course_msl_view as (select c.c_name, b.class_area, a.class_name, a.teacher_name, b.classroom from tbl_member c inner join tbl_course b on c.cno=b.c_no inner join tbl_teacher a on b.teacher_code=a.teacher_code);
select * from course_msl_view;

create table tbl_member_2301 as select * from tbl_member where 1=2;
insert into tbl_member_2301 values (1,'10001','이자영','01022221111','서울시 강남구','20230101','일반');
insert into tbl_member_2301 values (2,'10002','이규섭','01011112222','서울시 성북구','20230102','일반');
insert into tbl_member_2301 values (3,'10003','이윤호','01022223333','성남시 분당구','20230103','일반');
insert into tbl_member_2301 values (4,'10004','조태철','01033334444','부산시 서구','20230104','일반');
insert into tbl_member_2301 values (5,'20001','황기준','01044445555','광주시 남구','20230105','VIP');
insert into tbl_member_2301 values (6,'20002','전소영','01055556666','대전시 유성구','20230106','VIP');
insert into tbl_member_2301 values (7,'10001','정혜진','01044445555','대구시 달성군','20230107','일반');
insert into tbl_member_2301 values (8,'10002','허무해','01088889999','천안시 서북구','20230108','일반');
insert into tbl_member_2301 values (9,'10003','김태종','01077771111','수원시 장안구','20230109','일반');
select * from tbl_member_2301;
desc tbl_member_2301;
create table tbl_member_2302 as select * from tbl_member where 1=2;
insert into tbl_member_2302 values (1,'10001','이자영','01022221111','서울시 강남구','20230201','일반');
insert into tbl_member_2302 values (2,'10002','이규섭','01011112222','서울시 성북구','20230202','일반');
insert into tbl_member_2302 values (3,'10003','이윤호','01022223333','성남시 분당구','20230203','일반');
insert into tbl_member_2302 values (4,'10004','조태철','01033334444','부산시 서구','20230204','일반');
insert into tbl_member_2302 values (5,'20001','백석준','01044445555','광주시 북구','20230205','VIP');
insert into tbl_member_2302 values (6,'20002','전소영','01055556666','대전시 유성구','20230206','VIP');
insert into tbl_member_2302 values (7,'10001','정혜진','01044445555','대구시 달성군','20230207','일반');
insert into tbl_member_2302 values (8,'10002','김시부','01088889999','고양시 일산동구','20230208','일반');
insert into tbl_member_2302 values (9,'10003','김태종','01077771111','수원시 장안구','20230209','일반');
select * from tbl_member_2302;
desc tbl_member_2302;

create view member_total as (select * from tbl_member_2301 UNION select * from tbl_member_2302);
select * from member_total;

create view member_legacy as (select * from tbl_member_2301 INTERSECT select * from tbl_member_2302);
select * from member_legacy;

create view member_new as (select * from tbl_member_2302 MINUS select * from tbl_member_2301);
select * from member_new;

commit;