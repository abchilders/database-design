/* Alex Childers
   CS 325 - Homework 10 - Problem 5
   Last modified: November 30, 2018
*/

@ movies-pop

spool 325hw10-out.txt

prompt =======================
prompt Homework 10 Problem 5
prompt =======================
prompt 
prompt Alex Childers
prompt
prompt ************
prompt problem 5-2

/* Project, for each rental, the renting client's last name, and the rented 
   video's format, displaying the results in order of client's last name, and  
   in secondary order by rented video's format. 
*/

select 	client_lname, vid_format
from 	client c
		join rental r on c.client_num = r.client_num
		join video v on r.vid_id = v.vid_id
order by client_lname, vid_format; 

prompt ************
prompt problem 5-3

/* Write a query that will project, *just for not-yet-returned rentals,* the 
   renting client's last name, the rented video's movie title, and the date due
   for that rental, displaying the results in order of rental date due, and in 
   secondary order by client last name. 
*/

select 		client_lname, movie_title, date_due
from 		client c
			join rental r on c.client_num = r.client_num
			join video v on r.vid_id = v.vid_id
			join movie m on v.movie_num = m.movie_num
where 		date_returned is null
order by	date_due, client_lname; 

prompt ************
prompt problem 5-4

/* Include SQL*Plus statements for each of the following within your script:
   * Explicitly clear any previously-set column headings, breaks, and computes.
   * Create a *top title* and a *bottom title* (title contents of your choice).
   * Make the pagesize 35 lines and the linesize 75 characters.
   * Turn feedback off. 
*/

clear 		columns
clear 		breaks
clear 		computes

ttitle  	'Top Title'
btitle		'Bottom Title' 

set pagesize 	35
set linesize	75

set feedback off

prompt ************
prompt problem 5-5

/* I've stopped including problem descriptions here because they've gotten 
   pretty long. See Homework 10 handout for full problem descriptions.
*/ 

drop view rental_history; 

create view rental_history(client_name, movie_title, vid_format, 
			   vid_rental_price) as
select 	client_lname || ', ' || client_fname, movie_title, vid_format, 
	vid_rental_price
from 	client c
		join rental r on c.client_num = r.client_num
		join video v on r.vid_id = v.vid_id
		join movie m on v.movie_num = m.movie_num;

select *
from rental_history
order by vid_rental_price desc, client_name, movie_title; 

prompt ************
prompt problem 5-6

column client_name heading Client format a13
column movie_title heading 'Movie Title' format a36
column vid_format heading Format format a7
column vid_rental_price heading 'Rental Price' format $9.99

/

prompt ************
prompt problem 5-7

drop view category_stats; 

create view category_stats as 
select 		category_name, count(*) num_videos, avg(vid_rental_price)
		avg_rental_price
from		video v
			join movie m on v.movie_num = m.movie_num
			join movie_category mc 
				on m.category_code = mc.category_code
group by	category_name;

select 		*
from 		category_stats
order by 	num_videos desc, avg_rental_price desc; 

prompt ************
prompt problem 5-8

set pagesize 20

column category_name heading Category
column num_videos heading '# Videos' format 99999999
column avg_rental_price heading 'Avg Price' format $99999.99

/

prompt ************
prompt problem 5-9

commit; 

prompt ===================
prompt 5-9 part a 

update 	video
set	vid_rental_price = vid_rental_price - 0.75
where	vid_format = 'Blu-Ray'; 

select          *
from            category_stats
order by        num_videos desc, avg_rental_price desc;

prompt ===================
prompt 5-9 part b

select 		distinct client_name
from		rental_history
where		movie_title = 'Gone with the Wind'
order by	client_name; 

prompt ===================
prompt 5-9 part c

delete 	from rental
where 	client_num = '5555'; 

select distinct client_name
from            rental_history
where           movie_title = 'Gone with the Wind'
order by        client_name;

prompt ===================
prompt 5-9 part d

select 		client_name, count(*)
from		rental_history
group by 	client_name
order by 	count(*) desc, client_name; 

rollback; 

prompt ************
prompt problem 5-10

set pagesize 45
break on movie_title skip 1

select distinct movie_title, client_name
from 		rental_history
order by 	movie_title, client_name; 

prompt ************
prompt problem 5-11

set pagesize 60
compute count of client_name on movie_title

/

prompt ************
prompt problem 5-12

set pagesize 45
break on client_name skip 1

select 		*
from 		rental_history
order by	client_name, movie_title; 

prompt ************
prompt problem 5-13

set pagesize 60
compute avg of vid_rental_price on client_name 

/

prompt ************
prompt problem 5-14

spool off 

/* I know I could call cleanup.sql, but I'm typing it by hand just this once, 
   so that I have the experience of typing in the commands and knowing what 
   exactly cleanup.sql does. The following lines are from cleanup.sql, credit 
   to T. Koyuncu. 
*/ 

-- The mandatory stuff:

clear columns 
clear breaks
clear computes

set feedback	6
set pagesize	14
set linesize	80

ttitle off
btitle off

-- The bonus stuff from cleanup.sql:
set space	1
set newpage	1
set heading	on
