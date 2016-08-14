-- ITSE 2309
-- Lab #2
-- Mark Newman
 -- 12/10/2015
-- NOTE: While populating this database for Lab #1, I encountered an error using the ORDERS_DATA.sql file that I downloaded from blackboard.
--           The issue was that September doesn't have 31 days (which was detailed in the liner notes of Lab #1), so I let it be.
--           Consequently, that entry has been left it out, which may or may not affect some of this lab's output.
--------------

SET ECHO ON
SET LINESIZE 80
SET PAGESIZE 80

-- #1
SELECT customer.company, stock.description, manufact.manu_name, items.quantity, items.total_price
    FROM customer
        INNER JOIN orders ON customer.customer_num = orders.customer_num
        INNER JOIN items ON orders.order_num = items.order_num
        INNER JOIN stock ON items.stock_num = stock.stock_num
        INNER JOIN manufact ON stock.manu_code = manufact.manu_code
    ORDER BY company, description;



--- #2
SELECT UNIQUE orders.order_num, orders.order_date, customer.company, orders.ship_date
    FROM customer
        INNER JOIN orders ON customer.customer_num = orders.customer_num
        INNER JOIN items ON orders.order_num = items.order_num
    WHERE orders.ship_date BETWEEN '25-DEC-99' AND '05-JAN-00'
    ORDER BY company, order_num;



-- #3
SELECT COUNT(DISTINCT customer.lname) as "Non Ordering People"--, orders.order_num
    FROM customer
        LEFT JOIN orders ON customer.customer_num = orders.customer_num
    WHERE orders.order_num IS NULL   
    ORDER BY customer.lname;



-- #4
SELECT UNIQUE customer.customer_num, stock.stock_num, stock.description
    FROM customer
        INNER JOIN orders ON customer.customer_num = orders.customer_num
        INNER JOIN items ON orders.order_num = items.order_num
        INNER JOIN stock ON items.stock_num = stock.stock_num
    WHERE stock.description LIKE '%tennis%' OR stock.description LIKE '%volleyball%'
    ORDER BY customer_num;



-- #5 NOTE: The lab text has an error producing comma in it.  Like so -> Prof_Dept CHAR(6),
/*
CREATE TABLE Professor
    (Prof_ID NUMBER(3) Constraint pk_Professor Primary Key,
    Prof_Lname VARCHAR2(15) NOT NULL,
    Prof_Hiredate DATE,
    Prof_Sal NUMBER(8,2),
    Prof_Dept CHAR(6),
    );
    
SQL>  Error starting at line : 1 in command -
      CREATE TABLE Professor
        (Prof_ID NUMBER(3) Constraint pk_Professor Primary Key,
        Prof_Lname VARCHAR2(15) NOT NULL,
        Prof_Hiredate DATE,
        Prof_Sal NUMBER(8,2),
        Prof_Dept CHAR(6),
        )
      Error report -
      SQL Error: ORA-00904: : invalid identifier
      00904. 00000 -  "%s: invalid identifier"
      *Cause:    
      *Action:
*/

-- I deleted the comma after Prof_Dept CHAR(6), then tried again
CREATE TABLE Professor
    (Prof_ID NUMBER(3) Constraint pk_Professor Primary Key,
    Prof_Lname VARCHAR2(15) NOT NULL,
    Prof_Hiredate DATE,
    Prof_Sal NUMBER(8,2),
    Prof_Dept CHAR(6)
    );
    
DESC Professor
    
CREATE TABLE Student
    (Stu_ID NUMBER(4) Constraint pk_Student Primary Key,
    Stu_Lname VARCHAR2(15) NOT NULL,
    Stu_Major CHAR(6),
    Stu_CredHrs NUMBER(4),
    Stu_GradePts NUMBER(5),
    Prof_ID NUMBER(3),
    CONSTRAINT fk_Student_Prof_ID FOREIGN KEY(Prof_ID)
    REFERENCES Professor
    );
    
DESC Student



-- #6 
INSERT INTO Professor
  VALUES (123, 'Hilbert', TO_DATE('20-MAY-1992', 'DD-MON-YYYY'), 58000, 'MATH');
INSERT INTO Professor
  VALUES (243, 'Newell', TO_DATE('15-JUL-1997', 'DD-MON-YYYY'), 65500, 'CMPSCI');
INSERT INTO Professor
  VALUES (389, 'Lessing', TO_DATE('04-APR-1988', 'DD-MON-YYYY'), 40250, 'ENG');

SELECT * FROM Professor;

INSERT INTO Student
  VALUES (2001, 'Parker', 'CMPSCI', 52, 160, 243);
INSERT INTO Student
  VALUES (2166, 'Smith', 'ENG', 30, 75, 389);
INSERT INTO Student
  VALUES (3200, 'Garcia', 'MATH', 62, 248, 123);
INSERT INTO Student
  VALUES (4520, 'Smith', 'CMPSCI', 45, 157, NULL);
  
SELECT * FROM Student;
  
  

-- #7a
DELETE FROM professor WHERE prof_id = 389;


-- #7b
DELETE FROM student WHERE stu_id = 2166;

SELECT * FROM Student;


-- #7c
DELETE FROM professor WHERE prof_id = 389;

SELECT * FROM Professor;

-- ANSWER: Disabling the ability to delete primary key entities that reference active foreign key entities prevents the creation of orphaned records.  Ie, it is not allowed so that referential integrity can be maintained.
--    Professor Lessing couldn't be deleted because Student Smith relied on Professor Lessing.  Otherwise, Student Smith would become like a ghost on campus, forever wandering aimlessly.  And we just don't want that.
--    After Student Smith dropped Professor Lessing's class, he could finally retire to Mexico, which he promptly did. Now, one day, after drinking one too many coconut martinis, Professor Lessing passed out under that hot Mexican sun.  And that, kids, is how Professor Lessing got one of the best tans of his life!



-- #8a Uh-oh! It looks like Different Student Smith decided to take Professor Newell's Computer Science class.  Things turn out well, and she and Student Parker became fast friends, eventually starting their own business that caters to the upper echelons of French high society.
UPDATE student
  SET prof_id = 243
  WHERE stu_id = 4520;
  
SELECT * FROM Student;


-- #8b Give all professors a 10% raise.  Whoohoo!
UPDATE professor
  SET prof_sal = prof_sal * 1.1;

SELECT * FROM Professor;

SET ECHO OFF