
drop table painter cascade constraints;

create table painter
(ptr_num        integer,
 ptr_lname      varchar2(30) not null,
 ptr_fname      varchar2(15),
 primary key    (ptr_num)
);

drop table painting cascade constraints;

create table painting
(ptg_id         integer,
 ptg_title      varchar2(30),
 ptr_num        integer,
 primary key    (ptg_id),
 foreign key    (ptr_num) references painter
);
