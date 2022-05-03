--ЛР6--

--1. Запит на виконання проекції (відображення) для таблиць БД.
drop view view1;
create view view1 as select distinct name, surname, fathername from Clients;   
select * from view1;

--2. Запит на виконання складної проекції для таблиць БД
drop view view2;
create view view2 as select distinct name, surname, fathername from Clients
    where gender = 'f';   
select * from view2;

--3. Запит на виконання селекції з використанням будь-якої складної умови відбору для таблиць БД.
--замовлення цього місяця
select * from booking where to_char(booking_date, 'mm') = to_char(sysdate, 'mm');
select * from booking;

--4. Запит на виконання натурального з’єднання у будь-яких таблицях вашої БД.
select Employees.id, Employees.surname, Employees.name, Employees.fathername, Employees_Type.name as Type
from Employees, Employees_Type
where Employees_Type.id = Employees.employer_type;

--5. Запит на виконання умовного з’єднання для таблиць вашої БД
select Clients.id, Clients.surname, Clients.name, Clients.fathername, Clients.regdate, Booking.booking_date
from Clients, Booking
where Clients.id = Booking.id_client and Clients.regdate > Booking.booking_date;