CREATE DATABASE GitHub; 

USE [GitHub]; 


GO 

CREATE SCHEMA BOJKO;   -- Ваше прізвище  

GO
 

-- Створіть просту таблицю для демонстрації типів даних 

CREATE TABLE BOJKO.DATATYPES ( 

       ID  BIGINT, -- Унікальний ідентифікатор сутності 

   AGE TINYINT -- Кількість років 

); 


INSERT INTO BOJKO.DATATYPES(ID, AGE) 

VALUES(10000, 34); 

 

INSERT INTO BOJKO.DATATYPES(ID, AGE) 

VALUES(10001, 32); 

 

-- Неявне перетворення типів даних 

INSERT INTO BOJKO.DATATYPES(ID, AGE) 

VALUES('10002', 32); 

 

-- Неявне перетворення типів даних 

INSERT INTO BOJKO.DATATYPES(ID, AGE) 

VALUES('10003', '35'); 

 

-- Неявне перетворення типів даних 

INSERT INTO BOJKO.DATATYPES(ID, AGE) 

VALUES('19700101', '35'); 

 

-- Неявне перетворення типу даних НЕ ПРАЦЮЄ! 

INSERT INTO BOJKO.DATATYPES(ID, AGE) 

VALUES('19700101', '35'); 


-- Давайте подивимося на дані 

SELECT *  

  FROM BOJKO.DATATYPES; 