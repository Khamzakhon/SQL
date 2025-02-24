create database SQL_05_practice
use SQL_05_practice
--------------------------------------------------------------------
--#Puzzle 3
CREATE TABLE Orders_A (
    OrderID INT PRIMARY KEY,
    ProductName VARCHAR(50),
    Quantity INT
);

-- DDL for the second table
CREATE TABLE Orders_B (
    OrderID INT PRIMARY KEY,
    ProductName VARCHAR(50),
    Quantity INT
);

-- Sample data for Orders_A
INSERT INTO Orders_A VALUES (1, 'ProductA', 5);
INSERT INTO Orders_A VALUES (2, 'ProductB', 10);
INSERT INTO Orders_A VALUES (3, 'ProductC', 8);

-- Sample data for Orders_B
INSERT INTO Orders_B VALUES (4, 'ProductD', 15);
INSERT INTO Orders_B VALUES (5, 'ProductE', 7);
INSERT INTO Orders_B VALUES (6, 'ProductF', 12);


select * from Orders_A
union all
select * from Orders_B

--------------------------------------------------------------------

--2 Puzzle 5
-- DDL for the Customers table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50)
);

-- DDL for the VIPCustomers table
CREATE TABLE VIPCustomers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50)
);

-- Sample data for Customers
INSERT INTO Customers VALUES (1, 'John Doe');
INSERT INTO Customers VALUES (2, 'Jane Smith');
INSERT INTO Customers VALUES (3, 'Bob Johnson');
INSERT INTO Customers VALUES (4, 'Alice Williams');
INSERT INTO Customers VALUES (5, 'Charlie Brown');

-- Sample data for VIPCustomers
INSERT INTO VIPCustomers VALUES (2, 'Jane Smith');
INSERT INTO VIPCustomers VALUES (4, 'Alice Williams');
INSERT INTO VIPCustomers VALUES (6, 'Eve White');

;

select * from Customers
select * from VIPCustomers

--1.1
select A.CustomerID, B.CustomerName from Customers as A
join VIPCustomers as B
on A.CustomerID=B.CustomerID
--1.2
select A.CustomerID, A.CustomerName from Customers as A
left join VIPCustomers as B
on A.CustomerID=B.CustomerID
where B.CustomerID is null
--1.3
select B.CustomerID, B.CustomerName from Customers as A
right join VIPCustomers as B
on B.CustomerID=A.CustomerID
where A.CustomerID is null

--------------------------------------------------------------------

--3 
-- Create table
CREATE TABLE GroupbyMultipleColumns
(
    ID INT,
    Typ VARCHAR(1),
    Value1 VARCHAR(1),
    Value2 VARCHAR(1),
    Value3 VARCHAR(1)
);

-- Insert Data
INSERT INTO GroupbyMultipleColumns(ID, Typ, Value1, Value2, Value3)
VALUES
    (1, 'I', 'a', 'b', ''),
    (2, 'O', 'a', 'd', 'f'),
    (3, 'I', 'd', 'b', ''),
    (4, 'O', 'g', 'l', ''),
    (5, 'I', 'z', 'g', 'a'),
    (6, 'I', 'z', 'g', 'a');
-- solution (it turns that the column has only 1 letter that is in search)
select Typ, count(ID) from GroupbyMultipleColumns
where Value1='a' or Value2='a' or Value3='a'
group by Typ

select Typ, count(*) as cnt from
				(
				select Typ, Value1 as VAL from GroupbyMultipleColumns
				union all 
				select Typ, Value2 from GroupbyMultipleColumns
				union all 
				select Typ, Value3 from GroupbyMultipleColumns
				) AS unpivoted
where VAL='a'
group by Typ
				


--------------------------------------------------------------------
/* solution from GPT

SELECT Typ, COUNT(*) AS a_count
FROM (
    SELECT Typ, Value1 AS Val FROM GroupbyMultipleColumns
    UNION ALL
    SELECT Typ, Value2 FROM GroupbyMultipleColumns
    UNION ALL
    SELECT Typ, Value3 FROM GroupbyMultipleColumns
) AS unpivoted
WHERE Val = 'a'
GROUP BY Typ;
*/

-----------------------------------------------------------------------------------

--4
--need to count fruits 


CREATE TABLE FruitCount
(
    Name VARCHAR(20),
    Fruit VARCHAR(25)
);
--Insert Data
INSERT INTO FruitCount(Name, Fruit) 
VALUES
    ('Neeraj', 'MANGO'),
    ('Neeraj', 'MANGO'),
    ('Neeraj', 'MANGO'),
    ('Neeraj', 'APPLE'),
    ('Neeraj', 'ORANGE'),
    ('Neeraj', 'LICHI'),
    ('Neeraj', 'LICHI'),
    ('Neeraj', 'LICHI'),
    ('Isha', 'MANGO'),
    ('Isha', 'MANGO'),
    ('Isha', 'APPLE'),
    ('Isha', 'ORANGE'),
    ('Isha', 'LICHI'),
    ('Gopal', 'MANGO'),
    ('Gopal', 'MANGO'),
    ('Gopal', 'APPLE'),
    ('Gopal', 'APPLE'),
    ('Gopal', 'APPLE'),
    ('Gopal', 'ORANGE'),
    ('Gopal', 'LICHI'),
    ('Mayank', 'MANGO'),
    ('Mayank', 'MANGO'),
    ('Mayank', 'APPLE'),
    ('Mayank', 'APPLE'),
    ('Mayank', 'ORANGE'),
    ('Mayank', 'LICHI');


select Name, [Apple],[Lichi],[Mango], [Orange] from 
		(
		select Name, Fruit, cnt from FruitCount
		) as SourceTable
		
		pivot 
		(
		COUNT(fruit) for fruit in ('Apple','Lichi','Mango','Orange')) from Fruitcount
		) as PivotTable

