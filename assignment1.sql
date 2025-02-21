create database SQLassignment

use database SQLassignment


-------------------------------------ASSIGNMENT 1----------------------------------------------


create table salesman1
   ( salesmanid int not null,
    Name VARCHAR(255),
    Commission DECIMAL(10, 2),
    city VARCHAR(255),
    Age INT
)
 INSERT INTO Salesman1 (SalesmanId,Name,Commission,City,Age)
VALUES
    (101, 'Joe', 50, 'California', 17),
    (102, 'Simon', 75, 'Texas', 25),
    (103, 'Jessie', 105, 'Florida', 35),
    (104, 'Danny', 100, 'Texas', 22),
    (105, 'Lia', 65, 'New Jersey', 30);

	select * from salesman1

CREATE TABLE Customer (
    SalesmanId INT,
    CustomerId INT,
    CustomerName VARCHAR(255),
    PurchaseAmount INT,
    );

	INSERT INTO Customer (SalesmanId, CustomerId, CustomerName, PurchaseAmount)
VALUES
    (101, 2345, 'Andrew', 550),
    (103, 1575, 'Lucky', 4500),
    (104, 2345, 'Andrew', 4000),
    (107, 3747, 'Remona', 2700),
    (110, 4004, 'Julia', 4545)

	select * from customer

CREATE TABLE Orders (OrderId int, CustomerId int, SalesmanId int, Orderdate Date, Amount int)

INSERT INTO Orders Values 
(5001,2345,101,'2021-07-01',550),
(5003,1234,105,'2022-02-15',1500)

--1.  Insert a new record in your Orders table.

insert into orders values (5002,4567,103,'2024-3-23',4500)

--2. Add Primary key constraint for SalesmanId column in Salesman table. Add default
-- constraint for City column in Salesman table. Add Foreign key constraint for SalesmanId
 --column in Customer table. Add not null constraint in Customer_name column for the
 --Customer table.

 alter table salesman1 add primary key(salesmanid)                                     --primary key


alter table salesman1 add constraint dfc default 'INDIA'  for city                    --default constraint

insert into salesman1(salesmanid,name,commission,age)  values(111,'Sameer',600,34)
select * from salesman1

-- Two values are inserted in Salesman1 table to maintain the referential integrity.

insert into salesman1 values (107,'Jinnifer',80,'England',28),
(110,'Steve',85,'Portland',25)

alter table customer add foreign key (salesmanID) REFERENCES salesman1(salesmanID)     --foreign key

alter table customer alter column CustomerName varchar(20) not null                    --not null     

--3.Fetch the data where the Customer’s name is ending with ‘N’ also get the purchase
--amount value greater than 500

insert  into customer values (104,4005,'Nitin',6000)
select *from customer where CustomerName like '%N' OR PurchaseAmount > 500


--4.Using SET operators, retrieve the first result with unique SalesmanId values from twotables, 
--and the other result containing SalesmanId with duplicates from two tables.


select salesmanID from salesman1 UNION select salesmanID from Customer

select salesmanID from salesman1 UNION ALL select salesmanID from Customer



--5.Display the below columns which has the matching data.orders o
  Inner join  customer  c
    ON o.SalesmanId = c.SalesmanId
	inner join salesman1 s
	on  s.salesmanid = c.SalesmanId
  WHERE c.PurchaseAmount BETWEEN 500 AND 1500;

--Orderdate, Salesman Name, Customer Name, Commission, and City which has the
--range of Purchase Amount between 500 to 1500.

SELECT o.orderdate,
       s.Name, 
       c.customername, s.commission,s.city,c.PurchaseAmount
        FROM salesman1 s inner join Customer c on  s.salesmanid=c.SalesmanId where
  
--6.Using right join fetch all the results from Salesman and Orders table.

select * from salesman1 right join orders ON salesman1.salesmanid= orders.salesmanid


