-- Muranda Kozlowicz, Alex Childers
-- October 19, 2018

spool 325lab9-results.txt

prompt Muranda Kozlowicz, Alex Childers

prompt lab query 1

select* 
from dept
order by dept_loc;


prompt lab query 2

select* 
from dept
order by dept_name;

prompt Lab query 3

select empl_last_name, dept_name, salary, hiredate
from empl e, dept d 
where e.dept_num = d.dept_num
order by dept_name, hiredate;

prompt Lab query 4

select empl_last_name, dept_name, salary, hiredate
from empl e, dept d  
where e.dept_num = d.dept_num
order by salary desc, hiredate;

prompt Lab query 5

select mgr, min(hiredate)
from empl
group by mgr;

prompt Lab query 6

select mgr, min(hiredate)
from empl
group by mgr
having min(hiredate) < '01-may-1991';



spool off
