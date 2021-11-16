--1 Вилучити будь-який зв’язок між таблицями вашої БД.
alter table Employees
    drop constraint employer_type;
   
--2 Вилучити і змінити характеристики поля у одній з таблиць вашої БД.
alter table Clients
    drop column phonenum;
alter table Clients
    modify regdate date not null;

--3 Змінити поле у одній з таблиць вашої БД.
alter table Halls
    rename column name to name_new;

--4 Додати поле і нове обмеження унікальності до будь-якої таблиці вашої БД
alter table Halls
    add hall_new varchar(15);
alter table Halls
    add unique_num int;
alter table Halls 
    add constraint uq_new unique (hall_new, unique_num);
    
--5 Змінити тип обмеження цілісності для зв’язку у одній з таблиць вашої БД
alter table Halls_Entmts
    drop constraint id_entmt;
alter table Halls_Entmts
    add constraint id_entmt
        foreign key (id_entmt)
            references Entmts(id);
