create table member(id varchar(20) primary key, pw varchar(300) not null, name varchar(50) not null, email varchar(100), tel varchar(13), addr varchar(200), point int default 0, regdate date default current_date);
create table board(bid serial primary key, title varchar(200) not null, content varchar(1000), author varchar(20), resdate date default current_date, constraint b_fk FOREIGN KEY (author) REFERENCES member(id));

insert into member values('admin','1234','관리자','admin@company.com','010-1234-1234','고양시 일산동구',default,default);
--insert into member values('kdy','1111','김도영','kdy@naver.com','010-1111-1111','고양시 일산서구',default,default);
--insert into member values('kjw','2222','김정우','kjw@daum.net','010-2222-2222','고양시 덕양구',default,default);
--insert into member values('jjh','3333','정재현','jjh@nate.com','010-3333-3333','파주시 문산읍',default,default);
--insert into member values('lty','4444','이태용','kms@nate.com','010-3333-3333','파주시 조리읍',default,default);
insert into board values(default,'더미글 제목1','첫 번째 더미글에 대한 내용입니다.','admin',default);
--insert into board values(default,'더미글 제목2','두 번째 더미글에 대한 내용입니다.','admin',default);
--insert into board values(default,'더미글 제목3','세 번째 더미글에 대한 내용입니다.','admin',default);

select * from member;
select * from board;