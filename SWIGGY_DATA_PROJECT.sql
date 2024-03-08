create database Restaurant;
select * from swiggy;

alter table swiggy rename column `Avg ratings` to Avg_ratings;
alter table swiggy rename column `Total ratings` to Total_ratings;
alter table swiggy rename column `Food type` to Food_type;
alter table swiggy rename column Deliverytime to Delivery_time;
alter table swiggy rename column Restaurants to Restaurant;

select  distinct count(Food_type) from swiggy;
select distinct City from swiggy ;
select max(Avg_ratings) from swiggy;

#. How many Restaurent have a rating greater than  4.5?
select count(Restaurant) from swiggy where Avg_ratings>4.5;

#.which restaurent have more Avg_ratings in bangalore city?

select City,Restaurant,Avg_ratings  from swiggy
where City='Bangalore'
order by Avg_ratings desc
limit 1;


#. which  city have highest number of Restaurants?
select city,count(Restaurant) as restaurent_count from swiggy 
group by city
order by restaurent_count desc
limit 1;


# which  Restaurants have the word 'pizza' in their name?
select Restaurant as pizza_restaurents from swiggy 
where Restaurant like '%pizza%';

#. Which restaurent supply chinese food in Mumbai city?
select City,Restaurant from swiggy 
where Food_type like 'Chinese'and City='Mumbai';


# find  total number of restaurants in each city serving indian food
select city, count(Restaurant) from swiggy  
where Food_type like 'indian'
group by city  
order by count(Restaurant) desc ;
-- Kolkata at the top and surat at the last 

# Most Expensive Restaurants
select Restaurant, Price
from swiggy
order by Price desc
limit 10;

# find the  Restaurants with maximum delivery time and minimum delivery time

select  Restaurant,city, max(Delivery_time) from swiggy
group by Restaurant,city 
order by max(Delivery_time) desc
limit 28;
-- 28 restaurants  are from the city kolkata 
 
select  Restaurant,city, min(Delivery_time) from swiggy
group by Restaurant,city 
order by min(Delivery_time)  limit 10;

select City,Delivery_time,Restaurant from swiggy
having Delivery_time = (select max(Delivery_time ) from swiggy);

# find the restaurant in each city,area that serves biryani ?
select Restaurant,City,Area from swiggy 
where Food_type like 'Biryani';

#  Find the areas with most number of restaurants and least number of restaurants

select area,city ,count(Restaurant) from swiggy
group by area,city 
order by count(Restaurant) desc 
limit 5;
--  In delhi Rohini area has the highest no of restaurants
select area,city ,count(Restaurant) from swiggy 
group by area,city 
order by count(Restaurant) 
limit 5;

# Find the address in each city in which maximum order takes place

select Address ,count(Address),city from swiggy 
group by Address,city 
order by count(Address) desc ;
--  In Delhi address rohini has the highest order delivered with a count of 229

# Most Popular Food Types Overall
select Food_type, COUNT(*) 
from swiggy
group by Food_type
order by count(*) desc
limit 10;

# Total  revenue generated by each city
 
 select city ,sum(price) from swiggy
 group by city 
 order by sum(price) desc; 
 -- Mumbai has the highest revenue generated through swiggy  
 
 
# Percentage of  revenue generated by each city
 select city, sum(price) as total_price,round(sum(price)/(select sum(price) 
from swiggy)*100,2) as total_percentage 
from swiggy group by city;
 
 # What is the average ratings of restaurant in each city?
select city,round(Avg(Avg_ratings),0) as Avg_rating from swiggy group by City;
select city,Avg(Avg_ratings) as Avg_rating from swiggy group by City;

# which restaurent has more rating in each city?
select city,Restaurant, avg_ratings from swiggy
having Avg_ratings=(select max(Avg_ratings) from swiggy) order by City;

# Which  restaurant has highest average price for all items ?
select  City,Restaurant,avg(price) as avg_price from swiggy 
group by Restaurant,City 
order by avg_price desc;

# Average Ratings Per Food Type
select Food_type, AVG(Avg_ratings) AS Avg_Ratings
from swiggy
group by Food_type;

# Top 20 Rated Restaurants
select Restaurant, Avg_ratings
from swiggy
order by Avg_ratings desc
limit 20;

# Restaurants with the Most Reviews
select Restaurant, Total_ratings from swiggy
order by Total_ratings desc
limit 10;

# .create a view table and that shows the count of city?
create view City_Counts as select City,count(City) from swiggy group by City;
select * from City_Counts;

 #.  Average delivery time by city
select Restaurant,city,round(avg(Delivery_time),0)  as avg_delivery_time from swiggy 
group by city ,Restaurant
order by round(avg(Delivery_time),0);
-- Average delivery time of these cities is more than 45 minutes and the value range from 45 to 68 minutes



