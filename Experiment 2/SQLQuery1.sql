CREATE TABLE Staff (
    StaffID INT PRIMARY KEY,
    StaffName VARCHAR(50),
    Division VARCHAR(50),
    SupervisorID INT
);

INSERT INTO Staff (StaffID, StaffName, Division, SupervisorID) VALUES
(10, 'Hiten', 'IT', NULL),
(11, 'Priya', 'Accounts', 10),
(12, 'Rohan', 'Operations', 10),
(13, 'Isha', 'Accounts', 11),
(14, 'Kunal', 'Operations', 12),
(15, 'Sneha', 'IT', 10);

ALTER TABLE Staff 
ADD CONSTRAINT FK_Supervisor FOREIGN KEY (SupervisorID)
REFERENCES Staff(StaffID);

SELECT 
    s1.StaffName AS 'Staff Member',
    s1.Division AS 'Division',
    s2.StaffName AS 'Supervisor',
    s2.Division AS 'Supervisor Division'
FROM 
    Staff s1
LEFT JOIN 
    Staff s2 ON s1.SupervisorID = s2.StaffID;
