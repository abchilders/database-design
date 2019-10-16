/*=====
    reminder: SQL create table statement syntax

    create table desired_table_name
    (col_name col_type any_addl_constraints,
     col_name col_type any_addl_constraints,
     ...
     desired_table_constraint,
     primary key (col_name, ...)
    );

    here are a few of the available types for columns:
    *   integer
    *   varchar2(max_num_chars) - varying-length character
        string, "new style"
    *   char(exact_num_chars) - fixed-length character string
    *   date - true date type! it includes time!
        *   sysdate is an Oracle function that returns
	    the current time
    *   decimal(num_total_place, num_of_which_are_fractl) -
        decimal numeric, decimal(5,2) can hold -999.99 to 999.99
    *   smallint - small integer -32768 to 32767
    *   number - fixed and floating point number that
	is the "broadest" of the numeric types

=====*/

drop table parts cascade constraints;

create table parts
(part_num          integer,
 part_name         varchar2(25),
 quantity_on_hand  smallint,
 price             decimal(6, 2), /* max can be 9999.99 */
 level_code        char(3),
 last_inspected    date,
 primary key       (part_num)
);

/*=====
    the SQL*Plus command describe

    describe tbl_name

    ...that table's column names and their types will
    be displayed to the screen
=====*/

describe parts

/*=====
    FOREIGN KEY - how you relate tables in a relational
    database!

    carefully intended data duplication FOR the purpose
    of relating information in different tables!

    when you declare one or more columns in table A as
    a foreign key, you are saying its contents MUST be
    drawn, if you will, from the contents of another
    column or columns (in Oracle, this must be a primary key)
    from another table

    IN the so-called child table, you declare the desired
    foreign key column or columns, and ALSO include
    the table constraint:

    FOREIGN KEY (col_name, ...) REFERENCES parent_table_name
    -- or 
    FOREIGN KEY (col_name, ...) 
        REFERENCES parent_table_name (col_name, ...)
    
    you HAVE to use the 2nd version if the foreign key
    column(s) have a difference name from the referenced
    primary key
=====*/

drop table part_orders cascade constraints;

create table part_orders
(order_num    char(6),
 cust_num     integer,
 part_num     integer,
 order_date   date,
 quantity     integer,
 order_code   char(1),
 primary key  (order_num),
 foreign key  (part_num) references parts
);
