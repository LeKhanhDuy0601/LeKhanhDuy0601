USE [master]
GO
/****** Object:  Database [J6Team]    Script Date: 9/8/2023 8:29:10 PM ******/
CREATE DATABASE [J6Team]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'J6Team', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\J6Team.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'J6Team_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\J6Team_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [J6Team] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [J6Team].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [J6Team] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [J6Team] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [J6Team] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [J6Team] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [J6Team] SET ARITHABORT OFF 
GO
ALTER DATABASE [J6Team] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [J6Team] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [J6Team] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [J6Team] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [J6Team] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [J6Team] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [J6Team] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [J6Team] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [J6Team] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [J6Team] SET  ENABLE_BROKER 
GO
ALTER DATABASE [J6Team] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [J6Team] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [J6Team] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [J6Team] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [J6Team] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [J6Team] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [J6Team] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [J6Team] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [J6Team] SET  MULTI_USER 
GO
ALTER DATABASE [J6Team] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [J6Team] SET DB_CHAINING OFF 
GO
ALTER DATABASE [J6Team] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [J6Team] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [J6Team] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [J6Team] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [J6Team] SET QUERY_STORE = OFF
GO
USE [J6Team]
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 9/8/2023 8:29:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[Username] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
	[Fullname] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Photo] [nvarchar](50) NOT NULL,
	[Phone] [nvarchar](10) NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Address]    Script Date: 9/8/2023 8:29:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Address](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Address] [nvarchar](100) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Address] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Authorities]    Script Date: 9/8/2023 8:29:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Authorities](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[RoleId] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_UserRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Brand]    Script Date: 9/8/2023 8:29:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brand](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Logo] [nvarchar](max) NULL,
 CONSTRAINT [PK_Brand] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 9/8/2023 8:29:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[Quantity] [int] NOT NULL,
	[Price] [float] NOT NULL,
	[Color] [int] NOT NULL,
 CONSTRAINT [PK_Cart] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 9/8/2023 8:29:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Color]    Script Date: 9/8/2023 8:29:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Color](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Hex] [varchar](50) NULL,
 CONSTRAINT [PK_Color] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Favorites]    Script Date: 9/8/2023 8:29:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Favorites](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[ProductId] [int] NOT NULL,
	[LikeDate] [date] NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_Favorites] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 9/8/2023 8:29:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[OrderId] [bigint] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Price] [float] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Color] [int] NOT NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 9/8/2023 8:29:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[SaleId] [int] NULL,
	[Address] [nvarchar](max) NOT NULL,
	[Fullname] [nvarchar](100) NOT NULL,
	[Phone] [nvarchar](10) NOT NULL,
	[StatusId] [int] NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OTP]    Script Date: 9/8/2023 8:29:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OTP](
	[Id] [int] NOT NULL,
	[UserId] [nvarchar](50) NOT NULL,
	[Otp] [nchar](10) NOT NULL,
	[Time] [datetime] NOT NULL,
 CONSTRAINT [PK_OTP] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PriceHistory]    Script Date: 9/8/2023 8:29:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PriceHistory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[Price] [float] NOT NULL,
	[Sale] [float] NOT NULL,
	[ChangeDate] [date] NOT NULL,
 CONSTRAINT [PK_PriceHistory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductColor]    Script Date: 9/8/2023 8:29:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductColor](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[ColorId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_ProductColor] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductImg]    Script Date: 9/8/2023 8:29:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductImg](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[Image] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_ProductImg] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 9/8/2023 8:29:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Price] [float] NOT NULL,
	[CreateDate] [date] NOT NULL,
	[Avaliable] [bit] NOT NULL,
	[Sale] [float] NOT NULL,
	[CategoryId] [int] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[BrandId] [int] NOT NULL,
	[MadeIn] [nvarchar](200) NULL,
	[Image] [nvarchar](200) NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 9/8/2023 8:29:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [nvarchar](10) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sale]    Script Date: 9/8/2023 8:29:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sale](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](50) NOT NULL,
	[Value] [float] NOT NULL,
	[SaleDate] [date] NOT NULL,
	[Amount] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Sale] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status]    Script Date: 9/8/2023 8:29:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Phone], [Active]) VALUES (N'admin', N'123', N'Lâm Diễm Thúy', N'thuyldpc02874@gmail.com', N'1660293850249ngjoc.jpg', N'0944694444', 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Phone], [Active]) VALUES (N'admin2', N'123', N'Mai Quốc Bảo', N'baomq@gmail.com', N'default.jpg', N'0944694455', 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Phone], [Active]) VALUES (N'chiwake@123', N'123', N'Nguyễn Đoàn Chí Thức', N'thucnguyen@gmail.com', N'default.jpg', N'0944445987', 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Phone], [Active]) VALUES (N'huynhdat', N'123', N'Huỳnh Văn Đạt', N'huynhdat@gmail.com', N'dat.jpg', N'0944444444', 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Phone], [Active]) VALUES (N'huynhdat123', N'123', N'Huỳnh Văn Đạt', N'quangdat0156@gmail.com', N'abc.jpg', N'0946492294', 0)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Phone], [Active]) VALUES (N'khachhang', N'123', N'Khách Hàng 1', N'khachhang@gmail.com', N'default.jpg', N'0933333333', 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Phone], [Active]) VALUES (N'nv', N'123', N'NgjocNekHiH', N'ngolo122223@gmail.com', N'ngjoc.jpg', N'0899675544', 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Phone], [Active]) VALUES (N'nv1', N'123', N'HeheBoo1', N'ngoloc23@gmail.com', N'1660558123485default.jpg', N'0899764454', 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Phone], [Active]) VALUES (N'tanloc@123', N'123', N'Trương Tấn Lộc', N'locbkafc123@gmail.com', N'1660569070981loc.jpg', N'0943216789', 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Phone], [Active]) VALUES (N'teonv', N'123', N'Nguyễn Văn Tèo', N'teonv@gmail.com', N'default.jpg', N'0944604440', 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Phone], [Active]) VALUES (N'teonv2', N'123', N'Nguyễn Văn Tèo 2', N'teonv2@gmail.com', N'default.jpg', N'0944564440', 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Phone], [Active]) VALUES (N'tesst', N'123', N'tesst', N'linhvlnpc01785@fpt.edu.vn', N'default.jpg', N'0987654321', 1)
GO
SET IDENTITY_INSERT [dbo].[Address] ON 

INSERT [dbo].[Address] ([Id], [Address], [Username]) VALUES (3, N'Cái Răng', N'nv1')
INSERT [dbo].[Address] ([Id], [Address], [Username]) VALUES (4, N'Kiên Giang', N'nv')
INSERT [dbo].[Address] ([Id], [Address], [Username]) VALUES (6, N'Tài Lanh', N'nv')
INSERT [dbo].[Address] ([Id], [Address], [Username]) VALUES (7, N'Cứu', N'nv')
INSERT [dbo].[Address] ([Id], [Address], [Username]) VALUES (15, N'Hà Lội', N'nv')
INSERT [dbo].[Address] ([Id], [Address], [Username]) VALUES (18, N'Cái gì đấy', N'nv1')
SET IDENTITY_INSERT [dbo].[Address] OFF
GO
SET IDENTITY_INSERT [dbo].[Authorities] ON 

INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (1, N'admin', N'DIRE')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (3, N'khachhang', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (5, N'khachhang', N'STAF')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (11, N'admin', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (12, N'admin', N'STAF')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (13, N'huynhdat', N'STAF')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (15, N'tesst', N'DIRE')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (16, N'chiwake@123', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (17, N'admin2', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (18, N'nv', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (19, N'nv1', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (20, N'teonv', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (21, N'teonv2', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (22, N'tesst', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (23, N'chiwake@123', N'DIRE')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (24, N'tanloc@123', N'DIRE')
SET IDENTITY_INSERT [dbo].[Authorities] OFF
GO
SET IDENTITY_INSERT [dbo].[Brand] ON 

INSERT [dbo].[Brand] ([Id], [Name], [Logo]) VALUES (1, N'Maruishi', N'1659780247797logo2.png')
INSERT [dbo].[Brand] ([Id], [Name], [Logo]) VALUES (2, N'TRINX', N'1660556994520TRINX-3.png')
INSERT [dbo].[Brand] ([Id], [Name], [Logo]) VALUES (3, N'VINBIKE', N'1660557038134Vinbike-3.png')
INSERT [dbo].[Brand] ([Id], [Name], [Logo]) VALUES (4, N'MAX', N'1660557051891logo-maxbike.jpg')
INSERT [dbo].[Brand] ([Id], [Name], [Logo]) VALUES (5, N'HITASA', N'1660557062986Hitasa-200.png')
INSERT [dbo].[Brand] ([Id], [Name], [Logo]) VALUES (7, N'HD Soft', N'1659779927318lgg.PNG')
INSERT [dbo].[Brand] ([Id], [Name], [Logo]) VALUES (8, N'HD Soft 2021', N'1659780247797logo2.PNG')
INSERT [dbo].[Brand] ([Id], [Name], [Logo]) VALUES (9, N'Gammax', N'157e101.png')
INSERT [dbo].[Brand] ([Id], [Name], [Logo]) VALUES (10, N'GIANT', N'c60d5eed.png')
INSERT [dbo].[Brand] ([Id], [Name], [Logo]) VALUES (11, N'JAVA', N'14db37d1.png')
INSERT [dbo].[Brand] ([Id], [Name], [Logo]) VALUES (12, N'TOTEM', N'fca5ae1c.png')
INSERT [dbo].[Brand] ([Id], [Name], [Logo]) VALUES (13, N'TWITTER', N'417d3e8a.png')
INSERT [dbo].[Brand] ([Id], [Name], [Logo]) VALUES (14, N'TXED', N'a7d048c6.png')
SET IDENTITY_INSERT [dbo].[Brand] OFF
GO
SET IDENTITY_INSERT [dbo].[Cart] ON 

INSERT [dbo].[Cart] ([Id], [ProductId], [Username], [Quantity], [Price], [Color]) VALUES (18, 2, N'nv', 100, 1000000, 3)
INSERT [dbo].[Cart] ([Id], [ProductId], [Username], [Quantity], [Price], [Color]) VALUES (21, 3, N'nv1', 6, 9272000, 11)
INSERT [dbo].[Cart] ([Id], [ProductId], [Username], [Quantity], [Price], [Color]) VALUES (22, 1, N'nv1', 8, 2000000, 1)
INSERT [dbo].[Cart] ([Id], [ProductId], [Username], [Quantity], [Price], [Color]) VALUES (25, 2, N'nv1', 6, 1000000, 3)
INSERT [dbo].[Cart] ([Id], [ProductId], [Username], [Quantity], [Price], [Color]) VALUES (26, 1, N'admin', 3, 9970000, 1)
INSERT [dbo].[Cart] ([Id], [ProductId], [Username], [Quantity], [Price], [Color]) VALUES (33, 2, N'admin', 1, 1000000, 3)
INSERT [dbo].[Cart] ([Id], [ProductId], [Username], [Quantity], [Price], [Color]) VALUES (34, 11, N'teonv', 1, 97900000, 19)
INSERT [dbo].[Cart] ([Id], [ProductId], [Username], [Quantity], [Price], [Color]) VALUES (36, 2, N'huynhdat', 1, 1000000, 3)
INSERT [dbo].[Cart] ([Id], [ProductId], [Username], [Quantity], [Price], [Color]) VALUES (37, 1, N'huynhdat', 5, 9970000, 1)
INSERT [dbo].[Cart] ([Id], [ProductId], [Username], [Quantity], [Price], [Color]) VALUES (38, 27, N'admin', 1, 5663000, 32)
INSERT [dbo].[Cart] ([Id], [ProductId], [Username], [Quantity], [Price], [Color]) VALUES (39, 30, N'admin', 1, 16614000, 40)
SET IDENTITY_INSERT [dbo].[Cart] OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([Id], [Name]) VALUES (1, N'Xe đạp đường phố')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (2, N'Xe đạp địa hình')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (3, N'Xe đạp thường')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (4, N'Xe đạp đua')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (5, N'Xe đạp gấp')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (7, N'Xe đạp trẻ em')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (8, N'Khung sườn')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (9, N'Xe đạp điện')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (10, N'Xe máy điện')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (11, N'Nón bảo hiểm')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (16, N'Ống bơm')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (17, N'Xe đạp lậu')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (24, N'Khác')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (26, N'Xe Đạp Trẻ Em')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (27, N'Xe Đạp Đường Phố')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Color] ON 

INSERT [dbo].[Color] ([Id], [Name], [Hex]) VALUES (1, N'Xanh', N'#0000FF	')
INSERT [dbo].[Color] ([Id], [Name], [Hex]) VALUES (2, N'Đen', N'#000000	')
INSERT [dbo].[Color] ([Id], [Name], [Hex]) VALUES (3, N'Vàng', N'#FFFF00	')
INSERT [dbo].[Color] ([Id], [Name], [Hex]) VALUES (4, N'Trắng', N'#FFFFFF

')
INSERT [dbo].[Color] ([Id], [Name], [Hex]) VALUES (5, N'Đỏ', N'#FF0000

')
INSERT [dbo].[Color] ([Id], [Name], [Hex]) VALUES (6, N'màu xám', N'#c6b5b5')
INSERT [dbo].[Color] ([Id], [Name], [Hex]) VALUES (7, N'Màu Cam', N'#fe6000')
SET IDENTITY_INSERT [dbo].[Color] OFF
GO
SET IDENTITY_INSERT [dbo].[Favorites] ON 

INSERT [dbo].[Favorites] ([Id], [Username], [ProductId], [LikeDate], [Active]) VALUES (1, N'admin', 1, CAST(N'2022-08-04' AS Date), 1)
INSERT [dbo].[Favorites] ([Id], [Username], [ProductId], [LikeDate], [Active]) VALUES (3, N'admin', 2, CAST(N'2022-08-05' AS Date), 0)
INSERT [dbo].[Favorites] ([Id], [Username], [ProductId], [LikeDate], [Active]) VALUES (4, N'admin', 3, CAST(N'2022-08-04' AS Date), 1)
INSERT [dbo].[Favorites] ([Id], [Username], [ProductId], [LikeDate], [Active]) VALUES (5, N'huynhdat', 1, CAST(N'2022-08-04' AS Date), 1)
SET IDENTITY_INSERT [dbo].[Favorites] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 

INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity], [Color]) VALUES (2, 2, 1, 1200, 12, 3)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity], [Color]) VALUES (4, 2, 2, 2400, 5, 3)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity], [Color]) VALUES (6, 3, 1, 1200, 1, 4)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity], [Color]) VALUES (11, 6, 2, 2400000, 1, 3)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity], [Color]) VALUES (12, 8, 1, 1222222, 1, 4)
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [SaleId], [Address], [Fullname], [Phone], [StatusId]) VALUES (1, N'admin', CAST(N'2022-08-04T00:00:00.000' AS DateTime), NULL, N'Kiên Giang', N'Võ Lê Nhật Linh', N'0944694449', 2)
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [SaleId], [Address], [Fullname], [Phone], [StatusId]) VALUES (2, N'admin', CAST(N'2022-08-04T00:00:00.000' AS DateTime), NULL, N'Bạc Liêu', N'Huỳnh Văn Đạt', N'0944444446', 3)
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [SaleId], [Address], [Fullname], [Phone], [StatusId]) VALUES (3, N'huynhdat', CAST(N'2022-08-01T00:00:00.000' AS DateTime), 2, N'Cần Thơ', N'Huỳnh Văn Đạt', N'0987654321', 3)
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [SaleId], [Address], [Fullname], [Phone], [StatusId]) VALUES (5, N'huynhdat', CAST(N'2022-08-09T00:00:00.000' AS DateTime), NULL, N'Cà Mau', N'Võ Lê Nhật Linh', N'0956784323', 4)
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [SaleId], [Address], [Fullname], [Phone], [StatusId]) VALUES (6, N'huynhdat', CAST(N'2022-08-01T00:00:00.000' AS DateTime), NULL, N'Bạc Liêu', N'Võ Lê Nhật Linh', N'0944696669', 3)
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [SaleId], [Address], [Fullname], [Phone], [StatusId]) VALUES (8, N'admin', CAST(N'2022-08-02T00:00:00.000' AS DateTime), NULL, N'Kiên Giang', N'Huỳnh Văn Đạt', N'0986583232', 3)
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[PriceHistory] ON 

INSERT [dbo].[PriceHistory] ([Id], [ProductId], [Price], [Sale], [ChangeDate]) VALUES (1, 1, 9790001, 0, CAST(N'2022-08-04' AS Date))
INSERT [dbo].[PriceHistory] ([Id], [ProductId], [Price], [Sale], [ChangeDate]) VALUES (3, 1, 9790003, 2300, CAST(N'2022-08-04' AS Date))
INSERT [dbo].[PriceHistory] ([Id], [ProductId], [Price], [Sale], [ChangeDate]) VALUES (5, 1, 9000000, 200, CAST(N'2022-08-04' AS Date))
INSERT [dbo].[PriceHistory] ([Id], [ProductId], [Price], [Sale], [ChangeDate]) VALUES (6, 1, 1230000, 0, CAST(N'2022-08-05' AS Date))
INSERT [dbo].[PriceHistory] ([Id], [ProductId], [Price], [Sale], [ChangeDate]) VALUES (7, 1, 1230000, 0, CAST(N'2022-08-10' AS Date))
INSERT [dbo].[PriceHistory] ([Id], [ProductId], [Price], [Sale], [ChangeDate]) VALUES (9, 1, 1230000, 0, CAST(N'2022-08-10' AS Date))
INSERT [dbo].[PriceHistory] ([Id], [ProductId], [Price], [Sale], [ChangeDate]) VALUES (10, 1, 1230000, 0, CAST(N'2022-08-10' AS Date))
INSERT [dbo].[PriceHistory] ([Id], [ProductId], [Price], [Sale], [ChangeDate]) VALUES (11, 1, 1230000, 0, CAST(N'2022-08-10' AS Date))
INSERT [dbo].[PriceHistory] ([Id], [ProductId], [Price], [Sale], [ChangeDate]) VALUES (12, 1, 1230000, 0, CAST(N'2022-08-10' AS Date))
INSERT [dbo].[PriceHistory] ([Id], [ProductId], [Price], [Sale], [ChangeDate]) VALUES (13, 1, 1230000, 0, CAST(N'2022-08-10' AS Date))
INSERT [dbo].[PriceHistory] ([Id], [ProductId], [Price], [Sale], [ChangeDate]) VALUES (14, 1, 1230000, 0, CAST(N'2022-08-10' AS Date))
INSERT [dbo].[PriceHistory] ([Id], [ProductId], [Price], [Sale], [ChangeDate]) VALUES (15, 2, 12590001, 0, CAST(N'2022-08-10' AS Date))
INSERT [dbo].[PriceHistory] ([Id], [ProductId], [Price], [Sale], [ChangeDate]) VALUES (16, 1, 12300000, 2, CAST(N'2022-08-10' AS Date))
INSERT [dbo].[PriceHistory] ([Id], [ProductId], [Price], [Sale], [ChangeDate]) VALUES (17, 1, 12300012, 1, CAST(N'2022-08-10' AS Date))
INSERT [dbo].[PriceHistory] ([Id], [ProductId], [Price], [Sale], [ChangeDate]) VALUES (18, 1, 15000000, 0, CAST(N'2022-08-10' AS Date))
INSERT [dbo].[PriceHistory] ([Id], [ProductId], [Price], [Sale], [ChangeDate]) VALUES (19, 1, 999999, 0, CAST(N'2022-08-12' AS Date))
INSERT [dbo].[PriceHistory] ([Id], [ProductId], [Price], [Sale], [ChangeDate]) VALUES (20, 1, 101010, 0, CAST(N'2022-08-12' AS Date))
INSERT [dbo].[PriceHistory] ([Id], [ProductId], [Price], [Sale], [ChangeDate]) VALUES (21, 1, 1999999, 0, CAST(N'2022-08-13' AS Date))
INSERT [dbo].[PriceHistory] ([Id], [ProductId], [Price], [Sale], [ChangeDate]) VALUES (22, 1, 9970000, 0, CAST(N'2022-08-15' AS Date))
SET IDENTITY_INSERT [dbo].[PriceHistory] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductColor] ON 

INSERT [dbo].[ProductColor] ([Id], [ProductId], [ColorId], [Quantity]) VALUES (1, 1, 1, 90)
INSERT [dbo].[ProductColor] ([Id], [ProductId], [ColorId], [Quantity]) VALUES (3, 2, 1, 10)
INSERT [dbo].[ProductColor] ([Id], [ProductId], [ColorId], [Quantity]) VALUES (4, 1, 4, 50)
INSERT [dbo].[ProductColor] ([Id], [ProductId], [ColorId], [Quantity]) VALUES (10, 10, 3, 20)
INSERT [dbo].[ProductColor] ([Id], [ProductId], [ColorId], [Quantity]) VALUES (11, 3, 1, 30)
INSERT [dbo].[ProductColor] ([Id], [ProductId], [ColorId], [Quantity]) VALUES (12, 15, 5, 50)
INSERT [dbo].[ProductColor] ([Id], [ProductId], [ColorId], [Quantity]) VALUES (13, 1, 2, 20)
INSERT [dbo].[ProductColor] ([Id], [ProductId], [ColorId], [Quantity]) VALUES (14, 2, 2, 70)
INSERT [dbo].[ProductColor] ([Id], [ProductId], [ColorId], [Quantity]) VALUES (15, 3, 2, 10)
INSERT [dbo].[ProductColor] ([Id], [ProductId], [ColorId], [Quantity]) VALUES (16, 7, 2, 30)
INSERT [dbo].[ProductColor] ([Id], [ProductId], [ColorId], [Quantity]) VALUES (17, 8, 2, 70)
INSERT [dbo].[ProductColor] ([Id], [ProductId], [ColorId], [Quantity]) VALUES (18, 16, 2, 65)
INSERT [dbo].[ProductColor] ([Id], [ProductId], [ColorId], [Quantity]) VALUES (19, 11, 2, 25)
INSERT [dbo].[ProductColor] ([Id], [ProductId], [ColorId], [Quantity]) VALUES (20, 12, 2, 10)
INSERT [dbo].[ProductColor] ([Id], [ProductId], [ColorId], [Quantity]) VALUES (21, 13, 2, 30)
INSERT [dbo].[ProductColor] ([Id], [ProductId], [ColorId], [Quantity]) VALUES (22, 14, 2, 10)
INSERT [dbo].[ProductColor] ([Id], [ProductId], [ColorId], [Quantity]) VALUES (23, 17, 3, 12)
INSERT [dbo].[ProductColor] ([Id], [ProductId], [ColorId], [Quantity]) VALUES (24, 18, 2, 21)
INSERT [dbo].[ProductColor] ([Id], [ProductId], [ColorId], [Quantity]) VALUES (25, 19, 4, 91)
INSERT [dbo].[ProductColor] ([Id], [ProductId], [ColorId], [Quantity]) VALUES (26, 20, 2, 18)
INSERT [dbo].[ProductColor] ([Id], [ProductId], [ColorId], [Quantity]) VALUES (27, 21, 1, 72)
INSERT [dbo].[ProductColor] ([Id], [ProductId], [ColorId], [Quantity]) VALUES (29, 23, 1, 21)
INSERT [dbo].[ProductColor] ([Id], [ProductId], [ColorId], [Quantity]) VALUES (30, 24, 2, 12)
INSERT [dbo].[ProductColor] ([Id], [ProductId], [ColorId], [Quantity]) VALUES (32, 27, 4, 5)
INSERT [dbo].[ProductColor] ([Id], [ProductId], [ColorId], [Quantity]) VALUES (33, 27, 6, 5)
INSERT [dbo].[ProductColor] ([Id], [ProductId], [ColorId], [Quantity]) VALUES (34, 28, 1, 10)
INSERT [dbo].[ProductColor] ([Id], [ProductId], [ColorId], [Quantity]) VALUES (35, 28, 2, 8)
INSERT [dbo].[ProductColor] ([Id], [ProductId], [ColorId], [Quantity]) VALUES (36, 28, 4, 6)
INSERT [dbo].[ProductColor] ([Id], [ProductId], [ColorId], [Quantity]) VALUES (37, 29, 1, 5)
INSERT [dbo].[ProductColor] ([Id], [ProductId], [ColorId], [Quantity]) VALUES (38, 29, 2, 5)
INSERT [dbo].[ProductColor] ([Id], [ProductId], [ColorId], [Quantity]) VALUES (39, 29, 4, 5)
INSERT [dbo].[ProductColor] ([Id], [ProductId], [ColorId], [Quantity]) VALUES (40, 30, 2, 5)
INSERT [dbo].[ProductColor] ([Id], [ProductId], [ColorId], [Quantity]) VALUES (41, 30, 5, 5)
INSERT [dbo].[ProductColor] ([Id], [ProductId], [ColorId], [Quantity]) VALUES (42, 32, 2, 5)
INSERT [dbo].[ProductColor] ([Id], [ProductId], [ColorId], [Quantity]) VALUES (43, 32, 3, 5)
INSERT [dbo].[ProductColor] ([Id], [ProductId], [ColorId], [Quantity]) VALUES (44, 33, 1, 4)
INSERT [dbo].[ProductColor] ([Id], [ProductId], [ColorId], [Quantity]) VALUES (45, 33, 3, 5)
INSERT [dbo].[ProductColor] ([Id], [ProductId], [ColorId], [Quantity]) VALUES (46, 33, 6, 5)
INSERT [dbo].[ProductColor] ([Id], [ProductId], [ColorId], [Quantity]) VALUES (47, 34, 1, 5)
SET IDENTITY_INSERT [dbo].[ProductColor] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductImg] ON 

INSERT [dbo].[ProductImg] ([Id], [ProductId], [Image]) VALUES (1, 1, N'1.jpg')
INSERT [dbo].[ProductImg] ([Id], [ProductId], [Image]) VALUES (2, 1, N'2.jpg')
INSERT [dbo].[ProductImg] ([Id], [ProductId], [Image]) VALUES (3, 1, N'default.jpg')
INSERT [dbo].[ProductImg] ([Id], [ProductId], [Image]) VALUES (4, 1, N'default.jpg')
INSERT [dbo].[ProductImg] ([Id], [ProductId], [Image]) VALUES (5, 2, N'3.jpg')
INSERT [dbo].[ProductImg] ([Id], [ProductId], [Image]) VALUES (8, 3, N'default.jpg')
INSERT [dbo].[ProductImg] ([Id], [ProductId], [Image]) VALUES (9, 7, N'default.jpg')
INSERT [dbo].[ProductImg] ([Id], [ProductId], [Image]) VALUES (10, 8, N'default.jpg')
INSERT [dbo].[ProductImg] ([Id], [ProductId], [Image]) VALUES (11, 10, N'default.jpg')
INSERT [dbo].[ProductImg] ([Id], [ProductId], [Image]) VALUES (12, 11, N'default.jpg')
INSERT [dbo].[ProductImg] ([Id], [ProductId], [Image]) VALUES (13, 12, N'default.jpg')
INSERT [dbo].[ProductImg] ([Id], [ProductId], [Image]) VALUES (14, 13, N'default.jpg')
INSERT [dbo].[ProductImg] ([Id], [ProductId], [Image]) VALUES (15, 14, N'default.jpg')
INSERT [dbo].[ProductImg] ([Id], [ProductId], [Image]) VALUES (16, 15, N'default.jpg')
INSERT [dbo].[ProductImg] ([Id], [ProductId], [Image]) VALUES (17, 16, N'default.jpg')
INSERT [dbo].[ProductImg] ([Id], [ProductId], [Image]) VALUES (18, 17, N'default.jpg')
INSERT [dbo].[ProductImg] ([Id], [ProductId], [Image]) VALUES (19, 18, N'default.jpg')
INSERT [dbo].[ProductImg] ([Id], [ProductId], [Image]) VALUES (20, 19, N'default.jpg')
INSERT [dbo].[ProductImg] ([Id], [ProductId], [Image]) VALUES (21, 20, N'default.jpg')
INSERT [dbo].[ProductImg] ([Id], [ProductId], [Image]) VALUES (22, 21, N'default.jpg')
INSERT [dbo].[ProductImg] ([Id], [ProductId], [Image]) VALUES (24, 23, N'default.jpg')
INSERT [dbo].[ProductImg] ([Id], [ProductId], [Image]) VALUES (25, 24, N'default.jpg')
INSERT [dbo].[ProductImg] ([Id], [ProductId], [Image]) VALUES (30, 30, N'587288ea.jpg')
INSERT [dbo].[ProductImg] ([Id], [ProductId], [Image]) VALUES (31, 30, N'4cca118a.jpg')
INSERT [dbo].[ProductImg] ([Id], [ProductId], [Image]) VALUES (32, 26, N'47ce56db.jpg')
INSERT [dbo].[ProductImg] ([Id], [ProductId], [Image]) VALUES (33, 26, N'd8c27fd7.jpg')
INSERT [dbo].[ProductImg] ([Id], [ProductId], [Image]) VALUES (34, 26, N'340f759d.jpg')
INSERT [dbo].[ProductImg] ([Id], [ProductId], [Image]) VALUES (35, 27, N'ef2d146d.jpg')
INSERT [dbo].[ProductImg] ([Id], [ProductId], [Image]) VALUES (36, 27, N'9a24473f.jpg')
INSERT [dbo].[ProductImg] ([Id], [ProductId], [Image]) VALUES (37, 27, N'bd3d9fd6.jpg')
INSERT [dbo].[ProductImg] ([Id], [ProductId], [Image]) VALUES (38, 28, N'90004c6e.jpg')
INSERT [dbo].[ProductImg] ([Id], [ProductId], [Image]) VALUES (39, 28, N'c4548cc3.jpg')
INSERT [dbo].[ProductImg] ([Id], [ProductId], [Image]) VALUES (40, 28, N'e8bc97c8.jpg')
INSERT [dbo].[ProductImg] ([Id], [ProductId], [Image]) VALUES (41, 29, N'6feea068.jpg')
INSERT [dbo].[ProductImg] ([Id], [ProductId], [Image]) VALUES (42, 29, N'eec7ab22.jpg')
SET IDENTITY_INSERT [dbo].[ProductImg] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [Name], [Price], [CreateDate], [Avaliable], [Sale], [CategoryId], [Description], [BrandId], [MadeIn], [Image]) VALUES (1, N'Xe Đạp Đường Phố Touring GIANT Escape 3 – Bánh 700C – 2022', 9970000, CAST(N'2022-11-08' AS Date), 1, 0, 3, N'Xe đạp thường', 1, N'Truong Quốc', N'1.jpg')
INSERT [dbo].[Products] ([Id], [Name], [Price], [CreateDate], [Avaliable], [Sale], [CategoryId], [Description], [BrandId], [MadeIn], [Image]) VALUES (2, N'Xe đạp Martin 108', 1000000, CAST(N'2022-11-08' AS Date), 1, 0, 3, N'Xe đạp thường', 1, N'Truong Quốc', N'2.jpg')
INSERT [dbo].[Products] ([Id], [Name], [Price], [CreateDate], [Avaliable], [Sale], [CategoryId], [Description], [BrandId], [MadeIn], [Image]) VALUES (3, N'Xe Đạp Địa Hình MTB GIANT Roam 4 Disc', 11590000, CAST(N'2022-08-04' AS Date), 1, 20, 1, N'MTB GIANT Roam 4 Disc2 – 2022 là phiên bản đầy tình mới mẻ được các tín đồ yêu xe đạp địa hình, thể thao vô cùng săn đón và yêu thích bởi chúng mang đến cho chủ nhân của mình cảm giác kích thích, mê hoặc đặc biệt là còn đưa đến cho người sử dụng rất nhiều lợi ích về mặt sức khỏe.', 8, N'éo bít lần 3', N'3.jpg')
INSERT [dbo].[Products] ([Id], [Name], [Price], [CreateDate], [Avaliable], [Sale], [CategoryId], [Description], [BrandId], [MadeIn], [Image]) VALUES (7, N'Xe Đạp Địa Hình MTB VINBIKE Napa 2', 9790000, CAST(N'2022-08-04' AS Date), 1, 10, 1, N'Xe đạp Vinbike Napa 2 là mẫu kết hợp của 2 phong cách đường phố và địa hình. Xe đạp VinBike Napa 2 đáp ứng nhu cầu di chuyển trên mọi cung đường từ đường phố bằng phẳng đến những cung đường xấu, gồ ghề hay nhiều ổ gà. Vinbike Napa 2 ấn tượng, phù hợp cho cả người yêu xe đạp đường phố lẫn xe đạp địa hình. Sở hữu hai bản màu Bạc và Xám đơn giản nhưng sang trọng, thanh lịch cùng cấu hình mãnh mẽ và ấn tượng.', 3, N'éo bít bít :))', N'4.jpg')
INSERT [dbo].[Products] ([Id], [Name], [Price], [CreateDate], [Avaliable], [Sale], [CategoryId], [Description], [BrandId], [MadeIn], [Image]) VALUES (8, N'Xe Đạp Đường Phố Touring MOMENTUM iNeed Latte 26', 9790000, CAST(N'2022-08-04' AS Date), 1, 0, 8, N'Xe đạp đường phố Touring MOMENTUM iNeed Latte 26 – Bánh 26 Inches – 2022 với thiết kế nhẹ nhàng, năng động với nhiều phiên bản màu ngọt nào phù hợp với các chị em công sở hoặc chị em nội trợ. Đây chắc chắn là một người bạn đồng hành xinh xắn dành cho các bạn có sở thích dùng xe đạp làm phương tiện di chuyển để đi học, đi làm hay đi vi vu dạo phố.', 2, N'Tào', N'5.jpg')
INSERT [dbo].[Products] ([Id], [Name], [Price], [CreateDate], [Avaliable], [Sale], [CategoryId], [Description], [BrandId], [MadeIn], [Image]) VALUES (10, N'Xe đạp Nhật Bản', 1290000, CAST(N'2022-08-09' AS Date), 1, 0, 4, NULL, 8, N'Japan', N'6.jpg')
INSERT [dbo].[Products] ([Id], [Name], [Price], [CreateDate], [Avaliable], [Sale], [CategoryId], [Description], [BrandId], [MadeIn], [Image]) VALUES (11, N'Xe Đạp Đường Phố Touring GIANT Escape 3 – Bánh 700C – 2022', 97900000, CAST(N'2022-08-15' AS Date), 1, 0, 1, N'Xe đạp Escape 3 2021 là dòng xe đạp thành phố với cấu hình khá ấn tượng, khung xe thanh mảnh cùng màu sắc đa dạng. Với thiết kế này người chơi Giant không chỉ mong chờ sự ra mắt mà còn muốn có cơ hội sở hữu chiếc xe đường phố của Giant.', 3, N'Việt Nam', N'7.jpg')
INSERT [dbo].[Products] ([Id], [Name], [Price], [CreateDate], [Avaliable], [Sale], [CategoryId], [Description], [BrandId], [MadeIn], [Image]) VALUES (12, N'Xe Đạp California City 200', 3390000, CAST(N'2022-08-15' AS Date), 1, 0, 3, N'Được thiết kế bởi những kĩ sư hàng đầu của Mỹ rất tỉ mỉ với phong cách cổ điển pha chút hiện đại. Là một mẫu xe tầm trung với cấu hình khá tốt trong dòng đường phố. Đầu tiên có thể kể đến chính là phần khung hợp kim thép pha carbon nhẹ nhưng rất chắc chắn với khả năng chịu trọng tải lên tới 180kg . Được trang bị bộ đề Shimano Tourney – 6 tốc độ ( Nhật Bản ) đem đến những chuyển biến linh hoạt và chính xác . Chiếc xe đang nhận được nhiều sự quan tâm và đón chờ từ những người mới chơi xe đạp thể thao. Hãy cùng khám phá xem chiếc xe này có những ưu điểm nào nổi bật và đưa ra những quyết định lựa chọn phù hợp cho bản thân nhé!', 4, N'Mĩ', N'8.jpg')
INSERT [dbo].[Products] ([Id], [Name], [Price], [CreateDate], [Avaliable], [Sale], [CategoryId], [Description], [BrandId], [MadeIn], [Image]) VALUES (13, N'Xe Đạp Đua XDS RF380', 12900000, CAST(N'2022-08-15' AS Date), 1, 0, 2, N'Với thiết kế khí động học giúp xé gió đạp đường trường tốc độ cao tối ưu nhất. Cùng công nghệ khung hợp kim nhôm X6 trong ngành công nghiệp hàng không giúp chiếc xe cứng hơn 30-50% và nhẹ hơn so với khung nhôm thông thường. Bộ chuyển động tay lắc Shimano Sora R3000-18 tốc độ ( Nhật Bản ) sang số rất nhạy và giảm tiếng ồn tối đa. Hãy cùng F-x Bike khám phá chi tiết chiếc xe này nhé !!!', 8, N'Nhật Bản', N'9.jpg')
INSERT [dbo].[Products] ([Id], [Name], [Price], [CreateDate], [Avaliable], [Sale], [CategoryId], [Description], [BrandId], [MadeIn], [Image]) VALUES (14, N'Xe Đạp Thể Thao XdS Sundance 710', 7790000, CAST(N'2022-08-15' AS Date), 1, 0, 4, N'Là phiên bản cao cấp hơn của XdS Sundance 710. Xe được trang bị khung hợp kim nhôm X6 thường được dùng trong chế tạo khung máy bay giúp chiếc xe cứng hơn 30-50% và nhẹ hơn cả khung Nhôm 6061. Bộ chuyển động Shimano Acera 27 Cấp Độ ( Nhật Bản ) cực nhạy và nhẹ. Hãy cùng F-x Bike khám phá chi tiết chiếc xe này nhé !!!', 7, N'Mĩ', N'10.jpg')
INSERT [dbo].[Products] ([Id], [Name], [Price], [CreateDate], [Avaliable], [Sale], [CategoryId], [Description], [BrandId], [MadeIn], [Image]) VALUES (15, N'Xe Đạp Đua XDS RX350', 4526000, CAST(N'2022-08-15' AS Date), 1, 12, 4, N'Với thiết kế khí động học giúp xé gió đạp đường trường tốc độ cao tối ưu nhất. Cùng công nghệ khung hợp kim nhôm X6 trong ngành công nghiệp hàng không giúp chiếc xe cứng hơn 30-50% và nhẹ hơn so với khung nhôm thông thường. Bộ chuyển động tay lắc Shimano Claris R2000-16 tốc độ ( Nhật Bản ) sang số rất nhạy và giảm tiếng ồn tối đa. Hãy cùng F-x Bike khám phá chi tiết chiếc xe này nhé !!!', 8, N'Mĩ Tho', N'11.jpg')
INSERT [dbo].[Products] ([Id], [Name], [Price], [CreateDate], [Avaliable], [Sale], [CategoryId], [Description], [BrandId], [MadeIn], [Image]) VALUES (16, N'Xe Đạp Keeprun ATX880', 5590000, CAST(N'2022-08-15' AS Date), 1, 10, 5, N'Đến từ đất nước Đài Loan với chất lượng khỏi phải nghĩ. Khung hợp kim nhôm nhẹ. Phuộc carbon của Giant. Bộ chuyển động Shimano Altus 27 tốc độ ( Nhật Bản ). Thiết kế thời trang, nhẹ nhàng, thanh thoát, nước sơn 3 lớp cao cấp chống bong tróc, chịu mọi thời tiết…', 5, N'Mĩ La Tinh', N'12.jpg')
INSERT [dbo].[Products] ([Id], [Name], [Price], [CreateDate], [Avaliable], [Sale], [CategoryId], [Description], [BrandId], [MadeIn], [Image]) VALUES (17, N'Xe Đạp California City 200', 3390000, CAST(N'2022-08-15' AS Date), 1, 0, 7, N'Thương hiệu Mỹ. Được thiết kế bởi những kĩ sư hàng đầu của Mỹ rất tỉ mỉ với phong cách cổ điển pha chút hiện đại. Là một mẫu xe tầm trung với cấu hình khá tốt trong dòng đường phố. Đầu tiên có thể kể đến chính là phần khung hợp kim thép pha carbon nhẹ nhưng rất chắc chắn với khả năng chịu trọng tải lên tới 180kg . Được trang bị bộ đề Shimano Tourney – 6 tốc độ ( Nhật Bản ) đem đến những chuyển biến linh hoạt và chính xác . Chiếc xe đang nhận được nhiều sự quan tâm và đón chờ từ những người mới chơi xe đạp thể thao. Hãy cùng khám phá xem chiếc xe này có những ưu điểm nào nổi bật và đưa ra những quyết định lựa chọn phù hợp cho bản thân nhé!', 7, N'Kiên Giang', N'13.jpg')
INSERT [dbo].[Products] ([Id], [Name], [Price], [CreateDate], [Avaliable], [Sale], [CategoryId], [Description], [BrandId], [MadeIn], [Image]) VALUES (18, N'Xe Đạp Thể Thao XdS Romance 500 Plus', 14290000, CAST(N'2022-08-15' AS Date), 1, 0, 9, N'Là phiên bản cao cấp hơn của XdS Romance 500. Xe được trang bị khung hợp kim nhôm X6 thường được dùng trong chế tạo khung máy bay giúp chiếc xe cứng hơn 30-50% và nhẹ hơn cả khung Nhôm 6061. Bộ chuyển động Shimano SLX 22 Cấp Độ ( Nhật Bản ) cực nhạy và nhẹ. Hãy cùng F-x Bike khám phá chi tiết chiếc xe này nhé !!!', 3, N'Mĩ', N'14.jpg')
INSERT [dbo].[Products] ([Id], [Name], [Price], [CreateDate], [Avaliable], [Sale], [CategoryId], [Description], [BrandId], [MadeIn], [Image]) VALUES (19, N'Nón Bảo Hiểm Xe Đạp GIANT Econo 3.0', 35, CAST(N'2022-08-15' AS Date), 1, 0, 11, N'Miễn phí giao hàng khi mua xe đạp
Giảm 10% giá bán lẻ khi mua 3 món phụ kiện trở lên
Giảm 15% giá bán lẻ khi mua 5 món phụ kiện trở lên
Giảm 17% giá bán lẻ khi mua 7 món phụ kiện trở lên', 1, N'Chi na :))', N'15.jpg')
INSERT [dbo].[Products] ([Id], [Name], [Price], [CreateDate], [Avaliable], [Sale], [CategoryId], [Description], [BrandId], [MadeIn], [Image]) VALUES (20, N'Nón Bảo Hiểm Xe Đạp GIANT Econo 3.1', 399000, CAST(N'2022-08-15' AS Date), 1, 0, 11, N'GIANT (CHINA) CO., LTD.
No. 01 SHUNFAN RD, KUNSHAN ECO & TECH DEVELOPMENT ZONE, JIANGSU, P.R.C, Trung Quốc
(+86) 5125 7709888', 1, N'Nga :v', N'16.jpg')
INSERT [dbo].[Products] ([Id], [Name], [Price], [CreateDate], [Avaliable], [Sale], [CategoryId], [Description], [BrandId], [MadeIn], [Image]) VALUES (21, N'Ống Bơm Xe Đạp GIANT Mini Pump Control Mini Road+', 649000, CAST(N'2022-08-15' AS Date), 1, 0, 16, N'GIANT MANUFACTURING CO., LTD.
19, SHUN-FARN ROAD, DAJIA DIST, TAICHUNG CITY, 43774, R.O.C, Đài Loan
+886-426814771', 4, N'Đài Loan', N'17.jpg')
INSERT [dbo].[Products] ([Id], [Name], [Price], [CreateDate], [Avaliable], [Sale], [CategoryId], [Description], [BrandId], [MadeIn], [Image]) VALUES (23, N'XE ĐẠP CAO CẤP Xe Đạp Thể Thao XdS Sundance 800 Plus', 9090000, CAST(N'2022-08-15' AS Date), 1, 18, 17, N'Là phiên bản cao cấp hơn của XdS Sundance 800 Plus. Xe được trang bị khung hợp kim nhôm X6 thường được dùng trong chế tạo khung máy bay giúp chiếc xe cứng hơn 30-50% và nhẹ hơn cả khung Nhôm 6061. Bộ chuyển động Shimano Acera 27 Cấp Độ ( Nhật Bản ) cực nhạy và nhẹ. Hãy cùng F-x Bike khám phá chi tiết chiếc xe này nhé !!!', 8, N'China', N'19.jpg')
INSERT [dbo].[Products] ([Id], [Name], [Price], [CreateDate], [Avaliable], [Sale], [CategoryId], [Description], [BrandId], [MadeIn], [Image]) VALUES (24, N'Xe Đạp Địa Hình MTB GIANT ATX 27.5 – Bánh 27.5 Inches – 2021', 8800000, CAST(N'2022-08-15' AS Date), 1, 0, 17, N'Từ nhà đến công viên hay đến trường, đến nơi làm việc, hay đi phượt ATX 27.5 – 2021 có thể giúp bạn cải thiện cuộc sống và sức khoẻ. Xe đạp địa hình ATX 27.5 – 2021 là sự lựa chọn mà rất nhiều người dùng mong muốn sở hữu.', 1, N'China', N'20.jpg')
INSERT [dbo].[Products] ([Id], [Name], [Price], [CreateDate], [Avaliable], [Sale], [CategoryId], [Description], [BrandId], [MadeIn], [Image]) VALUES (26, N'Xe Đạp Địa Hình MTB Gammax 26-Jiebao-3.0-21S 26 inch', 8090000, CAST(N'2023-08-09' AS Date), 1, 30, 2, N'Xe đạp địa hình MTB Gammax 26-JIEBAO-3.0-21S 26 inch sở hữu phong cách thể thao trẻ trung cùng các phiên bản màu độc đáo và bắt mắt (các phiên bản còn hàng tùy theo khu vực, bài viết sử dụng phiên bản màu đen vàng để minh họa). Xe có khối lượng 20.5 kg phù hợp với các hoạt động rèn luyện thể thao ngoài trời.', 9, N'Mỹ', N'b500ba2b.jpg')
INSERT [dbo].[Products] ([Id], [Name], [Price], [CreateDate], [Avaliable], [Sale], [CategoryId], [Description], [BrandId], [MadeIn], [Image]) VALUES (27, N'Thông số kỹ thuật Xe Đạp Địa Hình MTB Gammax 26-Kunfeng-1.0-21S 2020 26 inch', 8090000, CAST(N'2023-08-09' AS Date), 1, 30, 2, N'Kiểu dáng năng động, đường nét mạnh mẽ, cá tính
Xe đạp địa hình MTB Gammax 26-KUNFENG-1.0-21S 2020 26 inch sở hữu thiết kế khỏe khoắn, đường nét mạnh mẽ với khung sườn nhỏ gọn kết hợp cùng logo cách điệu đẹp mắt, là phương tiện phù hợp để bạn dùng khi leo núi, đi phượt, vượt địa hình hay đơn giản là dùng khi tập thể thao hằng ngày. Mẫu xe có nhiều phiên bản màu (còn hàng tùy theo khu vực và thời điểm). Bài viết sử dụng phiên bản màu xám để minh họa.

Xe đạp địa hình MTB Gammax 26-KUNFENG-1.0-21S 2020 26 inch - Thiết kế

Khung sườn hợp kim nhôm nhẹ nhàng, bền bỉ
Khung sườn xe được làm từ hợp kim nhôm nhẹ nhàng nhưng chịu lực tốt, xe có khối lượng 18.8 kg cho tải trọng lên tới 85 kg, kết cấu khung sườn vững chắc đem lại cảm giác an toàn khi sử dụng. Xe còn được phủ một lớp sơn tĩnh điện bên ngoài giúp tăng tính thẩm mỹ mà không sợ phai màu, bong tróc.

Xe đạp địa hình MTB Gammax 26-KUNFENG-1.0-21S 2020 26 inch - Khung sườn

Lốp xe dày dặn, nhiều rãnh, tăng khả năng bám đường 
Xe đạp Gammax này sở hữu cặp bánh xe có kích thước 26 inch nhỏ gọn với lốp xe CST C1820 dày có thiết kế nhiều rãnh bên ngoài giúp lốp bám đường tốt hơn, hạn chế trơn trượt khi đi qua mặt đường ẩm ướt, vành HLQC-02AC, đùm AF902QR/AR902 cùng căm xe 14G giúp bảo vệ cặp bánh trở nên cứng cáp hơn.

Xe đạp địa hình MTB Gammax 26-KUNFENG-1.0-21S 2020 26 inch - Bánh xe

Gọn gàng với ghi đông không sừng
Bạn có thể tránh những va chạm không đáng có với các vật cản ven đường hay các phương tiện khác trên đường phố vào giờ cao điểm nhờ thiết kế ghi đông KB-802 không sừng gọn gàng, tiện lợi. Ngoài ra, miếng bảo vệ hai bên tay cầm sẽ giữ an toàn cho tay người lái khi điều khiển xe trên các đoạn đường nhỏ hẹp.

Xe đạp địa hình MTB Gammax 26-KUNFENG-1.0-21S 2020 26 inch - Ghi đông

Vận hành êm ái với bộ truyền động LTWOO
Với trang bị bộ đĩa LTWOO-FD-V5008L cho khả năng vận hành linh hoạt, phối hợp ăn ý cùng bộ 7 líp 712 và sên M70 giúp di chuyển đa tốc độ, mẫu xe đạp địa hình MTB này sẽ mang đến cho bạn trải nghiệm sang số mượt mà, mạnh mẽ tăng tốc chinh phục mọi chặng đường.

Xe đạp địa hình MTB Gammax 26-KUNFENG-1.0-21S 2020 26 inch - Bộ truyền động

Làm chủ tốc độ tốt nhờ hệ thống phanh đĩa cáp
Người dùng có thể an tâm hơn khi di chuyển trên đường núi có địa hình phức tạp nhờ bộ thắng P108 và tay thắng LTWOO-SL-V4007 có ưu điểm không cần lực bóp mạnh nhưng vẫn giảm tốc an toàn và chính xác.

Xe đạp địa hình MTB Gammax 26-KUNFENG-1.0-21S 2020 26 inch - Phanh

Phuộc trước vững chắc, giảm xóc tốt 
Phuộc MD-26 gắn ở phía bánh trước của xe đạp được làm bằng chất liệu thép cứng cáp, chịu lực tốt, có hành trình phuộc 40 mm - 45 mm đem đến khả năng giảm xóc tốt, hấp thụ xung lực hiệu quả.

Xe đạp địa hình MTB Gammax 26-KUNFENG-1.0-21S 2020 26 inch - Phuộc

Yên xe êm ái, thoải mái
Xe được trang bị yên BKS-1085 với lớp đệm giúp người lái có trải nghiệm êm ái khi đạp xe, cốt yên KZ-08 được làm từ hợp kim nhôm với đường kính 31.6 mm bền bỉ, cứng cáp nhưng lại có trọng lượng nhẹ, giúp nâng đỡ cơ thể người lái hiệu quả hơn.

Xe đạp địa hình MTB Gammax 26-KUNFENG-1.0-21S 2020 26 inch - Yên xe

Nhiều tiện ích đi kèm
Ngoài ra, xe còn được trang bị thêm các tiện ích như tấm chắn bùn hạn chế vết bẩn bắn lên người khi đi xe dưới trời mưa và dựng xe thoải mái ở bất kì đâu với chân chống đi kèm.

Xe đạp địa hình MTB Gammax 26-KUNFENG-1.0-21S 2020 26 inch - Chân chống

Nhìn chung, xe đạp này không chỉ sở hữu thiết kế thể thao mạnh mẽ đặc trưng của dòng xe đạp địa hình mà còn được cấu thành từ những linh kiện có độ bền cao như bộ truyền động LTWOO, lốp xe C1820 dày,… Nếu bạn đang phân vân không biết lựa chọn mẫu xe nào để đi phượt và khám phá các cung đường thì xe đạp địa hình MTB Gammax 26-KUNFENG-1.0-21S 2020 26 inch là một sự lựa chọn đáng cân nhắc.', 9, N'Mỹ', N'8c913283.jpg')
INSERT [dbo].[Products] ([Id], [Name], [Price], [CreateDate], [Avaliable], [Sale], [CategoryId], [Description], [BrandId], [MadeIn], [Image]) VALUES (28, N'Giant Rincon 2 (2022) 27.5 inch Size M', 10190000, CAST(N'2023-08-09' AS Date), 1, 15, 2, N'Lưu ý: Kích thước sản phẩm này là thông số tương đối, có thể thay đổi theo size khung. Tuy nhiên mức độ chênh lệch không nhiều (±1 - 5 cm).

Mang phong cách thiết kế thể thao, mạnh mẽ
Xe đạp địa hình MTB Giant Rincon 2 (2022) 27.5 inch Size M có vẻ ngoài cá tính, thân xe được phủ lớp sơn nhám tĩnh điện cao cấp cùng với logo Giant sành điệu. Với nhiều phiên bản màu đa dạng (còn hàng tùy theo khu vực và thời điểm), mẫu xe sẽ là lựa chọn tuyệt vời dành cho các bạn trẻ có mong muốn leo núi, đạp xe rèn luyện sức khỏe, đam mê vượt thử thách.

1

Khung sườn hợp kim nhôm bền nhẹ
Phần khung sườn hợp kim nhôm size M bền bỉ và cứng cáp cho xe khối lượng khá nhẹ chỉ 14.75 kg cùng khả năng tải nặng lên đến 180 kg, dễ dàng điều khiển, độ linh hoạt cao, có thể thoải mái chở theo hành lý trên những chuyến đi dài.

2

Bánh xe Kenda 27.5 inch có gai chống trơn trượt
Cặp bánh xe 27.5 inch này phù hợp với thể trạng của người chơi xe có chiều cao từ 172 đến 183 cm. Bánh xe chắc chắn nhờ vành Giant double wall aluminum cùng căm Stainless cứng cáp, thêm vào đó là sự kết hợp với các gai nhỏ sẽ giúp tăng độ ma sát với mặt đường, chống trơn trượt.

3

Kiểm soát xe dễ dàng hơn với ghi đông không sừng
Ghi đông không sừng, dạng thẳng, cho tư thế cầm thoải mái, thẳng lưng giúp bảo vệ cột sống. Ngoài ra với thiết kế này có thể giúp xe dễ dàng vượt qua những địa hình hẹp, không gây vướng víu, dễ dàng vượt chướng ngại vật.

Xe đạp địa hình MTB Giant Rincon 2 (2022) 27.5 inch Size M 

Bộ truyền động Shimano cao cấp
Hệ thống truyền động với bộ líp ShunFeng gồm 7 líp sau kết hợp cùng sên KMC cho xe vận hành trơn tru, mượt mà, đáp ứng được mọi địa hình với nhiều tốc độ khác nhau. Giò dĩa 24/34/42T còn giúp xe tối ưu tốc độ tránh mất sức trong quá trình đạp.

Xe đạp địa hình MTB Giant Rincon 2 (2022) 27.5 inch Size M 

Phanh đĩa Tektro mượt mà, đảm bảo an toàn, làm chủ tốc độ
Xe đạp sở hữu phanh đĩa cáp với tay thắng Tektro với độ chính xác cao, đảm bảo an toàn cho người dùng trên các con đường xấu, gồ ghề. Các phượt thủ có thể tự tin chinh phục các đoạn đường đầy thách thức mà vẫn được bảo vệ an toàn trong suốt các chuyến đi.

Xe đạp địa hình MTB Giant Rincon 2 (2022) 27.5 inch Size M 

Phuộc nhún SR Suntour XCE tiêu chuẩn, hấp thụ xung lực tốt
Cặp phuộc trước chuyên dụng cho dòng xe đạp địa hình, hỗ trợ giảm xóc tốt, giữ cho xe êm ái khi chạy trên những địa hình gồ ghề, cho người dùng có những trải nghiệm tuyệt vời hơn trong chuyến đi của mình.

7

Yên xe Giant Sports bọc da, mang lại cảm giác êm ái
Yên xe đạp Giant có lớp đệm dày bọc da tạo cảm giác thoải mái khi ngồi lâu, không gây đau mỏi. Cốt yên Giant Sports từ hợp kim có đường kính 30.9 mm và khóa yên cho phép điều chỉnh chiều cao bằng tay mà không cần dùng đến dụng cụ hỗ trợ.

Xe đạp địa hình MTB Giant Rincon 2 (2022) 27.5 inch Size M 

Tiện ích chuông đi kèm tăng cường độ an toàn
Nhà sản xuất đã trang bị thêm cho xe chiếc chuông cảnh báo giúp bạn truyền tín hiệu đến mọi người xung quanh khi cần thiết với mục đích tăng cường độ an toàn cho người lái khi rẽ vào các góc cua hạn chế tầm nhìn hay qua các giao lộ.', 10, N'Đài Loan, Trung Quốc', N'5e273341.jpg')
INSERT [dbo].[Products] ([Id], [Name], [Price], [CreateDate], [Avaliable], [Sale], [CategoryId], [Description], [BrandId], [MadeIn], [Image]) VALUES (29, N'Xe Đạp Địa Hình MTB Giant Rincon 2 (2022) 27.5 inch Size S', 10190000, CAST(N'2023-08-09' AS Date), 1, 15, 2, N'Lưu ý: Kích thước sản phẩm này là thông số tương đối, có thể thay đổi theo size khung. Tuy nhiên mức độ chênh lệch không nhiều (±1 - 5 cm).

Mang phong cách thiết kế thể thao, mạnh mẽ
Xe đạp địa hình MTB Giant Rincon 2 (2022) 27.5 inch Size M có vẻ ngoài cá tính, thân xe được phủ lớp sơn nhám tĩnh điện cao cấp cùng với logo Giant sành điệu. Với nhiều phiên bản màu đa dạng (còn hàng tùy theo khu vực và thời điểm), mẫu xe sẽ là lựa chọn tuyệt vời dành cho các bạn trẻ có mong muốn leo núi, đạp xe rèn luyện sức khỏe, đam mê vượt thử thách.

1

Khung sườn hợp kim nhôm bền nhẹ
Phần khung sườn hợp kim nhôm size M bền bỉ và cứng cáp cho xe khối lượng khá nhẹ chỉ 14.75 kg cùng khả năng tải nặng lên đến 180 kg, dễ dàng điều khiển, độ linh hoạt cao, có thể thoải mái chở theo hành lý trên những chuyến đi dài.

2

Bánh xe Kenda 27.5 inch có gai chống trơn trượt
Cặp bánh xe 27.5 inch này phù hợp với thể trạng của người chơi xe có chiều cao từ 172 đến 183 cm. Bánh xe chắc chắn nhờ vành Giant double wall aluminum cùng căm Stainless cứng cáp, thêm vào đó là sự kết hợp với các gai nhỏ sẽ giúp tăng độ ma sát với mặt đường, chống trơn trượt.

3

Kiểm soát xe dễ dàng hơn với ghi đông không sừng
Ghi đông không sừng, dạng thẳng, cho tư thế cầm thoải mái, thẳng lưng giúp bảo vệ cột sống. Ngoài ra với thiết kế này có thể giúp xe dễ dàng vượt qua những địa hình hẹp, không gây vướng víu, dễ dàng vượt chướng ngại vật.

Xe đạp địa hình MTB Giant Rincon 2 (2022) 27.5 inch Size M 

Bộ truyền động Shimano cao cấp
Hệ thống truyền động với bộ líp ShunFeng gồm 7 líp sau kết hợp cùng sên KMC cho xe vận hành trơn tru, mượt mà, đáp ứng được mọi địa hình với nhiều tốc độ khác nhau. Giò dĩa 24/34/42T còn giúp xe tối ưu tốc độ tránh mất sức trong quá trình đạp.

Xe đạp địa hình MTB Giant Rincon 2 (2022) 27.5 inch Size M 

Phanh đĩa Tektro mượt mà, đảm bảo an toàn, làm chủ tốc độ
Xe đạp sở hữu phanh đĩa cáp với tay thắng Tektro với độ chính xác cao, đảm bảo an toàn cho người dùng trên các con đường xấu, gồ ghề. Các phượt thủ có thể tự tin chinh phục các đoạn đường đầy thách thức mà vẫn được bảo vệ an toàn trong suốt các chuyến đi.

Xe đạp địa hình MTB Giant Rincon 2 (2022) 27.5 inch Size M 

Phuộc nhún SR Suntour XCE tiêu chuẩn, hấp thụ xung lực tốt
Cặp phuộc trước chuyên dụng cho dòng xe đạp địa hình, hỗ trợ giảm xóc tốt, giữ cho xe êm ái khi chạy trên những địa hình gồ ghề, cho người dùng có những trải nghiệm tuyệt vời hơn trong chuyến đi của mình.

7

Yên xe Giant Sports bọc da, mang lại cảm giác êm ái
Yên xe đạp Giant có lớp đệm dày bọc da tạo cảm giác thoải mái khi ngồi lâu, không gây đau mỏi. Cốt yên Giant Sports từ hợp kim có đường kính 30.9 mm và khóa yên cho phép điều chỉnh chiều cao bằng tay mà không cần dùng đến dụng cụ hỗ trợ.

Xe đạp địa hình MTB Giant Rincon 2 (2022) 27.5 inch Size M 

Tiện ích chuông đi kèm tăng cường độ an toàn
Nhà sản xuất đã trang bị thêm cho xe chiếc chuông cảnh báo giúp bạn truyền tín hiệu đến mọi người xung quanh khi cần thiết với mục đích tăng cường độ an toàn cho người lái khi rẽ vào các góc cua hạn chế tầm nhìn hay qua các giao lộ.', 10, N'Đài Loan, Trung Quốc.', N'a3458cae.jpg')
INSERT [dbo].[Products] ([Id], [Name], [Price], [CreateDate], [Avaliable], [Sale], [CategoryId], [Description], [BrandId], [MadeIn], [Image]) VALUES (30, N'Xe Đạp Địa Hình MTB Java 650B-Vetta-27S-A 27.5 inch Size M', 27690000, CAST(N'2023-08-09' AS Date), 1, 40, 2, N'Kiểu dáng gọn nhẹ cùng màu sắc thời trang
Xe đạp địa hình JAVA 650B VETTA 27S 27.5 inch là mẫu xe phù hợp với đa số người dùng Việt Nam, nhất là giới trẻ nhờ kiểu dáng gọn nhẹ, hợp thị hiếu và đa mục đích sử dụng. Bạn có thể lái xe đi học, đi làm để rèn luyện sức khỏe và giảm ùn tắc giao thông, hay đi phượt, leo núi để chinh phục những cung đường mới. (Bài viết được minh họa bởi phiên bản màu đỏ. Số lượng hàng còn ở từng khu vực là khác nhau, các phiên bản hết hàng sẽ không hiện lên website).

Xe đạp địa hình JAVA 650B VETTA 27S A 27.5 inch Đỏ M - Thiết kế
Khung xe nhẹ nhàng, bền chắc làm từ sợi carbon
Khung xe sợi carbon của xe luôn chiếm được cảm tình của những người yêu xe đạp khi sở hữu nhiều ưu điểm vượt trội như: khả năng tải trọng lớn đến 100 kg, trọng lượng nhẹ giúp việc điều khiển xe linh hoạt hơn, bền chắc khi sử dụng trong thời gian dài. Ngoài ra, khung sườn xe size M còn được phủ lớp sơn tĩnh điện màu đen, mang đến vẻ đẹp sang trọng, đẳng cấp hơn cho người dùng.

Xe đạp địa hình JAVA 650B VETTA 27S A 27.5 inch Đỏ M - Khung xe

Bánh xe lớn với bề mặt vỏ nhiều gai
Đường kính bánh xe 27.5 inch đem đến khả năng di chuyển linh hoạt với tốc độ nhanh trên mọi địa hình. Ngoài ra, lốp xe dày dặn với nhiều đường rãnh và gai nhỏ hạn chế tình trạng trơn trượt khi xe cua gấp hay di chuyển trên mặt đường ẩm ướt.

Xe đạp địa hình JAVA 650B VETTA 27S A 27.5 inch Đỏ M - Bánh xe

Thiết kế ghi đông không sừng dễ dàng điều khiển
Ghi đông của mẫu xe đạp địa hình này được thiết kế theo dạng thẳng, không sừng, vừa giúp người dùng có điều khiển xe dễ dàng hơn, vừa điều chỉnh được tư thế ngồi để hạn chế đau mỏi khi lái xe đường dài.

Xe đạp địa hình JAVA 650B VETTA 27S A 27.5 inch Đỏ M - Ghi đông

Bộ truyền động Shimano chuyển đổi số nhanh
Xe đạp Java được trang bị bộ truyền động Shimano có 27 tốc độ gồm 3 đĩa và 9 líp chất lượng Nhật Bản, cho phép xe hoạt động linh hoạt và chuyển chế độ nhanh chóng, giúp các tín đồ mê xe làm chủ đường chạy tốt hơn.

Xe đạp địa hình JAVA 650B VETTA 27S A 27.5 inch Đỏ M - Bộ truyền động

Làm chủ tốc độ với phanh đĩa thủy lực Shimano M2000
Xe đạp có hệ thống phanh đĩa thủy lực Shimano M2000 rất an toàn ở cả bánh trước lẫn bánh sau, giúp người dùng kiểm soát tốc độ tốt hơn. Ưu điểm vượt trội của loại phanh này là hoạt động êm với độ nhạy cao và mang lại cảm giác bóp thắng nhẹ nhàng, không bị bó cứng.

Xe đạp địa hình JAVA 650B VETTA 27S A 27.5 inch Đỏ M - Phanh

Di chuyển êm ái với cặp phuộc treo khí nén
Mẫu xe này sở hữu cặp phuộc với hành trình 80 mm - 100 mm có khả năng chống xóc hiệu quả, giúp người đạp di chuyển êm ái và tiết kiệm năng lượng hơn khi di chuyển trên các đoạn đường gồ ghề, nhiều ổ gà. 

Xe đạp địa hình JAVA 650B VETTA 27S A 27.5 inch Đỏ M - Phuộc xe

Yên xe bọc đệm êm, cốt yên hợp kim bền chắc
Hãng đã trang bị cho xe Java chiếc yên bọc da êm ái để người dùng ít đau mỏi cơ sau mỗi chuyến đi dài. Bên cạnh đó, cốt yên được gia công từ hợp kim có đường kính 31.6 mm và có thể điều chỉnh chiều cao phù hợp với nhu cầu sử dụng.

Xe đạp địa hình JAVA 650B VETTA 27S A 27.5 inch Đỏ M - Yên xe

Xe đạp địa hình JAVA 650B VETTA 27S size M nổi bật với kiểu dáng thể thao gọn nhẹ, bộ truyền động 27 tốc độ mạnh mẽ, hệ thống phanh đĩa thủy lực chính xác,… Chiếc xe này hoàn toàn phù hợp cho những chuyến đi phượt, đi dã ngoại,… của bạn.', 11, N'Trung Quốc', N'3a409e09.jpg')
INSERT [dbo].[Products] ([Id], [Name], [Price], [CreateDate], [Avaliable], [Sale], [CategoryId], [Description], [BrandId], [MadeIn], [Image]) VALUES (31, N'Xe Đạp Thể Thao Road Twitter Gravel PB Hybrid 29 inch Size M', 30090000, CAST(N'2023-08-09' AS Date), 1, 40, 2, N'Thiết kế ấn tượng, kiểu dáng mạnh mẽ
Xe đạp thể thao Road Twitter Gravel PB Hybrid 29 inch Size M đã gây “thương nhớ” ngay từ cái nhìn đầu tiên khi sở hữu thiết kế thể thao mạnh mẽ cùng nhiều phiên bản màu cá tính, thời thượng (các phiên bản màu còn hàng tùy vào khu vực và địa điểm, bài viết sử dụng phiên bản màu đen để minh họa sản phẩm). Đây là mẫu xe đạp lai đến từ thương hiệu Twitter, phù hợp để phục vụ cho việc tập luyện thể thao, đi học, đi làm hay đi phượt thám hiểm địa hình.', 13, N'Đức', N'ab844441.jpg')
INSERT [dbo].[Products] ([Id], [Name], [Price], [CreateDate], [Avaliable], [Sale], [CategoryId], [Description], [BrandId], [MadeIn], [Image]) VALUES (32, N'Xe Đạp Địa Hình MTB Twitter Leopard Pro Main 27.5 inch Size S', 23890000, CAST(N'2023-08-09' AS Date), 1, 40, 2, N'Sở hữu kiểu dáng thể thao, nhiều phiên bản màu bắt mắt
Xe đạp địa hình MTB Twitter Leopard Pro Main 27.5 inch Size S có ngoại hình khỏe khoắn, trẻ trung, phù hợp với các bạn trẻ năng động, thích khám phá, thường xuyên đi phượt, leo núi và rèn luyện sức khỏe. Mẫu xe có nhiều phiên bản màu sắc và còn hàng tùy theo khu vực, địa điểm. Bài viết sử dụng phiên bản màu xanh dương để minh họa.', 13, N'Đức', N'43a20df5.jpg')
INSERT [dbo].[Products] ([Id], [Name], [Price], [CreateDate], [Avaliable], [Sale], [CategoryId], [Description], [BrandId], [MadeIn], [Image]) VALUES (33, N'Xe Đạp Địa Hình MTB Twitter Storm 2.0 Main 27.5 inch Size M', 29090000, CAST(N'2023-08-09' AS Date), 1, 40, 2, N'Thiết kế thể thao, sang trọng
Sở hữu vóc dáng năng động, thể thao cùng thiết kế âm sườn thẩm mỹ, xe đạp địa hình MTB Twitter Storm 2.0 Main 27.5 inch Size M thuộc phân khúc xe đạp leo núi, chinh phục địa hình hay tập thể thao rèn luyện sức khỏe. Xe có khối lượng chỉ 11.8 kg cùng nhiều phiên bản màu sắc đa dạng cho bạn tha hồ lựa chọn, bài viết sử dụng phiên bản màu xanh dương để minh họa.', 13, N'Đức', N'7e45ad0f.jpg')
INSERT [dbo].[Products] ([Id], [Name], [Price], [CreateDate], [Avaliable], [Sale], [CategoryId], [Description], [BrandId], [MadeIn], [Image]) VALUES (34, N'Xe Đạp Địa Hình MTB Txed Power 2.3-Df 27.5 inch Size M', 8690000, CAST(N'2023-08-09' AS Date), 1, 40, 2, N'Mang phong cách trẻ trung, mạnh mẽ
Xe đạp địa hình MTB Txed Power 2.3Df 27.5 inch Size M sở hữu kiểu dáng năng động, mạnh mẽ với khối lượng nhẹ 14.2 kg, bạn có thể sử dụng mẫu xe này cho nhiều mục đích như đi học, đi làm hằng ngày, leo núi khám phá địa hình hay tập thể thao rèn luyện sức khỏe. Mẫu xe có nhiều phiên bản màu sắc và còn hàng tùy theo khu vực, thời điểm. Bài viết sử dụng phiên bản màu xanh dương để minh họa.', 14, N'Trung Quốc', N'7f0ceca8.jpg')
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (N'CUST', N'Customers')
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (N'DIRE', N'Directors')
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (N'STAF', N'Staffs')
GO
SET IDENTITY_INSERT [dbo].[Sale] ON 

INSERT [dbo].[Sale] ([Id], [Code], [Value], [SaleDate], [Amount], [CreateDate], [EndDate]) VALUES (2, N'ABC', 20, CAST(N'2022-08-06' AS Date), 5, CAST(N'2023-08-04T00:00:00.000' AS DateTime), CAST(N'2023-08-06T00:00:00.000' AS DateTime))
INSERT [dbo].[Sale] ([Id], [Code], [Value], [SaleDate], [Amount], [CreateDate], [EndDate]) VALUES (4, N'ABC2', 5, CAST(N'2022-08-08' AS Date), 3, CAST(N'2023-08-04T00:00:00.000' AS DateTime), CAST(N'2023-08-05T00:00:00.000' AS DateTime))
INSERT [dbo].[Sale] ([Id], [Code], [Value], [SaleDate], [Amount], [CreateDate], [EndDate]) VALUES (5, N'ABC3', 4, CAST(N'2022-08-10' AS Date), 4, CAST(N'2023-08-04T00:00:00.000' AS DateTime), CAST(N'2023-08-08T00:00:00.000' AS DateTime))
INSERT [dbo].[Sale] ([Id], [Code], [Value], [SaleDate], [Amount], [CreateDate], [EndDate]) VALUES (6, N'2345', 12, CAST(N'2022-08-06' AS Date), 12, CAST(N'2023-08-06T00:00:00.000' AS DateTime), CAST(N'2023-08-10T00:00:00.000' AS DateTime))
INSERT [dbo].[Sale] ([Id], [Code], [Value], [SaleDate], [Amount], [CreateDate], [EndDate]) VALUES (8, N'3#SDDF', 12, CAST(N'2022-08-23' AS Date), 12, CAST(N'2023-08-06T00:00:00.000' AS DateTime), CAST(N'2023-08-10T00:00:00.000' AS DateTime))
INSERT [dbo].[Sale] ([Id], [Code], [Value], [SaleDate], [Amount], [CreateDate], [EndDate]) VALUES (9, N'QUW53B', 25, CAST(N'2022-08-30' AS Date), 99, CAST(N'2023-08-06T00:00:00.000' AS DateTime), CAST(N'2023-08-10T00:00:00.000' AS DateTime))
INSERT [dbo].[Sale] ([Id], [Code], [Value], [SaleDate], [Amount], [CreateDate], [EndDate]) VALUES (11, N'123', 12, CAST(N'2022-08-06' AS Date), 1, CAST(N'2023-08-06T00:00:00.000' AS DateTime), CAST(N'2023-08-10T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Sale] OFF
GO
SET IDENTITY_INSERT [dbo].[Status] ON 

INSERT [dbo].[Status] ([Id], [Name]) VALUES (1, N'Đang chờ')
INSERT [dbo].[Status] ([Id], [Name]) VALUES (2, N'Đang giao')
INSERT [dbo].[Status] ([Id], [Name]) VALUES (3, N'Đã giao')
INSERT [dbo].[Status] ([Id], [Name]) VALUES (4, N'Đã hủy')
SET IDENTITY_INSERT [dbo].[Status] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Unique_Email]    Script Date: 9/8/2023 8:29:10 PM ******/
ALTER TABLE [dbo].[Accounts] ADD  CONSTRAINT [Unique_Email] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Unique_Phone]    Script Date: 9/8/2023 8:29:10 PM ******/
ALTER TABLE [dbo].[Accounts] ADD  CONSTRAINT [Unique_Phone] UNIQUE NONCLUSTERED 
(
	[Phone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Unique_Username_ProductId_Color]    Script Date: 9/8/2023 8:29:10 PM ******/
ALTER TABLE [dbo].[Cart] ADD  CONSTRAINT [Unique_Username_ProductId_Color] UNIQUE NONCLUSTERED 
(
	[ProductId] ASC,
	[Username] ASC,
	[Color] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Unique_Username_ProductId]    Script Date: 9/8/2023 8:29:10 PM ******/
ALTER TABLE [dbo].[Favorites] ADD  CONSTRAINT [Unique_Username_ProductId] UNIQUE NONCLUSTERED 
(
	[ProductId] ASC,
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [Unique_ProductId_Color_OrderId]    Script Date: 9/8/2023 8:29:10 PM ******/
ALTER TABLE [dbo].[OrderDetails] ADD  CONSTRAINT [Unique_ProductId_Color_OrderId] UNIQUE NONCLUSTERED 
(
	[ProductId] ASC,
	[Color] ASC,
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UniqueKey_ProductId_ColorId]    Script Date: 9/8/2023 8:29:10 PM ******/
ALTER TABLE [dbo].[ProductColor] ADD  CONSTRAINT [UniqueKey_ProductId_ColorId] UNIQUE NONCLUSTERED 
(
	[ProductId] ASC,
	[ColorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Accounts] ADD  CONSTRAINT [DF_Customers_Photo]  DEFAULT (N'Photo.gif') FOR [Photo]
GO
ALTER TABLE [dbo].[OrderDetails] ADD  CONSTRAINT [DF_Order_Details_UnitPrice]  DEFAULT ((0)) FOR [Price]
GO
ALTER TABLE [dbo].[OrderDetails] ADD  CONSTRAINT [DF_Order_Details_Quantity]  DEFAULT ((1)) FOR [Quantity]
GO
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF_Orders_OrderDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_UnitPrice]  DEFAULT ((0)) FOR [Price]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_ProductDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_Available]  DEFAULT ((1)) FOR [Avaliable]
GO
ALTER TABLE [dbo].[Address]  WITH CHECK ADD  CONSTRAINT [FK_Address_Accounts] FOREIGN KEY([Username])
REFERENCES [dbo].[Accounts] ([Username])
GO
ALTER TABLE [dbo].[Address] CHECK CONSTRAINT [FK_Address_Accounts]
GO
ALTER TABLE [dbo].[Authorities]  WITH CHECK ADD  CONSTRAINT [FK_Authorities_Accounts] FOREIGN KEY([Username])
REFERENCES [dbo].[Accounts] ([Username])
GO
ALTER TABLE [dbo].[Authorities] CHECK CONSTRAINT [FK_Authorities_Accounts]
GO
ALTER TABLE [dbo].[Authorities]  WITH CHECK ADD  CONSTRAINT [FK_Authorities_Roles] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
GO
ALTER TABLE [dbo].[Authorities] CHECK CONSTRAINT [FK_Authorities_Roles]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Accounts] FOREIGN KEY([Username])
REFERENCES [dbo].[Accounts] ([Username])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_Accounts]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_ProductColor] FOREIGN KEY([Color])
REFERENCES [dbo].[ProductColor] ([Id])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_ProductColor]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_Products]
GO
ALTER TABLE [dbo].[Favorites]  WITH CHECK ADD  CONSTRAINT [FK_Favorites_Accounts] FOREIGN KEY([Username])
REFERENCES [dbo].[Accounts] ([Username])
GO
ALTER TABLE [dbo].[Favorites] CHECK CONSTRAINT [FK_Favorites_Accounts]
GO
ALTER TABLE [dbo].[Favorites]  WITH CHECK ADD  CONSTRAINT [FK_Favorites_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[Favorites] CHECK CONSTRAINT [FK_Favorites_Products]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Orders] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([Id])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Orders]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_ProductColor] FOREIGN KEY([Color])
REFERENCES [dbo].[ProductColor] ([Id])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_ProductColor]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Products]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Accounts] FOREIGN KEY([Username])
REFERENCES [dbo].[Accounts] ([Username])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Accounts]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Sale] FOREIGN KEY([SaleId])
REFERENCES [dbo].[Sale] ([Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Sale]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Status] FOREIGN KEY([StatusId])
REFERENCES [dbo].[Status] ([Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Status]
GO
ALTER TABLE [dbo].[OTP]  WITH CHECK ADD  CONSTRAINT [FK_OTP_Accounts1] FOREIGN KEY([UserId])
REFERENCES [dbo].[Accounts] ([Username])
GO
ALTER TABLE [dbo].[OTP] CHECK CONSTRAINT [FK_OTP_Accounts1]
GO
ALTER TABLE [dbo].[PriceHistory]  WITH CHECK ADD  CONSTRAINT [FK_PriceHistory_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[PriceHistory] CHECK CONSTRAINT [FK_PriceHistory_Products]
GO
ALTER TABLE [dbo].[ProductColor]  WITH CHECK ADD  CONSTRAINT [FK_ProductColor_Color] FOREIGN KEY([ColorId])
REFERENCES [dbo].[Color] ([Id])
GO
ALTER TABLE [dbo].[ProductColor] CHECK CONSTRAINT [FK_ProductColor_Color]
GO
ALTER TABLE [dbo].[ProductColor]  WITH CHECK ADD  CONSTRAINT [FK_ProductColor_Products1] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[ProductColor] CHECK CONSTRAINT [FK_ProductColor_Products1]
GO
ALTER TABLE [dbo].[ProductImg]  WITH CHECK ADD  CONSTRAINT [FK_ProductImg_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[ProductImg] CHECK CONSTRAINT [FK_ProductImg_Products]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Brand] FOREIGN KEY([BrandId])
REFERENCES [dbo].[Brand] ([Id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Brand]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã khách hàng' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accounts', @level2type=N'COLUMN',@level2name=N'Username'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mật khẩu đăng nhập' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accounts', @level2type=N'COLUMN',@level2name=N'Password'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Họ và tên' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accounts', @level2type=N'COLUMN',@level2name=N'Fullname'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Email' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accounts', @level2type=N'COLUMN',@level2name=N'Email'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Hình ảnh' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accounts', @level2type=N'COLUMN',@level2name=N'Photo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã loại' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Categories', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tên tiếng Việt' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Categories', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã chi tiết' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OrderDetails', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã hóa đơn' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OrderDetails', @level2type=N'COLUMN',@level2name=N'OrderId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã hàng hóa' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OrderDetails', @level2type=N'COLUMN',@level2name=N'ProductId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Đơn giá bán' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OrderDetails', @level2type=N'COLUMN',@level2name=N'Price'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Số lượng mua' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OrderDetails', @level2type=N'COLUMN',@level2name=N'Quantity'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã hóa đơn' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orders', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã khách hàng' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orders', @level2type=N'COLUMN',@level2name=N'Username'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ngày đặt hàng' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orders', @level2type=N'COLUMN',@level2name=N'CreateDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã hàng hóa' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tên hàng hóa' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Đơn giá' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'Price'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ngày sản xuất' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'CreateDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Đang kinh doanh ?' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'Avaliable'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã loại, FK' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'CategoryId'
GO
USE [master]
GO
ALTER DATABASE [J6Team] SET  READ_WRITE 
GO
