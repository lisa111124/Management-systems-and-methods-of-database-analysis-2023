--ЛР3 Типи даних;

CREATE DATABASE Students;
/*
Створила нову базу даних "Students";
*/

USE Students;
/*
Перейшла до створеної бази даних;
*/

CREATE TABLE PersonalInfo (
StudentID INT PRIMARY KEY,
FirstName NVARCHAR(50),
LastName NVARCHAR(50),
DataOfBirth DATE 
);
/*
Створила таблицю "PersonalInfo";
*/

CREATE TABLE AcademicInfo (
RecordID INT PRIMARY KEY,
StudentID INT FOREIGN KEY REFERENCES
PersonalInfo(StudentID),
Faculty NVARCHAR(100),
Curator NVARCHAR(100),
EnrollmentYear INT
);
/*
Створила таблцию "AcademicInfo";
*/

CREATE TABLE ContactInfo (
ContactID INT PRIMARY KEY,
StudentID INT FOREIGN KEY REFERENCES
PersonalInfo(StudentID),
Email NVARCHAR(100),
PhoneNumber NVARCHAR(15)
);
/*
Створила таблицю "ContactInfo";
*/

ALTER TABLE ContactInfo ADD Address NVARCHAR(200);
/*
Додала стовбець "Address" до таблиці "ContactInfo";
*/

ALTER TABLE ContactInfo DROP COLUMN PhoneNumber;
/*
Видалила стовбець "PhoneNumber" з таблиці "ContactInfo";
*/

EXEC sp_rename 'ContactInfo.Email',
'EmailAddress', 'COLUMN';
/*
Змінила им'я стовбця "Email" на "EmailAddress";
*/

ALTER TABLE AcademicInfo
ALTER COLUMN Faculty NVARCHAR(150);
/*
Змінила тип даних для стовбця "Faculty" у таблиці "AcademicInfo"
на NVARCHAR(150);
*/

CREATE TABLE Extracurricular (
ActivityID INT PRIMARY KEY,
StudentID INT FOREIGN KEY REFERENCES
PersonalInfo(StudentID),
ActivityName NVARCHAR(100),
JoinDate DATE
);
/*
Створила нову таблицю "Extracurricular";
*/

DROP TABLE Extracurricular;
/*
Видалила таблицю "Extracurricular";
*/

CREATE DATABASE Teacher;
/*
Створила нову базу даних "Teacher";
*/

DROP DATABASE Teacher; 
/*
Видалила базу даних "Teacher";
*/

USE Students;
/*
Переключилась на потрібну базу даних "Students";
*/

INSERT INTO PersonalInfo (StudentID, FirstName,
LastName, DataOfBirth)
VALUES 
(1, 'Олександр', 'Петров', '2000-05-15'),
(2, 'Марія', 'Іваненко', '2001-03-22'),
(3, 'Василь', 'Коваленко', '1999-10-10');
/*
Додала три рядки даних до таблиці "PersonalInfo"; 
*/