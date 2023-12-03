--Block 1

CREATE DATABASE UniversityDB;
Go
USE UniversityDB;

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

ALTER TABLE Departments ADD CONSTRAINT PK_Department PRIMARY KEY (DepartmentID);

ALTER TABLE Professors ADD CONSTRAINT PK_Professor PRIMARY KEY (ProfessorID);

ALTER TABLE Professors ADD CONSTRAINT UQ_Professor_Email UNIQUE (Email);

ALTER TABLE Professors ADD CONSTRAINT FK_Professor_Department FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID);

ALTER TABLE Professors ADD CONSTRAINT CK_Age CHECK (Age > = 20);

ALTER TABLE Professors ALTER COLUMN FirstName VARCHAR(50) NOT NULL;

ALTER TABLE Professors ALTER COLUMN LastName VARCHAR(50) NOT NULL;

ALTER TABLE Departments ADD CONSTRAINT DF_DepartmentName DEFAULT 'General' FOR DepartmentName;

INSERT INTO Departments (DepartmentID) VALUES (1); -- Застосується DEFAULT значення 'General'

INSERT INTO Professors (ProfessorID, FirstName, LastName, Age, DepartmentID, Email)

VALUES (1, 'John', 'Smith', 57, 1, 'john.smith@university.com');

--INSERT INTO Professors (ProfessorID, FirstName, LastName, DepartmentID, Email)

--VALUES (2, 'Jane', 'Doe', 1, 35, 'john.smith@university.com'); -- Це викличе помилку через UNIQUE обмеження

--INSERT INTO Professors (ProfessorID, FirstName, LastName, DepartmentID, Email)

--VALUES (3, 'Bob', 'Doe', 1, 17, 'bob@university.com'); -- Це викличе помилку через CHECK обмеженн

DROP TABLE Professors;

DROP TABLE Departments;
USE master;
DROP DATABASE UniversityDB;

--Block 2

CREATE DATABASE CompanyDB;
GO
USE CompanyDB;

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

INSERT INTO Departments (DepartmentID, DepartmentName, Budget)

VALUES (1, 'Human Resources', 50000);

INSERT INTO Employees (EmployeeID, FirstName, LastName, Email)

VALUES (1, 'John', 'Smith', 'john.smith@company.com');

INSERT INTO Assignments (AssignmentID, EmployeeID, DepartmentID)

VALUES (1, 1, 1);

--INSERT INTO Assignments (AssignmentID, EmployeeID, DepartmentID)

--VALUES (2, 999, 1); -- Це викличе помилку через FOREIGN KEY обмеження

DROP TABLE Assignments;

DROP TABLE Employees;

DROP TABLE Departments;

USE master

DROP DATABASE CompanyDB;


/*
1. Що таке обмеження PRIMARY KEY і які дві основні умови воно забезпечує?

Первинний ключ - це унікальне поле (або група полів) у таблиці бази даних, яке ідентифікує кожен рядок/запис. Його головна мета полягає в тому, щоб гарантувати унікальність та ідентифікацію записів в таблиці. Основні умови, які воно забезпечує: унікальність (жодне значення не повторюється в цьому полі) та непустота (не допускає значення NULL).

2. Як створити складений PRIMARY KEY? Надайте приклад коду T-SQL.

У T-SQL можна створити складений ключ, вказавши кілька стовпців для PRIMARY KEY:

CREATE TABLE Table (
    Column_1 INT,
    Column_2 INT,
    CONSTRAINT PK_Table PRIMARY KEY (Column_1, Column_2)
);

3. Поясніть, що таке FOREIGN KEY та як він забезпечує цілісність даних між таблицями.

FOREIGN KEY - це поле або група полів, яке посилається на PRIMARY KEY іншої таблиці.
Він забезпечує цілісність даних, обмежуючи значення в полі зовнішнього ключа тільки тими значеннями,
які вже існують у відповідному полі PRIMARY KEY у зв'язаній таблиці.

4. Що станеться, якщо ви спробуєте вставити дані у таблицю, які порушують FOREIGN KEY обмеження?

Якщо вставлені дані порушують FOREIGN KEY обмеження, то операція вставки буде відхилена,
оскільки відповідне значення не існує у зв'язаній таблиці.

5. Опишіть, для чого використовується UNIQUE обмеження і чим воно відрізняється від PRIMARY KEY.

UNIQUE обмеження гарантує унікальність значень у полі чи групі полів, але вони можуть містити значення NULL.
PRIMARY KEY також гарантує унікальність, але не допускає значення NULL.

6. Наведіть приклад коду T-SQL, який додає обмеження CHECK до існуючої таблиці.

ALTER TABLE Persons
ADD CONSTRAINT CHK_Age CHECK (Age >= 18);

7. Як можна використовувати DEFAULT обмеження при створенні нової таблиці? Дайте приклад.

При створенні нової таблиці ви можете використовувати DEFAULT для встановлення значення за замовчуванням для певного стовпця:

CREATE TABLE Table (
    ID INT PRIMARY KEY,
    Name VARCHAR(50),
    Age INT DEFAULT 18
);

8. Яке обмеження ви б використали, щоб гарантувати, що колонка `Email` в таблиці `Customers` завжди містить унікальне значення?

Jбмеження UNIQUE

9. Які дії ви можете виконати, якщо потрібно змінити або видалити обмеження, яке вже було застосоване до таблиці?

Для зміни або видалення обмеження, яке застосоване до таблиці, можна використовувати команди ALTER TABLE для зміни
або DROP CONSTRAINT для видалення.

10. Чому важливо встановлювати обмеження цілісності даних в базі даних?

Обмеження цілісності даних допомагають забезпечити правильність та стійкість бази даних, уникнути некоректних даних,
запобігають порушенням правил та забезпечують консистентність.

11. Чим відрізняється обмеження NOT NULL від обмеження CHECK?

NOT NULL гарантує, що значення у полі не може бути NULL.
CHECK дозволяє встановити умову, яка повинна бути виконана для значення у полі.

12. Як можна модифікувати обмеження DEFAULT для існуючої колонки? Надайте приклад T-SQL команди.

ALTER TABLE Persons
ALTER COLUMN Age SET DEFAULT 21;

13. Що таке каскадні операції в контексті FOREIGN KEY обмежень і які проблеми можуть вони вирішити?

Каскадні операції (CASCADE) вказують базі даних виконати певні дії автоматично при зміні або видаленні запису,
на який посилається зовнішній ключ. Це може включати каскадне видалення (CASCADE DELETE) або каскадне оновлення 
(CASCADE UPDATE), що дозволяє автоматично оновлювати або видаляти залежні записи в інших таблицях.
*/