-- 1) SELECT * FROM Customers ORDER BY City, CustomerName;
-- 2) SELECT * FROM Customers WHERE City = 'Berlin';
-- 3) SELECT SUM(Quantity) FROM OrderDetails;
--    SELECT ProductID, SUM(Quantity) FROM OrderDetails GROUP BY ProductID;
-- 4) SELECT * FROM OrderDetails WHERE Quantity BETWEEN 5 AND 20;	
-- 5) SELECT AVG(Price) FROM Products;
-- 6) SELECT DISTINCT CategoryID FROM Products;
-- 7) CREATE TABLE Nuova (Nome TEXT(50), Cognome TEXT(50), Età INTEGER);
INSERT INTO  Nuova (Nome, Cognome, Età) VALUES ('Alessandro', 'Morgante', 33), 
                                               ('Laura', 'Fiore', 18),
                                               ('Elena', 'Celeste', 45),
                                               ('Simone', 'Argento', 25), 
                                               ('Domenico', 'Esposito', 35),
                                               ('Davide', 'Motta', 50),
                                               ('Stefano', 'Girasole', 29),
                                               ('Rita','Montebello', 39),
                                               ('Daniela', 'Marcone', 46),
                                               ('Serena', 'Sassi', 19);
-- 8) ALTER TABLE Nuova ADD COLUMN Sesso TEXT(1);
-- 9) UPDATE Nuova SET Sesso='M' WHERE Nome='Alessandro';
   UPDATE Nuova SET Sesso='F' WHERE Nome='Laura';
   UPDATE Nuova SET Sesso='F' WHERE Nome='Elena';
   UPDATE Nuova SET Sesso='M' WHERE Nome='Simone';
   UPDATE Nuova SET Sesso='M' WHERE Nome='Domenico';    
   UPDATE Nuova SET Sesso='M' WHERE Nome='Davide';
   UPDATE Nuova SET Sesso='M' WHERE Nome='Stefano'
   UPDATE Nuova SET Sesso='F' WHERE Nome='Rita';
   UPDATE Nuova SET Sesso='F' WHERE Nome='Daniela';
   UPDATE Nuova SET Sesso='F' WHERE Nome='Serena';
-- 10) SELECT AVG(Età) FROM Nuova;
-- 11) SELECT MAX(Età) - MIN(Età) FROM Nuova;
-- 12) SELECT SUM(Età) AS "Somma_età", Sesso FROM Nuova GROUP BY Sesso;
-- 13) SELECT * FROM Customers WHERE Country = 'Germany' AND City = 'Berlin' OR City = 'Dresda' OR City = 'Mannheim';
-- 14) SELECT * FROM Nuova WHERE Cognome LIKE 'C%';
-- 15) SELECT * FROM Customers WHERE City IS NULL;
-- 16) UPDATE Customers SET Country = 'MESSICO' WHERE Country = 'Mexico';
-- 17) SELECT SUM(Price), MIN(Price), MAX(Price), AVG(Price) FROM Products;
-- 18) SELECT Country, COUNT(*) FROM Customers GROUP BY Country HAVING COUNT(*) > 0;
-- 19) SELECT Products.ProductName, SUM(Products.Price) AS 'Somma_Prezzo', 
    SUM(OrderDetails.Quantity) AS Somma_Quantità 
    FROM Products INNER JOIN OrderDetails ON Products.ProductID = OrderDetails.ProductID 
    GROUP BY Products.ProductName 
    ORDER BY somma_prezzo DESC;
-- 20) CREATE TABLE BACKUPOrders AS SELECT OrderID, OrderDate, ShipperID FROM Orders;
-- 21) SELECT Orders.OrderDate, Orders.OrderID, Orders.CustomerID, Customers.CustomerName, Customers.City 
    FROM Orders INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID
    WHERE Country = 'Mexico' OR 'Germany' 
    ORDER BY CustomerID
-- 22) ALTER TABLE Nuova DROP COLUMN Sesso;
-- 23) ALTER TABLE Nuova MODIFY COLUMN Cognome MEMO;
-- 24) SELECT Employees.LastName, COUNT(Orders.OrderID) AS 'N°Ordini' 
    FROM Employees INNER JOIN Orders ON Employees.EmployeeID = Orders.EmployeeID
    WHERE Employees.FirstName = 'Janet' OR Employees.FirstName = 'Andrew' OR Employees.FirstName = 'Margaret' 
    GROUP BY Employees.LastName
    HAVING COUNT(Orders.OrderID) BETWEEN 2 AND 20;
-- 25) CREATE TABLE Seconda AS SELECT Cognome From Nuova;
    ALTER TABLE Seconda ADD COLUMN Città TEXT(20);
    ALTER TABLE Seconda ADD COLUMN Regione TEXT(20); 
    UPDATE Seconda SET Città = 'Torino' WHERE Cognome = 'Morgante';
    UPDATE Seconda SET Città = 'Taranto' WHERE Cognome = 'Fiore';
    UPDATE Seconda SET Città = 'Palermo' WHERE Cognome = 'Celeste';
    UPDATE Seconda SET Città = 'Sorrento' WHERE Cognome = 'Argento';
    UPDATE Seconda SET Città = 'Napoli' WHERE Cognome = 'Esposito';
    UPDATE Seconda SET Città = 'Firenze' WHERE Cognome = 'Motta';
    UPDATE Seconda SET Città = 'Milano' WHERE Cognome = 'Girasole';
    UPDATE Seconda SET Città = 'Trento' WHERE Cognome = 'Montebello';
    UPDATE Seconda SET Città = 'Roma' WHERE Cognome = 'Marcone';
    UPDATE Seconda SET Città = 'Bari' WHERE Cognome = 'Sassi';
    UPDATE Seconda SET Regione = 'Piemonte' WHERE Città = 'Torino';
    UPDATE Seconda SET Regione = 'Puglia' WHERE Città = 'Taranto';
    UPDATE Seconda SET Regione = 'Sicilia' WHERE Città = 'Palermo';
    UPDATE Seconda SET Regione = 'Campania' WHERE Città = 'Sorrento';
    UPDATE Seconda SET Regione = 'Campania' WHERE Città = 'Napoli';
    UPDATE Seconda SET Regione = 'Toscana' WHERE Città = 'Firenze';
    UPDATE Seconda SET Regione = 'Lombardia' WHERE Città = 'Milano';
    UPDATE Seconda SET Regione = 'Trentino-Alto-Adige' WHERE Città = 'Trento';
    UPDATE Seconda SET Regione = 'Puglia' WHERE Città = 'Bari';
-- 26) SELECT Seconda.Regione, Seconda.Città, Seconda.Cognome, Nuova.Nome, Nuova.Età
    FROM Seconda INNER JOIN Nuova ON Seconda.Cognome = Nuova.Cognome;
-- 27) SELECT Seconda.Regione, SUM(Nuova.Età) AS 'Somma_età'
    FROM Nuova INNER JOIN Seconda ON Nuova.Cognome = Seconda.Cognome
    GROUP BY Seconda.Regione;