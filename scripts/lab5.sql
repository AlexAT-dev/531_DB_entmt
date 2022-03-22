--Таблиці:
create table T1
    as select id, name from Employees_Type
        where id <= 3;
        
create table t2
    as select id, name from Employees_Type
        where id >= 3 and id <5;

--1. Створити запит на виконання об’єднання. 
select * from T1
    union select * from T2;
    
select * from T1
    union all select * from T2;


--2. Створити запит на виконання перетину.
select * from T1
    intersect select * from T2;
   
--3. Виконати запит на побудову різниці.
select * from T1
    minus select * from T2; 
    
--4. Побудувати запит на виконання декартового добутку двох таблиць. 
select * from T1, T2;

drop table T1;
drop table T2;