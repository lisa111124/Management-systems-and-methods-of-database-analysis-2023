USE [LW1];
GO

CREATE SCHEMA ZHUR; -- Ваше прізвище

GO
-- Create a simple table to demonstrate data types

CREATE TABLE ZHUR.DATATYPES (

ID BIGINT, -- Unique identifier of an entity

AGE TINYINT -- Number of years
INSERT INTO ZHUR.DATATYPES(ID, AGE)

VALUES(10000, 34);

INSERT INTO ZHUR.DATATYPES(ID, AGE)

VALUES(10001, 32);

-- Implicit data type conversion

INSERT INTO ZHUR.DATATYPES(ID, AGE)

VALUES('10002', 32);

-- Implicit data type conversion

INSERT INTO ZHUR.DATATYPES(ID, AGE)

VALUES('10003', '35');

-- Implicit data type conversion

INSERT INTO ZHUR.DATATYPES(ID, AGE)

VALUES('19700101', '35');

-- Implicit data type conversion IS NOT WORKING!

INSERT INTO ZHUR.DATATYPES(ID, AGE)

VALUES('1970-01-01', '35');
-- Let's take a look on the data

SELECT *

FROM ZHUR.DATATYPES;
