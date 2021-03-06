USE [master]
GO

CREATE DATABASE [PRN292_1]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PRN292_1', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\PRN292_1.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'PRN292_1_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\PRN292_1_log.ldf' , SIZE = 1088KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [PRN292_1] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PRN292_1].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PRN292_1] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PRN292_1] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PRN292_1] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PRN292_1] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PRN292_1] SET ARITHABORT OFF 
GO
ALTER DATABASE [PRN292_1] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PRN292_1] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PRN292_1] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PRN292_1] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PRN292_1] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PRN292_1] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PRN292_1] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PRN292_1] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PRN292_1] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PRN292_1] SET  ENABLE_BROKER 
GO
ALTER DATABASE [PRN292_1] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PRN292_1] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PRN292_1] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PRN292_1] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PRN292_1] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PRN292_1] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PRN292_1] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PRN292_1] SET RECOVERY FULL 
GO
ALTER DATABASE [PRN292_1] SET  MULTI_USER 
GO
ALTER DATABASE [PRN292_1] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PRN292_1] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PRN292_1] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PRN292_1] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PRN292_1] SET DELAYED_DURABILITY = DISABLED 
GO
USE [PRN292_1]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 7/24/2021 9:07:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[username] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[type] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Cart]    Script Date: 7/24/2021 9:07:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[cartID] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](50) NULL,
	[productID] [int] NULL,
	[quantity] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Comment]    Script Date: 7/24/2021 9:07:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[commentID] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](50) NULL,
	[productID] [int] NULL,
	[createdOn] [datetime] NOT NULL,
	[content] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[commentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Coupon]    Script Date: 7/24/2021 9:07:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Coupon](
	[discountCode] [varchar](10) NOT NULL,
	[username] [nvarchar](50) NULL,
	[percent] [int] NOT NULL,
	[createdOn] [datetime] NOT NULL,
	[expiryDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[discountCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Order]    Script Date: 7/24/2021 9:07:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Order](
	[orderID] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](50) NULL,
	[discountCode] [varchar](10) NULL,
	[deliverAddress] [nvarchar](max) NOT NULL,
	[phone] [varchar](10) NOT NULL,
	[createdOn] [datetime] NOT NULL,
	[status] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[orderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 7/24/2021 9:07:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[orderDetailID] [int] IDENTITY(1,1) NOT NULL,
	[orderID] [int] NULL,
	[productID] [int] NULL,
	[quantity] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[orderDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product]    Script Date: 7/24/2021 9:07:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[productID] [int] IDENTITY(1,1) NOT NULL,
	[productCategoryID] [int] NULL,
	[productName] [nvarchar](max) NOT NULL,
	[price] [real] NOT NULL,
	[quantity] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[productID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProductCategory]    Script Date: 7/24/2021 9:07:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCategory](
	[productCategoryID] [int] IDENTITY(1,1) NOT NULL,
	[productCategoryName] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[productCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProductDetail]    Script Date: 7/24/2021 9:07:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductDetail](
	[productDetailID] [int] IDENTITY(1,1) NOT NULL,
	[productID] [int] NULL,
	[origin] [nvarchar](max) NOT NULL,
	[ingredients] [nvarchar](max) NOT NULL,
	[netWeight] [int] NOT NULL,
	[description] [nvarchar](max) NOT NULL,
	[imageLink] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[productDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserDetail]    Script Date: 7/24/2021 9:07:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserDetail](
	[username] [nvarchar](50) NOT NULL,
	[fullname] [nvarchar](max) NULL,
	[email] [nvarchar](max) NOT NULL,
	[phone] [varchar](10) NULL,
	[address] [nvarchar](max) NULL,
	[imageLink] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Account] ([username], [password], [type]) VALUES (N'da', N'123', 4)
INSERT [dbo].[Account] ([username], [password], [type]) VALUES (N'DUPI', N'123', 3)
INSERT [dbo].[Account] ([username], [password], [type]) VALUES (N'mra', N'123', 3)
INSERT [dbo].[Account] ([username], [password], [type]) VALUES (N'mrb', N'123', 3)
INSERT [dbo].[Account] ([username], [password], [type]) VALUES (N'mrc', N'123', 3)
INSERT [dbo].[Account] ([username], [password], [type]) VALUES (N'sa', N'123', 2)
INSERT [dbo].[Account] ([username], [password], [type]) VALUES (N'Shop', N'123', 1)
INSERT [dbo].[Account] ([username], [password], [type]) VALUES (N'HuyHieu', N'123', 3)
INSERT [dbo].[Account] ([username], [password], [type]) VALUES (N'TheRealHuyHieu', N'123', 3)
SET IDENTITY_INSERT [dbo].[Cart] ON 

INSERT [dbo].[Cart] ([cartID], [username], [productID], [quantity]) VALUES (40, N'sa', 2, 1)
INSERT [dbo].[Cart] ([cartID], [username], [productID], [quantity]) VALUES (41, N'sa', 3, 2)
INSERT [dbo].[Cart] ([cartID], [username], [productID], [quantity]) VALUES (42, N'sa', 4, 3)
INSERT [dbo].[Cart] ([cartID], [username], [productID], [quantity]) VALUES (43, N'DA', 34, 3)
INSERT [dbo].[Cart] ([cartID], [username], [productID], [quantity]) VALUES (40, N'sa', 2, 1)
INSERT [dbo].[Cart] ([cartID], [username], [productID], [quantity]) VALUES (41, N'sa', 3, 2)
INSERT [dbo].[Cart] ([cartID], [username], [productID], [quantity]) VALUES (42, N'sa', 4, 3)
INSERT [dbo].[Cart] ([cartID], [username], [productID], [quantity]) VALUES (43, N'DA', 34, 3)
SET IDENTITY_INSERT [dbo].[Cart] OFF
SET IDENTITY_INSERT [dbo].[Comment] ON 

INSERT [dbo].[Comment] ([commentID], [username], [productID], [createdOn], [content]) VALUES (1, N'HuyHieu', 4, CAST(N'2021-03-20 00:00:00.000' AS DateTime), N'Nice Chocolate,')
INSERT [dbo].[Comment] ([commentID], [username], [productID], [createdOn], [content]) VALUES (3, N'MinhDuc', 3, CAST(N'2021-02-02 00:00:00.000' AS DateTime), N'Good')
INSERT [dbo].[Comment] ([commentID], [username], [productID], [createdOn], [content]) VALUES (4, N'HuyHieu', 3, CAST(N'2021-04-03 04:49:59.760' AS DateTime), N'123')
SET IDENTITY_INSERT [dbo].[Comment] OFF
INSERT [dbo].[Coupon] ([discountCode], [username], [percent], [createdOn], [expiryDate]) VALUES (N'ABCQWEASDT', N'shop', 20, CAST(N'2021-03-19 00:00:00.000' AS DateTime), CAST(N'2021-04-01 00:00:00.000' AS DateTime))
INSERT [dbo].[Coupon] ([discountCode], [username], [percent], [createdOn], [expiryDate]) VALUES (N'ZJVNFDSTRG', N'DUPI', 10, CAST(N'2021-03-14 00:00:00.000' AS DateTime), CAST(N'2021-04-20 00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([orderID], [username], [discountCode], [deliverAddress], [phone], [createdOn], [status]) VALUES (1, N'HuyHieu', NULL, N'Dai Hoc FPT,Hoa Lac', N'0369662341', CAST(N'2021-04-02 00:25:01.213' AS DateTime), N'deliver')
INSERT [dbo].[Order] ([orderID], [username], [discountCode], [deliverAddress], [phone], [createdOn], [status]) VALUES (5, N'HuyHieu', NULL, N'Hà Nội', N'0369662341', CAST(N'2021-04-02 00:25:01.213' AS DateTime), N'complete')
INSERT [dbo].[Order] ([orderID], [username], [discountCode], [deliverAddress], [phone], [createdOn], [status]) VALUES (7, N'HuyHieu', NULL, N'Hà Nội', N'0987654321', CAST(N'2021-04-02 00:25:01.213' AS DateTime), N'rejectHidden')
INSERT [dbo].[Order] ([orderID], [username], [discountCode], [deliverAddress], [phone], [createdOn], [status]) VALUES (8, N'HuyHieu', NULL, N'Hà Nội', N'0987654321', CAST(N'2021-04-02 00:25:01.213' AS DateTime), N'reject')
INSERT [dbo].[Order] ([orderID], [username], [discountCode], [deliverAddress], [phone], [createdOn], [status]) VALUES (9, N'HuyHieu', NULL, N'Hà Nội ', N'0987654321', CAST(N'2021-04-02 00:25:01.213' AS DateTime), N'request')
INSERT [dbo].[Order] ([orderID], [username], [discountCode], [deliverAddress], [phone], [createdOn], [status]) VALUES (12, N'MinhDuc', NULL, N'Hà Nội', N'0987654321', CAST(N'2021-04-02 00:25:01.213' AS DateTime), N'cancelAccept')
INSERT [dbo].[Order] ([orderID], [username], [discountCode], [deliverAddress], [phone], [createdOn], [status]) VALUES (14, N'MinhDuc', NULL, N'Hà Nội', N'0987654321', CAST(N'2021-04-02 00:25:01.213' AS DateTime), N'cancelReject')
INSERT [dbo].[Order] ([orderID], [username], [discountCode], [deliverAddress], [phone], [createdOn], [status]) VALUES (15, N'MinhDuc', NULL, N'Hà Nội', N'0987654321', CAST(N'2021-04-02 00:25:01.213' AS DateTime), N'cancelRejectHidden')
INSERT [dbo].[Order] ([orderID], [username], [discountCode], [deliverAddress], [phone], [createdOn], [status]) VALUES (16, N'MinhDuc', NULL, N'Hà Nội', N'0987654321', CAST(N'2021-04-02 00:25:01.213' AS DateTime), N'complete')
INSERT [dbo].[Order] ([orderID], [username], [discountCode], [deliverAddress], [phone], [createdOn], [status]) VALUES (47, N'Shop', NULL, N'Ha Noi 1', N'0111111111', CAST(N'2021-07-24 01:09:00.890' AS DateTime), N'request')
SET IDENTITY_INSERT [dbo].[Order] OFF
SET IDENTITY_INSERT [dbo].[OrderDetail] ON 

INSERT [dbo].[OrderDetail] ([orderDetailID], [orderID], [productID], [quantity]) VALUES (11, 1, 2, 3)
INSERT [dbo].[OrderDetail] ([orderDetailID], [orderID], [productID], [quantity]) VALUES (12, 1, 3, 2)
INSERT [dbo].[OrderDetail] ([orderDetailID], [orderID], [productID], [quantity]) VALUES (13, 1, 4, 1)
INSERT [dbo].[OrderDetail] ([orderDetailID], [orderID], [productID], [quantity]) VALUES (14, 1, 5, 5)
INSERT [dbo].[OrderDetail] ([orderDetailID], [orderID], [productID], [quantity]) VALUES (15, 1, 7, 2)
INSERT [dbo].[OrderDetail] ([orderDetailID], [orderID], [productID], [quantity]) VALUES (35, 5, 2, 1)
INSERT [dbo].[OrderDetail] ([orderDetailID], [orderID], [productID], [quantity]) VALUES (36, 5, 3, 6)
INSERT [dbo].[OrderDetail] ([orderDetailID], [orderID], [productID], [quantity]) VALUES (40, 7, 10, 5)
INSERT [dbo].[OrderDetail] ([orderDetailID], [orderID], [productID], [quantity]) VALUES (42, 8, 11, 1)
INSERT [dbo].[OrderDetail] ([orderDetailID], [orderID], [productID], [quantity]) VALUES (43, 8, 19, 1)
INSERT [dbo].[OrderDetail] ([orderDetailID], [orderID], [productID], [quantity]) VALUES (44, 8, 13, 4)
INSERT [dbo].[OrderDetail] ([orderDetailID], [orderID], [productID], [quantity]) VALUES (45, 9, 25, 1)
INSERT [dbo].[OrderDetail] ([orderDetailID], [orderID], [productID], [quantity]) VALUES (46, 9, 21, 3)
INSERT [dbo].[OrderDetail] ([orderDetailID], [orderID], [productID], [quantity]) VALUES (47, 9, 20, 2)
INSERT [dbo].[OrderDetail] ([orderDetailID], [orderID], [productID], [quantity]) VALUES (48, 12, 7, 9)
INSERT [dbo].[OrderDetail] ([orderDetailID], [orderID], [productID], [quantity]) VALUES (49, 15, 3, 4)
INSERT [dbo].[OrderDetail] ([orderDetailID], [orderID], [productID], [quantity]) VALUES (50, 14, 2, 7)
INSERT [dbo].[OrderDetail] ([orderDetailID], [orderID], [productID], [quantity]) VALUES (52, 14, 5, 2)
INSERT [dbo].[OrderDetail] ([orderDetailID], [orderID], [productID], [quantity]) VALUES (53, 15, 7, 3)
INSERT [dbo].[OrderDetail] ([orderDetailID], [orderID], [productID], [quantity]) VALUES (54, 16, 9, 4)
SET IDENTITY_INSERT [dbo].[OrderDetail] OFF
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([productID], [productCategoryID], [productName], [price], [quantity]) VALUES (2, 1, N'Mangosteen- 1kg', 6, 20)
INSERT [dbo].[Product] ([productID], [productCategoryID], [productName], [price], [quantity]) VALUES (3, 1, N'Soursop - 800g', 7, 20)
INSERT [dbo].[Product] ([productID], [productCategoryID], [productName], [price], [quantity]) VALUES (4, 1, N'Green grapefruit - 1kg', 3, 20)
INSERT [dbo].[Product] ([productID], [productCategoryID], [productName], [price], [quantity]) VALUES (5, 1, N'Butter wax 034 - 1 kg', 7, 10)
INSERT [dbo].[Product] ([productID], [productCategoryID], [productName], [price], [quantity]) VALUES (7, 1, N'Orange - 1kg', 3.5, 20)
INSERT [dbo].[Product] ([productID], [productCategoryID], [productName], [price], [quantity]) VALUES (8, 1, N'Cherry New Zealand - 500g', 24.99, 14)
INSERT [dbo].[Product] ([productID], [productCategoryID], [productName], [price], [quantity]) VALUES (9, 1, N'Strawberry New Zealand - 250g', 10.95, 12)
INSERT [dbo].[Product] ([productID], [productCategoryID], [productName], [price], [quantity]) VALUES (10, 1, N'Watermelon - 3kg', 18.55, 18)
INSERT [dbo].[Product] ([productID], [productCategoryID], [productName], [price], [quantity]) VALUES (11, 1, N'Coconut', 2, 24)
INSERT [dbo].[Product] ([productID], [productCategoryID], [productName], [price], [quantity]) VALUES (12, 1, N'Cantaloupe - 1.5kg', 9.95, 13)
INSERT [dbo].[Product] ([productID], [productCategoryID], [productName], [price], [quantity]) VALUES (13, 1, N'Kiwi Xanh - 1kg', 9.95, 14)
INSERT [dbo].[Product] ([productID], [productCategoryID], [productName], [price], [quantity]) VALUES (14, 3, N'Dates, Hazelnuts & Pumpkin Seeds Toast for Cheese 100g', 4.25, 16)
INSERT [dbo].[Product] ([productID], [productCategoryID], [productName], [price], [quantity]) VALUES (16, 3, N'Fine English Charcoal Squares for Cheese 125g', 3.95, 12)
INSERT [dbo].[Product] ([productID], [productCategoryID], [productName], [price], [quantity]) VALUES (17, 3, N'Apricots, Pistachios & Sunflower Seeds Toast for', 4.25, 10)
INSERT [dbo].[Product] ([productID], [productCategoryID], [productName], [price], [quantity]) VALUES (18, 3, N'Quince, Pecans & Poppy Seeds Toast for Cheese 100g', 4.25, 15)
INSERT [dbo].[Product] ([productID], [productCategoryID], [productName], [price], [quantity]) VALUES (19, 3, N'Fine English Oatcakes for Cheese 125g', 3.95, 13)
INSERT [dbo].[Product] ([productID], [productCategoryID], [productName], [price], [quantity]) VALUES (20, 3, N'Limnos Barley Rusks 800g', 5.7, 12)
INSERT [dbo].[Product] ([productID], [productCategoryID], [productName], [price], [quantity]) VALUES (21, 3, N'Nairn''s Gluten-Free Oatcakes 213g', 2.02, 13)
INSERT [dbo].[Product] ([productID], [productCategoryID], [productName], [price], [quantity]) VALUES (22, 3, N'Cornish Seaweed Thins Crackers 120g', 3.5, 12)
INSERT [dbo].[Product] ([productID], [productCategoryID], [productName], [price], [quantity]) VALUES (23, 3, N'Cherries, Almonds & Linseeds Toast for Cheese 100g', 4.25, 15)
INSERT [dbo].[Product] ([productID], [productCategoryID], [productName], [price], [quantity]) VALUES (24, 3, N'Plum & Date Ultra Crispy Toast for Cheese 100g', 4.25, 12)
INSERT [dbo].[Product] ([productID], [productCategoryID], [productName], [price], [quantity]) VALUES (25, 3, N'Fig & Sultana Ultra Crispy Toast for Cheese 100g', 4.25, 14)
INSERT [dbo].[Product] ([productID], [productCategoryID], [productName], [price], [quantity]) VALUES (26, 3, N'Nairn''s Fine Milled Oatcakes 218g', 1.5, 40)
INSERT [dbo].[Product] ([productID], [productCategoryID], [productName], [price], [quantity]) VALUES (27, 3, N'Cranberry & Raisin Ultra Crispy Toast for Cheese 100g', 4.25, 30)
INSERT [dbo].[Product] ([productID], [productCategoryID], [productName], [price], [quantity]) VALUES (28, 4, N'Green Tea 30 Tea Bags Single Estate in Tin Tea Caddy 60g', 5.25, 60)
INSERT [dbo].[Product] ([productID], [productCategoryID], [productName], [price], [quantity]) VALUES (30, 4, N'Dragonwell Green Tea by Novus Tea - 15 Tea Pyramids', 5.25, 60)
INSERT [dbo].[Product] ([productID], [productCategoryID], [productName], [price], [quantity]) VALUES (31, 4, N'Organic ''Green Supreme'' Vietnamese Green Tea with Yerba Mate & Siberian Ginseng 16 Tea Bags', 6.99, 60)
INSERT [dbo].[Product] ([productID], [productCategoryID], [productName], [price], [quantity]) VALUES (33, 5, N'Salted Caramel Fudge Vegan Energy Balls by Nutty Nibbles - 4 x 10g Energy Bites (Organic, Gluten Free)', 10, 100)
INSERT [dbo].[Product] ([productID], [productCategoryID], [productName], [price], [quantity]) VALUES (34, 6, N'3 x Vegan Meal Replacement Bars by Human Food - 100% Natural Plant-Based Nutrition Bars 75g', 12.9, 145)
INSERT [dbo].[Product] ([productID], [productCategoryID], [productName], [price], [quantity]) VALUES (134, 2, N'Coffee Arabica', 5.55, 50)
INSERT [dbo].[Product] ([productID], [productCategoryID], [productName], [price], [quantity]) VALUES (135, 2, N'Coffee Bio NaturGreen', 6.75, 50)
INSERT [dbo].[Product] ([productID], [productCategoryID], [productName], [price], [quantity]) VALUES (136, 2, N'Black Tea Rooibos', 5.45, 50)
INSERT [dbo].[Product] ([productID], [productCategoryID], [productName], [price], [quantity]) VALUES (138, 2, N'Honey Sottolestelle', 20.15, 50)
INSERT [dbo].[Product] ([productID], [productCategoryID], [productName], [price], [quantity]) VALUES (139, 2, N'Macha Haru', 4.5, 50)
INSERT [dbo].[Product] ([productID], [productCategoryID], [productName], [price], [quantity]) VALUES (140, 2, N'Sottolestelle Organic Acacia Honey', 20.45, 50)
INSERT [dbo].[Product] ([productID], [productCategoryID], [productName], [price], [quantity]) VALUES (141, 3, N'Purple Cabbage', 2.5, 50)
INSERT [dbo].[Product] ([productID], [productCategoryID], [productName], [price], [quantity]) VALUES (143, 3, N'Green Cabbage', 3.25, 50)
INSERT [dbo].[Product] ([productID], [productCategoryID], [productName], [price], [quantity]) VALUES (144, 3, N'Green Gourd', 2.25, 50)
INSERT [dbo].[Product] ([productID], [productCategoryID], [productName], [price], [quantity]) VALUES (145, 3, N'Green Squash', 2, 50)
INSERT [dbo].[Product] ([productID], [productCategoryID], [productName], [price], [quantity]) VALUES (146, 3, N'Organic Cauliflower', 1.5, 50)
INSERT [dbo].[Product] ([productID], [productCategoryID], [productName], [price], [quantity]) VALUES (147, 3, N'Organic Broccoli', 2, 50)
INSERT [dbo].[Product] ([productID], [productCategoryID], [productName], [price], [quantity]) VALUES (148, 3, N'Tomato Organic', 2, 50)
INSERT [dbo].[Product] ([productID], [productCategoryID], [productName], [price], [quantity]) VALUES (149, 3, N'Organic Baby Carrots', 2.25, 50)
INSERT [dbo].[Product] ([productID], [productCategoryID], [productName], [price], [quantity]) VALUES (150, 5, N'Organic Rice Cake with Tom Yum', 3.25, 50)
SET IDENTITY_INSERT [dbo].[Product] OFF
SET IDENTITY_INSERT [dbo].[ProductCategory] ON 

INSERT [dbo].[ProductCategory] ([productCategoryID], [productCategoryName]) VALUES (1, N'Fruit Organic')
INSERT [dbo].[ProductCategory] ([productCategoryID], [productCategoryName]) VALUES (2, N'Drinks')
INSERT [dbo].[ProductCategory] ([productCategoryID], [productCategoryName]) VALUES (3, N'Organic Food')
INSERT [dbo].[ProductCategory] ([productCategoryID], [productCategoryName]) VALUES (4, N'Green Tea')
INSERT [dbo].[ProductCategory] ([productCategoryID], [productCategoryName]) VALUES (5, N'Energy Snacks')
INSERT [dbo].[ProductCategory] ([productCategoryID], [productCategoryName]) VALUES (6, N'Other...')
SET IDENTITY_INSERT [dbo].[ProductCategory] OFF
SET IDENTITY_INSERT [dbo].[ProductDetail] ON 

INSERT [dbo].[ProductDetail] ([productDetailID], [productID], [origin], [ingredients], [netWeight], [description], [imageLink]) VALUES (39, 2, N'VietNam', N'Calories: 143.
Fat: 1.1g.
Sodium: 13.7mg.
Carbohydrates: 35g.
Fiber: 3.5g.
Protein: 0.8g.', 1000, N'Mangosteen at Organic is carefully selected from Organic''s own farm, ensuring clean, no chemicals, no growth drugs, genetically modified substances. There are many sizes according to weight, meeting all the needs of customers, etc. Mangosteen has gray and rough skin, fresh white flesh, many segments, sour with sweet taste.', N'100.jpg')
INSERT [dbo].[ProductDetail] ([productDetailID], [productID], [origin], [ingredients], [netWeight], [description], [imageLink]) VALUES (40, 3, N'VietNam', N'Vitamins: 25% vitamin C, 32% group C vitamins and Choline.
Minerals: Fe, Ca, Na, Zn, P, K, Mg.
Energy: 66Kcal.
Sugar: 13.54g.', 800, N'Soursop, also known as soursop, na Siam, na gai (two-part nomenclature: Annona muricata) growing area, it can have a height of 3 - 10m, dense, dark leaves, hairless, green around year. Flowers are blue, on the stem. The Siamese Globe is large and has soft spines. The resulting sweet and slightly sour, seeds are black. Soursop trees live in areas with high humidity and have not very cold winters, temperatures below 5 ° C will damage leaves and small branches and temperatures below 3 ° C can cause the plant to die. The soursop tree is planted with fruit trees. The Siamese ball is much larger than custard apple, sometimes weighing up to 6.8 kg (15 lb), maybe in size it is only inferior to the forest custard apple, outside the airport is only distinguished by the camera. Thanks to each rotation, there is a soft, curved thorn, hence the name custard apple.', N'101.jpg')
INSERT [dbo].[ProductDetail] ([productDetailID], [productID], [origin], [ingredients], [netWeight], [description], [imageLink]) VALUES (41, 4, N'VietNam', N'Rich in vitamin C, strengthens immunity. A member of the citrus family, grapefruit is also an excellent source of vitamin C that boosts the body''s resistance. ...', 1000, N'Green skin pomelos at Organic are carefully selected from Organic''s own farm, ensuring clean, no chemicals, no growth drugs, or genetically modified substances. There are many sizes according to weight, meeting the needs of customers, thin peel, large, succulent, sweet, fragrant, ... Organic green skin grapefruit (USDA, EU) fresh green skin - display five trays fruit or offering incense on Tet is very luxurious. In particular, grapefruit can be preserved for a long time, after Tet, it is not afraid of spoiling like other fruits. Pink grapefruit, succulent shrimp, sweet taste, enjoy eating, sisters!', N'102.jpg')
INSERT [dbo].[ProductDetail] ([productDetailID], [productID], [origin], [ingredients], [netWeight], [description], [imageLink]) VALUES (42, 5, N'VietNam', N'Contains high protein, vitamins A, E, C.', 1000, N'Avocado varieties 034 are grown organically, without chemical fertilizers, growth stimulants and toxic substances. Brown rice, fatty, flexible, high nutritional content Avocado contains more than 14 vitamins and minerals including calcium, iron, copper, magnesium, phosphorus, potassium, sodium, zinc manganese and selenium. As one of the very few fruits that have no cholesterol, but contain monounsaturated fat, this is a good fat for the body that helps reduce cholesterol levels. Avocados contain the highest protein content of any other fruit, almost as high as milk. The beauty value in avocado is rich in vitamins A, E, D along with the minerals potassium, phosphorus, sulfur and chlorine, smoothing the skin, anti-aging, promoting the production of collagen.', N'103.jpg')
INSERT [dbo].[ProductDetail] ([productDetailID], [productID], [origin], [ingredients], [netWeight], [description], [imageLink]) VALUES (43, 7, N'VietNam', N'104 micrograms of carotene – an antioxidant vitamin.
30 mg of vitamin C.
10.9 g of starch.
93 mg of potassium.
26 mg of calcium.
9 mg of magnesium.
0.3 g fiber', 1000, N'Orange soup with large fruit, lots of water, attractive sweet aroma. Oranges can be eaten directly or made juice, smoothies, orange essential oil also helps to refresh the spirit. In addition, orange juice is also a very popular beverage. You can easily store the product in the refrigerator to use for desserts in the family, use during breaks at work or carry on trips, picnics...', N'104.jpg')
INSERT [dbo].[ProductDetail] ([productDetailID], [productID], [origin], [ingredients], [netWeight], [description], [imageLink]) VALUES (44, 8, N'New Zealand', N'72g Calories.
1.20g Protein.
0.96g Fat.
0.4g Fiber
15mg Calcium.
0.39mg Iron.
11mg Magnesium.
19mg Phosphorus.', 500, N'1. Cherry New Zealand Cherry New Zealand red outer shell, resulting in stretch, gloss, taste. The results of the shiny New Zealand Cherry are always a product that is especially popular with Vietnamese customers, a specialty company and often used as gifts. 2. The New Zealand Cherry season is only available at the end of the year, from December to February next year. 3. Nutritional value Cherry is an excellent source of vitamin A, is a fruit rich in iron, high in fiber, cholesterol and sodium free, good for the immune system, digestion and skin beauty. Anti-oxidant cherries are great for the heart, muscles protect against cancer and it acts as a pain reliever and reduce inflammation for gout and joint patients. Cherry contains melatonin - a substance that helps regulate sleep so it can help sleep. Cherries are also a healthy snack that kids love. Cherry is likened to "Fruit Diamond", which is a valuable product that customers need to add to their menu. 4. The process of establishing between cherries In New Zealand, the temperature difference between winter and summer is quite high, creating good conditions for Cherry trees to grow and produce the best Cherry in the world. In spring, all varieties of Cherry are rapidly blooming brilliantly, the whole Cherry garden is like a picture with impressive blooming flowers.', N'105.jpg')
INSERT [dbo].[ProductDetail] ([productDetailID], [productID], [origin], [ingredients], [netWeight], [description], [imageLink]) VALUES (48, 9, N'VietNam', N'7.7% carbohydrates
protein with (0.7%)
good fats (0.3%).
vitamin C, manganese, potassium', 250, N'New Zealand strawberries are considered as one of the high-class strawberry varieties grown hydroponically in Da Lat. Unlike French and American varieties grown in net houses, New Zealand strawberries are grown in greenhouses. The difference in habitat and less affected by weather, especially rain, have given this Strawberry certain nutritional values ​​and outstanding characteristics. Some distinctive features of New Zealand strawberries compared to other varieties being grown in Da Lat: - The typical aroma of strawberries: this can be considered the most outstanding feature, this fragrance is only found in Made from imported strawberries - Crispy and sweet flesh: In addition to the aroma, this strawberry also has a sweet taste and very crispy flesh without being spongy. - Eye-catching colors: The beautiful deep red color is often found in strawberries imported directly from Australia and the US. And one more important thing that cannot be ignored is that it is completely free of preservatives. After being harvested this fruit is immediately canned and shipped to stores by air and most of them are shipped and sold by order. Even when stored in a dedicated fruit cabinet, they can only be kept for about 3 days. Because it is so difficult to preserve, most customers who want fresh strawberries to enjoy use the form of pre-ordering to get priority from the stores. Some effects of strawberries on health: Strawberries: Delicious fruits According to oriental medicine, strawberries are sweet, sour, cool, effective in tonic lungs, regulate digestive function, nourish the body , blood cooling, detoxification. Used to treat diseases such as cough due to hot lungs, sore throat, loss of appetite, short urine, urinary urgency, anemia, weakness, cancer, drunkenness...', N'106.jpg')
INSERT [dbo].[ProductDetail] ([productDetailID], [productID], [origin], [ingredients], [netWeight], [description], [imageLink]) VALUES (51, 10, N'VietNam', N'Calories: 30.
Country: 91%
Protein: 0.6 grams.
Carbs: 7.6 grams.
Sugar: 6.2 grams.
Fiber: 0.4 grams.
Fat: 0.2 grams', 3000, N'Watermelon (scientific name: Citrullus lanatus) is a species of plant in the family Cucurbitaceae, a hard-shelled, water-rich fruit, native to southern Africa and the most common fruit. in the family Gourd. Watermelon has a cooling property that can be used as a cooling food on hot summer days. Watermelons are diverse in shape and color. is light green and has lines from top to bottom. The shape is considered with a plane cross-section from the left stem to the tail of the melon. There are the following main forms: oblong shape, oval left shape, round fruit shape. Melon seeds are also very diverse in size (large, medium, small). Seed color is black. Watermelon is indispensable on the altar of ancestors during Tet. It is a material for talented people to carve pictures on the skin of watermelons. Watermelons at Organicfood.vn are organic watermelons that meet USDA and EU certification standards', N'107.jpg')
INSERT [dbo].[ProductDetail] ([productDetailID], [productID], [origin], [ingredients], [netWeight], [description], [imageLink]) VALUES (52, 12, N'VietNam', N'Minerals and vitamins, every 100g of cantaloupe contains: Folic Acid (21 μg), Nianci (0.734 mg), beta-carotene (2020 μg), Magnesium (12 mg), iron (0.21 mg), calcium ( 9mg), vitamin C (36.7 mg), vitamin A (169 μg), energy (34 kcal)', 1500, N'Royal Sea Melon - SeaRoyal is cultivated according to the organic process oriented to meet JAS Japanese standards. Review table, DannyGreen''s Royal Melon - SeaRoyal for sweetness while maintaining high nutritional content. - Origin: Japan. - Form: round, green skin with light veins. - Inside: orange flesh, soft, sweet taste. - Standard / Certification: JAS - Shelf life: Ready to enjoy, better preserved in the refrigerator. - Manufacturer: Seagull ADC According to French researchers, changing the habit of using cantaloupe every day can help us reduce stress and fatigue effectively. The protective outer shell, the inner intestine is always water (88%), the potassium content (300 mg / 100g) is significant, so the cantaloupe has filtering, diuretic, fiber (1g / 100g) properties to help benefit laxative, low in calories (48 Kcal), Beta-Carotene and vitamin C. 1. Cancer prevention: Cantaloupe is a source of polyphenol antioxidants, cancer prevention and immune system booster. of satisfactory disease and various malignancies. 2. Good for the digestive system: The amount of digestive enzymes in cantaloupe is more than that of papaya and mango. In addition, the functional quality should have the effect of market returns and anti-reflection. 3. Prevents Cardiovascular Diseases: Cantaloupe contains antioxidant polyphenols in the form of polyphenols that are used to regulate the formation of nitric oxide, an important quality for the heart and the cardiovascular system. 4. Beauty support: Cantaloupe is good for people to lose weight because it does not contain many calories. We can process a variety of dishes from cantaloupe such as smoothies / juices, to snacks or Western European dishes. This is also a rich source of nutrients containing beta-carotene, folic acid, potassium, vitamins C, A, which helps improve skin and vision. 5. Stress and fatigue: According to legal researchers, in cantaloupe has the Enzyme Superoxyd Dismutase (SOD) that helps improve prolonged physical and mental stress. SOD is considered a more powerful enzyme than other antioxidant vitamins.
', N'108.jpg')
INSERT [dbo].[ProductDetail] ([productDetailID], [productID], [origin], [ingredients], [netWeight], [description], [imageLink]) VALUES (53, 11, N'VietNam', N'Calories: 283.
Protein: 3g.
Carbs: 10g.
Fat: 27g.
Sugar: 5g.
Fiber: 7g.
Manganese: 60% DV.
Selenium: 15% DV.', 1200, N'Coconut, or coconut palm, (two part nomenclature: Cocos nucifera), is a species of tree in the family Arecaceae. It is also the only member of the genus Cocos and is a large, uniaxial tree (sometimes referred to as the areca group) that can grow up to 30 m tall, with single pinnate leaves, petioles and main veins 4–6 m long; lobes with secondary tendons may be 60–90 cm long; accompanying leaves often turn into net sheaths hugging the stem; When the old leaves fall, they leave scars on the stem.
', N'109.jpg')
INSERT [dbo].[ProductDetail] ([productDetailID], [productID], [origin], [ingredients], [netWeight], [description], [imageLink]) VALUES (55, 13, N'New Zealand', N'Kiwi fruit has many polyphenol compounds, phytonutrients, folic acid, vitamins C, E, many minerals such as Ca, Cr, Cu, Fe, Mg, K, Zn, ... A daily kiwi has can help produce micronutrients that protect the body against DNA damage and prevent cancers of the lung, mouth, throat, stomach, colon and esophagus', 1000, N'Green kiwifruit at Organic is imported from reliable, quality-assured sources such as New Zealand, Italy, Japan, France, Australia, Greece and the United States. Green kiwi has oval brown skin, small black seeds, green flesh, very fragrant and sweet when ripe.', N'110.jpg')
INSERT [dbo].[ProductDetail] ([productDetailID], [productID], [origin], [ingredients], [netWeight], [description], [imageLink]) VALUES (56, 139, N'Japan', N'Matcha - organic green tea', 50, N'Haru Matcha Organic is a manufactured matcha powder produced from tea leaves grown under 100% natural conditions, no preservatives, no pesticides, no chemical analysis. Because no color enhancer and natural development are used, Koyamaen Matcha products have a slightly regenerating color of ordinary Matcha products Koyamaen products are premium products carefully selected, very fine powder, color beautiful, when mixed, does it have color leaves (mixed in moderate amount) acrid, low caffeine, high antioxidants, helps beautiful skin, beautiful hair, strengthens resistance, loses weight and helps with spirit illustration grandfather. Koyamaen Haru Matcha Organic Vitamins A, C, E and Niacin, as well as iron, calcium, potassium and sodium are added to give you an energy boost along with 30mg - 40mg of caffeine per serving of powdered green tea (much less than that of green tea powder). with 1 cup of coffee) helps you to be more awake without feeling nervous, tense or upset skin. With Koyamaen Haru Matcha Organic, you can use it for drinking, preparing daily refreshments, cooking tea, making smoothies, making cakes, desserts, Processing daily dishes and beauty cosmetics. .', N'200.jpg')
INSERT [dbo].[ProductDetail] ([productDetailID], [productID], [origin], [ingredients], [netWeight], [description], [imageLink]) VALUES (57, 134, N'Germany', N'100% Arabica coffee', 50, N'Mount Hagen is a famous German coffee shop, established in 1986. Mount Hagen instant owner coffee shop is made from 100% Arabica coffee, selected from the finest coffee beans, returning richness. , natural in taste. This is a cafe type first standard Bio-organic on the world. Mount Hagen is also made in agriculture certified by me 100%. Processing and packaging do not use any additives or preservatives. The raw coffee source of Mount Hagen is cultivated in the mountainous areas exploited in Papua Newguine, completely isolated from pesticides, herbicides, chemical analysis... Mount Hagen is processed by advanced technology. In the world
', N'201.jpg')
INSERT [dbo].[ProductDetail] ([productDetailID], [productID], [origin], [ingredients], [netWeight], [description], [imageLink]) VALUES (58, 135, N'Spain', N'NaturGreen Organic Coffee with 100% Organic', 50, N'NaturGreen Organic Coffee with 100% Organic ingredients, delicious and authentic that only connoisseurs can feel all the flavors in this product. Just mix 1 teaspoon with 150ml of hot water and you have a delicious cup of coffee. - Products are certified organic in Europe - Imported directly from Spain - Can replace regular coffee - The leading brand of Organic Café on the market today', N'202.jpg')
INSERT [dbo].[ProductDetail] ([productDetailID], [productID], [origin], [ingredients], [netWeight], [description], [imageLink]) VALUES (59, 136, N'Japan ', N'100% Black tea South Africa organic', 30, N'With materials imported from South Africa and packaged in Japan under the 100% ORGANICA approval of the J.A.S agricultural organization, you can rest assured. Studies show that in South Africa Red Tea has 50 times more antioxidants Flavornoids than green tea, and is also rich in vitamin C, calcium, iron, potassium, copper, fluoride, manganese, preventing cactus.
BENEFITS OF SOUTH AFRICAN TEA ROOIBOS
。Slight effect on the nervous system Helps regulate sleep, headaches and insomnia mất
。Classify and prevent the accumulation of cholesterol
。Improve blood circulation and regulate blood pressure
。Minimize stomach problems and digestive process such as: nausea, heat, morning certificate
In Japan, many women drink Rooibos tea for the purpose of beautifying their skin, hair, teeth, and preventing joint pain.', N'203.jpg')
INSERT [dbo].[ProductDetail] ([productDetailID], [productID], [origin], [ingredients], [netWeight], [description], [imageLink]) VALUES (64, 138, N'Sicily and Calabria', N'Sottolestelle organic eucalyptus honey', 280, N'Miele di Eucalipto Italiano - Miele di Eucalipto Italiano 280g The pollen of each different flower has different properties and effects. So, although similar to honey, eucalyptus flower honey also carries a few differences - especially the medicinal properties available in the eucalyptus tree. White flower honey contains prebiotics - has the effect of developing beneficial bacteria, supporting and improving the digestive system in the body. Eucalyptus flower honey will be very useful for those suffering from intestinal diseases. + Eucalyptus flower honey has very high antibacterial and antiseptic properties. You can use it for commercial gutter cleaning, burning or exfoliating and skin cleansing. - Sottolestelle eucalyptus honey is produced in Sicily and Calabria, providing nutrients and improving resistance, immunity, preventing diseases such as breath, emotions, inflammation. Bees are raised in the forest of eucalyptus flowers, sucking pollen and getting nectar from white flowers. Nutritional value per 100g Energia 1369 kJ (322 kcal) Grassi 0 g saturi 0 g Carboidrati 80 g zuccheri 80 g Fiber 0 g Proteine ​​0.5 g Sell 0.03 g Effect of Bile Sottolestelle eucalyptus flowers: - Treatment of respiratory diseases. Eucalyptus leaves and oil have been used for generations for respiratory ailments, especially for reducing mucus that causes respiratory inflammation. With colds or symptoms just need to drink eucalyptus flower honey regularly. - Good for the skin. The exceptional natural resistance of eucalyptus becomes a quality system of thought to protect the skin. Eucalyptus flower honey will bring immediate effect. - Control and prevention of diabetes. Eucalyptus honey also energizes the body - especially thanks to its naturally available amount. Ingredients: 100% organic eucalyptus flower honey Instructions for use: - Mix one serving of long lasting flower honey with a glass of water to drink every day. - You can use a lamp to spread it on bread, mix it with tea, and spread it on baked goods. Storage: Adequate when using, keep in a cool, dry place. Or keep it in the fridge. *** Honey should not be given to babies under 12 months old because it can contain bacteria that can be toxic to babies.', N'204.jpg')
INSERT [dbo].[ProductDetail] ([productDetailID], [productID], [origin], [ingredients], [netWeight], [description], [imageLink]) VALUES (67, 140, N'Sottolestelle - Italy', N'100% Organic Acacia Honey', 280, N'Organic Acacia Acacia Honey Sottolestelle - Miele di Acacia Italiano 280g - Acacia flower honey is especially rich in plant substances with strong antioxidant properties such as flavonoids, which help protect the body from cell damage and prevent certain types of cancer. chronic diseases such as heart disease, diabetes, cancer. Sottolestelle Organic Acacia Honey is rich in antioxidants and has antibacterial properties. Acacia honey is dark brown, even slightly red, special and easy to combine. Bees are raised in forest acacia trees, which collect pollen and nectar from the leaves. Nutritional value per 100g Energia 1369 kJ (322 kcal) Grassi 0 g saturi 0 g Carboidrati 80 g zuccheri 80 g Fiber 0 g Proteine ​​0.5 g Sell 0.03 g Some uses , effects of Acacia Acacia Honey: - In addition to the benefits it brings to the body as usual honey such as: therapy, gastrointestinal therapy, sedation, insomnia, heat clearing, relaxation. toxins, anti-aging, reduce wrinkles, remove dead cells, ... - In particular, acacia honey can treat diseases related to the lungs, respiratory tract, especially asthma. Using flower honey is very beneficial for children with the above disease, avoiding the side effects of the drug, but the body is healthy again. - Acacia honey, which has both healing effects, and provides nutrients, helps the body stay healthy and immune better without causing heat in, weight gain, excess sugar or accessories for the body. Not only children but also adults should use it.

', N'205.jpg')
INSERT [dbo].[ProductDetail] ([productDetailID], [productID], [origin], [ingredients], [netWeight], [description], [imageLink]) VALUES (68, 141, N'VietNam', N'100% Purple Cabbage organic', 500, N'Scientific name Brassica oleracea var capitata ruba is a purple mustard plant. Originating from the Mediterranean, now widely grown around the world, suitable for temperate climates and in Vietnam purple cabbage is grown a lot in Da Lat. • Purple cabbage has its color because it is high in anthocyanin polyphenols, which are resistant, protect cells from UV damage and may help reduce the risk of certain cancers. . • In particular, the amount of vitamin C in purple cabbage is 6-8 times higher than in green cabbage, and contains more phytonutrients than green cabbage.', N'300.jpg')
INSERT [dbo].[ProductDetail] ([productDetailID], [productID], [origin], [ingredients], [netWeight], [description], [imageLink]) VALUES (69, 143, N'VietNam', N'100% oganic Green Cabbage', 700, N'In family meals, cabbage is transformed into many delicious dishes by housewives. Boiled cabbage with sweet taste of ginger, sauteed cabbage with tomatoes, crispy sauerkraut, dipped with spicy fish sauce is delicious. More sophisticated, many people also make cabbage salad, cabbage rolls with minced meat to cook soup. Many people only know that cabbage is a healthy, cool, easy-to-eat vegetable, but do not know all its valuable medical values. This leader in cruciferous vegetables contains a very high source of nutrients: about 90% water, 1.8% protein, 5.4% carbohydrates, 1.6% fiber and many minerals and vitamins. precious as calcium, phosphorus, iron, vitamins C, B1, B2... With that advantage, people have put cabbage into beauty, nutrition and healing. More than 60 years ago, researchers discovered that fresh cabbage contains a substance called vitamin U and later, people used fresh cabbage leaves to make medicine to treat ulcers, gastritis and intestinal inflammation. However, vitamin U is an unstable substance, soluble in water, easily oxidized and destroyed at high temperatures. Therefore, to cure diseases, Oriental medicine doctors do not encourage the processing of vegetables too carefully. To get the most out of vitamin U, it''s best to take it in the form of fresh vegetable juice. Not only good for people with stomach ulcers, researchers also recognize that cabbage has the ability to fight breast cancer and colon cancer. This wonderful effect is due to the fact that cabbage contains anti-cancer substances such as sulforaphane, phenethyl isothiocyanate and indole-3-carbinol. However, you should note, cabbage can cause goiter. Therefore, people with thyroid disorders or goiter should not eat a lot of cabbage. In addition, people with severe kidney failure who need hemodialysis should not use it. Currently, with modern farming processes, cabbage is available all year round on vegetable stalls in markets and in supermarkets. You can easily buy and prepare in many ways to suit your family''s taste. To prevent chemical contamination of vegetables, you should buy vegetables from safe vegetable suppliers. In addition, before processing in any form, you should separate each leaf, wash and soak in salt water for about 15 minutes. You should eat cabbage at least twice a week', N'301.jpg')
INSERT [dbo].[ProductDetail] ([productDetailID], [productID], [origin], [ingredients], [netWeight], [description], [imageLink]) VALUES (70, 144, N'VietNam', N'100% Organic Green Gourd', 500, N'The base of blue sky is sweet, cold, has the effect of cooling, detoxifying, diuretic, treating diabetes, diabetes. The base of the owner is as a basic method, safe and nutritious for users. You are as a standard standard owner, safe for users. Even the salted gourd dish is simple, but it is a cool, nutritious and healthy dish. The combination of sky (especially black sesame) makes the dish delicious and complementary. Processing: The gourd is easy to transform into convenient dishes for housewives, can prepare many unique delicious dishes every day.
', N'302.jpg')
INSERT [dbo].[ProductDetail] ([productDetailID], [productID], [origin], [ingredients], [netWeight], [description], [imageLink]) VALUES (71, 145, N'VietNam', N'100% organic green squash', 500, N'Sweet and cool zucchini is often cooked with dried shrimp into a delicious summer soup. In me, zucchini has a lot of substances such as sugar, protit, vitamin E, PP, B1, B2, C, and also has blood, bone, ... Using zucchini as a mask will be extremely useful at work. Brighten skin tone, increase moisture to make skin soft. Zucchini is also used as an effective and safe way to treat melasma. Before making a zucchini mask, you need to prepare a medium squash, save about 50g, 500g of sugar. Method: wash zucchini, store and stew with sugar. When combined, grind and filter out the residue, take only the condensed water and store it in the refrigerator for gradual use. Every day you can drink 1 teaspoon of the above juice, mixed with 200-300ml of filtered water, it will help purify the toxin precursors in the body, the content glands are limited. Besides, applying the juice directly on the melasma area will also quickly erase the traces of unsightly brown spots.', N'303.jpg')
INSERT [dbo].[ProductDetail] ([productDetailID], [productID], [origin], [ingredients], [netWeight], [description], [imageLink]) VALUES (72, 146, N'VietNam', N'Organic Cauliflower', 300, N'Broccoli, also known as cauliflower, is a plant with a tight, spongy and soft white cotton part, surrounded by leaves on the outside, thick, hard leaf blades, the cotton part is used for eating and the leaves are for family cattle. USES • Broccoli has long been known for its nutritional value and health benefits. With low calories and fiber (about 25 calories and 2g of fiber), this is a great dish for people who want to lose weight. Some of the active ingredients in mustard greens have been shown to work very well on the immune system, boosting anti-inflammatory, antimicrobial and antibacterial properties, and treating cervical dysplasia. • Broccoli provides a large amount of antioxidant vitamin C proven to help fight harmful free radicals, boost immunity, prevent infections and prevent cancer. Cauliflower contains many minerals such as manganese, copper, iron and potassium, these trace elements are also indispensable for the activity of enzymes in the body, contributing to the protection of the skeleton, red blood cells and regulation of the blood vessels. harmonize blood pressure. Cauliflower helps strengthen the walls of blood vessels. Some other vitamins help activate anti-inflammatory activity in capillaries and prevent blood vessel damage... HOW TO USE • From cauliflower, we can process into dishes such as: pickled cauliflower, soup. Grilled cauliflower, cauliflower shrimp with coconut milk sauce .. • On cold days, cauliflower soup helps us to warm up the stomach, creating a warm meal for the family • In addition, we can also prepare broccoli. white rice into many other dishes such as: broccoli with shrimp, broccoli soup with beef, broccoli with garlic, ...... Note: it is best to cook cauliflower until just cooked, otherwise the cotton will become mushy and soft. has a very strong smell.', N'304.jpg')
INSERT [dbo].[ProductDetail] ([productDetailID], [productID], [origin], [ingredients], [netWeight], [description], [imageLink]) VALUES (73, 147, N'VietNam', N'Organic Broccoli
', 300, N'PRODUCT INTRODUCTION • Broccoli or broccoli, is a cruciferous plant with large flowers at the top, commonly used as a vegetable. Broccoli is prepared either by steaming or regular cooking, but can also be eaten raw as a raw vegetable in appetizer plates. USES • There are many dishes prepared with broccoli such as pasta with broccoli, broccoli soup, broccoli with shrimp... • We have broccoli with oyster sauce, one protein-rich and very tasty dishes or stir-fried chicken with broccoli, a harmonious combination dish.... • In addition, broccoli is used to make salads, stir-fried meat, stir-fried seafood, helping the dish reduce the amount of food. heat from fat, meat, ensure harmony and balance for meals ... protect plants • Do not put broccoli with fruits because this is a vegetable that is very sensitive to ethylene gas produced from some left tree type.', N'305.jpg')
INSERT [dbo].[ProductDetail] ([productDetailID], [productID], [origin], [ingredients], [netWeight], [description], [imageLink]) VALUES (74, 148, N'VietNam', N'Tomato Organic', 500, N'PRODUCT INTRODUCTION • Tomato is a food vegetable. Forbidden fruit has a green tip, ripens from yellow to red. Tomatoes have a sour taste and are a great food supplement, rich in vitamins C and A, especially the healthy lycopes. USES • Tomatoes have many uses both in terms of healing and beauty. beauty uses of tomatoes such as: anti-aging, brightening skin, protecting skin surface .... • The therapeutic uses of tomatoes are many, limited such as: cancer prevention, inflammatory disease treatment. Chronic liver disease, support for people with inflammation, treatment of cardiovascular disease, treatment of anemia, treatment of chronic diseases, fire, treatment of high blood pressure accompanied by thirst or high blood pressure, bleeding gums ... USES • Tomatoes are the ingredients for delicious ketchup to eat with other dishes such as: tofu with tomato sauce, fried fish with tomato sauce, deep fried with tomatoes,. .... • Tomatoes used as soups such as sweet soup, sour soup, tomato soup or sour soup or tomato soup... • Tomatoes can be eaten raw with salads, or pressed into perfumes. supplement ... USE • One to two tomatoes a day with meals will be very good for your health .... STORAGE • Tomatoes usually ripen very quickly at room temperature.', N'306.jpg')
INSERT [dbo].[ProductDetail] ([productDetailID], [productID], [origin], [ingredients], [netWeight], [description], [imageLink]) VALUES (75, 149, N'VietNam', N'Organic Baby Carrots', 500, N'PRODUCT INTRODUCTION • Carrot is a tuber plant, the tuber is at the tip and pointed at the part, the carrot is usually orange or red, the edible part is often called a tuber but it is actually a part of the eggplant. INDICATIONS • Carrots contain a lot of vitamins A, B, C, especially high vitamin A content, which is good for the eyes, helps to enhance vision, locust vision, these vitamins help metabolism and skin regeneration, increase resistance, prevention and treatment, helps to supplement food, beneficial for colon, supplement can Minh item, clears heat and detoxifies. Commonly used for skin care, dry skin therapy, blackhead fish, fire ... • Carrots can cure diseases such as colds, measles, chickenpox, diarrhea. The essential oil in carrots has a bactericidal effect, the carotene in carrots can be converted into vitamin A to help brighten the eyes, prevent night blindness, dry eyes, externally, carotene also helps prevent cancer. And yet, carrots contain insulin, which reduces blood sugar by 1/3, helping to lower blood pressure, which is a management food for people with diabetes and people with high blood pressure. In addition, coffee contains B bisabolen, which helps to limit production. USE • Everyone knows, carrot is a vegetable that is present in almost every dish because of its complementarity, easy processing and many uses. • If you want to have a clear, bright skin or a healthy sparkling eyes, just squeeze the carrot juice and use it every day. Carrots are used as complementary foods for children. • We can cook countless nutritious dishes from carrots such as: beef cooked with carrots, carrot cream soup, sautéed vegetables with carrots, salmon porridge, or carrot soup as an appetizer. .. carrots are present on all dishes such as braised beef vermicelli, noodle soup, used as kimchi or many different dishes, contributing to the dish more rich, delicious and nutritious ... USE • Every day one carrot is an excellent vitamin supplement that both helps in beauty, strengthens, and magnifies the effect of dangerous diseases. MANAGEMENT PRESENTATION • Store instant coffee in the refrigerator after cutting all the leaves. To make carrots last longer, you can wrap the coffee in a cloth and keep it cool. This way, you can store coffee for more than 2 weeks. Do not wash or shred the coffee when administering. Carrots should only be washed before use. Carrots should not be stored in plastic bags because the moisture of the carrots will escape from the carrots easily. To the end to left the other tree, it will make up ripe carrots. Carrots will soften when left in the air. If the soft, could be be hard back by how to the soak in ice water. When buying carrots, it is best to use them right away or use them within 1-2 weeks, carrots will retain their inherent nutrients.', N'307.jpg')
INSERT [dbo].[ProductDetail] ([productDetailID], [productID], [origin], [ingredients], [netWeight], [description], [imageLink]) VALUES (76, 150, N'Thailand', N'100% organic rice', 100, N'Tom Yum Owner''s Rice Cake is made from organically owned owners by Chita''s owner farm in Thailand, certified by USDA, EU Organic, JAS. Therefore, the product is guaranteed: No chemicals No preservatives No additives No artificial flavors and colors No genetically modified ingredients (NON-GMOs)', N'500.jpg')
SET IDENTITY_INSERT [dbo].[ProductDetail] OFF
INSERT [dbo].[UserDetail] ([username], [fullname], [email], [phone], [address], [imageLink]) VALUES (N'DA', N'Davit', N'da@gmail.com', N'12345678', N'12345678', N'10.png')
INSERT [dbo].[UserDetail] ([username], [fullname], [email], [phone], [address], [imageLink]) VALUES (N'DUPI', N'Dupi', N'dupi@gmail.com', N'0369662341', N'Bắc Ninh', N'11.png')
INSERT [dbo].[UserDetail] ([username], [fullname], [email], [phone], [address], [imageLink]) VALUES (N'mra', N'mra', N'mra@gmail.com', N'0123455421', N'Hà N?i', N'12.jpg')
INSERT [dbo].[UserDetail] ([username], [fullname], [email], [phone], [address], [imageLink]) VALUES (N'mrb', N'mrb', N'mrb@fpt.edu.vn', N'0912312313', N'Hà Nội', N'13.jpg')
INSERT [dbo].[UserDetail] ([username], [fullname], [email], [phone], [address], [imageLink]) VALUES (N'mrc', N'mrc', N'mrc@gmail.com', N'0366966123', N'Hà Nội', N'14.jpg')
INSERT [dbo].[UserDetail] ([username], [fullname], [email], [phone], [address], [imageLink]) VALUES (N'sa', N'Sa', N'sa@gmail.com', N'12345678', N'12345678', N'15.jpg')
INSERT [dbo].[UserDetail] ([username], [fullname], [email], [phone], [address], [imageLink]) VALUES (N'Shop', N'Shop1', N'shop1@gmail.com', N'0369662232', N'Ha Noi 1', N'16.jpg')
INSERT [dbo].[UserDetail] ([username], [fullname], [email], [phone], [address], [imageLink]) VALUES (N'TheRealHuyHieu', N'TheRealHuyHieu', N'hieunhhe141722@fpt.edu.vn', N'0353243680', N'Hòa Lạc 1', N'17.jpg')
INSERT [dbo].[UserDetail] ([username], [fullname], [email], [phone], [address], [imageLink]) VALUES (N'MinhDuc', N'Minh Duc', N'ducvmhe141222@fpt.edu.vn', N'0353243680', N'Hòa Lạc 1', N'17.jpg')

ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_UserDetail1] FOREIGN KEY([username])
REFERENCES [dbo].[UserDetail] ([username])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_UserDetail1]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Account] FOREIGN KEY([username])
REFERENCES [dbo].[Account] ([username])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_Account]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Product] FOREIGN KEY([productID])
REFERENCES [dbo].[Product] ([productID])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_Product]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD FOREIGN KEY([productID])
REFERENCES [dbo].[Product] ([productID])
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD FOREIGN KEY([productID])
REFERENCES [dbo].[Product] ([productID])
GO
ALTER TABLE [dbo].[Comment]  WITH NOCHECK ADD FOREIGN KEY([username])
REFERENCES [dbo].[Account] ([username])
GO
ALTER TABLE [dbo].[Comment]  WITH NOCHECK ADD FOREIGN KEY([username])
REFERENCES [dbo].[Account] ([username])
GO
ALTER TABLE [dbo].[Coupon]  WITH NOCHECK ADD FOREIGN KEY([username])
REFERENCES [dbo].[Account] ([username])
GO
ALTER TABLE [dbo].[Coupon]  WITH NOCHECK ADD FOREIGN KEY([username])
REFERENCES [dbo].[Account] ([username])
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD FOREIGN KEY([discountCode])
REFERENCES [dbo].[Coupon] ([discountCode])
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD FOREIGN KEY([discountCode])
REFERENCES [dbo].[Coupon] ([discountCode])
GO
ALTER TABLE [dbo].[Order]  WITH NOCHECK ADD FOREIGN KEY([username])
REFERENCES [dbo].[Account] ([username])
GO
ALTER TABLE [dbo].[Order]  WITH NOCHECK ADD FOREIGN KEY([username])
REFERENCES [dbo].[Account] ([username])
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD FOREIGN KEY([orderID])
REFERENCES [dbo].[Order] ([orderID])
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD FOREIGN KEY([orderID])
REFERENCES [dbo].[Order] ([orderID])
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD FOREIGN KEY([productID])
REFERENCES [dbo].[Product] ([productID])
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD FOREIGN KEY([productID])
REFERENCES [dbo].[Product] ([productID])
GO
ALTER TABLE [dbo].[Product]  WITH NOCHECK ADD  CONSTRAINT [FK_Product_ProductCategory] FOREIGN KEY([productCategoryID])
REFERENCES [dbo].[ProductCategory] ([productCategoryID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_ProductCategory]
GO
ALTER TABLE [dbo].[ProductDetail]  WITH CHECK ADD FOREIGN KEY([productID])
REFERENCES [dbo].[Product] ([productID])
GO
ALTER TABLE [dbo].[ProductDetail]  WITH CHECK ADD FOREIGN KEY([productID])
REFERENCES [dbo].[Product] ([productID])
GO
USE [master]
GO
ALTER DATABASE [PRN292_1] SET  READ_WRITE 
GO

