/* Alex Childers
   CS 325 - Homework 3 - Problem 3 part a 
   Last modified: 09/13/2018
*/ 

prompt Problem 3 Part a:
prompt

-- Delete tables for convenience. 

drop table Client cascade constraints; 
drop table Video cascade constraints; 
drop table Rental cascade constraints; 

-- Create those tables with appropriate domain constraints.  

create table Client 
(cli_id		char(4),
 cli_lname	varchar2(15)	not null,
 cli_fname	varchar2(15),
 cli_phone 	varchar2(12)	not null,  
 primary key 	(cli_id)
); 

create table Video
(vid_id			char(6),
 vid_format		varchar2(6)	check(vid_format in ('DVD', 'HD-DVD', 'BluRay'))
						not null, 
 vid_purchase_date 	date		default sysdate, 
 vid_rental_price	decimal(4, 2)	check(vid_rental_price > 0) not null,  	
 vid_length		integer		check(vid_length > 0), 
 primary key		(vid_id) 
); 

create table Rental
(cli_id		char(4),
 vid_id		char(6), 
 primary key 	(cli_id, vid_id),
 foreign key 	(cli_id) references Client,
 foreign key 	(vid_id) references Video
); 
