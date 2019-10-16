/* Alex Childers
   CS 325 - Homework 3 - Problem 4
   Last modified: 09/11/2018
*/ 

-- Reset tables back to their initial population each time this SQL script is run. 

start 325hw3-3b

-- Spool the rest of the results for this script's actions into 325hw3-out.txt

spool 325hw3-out.txt

prompt Alex Childers 
prompt

prompt
prompt Problem 4 Part a
prompt

-- Try to insert a row into Client to create a client without a cli_phone.  
prompt SHOULD FAIL; client needs phone
insert into Client (cli_id, cli_lname)
values
('666H', 'Smith'); 

prompt
prompt Problem 4 Part b 
prompt 

-- Create a client with only a cli_id of '666E', a custom last name, and a custom phone
-- 	number. 
prompt SHOULD SUCCEED; first name NOT reqired
insert into Client (cli_id, cli_lname, cli_phone)
values
('666E', 'Cooper', '881-9991'); 

prompt
prompt Problem 4 Part c 
prompt

-- Try to update a video with a video format of 'MOO'. 
prompt SHOULD FAIL; video needs legal format 
update Video
set vid_format = 'MOO'
where vid_id = '00000D'; 

prompt
prompt Problem 4 Part d
prompt

-- Create a video with only a vid_id of '66666E', an acceptable video format, and an 
-- 	acceptable video rental price. 
prompt SHOULD SUCCEED; demo of DEFAULT and more
insert into Video (vid_id, vid_format, vid_rental_price)
values
('66666E', 'BluRay', 3.99); 

prompt
prompt Problem 4 Part e
prompt

-- Try to create a video with a video length less than or equal to 0. 
prompt SHOULD FAIL; no neg length
insert into Video
values
('77777I', 'HD-DVD', '31-Jul-2013', 2, -95); 

prompt
prompt Problem 4 Part f
prompt

-- Delete one row from any table. Do not delete the rows inserted in Problem 4b or 4d. 
delete from Client
where cli_id = '444D'; 

prompt
prompt Problem 4 Part g
prompt

-- Update a value in just one row that is not inserted in Problem 4b or 4d. 
update Video
set vid_rental_price = 12.55
where vid_id = '00000D'; 

prompt
prompt Problem 4 Part h
prompt

-- Display the contents of Client, Video, and Rental at this point.
select *
from Client; 

select *
from Video;

select *
from rental; 

spool off 
