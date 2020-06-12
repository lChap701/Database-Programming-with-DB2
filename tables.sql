/* Created by Lucas Chapman 6/10/20 */
/* CREATE TABLE statements */
-- NOT NULL constraint needs specified for columns with the PRIMARY KEY constraint in DB2
CREATE TABLE Customers (
	CustomerID CHAR(4) NOT NULL PRIMARY KEY,
	FirstName VARCHAR(12) NOT NULL,
	LastName VARCHAR(12) NOT NULL,
	UnitNumber INT NOT NULL CHECK (UnitNumber <= 999 AND UnitNumber > 0),
	Street VARCHAR(20) NOT NULL,
	City VARCHAR(20) NOT NULL,
	ST VARCHAR(2) NOT NULL,	-- ST stands for State
	Zip INT NOT NULL CHECK (Zip <= 99999 AND Zip >= 10000), 
	Email VARCHAR(30),
	Recurring CHAR(1) NOT NULL DEFAULT 'N' CHECK (Recurring = 'Y' OR Recurring = 'N') -- for recurring customers 
	);

CREATE TABLE Orders ( 
	OrderID CHAR(4) NOT NULL PRIMARY KEY,
	CustomerID CHAR(4) NOT NULL,
	OrderDate DATE NOT NULL,						-- date the order was placed
	ShippedDate DATE,								-- date the order was shipped
	ArrivalDate DATE,								-- date order arrived to customer
	ShippingCity VARCHAR(20),						-- the city the order was shipped at
	ShippingState VARCHAR(2),						-- the state the order was shipped at
	ShippingFee DEC(3,2) CHECK (ShippingFee > 0),	-- if there is free shipping, it's left null
	CONSTRAINT FK_CustomerID FOREIGN KEY (CustomerID) 
	REFERENCES Customers(CustomerID)
	);

CREATE TABLE Company (
	CompanyID CHAR(4) NOT NULL PRIMARY KEY,
	CompanyName VARCHAR(25) NOT NULL,
	Address VARCHAR(52),	-- includes unit number, street, city, state, and zip code
	EmailAddress VARCHAR(30),
	Phone VARCHAR(16)
	);

CREATE TABLE Laptops (
	LaptopID CHAR(4) NOT NULL PRIMARY KEY,
	CompanyID CHAR(4) NOT NULL,
	LaptopName VARCHAR(25) NOT NULL,
	ProductNumber VARCHAR(10) NOT NULL,
	Serial VARCHAR(8) NOT NULL,
	OS VARCHAR(15),
	Year INT NOT NULL CHECK (Year >= 1990 AND Year <= 9999),
	Storage DEC(4,1) CHECK (Storage > 0),
	CPU VARCHAR(20),
	RAM DEC(4,1) CHECK (RAM > 0),
	Price DEC(8,2) NOT NULL CHECK (Price > 0),
	Warranty INT CHECK (Warranty > 0 AND Warranty <= 9), -- if there is no warranty, it's left null
	CONSTRAINT FK_CompanyID FOREIGN KEY (CompanyID) 
	REFERENCES Company(CompanyID)
	);

CREATE TABLE LaptopOrders (
	OrderID CHAR(4) NOT NULL,
	LaptopID CHAR(4) NOT NULL,
	Quantity INT NOT NULL CHECK (Quantity > 0 AND Quantity <= 999),
	OrderCost DEC(11,2) NOT NULL CHECK (OrderCost > 0), -- the total cost of the order with discounts and fees based on LaptopID
	Deals DEC(2,2) CHECK (Deals > 0),					-- written as a percent and if there are no deals, it's left null
	CONSTRAINT FK_OrderID FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
	CONSTRAINT FK_LaptopID FOREIGN KEY (LaptopID) REFERENCES Laptops(LaptopID)
	);

/* INSERT INTO... VALUES statements */
/* Customers table */
INSERT INTO Customers
VALUES ('1000', 'Lucas', 'Chapman', 999, 'Downtown Ave. Street', 'Ottumwa', 'IA', 99999, 'elchapo9998887777666@gmail.com', 'N');

INSERT INTO Customers 
VALUES ('1001', 'Lolabolafola', 'Jeffersonman', 9, 'Avenue Street', 'Centerville', 'IA', 91999, 'realemail@gmail.com', 'Y');

INSERT INTO Customers 
VALUES ('1002', 'Bowie', 'Thomas', 9, 'Avenue Street', 'Iowa City', 'IA', 99929, NULL, 'Y');

INSERT INTO Customers 
VALUES ('1003', 'Jeff', 'Tobias', 425, 'W. Avenue Street', 'Kanas City', 'MO', 11021, NULL, 'N');

INSERT INTO Customers 
VALUES ('1004', 'John', 'Smith', 112, 'Skid Row Street', 'Mattison', 'MO', 11012, NULL, 'Y');

/* Orders table */
-- DATE format: YYYY-MM-DD
INSERT INTO Orders 
VALUES ('1000', '1001', '2020-05-17', '2020-06-01', '2020-06-17', 'New York City', 'NY', 9.99);

INSERT INTO Orders 
VALUES ('1001', '1004', '2020-05-07', '2020-05-21', '2020-06-01', 'Washington D.C.', 'WA', NULL);

INSERT INTO Orders 
VALUES ('1002', '1000', '2020-06-01', '2020-06-02', '2020-06-10', 'Chicago', 'IL', 1.25);

INSERT INTO Orders (OrderID, CustomerID, OrderDate)
VALUES ('1003', '1002', '2020-06-02');

INSERT INTO Orders (OrderID, CustomerID, OrderDate, ShippedDate, ShippingCity, ShippingState, ShippingFee)
VALUES ('1004', '1003', '2020-06-08', '2020-06-16', 'Des Moines', 'IA', 5.75);

INSERT INTO Orders (OrderID, CustomerID, OrderDate)
VALUES ('1005', '1004', '2020-06-18');

/* Company table */
INSERT INTO Company 
VALUES ('1000', 'Microsoft', '1 Microsoft Way, Redmond, WA 98052', 'microsoft@gmail.com', '1 (425) 882-8080');

INSERT INTO Company 
VALUES ('1001', 'Apple', '1 Apple Park Way, Cupertino, CA 95014', 'apple@gmail.com', '1 (408) 996-1010');

INSERT INTO Company (CompanyID, CompanyName)
VALUES ('1002', 'A Real Company That Cares');

INSERT INTO Company
VALUES ('1003', 'Lenovo', '8001 Development Drive, Morrisville, NC 27560', 'lenovo@gmail.com', '1 (855) 253-6686');

INSERT INTO Company
VALUES ('1004', 'Computing Inc.', '1234 Keepers Townshed Drive, Mattisonville, IA 99110', 'therealcomputinginc1@gmail.com', NULL);

/* Laptops table */
INSERT INTO Laptops
VALUES ('1000', '1003', 'ThinkPad X390', 'POKL1199A2', 'MN112AS1', 'Windows 10', 2019, 599.7, 'Intel Core i9-99GHz', 234.9, 677.99, 2);

INSERT INTO Laptops
VALUES ('1001', '1000', 'Business Surface Laptop 3', '1JKLL09ZZ5', 'KL11A8IQ', 'Windows 10', 2019, 999.9, 'Intel Core i9-999GHz', 999.9, 999999.99, 9);

INSERT INTO Laptops (LaptopID, CompanyID, LaptopName, ProductNumber, Serial, Year, Price)
VALUES ('1002', '1004', 'Smarts Surfaces', '10ZQLP284W', 'PL825WD2', 2020, 1999.99);

INSERT INTO Laptops 
VALUES ('1003', '1001', 'MacBook Pro Air', 'LK17ABE21Y', 'AL16A14R', 'macOS', 2019, 234.5, 'Intel Core i9-75GHz', 111.1, 599.99, 5);

INSERT INTO Laptops (LaptopID, CompanyID, LaptopName, ProductNumber, Serial, Year, Storage, RAM, Price)
VALUES ('1004', '1002', 'Smart Laptop', 'AR16MB23JQ', 'TBQ18NB4', 2020, 534.5, 221.3, 799.99);

INSERT INTO Laptops (LaptopID, CompanyID, LaptopName, ProductNumber, Serial, OS, Year, Price)
VALUES ('1005', '1000', 'Surface Pro 7', 'AQM109MK15', 'BET729I1', 'Windows 10', 2020, 899.99);

/* LaptopOrders table */
INSERT INTO LaptopOrders
VALUES ('1000', '1001', 999, 999000000.00, NULL);

INSERT INTO LaptopOrders
VALUES ('1000', '1003', 99, 59409.00, NULL);

INSERT INTO LaptopOrders
VALUES ('1001', '1000', 9, 5491.72‬, .10);

INSERT INTO LaptopOrders 
VALUES ('1002', '1002', 5, 100.01, .99‬);

INSERT INTO LaptopOrders
VALUES ('1002', '1004', 1, 681.05, .15);

INSERT INTO LaptopOrders
VALUES ('1003', '1001', 1, 799999.99, .20);

INSERT INTO LaptopOrders
VALUES ('1004', '1003', 2, 723.44, .40);

INSERT INTO LaptopOrders
VALUES ('1005', '1005', 1, 899.99, NULL);