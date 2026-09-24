CREATE DATABASE IF NOT EXISTS testdb;
USE testdb;

DROP TABLE IF EXISTS Student;

CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(100),
    DepartmentID INT
);

INSERT INTO Student (StudentID, StudentName, DepartmentID) VALUES
(101, 'Abirami', 1),
(102, 'Karthik', 2),
(103, 'Suresh', 1),
(104, 'Anitha', 3);
