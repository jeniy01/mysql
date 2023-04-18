create table tbl_member_2202 as select * from tbl_member;
savepoint a;
insert into tbl_member_2202 values(8,'10003','조교행','01027481234','고양시 일산서구','20220108','일반');
update tbl_member_2202 set address='서울시 서초구' where cno='10002';
select * from tbl_member_2202;
rollback to savepoint a;
select * from tbl_member_2202;

savepoint b;
insert into tbl_member_2202 values(9,'10002','손승기','01012345678','파주시 문산읍','20220109','일반');
update tbl_member_2202 set address='수원시 권선구' where member_seq=6;
select * from tbl_member_2202;
commit;
select * from tbl_member_2202;

commit;