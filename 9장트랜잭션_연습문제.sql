-- DDL 문장 트랜잭션이 없습니당
--CREATE ALTR DROP 




/*
문제1.

다음과 같은 테이블을 생성하고 데이터를 insert해보세요.
테이블 제약조건은 아래와 같습니다. 
조건) M_NAME 는 가변문자형 20byte, 널값을 허용하지 않음
조건) M_NUM 은 숫자형 5자리, PRIMARY KEY 이름(mem_memnum_pk) 
조건) REG_DATE 는 날짜형, 널값을 허용하지 않음, UNIQUE KEY 이름:(mem_regdate_uk)
조건) GENDER 고정문자형 1byte, CHECK제약 (M, F)
조건) LOCA 숫자형 4자리, FOREIGN KEY ? 참조 locations테이블(location_id) 이름:(mem_loca_loc_locid_fk)

*/


CREATE TABLE tmps (
m_name VARCHAR2(20) constraint TMPS_TMP_NAME_NN NOT NULL,
m_num NUMBER(5) constraint TMPS_TMP_NO_PK PRIMARY KEY,
reg_date DATE   constraint TMPS_TMP_DATE NOT NULL UNIQUE ,
gender CHAR(1) constraint TMPS_TMP_CHECK_CK check (gender IN ('M','F')),
loca NUMBER(4) constraint TMPS_TMP_LOCA_FK
REFERENCES locations (location_id));

DROP TABLE TMPS;
SELECT * FROM tmps;

INSERT INTO TMPS VALUES('AAA',1,'2018-07-01','M',1800);
INSERT INTO TMPS VALUES('BBB',2,'2018-07-02','F',1900);
INSERT INTO TMPS VALUES('CCC',3,'2018-07-03','M',2000);
INSERT INTO TMPS VALUES('DDD',14,SYSDATE,'M',2000);

------------------------------------------------

/*
문제2.

도서 대여 이력 테이블을 생성하려 합니다.
도서 대여 이력 테이블은
대여번호(숫자) PK, 대출도서번호(문자), 대여일(날짜), 반납일(날짜), 반납여부(Y/N)
를 가집니다.
적절한 테이블을 생성해 보세요.
*/
--------------------------------


CREATE TABLE BOOKS (
B_ID  NUMBER(5) constraint BOOKS_BOOK_ID_PK PRIMARY KEY,
B_NUM VARCHAR2(20) constraint BOOKS_BOOK_NUM_NN NOT NULL,
B_DATE DATE  constraint BOOKS_BOOK_DATE_NN NOT NULL,
B_REDATE DATE constraint  BOOKS_BOOK_REDATE_NN NOT NULL,
B_RETRUN  CHAR(1) constraint BOOKS_BOOK_RETRUN_CK check (B_RETRUN IN ('Y','N'))
);

SELECT * FROM BOOKS;

