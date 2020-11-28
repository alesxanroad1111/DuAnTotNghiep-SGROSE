USE [SG_Rose]
GO
/****** Object:  Database [SG_Rose]    Script Date: 11/23/2020 2:18:37 PM ******/
CREATE DATABASE [SG_Rose]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SG_Rose', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\SG_Rose.mdf' , SIZE = 4160KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'SG_Rose_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\SG_Rose_log.ldf' , SIZE = 1040KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
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
/****** Object:  Table [dbo].[Actives]    Script Date: 11/23/2020 2:18:37 PM ******/
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
/****** Object:  Table [dbo].[Companys]    Script Date: 11/23/2020 2:18:37 PM ******/
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
/****** Object:  Table [dbo].[Contacts]    Script Date: 11/23/2020 2:18:37 PM ******/
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
/****** Object:  Table [dbo].[DiscountPrograms]    Script Date: 11/23/2020 2:18:37 PM ******/
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
/****** Object:  Table [dbo].[FlowerPromotionPrograms]    Script Date: 11/23/2020 2:18:37 PM ******/
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
/****** Object:  Table [dbo].[Flowers]    Script Date: 11/23/2020 2:18:37 PM ******/
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
	[Notes] [nvarchar](500) NULL,
	[Createdtime] [date] NULL,
	[Updatedtime] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Genders]    Script Date: 11/23/2020 2:18:37 PM ******/
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
/****** Object:  Table [dbo].[Ispaids]    Script Date: 11/23/2020 2:18:37 PM ******/
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
/****** Object:  Table [dbo].[Orders]    Script Date: 11/23/2020 2:18:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[Address] [nvarchar](500) NULL,
	[TotalMoney] [int] NULL,
	[Status] [int] NULL,
	[Ispaid] [int] NULL,
	[Createdtime] [date] NULL,
	[Updatedtime] [date] NULL,
	[Name] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrdersDetails]    Script Date: 11/23/2020 2:18:37 PM ******/
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
	[Createdtime] [date] NULL,
	[Updatedtime] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderStatus]    Script Date: 11/23/2020 2:18:37 PM ******/
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
/****** Object:  Table [dbo].[Roles]    Script Date: 11/23/2020 2:18:37 PM ******/
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
/****** Object:  Table [dbo].[Staffs]    Script Date: 11/23/2020 2:18:37 PM ******/
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
	[Createdtime] [date] NULL,
	[Updatedtime] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TypesOfFlowers]    Script Date: 11/23/2020 2:18:37 PM ******/
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
/****** Object:  Table [dbo].[Users]    Script Date: 11/23/2020 2:18:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[Address] [nvarchar](200) NOT NULL,
	[Phone] [varchar](20) NOT NULL,
	[Password] [nvarchar](100) NOT NULL,
	[Avatar] [varchar](200) NULL,
	[Gender] [int] NULL,
	[IsActive] [int] NULL,
	[Createdtime] [date] NULL,
	[Updatedtime] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Actives] ([Id], [Name]) VALUES (1, N'Active')
INSERT [dbo].[Actives] ([Id], [Name]) VALUES (2, N'Ban')
SET IDENTITY_INSERT [dbo].[Companys] ON 

INSERT [dbo].[Companys] ([Name], [Address], [Fax], [Link], [Id], [Image]) VALUES (N'Flower Store', N'Quận 1', N'0346789123', N'Flowercorner', 1, NULL)
SET IDENTITY_INSERT [dbo].[Companys] OFF
SET IDENTITY_INSERT [dbo].[Contacts] ON 

INSERT [dbo].[Contacts] ([Id], [UserId], [Topic], [Message], [Phone], [Map]) VALUES (1, 1, N'Ch?t lu?ng hoa', N'Ch?t lu?ng hoa', N'0913731119', NULL)
INSERT [dbo].[Contacts] ([Id], [UserId], [Topic], [Message], [Phone], [Map]) VALUES (2, 2, N'Xin th?c t?p', N'Em xin vào làm nhan viên', N'0123687456', NULL)
INSERT [dbo].[Contacts] ([Id], [UserId], [Topic], [Message], [Phone], [Map]) VALUES (3, 3, N'Thêm s? lu?ng', N'......', N'0974532567', NULL)
INSERT [dbo].[Contacts] ([Id], [UserId], [Topic], [Message], [Phone], [Map]) VALUES (4, 4, N'Ch?t lu?ng hoa', N'Ch?t lu?ng hoa', N'0913731119', NULL)
SET IDENTITY_INSERT [dbo].[Contacts] OFF
SET IDENTITY_INSERT [dbo].[DiscountPrograms] ON 

INSERT [dbo].[DiscountPrograms] ([Id], [Name], [DateStart], [DateEnd]) VALUES (1, N'Tình yêu vinh c?u', CAST(0xB8400B00 AS Date), CAST(0xBC400B00 AS Date))
INSERT [dbo].[DiscountPrograms] ([Id], [Name], [DateStart], [DateEnd]) VALUES (2, N'8/3 bên c?nh ph? n? than yêu', CAST(0xCC400B00 AS Date), CAST(0xD3400B00 AS Date))
INSERT [dbo].[DiscountPrograms] ([Id], [Name], [DateStart], [DateEnd]) VALUES (3, N'20/10 c?a các tình yêu', CAST(0xB0410B00 AS Date), CAST(0xB5410B00 AS Date))
INSERT [dbo].[DiscountPrograms] ([Id], [Name], [DateStart], [DateEnd]) VALUES (4, N'20/11 ngày nhà giáo vi?t nam', CAST(0xCF410B00 AS Date), CAST(0xD4410B00 AS Date))
INSERT [dbo].[DiscountPrograms] ([Id], [Name], [DateStart], [DateEnd]) VALUES (5, N'Giáng sinh anh lành', CAST(0xF2410B00 AS Date), CAST(0xF7410B00 AS Date))
SET IDENTITY_INSERT [dbo].[DiscountPrograms] OFF
SET IDENTITY_INSERT [dbo].[FlowerPromotionPrograms] ON 

INSERT [dbo].[FlowerPromotionPrograms] ([Id], [DiscountId], [FlowerID], [TypePercent], [TypePrice], [Amount]) VALUES (11, 1, 2, 20, 0, 10)
INSERT [dbo].[FlowerPromotionPrograms] ([Id], [DiscountId], [FlowerID], [TypePercent], [TypePrice], [Amount]) VALUES (12, 2, 9, 0, 250000, 20)
INSERT [dbo].[FlowerPromotionPrograms] ([Id], [DiscountId], [FlowerID], [TypePercent], [TypePrice], [Amount]) VALUES (13, 3, 9, 50, 0, 15)
INSERT [dbo].[FlowerPromotionPrograms] ([Id], [DiscountId], [FlowerID], [TypePercent], [TypePrice], [Amount]) VALUES (14, 4, 4, 10, 0, 30)
INSERT [dbo].[FlowerPromotionPrograms] ([Id], [DiscountId], [FlowerID], [TypePercent], [TypePrice], [Amount]) VALUES (15, 5, 2, 0, 250000, 20)
SET IDENTITY_INSERT [dbo].[FlowerPromotionPrograms] OFF
SET IDENTITY_INSERT [dbo].[Flowers] ON 

INSERT [dbo].[Flowers] ([Id], [Name], [TypeId], [Amount], [Price], [Image], [Notes], [Createdtime], [Updatedtime]) VALUES (2, N'Ấm áp', 1, 99, 250000, N'Amap.jpg', N'Lẵng hoa Ấm áp  được tạo nên từ những bông hoa hồng kem, đồng tiền hồng, cẩm chướng hồng, ly hồng và lá phụ trang trí. Lẵng hoa thích hợp dành tặng cho những người thân yêu của bạn. Hãy làm cho người nhận cảm thấy hạnh phúc và được yêu thương khi nhận được giỏ hoa này nhé.', CAST(0xC8410B00 AS Date), CAST(0xC8410B00 AS Date))
INSERT [dbo].[Flowers] ([Id], [Name], [TypeId], [Amount], [Price], [Image], [Notes], [Createdtime], [Updatedtime]) VALUES (3, N'Bên nhau', 1, 99, 250000, N'Bennhau.jpg', N'Chút nhẹ nhàng của hồng pastel và hồng vàng kết hợp cùng sắc tím, trắng dành cho các cô nàng ngọt ngào, lãng mạn, dễ thương trong ngày trọng đại của cuộc đời khi sánh đôi cùng người mình yêu thương.', CAST(0xC8410B00 AS Date), CAST(0xC8410B00 AS Date))
INSERT [dbo].[Flowers] ([Id], [Name], [TypeId], [Amount], [Price], [Image], [Notes], [Createdtime], [Updatedtime]) VALUES (4, N'Chung một nha', 2, 99, 250000, N'Chung1nha.jpg', N'Giây phút về " một nhà" hẳn là giây phút mà biết bao người hồi hộp mong đợi. Khoảnh khắc được mặc chiếc váy cưới lộng lẫy và trên tay là một bó hoa đầy xinh tươi hẳn là giây phút hạnh phúc nhất trong cuộc đời người con gái. Hãy để bó hoa cầm tay với gam màu tươi sáng tạo nên từ hồng vàng và đồng tiền trắng góp phần tô nên đám cưới đẹp như mơ của bạn nhé', CAST(0xC8410B00 AS Date), CAST(0xC8410B00 AS Date))
INSERT [dbo].[Flowers] ([Id], [Name], [TypeId], [Amount], [Price], [Image], [Notes], [Createdtime], [Updatedtime]) VALUES (5, N'Cô dâu kim cương', 1, 99, 250000, N'Codaukimcuong.jpg', N'Cô dâu nào lại không muốn ngày trọng đại của mình thật đặc biệt, từ đường may trên chiếc váy cưới đến bó hoa cầm tay xinh xắn. Mọi thứ nên hoàn hảo và lộng lẫy trong ngày đặc biệt này. Bó hoa thủy tiên trắng kết hợp cùng hoa hồng trắng như một viên kim cương sáng lấp lánh quý giá trên tay nàng với nụ cười xinh tươi trên môi, trong một lễ cưới lộng lẫy ngập tràn bởi tông trắng tinh khôi khiến tất cẻ mọi người phải trầm trồ khen ngợi và đắm chìm vào một thiên đường hạnh phúc mãi chẳng muốn xa rời', CAST(0xC8410B00 AS Date), CAST(0xC8410B00 AS Date))
INSERT [dbo].[Flowers] ([Id], [Name], [TypeId], [Amount], [Price], [Image], [Notes], [Createdtime], [Updatedtime]) VALUES (6, N'Cô dâu môi hồng', 1, 99, 250000, N'Codaumoihong.jpg', N'Một chút sắc hồng lãng mạn, một chút sắc trắng tinh khôi hòa quyện lại tạo nên một bó hoa rất dễ thương. Bó hoa là điều tuyệt vời nhất cho các cô nàng yêu sắc hồng và theo đuổi phong cách sang trọng quí phái.', CAST(0xC8410B00 AS Date), CAST(0xC8410B00 AS Date))
INSERT [dbo].[Flowers] ([Id], [Name], [TypeId], [Amount], [Price], [Image], [Notes], [Createdtime], [Updatedtime]) VALUES (7, N'Hoa cưới tiếng yêu', 1, 99, 250000, N'Hoacuoitiengyeu.jpg', N'Có khoảng khắc nào đặc biệt hơn giây phút chàng nói tiếng tỏ tình? Nếu có chỉ có thể là lúc chàng nói lời cầu hôn. khi mà niềm hạnh phúc vỡ òa. Cảm xúc của cô gái đón nhận tình yêu trong khoảng khắc được ngỏ lời về chung một nhà chính là cảm hứng chính cho thiết kế bó hoa cưới "Tiếng Yêu". Đây là một bó hoa vừa nồng nàn, lãng mạn, nhưng cũng rất dịu dàng, nhẹ nhàng rất riêng và rất đỗi con gái.', CAST(0xC8410B00 AS Date), CAST(0xC8410B00 AS Date))
INSERT [dbo].[Flowers] ([Id], [Name], [TypeId], [Amount], [Price], [Image], [Notes], [Createdtime], [Updatedtime]) VALUES (9, N'Mắc cưới', 1, 99, 250000, N'Maccuoi.jpg', N'Lãng mạn, tươi mát và dễ thương, bó hoa cầm tay được dựa trên cảm hứng từ những câu chuyện tình trẻ trung, đáng yêu và thật lòng. Tông màu trắng xanh tinh khiết sẽ góp phần tô thêm màu sắc hạnh phúc vào đám cưới của bạn đấy. Chút nhẹ nhàng của tú cầu và mõm sói, kết hợp cùng sắc trắng của hoa hồng dành biểu trưng cho một tình yêu đầy nồng nàn và chân thành, tạo nên sự tinh tế cho cô dâu trong ngày trọng đại của cuộc đời khi sánh đôi cùng người mình yêu thương.', CAST(0xC8410B00 AS Date), CAST(0xC8410B00 AS Date))
INSERT [dbo].[Flowers] ([Id], [Name], [TypeId], [Amount], [Price], [Image], [Notes], [Createdtime], [Updatedtime]) VALUES (11, N'doanh ngoc diem', 1, 90, 0, N',', N'', CAST(0xD3410B00 AS Date), CAST(0xD3410B00 AS Date))
INSERT [dbo].[Flowers] ([Id], [Name], [TypeId], [Amount], [Price], [Image], [Notes], [Createdtime], [Updatedtime]) VALUES (12, N'Le Thi Teo', 1, 90, 2000000, N',', N'', CAST(0xD3410B00 AS Date), CAST(0xD3410B00 AS Date))
INSERT [dbo].[Flowers] ([Id], [Name], [TypeId], [Amount], [Price], [Image], [Notes], [Createdtime], [Updatedtime]) VALUES (13, N'diem doanh', 1, 0, 0, N'820984.png', N'', CAST(0xD2410B00 AS Date), NULL)
INSERT [dbo].[Flowers] ([Id], [Name], [TypeId], [Amount], [Price], [Image], [Notes], [Createdtime], [Updatedtime]) VALUES (14, N'Luyến Tiếc', 2, 99, 2000000, N'Luyentiec.jpg', N'Buồn Quá Ai Ơi', CAST(0xD3410B00 AS Date), NULL)
SET IDENTITY_INSERT [dbo].[Flowers] OFF
INSERT [dbo].[Genders] ([Id], [Name]) VALUES (1, N'Nam')
INSERT [dbo].[Genders] ([Id], [Name]) VALUES (2, N'Nữ')
INSERT [dbo].[Genders] ([Id], [Name]) VALUES (3, N'Khác')
INSERT [dbo].[Ispaids] ([Id], [Name]) VALUES (1, N'Chưa Thanh Toán')
INSERT [dbo].[Ispaids] ([Id], [Name]) VALUES (2, N'Đã Thanh Toán')
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([Id], [UserId], [Address], [TotalMoney], [Status], [Ispaid], [Createdtime], [Updatedtime], [Name]) VALUES (1, 1, N'33 Nguyễn Văn Lượng, Gò Vấp', 1500000, 1, 1, CAST(0xC8410B00 AS Date), CAST(0xC8410B00 AS Date), N'')
INSERT [dbo].[Orders] ([Id], [UserId], [Address], [TotalMoney], [Status], [Ispaid], [Createdtime], [Updatedtime], [Name]) VALUES (2, 2, N'11 Nguyễn Oanh, Gò Vấp', 350000, 1, 1, CAST(0xC8410B00 AS Date), CAST(0xC8410B00 AS Date), N'')
INSERT [dbo].[Orders] ([Id], [UserId], [Address], [TotalMoney], [Status], [Ispaid], [Createdtime], [Updatedtime], [Name]) VALUES (3, 3, N'12 Lê Văn Việt, Quận 9', 4500000, 1, 1, CAST(0xC8410B00 AS Date), CAST(0xC8410B00 AS Date), NULL)
INSERT [dbo].[Orders] ([Id], [UserId], [Address], [TotalMoney], [Status], [Ispaid], [Createdtime], [Updatedtime], [Name]) VALUES (4, 4, N'33 Nguyễn Văn Lượng, Gò Vấp', 5500000, 1, 1, CAST(0xC8410B00 AS Date), CAST(0xC8410B00 AS Date), NULL)
INSERT [dbo].[Orders] ([Id], [UserId], [Address], [TotalMoney], [Status], [Ispaid], [Createdtime], [Updatedtime], [Name]) VALUES (5, 5, N'123 Quang Trung, Gò Vấp', 3500000, 1, 1, CAST(0xC8410B00 AS Date), CAST(0xC8410B00 AS Date), NULL)
INSERT [dbo].[Orders] ([Id], [UserId], [Address], [TotalMoney], [Status], [Ispaid], [Createdtime], [Updatedtime], [Name]) VALUES (6, 6, N'135 Lê Đại Hành', 4200000, 1, 1, CAST(0xC8410B00 AS Date), CAST(0xC8410B00 AS Date), NULL)
INSERT [dbo].[Orders] ([Id], [UserId], [Address], [TotalMoney], [Status], [Ispaid], [Createdtime], [Updatedtime], [Name]) VALUES (7, 7, N'333 Phan Văn Trị, Gò Vấp', 2200000, 1, 1, CAST(0xC8410B00 AS Date), CAST(0xC8410B00 AS Date), NULL)
INSERT [dbo].[Orders] ([Id], [UserId], [Address], [TotalMoney], [Status], [Ispaid], [Createdtime], [Updatedtime], [Name]) VALUES (8, 8, N'244 Thảo Điền, Quận 2', 2300000, 1, 1, CAST(0xC8410B00 AS Date), CAST(0xC8410B00 AS Date), NULL)
INSERT [dbo].[Orders] ([Id], [UserId], [Address], [TotalMoney], [Status], [Ispaid], [Createdtime], [Updatedtime], [Name]) VALUES (9, 9, N'32 Nguyễn Kiệm, Gò Vấp', 2500000, 1, 1, CAST(0xC8410B00 AS Date), CAST(0xC8410B00 AS Date), NULL)
INSERT [dbo].[Orders] ([Id], [UserId], [Address], [TotalMoney], [Status], [Ispaid], [Createdtime], [Updatedtime], [Name]) VALUES (10, 10, N'334 Phạm Văn Đồng, Gò Vấp', 6700000, 1, 1, CAST(0xC8410B00 AS Date), CAST(0xC8410B00 AS Date), NULL)
INSERT [dbo].[Orders] ([Id], [UserId], [Address], [TotalMoney], [Status], [Ispaid], [Createdtime], [Updatedtime], [Name]) VALUES (11, NULL, N'334 Phạm Văn Đồng, Gò Vấp', 655555, 1, 1, CAST(0xD4410B00 AS Date), CAST(0xD4410B00 AS Date), NULL)
SET IDENTITY_INSERT [dbo].[Orders] OFF
SET IDENTITY_INSERT [dbo].[OrdersDetails] ON 

INSERT [dbo].[OrdersDetails] ([Id], [OrderId], [FlowerId], [Price], [Amount], [Totalprice], [Createdtime], [Updatedtime]) VALUES (3, 3, 7, 150000, 1, 150000, CAST(0xC8410B00 AS Date), CAST(0xC8410B00 AS Date))
INSERT [dbo].[OrdersDetails] ([Id], [OrderId], [FlowerId], [Price], [Amount], [Totalprice], [Createdtime], [Updatedtime]) VALUES (4, 4, 5, 200000, 5, 1000000, CAST(0xC8410B00 AS Date), CAST(0xC8410B00 AS Date))
INSERT [dbo].[OrdersDetails] ([Id], [OrderId], [FlowerId], [Price], [Amount], [Totalprice], [Createdtime], [Updatedtime]) VALUES (5, 5, 9, 200000, 6, 1200000, CAST(0xC8410B00 AS Date), CAST(0xC8410B00 AS Date))
INSERT [dbo].[OrdersDetails] ([Id], [OrderId], [FlowerId], [Price], [Amount], [Totalprice], [Createdtime], [Updatedtime]) VALUES (6, 6, 7, 200000, 8, 1600000, CAST(0xC8410B00 AS Date), CAST(0xC8410B00 AS Date))
INSERT [dbo].[OrdersDetails] ([Id], [OrderId], [FlowerId], [Price], [Amount], [Totalprice], [Createdtime], [Updatedtime]) VALUES (7, 7, 9, 225000, 10, 2250000, CAST(0xC8410B00 AS Date), CAST(0xC8410B00 AS Date))
INSERT [dbo].[OrdersDetails] ([Id], [OrderId], [FlowerId], [Price], [Amount], [Totalprice], [Createdtime], [Updatedtime]) VALUES (8, 8, 2, 250000, 2, 50000, CAST(0xC8410B00 AS Date), CAST(0xC8410B00 AS Date))
INSERT [dbo].[OrdersDetails] ([Id], [OrderId], [FlowerId], [Price], [Amount], [Totalprice], [Createdtime], [Updatedtime]) VALUES (9, 9, 3, 150000, 4, 450000, CAST(0xC8410B00 AS Date), CAST(0xC8410B00 AS Date))
INSERT [dbo].[OrdersDetails] ([Id], [OrderId], [FlowerId], [Price], [Amount], [Totalprice], [Createdtime], [Updatedtime]) VALUES (11, 1, 2, 200000, 22, 4400000, CAST(0xC8410B00 AS Date), CAST(0xC8410B00 AS Date))
INSERT [dbo].[OrdersDetails] ([Id], [OrderId], [FlowerId], [Price], [Amount], [Totalprice], [Createdtime], [Updatedtime]) VALUES (12, 5, 3, 200000, 5, 1000000, CAST(0xC8410B00 AS Date), CAST(0xC8410B00 AS Date))
INSERT [dbo].[OrdersDetails] ([Id], [OrderId], [FlowerId], [Price], [Amount], [Totalprice], [Createdtime], [Updatedtime]) VALUES (16, 1, 9, 200000, 2, 400000, CAST(0xC8410B00 AS Date), CAST(0xC8410B00 AS Date))
INSERT [dbo].[OrdersDetails] ([Id], [OrderId], [FlowerId], [Price], [Amount], [Totalprice], [Createdtime], [Updatedtime]) VALUES (17, 7, 9, 225000, 10, 2250000, CAST(0xC8410B00 AS Date), CAST(0xC8410B00 AS Date))
INSERT [dbo].[OrdersDetails] ([Id], [OrderId], [FlowerId], [Price], [Amount], [Totalprice], [Createdtime], [Updatedtime]) VALUES (18, 10, 9, 200000, 12, 2400000, CAST(0xC8410B00 AS Date), CAST(0xC8410B00 AS Date))
INSERT [dbo].[OrdersDetails] ([Id], [OrderId], [FlowerId], [Price], [Amount], [Totalprice], [Createdtime], [Updatedtime]) VALUES (19, 6, 9, 200000, 3, 600000, CAST(0xC8410B00 AS Date), CAST(0xC8410B00 AS Date))
INSERT [dbo].[OrdersDetails] ([Id], [OrderId], [FlowerId], [Price], [Amount], [Totalprice], [Createdtime], [Updatedtime]) VALUES (20, 9, 9, 200000, 9, 1800000, CAST(0xC8410B00 AS Date), CAST(0xC8410B00 AS Date))
SET IDENTITY_INSERT [dbo].[OrdersDetails] OFF
INSERT [dbo].[OrderStatus] ([Id], [Name]) VALUES (1, N'Đang Chờ Lấy Hàng')
INSERT [dbo].[OrderStatus] ([Id], [Name]) VALUES (2, N'Đang Giao Hàng')
INSERT [dbo].[OrderStatus] ([Id], [Name]) VALUES (3, N'Đã Nhận Hàng')
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([Id], [Name]) VALUES (1, N'Admin')
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (2, N'Staff')
SET IDENTITY_INSERT [dbo].[Roles] OFF
SET IDENTITY_INSERT [dbo].[Staffs] ON 

INSERT [dbo].[Staffs] ([Id], [Name], [Email], [Password], [Birthday], [Address], [Avatar], [Gender], [Phone], [Role], [Createdtime], [Updatedtime]) VALUES (1, N'Trần Công Truyền', N'truyentran20172201@gmail.com', N'123', CAST(0x1C240B00 AS Date), N'1144 Lê Đức Thọ Gò Vấp', N'nhanvien1.jpg', 1, N'0962086560', 1, CAST(0xB2410B00 AS Date), CAST(0xB2410B00 AS Date))
INSERT [dbo].[Staffs] ([Id], [Name], [Email], [Password], [Birthday], [Address], [Avatar], [Gender], [Phone], [Role], [Createdtime], [Updatedtime]) VALUES (2, N'Nguyễn Đức Hòa', N'duchoa3320000@gmail.com', N'123', CAST(0x07240B00 AS Date), N'Hooc Môn', N'nhanvien2.jpg', 1, N'0123738492', 1, CAST(0xB2410B00 AS Date), CAST(0xB2410B00 AS Date))
INSERT [dbo].[Staffs] ([Id], [Name], [Email], [Password], [Birthday], [Address], [Avatar], [Gender], [Phone], [Role], [Createdtime], [Updatedtime]) VALUES (3, N'Doanh Ngọc Diễm', N'diemdoanhngoc123@gmail.com', N'123', CAST(0x07240B00 AS Date), N'Bình Thạnh', N'nhanvien3.jpg', 1, N'0123738492', 1, CAST(0xB2410B00 AS Date), CAST(0xB2410B00 AS Date))
INSERT [dbo].[Staffs] ([Id], [Name], [Email], [Password], [Birthday], [Address], [Avatar], [Gender], [Phone], [Role], [Createdtime], [Updatedtime]) VALUES (4, N'Trần Đại Hưng', N'hungtran123@gmail.com', N'123', CAST(0x29240B00 AS Date), N'Thủ Đức', N'nhanvien4.jpg', 1, N'0123738432', 1, CAST(0xB2410B00 AS Date), CAST(0xB2410B00 AS Date))
INSERT [dbo].[Staffs] ([Id], [Name], [Email], [Password], [Birthday], [Address], [Avatar], [Gender], [Phone], [Role], [Createdtime], [Updatedtime]) VALUES (5, N'Hồ Phi Long', N'longbigay@gmail.com', N'123', CAST(0x61250B00 AS Date), N'Quận 2', N'nhanvien5.jpg', 1, N'0829069648', 1, CAST(0xB2410B00 AS Date), CAST(0xB2410B00 AS Date))
INSERT [dbo].[Staffs] ([Id], [Name], [Email], [Password], [Birthday], [Address], [Avatar], [Gender], [Phone], [Role], [Createdtime], [Updatedtime]) VALUES (6, N'Đầu Cắt Moiz', N'Moizcatdau123@gmail.com', N'123', CAST(0x4C250B00 AS Date), N'Quận1', N'nhanvien6.jpg', 1, N'0123728492', 2, CAST(0xB2410B00 AS Date), CAST(0xB2410B00 AS Date))
SET IDENTITY_INSERT [dbo].[Staffs] OFF
SET IDENTITY_INSERT [dbo].[TypesOfFlowers] ON 

INSERT [dbo].[TypesOfFlowers] ([Id], [Name], [Image]) VALUES (1, N'Hoa cưới', N'asd')
INSERT [dbo].[TypesOfFlowers] ([Id], [Name], [Image]) VALUES (2, N'Hoa chi buồn', N'asd')
INSERT [dbo].[TypesOfFlowers] ([Id], [Name], [Image]) VALUES (3, N'Hoa chúc mừng', N'asd')
INSERT [dbo].[TypesOfFlowers] ([Id], [Name], [Image]) VALUES (4, N'Hoa khai trương', N'asd')
INSERT [dbo].[TypesOfFlowers] ([Id], [Name], [Image]) VALUES (5, N'Hoa sinh nhật', N'asd')
SET IDENTITY_INSERT [dbo].[TypesOfFlowers] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [Name], [Email], [Address], [Phone], [Password], [Avatar], [Gender], [IsActive], [Createdtime], [Updatedtime]) VALUES (1, N'Nguyễn Đức Hòa', N'duchoa3320000@gmail.com', N'Hóc Môn', N'0962543840', N'123', N'hoa.jpg', 1, 1, CAST(0xB2410B00 AS Date), CAST(0xB2410B00 AS Date))
INSERT [dbo].[Users] ([Id], [Name], [Email], [Address], [Phone], [Password], [Avatar], [Gender], [IsActive], [Createdtime], [Updatedtime]) VALUES (2, N'Trần Công Truyền', N'truyentran20172201@gmail.com', N'Gò Vấp', N'0962086560', N'123', N'truyen.jpg', 1, 1, CAST(0xB2410B00 AS Date), CAST(0xB2410B00 AS Date))
INSERT [dbo].[Users] ([Id], [Name], [Email], [Address], [Phone], [Password], [Avatar], [Gender], [IsActive], [Createdtime], [Updatedtime]) VALUES (3, N'Doanh Ngọc Diễm', N'diem@gmail.com', N'Bình Thạnh', N'0962789456', N'123', N'diem.jpg', 1, 1, CAST(0xB2410B00 AS Date), CAST(0xB2410B00 AS Date))
INSERT [dbo].[Users] ([Id], [Name], [Email], [Address], [Phone], [Password], [Avatar], [Gender], [IsActive], [Createdtime], [Updatedtime]) VALUES (4, N'Hồ Phi Long', N'longho2390@gmail.com', N'Quận 2', N'0707919529', N'123', N'long.jpg', 1, 1, CAST(0xB2410B00 AS Date), CAST(0xB2410B00 AS Date))
INSERT [dbo].[Users] ([Id], [Name], [Email], [Address], [Phone], [Password], [Avatar], [Gender], [IsActive], [Createdtime], [Updatedtime]) VALUES (5, N'Trần Đại Hưng', N'walker545vn@gmail.com', N'Thủ Đức', N'0913731119', N'123', N'hung.jpg', 1, 1, CAST(0xB2410B00 AS Date), CAST(0xB2410B00 AS Date))
INSERT [dbo].[Users] ([Id], [Name], [Email], [Address], [Phone], [Password], [Avatar], [Gender], [IsActive], [Createdtime], [Updatedtime]) VALUES (6, N'Nguyễn Chi Pu', N'chipu123@gmail.com', N'Tân Bình', N'0154879652', N'123', N'chipu.jpg', 1, 1, CAST(0xB2410B00 AS Date), CAST(0xB2410B00 AS Date))
INSERT [dbo].[Users] ([Id], [Name], [Email], [Address], [Phone], [Password], [Avatar], [Gender], [IsActive], [Createdtime], [Updatedtime]) VALUES (7, N'Thiều Bảo Trâm', N'thieutram@gmail.com', N'Thủ Đức', N'0945687545', N'123', N'tram.jpg', 1, 1, CAST(0xB2410B00 AS Date), CAST(0xB2410B00 AS Date))
INSERT [dbo].[Users] ([Id], [Name], [Email], [Address], [Phone], [Password], [Avatar], [Gender], [IsActive], [Createdtime], [Updatedtime]) VALUES (8, N'Nguyễn Quang Hải', N'quanghai@gmail.com', N'Quận 9', N'0353349526', N'123', N'hai.jpg', 1, 1, CAST(0xB2410B00 AS Date), CAST(0xB2410B00 AS Date))
INSERT [dbo].[Users] ([Id], [Name], [Email], [Address], [Phone], [Password], [Avatar], [Gender], [IsActive], [Createdtime], [Updatedtime]) VALUES (9, N'Nguyễn Công Phượng', N'congphuong@gmail.com', N'Bình Tân', N'0745678912', N'123', N'phuong.jpg', 1, 1, CAST(0xB2410B00 AS Date), CAST(0xB2410B00 AS Date))
INSERT [dbo].[Users] ([Id], [Name], [Email], [Address], [Phone], [Password], [Avatar], [Gender], [IsActive], [Createdtime], [Updatedtime]) VALUES (10, N'Nguyễn Phương Dung', N'phuongdung@gmail.com', N'Củ Chi', N'0987965123', N'123', N'dung.jpg', 1, 1, CAST(0xB2410B00 AS Date), CAST(0xB2410B00 AS Date))
SET IDENTITY_INSERT [dbo].[Users] OFF
ALTER TABLE [dbo].[Flowers] ADD  DEFAULT (getdate()) FOR [Createdtime]
GO
ALTER TABLE [dbo].[Flowers] ADD  DEFAULT (getdate()) FOR [Updatedtime]
GO
ALTER TABLE [dbo].[Orders] ADD  DEFAULT (getdate()) FOR [Createdtime]
GO
ALTER TABLE [dbo].[Orders] ADD  DEFAULT (getdate()) FOR [Updatedtime]
GO
ALTER TABLE [dbo].[OrdersDetails] ADD  DEFAULT (getdate()) FOR [Createdtime]
GO
ALTER TABLE [dbo].[OrdersDetails] ADD  DEFAULT (getdate()) FOR [Updatedtime]
GO
ALTER TABLE [dbo].[Staffs] ADD  DEFAULT (getdate()) FOR [Createdtime]
GO
ALTER TABLE [dbo].[Staffs] ADD  DEFAULT (getdate()) FOR [Updatedtime]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (getdate()) FOR [Createdtime]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (getdate()) FOR [Updatedtime]
GO
ALTER TABLE [dbo].[Contacts]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[FlowerPromotionPrograms]  WITH CHECK ADD FOREIGN KEY([DiscountId])
REFERENCES [dbo].[DiscountPrograms] ([Id])
GO
ALTER TABLE [dbo].[FlowerPromotionPrograms]  WITH CHECK ADD FOREIGN KEY([FlowerID])
REFERENCES [dbo].[Flowers] ([Id])
GO
ALTER TABLE [dbo].[Flowers]  WITH CHECK ADD FOREIGN KEY([TypeId])
REFERENCES [dbo].[TypesOfFlowers] ([Id])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([Ispaid])
REFERENCES [dbo].[Ispaids] ([Id])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([Status])
REFERENCES [dbo].[OrderStatus] ([Id])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[OrdersDetails]  WITH CHECK ADD FOREIGN KEY([FlowerId])
REFERENCES [dbo].[Flowers] ([Id])
GO
ALTER TABLE [dbo].[OrdersDetails]  WITH CHECK ADD FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([Id])
GO
ALTER TABLE [dbo].[Staffs]  WITH CHECK ADD FOREIGN KEY([Gender])
REFERENCES [dbo].[Genders] ([Id])
GO
ALTER TABLE [dbo].[Staffs]  WITH CHECK ADD FOREIGN KEY([Role])
REFERENCES [dbo].[Roles] ([Id])
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD FOREIGN KEY([Gender])
REFERENCES [dbo].[Genders] ([Id])
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD FOREIGN KEY([IsActive])
REFERENCES [dbo].[Actives] ([Id])
GO
USE [master]
GO
ALTER DATABASE [SG_Rose] SET  READ_WRITE 
GO
