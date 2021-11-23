--1. Заповнити таблиці вашої БД в режимі одиночного і групового доповнення.
  --одиночне:
insert into Employees_Type values (employees_type_seq.nextval, 'type1');
  --групове:
insert all
    into Employees_Type values (employees_type_seq.nextval, 'type2')
    into Employees_Type values (employees_type_seq.nextval+1, 'type3')
    into Employees_Type values (employees_type_seq.nextval+2, 'type4')
    into Employees_Type values (employees_type_seq.nextval+3, 'type5')
select * from dual;

--2. Створити файли з даними (будь-якого сумісного типу) і заповнити ними решту таблиць баз даних шляхом імпорту.
load data
infile 'C:\Users\User\Desktop\Entmts.txt' 
into table Entmts
fields terminated by ","
(id, name, info);

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
