--ЛР9--

--1. Кількість замовлень кожного дня
select to_char(Booking.booking_date, 'DD.MM.YYYY') as "Дата", COUNT(id) as "Кількість замовлень"
from Booking
group by to_char(Booking.booking_date, 'DD.MM.YYYY')
order by to_char(Booking.booking_date, 'DD.MM.YYYY');

--2. Середні ціни на розваги 
select Entmts.name as "Розвага", Avg(Halls_Entmts.price) as "Середня ціна"
from Halls_Entmts join Entmts on Halls_Entmts.id_entmt = Entmts.id
group by Entmts.name;

--3. Місячні заробітки
select to_char(booking_date,'Month') as "Місяць", Sum(paid) as "Зароблено"
from Booking
group by to_char(booking_date,'Month')
order by to_char(booking_date,'Month') desc;

--4. Найдешевше та Найдорожче замовлення
select Clients.surname || ' ' || Clients.name as "Клієнт", booking_date as "Дата", paid as "Ціна"
from Booking
join Clients on Booking.id_client = Clients.id
where paid = (select Max(paid) from Booking) or paid = (select Min(paid) from Booking);

--5. 3 найпопулярніші види розваг
select Entmts.name as "Назва розваги", Count(Entmts.name) as "Кількість замовлень"
from Booking join Halls_Entmts on Booking.id_hall_entmt = Halls_Entmts.id 
			join Entmts on Halls_Entmts.id_entmt = Entmts.id 
group by Entmts.name
order by Count(Entmts.name) desc
fetch first 3 rows only;