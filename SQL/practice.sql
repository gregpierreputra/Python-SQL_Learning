/* SQL / mySQL is a relational database management system - a software used to manage a database

The database management system (DBMS) is the software that is responsible for creating, maintaining, updating, deleting information from the database.

Four main operations that we're going to be doing on a database: C.R.U.D
C - Create - (creating information, creating new database entries)
R - Read - (reading information, retrieving information already stored in the database)
U - Update - (updating the exisitng information)
D - Delete - (deleting the existing information)


TWO main types of databases:
- Relational Databases (SQL)
Organize data into one or more tables
    - Each table has columns and rows
    - A unique key identifies each row
e.g., similar to an Excel spreadsheet - storing information into columns and rows

- Relational Database Management System (RDBMS)
Help users create and maintain a relational database
    - (mySQL, Oracle, postgreSQL, mariaDB, etc.)
Uses a standardized language called SQL (Structured Query Language) to interact with RDBMS
- Structured Query Language (SQL)
Used to perform C.R.U.D operations as well as other administrative tasks (user management, security, backup, etc.)
Used to define tables and structures


- Non-Relational Databases (No-SQL / not just SQL) - Every other database that's NOT a relational database
Organize data is anything but a traditional table - a different data structure
    - Key-value stores
    - Documents (JSON, XML, etc.)
    - Graphs
    - Flexible tables

- Non-Relational Database Management System (NRDBMS)
Help users create and maintain a non-relational database
    - (mongoDB, dynamoDB, apache cassandra, firebase, etc.)
Does not use a standardized language - implementation specific
    - Most NRDBMS will implement their own language for performing C.R.U.D. and administrative operations on the database.


- Database Queries
Requests made to the database management system for specific piece/pieces of information
As the database structure become more and more complex, it becomes more difficult to get the specific pieces of information we want

- Primary Key
An attribute that UNIQUELY defines each row (single entry) in the database - main differentiator for two similar but different entries

- Examples of different types of primary keys
    - id (int), email (string) , employee id (int)

    - Surrogate key
        A key that has no mapping to the real world
            examples: employee id
    - Natural key
        A key that has a mapping/purpose to the real world
            e.g., social security number - a number that uniquely identifies each citizen in the U.S.

- Foreign Key
Stores the primary key of a row in another database table
Could be the primary key inside of another table
    - Multiple foreign keys could exist inside of each table, e.g., branch_id, employee_rank, supervisor_id inside of an Employees table


- Strucutred Query Language (SQL)
programming language used for interacting with Relational Database Management Systesm (RDBMS)
    Able to:
        - C.R.U.D.: Create, retrieve, update & delete data
        - Create & manage databases
        - Design & create database tables
        - Perform administration tasks (security, user management, import/export, etc.)

4 types of languages in one:
- Data Query Language (DQL):
    - Used to query the database for information
    - Get information that is already stored there
- Data Definition Language (DDL):
    - Used for defining database schemas
- Data Control Language (DCL):
    - Used for controlling access to the data in the database
    - User & permissions management
- Data Manipulation Language (DML)
    - Used for inserting, updating and deleting data from the database


Queries:
Set of instructions given to the RDBMS (written in SQL) that tells the RDBMS what information you want it to retrieve for you.
    - Goal is to only get the data you need.
e.g.
SELECT employee.name, employee.age
FROM employee
WHERE employee.salary > 30000
*/

SELECT employer.name, employer.age
FROM employee
WHERE employee.salary > 30000

-- ------------------------
-- FURTHER NOTES
-- ------------------------

-- Foreign Key
-- A primary key of a different table stored in a current table

CREATE TABLE students
(
    student_id INTEGER AUTO_INCREMENT,
    first_name VARCHAR(25) NOT NULL,
    last_name VARCHAR(25) NOT NULL,
    major VARCHAR(25) NOT NULL,
    gpa DECIMAL(3, 2) NOT NULL,
    PRIMARY KEY(student_id)
);

INSERT INTO students(student_id, first_name, last_name, major, gpa) VALUES (1, 'David', 'Washington', 'History', '3.75');
INSERT INTO students(student_id, first_name, last_name, major, gpa) VALUES (3, 'Elon', 'Musk', 'Economics and Physics', '3.90');
INSERT INTO students SET
student_id = 2,
first_name = 'Nikola',
last_name = 'Tesla',
major = 'Physics',
gpa = '4.00';

INSERT INTO students(student_id, first_name, last_name, major, gpa)
VALUES
(4, 'Gregorius', 'Putra', 'Computer Science', '3.25'),
(5, 'Padraic', 'Clarke', 'Economics', 2.75),
(6, 'Carl', 'Wheezly', 'Electrical Engineering', 3.10),
(7, 'Tony', 'Stark', 'Electrical Engineering', 4.00),
(8, 'Sheen', 'Estevez', 'Psychology', 4.00),
(9, 'Robert', 'Pattinson', 'Drama', '3.95'),
(10, 'Taylor', 'Lautner', 'Drama', '3.99');

-- Table operatios
TRUNCATE TABLE students;
-- Will delete every entry in the table

ALTER TABLE students DROP gpa;
-- Will delete the specified column from the table (e.g., gpa)

ALTER TABLE students ALTER major SET DEFAULT 'Undecided' NOT NULL;
-- Sets the default value for the major column to 'Undecided' if left undeclared at initialization

ALTER TABLE students ALTER major DROP DEFAULT;
-- Removes the default value set to the major column


-- Update and Delete entries in the table
UPDATE students
WHERE students.major = 'Computer Science'
SET students.major = 'Comp Sci';

DELETE FROM students
WHERE students.first_name = 'Sheen' AND students.last_name = 'Estevez';
-- The WHERE clause is necessary to specify what to delete OTHERWISE all rows (entries) in the table will be deleted


-- Basic Queries (Simple Select, Where, and Order By clauses and arguments)
-- Querying for entries in the table
/*
ORDER BY keyword
The SQL keyword used to sort the result-set
 */
SELECT * FROM students
WHERE students.major IN ('Computer Science', 'Biology', 'Gender Studies') AND students.name IN ('Greg', 'Jason', 'Javid')
ORDER BY students.name, students.student_id;

SELECT students.student_id, students.first_name, students.last_name FROM students
WHERE students.major NOT IN ('Computer Science', 'History') AND students.first_name = 'Elon' AND students.last_name = 'Musk'
ORDER BY students.student_id;

SELECT * FROM students
WHERE students.student_id <= 7
ORDER BY students.last_name, students.first_name;

-- select a column named "FirstName" from a table named "Persons"
SELECT FirstName FROM Persons

-- select all the records from a table named "Persons" where the value of the column "FirstName" is "Peter"
SELECT * FROM Persons
WHERE FirstName = "Peter";

-- select all the records from a table named "Persons" where the value of the column "FirstName" starts with an "a"
SELECT * FROM Persons
Where FirstName LIKE "A%";

-- select all the records from a table named "Persons" where the "FirstName" is "Peter" and the "LastName" is "Jackson"
SELECT * FROM Persons
WHERE FirstName = "Peter" AND LastName = "Jackson";

-- select all the records from a table named "Persons" where the "LastName" is alphabetically between (and including) "Hansen" and "Pettersen"
SELECT * FROM Persons
WHERE LastName BETWEEN "Hansen" AND "Pettersen";

-- write an SQL statement that is used to return only different values
SELECT DISTINCT;

-- how can you return all the records from a table named "Persons" sorted descending by "FirstName"
-- Sort by descending includes adding a DESC at the end of the ORDER BY clause
SELECT * FROM Persons
ORDER BY FirstName DESC;

-- how can you insert "Olsen" as the "LastName" in the "Persons" table
INSERT INTO Persons (LastName) VALUES ("Olsen");

-- change "Hansen" into "Nilsen" in the "LastName" column in the Persons table
UPDATE Persons
SET LastName = "Hansen"
WHERE LastName = "Nilsen";

-- how can you delete the records where the "FirstName" is "Peter" in the Persons Table
DELETE FROM Persons
WHERE FirstName = "Peter";

-- how can you return the number of records in the "Persons" table
SELECT COUNT(*) FROM Persons;

-- which operator is used to select values within a range
BETWEEN




-- SQL Queries from the Microsoft Certified: Power BI Data Analyst Associate
-- Selecting and importing every column from the SALES table
SELECT * FROM SALES;

-- Select ID, NAME, SALESAMOUNT from the SALES table
SELECT ID, NAME, SALESAMOUNT FROM SALES;

-- Select ID, NAME, SALESAMOUNT from the SALES table BUT only the data after the date January 1st 2020 and ordered by the date
SELECT ID, NAME, SALESAMOUNT FROM SALES
WHERE OrderDate >= '1/1/2020'
ORDER BY OrderDate;

-- Instead of selecting normally as
SELECT CustomerPostalCode FROM Sales.Customer;
-- And potentially having a data type error
-- you can type cast the SQL query to eliminate the possibility of data source errors

SELECT CAST (CustomerPostalCode as varchar(10)) FROM Sales.Customer;



/*
    An example query for practicing JOIN clauses in SQL

    Notice that the "CustomerID" column in the "Orders" table refers to the
    "CustomerID" column in the "Customers" table.

    Both tables share a relationship w.r.t. to the "CustomerID" column
 */

CREATE TABLE Orders
(
    OrderID INTEGER NOT NULL,
    CustomerID INTEGER NOT NULL,
    OrderDate DATE NOT NULL,
    ShipperID INTEGER NOT NULL,
    EmployeeID INTEGER NOT NULL,
    PRIMARY KEY(CustomerID)
);

INSERT INTO Orders(OrderID, CustomerID, OrderDate)
VALUES
(10308, 2, '1996-09-18', 3, 7),
(10309, 37, '1996-09-19', 1, 3),
(10310, 77, '1996-09-20', 2, 8);


CREATE TABLE Customers
(
    CustomerID INTEGER NOT NULL AUTO_INCREMENT,
    CustomerName VARCHAR(100) NOT NULL,
    ContactName VARCHAR(30) NOT NULL,
    Country VARCHAR(15),
    PostalCode INTEGER(50) NOT NULL,
    PRIMARY KEY(CustomerID)
);

INSERT INTO Customers(CustomerID, CustomerName, ContactName, Country)
VALUES
(1, 'Alfreds Futterkiste', 'Maria Anders', 'Germany', 12209),
(2, 'Ana Trujilo Emparedados y helados', 'Ana Trujilo', 'Mexico', 05021),
(3, 'Antonio Moreno Taqueria', 'Antonio Moreno', 'Mexico', 05023);

-- A more complicated SQL query involving JOIN and ON clauses - aswell as renaming columns into specific names using 'as'
-- SQL Notes:
/*
    JOIN Clause
    used to combine rows from two or more tables, based on a related column between them

    INNER JOIN clause
    e.g., selecting records that have matching values in both tables
 */

-- (INNER) JOIN - returns records that HAVE MATCHING VALUES IN BOTH TABLES:
SELECT Orders.OrderID, Customers.CustomerName, Orders.OrderDate -- THis will be the query data, e.g., column1 = Order ID, column2 = Customer Name, column3 = Order Date
FROM Orders
INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID;
-- This will return (10308, Ana Trujilo... , 1996-09-18)
-- This has found a matched values based on the same CustomerIDs on both tables

SELECT * FROM Orders
INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID;


SELECT TOP 20 pc.Name as CategoryName
, p.name as ProductName
FROM SalesLT.ProductCategory pc
INNER JOIN SalesLT.Product p
ON pc.productcategoryid = p.productcategoryid;


SELECT ord.OrderDate as OrderDate
, cst.Country as OrderOriginCountry
WHERE ord.OrderDate >= '1/1/2021'
FROM Orders ord
INNER JOIN Customers cst
ON ord.CustomerID = cst.CustomerID
ORDER BY OrderDate;



/*
LEFT (OUTER) JOIN - returns ALL RECORDS FROM THE LEFT TABLE (table1), and the MATCHED RECORDS FROM THE RIGHT TABLE (table2),
The result is 0 RECORDS from the right side IF THERE ARE NO MATCHES

General syntax:
 */
SELECT column_name(s)
FROM table_1
LEFT JOIN table_2
ON table_1.column_name = table_2.column_name;
-- Note: LEFT JOIN returns ALL RECORDS FROM THE LEFT table (Customers), even if THERE ARE NO MATCHES in the RIGHT TABLE (Orders)

SELECT cst.CustomerName as CustomerName
, ord.OrderID
FROM Customers cst
LEFT JOIN Orders ord
ON cst.CustomerID = ord.CustomerID
ORDER BY cst.CustomerName;

-- Another example: select all customers, and any orders they might have:

SELECT cst.CustomerName as CustomerName
, ord.OrderID as OrderID
, ord.OrderDate as OrderDate
FROM Customers cst
LEFT JOIN Orders ord
ON cst.CustomerID = ord.CustomerID
ORDER BY cst.CustomerName;
-- All customers (table_1) will be kept whereas only matches for the customerID from the orders (table_2) table will be kept.



/*
RIGHT (OUTER) JOIN - returns ALL RECORDS FROM THE RIGHT TABLE (table_2), and the MATCHED RECORDS FROM THE LEFT TABLE (table_1)
The result is 0 RECORDS from the left side, IF THERE ARE NO MATCHES

Note that RIGHT JOIN can also be called RIGHT OUTER JOIN in some databases

General syntax:
 */
SELECT column_name(s)
FROM table_1
RIGHT JOIN table_2
ON table_1.column_name = table_2.column_name;
-- Note: RIGHT JOIN returns ALL RECORDS FROM THE RIGHT table (Employees), even if THERE ARE NO MATCHES in the LEFT TABLE (Customers)

-- an example case, (this wouldn't work with the created database above)
-- the following statement will return all employees (all table_2 - right values), and any orders (matched table_1 - left values) they might have placed
SELECT ord.OrderID as OrderID
, emp.EmployeeID as EmployeeID
, ord.OrderDate as OrderDate
, emp.LastName as EmployeeLastName
, emp.FirstName as EmployeeFirstName
FROM Orders ord
RIGHT JOIN Employees emp
ON ord.EmployeeID = emp.EmployeeID
ORDER BY emp.EmployeeID;



/*
FULL (OUTER) JOIN - returns ALL RECORDS when there is a MATCH IN EITHER LEFT (table_1) OR RIGHT TABLE (table_2) records

Note: FULL OUTER JOIN and FULL JOIN are the same

Note: FULL OUTER JOIN can return VERY LARGE datasets

FULL OUTER JOIN returns ALL MATCHING RECORDS from BOTH TABLES whether the other table matches or not. In essence, everything is getting posted regardless of present matches

General syntax:
 */
SELECT column_name(s)
FROM table_1
FULL OUTER JOIN table_2
ON table_1.column_name = table_2.column_name
WHERE condition;


-- an example case, (this wouldn't work with the created database above)
-- the following statement selects all customers and all orders for all orders numbered 1500 and higher
SELECT cst.CustomerName as CustomerName
, ord.OrderID as OrderID
FROM Orders ord
FULL OUTER JOIN Customers cst
ON ord.CustomerID = cst.CustomerID
WHERE ord.OrderID >= 1500;


-- A more complex SQL query with the AdventureWorks Dataset on the Azure SQL Server
SELECT p.ProductID as ProductID
, p.Name as ProductName
, p.ProductCategoryID as ProductCategory
, odt.OrderQty as OrderQuantity
, odt.UnitPrice as IndividualUnitPrice
, odt.ModifiedDate as OrderDate
FROM SalesLT.Product p
INNER JOIN SalesLT.SalesOrderDetail odt
ON p.ProductID = odt.ProductID
WHERE odt.ModifiedDate > '2008-01-01'
ORDER BY p.ProductID;

/*
UNION operator
used to combine the result-set of two or more SELECT statements

NOTE THAT
    Every SELECT statement within UNION must have the same number of columns
    The columns must also have similar data types
    The columns in every SELECT statement must also be in the same order
 

UNION operator selects only distinct values by default
EXAMPLE SYNTAX CODE
 */
SELECT column_name(s) FROM table_1
UNION
SELECT column_name(s) FROM table_2;

-- The following SQL statement (using UNION) returns the cities (only distinct values) from both the "Customers" and the "Suppliers" table
SELECT City FROM Customers cst
UNION
SELECT City FROM Suppliers spl
ORDER BY City;
-- Note: If some customers/suppliers HAVE THE SAME CITY, each city will only be listed once
--                          this is because UNION selects ONLY distinct values
--       Use UNION ALL to also select duplicate values


/*
UNION ALL operator

to allow duplicate values, when combining the result-set of two or more SELECT statements
 */
SELECT column_name(s) FROM table_1
UNION ALL
SELECT column_name(s) FROM table_2;

-- NOTE: The column names in the result-set are usually equal to the column name in the first SELECT statement

-- The following SQL statement returns the cities (only distinct values) from BOTH the "Customers" and the "Suppliers" table
SELECT City FROM Customers cst
UNION ALL
SELECT City FROM Suppliers spl
ORDER BY City;



-- the following statement selects all customers and all orders for all order IDs numbered 1500 and higher
SELECT CAST (cst.CustomerID as INTEGER()) as CustomerID
, CAST (cst.FirstName as varchar(20)) as FirstName
, CAST (cst.LastName as varchar(25)) as LastName
, ord.OrderID as OrderID
, ord.Date as OrderDate
, ord.Country as OrderCountry
FROM Customers cst
FULL OUTER JOIN Orders ord
ON cst.CustomerID = ord.CustomerID
WHERE EXISTS (cst.OrderID >= 1500)
ORDER BY cst.LastName;


-- These queries are meant to be used with the `PopSQL Sample Data` connection through the PopSQL Application
-- Bar chart
select
    country_code,
    count(1)
from
    city
group by
    1
limit
    10;

-- Scatter chart
select
    indep_year,
    count(1)
from
    country
where
    indep_year > 1800
group by
    1;

-- Line chart
with
    hours as (
        select
            generate_series(
                date_trunc('hour', now()) - '1 day' :: interval,
                date_trunc('hour', now()),
                '1 hour' :: interval
            ) as hour
    )
select
    hours.hour,
    random() * 1000 as metric
from
    hours;

-- Other queries
select
    *
from
    country;

select
    *
from
    city
where
    country_code = 'USA';