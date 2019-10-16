/* Elizabeth Pineda
   Alex Childers
   November 30, 2018
*/

spool 325lab14-results.txt

prompt Elizabeth Pineda
prompt Alex Childers
prompt

prompt Lab Problem 1

select empl_last_name, to_char(hiredate, 'Day')
from empl; 

prompt Lab Problem 2

select empl_last_name, substr(upper(empl_last_name), 1, 4) abbr
from empl; 

prompt Lab Problem 3

select empl_last_name, hiredate, add_months(hiredate, 6) ELIG_DATE
from empl; 

prompt Lab Problem 4

select length(empl_last_name), lower(to_char(next_day(hiredate, 'Thursday')))
from empl; 

spool off
