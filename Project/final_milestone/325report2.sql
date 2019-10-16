/* Alex Childers 
   CS 325 - Fall 2018
   Last modified: December 7, 2018
*/ 

spool 325report2-results.txt

/* The purpose of this report is to show the names of pets who got their last 
   vaccine three or more years ago and are enrolled for boarding in January of 
   2019.  This is particularly helpful for people who are repeat clients of 
   LCPB, who have already made previous enrollments but their pet's vaccines 
   have lapsed since their last enrollment. 

   See business rules - pets must have received their last vaccines less
   than three years ago. 
*/

set feedback off
set pagesize 50

ttitle 'Expired Vaccinations|for pets enrolled in boarding|January 2019'

column boarding_cat heading 'Section' format a21
column pet_name heading 'Pet Name' format a9
column vaccine_name heading 'Vaccine' format a10
column date_recvd heading 'Last Vaccinated' format a16 
column arrival heading 'Will arrive:' format a13

break on boarding_cat skip 1 on pet_name on start_date

select distinct rpad(boarding_category, 21, '.') boarding_cat, pet_name, 
		to_char(start_date, 'Mon DD') arrival, vaccine_name, 
		to_char(date_received, 'Mon DD, YYYY') date_recvd
from            boarding b
                join boarding_enrollment be on b.section_id = be.section_id
                join pet p on be.pet_id = p.pet_id
                join pet_vaccine_received pvr on p.pet_id = pvr.pet_id
where           date_received <= start_date - (365 * 3)
                and start_date between '01-JAN-2019' and '31-JAN-2019'
order by        boarding_cat, arrival, pet_name;

-- reset default settings
set feedback 6
set pagesize 14
ttitle off
clear breaks columns computes

spool off
