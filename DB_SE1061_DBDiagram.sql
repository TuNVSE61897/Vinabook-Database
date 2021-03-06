USE [Assignment]
GO
/****** Object:  Table [dbo].[User]    Script Date: 06/19/2015 09:16:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](30) NULL,
	[Email] [nvarchar](50) NULL,
	[NumPhone] [int] NULL,
	[Address] [nvarchar](50) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Store]    Script Date: 06/19/2015 09:16:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Store](
	[Name] [nvarchar](50) NULL,
	[ID] [int] NOT NULL,
	[Address] [nvarchar](50) NULL,
 CONSTRAINT [PK_Store] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Publisher]    Script Date: 06/19/2015 09:16:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Publisher](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](30) NULL,
 CONSTRAINT [PK_Publisher] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Author]    Script Date: 06/19/2015 09:16:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Author](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](30) NULL,
	[BirthDate] [date] NULL,
 CONSTRAINT [PK_Author] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Genres]    Script Date: 06/19/2015 09:16:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Genres](
	[ID] [int] NOT NULL,
	[NameOfGenres] [nvarchar](20) NULL,
 CONSTRAINT [PK_Genres] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Book]    Script Date: 06/19/2015 09:16:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Book](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](30) NULL,
	[Price] [int] NULL,
	[PublisherID] [int] NULL,
 CONSTRAINT [PK_Book] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[pr_find_withBookName]    Script Date: 06/19/2015 09:16:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[pr_find_withBookName] @bookName nvarchar(30)
	AS	
		BEGIN
			SELECT *
			FROM Book	
			WHERE Name = @bookName
		END;
--PROCEDURE find all book with Name
GO
/****** Object:  Table [dbo].[ListBook]    Script Date: 06/19/2015 09:16:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ListBook](
	[ID] [int] NOT NULL,
	[ListName] [nvarchar](30) NULL,
	[BookID] [int] NOT NULL,
	[GenresID] [int] NOT NULL,
	[Translator] [nvarchar](30) NULL,
 CONSTRAINT [PK_BookGenres] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BookStore]    Script Date: 06/19/2015 09:16:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookStore](
	[BookID] [int] NOT NULL,
	[StoreID] [int] NOT NULL,
	[ExistingNumber] [int] NULL,
	[SaleOff] [int] NULL,
	[SellPrice] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BookAuthor]    Script Date: 06/19/2015 09:16:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookAuthor](
	[BookID] [int] NULL,
	[AuthorID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Basket]    Script Date: 06/19/2015 09:16:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Basket](
	[ID] [int] NOT NULL,
	[BookID] [int] NULL,
	[StoreID] [int] NULL,
	[Quantity] [int] NULL,
 CONSTRAINT [PK_Basket] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[pr_selectBook_InBasket]    Script Date: 06/19/2015 09:16:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[pr_selectBook_InBasket] @basketID int
	AS 
		BEGIN
			SELECT bo.Name, bo.ID, ba.Quantity
			FROM Basket ba, Book bo
			WHERE ba.BookID = bo.ID
				AND ba.ID = @basketID
		END;
GO
/****** Object:  Table [dbo].[Bill]    Script Date: 06/19/2015 09:16:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bill](
	[BasketID] [int] NULL,
	[UserID] [int] NULL,
	[Sum] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  ForeignKey [FK_Basket_Book]    Script Date: 06/19/2015 09:16:54 ******/
ALTER TABLE [dbo].[Basket]  WITH CHECK ADD  CONSTRAINT [FK_Basket_Book] FOREIGN KEY([BookID])
REFERENCES [dbo].[Book] ([ID])
GO
ALTER TABLE [dbo].[Basket] CHECK CONSTRAINT [FK_Basket_Book]
GO
/****** Object:  ForeignKey [FK_Basket_Store]    Script Date: 06/19/2015 09:16:54 ******/
ALTER TABLE [dbo].[Basket]  WITH CHECK ADD  CONSTRAINT [FK_Basket_Store] FOREIGN KEY([StoreID])
REFERENCES [dbo].[Store] ([ID])
GO
ALTER TABLE [dbo].[Basket] CHECK CONSTRAINT [FK_Basket_Store]
GO
/****** Object:  ForeignKey [FK_Bill_Basket]    Script Date: 06/19/2015 09:16:54 ******/
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD  CONSTRAINT [FK_Bill_Basket] FOREIGN KEY([BasketID])
REFERENCES [dbo].[Basket] ([ID])
GO
ALTER TABLE [dbo].[Bill] CHECK CONSTRAINT [FK_Bill_Basket]
GO
/****** Object:  ForeignKey [FK_Bill_User]    Script Date: 06/19/2015 09:16:54 ******/
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD  CONSTRAINT [FK_Bill_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[Bill] CHECK CONSTRAINT [FK_Bill_User]
GO
/****** Object:  ForeignKey [FK_Book_Publisher]    Script Date: 06/19/2015 09:16:54 ******/
ALTER TABLE [dbo].[Book]  WITH CHECK ADD  CONSTRAINT [FK_Book_Publisher] FOREIGN KEY([PublisherID])
REFERENCES [dbo].[Publisher] ([ID])
GO
ALTER TABLE [dbo].[Book] CHECK CONSTRAINT [FK_Book_Publisher]
GO
/****** Object:  ForeignKey [FK_BookAuthor_Author]    Script Date: 06/19/2015 09:16:54 ******/
ALTER TABLE [dbo].[BookAuthor]  WITH CHECK ADD  CONSTRAINT [FK_BookAuthor_Author] FOREIGN KEY([AuthorID])
REFERENCES [dbo].[Author] ([ID])
GO
ALTER TABLE [dbo].[BookAuthor] CHECK CONSTRAINT [FK_BookAuthor_Author]
GO
/****** Object:  ForeignKey [FK_BookAuthor_Book]    Script Date: 06/19/2015 09:16:54 ******/
ALTER TABLE [dbo].[BookAuthor]  WITH CHECK ADD  CONSTRAINT [FK_BookAuthor_Book] FOREIGN KEY([BookID])
REFERENCES [dbo].[Book] ([ID])
GO
ALTER TABLE [dbo].[BookAuthor] CHECK CONSTRAINT [FK_BookAuthor_Book]
GO
/****** Object:  ForeignKey [FK_BookStore_Book]    Script Date: 06/19/2015 09:16:54 ******/
ALTER TABLE [dbo].[BookStore]  WITH CHECK ADD  CONSTRAINT [FK_BookStore_Book] FOREIGN KEY([BookID])
REFERENCES [dbo].[Book] ([ID])
GO
ALTER TABLE [dbo].[BookStore] CHECK CONSTRAINT [FK_BookStore_Book]
GO
/****** Object:  ForeignKey [FK_BookStore_Store]    Script Date: 06/19/2015 09:16:54 ******/
ALTER TABLE [dbo].[BookStore]  WITH CHECK ADD  CONSTRAINT [FK_BookStore_Store] FOREIGN KEY([StoreID])
REFERENCES [dbo].[Store] ([ID])
GO
ALTER TABLE [dbo].[BookStore] CHECK CONSTRAINT [FK_BookStore_Store]
GO
/****** Object:  ForeignKey [FK_BookGenres_Book]    Script Date: 06/19/2015 09:16:54 ******/
ALTER TABLE [dbo].[ListBook]  WITH CHECK ADD  CONSTRAINT [FK_BookGenres_Book] FOREIGN KEY([BookID])
REFERENCES [dbo].[Book] ([ID])
GO
ALTER TABLE [dbo].[ListBook] CHECK CONSTRAINT [FK_BookGenres_Book]
GO
/****** Object:  ForeignKey [FK_BookGenres_Genres]    Script Date: 06/19/2015 09:16:54 ******/
ALTER TABLE [dbo].[ListBook]  WITH CHECK ADD  CONSTRAINT [FK_BookGenres_Genres] FOREIGN KEY([GenresID])
REFERENCES [dbo].[Genres] ([ID])
GO
ALTER TABLE [dbo].[ListBook] CHECK CONSTRAINT [FK_BookGenres_Genres]
GO
