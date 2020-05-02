use ts;


CREATE USER 'client'@'localhost' IDENTIFIED BY '123';
GRANT INSERT on ts.reservations to 'client'@'localhost';
GRANT INSERT on ts.clients to 'client'@'localhost';
GRANT SELECT on ts.* to 'client'@'localhost';

CREATE USER 'admin'@'localhost' IDENTIFIED BY 'admin123';
GRANT ALL PRIVILEGES on ts.* to 'admin'@'localhost';


create table clients
(
    id int auto_increment primary key,
    first_name varchar(100),
    last_name varchar(100),
    email varchar(100)
);


create table room_types (
    id int auto_increment primary key,
    name varchar(100),
    room_price double
);


create table reservations
(
    id int auto_increment primary key,
    user_id int,
    start_date DATE,
    end_date DATE,
    room_id int,
    price double,
    foreign key (user_id) references clients(id),
    foreign key (room_id) references room_types(id)
);


insert into room_types (name,room_price)
values
    ('Exclusive',300),
    ('Normal',100),
    ('Budget',25)
;