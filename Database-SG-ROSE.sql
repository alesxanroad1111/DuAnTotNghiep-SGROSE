USE [master]
GO
/****** Object:  Database [SG_Rose]    Script Date: 10/17/2020 10:08:46 AM ******/
CREATE DATABASE [SG_Rose]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SG_Rose', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\SG_Rose.mdf' , SIZE = 4160KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'SG_Rose_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\SG_Rose_log.ldf' , SIZE = 1088KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [SG_Rose] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SG_Rose].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SG_Rose] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SG_Rose] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SG_Rose] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SG_Rose] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SG_Rose] SET ARITHABORT OFF 
GO
ALTER DATABASE [SG_Rose] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [SG_Rose] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [SG_Rose] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SG_Rose] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SG_Rose] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SG_Rose] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SG_Rose] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SG_Rose] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SG_Rose] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SG_Rose] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SG_Rose] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SG_Rose] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SG_Rose] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SG_Rose] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SG_Rose] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SG_Rose] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SG_Rose] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SG_Rose] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SG_Rose] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SG_Rose] SET  MULTI_USER 
GO
ALTER DATABASE [SG_Rose] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SG_Rose] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SG_Rose] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SG_Rose] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [SG_Rose]
GO
/****** Object:  Table [dbo].[Companys]    Script Date: 10/17/2020 10:08:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Companys](
	[Name] [varchar](500) NULL,
	[Address] [varchar](500) NULL,
	[PhoneNumber] [varchar](10) NULL,
	[Fax] [varchar](20) NULL,
	[Link] [varchar](500) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Contacts]    Script Date: 10/17/2020 10:08:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Contacts](
	[Id] [int] NOT NULL,
	[StaffId] [varchar](20) NULL,
	[Topic] [varchar](100) NULL,
	[Message] [varchar](5000) NOT NULL,
	[Phone] [varchar](20) NOT NULL,
	[Map] [varchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DiscountProgram]    Script Date: 10/17/2020 10:08:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DiscountProgram](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[Date_Start] [date] NOT NULL,
	[Date_End] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Flower_PromotionProgram]    Script Date: 10/17/2020 10:08:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[Flower_PromotionProgram](
	[DiscountID] [int] NOT NULL,
	[FlowerID] [varchar](20) NOT NULL,
	[Type_Percent] [int] NOT NULL,
	[Type_Price] [int] NOT NULL,
	[Amount] [int] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Flowers]    Script Date: 10/17/2020 10:08:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Flowers](
	[Id] [varchar](20) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[TypeId] [varchar](20) NULL,
	[Amount] [int] NOT NULL,
	[Price] [int] NULL,
	[Image] [nvarchar](100) NULL,
	[Notes] [nvarchar](500) NULL,
	[Created_time] [date] NULL,
	[Update_time] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 10/17/2020 10:08:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Userid] [varchar](20) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](200) NOT NULL,
	[Total_Money] [int] NULL,
	[Status] [int] NULL,
	[Is_paid] [int] NULL,
	[Created_time] [date] NULL,
	[Updated_time] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OrdersDetails]    Script Date: 10/17/2020 10:08:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OrdersDetails](
	[Id] [varchar](20) NOT NULL,
	[OrderId] [int] NOT NULL,
	[FlowerId] [varchar](20) NOT NULL,
	[Price] [int] NOT NULL,
	[Amount] [int] NOT NULL,
	[Total_price] [int] NOT NULL,
	[Created_time] [date] NULL,
	[Updated_time] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 10/17/2020 10:08:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [int] NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[Created_time] [date] NULL,
	[Updated_time] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Staffs]    Script Date: 10/17/2020 10:08:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Staffs](
	[Id] [varchar](20) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[Password] [nvarchar](100) NOT NULL,
	[Birthday] [date] NOT NULL,
	[Address] [nvarchar](200) NOT NULL,
	[Avatar] [varchar](200) NULL,
	[Gender] [int] NULL,
	[Phone] [varchar](20) NOT NULL,
	[Role] [int] NOT NULL,
	[Created_time] [date] NULL,
	[Updated_time] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TypesOfFlowers]    Script Date: 10/17/2020 10:08:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TypesOfFlowers](
	[Id] [varchar](20) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Image] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Users]    Script Date: 10/17/2020 10:08:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [varchar](20) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[Address] [nvarchar](200) NOT NULL,
	[Phone] [varchar](20) NOT NULL,
	[Password] [nvarchar](100) NOT NULL,
	[Avatar] [varchar](200) NULL,
	[Gender] [int] NULL,
	[Is_Active] [tinyint] NOT NULL,
	[Created_time] [date] NULL,
	[Updated_time] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Companys] ([Name], [Address], [PhoneNumber], [Fax], [Link]) VALUES (N'Flower Store', N'Qu?n 1', N'0346789123', N'1', N'Flowercorner')
INSERT [dbo].[Companys] ([Name], [Address], [PhoneNumber], [Fax], [Link]) VALUES (N'SG Rose', N'Qu?n 3', N'0347852139', N'1', N'Flowercorner')
INSERT [dbo].[Companys] ([Name], [Address], [PhoneNumber], [Fax], [Link]) VALUES (N'Flower Love', N'Tan Phú', N'0348213597', N'1', N'Flowercorner')
INSERT [dbo].[Companys] ([Name], [Address], [PhoneNumber], [Fax], [Link]) VALUES (N'Fresh Flower ', N'Qu?n 7', N'0356478923', N'1', N'Flowercorner')
INSERT [dbo].[Companys] ([Name], [Address], [PhoneNumber], [Fax], [Link]) VALUES (N'Flower World', N'Bình Tan', N'0357452789', N'1', N'Flowercorner')
INSERT [dbo].[Roles] ([Id], [Name], [Created_time], [Updated_time]) VALUES (1, N'Admin', CAST(0xB2410B00 AS Date), CAST(0xB2410B00 AS Date))
INSERT [dbo].[Roles] ([Id], [Name], [Created_time], [Updated_time]) VALUES (2, N'Staff', CAST(0xB2410B00 AS Date), CAST(0xB2410B00 AS Date))
INSERT [dbo].[Staffs] ([Id], [Name], [Email], [Password], [Birthday], [Address], [Avatar], [Gender], [Phone], [Role], [Created_time], [Updated_time]) VALUES (N'NV001', N'Trần Công Truyền', N'truyentran20172201@gmail.com', N'123', CAST(0x1C240B00 AS Date), N'1144 Lê Đức Thọ Gò Vấp', N'nhanvien1.jpg', 1, N'0962086560', 1, CAST(0xB2410B00 AS Date), CAST(0xB2410B00 AS Date))
INSERT [dbo].[Staffs] ([Id], [Name], [Email], [Password], [Birthday], [Address], [Avatar], [Gender], [Phone], [Role], [Created_time], [Updated_time]) VALUES (N'NV002', N'Nguyễn Đức Hòa', N'duchoa3320000@gmail.com', N'123', CAST(0x07240B00 AS Date), N'Hooc Môn', N'nhanvien2.jpg', 1, N'0123738492', 1, CAST(0xB2410B00 AS Date), CAST(0xB2410B00 AS Date))
INSERT [dbo].[Staffs] ([Id], [Name], [Email], [Password], [Birthday], [Address], [Avatar], [Gender], [Phone], [Role], [Created_time], [Updated_time]) VALUES (N'NV003', N'Doanh Ngọc Diễm', N'diemdoanhngoc123@gmail.com', N'123', CAST(0x07240B00 AS Date), N'Bình Thạnh', N'nhanvien3.jpg', 1, N'0123738492', 1, CAST(0xB2410B00 AS Date), CAST(0xB2410B00 AS Date))
INSERT [dbo].[Staffs] ([Id], [Name], [Email], [Password], [Birthday], [Address], [Avatar], [Gender], [Phone], [Role], [Created_time], [Updated_time]) VALUES (N'NV004', N'Trần Đại Hưng', N'hungtran123@gmail.com', N'123', CAST(0x29240B00 AS Date), N'Thủ Đức', N'nhanvien4.jpg', 1, N'0123738432', 1, CAST(0xB2410B00 AS Date), CAST(0xB2410B00 AS Date))
INSERT [dbo].[Staffs] ([Id], [Name], [Email], [Password], [Birthday], [Address], [Avatar], [Gender], [Phone], [Role], [Created_time], [Updated_time]) VALUES (N'NV005', N'Hồ Phi Long', N'longbigay@gmail.com', N'123', CAST(0x61250B00 AS Date), N'Quận 2', N'nhanvien5.jpg', 1, N'0829069648', 1, CAST(0xB2410B00 AS Date), CAST(0xB2410B00 AS Date))
INSERT [dbo].[Staffs] ([Id], [Name], [Email], [Password], [Birthday], [Address], [Avatar], [Gender], [Phone], [Role], [Created_time], [Updated_time]) VALUES (N'NV006', N'Đầu Cắt Moiz', N'Moizcatdau123@gmail.com', N'123', CAST(0x4C250B00 AS Date), N'Quận1', N'nhanvien6.jpg', 1, N'0123728492', 2, CAST(0xB2410B00 AS Date), CAST(0xB2410B00 AS Date))
ALTER TABLE [dbo].[Flowers] ADD  DEFAULT (getdate()) FOR [Created_time]
GO
ALTER TABLE [dbo].[Flowers] ADD  DEFAULT (getdate()) FOR [Update_time]
GO
ALTER TABLE [dbo].[Orders] ADD  DEFAULT (getdate()) FOR [Created_time]
GO
ALTER TABLE [dbo].[Orders] ADD  DEFAULT (getdate()) FOR [Updated_time]
GO
ALTER TABLE [dbo].[OrdersDetails] ADD  DEFAULT (getdate()) FOR [Created_time]
GO
ALTER TABLE [dbo].[OrdersDetails] ADD  DEFAULT (getdate()) FOR [Updated_time]
GO
ALTER TABLE [dbo].[Roles] ADD  DEFAULT (getdate()) FOR [Created_time]
GO
ALTER TABLE [dbo].[Roles] ADD  DEFAULT (getdate()) FOR [Updated_time]
GO
ALTER TABLE [dbo].[Staffs] ADD  DEFAULT (getdate()) FOR [Created_time]
GO
ALTER TABLE [dbo].[Staffs] ADD  DEFAULT (getdate()) FOR [Updated_time]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (getdate()) FOR [Created_time]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (getdate()) FOR [Updated_time]
GO
ALTER TABLE [dbo].[Contacts]  WITH CHECK ADD FOREIGN KEY([StaffId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Flower_PromotionProgram]  WITH CHECK ADD FOREIGN KEY([DiscountID])
REFERENCES [dbo].[DiscountProgram] ([Id])
GO
ALTER TABLE [dbo].[Flower_PromotionProgram]  WITH CHECK ADD FOREIGN KEY([FlowerID])
REFERENCES [dbo].[Flowers] ([Id])
GO
ALTER TABLE [dbo].[Flowers]  WITH CHECK ADD FOREIGN KEY([TypeId])
REFERENCES [dbo].[TypesOfFlowers] ([Id])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([Userid])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[OrdersDetails]  WITH CHECK ADD FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([Id])
GO
USE [master]
GO
ALTER DATABASE [SG_Rose] SET  READ_WRITE 
GO
