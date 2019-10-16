/* Alex Childers
   325 HW 1 - part 1
   Last modified 08/29/2018
*/ 

drop table familyCats; 

create table familyCats
(name varchar2(20), 
 age  smallint, 
 sex  char(1),
 primary key (name)); 

insert into familyCats
values
('Kiwi', 12, 'F');

insert into familyCats
values
('Maya', 10, 'F'); 

insert into familyCats
values
('Othello', 3, 'M'); 

insert into familyCats
values
('Windsor', 3, 'M'); 

insert into familyCats
values
('Frances', 9, 'F');  
  
