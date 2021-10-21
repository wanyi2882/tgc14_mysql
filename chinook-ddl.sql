/* 1. Display all Sales Support Agents with their first name and last name */

SELECT Title, firstName, lastName FROM Employee 
WHERE Title='Sales Support Agent';

/* 2. Display all employees hired between 2002 and 2003, 
and display their first name and last name */

SELECT FirstName, LastName, HireDate FROM Employee 
WHERE HireDate
BETWEEN "2002-01-01" AND "2003-01-01";

SELECT FirstName, LastName, HireDate FROM Employee 
WHERE YEAR(HireDate)
BETWEEN 2002 AND 2003;

/* 3. Display all artists that have the word 'Metal' in their name */

SELECT * FROM Artist
WHERE Name LIKE "%metal%";

/* 4. Display all employees who are in sales (sales manager, sales rep etc.) */

SELECT LastName, FirstName, Title FROM Employee
WHERE Title LIKE "%sales%";

/* 5. Display the titles of all tracks which has the genre "easy listening" */

SELECT Track.Name AS "Track Name", Genre.Name AS "Genre Name" FROM Track
JOIN Genre On
Track.GenreID = Genre.GenreID
WHERE Genre.Name="easy listening";

/* 6. Display all the tracks from all albums along with the genre of each track */
SELECT Album.Title AS "Album Title", Track.Name AS "Track Name", Genre.Name AS "Genre Name"  FROM Track
JOIN Album 
ON Album.AlbumId = Track.AlbumId
JOIN Genre
on Genre.GenreId = Track.GenreId
LIMIT 10 OFFSET 5;

/* 7. Using the Invoice table, show the average payment made for each country */
SELECT BillingCountry, AVG(Total) FROM Invoice
GROUP BY BillingCountry;

/* 8.Using the Invoice table, show the average payment made for each country, 
but only for countries that paid more than $5.50 in total average */
SELECT BillingCountry, AVG(Total) FROM Invoice
GROUP BY BillingCountry
HAVING AVG(Total)>5.5;

/* 9 - Using the Invoice table, show the average payment made for each customer, 
but only for customer reside in Germany and only if that customer has paid more than 10in total */
SELECT Customer.CustomerId, SUM(Total), Country From Invoice
JOIN Customer
ON Customer.CustomerId = Invoice.CustomerId
GROUP BY Customer.CustomerId
HAVING Country="Germany" AND SUM(Total)>10;

/* Correct Answer: */
SELECT CustomerId, BillingCountry, AVG(Total) From Invoice
WHERE BillingCountry = "Germany"
GROUP BY CustomerId
HAVING SUM(Total) > 10;

/* 10 - Display the average length of Jazz song (that is, the genre of the song is Jazz) for each album */
SELECT 
Album.AlbumId, 
Album.Title, 
AVG(Track.Milliseconds),
Genre.Name
FROM Track
JOIN Album ON Track.AlbumId = Album.AlbumId
JOIN Genre ON Track.GenreId = Genre.GenreId
WHERE Genre.Name="Jazz"
GROUP BY Album.AlbumId, Album.Title, Genre.Name;
