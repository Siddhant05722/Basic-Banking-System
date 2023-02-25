CREATE DATABASE company;
SHOW DATABASES;
USE company;
CREATE TABLE people(first_name varchar(20),last_name varchar(20), age int);
DESC people;
INSERT INTO people(first_name,last_name,age)VALUES('Tina','Belcher',13);
SELECT * FROM people;
INSERT INTO people(first_name,last_name,age)VALUES('Linda','Belcher',45),('Philip','Frond','38'),('Calvin','Fischoeder',70);
DROP TABLE people;


CREATE TABLE employees(id int auto_increment PRIMARY KEY,
last_name varchar(20) NOT NULL,
first_name varchar(20) NOT NULL,
middle_name varchar(10),
age int NOT NULL,
current_status varchar(10) NOT NULL DEFAULT 'employed');
DESC employees;
DROP TABLE employees;


CREATE TABLE cats(cat_id int AUTO_INCREMENT PRIMARY KEY,
name varchar(100),
breed varchar(100),
age int);
DESC cats;
INSERT INTO cats(name,breed,age) VALUES ('Ringo','Tabby',4),
('Cindy','Maine coon', 10),('Dumbledoor','Maine coon',11),('Egg','Persian',4),('Misty','Tabby',13),
('George Micheal','Ragdoll',9),('Jackson','Sphynx',7);
SELECT * FROM cats;
SELECT cat_id FROM cats;
SELECT name,breed FROM cats;
SELECT cat_id,age FROM cats WHERE age = cat_id;
UPDATE cats SET name ='Jack' WHERE name ='Jackson';
UPDATE cats SET breed = 'British Shorthair'  WHERE name = 'Ringo';


SET SQL_SAFE_UPDATES=0;


DELETE FROM cats WHERE age = 4;
DELETE FROM cats WHERE age = cat_id;
DELETE FROM cats;
DROP DATABASE company;


CREATE DATABASE shirt_db;
USE shirt_db;
CREATE TABLE shirts(shirt_id int PRIMARY KEY auto_increment,
article varchar(20),
color varchar(20),
shirt_size varchar(10),
last_worn int);

DESC shirts;

INSERT INTO shirts(article, color, shirt_size, last_worn)VALUES('t-shirt','S','white',10),
('t-shirt','green','S',200),('polo-shirt','black','M',10),('tank top','blue','S',50),('t-shirt','pink','S',0),
('polo-shirt','red','M',5),('tank top','white','S',200),('tank top','blue','M',15);

SELECT * FROM shirts;
INSERT INTO shirts(article, color, shirt_size, last_worn)VALUES('polo-shirt','purple','M',50);
SELECT article,color FROM shirts;
SELECT article,color,shirt_size,last_worn FROM shirts WHERE shirt_size = 'M';
UPDATE shirts SET shirt_size = 'L' WHERE article='polo-shirt';
UPDATE shirts SET last_worn=0 WHERE last_worn=15;
UPDATE shirts SET color = 'off white',shirt_size='XS' WHERE color = 'off white';
UPDATE shirts SET color = 'white',shirt_size = 'S' WHERE shirt_id=1;
DELETE FROM shirts WHERE last_worn < 200;
DROP TABLE shirts;


SELECT SUBSTRING('Hello World',1,4);

CONCAT combine the data for cleaner output.
SELECT CONCAT('H','E','L','L','O');
SELECT CONCAT(shirt_id, color) FROM shirts;

CONCAT_WS #concatnation with seprator
SELECT CONCAT_WS('!','H','E','L','L','O');

SELECT REPLACE('tank top', 'top', ' shirt ');
SELECT REPLACE('color',' ','red')FROM shirts;

SELECT REVERSE('SNIPPETS');
SELECT REVERSE(article)FROM shirts;
SELECT CONCAT(article,REVERSE(article))FROM shirts;

SELECT LENGTH('SIDDHANT');


CREATE TABLE books 
	(
		book_id INT AUTO_INCREMENT,
		title VARCHAR(100),
		author_fname VARCHAR(100),
		author_lname VARCHAR(100),
		released_year INT,
		stock_quantity INT,
		pages INT,
		PRIMARY KEY(book_id)
	);
    
INSERT INTO books (title, author_fname, author_lname, released_year, stock_quantity, pages)
VALUES
('The Namesake', 'Jhumpa', 'Lahiri', 2003, 32, 291),
('Norse Mythology', 'Neil', 'Gaiman',2016, 43, 304),
('American Gods', 'Neil', 'Gaiman', 2001, 12, 465),
('Interpreter of Maladies', 'Jhumpa', 'Lahiri', 1996, 97, 198),
('A Hologram for the King: A Novel', 'Dave', 'Eggers', 2012, 154, 352),
('The Circle', 'Dave', 'Eggers', 2013, 26, 504),
('The Amazing Adventures of Kavalier & Clay', 'Michael', 'Chabon', 2000, 68, 634),
('Just Kids', 'Patti', 'Smith', 2010, 55, 304),
('A Heartbreaking Work of Staggering Genius', 'Dave', 'Eggers', 2001, 104, 437),
('Coraline', 'Neil', 'Gaiman', 2003, 100, 208),
('What We Talk About When We Talk About Love: Stories', 'Raymond', 'Carver', 1981, 23, 176),
("Where I'm Calling From: Selected Stories", 'Raymond', 'Carver', 1989, 12, 526),
('White Noise', 'Don', 'DeLillo', 1985, 49, 320),
('Cannery Row', 'John', 'Steinbeck', 1945, 95, 181),
('Oblivion: Stories', 'David', 'Foster Wallace', 2004, 172, 329),
('Consider the Lobster', 'David', 'Foster Wallace', 2005, 92, 343);

SELECT * FROM books;
INSERT INTO books
    (title, author_fname, author_lname, released_year, stock_quantity, pages)
    VALUES ('10% Happier', 'Dan', 'Harris', 2014, 29, 256), 
           ('fake_book', 'Freida', 'Harris', 2001, 287, 428),
           ('Lincoln In The Bardo', 'George', 'Saunders', 2017, 1000, 367);
SELECT DISTINCT(author_fname) FROM books; 
SELECT DISTINCT CONCAT(author_fname, ' ', author_lname) FROM books;
#DISTINCT is used to return only distinct (different) values.
#IT not prints duplicate values present in row.
SELECT author_fname, author_lname FROM books;
SELECT book_id,author_fname, author_lname FROM books ORDER BY author_fname;
#ORDERBY is used to keep data in alphabetical,int order.(By default ASCENDING ORDER ASC)

SELECT book_id,author_fname, author_lname FROM books ORDER BY 2 DESC;

SELECT REVERSE(UPPER('Why does my cat looak at mewith such hatred?'));
SELECT UPPER('Why does my cat looak at mewith such hatred?');

SELECT book_id,author_fname, author_lname FROM books ORDER BY  author_fname LIMIT 5;
SELECT book_id,author_fname, author_lname FROM books ORDER BY book_id DESC LIMIT 6;
SELECT book_id,author_fname, author_lname FROM books ORDER BY book_id LIMIT 3,8;


#LIKE is used for better searching. %da% is wildcards.

SELECT title, author_fname, author_lname, pages 
FROM books
WHERE pages LIKE '%3%';

SELECT title FROM books WHERE title LIKE '%stories%';
SELECT title,pages FROM books ORDER BY pages DESC LIMIT 1;
SELECT CONCATsummary FROM books ORDER BY summary  LIMIT 3;
SELECT title,author_lname FROM books WHERE author_lname LIKE '% %';
SELECT title,released_year,stock_quantity FROM books ORDER BY stock_quantity LIMIT 3;
SELECT title,author_lname FROM books ORDER BY 2,1;
SELECT CONCAT('MY FAVORITE AUTHOR IS ',
        UPPER(author_fname),
        ' ',
        UPPER(author_lname),
        '!'
    ) AS yell
FROM books ORDER BY author_lname;

SELECT COUNT(*) FROM books;
#COUNT use the COUNT function to get the number of rows for a particular group in the table.
SELECT COUNT(DISTINCT author_fname) FROM books;
SELECT COUNT(title) FROM books WHERE title LIKE '%the%';

#GROUP BY, groups rows that have the same values into summary rows.
SELECT author_lname FROM books GROUP BY author_lname;

SELECT MIN(released_year) FROM books;
SELECT title, pages FROM books WHERE pages = (SELECT MAX(pages) FROM books);
SELECT title, released_year FROM books WHERE released_year = (SELECT MIN(released_year) FROM books);

SELECT CONCAT(author_lname,' ', author_fname), MIN(released_year) FROM books GROUP BY author_fname, author_lname;
SELECT author_lname, MAX(released_year), MIN(released_year) FROM books GROUP BY author_lname;

SELECT SUM(released_year) FROM books;
SELECT AVG(released_year) FROM books;


SELECT count(*) FROM books;
SELECT released_year, count(*) FROM books GROUP BY released_year;
SELECT stock_quantity, count(*) FROM books;
SELECT AVG(released_year) FROM books GROUP BY author_fname,author_lname;
SELECT CONCAT(author_fname, ' ', author_lname) AS author, pages FROM books
WHERE pages = (SELECT MAX(pages) FROM books);

CREATE table contacts(supplier_ID int AUTO_INCREMENT PRIMARY KEY,
						name varchar(255)NOT NULL,
                        phone varchar(15) NOT NULL UNIQUE,
                        address varchar(255)NOT NULL);
