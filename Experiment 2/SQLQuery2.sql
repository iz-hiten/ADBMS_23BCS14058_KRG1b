CREATE TABLE Financials (
    FinID INT,
    FinYear INT,
    NetPresentValue INT
);

CREATE TABLE Lookups (
    LookupID INT,
    LookupYear INT
);

INSERT INTO Financials (FinID, FinYear, NetPresentValue)
VALUES
    (5, 2017, 150),
    (9, 2018, 80),
    (12, 2019, 65),
    (3, 2020, 0),
    (1, 2021, 102),
    (2, 2018, 47),
    (7, 2019, 129),
    (99, 2023, 200),
    (13, 2022, 210),
    (43, 2019, 77),
    (7, 2022, 10),
    (10, 2021, 88),
    (20, 2020, 55),
    (1, 2022, 111),
    (44, 2023, 121),
    (12, 2022, 999),
    (1, 2023, 77),
    (8, 2022, 14),
    (25, 2021, 56),
    (2, 2023, 33),
    (13, 2023, 40),
    (52, 2021, 91),
    (77, 2024, 45),
    (1, 2024, 35),
    (101, 2021, 70),
    (99, 2025, 123);

INSERT INTO Lookups (LookupID, LookupYear)
VALUES
    (1, 2023),
    (99, 2023),
    (7, 2019),
    (10, 2021),
    (7, 2022),
    (12, 2019),
    (99, 2025);

SELECT 
    l.LookupID,
    l.LookupYear,
    COALESCE(f.NetPresentValue, 0) AS NetValue
FROM 
    Lookups l
LEFT JOIN 
    Financials f
    ON l.LookupID = f.FinID AND l.LookupYear = f.FinYear
ORDER BY 
    l.LookupID, l.LookupYear;
