/* 
Alex Childers
CS 325 - Homework 6 - Problem 2
Last modified: 10/09/2018   
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

select	client_lname, client_fname
from 	client
where 	client_num in 
	(select	client_num
	 from rental
	 where vid_id = '130012');

prompt Problem 2-4

select	

prompt Problem 2-5

prompt Problem 2-6

prompt Problem 2-7

prompt Problem 2-8

prompt Problem 2-9

spool off
