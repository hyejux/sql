CREATE TABLE depts (
department_id NUMBER(3) NOT NULL,
department_name varchar2(10) NOT NULL,
manager_id number(3) NULL,
location_id number(4) NOT NULL);

ROLLBACK;

INSERT INTO depts values(280,'����',NULL,1800);
INSERT INTO depts values(290,'ȸ���',NULL,1800);
INSERT INTO depts values(300,'����',301,1800);
INSERT INTO depts values(310,'�λ�',302,1800);
INSERT INTO depts values(320,'����',303,1700);


SELECT * FROM DEPTS;
COMMIT;

DELETE FROM DEPTS WHERE MANAGER_ID = '301' AND department_name='����';

--------------------- 2

UPDATE DEPTS SET

