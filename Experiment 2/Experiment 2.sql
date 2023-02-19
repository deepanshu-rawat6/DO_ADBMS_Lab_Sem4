USE exp2;

-- Task 1: Creating the tables

CREATE TABLE IF NOT EXISTS CLIENT_MASTER_1(
	CLIENTNO VARCHAR(8) PRIMARY KEY CHECK (CLIENTNO LIKE 'C%') ,
    NAME VARCHAR(20) NOT NULL, 
    ADDRESS_1 VARCHAR(30),
    ADDRESS_2 VARCHAR(30), 
    CITY VARCHAR(15), 
    PINCODE INT, 
    STATE VARCHAR(15), 
    BALDUE DECIMAL(10,2)
);
CREATE TABLE IF NOT EXISTS PRODUCT_MASTER_1(
	PRODUCTNO VARCHAR(6) PRIMARY KEY CHECK(PRODUCTNO LIKE 'P%'),
	DESCRIPTION VARCHAR(15) NOT NULL,
	PROFITPERCENT DECIMAL(4,2) NOT NULL, 
	UNIT_MEASURE VARCHAR(10) NOT NULL,
	QTYONHAND INT NOT NULL, 
	REORDERL_VL INT NOT NULL, 
	SELLPRICE DECIMAL(8,2) NOT NULL, 
	COSTPRICE DECIMAL(8,2) NOT NULL
);
CREATE TABLE IF NOT EXISTS SALESMAN_MASTER_1(
	SALESMANNO VARCHAR(6) PRIMARY KEY CHECK(SALESMANNO LIKE "S%"),
    SALESMANNAME VARCHAR(20) NOT NULL,
    ADDRESS_1 VARCHAR(30) NOT NULL,
    ADDRESS_2 VARCHAR(30),
    CITY VARCHAR(20),
    PINCODE	INT,
    STATE VARCHAR(20),
    SALAMT REAL NOT NULL CHECK(SALAMT > 0),
	TGTTOGET DECIMAL NOT NULL CHECK(TGTTOGET > 0),
    YTDSALES DOUBLE NOT NULL,
    REMAKRS VARCHAR(60)
);

-- Task 2: Inserting data into the tables

INSERT INTO CLIENT_MASTER_1
VALUES (
        'C00001',
        'Ivan bayross',
        'ADDRESS1',
        'ADDRESS2',
        'Mumbai',
        '400054',
        'Maharashtra',
        15000
    ),
    (
        'C00002',
        'Mamta muzumdar',
        'ADDRESS1',
        'ADDRESS2',
        'Madras',
        '780001',
        'Tamil nadu',
        0
    ),
    (
        'C00003',
        'Chhaya bankar',
        'ADDRESS1',
        'ADDRESS2',
        'Mumbai',
        '400057',
        'Maharashtra',
        5000
    ),
    (
        'C00004',
        'Ashwini joshi',
        'ADDRESS1',
        'ADDRESS2',
        'Bangalore',
        '560001',
        'Karnataka',
        0
    ),
    (
        'C00005',
        'Hansel colaco',
        'ADDRESS1',
        'ADDRESS2',
        'Mumbai',
        '400060',
        'Maharashtra',
        2000
    ),
    (
        'C00006',
        'Deepak sharma',
        'ADDRESS1',
        'ADDRESS2',
        'Mangalore',
        '560050',
        'Karnataka',
        0
    );
    
INSERT INTO PRODUCT_MASTER_1
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

INSERT INTO SALESMAN_MASTER_1
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
    
-- Task 3: Display the contents of each table

select * from CLIENT_MASTER_1;
select * from PRODUCT_MASTER_1;
select * from SALESMAN_MASTER_1;

-- Task 4: Create table AUTHOR = {Author_ID , Lastname, Firstname, Email, City, Country}

CREATE TABLE IF NOT EXISTS AUTHOR(
	AUTHOR_ID VARCHAR(5) PRIMARY KEY,
    LASTNAME VARCHAR(15) NOT NULL,
    FIRSTNAME VARCHAR(15) NOT NULL,
    EMAIL VARCHAR(40),
    CITY VARCHAR(15),
    COUNTRY VARCHAR(15)
);

SELECT * FROM AUTHOR;

-- Task 5: Create Table BOOK={ Book_ID, Book_Title, Copies)

CREATE TABLE IF NOT EXISTS BOOK(
	BOOK_ID VARCHAR(5) PRIMARY KEY CHECK(BOOK_ID LIKE 'B%'),
    BOOK_TITLE VARCHAR(50) NOT NULL,
    COPIES INT CHECK(COPIES > 2)
);

SELECT * FROM BOOK;

-- Task 6: Create table AUTHOR_LIST = {Author_ID , Book_ID , Role}

CREATE TABLE IF NOT EXISTS AUTHOR_LIST(
	AUTHOR_ID VARCHAR(5),
    BOOK_ID VARCHAR(5),
    ROLE VARCHAR(15),
    Constraint pk PRIMARY KEY(AUTHOR_ID,BOOK_ID),
    FOREIGN KEY (AUTHOR_ID) REFERENCES AUTHOR(AUTHOR_ID),
    FOREIGN KEY (BOOK_ID) REFERENCES BOOK (BOOK_ID)
);

SELECT * FROM AUTHOR_LIST;

-- Task 7: Add four records in each tables AUTHOR, BOOK, BOOK_LIST

INSERT INTO AUTHOR 
VALUES (
		"A0001", 
		"Corey", 
		"James", 
		"jamessacorey@gmail.com", 
		"New Mexico", 
		"USA"
    ),
    (
		"A0002", 
        "Horowitz", 
        "Anthony", 
        "anthorz@gmail.com", 
        "London", 
        "England"
	),
    (	
		"A0003", 
        "Riordan", 
        "Rick", 
        "rriordan@gmail.com", 
        "Texas", 
        "USA"
	),
	(	
		"A0004", 
        "Martin", 
        "George", 
        "rrmartin@gmail.com", 
        "New Jersey", 
        "USA"
);
SELECT * FROM AUTHOR;

INSERT INTO BOOK 
VALUES(
		"B0001", 
        "Leviathan Wakes", 
        4000000
	),
    (	
		"B0002", 
        "Ark Angel", 
        9000000
	),
    (	
		"B0003", 
        "Lightning Thief", 
        1200000
	),
    (
		"B0004", 
        "A Song of Ice and Fire", 
        90000000
);

SELECT * FROM BOOK;

INSERT INTO AUTHOR_LIST 
VALUES(
		"A0001",
        "B0001",
        "Author"
	),
    (
		"A0002",
        "B0002",
        "Author"
	),
	(
		"A0003",
        "B0003",
        "Author"
	),
	(
		"A0004",
        "B0004",
        "Author"
);

SELECT * FROM AUTHOR_LIST;

-- Task 8: Alter structure of table AUTHOR_LIST add the field Publisher data type of 30 Character.

ALTER TABLE AUTHOR_LIST ADD COLUMN PUBLISHER VARCHAR(30);
desc AUTHOR_LIST;

