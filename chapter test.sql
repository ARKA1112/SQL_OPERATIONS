-- Active: 1657968573025@@127.0.0.1@3306@sakila
CREATE TEMPORARY TABLE Customer (Customer_id int, Name Varchar(20))
CREATE TEMPORARY TABLE Payment (Payment_id int, Customer_id int, Amount Double)

INSERT INTO  Customer VALUES (1, "John Smith"),(2, "Kathy Jones"),(3, "Greg Oliver")

INSERT INTO Payment VALUES (101, 1, 8.99),(102, 3, 4.99),(103, 1, 7.99)

/* Joining the two tables using the outer join */

select c.Name , p.Amount from 
Customer c
LEFT OUTER JOIN Payment p
on c.Customer_id = p.Customer_id

