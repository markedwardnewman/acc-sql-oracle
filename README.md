# Oracle's SQL

## Level of expertise
Halfway Between Beginner and Intermediate.   I also recently completed a 3 hour college course that specifically focused on Oracle's SQL. Also, during my tenure at **Flextronics** I regularly accessed production code on a daily basis.  Near the end I even wrote a couple of stored procedures that printed labels for parts used in **Apple's Mac Pro**.

## Disclaimer
Oracle's Database 11g Express Edition and SQL Developer is what was used for this class.  Also, for any of the code found here to work correctly, the example database must first be created using the files found in the `database set-up` directory.

I did learn quite a bit in this class, and no longer have that "I hope I don't mess this thing up!" feeling that I previously had when working with databases.  Database Manipulation dropped a few rungs below Security on the Computer Skills That I'm *Not* Good With Ladder.  Also, I learned that the name "Oracle" comes from a CIA project that [Larry Ellison](https://en.wikipedia.org/wiki/Larry_Ellison) was hired to work on back in the 70s.  Plus, did you know that databases are extremely useful when messing with data?  It's true!

Each directory contains these files:

- **Project_#_instruction.pdf** - The instructions
- **Project_#.sql** - SQL code written by yours truly
- **Project_#_output.txt/pdf**-Results after executing the Project_#.sql file

## Projects
### Project 1
***The challenges:*** 

1. List all columns and rows in the stock table.

2. List the last name, first name, and company of all customers (List the columns in that order). Place the list in alphabetical order by company name.

3. List the company names for all customers from Sunnyvale, Redwood City, or San Francisco.

4. List all orders that were placed between the dates 12/31/1999 and 01/03/2000. List order number, order date, customer number, ship date, and paid date. (Hint: Specify year in single quotes ‗DD-MMM-YYYY‘)

5. List the order number, order date, and shipping charges for all orders that are not onbacklog and for which the shipping charge is over $15.00.

6. List all stock items which are baseball items which have a unit price greater than$200.00 and a manufacturer code which starts with ‗H‘. (Hint: use LIKE)

7. List the company name for all customers who have orders. Don not list a company more than once.

8. List the customer number and the description (from the stock table) of all items ordered by customers with customer numbers 104 – 108. Order the output by customer number and description. (There should be no duplicate rows in your output).

9. List the number of (distinct) customers having an order. Label the column "Total_Customers_with_Orders".

10. For each customer having an order, list the customer number, the number of orders that customer has, the total quantity of items on those orders, and the total price for the items. Order the output by customer number. (Hint: You must use a GROUP BY clause in this query).


***Unique topics include:***

- Be able to access ORACLE/SQL Plus
- simple SQL operations

### Project 2
***The challenges:*** Continuing using items created in Lab 1

1 For each customer, list each stock item ordered, the manufacturer, the quantity ordered, and the total price paid. Include the following columns in the order given below:

- From Customer Table: Company
- From Stock Table: Description
- From the Manufact Table: Manu_Name
- From the Items Table: Quantity, Total Price
- Order the output by Company and Description.

2 List all orders with a shipping date between December 25, 1999 and January 5, 2000

- Include the Order Number, Order Date, Customer company name, Shipping Date.
- Order by Customer Company Name and Order Number.

3 Count the number of customers who do not have any orders placed.

4 List all customers who are ordering equipment whose description begins with ‘tennis’ or ‘volleyball’. Include Customer number, Stock number, Description. Do not repeat any rows.

5 Use the following SQL CREATE commands to CREATE the following tables (Markdown formatting is preventing correct formatting.  See Lab 2 directory for instructions). 

6 Insert the following data into the tables created above using SQL INSERT commands.(Markdown formatting is preventing correct formatting.  See Lab 2 directory for instructions). 

7 Perform the following SQL DELETE statements. Be sure to do them in order. Issue a COMMIT command after all DELETEs have run.

- Try to delete Professor 389. What message do you get?
- Delete Student 2166.
- Now Delete Professor 389. Explain why the first attempt in a. was unsuccessful, and this time the DELETE was successful.
- Submit a listing of the two tables after the deletes have run.

8 Perform the following UPDATE commands. Issue a COMMIT command after all UPDATEs have run. Replace the value of the Prof_ID for Student 4520 with 243. Add 10% to the salary for each professor, Submit a listing of the two tables after the UPDATEs have run.

***Unique topics include:***

- CREATE TABLE, CREATE INDEX, BETWEEN,  DELETE, 
- DISTINCT, GROUP BY, ORDER BY, ADD TABLE, ALTER DATATYPE, 
- DROP, RENAME table, RENAME column, TRUNCATE TABLE, DROP TABLE, PURGE, FLASHBACK, DATE()
- View all tables, View user tables, View table structure, Nested / subquery


### Project 3
***The challenge:***

1 Using the table description and business rules listed below, answer or perform the following:

- Identify the Primary Key of the table as it is currently shown.
- Identify all of the functional dependencies.
- Draw the dependency diagram for the table(s) ( Hint: 1NF see pages 197-198 in Database System text book)

2 Normalize the relation to 3rd Normal Form (3NF).

- List the normalized tables using the standard table notation (remember Chen and/or Crow’s foot)
- Draw the dependency diagrams for each of the tables.( Hint: you should have no less than four tables)
- Provide an E-R Diagram of the tables to be created

3 Using the CREATE TABLE command, create each of the normalized tables. Run a DESCRIBE command for each table.

- Include the PRIMARY KEY constraint for each table.
- Include the FOREIGN KEY constraint for each table to which it applies.
- Include the NOT NULL constraint for Student Name and Instructor Name.
- Include the CHECK constraint for the Grade to ensure it is one of the 5 acceptable values (A, B, C, D, or F).

4 Code INSERT commands to insert the data from the attached page into the tables you created in 2.
Run ‘SELECT * FROM tablename;’ commands to check the contents of your tables.

5 Your submittal/output to hand in should include: ( with no less than ten pages)

- Question 1, part a.: Primary Key columns
- Question 1, part b.: Dependency Diagram
- Question 2, Part a.: List of normalized table descriptions
- Question 2, Part b.: Dependency diagrams for the normalized tables
- Question 2, Part c.: E-R Diagram of the tables to be created( Chen and Crow’s feet)
- Question 2 Part d.: UML Diagrams of the tables to be created
- Question 3: Print out of the CREATE TABLE commands & results.
- Question 3: Print out of the DESCRIBE table commands & resulting SQL message.
- Question 4: Print out of the INSERT commands & Resulting SQL message.
- Question 4: Print out of the SELECT * FROM tablename listing and SQL results.



***Unique topics include:***

- PRIMARY KEY, FOREIGN KEY, NOT NULL, Forms, various dB functions



