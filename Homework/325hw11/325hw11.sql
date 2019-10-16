/* Alex Childers
   CS 325 - Homework 11 - Problem 2
   Last modified: December 4, 2018
*/

spool 325hw11-out.txt

prompt =======================
prompt Homework 11 Problem 2
prompt =======================
prompt
prompt Alex Childers
prompt

prompt ************
prompt problem 2-1

drop view rentals_by_day; 

create view rentals_by_day as
select 	rental_num, client_num, vid_id, to_char(date_out, 'Day') day_out, 
	to_char(date_due, 'Day') day_due, 
	to_char(date_returned, 'Day') day_returned
from rental;

select *
from rentals_by_day; 

prompt ************
prompt problem 2-2

column day_out format a9
column day_due format a9
column day_returned format a9

/

prompt ************
prompt problem 2-3

select 		day_out, count(*) NUM_RENTALS
from 		rentals_by_day
group by	day_out
order by 	NUM_RENTALS desc; 

prompt ************
prompt problem 2-4

select 		to_char(vid_purchase_date, 'Mon YYYY') PURCHASE_DATE, movie_title,
		vid_format FORMAT
from		video v join movie m
			on v.movie_num = m.movie_num
order by 	vid_purchase_date, movie_title, FORMAT; 

prompt ************
prompt problem 2-5

select 		client_lname || ', ' || client_fname CLIENT, 
		to_char(min(date_out), 'Month DD, YYYY') FIRST_RENTAL
from 		rental r join client c
			on r.client_num = c.client_num
group by	client_lname, client_fname
order by 	client_lname, client_fname; 

spool off

clear columns breaks computes
