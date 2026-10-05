-- use freelance;
-- -----------------------------------------
-- DROP TABLE IF EXISTS client;

-- CREATE TABLE client (
--     client_id INT NOT NULL AUTO_INCREMENT,
--     Name VARCHAR(100) NOT NULL,
--     Email VARCHAR(100) NOT NULL,
--     phone VARCHAR(15) DEFAULT NULL,
--     city VARCHAR(50) DEFAULT NULL,
--     company VARCHAR(100) DEFAULT NULL,
--     is_active TINYINT DEFAULT 1,
--     created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
--     PRIMARY KEY (client_id),
--     UNIQUE KEY unique_email (Email)
-- );
-- ============================================================================================


-- ===================================================================================================
-- create table task
-- (
-- task_id  INT auto_increment primary key,
-- project_id INT not null,

-- title text not null,
-- description text,

-- status ENUM ('TODO','IN_PROGRESS','DONE')
-- 	default 'TODO',
--     
-- estimated_hours decimal(5,2),

-- created_at timestamp default current_timestamp,

-- foreign key(project_id)
-- 	references project(project_id)
--     on delete cascade,

-- Check(estimated_hours is null or estimated_hours > 0)
-- );
-- ==========================================================================================================================

-- create table time_log
-- (
-- log_id INT auto_increment primary key,
-- task_id INT NOT NULL,
-- start_time datetime not null,
-- end_time datetime null,
-- duration_hours decimal(6,2) null,
-- is_billed boolean default false,
-- created_at timestamp default current_timestamp,

-- foreign key(task_id)
-- 	references task (task_id)
--     on delete restrict,

-- check (
-- 	end_time is null
--     or end_time > start_time
--     )
-- );

-- ==========================================================================================

-- create table invoice 
-- (
-- invoice_id INT AUTO_INCREMENT PRIMARY KEY,
-- invoice_number varchar(20) unique not null,
-- project_id int not null,
-- issue_date date not null,
-- due_date date not null,
-- status enum('DRAFT','SENT','PARTIAL','OVERDUE','PAID') 
-- 	default 'DRAFT',
-- tax_percent decimal(4,2) default 0,

-- created_at timestamp default current_timestamp,

-- foreign key(project_id)
-- 	references project(project_id)
--     on delete restrict,
--     
-- check (due_date >= issue_date),
-- check(tax_percent >= 0)

-- );

-- =============================================================================================


-- create table invoice_item
-- (
-- item_id INT auto_increment primary key,
-- invoice_id int not null,
-- discription varchar(200) not null,
-- quantity decimal(8,2) not null,
-- unit_price decimal(10,2) not null,
-- created_at timestamp default current_timestamp,

-- foreign key (invoice_id)
-- 	references invoice(invoice_id)
--     on delete cascade,

-- check (quantity > 0 ),
-- check(unit_price > 0)

-- );

-- ============================================================================================

-- create table payment
-- (
-- payment_id INT auto_increment primary key,
-- invoice_id INT not null,
-- amount decimal(8,2) not null,
-- payment_date date not null,
-- method enum ('UPI', 'BANK', 'CASH', 'CARD') not null,
-- created_at timestamp default current_timestamp,

-- foreign key(invoice_id)
-- 	references invoice_item(invoice_id)
--     on delete restrict,

-- CHECK (amount > 0)

-- );

-- ==============================================================================================

-- create table category
-- (
-- category_id INT auto_increment primary key,
-- name varchar(80) not null,
-- parent_id  INT null,
-- created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

-- foreign key (parent_id)
-- 	references category(category_id)
--     on delete set null
-- );
-- ==========================================================================================================

-- create table expense
-- (
-- expense_id INT auto_increment primary key,
-- category_id INT not null,
-- project_id INT null,
-- amount decimal(10,2) not null,
-- expense_date date not null,
-- discription varchar(100),
-- created_at timestamp default current_timestamp,

-- foreign key(category_id)
-- 	references category(category_id)
--     on delete restrict,

-- foreign key(project_id)
-- 	references project(project_id)
--     on delete set null,

-- check(amount > 0 )

-- );

-- =======================================================================================

-- create table app_user
-- (
-- user_id INT auto_increment primary key,
-- username varchar(255) not null unique,
-- password_hash varchar(255) not null,
-- salt varchar(255) not null,
-- role enum('ADMIN','VIEWER') not null,
-- failed_attempts INT not null default 0,
-- created_at timestamp default current_timestamp

-- );

-- ================================================================================================

-- create table audit_log
-- (
-- audit_id INT auto_increment primary key,
-- table_name varchar(100) not null,
-- action varchar(20) not null,
-- old_value text,
-- new_value text,
-- changed_at timestamp default current_timestamp

-- );

-- ========================================================================================================

-- create table reminder
-- (
-- remainder_id int auto_increment primary key,
-- invoice_id INT not null,
-- message varchar(255) not null,
-- created_at timestamp default current_timestamp,

-- foreign key(invoice_id)
-- 	references invoice(invoice_id)
--     on delete cascade
-- );

-- =========================================================================================================================
-- scratch DDL 

-- create table scratch
-- -- (
-- -- -- id INT  auto_increment key,
-- -- -- name varchar(50)
-- -- );

-- alter table scratch
-- add column age int;

-- alter table scratch
-- modify column name varchar(100);

-- alter table scratch
-- add constraint chk_stratch_age
-- check(age>0);

-- alter table scratch
-- rename column name to full_name;

-- rename table scratch to scratch_1;

-- insert into scratch_1(full_name,age)
-- values
-- ('John',24),
-- ('Frank',24);

-- truncate table scratch_1;

-- drop table scratch_1;

-- ====================================================================================

-- insert into client (Name,email,phone,city,company)
-- values
-- ('Vaibhav','vaibhavsawant@gmail.com',8567647382,'Nagar','Indiconnect'),
-- ('Shreyas','shreyasghod@gmail.com',8767543429,'Pimpri','Indifly'),
-- ('Mary','marydsouza@gmail.com',8208217533,'Kolhapur','Theobroma'),
-- ('Vijay','vijay3465@gmail.com',98767832323,'Chandgad','Microsoft');


-- update client
-- set phone = 9878676545
-- where client_id = 105;

-- alter table client
-- modify column phone varchar(10);

 -- insert into client (Name,email,phone,city,company)
--  values
-- ('Rahul','rahul7821@gmail.com','9876543210','Pune','Infosys'),
-- ('Sneha','sneha4521@gmail.com','9123456789','Mumbai','Tata Consultancy Services'),
-- ('Amit','amit9034@gmail.com','9988776655','Bangalore','Wipro'),
-- ('Priya','priya6712@gmail.com','9012345678','Hyderabad','Accenture'),
-- ('Rohan','rohan2389@gmail.com','9876123456','Nashik','Tech Mahindra'),
-- ('Neha','neha5643@gmail.com','9098765432','Nagpur','HCL Technologies'),
-- ('Karan','karan8147@gmail.com','9765432109','Kolhapur','Capgemini'),
-- ('Pooja','pooja3298@gmail.com','9321456780','Satara','Deloitte'),
-- ('Akash','akash7462@gmail.com','8899776655','Pune','Oracle');
-- ('Sahil','sahil5832@gmail.com','9876541230','Goa','Persistent Systems'),
-- ('Anjali','anjali7294@gmail.com','9123456780','Aurangabad','IBM'),
-- ('Manish','manish4167@gmail.com','9987654321','Ahmednagar','Cognizant'),
-- ('Kavita','kavita8351@gmail.com','9012783456','Solapur','LTIMindtree'),
-- ('Nikhil','nikhil2946@gmail.com','9765432180','Sangli','Mphasis'),
-- ('Riya','riya6473@gmail.com','8899654321','Thane','Coforge'),
-- ('Aditya','aditya5182@gmail.com','9321678450','Belgaum','SAP'),
-- ('Megha','megha3764@gmail.com','9098123456','Karnataka','Accenture'),
-- ('Suresh','suresh8259@gmail.com','8787654321','Amravati','Cisco'),
-- ('Divya','divya4937@gmail.com','9654781230','Jalgaon','Deloitte');

-- INSERT INTO category (name, parent_id)
-- VALUES 
-- ('Software', NULL),
-- ('Travel', NULL),
-- ('Office', NULL),

-- ('Subscriptions', 1),
-- ('Development Tools', 1),
-- ('Software Licenses', 1),
-- ('Hosting', 1),
-- ('Security Software', 1),

-- ('Cloud', 4),
-- ('Database', 4),
-- ('Storage', 4),
-- ('Backup', 4),

-- ('Flights', 2),
-- ('Hotels', 2),
-- ('Local Transport', 2),
-- ('Food', 2),
-- ('Travel Insurance', 2),

-- ('Stationery', 3),
-- ('Furniture', 3),
-- ('Electronics', 3),
-- ('Internet', 3),
-- ('Electricity', 3);

-- alter table project
-- modify column status
-- enum('ACTIVE','COMPLETED','ON_HOLD','CANCELLED')
-- default 'ACTIVE';


-- INSERT INTO project
-- (client_id, title, billing_type, fixed_price, hourly_rate, status, start_date, deadline)
-- VALUES
-- (101, 'E-commerce Website', 'FIXED', 50000.00, NULL, 'ACTIVE', '2026-01-10', '2026-03-30'),
-- (101, 'Mobile App', 'FIXED', 80000.00, NULL, 'COMPLETED', '2025-08-01', '2025-11-30'),
-- (102, 'API Development', 'HOURLY', NULL, 1500.00, 'ACTIVE', '2026-02-01', '2026-05-30'),
-- (103, 'Website Maintenance', 'HOURLY', NULL, 1000.00, 'ON_HOLD', '2026-01-15', '2026-06-30'),
-- (105, 'Data Dashboard', 'FIXED', 35000.00, NULL, 'COMPLETED', '2025-10-01', '2025-12-15'),
-- (105, 'Cloud Migration', 'FIXED', 60000.00, NULL, 'ACTIVE', '2026-03-01', '2026-06-30'),
-- (106, 'Backend Development', 'HOURLY', NULL, 1800.00, 'ACTIVE', '2026-04-01', '2026-07-31'),

-- (102, 'Payment Gateway Integration', 'FIXED', 45000.00, NULL, 'COMPLETED', '2025-07-10', '2025-09-15'),
-- (103, 'CRM Development', 'FIXED', 75000.00, NULL, 'ACTIVE', '2026-02-15', '2026-07-30'),
-- (104, 'Business Website', 'FIXED', 30000.00, NULL, 'COMPLETED', '2025-05-01', '2025-06-30'),
-- (107, 'Database Optimization', 'HOURLY', NULL, 1200.00, 'ACTIVE', '2026-03-10', '2026-08-31'),
-- (108, 'Mobile App Maintenance', 'HOURLY', NULL, 1400.00, 'ON_HOLD', '2026-01-20', '2026-05-31'),
-- (109, 'Inventory Management System', 'FIXED', 95000.00, NULL, 'ACTIVE', '2026-04-05', '2026-09-30'),
-- (110, 'Data Migration', 'HOURLY', NULL, 1600.00, 'COMPLETED', '2025-11-01', '2026-01-15'),
-- (111, 'Online Booking System', 'FIXED', 65000.00, NULL, 'ACTIVE', '2026-05-01', '2026-09-15'),
-- (112, 'Cloud Server Setup', 'HOURLY', NULL, 2000.00, 'COMPLETED', '2025-09-10', '2025-10-30'),
-- (113, 'HR Management Portal', 'FIXED', 85000.00, NULL, 'ON_HOLD', '2026-02-01', '2026-08-15'),
-- (114, 'API Security Audit', 'HOURLY', NULL, 2200.00, 'COMPLETED', '2025-12-01', '2026-01-10'),
-- (115, 'E-learning Platform', 'FIXED', 120000.00, NULL, 'ACTIVE', '2026-04-15', '2026-10-31'),
-- (116, 'Reporting Dashboard', 'FIXED', 40000.00, NULL, 'CANCELLED', '2026-01-05', '2026-03-31'),
-- (117, 'Website Performance Optimization', 'HOURLY', NULL, 1300.00, 'ACTIVE', '2026-06-01', '2026-09-30'),
-- (118, 'Cloud Backup Solution', 'FIXED', 55000.00, NULL, 'COMPLETED', '2025-10-15', '2025-12-20');


-- CREATE TABLE SCRATCH
-- (
-- CLIENT_ID INT,
-- NAME VARCHAR(100),
-- EMAIL VARCHAR(100),
-- CITY VARCHAR(50)
-- );

-- INSERT INTO SCRATCH (CLIENT_ID,NAME,EMAIL,CITY)
-- SELECT CLIENT_ID,
-- NAME,
-- EMAIL,
-- CITY
-- FROM CLIENT
-- WHERE CLIENT_ID BETWEEN 101 AND 105;



