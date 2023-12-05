/* Lab | SQL Queries 2 */

-- 1. Select all the actors with the first name ‘Scarlett’.
select * from sakila.actor
where first_name = 'Scarlett';

-- 2. Select all the actors with the last name ‘Johansson’.
select * from sakila.actor
where last_name = 'Johansson';

-- 3. How many films (movies) are available for rent?
select count(distinct film_id) as "Number of films available for renting" from sakila.inventory;

-- 4. How many films have been rented?
select count(distinct inventory_id) from sakila.rental;

-- 5. What is the shortest and longest rental period?
select min(datediff(return_date, rental_date)) as "Shortest rental period",  max(datediff(return_date, rental_date)) as "Longest rental period" from sakila.rental;
select * from sakila.rental
where datediff(return_date, rental_date) = 0 or datediff(return_date, rental_date) = 10;

select min(rental_duration) as "Shortest rental period", max(rental_duration) as "Longest rental period" from sakila.film;
select * from sakila.film
where rental_duration = 3 or rental_duration = 7
order by rental_duration;

-- 6. What are the shortest and longest movie duration? Name the values max_duration and min_duration.
select max(length) as 'max_duration', min(length) as 'max_duration' from sakila.film;
select * from sakila.film
where length = 185 or length = 46;

-- 7. What's the average movie duration?
select avg(length) as "Average movie duration" from sakila.film;

-- 8. What's the average movie duration expressed in format (hours, minutes)?
select floor(avg(length)/60) from sakila.film;
select floor(avg(length)%60) from sakila.film;

select concat(floor(avg(length)/60), ':', floor(avg(length)%60)) as "Average movie duration" from sakila.film;
select concat(floor(avg(length)/60), 'H', floor(avg(length)%60), 'm') as "Average movie duration" from sakila.film;

select date_format(sec_to_TIme(avg(length) * 60), "%H:%i") as "Average movie duration" from sakila.film;


-- 9. How many movies longer than 3 hours?
select count(film_id) as "Number of movies longer than 3 hours" from sakila.film
where length > 3*60;

-- 10. Get the name and email formatted. Example: Mary SMITH - mary.smith@sakilacustomer.org.
select lower(email) from sakila.customer;

select concat(lower(first_name), '.', lower(last_name), '@sakilacustomer.org') from sakila.customer;

-- 11. What's the length of the longest film title?
select max(length(title)) as "Length of the longest film title" from sakila.film;


