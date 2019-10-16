-- Alex Childers

spool 325lab01-out.txt 

drop table stuff; 

create table stuff
(stuff_id integer,
 stuff_name varchar2(10),
 primary key(stuff_id)); 

insert into stuff
values
(7, 'widget');

select *
from stuff; 

spool off
