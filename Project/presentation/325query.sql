/* Alex Childers
   CS 325 - Fall 2018
   Last modified: December 7, 2018
*/

prompt =======================================================================
prompt Query:
prompt Shows a list of what workers (both employees and volunteer) both
prompt specialize in providing Boarding services and are qualified to handle
prompt cats.
prompt =======================================================================

select distinct first_name || ' ' || last_name name, w.worker_id, worker_type
from            worker w
                left outer join volunteer_handling_permissions vhp
                        on w.worker_id = vhp.worker_id
                join worker_providing_service wps
                        on w.worker_id = wps.worker_id
where           (worker_type = 'employee'
                        or
                        (worker_type = 'volunteer' and pet_may_handle = 'cat'))
                and service_sect_id like 'B%'
order by        w.worker_id;
