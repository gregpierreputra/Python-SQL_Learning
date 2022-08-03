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
SELECT * FROM students
WHERE students.major IN ('Computer Science', 'Biology', 'Gender Studies') AND students.name IN ('Greg', 'Jason', 'Javid')
ORDER BY students.name, students.student_id;

SELECT students.student_id, students.first_name, students.last_name FROM students
WHERE students.major NOT IN ('Computer Science', 'History') AND students.first_name = 'Elon' AND students.last_name = 'Musk'
ORDER BY students.student_id;

SELECT * FROM students
WHERE students.student_id <= 7
ORDER BY students.last_name, students.first_name;