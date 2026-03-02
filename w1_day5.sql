#creating a database:
create database record;
use record;
#creating a table
create table students(
    student_id int PRIMARY KEY AUTO_INCREMENT,
    student_fname varchar(20) not null,
    student_lname varchar(20) not null,
    student_midname varchar(20),
    student_email varchar(20) UNIQUE KEY not null,
    student_phone varchar(20) UNIQUE KEY not null,
    admission_details TIMESTAMP DEFAULT now(),
    location varchar(20) not null default 'GWALIOR'
);
#viewing the table structure
desc table students;

#inserting data in our table
insert into students(student_fname,student_lname,student_email,student_phone,admission_details)values('mehul','jain','mehu5333@gmail.com','9202177908','2026-03-03 1:38:00');
insert into students(student_fname,student_lname,student_email,student_phone,location)values('nakul','jain','jnakul3@gmail.com','9202997208','bangalore');
insert into students(student_fname,student_lname,student_email,student_phone,admission_details,location)values('rahul','verma','vrahul44@gmail.com','8902177908','2026-03-04 1:41:00','delhi');

#viewing our data and table
select * from students;
#performing count() and group by queries:
select count(*)from students; --this tells how many rows we have in our table students(output=3)
select count(*) from students where location='gwalior'; -- tells how many students are from gwalior(output=1)
select student_lname,count(*) from students group by student_lname; --(output= jain:2 , verma:1)
select student_lname,location,count(*) from students group by student_lname,location; --(output: jain|gwalior|1 ... etc)

#queries containing and,or,between,like:
select * from students where location='gwalior' and student_fname like 'm%'; --(this would output mehul's data)
select * from students where (student_fname='rahul'or student_fname='mehul') and admission_details BETWEEN '2026-03-04 1:40:00'and'2026-03-04 1:42:00'; -- (this will output rahul's data)

#performing inner join:
create table courses(
    course_id int PRIMARY KEY AUTO_INCREMENT,
    course_name varchar(20) not null     -- creating a new table to perform join
);
#inserting some records in the new table:
insert into courses(course_name) values('DSA');
insert into courses(course_name) values('web_d');
insert into courses(course_name) values('data sciecne');
insert into courses(course_name) values('AI-ML');

#modifying our students table:
alter table students add column course_selected int,add FOREIGN key(course_selected) REFERENCES courses(course_id);

#inserting some new data in the students table:
insert into students(student_fname,student_lname,student_email,student_phone,admission_details,location,course_selected)values('rahul','verma','vrahul45@gmail.com','8902197908','2026-03-05 1:41:00','delhi',1);
insert into students(student_fname,student_lname,student_email,student_phone,admission_details,location,course_selected)values('nikhil','verma','vnikhil45@gmail.com','8902100908','2026-03-06 1:41:00','delhi',4);
insert into students(student_fname,student_lname,student_email,student_phone,admission_details,location,course_selected)values('raj','verma','vraj45@gmail.com','8966197908','2026-03-05 1:41:00','gwalior',2);
insert into students(student_fname,student_lname,student_email,student_phone,admission_details,location,course_selected)values('rahul','verma','vrahul55@gmail.com','8902197978','2026-03-05 1:41:00','delhi',3);

#now the join:
select student_fname, student_lname, course_name from students join courses on students.course_selected=courses.course_id; --(would output firstname, lastname and course opted)
#using order_by and limit to display result:
select student_fname, student_lname, course_name from students join courses on students.course_selected=courses.course_id ORDER BY student_fname LIMIT 0,2;--(would output, nikhil and rahul only)
