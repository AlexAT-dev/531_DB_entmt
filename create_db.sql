drop database if exists DBEntertainment;
create database if not exists DBEntertainment;
use DBEntertainment;

create table if not exists Employers_Type(
	id int auto_increment primary key,
    name varchar(30)
);

create table if not exists Employers(
	id int auto_increment primary key,
    name varchar(50),
    surname varchar(50),
    fathername varchar(50),
	gender int,
    birthday date,
    
	phonenum varchar(15) check(phonenum like "+__(___)_______"),
    experience int,
    employer_type int,
    foreign key (employer_type) references Employers_Type(id) on update cascade on delete cascade,
    address varchar(200)
);

create table if not exists Clients(
	id int auto_increment primary key,
    name varchar(50),
    surname varchar(50),
    fathername varchar(50),
	gender int,
    birthday date,
    
	phonenum varchar(15) check(phonenum like "+__(___)_______"),
    regdate date
);

create table if not exists Halls(
	id int auto_increment primary key,
    name varchar(50),
    info varchar(255)
);

create table if not exists Entmts(
	id int auto_increment primary key,
    name varchar(50),
    info varchar(255)
);

create table if not exists Halls_Entmts(
	id int auto_increment primary key,
    price float,
    id_hall int,
    foreign key (id_hall) references Halls(id) on update cascade on delete cascade,
    id_entmt int,
    foreign key (id_entmt) references Entmts(id) on update cascade on delete cascade,
    id_employer int,
    foreign key (id_employer) references Employers(id) on update cascade on delete cascade
);

create table if not exists Booking(
	id int auto_increment primary key,
    booking_date date,
    booking_time time,
    visited bool,
    paid bool,
    id_client int,
    foreign key (id_client) references Clients(id) on update cascade on delete cascade,
    id_hall_entmt int,
    foreign key (id_hall_entmt) references Halls_Entmts(id)  on update cascade on delete cascade
);

create table if not exists Timetable(
	day_of_week int primary key,
	time_start time,
    time_end time
);
