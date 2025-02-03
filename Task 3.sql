-- Table creation

(   Code INTEGER NOT NULL,
   Location VARCHAR(255) NOT NULL ,
   Capacity INTEGER NOT NULL,
   PRIMARY KEY (Code)
 );
CREATE TABLE Boxes (
    Code CHAR(4) NOT NULL,
    Contents VARCHAR(255) NOT NULL ,
    Value REAL NOT NULL ,
    Warehouse INTEGER NOT NULL,
    PRIMARY KEY (Code)
 );

-- Table population

 INSERT INTO Warehouses(Code,Location,Capacity) VALUES(1,'Chicago',3);
 INSERT INTO Warehouses(Code,Location,Capacity) VALUES(2,'Chicago',4);
 INSERT INTO Warehouses(Code,Location,Capacity) VALUES(3,'New York',7);
 INSERT INTO Warehouses(Code,Location,Capacity) VALUES(4,'Los Angeles',2);
 INSERT INTO Warehouses(Code,Location,Capacity) VALUES(5,'San Francisco',8);
 INSERT INTO Warehouses(Code,Location,Capacity) VALUES(6,'New York',3);

 
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('0MN7','Rocks',180,3);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('4H8P','Rocks',250,1);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('4RT3','Scissors',190,4);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('7G3H','Rocks',200,1);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('8JN6','Papers',75,1);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('8Y6U','Papers',50,3);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('9J6F','Papers',175,2);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('LL08','Rocks',140,4);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('P0H6','Scissors',125,1);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('P2T6','Scissors',150,2);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('TU55','Papers',90,5);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('H5RT','Papers',200,2);


--3.1 Select all warehouses.
SELECT * FROM Warehouses;

--3.2 Select all boxes with a value larger than $150.
SELECT * FROM Boxes
WHERE Value &gt;= 150;

--3.3 Select all distinct contents in all the boxes.
SELECT DISTINCT Contents FROM Boxes;

--3.4 Select the average value of all the boxes.
SELECT avg(Value) FROM Boxes;

--3.5 Select the warehouse code and the average value of the boxes in each warehouse.
SELECT Code, Warehouse, Value FROM Boxes
GROUP BY Value
HAVING avg(Value);

--3.6 Same as previous exercise, but select only those warehouses where the average value of the boxes is greater than 150.
SELECT Code, Warehouse, Value FROM Boxes
GROUP BY Value
HAVING avg(Value) &gt; 150;

--3.7 Select the code of each box, along with the name of the city the box is located in.
SELECT Boxes.Warehouse, Warehouses.Location FROM Boxes
JOIN Warehouses ON Boxes.Warehouse = Warehouses.Code  
GROUP BY Location;

--3.8 Select the warehouse codes, along with the number of boxes in each warehouse.
SELECT Boxes.Warehouse, count(Contents) 
FROM Boxes
GROUP BY Boxes.Warehouse

--3.9 Select the codes of all warehouses that are saturated (a warehouse is saturated if the number of boxes in it is larger than the warehouse's capacity).


--3.10 Select the codes of all the boxes located in Chicago.
SELECT Boxes.Code, Warehouses.Location FROM Boxes
JOIN Warehouses ON Boxes.Warehouse = Warehouses.Code
WHERE Warehouses.Location = 'Chicago'


--3.11 Create a new warehouse in New York with a capacity for 3 boxes.
--see Tab SQL 1 
--3.12 Create a new box, with code &quot;H5RT&quot;, containing &quot;Papers&quot; with a value of $200, and located in warehouse 2.
--see Tab SQL 1
--3.13 Reduce the value of all boxes by 15%.
UPDATE Boxes
SET Value = Value * 0.85;
--3.14 Delete all records of boxes from saturated warehouses.
--3.15 Remove all boxes with a value lower than $100. 
SELECT * FROM Boxes
WHERE Value &lt; 100;

--3.16 Add Index for column &quot;Warehouse&quot; in table &quot;boxes&quot;
    -- !!!NOTE!!!: index should NOT be used on small tables in practice
CREATE INDEX index_boxes_whouse ON Boxes(Warehouse);

--3.17 Print all the existing indexes
PRAGMA index_list(Boxes)

SELECT name
FROM sqlite_master
WHERE type= 'index';

--3.18 Remove (drop) the index you just created
DROP INDEX index_boxes_whouse;



