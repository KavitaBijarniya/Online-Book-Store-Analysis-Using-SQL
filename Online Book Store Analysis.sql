create database online_book_store
use online_book_store

select * from Books
select * from Customers
Select * from Orders

--1. Retrieve all books in the "Fiction" genre
select* from Books
where genre = 'Fiction'

--2. Find books published after the year 1950
select * from Books
where published_year > 1950

--3.  List all customers from the Canada
select * from Customers
where Country = 'Canada'

--4.Show orders placed in November 2023
select * from Orders
where order_date between '2023-11-01' and '2023-11-30'

--5.Retrieve the total stock of books available
select sum(Stock) as totlat_stock from Books

--6.  Find the details of the most expensive book
select  top 1 * from Books
order by price desc

-- 7. Show all customers who ordered more than 1 quantity of a book
select * from  Orders 
where quantity >1

--8. Retrieve all orders where the total amount exceeds $20
select * from Orders
where Total_Amount > 20

--9. List all genres available in the Books table
select distinct(genre) from Books

--10.  Find the book with the lowest stock
select top 1 * from Books
order by stock asc

--11. Calculate the total revenue generated from all orders
select sum(total_amount) from Orders

--12. Retrieve the total number of books sold for each genre
select b.genre, sum(o.quantity) from Books b
join Orders o
on b.Book_ID = o.Book_ID
group by genre

--13.  Find the average price of books in the "Fantasy" genre
select avg(price) as price from Books 
where genre = 'Fantasy'

--14. List customers who have placed at least 2 orders
select c.name, o.customer_id, count(o.order_id) from Customers c
join Orders o
on c.Customer_ID = o.Customer_ID
group by o.customer_id, c.name
having count(order_id)>=2

--15. Find the most frequently ordered book
select top 1 o.Book_ID, b.title, count(o.order_id) order_count from Books b
join Orders o
on b.Book_ID = o.Book_ID
group by o.Book_ID, b.title
order by order_count desc

--16. Show the top 3 most expensive books of 'Fantasy' Genre
select top 3 title, price from Books
where Genre = 'Fantasy'
order by price desc

--17.  Retrieve the total quantity of books sold by each author
select b.Author, sum(o.quantity) total_quantity from Books b
join Orders o
on b.Book_ID = o.Book_ID
group by b.Author

--18.  List the cities where customers who spent over $30 are located
select distinct c.city, o.Total_Amount from Customers c
join Orders o
on c.Customer_ID = o.Customer_ID 
where Total_Amount >30

--19. Find the customer who spent the most on orders
select top 1 c.name, sum(o.Total_Amount) total_spent from Customers c
join Orders o
on c.customer_id = o.Customer_ID
group by c.Name
order by total_spent desc 

--20. Calculate the stock remaining after fulfilling all order
select b.Book_ID, b.Stock, COALESCE(SUM(o.quantity),0)  Order_quantity,
b.Stock - COALESCE(SUM(o.quantity),0) remaining_quantity
from Books b
join Orders o
on b.Book_ID = o.Book_ID
group by b.Book_ID, b.Stock
order by b.Book_ID
