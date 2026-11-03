Drop Database if exists Shopping_Management;
Create Database Shopping_Management;
Use Shopping_Management;

Create Table customers(
       Customer_id int primary key auto_increment,
       Customer_Name varchar(100) not null,
       Email varchar(100) unique not null,
       Phone_Number varchar(10) unique not null,
       Age tinyint unsigned check(Age>0),
       Gender ENUM('Male','Female','Other'),
       Country varchar(100) default 'India',
       City varchar(50) not null,
       Pincode varchar(6) default '201301',
       Registration_Date Date default(current_date),
       Registration_time Time default(current_time),
       Created_At Timestamp default(current_timestamp),
       Address varchar(250),
       Customer_status ENUM('Active','Inactive','Blocked') default 'Active',
       Customer_Notes varchar(1024) 
       );

select* from customers;

Create Table orders(
       Order_Id int primary key auto_increment,
       Customer_Id INT,
       foreign key (Customer_Id) References Customers(Customer_Id),
       Order_Date date default(current_date),
       Order_Amount decimal(10,2) not null,
       Order_status ENUM('pending','shipped','Delivered','Cancelled') Default 'Pending',
       Payment_Method ENUM('Cash', 'Card', 'UPI', 'Net Banking'),
       Payment_Status ENUM('Pending', 'Paid', 'Failed')Default 'Pending',
       Shipping_Address VARCHAR(250) NOT NULL,
       Delivery_Pincode Char(6),
       Quantity INT NOT NULL CHECK (Quantity > 0),
       Discount_Amount DECIMAL(10,2) Default 0.00,
       Delivery_Date DATE Default NULL,
       Created_At DATETIME Default CURRENT_TIMESTAMP,
       Tracking_Number VARCHAR(30) UNIQUE,
       Delivery_Status ENUM('Not Dispatched','In Transit','Delivered','Returned') DEFAULT 'Not Dispatched',
       Order_Notes VARCHAR(1024)
 );
 
 select* from orders;
 
ALTER TABLE orders
ADD CONSTRAINT fk_customer_orders
FOREIGN KEY (Customer_Id)
REFERENCES customers(Customer_Id)
ON DELETE CASCADE
ON UPDATE CASCADE;

show create table orders;
       