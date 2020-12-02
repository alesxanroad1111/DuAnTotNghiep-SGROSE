USE [master]
GO
/****** Object:  Database [SG_Rose]    Script Date: 12/2/2020 12:50:02 PM ******/
CREATE DATABASE [SG_Rose]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SG_Rose', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\SG_Rose.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'SG_Rose_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\SG_Rose_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [SG_Rose] SET COMPATIBILITY_LEVEL = 120
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
ALTER DATABASE [SG_Rose] SET DELAYED_DURABILITY = DISABLED 
GO
USE [SG_Rose]
GO
/****** Object:  Table [dbo].[Actives]    Script Date: 12/2/2020 12:50:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Actives](
	[Id] [int] NOT NULL,
	[Name] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Companys]    Script Date: 12/2/2020 12:50:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Companys](
	[Name] [nvarchar](500) NOT NULL,
	[Address] [nvarchar](500) NOT NULL,
	[Fax] [varchar](10) NULL,
	[Link] [varchar](500) NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Image] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Contacts]    Script Date: 12/2/2020 12:50:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Contacts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[Topic] [nvarchar](100) NULL,
	[Message] [nvarchar](4000) NOT NULL,
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
/****** Object:  Table [dbo].[DiscountPrograms]    Script Date: 12/2/2020 12:50:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DiscountPrograms](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[DateStart] [date] NOT NULL,
	[DateEnd] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FlowerPromotionPrograms]    Script Date: 12/2/2020 12:50:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FlowerPromotionPrograms](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DiscountId] [int] NOT NULL,
	[FlowerID] [int] NOT NULL,
	[TypePercent] [int] NOT NULL,
	[TypePrice] [int] NOT NULL,
	[Amount] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Flowers]    Script Date: 12/2/2020 12:50:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Flowers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[TypeId] [int] NULL,
	[Amount] [int] NOT NULL,
	[Price] [int] NULL,
	[Image] [nvarchar](100) NULL,
	[Notes] [nvarchar](4000) NULL,
	[Createdtime] [date] NULL DEFAULT (getdate()),
	[Updatedtime] [date] NULL DEFAULT (getdate()),
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Genders]    Script Date: 12/2/2020 12:50:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Genders](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Ispaids]    Script Date: 12/2/2020 12:50:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ispaids](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Orders]    Script Date: 12/2/2020 12:50:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[Address] [nvarchar](500) NULL,
	[TotalMoney] [int] NULL,
	[Status] [int] NULL,
	[Ispaid] [int] NULL,
	[Createdtime] [date] NULL DEFAULT (getdate()),
	[Updatedtime] [date] NULL DEFAULT (getdate()),
	[Name] [nvarchar](50) NULL,
	[NumberPhone] [varchar](10) NULL,
	[Email] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OrdersDetails]    Script Date: 12/2/2020 12:50:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrdersDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[FlowerId] [int] NOT NULL,
	[Price] [int] NOT NULL,
	[Amount] [int] NOT NULL,
	[Totalprice] [int] NOT NULL,
	[Createdtime] [date] NULL DEFAULT (getdate()),
	[Updatedtime] [date] NULL DEFAULT (getdate()),
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderStatus]    Script Date: 12/2/2020 12:50:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderStatus](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Roles]    Script Date: 12/2/2020 12:50:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Staffs]    Script Date: 12/2/2020 12:50:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Staffs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[Password] [nvarchar](100) NOT NULL,
	[Birthday] [date] NOT NULL,
	[Address] [nvarchar](200) NOT NULL,
	[Avatar] [varchar](200) NULL,
	[Gender] [int] NULL,
	[Phone] [varchar](20) NOT NULL,
	[Role] [int] NOT NULL,
	[Createdtime] [date] NULL DEFAULT (getdate()),
	[Updatedtime] [date] NULL DEFAULT (getdate()),
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TypesOfFlowers]    Script Date: 12/2/2020 12:50:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypesOfFlowers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Image] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 12/2/2020 12:50:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Email] [nvarchar](200) NULL,
	[Address] [nvarchar](200) NULL,
	[Phone] [nvarchar](100) NULL,
	[Password] [nvarchar](100) NULL,
	[Avatar] [varchar](200) NULL,
	[Gender] [int] NULL,
	[IsActive] [int] NULL,
	[Createdtime] [date] NULL DEFAULT (getdate()),
	[Updatedtime] [date] NULL DEFAULT (getdate()),
	[Birthday] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Contacts]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Contacts]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[FlowerPromotionPrograms]  WITH CHECK ADD FOREIGN KEY([DiscountId])
REFERENCES [dbo].[DiscountPrograms] ([Id])
GO
ALTER TABLE [dbo].[FlowerPromotionPrograms]  WITH CHECK ADD FOREIGN KEY([DiscountId])
REFERENCES [dbo].[DiscountPrograms] ([Id])
GO
ALTER TABLE [dbo].[FlowerPromotionPrograms]  WITH CHECK ADD FOREIGN KEY([FlowerID])
REFERENCES [dbo].[Flowers] ([Id])
GO
ALTER TABLE [dbo].[FlowerPromotionPrograms]  WITH CHECK ADD FOREIGN KEY([FlowerID])
REFERENCES [dbo].[Flowers] ([Id])
GO
ALTER TABLE [dbo].[Flowers]  WITH CHECK ADD FOREIGN KEY([TypeId])
REFERENCES [dbo].[TypesOfFlowers] ([Id])
GO
ALTER TABLE [dbo].[Flowers]  WITH CHECK ADD FOREIGN KEY([TypeId])
REFERENCES [dbo].[TypesOfFlowers] ([Id])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([Ispaid])
REFERENCES [dbo].[Ispaids] ([Id])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([Ispaid])
REFERENCES [dbo].[Ispaids] ([Id])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([Status])
REFERENCES [dbo].[OrderStatus] ([Id])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([Status])
REFERENCES [dbo].[OrderStatus] ([Id])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[OrdersDetails]  WITH CHECK ADD FOREIGN KEY([FlowerId])
REFERENCES [dbo].[Flowers] ([Id])
GO
ALTER TABLE [dbo].[OrdersDetails]  WITH CHECK ADD FOREIGN KEY([FlowerId])
REFERENCES [dbo].[Flowers] ([Id])
GO
ALTER TABLE [dbo].[OrdersDetails]  WITH CHECK ADD FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([Id])
GO
ALTER TABLE [dbo].[OrdersDetails]  WITH CHECK ADD FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([Id])
GO
ALTER TABLE [dbo].[Staffs]  WITH CHECK ADD FOREIGN KEY([Gender])
REFERENCES [dbo].[Genders] ([Id])
GO
ALTER TABLE [dbo].[Staffs]  WITH CHECK ADD FOREIGN KEY([Gender])
REFERENCES [dbo].[Genders] ([Id])
GO
ALTER TABLE [dbo].[Staffs]  WITH CHECK ADD FOREIGN KEY([Role])
REFERENCES [dbo].[Roles] ([Id])
GO
ALTER TABLE [dbo].[Staffs]  WITH CHECK ADD FOREIGN KEY([Role])
REFERENCES [dbo].[Roles] ([Id])
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD FOREIGN KEY([Gender])
REFERENCES [dbo].[Genders] ([Id])
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD FOREIGN KEY([Gender])
REFERENCES [dbo].[Genders] ([Id])
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD FOREIGN KEY([IsActive])
REFERENCES [dbo].[Actives] ([Id])
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD FOREIGN KEY([IsActive])
REFERENCES [dbo].[Actives] ([Id])
GO
/****** Object:  StoredProcedure [dbo].[sp_LichSuMuaHang]    Script Date: 12/2/2020 12:50:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_LichSuMuaHang](@UserId INT)
AS BEGIN
	SELECT
		ordd.Id,
		ord.UserId,
		fl.Name, 
		fl.Image, 
		ordd.Price, 
		ordd.Amount, 
		ordd.Totalprice
	FROM OrdersDetails ordd
		JOIN Orders ord ON ord.Id = ordd.OrderId 
		JOIN Flowers fl ON fl.Id = ordd.FlowerId
	WHERE ord.UserId = @UserId
END



GO
/****** Object:  StoredProcedure [dbo].[sp_ReportsFowers]    Script Date: 12/2/2020 12:50:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ReportsFowers]
AS BEGIN
	SELECT
	c.Name as [Group],
	sum(p.Price * p.Amount) as sum,
	sum(p.Amount) as count,
	min(p.Price) as Min,
	max(p.Price) as Max,
	AVG(p.Price) as Avg
	From Flowers as p
	inner join TypesOfFlowers as c
	on p.TypeId = c.Id
	Group  by c.Name
END


GO
USE [master]
GO
ALTER DATABASE [SG_Rose] SET  READ_WRITE 
GO
