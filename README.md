# Courier-Management-System-using-MySQL

This is a MySQL database for a courier management system. The database consists of 10 tables: package, warehouse, shipment, tracking, customer, invoice, employee, inquiry, quotation, orders, and payment. These tables are linked using primary and foreign keys to ensure data integrity and to facilitate efficient querying.

The database includes 10 sample queries that demonstrate the use of subqueries and joins to retrieve data from multiple tables. These queries can be used as templates for creating more complex queries.

To use this database, you will need to have MySQL installed on your system. You can import the database using MySQL Workbench or the command line. Once the database is imported, you can start querying the data using SQL.

## Queries

The following is a list of the 10 sample queries included in this database:

1. List all packages that are currently in transit.
2. Show the total number of packages shipped from each warehouse.
3. List all shipments that are scheduled to arrive today.
4. Show the average time it takes for a package to be delivered.
5. List all customers who have placed an order in the last month.
6. Show the total amount of revenue generated from shipments in the last quarter.
7. List all employees who have worked on more than 10 shipments in the last year.
8. Show the number of packages shipped per customer in the last month.
9. List all shipments that are delayed by more than 24 hours.
10. Show the total amount of outstanding invoices by customer.

## Installation

To install this database, follow these steps:

1. Clone this repository to your local machine.
2. Open MySQL Workbench and connect to your local MySQL server.
3. Open the `courier_management_system.sql` file in MySQL Workbench.
4. There are two files `creation` contains only database creation commands and the `querying` contains 10 queries listed above.
4. Run the file to create the database and tables.
5. You can now start querying the data using SQL.

Best of Luck
-Aayush Doshi
