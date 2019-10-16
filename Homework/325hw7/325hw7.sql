/*
Alex Childers	
CS 325 - Homework 7 - Problem 3
Last modified 10/27/2018
*/

spool 325hw7-out.txt

prompt
prompt =======================
prompt Homework 7 Problem 3
prompt =======================
prompt
prompt Alex Childers
prompt

prompt ===== Problem 3-1 =====
prompt ============
prompt 3-1 query 1:

select *
from client
order by client_credit_rtg; 

prompt ============
prompt 3-1 query 2:

select *
from client
order by client_credit_rtg desc; 

prompt ===== Problem 3-2 =====

select movie_rating || ': ' || movie_title "Movies with Ratings"
from movie
order by movie_rating, movie_title;

prompt ===== Problem 3-3 =====

select category_name, movie_title, movie_rating
from movie join movie_category
	on movie.category_code = movie_category.category_code
order by movie_rating, category_name desc, movie_title;

prompt ===== Problem 3-4 =====

select client_lname, client_phone, client_credit_rtg
from client
where client_credit_rtg >=
	(select avg(client_credit_rtg)
	 from client)
order by client_credit_rtg desc; 

prompt ===== Problem 3-5 =====

select vid_format, count(*) QTY, avg(vid_rental_price) "AVG RENTAL PRICE"
from video
group by vid_format; 

prompt ===== Problem 3-6 =====

select vid_format, count(*) QTY, avg(vid_rental_price) "AVG RENTAL PRICE"
from video
group by vid_format
order by QTY; 

prompt ===== Problem 3-7 =====

select vid_rental_price, count(*) "# VIDS"
from video
group by vid_rental_price
order by vid_rental_price desc; 

prompt ===== Problem 3-8 =====

select vid_rental_price, count(*) "# VIDS"
from video
group by vid_rental_price
having count(*) >= 5
order by vid_rental_price desc; 

prompt ===== Problem 3-9 =====

select category_name, count(*) "# MOVIES"
from movie join movie_category
	on movie.category_code = movie_category.category_code
group by category_name
order by "# MOVIES" desc; 

prompt ===== Problem 3-10 =====

select avg(count(*)) "AVG # PER PRICE"
from video
group by vid_rental_price; 

spool off
