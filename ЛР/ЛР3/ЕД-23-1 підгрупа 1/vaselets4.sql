    CREATE TABLE ContactInfo (
        ContactID INT PRIMARY KEY,
        StudentID INT FOREIGN KEY REFERENCES PersonalInfo(StudentID),
        Email NVARCHAR(100),
		EXEC sp_rename 'ContactInfo.Email', 
		'EmailAddress', 'COLUMN';
        ALTER TABLE ContactInfo DROP COLUMN
		PhoneNumber;
    );
