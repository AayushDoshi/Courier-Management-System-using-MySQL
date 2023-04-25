create database dbms_project;
use dbms_project;

CREATE TABLE Package (
  Package_ID INT PRIMARY KEY,
  Sender_Name VARCHAR(50) NOT NULL,
  Sender_Address VARCHAR(100) NOT NULL,
  Recipient_Name VARCHAR(50) NOT NULL,
  Recipient_Address VARCHAR(100) NOT NULL,
  Weight DECIMAL(10,2) NOT NULL,
  Dimensions VARCHAR(50) NOT NULL,
  Contents VARCHAR(100) NOT NULL,
  Delivery_Instructions VARCHAR(100));

CREATE TABLE Warehouse(
  Warehouse_ID INT PRIMARY KEY,
  Warehouse_Location VARCHAR(100));

CREATE TABLE Shipment (
  Shipment_ID INT PRIMARY KEY,
  Package_ID INT NOT NULL,
  Shipment_Date DATE NOT NULL,
  FOREIGN KEY (Package_ID) REFERENCES Package(Package_ID));

CREATE TABLE Tracking (
  Tracking_ID INT PRIMARY KEY,
  Warehouse_From_ID INT NOT NULL,
  Warehouse_To_ID INT NOT NULL,
  Shipment_ID INT NOT NULL,
  Location VARCHAR(100) NOT NULL,
  Status VARCHAR(50) NOT NULL,
  Timestamp DATETIME NOT NULL,
  FOREIGN KEY (Shipment_ID) REFERENCES Shipment(Shipment_ID),
  FOREIGN KEY (Warehouse_From_ID) REFERENCES Warehouse(Warehouse_ID),
  FOREIGN KEY (Warehouse_To_ID) REFERENCES Warehouse(Warehouse_ID));


CREATE TABLE Customer (
  Customer_ID INT PRIMARY KEY,
  Customer_Name VARCHAR(50) NOT NULL,
  Customer_Address VARCHAR(50) NOT NULL,
  Customer_Contact VARCHAR(100) NOT NULL);

CREATE TABLE Invoice (
  Invoice_ID INT PRIMARY KEY,
  Shipment_ID INT NOT NULL,
  Customer_ID INT NOT NULL,
  Invoice_Date DATE NOT NULL,
  Payment_Status VARCHAR(50) NOT NULL,
  Total_Amount DECIMAL(10, 2) NOT NULL,
  FOREIGN KEY (Shipment_ID) REFERENCES Shipment(Shipment_ID),
  FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID));

CREATE TABLE Employee(
  Employee_ID INT PRIMARY KEY,
  Employee_Name VARCHAR(50),
  Employee_Role VARCHAR(50));

CREATE TABLE Inquiry (
  Inquiry_ID INT PRIMARY KEY,
  Customer_ID INT NOT NULL,
  Employee_ID INT NOT NULL,
  Inquiry_Details VARCHAR(500) NOT NULL,
  Inquiry_Time DATETIME NOT NULL,
  FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID),
  FOREIGN KEY (Employee_ID) REFERENCES Employee(Employee_ID));

CREATE TABLE Quotation(
  Quotation_ID INT PRIMARY KEY,
  Customer_ID INT NOT NULL,
  Package_ID INT NOT NULL,
  Quotation_Date DATETIME NOT NULL,
  Quotation_Amount INT NOT NULL,
  FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID),
  FOREIGN KEY (Package_ID) REFERENCES Package(Package_ID));

CREATE TABLE Orders(
  Order_ID INT PRIMARY KEY,
  Customer_ID INT NOT NULL,
  Employee_ID INT NOT NULL,
  Order_Description VARCHAR(50) NOT NULL,
  Order_Amount INT NOT NULL,
  FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID),
  FOREIGN KEY (Employee_ID) REFERENCES Employee(Employee_ID));

CREATE TABLE Payment(
  Payment_ID INT PRIMARY KEY,
  Payment_Date DATETIME NOT NULL,
  Customer_ID INT NOT NULL,
  Invoice_ID INT NOT NULL,
  Payment_Amount DECIMAL(10, 2) NOT NULL,
  FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID),
  FOREIGN KEY (Invoice_ID) REFERENCES Invoice(Invoice_ID));
INSERT INTO Package VALUES (1, 'John Doe', '123 Main St, Anytown USA', 'Jane Smith', '456 Oak St, Anytown USA', 5.25, '12x12x12', 'Books', NULL);
INSERT INTO Package VALUES (2, 'Sarah Lee', '789 Elm St, Anytown USA', 'Tom Jones', '321 Maple St, Anytown USA', 1.75, '8x8x8', 'CDs', 'Leave on porch');
INSERT INTO Package VALUES (3, 'Mike Smith', '1111 Park Ave, Anytown USA', 'Samantha Brown', '2222 Beach Blvd, Anytown USA', 10.00, '18x18x18', 'Clothes', 'Signature required');
INSERT INTO Package VALUES (4, 'Karen Lee', '444 Fourth St, Anytown USA', 'Adam Green', '555 Fifth St, Anytown USA', 2.50, '10x10x10', 'Toys', 'Do not bend');
INSERT INTO Package VALUES (5, 'David Kim', '666 Sixth St, Anytown USA', 'Maria Martinez', '777 Seventh St, Anytown USA', 15.75, '24x24x24', 'Furniture', 'Call before delivery');
INSERT INTO Package VALUES (6, 'Maggie Brown', '888 Eighth St, Anytown USA', 'Max Johnson', '999 Ninth St, Anytown USA', 3.25, '11x11x11', 'Electronics', NULL);
INSERT INTO Package VALUES (7, 'Janet Lee', '1010 Tenth St, Anytown USA', 'Robert Green', '1111 Eleventh St, Anytown USA', 6.00, '14x14x14', 'Art supplies', 'Deliver to back door');
INSERT INTO Package VALUES (8, 'Jenna Smith', '1212 Twelfth St, Anytown USA', 'Sam Brown', '1313 Thirteenth St, Anytown USA', 1.00, '6x6x6', 'Candy', 'Do not leave in sun');
INSERT INTO Package VALUES (9, 'Lee Kim', '1414 Fourteenth St, Anytown USA', 'Chloe Johnson', '1515 Fifteenth St, Anytown USA', 8.50, '16x16x16', 'Kitchenware', 'Leave with neighbor');
INSERT INTO Package VALUES (10, 'Grace Park', '1616 Sixteenth St, Anytown USA', 'Benjamin Lee', '1717 Seventeenth St, Anytown USA', 4.75, '13x13x13', 'Shoes', NULL);
INSERT INTO Package VALUES (11, 'Olivia Green', '1818 Eighteenth St, Anytown USA', 'Lucas Martinez', '1919 Nineteenth St, Anytown USA', 12.50, '20x20x20', 'Sports equipment', 'Deliver after 3pm');
INSERT INTO Package VALUES (12, 'James Kim', '2020 Twentieth St, Anytown USA', 'Sophia Brown', '2121 Twenty-first St, Anytown USA', 6.75, '15x15x15', 'School supplies', 'Leave on front porch');
INSERT INTO Package VALUES (13, 'Isabella Martinez', '2222 Twenty-second St, Anytown USA', 'Ethan Johnson', '2323 Twenty-third St, Anytown USA', 3.00, '9x9x9', 'Tools', NULL);
INSERT INTO Package VALUES (14, 'Natalie Brown', '2424 Twenty-fourth St, Anytown USA', 'Aiden Lee', '2525 Twenty-fifth St, Anytown USA', 7.25, '17x17x17', 'Pet supplies', 'Call when arrive');
INSERT INTO Package VALUES (15, 'Emma Lee', '2626 Twenty-sixth St, Anytown USA', 'Daniel Kim', '2727 Twenty-seventh St, Anytown USA', 2.25, '8x8x8', 'Jewelry', NULL);
INSERT INTO Package VALUES (16, 'William Martinez', '2828 Twenty-eighth St, Anytown USA', 'Abigail Brown', '2929 Twenty-ninth St, Anytown USA', 9.50, '19x19x19', 'Home decor', 'Signature required');
INSERT INTO Package VALUES (17, 'Elijah Lee', '3030 Thirtieth St, Anytown USA', 'Harper Johnson', '3131 Thirty-first St, Anytown USA', 4.00, '12x12x12', 'Beauty products', 'Deliver to back gate');
INSERT INTO Package VALUES (18, 'Avery Brown', '3232 Thirty-second St, Anytown USA', 'Michael Smith', '3333 Thirty-third St, Anytown USA', 1.50, '7x7x7', 'Stationery', NULL);
INSERT INTO Package VALUES (19, 'Mason Kim', '3434 Thirty-fourth St, Anytown USA', 'Evelyn Martinez', '3535 Thirty-fifth St, Anytown USA', 6.75, '15x15x15', 'Baby items', 'Leave on back porch');
INSERT INTO Package VALUES (20, 'Victoria Johnson', '3636 Thirty-sixth St, Anytown USA', 'Noah Lee', '3737 Thirty-seventh St, Anytown USA', 3.75, '10x10x10', 'DVDs', 'Do not stack');


INSERT INTO Warehouse VALUES (1, '123 Main St, Anytown USA');
INSERT INTO Warehouse VALUES (2, '456 Elm St, Anytown USA');
INSERT INTO Warehouse VALUES (3, '789 Oak St, Anytown USA');
INSERT INTO Warehouse VALUES (4, '1011 Maple St, Anytown USA');
INSERT INTO Warehouse VALUES (5, '1213 Cedar St, Anytown USA');
INSERT INTO Warehouse VALUES (6, '1415 Pine St, Anytown USA');
INSERT INTO Warehouse VALUES (7, '1617 Walnut St, Anytown USA');
INSERT INTO Warehouse VALUES (8, '1819 Birch St, Anytown USA');
INSERT INTO Warehouse VALUES (9, '2021 Hickory St, Anytown USA');
INSERT INTO Warehouse VALUES (10, '2223 Ash St, Anytown USA');
INSERT INTO Warehouse VALUES (11, '2425 Chestnut St, Anytown USA');
INSERT INTO Warehouse VALUES (12, '2627 Poplar St, Anytown USA');
INSERT INTO Warehouse VALUES (13, '2829 Spruce St, Anytown USA');
INSERT INTO Warehouse VALUES (14, '3031 Pine St, Anytown USA');
INSERT INTO Warehouse VALUES (15, '3233 Elm St, Anytown USA');
INSERT INTO Warehouse VALUES (16, '3435 Oak St, Anytown USA');
INSERT INTO Warehouse VALUES (17, '3637 Maple St, Anytown USA');
INSERT INTO Warehouse VALUES (18, '3839 Cedar St, Anytown USA');
INSERT INTO Warehouse VALUES (19, '4041 Walnut St, Anytown USA');
INSERT INTO Warehouse VALUES (20, '4243 Birch St, Anytown USA');

INSERT INTO Shipment VALUES (1, 1, '2022-01-01');
INSERT INTO Shipment VALUES (2, 2, '2022-01-02');
INSERT INTO Shipment VALUES (3, 3, '2022-01-03');
INSERT INTO Shipment VALUES (4, 4, '2022-01-04');
INSERT INTO Shipment VALUES (5, 5, '2022-01-05');
INSERT INTO Shipment VALUES (6, 6, '2022-01-06');
INSERT INTO Shipment VALUES (7, 7, '2022-01-07');
INSERT INTO Shipment VALUES (8, 8, '2022-01-08');
INSERT INTO Shipment VALUES (9, 9, '2022-01-09');
INSERT INTO Shipment VALUES (10, 10, '2022-01-10');
INSERT INTO Shipment VALUES (11, 11, '2022-01-11');
INSERT INTO Shipment VALUES (12, 12, '2022-01-12');
INSERT INTO Shipment VALUES (13, 13, '2022-01-13');
INSERT INTO Shipment VALUES (14, 14, '2022-01-14');
INSERT INTO Shipment VALUES (15, 15, '2022-01-15');
INSERT INTO Shipment VALUES (16, 16, '2022-01-16');
INSERT INTO Shipment VALUES (17, 17, '2022-01-17');
INSERT INTO Shipment VALUES (18, 18, '2022-01-18');
INSERT INTO Shipment VALUES (19, 19, '2022-01-19');
INSERT INTO Shipment VALUES (20, 20, '2022-01-20');

INSERT INTO Tracking VALUES (1, 1, 2, 1, 'Warehouse A', 'In transit', '2022-01-01 08:00:00');
INSERT INTO Tracking VALUES (2, 2, 3, 2, 'Warehouse B', 'In transit', '2022-01-02 09:00:00');
INSERT INTO Tracking VALUES (3, 3, 4, 3, 'Warehouse C', 'In transit', '2022-01-03 10:00:00');
INSERT INTO Tracking VALUES (4, 4, 5, 4, 'Warehouse D', 'In transit', '2022-01-04 11:00:00');
INSERT INTO Tracking VALUES (5, 5, 6, 5, 'Warehouse E', 'In transit', '2022-01-05 12:00:00');
INSERT INTO Tracking VALUES (6, 6, 7, 6, 'Warehouse F', 'In transit', '2022-01-06 13:00:00');
INSERT INTO Tracking VALUES (7, 7, 8, 7, 'Warehouse G', 'In transit', '2022-01-07 14:00:00');
INSERT INTO Tracking VALUES (8, 8, 9, 8, 'Warehouse H', 'In transit', '2022-01-08 15:00:00');
INSERT INTO Tracking VALUES (9, 9, 10, 9, 'Warehouse I', 'In transit', '2022-01-09 16:00:00');
INSERT INTO Tracking VALUES (10, 10, 11, 10, 'Warehouse J', 'In transit', '2022-01-10 17:00:00');
INSERT INTO Tracking VALUES (11, 11, 12, 11, 'Warehouse K', 'In transit', '2022-01-11 18:00:00');
INSERT INTO Tracking VALUES (12, 12, 13, 12, 'Warehouse L', 'In transit', '2022-01-12 19:00:00');
INSERT INTO Tracking VALUES (13, 13, 14, 13, 'Warehouse M', 'In transit', '2022-01-13 20:00:00');
INSERT INTO Tracking VALUES (14, 14, 15, 14, 'Warehouse N', 'In transit', '2022-01-14 21:00:00');
INSERT INTO Tracking VALUES (15, 15, 16, 15, 'Warehouse O', 'In transit', '2022-01-15 22:00:00');
INSERT INTO Tracking VALUES (16, 16, 17, 16, 'Warehouse P', 'In transit', '2022-01-16 23:00:00');
INSERT INTO Tracking VALUES (17, 17, 18, 17, 'Warehouse Q', 'In transit', '2022-01-17 00:00:00');
INSERT INTO Tracking VALUES (18, 18, 19, 18, 'Warehouse R', 'In transit', '2022-01-18 01:00:00');
INSERT INTO Tracking VALUES (19, 19, 20, 19, 'Warehouse S', 'In transit', '2022-01-19 02:00:00');


INSERT INTO Customer VALUES (1, 'John Smith', '123 Main St, Anytown USA', '555-1234');
INSERT INTO Customer VALUES (2, 'Jane Doe', '456 Oak St, Anycity USA', '555-5678');
INSERT INTO Customer VALUES (3, 'Bob Johnson', '789 Maple St, Anyville USA', '555-9012');
INSERT INTO Customer VALUES (4, 'Sarah Lee', '321 Pine St, Anyborough USA', '555-3456');
INSERT INTO Customer VALUES (5, 'David Chen', '654 Elm St, Anyhamlet USA', '555-7890');
INSERT INTO Customer VALUES (6, 'Karen Wong', '987 Cedar St, Anyvillage USA', '555-2345');
INSERT INTO Customer VALUES (7, 'Tommy Nguyen', '246 Walnut St, Anycity USA', '555-6789');
INSERT INTO Customer VALUES (8, 'Maria Hernandez', '135 Oak St, Anytown USA', '555-0123');
INSERT INTO Customer VALUES (9, 'Michael Kim', '864 Pine St, Anyborough USA', '555-4567');
INSERT INTO Customer VALUES (10, 'Emily Park', '975 Maple St, Anyville USA', '555-8901');
INSERT INTO Customer VALUES (11, 'Daniel Lee', '357 Birch St, Anyhamlet USA', '555-2345');
INSERT INTO Customer VALUES (12, 'Samantha Patel', '468 Cherry St, Anyvillage USA', '555-6789');
INSERT INTO Customer VALUES (13, 'Ryan Johnson', '579 Maple St, Anycity USA', '555-0123');
INSERT INTO Customer VALUES (14, 'Emma Davis', '680 Pine St, Anytown USA', '555-4567');
INSERT INTO Customer VALUES (15, 'Jacob Garcia', '791 Cedar St, Anyhamlet USA', '555-8901');
INSERT INTO Customer VALUES (16, 'Isabella Rodriguez', '802 Walnut St, Anyvillage USA', '555-2345');
INSERT INTO Customer VALUES (17, 'Matthew Martinez', '913 Elm St, Anyville USA', '555-6789');
INSERT INTO Customer VALUES (18, 'Olivia Hernandez', '124 Pine St, Anyborough USA', '555-0123');
INSERT INTO Customer VALUES (19, 'Noah Gonzalez', '235 Birch St, Anycity USA', '555-4567');
INSERT INTO Customer VALUES (20, 'Ava Perez', '346 Cherry St, Anytown USA', '555-8901');


INSERT INTO Invoice VALUES (1, 1, 1, '2022-01-01', 'Unpaid', 100.00);
INSERT INTO Invoice VALUES (2, 2, 2, '2022-01-02', 'Unpaid', 200.00);
INSERT INTO Invoice VALUES (3, 3, 3, '2022-01-03', 'Paid', 300.00);
INSERT INTO Invoice VALUES (4, 4, 4, '2022-01-04', 'Unpaid', 400.00);
INSERT INTO Invoice VALUES (5, 5, 5, '2022-01-05', 'Paid', 500.00);
INSERT INTO Invoice VALUES (6, 6, 6, '2022-01-06', 'Unpaid', 600.00);
INSERT INTO Invoice VALUES (7, 7, 7, '2022-01-07', 'Paid', 700.00);
INSERT INTO Invoice VALUES (8, 8, 8, '2022-01-08', 'Unpaid', 800.00);
INSERT INTO Invoice VALUES (9, 9, 9, '2022-01-09', 'Paid', 900.00);
INSERT INTO Invoice VALUES (10, 10, 10, '2022-01-10', 'Unpaid', 1000.00);
INSERT INTO Invoice VALUES (11, 11, 11, '2022-01-11', 'Unpaid', 1100.00);
INSERT INTO Invoice VALUES (12, 12, 12, '2022-01-12', 'Paid', 1200.00);
INSERT INTO Invoice VALUES (13, 13, 13, '2022-01-13', 'Unpaid', 1300.00);
INSERT INTO Invoice VALUES (14, 14, 14, '2022-01-14', 'Paid', 1400.00);
INSERT INTO Invoice VALUES (15, 15, 15, '2022-01-15', 'Unpaid', 1500.00);
INSERT INTO Invoice VALUES (16, 16, 16, '2022-01-16', 'Paid', 1600.00);
INSERT INTO Invoice VALUES (17, 17, 17, '2022-01-17', 'Unpaid', 1700.00);
INSERT INTO Invoice VALUES (18, 18, 18, '2022-01-18', 'Paid', 1800.00);
INSERT INTO Invoice VALUES (19, 19, 19, '2022-01-19', 'Unpaid', 1900.00);
INSERT INTO Invoice VALUES (20, 20, 20, '2022-01-20', 'Paid', 2000.00);

INSERT INTO Employee VALUES (1, 'John Doe', 'Manager');
INSERT INTO Employee VALUES (2, 'Jane Smith', 'Salesperson');
INSERT INTO Employee VALUES (3, 'Bob Johnson', 'Customer Service Representative');
INSERT INTO Employee VALUES (4, 'Emily Brown', 'Marketing Specialist');
INSERT INTO Employee VALUES (5, 'Michael Lee', 'Product Manager');
INSERT INTO Employee VALUES (6, 'Sarah Kim', 'Software Developer');
INSERT INTO Employee VALUES (7, 'David Chen', 'Data Analyst');
INSERT INTO Employee VALUES (8, 'Karen Wong', 'Human Resources Manager');
INSERT INTO Employee VALUES (9, 'Jason Wang', 'IT Support Technician');
INSERT INTO Employee VALUES (10, 'Lisa Zhang', 'Financial Analyst');
INSERT INTO Employee VALUES (11, 'Andrew Wu', 'Business Development Manager');
INSERT INTO Employee VALUES (12, 'Grace Liu', 'Graphic Designer');
INSERT INTO Employee VALUES (13, 'Daniel Park', 'Content Writer');
INSERT INTO Employee VALUES (14, 'Olivia Tan', 'Social Media Manager');
INSERT INTO Employee VALUES (15, 'Ryan Ng', 'Customer Success Manager');
INSERT INTO Employee VALUES (16, 'Amy Li', 'Operations Coordinator');
INSERT INTO Employee VALUES (17, 'Peter Chen', 'Technical Writer');
INSERT INTO Employee VALUES (18, 'Jessica Liu', 'Event Planner');
INSERT INTO Employee VALUES (19, 'Kevin Wang', 'SEO Specialist');
INSERT INTO Employee VALUES (20, 'Sophie Wong', 'Public Relations Manager');

INSERT INTO Inquiry (Inquiry_ID, Customer_ID, Employee_ID, Inquiry_Details, Inquiry_Time) 
VALUES (1, 2, 1, 'Can you provide information about your return policy?', '2022-01-05 10:30:00');
INSERT INTO Inquiry (Inquiry_ID, Customer_ID, Employee_ID, Inquiry_Details, Inquiry_Time) 
VALUES (2, 3, 2, 'I am having trouble with my account, can you help me reset my password?', '2022-02-10 13:45:00');
INSERT INTO Inquiry (Inquiry_ID, Customer_ID, Employee_ID, Inquiry_Details, Inquiry_Time) 
VALUES (3, 1, 3, 'I have a question about one of your products, can you provide more information?', '2022-03-15 15:20:00');
INSERT INTO Inquiry (Inquiry_ID, Customer_ID, Employee_ID, Inquiry_Details, Inquiry_Time) 
VALUES (4, 4, 4, 'I am interested in your services, can you provide a quote?', '2022-04-20 11:00:00');
INSERT INTO Inquiry (Inquiry_ID, Customer_ID, Employee_ID, Inquiry_Details, Inquiry_Time) 
VALUES (5, 5, 1, 'I received a damaged product, how can I go about returning it?', '2022-05-25 14:30:00');
INSERT INTO Inquiry (Inquiry_ID, Customer_ID, Employee_ID, Inquiry_Details, Inquiry_Time) 
VALUES (6, 2, 2, 'Can you help me track my order?', '2022-06-30 10:45:00');
INSERT INTO Inquiry (Inquiry_ID, Customer_ID, Employee_ID, Inquiry_Details, Inquiry_Time) 
VALUES (7, 3, 3, 'I have a question about my billing statement, can you provide more information?', '2022-07-05 16:00:00');
INSERT INTO Inquiry (Inquiry_ID, Customer_ID, Employee_ID, Inquiry_Details, Inquiry_Time) 
VALUES (8, 1, 4, 'I am interested in your new product line, can you provide more information?', '2022-08-10 09:15:00');
INSERT INTO Inquiry (Inquiry_ID, Customer_ID, Employee_ID, Inquiry_Details, Inquiry_Time) 
VALUES (9, 5, 2, 'I received the wrong item, how can I go about exchanging it?', '2022-09-15 13:00:00');
INSERT INTO Inquiry (Inquiry_ID, Customer_ID, Employee_ID, Inquiry_Details, Inquiry_Time) 
VALUES (10, 4, 3, 'I am having trouble placing an order, can you help me?', '2022-10-20 11:30:00');
INSERT INTO Inquiry (Inquiry_ID, Customer_ID, Employee_ID, Inquiry_Details, Inquiry_Time) 
VALUES (11, 1, 1, 'I have a question about your rewards program, can you provide more information?', '2022-11-25 15:45:00');
INSERT INTO Inquiry (Inquiry_ID, Customer_ID, Employee_ID, Inquiry_Details, Inquiry_Time) 
VALUES (12, 2, 4, 'Can you provide information about your shipping policies?', '2022-12-30 12:00:00');
INSERT INTO Inquiry (Inquiry_ID, Customer_ID, Employee_ID, Inquiry_Details, Inquiry_Time) 
VALUES (13, 3, 1, 'I am having trouble accessing my account, can you help?','2022-12-30 12:00:00');
INSERT INTO Inquiry (Inquiry_ID, Customer_ID, Employee_ID, Inquiry_Details, Inquiry_Time)
VALUES (15, 3, 2, 'I have a question about my recent shipment. Can you please provide me with more information?', '2022-01-15 10:22:34');

INSERT INTO Inquiry (Inquiry_ID, Customer_ID, Employee_ID, Inquiry_Details, Inquiry_Time)
VALUES (16, 4, 2, 'I need to change the delivery address for my order. Can you help me with that?', '2022-02-01 14:56:22');

INSERT INTO Inquiry (Inquiry_ID, Customer_ID, Employee_ID, Inquiry_Details, Inquiry_Time)
VALUES (17, 5, 3, 'I am having trouble tracking my shipment. Can you please assist me with this?', '2022-02-15 09:45:17');

INSERT INTO Inquiry (Inquiry_ID, Customer_ID, Employee_ID, Inquiry_Details, Inquiry_Time)
VALUES (18, 6, 3, 'There seems to be a delay with my order. Can you provide me with an update on when it will be delivered?', '2022-03-03 16:30:59');

INSERT INTO Inquiry (Inquiry_ID, Customer_ID, Employee_ID, Inquiry_Details, Inquiry_Time)
VALUES (19, 7, 4, 'I am interested in your products and would like to know more about them. Can you provide me with some information?', '2022-03-20 11:08:45');

INSERT INTO Inquiry (Inquiry_ID, Customer_ID, Employee_ID, Inquiry_Details, Inquiry_Time)
VALUES (20, 8, 4, 'I received a damaged item in my shipment. What is the process for getting a replacement?', '2022-04-01 13:45:21');

INSERT INTO Inquiry (Inquiry_ID, Customer_ID, Employee_ID, Inquiry_Details, Inquiry_Time)
VALUES (21, 9, 5, 'I have a question about the pricing for your products. Can you provide me with more information?', '2022-04-15 10:22:34');

INSERT INTO Inquiry (Inquiry_ID, Customer_ID, Employee_ID, Inquiry_Details, Inquiry_Time)
VALUES (22, 10, 5, 'I need to cancel my order. What is the process for doing so?', '2022-05-01 14:56:22');

INSERT INTO Inquiry (Inquiry_ID, Customer_ID, Employee_ID, Inquiry_Details, Inquiry_Time)
VALUES (23, 11, 6, 'I am interested in placing a bulk order. Can you provide me with more information about your pricing and shipping options?', '2022-05-15 09:45:17');

INSERT INTO Inquiry (Inquiry_ID, Customer_ID, Employee_ID, Inquiry_Details, Inquiry_Time)
VALUES (24, 12, 6, 'I received the wrong item in my shipment. What is the process for getting the correct item?', '2022-06-03 16:30:59');

INSERT INTO Inquiry (Inquiry_ID, Customer_ID, Employee_ID, Inquiry_Details, Inquiry_Time)
VALUES (25, 13, 7, 'I am having trouble accessing my account on your website. Can you help me reset my password?', '2022-06-20 11:08:45');

INSERT INTO Quotation (Quotation_ID, Customer_ID, Package_ID, Quotation_Date, Quotation_Amount)
VALUES (1, 2, 3, '2022-01-15 09:30:00', 1500);

INSERT INTO Quotation (Quotation_ID, Customer_ID, Package_ID, Quotation_Date, Quotation_Amount)
VALUES (2, 4, 5, '2022-02-28 14:45:00', 2500);

INSERT INTO Quotation (Quotation_ID, Customer_ID, Package_ID, Quotation_Date, Quotation_Amount)
VALUES (3, 1, 6, '2022-03-10 11:15:00', 1800);

INSERT INTO Quotation (Quotation_ID, Customer_ID, Package_ID, Quotation_Date, Quotation_Amount)
VALUES (4, 3, 2, '2022-04-05 08:00:00', 1200);

INSERT INTO Quotation (Quotation_ID, Customer_ID, Package_ID, Quotation_Date, Quotation_Amount)
VALUES (5, 5, 1, '2022-05-20 16:30:00', 2000);

INSERT INTO Quotation (Quotation_ID, Customer_ID, Package_ID, Quotation_Date, Quotation_Amount)
VALUES (6, 2, 4, '2022-06-12 12:00:00', 2200);

INSERT INTO Quotation (Quotation_ID, Customer_ID, Package_ID, Quotation_Date, Quotation_Amount)
VALUES (7, 1, 7, '2022-07-01 10:45:00', 3000);

INSERT INTO Quotation (Quotation_ID, Customer_ID, Package_ID, Quotation_Date, Quotation_Amount)
VALUES (8, 4, 9, '2022-08-22 13:15:00', 4000);

INSERT INTO Quotation (Quotation_ID, Customer_ID, Package_ID, Quotation_Date, Quotation_Amount)
VALUES (9, 3, 8, '2022-09-03 09:30:00', 3500);

INSERT INTO Quotation (Quotation_ID, Customer_ID, Package_ID, Quotation_Date, Quotation_Amount)
VALUES (10, 5, 10, '2022-10-18 15:00:00', 5000);

INSERT INTO Quotation (Quotation_ID, Customer_ID, Package_ID, Quotation_Date, Quotation_Amount)
VALUES (11, 2, 11, '2022-11-25 11:30:00', 2800);

INSERT INTO Quotation (Quotation_ID, Customer_ID, Package_ID, Quotation_Date, Quotation_Amount)
VALUES (12, 1, 12, '2022-12-05 09:45:00', 1900);

INSERT INTO Quotation (Quotation_ID, Customer_ID, Package_ID, Quotation_Date, Quotation_Amount)
VALUES (13, 4, 13, '2023-01-08 14:00:00', 3300);

INSERT INTO Quotation (Quotation_ID, Customer_ID, Package_ID, Quotation_Date, Quotation_Amount)
VALUES (14, 3, 14, '2023-02-12 10:00:00', 2700);

INSERT INTO Quotation (Quotation_ID, Customer_ID, Package_ID, Quotation_Date, Quotation_Amount) VALUES (15, 3, 2, '2022-02-15 10:30:00', 3000);

INSERT INTO Quotation (Quotation_ID, Customer_ID, Package_ID, Quotation_Date, Quotation_Amount) VALUES (16, 4, 1, '2022-02-20 12:30:00', 5000);

INSERT INTO Quotation (Quotation_ID, Customer_ID, Package_ID, Quotation_Date, Quotation_Amount) VALUES (17, 5, 3, '2022-03-01 09:00:00', 6000);

INSERT INTO Quotation (Quotation_ID, Customer_ID, Package_ID, Quotation_Date, Quotation_Amount) VALUES (18, 2, 2, '2022-03-15 14:00:00', 3500);

INSERT INTO Quotation (Quotation_ID, Customer_ID, Package_ID, Quotation_Date, Quotation_Amount) VALUES (19, 1, 4, '2022-04-02 11:30:00', 8000);

INSERT INTO Quotation (Quotation_ID, Customer_ID, Package_ID, Quotation_Date, Quotation_Amount) VALUES (20, 3, 1, '2022-04-18 13:00:00', 4500);

INSERT INTO Orders (Order_ID, Customer_ID, Employee_ID, Order_Description, Order_Amount) VALUES 
(1, 2, 4, 'Bulk order of office supplies', 1500),
(2, 3, 2, 'Order of new laptops', 10000),
(3, 1, 3, 'Order of printing paper', 500),
(4, 4, 5, 'Order of office furniture', 20000),
(5, 2, 1, 'Order of ink cartridges', 300),
(6, 3, 4, 'Order of presentation materials', 1000),
(7, 1, 2, 'Order of computer accessories', 800),
(8, 4, 3, 'Order of office phones', 5000),
(9, 2, 5, 'Order of cleaning supplies', 200),
(10, 3, 1, 'Order of printer ink', 400),
(11, 1, 4, 'Order of office snacks', 300),
(12, 4, 2, 'Order of office plants', 1000),
(13, 2, 3, 'Order of whiteboards', 700),
(14, 1, 5, 'Order of desk lamps', 400),
(15, 3, 4, 'Order of computer monitors', 5000),
(16, 4, 1, 'Order of standing desks', 10000),
(17, 1, 2, 'Order of ergonomic chairs', 7000),
(18, 2, 3, 'Order of bookshelves', 1500),
(19, 3, 4, 'Order of filing cabinets', 3000),
(20, 4, 5, 'Order of office printers', 6000);

INSERT INTO Payment(Payment_ID, Payment_Date, Customer_ID, Invoice_ID, Payment_Amount)
VALUES(1, '2023-04-20 14:30:00', 1, 1, 20.00);

INSERT INTO Payment(Payment_ID, Payment_Date, Customer_ID, Invoice_ID, Payment_Amount)
VALUES(2, '2023-04-19 10:15:00', 1, 2, 35.50);

INSERT INTO Payment(Payment_ID, Payment_Date, Customer_ID, Invoice_ID, Payment_Amount)
VALUES(3, '2023-04-18 09:45:00', 2, 3, 50.00);

INSERT INTO Payment(Payment_ID, Payment_Date, Customer_ID, Invoice_ID, Payment_Amount)
VALUES(4, '2023-04-17 16:20:00', 2, 4, 75.25);

INSERT INTO Payment(Payment_ID, Payment_Date, Customer_ID, Invoice_ID, Payment_Amount)
VALUES(5, '2023-04-16 11:00:00', 3, 5, 100.00);

INSERT INTO Payment(Payment_ID, Payment_Date, Customer_ID, Invoice_ID, Payment_Amount)
VALUES(6, '2023-04-15 15:45:00', 3, 6, 150.50);

INSERT INTO Payment(Payment_ID, Payment_Date, Customer_ID, Invoice_ID, Payment_Amount)
VALUES(7, '2023-04-14 12:30:00', 4, 7, 200.00);

INSERT INTO Payment(Payment_ID, Payment_Date, Customer_ID, Invoice_ID, Payment_Amount)
VALUES(8, '2023-04-13 08:00:00', 4, 8, 250.75);

INSERT INTO Payment(Payment_ID, Payment_Date, Customer_ID, Invoice_ID, Payment_Amount)
VALUES(9, '2023-04-12 14:45:00', 5, 9, 300.00);

INSERT INTO Payment(Payment_ID, Payment_Date, Customer_ID, Invoice_ID, Payment_Amount)
VALUES(10, '2023-04-11 17:30:00', 5, 10, 350.50);

INSERT INTO Payment(Payment_ID, Payment_Date, Customer_ID, Invoice_ID, Payment_Amount)
VALUES(11, '2023-04-10 13:15:00', 6, 11, 400.00);

INSERT INTO Payment(Payment_ID, Payment_Date, Customer_ID, Invoice_ID, Payment_Amount)
VALUES(12, '2023-04-09 11:45:00', 6, 12, 450.75);

INSERT INTO Payment(Payment_ID, Payment_Date, Customer_ID, Invoice_ID, Payment_Amount)
VALUES(13, '2023-04-08 10:30:00', 7, 13, 500.00);