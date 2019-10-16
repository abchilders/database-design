/*
Alex Childers
CS 325 - Homework 5 - Problem 2
Last modified: 09/27/2018
*/

spool 325hw5-out.txt

prompt ====================
prompt Homework 5 Problem 2
prompt ====================
prompt
prompt Alex Childers
prompt

prompt =====  Problem 2-1 =====
-- Perform a relational selection of rows of the "client" table for clients with 
-- a client credit rating less than 3.4.

select *
from client
where client_credit_rtg < 3.4; 

prompt ===== Problem 2-2 =====
-- Perform a "pure"/"true" relational projection of the movie rating and year 
-- released columns from the "movie" table. 

select distinct movie_rating, movie_yr_released
from movie; 

prompt ===== Problem 2-3 =====
-- Perform an equi-join of the "client" and "movie_category" tables.

select *
from client join movie_category
	on client_fave_cat = category_code; 

prompt ===== Problem 2-4 =====
-- Project just the video IDs and their date due for rentals that have
-- not yet been returned.

select vid_id, date_due
from rental
where date_returned is null;  

prompt ===== Problem 2-5 =====
-- Project just the video IDs, formats, and rental prices for videos that 
-- do *not* have the format Blu-Ray. 

select vid_id, vid_format, vid_rental_price
from video
where vid_format != 'Blu-Ray'; 

prompt ===== Problem 2-6 =====
-- Project just the movie category NAME (*not* code), client's last name,
-- and client's credit rating from the equi-join of the "movie_category"
-- and "client" tables. 

select category_name, client_lname, client_credit_rtg
from movie_category join client
	on  category_code = client_fave_cat; 

prompt ===== Problem 2-7 =====
-- Perform a relational selection of videos with a purchase date between
-- July 15, 2008 and December 1, 2011, inclusive.

select *
from video
where vid_purchase_date between '15-JUL-2008' and '1-DEC-2011'; 

prompt ===== Problem 2-8 =====
-- Perform a relational selection of videos which have a rental price
-- greater than or equal to $3.99 and have a purchase date on or after
-- January 1, 2011. 

select *
from video
where vid_rental_price >= 3.99 and vid_purchase_date >= '1-JAN-2011'; 

prompt ===== Problem 2-9 =====
-- Project only the movie title and the movie rating for all movies 
-- containing the string 'the' anywhere in their title. 

select movie_title, movie_rating
from movie
where movie_title like '%the%'; 

prompt ===== Problem 2-10 =====
-- Project only the video ID, format, and what the rental price would
-- be if it were decreased by 15%, for videos whose format is not 
-- Blu-Ray. 

select vid_id, vid_format, vid_rental_price*0.85 PRICE_IF_REDUCED
from video
where vid_format != 'Blu-Ray'; 

prompt ===== Problem 2-11 =====
-- Project only the movie title and movie rating for all movies with
-- ratings of PG 13 or R or A only. 

select movie_title, movie_rating
from movie
where movie_rating in('PG-13', 'R', 'A'); 

prompt ===== Problem 2-12 =====
-- Project the current total number of videos and the average rental
-- price for a video. 

select count(*) "Num Videos", avg(vid_rental_price)
from video;

spool off
