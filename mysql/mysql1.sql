show databases;
use sample;
show tables;
desc test2;
select * from test1;
select * from test2;

insert into test2 values('vipkkt', '100479', 'VIP김기태');
-- insert into test2 values(?, ?, ?);
update test2 set pw='791004', name='김기태친구' where id='vipkkt';
-- update test2 set pw=?, name=? where id=?;

delete from test2 where id='vipkkt';

