CREATE DATABASE pivo;




USE pivo; 

GO 

CREATE SCHEMA KIIKO;   -- Ваше прізвище  

GO 

CREATE TABLE KIIKO.DATATYPES ( 

       ID  BIGINT, -- Unique identifier of an entity 

   AGE TINYINT -- Number of years 

); 


INSERT INTO KIIKO.DATATYPES(ID, AGE) 

VALUES(10000, 34); 

 

INSERT INTO KIIKO.DATATYPES(ID, AGE) 

VALUES(10001, 32); 

 

-- Implicit data type conversion 

INSERT INTO KIIKO.DATATYPES(ID, AGE) 

VALUES('10002', 32); 

 

-- Implicit data type conversion 

INSERT INTO KIIKO.DATATYPES(ID, AGE) 

VALUES('10003', '35'); 

 

-- Implicit data type conversion 

INSERT INTO KIIKO.DATATYPES(ID, AGE) 

VALUES('19700101', '35'); 

 

-- Implicit data type conversion IS NOT WORKING! 

INSERT INTO KIIKO.DATATYPES(ID, AGE) 

VALUES('19700101', '35'); 


SELECT *  

  FROM KIIKO.DATATYPES; 