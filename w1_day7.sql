create database insightx;
use insightx;
#creating tables:
create table employee(
    employee_id int AUTO_INCREMENT PRIMARY KEY,
    employee_name VARCHAR(20) not null,
    salary int not null
);
create table students(
    student_id int AUTO_INCREMENT PRIMARY KEY,
    student_name varchar(20) not null,
    total_score int not null
);
#inserting data in our tables:
insert into employee(employee_name,salary)values('mehul',50000);
insert into employee(employee_name,salary)values('nakul',45000);
insert into employee(employee_name,salary)values('mehul',55000);
insert into employee(employee_name,salary)values('rahul',40000);
insert into employee(employee_name,salary)values('ritik',60000);
insert into students(student_name,total_score)values('mehul',82);
insert into students(student_name,total_score)values('nakul',76);
insert into students(student_name,total_score)values('rahul',85);
insert into students(student_name,total_score)values('aditya',90);
insert into students(student_name,total_score)values('ritik',72);

#TASK 1: create an index on the salary column of an employees table and test performance:
--step A: testing performance before creating an index.
EXPLAIN select*from employee where salary = 55000;
#output observations:
# i.)the 'type' column says 'ALL'
# ii.) and the rows column says '5'
# this means the database had to do a "full table scan"(checking every single row)

--STEP B: creating a non_clustered index on the salary column.
create index idx_salary on employee(salary);

--STEP C: testing performance after creating the index:
EXPLAIN select * from employee where salary = 55000;
# OUTPUT Observation: 
# look at the 'type' column: it will now say 'ref' or 'const'.
# look at the 'key' column: it will show 'idx_salary'.
# look at the 'rows' column: it will show '1'.
# SUCCESS:The database went straight to the record without checking the others.

#TASK 2:find students scoring above 80 and analyze execution plan
select * from students where total_score>80;--(output: mehul,rahul,aditya)
# Analyzing the Execution Plan:
EXPLAIN select * from students where total_score > 80;
# Reasoning: even though we have our results, the EXPLAIN plan will show 'type: ALL'.
# this tells us that for "Range Queries" (> 80), an index would be very helpful 
# if we had 10,000 students.

#TASK 3: clustered and non-clustered Indexes:
# A.) clustered index:
# in mysql, the primary key is automatically the clustered index.
# it physically organizes the data on the disk in the order of the id.
# we already have this on 'student_id' and 'employee_id'.

# B.) non-clustered index:
#this is like an index at the back of a book. it points on the location of data.
#let's create one for the students scores to optimize task 2.
create index idx_score on students(total_score);
#verification:
show index from students;
