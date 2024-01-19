--Створюємо базу даних 
CREATE DATABASE STUDENTS
--Переходимо до бази даних "STUDENTS"
USE STUDENTS




--СТВОРЕННЯ ТАБЛИЦЬ

--Створюємо таблицю "PersonalInfo
CREATE TABLE PersonalInfo (

StudentID INT PRIMARY KEY,

FirstName NVARCHAR(50),

LastName NVARCHAR(50),

DateOfBirth DATE

);



--Створюємо таблицю "AcademicInfo"
CREATE TABLE AcademicInfo (

RecordID INT PRIMARY KEY,

StudentID INT FOREIGN KEY REFERENCES PersonalInfo(StudentID),

Faculty NVARCHAR(100),

Curator NVARCHAR(100),

EnrollmentYear INT

);



--Створюємо таблицю "ContactInfo"
CREATE TABLE ContactInfo (

ContactID INT PRIMARY KEY,

StudentID INT FOREIGN KEY REFERENCES PersonalInfo(StudentID),

Email NVARCHAR(100),

PhoneNumber NVARCHAR(15)

);


--Операції зі структурою таблиці "ContactInfo":
--Додаємо стовбець "Address"
ALTER TABLE ContactInfo ADD Address NVARCHAR(200);

--Видаляємо стовбець "PhoneNumber"
ALTER TABLE ContactInfo DROP COLUMN PhoneNumber;


--Змінюємо ім'я стовбця "Email" на "EmailAddress"
EXEC sp_rename 'ContactInfo.Email', 'EmailAddress', 'COLUMN';



--Змінюємо тип даних для стовбця "Faculty" у таблиці "AcademicInfo" на NVARCHAR(150):
ALTER TABLE AcademicInfo
ALTER COLUMN Faculty NVARCHAR(150);



--Додаємо нову таблицю "Extracurricular"
CREATE TABLE Extracurricular (

ActivityID INT PRIMARY KEY,

StudentID INT FOREIGN KEY REFERENCES PersonalInfo(StudentID),

ActivityName NVARCHAR(100),

JoinDate DATE

);



--Після перевірки того, що таблиця була створена правильно, видаляємо її:
DROP TABLE Extracurricular;

--Створення бази даних "TEACHER"
CREATE DATABASE TEACHER;
--Після перевірки видаляємо базу даних
DROP DATABASE TEACHER;

--Переходимо на потрібну базу даних
USE STUDENTS;

--Додаємо три рядки даних до таблиці "PersonalInfo"
INSERT INTO PersonalInfo (StudentID, FirstName, LastName, DateOfBirth)

VALUES

(1, 'Олександр', 'Петров', '2000-05-15'),

(2, 'Марія', 'Іваненко', '2001-03-22'),

(3, 'Василь', 'Коваленко', '1999-10-10');


