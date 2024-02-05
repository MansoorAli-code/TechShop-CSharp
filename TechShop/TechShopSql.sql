-- TASK:1
-- 1st question: Create the database named "TechShop"
create database TechShop;

/*   2nd question: Define the schema for the Customers, Products, Orders, OrderDetails and 
  Inventory tables based on the provided schema    */

create table customers(
customerID int primary key,
FirstName varchar(20),
LastName varchar(20),
Email varchar(20),
Phone varchar(20),
Address varchar(20));

create table Products(
ProductID int primary key,
ProductName varchar(20),
Description varchar(50),
Price int);

create table Orders(
OrderID int primary key,
CustomerID int,
Foreign key(CustomerID) references Customers(CustomerID),
OrderDate date,
TotalAmount int);

create table OrderDetails(
OrderDetailID int primary key,
OrderID int,
Foreign key(OrderID) references Orders(OrderID),
ProductID int,
Foreign key(ProductID) references Products(ProductID),
Quantity int);

create table Inventory(
InventoryID int primary key,
ProductID int,
Foreign key(ProductID) references Products(ProductID),
QuantityInStock int,
LastStockUpdate date);

-- 3rd question: Insert at least 10 sample records into each of the following tables
Insert into customers(customerID, FirstName, LastName, Email, Phone, Address)
values 
(1, 'Mansoor', 'Ali', 'mansoorali@gmail.com', '7989104346', 'HYD'),
(2, 'Divya', 'Nedari', 'nedadivya@gmail.com', '8782547293', 'KMNR'),
(3, 'Prakas', 'kakre', 'krprakash@gmail.com', '6893003949', 'HYD'),
(4, 'Saketh', 'Sunki', 'sakethsun@gmail.com', '8643762691', 'USA'),
(5, 'Vishal', 'Bagi', 'Vishalbagi@gmail.com', '8684444949', 'SRC');

Insert into Products(ProductID, ProductName, Description, Price)
values
(1,'Laptop', 'Professional usage', 135000),
(2,'Phone', 'Daily use', 18500),
(3,'Iron Box', 'To Iron Clothes', 7500),
(4,'Bluetooth', 'To Listen Songs', 39500),
(5,'Clock', 'For Time', 530),


UPDATE Products
SET category = 'Electronic Gadgets'
where ProductName='Laptop' or ProductName='Phone' or ProductName='Iron Box' or ProductName='Bluetooth' or
ProductName='Fridge' or ProductName='Washing Machine' or ProductName='SmartWatch';

Insert into Orders(OrderID, CustomerID, OrderDate, TotalAmount)
values
(1, 1, '2024-01-10', 9920),
(2, 2, '2024-01-11', 89999),
(3, 3, '2024-01-12', 99599),
(4, 4, '2024-01-13', 19920),
(5, 5, '2024-01-14', 5900),


Insert into OrderDetails(OrderDetailID, OrderID, ProductID, Quantity)
values
(1, 1, 1, 2),
(2, 2, 3, 1),
(3, 3, 5, 3),
(4, 4, 7, 6),
(5, 5, 2, 2),


Insert into Inventory(InventoryID, ProductID, QuantityInStock, LastStockUpdate)
values
(1, 1, 50, '2024-01-10'),
(2, 2, 40, '2024-01-11'),
(3, 3, 500, '2024-01-12'),
(4, 4, 540, '2024-01-13'),
(5, 5, 750, '2024-01-14'),



-- TASK:2  Select, Where, Between, AND, LIKE
-- 1st question: Write an SQL query to retrieve the names and emails of all customers. 
select firstname,lastname, Email from customers;

-- 2nd question: Write an SQL query to list all orders with their order dates and corresponding customer names.
select o.OrderID, o.OrderDate, c.FirstName, c.LastName
from Orders o
Join customers c
on o.customerID = c.customerID;

/*   3rd question: Write an SQL query to insert a new customer record into the "Customers" table. 
  Include customer information such as name, email, and address.    */
Insert into customers(customerId,FirstName,LastName,Email,Phone,Address)
values (11, 'Mikasa', 'Ackerman', 'mikasa@gmail.com', 9729301779,'AOT');
select * from customers;

-- 4th question: Write an SQL query to update the prices of all electronic gadgets in the "Products" table by increasing them by 10%.
Update Products set price = Price * 1.10 where 
ProductName='Laptop' or
ProductName='Phone' or
ProductName='Iron Box' or
ProductName='Fridge' or
ProductName='Washing Machine';
select * from products;

/*    5th question: Write an SQL query to delete a specific order and its associated order details 
   from the "Orders" and "OrderDetails" tables. Allow users to input the order ID as a parameter.  */
Declare @OrderID int;
Set @OrderID = 6;
Delete from OrderDetails where OrderID= @OrderID;
Delete from Orders where OrderID=@OrderID;

Select * from OrderDetails;
Select * from Orders;

/* 6th question:  Write an SQL query to insert a new order into the "Orders" table. Include the customer ID,
order date, and any other necessary information  */
Insert into Orders(OrderID, CustomerID, OrderDate, TotalAmount) 
values (11, 11, '2024-01-20', 6999);
select * from Orders;

/* 7th question: Write an SQL query to update the contact information (e.g., email and address) of a specific
 customer in the "Customers" table. Allow users to input the customer ID and new contact information.  */
Declare @CustomerID int;
SET @CustomerID = 1;
Update Customers
SET Email='sathwik@gmail.com', Address='Gajwel'
where customerId=@CustomerID;
select * from customers;

/*   8th question: Write an SQL query to recalculate and update the total cost of each order in the 
"Orders" table based on the prices and quantities in the "OrderDetails" table. */
UPDATE Orders
SET TotalAmount=(
Select SUM(pd.Price*od.Quantity) 
From OrderDetails od,Products pd
where od.OrderID=pd.ProductID 
and 
od.OrderID=Orders.OrderID
);
select * from Orders;

/*     9) Write an SQL query to delete all orders and their associated order details for a specific
   customer from the "Orders" and "OrderDetails" tables. Allow users to input the customer ID
as a parameter.   */
Declare @Customer_ID int;
SET @Customer_ID = 1;
Delete from OrderDetails where OrderID in
(select OrderID from Orders where CustomerID= @Customer_ID);
Delete from Orders where CustomerID=@Customer_ID ;
select * from Orders;
select * from OrderDetails;

/*    10th question: . Write an SQL query to insert a new electronic gadget product into the "Products" table,
 including product name, category, price, and any other relevant details.    */
Alter table Products 
add category varchar(50);
Insert into Products(ProductID,ProductName,Description,Price,Category)
values(11,'Geyser','To heat water',14999,'Electronic Gadgets');
select * from products;

/*   11th question : Write an SQL query to update the status of a specific order in the "Orders" table 
 (e.g., from "Pending" to "Shipped"). Allow users to input the order ID and the new status.   */
Alter table Orders
add status varchar(50);

Declare @OrderId int;
Declare @NewStatus Varchar(50);

SET @OrderID = 7;
SET @NewStatus = 'Shipped';
Update Orders 
SET Status = @NewStatus
where OrderID=@OrderID;
select * from Orders;

/*   12th question : Write an SQL query to calculate and update the number of orders placed by
 each customer in the "Customers" table based on the data in the "Orders" table.   */
Alter table Customers
Add NoOfOrders int;
Update customers
SET NoOfOrders=(
select count(OrderID)
From Orders
where Orders.CustomerID=customers.customerId);
Select * from customers;


-- TASK:3   Aggregate functions, Having, Order By, GroupBy and Joins
/* 1st question: Write an SQL query to retrieve a list of all orders along with customer information 
(e.g.,customer name) for each order.  */
Select Orders.OrderID, customers.FirstName, customers.LastName, customers.Email, customers.Phone, customers.Address
From Orders
Join customers on
Orders.customerId = Customers.customerID;

/* 2nd question: Write an SQL query to find the total revenue generated by each electronic gadget product.
Include the product name and the total revenue.   */
select Products.ProductName, SUM(Orders.TotalAmount) as TotalRevenue
from Products
join OrderDetails on Products.ProductID = OrderDetails.ProductID
join Orders on OrderDetails.OrderID = Orders.OrderID
where Products.category = 'Electronic Gadgets'
group by Products.ProductName;

/* 3rd question: Write an SQL query to list all customers who have made at least one purchase. 
Include their names and contact information.    */
select customers.FirstName, customers.LastName, customers.Email, customers.Phone, customers.Address
from customers
join Orders on customers.customerId = Orders.CustomerID;

/* 4th question: Write an SQL query to find the most popular electronic gadget, which is the one with
the highest total quantity ordered. Include the product name and the total quantity ordered.    */
select TOP 1 Products.ProductName, SUM(OrderDetails.Quantity) as OrderedQuantity
from Products
join OrderDetails on Products.ProductID = OrderDetails.ProductID
where category = 'Electronic Gadgets' 
group by Products.ProductName
Order by OrderedQuantity Desc;

/* 5th question: Write an SQL query to retrieve a list of electronic gadgets along with their corresponding
categories  */
select ProductName, category from Products
where category = 'Electronic Gadgets';

select * from Products

/* 6th question: Write an SQL query to calculate the average order value for each customer. Include the
customer's name and their average order value.   */
select customers.FirstName, customers.LastName, AVG(Orders.TotalAmount) as AvgOrderValue
from customers
join Orders on customers.customerId = Orders.OrderID
group by customers.FirstName, customers.LastName;

/* 7th question: Write an SQL query to find the order with the highest total revenue. Include the order ID,
customer information, and the total revenue.   */
select TOP 1 Orders.OrderID, customers.FirstName, customers.LastName, SUM(Orders.TotalAmount) as TotalRevenue
from Orders
join customers on Orders.CustomerID = customers.customerId
group by Orders.OrderID, customers.FirstName, customers.LastName
order by TotalRevenue DESC;

/* 8th question: Write an SQL query to list electronic gadgets and the number of times each product has been
ordered.   */
select Products.ProductName, Count(OrderDetails.OrderID) as OrderCount
from Products
join OrderDetails on Products.ProductID = OrderDetails.ProductID
where category='Electronic Gadgets'
group by Products.ProductName;

/* 9th question: Write an SQL query to find customers who have purchased a specific electronic gadget product.
Allow users to input the product name as a parameter.  */
Declare @ProductName varchar(50);
SET @ProductName = 'Phone';
select customers.customerId ,customers.FirstName, customers.LastName, Products.ProductName
from customers
join Orders on customers.customerId = Orders.CustomerID
join OrderDetails on Orders.OrderID = OrderDetails.OrderID
join Products on OrderDetails.ProductID = Products.ProductID 
where products.ProductName = @ProductName
group by customers.customerId, customers.FirstName, customers.LastName, Products.ProductName;

/* 10th question: Write an SQL query to calculate the total revenue generated by all orders placed within a
specific time period. Allow users to input the start and end dates as parameters.    */

select SUM(TotalAmount) as Total_Revenue
From Orders
where OrderDate between '2024-01-14' and '2024-01-20';


-- TASK:4   Subquery and its type
-- 1st question: Write an SQL query to find out which customers have not placed any orders.
select customers.FirstName, customers.LastName
from customers
where customerId NOT IN (SELECT customerId from Orders);

-- 2nd question : Write an SQL query to find the total number of products available for sale. 
select count(ProductId) as Total_Products
From Products;

-- 3rd question : Write an SQL query to calculate the total revenue generated by TechShop. 
select Sum(TotalAmount) as Total_Revenue
from Orders;

/* 4th question : Write an SQL query to calculate average quantity ordered for products in a specific category.
Allow users to input the category name as a parameter.    */
Declare @CategoryName varchar(50);
SET @CategoryName = 'Electronic Gadgets';
select AVG(OrderDetails.Quantity) as AvgQuantityOrdered
from OrderDetails
where ProductID IN (SELECT ProductID from Products where category = @CategoryName);

/*  5th question: Write an SQL query to calculate the total revenue generated by a specific customer.
Allow users to input the customer ID as a parameter.   */
Declare @CustomerID int;
SET @CustomerID = 3;
select sum(TotalAmount) as Total_Revenue
from Orders
where CustomerID=@CustomerID;

/* 6th question: Write an SQL query to find the customers who have placed the most orders. 
List their names and the number of orders they've placed.   */
SELECT TOP 3 customers.FirstName,customers.LastName,
(
SELECT COUNT(OrderID) 
FROM Orders 
WHERE customers.CustomerID = Orders.CustomerID
) AS OrderCount
FROM customers
ORDER BY OrderCount DESC;

/* 7th question: Write an SQL query to find the most popular product category, 
which is the one with the highest total quantity ordered across all orders.    */
Select TOP 1 category, (
select SUM(OrderDetails.Quantity) From OrderDetails
where OrderDetails.ProductID = Products.ProductID) as TotalQuantity
From Products
Order by TotalQuantity Desc;

/* 8th question: Write an SQL query to find the customer who has spent the most money (highest total revenue)
on electronic gadgets. List their name and total spending.    */
SELECT TOP 1 customers.FirstName, customers.LastName,
(
SELECT SUM(Orders.TotalAmount)
FROM Orders
WHERE Customers.customerId = Orders.CustomerID
AND Orders.OrderID IN (
SELECT ProductID
FROM Products
WHERE Products.ProductName = 'Washing Machine'
)
) as total_spending FROM Customers 
ORDER BY total_spending;
select * from Orders

/* 9th question: Write an SQL query to calculate the average order value (total revenue divided by 
the number of orders) for all customers    */
SELECT customers.FirstName, customers.LastName,
(
SELECT  AVG(Orders.TotalAmount) from Orders 
Where customers.customerId=Orders.CustomerID
) as averageOrderValue
From customers;

/* 10th question: Write an SQL query to find the total number of orders placed by each customer and 
list their names along with the order count     */
select customers.FirstName, customers.LastName,
( 
select COUNT(OrderID) from Orders
where customers.customerId = Orders.CustomerID
) as OrderCount
From customers;
--
-- select count(CustomerId) from Orders where CustomerId = 6;
select * from OrderDetails;