-- Xavier Damas, Alex Childers, Elizabeth Pineda
-- 10.05.2018

spool 325lab7-results.txt

prompt Xavier Damas, Alex Childers, Elizabeth Pineda

prompt ***
prompt Lab Query 1
prompt ***


select 	empl_last_name, hiredate
from 	empl
where 	job_title = 'Manager'
	and 	salary = (select min(salary)
		from empl
		where job_title = 'Manager');

prompt ***
prompt Lab Query 2
prompt ***

select hiredate
from empl
where empl.dept_num in (select dept.dept_num
			from dept
			where dept_loc = 'New York');

prompt ***
prompt Lab Query 3
prompt ***

select 	empl_last_name, hiredate
from 	empl
where 	hiredate > 
	(select max(hiredate)
	from empl
	where job_title = 'Manager');

prompt ***
prompt Lab Query 4
prompt ***

select empl_last_name || ' - $' || salary "Employee Salaries"
from empl;

prompt ***
prompt Lab Query 5
prompt ***

select dept_name
from dept
where exists
	(select 'a'
	 from empl
	 where salary >= 3000
	 and empl.dept_num = dept.dept_num);


prompt ***
prompt Lab Query 6
prompt ***

select empl_last_name
from empl
where 	job_title = 'Sales'
	and not exists
	(select 'a'
	from customer
	where customer.empl_rep = empl.empl_num); 


spool off
