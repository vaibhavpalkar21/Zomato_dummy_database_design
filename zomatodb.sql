-- lets create new schema for zomato dummy database

drop schema if exists zomatodb;

create schema zomatodb;

use zomatodb;

-- Lets create tables for our schema

drop table if exists customer;

create table customer(
 customer_id int(4) not null,
 customer_name varchar(20) not null,
 contact_number varchar(11) not null,
 address varchar(30) not null,
 constraint pk_customer primary key (customer_id)
);

insert into customer(customer_id,customer_name,contact_number,address) VALUES
(1001,'vaibhav Palkar','1234567801','01 SND, aundh, pune'),
(1002,'pratik kijbil','1234567802','02 WBG, kothrud, pune'),
(1003,'sagar amritkar','1234567803','03 QWE, wakad, pune'),
(1004,'mitali basargi','1234567804','04 RTY, sanghavi, pune'),
(1005,'jagruti bhoite','1234567805','05 SGV, sanghavi, pune'),
(1006,'sandhya shirale','1234567806','06 ASD, ravet, pune'),
(1007,'uday patil','1234567807','07 BLA, baner, pune'),
(1008,'punam kale','1234567808','08 SNR, warje, pune'),
(1009,'vighnesh gopinath','1234567809','09 ABP, ravet, pune'),
(1010,'nilesh supekar','1234567810','13 MGV, moshi, pune'),
(1011,'Murtaza khn','1234567811','17 ABP, vadgaon, pune'),
(1012,'gopal kasat','1234567812','19 ABP, pashan, pune'),
(1013,'yogesh jadhav','1234567813','20 ABP, pimpri, pune'),
(1014,'apeksha jadhav','1234567814','21 ABP, sinhagad, pune'),
(1015,'harshad kunjir','1234567815','22 DVK, Uruli, pune'),
(1016,'manash konwar','1234567816','57 SND, kasarwadi, pune'),
(1017,'someshwar kale','1234567817','11 MKN, mukund nagar, pune');

select * from customer;
 
drop table if exists restaurant;

create table restaurant(
 restaurant_id int(3) not null,
 restaurant_name varchar(20) not null,
 rlocation varchar(20) not null,
 rrating decimal(2,1) not null,
 constraint pk_customer primary key (restaurant_id)
);

insert into restaurant(restaurant_id,restaurant_name,rlocation,rrating) VALUES
(101, 'hydrabadi spice', 'aundh', '4.5'),
(102, 'hotel green park', 'baner', '4.1'),
(103, 'saffron', 'pashan', '3.9'),
(104, 'thomson restro', 'sanghavi', '3.6'),
(105, 'laa unico', 'mukund nagar', '4.3'),
(106, 'blue water', 'ravet', '4.2'),
(107, 'jalsaa restaurant', 'wakad', '4.3');

select * from restaurant;

drop table if exists zomato_employee;

create table zomato_employee(
 employee_id int(6) not null,
 employee_name varchar(20) not null,
 emp_contact_number varchar(11) not null,
 employee_avg_rating decimal(2,1) not null,
 constraint pk_zomato_employee primary key (employee_id)
);

insert into zomato_employee(employee_id, employee_name, emp_contact_number, employee_avg_rating) values
(210111, 'sudesh s', '123456911', '3.5'),
(210112, 'prashant kedare', '123456912', '3.9'),
(210113, 'jignesh satam', '123456913', '4.5'),
(210114, 'lajat sharma', '123456914', '4.2'),
(210115, 'prem chopda', '123456915', '3.2'),
(210116, 'ghanashyam seth', '123456916', '3.7'),
(210117, 'sadanad rathe', '123456917', '4.4'),
(210118, 'satish p', '123456918', '4.6'),
(210119, 'mansigh tomar', '123456919', '3.1'),
(210120, 'prasad kechad', '123456920', '3.6'),
(210121, 'sami j', '123456921', '4.3'),
(210122, 'praful patel', '123456922', '3.8'),
(210123, 'narayan kumar', '123456923', '4.7'),
(210124, 'ahmed Z', '123456924', '3.5'),
(210125, 'jateen kumar', '123456925', '4.1');

select * from zomato_employee;

drop table if exists foods;

create table foods(
 food_id int(7) not null,
 food_name varchar(20) not null,
 price_per_unit decimal(5,2) not null,
 constraint pk_foods primary key (food_id)
);

insert into foods(food_id, food_name, price_per_unit) values
(9999411, 'allo paratha', '80.00'),
(9999412, 'veg meal', '120.00'),
(9999413, 'chapati', '20.00'),
(9999414, 'veg thali', '220.00'),
(9999415, 'chicken thali', '150.00'),
(9999416, 'veg biryani', '280.00'),
(9999417, 'mix veg', '180.00'),
(9999418, 'veg pulav', '190.00'),
(9999419, 'mix paratha', '180.00'),
(9999420, 'cold drink', '35.00'),
(9999421, 'paneer roll', '180.00'),
(9999422, 'veg roll', '180.00');

select * from foods;

drop table if exists order_detail;

create table order_detail(
 order_id int(4) not null primary key,
 customer_id int(4) not null,
 restaurant_id int(3) not null,
 employee_id int(6) not null,
 order_status varchar(10),
 order_time timestamp,
 delivered_time timestamp,
 constraint fk_customer foreign key (customer_id) references customer(customer_id),
 constraint fk_restaurant foreign key (restaurant_id) references restaurant(restaurant_id),
 constraint fk_zomato_employee foreign key (employee_id) references zomato_employee(employee_id)
);
-- constraint fk_restaurant foreign key (restaurant_id) references restaurant(restaurant_id)
-- constraint fk_zomato_employee foreign key (employee_id) references zomato_employee(employee_id)

insert into order_detail(order_id, customer_id, restaurant_id, employee_id, order_status, order_time, delivered_time) values
(7711, 1001, 101, 210111, 'confirmed', '2019-10-24 12:27:39', '2019-10-24 12:58:39'),
(7712, 1002, 102, 210119, 'confirmed', '2019-10-21 18:35:35', '2019-10-21 19:10:11'),
(7713, 1003, 103, 210112, 'confirmed', '2019-10-22 14:27:11', '2019-10-22 15:00:25'),
(7714, 1004, 104, 210120, 'confirmed', '2019-10-20 11:45:39', '2019-10-20 12:15:49'),
(7715, 1005, 105, 210114, 'confirmed', '2019-10-01 20:01:11', '2019-10-01 21:02:34'),
(7716, 1006, 106, 210113, 'confirmed', '2019-10-02 12:11:39', '2019-10-02 12:45:15'),
(7717, 1001, 107, 210122, 'confirmed', '2019-10-03 11:06:59', '2019-10-03 11:49:35'),
(7718, 1008, 101, 210112, 'confirmed', '2019-10-04 13:16:15', '2019-10-04 14:20:55'),
(7719, 1009, 102, 210125, 'confirmed', '2019-10-28 21:36:39', '2019-10-28 21:45:25'),
(7720, 1010, 103, 210113, 'confirmed', '2019-10-12 12:36:31', '2019-10-12 13:01:19'),
(7721, 1011, 104, 210121, 'confirmed', '2019-10-14 12:36:31', '2019-10-14 13:01:19'),
(7722, 1006, 106, 210119, 'confirmed', '2019-10-20 19:11:30', '2019-10-20 19:45:15'),
(7723, 1007, 105, 210114, 'confirmed', '2019-10-03 20:02:24', '2019-10-03 20:41:59'),
(7724, 1004, 106, 210118, 'confirmed', '2019-10-25 20:01:14', '2019-10-25 20:29:44'),
(7725, 1003, 103, 210114, 'confirmed', '2019-10-22 14:27:11', '2019-10-22 15:00:25'),
(7726, 1014, 107, 210123, 'confirmed', '2019-10-09 12:08:31', '2019-10-09 13:01:36'),
(7727, 1014, 102, 210115, 'confirmed', '2019-10-28 21:36:36', '2019-10-28 21:45:25'),
(7728, 1001, 107, 210122, 'confirmed', '2019-10-05 20:25:24', '2019-10-05 20:59:45'),
(7729, 1003, 107, 210112, 'confirmed', '2019-10-27 14:20:11', '2019-10-27 15:01:25'),
(7730, 1016, 106, 210120, 'confirmed', '2019-10-03 12:10:39', '2019-10-03 12:48:10'),
(7731, 1007, 104, 210113, 'confirmed', '2019-10-21 20:30:45', '2019-10-21 20:55:25'),
(7732, 1001, 103, 210117, 'confirmed', '2019-10-25 12:24:59', '2019-10-25 12:58:20'),
(7733, 1008, 101, 210121, 'confirmed', '2019-10-17 14:11:59', '2019-10-17 14:49:15'),
(7734, 1005, 103, 210118, 'confirmed', '2019-10-12 12:36:31', '2019-10-12 13:01:19'),
(7735, 1001, 105, 210116, 'confirmed', '2019-10-19 11:02:10', '2019-10-19 12:05:14'),
(7736, 1010, 103, 210124, 'confirmed', '2019-10-13 12:48:31', '2019-10-13 13:35:19'),
(7737, 1002, 102, 210124, 'confirmed', '2019-10-23 13:35:35', '2019-10-23 14:02:11'),
(7738, 1001, 106, 210115, 'confirmed', '2019-10-16 12:15:47', '2019-10-16 12:58:25'),
(7739, 1008, 101, 210123, 'confirmed', '2019-10-15 15:58:15', '2019-10-15 16:35:52'),
(7740, 1003, 103, 210121, 'confirmed', '2019-10-25 21:07:11', '2019-10-25 21:57:25'),
(7741, 1001, 107, 210117, 'confirmed', '2019-10-26 12:27:20', '2019-10-26 13:03:18'),
(7742, 1008, 101, 210119, 'confirmed', '2019-10-21 18:11:49', '2019-10-21 19:02:11'),
(7743, 1001, 105, 210111, 'confirmed', '2019-10-13 14:02:19', '2019-10-13 14:58:39'),
(7744, 1010, 103, 210118, 'confirmed', '2019-10-23 12:36:31', '2019-10-23 13:01:10'),
(7745, 1001, 105, 210122, 'confirmed', '2019-10-26 18:27:30', '2019-10-26 18:59:58'),
(7746, 1007, 104, 210117, 'confirmed', '2019-10-21 20:30:45', '2019-10-21 20:55:25'),
(7747, 1001, 106, 210120, 'confirmed', '2019-10-29 19:25:02', '2019-10-29 20:18:39'),
(7748, 1014, 107, 210115, 'confirmed', '2019-10-15 20:01:13', '2019-10-15 20:58:47'),
(7749, 1017, 101, 210111, 'confirmed', '2019-09-14 10:23:13', '2019-09-14 10:51:29'),
(7750, 1013, 103, 210121, 'confirmed', '2019-08-13 13:24:38', '2019-08-13 14:08:05'),
(7751, 1017, 105, 210112, 'confirmed', '2019-09-05 19:01:21', '2019-09-05 19:48:53'),
(7752, 1009, 107, 210115, 'confirmed', '2019-08-19 18:30:13', '2019-08-19 19:14:29'),
(7753, 1001, 102, 210119, 'confirmed', '2019-09-22 20:46:07', '2019-09-22 21:22:56');

select * from order_detail;

drop table if exists payment_table;

create table payment_table(
 transaction_id int(8) not null,
 order_id int(4) not null,
 payment_type varchar(20) not null,
 payment_status varchar(10),
 constraint pk_foods primary key (transaction_id),
 constraint fk_order_detail foreign key (order_id) references order_detail(order_id)
);

insert into payment_table(transaction_id, order_id, payment_type, payment_status) value
	(78945631, 7711, 'cod', 'unpaid'),
	(78945632, 7712, 'internet banking', 'paid'),
	(78945633, 7713, 'internet banking', 'paid'),
	(78945634, 7714, 'cod', 'unpaid'),
	(78945635, 7715, 'internet banking', 'paid'),
	(78945636, 7716, 'internet banking', 'paid'),
	(78945637, 7717, 'cod', 'unpaid'),
	(78945638, 7718, 'internet banking', 'paid'),
	(78945639, 7719, 'internet banking', 'paid'),
	(78945640, 7720, 'cod', 'unpaid'),
	(78945641, 7721, 'internet banking', 'paid'),
	(78945642, 7722, 'internet banking', 'paid'),
	(78945643, 7723, 'cod', 'unpaid'),
	(78945644, 7724, 'internet banking', 'paid'),
	(78945645, 7725, 'internet banking', 'paid'),
	(78945646, 7726, 'internet banking', 'paid'),
	(78945647, 7727, 'internet banking', 'paid'),
	(78945648, 7728, 'cod', 'unpaid'),
	(78945649, 7729, 'internet banking', 'paid'),
	(78945650, 7730, 'cod', 'unpaid'),
	(78945651, 7731, 'internet banking', 'paid'),
	(78945652, 7732, 'cod', 'unpaid'),
	(78945653, 7733, 'internet banking', 'paid'),
	(78945654, 7734, 'internet banking', 'paid'),
	(78945655, 7735, 'cod', 'unpaid'),
	(78945656, 7736, 'internet banking', 'paid'),
	(78945657, 7737, 'cod', 'unpaid'),
	(78945658, 7738, 'internet banking', 'paid'),
	(78945659, 7739, 'cod', 'unpaid'),
	(78945660, 7740, 'internet banking', 'paid'),
	(78945661, 7741, 'cod', 'unpaid'),
	(78945662, 7742, 'internet banking', 'paid'),
	(78945663, 7743, 'cod', 'unpaid'),
	(78945664, 7744, 'internet banking', 'paid'),
	(78945665, 7745, 'internet banking', 'paid'),
	(78945666, 7746, 'cod', 'unpaid'),
	(78945667, 7747, 'internet banking', 'paid'),
	(78945668, 7748, 'internet banking', 'paid'),
    (78945669, 7749, 'internet banking', 'paid'),
	(78945670, 7750, 'internet banking', 'paid'),
	(78945671, 7751, 'cod', 'unpaid'),
	(78945672, 7752, 'internet banking', 'paid'),
	(78945673, 7753, 'internet banking', 'paid');

select * from payment_table;

drop table if exists order_food;

create table order_food(
 orderF_id int not null auto_increment,
 order_id int(4) not null,
 customer_id int(4) not null,
 restaurant_id int(3) not null,
 food_id int(7) not null,
 quantity int(2),
 employee_id int(6) not null,
 constraint pk_order_food primary key (orderF_id),
 constraint fk_payment_table foreign key (order_id) references payment_table(order_id),
 constraint fk_order_details foreign key (order_id) references order_detail(order_id),
 constraint fk_foods foreign key (food_id) references foods(food_id)
);

insert into order_food (order_id, customer_id, restaurant_id, food_id, quantity, employee_id) values
	(7711, 1001, 101, 9999411, 1, 210111),
	(7711, 1001, 101, 9999420, 1, 210111),
	(7712, 1002, 102, 9999412, 1, 210119),
	(7713, 1003, 103, 9999413, 5, 210112),
	(7714, 1004, 104, 9999414, 1, 210120),
	(7714, 1004, 104, 9999420, 1, 210120),
	(7715, 1005, 105, 9999415, 1, 210114),
	(7716, 1006, 106, 9999416, 1, 210113),
	(7716, 1006, 106, 9999420, 1, 210113),
	(7717, 1007, 107, 9999417, 1, 210122),
	(7718, 1008, 101, 9999418, 1, 210112),
	(7718, 1008, 101, 9999420, 1, 210112),
	(7719, 1009, 102, 9999419, 2, 210125),
	(7720, 1010, 103, 9999420, 1, 210113),
	(7721, 1011, 104, 9999421, 2, 210121),
	(7721, 1011, 104, 9999420, 1, 210121),
	(7722, 1006, 106, 9999417, 1, 210119),
	(7723, 1007, 105, 9999416, 1, 210114),
	(7724, 1004, 106, 9999411, 2, 210118),
	(7724, 1004, 106, 9999420, 1, 210118),
	(7725, 1003, 103, 9999413, 4, 210114),
	(7726, 1014, 107, 9999416, 1, 210123),
	(7727, 1014, 102, 9999419, 1, 210115),
	(7728, 1001, 109, 9999419, 1, 210122),
	(7728, 1001, 109, 9999411, 1, 210122),
	(7728, 1001, 109, 9999420, 1, 210122),
	(7729, 1003, 107, 9999417, 1, 210112),
	(7730, 1016, 108, 9999411, 2, 210120),
	(7730, 1016, 108, 9999420, 1, 210120),
	(7731, 1007, 104, 9999412, 1, 210113),
	(7732, 1001, 103, 9999418, 1, 210117),
	(7733, 1008, 101, 9999414, 2, 210121),
	(7734, 1005, 103, 9999420, 3, 210118),
	(7735, 1001, 105, 9999417, 1, 210116),
	(7735, 1001, 105, 9999413, 3, 210116),
	(7736, 1010, 103, 9999422, 2, 210124),
	(7737, 1002, 102, 9999419, 1, 210124),
	(7738, 1001, 106, 9999411, 2, 210115),
	(7739, 1008, 101, 9999417, 1, 210123),
	(7740, 1003, 103, 9999411, 2, 210121),
	(7741, 1001, 107, 9999422, 2, 210117),
	(7741, 1001, 107, 9999420, 1, 210117),
	(7742, 1008, 101, 9999419, 2, 210119),
	(7743, 1001, 105, 9999419, 2, 210111),
	(7743, 1001, 105, 9999420, 1, 210111),
	(7744, 1010, 103, 9999415, 1, 210118),
	(7745, 1001, 105, 9999411, 1, 210122),
	(7745, 1001, 105, 9999420, 1, 210122),
	(7745, 1001, 105, 9999422, 1, 210122),
	(7746, 1007, 104, 9999412, 1, 210117),
	(7747, 1001, 106, 9999412, 1, 210120),
	(7747, 1001, 106, 9999420, 1, 210120),
	(7748, 1014, 107, 9999416, 1, 210115),
	(7749, 1017, 101, 9999416, 1, 210111),
	(7749, 1017, 101, 9999420, 1, 210111),
	(7750, 1013, 103, 9999416, 1, 210121),
	(7751, 1017, 105, 9999416, 1, 210112),
	(7751, 1017, 105, 9999420, 1, 210112),
    (7752, 1009, 107, 9999416, 1, 210115),
    (7753, 1001, 102, 9999416, 1, 210119),
    (7753, 1001, 102, 9999420, 1, 210119);

select * from order_food;

-- Data Analysis

-- Question - 1 : Write a SQL query to find the number of Zomato users
select count(*) as total_no_of_user
from customer;
-- Ans -  there are total 17 users

-- Question - 2 : Write a SQL query to find details of Zomato delivery Boy
select *
from zomato_employee;

-- Question - 3 : Write a SQL query to find  the list of Zomato users who made more than 10 orders in a particular month

select customer_id, count(order_id)
from order_detail
where customer_id in (select customer_id from order_detail where month(order_time) = 10)
group by customer_id
having count(order_id) > 10;
/*
select c.customer_id, c.customer_name, count(o.order_id) as number_of_orders, month(o.order_time)
from customer c inner join order_detail o on c.customer_id = o.customer_id
group by customer_id
having number_of_orders > 10
order by number_of_orders desc;
*/

-- Question - 4 : Write a SQL query to find top 10 Zomato delivery Boy on basis of customer rating and time to deliver the item

-- top 10 Zomato delivery Boy on basis of customer rating
select o.employee_id, z.employee_name, z.employee_avg_rating, timestampdiff(minute, o.order_time, o.delivered_time) as delivery_time_minute
from order_detail o inner join zomato_employee z on o.employee_id = z.employee_id
group by employee_id
order by z.employee_avg_rating desc
limit 10;

-- top 10 Zomato delivery Boy on basis of deliver the item
select o.employee_id, z.employee_name, z.employee_avg_rating, timestampdiff(minute, o.order_time, o.delivered_time) as delivery_time_minute
from order_detail o inner join zomato_employee z on o.employee_id = z.employee_id
group by employee_id
order by delivery_time_minute asc
limit 10;

/*
select o.employee_id, z.employee_name, z.employee_avg_rating, timestampdiff(minute, o.order_time, o.delivered_time) as delivery_time_minute
from order_detail o inner join zomato_employee z on o.employee_id = z.employee_id
group by employee_id
order by z.employee_avg_rating desc, delivery_time_minute asc;
*/

-- Question - 5 : Write a SQL query to find the list of Zomato users who order food from the same restaurants more than 3 times in a week

select o.customer_id, c.customer_name, restaurant_id, count(*) as orders, week(order_time)
from order_detail o inner join customer c on o.customer_id = c.customer_id
group by restaurant_id
having orders > 3;
