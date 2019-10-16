/* Alex Childers
   CS 325 - Homework 3 - Problem 3 part b
   Last modified: 09/11/2018
*/ 

prompt Problem 3 Part b
prompt

-- Delete any rows currently in the tables rental, video, and client. 

delete from Rental;
delete from Video; 
delete from Client; 

-- Insert initial rows into Client, Video, and Rental. 

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
('00000D', 'DVD', '11-Jan-2013', 1.99, 73); 

insert into Video
values
('11111H', 'HD-DVD', '22-Feb-2014', 4.99, 91); 

insert into Video
values
('22222B', 'BluRay', '03-Mar-2012', 1.99, 105); 

insert into Video
values
('33333H', 'HD-DVD', '22-Feb-2014', 3.99, 69); 

insert into Video
values
('44444B', 'BluRay', '04-Apr-2010', 0.99, 91); 

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
('333C', '00000D'); 

insert into Rental
values
('333C', '11111H'); 

insert into Rental
values
('000A', '44444B'); 

-- Insert my additional rows. 

insert into Client
values
('555E', 'Elgar', 'Edward', '011-8999'); 

insert into Video
values
('55555H', 'DVD', '17-Jun-2009', 2.99, 125); 

insert into Rental
values
('555E', '55555H'); 

-- Write three select statements showing the resulting contents in Client, Video,
-- and rental. 

select *
from Client; 

select *
from Video; 

select *
from Rental; 
