# Business Database Management Project
This is a database project for the Belgian-designed minimalist watches Cinturino, which was featured on Kickstarter. In this project, we created a database from scratch and designed tables to store information about the watches, customers, orders, and payments.

# Database Design
We established relationships between the entities to ensure data consistency and minimize redundancy. The following tables were created:
* customers: stores customer information such as name, email address, and shipping address.
* products: stores product details such as product name, price, and supplier ID.
* orders: stores order information such as order date, customer ID, and total amount.
* order_details: stores the details of each item in an order, such as product ID, quantity, and price.
* suppliers: stores supplier information such as name, email address, and phone number.
* employees: stores employee information such as name, email address, and job title.
* invoices: stores invoice information such as invoice date, order ID, and total amount.

# Running Queries
We ran several queries to retrieve useful information from the database, such as:

* The products and their quantities that have less than 5 items in stock, ordered by quantity in descending order
* The sales order date, product name, and price for the "Red Graystone" product that was ordered on May 1st, 2021 and had a price greater than $30
* The product name, quantity, and order date for all orders made in 2021
* The total number of employees
* All orders made by customers
* The distinct cities in the Address table, along with their street address, postal code, and country
* All employees whose job title is "Trainee"
* The first name, last name, product name, and quantity for all orders made by customers in Canada with more than 3 items
* All paid invoices and their ID
* The distinct cities in the Customer table
* All products with a price greater than $45


# SQL Dump
We have also provided an SQL dump of the database so that you can recreate it easily on your own system.

# Kickstarter Project Link
To learn more about the Cinturino minimalist watches Kickstarter project, please visit the official project page: https://www.kickstarter.com/projects/cinturino/belgian-designed-minimalist-watches-cinturino

# Contributors
Nitish Gupta and Brandon Situ

Feel free to use this database for your own projects or contribute to it by submitting pull requests. Thank you for your interest!



