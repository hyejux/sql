-- DDL ���� Ʈ������� �����ϴ�
--CREATE ALTR DROP 




/*
����1.

������ ���� ���̺��� �����ϰ� �����͸� insert�غ�����.
���̺� ���������� �Ʒ��� �����ϴ�. 
����) M_NAME �� ���������� 20byte, �ΰ��� ������� ����
����) M_NUM �� ������ 5�ڸ�, PRIMARY KEY �̸�(mem_memnum_pk) 
����) REG_DATE �� ��¥��, �ΰ��� ������� ����, UNIQUE KEY �̸�:(mem_regdate_uk)
����) GENDER ���������� 1byte, CHECK���� (M, F)
����) LOCA ������ 4�ڸ�, FOREIGN KEY ? ���� locations���̺�(location_id) �̸�:(mem_loca_loc_locid_fk)

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
����2.

���� �뿩 �̷� ���̺��� �����Ϸ� �մϴ�.
���� �뿩 �̷� ���̺���
�뿩��ȣ(����) PK, ���⵵����ȣ(����), �뿩��(��¥), �ݳ���(��¥), �ݳ�����(Y/N)
�� �����ϴ�.
������ ���̺��� ������ ������.
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

