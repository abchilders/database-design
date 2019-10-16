/* Alex Childers
   CS 325 - Fall 2018
   Last modified: December 7, 2018
*/

spool 325report1-results.txt

/* The purpose of this report is to provide a roster for all doggy daycare
   sessions occuring on a particular day - in this example, it's for 
   December 13, 2018. This report will include information on the pets that
   are enrolled and how long the pets will be in daycare that day, as well
   as emergency contact information for owners. This report would be used
   by employees who are overseeing daycare sessions that day.
*/

set feedback off
set linesize 94
set pagesize 50

ttitle 'Doggy Daycare Roster|for December 13, 2018'

column daycare_section heading 'Section' format a21
column pet_name heading 'Pet Name' format a9
column arrival heading 'Start Time' format a10
column depart heading 'End Time' format a8
column owner heading 'Owner' format a18
column phone heading 'Phone' format a13

break on daycare_section skip 1 on pet_name on arrival on depart on owner

select 		rpad(daycare_category, 21, '.') daycare_section, pet_name, 
		substr(lpad(to_char(start_time), 4, '0'), 1, 2)
			|| ':' || 
			substr(lpad(to_char(start_time), 4, '0'), 3) arrival, 
		substr(lpad(to_char(end_time), 4, '0'), 1, 2)
			|| ':' ||
			substr(lpad(to_char(end_time), 4, '0'), 3) depart, 
		first_name || ' ' || last_name owner, 
		substr(to_char(phone_number), 1, 3) || '-' ||
			substr(to_char(phone_number), 4, 3) || '-' ||
			substr(to_char(phone_number), 7, 4) phone
from    	daycare_enrollment de
        	join pet p on de.pet_id = p.pet_id
        	join doggy_daycare d on de.section_id = d.section_id
        	join owner o on p.owner_id = o.owner_id
        	join owner_phone_num opn on o.owner_id = opn.owner_id
where   	date_of_daycare = '13-DEC-2018'
order by 	daycare_category, pet_name, start_time, end_time; 


spool off

-- reset default settings
set feedback 6
set linesize 80
set pagesize 14
ttitle off
clear breaks columns computes
