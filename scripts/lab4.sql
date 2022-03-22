--1. Заповнити таблиці вашої БД в режимі одиночного і групового доповнення.
  --одиночне:
insert into Employees_Type values (1, 'type1');
  --групове:
insert all
    into Employees_Type values (2, 'type2')
    into Employees_Type values (3, 'type3')
    into Employees_Type values (4, 'type4')
    into Employees_Type values (5, 'type5')
select * from dual;

--2. Створити файли з даними (будь-якого сумісного типу) і заповнити ними решту таблиць баз даних шляхом імпорту.
create or replace directory data_load as 'D:\\OracleDatabase\\load\\';
create table EntmtsLoad(
	id int,
    name varchar(50),
    info varchar(255)
)
organization external(
    type ORACLE_LOADER
    default directory data_load
    access parameters(
        records delimited by newline
        nobadfile
        nologfile
        fields terminated by ','
        missing field values are null
    )
    location ('Entmts.txt')
);

insert into Entmts select * from EntmtsLoad;
drop table EntmtsLoad;
select * from Entmts;

--3. Виконати модифікацію значень у будь-яких таблицях БД для одного поля та групи полів за певною умовою.
  --одне поле:
update Employees_Type set name = 'type_new' where id = 1;
  --група полів:
update Employees_Type set name = 'type_new_new' where id > 3;

--4. Видалити записи (один запис, групу записів, усі записи) з будь-яких таблиць вашої БД.
  --один запис:
delete from Employees_Type where name = 'type_new';
  --група записів:
delete from Employees_Type where name in ('type2', 'type3');
  --усі записи:
truncate table Employees_Type;
truncate table Employees_Type;
