/*
Alex Childers
CS 325- Fall 2018
Last modified: November 27, 2018
*/

spool 325result-contents.txt

-- Formatting the output so that it looks nice:
set linesize 80
column sex format a3
column pet_name format a9
column is_spayed_neutered format a18
column birth_year format a10
column date_received format a13
column training format a68
column pet_may_handle format a15
column section_id format a10
column service_sect_id format a16
column service format a8
column class_name format a30
column date_of_occurrence format a20
column date_enrolled format a14
column start_date format a10
column date_of_daycare format a16

prompt ======
prompt Owner:
prompt ======

select *
from owner; 

prompt ================
prompt Owner_phone_num: 
prompt ================

select * 
from owner_phone_num; 

prompt =================
prompt Owner_email_addr:
prompt =================

select *
from owner_email_addr;

prompt ====
prompt Pet:
prompt ====

select *
from pet;

prompt =====================
prompt Pet_vaccine_received:
prompt =====================

select *
from pet_vaccine_received;

prompt ======================
prompt Pet_medication_needed:
prompt ======================

select *
from pet_medication_needed;

prompt =====================
prompt Pet_diet_restriction:
prompt =====================

select *
from pet_diet_restriction;

prompt ================
prompt Owner_phone_num:
prompt ================

select *
from owner_phone_num;

prompt ====
prompt Cat:
prompt ====

select *
from cat;

prompt ====
prompt Dog:
prompt ====

select *
from dog;

prompt =======
prompt Worker:
prompt =======

select *
from worker;

prompt =================
prompt Worker_phone_num:
prompt =================

select *
from worker_phone_num;

prompt ==================
prompt Worker_email_addr:
prompt ==================

select *
from worker_email_addr;

prompt =========
prompt Employee:
prompt =========

select *
from Employee;

prompt ===============================
prompt Employee_formal_qualifications:
prompt ===============================

select *
from employee_formal_qualifications;

prompt ==========
prompt Volunteer:
prompt ==========

select *
from volunteer;

prompt ===============================
prompt Volunteer_handling_permissions:
prompt ===============================

select *
from volunteer_handling_permissions;

prompt ========
prompt Service:
prompt ========

select *
from service;

prompt =========================
prompt Worker_providing_service:
prompt =========================

select *
from worker_providing_service;

prompt ======
prompt Class:
prompt ======

select *
from class;

prompt =======================
prompt Pet_permitted_in_class:
prompt =======================

select *
from pet_permitted_in_class;

prompt ===================
prompt Class_session_date:
prompt ===================

select *
from class_session_date;

prompt =================
prompt Class_enrollment:
prompt =================

select *
from class_enrollment;

prompt =========
prompt Boarding:
prompt =========

select *
from boarding;

prompt ====================
prompt Boarding_enrollment:
prompt ====================

select *
from boarding_enrollment;

prompt ==============
prompt Doggy_daycare:
prompt ==============

select *
from doggy_daycare;

prompt ===================
prompt Daycare_enrollment:
prompt ===================

select *
from daycare_enrollment;

spool off

clear columns
