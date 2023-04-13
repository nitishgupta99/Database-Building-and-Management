# Running Random queries to test the database created earlier
1) SELECT ProductName, quantity FROM products, orderdetail
    WHERE products.productid = orderdetail.productid
    AND quantity < 5
    ORDER BY quantity DESC

  SELECT salesorder.OrderDate AS "Date of Order", products.ProductName AS `ProductName`, price FROM orderdetail
    JOIN salesorder ON salesorder.OrderID = orderdetail.OrderID
    JOIN products ON orderdetail.productid = products.productid
    WHERE salesorder.OrderDate = "2021-05-01" AND products.ProductName = "Red Graystone" AND Price > 30

2) SELECT ProductName, quantity, orderdate
    FROM products, orderdetail, salesorder
    WHERE products.productid = orderdetail.productid
    AND salesorder.orderid= orderdetail.orderid AND orderdate LIKE "2021-%"

3) SELECT Address.City, COUNT(customerid) as nofCustomers
    FROM Customer, Address
    GROUP BY City
    ORDER BY nOfCustomers ASC

4) SELECT Count(EmployeeID) as noofemployees FROM Employee

5) SELECT * FROM customer, salesorder WHERE customer.customerid = salesorder.customerid;

6) SELECT DISTINCT(City), StreetAddress, PostalCode, Country FROM Address

7) SELECT EmployeeFirstName, EmployeeLastName, JobTitle
    FROM employee
    WHERE JobTitle = 'Trainee'

8) SELECT FirstName, LastName, ProductName, Quantity FROM
    Products,OrderDetail, Customer, salesOrder WHERE products.productid =
    orderdetail.productid AND customer.customerid = salesorder.customerid AND
    salesorder.orderid = orderdetail.orderid AND customer.Country = "Canada" AND
    orderdetail.Quantity > 3

9) SELECT INVOICEID, InvoiceStatus FROM invoice
    WHERE InvoiceStatus = "PAID"

10)SELECT DISTINCT(City) FROM Customer;
 
11) SELECT * FROM products WHERE Price > 45
