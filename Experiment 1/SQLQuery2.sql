CREATE TABLE Learners (
    LearnerID INT PRIMARY KEY,
    LearnerName VARCHAR(100)
);

CREATE TABLE Subjects (
    SubjectID INT PRIMARY KEY,
    SubjectTitle VARCHAR(100),
    LearnerID INT,
    FOREIGN KEY (LearnerID) REFERENCES Learners(LearnerID)
);

INSERT INTO Learners (LearnerID, LearnerName) VALUES (11, 'HITEN VERMA');
INSERT INTO Learners (LearnerID, LearnerName) VALUES (12, 'ANITA DAS');
INSERT INTO Learners (LearnerID, LearnerName) VALUES (13, 'RAHUL SINGH');
INSERT INTO Subjects (SubjectID, SubjectTitle, LearnerID) VALUES (201, 'OPERATING SYSTEMS', 11);
INSERT INTO Subjects (SubjectID, SubjectTitle, LearnerID) VALUES (202, 'COMPUTER NETWORKS', 12);

SELECT L.LearnerName AS StudentName, S.SubjectTitle AS CourseName
FROM Learners L
LEFT JOIN Subjects S 
ON L.LearnerID = S.LearnerID
ORDER BY StudentName;
