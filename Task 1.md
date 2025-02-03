![image](https://github.com/user-attachments/assets/3368040c-912a-4f2e-bc64-86b7dd877be1)

## Table creation
````sql
(
  Code INTEGER,
  Name TEXT NOT NULL,
  PRIMARY KEY (Code)
);

CREATE TABLE IF NOT EXISTS Products (
  Code INTEGER,
  Name TEXT NOT NULL,
  Price INTEGER NOT NULL,
  Manufacturer INTEGER NOT NULL,
  PRIMARY KEY (Code)
);

INSERT INTO Manufacturers(Code,Name) VALUES(1,'Sony');
INSERT INTO Manufacturers(Code,Name) VALUES(2,'Creative Labs');
INSERT INTO Manufacturers(Code,Name) VALUES(3,'Hewlett-Packard');
INSERT INTO Manufacturers(Code,Name) VALUES(4,'Iomega');
INSERT INTO Manufacturers(Code,Name) VALUES(5,'Fujitsu');
INSERT INTO Manufacturers(Code,Name) VALUES(6,'Winchester');

INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(1,'Hard drive',240,5);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(2,'Memory',120,6);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(3,'ZIP drive',150,4);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(4,'Floppy disk',5,6);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(5,'Monitor',240,1);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(6,'DVD drive',180,2);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(7,'CD drive',90,2);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(8,'Printer',270,3);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(9,'Toner cartridge',66,3);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(10,'DVD burner',180,2);
````

### SQL Queries with solutions

#### 1.1 Select the names of all the products in the store.
````sql
SELECT Name FROM Products;
````
#### 1.2 Select the names and the prices of all the products in the store.
#### 1.3 Select the name of the products with a price less than or equal to $200.
````sql
SELECT Name, Price FROM Products
GROUP BY Price
HAVING sum(Price) &lt;= 200;
````
#### 1.4 Select all the products with a price between $60 and $120.
````sql
SELECT Name, Price FROM Products
GROUP BY Price
HAVING sum(Price) BETWEEN 60 AND 120;
````
#### 1.5 Select the name and price in cents (i.e., the price must be multiplied by 100).
````sql SELECT Name, (Price*100)
FROM Products;
````
#### 1.6 Compute the average price of all the products.
#### 1.7 Compute the average price of all products with manufacturer code equal to 2.
````sql SELECT Name,Price FROM Products
WHERE Code = 2
GROUP BY Price
HAVING avg(Price);
````
#### 1.8 Compute the number of products with a price larger than or equal to $180.
````sql SELECT Price, count(*)
FROM Products
GROUP BY Price
HAVING sum(Price) &gt;= 180;
````
#### 1.8 Compute the number of products with a price larger than or equal to $180.
````sql SELECT count(Name)
FROM Products
WHERE Price &gt;=  180;
````
#### 1.9 Select the name and price of all products with a price larger than or equal to $180, and sort first by price (in descending order), and then by name (in ascending order).
````sql
SELECT Price,Name FROM Products
--GROUP BY Price;
WHERE Price &gt;= 180
ORDER BY Price DESC, Name;
````
#### 1.10 Select all the data from the products, including all the data for each product's manufacturer.
````sql
SELECT * FROM Products; 
````
#### 1.11 Select the product name, price, and manufacturer name of all the products.
````sql
SELECT Name, Price, Manufacturer FROM Products;
````
#### 1.12 Select the average price of each manufacturer's products, showing only the manufacturer's code.
````sql
SELECT Price,Code FROM Products
GROUP BY Price
HAVING avg(Price);
````
#### 1.13 Select the average price of each manufacturer's products, showing the manufacturer's name.
#### 1.14 Select the names of manufacturer whose products have an average price larger than or equal to $150.
````sql
SELECT Price, Manufacturers.Name FROM Products
JOIN Manufacturers ON Products.Code = Manufacturers.Code
WHERE Price &gt;= 150
GROUP BY Price
HAVING avg(Price);
````
#### 1.15 Select the name and price of the cheapest product.
````sql
SELECT Name, min(Price)
FROM Products;
````
#### 1.16 Select the name of each manufacturer along with the name and price of its most expensive product.
````sql
SELECT max(Price), Manufacturers.Name FROM Products
JOIN Manufacturers ON Products.Code = Manufacturers.Code
````
#### 1.17 Add a new product: Loudspeakers, $70, manufacturer 2.
````sql
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(11,'Loudspeakers',70,2);
````

#### 1.18 Update the name of product 8 to &quot;Laser Printer&quot;.
````sql
UPDATE Products SET Name = 'Laser Printer'
WHERE Code = 8;
````

#### 1.19 Apply a 10% discount to all products.
````sql
SELECT Name, Price, Price * 0.9 AS discounted_price 
FROM Products;
````
*Here I want to preview the prices first, before updating the column in the database* 
````sql
UPDATE Products 
--SET Price = Price * 0.9;
````
#### 1.20 Apply a 10% discount to all products with a price larger than or equal to $120.
````sql
SELECT Name, Price, Price * 0.9 AS discounted_price
FROM Products
WHERE Price >= 120;
````
