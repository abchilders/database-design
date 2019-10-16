/*
Alex Childers
CS 325 - Homework 9 - Problem 3
Last modified: Nov. 16, 2018
*/

spool 325hw9-out.txt

prompt
prompt =======================
prompt Homework 9 Problem 3
prompt =======================
prompt
prompt Alex Childers
prompt
prompt ************
prompt Problem 3-1

drop view counter_client_info;

create view counter_client_info as
	select client_lname, category_name fave_cat
	from client join movie_category on
		client_fave_cat = category_code;

prompt ************
prompt Problem 3-2

select *
from counter_client_info
order by client_lname; 

select fave_cat, client_lname
from counter_client_info
order by fave_cat; 

prompt ************
prompt Problem 3-3

drop view movie_list; 

create view movie_list as
	select category_name, movie_rating, movie_title
	from movie_category mc join movie m on 
		mc.category_code = m.category_code;

prompt ************
prompt Problem 3-4

select *
from movie_list
order by movie_rating, movie_title; 

prompt ************
prompt Problem 3-5

select category_name, count(*) "# in Category"
from movie_list
group by category_name
order by "# in Category" desc; 

prompt ************
prompt Problem 3-6

drop table Childers_Cohort;

create table Childers_Cohort
(accomplice_num 	integer, 
 name			varchar2(30) 	not null,
 pronoun		varchar2(8),
 birth_year		smallint,
 primary key (accomplice_num)
); 
 
drop sequence accomplice_seq; 

create sequence accomplice_seq
start with 10;

prompt ************
prompt Problem 3-7

insert into Childers_Cohort
values
(accomplice_seq.nextval, 'Hope', 'she', 2006);

insert into Childers_Cohort
values
(accomplice_seq.nextval, 'Ari', 'he', 2016); 

insert into Childers_Cohort
values
(accomplice_seq.nextval, 'Inka Binka', 'she', 1985); 

select *
from Childers_Cohort; 

spool off 
