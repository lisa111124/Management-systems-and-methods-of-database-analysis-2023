
CREATE DATABASE STUDENTS; -- Created database
GO

USE STUDENTS; -- Moved to DataBase 
GO

CREATE TABLE PersonalInfo (

	StudentID INT PRIMARY KEY,

	FirstName NVARCHAR(50),

	LastName NVARCHAR(50),

	DateOfBirth DATE

	); -- Created a new Table PersonalInfo

CREATE TABLE AcademicInfo (

	RecordID INT PRIMARY KEY,

	StudentID INT FOREIGN KEY REFERENCES PersonalInfo(StudentID),

	Faculty NVARCHAR(100),

	Curator NVARCHAR(100),

	EnrollmentYear INT

	); -- Created a new Table AcademicInfo

CREATE TABLE ContactInfo (

	ContactID INT PRIMARY KEY,

	StudentID INT FOREIGN KEY REFERENCES PersonalInfo(StudentID),

	Email NVARCHAR(100),

	PhoneNumber NVARCHAR(15)

	); -- Created a new Table ContactInfo

ALTER TABLE ContactInfo ADD Address NVARCHAR(200); -- Added Address column in ContactInfo table

ALTER TABLE ContactInfo DROP COLUMN PhoneNumber; -- Deleted PhoneNumber column in ContactInfo table

EXEC sp_rename 'ContactInfo.Email', 'EmailAddress', 'COLUMN'; -- Renamed Email column in ContactInfo table

ALTER TABLE AcademicInfo ALTER COLUMN Faculty NVARCHAR(150); -- Changed type of Faculty column in AcademicInfo table

CREATE TABLE Extracurricular (

	ActivityID INT PRIMARY KEY,

	StudentID INT FOREIGN KEY REFERENCES PersonalInfo(StudentID),

	ActivityName NVARCHAR(100),

	JoinDate DATE

	); -- Created a new Table Extracurricular

DROP TABLE Extracurricular; -- Deleted Table Extracurricular

CREATE DATABASE TEACHER; -- Created DataBase TEACHER
GO

DROP DATABASE TEACHER; -- Dleted DataBase TEACHER
GO

USE STUDENTS; -- Swithed to STUDENTS

INSERT INTO PersonalInfo ([StudentID], [FirstName], [LastName], [DateOfBirth])

VALUES (1, 'Олександр', 'Петров', '2000-05-15'),
       (2, 'Марія', 'Іваненко', '2001-03-22'),
       (3, 'Василь', 'Коваленко', '1999-10-10'); -- Inserted values to PersonalInfo table