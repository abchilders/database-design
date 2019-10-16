
drop table parts cascade constraints;

create table parts
(part_num               integer,
 part_name              varchar2(25),
 quantity_on_hand       smallint,
 price                  decimal(6,2),  -- max price, ever, of 9999.99
 level_code             char(3),       -- level code must be 3 digits
 last_inspected         date,
 primary key            (part_num)
);   

drop table part_orders;

create table part_orders
(order_num     char(6),
 cust_num      integer    not null,
 part_num      integer    not null,
 order_date    date,
 quantity      integer    default 1 not null,
 order_code    char(1)    check(order_code in ('B', 'I', 'G')),
 delivery_code char(1)    check(delivery_code in ('U', 'F', 'P'))
                              not null,
 primary key      (order_num),
 foreign key      (part_num) references parts
);
