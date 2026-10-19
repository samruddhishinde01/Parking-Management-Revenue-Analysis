create database parking;
use parking;

select * from parking;
select * from vehicle;

#1. How many total parking transactions are recorded?
select count(*) from parking;

#2. What is the total revenue generated from parking?
select sum(parking_fee) from parking;

#3. What is the average parking fee?
select avg(parking_fee) from parking;

#4. What is the average parking duration?
select avg(parking_duration_minutes) from parking;

#5. Which payment method is used the most?
select count(*),payment_method from parking
group by payment_method
order by count(*) desc;

#6. Which time period has the highest number of parking transactions?
select count(*),time_period from parking
group by time_period
order by count(*) desc;

#7. Are there more parking transactions on weekdays or weekends?
select count(*),day_type from parking
group by day_type
order by count(*) desc;

#8. What is the total revenue generated on weekdays and weekends?
select sum(parking_fee) as revenue,day_type from parking
group by day_type
order by revenue desc;

#9. Which parking slot has the highest number of transactions?
select count(*),parking_slot from parking
group by parking_slot
order by count(*) desc;

#10. How much revenue is generated in each month?
select sum(parking_fee),monthname(entry_date) from parking
group by monthname(entry_date)
order by sum(parking_fee)desc;

#11. Which vehicle type has the highest number of parking transactions?
select count(*),v.vehicle_type from parking p
join vehicle v
on p.vehicle_id=v.vehicle_id
group by vehicle_type
order by count(*) desc;

#12. Which vehicle type generates the highest parking revenue?
select sum(parking_fee),v.vehicle_type from parking p
join vehicle v
on p.vehicle_id=v.vehicle_id
group by vehicle_type
order by sum(parking_fee) desc;

#13. Which vehicle type has the highest average parking duration?
select avg(parking_duration_minutes)as duration,vehicle_type from parking p
join vehicle v
on p.vehicle_id=v.vehicle_id
group by vehicle_type
order by duration desc;

#14. How many vehicles are New customers and how many are Regular customers?
select count(*),customer_type from vehicle
group by customer_type
order by count(*) desc;

#15. Which customer type has the highest number of parking transactions?
select count(*),customer_type from parking p
join vehicle v
on p.vehicle_id=v.vehicle_id
group by customer_type
order by count(*) desc;

#16. Which customer type generates the highest parking revenue?
select sum(parking_fee) as revenue ,customer_type from parking p
join vehicle v
on p.vehicle_id=v.vehicle_id
group by customer_type
order by revenue desc;

#17. Which registration city has the highest number of vehicles?
select count(*),registration_city from  vehicle 
group by registration_city
order by count(*)desc;

#18. Which registration city has the highest number of parking transactions?
select count(*),registration_city from parking p
join vehicle v
on p.vehicle_id=v.vehicle_id
group by registration_city
order by count(*)desc;

#19. Which payment method generates the highest revenue?
select  sum(parking_fee), payment_method from parking
group by payment_method
order by sum(parking_fee) desc
limit 1;

#20. Which vehicle type generates the highest revenue?
select sum(parking_fee),vehicle_type from parking p
join vehicle v
on p.vehicle_id=v.vehicle_id
group by vehicle_type
order by sum(parking_fee) desc
limit 1;
