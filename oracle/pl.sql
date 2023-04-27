-- 기본 입출력문 : dbms_output.put_line(출력할내용);
SET serveroutput ON -- 한번만 선언하고 한번 실행시키기
BEGIN
    DBMS_OUTPUT.put_line('Hello');
END;
/

-- 변수 선언(variable Declare) : 블록 내에서 변수를 사용하려면 선언부에서 먼저 정의를 해야 한다.
-- DECLARE 변수이름 데이터타입[:값]
-- 타입의 명시적 선언방법
/*
DECLARE VNAME VARCHAR2(20);
    
DECLARE VNAME VARCHAR2(20) := '홍길동';

DECLARE VNAME VARCHAR2(20) DEFAULT '홍길동';
*/
DECLARE
    VNAME VARCHAR2(30) := '홍길동';
    AGE NUMBER(2) := 42;
    GENDER VARCHAR2(20) DEFAULT '남';
BEGIN
    DBMS_OUTPUT.put_line('이름:'||VNAME||' 나이:'||AGE||' 성별:'||GENDER);
END;
/

-- 타입의 암시적 선언방법 : %ROWTYPE, %TYPE
-- select * from user1;
-- %ROWTYPE
DECLARE
    DT USER1%ROWTYPE;
BEGIN
    SELECT * INTO DT
    FROM USER1;
    DBMS_OUTPUT.put_line(DT.ID||DT.NAME||DT.TEL);
END;
/
-- %TYPE
DECLARE
    VID USER1.ID%TYPE;
    VNAME USER1.NAME%TYPE;
    VTEL USER1.TEL%TYPE;
BEGIN
    SELECT ID,NAME,TEL INTO VID,VNAME,VTEL
    FROM USER1;
    DBMS_OUTPUT.put_line(VID||VNAME||VTEL);
END;
/

-- 반복문 : FOR LOOP, LOOP, WHITE LOOP
-- FOR LOOP
/*
FOR index in [REVERSE] 시작값 .. END값 LOOP
    STATEMENT 1
    STATEMENT 2
    ...
END LOOP;
*/
/* 생략 가능
DECLARE
    i NUMBER(2) := 5;
*/
BEGIN
    FOR i in 1..5 LOOP
        DBMS_OUTPUT.PUT_LINE(i);
        IF mod(i, 2) = 0 THEN
            DBMS_OUTPUT.put_line(i||'는 짝수값');
        ELSE
            DBMS_OUTPUT.put_line(i||'는 홀수값');
        END IF;
    END LOOP;
END;
/

-- 카운트 변수
DECLARE
    v_num NUMBER := 0;  -- 카운트 변수
    v_tot_num NUMBER := 0;  -- 합산 결과 변수
BEGIN
    LOOP
        v_num := v_num + 1;
        DBMS_OUTPUT.PUT_LINE('현재 숫자 : '||v_num);
        v_tot_num := v_tot_num + v_num;
        EXIT WHEN v_num >= 10;  -- 반복 구간을 벗어나기 위한 조건
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('합산 결과 : '||v_tot_num);
END;
/

-- WHILE
DECLARE
    v_num NUMBER := 0;  -- 시작숫자
    v_tot_num NUMBER := 0;  -- 총 loop수 반환 변수
BEGIN
    WHILE v_num < 101 LOOP  -- 조건이 만족하는 동안 실행
        v_num := v_num + 1;
        IF mod(v_num,2)=0 THEN
            v_tot_num := v_tot_num + v_num;
        END IF;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('짝수 합산 결과 : '||v_tot_num);
END;
/

-- IF~ ELSIF~
DECLARE
    score NUMBER := 88;
BEGIN
    IF score >= 90 THEN
        DBMS_OUTPUT.PUT_LINE('점수 : '||score||', 등급 : A');
    ELSIF score >= 80 THEN
        DBMS_OUTPUT.PUT_LINE('점수 : '||score||', 등급 : B');
    ELSIF score >= 70 THEN
        DBMS_OUTPUT.PUT_LINE('점수 : '||score||', 등급 : C');
    ELSIF score >= 60 THEN
        DBMS_OUTPUT.PUT_LINE('점수 : '||score||', 등급 : D');
    ELSE
        DBMS_OUTPUT.PUT_LINE('점수 : '||score||', 등급 : F');
    END IF;
END;
/

-- CASE
DECLARE
    grade CHAR(1) := 'B';
    appraisal VARCHAR2(20);
BEGIN
    appraisal := CASE grade
        WHEN 'A' THEN 'Excellent'
        WHEN 'B' THEN 'Very Good'
        WHEN 'C' THEN 'Good'
        ELSE 'No such grade'
    END;
DBMS_OUTPUT.PUT_LINE('등급 : '||grade);
DBMS_OUTPUT.PUT_LINE('피트백 : '||appraisal);
END;
/
-- 또는
DECLARE
    grade CHAR(1) := 'D';
    appraisal VARCHAR2(20);
BEGIN
    appraisal := CASE grade
        WHEN 'A' THEN 'Excellent'
        WHEN 'B' THEN 'Very Good'
        WHEN 'C' THEN 'Good'
        ELSE 'No such grade'
    END;
DBMS_OUTPUT.PUT_LINE('등급 : '||grade);
DBMS_OUTPUT.PUT_LINE('피트백 : '||appraisal);
END;
/

-- 커서(Cursor) : Select/Insert/Delete/Update에 의한 검색 결과 집합을 처리하기 위한 구문으로 얻어진 질의 결과가 있는 메모리상의 위치를 
-- 커서 종류 : 
-- 암시적 커서의 속성
-- SQL%FOUND : 결과의 총 행수가 1개 이상일 경우 TRUE 반환
-- SQL%NOTFOUND : 결과의 총 행수가 없을 경우 TRUE 반환
-- SQL%ISOPEN : 항상 FALSE지만, 암시적 커서가 열려 있을 경우 TRUE 반환
-- SQL%ROWCOUNT : 결과의 총 행수 반환
-- select * from tbl_member_202201;
DECLARE
BEGIN
    UPDATE tbl_member_202201 SET REGIST_DATE='20230101' WHERE address like '서울시%';
    DBMS_OUTPUT.PUT_LINE('처리 건수 : '||TO_CHAR(SQL%ROWCOUNT)||'건');
END;
/
--
DECLARE
    CURSOR mem_cur
    IS
    SELECT * FROM tbl_member_202201;
    mem_rec tbl_member_202201%ROWTYPE;
BEGIN
    OPEN mem_cur;
    LOOP
        FETCH mem_cur INTO mem_rec; -- 하나의 레코드 단위로 인출
        EXIT WHEN mem_cur%NOTFOUND; -- 더이상 레코드가 없는 경우 종료
       DBMS_OUTPUT.put_line(mem_rec.c_no||' '||mem_rec.c_name||' '||mem_rec.phone);
    END LOOP;
    CLOSE mem_cur;
END;
/




/*프로시저 활용*/
/*
CREATE OR REPLACE PROCEDURE 프로시저명(매개변수 IN 변수타입,..)
    IS
    BEGIN
        SQL실행문장;
        [commit;]
    END 프로시저명;
/
*/
alter table test1 add name varchar(20) default '이무개';
alter table test1 add point number default 0;
alter table test1 add  addr varchar2(13) default '010-0000-0000';
alter table test1 rename column addr to tel;
select * from test1;
commit;
desc test1;
-- 이름 변경 프로시저
CREATE OR REPLACE PROCEDURE update_name(vid IN test1.id%TYPE, vname IN test1.name%TYPE)
    IS
    BEGIN
        UPDATE test1 SET name = vname WHERE id=vid;
        commit;
    END update_name;
/
-- 위 구문 먼저 실행 후(한번만) 아래 실행문 실행
EXECUTE update_name('lee','이유섭');
EXECUTE update_name('kim','김기태');
EXECUTE update_name('park','박지성');
EXECUTE update_name('cho','조교행');
select * from test1;
commit;

-- 포인트 변경 프로시저 : update_point
-- 특정아이디를 가진 회원에게 입력된 포인트로 변경되는 프로시저를 만들고
CREATE OR REPLACE PROCEDURE update_point(vid IN test1.id%TYPE, vpoint IN test1.point%TYPE)
    IS
    BEGIN
        UPDATE test1 SET point = vpoint WHERE id=vid;
        commit;
    END update_point;
/
-- 해당 프로시저를 실행하여 포인트를 변경할 것.
EXECUTE update_point('lee',50);
EXECUTE update_point('kim',70);
EXECUTE update_point('park',90);
EXECUTE update_point('cho',50);
select * from test1;
commit;

-- 전화번호 변경 프로시저 : update_tel
-- 특정아이디를 가진 회원에게 입력된 전화번호로 변경되는 프로시저를 만들고
CREATE OR REPLACE PROCEDURE update_tel(vid IN test1.id%TYPE, vtel IN test1.tel%TYPE)
    IS
    BEGIN
        UPDATE test1 SET tel = vtel WHERE id=vid;
        commit;
    END update_tel;
/
-- 해당 프로시저를 실행하여 전화번호를 변경할 것.
EXECUTE update_tel('lee','010-1234-5678');
EXECUTE update_tel('kim','010-5678-1234');
EXECUTE update_tel('park','010-1004-9999');
EXECUTE update_tel('cho','010-8888-9999');
select * from test1;
commit;

-- 회원 탈퇴 프로시저 : withdraw_mem_pro
-- 회원 아이디를 입력받아 해당 인원이 탈퇴되는 프로시저를 생성하고
CREATE OR REPLACE PROCEDURE withdraw_mem_pro(vid IN test1.id%TYPE)
    IS
    BEGIN
        DELETE FROM test1 WHERE id = vid;
        commit;
    END withdraw_mem_pro;
/
-- 특정 회원을 탈퇴되도록 구현할 것.
EXECUTE withdraw_mem_pro('park');
select * from test1;
commit;



DROP PROCEDURE join_mem_pro;

-- 회원 가입 프로시저 : join_mem_pro
-- user1 테이블에 대하여 아래와 같이 작업할 것.
-- select * from user1;
-- 회원 아이디, 비밀번호, 회원명, 전화번호, 주소, 이메일 등을 입력받아 회원이 가입되는 프로시저를 생성하고
select * from user1;
desc user1;
CREATE OR REPLACE PROCEDURE join_mem_pro(vid IN user1.id%TYPE, vpw IN user1.pw%TYPE, vname IN user1.name%TYPE, vtel IN user1.tel%TYPE, vaddr IN user1.addr%TYPE, vemail IN user1.email%TYPE, vrdate IN user1.rdate%TYPE)
    IS
    BEGIN
        INSERT INTO user1(id,pw,name,tel,addr,email,rdate) values(vid,vpw,vname,vtel,vaddr,vemail,vrdate);
        DBMS_OUTPUT.put_line(vid||'계정이 추가되었습니다.');
        commit;
    END join_mem_pro;
/
-- 특정 회원이 가입되도록 구현할 것.
/*
EXECUTE join_mem_pro('kbs','4321','김병수','010-4321-4321','경기도 고양시 일산동구','kbs@naver.com');
EXECUTE join_mem_pro('mbc','1111','문범철','010-1111-1111','경기도 파주시 문산읍','mbc@daum.net');
EXECUTE join_mem_pro('sbs','3333','사본석','010-3333-3333','경기도 김포시 통진읍','sbs@gmail.com');
EXECUTE join_mem_pro('jtb','2222','정태병','010-2222-2222','경기도 파주시 월롱면','jtb@hotmail.co.kr');
EXECUTE join_mem_pro('kfm','7979','강편명','010-7979-7979','경기도 고양시 일산서구','kfm@ssangyoung.co.kr');
*/
EXECUTE join_mem_pro('lmk','1111','이마크','010-1111-1111','경기도 고양시 일산동구','lmk@naver.com','2023-04-19');
EXECUTE join_mem_pro('ldh','2222','이동혁','010-2222-2222','경기도 고양시 덕양구','ldh@daum.net','2023-04-20');
EXECUTE join_mem_pro('ljn','3333','이제노','010-3333-3333','경기도 파주시 문산읍','ljn@gmail.com','2023-04-18');
EXECUTE join_mem_pro('njm','4444','나재민','010-4444-4444','경기도 파주시 월롱면','njm@hotmail.co.kr','2023-04-17');
EXECUTE join_mem_pro('pjs','5555','박지성','010-5555-5555','경기도 고양시 일산서구','pjs@ssangyoung.co.kr','2023-04-16');

select * from user1;
commit;

-- 상품 이미지 필드 추가
alter table goods1 add pic1 varchar2(200);
alter table goods1 add pic2 varchar2(200);
alter table goods1 add pic3 varchar2(200);
commit;
desc goods1;

DROP PROCEDURE prd_ins_pro;
-- 상품 등록 프로시저 : prd_ins_pro
-- goods1 테이블에 대하여 아래와 같이 작업할 것.
-- 상품코드, 상품명, 규격, 단가, 상품설명, 수량, 상품대표이미지1, 상품상세이미지2, 상품상세이미지3을 입력받아 상품을 등록하는 프로시저를 생성하고
select * from goods1;
desc goods1;
CREATE OR REPLACE PROCEDURE prd_ins_pro(vgcode IN goods1.gcode%TYPE, vgname IN goods1.gname%TYPE, vgram IN goods1.gram%TYPE, vprice IN goods1.price%TYPE, vmung IN goods1.mung%TYPE, vamount IN goods1.amount%TYPE, vpic1 IN goods1.pic1%TYPE, vpic2 IN goods1.pic2%TYPE, vpic3 IN goods1.pic3%TYPE)
    IS
    BEGIN
        INSERT INTO goods1 values(vgcode,vgname,vgram,vprice,vmung,vamount,vpic1,vpic2,vpic3);
        DBMS_OUTPUT.put_line(vgcode||'상품이 등록되었습니다.');
        commit;
    END prd_ins_pro;
/
-- 그 프로시저를 구현하여 5개 이상의 상품을 등록할 것.
EXECUTE prd_ins_pro('4192','수퍼바이오틱스 60캡슐','25g',68000,'건강기능식품 프로바이오틱스 (60일분)',10,'','','');
EXECUTE prd_ins_pro('6186','트리플러스 우먼 90캡슐','100g',49000,'건강기능식품 종합비타민 (45일분)',12,'','','');
EXECUTE prd_ins_pro('5072','밀크씨슬','54g',40000,'건강기능식품 밀크씨슬 (60일분)',8,'','','');
EXECUTE prd_ins_pro('1352','마그네슘','90g',28000,'건강기능식품 마그네슘 (90일분)',13,'','','');
EXECUTE prd_ins_pro('8138','프로폴리스','36g',35000,'건강기능식품 프로폴리스 (60일분)',5,'','','');
EXECUTE prd_ins_pro('8162','코엔자임큐텐','35g',48000,'건강기능식품 코엔자임큐텐 (60일분)',6,'','','');
select * from goods1;
commit;

DROP FUNCTION update_mem_fnc;
-- 함수명 : update_mem_fnc
-- 특정 아이디를 가진 회원의 정보를 입력된 값으로 변경하고, 그 입력된 정보를 출력하도록 하는 함수를 생성하고
-- CREATE OR REPLACE FUNCTION update_mem_fnc(vid IN VARCHAR2, sw IN VARCHAR2, v2 IN VARCHAR2)..
select * from user1;
CREATE OR REPLACE FUNCTION update_mem_fnc(vid IN VARCHAR2, sw IN VARCHAR2, v2 IN VARCHAR2)
        RETURN NUMBER
    IS
    vcnt NUMBER := 0;
    BEGIN
        IF sw='pw' THEN
            UPDATE user1 SET pw = v2 WHERE id=vid;
        ELSIF sw='name' THEN
            UPDATE user1 SET name = v2 WHERE id=vid;
        ELSIF sw='tel' THEN
            UPDATE user1 SET tel = v2 WHERE id=vid;
        ELSIF sw='addr' THEN
            UPDATE user1 SET addr = v2 WHERE id=vid;
        ELSIF sw='email' THEN
            UPDATE user1 SET email = v2 WHERE id=vid;
        ELSIF sw='rdate' THEN
            UPDATE user1 SET rdate = v2 WHERE id=vid;
        ELSE
            DBMS_OUTPUT.put_line('변경된 값이 없음');
        END IF;
        commit;
        DBMS_OUTPUT.put_line('변경된 정보 : '||sw||' '||vid||' '||v2);
        RETURN vcnt;    -- 리턴타입이 꼭 있어야 한다.
    END;
/

-- 구현할 것.
/*
VAR cnt NUMBER;
EXECUTE :cnt := update_mem_fnc('kbs','pw','4848');
EXECUTE :cnt := update_mem_fnc('kbs','name','김범수');
*/

-- 반환 타입 객체 : 본인이 반환되는 데이터를 기준으로 테이블과 유사한 형태의 컬렉션 자료형을 선언할 수 있다.
-- 타입 객체 생성
/*
CREATE OR REPLACE TYPE 타입명 AS OBJECT (
    컬럼1 기본자료형[, 컬럼2 기본자료형,..]
);
*/
-- 테이블 타입 객체 정의

DROP FUNCTION get_mem_info;
select * from user1;
desc user1;
CREATE OR REPLACE TYPE USER1_TYPE AS OBJECT (    -- 테이블 타입 객체 정의
    ID VARCHAR2(20), PW VARCHAR2(300), NAME VARCHAR2(20), TEL VARCHAR2(13), ADDR VARCHAR2(300), EMAIL VARCHAR2(50), RDATE DATE
);
-- 위 구문 실행 후 테이블 타입 객체 생성
CREATE OR REPLACE TYPE MEM_TBL AS TABLE OF USER1_TYPE;   -- 테이블 타입 객체 생성
-- 위 구문 실행 후 타입 객체로 회원정보를 반환하는 함수 생성
CREATE OR REPLACE FUNCTION get_mem_info(vid IN VARCHAR2)    -- 타입 객체로 회원정보를 반환하는 함수 생성
    RETURN MEM_TBL
    IS tb MEM_TBL;
    BEGIN
        SELECT USER1_TYPE(id,pw,name,tel,addr,email,rdate)
        BULK COLLECT INTO tb
        FROM user1 WHERE id=vid;
        RETURN tb;
    END get_mem_info;
/
-- 위 구문 실행 후 회원 정보를 요청하여 출력하기
select * from table(get_mem_info('lmk'));


DROP FUNCTION user_pointup_fnc;
-- user1(회원)테이블에 기본값을 0으로 하는 컬럼 point를 추가하여라
alter table user1 add point number default 0;
alter table user1 drop column point;
-- user1(회원)테이블에 기본값을 0으로 하는 컬럼 visited을 추가하여라
alter table user1 add visited number default 0;
alter table user1 drop column visited;
-- 함수 이름 : user_pointup_fnc
-- user1(회원)테이블의 데이터 중에서 요청한 아이디에 대하여 로그인 횟수(visited)를 1씩 증가시키고 포인트(point)를 5점씩 증가 되는 연쇄동작되도록 함수를 작성하고
select * from user1;
desc user1;

CREATE OR REPLACE FUNCTION user_pointup_fnc(vid in user1.id%TYPE)
        RETURN NUMBER
    IS
        up_data number := 5;
    BEGIN
        update user1 set visited=visited+1, point=point+up_data where id=vid;
        commit;
        RETURN up_data;
    END user_pointup_fnc;
/

-- 실행하시오
variable pt number;
execute :pt := user_pointup_fnc('lmk');




DROP FUNCTION basket_ins_fnc;
-- 함수명 : basket_ins_fnc
-- basket(장바구니)에 데이터가 추가되는 함수를 생성하고
select * from basket1;
desc basket1;

CREATE OR REPLACE FUNCTION basket_ins_fnc(vid in basket1.id%TYPE, vgcode in basket1.gcode%TYPE, vamount in basket1.amount%TYPE)
        RETURN NUMBER
    IS
    data1 NUMBER := 0;
    BEGIN
        select TO_CHAR(bcode) into data1 from basket1 order by bcode desc;
        data1 := data1 + 1;
        insert into basket1 values(TO_CHAR(data1, '10000'), vid, vgcode, vamount);
        commit;
        DBMS_OUTPUT.PUT_LINE(TO_CHAR(data1, '10000') || '가 추가되었습니다.');
        RETURN data1;
    END basket_ins_fnc;
/

-- 안 됨
-- 실행하시오
--variable data1 number;
--execute :data1 := basket_ins_fnc('kbs','5072',1);
--variable cnt number;
--execute :cnt := basket_ins_fnc('jtb','8138',1);
--variable cnt number;
--execute :cnt := basket_ins_fnc('sbs','8162',1);

-- 아래와 같이 첫 번째 장바구니건은 sql문의 insert문으로 데이터를 직접 입력한 후 3건 이상 함수를 실행하여 추가하시오
--insert into basket1 values('10001','mbc','6186',1);




-- 함수 이름 : select_addr_fnc
-- user1테이블에서 addr(주소)가 입력된 값이 포함된 회원의 이름, 전화번호, 주소를 출력하는 함수를 생성하고
select * from user1;
desc user1;

CREATE OR REPLACE FUNCTION select_addr_fnc(kdata in user1.addr%TYPE)
    RETURN VARCHAR2
    IS
        vname user1.name%TYPE;
    BEGIN
        FOR i in(select * from user1 where addr like '%'||kdata||'%') LOOP
            DBMS_OUTPUT.put_line(i.name||' '||i.tel||' '||i.addr);
    END LOOP;
    RETURN vname;
END;
/

-- 실행하시오
variable vname varchar2(20);
execute :vname := select_addr_fnc('고양');




-- 함수 이름 : user_rank_fnc
-- user1테이블에서 visited 컬럼별로 회원등급을 구하여 고객아이디, 고객이름, 등급을 출력하는 함수를 IF문, 반복실행문(WHILE, LOOP, FOR)을 사용하여 작성하고
select * from user1;
desc user1;

CREATE OR REPLACE FUNCTION user_rank_fnc
RETURN number
IS
    i number := 0;
    rank varchar2(20) := '';
BEGIN
    DBMS_OUTPUT.ENABLE;
    DBMS_OUTPUT.PUT_LINE('아이디' || ' ' || '고객명' || ' ' || '등급');
    FOR r IN (SELECT id, name, visited FROM user1) LOOP
    i := i+1;
    IF(r.visited >= 10) THEN rank := '우수회원';
    ELSIF(r.visited >= 5) THEN rank := '정회원';
    ELSE rank := '준회원';
    END IF;
    DBMS_OUTPUT.PUT_LINE(r.id || ' ' || r.name || ' ' || rank);
    rank := '';
END LOOP;
RETURN i;
END;
/

-- 실행하되, 회원등급이 10회 이상 방문시 우수회원, 5회 이상 방문시 정회원, 5회 미만 방문시 준회원으로 하며, 회원등급의 컬럼은 방문횟수인 visited를 활용할 것
variable rwcnt number;
execute :rwcnt := user_rank_fnc;




DROP FUNCTION user_basket_fnc;
-- 함수 이름 : user_basket_fnc
-- 회원 아이디(id)를 입력받아 해당 장바구니의 정보를 고객명, 연락처, 상품명, 수량, 결제할금액을 출력하는 함수를 생성하고
CREATE OR REPLACE FUNCTION user_basket_fnc(vid in user1.id%TYPE)
RETURN number
IS
    i number := 0;
BEGIN
    DBMS_OUTPUT.ENABLE;
    DBMS_OUTPUT.PUT_LINE('고객명'||chr(9)||'연락처'||chr(9)||chr(9)||chr(9)||'상품명'||chr(9)||chr(9)||chr(9)||'수량'||chr(9));
    FOR r IN (SELECT user1.name as name, user1.tel as tel, goods1.gname as gname, basket1.amount as amount, (goods1.price*basket1.amount) as money FROM basket1, user1, goods1 where basket1.id=user1.id and basket1.gcode=goods1.gcode and user1.id=vid) LOOP
        i := i+1;
        DBMS_OUTPUT.PUT_LINE(r.name||chr(9)||r.tel||chr(9)||r.gname||chr(9)||chr(9)||r.amount||chr(9)||r.money);
    END LOOP;
    RETURN i;
END;
/

-- 실행하시오
variable rcnt number;
execute :rcnt := user_basket_fnc('lmk');




create table pro(tno number, pname varchar2(40), dan number); -- 상품테이블
INSERT INTO pro VALUES(100,'카스맥주',1500);
INSERT INTO pro VALUES(200,'테라맥주',1000);
INSERT INTO pro VALUES(300,'필라이트맥주',2000);
INSERT INTO pro VALUES(400,'하이트맥주',1800);
INSERT INTO pro VALUES(500,'클라우드맥주',1600);
select * from pro;
create table inventory(ino number, quant number, price number); -- 재고테이블
create table wearing(ino number, quant number, price number); -- 입고테이블
create table sales(ino number, quant number, price number); -- 판매테이블
create table return(ino number, quant number, price number); -- 반품테이블
DROP TRIGGER wearing_trigger;
-- 트리거 이름 : wearing_trigger
-- 입고(wearing)테이블에 상품을 입고시킬 때 만약 새로운 상품(insert)일 경우와 이미 있는 재고 상품(update)일 경우 분류하여 재고(inventory)테이블에 튜플을 입력하여 자동 재고처리된 결과를 확인하시오 :NEW 새로 추가(갱신)되는 데이터
CREATE OR REPLACE TRIGGER wearing_trigger
AFTER INSERT ON wearing
FOR EACH ROW
DECLARE
    v_cnt number;
BEGIN
    -- 재고테이블에서 먼저 해당 상품코드에 속하는 레코드 수 계산
    select count(*) into v_cnt from inventory where ino=:NEW.ino;
    -- 재고테이블에 없으면 새로운 레코드로 등록(insert)
    IF(v_cnt=0) THEN insert into inventory values (:NEW.ino, :NEW.quant, :NEW.price);
    -- 재고테이블에 있으면 해당 상품의 수량과 가격을 갱신(update)
    ELSE update inventory set quant=quant+:NEW.quant, price=price+:NEW.price where ino=:NEW.ino;
    END IF;
END;
/

select * from wearing;
select * from inventory;
insert into wearing values(200, 20, 2000);
insert into wearing values(200, 5, 2100);

DROP TRIGGER sales_trigger;
-- 트리거 이름 : sales_trigger
-- 판매가 되면 판매(sales)테이블에 상품이 등록된다. 그렇다면 재고(inventory)테이블에 반영되어 튜플이 변경되도록 트리거를 생성하고
CREATE OR REPLACE TRIGGER sales_trigger
AFTER INSERT ON sales
FOR EACH ROW
DECLARE
    v_cnt number;
BEGIN
    -- 해당 상품에 대한 판매 후 현재 재고량을 확인
    select quant-:NEW.quant into v_cnt from inventory where ino=:NEW.ino;
    -- 남은 재고량이 0보다 작으면, 재고 테이블에서 해당 상품 정보를 삭제
    IF(v_cnt<=0) THEN delete from inventory where ino=:NEW.ino;
    -- 남은 재고량이 있으면, 재고 테이블에서 해당 상품의 수량을 감산한다.
    ELSE update inventory set quant=quant-:NEW.quant, price=price-:NEW.price;
    END IF;
END;
/

-- 실행할 것
select * from inventory;

-- 임의의 데이터를 판매 테이블에 튜플을 입력하여 자동 재고계산된 그 결과를 확인하시오. 
insert into sales values(200, 3, 3000);
select * from inventory;

DROP TRIGGER return_trigger;
-- 트리거 이름 : return_trigger
-- 반품이 되면 판매(sales)테이블의 해당 판매 내역이 삭제된다. 그렇다면 재고(inventory)테이블에 반영되어 튜블이 변경되도록 트리거를 생성하고
CREATE OR REPLACE TRIGGER return_trigger
AFTER DELETE ON sales
REFERENCING OLD AS O NEW AS N
FOR EACH ROW
DECLARE
    v_cnt number;
BEGIN
    -- 재고테이블에서 먼저 해당 상품코드에 속하는 레코드 수 계산
    select count(*) into v_cnt from inventory where ino=:O.ino;
    -- 반품된 상품이 재고테이블에 없으면 새로운 레코드로 등록(insert)
    IF(v_cnt=0) THEN insert into inventory values (:O.ino, :O.quant, :O.price);
    -- 반품된 상품이 재고테이블에 있으면 해당 상품의 수량과 가격을 갱신(update)
    ELSE update inventory set quant=quant+:O.quant, price=price+:O.price where ino=:O.ino;
    END IF;
END;
/

-- 실행할 것
select * from inventory;

-- 임의의 데이터를 판매테이블에 튜플을 제거되어 자동 재고계산된 결과를 확인하시오
delete from sales where ino=200;
select * from inventory;


-- 트리거 이름 : rev_trigger
-- 재고를 반출하게 되면 입고(wearing)테이블의 해당 상품 내역을 제거하면 재고(inventory)테이블에 반영되어 튜플이 변경되도록 트리거를 생성하고
CREATE OR REPLACE TRIGGER rev_trigger
AFTER DELETE ON wearing
REFERENCING OLD AS O NEW AS N
FOR EACH ROW
DECLARE
    v_cnt number;
BEGIN
   -- 해당 상품에 대한 반출 후 현재 재고량을 확인
    select quant-:O.quant into v_cnt from inventory where ino=:O.ino;
    -- 남은 재고량이 0보다 작으면, 재고 테이블에서 해당 상품 정보를 삭제
    IF(v_cnt<=0) THEN delete from inventory where ino=:O.ino;
    -- 반품된 상품이 재고 테이블에 있으면, 해당 상품의 수량과 가격을 갱신(update)
    ELSE update inventory set quant=quant-:O.quant, price=price-:O.price where ino=:O.ino;
    END IF;
END;
/

-- 실행할 것
select * from inventory;

-- 임의의 데이터를 입고 테이블의 튜플을 제거하여 자동 재고계산된 결과를 확인하시오
delete from wearing where ino=200;
select * from inventory;

-- 모든 함수, 트리거, 프로시저 제거
-- DROP FUNCTION|TRIGGER|PROCEDURE  함수명|트리거명|프로시저명 
-- DROP FUNCTION|TRIGGER|PROCEDURE  함수명|트리거명|프로시저명 
-- ex1) DROP FUNCTION customer_sort -> customer_sort 함수 제거
-- ex2) DROP PROCEDURE customer_sort -> customer_sort 프로시저 제거
-- ex3) DROP TRIGGER sales_trigger -> sales_trigger 트리거 제거


create table pan(snum number, id varchar2(20), tno number, amount number, kum number); -- 판매 테이블
create table mem(id varchar2(20), name varchar2(20), point number); -- 회원 테이블