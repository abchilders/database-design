/* 
Alex Childers
CS 325 - Homework 6 - Problem 2
Last modified: 10/11/2018   
*/

spool 	325hw6-out.txt

prompt 	Homework 6 Problem 2
prompt	Alex Childers

prompt	Problem 2-1

select	avg(vid_rental_price)
from 	video; 

prompt 	Problem 2-2

select	vid_id
from 	video
where	vid_rental_price > 
	(select avg(vid_rental_price)
	 from	video);

prompt	Problem 2-3

select	client_fname, client_lname
from 	client
where 	client_num in 
	(select	client_num
	 from rental
	 where vid_id = '130012');

prompt 	Problem 2-4

select	movie_title, movie_rating
from	movie
where	movie_director_lname = '&which_director';

prompt 	Problem 2-5

select 	movie_title, movie_yr_released
from 	movie
where	category_code = 
	(select	category_code
	 from 	movie_category
	 where 	category_name = '&which_category_name'); 

prompt 	Problem 2-6

select	movie_rating || ': ' || movie_title "Movies with Ratings"
from movie; 

prompt 	Problem 2-7

select movie_title || ' (' || movie_yr_released || ')' "Movies"
from movie; 

prompt 	Problem 2-8

prompt 	Problem 2-9

spool off
