USE [master]
GO
/****** Object:  Database [SG_Rose]    Script Date: 10/24/2020 1:27:38 PM ******/
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
/****** Object:  Table [dbo].[Companys]    Script Date: 10/24/2020 1:27:38 PM ******/
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
/****** Object:  Table [dbo].[Contacts]    Script Date: 10/24/2020 1:27:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Contacts](
	[Id] [int] NOT NULL,
	[UsersId] [varchar](20) NULL,
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
/****** Object:  Table [dbo].[DiscountProgram]    Script Date: 10/24/2020 1:27:38 PM ******/
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
/****** Object:  Table [dbo].[Flower_PromotionProgram]    Script Date: 10/24/2020 1:27:38 PM ******/
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
/****** Object:  Table [dbo].[Flowers]    Script Date: 10/24/2020 1:27:38 PM ******/
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
	[Createtimes] [date] NULL,
	[Updatetimes] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 10/24/2020 1:27:38 PM ******/
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
/****** Object:  Table [dbo].[OrdersDetails]    Script Date: 10/24/2020 1:27:38 PM ******/
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
/****** Object:  Table [dbo].[Roles]    Script Date: 10/24/2020 1:27:38 PM ******/
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
/****** Object:  Table [dbo].[Staffs]    Script Date: 10/24/2020 1:27:38 PM ******/
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
/****** Object:  Table [dbo].[TypesOfFlowers]    Script Date: 10/24/2020 1:27:38 PM ******/
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
/****** Object:  Table [dbo].[Users]    Script Date: 10/24/2020 1:27:38 PM ******/
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
INSERT [dbo].[Companys] ([Name], [Address], [PhoneNumber], [Fax], [Link]) VALUES (N'Flower Store', N'Qu?n 1', N'0346789123', N'1', N'Flowercorner')
INSERT [dbo].[Companys] ([Name], [Address], [PhoneNumber], [Fax], [Link]) VALUES (N'SG Rose', N'Qu?n 3', N'0347852139', N'1', N'Flowercorner')
INSERT [dbo].[Companys] ([Name], [Address], [PhoneNumber], [Fax], [Link]) VALUES (N'Flower Love', N'Tan Phú', N'0348213597', N'1', N'Flowercorner')
INSERT [dbo].[Companys] ([Name], [Address], [PhoneNumber], [Fax], [Link]) VALUES (N'Fresh Flower ', N'Qu?n 7', N'0356478923', N'1', N'Flowercorner')
INSERT [dbo].[Companys] ([Name], [Address], [PhoneNumber], [Fax], [Link]) VALUES (N'Flower World', N'Bình Tan', N'0357452789', N'1', N'Flowercorner')
INSERT [dbo].[Companys] ([Name], [Address], [PhoneNumber], [Fax], [Link]) VALUES (N'Flower Store', N'Qu?n 1', N'0346789123', N'1', N'Flowercorner')
INSERT [dbo].[Companys] ([Name], [Address], [PhoneNumber], [Fax], [Link]) VALUES (N'SG Rose', N'Qu?n 3', N'0347852139', N'1', N'Flowercorner')
INSERT [dbo].[Companys] ([Name], [Address], [PhoneNumber], [Fax], [Link]) VALUES (N'Flower Love', N'Tan Phú', N'0348213597', N'1', N'Flowercorner')
INSERT [dbo].[Companys] ([Name], [Address], [PhoneNumber], [Fax], [Link]) VALUES (N'Fresh Flower ', N'Qu?n 7', N'0356478923', N'1', N'Flowercorner')
INSERT [dbo].[Companys] ([Name], [Address], [PhoneNumber], [Fax], [Link]) VALUES (N'Flower World', N'Bình Tan', N'0357452789', N'1', N'Flowercorner')
INSERT [dbo].[Contacts] ([Id], [UsersId], [Topic], [Message], [Phone], [Map]) VALUES (1, N'001', N'Ch?t lu?ng hoa', N'Ch?t lu?ng hoa', N'0913731119', NULL)
INSERT [dbo].[Contacts] ([Id], [UsersId], [Topic], [Message], [Phone], [Map]) VALUES (2, N'002', N'Xin th?c t?p', N'Em xin vào làm nhan viên', N'0123687456', NULL)
INSERT [dbo].[Contacts] ([Id], [UsersId], [Topic], [Message], [Phone], [Map]) VALUES (3, N'003', N'Thêm s? lu?ng', N'......', N'0974532567', NULL)
INSERT [dbo].[Contacts] ([Id], [UsersId], [Topic], [Message], [Phone], [Map]) VALUES (4, N'001', N'Ch?t lu?ng hoa', N'Ch?t lu?ng hoa', N'0913731119', NULL)
SET IDENTITY_INSERT [dbo].[DiscountProgram] ON 

INSERT [dbo].[DiscountProgram] ([Id], [Name], [Date_Start], [Date_End]) VALUES (11, N'Tình yêu vinh c?u', CAST(0xB8400B00 AS Date), CAST(0xBC400B00 AS Date))
INSERT [dbo].[DiscountProgram] ([Id], [Name], [Date_Start], [Date_End]) VALUES (22, N'8/3 bên c?nh ph? n? than yêu', CAST(0xCC400B00 AS Date), CAST(0xD3400B00 AS Date))
INSERT [dbo].[DiscountProgram] ([Id], [Name], [Date_Start], [Date_End]) VALUES (33, N'20/10 c?a các tình yêu', CAST(0xB0410B00 AS Date), CAST(0xB5410B00 AS Date))
INSERT [dbo].[DiscountProgram] ([Id], [Name], [Date_Start], [Date_End]) VALUES (44, N'20/11 ngày nhà giáo vi?t nam', CAST(0xCF410B00 AS Date), CAST(0xD4410B00 AS Date))
INSERT [dbo].[DiscountProgram] ([Id], [Name], [Date_Start], [Date_End]) VALUES (55, N'Giáng sinh anh lành', CAST(0xF2410B00 AS Date), CAST(0xF7410B00 AS Date))
SET IDENTITY_INSERT [dbo].[DiscountProgram] OFF
INSERT [dbo].[Flower_PromotionProgram] ([DiscountID], [FlowerID], [Type_Percent], [Type_Price], [Amount]) VALUES (11, N'HC001', 20, 0, 10)
INSERT [dbo].[Flower_PromotionProgram] ([DiscountID], [FlowerID], [Type_Percent], [Type_Price], [Amount]) VALUES (22, N'HC009', 0, 250000, 20)
INSERT [dbo].[Flower_PromotionProgram] ([DiscountID], [FlowerID], [Type_Percent], [Type_Price], [Amount]) VALUES (33, N'HC008', 50, 0, 15)
INSERT [dbo].[Flower_PromotionProgram] ([DiscountID], [FlowerID], [Type_Percent], [Type_Price], [Amount]) VALUES (44, N'HCM002', 10, 0, 30)
INSERT [dbo].[Flower_PromotionProgram] ([DiscountID], [FlowerID], [Type_Percent], [Type_Price], [Amount]) VALUES (55, N'HC001', 0, 250000, 20)
INSERT [dbo].[Flowers] ([Id], [Name], [TypeId], [Amount], [Price], [Image], [Notes], [Createtimes], [Updatetimes]) VALUES (N'HC001', N'Ấm áp', N'HC', 99, 250000, N'Amap.jpg', N'Lẵng hoa Ấm áp  được tạo nên từ những bông hoa hồng kem, đồng tiền hồng, cẩm chướng hồng, ly hồng và lá phụ trang trí. Lẵng hoa thích hợp dành tặng cho những người thân yêu của bạn. Hãy làm cho người nhận cảm thấy hạnh phúc và được yêu thương khi nhận được giỏ hoa này nhé.', CAST(0x9D410B00 AS Date), CAST(0x9D410B00 AS Date))
INSERT [dbo].[Flowers] ([Id], [Name], [TypeId], [Amount], [Price], [Image], [Notes], [Createtimes], [Updatetimes]) VALUES (N'HC002', N'Bên nhau', N'HC', 99, 250000, N'Bennhau.jpg', N'Chút nhẹ nhàng của hồng pastel và hồng vàng kết hợp cùng sắc tím, trắng dành cho các cô nàng ngọt ngào, lãng mạn, dễ thương trong ngày trọng đại của cuộc đời khi sánh đôi cùng người mình yêu thương.', CAST(0x9D410B00 AS Date), CAST(0x9D410B00 AS Date))
INSERT [dbo].[Flowers] ([Id], [Name], [TypeId], [Amount], [Price], [Image], [Notes], [Createtimes], [Updatetimes]) VALUES (N'HC003', N'Chung một nha', N'HC', 99, 250000, N'Chung1nha.jpg', N'Giây phút về " một nhà" hẳn là giây phút mà biết bao người hồi hộp mong đợi. Khoảnh khắc được mặc chiếc váy cưới lộng lẫy và trên tay là một bó hoa đầy xinh tươi hẳn là giây phút hạnh phúc nhất trong cuộc đời người con gái. Hãy để bó hoa cầm tay với gam màu tươi sáng tạo nên từ hồng vàng và đồng tiền trắng góp phần tô nên đám cưới đẹp như mơ của bạn nhé', CAST(0x9D410B00 AS Date), CAST(0x9D410B00 AS Date))
INSERT [dbo].[Flowers] ([Id], [Name], [TypeId], [Amount], [Price], [Image], [Notes], [Createtimes], [Updatetimes]) VALUES (N'HC004', N'Cô dâu kim cương', N'HC', 99, 250000, N'Codaukimcuong.jpg', N'Cô dâu nào lại không muốn ngày trọng đại của mình thật đặc biệt, từ đường may trên chiếc váy cưới đến bó hoa cầm tay xinh xắn. Mọi thứ nên hoàn hảo và lộng lẫy trong ngày đặc biệt này. Bó hoa thủy tiên trắng kết hợp cùng hoa hồng trắng như một viên kim cương sáng lấp lánh quý giá trên tay nàng với nụ cười xinh tươi trên môi, trong một lễ cưới lộng lẫy ngập tràn bởi tông trắng tinh khôi khiến tất cẻ mọi người phải trầm trồ khen ngợi và đắm chìm vào một thiên đường hạnh phúc mãi chẳng muốn xa rời', CAST(0x9D410B00 AS Date), CAST(0x9D410B00 AS Date))
INSERT [dbo].[Flowers] ([Id], [Name], [TypeId], [Amount], [Price], [Image], [Notes], [Createtimes], [Updatetimes]) VALUES (N'HC005', N'Cô dâu môi hồng', N'HC', 99, 250000, N'Codaumoihong.jpg', N'Một chút sắc hồng lãng mạn, một chút sắc trắng tinh khôi hòa quyện lại tạo nên một bó hoa rất dễ thương. Bó hoa là điều tuyệt vời nhất cho các cô nàng yêu sắc hồng và theo đuổi phong cách sang trọng quí phái.', CAST(0x9D410B00 AS Date), CAST(0x9D410B00 AS Date))
INSERT [dbo].[Flowers] ([Id], [Name], [TypeId], [Amount], [Price], [Image], [Notes], [Createtimes], [Updatetimes]) VALUES (N'HC006', N'Hoa cưới tiếng yêu', N'HC', 99, 250000, N'Hoacuoitiengyeu.jpg', N'Có khoảng khắc nào đặc biệt hơn giây phút chàng nói tiếng tỏ tình? Nếu có chỉ có thể là lúc chàng nói lời cầu hôn. khi mà niềm hạnh phúc vỡ òa. Cảm xúc của cô gái đón nhận tình yêu trong khoảng khắc được ngỏ lời về chung một nhà chính là cảm hứng chính cho thiết kế bó hoa cưới "Tiếng Yêu". Đây là một bó hoa vừa nồng nàn, lãng mạn, nhưng cũng rất dịu dàng, nhẹ nhàng rất riêng và rất đỗi con gái.', CAST(0x9D410B00 AS Date), CAST(0x9D410B00 AS Date))
INSERT [dbo].[Flowers] ([Id], [Name], [TypeId], [Amount], [Price], [Image], [Notes], [Createtimes], [Updatetimes]) VALUES (N'HC007', N'Mắc cưới', N'HC', 99, 250000, N'Maccuoi.jpg', N'Lãng mạn, tươi mát và dễ thương, bó hoa cầm tay được dựa trên cảm hứng từ những câu chuyện tình trẻ trung, đáng yêu và thật lòng. Tông màu trắng xanh tinh khiết sẽ góp phần tô thêm màu sắc hạnh phúc vào đám cưới của bạn đấy. Chút nhẹ nhàng của tú cầu và mõm sói, kết hợp cùng sắc trắng của hoa hồng dành biểu trưng cho một tình yêu đầy nồng nàn và chân thành, tạo nên sự tinh tế cho cô dâu trong ngày trọng đại của cuộc đời khi sánh đôi cùng người mình yêu thương.', CAST(0x9D410B00 AS Date), CAST(0x9D410B00 AS Date))
INSERT [dbo].[Flowers] ([Id], [Name], [TypeId], [Amount], [Price], [Image], [Notes], [Createtimes], [Updatetimes]) VALUES (N'HC008', N'Ngày hạnh phúc', N'HC', 99, 250000, N'Ngayhanhphuc.jpg', N'Ngọt ngào, lãng mạn và dễ thương, bó hoa cầm tay được dựa trên cảm hứng từ những câu chuyện tình trẻ trung, đáng yêu và đầy nhiệt huyết. Tông màu pastel đáng yêu sẽ góp phần tô thêm màu sắc hạnh phúc vào đám cưới của bạn đấy.', CAST(0x9D410B00 AS Date), CAST(0x9D410B00 AS Date))
INSERT [dbo].[Flowers] ([Id], [Name], [TypeId], [Amount], [Price], [Image], [Notes], [Createtimes], [Updatetimes]) VALUES (N'HC009', N'Ngày rạng ngời', N'HC', 99, 250000, N'Ngayrangngoi.jpg', N'Mặt trời là nguồn sống, là chân lí soi rạng, dẫn lỗi cuộc sống. "Ánh mặt trời" là sự kết hợp của những đóa hoa hướng dương rực lửa nhưng được dịu lại bởi sắc xanh, trắng và tím của hoa lá phụ mang đến sắc màu rực rỡ mà không kém phần dịu dàng. tinh tế. Bó hoa có thể là bó hoa cầm tay dành cho cô dâu cho ngày đẹp nhất cuộc đời mình , cũng có thể là một món quà xinh tươi cho những dịp đặc biệt nhất!', CAST(0x9D410B00 AS Date), CAST(0x9D410B00 AS Date))
INSERT [dbo].[Flowers] ([Id], [Name], [TypeId], [Amount], [Price], [Image], [Notes], [Createtimes], [Updatetimes]) VALUES (N'HC010', N'Ngày sánh đôi', N'HC', 99, 250000, N'Ngaysanhdoi.jpg', N'Bó hoa kết hợp giữa hồng dâu cùng cát tường một món quà ý nghĩa mà đầy dễ thương. Hãy dành tặnh người con gái bạn thương một món quà đầy ngọt ngào nhé. Phút yêu đầu bao giờ cũng lãng mạn và đối phương trong mắt bạn lúc đó thật tỏa nắng và đáng yêu,,đừng ngần ngại để bó hoa thay bạn gợi nhắc cho nàng khoảnh khắc ngọt ngào đó nhé!
Bó hoa cũng là một gợi ý hoàn hảo cho bó hoa cầm tay cô dâu trong ngày trọng đại đó.', CAST(0x9D410B00 AS Date), CAST(0x9D410B00 AS Date))
INSERT [dbo].[Flowers] ([Id], [Name], [TypeId], [Amount], [Price], [Image], [Notes], [Createtimes], [Updatetimes]) VALUES (N'HCB001', N'Buồn an giấc', N'HCB', 99, 150000, N'Buonangiac.jpg', N'Bạn đang cần tìm một mẫu kệ hoa chia buồn đẹp, sang trọng với một mức giá không quá cao để gửi tới đám tang? Mẫu vòng hoa chia buồn An Giấc sẽ là sự lựa chọn phù hợp và đáp ứng đủ các tiêu chí mà bạn đang cần.', CAST(0x9D410B00 AS Date), CAST(0x9D410B00 AS Date))
INSERT [dbo].[Flowers] ([Id], [Name], [TypeId], [Amount], [Price], [Image], [Notes], [Createtimes], [Updatetimes]) VALUES (N'HCB002', N'Buồn vĩnh hằng', N'HCB', 99, 150000, N'Buonvinhhang.jpg', N'Ngoài sắc đen trắng truyền thống, sắc tím cũng thường được chọn cho những vòng hoa chia buồn. Màu tím thể hiện sự sâu sắc, tôn trọng, rất thích hợp làm tông màu chủ đạo cho vòng hoa chia buồn. Vòng hoa này đặc biệt được thiết kế một cách hài hòa, trang nhã với sự đan xen của cúc và hồng, trắng và tím, tạo nên một tổng thể nhẹ nhàng, lắng đọng.', CAST(0x9D410B00 AS Date), CAST(0x9D410B00 AS Date))
INSERT [dbo].[Flowers] ([Id], [Name], [TypeId], [Amount], [Price], [Image], [Notes], [Createtimes], [Updatetimes]) VALUES (N'HCB003', N'Buồn vô thường', N'HCB', 99, 150000, N'Buonvothuong.jpg', N'Kệ hoa chia buồn với tông màu trắng tinh tế được kết từ đồng tiền,tú cầu và các loại hoa khác là một lời chia buồn đầy chân thành đến những người bạn luôn hằng yêu quí. Giây phút chia lìa hẳn cần lắm một lời động viên, an ủi chân thành nhất từ những người quan trọng.', CAST(0x9D410B00 AS Date), CAST(0x9D410B00 AS Date))
INSERT [dbo].[Flowers] ([Id], [Name], [TypeId], [Amount], [Price], [Image], [Notes], [Createtimes], [Updatetimes]) VALUES (N'HCB004', N'Dòng thời gian', N'HCB', 99, 150000, N'Dongthoigian.jpg', N'a', CAST(0x9D410B00 AS Date), CAST(0x9D410B00 AS Date))
INSERT [dbo].[Flowers] ([Id], [Name], [TypeId], [Amount], [Price], [Image], [Notes], [Createtimes], [Updatetimes]) VALUES (N'HCB005', N'Lời cuối', N'HCB', 99, 150000, N'Loicuoi.jpg', N'a', CAST(0x9D410B00 AS Date), CAST(0x9D410B00 AS Date))
INSERT [dbo].[Flowers] ([Id], [Name], [TypeId], [Amount], [Price], [Image], [Notes], [Createtimes], [Updatetimes]) VALUES (N'HCB006', N'Luyến tiếc', N'HCB', 99, 150000, N'Luyentiec.jpg', N'a', CAST(0x9D410B00 AS Date), CAST(0x9D410B00 AS Date))
INSERT [dbo].[Flowers] ([Id], [Name], [TypeId], [Amount], [Price], [Image], [Notes], [Createtimes], [Updatetimes]) VALUES (N'HCB007', N'Nhớ thương', N'HCB', 99, 150000, N'Nhothuong.jpg', N'a', CAST(0x9D410B00 AS Date), CAST(0x9D410B00 AS Date))
INSERT [dbo].[Flowers] ([Id], [Name], [TypeId], [Amount], [Price], [Image], [Notes], [Createtimes], [Updatetimes]) VALUES (N'HCB008', N'Phù du ', N'HCB', 99, 150000, N'Phudu.jpg', N'a', CAST(0x9D410B00 AS Date), CAST(0x9D410B00 AS Date))
INSERT [dbo].[Flowers] ([Id], [Name], [TypeId], [Amount], [Price], [Image], [Notes], [Createtimes], [Updatetimes]) VALUES (N'HCB009', N'Thiên thu', N'HCB', 99, 150000, N'Thienthu.jpg', N'a', CAST(0x9D410B00 AS Date), CAST(0x9D410B00 AS Date))
INSERT [dbo].[Flowers] ([Id], [Name], [TypeId], [Amount], [Price], [Image], [Notes], [Createtimes], [Updatetimes]) VALUES (N'HCB010', N'Yên nghỉ', N'HCB', 99, 150000, N'Yennghi.jpg', N'a', CAST(0x9D410B00 AS Date), CAST(0x9D410B00 AS Date))
INSERT [dbo].[Flowers] ([Id], [Name], [TypeId], [Amount], [Price], [Image], [Notes], [Createtimes], [Updatetimes]) VALUES (N'HCM001', N'Đại lời', N'HCM', 99, 200000, N'Dailoi.jpg', N'a', CAST(0x9D410B00 AS Date), CAST(0x9D410B00 AS Date))
INSERT [dbo].[Flowers] ([Id], [Name], [TypeId], [Amount], [Price], [Image], [Notes], [Createtimes], [Updatetimes]) VALUES (N'HCM002', N'Đại thành công', N'HCM', 99, 200000, N'Daithanhcong.jpg', N'a', CAST(0x9D410B00 AS Date), CAST(0x9D410B00 AS Date))
INSERT [dbo].[Flowers] ([Id], [Name], [TypeId], [Amount], [Price], [Image], [Notes], [Createtimes], [Updatetimes]) VALUES (N'HCM003', N'Dôm hoa kết trái', N'HCM', 99, 200000, N'Domhoakettrai.jpg', N'a', CAST(0x9D410B00 AS Date), CAST(0x9D410B00 AS Date))
INSERT [dbo].[Flowers] ([Id], [Name], [TypeId], [Amount], [Price], [Image], [Notes], [Createtimes], [Updatetimes]) VALUES (N'HCM004', N'Hưng thịnh', N'HCM', 99, 200000, N'Hungthinh.jpg', N'a', CAST(0x9D410B00 AS Date), CAST(0x9D410B00 AS Date))
INSERT [dbo].[Flowers] ([Id], [Name], [TypeId], [Amount], [Price], [Image], [Notes], [Createtimes], [Updatetimes]) VALUES (N'HCM005', N'Khởi đầu mới', N'HCM', 99, 200000, N'Khoidaumoi.jpg', N'a', CAST(0x9D410B00 AS Date), CAST(0x9D410B00 AS Date))
INSERT [dbo].[Flowers] ([Id], [Name], [TypeId], [Amount], [Price], [Image], [Notes], [Createtimes], [Updatetimes]) VALUES (N'HCM006', N'Phát tài', N'HCM', 99, 200000, N'Phattai.jpg', N'a', CAST(0x9D410B00 AS Date), CAST(0x9D410B00 AS Date))
INSERT [dbo].[Flowers] ([Id], [Name], [TypeId], [Amount], [Price], [Image], [Notes], [Createtimes], [Updatetimes]) VALUES (N'HCM007', N'Phú quý', N'HCM', 99, 200000, N'Phuquy.jpg', N'a', CAST(0x9D410B00 AS Date), CAST(0x9D410B00 AS Date))
INSERT [dbo].[Flowers] ([Id], [Name], [TypeId], [Amount], [Price], [Image], [Notes], [Createtimes], [Updatetimes]) VALUES (N'HCM008', N'Tấn tài', N'HCM', 99, 200000, N'Tantai.jpg', N'a', CAST(0x9D410B00 AS Date), CAST(0x9D410B00 AS Date))
INSERT [dbo].[Flowers] ([Id], [Name], [TypeId], [Amount], [Price], [Image], [Notes], [Createtimes], [Updatetimes]) VALUES (N'HCM009', N'Thuận buồm xuôi gió', N'HCM', 99, 200000, N'Thuanbuomxuoigio.jpg', N'a', CAST(0x9D410B00 AS Date), CAST(0x9D410B00 AS Date))
INSERT [dbo].[Flowers] ([Id], [Name], [TypeId], [Amount], [Price], [Image], [Notes], [Createtimes], [Updatetimes]) VALUES (N'HCM010', N'Trang trọng', N'HCM', 99, 200000, N'Trangtrong.jpg', N'a', CAST(0x9D410B00 AS Date), CAST(0x9D410B00 AS Date))
INSERT [dbo].[Flowers] ([Id], [Name], [TypeId], [Amount], [Price], [Image], [Notes], [Createtimes], [Updatetimes]) VALUES (N'HKT001', N'Chúc thành công', N'HKT', 99, 225000, N'Chucthanhcong.jpg', N'a', CAST(0x9D410B00 AS Date), CAST(0x9D410B00 AS Date))
INSERT [dbo].[Flowers] ([Id], [Name], [TypeId], [Amount], [Price], [Image], [Notes], [Createtimes], [Updatetimes]) VALUES (N'HKT002', N'Khai trương', N'HKT', 99, 225000, N'Khaitruongphonvinh.jpg', N'a', CAST(0x9D410B00 AS Date), CAST(0x9D410B00 AS Date))
INSERT [dbo].[Flowers] ([Id], [Name], [TypeId], [Amount], [Price], [Image], [Notes], [Createtimes], [Updatetimes]) VALUES (N'HKT003', N'Khoe sắc thắm', N'HKT', 99, 225000, N'Khoesactham.jpg', N'a', CAST(0x9D410B00 AS Date), CAST(0x9D410B00 AS Date))
INSERT [dbo].[Flowers] ([Id], [Name], [TypeId], [Amount], [Price], [Image], [Notes], [Createtimes], [Updatetimes]) VALUES (N'HKT004', N'Lạng hoa thành công', N'HKT', 99, 225000, N'Langhoathanhcong.png', N'a', CAST(0x9D410B00 AS Date), CAST(0x9D410B00 AS Date))
INSERT [dbo].[Flowers] ([Id], [Name], [TypeId], [Amount], [Price], [Image], [Notes], [Createtimes], [Updatetimes]) VALUES (N'HKT005', N'Mừng hồng phát', N'HKT', 99, 225000, N'Munghongphat.jpg', N'a', CAST(0x9D410B00 AS Date), CAST(0x9D410B00 AS Date))
INSERT [dbo].[Flowers] ([Id], [Name], [TypeId], [Amount], [Price], [Image], [Notes], [Createtimes], [Updatetimes]) VALUES (N'HKT006', N'Mừng vươn lên', N'HKT', 99, 225000, N'Mungvuonlen.jpg', N'a', CAST(0x9D410B00 AS Date), CAST(0x9D410B00 AS Date))
INSERT [dbo].[Flowers] ([Id], [Name], [TypeId], [Amount], [Price], [Image], [Notes], [Createtimes], [Updatetimes]) VALUES (N'HKT007', N'Sức sống', N'HKT', 99, 225000, N'Sucsong.jpg', N'a', CAST(0x9D410B00 AS Date), CAST(0x9D410B00 AS Date))
INSERT [dbo].[Flowers] ([Id], [Name], [TypeId], [Amount], [Price], [Image], [Notes], [Createtimes], [Updatetimes]) VALUES (N'HKT008', N'Trường đại cát', N'HKT', 99, 225000, N'Truongdaicat.jpg', N'a', CAST(0x9D410B00 AS Date), CAST(0x9D410B00 AS Date))
INSERT [dbo].[Flowers] ([Id], [Name], [TypeId], [Amount], [Price], [Image], [Notes], [Createtimes], [Updatetimes]) VALUES (N'HKT009', N'Vạn lộc', N'HKT', 99, 225000, N'Vanloc.jpg', N'a', CAST(0x9D410B00 AS Date), CAST(0x9D410B00 AS Date))
INSERT [dbo].[Flowers] ([Id], [Name], [TypeId], [Amount], [Price], [Image], [Notes], [Createtimes], [Updatetimes]) VALUES (N'HKT010', N'Vững tin', N'HKT', 99, 225000, N'Vungtin.jpg', N'a', CAST(0x9D410B00 AS Date), CAST(0x9D410B00 AS Date))
INSERT [dbo].[Flowers] ([Id], [Name], [TypeId], [Amount], [Price], [Image], [Notes], [Createtimes], [Updatetimes]) VALUES (N'HSN001', N'Câu hát', N'HSN', 99, 200000, N'Cauhat.jpg', N'a', CAST(0x9D410B00 AS Date), CAST(0x9D410B00 AS Date))
INSERT [dbo].[Flowers] ([Id], [Name], [TypeId], [Amount], [Price], [Image], [Notes], [Createtimes], [Updatetimes]) VALUES (N'HSN002', N'Cổ tích', N'HSN', 99, 200000, N'Cotich.jpg', N'a', CAST(0x9D410B00 AS Date), CAST(0x9D410B00 AS Date))
INSERT [dbo].[Flowers] ([Id], [Name], [TypeId], [Amount], [Price], [Image], [Notes], [Createtimes], [Updatetimes]) VALUES (N'HSN003', N'Đáng yêu', N'HSN', 99, 200000, N'Dangyeu.jpg', N'a', CAST(0x9D410B00 AS Date), CAST(0x9D410B00 AS Date))
INSERT [dbo].[Flowers] ([Id], [Name], [TypeId], [Amount], [Price], [Image], [Notes], [Createtimes], [Updatetimes]) VALUES (N'HSN004', N'Luôn bên yêu', N'HSN', 99, 200000, N'Luonbenem.jpg', N'a', CAST(0x9D410B00 AS Date), CAST(0x9D410B00 AS Date))
INSERT [dbo].[Flowers] ([Id], [Name], [TypeId], [Amount], [Price], [Image], [Notes], [Createtimes], [Updatetimes]) VALUES (N'HSN005', N'Only you', N'HSN', 99, 200000, N'Onlyyou.jpg', N'a', CAST(0x9D410B00 AS Date), CAST(0x9D410B00 AS Date))
INSERT [dbo].[Flowers] ([Id], [Name], [TypeId], [Amount], [Price], [Image], [Notes], [Createtimes], [Updatetimes]) VALUES (N'HSN006', N'Tinh khiết', N'HSN', 99, 200000, N'Tinhkhiet.jpg', N'a', CAST(0x9D410B00 AS Date), CAST(0x9D410B00 AS Date))
INSERT [dbo].[Flowers] ([Id], [Name], [TypeId], [Amount], [Price], [Image], [Notes], [Createtimes], [Updatetimes]) VALUES (N'HSN007', N'Tỏa sáng', N'HSN', 99, 200000, N'Toasang.jpg', N'a', CAST(0x9D410B00 AS Date), CAST(0x9D410B00 AS Date))
INSERT [dbo].[Flowers] ([Id], [Name], [TypeId], [Amount], [Price], [Image], [Notes], [Createtimes], [Updatetimes]) VALUES (N'HSN008', N'Tươi hồng', N'HSN', 99, 200000, N'Tuoihong.jpg', N'a', CAST(0x9D410B00 AS Date), CAST(0x9D410B00 AS Date))
INSERT [dbo].[Flowers] ([Id], [Name], [TypeId], [Amount], [Price], [Image], [Notes], [Createtimes], [Updatetimes]) VALUES (N'HSN009', N'Tươi sáng', N'HSN', 99, 200000, N'Tuoisang.jpg', N'a', CAST(0x9D410B00 AS Date), CAST(0x9D410B00 AS Date))
INSERT [dbo].[Flowers] ([Id], [Name], [TypeId], [Amount], [Price], [Image], [Notes], [Createtimes], [Updatetimes]) VALUES (N'HSN010', N'Yêu kiều', N'HSN', 99, 200000, N'YeuKieu.jpg', N'a', CAST(0x9D410B00 AS Date), CAST(0x9D410B00 AS Date))
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([Id], [Userid], [Username], [Address], [Total_Money], [Status], [Is_paid], [Created_time], [Updated_time]) VALUES (1, N'001', N'Nguyễn Văn Tèo', N'33 Nguyễn Văn Lượng, Gò Vấp', 1500000, NULL, 1, CAST(0xB2410B00 AS Date), CAST(0xB2410B00 AS Date))
INSERT [dbo].[Orders] ([Id], [Userid], [Username], [Address], [Total_Money], [Status], [Is_paid], [Created_time], [Updated_time]) VALUES (2, N'002', N'Nguyễn Thị Nở', N'11 Nguyễn Oanh, Gò Vấp', 350000, NULL, 1, CAST(0xB2410B00 AS Date), CAST(0xB2410B00 AS Date))
INSERT [dbo].[Orders] ([Id], [Userid], [Username], [Address], [Total_Money], [Status], [Is_paid], [Created_time], [Updated_time]) VALUES (3, N'003', N'Đinh Trần Tuyết Rơi', N'12 Lê Văn Việt, Quận 9', 4500000, NULL, 1, CAST(0xB2410B00 AS Date), CAST(0xB2410B00 AS Date))
INSERT [dbo].[Orders] ([Id], [Userid], [Username], [Address], [Total_Money], [Status], [Is_paid], [Created_time], [Updated_time]) VALUES (4, N'004', N'Nguyễn Văn Tèo', N'33 Nguyễn Văn Lượng, Gò Vấp', 5500000, NULL, 1, CAST(0xB2410B00 AS Date), CAST(0xB2410B00 AS Date))
INSERT [dbo].[Orders] ([Id], [Userid], [Username], [Address], [Total_Money], [Status], [Is_paid], [Created_time], [Updated_time]) VALUES (5, N'005', N'Trần Thị Hoa Hòe', N'123 Quang Trung, Gò Vấp', 3500000, NULL, 1, CAST(0xB2410B00 AS Date), CAST(0xB2410B00 AS Date))
INSERT [dbo].[Orders] ([Id], [Userid], [Username], [Address], [Total_Money], [Status], [Is_paid], [Created_time], [Updated_time]) VALUES (6, N'006', N'Nguyễn Sừng Trâu', N'135 Lê Đại Hành', 4200000, NULL, 1, CAST(0xB2410B00 AS Date), CAST(0xB2410B00 AS Date))
INSERT [dbo].[Orders] ([Id], [Userid], [Username], [Address], [Total_Money], [Status], [Is_paid], [Created_time], [Updated_time]) VALUES (7, N'007', N'Lê Lợi', N'333 Phan Văn Trị, Gò Vấp', 2200000, NULL, 1, CAST(0xB2410B00 AS Date), CAST(0xB2410B00 AS Date))
INSERT [dbo].[Orders] ([Id], [Userid], [Username], [Address], [Total_Money], [Status], [Is_paid], [Created_time], [Updated_time]) VALUES (8, N'008', N'Đầu Cắt Môi', N'244 Thảo Điền, Quận 2', 2300000, NULL, 1, CAST(0xB2410B00 AS Date), CAST(0xB2410B00 AS Date))
INSERT [dbo].[Orders] ([Id], [Userid], [Username], [Address], [Total_Money], [Status], [Is_paid], [Created_time], [Updated_time]) VALUES (9, N'009', N'BigCity Boiz', N'32 Nguyễn Kiệm, Gò Vấp', 2500000, NULL, 1, CAST(0xB2410B00 AS Date), CAST(0xB2410B00 AS Date))
INSERT [dbo].[Orders] ([Id], [Userid], [Username], [Address], [Total_Money], [Status], [Is_paid], [Created_time], [Updated_time]) VALUES (10, N'010', N'Among Us', N'334 Phạm Văn Đồng, Gò Vấp', 6700000, NULL, 1, CAST(0xB2410B00 AS Date), CAST(0xB2410B00 AS Date))
SET IDENTITY_INSERT [dbo].[Orders] OFF
INSERT [dbo].[OrdersDetails] ([Id], [OrderId], [FlowerId], [Price], [Amount], [Total_price], [Created_time], [Updated_time]) VALUES (N'OD001', 1, N'HSN010', 200000, 2, 400000, CAST(0xB2410B00 AS Date), CAST(0xB2410B00 AS Date))
INSERT [dbo].[OrdersDetails] ([Id], [OrderId], [FlowerId], [Price], [Amount], [Total_price], [Created_time], [Updated_time]) VALUES (N'OD002', 2, N'HC001', 250000, 2, 500000, CAST(0xB2410B00 AS Date), CAST(0xB2410B00 AS Date))
INSERT [dbo].[OrdersDetails] ([Id], [OrderId], [FlowerId], [Price], [Amount], [Total_price], [Created_time], [Updated_time]) VALUES (N'OD003', 3, N'HCB007', 150000, 1, 150000, CAST(0xB2410B00 AS Date), CAST(0xB2410B00 AS Date))
INSERT [dbo].[OrdersDetails] ([Id], [OrderId], [FlowerId], [Price], [Amount], [Total_price], [Created_time], [Updated_time]) VALUES (N'OD004', 4, N'HSN005', 200000, 5, 1000000, CAST(0xB2410B00 AS Date), CAST(0xB2410B00 AS Date))
INSERT [dbo].[OrdersDetails] ([Id], [OrderId], [FlowerId], [Price], [Amount], [Total_price], [Created_time], [Updated_time]) VALUES (N'OD005', 5, N'HSN009', 200000, 6, 1200000, CAST(0xB2410B00 AS Date), CAST(0xB2410B00 AS Date))
INSERT [dbo].[OrdersDetails] ([Id], [OrderId], [FlowerId], [Price], [Amount], [Total_price], [Created_time], [Updated_time]) VALUES (N'OD006', 6, N'HSN007', 200000, 8, 1600000, CAST(0xB2410B00 AS Date), CAST(0xB2410B00 AS Date))
INSERT [dbo].[OrdersDetails] ([Id], [OrderId], [FlowerId], [Price], [Amount], [Total_price], [Created_time], [Updated_time]) VALUES (N'OD007', 7, N'HKT009', 225000, 10, 2250000, CAST(0xB2410B00 AS Date), CAST(0xB2410B00 AS Date))
INSERT [dbo].[OrdersDetails] ([Id], [OrderId], [FlowerId], [Price], [Amount], [Total_price], [Created_time], [Updated_time]) VALUES (N'OD008', 8, N'HC002', 250000, 2, 500000, CAST(0xB2410B00 AS Date), CAST(0xB2410B00 AS Date))
INSERT [dbo].[OrdersDetails] ([Id], [OrderId], [FlowerId], [Price], [Amount], [Total_price], [Created_time], [Updated_time]) VALUES (N'OD009', 9, N'HCB003', 150000, 4, 450000, CAST(0xB2410B00 AS Date), CAST(0xB2410B00 AS Date))
INSERT [dbo].[OrdersDetails] ([Id], [OrderId], [FlowerId], [Price], [Amount], [Total_price], [Created_time], [Updated_time]) VALUES (N'OD010', 10, N'HSN010', 200000, 12, 2400000, CAST(0xB2410B00 AS Date), CAST(0xB2410B00 AS Date))
INSERT [dbo].[OrdersDetails] ([Id], [OrderId], [FlowerId], [Price], [Amount], [Total_price], [Created_time], [Updated_time]) VALUES (N'OD011', 1, N'HSN002', 200000, 22, 4400000, CAST(0xB2410B00 AS Date), CAST(0xB2410B00 AS Date))
INSERT [dbo].[OrdersDetails] ([Id], [OrderId], [FlowerId], [Price], [Amount], [Total_price], [Created_time], [Updated_time]) VALUES (N'OD012', 5, N'HCM003', 200000, 5, 1000000, CAST(0xB2410B00 AS Date), CAST(0xB2410B00 AS Date))
INSERT [dbo].[OrdersDetails] ([Id], [OrderId], [FlowerId], [Price], [Amount], [Total_price], [Created_time], [Updated_time]) VALUES (N'OD013', 6, N'HSN010', 200000, 3, 600000, CAST(0xB2410B00 AS Date), CAST(0xB2410B00 AS Date))
INSERT [dbo].[OrdersDetails] ([Id], [OrderId], [FlowerId], [Price], [Amount], [Total_price], [Created_time], [Updated_time]) VALUES (N'OD014', 7, N'HC008', 250000, 8, 2000000, CAST(0xB2410B00 AS Date), CAST(0xB2410B00 AS Date))
INSERT [dbo].[OrdersDetails] ([Id], [OrderId], [FlowerId], [Price], [Amount], [Total_price], [Created_time], [Updated_time]) VALUES (N'OD015', 9, N'HSN010', 200000, 9, 1800000, CAST(0xB2410B00 AS Date), CAST(0xB2410B00 AS Date))
INSERT [dbo].[Roles] ([Id], [Name], [Created_time], [Updated_time]) VALUES (1, N'Admin', CAST(0xB2410B00 AS Date), CAST(0xB2410B00 AS Date))
INSERT [dbo].[Roles] ([Id], [Name], [Created_time], [Updated_time]) VALUES (2, N'Staff', CAST(0xB2410B00 AS Date), CAST(0xB2410B00 AS Date))
INSERT [dbo].[Staffs] ([Id], [Name], [Email], [Password], [Birthday], [Address], [Avatar], [Gender], [Phone], [Role], [Created_time], [Updated_time]) VALUES (N'NV001', N'Trần Công Truyền', N'truyentran20172201@gmail.com', N'123', CAST(0x1C240B00 AS Date), N'1144 Lê Đức Thọ Gò Vấp', N'nhanvien1.jpg', 1, N'0962086560', 1, CAST(0xB2410B00 AS Date), CAST(0xB2410B00 AS Date))
INSERT [dbo].[Staffs] ([Id], [Name], [Email], [Password], [Birthday], [Address], [Avatar], [Gender], [Phone], [Role], [Created_time], [Updated_time]) VALUES (N'NV002', N'Nguyễn Đức Hòa', N'duchoa3320000@gmail.com', N'123', CAST(0x07240B00 AS Date), N'Hooc Môn', N'nhanvien2.jpg', 1, N'0123738492', 1, CAST(0xB2410B00 AS Date), CAST(0xB2410B00 AS Date))
INSERT [dbo].[Staffs] ([Id], [Name], [Email], [Password], [Birthday], [Address], [Avatar], [Gender], [Phone], [Role], [Created_time], [Updated_time]) VALUES (N'NV003', N'Doanh Ngọc Diễm', N'diemdoanhngoc123@gmail.com', N'123', CAST(0x07240B00 AS Date), N'Bình Thạnh', N'nhanvien3.jpg', 1, N'0123738492', 1, CAST(0xB2410B00 AS Date), CAST(0xB2410B00 AS Date))
INSERT [dbo].[Staffs] ([Id], [Name], [Email], [Password], [Birthday], [Address], [Avatar], [Gender], [Phone], [Role], [Created_time], [Updated_time]) VALUES (N'NV004', N'Trần Đại Hưng', N'hungtran123@gmail.com', N'123', CAST(0x29240B00 AS Date), N'Thủ Đức', N'nhanvien4.jpg', 1, N'0123738432', 1, CAST(0xB2410B00 AS Date), CAST(0xB2410B00 AS Date))
INSERT [dbo].[Staffs] ([Id], [Name], [Email], [Password], [Birthday], [Address], [Avatar], [Gender], [Phone], [Role], [Created_time], [Updated_time]) VALUES (N'NV005', N'Hồ Phi Long', N'longbigay@gmail.com', N'123', CAST(0x61250B00 AS Date), N'Quận 2', N'nhanvien5.jpg', 1, N'0829069648', 1, CAST(0xB2410B00 AS Date), CAST(0xB2410B00 AS Date))
INSERT [dbo].[Staffs] ([Id], [Name], [Email], [Password], [Birthday], [Address], [Avatar], [Gender], [Phone], [Role], [Created_time], [Updated_time]) VALUES (N'NV006', N'Đầu Cắt Moiz', N'Moizcatdau123@gmail.com', N'123', CAST(0x4C250B00 AS Date), N'Quận1', N'nhanvien6.jpg', 1, N'0123728492', 2, CAST(0xB2410B00 AS Date), CAST(0xB2410B00 AS Date))
INSERT [dbo].[TypesOfFlowers] ([Id], [Name], [Image]) VALUES (N'HC', N'Hoa cưới', NULL)
INSERT [dbo].[TypesOfFlowers] ([Id], [Name], [Image]) VALUES (N'HCB', N'Hoa chi buồn', NULL)
INSERT [dbo].[TypesOfFlowers] ([Id], [Name], [Image]) VALUES (N'HCM', N'Hoa chúc mừng', NULL)
INSERT [dbo].[TypesOfFlowers] ([Id], [Name], [Image]) VALUES (N'HKT', N'Hoa khai trương', NULL)
INSERT [dbo].[TypesOfFlowers] ([Id], [Name], [Image]) VALUES (N'HSN', N'Hoa sinh nhật', NULL)
INSERT [dbo].[Users] ([Id], [Name], [Email], [Address], [Phone], [Password], [Avatar], [Gender], [Is_Active], [Created_time], [Updated_time]) VALUES (N'001', N'Nguyễn Đức Hòa', N'duchoa3320000@gmail.com', N'Hóc Môn', N'0962543840', N'123', N'hoa.jpg', 1, 1, CAST(0xB2410B00 AS Date), CAST(0xB2410B00 AS Date))
INSERT [dbo].[Users] ([Id], [Name], [Email], [Address], [Phone], [Password], [Avatar], [Gender], [Is_Active], [Created_time], [Updated_time]) VALUES (N'002', N'Trần Công Truyền', N'truyentran20172201@gmail.com', N'Gò Vấp', N'0962086560', N'123', N'truyen.jpg', 1, 1, CAST(0xB2410B00 AS Date), CAST(0xB2410B00 AS Date))
INSERT [dbo].[Users] ([Id], [Name], [Email], [Address], [Phone], [Password], [Avatar], [Gender], [Is_Active], [Created_time], [Updated_time]) VALUES (N'003', N'Doanh Ngọc Diễm', N'diem@gmail.com', N'Bình Thạnh', N'0962789456', N'123', N'diem.jpg', 1, 1, CAST(0xB2410B00 AS Date), CAST(0xB2410B00 AS Date))
INSERT [dbo].[Users] ([Id], [Name], [Email], [Address], [Phone], [Password], [Avatar], [Gender], [Is_Active], [Created_time], [Updated_time]) VALUES (N'004', N'Hồ Phi Long', N'longho2390@gmail.com', N'Quận 2', N'0707919529', N'123', N'long.jpg', 1, 1, CAST(0xB2410B00 AS Date), CAST(0xB2410B00 AS Date))
INSERT [dbo].[Users] ([Id], [Name], [Email], [Address], [Phone], [Password], [Avatar], [Gender], [Is_Active], [Created_time], [Updated_time]) VALUES (N'005', N'Trần Đại Hưng', N'walker545vn@gmail.com', N'Thủ Đức', N'0913731119', N'123', N'hung.jpg', 1, 1, CAST(0xB2410B00 AS Date), CAST(0xB2410B00 AS Date))
INSERT [dbo].[Users] ([Id], [Name], [Email], [Address], [Phone], [Password], [Avatar], [Gender], [Is_Active], [Created_time], [Updated_time]) VALUES (N'006', N'Nguyễn Chi Pu', N'chipu123@gmail.com', N'Tân Bình', N'0154879652', N'123', N'chipu.jpg', 0, 1, CAST(0xB2410B00 AS Date), CAST(0xB2410B00 AS Date))
INSERT [dbo].[Users] ([Id], [Name], [Email], [Address], [Phone], [Password], [Avatar], [Gender], [Is_Active], [Created_time], [Updated_time]) VALUES (N'007', N'Thiều Bảo Trâm', N'thieutram@gmail.com', N'Thủ Đức', N'0945687545', N'123', N'tram.jpg', 0, 1, CAST(0xB2410B00 AS Date), CAST(0xB2410B00 AS Date))
INSERT [dbo].[Users] ([Id], [Name], [Email], [Address], [Phone], [Password], [Avatar], [Gender], [Is_Active], [Created_time], [Updated_time]) VALUES (N'008', N'Nguyễn Quang Hải', N'quanghai@gmail.com', N'Quận 9', N'0353349526', N'123', N'hai.jpg', 1, 1, CAST(0xB2410B00 AS Date), CAST(0xB2410B00 AS Date))
INSERT [dbo].[Users] ([Id], [Name], [Email], [Address], [Phone], [Password], [Avatar], [Gender], [Is_Active], [Created_time], [Updated_time]) VALUES (N'009', N'Nguyễn Công Phượng', N'congphuong@gmail.com', N'Bình Tân', N'0745678912', N'123', N'phuong.jpg', 1, 1, CAST(0xB2410B00 AS Date), CAST(0xB2410B00 AS Date))
INSERT [dbo].[Users] ([Id], [Name], [Email], [Address], [Phone], [Password], [Avatar], [Gender], [Is_Active], [Created_time], [Updated_time]) VALUES (N'010', N'Nguyễn Phương Dung', N'phuongdung@gmail.com', N'Củ Chi', N'0987965123', N'123', N'dung.jpg', 0, 1, CAST(0xB2410B00 AS Date), CAST(0xB2410B00 AS Date))
ALTER TABLE [dbo].[Flowers] ADD  DEFAULT (getdate()) FOR [Createtimes]
GO
ALTER TABLE [dbo].[Flowers] ADD  DEFAULT (getdate()) FOR [Updatetimes]
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
ALTER TABLE [dbo].[Flower_PromotionProgram]  WITH CHECK ADD FOREIGN KEY([DiscountID])
REFERENCES [dbo].[DiscountProgram] ([Id])
GO
ALTER TABLE [dbo].[Flower_PromotionProgram]  WITH CHECK ADD FOREIGN KEY([DiscountID])
REFERENCES [dbo].[DiscountProgram] ([Id])
GO
ALTER TABLE [dbo].[Flower_PromotionProgram]  WITH CHECK ADD FOREIGN KEY([DiscountID])
REFERENCES [dbo].[DiscountProgram] ([Id])
GO
ALTER TABLE [dbo].[Flower_PromotionProgram]  WITH CHECK ADD FOREIGN KEY([FlowerID])
REFERENCES [dbo].[Flowers] ([Id])
GO
ALTER TABLE [dbo].[Flower_PromotionProgram]  WITH CHECK ADD FOREIGN KEY([FlowerID])
REFERENCES [dbo].[Flowers] ([Id])
GO
ALTER TABLE [dbo].[Flower_PromotionProgram]  WITH CHECK ADD FOREIGN KEY([FlowerID])
REFERENCES [dbo].[Flowers] ([Id])
GO
ALTER TABLE [dbo].[Flowers]  WITH CHECK ADD FOREIGN KEY([TypeId])
REFERENCES [dbo].[TypesOfFlowers] ([Id])
GO
ALTER TABLE [dbo].[Flowers]  WITH CHECK ADD FOREIGN KEY([TypeId])
REFERENCES [dbo].[TypesOfFlowers] ([Id])
GO
ALTER TABLE [dbo].[Flowers]  WITH CHECK ADD FOREIGN KEY([TypeId])
REFERENCES [dbo].[TypesOfFlowers] ([Id])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([Userid])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([Userid])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([Userid])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[OrdersDetails]  WITH CHECK ADD FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([Id])
GO
ALTER TABLE [dbo].[OrdersDetails]  WITH CHECK ADD FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([Id])
GO
ALTER TABLE [dbo].[OrdersDetails]  WITH CHECK ADD FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([Id])
GO
USE [master]
GO
ALTER DATABASE [SG_Rose] SET  READ_WRITE 
GO
