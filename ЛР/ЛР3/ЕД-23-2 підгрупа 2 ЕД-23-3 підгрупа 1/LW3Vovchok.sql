/* створення нової бази даних*/

CREATE DATABASE "STUDENTS";
GO

USE STUDENTS;
GO

/*створення наблиць для нової бази даних*/

CREATE TABLE PersonalInfo (
StudentID INT PRIMARY KEY,
FirstName NVARCHAR (50),
LastName NVARCHAR (50),
DateOfBirth DATE 
);

CREATE TABLE AcademicInfo (
RecordID INT PRIMARY KEY,
Student INT FOREIGN KEY REFERENCES PersonalInfo (StudentID),
Faculty NVARCHAR (100),
Curator NVARCHAR (100),
EnrollmentYear INT
);

CREATE TABLE ContactInfo (
ContactID INT PRIMARY KEY,
StudentID INT FOREIGN KEY REFERENCES PersonalInfo (StudentID),
Email NVARCHAR (100),
PhoneNumber NVARCHAR (15)
);

/* проводимо операцію з таблицею 'ContactInfo'*/

--Додаємо стовбець 
ALTER TABLE ContactInfo ADD Adress NVARCHAR(200);

--Видаляємо стовбець
ALTER TABLE ContactInfo DROP COLUMN PhoneNumber;

--Змінює назву стовпця на іншу
EXEC sp_rename 'ContactInfo.Email', 'EmailAddress', 'COLUMN';

/*Змінемо тип даних для стовпця*/
ALTER TABLE AcademicInfo
ALTER COLUMN Faculty NVARCHAR(150);

/*Створюємо нову таблицю, перевіряємо її стоврення та видаляємо*/
CREATE TABLE Extracurricular (
ActivityID INT PRIMARY KEY,
StudentID INT FOREIGN KEY REFERENCES PersonalInfo(StudentID),
ActivityName NVARCHAR(100),
JoinDate DATE
);

DROP TABLE Extracurricular;

/*Створюємо нову базу даних, перевіряємо її та видаляємо*/
CREATE DATABASE TEACHER;
GO

DROP DATABASE TEACHER;
GO

USE STUDENTS;

/*Додаємо рядки у створену таблицю 'PersonalInfo'*/
INSERT INTO PersonalInfo ([StudentID], [FirstName], [LastName], [DateOfBirth])

VALUES (1, 'Олександр', 'Петров', '2000-05-15');
       (2, 'Марія', 'Іваненко', '2001-03-22'),
       (3, 'Василь', 'Коваленко', '1999-10-10');


	  