-- Table structure for the tables to be used in the queries in this task:
( Code INTEGER NOT NULL,
 Name TEXT NOT NULL,
 PRIMARY KEY (Code)
 );
CREATE TABLE Providers (
 Code VARCHAR(40) NOT NULL,  
 Name TEXT NOT NULL,
PRIMARY KEY (Code) 
 );
CREATE TABLE Provides (
 Piece INTEGER, 
 Provider VARCHAR(40), 
 Price INTEGER NOT NULL,
 PRIMARY KEY(Piece, Provider) 
 );

-- Table population
INSERT INTO Providers(Code, Name) VALUES('HAL','Clarke Enterprises');
INSERT INTO Providers(Code, Name) VALUES('RBT','Susan Calvin Corp.');
INSERT INTO Providers(Code, Name) VALUES('TNBC','Skellington Supplies');

INSERT INTO Pieces(Code, Name) VALUES(1,'Sprocket');
INSERT INTO Pieces(Code, Name) VALUES(2,'Screw');
INSERT INTO Pieces(Code, Name) VALUES(3,'Nut');
INSERT INTO Pieces(Code, Name) VALUES(4,'Bolt');

INSERT INTO Provides(Piece, Provider, Price) VALUES(1,'HAL',10);
INSERT INTO Provides(Piece, Provider, Price) VALUES(1,'RBT',15);
INSERT INTO Provides(Piece, Provider, Price) VALUES(2,'HAL',20);
INSERT INTO Provides(Piece, Provider, Price) VALUES(2,'RBT',15);
INSERT INTO Provides(Piece, Provider, Price) VALUES(2,'TNBC',14);
INSERT INTO Provides(Piece, Provider, Price) VALUES(3,'RBT',50);
INSERT INTO Provides(Piece, Provider, Price) VALUES(3,'TNBC',45);
INSERT INTO Provides(Piece, Provider, Price) VALUES(4,'HAL',5);
INSERT INTO Provides(Piece, Provider, Price) VALUES(4,'RBT',7);
INSERT INTO Provides(Piece, Provider, Price) VALUES(1,'TNBC',15);

-- 5.1 Select the name of all the pieces. 
SELECT * FROM Pieces;

-- 5.2  Select all the providers' data. 
SELECT * FROM Providers;

-- 5.3 Obtain the average price of each piece (show only the piece code and the average price).
SELECT Piece, Price FROM Provides
GROUP BY Price
HAVING avg(Price);

-- 5.4  Obtain the names of all providers who supply piece 1.
SELECT Name FROM Providers
JOIN Provides ON Providers.Code = Provides.Provider
WHERE Provides.Piece = 1;

-- 5.5 Select the name of pieces provided by the provider with code &quot;HAL&quot;.
SELECT Pieces.Name, Providers.Code
FROM Pieces
RIGHT JOIN Providers ON Pieces.Code = Providers.Name
WHERE Providers.Code = 'HAL'

-- 5.6 Add an entry to the database to indicate that &quot;Skellington Supplies&quot; (code &quot;TNBC&quot;) will provide sprockets (code &quot;1&quot;) for 15 cents each.
--see SQL 1 Tab

-- 5.7 For each piece, find the most expensive offering of that piece and include the piece name, provider name, and price 
SELECT Pieces.Name, Provides.Price FROM Pieces
RIGHT JOIN Provides ON Pieces.Code = Provides.Price
GROUP BY Pieces.Name, Provides.Provider
HAVING max(Price);


-- 5.8 Increase all prices by one cent.
UPDATE Provides
SET Price = Price + 0.01;

--5.9 Update the database to reflect that &quot;Susan Calvin Corp.&quot; (code &quot;RBT&quot;) will not supply bolts (code 4).
UPDATE Provides
SET Piece = 0
WHERE Provider = 'RBT' AND Piece = 4;

-- 5.10 Update the database to reflect that &quot;Susan Calvin Corp.&quot; (code &quot;RBT&quot;) will not supply any pieces (the provider should still remain in the database).
UPDATE Provides
SET Piece = 0
WHERE Provider = 'RBT'</sql><current_tab id="1"/></tab_sql></sqlb_project>
