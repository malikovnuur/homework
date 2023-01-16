-- -1 Вывести всех клиентов из страны Canada
select * from customer where country = 'Canada';
--
-- - 2Вывести все страны клиентов
select country from customer;
--
-- -3 Вывести количество всех заказов
select  count(*) as  orders from orders;
--
-- - 4 Вывести максимальную стоимость заказа
select  max(unit_price)from order_item;
--
-- -5 Найти сумму всех заказов
select  sum(unit_price) from order_item;
--
-- -6 Найти сумму всех заказов за 2014 год
select  sum(unit_price) from orders join order_item oi on id = oi.order_id where  orders.order_date between date '2014-01-01' and date'2014-12-30' ;

--
-- -7 Найти среднюю стоимость всех заказов
select round(avg(unit_price)) as average_price from order_item;
--
-- -8 Найти среднюю стоимость всех заказов по каждому клиенту
select  avg(unit_price) as average_price_by_customer from order_item  ;

--
-- -9 Найти всех клиентов, которые живут в Бразилии или Испании
select  * from customer where country in('Brazil','Italy');
--
-- -10 Найти все заказы между 2013ым и 2014ым годами, которые стоили меньше 100.00$
select * from orders where unit_price >100 and order_date between date'2013-01-01'and date '2014-01-01';
--
--
--
-- -11 Найти всех клиентов, которые в одной из стран: Испания, Италия, Германия, Франция. Отсортируйте по стран
select  * from  customer  where country in('Spain', 'Italy', 'Germany', 'France') order by country;
--
-- -12 Найти все страны клиентов, страны которых содержаться в таблице поставщиков
--
--
select  * from  customer join public.supplier s on customer.country = s.country;
--
-- -13 Найти всех клиентов, имена которых начинаются на 'Jo'
select  * from  customer where first_name like 'Jo%';
--
-- -14 Найти всех клиентов, имена которых заканчиваются на 'a' и имеют длину ровно 4 символа
select  * from  customer where first_name like'___a' ;

--
--
--
-- -15 Найти количество клиентов по странам
select  count(country) from customer;
--
-- -16 Найти количество клиентов по странам. Вывести в порядке убывания
select  country,count(*) as number from customer group by  country order by country;
--
-- 17- Найти общую сумму стоимости заказов и количество заказов по каждому клиенту (customer_id). Отсортировать по сумме

select customer_id, round(sum(total_amount)),count(customer_id) from orders group by customer_id
order by sum(total_amount);
-- -18 Найти общую сумму стоимости заказов и количество заказов по каждому клиенту (customer_id), у которых общее количество заказов больше 20ти
select customer_id, sum(total_amount),count(customer_id) from orders group by customer_id
having count(customer_id) >20;
--
--
-- -19 Найти количество городов в каждой из стран клиентов
select count(city),country from customer group by country;