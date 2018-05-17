CREATE DATABASE hmodb;

drop table Temples;
drop table Events;
drop table Calendars;

CREATE TABLE Temples (
	id INT(6) UNSIGNED AUTO_INCREMENT,
	name VARCHAR(50),
	description varchar(200),
	latitude DOUBLE NOT NULL,
	longitude DOUBLE NOT NULL,
	email VARCHAR(60),
	postal_code VARCHAR(15) NOT NULL,
	reg_date TIMESTAMP,
    related_calendar_ids varchar(1000),
    
    primary key (id)
);

CREATE TABLE Events (
	id INT(6) UNSIGNED AUTO_INCREMENT,
    temple_id int(6) not null,
    event_type varchar(20) not null,
    start_time int(4) not null,
    duration int(6),
    weekday varchar(13), -- max is 7 numbers + 6 commas
    monthday varchar(100),
    calendar_ids varchar(1000),
    exceptions varchar(1000),
    parent_event int(6),
    
	comments varchar(100),
	
	reg_date TIMESTAMP,
    Primary Key (id)
    
);

CREATE TABLE Calendars (
	id int(6) unsigned auto_increment,
    type varchar(15) not null,
    ammount int(3) not null,
    start_date int(4) not null,
    end_date int(4) not null
);
