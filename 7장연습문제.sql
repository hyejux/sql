CREATE TABLE depts (
department_id NUMBER(3) NOT NULL,
department_name varchar2(10) NOT NULL,
manager_id number(3) NULL,
location_id number(4) NOT NULL);

ROLLBACK;

INSERT INTO depts values(280,'개발',NULL,1800);
INSERT INTO depts values(290,'회계부',NULL,1800);
INSERT INTO depts values(300,'재정',301,1800);
INSERT INTO depts values(310,'인사',302,1800);
INSERT INTO depts values(320,'영업',303,1700);


SELECT * FROM DEPTS;
COMMIT;

DELETE FROM DEPTS WHERE MANAGER_ID = '301' AND department_name='개발';

--------------------- 2

UPDATE DEPTS SET

