CREATE TABLE Learners (
    LearnerID INT PRIMARY KEY,
    FullName VARCHAR(100)
);

CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY,
    Subject VARCHAR(100),
    LearnerID INT,
    FOREIGN KEY (LearnerID) REFERENCES Learners(LearnerID)
);

INSERT INTO Learners (LearnerID, FullName) VALUES (10, 'RIYA JAIN');
INSERT INTO Learners (LearnerID, FullName) VALUES (11, 'MOHIT SINGH');
INSERT INTO Learners (LearnerID, FullName) VALUES (12, 'HITEN MEHTA');

INSERT INTO Enrollments (EnrollmentID, Subject, LearnerID) VALUES (201, 'ALGORITHMS', 10);
INSERT INTO Enrollments (EnrollmentID, Subject, LearnerID) VALUES (202, 'COMPUTER NETWORKS', 12);

SELECT L.FullName AS Student,E.Subject AS Course
FROM Learners L LEFT JOIN Enrollments E
ON L.LearnerID = E.LearnerID;
