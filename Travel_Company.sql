create database Travel_Company;
use Travel_Company;

/* delete if tables are exists*/
drop table if exists `passenger`,`price`;

/* 1.create table passenger */
create table Passenger(
	Passenger_Name varchar(20),
	Category varchar(20),
	Gender varchar(20),
	Boarding_City varchar(20),
    Destination_City varchar(20),
	Distance int,
	Bus_Type varchar(20)
);

/*1.create table Price*/
create table Price(
	Bus_Type varchar(20),
    Distance int,
    Price int
);

/* 2.insert data into tables */
insert into passenger values('Sejal','AC','F','Bengaluru','Chennai',350,'Sleeper');
insert into passenger values('Anmol','Non-AC','M','Mumbai','Hyderabad',700,'Sitting');
insert into passenger values('Pallavi','AC','F','Panaji','Bengaluru',600,'Sleeper');
insert into passenger values('Khusboo','AC','F','Chennai','Mumbai',1500,'Sleeper');
insert into passenger values('Udit','Non-AC','M','Trivandrum','Panaji',1000,'Sleeper');
insert into passenger values('Ankur','AC','M','Nagpur','Hyderabad',500,'Sitting');
insert into passenger values('Hemant','Non-AC','M','Panaji','Mumbai',700,'Sleeper');
insert into passenger values('Manish','Non-AC','M','Hyderabad','Begaluru',500,'Sitting');
insert into passenger values('Piyush','AC','M','Pune','Nagpur',700,'Sitting');

select * from passenger;

insert into price value('Sleeper',350,770);
insert into price value('Sleeper',500,1100);
insert into price value('Sleeper',600,1320);
insert into price value('Sleeper',700,1540);
insert into price value('Sleeper',1000,2200);
insert into price value('Sleeper',1200,2640);
insert into price value('Sleeper',1500,2700);
insert into price value('Sitting',500,620);
insert into price value('Sitting',600,744);
insert into price value('Sitting',700,868);
insert into price value('Sitting',1000,1240);
insert into price value('Sitting',1200,1488);
insert into price value('Sitting',1500,1860);

select * from price;

/*3.female and male passengers travel for min idstance of 600km */
select Gender, count(Gender) FROM passenger where Distance>=600 group by Gender;

/* 4.min ticket price for Sleeper Bus */
select min(Price) from Price where Bus_Type = 'Sleeper';

/*5.Passenger whose name starts with 'S' */
select Passenger_Name FROM Passenger where Passenger_Name like 'S%' order by Passenger_Name;

/* 6.Calculate price charge for each passenger */
select a.Passenger_Name, a.Boarding_City, a.Destination_City, a.Bus_Type,b.Price from
Passenger a, Price b where (a.BUs_Type = b.Bus_Type and a.Distance = b.Distance);

/* 7.Passenger's name, ticket price whose travel 1000km distance in Sitting */
select a.Passenger_Name,b.Price from Passenger a,Price b where(a.Bus_Type = "Sitting" 
and b.Bus_Type = "Sitting" and a.Distance = 700 and b.Distance=700);

/* 8.Sitting and Sleeper bus price for Pallavi travels from Bangalore to Panaji */
select Price from Price where Distance = (select Distance from passenger where passenger_name = "Pallavi");

/* 9.passenger in desc */
select distinct(Distance) from passenger order by distance desc;

/* 10. passenger name and % of distance from the total distance */
with total as(select sum(Distance) as total from Passenger)
select Passenger_Name,(Distance/total.total)*100 as percentage_travel from Passenger, total;

/* 11. display cost */
select Distance, Price,
Case
when price > 1000 then "Expensive"
when price <1000 and Price >500 then "Average Cost"
else "Cheap" end as Cost from price;

