
-- a handy script to call at the end of a report SQL script,
--    to "clean up" and reset SQL*Plus settings to their
--    default values
-- (suggested by T. Koyuncu, Fall 2008)
-- last modified: 2013-11-22

clear breaks
clear columns
clear computes

set space     1
set feedback  6
set pagesize  14
set linesize  80
set newpage   1
set heading   on

-- to turn off titles set!

ttitle off
btitle off

-- end of cleanup.sql
