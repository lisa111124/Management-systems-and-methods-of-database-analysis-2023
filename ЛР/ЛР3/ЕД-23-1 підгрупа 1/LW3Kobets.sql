/*
  Створення бази данихт "STUDENTS"
*/

CREATE DATABASE STUDENTS;

/*
Перехід до бази даних "STUDENTS"
*/

USE STUDENTS;

/*
Створення таблиці "PersonalInfo"
*/

CREATE TABLE PersonalInfo (

StudentID INT PRIMARY KEY,

FirstName NVARCHAR(50),

LastName NVARCHAR(50),

DateOfBirth DATE

);

/*
Створення таблиці "AcademicInfo"
*/

CREATE TABLE AcademicInfo (

RecordID INT PRIMARY KEY,

StudentID INT FOREIGN KEY REFERENCES PersonalInfo(StudentID),

Faculty NVARCHAR(100),

Curator NVARCHAR(100),

EnrollmentYear INT

);

/*
Створення таблиці "ContactInfo"
*/

CREATE TABLE ContactInfo (

ContactID INT PRIMARY KEY,

StudentID INT FOREIGN KEY REFERENCES PersonalInfo(StudentID),

Email NVARCHAR(100),

PhoneNumber NVARCHAR(15)

);

/*
  Додавання стовпця "Address"
*/

ALTER TABLE ContactInfo ADD Address NVARCHAR(200);

/*
  Видалення стовпця "PhoneNumber"
*/

ALTER TABLE ContactInfo DROP COLUMN PhoneNumber;

/*
  Заміна ім'я стовбця "Email" на "EmailAddress"
*/

EXEC sp_rename 'ContactInfo.Email', 'EmailAddress', 'COLUMN';

/*
  Заміна типу даних для стовбця "Faculty" у таблиці "AcademicInfo" на NVARCHAR(150):
*/

ALTER TABLE AcademicInfo

ALTER COLUMN Faculty NVARCHAR(150)


/*
  Додавання нової таблиці "Extracurricular"
*/

CREATE TABLE Extracurricular (

ActivityID INT PRIMARY KEY,

StudentID INT FOREIGN KEY REFERENCES PersonalInfo(StudentID),

ActivityName NVARCHAR(100),

JoinDate DATE

);

/*
  Видалення таблиці "Extracurricular"
*/

DROP TABLE Extracurricular;

/*
Додавання таблиці "TEACHER"
*/

CREATE DATABASE TEACHER;

/*
Видалення таблиці "TEACHER"
*/
DROP DATABASE TEACHER;

/*
Переключення на базу даних "STUDENTS"
*/

USE STUDENTS;

/*
Додавання трьох рядів даних до таблиці "PersonalInfo"
*/

INSERT INTO PersonalInfo (StudentID, FirstName, LastName, DateOfBirth)

VALUES

(1, 'Олександр', 'Петров', '2000-05-15'),

(2, 'Марія', 'Іваненко', '2001-03-22'),

(3, 'Василь', 'Коваленко', '1999-10-10');
