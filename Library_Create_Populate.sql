CREATE DATABASE Library
Go
USE Library
GO
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
	BookID INT NOT NULL PRIMARY KEY IDENTITY(0,1),
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
	(2, 'Mark Lee'),
	(3, 'Andrew Dwyer'),
	(4, 'Pam Beasley'),
	(5, 'Bob Belcher'),
	(6, 'Ted Baker'),
	(7, 'Michael Scott'),
	(8, 'James Halpert'),
	(9, 'Rachel Green'),
	(10, 'Chandler Bing'),
	(11, 'Stephen King'),
	(12, 'Stephen King'),
	(13, 'William Shakespeare'),
	(14, 'Friedrich Nitzsche'),
	(15, 'Somerset Maugham'),
	(16, 'Thomas Hobbs'),
	(17, 'Ray Bradburry'),
	(18, 'Fyodor Dostoevsky'),
	(19, 'Ernst Hamingway'),
	(20, 'Jean-Paul Sartre'),
	(21, 'Friedrich Nitzsche')
	;
	
	INSERT INTO  BOOK_COPIES 
	(BranchID, BookID, Number_Of_Copies)
	VALUES
	(1, 2, 5),
	(1, 4, 4),
	(1, 6, 3),
	(1, 8, 5),
	(1, 10, 5),
	(1, 12, 5),
	(1, 14, 5),
	(1, 16, 5),
	(1, 18, 5),
	(1, 20, 5),

	(2, 3, 2),
	(2, 5, 3),
	(2, 7, 3),
	(2, 9, 3),
	(2, 11, 3),
	(2, 13, 3),
	(2, 15, 3),
	(2, 17, 3),
	(2, 19, 3),
	(2, 21, 3),
	
	(3, 2, 2),
	(3, 3, 3),
	(3, 4, 3),
	(3, 5, 3),
	(3, 6, 3),
	(3, 7, 3),
	(3, 8, 3),
	(3, 9, 3),
	(3, 10, 3),
	(3, 11, 3),

	(4, 12, 2),
	(4, 13, 3),
	(4, 14, 3),
	(4, 15, 3),
	(4, 16, 3),
	(4, 17, 3),
	(4, 18, 3),
	(4, 19, 3),
	(4, 20, 3),
	(4, 21, 3)
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
	(2, 1, 1000000, '20180206', '20180306'),
	(4, 1, 1000000, '20180306', '20180406'),
	(6, 1, 1000000, '20180406', '20180506'),
	(8, 1, 1000000, '20180606', '20180706'),
	(10, 1, 1000000, '20180706', '20180806'),
	(3, 2, 1000001, '20180206', '20180306'),
	(5, 2, 1000001, '20180306', '20180406'),
	(7, 2, 1000001, '20180406', '20180506'),
	(9, 2, 1000001, '20180606', '20180706'),
	(11, 2, 1000001, '20180706', '20180806'),
	(2, 3, 1000002, '20180206', '20180306'),
	(3, 3, 1000002, '20180206', '20180306'),
	(4, 3, 1000002, '20180306', '20180406'),
	(5, 3, 1000002, '20180406', '20180506'),
	(6, 3, 1000002, '20180606', '20180706'),
	(12, 4, 1000003, '20180206', '20180306'),
	(13, 4, 1000003, '20180206', '20180306'),
	(14, 4, 1000003, '20180406', '20180506'),
	(15, 4, 1000003, '20180206', '20180306'),
	(16, 4, 1000003, '20180406', '20180506'),
	(12, 1, 1000004, '20180206', '20180306'),
	(14, 1, 1000004, '20180406', '20180506'),
	(16, 1, 1000004, '20180206', '20180306'),
	(18, 1, 1000004, '20180206', '20180306'),
	(20, 1, 1000004, '20180206', '20180306'),
	(13, 2, 1000005, '20180206', '20180306'),
	(15, 2, 1000005,'20180206', '20180306'),
	(17, 2, 1000005, '20180206', '20180306'),
	(19, 2, 1000005, '20180206', '20180306'),
	(21, 2, 1000005, '20180406', '20180506'),
	(7, 3, 1000006, '20180206', '20180306'),
	(8, 3, 1000006, '20180606', '20180706'),
	(9, 3, 1000006, '20180206', '20180306'),
	(10, 3, 1000006, '20180706', '20180806'),
	(11, 3, 1000006, '20180606', '20180706'),
	(17, 4, 1000007, '20180206', '20180306'),
	(18, 4, 1000007, '20180406', '20180506'),
	(19, 4, 1000007, '20180306', '20180406'),
	(20, 4, 1000007, '20180406', '20180506'),
	(21, 4, 1000007, '20180306', '20180406'),
	(10, 1, 1000008, '20180206', '20180306'),
	(12, 1, 1000008, '20180206', '20180306'),
	(14, 1, 1000008, '20180406', '20180506'),
	(16, 1, 1000008, '20180706', '20180806'),
	(18, 1, 1000008, '20180606', '20180706'),
	(5, 2, 1000009, '20180206', '20180306'),
	(7, 2, 1000009, '20180406', '20180506'),
	(9, 2, 1000009, '20180606', '20180706'),
	(11, 2, 1000009, '20180706', '20180806'),
	(13, 2, 1000009, '20180206', '20180306'),
	(12, 1, 1000000, '20180206', '20180306'),
	(15, 2, 1000009, '20180206', '20180306')
	;


/*===================LIBRARY QUERIES===================*/

/*1.) How many copies of the book titled "The Lost Tribe" are owned by the library branch whose name is "Sharpstown"?*/
USE Library
GO

CREATE PROC Library_queries
AS
BEGIN
	SELECT Number_OF_Copies AS 'Number of Copies', BookTitle, BranchName AS 'Branch Name'
		FROM BOOK_COPIES
		INNER JOIN BOOKS ON BOOK_COPIES.BookID = BOOKS.BookID
		INNER JOIN LIBRARY_BRANCH ON BOOK_COPIES.BranchID = LIBRARY_BRANCH.BranchID
		WHERE BookTitle LIKE '%The Lost Tribe%' AND BranchName LIKE '%Sharpstown%'
		;

	/*2.) How many copies of the book titled "The Lost Tribe" are owned by each library branch?*/

	SELECT Number_Of_Copies, BranchName
		FROM BOOK_COPIES
		INNER JOIN BOOKS ON BOOK_COPIES.BookID = BOOKS.BookID
		INNER JOIN LIBRARY_BRANCH ON BOOK_COPIES.BranchID = LIBRARY_BRANCH.BranchID
		WHERE BookTitle LIKE '%The Lost Tribe%'
		; 

	/*3.) Retrieve the names of all borrowers who do not have any books checked out.*/

	SELECT BorrowerName
	FROM BORROWER
	FULL OUTER JOIN BOOK_LOANS ON BORROWER.CardNo = BOOK_LOANS.CardNo
	WHERE BookID IS NULL /*or any field from BOOK_LOANS Table*/

	/*4.) For each book that is loaned out from the "Sharpstown" branch and whose DueDate is today, 
	retrieve the book title, the borrower's name, and the borrower's address.*/

	/*I chose a different date since the population instructions didn't specify any particular date*/

	SELECT BorrowerName, BorrowerAddress, BookTitle
	FROM BORROWER
	INNER JOIN BOOK_LOANS ON BORROWER.CardNo = BOOK_LOANS.CardNo
	INNER JOIN BOOKS ON BOOK_LOANS.BookID = BOOKS.BookID
	WHERE DateDUE = '20180506'


	/*5.) For each library branch, retrieve the branch name and the total number of books loaned out from that branch.*/
	SELECT BranchName, COUNT(*) AS '# Of Copies'
	FROM LIBRARY_BRANCH 
	INNER JOIN BOOK_LOANS ON LIBRARY_BRANCH.BranchID = BOOK_LOANS.BranchID
	GROUP BY BranchName

	/*6.) Retrieve the names, addresses, and the number of books checked out for 
	all borrowers who have more than five books checked out.*/

	SELECT BorrowerName, BorrowerAddress, Count(*) AS '# Of Copies'
	FROM BORROWER
	INNER JOIN BOOK_LOANS ON BORROWER.CardNo = BOOK_LOANS.CardNo
	GROUP BY BorrowerName, BorrowerAddress
	HAVING Count(*) > 5

	/* 7.) For each book authored (or co-authored) by "Stephen King", retrieve the title and the number 
	of copies owned by the library branch whose name is "Central".*/

	SELECT BookTitle, Number_Of_Copies
	FROM BOOK_COPIES
	INNER JOIN BOOKS ON BOOK_COPIES.BookID = Books.BookID
	INNER JOIN BOOK_AUTHORS ON BOOK_COPIES.BookID = BOOK_AUTHORS.BookID
	INNER JOIN LIBRARY_BRANCH ON LIBRARY_BRANCH.BranchID = BOOK_COPIES.BranchID
	WHERE AuthorName LIKE '%Stephen King%' AND BranchName = 'Central'
END

