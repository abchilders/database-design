/*
Alex Childers
CS 325 - Homework 4 - Problem 4
Last modified 09/22/2018
*/

spool 325hw4-4-out.txt

prompt PART A:
prompt Pure relational projection of client last names from Client table. 

select 	distinct Cli_lname
from 	Client; 

prompt PART B:
prompt Pure relational projection of the video format and video rental price 
prompt columns from the Video table. 

select 	distinct Vid_format, Vid_rental_price
from 	Video;

prompt PART C:
prompt Relational selection of the rows of the Video table for videos
prompt with a length of more than 75 minutes.

select 	*
from 	Video
where 	Vid_length > 75; 

prompt PART D:
prompt Relational selection of rows of the Rental table for rentals
prompt involving the video with ID '00000D'. 

select 	*
from 	Rental 
where 	Vid_id = '00000D'; 

prompt PART E:
prompt Cartesian product of the Video and Rental tables.
select 	*
from 	Video, Rental; 

prompt PART F:
prompt Equi-join of the Video and Rental tables. 

select 	*
from 	Video join Rental
	on Video.Vid_id = Rental.Vid_id; 

prompt PART G:
prompt Equi-join of Client and Rental tables.

select	*
from 	Client join Rental
	on Client.Cli_id = Rental.Cli_id;

spool off 
