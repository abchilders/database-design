/* Alex Childers
   CS 325 - Fall 2018
   Last modified: December 7, 2018
*/

spool 325query-results.txt

prompt ========================================================================
prompt Query 1:
prompt Shows who is enrolled in at least one of the four Dog Obedience Training 
prompt classes.
prompt ========================================================================

select 	class_name, o.owner_id, first_name || ' ' || last_name owner_name, 
	pet_name, date_enrolled
from 	class_enrollment ce
	join owner o on ce.owner_id = o.owner_id
	join pet p on ce.pet_id = p.pet_id
	join class c on ce.section_id = c.section_id
where	ce.section_id in 
	(select section_id
	 from 	class
	 where 	class_name like 'Dog Obedience Training%') 
order by class_name; 


prompt =======================================================================
prompt Query 2:
prompt Shows a daycare roster: the name and phone number for owners of dogs 
prompt who are enrolled in daycare on December 13, 2018, as well as when the 
prompt dogs will be picked up that day (in 24-hour time).
prompt =======================================================================

select 		daycare_category, pet_name, first_name || ' ' || last_name 
		owner_name, phone_number, end_time
from 		daycare_enrollment de
		join pet p on de.pet_id = p.pet_id
		join doggy_daycare d on de.section_id = d.section_id
		join owner o on p.owner_id = o.owner_id
		join owner_phone_num opn on o.owner_id = opn.owner_id 
where		date_of_daycare = '13-DEC-2018'
order by	daycare_category, pet_name; 


prompt =======================================================================
prompt Query 3:
prompt Shows a list of pets who are currently signed up for boarding and need
prompt medication while they're at Loving Care Pet Boarding (LCPB).  
prompt =======================================================================

select 	pet_name, medication_name, dosage, start_date
from 	pet p 
	join pet_medication_needed pmn on p.pet_id = pmn.pet_id
	join boarding_enrollment be on p.pet_id = be.pet_id
order by start_date; 


prompt =======================================================================
prompt Query 4:
prompt Shows the owner name and enrollment information on each enrollment 
prompt that has not been paid yet. 
prompt =======================================================================

/* Remember, when date_enrolled is null, it means that the owner has not paid
   for their enrollment yet.
*/

(select ce.section_id, class_name section, first_name || ' ' || last_name 
	owner_name, pet_name, 
	(select min(date_of_occurrence)
	 from class_session_date csd
		join class c on csd.section_id = c.section_id) as start_date
 from   class_enrollment ce
        join owner o on ce.owner_id = o.owner_id
	left outer join pet p on ce.pet_id = p.pet_id
        join class c on ce.section_id = c.section_id
 where  date_enrolled is null)
union
(select be.section_id, boarding_category, first_name || ' ' || last_name 
	owner_name, pet_name, start_date
 from	boarding_enrollment be
	join pet p on be.pet_id = p.pet_id
	join owner o on p.owner_id = o.owner_id
	join boarding b on be.section_id = b.section_id
 where 	date_enrolled is null)
union
(select de.section_id, daycare_category, first_name || ' ' || last_name
	owner_name, pet_name, date_of_daycare
 from 	daycare_enrollment de
	join pet p on de.pet_id = p.pet_id
	join owner o on p.owner_id = o.owner_id
	join doggy_daycare dd on de.section_id = dd.section_id
 where	date_enrolled is null); 
	

prompt =======================================================================
prompt Query 5:
prompt Shows a count of how many pets are enrolled in each section of 
prompt daycare throughout the week of December 9, 2018 - December 15, 2018, 
prompt as well as relevant enrollment information.
prompt =======================================================================

select 		date_of_daycare, daycare_category, count(*) enrollments, 
		min(start_time) earliest_dog_arrival, 
		max(end_time) latest_dog_departure
from 		daycare_enrollment de
			join doggy_daycare dd 
			on de.section_id = dd.section_id
where		date_of_daycare between '09-DEC-2018' and '15-DEC-2018'
group by 	date_of_daycare, daycare_category
order by 	date_of_daycare, daycare_category; 


prompt =======================================================================
prompt Query 6:
prompt Shows a count of how many pets will start their boarding session in 
prompt each section of boarding throughout the week of January 27, 2019 - 
prompt February 2, 2019, as well as relevant enrollment information.
prompt (That is, how many pets are we expecting to arrive this week?)
prompt Could be used in conjunction with a table of departures to figure out 
prompt how many pets are leaving this week as well. 
prompt =======================================================================

select		start_date, boarding_category, count(*) arrivals
from 		boarding_enrollment be 
		join boarding b on be.section_id = b.section_id
where		start_date between '27-JAN-2019' and '02-FEB-2019'
group by 	boarding_category, start_date
order by 	start_date, boarding_category;  


prompt =======================================================================
prompt Query 7:
prompt Shows a list of what workers (both employees and volunteer) both 
prompt specialize in providing Boarding services and are qualified to handle
prompt cats. 
prompt =======================================================================

select distinct first_name || ' ' || last_name name, w.worker_id, worker_type
from 		worker w 
		left outer join volunteer_handling_permissions vhp
			on w.worker_id = vhp.worker_id
		join worker_providing_service wps 
			on w.worker_id = wps.worker_id
where		(worker_type = 'employee'
			or 
			(worker_type = 'volunteer' and pet_may_handle = 'cat'))
	 	and service_sect_id like 'B%'
order by 	w.worker_id; 


prompt =======================================================================
prompt Query 8: For pets that are enrolled in Boarding in January 2019, this 
prompt shows the names of pets who got their last vaccine three or more years 
prompt ago. This might be for the purpose of reminding owners to re-vaccinate 
prompt before they can board again. 
prompt =======================================================================

-- In the where clause: the start_date/end_date condition is to make sure that
-- we select boarding enrollments in which the pet will be in boarding during
-- January 2019. 
	
select distinct	boarding_category, pet_name, vaccine_name, date_received, start_date, 
		end_date
from 		boarding b 
		join boarding_enrollment be on b.section_id = be.section_id
		join pet p on be.pet_id = p.pet_id
		join pet_vaccine_received pvr on p.pet_id = pvr.pet_id
where 		date_received <= start_date - (365 * 3)
		and start_date <= '31-JAN-2019'
		and end_date >= '01-JAN-2019'
order by 	boarding_category, pet_name, date_received; 


prompt =======================================================================
prompt Query 9: Shows the names, job titles, start dates, and amount of time
prompt that employees have worked at Loving Care Pet Boarding (as of the time 
prompt of running this script). This is so that the owner of LCPB can send 
prompt thanks and a gift to employees on their start date. 
prompt =======================================================================

select 		first_name || ' ' || last_name name, job_title, start_date, 
		sysdate-start_date days_worked
from 		employee e 
		join worker w on e.worker_id = w.worker_id
order by 	start_date; 
