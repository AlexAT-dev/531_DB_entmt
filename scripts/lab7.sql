--ЛР7--

--1. Клієнти, в яких номер телефона починається на 066 та 095
select id, surname, name, fathername, phonenum
from Clients
where phonenum like '066%' or phonenum like '095%';

--2. Відображення працівника і його посада
select Employees.id, Employees.surname, Employees.name, Employees.fathername, Employees_Type.name as "Посада"
from Employees join Employees_Type on Employees.employer_type = Employees_Type.id;

--3. Замовлення цього місяця
select Booking.booking_date, Clients.surname, Clients.name, Clients.fathername
from Booking join Clients on Booking.id_client = Clients.id
where to_char(booking_date, 'mm') = to_char(sysdate, 'mm');

--4. Клієнти, у яких сьогодні день народження
select id, surname, name, fathername, birthday
from Clients
where to_char(birthday, 'DD.MM') = to_char(sysdate, 'DD.MM');

--5. Працівникі які мають замовлення на сьогодні.
select distinct Employees.id, Employees.surname, Employees.name, Employees.fathername, Booking.booking_date
from Booking join Halls_Entmts on Booking.id_hall_entmt = Halls_Entmts.id 
			join Employees on Halls_Entmts.id_employer = Employees.id 
where to_char(Booking.booking_date, 'DD.MM.YYYY') = to_char(sysdate, 'DD.MM.YYYY');

--6. Вивести Адміністраторів, Організаторів та Офіціантів
select Employees.id, Employees.surname, Employees.name, Employees.fathername, Employees_Type.name as "Тип"
from Employees join Employees_Type on Employees.employer_type = Employees_Type.id
where Employees_Type.name in ('Адміністратор', 'Організатор', 'Офіціант');

--7. Клієнти, які зареєстровані але не здійснювали замовлень
select Clients.surname, Clients.name, Clients.fathername, Booking.booking_date
from Booking right join Clients on Booking.id_client = Clients.id
where Booking.booking_date is null;

--8. 3 Найдорожчих замовлення
select Booking.paid, Booking.booking_date, Clients.surname, Clients.name, Clients.fathername
from Booking join Clients on Booking.id_client = Clients.id
where Booking.paid is not null
order by Booking.paid desc
fetch first 3 rows only; --limit 3;

--9. Ціна залів-розваг у проміжку 20-30
select Halls_Entmts.price, Halls.name, Entmts.name
from Halls_Entmts join Halls on Halls_Entmts.id_hall = Halls.id
				join Entmts on Halls_Entmts.id_entmt = Entmts.id
where Halls_Entmts.price between 20 and 30;

--10. Клієнти, які не забронювали замовлення на сьогодні, але не прибули.
select Booking.booking_date, Clients.surname, Clients.name, Clients.fathername
from Booking right join Clients on Booking.id_client = Clients.id
where Booking.visited = '-'
and to_char(Booking.booking_date, 'DD.MM.YYYY') = to_char(sysdate, 'DD.MM.YYYY');

--11. Знижки на зали-розваги та їх ціна з урахуванням знижкою
select Halls.name, Entmts.name, Halls_Entmts.price, Halls_Entmts.discount, Halls_Entmts.price - (Halls_Entmts.price * Halls_Entmts.discount/100) as "Ціна зі знижкою"
from Halls_Entmts join Halls on Halls_Entmts.id_hall = Halls.id
				join Entmts on Halls_Entmts.id_entmt = Entmts.id
where Halls_Entmts.discount > 0;

--12. Найдешевша, найдорожча та середня ціна на певні види розваг
select Entmts.name, Min(Halls_Entmts.price) as "Мінімальне", Max(Halls_Entmts.price) as "Максимальне", Avg(Halls_Entmts.price) as "Середнє"
from Halls_Entmts join Entmts on Halls_Entmts.id_entmt = Entmts.id
group by Entmts.name;

--13. Кількість працівників певного типу
select Employees_Type.name, Count(Employees.id) as "Кількість"
from Employees right join Employees_Type on Employees.employer_type = Employees_Type.id
group by Employees_Type.name;


--14. Кількість замовлень кожного місяця
select to_char(booking_date,'Month') as "Місяць", COUNT(id) as "Кількість замовлень"
from Booking
group by to_char(booking_date,'Month')
order by to_char(booking_date,'Month') desc;

--15. Дні, в яких кількість замовлень меньше за 2
select to_char(Booking.booking_date, 'DD.MM.YYYY') as "Дата", COUNT(id) as "Кількість замовлень"
from Booking
group by to_char(Booking.booking_date, 'DD.MM.YYYY')
having COUNT(id) < 3
order by to_char(Booking.booking_date, 'DD.MM.YYYY');