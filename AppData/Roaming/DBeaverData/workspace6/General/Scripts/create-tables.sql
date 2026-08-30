create table weather(
city varchar(80),
temp_lo int, --low temperature
temp_hi int, --high temperature
precp real,  --precipitation
date date 
);

create table cities(
name varchar(80),
location point
);