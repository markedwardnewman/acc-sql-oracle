SET ECHO ON;
SET LINESIZE 132;
SET PAGESIZE 56;
SPOOL D:\_EDUCATION\ACC\_2015_Fall\ITSE-2309-002-Database-Prog\Competency1\lab\Lab1_Newman.txt;
/*
  During the initial set-up for this database, I encountered an error using the ORDERS_DATA.sql file that I downloaded from blackboard.

    Error starting at line : 1 in command -
    INSERT INTO orders
      VALUES (1001,TO_DATE('12/30/1999','MM/DD/YYYY'),104,'ups','n','B77836',
              TO_DATE('09/31/1999','MM/DD/YYYY'),20.40,10.00,
              TO_DATE('01/12/2000','MM/DD/YYYY'))
    Error report -
    SQL Error: ORA-01839: date not valid for month specified
    01839. 00000 -  "date not valid for month specified"
    *Cause:
    *Action:

    The issue is that September doesn't have 31 days, so I let it be.  Consequently, that entry has been left it out, which may or may not affect some of this lab's output.
*/
--#1: List all columns and rows in the stock table.
SELECT * FROM stock;

--#2:  List the last name, first name, and company of all customers (List the columns in that order). Place the list in alphabetical order by company name.
SELECT lname, fname, company FROM customer ORDER BY company;

--#3: List the company names for all customers from Sunnyvale, Redwood City, or San Francisco.
SELECT company FROM customer WHERE city='Sunnyvale' OR city='Redwood City' OR city='San Francisco';

--#4: List all orders that were placed between the dates 12/31/1999 and 01/03/2000. List order number, order date, customer number, ship date, and paid date.
SELECT order_num, order_date, customer_num, ship_date, paid_date FROM orders WHERE order_date BETWEEN '31-DEC-99' AND '03-JAN-00';

--#5. List the order number, order date, and shipping charges for all orders that are not on backlog and for which the shipping charge is over $15.00.
SELECT order_num, order_date, ship_charge FROM orders WHERE backlog='n' AND ship_charge > '15';

--#6. List all stock items which are baseball items which have a unit price greater than $200.00 and a manufacturer code which starts with ‗H‘. (Hint: use LIKE)
SELECT * FROM stock WHERE description LIKE '%baseball%' AND unit_price>'200' AND manu_code LIKE 'H%';

--#7. List the company name for all customers who have orders. Don not list a company more than once.
SELECT UNIQUE company FROM customer
INNER JOIN orders
  ON orders.CUSTOMER_NUM=customer.CUSTOMER_NUM;

--#8. List the customer number and the description (from the stock table) of all items ordered by customers with customer numbers 104 – 108. Order the output by customer number and description. (There should be no duplicate rows in your output).
SELECT UNIQUE customer.CUSTOMER_NUM, stock.DESCRIPTION
FROM customer
INNER JOIN orders
  ON orders.CUSTOMER_NUM=customer.CUSTOMER_NUM
INNER JOIN items
  ON items.ORDER_NUM=orders.ORDER_NUM
INNER JOIN stock
  ON stock.STOCK_NUM=items.STOCK_NUM
WHERE customer.customer_num BETWEEN '104' AND '108'
ORDER BY customer.customer_num, stock.description;

--#9. List the number of (distinct) customers having an order. Label the column "Total_Customers_with_Orders.
--First way
SELECT COUNT(DISTINCT customer.CUSTOMER_NUM) AS "Total_Customers_with_Orders"
FROM customer, orders
WHERE orders.CUSTOMER_NUM=customer.CUSTOMER_NUM
ORDER BY customer.CUSTOMER_NUM;
--Second way
SELECT COUNT(DISTINCT customer.CUSTOMER_NUM) AS "Total_Customers_with_Orders"
FROM customer
INNER JOIN orders
  ON customer.CUSTOMER_NUM=orders.CUSTOMER_NUM
ORDER BY customer.CUSTOMER_NUM;

--#10 For each customer having an order, list the customer number, the number of orders that customer has, the total quantity of items on those orders, and the total price for the items. Order the output by customer number.
SELECT orders.customer_num, COUNT(DISTINCT orders.order_num) "Num Orders", SUM(items.quantity) as "Total Quantity", SUM(items.total_price) as "Total Amount"
FROM orders, items
WHERE orders.order_num = items.order_num
GROUP BY orders.customer_num
ORDER BY orders.customer_num;

SET ECHO OFF;
SPOOL OFF;