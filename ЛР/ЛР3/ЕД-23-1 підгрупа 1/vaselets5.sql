CREATE TABLE AcademicInfo (
        RecordID INT PRIMARY KEY,
        StudentID INT FOREIGN KEY REFERENCES PersonalInfo(StudentID),
        Faculty NVARCHAR(150),
        Curator NVARCHAR(100),
        EnrollmentYear INT
ALTER TABLE AcademicInfo
ALTER COLUMN Faculty NVARCHAR(150);
);
