-- To be able to connec to the database from MySQL Workbench, you need to add your IP to the Inbound permissions (Go to Console>EC2>SecurityGroups
	-- Then select your Group (it's name is in the RDS Instance) and Edit the Inbound adding your IP
	
CREATE DATABASE hmodb;  -- if not already created

-- drop tables: to delete them (run this only if they exist) so we re-create them below
drop table wwmTemples;
drop table wwmEvents;
drop table wwmCalendars;

CREATE TABLE wwmTemples (
	id INT(10) UNSIGNED AUTO_INCREMENT,
	name VARCHAR(50),
	description varchar(200),
	latitude DOUBLE NOT NULL,
	longitude DOUBLE NOT NULL,
	email VARCHAR(60),
	postal_code VARCHAR(15) NOT NULL,
	reg_date TIMESTAMP,
	related_calendar_ids varchar(1000),
	apiKey varchar(100),
	source varchar(400),
	PRIMARY KEY (id)
);

CREATE TABLE wwmEvents (
	id INT(12) UNSIGNED AUTO_INCREMENT,
	temple_id int(6) not null,
	event_type varchar(20) not null, -- mass, confessions, adoration...
	start_time int(4) not null,
	duration int(6),
	weekday varchar(13), -- max is 7 numbers + 6 commas
	monthday varchar(100),
	calendar_ids varchar(1000),
	exceptions varchar(1000),
	parent_event int(6),
	comments varchar(100),
	reg_date TIMESTAMP,
	apiKey varchar(100),
	PRIMARY KEY (id)    
);

CREATE TABLE wwmCalendars (
	id int(12) unsigned auto_increment,
	type varchar(15) not null, -- delay, cancelation
	ammount int(3) not null,
	start_date int(4) not null,
	end_date int(4) not null,
	apiKey varchar(100),
	PRIMARY KEY (id)
);
