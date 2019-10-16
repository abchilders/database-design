/* Alex Childers
   CS 325 - Fall 2018
   Last modified: December 7, 2018
*/

/*
Requirements to satisfy: 
- one compound where condition with at least a couple of sub-conditions
	other than join conditions
- make sure that enough example data is included so that these queries' 
	results are a meaningful demonstration (may have to add additional
	rows)
*/

spool 325query-results.txt


prompt =======================================================================
prompt Query 1:
prompt Shows who is enrolled in at least one of the four Dog Obedience Training 
prompt classes.
prompt =======================================================================

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
prompt Shows a daycare roster: the name and phone number  for owners of dogs 
prompt who are enrolled in daycare on December 13, 2018, as well as when the 
prompt dogs will be picked up that day. 
prompt =======================================================================

select 	daycare_category, pet_name, first_name || ' ' || last_name owner_name, 
	phone_number, end_time
from 	daycare_enrollment de
	join pet p on de.pet_id = p.pet_id
	join doggy_daycare d on de.section_id = d.section_id
	join owner o on p.owner_id = o.owner_id
	join owner_phone_num opn on o.owner_id = opn.owner_id 
where	date_of_daycare = '13-DEC-2018';


prompt =======================================================================
prompt Query 3:
prompt Shows a list of medications needed for pets who are currently signed 
prompt up for boarding. 
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

(select ce.section_id, class_name, first_name || ' ' || last_name owner_name,
        pet_name, 
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
prompt Shows a list of what workers (both employees and volunteer) both 
prompt specialize in providing Boarding services and are qualified to handle
prompt cats. 
prompt =======================================================================

select 	first_name || ' ' || last_name, w.worker_id, worker_type
from 	worker w left outer join volunteer_handling_permissions vhp
		on w.worker_id = vhp.worker_id
where	worker_type = 'employee'
	or 
	(worker_type = 'volunteer' and pet_may_handle = 'cat'); 


prompt =======================================================================
prompt Query 7: For pets that are enrolled in Boarding in January, this shows
prompt the pet's name and any vaccines they received three or more years ago
prompt (i.e. they need to get new vaccinations before coming to their boarding
prompt session). 
prompt =======================================================================

select 	boarding_category, pet_name, vaccine_name, date_received
from 	
