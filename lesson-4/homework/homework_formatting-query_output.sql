use W3Resource

--1
select salesman_id, name, city, commission*100 as comission, '%' as '% comission' from Inventory.Salesman

--2
select 'For ', ord_date,' there are ', count(ord_no) from Inventory.Orders 
group by ord_date

--3
select * from Inventory.Orders
order by ord_no

--4
select * from Inventory.Orders
order by ord_date desc

--5
select * from Inventory.Orders
order by ord_date desc, purch_amt desc

--6
select cust_name, city, grade from Inventory.Customer
order by customer_id

--7
select salesman_id, ord_date, max(purch_amt) as max from Inventory.Orders
group by salesman_id, ord_date 
order by salesman_id, ord_date asc

--8
select cust_name, city, grade from Inventory.Customer
order by case when grade is null then 0 else 1 end asc, 3 desc

--9
select distinct customer_id, COUNT(distinct customer_id) as cnt, max(purch_amt) as max from Inventory.Orders
group by customer_id
order by 2 desc

--10
select ord_date, sum(purch_amt) as sum, sum(purch_amt)*0.15 as comission from Inventory.Orders
group by ord_date

