/*
Створюємо нову базу даних "STUDENTS"
*/

CREATE DATABASE STUDENTS; 

/*
Переходимо до бази даних "STUDENTS"
*/

USE STUDENTS; 

/*
Створення таблиць: 
a. Створюємо таблицю "PersonalInfo"
b. Створіть таблицю "AcademicInfo"
c. Створіть таблицю "ContactInfo"
*/

CREATE TABLE PersonalInfo ( 

        StudentID INT PRIMARY KEY, PersonalInfo(StudentID),

        FirstName NVARCHAR(50), 

        LastName NVARCHAR(50), 

        DateOfBirth DATE 

    ); 


	CREATE TABLE AcademicInfo ( 

        RecordID INT PRIMARY KEY, 

        StudentID INT FOREIGN KEY REFERENCES PersonalInfo(StudentID), 

        Faculty NVARCHAR(100), 

        Curator NVARCHAR(100), 

        EnrollmentYear INT 

    ); 


	CREATE TABLE ContactInfo ( 

        ContactID INT PRIMARY KEY, 

        StudentID INT FOREIGN KEY REFERENCES PersonalInfo(StudentID), 

        Email NVARCHAR(100), 

        PhoneNumber NVARCHAR(15) 

    ); 

/*
Операції зі структурою таблиці "ContactInfo":
a. Додайємо стовбець "Address"
b. Видаляємо стовбець "PhoneNumber"
c. Змінюємо ім'я стовбця "Email" на "EmailAddress"
*/

 ALTER TABLE ContactInfo ADD Address NVARCHAR(200); 


 ALTER TABLE ContactInfo DROP COLUMN PhoneNumber; 


 EXEC sp_rename 'ContactInfo.Email', 'EmailAddress', 'COLUMN'; 


 /*
Змінюємо тип даних для стовбця "Faculty" у таблиці "AcademicInfo" на NVARCHAR(150)
*/


ALTER TABLE AcademicInfo 

   ALTER COLUMN Faculty NVARCHAR(150); 


/*
Додаємо нову таблицю "Extracurricular"
*/  

CREATE TABLE Extracurricular ( 

        ActivityID INT PRIMARY KEY, 

        StudentID INT FOREIGN KEY REFERENCES PersonalInfo(StudentID), 

        ActivityName NVARCHAR(100), 

        JoinDate DATE 

    );
	
/*
 Після перевірки того, що таблиця була створена правильно, видаляємо її
*/  

 DROP TABLE Extracurricular; 


 /*
Створюємо базу даних "TEACHER"
*/ 

CREATE DATABASE TEACHER;

 /*
Після перевірки, видаляємо створену базу даних "TEACHER"
*/ 

DROP DATABASE TEACHER; 

 /*
Переключення на потрібну базу даних:
Додати три рядки даних до таблиці "PersonalInfo" 
*/ 

USE STUDENTS; 

INSERT INTO PersonalInfo (StudentID, FirstName, LastName, DateOfBirth) 

VALUES  

    (1, 'Олександр', 'Петров', '2000-05-15'), 

    (2, 'Марія', 'Іваненко', '2001-03-22'), 

    (3, 'Василь', 'Коваленко', '1999-10-10'); 