--TABLES
create table Employees_Type(
    id int primary key not null,
    name varchar(30)
);

create table Employees(
	id int primary key not null,
    name varchar(50),
    surname varchar(50),
    fathername varchar(50),
	gender char,
    birthday date,
    
	phonenum varchar(15),
    experience int,
    address varchar(200),
    employer_type int,
    constraint employer_type
        foreign key (employer_type)
            references Employees_Type(id) 
);

create table Clients(
	id int primary key not null,
    name varchar(50),
    surname varchar(50),
    fathername varchar(50),
	gender char,
    birthday date,
    
	phonenum varchar(15),
    regdate date
);

create table Halls(
	id int primary key not null,
    name varchar(50),
    info varchar(255)
);

create table Entmts(
	id int primary key not null,
    name varchar(50),
    info varchar(255)
);

create table Halls_Entmts(
	id int primary key not null,
    price float,
	discount int,
    id_hall int,
    constraint id_hall
        foreign key (id_hall)
            references Halls(id),
    id_entmt int,
    constraint id_entmt
        foreign key (id_entmt)
            references Entmts(id),
    id_employer int,
    constraint id_employer
        foreign key (id_employer)
            references Employees(id)
);

create table Booking(
	id int primary key not null,
    booking_date date,
    --booking_time timestamp,
    visited char default '-',
    paid float, --ціна
    id_client int,
    constraint id_client
        foreign key (id_client)
            references Clients(id),
    id_hall_entmt int,
    constraint id_hall_entmt
        foreign key (id_hall_entmt)
            references Halls_Entmts(id)
);

create table Timetable(
	day_of_week int primary key not null,
	time_start timestamp,
    time_end timestamp
);