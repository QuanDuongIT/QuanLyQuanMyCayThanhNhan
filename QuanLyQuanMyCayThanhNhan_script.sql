USE [master]
GO
/****** Object:  Database [QuanLyQuanMyCayThanhNhan]    Script Date: 03/05/2023 2:43:10 CH ******/
CREATE DATABASE [QuanLyQuanMyCayThanhNhan]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QuanLyQuanMyCayThanhNhan', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\QuanLyQuanMyCayThanhNhan.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'QuanLyQuanMyCayThanhNhan_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\QuanLyQuanMyCayThanhNhan_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [QuanLyQuanMyCayThanhNhan] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QuanLyQuanMyCayThanhNhan].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QuanLyQuanMyCayThanhNhan] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QuanLyQuanMyCayThanhNhan] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QuanLyQuanMyCayThanhNhan] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QuanLyQuanMyCayThanhNhan] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QuanLyQuanMyCayThanhNhan] SET ARITHABORT OFF 
GO
ALTER DATABASE [QuanLyQuanMyCayThanhNhan] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [QuanLyQuanMyCayThanhNhan] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QuanLyQuanMyCayThanhNhan] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QuanLyQuanMyCayThanhNhan] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QuanLyQuanMyCayThanhNhan] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QuanLyQuanMyCayThanhNhan] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QuanLyQuanMyCayThanhNhan] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QuanLyQuanMyCayThanhNhan] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QuanLyQuanMyCayThanhNhan] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QuanLyQuanMyCayThanhNhan] SET  ENABLE_BROKER 
GO
ALTER DATABASE [QuanLyQuanMyCayThanhNhan] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QuanLyQuanMyCayThanhNhan] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QuanLyQuanMyCayThanhNhan] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QuanLyQuanMyCayThanhNhan] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QuanLyQuanMyCayThanhNhan] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QuanLyQuanMyCayThanhNhan] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QuanLyQuanMyCayThanhNhan] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QuanLyQuanMyCayThanhNhan] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QuanLyQuanMyCayThanhNhan] SET  MULTI_USER 
GO
ALTER DATABASE [QuanLyQuanMyCayThanhNhan] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QuanLyQuanMyCayThanhNhan] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QuanLyQuanMyCayThanhNhan] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QuanLyQuanMyCayThanhNhan] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QuanLyQuanMyCayThanhNhan] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [QuanLyQuanMyCayThanhNhan] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [QuanLyQuanMyCayThanhNhan] SET QUERY_STORE = ON
GO
ALTER DATABASE [QuanLyQuanMyCayThanhNhan] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [QuanLyQuanMyCayThanhNhan]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 03/05/2023 2:43:10 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[UserName] [nvarchar](100) NOT NULL,
	[DisplayName] [nvarchar](100) NOT NULL,
	[Password] [nvarchar](1000) NOT NULL,
	[Type] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bill]    Script Date: 03/05/2023 2:43:10 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bill](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[DateCheckIn] [date] NOT NULL,
	[DateCheckOut] [date] NULL,
	[idTable] [int] NOT NULL,
	[idclient] [int] NOT NULL,
	[status] [int] NOT NULL,
	[sumprice] [float] NOT NULL,
	[discount] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BillInfo]    Script Date: 03/05/2023 2:43:10 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BillInfo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idBill] [int] NOT NULL,
	[idFood] [int] NOT NULL,
	[count] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[client]    Script Date: 03/05/2023 2:43:10 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[client](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[address] [nvarchar](500) NULL,
	[phone] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Food]    Script Date: 03/05/2023 2:43:10 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Food](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[idCategory] [int] NOT NULL,
	[price] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FoodCategory]    Script Date: 03/05/2023 2:43:10 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FoodCategory](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TableFood]    Script Date: 03/05/2023 2:43:10 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TableFood](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[status] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Account] ([UserName], [DisplayName], [Password], [Type]) VALUES (N'jjjj', N'gdgfd', N'1962026656160185351301320480154111117132155', 0)
INSERT [dbo].[Account] ([UserName], [DisplayName], [Password], [Type]) VALUES (N'k', N'fffffff', N'1962026656160185351301320480154111117132155', 0)
INSERT [dbo].[Account] ([UserName], [DisplayName], [Password], [Type]) VALUES (N'K9', N'RongK9i', N'1962026656160185351301320480154111117132155', 1)
INSERT [dbo].[Account] ([UserName], [DisplayName], [Password], [Type]) VALUES (N'staff', N'staff', N'1962026656160185351301320480154111117132155', 0)
GO
SET IDENTITY_INSERT [dbo].[Bill] ON 

INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [idclient], [status], [sumprice], [discount]) VALUES (1, CAST(N'2023-03-26' AS Date), CAST(N'2023-03-26' AS Date), 1, 4, 1, 140, 0)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [idclient], [status], [sumprice], [discount]) VALUES (2, CAST(N'2023-03-27' AS Date), CAST(N'2023-03-27' AS Date), 2, 4, 1, 30000, 0)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [idclient], [status], [sumprice], [discount]) VALUES (3, CAST(N'2023-03-27' AS Date), CAST(N'2023-03-27' AS Date), 8, 4, 1, 206000, 0)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [idclient], [status], [sumprice], [discount]) VALUES (4, CAST(N'2023-03-27' AS Date), CAST(N'2023-04-30' AS Date), 6, 4, 1, 25000, 0)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [idclient], [status], [sumprice], [discount]) VALUES (5, CAST(N'2023-03-27' AS Date), CAST(N'2023-04-30' AS Date), 17, 4, 1, 25000, 0)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [idclient], [status], [sumprice], [discount]) VALUES (7, CAST(N'2023-04-30' AS Date), CAST(N'2023-04-30' AS Date), 12, 4, 1, 125000, 0)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [idclient], [status], [sumprice], [discount]) VALUES (8, CAST(N'2023-04-30' AS Date), CAST(N'2023-04-30' AS Date), 7, 4, 1, 104000, 0)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [idclient], [status], [sumprice], [discount]) VALUES (9, CAST(N'2023-04-30' AS Date), CAST(N'2023-04-30' AS Date), 8, 4, 1, 35000, 0)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [idclient], [status], [sumprice], [discount]) VALUES (10, CAST(N'2023-04-30' AS Date), CAST(N'2023-04-30' AS Date), 14, 4, 1, 50000, 0)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [idclient], [status], [sumprice], [discount]) VALUES (13, CAST(N'2023-04-30' AS Date), CAST(N'2023-05-03' AS Date), 17, 5, 1, 37600, 6)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [idclient], [status], [sumprice], [discount]) VALUES (14, CAST(N'2023-04-30' AS Date), CAST(N'2023-04-30' AS Date), 20, 4, 1, 16928, 8)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [idclient], [status], [sumprice], [discount]) VALUES (15, CAST(N'2023-04-30' AS Date), CAST(N'2023-04-30' AS Date), 15, 4, 1, 21160, 8)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [idclient], [status], [sumprice], [discount]) VALUES (16, CAST(N'2023-04-30' AS Date), CAST(N'2023-04-30' AS Date), 19, 4, 1, 99000, 0)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [idclient], [status], [sumprice], [discount]) VALUES (17, CAST(N'2023-04-30' AS Date), CAST(N'2023-04-30' AS Date), 25, 10, 1, 16000, 0)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [idclient], [status], [sumprice], [discount]) VALUES (18, CAST(N'2023-05-03' AS Date), NULL, 1, 4, 0, 0, 0)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [idclient], [status], [sumprice], [discount]) VALUES (19, CAST(N'2023-05-03' AS Date), NULL, 30, 4, 0, 0, 0)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [idclient], [status], [sumprice], [discount]) VALUES (21, CAST(N'2023-05-03' AS Date), CAST(N'2023-05-03' AS Date), 24, 4, 1, 9216, 4)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [idclient], [status], [sumprice], [discount]) VALUES (24, CAST(N'2023-05-03' AS Date), CAST(N'2023-05-03' AS Date), 19, 4, 1, 48000, 20)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [idclient], [status], [sumprice], [discount]) VALUES (25, CAST(N'2023-05-03' AS Date), CAST(N'2023-05-03' AS Date), 23, 4, 1, 108000, 10)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [idclient], [status], [sumprice], [discount]) VALUES (26, CAST(N'2023-05-03' AS Date), CAST(N'2023-05-03' AS Date), 23, 4, 1, 35150, 5)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [idclient], [status], [sumprice], [discount]) VALUES (27, CAST(N'2023-05-03' AS Date), CAST(N'2023-05-03' AS Date), 24, 4, 1, 23750, 5)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [idclient], [status], [sumprice], [discount]) VALUES (28, CAST(N'2023-05-03' AS Date), CAST(N'2023-05-03' AS Date), 23, 4, 1, 328830, 3)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [idclient], [status], [sumprice], [discount]) VALUES (29, CAST(N'2023-05-03' AS Date), CAST(N'2023-05-03' AS Date), 10, 4, 1, 128250, 5)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [idclient], [status], [sumprice], [discount]) VALUES (32, CAST(N'2023-05-03' AS Date), CAST(N'2023-05-03' AS Date), 5, 4, 1, 90000, 10)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [idclient], [status], [sumprice], [discount]) VALUES (33, CAST(N'2023-05-03' AS Date), CAST(N'2023-05-03' AS Date), 27, 4, 1, 25000, 0)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [idclient], [status], [sumprice], [discount]) VALUES (34, CAST(N'2023-05-03' AS Date), CAST(N'2023-05-03' AS Date), 25, 4, 1, 30000, 0)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [idclient], [status], [sumprice], [discount]) VALUES (35, CAST(N'2023-05-03' AS Date), CAST(N'2023-05-03' AS Date), 16, 4, 1, 30000, 0)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [idclient], [status], [sumprice], [discount]) VALUES (36, CAST(N'2023-05-03' AS Date), CAST(N'2023-05-03' AS Date), 3, 4, 1, 211200, 4)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [idclient], [status], [sumprice], [discount]) VALUES (37, CAST(N'2023-05-03' AS Date), CAST(N'2023-05-03' AS Date), 11, 4, 1, 9600, 4)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [idclient], [status], [sumprice], [discount]) VALUES (38, CAST(N'2023-05-03' AS Date), CAST(N'2023-05-03' AS Date), 11, 4, 1, 9600, 4)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [idclient], [status], [sumprice], [discount]) VALUES (39, CAST(N'2023-05-03' AS Date), CAST(N'2023-05-03' AS Date), 11, 4, 1, 28800, 4)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [idclient], [status], [sumprice], [discount]) VALUES (40, CAST(N'2023-05-03' AS Date), CAST(N'2023-05-03' AS Date), 28, 4, 1, 28800, 4)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [idclient], [status], [sumprice], [discount]) VALUES (41, CAST(N'2023-05-03' AS Date), CAST(N'2023-05-03' AS Date), 20, 4, 1, 28800, 4)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [idclient], [status], [sumprice], [discount]) VALUES (42, CAST(N'2023-05-03' AS Date), CAST(N'2023-05-03' AS Date), 20, 4, 1, 9600, 4)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [idclient], [status], [sumprice], [discount]) VALUES (43, CAST(N'2023-05-03' AS Date), CAST(N'2023-05-03' AS Date), 24, 4, 1, 19200, 4)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [idclient], [status], [sumprice], [discount]) VALUES (44, CAST(N'2023-05-03' AS Date), CAST(N'2023-05-03' AS Date), 15, 4, 1, 47040, 4)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [idclient], [status], [sumprice], [discount]) VALUES (45, CAST(N'2023-05-03' AS Date), CAST(N'2023-05-03' AS Date), 24, 4, 1, 81600, 4)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [idclient], [status], [sumprice], [discount]) VALUES (46, CAST(N'2023-05-03' AS Date), CAST(N'2023-05-03' AS Date), 24, 4, 1, 32640, 4)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [idclient], [status], [sumprice], [discount]) VALUES (47, CAST(N'2023-05-03' AS Date), CAST(N'2023-05-03' AS Date), 14, 4, 1, 24000, 4)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [idclient], [status], [sumprice], [discount]) VALUES (48, CAST(N'2023-05-03' AS Date), CAST(N'2023-05-03' AS Date), 14, 4, 1, 24000, 4)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [idclient], [status], [sumprice], [discount]) VALUES (49, CAST(N'2023-05-03' AS Date), CAST(N'2023-05-03' AS Date), 14, 4, 1, 24000, 4)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [idclient], [status], [sumprice], [discount]) VALUES (50, CAST(N'2023-05-03' AS Date), CAST(N'2023-05-03' AS Date), 14, 4, 1, 24000, 4)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [idclient], [status], [sumprice], [discount]) VALUES (51, CAST(N'2023-05-03' AS Date), CAST(N'2023-05-03' AS Date), 14, 4, 1, 48000, 4)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [idclient], [status], [sumprice], [discount]) VALUES (52, CAST(N'2023-05-03' AS Date), CAST(N'2023-05-03' AS Date), 14, 4, 1, 72000, 4)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [idclient], [status], [sumprice], [discount]) VALUES (53, CAST(N'2023-05-03' AS Date), CAST(N'2023-05-03' AS Date), 14, 4, 1, 18400, 8)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [idclient], [status], [sumprice], [discount]) VALUES (54, CAST(N'2023-05-03' AS Date), CAST(N'2023-05-03' AS Date), 28, 4, 1, 18400, 8)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [idclient], [status], [sumprice], [discount]) VALUES (55, CAST(N'2023-05-03' AS Date), CAST(N'2023-05-03' AS Date), 28, 4, 1, 9200, 8)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [idclient], [status], [sumprice], [discount]) VALUES (56, CAST(N'2023-05-03' AS Date), CAST(N'2023-05-03' AS Date), 28, 4, 1, 27600, 8)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [idclient], [status], [sumprice], [discount]) VALUES (57, CAST(N'2023-05-03' AS Date), CAST(N'2023-05-03' AS Date), 28, 4, 1, 18400, 8)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [idclient], [status], [sumprice], [discount]) VALUES (58, CAST(N'2023-05-03' AS Date), CAST(N'2023-05-03' AS Date), 28, 4, 1, 9200, 8)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [idclient], [status], [sumprice], [discount]) VALUES (59, CAST(N'2023-05-03' AS Date), CAST(N'2023-05-03' AS Date), 28, 4, 1, 46000, 8)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [idclient], [status], [sumprice], [discount]) VALUES (60, CAST(N'2023-05-03' AS Date), CAST(N'2023-05-03' AS Date), 28, 4, 1, 46000, 8)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [idclient], [status], [sumprice], [discount]) VALUES (61, CAST(N'2023-05-03' AS Date), CAST(N'2023-05-03' AS Date), 2, 4, 1, 23000, 8)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [idclient], [status], [sumprice], [discount]) VALUES (62, CAST(N'2023-05-03' AS Date), CAST(N'2023-05-03' AS Date), 2, 4, 1, 78200, 8)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [idclient], [status], [sumprice], [discount]) VALUES (63, CAST(N'2023-05-03' AS Date), CAST(N'2023-05-03' AS Date), 20, 4, 1, 69000, 8)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [idclient], [status], [sumprice], [discount]) VALUES (64, CAST(N'2023-05-03' AS Date), CAST(N'2023-05-03' AS Date), 20, 4, 1, 46000, 8)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [idclient], [status], [sumprice], [discount]) VALUES (65, CAST(N'2023-05-03' AS Date), CAST(N'2023-05-03' AS Date), 11, 4, 1, 57040, 8)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [idclient], [status], [sumprice], [discount]) VALUES (66, CAST(N'2023-05-03' AS Date), CAST(N'2023-05-03' AS Date), 29, 4, 1, 22080, 8)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [idclient], [status], [sumprice], [discount]) VALUES (68, CAST(N'2023-05-03' AS Date), CAST(N'2023-05-03' AS Date), 14, 4, 1, 9600, 4)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [idclient], [status], [sumprice], [discount]) VALUES (69, CAST(N'2023-05-03' AS Date), CAST(N'2023-05-03' AS Date), 24, 4, 1, 240000, 0)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [idclient], [status], [sumprice], [discount]) VALUES (71, CAST(N'2023-05-03' AS Date), CAST(N'2023-05-03' AS Date), 15, 6, 1, 114300, 10)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [idclient], [status], [sumprice], [discount]) VALUES (73, CAST(N'2023-05-03' AS Date), NULL, 17, 7, 0, 0, 0)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [idclient], [status], [sumprice], [discount]) VALUES (74, CAST(N'2023-05-03' AS Date), NULL, 8, 5, 0, 0, 0)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateCheckOut], [idTable], [idclient], [status], [sumprice], [discount]) VALUES (75, CAST(N'2023-05-03' AS Date), NULL, 15, 6, 0, 0, 0)
SET IDENTITY_INSERT [dbo].[Bill] OFF
GO
SET IDENTITY_INSERT [dbo].[BillInfo] ON 

INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (1, 1, 8, 2)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (2, 1, 21, 2)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (3, 1, 22, 2)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (4, 2, 16, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (5, 2, 7, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (6, 3, 7, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (7, 3, 17, 5)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (8, 4, 7, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (11, 5, 7, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (12, 7, 8, 2)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (13, 8, 17, 5)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (14, 8, 8, 2)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (15, 8, 10, 2)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (16, 9, 8, 2)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (17, 9, 21, 2)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (18, 10, 8, 2)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (22, 13, 21, 2)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (23, 13, 11, 2)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (24, 14, 11, 2)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (25, 15, 7, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (26, 16, 7, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (27, 16, 15, 2)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (28, 17, 15, 2)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (29, 17, 17, 5)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (30, 18, 16, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (31, 18, 19, 2)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (32, 18, 12, 3)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (33, 19, 19, 2)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (34, 19, 20, 2)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (36, 21, 11, 2)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (39, 24, 15, 2)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (40, 25, 15, 2)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (41, 25, 7, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (42, 25, 17, 5)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (43, 26, 7, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (44, 26, 15, 2)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (45, 27, 7, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (46, 28, 7, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (47, 28, 21, 2)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (49, 28, 24, 5)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (50, 28, 20, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (51, 28, 15, 2)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (52, 29, 7, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (53, 29, 9, 5)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (54, 29, 11, 2)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (57, 32, 7, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (58, 33, 7, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (59, 34, 19, 2)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (60, 35, 21, 2)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (61, 35, 11, 2)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (62, 36, 7, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (63, 36, 9, 5)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (64, 36, 11, 2)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (65, 37, 19, 2)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (66, 38, 19, 2)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (67, 39, 19, 2)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (68, 40, 19, 2)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (69, 40, 21, 2)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (70, 41, 21, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (71, 41, 19, 2)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (72, 42, 19, 2)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (73, 43, 19, 2)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (74, 44, 7, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (75, 44, 15, 2)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (76, 45, 7, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (77, 45, 11, 2)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (78, 45, 12, 3)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (79, 46, 15, 2)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (80, 46, 11, 2)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (81, 47, 7, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (82, 48, 7, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (83, 49, 7, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (84, 50, 8, 2)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (85, 51, 8, 2)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (86, 52, 8, 2)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (87, 53, 11, 2)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (88, 54, 11, 2)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (89, 55, 11, 2)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (90, 56, 11, 2)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (91, 57, 11, 2)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (92, 58, 11, 2)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (93, 59, 12, 3)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (94, 60, 12, 3)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (95, 61, 12, 3)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (96, 62, 12, 3)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (97, 62, 11, 2)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (98, 62, 7, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (99, 63, 7, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (102, 64, 7, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (103, 65, 7, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (104, 65, 15, 2)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (105, 66, 15, 2)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (109, 68, 17, 5)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (110, 69, 7, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (111, 69, 8, 2)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (112, 69, 11, 2)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (113, 69, 12, 3)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (114, 69, 19, 2)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (115, 69, 10, 2)
GO
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (117, 71, 17, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (121, 73, 10, 2)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (122, 73, 15, 2)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (123, 74, 15, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (124, 74, 14, 2)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (125, 71, 9, 5)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (126, 75, 7, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (127, 75, 8, 2)
SET IDENTITY_INSERT [dbo].[BillInfo] OFF
GO
SET IDENTITY_INSERT [dbo].[client] ON 

INSERT [dbo].[client] ([id], [name], [address], [phone]) VALUES (4, N'Quan Tiểu Dương', N'Yên Sơn,TuyênQuang', N'0963252525')
INSERT [dbo].[client] ([id], [name], [address], [phone]) VALUES (5, N'Hoàng Hữu Tín', N'TuyênQuang', N'0963456789')
INSERT [dbo].[client] ([id], [name], [address], [phone]) VALUES (6, N'Lương Văn Sơn', N'TuyênQuang', N'0862626262')
INSERT [dbo].[client] ([id], [name], [address], [phone]) VALUES (7, N'Vũ Thị Ngọc Huyền', N'Thái Bình', N'0386174444')
INSERT [dbo].[client] ([id], [name], [address], [phone]) VALUES (9, N'Nguyễn Trung Kiên', N'Thái Nguyên', N'0386343434')
INSERT [dbo].[client] ([id], [name], [address], [phone]) VALUES (10, N'Cao Việt Hưng', N'Thái Nguyên', N'0386599999')
SET IDENTITY_INSERT [dbo].[client] OFF
GO
SET IDENTITY_INSERT [dbo].[Food] ON 

INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (7, N'Mỳ Cay Bò', 2, 25000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (8, N'Mỳ Cay Hải Sản', 2, 25000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (9, N'Mỳ Cay Thập Cẩm', 2, 25000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (10, N'Mỳ Cay Xúc Xích', 2, 25000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (11, N'Nước CoCa', 4, 10000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (12, N'Nước 7up', 4, 25000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (13, N'Nước Đá', 4, 10000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (14, N'Nước Đường Chanh', 4, 10000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (15, N'Bò Khô', 5, 12000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (16, N'Xúc Xích', 5, 5000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (17, N'Hướng Dương', 5, 2000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (18, N'Gà Khô', 5, 15000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (19, N'Trà Sữa Trân Châu Đường Đen', 6, 10000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (20, N'Trà Sữa Dâu', 6, 10000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (21, N'Trà Sữa MatCha', 6, 10000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (22, N'Thịt Trâu Gác Bếp', 5, 15000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (23, N'Trà Sữa Socola', 6, 10000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (24, N'Trà Sữa Bạc Hà', 6, 25000)
SET IDENTITY_INSERT [dbo].[Food] OFF
GO
SET IDENTITY_INSERT [dbo].[FoodCategory] ON 

INSERT [dbo].[FoodCategory] ([id], [name]) VALUES (2, N'Mỳ Cay')
INSERT [dbo].[FoodCategory] ([id], [name]) VALUES (4, N'Nước')
INSERT [dbo].[FoodCategory] ([id], [name]) VALUES (5, N'Đồ ăn vặt')
INSERT [dbo].[FoodCategory] ([id], [name]) VALUES (6, N'Trà Sữa')
INSERT [dbo].[FoodCategory] ([id], [name]) VALUES (7, N'Mỳ Cay ăn liên')
SET IDENTITY_INSERT [dbo].[FoodCategory] OFF
GO
SET IDENTITY_INSERT [dbo].[TableFood] ON 

INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (1, N'Bàn 1', N'Có người')
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (2, N'Bàn 2', N'Trống')
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (3, N'Bàn 3', N'Trống')
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (4, N'Bàn 4', N'Trống')
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (5, N'Bàn 5', N'Trống')
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (6, N'Bàn 6', N'Trống')
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (7, N'Bàn 7', N'Trống')
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (8, N'Bàn 8', N'Có người')
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (9, N'Bàn 9', N'Trống')
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (10, N'Bàn 10', N'Trống')
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (11, N'Bàn 11', N'Trống')
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (12, N'Bàn 12', N'Trống')
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (13, N'Bàn 13', N'Trống')
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (14, N'Bàn 14', N'Trống')
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (15, N'Bàn 15', N'Có người')
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (16, N'Bàn 16', N'Trống')
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (17, N'Bàn 17', N'Có người')
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (18, N'Bàn 18', N'Trống')
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (19, N'Bàn 19', N'Trống')
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (20, N'Bàn 20', N'Trống')
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (21, N'Bàn 21', N'Trống')
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (22, N'Bàn 22', N'Trống')
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (23, N'Bàn 23', N'Trống')
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (24, N'Bàn 24', N'Trống')
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (25, N'Bàn 25', N'Trống')
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (26, N'Bàn 26', N'Trống')
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (27, N'Bàn 27', N'Trống')
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (28, N'Bàn 28', N'Trống')
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (29, N'Bàn 29', N'Trống')
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (30, N'Bàn 30', N'Có người')
SET IDENTITY_INSERT [dbo].[TableFood] OFF
GO
ALTER TABLE [dbo].[Account] ADD  DEFAULT (N'Kter') FOR [DisplayName]
GO
ALTER TABLE [dbo].[Account] ADD  DEFAULT (N'1962026656160185351301320480154111117132155') FOR [Password]
GO
ALTER TABLE [dbo].[Account] ADD  DEFAULT ((0)) FOR [Type]
GO
ALTER TABLE [dbo].[Bill] ADD  DEFAULT (getdate()) FOR [DateCheckIn]
GO
ALTER TABLE [dbo].[Bill] ADD  DEFAULT ((0)) FOR [status]
GO
ALTER TABLE [dbo].[Bill] ADD  DEFAULT ((0)) FOR [sumprice]
GO
ALTER TABLE [dbo].[Bill] ADD  DEFAULT ((0)) FOR [discount]
GO
ALTER TABLE [dbo].[BillInfo] ADD  DEFAULT ((0)) FOR [count]
GO
ALTER TABLE [dbo].[client] ADD  DEFAULT (N'Khách hàng chưa có tên') FOR [name]
GO
ALTER TABLE [dbo].[Food] ADD  DEFAULT (N'Chưa đặt tên') FOR [name]
GO
ALTER TABLE [dbo].[FoodCategory] ADD  DEFAULT (N'chưa đặt tên') FOR [name]
GO
ALTER TABLE [dbo].[TableFood] ADD  DEFAULT (N'Bàn chưa có tên') FOR [name]
GO
ALTER TABLE [dbo].[TableFood] ADD  DEFAULT (N'Trống') FOR [status]
GO
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD FOREIGN KEY([idclient])
REFERENCES [dbo].[client] ([id])
GO
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD FOREIGN KEY([idTable])
REFERENCES [dbo].[TableFood] ([id])
GO
ALTER TABLE [dbo].[BillInfo]  WITH CHECK ADD FOREIGN KEY([idBill])
REFERENCES [dbo].[Bill] ([id])
GO
ALTER TABLE [dbo].[BillInfo]  WITH CHECK ADD FOREIGN KEY([idFood])
REFERENCES [dbo].[Food] ([id])
GO
ALTER TABLE [dbo].[Food]  WITH CHECK ADD FOREIGN KEY([idCategory])
REFERENCES [dbo].[FoodCategory] ([id])
GO
/****** Object:  StoredProcedure [dbo].[USP_CountFoodByCategpry]    Script Date: 03/05/2023 2:43:10 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Proc [dbo].[USP_CountFoodByCategpry]
@idCategory int
as
begin
	
	select * from Food where idCategory=@idCategory

end
GO
/****** Object:  StoredProcedure [dbo].[USP_Changediscount]    Script Date: 03/05/2023 2:43:10 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Proc [dbo].[USP_Changediscount]
@discount int,@idBill int 
as
begin
	update Bill set discount=@discount where Bill.id=@idBill
end
GO
/****** Object:  StoredProcedure [dbo].[USP_CheckOut]    Script Date: 03/05/2023 2:43:10 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Proc [dbo].[USP_CheckOut]
@idBill int,@sumprice float,@discount int
as
begin
	declare @idTable int =0
	select @idTable=TableFood.id from TableFood,Bill where TableFood.id=Bill.idTable and Bill.id=@idBill
	update TableFood set status = N'Trống' where TableFood.id=@idTable
	update Bill set status = 1,DateCheckOut=GETDATE(),sumprice=@sumprice,discount=@discount where Bill.id=@idBill
end
GO
/****** Object:  StoredProcedure [dbo].[USP_DeleteClient]    Script Date: 03/05/2023 2:43:10 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[USP_DeleteClient]
@id int
as
begin
	declare @count int = 0
	select @count=count(*) from BillInfo,Bill,client where BillInfo.idBill = Bill.id and Bill.idclient=client.id and client.id=@id
	if(@count=0)
	begin
		declare @idBill int =0
		select @idBill=Bill.id from Bill where Bill.idclient=@id
		declare @idTable int =0
		select @idTable=TableFood.id from TableFood,Bill where Bill.id=@idBill and Bill.idTable=TableFood.id
		update TableFood set status=N'Trống' where TableFood.id=@idTable
		delete Bill where Bill.id=@idBill
		delete client where client.id=@id
	end
end
GO
/****** Object:  StoredProcedure [dbo].[USP_DeleteFood]    Script Date: 03/05/2023 2:43:10 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Proc [dbo].[USP_DeleteFood]
@id int
as
begin
	declare @count int = 0
	select @count=count(*) from BillInfo where BillInfo.idFood=@id
	if(@count=0)
	begin
		delete Food where Food.id=@id
	end
end
GO
/****** Object:  StoredProcedure [dbo].[USP_DeleteFoodCategory]    Script Date: 03/05/2023 2:43:10 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[USP_DeleteFoodCategory]
@idFoodCategory int
as
begin
	declare @isidBillInfo int =0
	select @isidBillInfo=BillInfo.id from BillInfo,Food,FoodCategory where BillInfo.idFood=Food.id and Food.idCategory=@idFoodCategory
	if(@isidBillInfo=0)
	begin
	delete dbo.Food from dbo.Food,dbo.FoodCategory where dbo.Food.idCategory=dbo.FoodCategory.id and dbo.FoodCategory.id=@idFoodCategory
	delete dbo.FoodCategory where dbo.FoodCategory.id=@idFoodCategory
	end
end
GO
/****** Object:  StoredProcedure [dbo].[USP_DeleteTableBill]    Script Date: 03/05/2023 2:43:10 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Proc [dbo].[USP_DeleteTableBill]
@idBill int
as
begin
	declare @idTable int =0
	select @idTable=Bill.idTable from Bill where Bill.id=@idBill
	delete BillInfo where BillInfo.idBill=@idBill
	delete Bill where Bill.id=@idBill
	update TableFood set status=N'Trống'  where TableFood.id=@idTable

end
GO
/****** Object:  StoredProcedure [dbo].[USP_EditClient]    Script Date: 03/05/2023 2:43:10 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[USP_EditClient]-- name, address,phone
@id int , @newName nvarchar(50),@address nvarchar(500),@phone nvarchar(20)
as
begin
	if(select count(*) from Client where Client.phone=@phone and client.id != @id)=0
	update dbo.client set name=@newName,address=@address,phone=@phone  where client.id=@id
	
end
GO
/****** Object:  StoredProcedure [dbo].[USP_EditFood]    Script Date: 03/05/2023 2:43:10 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[USP_EditFood]
@newName nvarchar(100),@newidCategory int,@price float,@id int
as
begin
	if(select count(*) from Food where Food.name=@newName  and Food.id!=@id )=0
	update dbo.Food set  name=@newName, idCategory=@newidCategory , price=@price where id=@id 
end
GO
/****** Object:  StoredProcedure [dbo].[USP_EditFoodCategor]    Script Date: 03/05/2023 2:43:10 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Proc [dbo].[USP_EditFoodCategor]
@newName nvarchar(100),@id int
as
begin
	if(select count(*) from FoodCategory where FoodCategory.name=@newName )=0
	update dbo.FoodCategory set  name=@newName where id=@id 
end
GO
/****** Object:  StoredProcedure [dbo].[USP_GetAccountByUserName]    Script Date: 03/05/2023 2:43:10 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--tìm thông tin tài khoản theo tên đăng nhập 
create Proc [dbo].[USP_GetAccountByUserName]
@userName nvarchar(100)
as
begin
	select * from dbo.Account where UserName =@userName
end
GO
/****** Object:  StoredProcedure [dbo].[USP_GetListBillByDate]    Script Date: 03/05/2023 2:43:10 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[USP_GetListBillByDate]
@checkIn date,@checkOut date
as
begin
	select t.name, b.sumprice , DateCheckIn,DateCheckOut, discount
	from dbo.Bill as b,dbo.TableFood as t
	where DateCheckOut>= @checkIn and DateCheckOut<= @checkOut and b.status=1
	and t.id=b.idTable
	
	select Sum(b.sumprice)
	from dbo.Bill as b,dbo.TableFood as t
	where DateCheckIn>= @checkIn and DateCheckIn<= @checkOut and b.status=1
	and t.id=b.idTable
	
end
GO
/****** Object:  StoredProcedure [dbo].[USP_GetListBillByDateAndPage]    Script Date: 03/05/2023 2:43:10 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[USP_GetListBillByDateAndPage]
@checkIn date,@checkOut date,@page int
as
begin
	declare @pageRows int =20
	declare @selectRows int = @pageRows
	declare @exceptRows int =(@page -1) * @pageRows

	;with BillShow as (select b.id, t.name , b.sumprice , DateCheckIn,DateCheckOut, discount
	from dbo.Bill as b,dbo.TableFood as t
	where DateCheckOut>= @checkIn and DateCheckOut<= @checkOut and b.status=1
	and t.id=b.idTable)

	select Top (@selectRows) * from BillShow where id not in (select top (@exceptRows) id From BillShow)
	
end
GO
/****** Object:  StoredProcedure [dbo].[USP_GetNumBillByDate]    Script Date: 03/05/2023 2:43:10 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create Proc [dbo].[USP_GetNumBillByDate]
@checkIn date,@checkOut date
as
begin
	select count(*)
	from dbo.Bill as b,dbo.TableFood as t
	where DateCheckIn>= @checkIn and DateCheckIn<= @checkOut and b.status=1
	and t.id=b.idTable
end
GO
/****** Object:  StoredProcedure [dbo].[USP_GetTableList]    Script Date: 03/05/2023 2:43:10 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create Proc [dbo].[USP_GetTableList]
as select * from dbo.TableFood
GO
/****** Object:  StoredProcedure [dbo].[USP_InsertBill]    Script Date: 03/05/2023 2:43:10 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[USP_InsertBill]
 @idTable int,@idClient int
as
begin
	insert dbo.Bill
	(DateCheckIn,DateCheckOut,idTable,idclient,status)
	values (Getdate(),null,@idTable,@idClient,0)
end
GO
/****** Object:  StoredProcedure [dbo].[USP_InsertClient]    Script Date: 03/05/2023 2:43:10 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[USP_InsertClient]-- name, address,phone
@newName nvarchar(50),@address nvarchar(500),@phone nvarchar(20)
as
begin
	if(select count(*) from Client where Client.phone=@phone )=0
	insert dbo.Client (name,address,phone) values ( @newName , @address , @phone ) 
end
GO
/****** Object:  StoredProcedure [dbo].[USP_InsertFood]    Script Date: 03/05/2023 2:43:10 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Proc [dbo].[USP_InsertFood]
@newName nvarchar(100),@newidCategory int,@price float
as
begin
	if(select count(*) from Food where Food.name=@newName )=0
	insert dbo.Food (name,idCategory,price) values ( @newName,@newidCategory ,@price)
end
GO
/****** Object:  StoredProcedure [dbo].[USP_InsertFoodCategory]    Script Date: 03/05/2023 2:43:10 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create Proc [dbo].[USP_InsertFoodCategory]
@newName nvarchar(100)
as
begin
	if(select count(*) from FoodCategory where FoodCategory.name=@newName )=0
	insert dbo.FoodCategory (name) values ( @newName)
end
GO
/****** Object:  StoredProcedure [dbo].[USP_InsertInfo]    Script Date: 03/05/2023 2:43:10 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[USP_InsertInfo]
@idBill int, @idFood int,@count int
as
begin

	declare @isExitsBillInfo int;
	declare @foodCount int =1;

	select @isExitsBillInfo = id,@foodCount=b.count
	from dbo.BillInfo as b where idBill=@idBill and idFood =@idFood

	if(@isExitsBillInfo>0)
	begin 
		
		declare @newcount int =@foodcount+@count
		if(@newcount>0)
			update dbo.BillInfo set count=@newcount where idFood=@idFood
		else
			delete dbo.BillInfo where idBill= @idBill and idFood=@idFood
	end
	else
	begin
		if(@count>0)
		insert dbo.BillInfo
		(idBill,idFood,count)
		values (@idBill,@idFood,@count)
		declare @idTable int =0
		select @idTable=TableFood.id from TableFood,Bill where TableFood.id=Bill.idTable and Bill.id=@idBill
		update dbo.TableFood set status = N'Có người' where TableFood.id=@idTable
	end
end
GO
/****** Object:  StoredProcedure [dbo].[USP_Login]    Script Date: 03/05/2023 2:43:10 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Bảo  mật trong Proc phòng được lỗi 
--										' or 1=1--
--mật khẩu luôn đúng
create Proc [dbo].[USP_Login] @userName nvarchar(100), @passWord nvarchar(1000)
as
begin
	select * from dbo.Account where UserName=@userName and Password=@passWord
end
GO
/****** Object:  StoredProcedure [dbo].[USP_ReportBill]    Script Date: 03/05/2023 2:43:10 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[USP_ReportBill]
@idTable int
as
begin
	select f.name,bi.count,f.price,b.discount,(bi.count*f.price-b.discount*bi.count*f.price/100) as totalPrice from dbo.BillInfo as bi,dbo.Bill as b, dbo.Food as f  where bi.idBill=b.id and bi.idFood=f.id and b.status=0 and b.idTable=@idTable


end
GO
/****** Object:  StoredProcedure [dbo].[USP_SwichTable]    Script Date: 03/05/2023 2:43:10 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Proc [dbo].[USP_SwichTable]
@id1 int,@id2 int
as 
begin
	declare @idBill1 int =0
	select @idBill1=Bill.id from Bill,TableFood where Bill.idTable=TableFood.id and TableFood.id=@id1 and Bill.status=0
	
	
	if(@idBill1>0)
	begin

		declare @idBill2 int =0
		select @idBill2=Bill.id from Bill,TableFood where Bill.idTable=TableFood.id and TableFood.id=@id2 and Bill.status=0
		
		if(@idBill2>0)
		begin
			update Bill set idTable = @id2 where Bill.id=@idBill1
			update Bill set idTable = @id1 where Bill.id=@idBill2
		end
		else
		begin
			update Bill set idTable = @id2 where Bill.id=@idBill1
			update TableFood set status=N'Trống' where TableFood.id=@id1
			update TableFood set status=N'Có người' from TableFood,Bill where TableFood.id=Bill.idTable and Bill.id=@idBill1
		end
	end
end
GO
/****** Object:  StoredProcedure [dbo].[USP_UpdateAccount]    Script Date: 03/05/2023 2:43:10 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Proc [dbo].[USP_UpdateAccount]
@userName nvarchar(100),@displayName nvarchar(100),@password nvarchar(100),@newpassword nvarchar(100)
as 
begin
	declare @isRightPass int =0
	select @isRightPass=count(*) from dbo.Account where UserName=@userName and Password=@password
	if(@isRightPass=1)
	begin
		if(@newpassword=null or @newpassword='')
		begin
			update dbo.Account set DisplayName =@displayName where UserName=@userName
		end
		else
		begin
			update dbo.Account set DisplayName =@displayName,Password=@newpassword where UserName=@userName
		end
	end

end
GO
USE [master]
GO
ALTER DATABASE [QuanLyQuanMyCayThanhNhan] SET  READ_WRITE 
GO
