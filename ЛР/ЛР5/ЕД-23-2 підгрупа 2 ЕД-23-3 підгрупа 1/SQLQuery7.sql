ALTER TABLE Professors ADD CONSTRAINT FK_Professor_Department  FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID);

ALTER TABLE Professors ADD CONSTRAINT CK_Age CHECK (Age > = 20);
  
ALTER TABLE Professors ALTER COLUMN FirstName VARCHAR(50) NOT NULL;
ALTER TABLE Professors ALTER COLUMN LastName VARCHAR(50) NOT NULL;
  
ALTER TABLE Departments ADD CONSTRAINT DF_DepartmentName DEFAULT 'General' FOR DepartmentName;
INSERT INTO Departments (DepartmentID) VALUES (1); -- Застосується DEFAULT значення 'General'

INSERT INTO Professors (ProfessorID, FirstName, LastName, Age, DepartmentID, Email) 
  VALUES (1, 'John', 'Smith', 57, 1, 'john.smith@university.com');
INSERT INTO Professors (ProfessorID, FirstName, LastName, DepartmentID, Email) 
  VALUES (2, 'Jane', 'Doe', 1, 35, 'john.smith@university.com'); 
    INSERT INTO Professors (ProfessorID, FirstName, LastName, DepartmentID, Email) 
  VALUES (3, 'Bob', 'Doe', 1, 17, 'bob@university.com'); 