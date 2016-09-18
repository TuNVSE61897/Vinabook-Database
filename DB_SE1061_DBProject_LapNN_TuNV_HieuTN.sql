
		-- NGO NHU LAP - SE61640 --
		-- NGUYEN VIET TU -- SE61897 --
		-- TRAN NHO HIEU -- SE61591 --
		-- Assignment 19/06/2015 --


USE Assignment

		----- CONSTRAINTS AND TRIGGERS -----

-- Constraint for Number of bought books (must be equal of lower than the real esxisting books)

IF OBJECT_ID('tr_basket_quantiy','TR')is not null
drop trigger tr_batket_quantity

GO
CREATE TRIGGER tr_batket_quantity 
ON Basket
for insert, update
AS 
	BEGIN
		DECLARE @quantity int;
		SELECT @quantity = quantity FROM inserted
		IF(@quantity > (SELECT ExistingNumber FROM BookStore))
		BEGIN
			PRINT'Number Book in store not enough'
			ROLLBACK TRANSACTION
			
		END; 
	END;
	
-- Constraint for Sale-Off (must be equal or greater than 0 and equal or lower than 100)

ALTER TABLE BookStore
 drop constraint co_BookSaleOff
ALTER TABLE BookStore
 ADD CONSTRAINT co_BookSaleOff check( SaleOff >= 0 AND SaleOff<=100)
 
 -- Constraint for Sell Price (must be equal to the difference between price and price multiply by sale-off portion)
 
GO
ALTER TABLE BookStore
	DROP CONSTRAINT C_sellPrice_book
GO
DECLARE @sellPrice INT
SET @sellPrice=(SELECT (b.Price - b.Price*bs.SaleOff/100) AS Sell
				FROM Book b, BookStore bs
				WHERE b.ID=bs.BookID)
GO		
ALTER TABLE BookStore
ADD CONSTRAINT C_sellPrice_book
CHECK (SellPrice= @sellPrice)

 
		----- PROCEDURE -----
 
 -- Procedure to select all bought books

GO	
	CREATE PROCEDURE pr_selectBook_InBasket @basketID int
	AS 
		BEGIN
			SELECT bo.Name, bo.ID, ba.Quantity
			FROM Basket ba, Book bo
			WHERE ba.BookID = bo.ID
				AND ba.ID = @basketID
		END;
		
-- Procedure to find all books by given name

GO
	CREATE PROCEDURE pr_find_withBookName @bookName nvarchar(30)
	AS	
		BEGIN
			SELECT *
			FROM Book	
			WHERE Name = @bookName
		END;
		
-- Procedure to find all books with given author name

GO
	CREATE PROCEDURE pr_find_withAuthorName @AuName nvarchar(30)
	AS	
		BEGIN
			SELECT Distinct bo.Name
			FROM 	BookAuthor ba, Author au, Book bo
			WHERE ba.AuthorID = au.ID
				AND bo.ID = ba.BookID
				AND au.Name = @AuName
		END;
		
-- Procedure to find all books with given genre name

GO
	CREATE PROCEDURE pr_find_withGenresName @GenresName nvarchar(30)
	AS	
		BEGIN
			SELECT Distinct bo.Name
			FROM 	ListBook lb, Genres gen, Book bo
			WHERE bo.ID = lb.BookID
				AND gen.ID = lb.GenresID
				AND gen.NameOfGenres = @GenresName
		END;
		
-- Procedure to find all books with given publisher name

GO
	CREATE PROCEDURE pr_find_withPublisherName @pubName nvarchar(30)
	AS	
		BEGIN
			SELECT Distinct bo.Name
			FROM 	Publisher pu, Book bo
			WHERE pu.ID = bo.PublisherID
			AND pu.Name = @pubName
		END;		
		
-- Procedure to find all books of the given store

IF OBJECT_ID('p_allBook', 'P') IS NOT NULL
	DROP PROCEDURE p_allBook
GO
CREATE PROCEDURE p_allBook @StoreID INT
AS
SELECT *
FROM BookStore
WHERE @StoreID=StoreID

-- Procedure to sum cost of bill

IF OBJECT_ID('p_Sum_Bill', 'P') IS NOT NULL
	DROP PROCEDURE p_Sum_Bill
GO
CREATE PROCEDURE p_Sum_Bill @BillID INT
AS
SELECT SUM((b.Quantity*bo.SellPrice))
FROM Basket b, BookStore bo
WHERE b.BookID=bo.BookID
	AND @BillID=b.ID

  
 