![image](https://github.com/user-attachments/assets/3486c1fc-b45c-4ed4-89b1-d3f9fe71ed38)

## Table creation and population of the 2nd task
````sql
CREATE TABLE IF NOT EXISTS Departments (
  Code INTEGER,
  Name TEXT NOT NULL,
  Budget decimal NOT NULL,
  PRIMARY KEY (Code)   
);
CREATE TABLE IF NOT EXISTS Employees (
  SSN INTEGER,
  Name varchar(255) NOT NULL ,
  LastName varchar(255) NOT NULL ,
  Department INTEGER NOT NULL , 
  PRIMARY KEY (SSN)   
);

INSERT INTO Departments(Code,Name,Budget) VALUES(14,'IT',65000);
INSERT INTO Departments(Code,Name,Budget) VALUES(37,'Accounting',15000);
INSERT INTO Departments(Code,Name,Budget) VALUES(59,'Human Resources',240000);
INSERT INTO Departments(Code,Name,Budget) VALUES(77,'Research',55000);

INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('123234877','Michael','Rogers',14);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('152934485','Anand','Manikutty',14);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('222364883','Carol','Smith',37);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('326587417','Joe','Stevens',37);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('332154719','Mary-Anne','Foster',14);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('332569843','George','ODonnell',77);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('546523478','John','Doe',59);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('631231482','David','Smith',77);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('654873219','Zacary','Efron',59);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('745685214','Eric','Goldsmith',59);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('845657245','Elizabeth','Doe',14);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('845657246','Kumar','Swamy',14);
````
### SQL queries with attempted approaches

#### 2.1 Select the last name of all employees.
````sql
SELECT LastName FROM Employees;
````
#### 2.2 Select the last name of all employees, without duplicates.
````sql
SELECT DISTINCT LastName FROM Employees;
````
#### 2.3 Select all the data of employees whose last name is "Smith".
````sql
SELECT LastName FROM Employees
WHERE LastName = 'Smith';
````
#### 2.4 Select all the data of employees whose last name is "Smith" or "Doe".
````sql
SELECT LastName FROM Employees
Where LastName = 'Doe' OR LastName = 'Smith';
````
#### 2.5 Select all the data of employees that work in department 14.
````sql
SELECT * FROM Employees
WHERE Department = 14;
````
#### 2.6 Select all the data of employees that work in department 37 or department 77.
````sql
SELECT * FROM Employees
WHERE Department = 37 OR Department = 77;
````
#### 2.7 Select all the data of employees whose last name begins with an "S".
````sql
SELECT * FROM Employees
WHERE Lastname like '%S';
````
#### 2.8 Select the sum of all the departments' budgets.
````sql
SELECT sum(Budget) FROM Departments;
````
#### 2.9 Select the number of employees in each department (you only need to show the department code and the number of employees).
````sql
SELECT count(SSN), count(Department)
FROM Employees 
GROUP BY SSN AND Department;
````
#### 2.10 Select all the data of employees, including each employee's department's data.
````sql
SELECT * FROM Employees;
````
#### 2.11 Select the name and last name of each employee, along with the name and budget of the employee's department.
````sql
SELECT e.Name AS Name, e.LastName, d.Name AS Name, d.Budget
FROM Employees e
CROSS JOIN Departments d;
````
#### 2.12 Select the name and last name of employees working for departments with a budget greater than $60,000.
````sql
SELECT e.Name AS Name, e.LastName, d.Name AS Name, d.Budget
FROM Employees e
JOIN Departments d
WHERE Budget > 60000;
````
#### 2.13 Select the departments with a budget larger than the average budget of all the departments. 
````sql
SELECT Name, Budget FROM Departments
GROUP BY Budget
HAVING Budget > (SELECT avg(Budget) AS avgbudget
FROM Departments)
````
#### 2.14 Select the names of departments with more than two employees.
````sql 
SELECT d.Name, e.Name, e.LastName
FROM Departments d 
JOIN Employees e ON d.Name = e.Code
````
#### 2.15 Select the name and last name of employees working for the two departments with lowest budget.
````sql
SELECT e.Name, e.LastName, d.Budget
FROM Employees e
JOIN Departments d ON e.Department = d.Code 
ORDER BY Budget DESC
LIMIT 2;
````
#### 2.16  Add a new department called "Quality Assurance", with a budget of $40,000 and departmental code 11. And Add an employee called "Mary Moore" in that department, with SSN 847-21-9811.
````sql
INSERT INTO Departments(Code,Name,Budget) VALUES(11,'Quality Assurance',40000);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('847219811','Mary','Moore',11);
````
#### 2.17 Reduce the budget of all departments by 10%.
````sql
UPDATE Departments
SET Budget = Budget * 0.90;
````
#### 2.18 Reassign all employees from the Research department (code 77) to the IT department (code 14).
````sql
UPDATE Employees 
SET Department = 14
WHERE Department = 77
````
