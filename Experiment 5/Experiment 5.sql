use exp4;

-- Task 1: Create the following two tables(EMP and DEPT) 

create table emp(
	dept_no int(4), 
    emp_no int(4), 
    ename varchar(25), 
    njob varchar(15), 
    mgr int(4), 
    hiredate varchar(25),
	sal int(4),
    comm int(5)
);

desc emp;

insert into emp 
values
(
	20,7369,'SMITH','CLERK',7902,'1980-12-17',500,800),
    (30,7499,'ALLEN','SALESMAN',7698,'1981-02-20',1600,300),
    (30,7521,'WARD','SALESMAN',7698,'1981-02-22',1200,500),
    (30,7521,'JONES','MANAGER',7839,'1981-04-02',2975,400),
    (30,7654,'MARTIN','SALESMAN',7698,'1981-09-28',1250,1400),
    (30,7521,'BLAKE','MANAGER',7839,'1981-05-01',1800,2850),
    (10,7521,'CLARK','MANAGER',7839,'1981-06-09',2000,2450),
    (20,7788,'SCOTT','ANALYST',7566,'1982-12-09',1200,3000),
    (10,7839,'KING','PRESIDENT',0001,'1981-11-17',5000,1000),
    (30,7844,'TURNER','SALESMAN',7698,'1981-09-08',1500,0),
    (20,7876,'ADAMS','CLERK',7788,'1983-01-12',1100,800),
    (30,7900,'JAMES','MANAGER',7698,'1981-12-03',950,100),
    (20,7902,'FORD','ANALYST',7566,'1981-12-03',3000,600),
    (10,7839,'MILLER','CLERK',7782,'1982-01-23',1300,400
);

select * from emp;

create table dept(
	dept_no int(4), 
    dname varchar(25), 
    loc varchar(15)
);

desc dept;

insert into dept
values
(
		10, 'ACCOUNTING','NEW YORK'),
        (20, 'RESEARCH','DALLAS'),
        (30, 'SALES','CHICAGO'),
        (40, 'OPERATIONS','BOSTON'
);

select * from dept;

-- Task 2: Write the Nested Queries for the following queries.

-- 1.	List the details of the emps whose Salaries more than the employee BLAKE.
select * from emp where sal > (select sal from emp where ename = 'BLAKE');

-- 2.	List the emps whose Jobs are same as ALLEN.
select * from emp where njob = (select njob from emp where ename = 'ALLEN');

-- 3.	List the Emps whose Sal is same as FORD or SMITH in desc order of Names.
select * from emp where sal = (select sal from emp where ename = 'FORD') or sal = (select sal from emp where ename = 'SMITH') 
order by ename desc;

-- 4.	List the emps Whose Jobs are same as MILLER or Sal is more than ALLEN.
select * from emp where njob = (select njob from emp where ename = 'MILLER')  or sal > (select sal from emp where ename = 'ALLEN');

-- 5.	Find the highest paid employee of sales department.
select ename from emp where sal = (select MAX(sal) from emp where dept_no = 20);

-- 6.	List the employees who are senior to most recently hired employee working under king.
select * from emp where sal = (select MAX(sal) from emp);

-- 7.	List the names of the emps who are getting the highest sal dept wise.
select * from emp where sal in (select MAX(sal) from emp group by dept_no);

-- 8.	List the emps whose sal is equal to the average of max and minimum.
select * from emp where sal = (select ( max(sal) + min(sal))/2 from emp);

-- 9.	List the emps who joined in the company on the same date.
select * from emp where hiredate in (
	select hiredate from emp group by hiredate having COUNT(*) > 1 
);

-- 10.	Find out the emps who joined in the company before their managers.
select e.ename as employee_name, e.hiredate as employee_hiredate, m.ename as manager_name, m.hiredate as manager_hiredate 
	from emp e join emp m on e.mgr = m.emp_no where e.hiredate < m.hiredate;

    
    
-- Task 1:  Write the SQL Queries for the following queries (use emp_table and dept_table ofExperiment 4).

-- 1. List the Deptno where there are no emps.
select d.dept_no from dept d left join emp e on d.dept_no = e.dept_no where e.emp_no is null;

-- 2. List the No.of emp’s and Avg salary within each department for each job.
select dept_no, count(*) as no_of_emp, avg(sal) as avg_sal from emp group by dept_no having count(*) > 1;

-- 3. Find the maximum average salary drawn for each job except for ‘President’.
select njob, avg(SAL) as avg_sal from emp group by njob having count(*) > 1;

-- 4. List the department details where at least two emps are working.
select d.dept_no from dept d join emp e on d.dept_no = e.dept_no group by d.dept_no having count(*) > 1;

-- 5. List the no. of emps in each department where the no. is more than 3.
select dept_no, count(*) as no_of_emp from emp group by dept_no having count(*) > 3;

-- 6. List the names of the emps who are getting the highest sal dept wise.
select ename, dept_no from emp where sal in (select max(sal) from emp group by dept_no);

-- 7. List the Deptno and their average salaries for dept with the average salary less than theaverages for all departments.
select dept_no, avg(sal) from emp group by dept_no having avg(sal) < (select avg(sal) from emp);

-- Task 2: Execute the experiment 4 using sql join.

-- 1.	List the details of the emps whose Salaries more than the employee BLAKE.
select * from emp 
	right join dept on emp.dept_no = dept.dept_no where 
	sal > (select sal from emp where ename = 'BLAKE');

-- 2.	List the emps whose Jobs are same as ALLEN.
select * from emp 
	right join dept on emp.dept_no = dept.dept_no where 
	njob = (select njob from emp where ename = 'ALLEN');

-- 3.	List the Emps whose Sal is same as FORD or SMITH in desc order of Names.
select * from emp 
	right join dept on emp.dept_no = dept.dept_no where 
	sal = (select sal from emp where ename = 'FORD') or sal = (select sal from emp where ename = 'SMITH') 
	order by ename desc;

-- 4.	List the emps Whose Jobs are same as MILLER or Sal is more than ALLEN.
select * from emp 
	right join dept on emp.dept_no = dept.dept_no where 
	njob = (select njob from emp where ename = 'MILLER')  or sal > (select sal from emp where ename = 'ALLEN');

-- 5.	Find the highest paid employee of sales department.
select * from emp
	right join dept on emp.dept_no = dept.dept_no where 
	sal = (select MAX(sal) from emp);

-- 6.	List the employees who are senior to most recently hired employee working under king.
select * from emp 
	right join dept on emp.dept_no = dept.dept_no
	where hiredate < (select max(hiredate) from emp
		where mgr = (select emp_no from emp where ename = "KING" ));
    
-- 7.	List the names of the emps who are getting the highest sal dept wise.
select * from emp 
	right join dept on emp.dept_no = dept.dept_no
	where sal in (select MAX(sal) from emp group by dept_no);

-- 8.	List the emps whose sal is equal to the average of max and minimum.
select * from emp
	right join dept on emp.dept_no = dept.dept_no
	where sal = (select ( max(sal) + min(sal))/2 from emp);

-- 9.	List the emps who joined in the company on the same date.
select * from emp 
	right join dept on emp.dept_no = dept.dept_no
	where hiredate in (
		select hiredate from emp group by hiredate having COUNT(*) > 1 
	);

-- 10.	Find out the emps who joined in the company before their managers.
select e.ename as employee_name, e.hiredate as employee_hiredate, m.ename as manager_name, m.hiredate as manager_hiredate 
	from emp e join emp m on e.mgr = m.emp_no where e.hiredate < m.hiredate;