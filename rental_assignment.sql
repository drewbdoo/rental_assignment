select * from vehicles;
select * from rental_records;
select * from customers;

-- Step 1
insert into rental_records 
values (null, 'SBA1111A',
(select customer_id from customers where name = 'Angel'),
curdate(), date_add(curdate(), interval 10 day),
null);

-- Step 2
insert into rental_records
values (null, 'GA5555E',
(select customer_id from customers where name = 'Kumar'),
curdate() + 1, date_add(curdate() + 1, interval 3 month),
null);

-- Step 3
select
r.start_date as 'Start Date', r.end_date as "End Date", r.veh_reg_no as "Vehicle Registration No", v.brand as "Brand", v.category as "Category", c.name as "Customer Name"
from rental_records as r
join vehicles as v using(veh_reg_no)
join customers as c using(customer_id)
order by v.category, start_date;

-- Step 4
select * from rental_records
where end_date < curdate();

-- Step 5
select r.veh_reg_no as "Vehicle Registration No", c.name as "Customer Name", r.start_date as "Start Date", r.end_date as "End Date"
from rental_records as r
join customers as c using(customer_id)
where start_date <= '2012-01-10' and end_date >= '2012-01-10';

-- Step 6
select r.veh_reg_no as "Vehicle Registration No", c.name as "Customer Name", r.start_date as "Start Date", r.end_date as "End Date"
from rental_records as r
join customers as c using(customer_id)
where start_date <= curdate() and end_date >= curdate();

-- Step 7
select r.veh_reg_no as "Vehicle Registration No", c.name as "Customer Name", r.start_date as "Start Date", r.end_date as "End Date"
from customers as c
join rental_records as r using(customer_id)
where (start_date >= '2012-01-03' and start_date <= '2012-01-18')
or (end_date >= '2012-01-03' and end_date <= '2012-01-18') 
or (start_date < '2012-01-03' and end_date > '2012-01-18'); 

-- Step 8
select v.veh_reg_no as "Vehicle Registration No", v.brand as "Brand", v.desc as "Description"
from vehicles as v
where v.veh_reg_no not in (
select veh_reg_no from rental_records 
where (start_date <= '2012-01-10' and end_date >= '2012-01-10'));

-- Step 9
select v.veh_reg_no as "Vehicle Registration No", v.brand as "Brand", v.desc as "Description"
from vehicles as v
where v.veh_reg_no not in (
select veh_reg_no from rental_records
where start_date >= "2012-01-03" and start_date <= "2012-01-18" or end_date >="2012-01-03" and end_date <= "2012-01-18" 
or start_date < "2012-01-03" and end_date > "2012-01-18");

-- Step 10
select v.veh_reg_no as "Vehicle Registration No", v.brand as "Brand", v.desc as "Description"
from vehicles as v
where v.veh_reg_no not in (
select veh_reg_no from rental_records 
where start_date >= curdate() and end_date > curdate() + 10);
