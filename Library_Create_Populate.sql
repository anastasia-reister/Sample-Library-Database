/*==============================CREATING TABLES=========================*/
CREATE TABLE LIBRARY_BRANCH (
	BranchID INT NOT NULL PRIMARY KEY IDENTITY (1,1),
	BranchName VARCHAR(50),
	BranchAddress VARCHAR(100)
	);

CREATE TABLE PUBLISHER (
	PublisherName VARCHAR(50) NOT NULL PRIMARY KEY,
	PublisherAddress VARCHAR(100),
	PublisherPhone VARCHAR(25)
);

CREATE TABLE BOOKS (
	BookID INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	BookTitle VARCHAR(50),
	PublisherName VARCHAR(50) NOT NULL CONSTRAINT fk_PublisherName FOREIGN KEY REFERENCES PUBLISHER(PublisherName) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE BOOK_AUTHORS (
	BookID INT NOT NULL CONSTRAINT fk_BookID_Book_Author FOREIGN KEY REFERENCES BOOKS(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
	AuthorName VARCHAR(50) NOT NULL
);

CREATE TABLE BOOK_COPIES (
	BookID INT NOT NULL CONSTRAINT fk_BookID_Book_Copies FOREIGN KEY REFERENCES BOOKS(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
	BranchID INT NOT NULL CONSTRAINT fk_BrachID_Book_Copies FOREIGN KEY REFERENCES LIBRARY_BRANCH(BranchID) ON UPDATE CASCADE ON DELETE CASCADE,
	Number_Of_Copies INT NOT NULL
);
CREATE TABLE BORROWER (
	CardNo INT NOT NULL PRIMARY KEY IDENTITY (1000000,1),
	BorrowerName VARCHAR(50) NOT NULL,
	BorrowerAddress VARCHAR(100) NOT NULL,
	BorrowerPhone VARCHAR (25) NOT NULL
);

CREATE TABLE BOOK_LOANS (
	BookID INT NOT NULL CONSTRAINT fk_BookID_Book_Loans FOREIGN KEY REFERENCES BOOKS(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
	BranchID INT NOT NULL CONSTRAINT fk_BrachID_Book_Loans FOREIGN KEY REFERENCES LIBRARY_BRANCH(BranchID) ON UPDATE CASCADE ON DELETE CASCADE,
	CardNo INT NOT NULL CONSTRAINT fk_CardNo FOREIGN KEY REFERENCES BORROWER(CardNo) ON UPDATE CASCADE ON DELETE CASCADE,
	DateOut DATE NOT NULL,
	DateDUE DATE NOT NULL
);



/*==============================================*/

/*===============POPULATING LIBRARY DB===============*/


INSERT INTO LIBRARY_BRANCH 
	(BranchName,BranchAddress)
	VALUES
	('Sharpstown','711-2880 Nulla Street Seattle WA 11526'),
	('Central','3727 Ullamcorper Street Seattle WA 11523'),
	('Queen Anne','859 Sit Road Seattle WA 11564'),
	('BellTown','8679 Sodales Av Avenue Seattle WA 11566'),
	('First Hill','3279 Viverra Avenue Seattle WA 11572'),
	('Ballard','7292 Dictum Avenue Seattle WA 11598')
;
INSERT INTO PUBLISHER
	(PublisherName, PublisherAddress, PublisherPhone)
	VALUES
	('Penguin', '347-7666 Iaculis St. Woodruff SC 49854','(468) 353-2641'),
	('Eksmo', '4366 Lacinia Avenue Idaho Falls Ohio 19253', '(248) 675-4007'),
	('Inkvoice', '2546 Sociosqu Road Bethlehem Utah 02913', '(939) 353-1107'),
	('Telegraph', '193 Ullamcorper Avenue Amesbury HI 93373', '(302) 259-2375')
	;

INSERT INTO BOOKS
	(BookTitle,PublisherName)
	VALUES
	('The Lost Tribe', 'Penguin'),
	('2132: Polaris', 'Inkvoice'),
	('Children Of Venus', 'Telegraph'),
	('Too Much Broccoli', 'Eksmo'),
	('Teddy Loves It',  'Penguin'),
	('The Mother-Knot', 'Penguin'),
	('Burger-Of-The-Day', 'Eksmo'),
	('Red', 'Inkvoice'),
	('Not Today', 'Inkvoice'),
	('Shining', 'Telegraph'),
	('Christine', 'Telegraph'),
	('Lion King', 'Eksmo'),
	('Zarathustra', 'Penguin'),
	('Of Human Bondage', 'Eksmo'),
	('Leviathan', 'Eksmo'),
	('Fahrenheit 451', 'Penguin'),
	('Crime and Punishment', 'Eksmo'),
	('Old Man And The Sea', 'Penguin'),
	('Nausea', 'Inkvoice'),
	('Metamorphosis', 'Telegraph')
	;

INSERT INTO BOOK_AUTHORS
	(BookID, AuthorName)
	VALUES
	(1, 'Mark Lee'),
	(2, 'Andrew Dwyer'),
	(3, 'Pam Beasley'),
	(4, 'Bob Belcher'),
	(5, 'Ted Baker'),
	(6, 'Michael Scott'),
	(7, 'James Halpert'),
	(8, 'Rachel Green'),
	(9, 'Chandler Bing'),
	(10, 'Stephen King'),
	(11, 'Stephen King'),
	(12, 'William Shakespeare'),
	(13, 'Friedrich Nitzsche'),
	(14, 'Somerset Maugham'),
	(15, 'Thomas Hobbs'),
	(16, 'Ray Bradburry'),
	(17, 'Fyodor Dostoevsky'),
	(18, 'Ernst Hamingway'),
	(19, 'Jean-Paul Sartre'),
	(20, 'Friedrich Nitzsche')
	;
	
INSERT INTO  BOOK_COPIES 
(BranchID, BookID, Number_Of_Copies)
VALUES
(1, 1, 5),
(1, 3, 4),
(1, 5, 3),
(1, 7, 5),
(1, 9, 5),
(1, 11, 5),
(1, 13, 5),
(1, 15, 5),
(1, 17, 5),
(1, 19, 5),

(2, 2, 2),
(2, 4, 3),
(2, 6, 3),
(2, 8, 3),
(2, 10, 3),
(2, 12, 3),
(2, 14, 3),
(2, 16, 3),
(2, 18, 3),
(2, 20, 3),
	
(3, 1, 2),
(3, 2, 3),
(3, 3, 3),
(3, 4, 3),
(3, 5, 3),
(3, 6, 3),
(3, 7, 3),
(3, 8, 3),
(3, 9, 3),
(3, 10, 3),

(4, 11, 2),
(4, 12, 3),
(4, 13, 3),
(4, 14, 3),
(4, 15, 3),
(4, 16, 3),
(4, 17, 3),
(4, 18, 3),
(4, 19, 3),
(4, 20, 3)
;

INSERT INTO BORROWER
(BorrowerName, BorrowerAddress, BorrowerPhone)
VALUES
('David Mathews','1011 Malesuada Road, Moscow Kentucky 77382', '(357) 616-5411'),
('Xyla Cash', '969-1762 Tincidunt Road, Boise CT 35282', '(121) 347-0086'),
('Griffith Daniels', '6818 Eget Street, Tacoma AL 92508', '(425) 288-2332'),
('Anne Beasley', '987-4223 Urna Street, Savannah Illinois 85794', '(145) 987-4962'),
('Daniel Bernard', 'P.O. Box 567 1561 Duis Road, Pomona TN 08609', '(750) 558-3965'),
('Seth Farley', '6216 Aenean Avenue, Seattle Utah 81202', '(888) 106-8550'),
('Lee Preston', '981 Eget Road, Clemson GA 04645', '(221) 156-5026'),
('Merritt Watson', 'P.O. Box 686 7014 Amet Street, Corona Oklahoma 55246', '(622) 594-1662'),
('Katelyn Cooper','6059 Sollicitudin Road Burlingame Colorado 26278', '(414) 876-0865'),
('Lacy Eaton', '1379 Nulla. Avenue Asbury Park Montana 69679', '(932) 726-8645'),
('McKenzie Hernandez','Ap #367-674 Mi Street Greensboro VT 40684', '(168) 222-1592'),
('Haviva Holcomb', 'P.O. Box 642 3450 In Road Isle of Palms New York 03828', '(896) 303-1164')
;

INSERT INTO BOOK_LOANS
(BookID, BranchID, CardNo, DateOut, DateDUE)
VALUES
(1, 1, 1000000, '20180206', '20180306'),
(3, 1, 1000000, '20180306', '20180406'),
(5, 1, 1000000, '20180406', '20180506'),
(7, 1, 1000000, '20180606', '20180706'),
(9, 1, 1000000, '20180706', '20180806'),
(2, 2, 1000001, '20180206', '20180306'),
(4, 2, 1000001, '20180306', '20180406'),
(6, 2, 1000001, '20180406', '20180506'),
(8, 2, 1000001, '20180606', '20180706'),
(10, 2, 1000001, '20180706', '20180806'),
(1, 3, 1000002, '20180206', '20180306'),
(2, 3, 1000002, '20180206', '20180306'),
(3, 3, 1000002, '20180306', '20180406'),
(4, 3, 1000002, '20180406', '20180506'),
(5, 3, 1000002, '20180606', '20180706'),
(11, 4, 1000003, '20180206', '20180306'),
(12, 4, 1000003, '20180206', '20180306'),
(13, 4, 1000003, '20180406', '20180506'),
(14, 4, 1000003, '20180206', '20180306'),
(15, 4, 1000003, '20180406', '20180506'),
(11, 1, 1000004, '20180206', '20180306'),
(13, 1, 1000004, '20180406', '20180506'),
(15, 1, 1000004, '20180206', '20180306'),
(17, 1, 1000004, '20180206', '20180306'),
(19, 1, 1000004, '20180206', '20180306'),
(12, 2, 1000005, '20180206', '20180306'),
(14, 2, 1000005,'20180206', '20180306'),
(16, 2, 1000005, '20180206', '20180306'),
(18, 2, 1000005, '20180206', '20180306'),
(20, 2, 1000005, '20180406', '20180506'),
(6, 3, 1000006, '20180206', '20180306'),
(7, 3, 1000006, '20180606', '20180706'),
(8, 3, 1000006, '20180206', '20180306'),
(9, 3, 1000006, '20180706', '20180806'),
(10, 3, 1000006, '20180606', '20180706'),
(16, 4, 1000007, '20180206', '20180306'),
(17, 4, 1000007, '20180406', '20180506'),
(18, 4, 1000007, '20180306', '20180406'),
(19, 4, 1000007, '20180406', '20180506'),
(20, 4, 1000007, '20180306', '20180406'),
(9, 1, 1000008, '20180206', '20180306'),
(11, 1, 1000008, '20180206', '20180306'),
(13, 1, 1000008, '20180406', '20180506'),
(15, 1, 1000008, '20180706', '20180806'),
(17, 1, 1000008, '20180606', '20180706'),
(4, 2, 1000009, '20180206', '20180306'),
(6, 2, 1000009, '20180406', '20180506'),
(8, 2, 1000009, '20180606', '20180706'),
(10, 2, 1000009, '20180706', '20180806'),
(12, 2, 1000009, '20180206', '20180306'),
(11, 1, 1000000, '20180206', '20180306'),
(14, 2, 1000009, '20180206', '20180306')
;

/*===================LIBRARY QUERIES===================*/

/*1.) How many copies of the book titled "The Lost Tribe" are owned by the library branch whose name is "Sharpstown"?*/

GO
CREATE PROC Copies_Of_Lost_Tribe_Sharpstown
AS
BEGIN
	SELECT Number_OF_Copies AS 'Number of Copies', BookTitle, BranchName AS 'Branch Name'
		FROM BOOK_COPIES
		INNER JOIN BOOKS ON BOOK_COPIES.BookID = BOOKS.BookID
		INNER JOIN LIBRARY_BRANCH ON BOOK_COPIES.BranchID = LIBRARY_BRANCH.BranchID
		WHERE BookTitle LIKE '%The Lost Tribe%' AND BranchName LIKE '%Sharpstown%'
		;
END
GO
	/*2.) How many copies of the book titled "The Lost Tribe" are owned by each library branch?*/
CREATE PROC Copies_Of_Lost_Tribe_Each_Branch
AS
BEGIN
	SELECT Number_Of_Copies, BranchName
		FROM BOOK_COPIES
		INNER JOIN BOOKS ON BOOK_COPIES.BookID = BOOKS.BookID
		INNER JOIN LIBRARY_BRANCH ON BOOK_COPIES.BranchID = LIBRARY_BRANCH.BranchID
		WHERE BookTitle LIKE '%The Lost Tribe%'
		; 
END
GO
	/*3.) Retrieve the names of all borrowers who do not have any books checked out.*/
CREATE PROC Borrowers_No_Books
AS
BEGIN
	SELECT BorrowerName
	FROM BORROWER
	FULL OUTER JOIN BOOK_LOANS ON BORROWER.CardNo = BOOK_LOANS.CardNo
	WHERE BookID IS NULL /*or any field from BOOK_LOANS Table*/
END
GO
	/*4.) For each book that is loaned out from the "Sharpstown" branch and whose DueDate is today, 
	retrieve the book title, the borrower's name, and the borrower's address.*/

	/*I chose a different date since the population instructions didn't specify any particular date*/
CREATE PROC Due_Date_20180506
AS
BEGIN
	SELECT BorrowerName, BorrowerAddress, BookTitle
	FROM BORROWER
	INNER JOIN BOOK_LOANS ON BORROWER.CardNo = BOOK_LOANS.CardNo
	INNER JOIN BOOKS ON BOOK_LOANS.BookID = BOOKS.BookID
	WHERE DateDUE = '20180506'
END
GO

	/*5.) For each library branch, retrieve the branch name and the total number of books loaned out from that branch.*/
CREATE PROC Books_Loaned_Per_Branch
AS
BEGIN	
	SELECT BranchName, COUNT(*) AS '# Of Copies'
	FROM LIBRARY_BRANCH 
	INNER JOIN BOOK_LOANS ON LIBRARY_BRANCH.BranchID = BOOK_LOANS.BranchID
	GROUP BY BranchName
END
GO
	/*6.) Retrieve the names, addresses, and the number of books checked out for 
	all borrowers who have more than five books checked out.*/
CREATE PROC Borrowers_5books
AS
BEGIN
	SELECT BorrowerName, BorrowerAddress, Count(*) AS '# Of Copies'
	FROM BORROWER
	INNER JOIN BOOK_LOANS ON BORROWER.CardNo = BOOK_LOANS.CardNo
	GROUP BY BorrowerName, BorrowerAddress
	HAVING Count(*) > 5
END
GO
	/* 7.) For each book authored (or co-authored) by "Stephen King", retrieve the title and the number 
	of copies owned by the library branch whose name is "Central".*/
CREATE PROC Stephen_King_Books
AS
BEGIN
	SELECT BookTitle, Number_Of_Copies
	FROM BOOK_COPIES
	INNER JOIN BOOKS ON BOOK_COPIES.BookID = Books.BookID
	INNER JOIN BOOK_AUTHORS ON BOOK_COPIES.BookID = BOOK_AUTHORS.BookID
	INNER JOIN LIBRARY_BRANCH ON LIBRARY_BRANCH.BranchID = BOOK_COPIES.BranchID
	WHERE AuthorName LIKE '%Stephen King%' AND BranchName = 'Central'
END
GO

/*SELECT * FROM BOOK_LOANS;
SELECT * FROM BORROWER;
SELECT * FROM BOOK_COPIES;
SELECT * FROM BOOK_AUTHORS;
SELECT * FROM Books;
SELECT * FROM publisher;
SELECT * FROM LIBRary_branch;
*/

EXEC [dbo].[Books_Loaned_Per_Branch];
EXEC [dbo].[Borrowers_5books];
EXEC [dbo].[Borrowers_No_Books];
EXEC [dbo].[Copies_Of_Lost_Tribe_Each_Branch];
EXEC [dbo].[Copies_Of_Lost_Tribe_Sharpstown];
EXEC [dbo].[Due_Date_20180506];
EXEC [dbo].[Stephen_King_Books]; 