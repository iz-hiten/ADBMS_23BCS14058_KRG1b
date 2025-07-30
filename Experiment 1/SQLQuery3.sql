CREATE TABLE Items (
    ItemID INT PRIMARY KEY,
    ItemName VARCHAR(100)
);

CREATE TABLE Suppliers (
    SupplierID INT PRIMARY KEY,
    SupplierName VARCHAR(100)
);

CREATE TABLE Deliveries (
    DeliveryID INT PRIMARY KEY,
    ItemID INT,
    SupplierID INT,
    Amount INT,
    FOREIGN KEY (ItemID) REFERENCES Items(ItemID),
    FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID)
);

INSERT INTO Items (ItemID, ItemName) VALUES (10, 'DIGITAL PEN DISPLAY');
INSERT INTO Suppliers (SupplierID, SupplierName) VALUES (20, 'HI-TECH SUPPLIERS');
INSERT INTO Deliveries (DeliveryID, ItemID, SupplierID, Amount) VALUES (5001, 10, 20, 75);

INSERT INTO Deliveries (DeliveryID, ItemID, SupplierID, Amount) VALUES (5002, 999, 20, 40);

SELECT I.ItemName AS Product,S.SupplierName AS Vendor,D.Amount AS Quantity
FROM Deliveries D
JOIN Items I ON D.ItemID = I.ItemID
JOIN Suppliers S ON D.SupplierID = S.SupplierID
ORDER BY Supplier, Product;
