/* Alex Childers
   CS 325 Homework 2-1
   Last modified 09/07/2018
*/ 

prompt What follows is for Problem 2. 
prompt We are creating tables in this problem. 

drop table Client cascade constraints; 
drop table Video cascade constraints;
drop table Rental cascade constraints; 

create table Client
(cli_id 	char(4),
 cli_lname	varchar2(30),
 cli_fname 	varchar2(30), 
 cli_phone	char(8),
 primary key	(cli_id)
); 

create table Video
(vid_id			char(6),
 vid_format		varchar(10), 
 vid_purchase_date	date,
 vid_rental_price	decimal(5,2),
 vid_length		integer,
 primary key		(vid_id)
); 

create table Rental
(cli_id		char(4),
 vid_id		char(6),
 primary key	(cli_id, vid_id),
 foreign key (cli_id) references Client,
 foreign key (vid_id) references Video
); 

prompt What follows is for Problem 3.
prompt We are inserting rows in this problem.

insert into Client
values
('000A', 'Alpha', 'Ann', '000-0001'); 

insert into Client
values
('111B', 'Beta', 'Bob', '111-1112'); 

insert into Client 
values
('222B', 'Beta', 'Ann', '222-2223'); 

insert into Client
values
('333C', 'Carlos', 'David', '333-3334'); 

insert into Client
values
('444D', 'Delta', 'Edie', '111-1112');  

insert into Video
values
('00000D', 'DVD', '11-JAN-2013', 1.99, 73);

insert into Video
values
('11111H', 'HD-DVD', '22-FEB-2014', 4.99, 91); 

insert into Video
values
('22222B', 'BluRay', '03-MAR-2012', 1.99, 105); 

insert into Video
values
('33333H', 'HD-DVD', '22-FEB-2014', 3.99, 69); 

insert into Video
values
('44444B', 'BluRay', '04-APR-2010', 0.99, 91); 

insert into Rental
values
('111B', '11111H'); 

insert into Rental
values
('222B', '00000D'); 

insert into Rental
values
('222B', '22222B'); 

insert into Rental
values
('333C', '22222B'); 

insert into Rental
values
('333C', '11111H'); 

insert into Rental
values
('000A', '44444B'); 

prompt What follows is for Problem 4.
prompt I am inserting my own additional rows.

insert into Client
values
('555E', 'Elgar', 'Edward', '011-8999'); 

insert into Video
values
('55555H', 'DVD', '17-JUN-2009', 2.99, 125); 

insert into Rental
values
('555E', '55555H'); 


