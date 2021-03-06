USE [master]
GO
/****** Object:  Database [Social]    Script Date: 08-03-2018 16:22:25 ******/
CREATE DATABASE [Social]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Social', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLSERVEREXPRESS\MSSQL\DATA\Social.mdf' , SIZE = 7360KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Social_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLSERVEREXPRESS\MSSQL\DATA\Social_log.ldf' , SIZE = 1072KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Social] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Social].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Social] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Social] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Social] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Social] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Social] SET ARITHABORT OFF 
GO
ALTER DATABASE [Social] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Social] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Social] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Social] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Social] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Social] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Social] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Social] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Social] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Social] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Social] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Social] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Social] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Social] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Social] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Social] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Social] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Social] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Social] SET  MULTI_USER 
GO
ALTER DATABASE [Social] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Social] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Social] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Social] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Social] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Social]
GO
/****** Object:  Table [dbo].[Blog]    Script Date: 08-03-2018 16:22:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Blog](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](50) NULL,
	[Descr] [text] NULL,
	[UserId] [int] NULL,
	[CategoryId] [int] NULL,
	[EnableComment] [bit] NULL,
	[CreatedDate] [datetime] NULL DEFAULT (getdate()),
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 08-03-2018 16:22:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Categories](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TEST]    Script Date: 08-03-2018 16:22:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TEST](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Called] [varchar](10) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Users]    Script Date: 08-03-2018 16:22:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Users](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[Name] [varchar](100) NULL,
	[CreatedDate] [datetime] NULL DEFAULT (getdate()),
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Blog] ON 

INSERT [dbo].[Blog] ([ID], [Title], [Descr], [UserId], [CategoryId], [EnableComment], [CreatedDate]) VALUES (101, N'My first blog', N'this is called discription', 1, 1, 1, CAST(N'2018-03-06 20:28:05.087' AS DateTime))
INSERT [dbo].[Blog] ([ID], [Title], [Descr], [UserId], [CategoryId], [EnableComment], [CreatedDate]) VALUES (102, N'My first blog 1', N'this is called discription', 1, 1, 1, CAST(N'2018-03-06 20:28:52.840' AS DateTime))
INSERT [dbo].[Blog] ([ID], [Title], [Descr], [UserId], [CategoryId], [EnableComment], [CreatedDate]) VALUES (103, N'My first blog 2', N'this is called discription', 1, 1, 1, CAST(N'2018-03-06 20:28:57.177' AS DateTime))
INSERT [dbo].[Blog] ([ID], [Title], [Descr], [UserId], [CategoryId], [EnableComment], [CreatedDate]) VALUES (104, N'My first blog 3', N'this is called discription', 1, 1, 1, CAST(N'2018-03-06 20:29:03.047' AS DateTime))
INSERT [dbo].[Blog] ([ID], [Title], [Descr], [UserId], [CategoryId], [EnableComment], [CreatedDate]) VALUES (105, N'My first blog 4', N'this is called discription', 1, 1, 1, CAST(N'2018-03-06 20:29:08.143' AS DateTime))
SET IDENTITY_INSERT [dbo].[Blog] OFF
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([ID], [Name]) VALUES (1, N'Science')
INSERT [dbo].[Categories] ([ID], [Name]) VALUES (2, N'Cooking')
INSERT [dbo].[Categories] ([ID], [Name]) VALUES (3, N'Travelling')
INSERT [dbo].[Categories] ([ID], [Name]) VALUES (4, N'Fiction')
INSERT [dbo].[Categories] ([ID], [Name]) VALUES (5, N'Poetry')
SET IDENTITY_INSERT [dbo].[Categories] OFF
SET IDENTITY_INSERT [dbo].[TEST] ON 

INSERT [dbo].[TEST] ([ID], [Called]) VALUES (1, N'15')
INSERT [dbo].[TEST] ([ID], [Called]) VALUES (2, N'25')
INSERT [dbo].[TEST] ([ID], [Called]) VALUES (3, N'33')
INSERT [dbo].[TEST] ([ID], [Called]) VALUES (4, N'15')
INSERT [dbo].[TEST] ([ID], [Called]) VALUES (5, N'25')
INSERT [dbo].[TEST] ([ID], [Called]) VALUES (6, N'33')
INSERT [dbo].[TEST] ([ID], [Called]) VALUES (7, N'15')
INSERT [dbo].[TEST] ([ID], [Called]) VALUES (9, N'33')
INSERT [dbo].[TEST] ([ID], [Called]) VALUES (10, N'15')
INSERT [dbo].[TEST] ([ID], [Called]) VALUES (13, N'15')
INSERT [dbo].[TEST] ([ID], [Called]) VALUES (14, N'15')
INSERT [dbo].[TEST] ([ID], [Called]) VALUES (15, N'15')
INSERT [dbo].[TEST] ([ID], [Called]) VALUES (17, N'33')
INSERT [dbo].[TEST] ([ID], [Called]) VALUES (18, N'15')
INSERT [dbo].[TEST] ([ID], [Called]) VALUES (20, N'33')
INSERT [dbo].[TEST] ([ID], [Called]) VALUES (21, N'15')
INSERT [dbo].[TEST] ([ID], [Called]) VALUES (24, N'15')
INSERT [dbo].[TEST] ([ID], [Called]) VALUES (26, N'33')
INSERT [dbo].[TEST] ([ID], [Called]) VALUES (27, N'15')
INSERT [dbo].[TEST] ([ID], [Called]) VALUES (29, N'33')
INSERT [dbo].[TEST] ([ID], [Called]) VALUES (31, N'25')
INSERT [dbo].[TEST] ([ID], [Called]) VALUES (34, N'25')
INSERT [dbo].[TEST] ([ID], [Called]) VALUES (36, N'15')
INSERT [dbo].[TEST] ([ID], [Called]) VALUES (38, N'33')
INSERT [dbo].[TEST] ([ID], [Called]) VALUES (8, N'25')
INSERT [dbo].[TEST] ([ID], [Called]) VALUES (22, N'25')
INSERT [dbo].[TEST] ([ID], [Called]) VALUES (30, N'15')
INSERT [dbo].[TEST] ([ID], [Called]) VALUES (33, N'15')
INSERT [dbo].[TEST] ([ID], [Called]) VALUES (11, N'15')
INSERT [dbo].[TEST] ([ID], [Called]) VALUES (12, N'15')
INSERT [dbo].[TEST] ([ID], [Called]) VALUES (16, N'25')
INSERT [dbo].[TEST] ([ID], [Called]) VALUES (19, N'25')
INSERT [dbo].[TEST] ([ID], [Called]) VALUES (23, N'33')
INSERT [dbo].[TEST] ([ID], [Called]) VALUES (25, N'25')
INSERT [dbo].[TEST] ([ID], [Called]) VALUES (28, N'25')
INSERT [dbo].[TEST] ([ID], [Called]) VALUES (32, N'33')
INSERT [dbo].[TEST] ([ID], [Called]) VALUES (35, N'33')
INSERT [dbo].[TEST] ([ID], [Called]) VALUES (37, N'25')
SET IDENTITY_INSERT [dbo].[TEST] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([ID], [Username], [Password], [Name], [CreatedDate]) VALUES (1, N'test', N'test', N'test', CAST(N'2017-04-24 15:34:31.120' AS DateTime))
INSERT [dbo].[Users] ([ID], [Username], [Password], [Name], [CreatedDate]) VALUES (2, N'mylogin', N'mylogin', N'Test', CAST(N'2017-04-26 12:15:56.643' AS DateTime))
INSERT [dbo].[Users] ([ID], [Username], [Password], [Name], [CreatedDate]) VALUES (3, N'anantvir', N'test', N'Anantvir Singh', CAST(N'2018-03-06 20:30:47.023' AS DateTime))
SET IDENTITY_INSERT [dbo].[Users] OFF
/****** Object:  StoredProcedure [dbo].[SP_CREATE_BLOG]    Script Date: 08-03-2018 16:22:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_CREATE_BLOG]
(
	@Title VARCHAR(50), 
	@Descr TEXT,
	@UserId INT,
	@CategoryId INT,
	@EnableComment BIT
)
AS
BEGIN

	INSERT INTO Blog (
	Title,
	Descr,
	UserId,
	CategoryId,
	EnableComment
	)
	VALUES
	(
	@Title,
	@Descr,
	@UserId,
	@CategoryId,
	@EnableComment
	)

	SELECT Blog.*, Categories.Name FROM Blog
	INNER JOIN Categories
	ON Blog.CategoryId = Categories.ID
	WHERE UserId = @UserId
	ORDER BY Blog.ID DESC
END


GO
/****** Object:  StoredProcedure [dbo].[SP_CREATE_USER]    Script Date: 08-03-2018 16:22:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_CREATE_USER]
(
	@Name VARCHAR(50) = NULL,
	@Username VARCHAR(50) = NULL,
	@Password VARCHAR(50) = NULL,
	@ID INT OUTPUT
)
AS
BEGIN

	DECLARE @RecordCount INT;

	SELECT @RecordCount = COUNT(*) FROM Users 
	WHERE Users.Username = @Username
	AND Users.Password = @Password

	IF(@RecordCount>0)
	BEGIN
		SET @ID = 0;
	END
	ELSE
	BEGIN
		INSERT INTO Users(Name, Password, Username)
		VALUES(@Name, @Password, @Username)
		SET @ID = IDENT_CURRENT('[dbo].[Users]');
	END
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GET_BLOG]    Script Date: 08-03-2018 16:22:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_GET_BLOG]
(
	@UserId INT
)
AS
BEGIN
	SELECT Blog.*, Categories.Name FROM Blog
	INNER JOIN Categories
	ON Blog.CategoryId = Categories.ID
	WHERE UserId = @UserId
	ORDER BY Blog.ID DESC
END	
GO
/****** Object:  StoredProcedure [dbo].[SP_GET_CATEGORIES]    Script Date: 08-03-2018 16:22:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_GET_CATEGORIES]
AS
BEGIN
	SELECT * FROM Categories
END
GO
/****** Object:  StoredProcedure [dbo].[SP_TEST_ENTRY]    Script Date: 08-03-2018 16:22:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_TEST_ENTRY]
(
	@Test VARCHAR(10)
)
AS
BEGIN
	INSERT INTO dbo.TEST(Called) VALUES(@Test)
END
GO
/****** Object:  StoredProcedure [dbo].[SP_VALIDATE_USER]    Script Date: 08-03-2018 16:22:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[SP_VALIDATE_USER]
(
	@Username VARCHAR(50),
	@Password VARCHAR(50)
)
AS 
BEGIN
	SELECT TOP(1) * FROM Users
	WHERE Username = @Username AND [Password] = @Password
END

EXEC SP_VALIDATE_USER 'test', 'test'

CREATE TABLE TEST (ID INT IDENTITY(1,1), Called VARCHAR(10))
INSERT INTO dbo.TEST(Called) VALUES('t')

select * from test

TRUNCATE TABLE test  

GO
USE [master]
GO
ALTER DATABASE [Social] SET  READ_WRITE 
GO
