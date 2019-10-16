spool 325lab13-results.txt 

prompt Muranda Kozlowicz
prompt Alex Childers

prompt Lab Problem 1

select	dept_name, salary
from 	dept join empl
	on dept.dept_num = empl.dept_num
order by dept_name; 

prompt Lab Problem 2

col dept_name heading "Department Name" format a20
/ 

prompt Lab Problem 3

col salary heading Get|Paid format $999999999
/

prompt Lab Problem 4

break on dept_name skip 1
/

prompt Lab Problem 5

compute avg of salary on dept_name
/

prompt Lab Problem 6

ttitle 'TTitle of|Your Choice'
set pagesize 50
set feedback off 
/

prompt Lab Problem 7

clear breaks columns computes
ttitle off
set pagesize 14
set feedback 6

spool off
