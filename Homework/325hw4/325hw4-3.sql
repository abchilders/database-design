/*
Alex Childers
CS 325 - Homework 4 - Problem 3
Last modified: 09/22/2018
*/

spool 325hw4-3-out.txt

prompt Rewriting:
prompt "select * from empl where salary between 1500 and 2500;":

select 	*
from 	empl
where 	salary between 1500 and 2500; 

prompt Rewriting:
prompt "select job title,
prompt salary from
prompt empl where job_title = 'Clerk' and salary > 1200;"

select 	job_title, salary
from 	empl
where 	job_title = 'Clerk' and salary > 1200; 

prompt Rewriting:
prompt "select empl_last_name, job_title, salary from empl,
prompt dept where empl.dept_num = dept.dep_num and dept_loc in ('Dallas',
prompt 'Chicago'); 

select 	empl_last_name, job_title, salary 
from 	empl, dept
where 	empl.dept_num = dept.dept_num and dept_loc in ('Dallas', 'Chicago');  

spool off
