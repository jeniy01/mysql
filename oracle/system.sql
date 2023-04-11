create user test1 IDENTIFIED by 12345;

grant connect, resource, dba to test1;

create user test2 IDENTIFIED by 12345;

grant connect, resource, dba to test2;

select * from all_users;

select * from dba_role_privs where grantee='TEST1';

select * from dba_role_privs where grantee='TEST2';

revoke connect, resource, dba from TEST2;

select * from dba_role_privs where grantee='TEST2';

drop user test2;

select * from all_users;

commit;

conn test1/12345;

conn system/1234;

desc tbl_teacher_2022201;
show user;
desc tbl_teacher_202201;
select * from tbl_teacher_202201;


