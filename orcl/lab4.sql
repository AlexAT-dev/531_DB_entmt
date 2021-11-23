--1. ��������� ������� ���� �� � ����� ���������� � ��������� ����������.
  --��������:
insert into Employees_Type values (employees_type_seq.nextval, 'type1');
  --�������:
insert all
    into Employees_Type values (employees_type_seq.nextval, 'type2')
    into Employees_Type values (employees_type_seq.nextval+1, 'type3')
    into Employees_Type values (employees_type_seq.nextval+2, 'type4')
    into Employees_Type values (employees_type_seq.nextval+3, 'type5')
select * from dual;

--2. �������� ����� � ������ (����-����� �������� ����) � ��������� ���� ����� ������� ��� ����� ������ �������.
load data
infile 'C:\Users\User\Desktop\Entmts.txt' 
into table Entmts
fields terminated by ","
(id, name, info);

--3. �������� ����������� ������� � ����-���� �������� �� ��� ������ ���� �� ����� ���� �� ������ ������.
  --���� ����:
update Employees_Type set name = 'type_new' where id = 1;
  --����� ����:
update Employees_Type set name = 'type_new_new' where id > 3;

--4. �������� ������ (���� �����, ����� ������, �� ������) � ����-���� ������� ���� ��.
  --���� �����:
delete from Employees_Type where name = 'type_new';
  --����� ������:
delete from Employees_Type where name in ('type2', 'type3');
  --�� ������:
truncate table Employees_Type;

