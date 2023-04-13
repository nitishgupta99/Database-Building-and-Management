# Creating CUSTOMERS TABLE:
CREATE TABLE customer (
	CustomerID INTEGER,
	FirstName VARCHAR (50),
	LastName VARCHAR (50),
	Address VARCHAR(225),
	Phone VARCHAR(50),
	Country VARCHAR(255),
	City VARCHAR(255),
	PostalCode VARCHAR(50),
	Email VARCHAR(255),
	PRIMARY KEY (CustomerID));

# Creating PRODUCTS TABLE:
CREATE TABLE products (
	ProductID INTEGER,
	ProductName VARCHAR (255),
	SupplierID INTEGER,
	Price INTEGER,
	PRIMARY KEY (ProductID));
  
# Creating ORDERS TABLE:
CREATE TABLE salesorder (
  OrderID INTEGER,
  CustomerID INTEGER,
  EmployeeID INTEGER,
  SupplierID INTEGER,
  OrderDate DATE,
  PRIMARY KEY (OrderID),
    CONSTRAINT fk_has_customer FOREIGN KEY (CustomerID)
      REFERENCES customer (CustomerID),
    CONSTRAINT fk_has_employee FOREIGN KEY (EmployeeID)
      REFERENCES employee (EmployeeID),
    CONSTRAINT fk_has_supplier FOREIGN KEY (SupplierID)
      REFERENCES supplier (SupplierID));

# Creating ORDER DETAILS TABLE:
CREATE TABLE orderdetail (
  OrderDetailID INTEGER,
  OrderID INTEGER,
  ProductID INTEGER,
  Quantity INTEGER,
  InvoiceID INTEGER,
  PRIMARY KEY (OrderDetailID),
    CONSTRAINT fk_has_sale FOREIGN KEY (OrderID)
      REFERENCES salesorder (OrderID),
    CONSTRAINT fk_has_products FOREIGN KEY (ProductID)
      REFERENCES products (productID),
    CONSTRAINT fk_has_invoice FOREIGN KEY (InvoiceID)
      REFERENCES invoice (InvoiceID));

# Creating SUPPLIERS TABLE:
CREATE TABLE supplier (
  SupplierID INTEGER,
  SupplierName VARCHAR (250),
  SupplierPhoneNumber VARCHAR (250),
  PRIMARY KEY (SupplierID));

# Creating EMPLOYEES TABLE:
CREATE TABLE employee (
  EmployeeID INTEGER,
  EmployeeFirstName VARCHAR(255),
  EmployeeLastName VARCHAR (255),
  JobTitle VARCHAR(255),
  PRIMARY KEY(EmployeeID));

# Creating INVOICES TABLE:
CREATE TABLE invoice (
  InvoiceID INTEGER,
  OrderID INTEGER,
  CustomerID INTEGER,
  InvoiceDate DATE,
  InvoiceStatus VARCHAR(300),
  PRIMARY KEY (InvoiceID),
    CONSTRAINT fk_has_order FOREIGN KEY (OrderID)
      REFERENCES salesorder (OrderID),
    CONSTRAINT fk_has_customers FOREIGN KEY (CustomerID)
      REFERENCES customer (CustomerID));
      
# Data Insertion:
Customers:
Insert Into customer (CustomerID, FirstName, LastName, Address, Phone, Country, City, PostalCode, Email) Values
(1, 'Mike' , 'Brat' , '1238 Clark Rd' , '6042531098', 'Canada', 'West Vancouver', 'V7J 1W9', 'brattjohn12@gmail.com'),
(2, 'Michelle' , 'Colin' , '401-33 Shiften Rd' , '352531098', 'Canada', 'Toronto', 'M5T 1X5','mmcolin33@gmail.com');

Products:
Insert Into products Values 
('501', 'Shaypen Black', '011', '44.99'), ('502', 'Red Graystone', '011','55.99');

Orders:
Insert Into salesorder Values 
(110, 1, 5423, 011, '2021-04-20'), (111, 2, 5425,011, '2021-05-01');

Suppliers:
Insert Into supplier(SupplierID, SupplierName, SupplierPhoneNumber) Values 
(011, 'Winistic Watches Limited', '6042604928'), (012, 'Carbon Deluxe Watches', '7783232321');

Employee:
Insert Into employee(EmployeeID, EmployeeFirstName, EmployeeLastName, JobTitle) Values
(5423, 'John', 'Clark', 'Sales Representative'), (5325, 'Sheryll', 'Blake', 'Sales Manager');

Orderdetails:
INSERT INTO orderdetail VALUES
(1662, 110, 501, 2, 53425),
(1862, 111, 502 , 3, 54234);

Invoice
Insert Into invoice(InvoiceID, OrderId, CustomerID, InvoiceDate, InvoiceStatus) Values
(54234, 110, 01, '2021-04-30', 'Shipped'), (53425, 111, 02, '2021-05-02', 'Paid')   


# Establishing 1:1 relationship:
Entities:
SalesOrder
Invoice

#SQL Queries that establishes 1:1 relationship:
Insert Into salesorder Values 
(114, 3, 5325, 011, '2021-08-01');
Insert Into invoice(InvoiceID, OrderId, CustomerID, InvoiceDate, InvoiceStatus) Values
(54236, 114, 03, '2021-08-01', 'Shipped')

# Establishing M:M relationship:
Entities:
ProductID
OrderID.

# SQL Query that establishes M:M relationship:
Insert Into salesorder Values 
(114, 3, 5423, 012, '2021-08-01'),(115,2,5577, 011,'2021-08-02')
INSERT INTO orderdetail VALUES
(1665, 115, 501, 2, 54235), (1666, 116, 501, 4, 54237)

# Creating at least one recursive relationship:
CREATE TABLE Employee (
  EmployeeID INTEGER,
  FirstName VARCHAR(255),
  LastName VARCHAR (255),
  JobTitle VARCHAR(255),
  SupervisorID INTEGER DEFAULT NULL,
  PRIMARY KEY(EmployeeID)
    CONSTRAINT fk_has_supervisor FOREIGN KEY (SupervisorID)
      REFERENCES Employee(EmployeeID));
      
 # Entering a constraint that makes sure the length of the password for customer account is at least 6 characters long:
CREATE TABLE customer (
  CustomerID INTEGER,
  FirstName VARCHAR (50),
  LastName VARCHAR (50),
  Address VARCHAR(225),
  Phone VARCHAR(50),
  Country VARCHAR(255),
  City VARCHAR(255),
  PostalCode VARCHAR(50),
  Email VARCHAR(255),
  PRIMARY KEY (CustomerID));
  ALTER TABLE customer
  ADD COLUMN Password VARCHAR(100);
  ALTER TABLE Customer
    ADD CONSTRAINT CHK_Credentials CHECK (LENGTHB(Password) >= 6);
