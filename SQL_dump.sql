# Creating ADDRESS TABLE:
  CREATE TABLE Address (
    AddressID INTEGER,
    StreetAddress VARCHAR (250),
    City VARCHAR (50),
    PostalCode VARCHAR (50),
    Country VARCHAR (50),
    PRIMARY KEY (AddressID));

# Creating CUSTOMERS TABLE:
    CREATE TABLE customer (
    CustomerID INTEGER,
    FirstName VARCHAR (50),
    LastName VARCHAR (50),
    Phone VARCHAR(50),
    Email VARCHAR(255),
    PRIMARY KEY (CustomerID),
    CONSTRAINT fk_has_address FOREIGN KEY (AddressID)
      REFERENCES Address (AddressID));
    ALTER TABLE customer
    ADD COLUMN Password VARCHAR(100);

    ALTER TABLE Customer
      ADD CONSTRAINT CHK_Credentials CHECK (LENGTHB(Password) >= 6);

# Creating PRODUCTS TABLE:
  CREATE TABLE products (
    ProductID INTEGER,
    ProductName VARCHAR (255),
    SupplierID INTEGER,
    Price INTEGER,
    PRIMARY KEY (ProductID));

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
    SupervisorID INTEGER DEFAULT NULL,
    PRIMARY KEY(EmployeeID),
    CONSTRAINT fk_has_supervisor FOREIGN KEY (SupervisorID)
      REFERENCES Employee(EmployeeID));

# Creating SALESORDERS TABLE:
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

# Creating INVOICES TABLE:
  CREATE TABLE invoice (
    InvoiceID INTEGER,
    OrderID INTEGER,
    CustomerID INTEGER,
    InvoiceDate DATE,
    InvoiceStatus VARCHAR(300),
    PRIMARY KEY (InvoiceID),
    FOREIGN KEY (OrderID) REFERENCES SalesOrder(OrderID),
    UNIQUE uq_salesorder (OrderID),
    CONSTRAINT fk_has_customers FOREIGN KEY (CustomerID)
      REFERENCES customer (CustomerID))

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
