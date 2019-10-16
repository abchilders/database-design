/*
Alex Childers
CS 325 - Homework 8 - Problem 3
Last modified: 11/03/2018
*/

-- Run movies-pop.sql, without printing output to terminal. 
set termout off
@ movies-pop
set termout on

spool 325hw8-out.txt

prompt =======================
prompt Homework 8 Problem 3
prompt =======================
prompt
prompt Alex Childers
prompt

prompt ************
prompt problem 3-2

(select movie_num
 from 	movie
 where 	movie_rating = 'G')
intersect
(select movie_num
 from 	video
 where 	vid_format = 'DVD'); 

prompt ************
prompt problem 3-3

(select movie_title
 from 	movie
 where 	movie_rating = 'G')
intersect
(select movie_title
 from 	movie join video
		on movie.movie_num = video.movie_num 
 where 	vid_format = 'DVD'); 

prompt ************
prompt problem 3-4

(select movie_title
 from 	movie join video
 		on movie.movie_num = video.movie_num)
minus
(select movie_title
 from 	movie join video 
		on movie.movie_num = video.movie_num   
      	join rental
		on video.vid_id = rental.vid_id);
 
prompt ************
prompt problem 3-5

(select vid_id, vid_rental_price
 from 	video 
 where 	vid_format = 'HD-DVD')
union
(select vid_id, vid_rental_price
 from 	video
 where 	not exists
	(select 'a'
	 from 	rental
	 where 	rental.vid_id = video.vid_id)
)
order by vid_rental_price desc; 

prompt ************
prompt problem 3-6

(select client_num
 from 	client
 where 	client_credit_rtg > 3)
minus
(select c.client_num
 from 	client c join rental r
		on c.client_num = r.client_num
 where 	date_returned is null); 

prompt ************
prompt problem 3-7

(select v.vid_id, count(*) NUM_RENTALS	
 from 	video v  join rental r
		on v.vid_id = r.vid_id
 group by v.vid_id)
union
(select vid_id, 0
 from 	video
 where 	not exists
	(select 'a'
	 from 	rental
	 where 	rental.vid_id = video.vid_id)
)
order by NUM_RENTALS desc, vid_id;   

prompt ************
prompt problem 3-8

select 	vid_id, vid_rental_price
from 	video
where 	vid_format != 'DVD';

update 	video
set 	vid_rental_price = 0.75 * vid_rental_price
where 	vid_format != 'DVD'; 

select 	vid_id, vid_rental_price
from 	video
where 	vid_format != 'DVD';

prompt ************
prompt problem 3-9

select 	client_lname, client_credit_rtg
from 	client
order by client_credit_rtg; 

update 	client
set 	client_credit_rtg = client_credit_rtg * 1.15
where 	client_credit_rtg < 4.0
	and client_credit_rtg >
		(select avg(client_credit_rtg)
		 from 	client);  

select 	client_lname, client_credit_rtg
from 	client
order by client_credit_rtg;


prompt ************
prompt problem 3-10

select 	rental_num, client_fname || ' ' || client_lname CLIENT, vid_id,
	date_out
from 	rental r join client c
	on r.client_num = c.client_num
order by client_lname, client_fname, rental_num; 

delete 	from rental
where 	client_num in
	(select client_num
	 from 	client
	 where 	client_lname = 'Carlos'
		and client_fname = 'Ann'); 

select 	rental_num, client_fname || ' ' || client_lname CLIENT, vid_id,
        date_out
from 	rental r join client c
        on r.client_num = c.client_num
order by client_lname, client_fname, rental_num;

prompt ************
prompt problem 3-11

select 	count(*) "current # videos"
from 	video; 

delete 	from video
where 	vid_id in
	((select vid_id
	  from 	video)
	 minus
	 (select vid_id
	  from 	rental)); 

select 	*
from 	video
order by vid_id; 

spool off
