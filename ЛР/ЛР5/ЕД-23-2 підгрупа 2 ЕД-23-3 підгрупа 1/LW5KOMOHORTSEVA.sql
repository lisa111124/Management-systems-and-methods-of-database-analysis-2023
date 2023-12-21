
--Створюємо нову базу даних--
CREATE DATABASE UniversityDB;

USE UniversityDB;
Go

--Створюємо таблиці без обмежень--
CREATE TABLE Departments (
 DepartmentID INT NOT NULL,
 DepartmentName VARCHAR(100)
);

CREATE TABLE Professors (
 ProfessorID INT NOT NULL,
 FirstName VARCHAR(50),
 LastName VARCHAR(50),
 Age TINYINT,
 DepartmentID INT,
 Email VARCHAR(100)
);

--Додаємо обмеження PRIMARY KEY до "Departments" та "Professors"--
ALTER TABLE Departments ADD CONSTRAINT PK_Department PRIMARY KEY (DepartmentID);
ALTER TABLE Professors ADD CONSTRAINT PK_Professor PRIMARY KEY (ProfessorID);

--Додаємо обмеження UNIQUE на "Email" у таблиці "Professors"
ALTER TABLE Professors ADD CONSTRAINT UQ_Professor_Email UNIQUE (Email);

--Додаємо обмеження FOREIGN KEY до "Professors", щоб пов'язати "DepartmentID" з "Departments"
ALTER TABLE Professors ADD CONSTRAINT FK_Professor_Department 
FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID);

--Додаємо CHECK обмеження на "Age" в "Professors", щоб значення віку не було менше 20
ALTER TABLE Professors ADD CONSTRAINT CK_Age CHECK (Age > = 20);

--Додамо NOT NULL обмеження на "FirstName" і "LastName" в "Professors"
ALTER TABLE Professors ALTER COLUMN FirstName VARCHAR(50) NOT NULL;
ALTER TABLE Professors ALTER COLUMN LastName VARCHAR(50) NOT NULL;

--Додаємо DEFAULT значення для "DepartmentName" в "Departments"
ALTER TABLE Departments ADD CONSTRAINT DF_DepartmentName DEFAULT 'General' FOR DepartmentName;

--Вводимо дані до таблиць--
INSERT INTO Departments (DepartmentID) VALUES (1); -- Застосується DEFAULT значення 'General'
INSERT INTO Professors (ProfessorID, FirstName, LastName, Age, DepartmentID, Email)
VALUES (1, 'John', 'Smith', 57, 1, 'john.smith@university.com');

INSERT INTO Professors (ProfessorID, FirstName, LastName, DepartmentID, Email)
VALUES (2, 'Jane', 'Doe', 1, 35, 'john.smith@university.com'); -- Це викликало помилку через UNIQUE обмеження

INSERT INTO Professors (ProfessorID, FirstName, LastName, DepartmentID, Email)
VALUES (3, 'Bob', 'Doe', 1, 17, 'bob@university.com'); -- Це викликало помилку через CHECK обмеження

--Видаляємо таблиці "Professors" та "Departments"
DROP TABLE Professors;
DROP TABLE Departments;

--Видаляємо базу даних "UniversityDB"
DROP DATABASE UniversityDB;


--Блок 2--
--Створюємо нову базу даних--
CREATE DATABASE CompanyDB;

USE CompanyDB;
Go

--Створюємо таблиці для нової бази даних з обмеженнями--
CREATE TABLE Employees (
 EmployeeID INT PRIMARY KEY,
 FirstName VARCHAR(50) NOT NULL,
 LastName VARCHAR(50) NOT NULL,
 Email VARCHAR(100) UNIQUE,
 Position VARCHAR(50) DEFAULT 'Junior Developer'
);

CREATE TABLE Departments (
 DepartmentID INT PRIMARY KEY,
 DepartmentName VARCHAR(100) NOT NULL CHECK (DepartmentName <> ''),
 Budget DECIMAL(10, 2) CHECK (Budget > 0),
 DefaultRoomNumber INT DEFAULT 101
);

CREATE TABLE Assignments (
 AssignmentID INT PRIMARY KEY,
 EmployeeID INT NOT NULL,
 DepartmentID INT NOT NULL,
 AssignmentDate DATE DEFAULT GETDATE(),
 FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID),
 FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

-- Вводимо дані у створеня таблиці
INSERT INTO Departments (DepartmentID, DepartmentName, Budget)
VALUES (1, 'Human Resources', 50000);

INSERT INTO Employees (EmployeeID, FirstName, LastName, Email)
VALUES (1, 'John', 'Smith', 'john.smith@company.com');

INSERT INTO Assignments (AssignmentID, EmployeeID, DepartmentID)
VALUES (1, 1, 1);

--Вставимо запис до таблиці, щоб перевірити FOREIGN KEY обмеження.
INSERT INTO Assignments (AssignmentID, EmployeeID, DepartmentID)
VALUES (2, 999, 1); -- Це викликало помилку через FOREIGN KEY обмеження

-- Видаляємо таблиці "Assignments", "Employees" та "Departments"
DROP TABLE Assignments;
DROP TABLE Employees;
DROP TABLE Departments;

-- Видаляємо базу даних "CompanyDB"
DROP DATABASE CompanyDB;