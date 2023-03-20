use exp3;

-- Task 1: Creating the tables
 
create table Supplier (
	scode varchar(5) primary key,
    sname varchar(20),
    scity varchar(20),
    turnover int
);

desc supplier;

create table Part (
	pcode varchar(5) primary key,
    weight int,
    color varchar(10),
    cost int,
    sellingprice int
);

desc Part; 

create table Supplier_Part (
	scode varchar(5) references Supplier(scode),
    pcode varchar(5) references Part(pcode),
    qty int
);

desc Supplier_Part;

-- Task 2: Populate the tables

insert into Supplier 
values(
		'S001', 
        'Michael',
        'Washington DC', 
        25000
	),
    (
		'S002', 
        'Rachel',
        'Ontario', 
        50000
    ),
    (
		'S003', 
        'Simon',
        'New Jersy', 
        20000
    ),
    (
		'S004', 
        'Ronaldo',
        'New York', 
        80000
    );

select * from Supplier;

insert into Part
values(
		'P001', 
        10,
        'Blue', 
        2000, 
        3000
	),
    (
		'P002', 
        15,
        'cyan', 
        1000, 
        1500
    ),
    (
		'P003', 
        12,
        'red', 
        5000,
        7000
    ),
    (
		'P004', 
        20,
        'ocean blue', 
        7000, 
        9000
	);
    
select * from Part;

insert into Supplier_Part
values(
		'S001',
        'P001', 
        9
	),
    (
		'S002',
        'P002', 
        20
    ),
    (
		'S003',
        'P003', 
        17
    ),
    (
		'S004',
        'P004', 
        5
	);
    
select * from Supplier_Part;

-- Task 3: Write appropriate SQL Statement for the following:

-- 1. Get the supplier number and part number in ascending order of supplier number.
select scode,pcode from supplier_part order by scode;

-- 2. Get the details of supplier who operate from New Jersy with turnover 5000.
select * from Supplier where scity = 'New Jersy' and turnover > 5000;

-- 3. Get the total number of suppliers.
select COUNT(scode) from Supplier;

-- 4. Get the part number weighing between 11 and 19.
select pcode from Part where weight between 11 and 19;

-- 5. Get the supplier number whose turnover is null.
select scode from Supplier where turnover is NULL;

-- 6. Get the part number that cost 20, 30 or 40 rupees.
select pcode from Part where cost = 20 or 30 or 40;

-- 7. Get the total quantity of part 2 that is supplied.
select SUM(qty) from Supplier_part where pcode = "P002";

-- 8. Get the name of supplier who supply part 2.
select Supplier.sname from Supplier inner join Supplier_part on Supplier.scode=Supplier_part.scode where Supplier_part.pcode="P002";

-- 9. Get the part number whose cost is greater than the average cost.
select pcode from Part where cost > ( Select AVG(cost) from Part);

-- 10. Get the supplier number and turnover in descending order of turnover.
select scode, turnover from Supplier order by turnover DESC;
 





