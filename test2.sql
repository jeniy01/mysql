-- 과정 정보(tbl_class) 테이블에 가변문자열 10바이트크기로 강의실(classroom)컬럼을 추가하되, 기본값은 A201로 하고,
-- 그 기본값으로 이미 추가된 레코드에 반영될 수 있도록 하시오.


-- 수강 신청 정보(tbl_member) 테이블에 컬럼 중에서 c_no(과정코드)를 cno로 컬럼명을 변경하시오.


-- 수강 신청 정보(tbl_member) 테이블에 컬럼 중에서 cno(과정코드)를 tbl_class 테이블의 c_no(과정번호)를 참조하는 외래키로 등록하시오.


-- 교사 정보(tbl_teacher) 테이블에 존재하는 계약일 컬럼을 제거하시오.


-- 게시판(tbl_board) 테이블을 복제하여 공지사항(tbl_notice) 테이블을 생성하고, 내용을 모두 삭제하시오.



-- 과정 정보(tbl_class) 테이블에 레코드를 추가하고, 게시판(tbl_board) 테이블을 삭제하시오.
-- (202203, 10004, 수원분원, 200000, 100)
-- (202203, 20003, 청주분원, 150000, 400)
-- (202203, 20004, 전주분원, 150000, 300)
-- (202203, 10005, 고양분원, 200000, 100)
-- (202203, 10006, 대구분원, 100000, 200)



-- 과정 정보(tbl_class) 테이블의 과정번호, 캠퍼스, 수강료, 교사코드, 강의실의 컬럼만 복제하여 과정 코스(tbl_course) 테이블을 만들고, 
-- 만들어진 테이블에 과정번호를 기본키로 등록하고, 교사코드는 교사 정보(tbl_teacher)의 교사코드를 참조하는 외래키로 등록하시오.



-- 교사 정보(tbl_teacher) 테이블에 (500, 전문반, 최전문, 500000, 20220105) 의 새로운 레코드를 추가하고, 
-- 과정 코스(tbl_course) 테이블에는 새로운 레코드 (20005, 서울본원, 250000, 500, A202) 을 추가하시오.



-- 과정 정보(tbl_class)를 복제하여 tbl_class_2204 테이블을 생성하고, 과정번호 10002의 레코드를 삭제하고, 
-- 과정번호 10003의 캠퍼스명을 의정부로 변경하시오.





-- 과정 코스(tbl_course) 테이블에서 모든 과정의 수강료를 20000 더 인상되도록 변경하시오. 


-- 과정 코스(tbl_course) 테이블에서 수강료가 200000~300000 인 과정을 조회하시오.
-- 과정번호        캠퍼스     교사코드



-- 과정 코스(tbl_course) 테이블에서 캠퍼스가 분원인 캠퍼스 정보를 조회하시오.
-- 과정번호        수강료     교사코드



-- 수강 신청 정보(tbl_member) 테이블에서 주소가 서울이거나 성남 또는 수원인 수강생을 조회하시오.
-- 과정코드     수강생명        전화번호        수강등급


-- 수강 신청 정보(tbl_member) 테이블에서 각 과정별 인원수를 조회하시오.
--  과정코드    수강생인원수



-- 수강 신청 정보(tbl_member) 테이블을 참고하여 수강생이 없는 과정 코스(tbl_course)를 조회하시오.
-- 과정번호     캠퍼스     수강료



-- 과정 코스(tbl_course) 테이블을 참고하여 배정되지 않은 교사 정보(tbl_teacher)를 조회하시오. 
-- 교사코드     과정명     교사명



-- 수강 신청 정보(tbl_member) 테이블을 참고하여 강의하고 있지 않는 강사 정보(tbl_teacher)를 조회하시오. 
-- 교사코드    교사명      배정금액




-- 교사 정보(tbl_teacher) 테이블과 과정 정보(tbl_class) 테이블을 참조하여 교사별 배정 내역(tbl_joint)이름의 뷰(view)를 생성하시오.
-- 교사코드     교사명     과정명     배정된캠퍼스수



-- tbl_member와 tbl_course 를 참조하여 수강 내역을 아래와 같이 검색될 수 있도록 하시오.
-- 캠퍼스      수강생명    전화번호    주소      수강등급



-- tbl_teacher와 tbl_course 를 참조하여 강사 배정 내역을 아래와 같이 검색될 수 있도록 하시오.
-- 과정번호     캠퍼스   과정명   교사명   수강료   배정금액



-- tbl_member를 기준으로 tbl_teacher, tbl_course 를 참조하여 수강현황 내역을 아래와 같이 검색될 수 있도록 하시오.
-- 수강생명     캠퍼스   과정명   교사명   강의실



-- tbl_member, tbl_teacher, tbl_course 를 참조하여 캠퍼스별 수강통계 내역을 아래와 같이 검색될 수 있도록 하시오.
--  캠퍼스     과정명     수강인원수


-- tbl_member, tbl_teacher, tbl_course 를 참조하여 교사별 통계 내역을 아래와 같이 검색될 수 있도록 하시오.
--  교사명     수강료합계


-- 과정 신청 정보(tbl_member) 테이블의 구조만 복제하여 tbl_member_2301 테이블과 tbl_member_2302 테이블을 생성하고, 아래와 지시사항과
-- 같이 작업하시오.
-- tbl_member_2301의 레코드 추가
-- 순번 	과정코드 	수강생명 	전화번호 		    주소 		    수강등록일 	수강등급
-- 1 	10001 	이자영 	01022221111 	서울시 강남구 	20230101 	일반
-- 2 	10002 	이규섭 	01011112222 	서울시 성북구 	20230102 	일반
-- 3 	10003 	이윤호 	01022223333 	성남시 분당구 	20230103 	일반
-- 4 	10004 	조태철 	01033334444 	부산시 서구 	    20230104 	일반
-- 5 	20001 	황기준 	01044445555 	광주시 남구 	    20230105 	VIP
-- 6 	20002 	전소영 	01055556666 	대전시 유성구 	20230106 	VIP
-- 7 	10001 	정혜진 	01044445555 	대구시 달성군 	20230107 	일반
-- 8    10002   허무해   01088889999     천안시 서북구 	20230108 	일반
-- 9    10003   김태종   01077771111     수원시 장안구 	20230109 	일반

-- tbl_member_2302의 레코드 추가
-- 순번 	과정코드 	수강생명 	전화번호 		    주소 		    수강등록일 	수강등급
-- 1 	10001 	이자영 	01022221111 	서울시 강남구 	20230201 	일반
-- 2 	10002 	이규섭 	01011112222 	서울시 성북구 	20230202 	일반
-- 3 	10003 	이윤호 	01022223333 	성남시 분당구 	20230203 	일반
-- 4 	10004 	조태철 	01033334444 	부산시 서구 	    20230204 	일반
-- 5 	20001 	백석준 	01044445555 	광주시 북구 	    20230205 	VIP
-- 6 	20002 	전소영 	01055556666 	대전시 유성구 	20230206 	VIP
-- 7 	10001 	장사진 	01055559999 	대구시 달성군 	20230207 	일반
-- 8    10002   김사부   01088889999     고양시 일산동구 	20230208 	일반
-- 9    10003   김태종   01077771111     수원시 장안구 	20230209 	일반


-- tbl_member_2301과 tbl_member_2302의 합집합을 구하여 member_total 이름으로 뷰(view)를 생성하시오.


-- tbl_member_2301과 tbl_member_2302의 교집합을 구하여 member_legacy 이름으로 뷰(view)를 생성하시오.


-- tbl_member_2301과 tbl_member_2302의 차집합을 구하여 member_secession 이름으로 뷰(view)를 생성하시오.


-- tbl_member_2302과 tbl_member_2301의 차집합을 구하여 member_new 이름으로 뷰(view)를 생성하시오.









