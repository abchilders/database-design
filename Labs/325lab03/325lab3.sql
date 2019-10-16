/* Alex Childers
   Xavier Damas
   09/07/2018
*/

spool 325lab3-out.txt

prompt Alex Childers
prompt Xavier Damas

insert into part_orders
values
('123445', 32, 10603, sysdate, 3, 'B', 'U');

insert into part_orders
values
('987654', 54, 10604, '01-JAN-2018', 4, 'I', 'F');

insert into part_orders
values
('356634', 654, 10605, '07-SEP-2018', 5, 'G', 'P'); 

delete from parts
where part_num = 10607;

update parts
set quantity_on_hand = 100
where part_num = 10604; 

update part_orders
set quantity = 2
where order_num = '123445'; 

select *
from parts; 

select *
from part_orders; 

spool off
