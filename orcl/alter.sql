--1 �������� ����-���� ������ �� ��������� ���� ��.
alter table Employees
    drop constraint employer_type;
   
--2 �������� � ������ �������������� ���� � ���� � ������� ���� ��.
alter table Clients
    drop column phonenum;
alter table Clients
    modify regdate date not null;

--3 ������ ���� � ���� � ������� ���� ��.
alter table Halls
    rename column name to name_new;

--4 ������ ���� � ���� ��������� ���������� �� ����-��� ������� ���� ��
alter table Halls
    add hall_new varchar(15);
alter table Halls
    add unique_num int;
alter table Halls 
    add constraint uq_new unique (hall_new, unique_num);
    
--5 ������ ��� ��������� �������� ��� ������ � ���� � ������� ���� ��
alter table Halls_Entmts
    drop constraint id_entmt;
alter table Halls_Entmts
    add constraint id_entmt
        foreign key (id_entmt)
            references Entmts(id);

    