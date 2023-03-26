use exp6;

CREATE TABLE employees(
	Employee_id VARCHAR(10) PRIMARY KEY,
	First_Name VARCHAR(30) NOT NULL,
    Last_Name VARCHAR(30) NOT NULL,
    DOB DATE,
    Salary NUMERIC(25) NOT NULL,
    Department_id VARCHAR(10)
);

INSERT INTO employees 
VALUES(
	"E0001","John","Smith","2001-01-01",25000, "D0001"),
    ("E0002","Barry","Allen","1980-12-05",25000, "D0002"),
    ("E0003","Clark","Kent","1990-09-24",25000, "D0003"),
    ("E0004","James","Miller","1988-11-15",25000, "D0004"),
    ("E0005","Deepanshu","Rawat","2003-10-21",35000,"D0005"),
    ("E0006","Rahul","Sharma","2000-11-12","30000","D0006"
);


SELECT * FROM employees;

-- Task:2	Execute the following view related queries:

-- 1) Create View of name emp_view and the column would be Employee_id, Last_Name,salary and department_id only.
create view emp_view as 
	select Employee_id, Last_name, Salary, Department_id from employees;
    
select * from emp_view;    

-- 2) Insert values into view(remove the NOT NULL constraint and then insert values)
ALTER TABLE employees MODIFY Last_Name VARCHAR(30) NULL;
ALTER TABLE employees MODIFY Salary VARCHAR(30) NULL;
DESC emp_view;


INSERT INTO employees 
VALUES(
	"E0007", "Manan", "Gupta", "2000-01-22", NULL, "D0007"),
    ("E0008", "Jimmy", NULL , "1999-8-25", 35000, "D0008"
);

SELECT * FROM emp_view;

-- 3) Modify, delete and drop operations are performed on view.
UPDATE emp_view SET Department_id='D0020' WHERE Employee_id='E0004';
DELETE FROM emp_view WHERE Last_Name="Gupta";

SELECT * FROM emp_view;
DROP VIEW emp_view;

-- 4) Creates a view named salary_view. The view shows the employees in department 20 andtheir annual salary.
CREATE VIEW salary_view AS
	SELECT Employee_id, First_Name, Last_Name, Salary * 12, Department_id FROM employees WHERE Department_id='D0020';

SELECT * FROM salary_view;


