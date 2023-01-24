SHOW DATABASES;
use table_db;
-- Task 1: Creating the tables
create table CLIENT_MASTER(
	CLIENTNO VARCHAR(6),
    NAME VARCHAR(20),
    CITY VARCHAR(15),
    PINCODE INT,
    STATE VARCHAR(15),
    BALDUE DECIMAL(10, 2)
);

create table PRODUCT_MASTER(
	PRODUCTNO VARCHAR(6),
    DESCRIPTION VARCHAR(15),
    PROFITPERCENT DECIMAL(4, 2),
    UNIT_MEASURE VARCHAR(10),
    QTYONHAND INT,
    REORDERL_VL INT,
    SELLPRICE DECIMAL(8, 2),
    COSTPRICE DECIMAL(8, 2)
);

create table SALESMAN_MASTER(
    SALESMANNO VARCHAR(6),
    SALESMANNAME VARCHAR(20),
    ADDRESS_1 VARCHAR(30),
    ADDRESS_2 VARCHAR(30),
    CITY VARCHAR(20),
    PINCODE INT,
    STATE VARCHAR(20),
    SALAMT REAL,
    TGTTOGET DECIMAL,
    YTDSALES DOUBLE(6, 2),
    REMARKS VARCHAR(60)
);

-- Task 2: Inserting data into the tables

INSERT INTO CLIENT_MASTER
VALUES (
        'C00001',
        'Ivan bayross',
        'Mumbai',
        '400054',
        'Maharashtra',
        15000
    ),
    (
        'C00002',
        'Mamta muzumdar',
        'Madras',
        '780001',
        'Tamil nadu',
        0
    ),
    (
        'C00003',
        'Chhaya bankar',
        'Mumbai',
        '400057',
        'Maharashtra',
        5000
    ),
    (
        'C00004',
        'Ashwini joshi',
        'Bangalore',
        '560001',
        'Karnataka',
        0
    ),
    (
        'C00005',
        'Hansel colaco',
        'Mumbai',
        '400060',
        'Maharashtra',
        2000
    ),
    (
        'C00006',
        'Deepak sharma',
        'Mangalore',
        '560050',
        'Karnataka',
        0
    );
    
select * from CLIENT_MASTER;

INSERT INTO PRODUCT_MASTER
VALUES (
        'P00001',
        'T-Shirt',
        5,
        'Piece',
        200,
        50,
        350,
        250
    ),
    ('P0345', 'Shirts', 6, 'Piece', 150, 50, 500, 350),
    (
        'P06734',
        'Cotton jeans',
        5,
        'Piece',
        100,
        20,
        600,
        450
    ),
    ('P07865', 'Jeans', 5, 'Piece', 100, 20, 750, 500),
    (
        'P07868',
        'Trousers',
        2,
        'Piece',
        150,
        50,
        850,
        550
    ),
    (
        'P07885',
        'Pull Overs',
        2.5,
        'Piece',
        80,
        30,
        700,
        450
    ),
    (
        'P07965',
        'Denim jeans',
        4,
        'Piece',
        100,
        40,
        350,
        250
    ),
    (
        'P07975',
        'Lycra tops',
        5,
        'Piece',
        70,
        30,
        300,
        175
    ),
    (
        'P08865',
        'Skirts',
        5,
        'Piece',
        100,
        30,
        450,
        300
    );

select * from PRODUCT_MASTER;

INSERT INTO SALESMAN_MASTER
VALUES (
        'S00001',
        'Aman',
        'A/14',
        'Worli',
        'Mumbai',
        400002,
        'Maharashtra',
        3000,
        50000,
        0,
        'Good'
    ),
    (
        'S00002',
        'Omkar',
        '65',
        'Nariman',
        'Mumbai',
        400001,
        'Maharashtra',
        3500,
        50000,
        0,
        'Good'
    ),
    (
        'S00003',
        'Raj',
        'P-7',
        'Bandra',
        'Mumbai',
        400032,
        'Maharashtra',
        3000,
        50000,
        0,
        'Good'
    ),
    (
        'S00004',
        'Ashish',
        'A/5',
        'Juhu',
        'Mumbai',
        400044,
        'Maharashtra',
        3500,
        50000,
        0,
        'Good'
    );
    
select * from SALESMAN_MASTER;

-- Task 3: Retrieving records from the table

-- Find out the names of all the clients.
select NAME from CLIENT_MASTER;

-- Retrieve the entire contents of the Client_Master table.
select * from CLIENT_MASTER;

-- Retrieve the list of names, city and the state of all the clients.
select NAME,CITY,STATE from CLIENT_MASTER;

-- List the various products available from the Product_Master table.
select DESCRIPTION from PRODUCT_MASTER;

-- List all the clients who are located in Mumbai
select * from CLIENT_MASTER where CITY ='Mumbai';

-- Find the names of salesman who have a salary equal to Rs.3000. 
select SALESMANNAME from SALESMAN_MASTER where SALAMT = 3000;


-- Task 4: Updating records in a table

-- Change the city of ClientNo ‘C00005’ to ‘Bangalore’.
update CLIENT_MASTER set CITY = 'Banglore' where CLIENTNO = 'C00005'; 
select CLIENTNO,CITY from CLIENT_MASTER;

-- Change the BalDue of ClientNo ‘C00001’ to Rs.1000.
update CLIENT_MASTER set BALDUE = 1000 where CLIENTNO = 'C00001';
select CLIENTNO,BALDUE from CLIENT_MASTER;

-- Change the cost price of ‘Trousers’ to rs.950.00.
update PRODUCT_MASTER set COSTPRICE = 950 where DESCRIPTION = 'Trousers';
select DESCRIPTION,COSTPRICE from PRODUCT_MASTER;

-- Change the city of the salesman to Pune.
update SALESMAN_MASTER set CITY = 'Pune';
select CITY from SALESMAN_MASTER;

-- Task 5: Deleting records in a table

-- Delete all salesman from the Salesman_Master whose salaries are equal to Rs.3500.
delete from SALESMAN_MASTER where SALAMT = 3500;
select * from SALESMAN_MASTER;

-- Delete all products from Product_Master where the quantity on hand is equal to 100.
delete from PRODUCT_MASTER where QTYONHAND = 100;
select * from PRODUCT_MASTER;

-- Delete from Client_Master where the column state holds the value ‘Tamil Nadu’.
delete from CLIENT_MASTER where STATE = 'Tamil Nadu';
select * from CLIENT_MASTER;

-- Task 6: Altering the table structure

-- Add a column called ‘Telephone’ of data type integer to the Client_Master table.
alter table CLIENT_MASTER add TELEPHONE int;
select * from CLIENT_MASTER;

-- Change the size off SellPrice column in Product _Master to 10, 2.
alter table PRODUCT_MASTER modify SELLPRICE DECIMAL(10,2);
select * from PRODUCT_MASTER;

-- Task 7: Deleting the table structure along with data

-- Destroy the table Client_Master along with its data
drop table CLIENT_MASTER;
show tables;

-- Task 8: Renaming the table

-- Change the name of the Salesman_Master to sman_mast.
rename table SALESMAN_MASTER to sman_mast;
show tables;
