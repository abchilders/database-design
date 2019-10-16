/* Alex Childers
   325 Homework 2-2
   Last modified: 09/07/2018
*/

spool 325hw2-out.txt

prompt Alex Childers
prompt

prompt The following is the current state of the Client table.
prompt

describe Client

select *
from Client;

prompt The following is the current state of the Video table. 
prompt 

describe Video

select *
from Video; 

prompt The following is the current state of the Rental table.
prompt

describe Rental

select *
from Rental;

spool off
