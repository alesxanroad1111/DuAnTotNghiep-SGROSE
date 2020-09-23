USE [master]
GO
/****** Object:  Database [SG_Rose]    Script Date: 9/23/2020 1:58:12 PM ******/
CREATE DATABASE [SG_Rose]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SG_Rose', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\SG_Rose.mdf' , SIZE = 4160KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'SG_Rose_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\SG_Rose_log.ldf' , SIZE = 1040KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
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
/****** Object:  Table [dbo].[Bills]    Script Date: 9/23/2020 1:58:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Bills](
	[Id] [varchar](20) NOT NULL,
	[StaffId] [varchar](20) NULL,
	[UserId] [varchar](20) NULL,
	[Total_Money] [int] NULL,
	[Created_time] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BillsDetail]    Script Date: 9/23/2020 1:58:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BillsDetail](
	[BillId] [varchar](20) NULL,
	[Flowerld] [varchar](20) NULL,
	[Amount] [int] NULL,
	[Price] [int] NULL,
	[Total_Money] [int] NULL,
	[Created_time] [date] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Companys]    Script Date: 9/23/2020 1:58:12 PM ******/
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
/****** Object:  Table [dbo].[Contacts]    Script Date: 9/23/2020 1:58:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Contacts](
	[Id] [int] NOT NULL,
	[UserId] [varchar](20) NULL,
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
/****** Object:  Table [dbo].[Flowers]    Script Date: 9/23/2020 1:58:12 PM ******/
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
/****** Object:  Table [dbo].[Orders]    Script Date: 9/23/2020 1:58:12 PM ******/
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
/****** Object:  Table [dbo].[OrdersDetails]    Script Date: 9/23/2020 1:58:12 PM ******/
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
/****** Object:  Table [dbo].[Roles]    Script Date: 9/23/2020 1:58:12 PM ******/
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
/****** Object:  Table [dbo].[Staffs]    Script Date: 9/23/2020 1:58:12 PM ******/
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
/****** Object:  Table [dbo].[Supports]    Script Date: 9/23/2020 1:58:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Supports](
	[Id] [int] NOT NULL,
	[StaffId] [varchar](20) NULL,
	[Phone] [varchar](20) NOT NULL,
	[Status] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TypesOfFlowers]    Script Date: 9/23/2020 1:58:12 PM ******/
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
/****** Object:  Table [dbo].[Users]    Script Date: 9/23/2020 1:58:12 PM ******/
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
ALTER TABLE [dbo].[Bills] ADD  DEFAULT (getdate()) FOR [Created_time]
GO
ALTER TABLE [dbo].[BillsDetail] ADD  DEFAULT (getdate()) FOR [Created_time]
GO
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
ALTER TABLE [dbo].[Bills]  WITH CHECK ADD FOREIGN KEY([StaffId])
REFERENCES [dbo].[Staffs] ([Id])
GO
ALTER TABLE [dbo].[Bills]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[BillsDetail]  WITH CHECK ADD FOREIGN KEY([BillId])
REFERENCES [dbo].[Bills] ([Id])
GO
ALTER TABLE [dbo].[BillsDetail]  WITH CHECK ADD FOREIGN KEY([Flowerld])
REFERENCES [dbo].[Flowers] ([Id])
GO
ALTER TABLE [dbo].[Contacts]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
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
ALTER TABLE [dbo].[Supports]  WITH CHECK ADD FOREIGN KEY([StaffId])
REFERENCES [dbo].[Staffs] ([Id])
GO
USE [master]
GO
ALTER DATABASE [SG_Rose] SET  READ_WRITE 
GO
