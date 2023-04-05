-- 1. Execute the following index related queries:
use exp7;
create table employees as select * from exp6.employees;
select * from employees;

-- 1) Create an index of name employee_idx on EMPLOYEES with column Last_Name,Department_id.
create index employee_idx on employees (Last_name,Department_id);
show index from employees;


-- 2) Find the ROWID for the above table and create a unique index on employee_id column ofthe EMPLOYEES.
select @ROWID:=@ROWID+1 as ROWID from employees,(select @ROWID:=0) as init;
create unique index employee_uni_idx on employees(employee_id);
show index from employees;

-- 3) Create a reverse index on employee_id column of the EMPLOYEES.
create index idx on employees(employee_id desc);
show index from employees;

-- 4) Create a unique and composite index on employee_id and check whether there isduplicity of tuples or not.
create unique index index2 on employees(employee_id,department_id);
show index from employees;

-- 5) Create Function-based indexes defined on the SQL functions UPPER (column_name) orLOWER(column_name) to facilitate 
-- case-insensitive searches (on column Last_Name).
create index upper_col1 on employees((UPPER(Last_name)));
create index lower_col1 on employees((LOWER(Last_name)));
show index from employees;

-- 6) Drop the function-based index on column Last_Name.
alter table employees drop index upper_col1;
alter table employees drop index lower_col1;

drop index employee_uni_idx on employees;
drop index idx on employees;

show index from employees;



