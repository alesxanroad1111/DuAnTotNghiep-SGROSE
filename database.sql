USE [SG_Rose]
GO
/****** Object:  Table [dbo].[Companys]    Script Date: 10/17/2020 11:12:49 AM ******/
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
/****** Object:  Table [dbo].[Contacts]    Script Date: 10/17/2020 11:12:49 AM ******/
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
/****** Object:  Table [dbo].[DiscountProgram]    Script Date: 10/17/2020 11:12:49 AM ******/
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
/****** Object:  Table [dbo].[Flower_PromotionProgram]    Script Date: 10/17/2020 11:12:49 AM ******/
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
/****** Object:  Table [dbo].[Flowers]    Script Date: 10/17/2020 11:12:49 AM ******/
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
/****** Object:  Table [dbo].[Orders]    Script Date: 10/17/2020 11:12:49 AM ******/
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
/****** Object:  Table [dbo].[OrdersDetails]    Script Date: 10/17/2020 11:12:49 AM ******/
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
/****** Object:  Table [dbo].[Roles]    Script Date: 10/17/2020 11:12:49 AM ******/
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
/****** Object:  Table [dbo].[Staffs]    Script Date: 10/17/2020 11:12:49 AM ******/
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
/****** Object:  Table [dbo].[TypesOfFlowers]    Script Date: 10/17/2020 11:12:49 AM ******/
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
/****** Object:  Table [dbo].[Users]    Script Date: 10/17/2020 11:12:49 AM ******/
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
INSERT [dbo].[Companys] ([Name], [Address], [PhoneNumber], [Fax], [Link]) VALUES (N'Flower Love', N'Tân Phú', N'0348213597', N'1', N'Flowercorner')
INSERT [dbo].[Companys] ([Name], [Address], [PhoneNumber], [Fax], [Link]) VALUES (N'Fresh Flower ', N'Qu?n 7', N'0356478923', N'1', N'Flowercorner')
INSERT [dbo].[Companys] ([Name], [Address], [PhoneNumber], [Fax], [Link]) VALUES (N'Flower World', N'Bình Tân', N'0357452789', N'1', N'Flowercorner')
INSERT [dbo].[Contacts] ([Id], [UsersId], [Topic], [Message], [Phone], [Map]) VALUES (1, N'001', N'Ch?t lu?ng hoa', N'Ch?t lu?ng hoa', N'0913731119', NULL)
INSERT [dbo].[Contacts] ([Id], [UsersId], [Topic], [Message], [Phone], [Map]) VALUES (2, N'002', N'Xin th?c t?p', N'Em xin vào làm nhân viên', N'0123687456', NULL)
INSERT [dbo].[Contacts] ([Id], [UsersId], [Topic], [Message], [Phone], [Map]) VALUES (3, N'003', N'Thêm s? lu?ng', N'......', N'0974532567', NULL)
INSERT [dbo].[Contacts] ([Id], [UsersId], [Topic], [Message], [Phone], [Map]) VALUES (4, N'001', N'Ch?t lu?ng hoa', N'Ch?t lu?ng hoa', N'0913731119', NULL)
SET IDENTITY_INSERT [dbo].[DiscountProgram] ON 

INSERT [dbo].[DiscountProgram] ([Id], [Name], [Date_Start], [Date_End]) VALUES (11, N'Tình yêu vinh c?u', CAST(0xB8400B00 AS Date), CAST(0xBC400B00 AS Date))
INSERT [dbo].[DiscountProgram] ([Id], [Name], [Date_Start], [Date_End]) VALUES (22, N'8/3 bên c?nh ph? n? thân yêu', CAST(0xCC400B00 AS Date), CAST(0xD3400B00 AS Date))
INSERT [dbo].[DiscountProgram] ([Id], [Name], [Date_Start], [Date_End]) VALUES (33, N'20/10 c?a các tình yêu', CAST(0xB0410B00 AS Date), CAST(0xB5410B00 AS Date))
INSERT [dbo].[DiscountProgram] ([Id], [Name], [Date_Start], [Date_End]) VALUES (44, N'20/11 ngày nhà giáo vi?t nam', CAST(0xCF410B00 AS Date), CAST(0xD4410B00 AS Date))
INSERT [dbo].[DiscountProgram] ([Id], [Name], [Date_Start], [Date_End]) VALUES (55, N'Giáng sinh anh lành', CAST(0xF2410B00 AS Date), CAST(0xF7410B00 AS Date))

SET IDENTITY_INSERT [dbo].[DiscountProgram] OFF
INSERT [dbo].[Flower_PromotionProgram] ([DiscountID], [FlowerID], [Type_Percent], [Type_Price], [Amount]) VALUES (11, N'HC001', 20, 0, 10)
INSERT [dbo].[Flower_PromotionProgram] ([DiscountID], [FlowerID], [Type_Percent], [Type_Price], [Amount]) VALUES (22, N'HC009', 0, 250000, 20)
INSERT [dbo].[Flower_PromotionProgram] ([DiscountID], [FlowerID], [Type_Percent], [Type_Price], [Amount]) VALUES (33, N'HC008', 50, 0, 15)
INSERT [dbo].[Flower_PromotionProgram] ([DiscountID], [FlowerID], [Type_Percent], [Type_Price], [Amount]) VALUES (44, N'HCM002', 10, 0, 30)
INSERT [dbo].[Flower_PromotionProgram] ([DiscountID], [FlowerID], [Type_Percent], [Type_Price], [Amount]) VALUES (55, N'HC001', 0, 250000, 20)
SET IDENTITY_INSERT [dbo].[Orders] ON 

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
