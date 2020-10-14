USE [master]
GO
/****** Object:  Database [SG_Rose]    Script Date: 9/23/2020 1:58:12 PM ******/
CREATE DATABASE [SG_Rose]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SG_Rose', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\SG_Rose.mdf' , SIZE = 4160KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'SG_Rose_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\SG_Rose_log.ldf' , SIZE = 1040KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
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
/****** Object:  Table [dbo].[DiscountProgram]    Script Date: 9/23/2020 1:58:12 PM ******/
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


/****** Object:  Table [dbo].[Flower_PromotionProgram]    Script Date: 9/23/2020 1:58:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Flower_PromotionProgram](
	[DiscountID] [int] IDENTITY(1,1) NOT NULL,
	[FlowerID] [varchar](20) NOT NULL,
	[Type_Percent] [int] NOT NULL,
	[Type_Price] [int] NOT NULL,
	[Amount] [int] NOT NULL,
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
ALTER TABLE [dbo].[Flowers]  WITH CHECK ADD FOREIGN KEY([TypeId])
REFERENCES [dbo].[TypesOfFlowers] ([Id])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([Userid])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[OrdersDetails]  WITH CHECK ADD FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([Id])
GO

ALTER TABLE Staffs WITH CHECK ADD FOREIGN KEY ([Roles]) 
REFERENCES  [dbo].[Roles]([Id])
GO
ALTER TABLE Flower_PromotionProgram WITH CHECK ADD FOREIGN KEY ([DiscountID]) 
REFERENCES  [dbo].[DiscountProgram]([Id])
GO
ALTER TABLE Flower_PromotionProgram WITH CHECK ADD FOREIGN KEY ([FlowerID]) 
REFERENCES  [dbo].[Flowers]([Id])
GO

USE [master]
GO
ALTER DATABASE [SG_Rose] SET  READ_WRITE 
GO


USE [SG_Rose]
INSERT [dbo].[Companys] ([Name], [Address], [PhoneNumber], [Fax], [Link]) VALUES ('Flower Store', 'Quận 1', '0346789123','1', 'Flowercorner')
INSERT [dbo].[Companys] ([Name], [Address], [PhoneNumber], [Fax], [Link]) VALUES ('SG Rose', 'Quận 3', '0347852139','1', 'Flowercorner')
INSERT [dbo].[Companys] ([Name], [Address], [PhoneNumber], [Fax], [Link]) VALUES ('Flower Love', 'Tân Phú', '0348213597','1', 'Flowercorner')
INSERT [dbo].[Companys] ([Name], [Address], [PhoneNumber], [Fax], [Link]) VALUES ('Fresh Flower ', 'Quận 7', '0356478923','1', 'Flowercorner')
INSERT [dbo].[Companys] ([Name], [Address], [PhoneNumber], [Fax], [Link]) VALUES ('Flower World', 'Bình Tân', '0357452789','1', 'Flowercorner')


USE [SG_Rose]
INSERT [dbo].[Contacts] ([Id], [StaffId], [Topic], [Message], [Phone], [Map]) VALUES (1, 'NV001', 'Chất lượng hoa', 'Chất lượng hoa', N'0913731119', NULL)
INSERT [dbo].[Contacts] ([Id], [StaffId], [Topic], [Message], [Phone], [Map]) VALUES (2, 'NV002', 'Xin thực tập', N'Em xin vào làm nhân viên', N'0123687456', NULL)
INSERT [dbo].[Contacts] ([Id], [StaffId], [Topic], [Message], [Phone], [Map]) VALUES (3, 'NV003', N'Thêm số lượng', '......', N'0974532567', NULL)

USE [SG_Rose]
INSERT [dbo].[Flowers] ([Id], [Name], [TypeId], [Amount], [Price], [Image], [Notes], [Created_time], [Update_time]) VALUES (N'HC001', N'Ấm áp', N'HC', 99, 250000, N'Amap.jpg', NULL, CAST(0x9D410B00 AS Date), CAST(0x9D410B00 AS Date))
INSERT [dbo].[Flowers] ([Id], [Name], [TypeId], [Amount], [Price], [Image], [Notes], [Created_time], [Update_time]) VALUES (N'HC002', N'Bên nhau', N'HC', 99, 250000, N'Bennhau.jpg', NULL, CAST(0x9D410B00 AS Date), CAST(0x9D410B00 AS Date))
INSERT [dbo].[Flowers] ([Id], [Name], [TypeId], [Amount], [Price], [Image], [Notes], [Created_time], [Update_time]) VALUES (N'HC003', N'Chung một nha', N'HC', 99, 250000, N'Chung1nha.jpg', NULL, CAST(0x9D410B00 AS Date), CAST(0x9D410B00 AS Date))
INSERT [dbo].[Flowers] ([Id], [Name], [TypeId], [Amount], [Price], [Image], [Notes], [Created_time], [Update_time]) VALUES (N'HC004', N'Cô dâu kim cương', N'HC', 99, 250000, N'Codaukimcuong.jpg', NULL, CAST(0x9D410B00 AS Date), CAST(0x9D410B00 AS Date))
INSERT [dbo].[Flowers] ([Id], [Name], [TypeId], [Amount], [Price], [Image], [Notes], [Created_time], [Update_time]) VALUES (N'HC005', N'Cô dâu môi hồng', N'HC', 99, 250000, N'Codaumoihong.jpg', NULL, CAST(0x9D410B00 AS Date), CAST(0x9D410B00 AS Date))
INSERT [dbo].[Flowers] ([Id], [Name], [TypeId], [Amount], [Price], [Image], [Notes], [Created_time], [Update_time]) VALUES (N'HC006', N'Hoa cưới tiếng yêu', N'HC', 99, 250000, N'Hoacuoitiengyeu.jpg', NULL, CAST(0x9D410B00 AS Date), CAST(0x9D410B00 AS Date))
INSERT [dbo].[Flowers] ([Id], [Name], [TypeId], [Amount], [Price], [Image], [Notes], [Created_time], [Update_time]) VALUES (N'HC007', N'Mắc cưới', N'HC', 99, 250000, N'Maccuoi.jpg', NULL, CAST(0x9D410B00 AS Date), CAST(0x9D410B00 AS Date))
INSERT [dbo].[Flowers] ([Id], [Name], [TypeId], [Amount], [Price], [Image], [Notes], [Created_time], [Update_time]) VALUES (N'HC008', N'Ngày hạnh phúc', N'HC', 99, 250000, N'Ngayhanhphuc.jpg', NULL, CAST(0x9D410B00 AS Date), CAST(0x9D410B00 AS Date))
INSERT [dbo].[Flowers] ([Id], [Name], [TypeId], [Amount], [Price], [Image], [Notes], [Created_time], [Update_time]) VALUES (N'HC009', N'Ngày rạng ngời', N'HC', 99, 250000, N'Ngayrangngoi.jpg', NULL, CAST(0x9D410B00 AS Date), CAST(0x9D410B00 AS Date))
INSERT [dbo].[Flowers] ([Id], [Name], [TypeId], [Amount], [Price], [Image], [Notes], [Created_time], [Update_time]) VALUES (N'HC010', N'Ngày sánh đôi', N'HC', 99, 250000, N'Ngaysanhdoi.jpg', NULL, CAST(0x9D410B00 AS Date), CAST(0x9D410B00 AS Date))
INSERT [dbo].[Flowers] ([Id], [Name], [TypeId], [Amount], [Price], [Image], [Notes], [Created_time], [Update_time]) VALUES (N'HCB001', N'Buồn an giấc', N'HCB', 99, 150000, N'Buonangiac.jpg', NULL, CAST(0x9D410B00 AS Date), CAST(0x9D410B00 AS Date))
INSERT [dbo].[Flowers] ([Id], [Name], [TypeId], [Amount], [Price], [Image], [Notes], [Created_time], [Update_time]) VALUES (N'HCB002', N'Buồn vĩnh hằng', N'HCB', 99, 150000, N'Buonvinhhang.jpg', NULL, CAST(0x9D410B00 AS Date), CAST(0x9D410B00 AS Date))
INSERT [dbo].[Flowers] ([Id], [Name], [TypeId], [Amount], [Price], [Image], [Notes], [Created_time], [Update_time]) VALUES (N'HCB003', N'Buồn vô thường', N'HCB', 99, 150000, N'Buonvothuong.jpg', NULL, CAST(0x9D410B00 AS Date), CAST(0x9D410B00 AS Date))
INSERT [dbo].[Flowers] ([Id], [Name], [TypeId], [Amount], [Price], [Image], [Notes], [Created_time], [Update_time]) VALUES (N'HCB004', N'Dòng thời gian', N'HCB', 99, 150000, N'Dongthoigian.jpg', NULL, CAST(0x9D410B00 AS Date), CAST(0x9D410B00 AS Date))
INSERT [dbo].[Flowers] ([Id], [Name], [TypeId], [Amount], [Price], [Image], [Notes], [Created_time], [Update_time]) VALUES (N'HCB005', N'Lời cuối', N'HCB', 99, 150000, N'Loicuoi.jpg', NULL, CAST(0x9D410B00 AS Date), CAST(0x9D410B00 AS Date))
INSERT [dbo].[Flowers] ([Id], [Name], [TypeId], [Amount], [Price], [Image], [Notes], [Created_time], [Update_time]) VALUES (N'HCB006', N'Luyến tiếc', N'HCB', 99, 150000, N'Luyentiec.jpg', NULL, CAST(0x9D410B00 AS Date), CAST(0x9D410B00 AS Date))
INSERT [dbo].[Flowers] ([Id], [Name], [TypeId], [Amount], [Price], [Image], [Notes], [Created_time], [Update_time]) VALUES (N'HCB007', N'Nhớ thương', N'HCB', 99, 150000, N'Nhothuong.jpg', NULL, CAST(0x9D410B00 AS Date), CAST(0x9D410B00 AS Date))
INSERT [dbo].[Flowers] ([Id], [Name], [TypeId], [Amount], [Price], [Image], [Notes], [Created_time], [Update_time]) VALUES (N'HCB008', N'Phù du ', N'HCB', 99, 150000, N'Phudu.jpg', NULL, CAST(0x9D410B00 AS Date), CAST(0x9D410B00 AS Date))
INSERT [dbo].[Flowers] ([Id], [Name], [TypeId], [Amount], [Price], [Image], [Notes], [Created_time], [Update_time]) VALUES (N'HCB009', N'Thiên thu', N'HCB', 99, 150000, N'Thienthu.jpg', NULL, CAST(0x9D410B00 AS Date), CAST(0x9D410B00 AS Date))
INSERT [dbo].[Flowers] ([Id], [Name], [TypeId], [Amount], [Price], [Image], [Notes], [Created_time], [Update_time]) VALUES (N'HCB010', N'Yên nghỉ', N'HCB', 99, 150000, N'Yennghi.jpg', NULL, CAST(0x9D410B00 AS Date), CAST(0x9D410B00 AS Date))
INSERT [dbo].[Flowers] ([Id], [Name], [TypeId], [Amount], [Price], [Image], [Notes], [Created_time], [Update_time]) VALUES (N'HCM001', N'Đại lời', N'HCM', 99, 200000, N'Dailoi.jpg', NULL, CAST(0x9D410B00 AS Date), CAST(0x9D410B00 AS Date))
INSERT [dbo].[Flowers] ([Id], [Name], [TypeId], [Amount], [Price], [Image], [Notes], [Created_time], [Update_time]) VALUES (N'HCM002', N'Đại thành công', N'HCM', 99, 200000, N'Daithanhcong.jpg', NULL, CAST(0x9D410B00 AS Date), CAST(0x9D410B00 AS Date))
INSERT [dbo].[Flowers] ([Id], [Name], [TypeId], [Amount], [Price], [Image], [Notes], [Created_time], [Update_time]) VALUES (N'HCM003', N'Dôm hoa kết trái', N'HCM', 99, 200000, N'Domhoakettrai.jpg', NULL, CAST(0x9D410B00 AS Date), CAST(0x9D410B00 AS Date))
INSERT [dbo].[Flowers] ([Id], [Name], [TypeId], [Amount], [Price], [Image], [Notes], [Created_time], [Update_time]) VALUES (N'HCM004', N'Hưng thịnh', N'HCM', 99, 200000, N'Hungthinh.jpg', NULL, CAST(0x9D410B00 AS Date), CAST(0x9D410B00 AS Date))
INSERT [dbo].[Flowers] ([Id], [Name], [TypeId], [Amount], [Price], [Image], [Notes], [Created_time], [Update_time]) VALUES (N'HCM005', N'Khởi đầu mới', N'HCM', 99, 200000, N'Khoidaumoi.jpg', NULL, CAST(0x9D410B00 AS Date), CAST(0x9D410B00 AS Date))
INSERT [dbo].[Flowers] ([Id], [Name], [TypeId], [Amount], [Price], [Image], [Notes], [Created_time], [Update_time]) VALUES (N'HCM006', N'Phát tài', N'HCM', 99, 200000, N'Phattai.jpg', NULL, CAST(0x9D410B00 AS Date), CAST(0x9D410B00 AS Date))
INSERT [dbo].[Flowers] ([Id], [Name], [TypeId], [Amount], [Price], [Image], [Notes], [Created_time], [Update_time]) VALUES (N'HCM007', N'Phú quý', N'HCM', 99, 200000, N'Phuquy.jpg', NULL, CAST(0x9D410B00 AS Date), CAST(0x9D410B00 AS Date))
INSERT [dbo].[Flowers] ([Id], [Name], [TypeId], [Amount], [Price], [Image], [Notes], [Created_time], [Update_time]) VALUES (N'HCM008', N'Tấn tài', N'HCM', 99, 200000, N'Tantai.jpg', NULL, CAST(0x9D410B00 AS Date), CAST(0x9D410B00 AS Date))
INSERT [dbo].[Flowers] ([Id], [Name], [TypeId], [Amount], [Price], [Image], [Notes], [Created_time], [Update_time]) VALUES (N'HCM009', N'Thuận buồm xuôi gió', N'HCM', 99, 200000, N'Thuanbuomxuoigio.jpg', NULL, CAST(0x9D410B00 AS Date), CAST(0x9D410B00 AS Date))
INSERT [dbo].[Flowers] ([Id], [Name], [TypeId], [Amount], [Price], [Image], [Notes], [Created_time], [Update_time]) VALUES (N'HCM010', N'Trang trọng', N'HCM', 99, 200000, N'Trangtrong.jpg', NULL, CAST(0x9D410B00 AS Date), CAST(0x9D410B00 AS Date))
INSERT [dbo].[Flowers] ([Id], [Name], [TypeId], [Amount], [Price], [Image], [Notes], [Created_time], [Update_time]) VALUES (N'HKT001', N'Chúc thành công', N'HKT', 99, 225000, N'Chucthanhcong.jpg', NULL, CAST(0x9D410B00 AS Date), CAST(0x9D410B00 AS Date))
INSERT [dbo].[Flowers] ([Id], [Name], [TypeId], [Amount], [Price], [Image], [Notes], [Created_time], [Update_time]) VALUES (N'HKT002', N'Khai trương', N'HKT', 99, 225000, N'Khaitruongphonvinh.jpg', NULL, CAST(0x9D410B00 AS Date), CAST(0x9D410B00 AS Date))
INSERT [dbo].[Flowers] ([Id], [Name], [TypeId], [Amount], [Price], [Image], [Notes], [Created_time], [Update_time]) VALUES (N'HKT003', N'Khoe sắc thắm', N'HKT', 99, 225000, N'Khoesactham.jpg', NULL, CAST(0x9D410B00 AS Date), CAST(0x9D410B00 AS Date))
INSERT [dbo].[Flowers] ([Id], [Name], [TypeId], [Amount], [Price], [Image], [Notes], [Created_time], [Update_time]) VALUES (N'HKT004', N'Lạng hoa thành công', N'HKT', 99, 225000, N'Langhoathanhcong.png', NULL, CAST(0x9D410B00 AS Date), CAST(0x9D410B00 AS Date))
INSERT [dbo].[Flowers] ([Id], [Name], [TypeId], [Amount], [Price], [Image], [Notes], [Created_time], [Update_time]) VALUES (N'HKT005', N'Mừng hồng phát', N'HKT', 99, 225000, N'Munghongphat.jpg', NULL, CAST(0x9D410B00 AS Date), CAST(0x9D410B00 AS Date))
INSERT [dbo].[Flowers] ([Id], [Name], [TypeId], [Amount], [Price], [Image], [Notes], [Created_time], [Update_time]) VALUES (N'HKT006', N'Mừng vươn lên', N'HKT', 99, 225000, N'Mungvuonlen.jpg', NULL, CAST(0x9D410B00 AS Date), CAST(0x9D410B00 AS Date))
INSERT [dbo].[Flowers] ([Id], [Name], [TypeId], [Amount], [Price], [Image], [Notes], [Created_time], [Update_time]) VALUES (N'HKT007', N'Sức sống', N'HKT', 99, 225000, N'Sucsong.jpg', NULL, CAST(0x9D410B00 AS Date), CAST(0x9D410B00 AS Date))
INSERT [dbo].[Flowers] ([Id], [Name], [TypeId], [Amount], [Price], [Image], [Notes], [Created_time], [Update_time]) VALUES (N'HKT008', N'Trường đại cát', N'HKT', 99, 225000, N'Truongdaicat.jpg', NULL, CAST(0x9D410B00 AS Date), CAST(0x9D410B00 AS Date))
INSERT [dbo].[Flowers] ([Id], [Name], [TypeId], [Amount], [Price], [Image], [Notes], [Created_time], [Update_time]) VALUES (N'HKT009', N'Vạn lộc', N'HKT', 99, 225000, N'Vanloc.jpg', NULL, CAST(0x9D410B00 AS Date), CAST(0x9D410B00 AS Date))
INSERT [dbo].[Flowers] ([Id], [Name], [TypeId], [Amount], [Price], [Image], [Notes], [Created_time], [Update_time]) VALUES (N'HKT010', N'Vững tin', N'HKT', 99, 225000, N'Vungtin.jpg', NULL, CAST(0x9D410B00 AS Date), CAST(0x9D410B00 AS Date))
INSERT [dbo].[Flowers] ([Id], [Name], [TypeId], [Amount], [Price], [Image], [Notes], [Created_time], [Update_time]) VALUES (N'HSN001', N'Câu hát', N'HSN', 99, 200000, N'Cauhat.jpg', NULL, CAST(0x9D410B00 AS Date), CAST(0x9D410B00 AS Date))
INSERT [dbo].[Flowers] ([Id], [Name], [TypeId], [Amount], [Price], [Image], [Notes], [Created_time], [Update_time]) VALUES (N'HSN002', N'Cổ tích', N'HSN', 99, 200000, N'Cotich.jpg', NULL, CAST(0x9D410B00 AS Date), CAST(0x9D410B00 AS Date))
INSERT [dbo].[Flowers] ([Id], [Name], [TypeId], [Amount], [Price], [Image], [Notes], [Created_time], [Update_time]) VALUES (N'HSN003', N'Đáng yêu', N'HSN', 99, 200000, N'Dangyeu.jpg', NULL, CAST(0x9D410B00 AS Date), CAST(0x9D410B00 AS Date))
INSERT [dbo].[Flowers] ([Id], [Name], [TypeId], [Amount], [Price], [Image], [Notes], [Created_time], [Update_time]) VALUES (N'HSN004', N'Luôn bên yêu', N'HSN', 99, 200000, N'Luonbenem.jpg', NULL, CAST(0x9D410B00 AS Date), CAST(0x9D410B00 AS Date))
INSERT [dbo].[Flowers] ([Id], [Name], [TypeId], [Amount], [Price], [Image], [Notes], [Created_time], [Update_time]) VALUES (N'HSN005', N'Only you', N'HSN', 99, 200000, N'Onlyyou.jpg', NULL, CAST(0x9D410B00 AS Date), CAST(0x9D410B00 AS Date))
INSERT [dbo].[Flowers] ([Id], [Name], [TypeId], [Amount], [Price], [Image], [Notes], [Created_time], [Update_time]) VALUES (N'HSN006', N'Tinh khiết', N'HSN', 99, 200000, N'Tinhkhiet.jpg', NULL, CAST(0x9D410B00 AS Date), CAST(0x9D410B00 AS Date))
INSERT [dbo].[Flowers] ([Id], [Name], [TypeId], [Amount], [Price], [Image], [Notes], [Created_time], [Update_time]) VALUES (N'HSN007', N'Tỏa sáng', N'HSN', 99, 200000, N'Toasang.jpg', NULL, CAST(0x9D410B00 AS Date), CAST(0x9D410B00 AS Date))
INSERT [dbo].[Flowers] ([Id], [Name], [TypeId], [Amount], [Price], [Image], [Notes], [Created_time], [Update_time]) VALUES (N'HSN008', N'Tươi hồng', N'HSN', 99, 200000, N'Tuoihong.jpg', NULL, CAST(0x9D410B00 AS Date), CAST(0x9D410B00 AS Date))
INSERT [dbo].[Flowers] ([Id], [Name], [TypeId], [Amount], [Price], [Image], [Notes], [Created_time], [Update_time]) VALUES (N'HSN009', N'Tươi sáng', N'HSN', 99, 200000, N'Tuoisang.jpg', NULL, CAST(0x9D410B00 AS Date), CAST(0x9D410B00 AS Date))
INSERT [dbo].[Flowers] ([Id], [Name], [TypeId], [Amount], [Price], [Image], [Notes], [Created_time], [Update_time]) VALUES (N'HSN010', N'Yêu kiều', N'HSN', 99, 200000, N'YeuKieu.jpg', NULL, CAST(0x9D410B00 AS Date), CAST(0x9D410B00 AS Date))


SET IDENTITY_INSERT [dbo].[Orders] ON
INSERT [dbo].[Orders] ([Id], [Userid], [Username] , [Address], [Total_Money], [Is_paid]) VALUES ('1', '001', N'Nguyễn Văn Tèo', N'33 Nguyễn Văn Lượng, Gò Vấp', '1500000', 1)
INSERT [dbo].[Orders] ([Id], [Userid], [Username] , [Address], [Total_Money], [Is_paid]) VALUES ('2', '002', N'Nguyễn Thị Nở', N'11 Nguyễn Oanh, Gò Vấp', '350000', 1)
INSERT [dbo].[Orders] ([Id], [Userid], [Username] , [Address], [Total_Money], [Is_paid]) VALUES ('3', '003', N'Đinh Trần Tuyết Rơi', N'12 Lê Văn Việt, Quận 9', '4500000', 1)
INSERT [dbo].[Orders] ([Id], [Userid], [Username] , [Address], [Total_Money], [Is_paid]) VALUES ('4', '004', N'Nguyễn Văn Tèo', N'33 Nguyễn Văn Lượng, Gò Vấp', '5500000', 1)
INSERT [dbo].[Orders] ([Id], [Userid], [Username] , [Address], [Total_Money], [Is_paid]) VALUES ('5', '005', N'Trần Thị Hoa Hòe', N'123 Quang Trung, Gò Vấp', '3500000', 1)
INSERT [dbo].[Orders] ([Id], [Userid], [Username] , [Address], [Total_Money], [Is_paid]) VALUES ('6', '006', N'Nguyễn Sừng Trâu', N'135 Lê Đại Hành', '4200000', 1)
INSERT [dbo].[Orders] ([Id], [Userid], [Username] , [Address], [Total_Money], [Is_paid]) VALUES ('7', '007', N'Lê Lợi', N'333 Phan Văn Trị, Gò Vấp', '2200000', 1)
INSERT [dbo].[Orders] ([Id], [Userid], [Username] , [Address], [Total_Money], [Is_paid]) VALUES ('8', '008', N'Đầu Cắt Môi', N'244 Thảo Điền, Quận 2', '2300000', 1)
INSERT [dbo].[Orders] ([Id], [Userid], [Username] , [Address], [Total_Money], [Is_paid]) VALUES ('9', '009', N'BigCity Boiz', N'32 Nguyễn Kiệm, Gò Vấp', '2500000', 1)
INSERT [dbo].[Orders] ([Id], [Userid], [Username] , [Address], [Total_Money], [Is_paid]) VALUES ('10', '010', N'Among Us', N'334 Phạm Văn Đồng, Gò Vấp', '6700000', 1)
SET IDENTITY_INSERT [dbo].[Orders] OFF 

USE [SG_Rose]
INSERT [dbo].[OrdersDetails] ([Id], [OrderId],[FlowerId], [Price], [Amount], [Total_price]) VALUES ('OD001', '1', N'HSN010', 200000, 2, 400000)
INSERT [dbo].[OrdersDetails] ([Id], [OrderId],[FlowerId], [Price], [Amount], [Total_price]) VALUES ('OD002', '2', N'HC001', 250000, 2, 500000)
INSERT [dbo].[OrdersDetails] ([Id], [OrderId],[FlowerId], [Price], [Amount], [Total_price]) VALUES ('OD003', '3', N'HCB007', 150000, 1, 150000)
INSERT [dbo].[OrdersDetails] ([Id], [OrderId],[FlowerId], [Price], [Amount], [Total_price]) VALUES ('OD004', '4', N'HSN005', 200000, 5, 1000000)
INSERT [dbo].[OrdersDetails] ([Id], [OrderId],[FlowerId], [Price], [Amount], [Total_price]) VALUES ('OD005', '5', N'HSN009', 200000, 6, 1200000)
INSERT [dbo].[OrdersDetails] ([Id], [OrderId],[FlowerId], [Price], [Amount], [Total_price]) VALUES ('OD006', '6', N'HSN007', 200000, 8, 1600000)
INSERT [dbo].[OrdersDetails] ([Id], [OrderId],[FlowerId], [Price], [Amount], [Total_price]) VALUES ('OD007', '7', N'HKT009', 225000, 10, 2250000)
INSERT [dbo].[OrdersDetails] ([Id], [OrderId],[FlowerId], [Price], [Amount], [Total_price]) VALUES ('OD008', '8', N'HC002', 250000, 2, 500000)
INSERT [dbo].[OrdersDetails] ([Id], [OrderId],[FlowerId], [Price], [Amount], [Total_price]) VALUES ('OD009', '9', N'HCB003', 150000, 4, 450000)
INSERT [dbo].[OrdersDetails] ([Id], [OrderId],[FlowerId], [Price], [Amount], [Total_price]) VALUES ('OD010', '10', N'HSN010', 200000, 12, 2400000)
INSERT [dbo].[OrdersDetails] ([Id], [OrderId],[FlowerId], [Price], [Amount], [Total_price]) VALUES ('OD011', '1', N'HSN002', 200000, 22, 4400000)
INSERT [dbo].[OrdersDetails] ([Id], [OrderId],[FlowerId], [Price], [Amount], [Total_price]) VALUES ('OD012', '5', N'HCM003', 200000, 5, 1000000)
INSERT [dbo].[OrdersDetails] ([Id], [OrderId],[FlowerId], [Price], [Amount], [Total_price]) VALUES ('OD013', '6', N'HSN010', 200000, 3, 600000)
INSERT [dbo].[OrdersDetails] ([Id], [OrderId],[FlowerId], [Price], [Amount], [Total_price]) VALUES ('OD014', '7', N'HC008', 250000, 8, 2000000)
INSERT [dbo].[OrdersDetails] ([Id], [OrderId],[FlowerId], [Price], [Amount], [Total_price]) VALUES ('OD015', '9', N'HSN010', 200000, 9, 1800000)

USE [SG_Rose]
INSERT [dbo].[Roles] ([Id], [Name]) VALUES ('1', 'Admin')
INSERT [dbo].[Roles] ([Id], [Name]) VALUES ('2', 'Staff')

USE SG_Rose
INSERT [dbo].[Staffs] ([Id], [Name], [Email], [Password], [Birthday], [Address], [Avatar], [Gender], [Phone], [Role]) VALUES ('NV001', N'Trần Công Truyền', N'truyentran20172201@gmail.com', N'123' , '2000/01/22', N'1144 Lê Đức Thọ Gò Vấp', 'nhanvien1.jpg', 1 , '0962086560',1)
INSERT [dbo].[Staffs] ([Id], [Name], [Email], [Password], [Birthday], [Address], [Avatar], [Gender], [Phone], [Role]) VALUES ('NV002', N'Nguyễn Đức Hòa', N'duchoa3320000@gmail.com', N'123' , '2000/01/01' , N'Hooc Môn', 'nhanvien2.jpg', 1 , '0123738492', 1)
INSERT [dbo].[Staffs] ([Id], [Name], [Email], [Password], [Birthday], [Address], [Avatar], [Gender], [Phone], [Role]) VALUES ('NV003', N'Doanh Ngọc Diễm', N'diemdoanhngoc123@gmail.com', N'123' , '2000/01/01' , N'Bình Thạnh', 'nhanvien3.jpg', 1 , '0123738492', 1)
INSERT [dbo].[Staffs] ([Id], [Name], [Email], [Password], [Birthday], [Address], [Avatar], [Gender], [Phone], [Role]) VALUES ('NV004', N'Trần Đại Hưng', N'hungtran123@gmail.com', N'123' , '2000/02/04' , N'Thủ Đức', 'nhanvien4.jpg', 1 , '0123738432', 1)
INSERT [dbo].[Staffs] ([Id], [Name], [Email], [Password], [Birthday], [Address], [Avatar], [Gender], [Phone], [Role]) VALUES ('NV005', N'Hồ Phi Long', N'longbigay@gmail.com', N'123' , '2000/12/12' , N'Quận 2', 'nhanvien5.jpg', 1 , '0829069648', 1 )
INSERT [dbo].[Staffs] ([Id], [Name], [Email], [Password], [Birthday], [Address], [Avatar], [Gender], [Phone], [Role]) VALUES ('NV006', N'Đầu Cắt Moiz', N'Moizcatdau123@gmail.com', N'123' , '2000/11/21' , N'Quận1', 'nhanvien6.jpg', 1 , '0123728492', 2)

USE [SG_Rose]
INSERT [dbo].[DiscountProgram] ([Id], [Name], [Date_Start], [Date_End]) VALUES (11, 'Tình yêu vĩnh cửu', '2020/02/10','2020/02/14')
INSERT [dbo].[DiscountProgram] ([Id], [Name], [Date_Start], [Date_End]) VALUES (22, '8/3 bên cạnh phụ nữ thân yêu', '2020/03/01','2020/03/08')
INSERT [dbo].[DiscountProgram] ([Id], [Name], [Date_Start], [Date_End]) VALUES (33, '20/10 của các tình yêu', '2020/10/15','2020/10/20')
INSERT [dbo].[DiscountProgram] ([Id], [Name], [Date_Start], [Date_End]) VALUES (44, '20/11 ngày nhà giáo việt nam', '2020/11/15','2020/11/20')
INSERT [dbo].[DiscountProgram] ([Id], [Name], [Date_Start], [Date_End]) VALUES (55, 'Giáng sinh anh lành', '2020/12/20','2020/12/25')

USE [SG_Rose]
INSERT [dbo].[Flower_PromotionProgram] ([DiscountID], [FlowerID], [Type_Percent], [Type_Price], [Amount]) VALUES (11, 'HC001', '2020/02/10','2020/02/14')


USE [SG_Rose]
INSERT [dbo].[TypesOfFlowers] ([Id], [Name], [Image]) VALUES (N'HC', N'Hoa cưới', NULL)
INSERT [dbo].[TypesOfFlowers] ([Id], [Name], [Image]) VALUES (N'HCB', N'Hoa chi buồn', NULL)
INSERT [dbo].[TypesOfFlowers] ([Id], [Name], [Image]) VALUES (N'HCM', N'Hoa chúc mừng', NULL)
INSERT [dbo].[TypesOfFlowers] ([Id], [Name], [Image]) VALUES (N'HKT', N'Hoa khai trương', NULL)
INSERT [dbo].[TypesOfFlowers] ([Id], [Name], [Image]) VALUES (N'HSN', N'Hoa sinh nhật', NULL)

USE [SG_Rose]
INSERT [dbo].[Users] ([Id], [Name], [Email], [Address], [Phone],[Password], [Avatar],[Gender],[Is_Active]) VALUES ('001', N'Nguyễn Đức Hòa', N'duchoa3320000@gmail.com', N'Hóc Môn', '0962543840',N'123','hoa.jpg',1,1)
INSERT [dbo].[Users] ([Id], [Name], [Email], [Address], [Phone],[Password], [Avatar],[Gender],[Is_Active]) VALUES ('002', N'Trần Công Truyền', N'truyentran20172201@gmail.com', N'Gò Vấp', '0962086560',N'123','truyen.jpg',1,1)
INSERT [dbo].[Users] ([Id], [Name], [Email], [Address], [Phone],[Password], [Avatar],[Gender],[Is_Active]) VALUES ('003', N'Doanh Ngọc Diễm', N'diem@gmail.com', N'Bình Thạnh', '0962789456',N'123','diem.jpg',1,1)
INSERT [dbo].[Users] ([Id], [Name], [Email], [Address], [Phone],[Password], [Avatar],[Gender],[Is_Active]) VALUES ('004', N'Hồ Phi Long', N'longho2390@gmail.com', N'Quận 2', '0707919529',N'123','long.jpg',1,1)
INSERT [dbo].[Users] ([Id], [Name], [Email], [Address], [Phone],[Password], [Avatar],[Gender],[Is_Active]) VALUES ('005', N'Trần Đại Hưng', N'walker545vn@gmail.com', N'Thủ Đức', '0913731119',N'123','hung.jpg',1,1)
INSERT [dbo].[Users] ([Id], [Name], [Email], [Address], [Phone],[Password], [Avatar],[Gender],[Is_Active]) VALUES ('006', N'Nguyễn Chi Pu', N'chipu123@gmail.com', N'Tân Bình', '0154879652',N'123','chipu.jpg',0,1)
INSERT [dbo].[Users] ([Id], [Name], [Email], [Address], [Phone],[Password], [Avatar],[Gender],[Is_Active]) VALUES ('007', N'Thiều Bảo Trâm', N'thieutram@gmail.com', N'Thủ Đức', '0945687545',N'123','tram.jpg',0,1)
INSERT [dbo].[Users] ([Id], [Name], [Email], [Address], [Phone],[Password], [Avatar],[Gender],[Is_Active]) VALUES ('008', N'Nguyễn Quang Hải', N'quanghai@gmail.com', N'Quận 9', '0353349526',N'123','hai.jpg',1,1)
INSERT [dbo].[Users] ([Id], [Name], [Email], [Address], [Phone],[Password], [Avatar],[Gender],[Is_Active]) VALUES ('009', N'Nguyễn Công Phượng', N'congphuong@gmail.com', N'Bình Tân', '0745678912',N'123','phuong.jpg',1,1)
INSERT [dbo].[Users] ([Id], [Name], [Email], [Address], [Phone],[Password], [Avatar],[Gender],[Is_Active]) VALUES ('010', N'Nguyễn Phương Dung', N'phuongdung@gmail.com', N'Củ Chi', '0987965123',N'123','dung.jpg',0,1)
