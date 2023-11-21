CREATE DATABASE STUDENTS;--Створення бази даних "STUDENTS"
Go

USE STUDENTS;--Перейдіть до бази даних "STUDENTS"
Go

-- a. Створіть таблицю "PersonalInfo:
CREATE TABLE PersonalInfo (

StudentID INT PRIMARY KEY,

FirstName NVARCHAR(50),

LastName NVARCHAR(50),

DateOfBirth DATE

);
Go

-- b. Створіть таблицю "AcademicInfo":
CREATE TABLE AcademicInfo (

RecordID INT PRIMARY KEY,

StudentID INT FOREIGN KEY REFERENCES PersonalInfo(StudentID),

Faculty NVARCHAR(100),

Curator NVARCHAR(100),

EnrollmentYear INT

);
Go

-- c. Створіть таблицю "ContactInfo":
CREATE TABLE ContactInfo (

ContactID INT PRIMARY KEY,

StudentID INT FOREIGN KEY REFERENCES PersonalInfo(StudentID),

Email NVARCHAR(100),

PhoneNumber NVARCHAR(15)

);
Go
-- Операції зі структурою таблиці "ContactInfo"
-- a. Додайте стовбець "Address":
ALTER TABLE ContactInfo ADD Address NVARCHAR(200);
Go

-- b. Видаліть стовбець "PhoneNumber":
ALTER TABLE ContactInfo DROP COLUMN PhoneNumber;
Go

-- c. Змініть ім'я стовбця "Email" на "EmailAddress":
EXEC sp_rename 'ContactInfo.Email', 'EmailAddress', 'COLUMN';
Go

-- Змінення типу даних стовбця:

-- Змініть тип даних для стовбця "Faculty" у таблиці "AcademicInfo" на NVARCHAR(150):
ALTER TABLE AcademicInfo
ALTER COLUMN Faculty NVARCHAR(150);
Go

-- Додайте нову таблицю "Extracurricular":
CREATE TABLE Extracurricular (

ActivityID INT PRIMARY KEY,

StudentID INT FOREIGN KEY REFERENCES PersonalInfo(StudentID),

ActivityName NVARCHAR(100),

JoinDate DATE

);
Go

-- Після перевірки того, що таблиця була створена правильно, видаліть її:
DROP TABLE Extracurricular;
Go

-- Створення бази даних "TEACHER":
CREATE DATABASE TEACHER;
Go

--Після перевірки видаліть базу даних:
DROP DATABASE TEACHER;
Go

-- Переключення на потрібну базу даних
USE STUDENTS;
Go

-- Додати три рядки даних до таблиці "PersonalInfo"
INSERT INTO PersonalInfo (StudentID, FirstName, LastName, DateOfBirth)

VALUES

(1, 'Олександр', 'Петров', '2000-05-15'),

(2, 'Марія', 'Іваненко', '2001-03-22'),

(3, 'Василь', 'Коваленко', '1999-10-10');
Go
