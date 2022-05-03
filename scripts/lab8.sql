--ЛР8--

--1. 5 Найдорожчих замовлення
select Booking.paid, Booking.booking_date, Clients.surname, Clients.name, Clients.fathername
from Booking join Clients on Booking.id_client = Clients.id
where Booking.paid is not null
order by Booking.paid desc
fetch first 5 rows only;

--2. Працівники, у яких ім'я починається на "Ол", відсортовані за прізвищем в алфавітному порядку
select surname, name, fathername, gender
from Employees
where name like 'Ол%'
order by surname asc;

--3. Розваги, відсортовані за назвою та ціною
select Halls.name as "Зал", Entmts.name as "Розвага", Halls_Entmts.price as "Ціна"
from Halls_Entmts join Entmts on Halls_Entmts.id_entmt = Entmts.id
                    join Halls on Halls_Entmts.id_hall = Halls.id
order by Entmts.name, Halls_Entmts.price asc;

--4. 3 перші зареєстровані клієнти
select surname, name, fathername, regdate
from Clients
order by regdate asc
fetch first 3 rows only;

--5. Кількість працівників з певною посадою, відсортовані за кількістю
select Employees_Type.name, Count(Employees.id) as "Кількість"
from Employees right join Employees_Type on Employees.employer_type = Employees_Type.id
group by Employees_Type.name
order by Count(Employees.id) desc;

--6. 2 найдосвідченіших працівника
select surname, name, fathername, experience
from Employees
order by experience desc
fetch first 2 rows only;

--7. Дні, у яких заробіток меньший за 100
select to_char(booking_date, 'DD.MM.YYYY') as "Дата", Sum(paid) as "Заробіток"
from Booking
group by to_char(booking_date, 'DD.MM.YYYY')
having Sum(paid) < 100
order by to_char(booking_date, 'DD.MM.YYYY');

--8. Кількість працівників чоловічої та жіночої статі в кожному виді розваг 
select Entmts.name as "Розвага", Employees.gender as "Стать", Count(*) as "Кількість"
from Halls_Entmts join Entmts on Halls_Entmts.id_entmt = Entmts.id
			join Employees on Halls_Entmts.id_employer = Employees.id 
group by Entmts.name, Employees.gender
order by Entmts.name, Employees.gender desc;

--9. 2 Найдорожчи зали (враховуючи всі розваги в цьому залі)
select Halls.name as "Зал", Sum(Halls_Entmts.price) as "Ціна"
from Halls_Entmts join Halls on Halls_Entmts.id_hall = Halls.id
group by Halls.name
order by Sum(Halls_Entmts.price) desc
fetch first 2 rows only;

--10. Клієнти, відсортовані по їх витратам в замовленнях
select Clients.surname || ' ' || Clients.name || ' ' || Clients.fathername as "Клієнт" , Sum(Booking.paid)
from Booking join Clients on Booking.id_client = Clients.id
group by Clients.surname || ' ' || Clients.name || ' ' || Clients.fathername
order by Sum(Booking.paid) desc;
