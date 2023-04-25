SELECT i.Invoice_ID, i.Invoice_Date, s.Shipment_ID, s.Shipment_Date
FROM Invoice i
INNER JOIN Shipment s ON i.Shipment_ID = s.Shipment_ID
Limit 6;

SELECT e.Employee_Name, SUM(o.Order_Amount) AS Total_Sales
FROM Employee e
INNER JOIN Orders o ON e.Employee_ID = o.Employee_ID
GROUP BY e.Employee_Name;

SELECT p.sender_name,p.recipient_name
FROM package p
JOIN shipment s on p.package_id=s.package_id
WHERE s.shipment_id=4;


SELECT s.shipment_date,t.status
FROM Shipment s
JOIN Tracking t on s.shipment_ID = t.shipment_ID
WHERE t.warehouse_from_id=10;

SELECT e.Employee_Name, e.Employee_Role 
FROM Employee e 
JOIN Inquiry i ON e.Employee_ID = i.Employee_ID 
WHERE i.Inquiry_ID = 23;


SELECT Warehouse_ID, COUNT(*) AS NumShipments 
FROM (
  SELECT Warehouse_From_ID AS Warehouse_ID FROM Tracking
  UNION ALL
  SELECT Warehouse_To_ID AS Warehouse_ID FROM Tracking
) AS AllShipments
GROUP BY Warehouse_ID;

SELECT Customer.Customer_Name, Customer.Customer_Contact, SUM(Invoice.Total_Amount) AS Revenue
FROM Customer
JOIN Orders ON Customer.Customer_ID = Orders.Customer_ID
JOIN Invoice ON Orders.Order_ID = Invoice.Shipment_ID
JOIN Shipment ON Invoice.Shipment_ID = Shipment.Shipment_ID
WHERE Shipment.Shipment_Date BETWEEN '2022-01-01' AND '2022-03-31'
GROUP BY Customer.Customer_ID;


SELECT SUM(Payment_Amount)
FROM Payment
JOIN Invoice ON Payment.Invoice_ID = Invoice.Invoice_ID
WHERE invoice.Customer_ID = 10;


select c.customer_id,c.customer_name,sum(i.total_amount) as total_amount
from invoice as i 
join customer as c on c.customer_id=i.customer_id
where i.payment_status='paid'
group by c.customer_id
order by total_amount desc
limit 5;


SELECT *
FROM Shipment
JOIN Tracking ON Shipment.Shipment_ID = Tracking.Shipment_ID
WHERE Status != 'Delivered';