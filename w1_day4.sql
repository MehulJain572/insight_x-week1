show databases;
#creating a database:
create database students;
#selecting that database:
use students;
#creating table in that database:
create table students(
    id int AUTO_INCREMENT PRIMARY KEY,
    name varchar(20) not null,
    section varchar(1) not null,
    age int default 20
);
#viewing that table:
desc table students;
#inserting record in the table:
insert into students(name,section) values('mehul','E');
insert into students(name,section,age) values('rajiv','H',19);
insert into students(name,section) values('rahul','A');
insert into students(name,section,age) values('nitin','E',21);
insert into students values(5,'vikas','M',22);
insert into students(name,section) values('karan','C');

#viewing our data:using select command
select*from students;
#delete operation , where command:
delete from students where id=6;
#again viewing our data:
select * from students;
# another way to use select command:
select id,name from students;
#update command:
update students set name='mj' where id=1;
#viewing our data:
select*from students;
#using order_by:
SELECT*FROM students ORDER BY age DESC;

#using having and other commands:
SELECT section, COUNT(*) as student_count FROM students GROUP BY section HAVING student_count > 1;
#final view of our data:
select * from students;
