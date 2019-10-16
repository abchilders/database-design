/* Alex Childers
   Jacob Konicke 
   08/31/2018
*/ 

spool 325lab2-out.txt 

prompt Alex Childers
prompt Jacob Konicke 

drop table movies; 

create table movies
(name 		varchar2(300),
 premiere 	date,
 ticket_price	integer,
 rating		varchar2(5), 
 primary key	(name)
); 

insert into movies 
values
('Harry Potter and the Sorcerers Stone', sysdate, 4, 'PG-13'); 

insert into movies
values
('Superfast Racy Boom', sysdate, 6, 'PG-18'); 

insert into movies
values
('Kikis Delivery Service', '01-MAR-2000', 1, 'G'); 

insert into movies
values
('Pow Pow Shooty Bang Bang', sysdate, 20, 'XRPG3');

insert into movies
values
('Santa Jaws', '20-AUG-2017', 10, 'R'); 

insert into movies
values
('Butter', '2-JAN-0003', 7, 'R'); 

describe movies

select *
from movies; 

spool off 
