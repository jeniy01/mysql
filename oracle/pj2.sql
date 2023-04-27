create table user1(id varchar2(20) primary key, pw varchar2(300) not null, name varchar2(20), tel varchar2(13), addr varchar2(300), email varchar2(50), rdate date);

create table goods1(gcode varchar2(20) primary key, gname varchar2(50) not null, gram varchar2(20), price number(20), mung varchar2(500), amount number(20) default 1);

create table order1(ocode varchar2(20) primary key, id varchar2(20) not null, gcode varchar2(20), amount number(20) default 1, price number(20), ostate varchar2(20) default '배송중', tel varchar2(13), dname varchar2(20), addr varchar2(300), dcode varchar2(20));
alter table order1 add constraint fk_id foreign key(id) references user1 (id);
alter table order1 add constraint fk_gcode foreign key(gcode) references goods1 (gcode);

create table basket1(bcode varchar2(20) primary key, id varchar2(20) not null, gcode varchar2(20), amount number(20) default 1);
alter table basket1 add constraint fk_id2 foreign key(id) references user1 (id);
alter table basket1 add constraint fk_gcode2 foreign key(gcode) references goods1 (gcode);

create table pay1(pcode varchar2(20) primary key, id varchar2(20) not null, ocode varchar2(20), p_sd varchar2(20), p_bun varchar2(50), price number(20), pdate date);
alter table pay1 add constraint fk_id3 foreign key(id) references user1 (id);
alter table pay1 add constraint fk_ocode foreign key(ocode) references order1 (ocode);

create table review1(rcode varchar2(20) primary key, id varchar2(20) not null, ocode varchar2(20), rdate date, hg varchar2(500), str varchar2(20));
alter table review1 add constraint fk_id4 foreign key(id) references user1 (id);
alter table review1 add constraint fk_ocode2 foreign key(ocode) references order1 (ocode);

drop table review1;
drop table pay1;
drop table basket1;
drop table order1;
drop table goods1;
drop table user1;

commit;

select* from user1;
desc user1;
select* from goods1;
desc goods1;
select* from order1;
desc order1;
select* from basket1;
desc basket1;
select* from pay1;
desc pay1;
select* from review1;
desc review1;
/*
insert into order1 values('1001','kbs','4192',1,68000,'배송완료','010-4321-4321','CJ대한통운','경기도 고양시 일산동구','c123456');
insert into order1 values('1002','sbs','1352',1,28000,'배송완료','010-3333-3333','로젠택배','경기도 김포시 통진읍','r781245');
insert into order1 values('1003','kfm','8162',2,96000,'배송전','010-7979-7979','','경기도 고양시 일산서구','');
insert into order1 values('1004','kbs','8138',1,35000,'배송중','010-4321-4321','한진택배','경기도 고양시 일산동구','h697812');
*/
insert into order1 values('1001','lmk','4192',1,68000,'배송완료','010-4321-4321','CJ대한통운','경기도 고양시 일산동구','c567891');
insert into order1 values('1002','ljn','1352',1,28000,'배송완료','010-3333-3333','롯데택배','경기도 파주시 문산읍','r123456');
insert into order1 values('1003','pjs','8162',2,96000,'배송전','010-7979-7979','','경기도 고양시 일산서구','');
insert into order1 values('1004','lmk','8138',1,35000,'배송중','010-4321-4321','한진택배','경기도 고양시 일산동구','h895622');

/*
insert into basket1 values('10001','mbc','6186',1);
insert into basket1 values('10002','kbs','5072',1);
insert into basket1 values('10003','jtb','8138',1);
insert into basket1 values('10004','sbs','8162',1);
*/
insert into basket1 values('10001','ldh','6186',1);
insert into basket1 values('10002','lmk','5072',1);
insert into basket1 values('10003','njm','8138',1);
insert into basket1 values('10004','ljn','8162',1);

/*
insert into pay1 values('10001','kbs','1001','신용카드','123-1234-123456',68000,'2023-04-19');
insert into pay1 values('10002','sbs','1002','계좌이체','083-21-467895',28000,'2023-04-19');
insert into pay1 values('10003','kfm','1003','신용카드','462-127-9123458',96000,'2023-04-20');
insert into pay1 values('10004','kbs','1004','체크카드','214-31-415617',35000,'2023-04-20');
*/
insert into pay1 values('10001','lmk','1001','신용카드','123-1234-123456',68000,'2023-04-19');
insert into pay1 values('10002','ljn','1002','계좌이체','083-21-467895',28000,'2023-04-19');
insert into pay1 values('10003','pjs','1003','신용카드','462-127-9123458',96000,'2023-04-20');
insert into pay1 values('10004','lmk','1004','체크카드','214-31-415617',35000,'2023-04-20');

/*
insert into review1 values('10001','kbs','1001','2023-04-20','상품 잘 받았습니다.','5');
insert into review1 values('10002','sbs','1002','2023-04-20','효과있어요.','4');
*/
insert into review1 values('10001','lmk','1001','2023-04-20','상품 잘 받았습니다.','4');
insert into review1 values('10002','ljn','1002','2023-04-20','효과있어요.','5');

commit;
