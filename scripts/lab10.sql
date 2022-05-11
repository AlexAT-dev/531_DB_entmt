--1. Процедура видалення запису (результат -> Кількість замовлень вказаного місяця)
create or replace procedure SafeDeleteClientByID(val_id int)
as 
begin
    update Booking set id_client = null where id_client = val_id;
    delete from Clients where id = val_id;
end;

insert into Clients(id, name) values (999, 'Test');
insert into Booking(id, id_client) values (99, 999);

--delete from Booking where id = 99;

select * from Clients;
select * from Booking;

execute SafeDeleteClientByID(999);

--2. Фукнція (результат -> Кількість замовлень вказаного місяця)
create or replace function GetOrderCountByMonth(val_month int)
return int is
    val_count int := 0;
begin
    select COUNT(id) into val_count
    from Booking
    where to_char(booking_date,'mm') = val_month
    group by to_char(booking_date,'mm');
    
    return val_month;
end;

select GetOrderCountByMonth(11)
from dual;

--3. Тригери
--Каскадне оновлення таблиці працівників, при видаленні посади
create or replace trigger trigger_emp_type_deleted 
    before delete
    on Employees_Type 
    for each row
begin
    update Employees SET employer_type = null where employer_type= :old.id;
end;

delete from Employees where id = 99;
insert into Employees_Type values (99, 'Test');

insert into Employees(id, name, employer_type) values (99, 'TestName', 99);

select * from Employees;

delete from Employees_Type where id = 99;


-----При додаванні клієнта, якщо дата реєстрації більша за сьогодні, поставити сьогоднішню дату
create or replace trigger trigger_add_client_date 
    before insert
    on Clients 
    for each row
begin
    if :new.regdate > SYSDATE then
        :new.regdate  := SYSDATE;
    end if;
end;

insert into Clients(id, name, regdate) values (99, 'Test-Day-Today', '30-05-2022');
select * from Clients;

delete from Clients where id = 99;

-----При додаванні клієнта, якщо дата реєстрації більша за сьогодні, поставити сьогоднішню дату

drop table Booking_Backup;
create table Booking_Backup as select * from Booking where 0 = 1;
alter table Booking_Backup drop column id;



create or replace trigger trigger_delete_booking 
    after delete
    on Booking 
    for each row
begin
    insert into Booking_Backup(booking_date,
                                visited,
                                paid,
                                id_client,
                                id_hall_entmt)
                        values (:old.booking_date,
                                :old.visited,
                                :old.paid,
                                :old.id_client,
                                :old.id_hall_entmt);
end;

insert into Booking_Backup select * from Booking;

insert into Booking(id, id_client) values (99, 999);
delete from Booking where id = 99;

select * from Booking_Backup;
