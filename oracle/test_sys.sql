drop user test1 cascade;

create user test1 identified by 1234;
create user test2 identified by a1234;
select * from all_users;
alter user test2 identified by 1234;
grant connect, resource, dba to test2;
select * from dba_role_privs where grantee='TEST2';
revoke connect, resource, dba from test2;
select * from dba_role_privs where grantee='TEST2';
drop user test2;
select * from all_users;
grant connect, resource, dba to test1;
conn test1/1234;
commit;
show user;