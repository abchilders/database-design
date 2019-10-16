/* Alex Childers
   CS 325 - Fall 2018
   Last modified: December 7, 2018
*/

spool 325report3-results.txt

/* The purpose of this report is to neatly display the names, job titles,
   salaries, start dates, and number of years that employees have worked 
   at Loving Care Pet Boarding (as of the time of running this script). 
   This is so the owner of LCPB can assess employee retention and salaries.

   Conveniently, it is also a handy guide as to when employees' 
   "anniversaries of working here" are- the owner will give an employee a card
   and a little gift to employees on their start date anniversary.
*/

set feedback off
set pagesize 50

ttitle 'Employee Retention and Status'

column name heading 'Name' format a17
column position heading 'Position' format a23
column salary heading 'Monthly Pay' format $99999.99
column first_day heading 'Start Date' format a19

break on position skip 1
compute avg label 'Average salary: ' of salary on position

select          rpad(job_title, 23, '.') position, salary, first_name || ' ' || 
		last_name name, to_char(start_date, 'Month DD, YYYY') 
		first_day
from            employee e
                join worker w on e.worker_id = w.worker_id
order by        position, start_date;

spool off

-- reset default settings
set feedback 6
set pagesize 14
ttitle off
clear breaks columns computes
