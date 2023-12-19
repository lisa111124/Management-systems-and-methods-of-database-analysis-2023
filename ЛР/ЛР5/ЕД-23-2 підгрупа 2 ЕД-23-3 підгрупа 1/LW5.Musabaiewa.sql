
CREATE DATABASE UniversityDB;
GO
USE UniversityDB;
GO

CREATE TABLE Departments (

DepartmentID INT NOT NULL,

DepartmentName VARCHAR(100)

);
GO

CREATE TABLE Professors (

ProfessorID INT NOT NULL,

FirstName VARCHAR(50),

LastName VARCHAR(50),

Age TINYINT,

DepartmentID INT,

Email VARCHAR(100)

);
GO

ALTER TABLE Departments ADD CONSTRAINT PK_Department PRIMARY KEY (DepartmentID);
GO

ALTER TABLE Professors ADD CONSTRAINT PK_Professor PRIMARY KEY (ProfessorID);
GO

ALTER TABLE Professors ADD CONSTRAINT UQ_Professor_Email UNIQUE (Email);
GO

ALTER TABLE Professors ADD CONSTRAINT FK_Professor_Department FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID);
GO

ALTER TABLE Professors ADD CONSTRAINT CK_Age CHECK (Age > = 20);
GO

ALTER TABLE Professors ALTER COLUMN FirstName VARCHAR(50) NOT NULL;
GO
ALTER TABLE Professors ALTER COLUMN LastName VARCHAR(50) NOT NULL;
GO
ALTER TABLE Departments ADD CONSTRAINT DF_DepartmentName DEFAULT 'General' FOR DepartmentName;
GO

INSERT INTO Departments (DepartmentID) VALUES (1); -- Застосується DEFAULT значення 'General'

INSERT INTO Professors (ProfessorID, FirstName, LastName, Age, DepartmentID, Email)

VALUES (1, 'John', 'Smith', 57, 1, 'john.smith@university.com');

INSERT INTO Professors (ProfessorID, FirstName, LastName, DepartmentID, Email)

VALUES (2, 'Jane', 'Doe', 1, 35, 'john.smith@university.com'); -- Це викличе помилку через UNIQUE обмеження

INSERT INTO Professors (ProfessorID, FirstName, LastName, DepartmentID, Email)

VALUES (3, 'Bob', 'Doe', 1, 17, 'bob@university.com'); -- Це викличе помилку через CHECK обмеження

GO

DROP TABLE Professors;
GO
DROP TABLE Departments;
GO
USE WebStor;
GO
DROP DATABASE UniversityDB;
GO


--Завдання №2


CREATE DATABASE CompanyDB;
GO
USE CompanyDB;
GO
CREATE TABLE Employees (

EmployeeID INT PRIMARY KEY,

FirstName VARCHAR(50) NOT NULL,

LastName VARCHAR(50) NOT NULL,

Email VARCHAR(100) UNIQUE,

Position VARCHAR(50) DEFAULT 'Junior Developer'

);
GO

CREATE TABLE Departments (

DepartmentID INT PRIMARY KEY,

DepartmentName VARCHAR(100) NOT NULL CHECK (DepartmentName <> ''),

Budget DECIMAL(10, 2) CHECK (Budget > 0),

DefaultRoomNumber INT DEFAULT 101

);
GO

CREATE TABLE Assignments (

AssignmentID INT PRIMARY KEY,

EmployeeID INT NOT NULL,

DepartmentID INT NOT NULL,

AssignmentDate DATE DEFAULT GETDATE(),

FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID),

FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)

);
GO

INSERT INTO Departments (DepartmentID, DepartmentName, Budget)

VALUES (1, 'Human Resources', 50000);

INSERT INTO Employees (EmployeeID, FirstName, LastName, Email)

VALUES (1, 'John', 'Smith', 'john.smith@company.com');

INSERT INTO Assignments (AssignmentID, EmployeeID, DepartmentID)

VALUES (1, 1, 1);

GO

INSERT INTO Assignments (AssignmentID, EmployeeID, DepartmentID)

VALUES (2, 999, 1); -- Це викличе помилку через FOREIGN KEY обмеження
GO

DROP TABLE Assignments;
GO
DROP TABLE Employees;
GO
DROP TABLE Departments;
GO

USE WebStor;
GO
DROP DATABASE CompanyDB;
GO