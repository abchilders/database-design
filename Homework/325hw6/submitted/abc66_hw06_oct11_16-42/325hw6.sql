/* 
Alex Childers
CS 325 - Homework 6 - Problem 2
Last modified: 10/11/2018   
*/

spool 	325hw6-out.txt

prompt 	=======================
prompt 	Homework 6 Problem 2
prompt	=======================
prompt
prompt	Alex Childers
prompt

prompt	===== Problem 2-1 =====

select	avg(vid_rental_price)
from 	video; 

prompt 	===== Problem 2-2 =====

select	vid_id
from 	video
where	vid_rental_price > 
	(select avg(vid_rental_price)
	 from	video);

prompt	===== Problem 2-3 =====

select	client_fname, client_lname
from 	client
where 	client_num in 
	(select	client_num
	 from rental
	 where vid_id = '130012');

prompt 	===== Problem 2-4 =====

select	movie_title, movie_rating
from	movie
where	movie_director_lname = '&dir_lname';

prompt 	===== Problem 2-5 =====

select 	movie_title, movie_yr_released
from 	movie
where	category_code = 
	(select	category_code
	 from 	movie_category
	 where 	category_name = '&category'); 

prompt 	===== Problem 2-6 =====

select	movie_rating || ': ' || movie_title "Movies with Ratings"
from 	movie; 

prompt 	===== Problem 2-7 =====

select 	movie_title || ' (' || movie_yr_released || ')' "Movies"
from 	movie; 

prompt 	===== Problem 2-8 =====

select 	client_lname, client_phone
from 	client
where	exists
	(select 'a'
	 from	rental
	 where	rental.client_num = client.client_num
		and date_returned is null);

prompt 	===== Problem 2-9 =====

select	movie_title
from	movie
where	not exists
	(select 'a'
	 from 	video
	 where	video.movie_num = movie.movie_num
		and vid_format = 'HD-DVD'); 

spool off
