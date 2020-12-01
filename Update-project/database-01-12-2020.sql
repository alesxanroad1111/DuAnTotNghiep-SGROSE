USE [SG_Rose]
GO
/****** Object:  StoredProcedure [dbo].[sp_LichSuMuaHang]    Script Date: 12/1/2020 3:32:57 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_ReportsFowers]    Script Date: 12/1/2020 3:32:57 PM ******/
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
/****** Object:  Table [dbo].[Actives]    Script Date: 12/1/2020 3:32:57 PM ******/
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
/****** Object:  Table [dbo].[Companys]    Script Date: 12/1/2020 3:32:57 PM ******/
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
/****** Object:  Table [dbo].[Contacts]    Script Date: 12/1/2020 3:32:57 PM ******/
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
/****** Object:  Table [dbo].[DiscountPrograms]    Script Date: 12/1/2020 3:32:57 PM ******/
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
/****** Object:  Table [dbo].[FlowerPromotionPrograms]    Script Date: 12/1/2020 3:32:57 PM ******/
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
/****** Object:  Table [dbo].[Flowers]    Script Date: 12/1/2020 3:32:57 PM ******/
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
	[Createdtime] [date] NULL,
	[Updatedtime] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Genders]    Script Date: 12/1/2020 3:32:57 PM ******/
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
/****** Object:  Table [dbo].[Ispaids]    Script Date: 12/1/2020 3:32:57 PM ******/
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
/****** Object:  Table [dbo].[Orders]    Script Date: 12/1/2020 3:32:57 PM ******/
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
	[Createdtime] [date] NULL,
	[Updatedtime] [date] NULL,
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
/****** Object:  Table [dbo].[OrdersDetails]    Script Date: 12/1/2020 3:32:57 PM ******/
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
/****** Object:  Table [dbo].[OrderStatus]    Script Date: 12/1/2020 3:32:57 PM ******/
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
/****** Object:  Table [dbo].[Roles]    Script Date: 12/1/2020 3:32:57 PM ******/
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
/****** Object:  Table [dbo].[Staffs]    Script Date: 12/1/2020 3:32:57 PM ******/
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
/****** Object:  Table [dbo].[TypesOfFlowers]    Script Date: 12/1/2020 3:32:57 PM ******/
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
/****** Object:  Table [dbo].[Users]    Script Date: 12/1/2020 3:32:57 PM ******/
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
	[Createdtime] [date] NULL,
	[Updatedtime] [date] NULL,
	[Birthday] [date] NULL,
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
INSERT [dbo].[Flowers] ([Id], [Name], [TypeId], [Amount], [Price], [Image], [Notes], [Createdtime], [Updatedtime]) VALUES (14, N'Luyến Tiếc', 2, 99, 2000000, N'Luyentiec.jpg', N'Thể hiện sự thành kính đến với gia quyến với kệ hoa được tô điểm bởi những đoá hồng kem tinh tế. Vòng hoa được bao phủ bởi những đoá hồng kem tươi nhất và đặc biệt được tô điểm bới hoa hồng tím đằm thắm, tưởng nhớ những kỉ niệm tươi đẹp nhất trong dòng thời gian của người khi còn ở bên gia quyến. Vòng hoa này chính là lời tri ân sâu sắc nhất, tưởng nhớ đến sự hi sinh của người đã khuất.', CAST(0xD3410B00 AS Date), NULL)
INSERT [dbo].[Flowers] ([Id], [Name], [TypeId], [Amount], [Price], [Image], [Notes], [Createdtime], [Updatedtime]) VALUES (46, N'Ngày hạnh phúc', 1, 99, 250000, N'Ngayhanhphuc.jpg', N'Ngọt ngào, lãng mạn và dễ thương, bó hoa cầm tay được dựa trên cảm hứng từ những câu chuyện tình trẻ trung, đáng yêu và đầy nhiệt huyết. Tông màu pastel đáng yêu sẽ góp phần tô thêm màu sắc hạnh phúc vào đám cưới của bạn đấy.', CAST(0xDB410B00 AS Date), CAST(0xDB410B00 AS Date))
INSERT [dbo].[Flowers] ([Id], [Name], [TypeId], [Amount], [Price], [Image], [Notes], [Createdtime], [Updatedtime]) VALUES (47, N'Ngày rạng ngời', 1, 99, 250000, N'Ngayrangngoi.jpg', N'Mặt trời là nguồn sống, là chân lí soi rạng, dẫn lỗi cuộc sống. "Ánh mặt trời" là sự kết hợp của những đóa hoa hướng dương rực lửa nhưng được dịu lại bởi sắc xanh, trắng và tím của hoa lá phụ mang đến sắc màu rực rỡ mà không kém phần dịu dàng. tinh tế. Bó hoa có thể là bó hoa cầm tay dành cho cô dâu cho ngày đẹp nhất cuộc đời mình , cũng có thể là một món quà xinh tươi cho những dịp đặc biệt nhất!', CAST(0xDB410B00 AS Date), CAST(0xDB410B00 AS Date))
INSERT [dbo].[Flowers] ([Id], [Name], [TypeId], [Amount], [Price], [Image], [Notes], [Createdtime], [Updatedtime]) VALUES (48, N'Ngày sánh đôi', 1, 99, 250000, N'Ngaysanhdoi.jpg', N'Bó hoa kết hợp giữa hồng dâu cùng cát tường một món quà ý nghĩa mà đầy dễ thương. Hãy dành tặnh người con gái bạn thương một món quà đầy ngọt ngào nhé. Phút yêu đầu bao giờ cũng lãng mạn và đối phương trong mắt bạn lúc đó thật tỏa nắng và đáng yêu,,đừng ngần ngại để bó hoa thay bạn gợi nhắc cho nàng khoảnh khắc ngọt ngào đó nhé!
Bó hoa cũng là một gợi ý hoàn hảo cho bó hoa cầm tay cô dâu trong ngày trọng đại đó.', CAST(0xDB410B00 AS Date), CAST(0xDB410B00 AS Date))
INSERT [dbo].[Flowers] ([Id], [Name], [TypeId], [Amount], [Price], [Image], [Notes], [Createdtime], [Updatedtime]) VALUES (49, N'Buồn an giấc', 2, 99, 150000, N'Buonangiac.jpg', N'Bạn đang cần tìm một mẫu kệ hoa chia buồn đẹp, sang trọng với một mức giá không quá cao để gửi tới đám tang? Mẫu vòng hoa chia buồn An Giấc sẽ là sự lựa chọn phù hợp và đáp ứng đủ các tiêu chí mà bạn đang cần.  Mẫu vòng hoa chia buồn An giấc được thiết kế theo tông màu trắng tinh khiết, màu sắc được sử dụng nhiều nhất trong các đám tang. Màu trắng thể hiện sự tôn kính và sự thương tiếc vô vàn với người đã khuất, đồng thời cũng thể hiện sự chia sẻ với gia đình của họ. ', CAST(0xDB410B00 AS Date), CAST(0xDB410B00 AS Date))
INSERT [dbo].[Flowers] ([Id], [Name], [TypeId], [Amount], [Price], [Image], [Notes], [Createdtime], [Updatedtime]) VALUES (50, N'Buồn vĩnh hằng', 2, 99, 150000, N'Buonvinhhang.jpg', N'Ngoài sắc đen trắng truyền thống, sắc tím cũng thường được chọn cho những vòng hoa chia buồn. Màu tím thể hiện sự sâu sắc, tôn trọng, rất thích hợp làm tông màu chủ đạo cho vòng hoa chia buồn. Vòng hoa này đặc biệt được thiết kế một cách hài hòa, trang nhã với sự đan xen của cúc và hồng, trắng và tím, tạo nên một tổng thể nhẹ nhàng, lắng đọng.', CAST(0xDB410B00 AS Date), CAST(0xDB410B00 AS Date))
INSERT [dbo].[Flowers] ([Id], [Name], [TypeId], [Amount], [Price], [Image], [Notes], [Createdtime], [Updatedtime]) VALUES (51, N'Buồn vô thường', 2, 99, 150000, N'Buonvothuong.jpg', N'Kệ hoa chia buồn với tông màu trắng tinh tế được kết từ đồng tiền,tú cầu và các loại hoa khác là một lời chia buồn đầy chân thành đến những người bạn luôn hằng yêu quí. Giây phút chia lìa hẳn cần lắm một lời động viên, an ủi chân thành nhất từ những người quan trọng.', CAST(0xDB410B00 AS Date), CAST(0xDB410B00 AS Date))
INSERT [dbo].[Flowers] ([Id], [Name], [TypeId], [Amount], [Price], [Image], [Notes], [Createdtime], [Updatedtime]) VALUES (52, N'Dòng thời gian', 2, 99, 150000, N'Dongthoigian.jpg', N'Hãy nhớ rằng, hoa chia buồn không nhất thiết phải thật buồn hoặc ảm đạm. Giữa khoảng thời gian khó khăn này, hãy để những người xung quanh tưởng nhớ đến khoảng thời gian tươi đẹp, đầy sự cống hiến của người đã an nghỉ bằng những đoá hoa tươi từ Flower Corner. Hoa tươi không chỉ dâng sắc, dâng màu, mà còn dâng hương, tạo nên bầu không khí nhẹ nhàng thoải mái hơn cho gia quyến. Chiếc vòng hoa này đặc biệt còn có thêm sắc tím của lan, tượng trưng cho ước muốn của sự vãn sinh. Hãy để những đoá hoa này nói lên lòng thành của bạn đến với gia quyến của người đã khuất.', CAST(0xDB410B00 AS Date), CAST(0xDB410B00 AS Date))
INSERT [dbo].[Flowers] ([Id], [Name], [TypeId], [Amount], [Price], [Image], [Notes], [Createdtime], [Updatedtime]) VALUES (53, N'Lời cuối', 2, 99, 150000, N'Loicuoi.jpg', N'Một kết cấu vòng hoa khác biệt với hai nửa trắng - tím mang đến nét khác biệt, độc đáo, nhưng vẫn không kém phần nhẹ nhàng, thành kính. Để cho lời chia tay không quá nặng nề, đau buồn; hãy gửi những vòng hoa độc đáo, khác biệt để thể hiện sự quan tâm, chân thành của người gửi.', CAST(0xDB410B00 AS Date), CAST(0xDB410B00 AS Date))
INSERT [dbo].[Flowers] ([Id], [Name], [TypeId], [Amount], [Price], [Image], [Notes], [Createdtime], [Updatedtime]) VALUES (54, N'Nhớ thương', 2, 99, 150000, N'Nhothuong.jpg', N'Giờ phút chia ly là chuyện thường tình trong cuộc sống, kiếp người nào rồi cũng kết thúc, dẫu biết thế, nhưng mỗi lần mất đi người thân yêu đều để lại trong lòng người ở lại một nỗi đau khó vơi. Trong những giai đoạn này, một lời an ủi, sẻ chia dù nhỏ nhất, như một vòng hoa chia buồn, cũng sẽ mang một ý nghĩa to lớn. ', CAST(0xDB410B00 AS Date), CAST(0xDB410B00 AS Date))
INSERT [dbo].[Flowers] ([Id], [Name], [TypeId], [Amount], [Price], [Image], [Notes], [Createdtime], [Updatedtime]) VALUES (55, N'Phù du ', 2, 99, 150000, N'Phudu.jpg', N'Mẫu vòng hoa tang lễ Nhớ Thương được Flower Corner thiết kế từ các loại hoa lan trắng và hoa Ly, những loại hoa truyền thống và được dùng nhiều trong các đám tang tại Việt Nam. ', CAST(0xDB410B00 AS Date), CAST(0xDB410B00 AS Date))
INSERT [dbo].[Flowers] ([Id], [Name], [TypeId], [Amount], [Price], [Image], [Notes], [Createdtime], [Updatedtime]) VALUES (56, N'Thiên thu', 2, 99, 150000, N'Thienthu.jpg', N'Độc đáo, trang trọng, nổi bật là những gì vòng hoa này mang lại. Một vòng hoa khác biệt được lựa chọn cẩn thận và thiết kế một cách tinh tế sẽ giúp thể hiện sự quan tâm và tấm lòng thành kính chia sẻ của bạn. Hãy để hoa nói thay cảm xúc của bạn và giúp vơi đi nỗi buồn trong lòng gia đình.', CAST(0xDB410B00 AS Date), CAST(0xDB410B00 AS Date))
INSERT [dbo].[Flowers] ([Id], [Name], [TypeId], [Amount], [Price], [Image], [Notes], [Createdtime], [Updatedtime]) VALUES (57, N'Yên nghỉ', 2, 99, 150000, N'Yennghi.jpg', N'Kệ hoa được thiết kế bởi đồng tiền, cúc với thiết kế trang nhã là một lời chia buồn đầy tiếc thương cho những mất mát. Hãy gửi kệ hoa này như một lời động viên, an ủi những người ở lại và gửi gắm tiếc nuối cho những người đã ra đi một cách thật chân thành bạn nhé.', CAST(0xDB410B00 AS Date), CAST(0xDB410B00 AS Date))
INSERT [dbo].[Flowers] ([Id], [Name], [TypeId], [Amount], [Price], [Image], [Notes], [Createdtime], [Updatedtime]) VALUES (58, N'Đại lợi', 3, 99, 200000, N'Dailoi.jpg', N'"Tài lộc, tiền tài luôn tấn tới- Danh truyền, uy tín tỏa muôn phương" là lời chúc may mắn mà kệ hoa này mang đến. Ngập tràn màu sắc hồng xinh xắn của hồng kem điểm to sắc vàng từ cát tường, kệ hoa sáng tươi và sáng ngời tượng trưng cho niềm hy vọng, niềm tin vào tương lai rộng mở phía trước.', CAST(0xDB410B00 AS Date), CAST(0xDB410B00 AS Date))
INSERT [dbo].[Flowers] ([Id], [Name], [TypeId], [Amount], [Price], [Image], [Notes], [Createdtime], [Updatedtime]) VALUES (59, N'Đại thành công', 3, 99, 200000, N'Daithanhcong.jpg', N'Sắc tím đậm đầy tự tin và thu hút cùng sắc trắng tinh khôi và thuần khiết khiến cho kệ hoa đầy ý vị và nghệ thuật thích hợp cho mọi sự kiện to lớn và quan trọng. Sự cách tân trong màu sắc khiến cho những kệ hoa chúc mừng truyền thống khác đều sẽ bị lu mờ bởi nét đẹp hiện đại và  trang trọng của nó.', CAST(0xDB410B00 AS Date), CAST(0xDB410B00 AS Date))
INSERT [dbo].[Flowers] ([Id], [Name], [TypeId], [Amount], [Price], [Image], [Notes], [Createdtime], [Updatedtime]) VALUES (60, N'Đơm hoa kết trái', 3, 99, 200000, N'Domhoakettrai.jpg', N'Mẫu kệ hoa khai trương đơm hoa kết trái được thiết kế với thông điệp đặc biệt thể hiện niềm vui và mong ước chân thành dành cho những thành công sắp tới và sự khởi đầu mới đầy tốt đẹp của người nhận mà người gửi muốn nhắn nhủ và trao gửi.', CAST(0xDB410B00 AS Date), CAST(0xDB410B00 AS Date))
INSERT [dbo].[Flowers] ([Id], [Name], [TypeId], [Amount], [Price], [Image], [Notes], [Createdtime], [Updatedtime]) VALUES (61, N'Hưng thịnh', 3, 99, 200000, N'Hungthinh.jpg', N'Mẫu Kệ Hoa Khai Trương Hưng Thịnh mang một lời chúc đầy ý nghĩa và to lớn: “ Chúc quý công ty luôn phát đạt và thịnh vượng”, chiếc kệ này sẽ là một sự lựa chọn đúng đắn và sáng suốt để dành tặng cho những đối tác quan trọng của mình. Không những thế sắc đỏ từ những bông hồng cùng điểm nhấn  của sự tinh khôi từ những bông lan trắng sẽ khiến cho ngày vui thêm long trọng và rực rỡ.', CAST(0xDB410B00 AS Date), CAST(0xDB410B00 AS Date))
INSERT [dbo].[Flowers] ([Id], [Name], [TypeId], [Amount], [Price], [Image], [Notes], [Createdtime], [Updatedtime]) VALUES (62, N'Khởi đầu mới', 3, 99, 200000, N'Khoidaumoi.jpg', N'"Vạn sự cát tường, tấn tài tấn lộc, mã đáo thành công" bao nhiêu lời chúc bạn muốn dành cho những người đã từng giúp đỡ, nâng cánh bạn trong sự nghiệp.Tất cả được gửi gắm trong kệ hoa ngập tràn những loài hoa mang ý nghĩa may mắn, thành công.', CAST(0xDB410B00 AS Date), CAST(0xDB410B00 AS Date))
INSERT [dbo].[Flowers] ([Id], [Name], [TypeId], [Amount], [Price], [Image], [Notes], [Createdtime], [Updatedtime]) VALUES (63, N'Phát tài', 3, 99, 200000, N'Phattai.jpg', N'Kết cấu độc đáo cùng tông đỏ rực rỡ, ấm nóng, vô cùng ấn tượng tạo nên từ các loại hoa hồng đủ sắc, cùng hoa đồng tiền... mang đến một món quà không những sang trọng, nổi bật mà còn mang một ý nghĩa vô cùng sâu sắc: chúc bạn một ngày thật hạnh phúc và ngập tràn niềm vui.', CAST(0xDB410B00 AS Date), CAST(0xDB410B00 AS Date))
INSERT [dbo].[Flowers] ([Id], [Name], [TypeId], [Amount], [Price], [Image], [Notes], [Createdtime], [Updatedtime]) VALUES (64, N'Phú quý', 3, 99, 200000, N'Phuquy.jpg', N'Lẫng hoa Phú quý được tạo nên từ những bông hoa hồng hột gà, hoa ping pong trắng, hoa hướng dương, thiên điểu, lá môn phun đồng. Lẵng hoa thích hợp dành tặng những dịp chúc mừng, mừng khau trương, trang trí nhà...', CAST(0xDB410B00 AS Date), CAST(0xDB410B00 AS Date))
INSERT [dbo].[Flowers] ([Id], [Name], [TypeId], [Amount], [Price], [Image], [Notes], [Createdtime], [Updatedtime]) VALUES (65, N'Tấn tài', 3, 99, 200000, N'Tantai.jpg', N'Thiết kế độc đáo khác với các kệ hoa chúc mừng khác, kệ hoa khai trương tấn tài được tạo nên từ những bông hoa hướng dương vàng rực rỡ cùng calomero xanh mướt tượng trưng cho một lời chúc mừng đầy hân hoan, một lời gửi gắm niềm tin vào tương lai đầy tốt đẹp và rạng rỡ.', CAST(0xDB410B00 AS Date), CAST(0xDB410B00 AS Date))
INSERT [dbo].[Flowers] ([Id], [Name], [TypeId], [Amount], [Price], [Image], [Notes], [Createdtime], [Updatedtime]) VALUES (66, N'Thuận buồm xuôi gió', 3, 99, 200000, N'Thuanbuomxuoigio.jpg', N'Là một bài ca đầy tươi sáng mà hùng hồn tạo nên từ những cánh hoa tươi đẹp nhất. Kệ hoa Thuận Buồm Xuôi Gió được các thợ hoa chuyên nghiệp thiết kế từ các loại hoa như hoa lan, đồng tiền, hoa hồng... sẽ giúp bạn gửi đi lời chúc mừng đầy nhiệt thành đến bạn bè, đồng nghiệp, đối tác vào ngày ngai trương, khánh thành hay kỉ niệm thành lập.', CAST(0xDB410B00 AS Date), CAST(0xDB410B00 AS Date))
INSERT [dbo].[Flowers] ([Id], [Name], [TypeId], [Amount], [Price], [Image], [Notes], [Createdtime], [Updatedtime]) VALUES (67, N'Trang trọng', 3, 99, 200000, N'Trangtrong.jpg', N'Kệ hoa mừng khai trương với thiết đầy sáng tạo và tinh tế, được phối hợp từ các loại hoa khác nhau như hoa hồng, hướng dương... mỗi loài hoa tượng trưng cho những ý nghĩa sâu sắc và phong phú khác nhau. Cùng với tông màu vàng tươi sáng, kệ hoa là món quà mang thông điệp chúc chủ cửa hàng, công ty, chi nhánh mau gặt hái nhiều thành công và phát triển bền vững.', CAST(0xDB410B00 AS Date), CAST(0xDB410B00 AS Date))
INSERT [dbo].[Flowers] ([Id], [Name], [TypeId], [Amount], [Price], [Image], [Notes], [Createdtime], [Updatedtime]) VALUES (68, N'Chúc thành công', 4, 99, 225000, N'Chucthanhcong.jpg', N'Lẵng hoa chúc thành công là mẫu lẵng hoa tặng khai trương được đặt nhiều nhất tại Flower Corner. Lẵng hoa chúc thành công được thiết kế với tông màu nhẹ nhàng, tinh tế từ các loại hoa hồng trắng, hồng hồng, green wicky và các loại hoa lá trang trí phụ. Chúc thành công sẽ là món quà hoàn hảo để dành tặng đối tác, bạn bè hoặc người thân trong ngày lễ khai trương cửa hàng hoặc công ty bởi sự sang trọng và thông điệp tốt lành được ẩn chứa đằng sau lẵng hoa. Bên cạnh đó, bạn cũng hoàn toàn có thể lựa chọn lẵng hoa chúc thành công như một món quà tặng sinh nhật, tốt nghiệp đầy màu sắc để gửi tới bạn bè, người thân.', CAST(0xDB410B00 AS Date), CAST(0xDB410B00 AS Date))
INSERT [dbo].[Flowers] ([Id], [Name], [TypeId], [Amount], [Price], [Image], [Notes], [Createdtime], [Updatedtime]) VALUES (69, N'Khai trương phồn vinh', 4, 99, 225000, N'Khaitruongphonvinh.jpg', N'Khoảnh khắc tươi đẹp và huy hoàng nhất trong một ngày chính là khi mặt trời bắt đầu ló dạng toả ra thứ ánh sáng chói loà mà ấm áp đến muôn nơi cũng giống như một lời chúc, mong ước cho sự nổi tiếng và việc kinh doanh được lan rộng, ngày càng phát đạt và thịnh vượng. Dựa trên ý tưởng đó mẫu hoa khai trương phồn vinh đã được thiết kế với tông đỏ và hồng từ những bông hồng và đồng tiền tươi thắm để mô tả lại hình ảnh tươi đẹp ấy. ', CAST(0xDB410B00 AS Date), CAST(0xDB410B00 AS Date))
INSERT [dbo].[Flowers] ([Id], [Name], [TypeId], [Amount], [Price], [Image], [Notes], [Createdtime], [Updatedtime]) VALUES (70, N'Khoe sắc thắm', 4, 99, 225000, N'Khoesactham.jpg', N'Được làm từ những bông hướng dương tươi nhất và điểm tô bởi những nhánh cúc calimero trắng và salem hồng xinh xắn, lẵng hoa khoe sắc rực rỡ  và mang đầy sức sống. Đây se là món quà vô cùng phù hợp nếu như bạn muốn tạo một ấn tượng đến đối tác, đồng nghiệp, bạn bè, hay những người mà bạn thương yêu quan tâm nhất.', CAST(0xDB410B00 AS Date), CAST(0xDB410B00 AS Date))
INSERT [dbo].[Flowers] ([Id], [Name], [TypeId], [Amount], [Price], [Image], [Notes], [Createdtime], [Updatedtime]) VALUES (71, N'Lẵng hoa thành công', 4, 99, 225000, N'Langhoathanhcong.png', N'Lẵng hoa khai trương Thành Công là sự kết hợp giữa tông màu hồng tinh tế và tông vàng đầy tươi sáng từ những cánh hoa hồng dâu, hướng dương và lan. Trong những dịp khai trương, kỉ niệm, chúc mừng hãy gửi đến bạn bè, đối tác, đồng nghiệp lời chúc may mắn đầy hân hoan và chân thành nhất thông qua hộp hoa đầy sắc màu này nhé.', CAST(0xDB410B00 AS Date), CAST(0xDB410B00 AS Date))
INSERT [dbo].[Flowers] ([Id], [Name], [TypeId], [Amount], [Price], [Image], [Notes], [Createdtime], [Updatedtime]) VALUES (72, N'Mừng hồng phát', 4, 99, 225000, N'Munghongphat.jpg', N'Lẵng hoa khai trương hồng phát gồm hồng vàng, cát tường trắng, lá pito, sao tím... Các loại hoa tươi đẹp và rực rỡ nhất được thiết kế xòe rộng ra các hướng sẽ giúp bạn gửi đến bạn bè, người thân ,đồng nghiệp lời nhắn nhủ, hy vọng vào những điều may mắn và tốt đẹp sẽ đến trên con đường chinh phục ước mơ và khát vọng của mỗi người. Lẵng hoa Hồng Phát phù hợp để làm quà tặng bạn bè, đối tác trong dịp khai trương hay kỷ niệm ngày thành lập công ty. ', CAST(0xDB410B00 AS Date), CAST(0xDB410B00 AS Date))
INSERT [dbo].[Flowers] ([Id], [Name], [TypeId], [Amount], [Price], [Image], [Notes], [Createdtime], [Updatedtime]) VALUES (73, N'Mừng vươn lên', 4, 99, 225000, N'Mungvuonlen.jpg', N'Trên con đường sự nghiệp thành công của mỗi người luôn có sự chung tay, giúp đỡ từ phía những người bạn, những người đối tác hay doanh nghiệp. Vì vậy đôi lúc một lời cảm ơn hay một lời chúc mừng sẽ thắt chặt tình cảm giữa mọi người hơn đấy. Lẵng hoa được tạo nên từ hoa hồng, tú cầu và hướng dương với màu sắc rực rỡ tượng trưng cho một lời chúc hướng đến tương lai đầu thành công và tươi sáng đấy.', CAST(0xDB410B00 AS Date), CAST(0xDB410B00 AS Date))
INSERT [dbo].[Flowers] ([Id], [Name], [TypeId], [Amount], [Price], [Image], [Notes], [Createdtime], [Updatedtime]) VALUES (74, N'Sức sống', 4, 99, 225000, N'Sucsong.jpg', N'Lẵng hoa hoàn toàn nỗi bật đầy lung linh rạng ngời tạo nên từ những cánh hồng pastel đầy sức sống nhất. Với thiết kế mới lạ tỏa rộng xung quanh, lẵng hoa không chỉ là một món quà đầy ý nghĩa mà còn là vật trang trí tinh tế mang lại cho nhà, văn phòng công ty một không khí đầy tươi mới. Lẵng hoa sức sống là lựa chọn hoàn hảo để làm hoa tặng khai trương của đối tác, bạn bè. Ngoài ra, bạn cũng có thể lựa chọn lẵng hoa này như một món quà sinh nhật dành tặng ba mẹ hoặc bạn bè đồng nghiệp.', CAST(0xDB410B00 AS Date), CAST(0xDB410B00 AS Date))
INSERT [dbo].[Flowers] ([Id], [Name], [TypeId], [Amount], [Price], [Image], [Notes], [Createdtime], [Updatedtime]) VALUES (75, N'Trương đại cát', 4, 99, 225000, N'Truongdaicat.jpg', N'Mang tông màu chủ đạo của vàng- tượng trưng cho sự cao quý, thành đạt và sự mạnh mẽ và chiến thắng. Kết hợp giữa sắc vàng của đồng tiền và sắc hồng, tím tình cảm từ lilies và cát tường, kệ hoa khai trương đại cát sẽ thay bạn gửi đi dòng thông điệp: chúc khai trương tấn tới, phát đạt và vững tin bước trên con đường hướng đến thành công đầy rạng ngời và tươi sáng.', CAST(0xDB410B00 AS Date), CAST(0xDB410B00 AS Date))
INSERT [dbo].[Flowers] ([Id], [Name], [TypeId], [Amount], [Price], [Image], [Notes], [Createdtime], [Updatedtime]) VALUES (76, N'Vạn lộc', 4, 99, 225000, N'Vanloc.jpg', N'Được thiết kế từ những loài hoa mang ý nghĩa may mắn, tài lộc, lẵng hoa Vạn Lộc phù hợp để làm quà tặng đố tác trong dịp khai trương cửa hàng, công ty. Quà chúc mừng sinh nhật cấp trên.', CAST(0xDB410B00 AS Date), CAST(0xDB410B00 AS Date))
INSERT [dbo].[Flowers] ([Id], [Name], [TypeId], [Amount], [Price], [Image], [Notes], [Createdtime], [Updatedtime]) VALUES (77, N'Vững tin', 4, 99, 225000, N'Vungtin.jpg', N'Mỗi người đều luôn ấp ủ, hy vọng và phấn đấu vì ước mơ, khát vọng của riêng mình. Lẵng hoa với những bông hoa hồng vàng rực rỡ như màu sắc tươi sáng của mặt trời sẽ mang đến những điều may mắn, những niềm vui, trong khi hồng đỏ tượng trưng cho tinh thần mạnh mẽ, sự nhiệt huyết và không ngừng chiến đấu. Kết hợp cùng lan, hồng da và các loại hoa đa sắc màu khác, hộp hoa thay bạn gửi đi nhửng lời chúc chân thành và đầy hân hoan.', CAST(0xDB410B00 AS Date), CAST(0xDB410B00 AS Date))
INSERT [dbo].[Flowers] ([Id], [Name], [TypeId], [Amount], [Price], [Image], [Notes], [Createdtime], [Updatedtime]) VALUES (78, N'Câu hát', 5, 99, 200000, N'Cauhat.jpg', N'Nắng luôn mang trong mình sự vui tươi, reo vui và trong sáng. Lấy cảm hứng từ vẻ đẹp của nắng, bó hoa mang trong mình một lời chúc may mắn và thành công dễ thương mà đầy ý nghĩa. Hãy gửi tặng bó hoa đầy may mằn này đến bạn bè, đồng nghiệp hay người thân và mang nắng đến một ngày của họ nhé.', CAST(0xDB410B00 AS Date), CAST(0xDB410B00 AS Date))
INSERT [dbo].[Flowers] ([Id], [Name], [TypeId], [Amount], [Price], [Image], [Notes], [Createdtime], [Updatedtime]) VALUES (79, N'Cổ tích', 5, 99, 200000, N'Cotich.jpg', N'Những câu chuyện tình có khi dịu dàng và sáng trong như những giọt nắng, có khi dịu dàng trầm lặng và lãng mạn như những buổi hoàng hôn. Hãy cùng điểm tô thêm những sắc màu vào câu chuyện tình yêu của hai bạn nhé. Bó hoa 40 cành hồng kem viền baby phun hồng đầy ngọt ngào, chứa đầy tình yêu thương sẽ là một món quà cực kỳ đặc biệt đấy.', CAST(0xDB410B00 AS Date), CAST(0xDB410B00 AS Date))
INSERT [dbo].[Flowers] ([Id], [Name], [TypeId], [Amount], [Price], [Image], [Notes], [Createdtime], [Updatedtime]) VALUES (80, N'Đáng yêu', 5, 99, 200000, N'Dangyeu.jpg', N'Hồng đỏ và cẩm chướng hồng kết hợp cùng những loài hoa lá phụ khác tạo nên một bó hoa đầy tinh tế. Bó hoa đáng yêu là lựa chọn hoàn hảo để gửi tặng bạn gái trong ngày lễ tình nhân Valentine hay trong ngày sinh nhật.', CAST(0xDB410B00 AS Date), CAST(0xDB410B00 AS Date))
INSERT [dbo].[Flowers] ([Id], [Name], [TypeId], [Amount], [Price], [Image], [Notes], [Createdtime], [Updatedtime]) VALUES (81, N'Luôn bên em', 5, 99, 200000, N'Luonbenem.jpg', N'Giữa cuộc sống với bao nhiêu khó khăn, căng thẳng và tấp nập, một chút nhẹ nhàng, hồn nhiên của đóa hồng đỏ chắc chắn sẽ mang đến niềm vui khó tả cho một ai đó. Sống chậm lại và yêu thương nhiều hơn, chia sẻ nhiều hơn và quan tâm nhiều hơn, hãy để bó hồng này giúp bạn gửi đi thông điệp đó nhé.', CAST(0xDB410B00 AS Date), CAST(0xDB410B00 AS Date))
INSERT [dbo].[Flowers] ([Id], [Name], [TypeId], [Amount], [Price], [Image], [Notes], [Createdtime], [Updatedtime]) VALUES (82, N'Only you', 5, 99, 200000, N'Onlyyou.jpg', N'Dịu dàng mà đầy tươi vui. Bó hoa được kết hợp từ những bông hồng phun xan xinh tươi nhất cùng những loài hoa lá phụ nhỏ xinh khác là một món quà đặc biệt thích hợp tặng đồng nghiệp, bạn bè, cô giáo hay cô bạn gái đáng yêu của bạn. Nhỏ nhắn nhưng đầy ý nghĩa là điều bó hoa này mang đến cho bạn.', CAST(0xDB410B00 AS Date), CAST(0xDB410B00 AS Date))
INSERT [dbo].[Flowers] ([Id], [Name], [TypeId], [Amount], [Price], [Image], [Notes], [Createdtime], [Updatedtime]) VALUES (83, N'Tinh khiết', 5, 99, 200000, N'Tinhkhiet.jpg', N'Bó hoa tinh khiết được thiết kế từ hoa thạch thảo trắng, loài hoa tượng trưng cho sự kiên nhẫn, dịu dàng và nét đẹp dễ thương của những cô gái. Chính vì thế, hoa thạch thảo trắng luôn là sự lựa chọn hàng đầu để làm hoa sinh nhật, hoa tốt nghiệp, hoa chúc mừng 8-3… và hầu hết tất cả những ngày lễ đặc biệt trong năm.', CAST(0xDB410B00 AS Date), CAST(0xDB410B00 AS Date))
INSERT [dbo].[Flowers] ([Id], [Name], [TypeId], [Amount], [Price], [Image], [Notes], [Createdtime], [Updatedtime]) VALUES (84, N'Tỏa sáng', 5, 99, 200000, N'Toasang.jpg', N'Được làm từ những bông hướng dương tươi nhất và điểm tô bởi những nhánh cúc calimero trắng, lẵng hoa tỏa sáng rực rỡ và mang đầy sức sống, may mắn như nắng ngày hè. Đây sẽ là món quà vô cùng phù hợp nếu như bạn muốn tạo một ấn tượng đến đối tác, đồng nghiệp, bạn bè, hay những người mà bạn thương yêu quan tâm nhất.', CAST(0xDB410B00 AS Date), CAST(0xDB410B00 AS Date))
INSERT [dbo].[Flowers] ([Id], [Name], [TypeId], [Amount], [Price], [Image], [Notes], [Createdtime], [Updatedtime]) VALUES (85, N'Tươi hồng', 5, 99, 200000, N'Tuoihong.jpg', N'Cẩm chướng là loài hoa tượng trưng cho vẻ đẹp dịu dàng, đáng yêu nhưng cũng đầy bản lĩnh và mạnh mẽ. Trong cuộc đời mỗi người, cảm giác hạnh phúc nhất chính là yêu và được yêu. Một sớm mai thức dậy nhận được một bó hoa cẩm chướng xinh xắn, chắc chắn người con gái ấy sẽ cảm thấy hạnh phúc đến chừng nào. Đừng chần chừ bạn nhé, hãy gửi tình yêu bạn đến người con gái đặc biệt ấy nào.', CAST(0xDB410B00 AS Date), CAST(0xDB410B00 AS Date))
INSERT [dbo].[Flowers] ([Id], [Name], [TypeId], [Amount], [Price], [Image], [Notes], [Createdtime], [Updatedtime]) VALUES (86, N'Tươi sáng', 5, 99, 200000, N'Tuoisang.jpg', N'Lẵng hoa mang tông màu sáng đầy vui tươi, ngập tràn ánh nắng và niềm vui hân hoan sẽ giúp bạn gửi đến đối tác, doanh nghiệp những lời chúc chân thành và hoan hỉ nhất. Luôn tỏa sáng và hướng đến tương lai tươi đẹp cũng là ý nghĩa mà giỏ hoa này mang đến với hoa hướng dương, hồng vàng và điểm lan vàng.', CAST(0xDB410B00 AS Date), CAST(0xDB410B00 AS Date))
INSERT [dbo].[Flowers] ([Id], [Name], [TypeId], [Amount], [Price], [Image], [Notes], [Createdtime], [Updatedtime]) VALUES (87, N'Yêu kiều', 5, 99, 200000, N'YeuKieu.jpg', N'Hạnh phúc đôi khi không được tính bằng năm, bằng tháng mà hạnh phúc có thể đong đầy dù trong một khoảnh khắc. Hãy gửi đến người bạn yêu thương nhất những khoảnh khắc chứa đựng đầy yêu thương nhé. Bó hoa gồm tông màu hồng lãng mạn của hồng kem kết hợp với vẻ đẹp đầy đáng yêu của thạch thảo trắng.', CAST(0xDB410B00 AS Date), CAST(0xDB410B00 AS Date))
SET IDENTITY_INSERT [dbo].[Flowers] OFF
INSERT [dbo].[Genders] ([Id], [Name]) VALUES (1, N'Nam')
INSERT [dbo].[Genders] ([Id], [Name]) VALUES (2, N'Nữ')
INSERT [dbo].[Genders] ([Id], [Name]) VALUES (3, N'Khác')
INSERT [dbo].[Ispaids] ([Id], [Name]) VALUES (1, N'Chưa Thanh Toán')
INSERT [dbo].[Ispaids] ([Id], [Name]) VALUES (2, N'Đã Thanh Toán')
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([Id], [UserId], [Address], [TotalMoney], [Status], [Ispaid], [Createdtime], [Updatedtime], [Name], [NumberPhone], [Email]) VALUES (1, 1, N'33 Nguyễn Văn Lượng, Gò Vấp', 1500000, 1, 1, CAST(0xC8410B00 AS Date), CAST(0xC8410B00 AS Date), N'a', N'0829069648', N'nhophuonhxa@gmail.com')
INSERT [dbo].[Orders] ([Id], [UserId], [Address], [TotalMoney], [Status], [Ispaid], [Createdtime], [Updatedtime], [Name], [NumberPhone], [Email]) VALUES (2, 2, N'11 Nguyễn Oanh, Gò Vấp', 350000, 1, 1, CAST(0xC8410B00 AS Date), CAST(0xC8410B00 AS Date), N'a', N'0829069648', NULL)
INSERT [dbo].[Orders] ([Id], [UserId], [Address], [TotalMoney], [Status], [Ispaid], [Createdtime], [Updatedtime], [Name], [NumberPhone], [Email]) VALUES (3, 3, N'12 Lê Văn Việt, Quận 9', 4500000, 2, 1, CAST(0xC8410B00 AS Date), CAST(0xC8410B00 AS Date), N'a', N'0829069648', NULL)
INSERT [dbo].[Orders] ([Id], [UserId], [Address], [TotalMoney], [Status], [Ispaid], [Createdtime], [Updatedtime], [Name], [NumberPhone], [Email]) VALUES (4, 4, N'33 Nguyễn Văn Lượng, Gò Vấp', 5500000, 1, 1, CAST(0xC8410B00 AS Date), CAST(0xC8410B00 AS Date), N'a', N'0829069648', NULL)
INSERT [dbo].[Orders] ([Id], [UserId], [Address], [TotalMoney], [Status], [Ispaid], [Createdtime], [Updatedtime], [Name], [NumberPhone], [Email]) VALUES (5, 5, N'123 Quang Trung, Gò Vấp', 3500000, 1, 1, CAST(0xC8410B00 AS Date), CAST(0xC8410B00 AS Date), N'a', N'0829069648', NULL)
INSERT [dbo].[Orders] ([Id], [UserId], [Address], [TotalMoney], [Status], [Ispaid], [Createdtime], [Updatedtime], [Name], [NumberPhone], [Email]) VALUES (6, 6, N'135 Lê Đại Hành', 4200000, 1, 1, CAST(0xC8410B00 AS Date), CAST(0xC8410B00 AS Date), N'a', N'0829069648', NULL)
INSERT [dbo].[Orders] ([Id], [UserId], [Address], [TotalMoney], [Status], [Ispaid], [Createdtime], [Updatedtime], [Name], [NumberPhone], [Email]) VALUES (7, 7, N'333 Phan Văn Trị, Gò Vấp', 2200000, 1, 1, CAST(0xC8410B00 AS Date), CAST(0xC8410B00 AS Date), N'a', N'0829069648', NULL)
INSERT [dbo].[Orders] ([Id], [UserId], [Address], [TotalMoney], [Status], [Ispaid], [Createdtime], [Updatedtime], [Name], [NumberPhone], [Email]) VALUES (8, 8, N'244 Thảo Điền, Quận 2', 2300000, 1, 1, CAST(0xC8410B00 AS Date), CAST(0xC8410B00 AS Date), N'a', N'0829069648', NULL)
INSERT [dbo].[Orders] ([Id], [UserId], [Address], [TotalMoney], [Status], [Ispaid], [Createdtime], [Updatedtime], [Name], [NumberPhone], [Email]) VALUES (9, 9, N'32 Nguyễn Kiệm, Gò Vấp', 2500000, 1, 1, CAST(0xC8410B00 AS Date), CAST(0xC8410B00 AS Date), N'a', N'0829069648', NULL)
INSERT [dbo].[Orders] ([Id], [UserId], [Address], [TotalMoney], [Status], [Ispaid], [Createdtime], [Updatedtime], [Name], [NumberPhone], [Email]) VALUES (10, 10, N'334 Phạm Văn Đồng, Gò Vấp', 6700000, 1, 1, CAST(0xC8410B00 AS Date), CAST(0xC8410B00 AS Date), N'a', N'0829069648', NULL)
INSERT [dbo].[Orders] ([Id], [UserId], [Address], [TotalMoney], [Status], [Ispaid], [Createdtime], [Updatedtime], [Name], [NumberPhone], [Email]) VALUES (11, NULL, N'334 Phạm Văn Đồng, Gò Vấp', 655555, 1, 1, CAST(0xD4410B00 AS Date), CAST(0xD4410B00 AS Date), N'a', N'0829069648', NULL)
INSERT [dbo].[Orders] ([Id], [UserId], [Address], [TotalMoney], [Status], [Ispaid], [Createdtime], [Updatedtime], [Name], [NumberPhone], [Email]) VALUES (12, 1, N'501/14/23 xô viết nghệ tĩnh', 1000000, 1, 1, CAST(0xD7410B00 AS Date), NULL, N'a', N'0829069648', NULL)
INSERT [dbo].[Orders] ([Id], [UserId], [Address], [TotalMoney], [Status], [Ispaid], [Createdtime], [Updatedtime], [Name], [NumberPhone], [Email]) VALUES (28, 1, N'Công Viên Phần Mềm Quang Trung', 750000, 1, 1, CAST(0xDA410B00 AS Date), NULL, N'Nguyễn Đức Hòa', N'0962543840', NULL)
INSERT [dbo].[Orders] ([Id], [UserId], [Address], [TotalMoney], [Status], [Ispaid], [Createdtime], [Updatedtime], [Name], [NumberPhone], [Email]) VALUES (29, 3, N'501/14/23', 1250000, 2, 1, CAST(0xDA410B00 AS Date), NULL, N'Doanh Ngọc Diễm', N'0962789456', NULL)
INSERT [dbo].[Orders] ([Id], [UserId], [Address], [TotalMoney], [Status], [Ispaid], [Createdtime], [Updatedtime], [Name], [NumberPhone], [Email]) VALUES (48, NULL, N'501/14/23 xô viết nghệ tĩnh', 2250000, 1, 1, CAST(0xDB410B00 AS Date), NULL, N'diem doanh', N'0829069648', NULL)
INSERT [dbo].[Orders] ([Id], [UserId], [Address], [TotalMoney], [Status], [Ispaid], [Createdtime], [Updatedtime], [Name], [NumberPhone], [Email]) VALUES (58, 3, N'Quang Trung', 2250000, 1, 1, CAST(0xDB410B00 AS Date), NULL, N'Doanh Ngọc Diễm', N'0962789456', NULL)
INSERT [dbo].[Orders] ([Id], [UserId], [Address], [TotalMoney], [Status], [Ispaid], [Createdtime], [Updatedtime], [Name], [NumberPhone], [Email]) VALUES (59, 4, N'Quận 2', 450000, 1, 1, CAST(0xDB410B00 AS Date), NULL, N'Hồ Phi Long', N'0707919529', N'longho2390@gmail.com')
INSERT [dbo].[Orders] ([Id], [UserId], [Address], [TotalMoney], [Status], [Ispaid], [Createdtime], [Updatedtime], [Name], [NumberPhone], [Email]) VALUES (60, 1, N'Hóc Môn', 250000, 1, 1, CAST(0xDC410B00 AS Date), NULL, N'Nguyễn Đức Hòa', N'0962543840', N'duchoa3320000@gmail.com')
INSERT [dbo].[Orders] ([Id], [UserId], [Address], [TotalMoney], [Status], [Ispaid], [Createdtime], [Updatedtime], [Name], [NumberPhone], [Email]) VALUES (61, 1, N'Hóc Môn', 0, 1, 1, CAST(0xDC410B00 AS Date), NULL, N'Nguyễn Đức Hòa', N'0962543840', N'duchoa3320000@gmail.com')
INSERT [dbo].[Orders] ([Id], [UserId], [Address], [TotalMoney], [Status], [Ispaid], [Createdtime], [Updatedtime], [Name], [NumberPhone], [Email]) VALUES (62, 3, N'Bình Thạnh', 250000, 3, 1, CAST(0xDC410B00 AS Date), NULL, N'Doanh Ngọc Diễm', N'0962789456', N'diem@gmail.com')
INSERT [dbo].[Orders] ([Id], [UserId], [Address], [TotalMoney], [Status], [Ispaid], [Createdtime], [Updatedtime], [Name], [NumberPhone], [Email]) VALUES (63, 3, N'Bình Thạnh', 0, 1, 1, CAST(0xDC410B00 AS Date), NULL, N'Doanh Ngọc Diễm', N'0962789456', N'diem@gmail.com')
INSERT [dbo].[Orders] ([Id], [UserId], [Address], [TotalMoney], [Status], [Ispaid], [Createdtime], [Updatedtime], [Name], [NumberPhone], [Email]) VALUES (64, 3, N'Bình Thạnh', 0, 1, 1, CAST(0xDC410B00 AS Date), NULL, N'Doanh Ngọc Diễm', N'0962789456', N'diem@gmail.com')
INSERT [dbo].[Orders] ([Id], [UserId], [Address], [TotalMoney], [Status], [Ispaid], [Createdtime], [Updatedtime], [Name], [NumberPhone], [Email]) VALUES (65, 3, N'Bình Thạnh', 0, 1, 1, CAST(0xDC410B00 AS Date), NULL, N'Doanh Ngọc Diễm', N'0962789456', N'diem@gmail.com')
INSERT [dbo].[Orders] ([Id], [UserId], [Address], [TotalMoney], [Status], [Ispaid], [Createdtime], [Updatedtime], [Name], [NumberPhone], [Email]) VALUES (66, 3, N'Bình Thạnh', 0, 1, 1, CAST(0xDC410B00 AS Date), NULL, N'Doanh Ngọc Diễm', N'0962789456', N'diem@gmail.com')
INSERT [dbo].[Orders] ([Id], [UserId], [Address], [TotalMoney], [Status], [Ispaid], [Createdtime], [Updatedtime], [Name], [NumberPhone], [Email]) VALUES (67, 3, N'Bình Thạnh', 0, 1, 1, CAST(0xDC410B00 AS Date), NULL, N'Doanh Ngọc Diễm', N'0962789456', N'diem@gmail.com')
INSERT [dbo].[Orders] ([Id], [UserId], [Address], [TotalMoney], [Status], [Ispaid], [Createdtime], [Updatedtime], [Name], [NumberPhone], [Email]) VALUES (68, 3, N'Bình Thạnh', 0, 1, 1, CAST(0xDC410B00 AS Date), NULL, N'Doanh Ngọc Diễm', N'0962789456', N'diem@gmail.com')
INSERT [dbo].[Orders] ([Id], [UserId], [Address], [TotalMoney], [Status], [Ispaid], [Createdtime], [Updatedtime], [Name], [NumberPhone], [Email]) VALUES (69, 3, N'Bình Thạnh', 0, 1, 1, CAST(0xDC410B00 AS Date), NULL, N'Doanh Ngọc Diễm', N'0962789456', N'diem@gmail.com')
INSERT [dbo].[Orders] ([Id], [UserId], [Address], [TotalMoney], [Status], [Ispaid], [Createdtime], [Updatedtime], [Name], [NumberPhone], [Email]) VALUES (70, NULL, N'Bình Thạnh', 0, 1, 1, CAST(0xDC410B00 AS Date), NULL, N'Doanh Ngọc Diễm', N'0962789456', N'diem@gmail.com')
INSERT [dbo].[Orders] ([Id], [UserId], [Address], [TotalMoney], [Status], [Ispaid], [Createdtime], [Updatedtime], [Name], [NumberPhone], [Email]) VALUES (71, 4, N'Quận 2', 250000, 1, 1, CAST(0xDC410B00 AS Date), NULL, N'Hồ Phi Long', N'0707919529', N'longho2390@gmail.com')
INSERT [dbo].[Orders] ([Id], [UserId], [Address], [TotalMoney], [Status], [Ispaid], [Createdtime], [Updatedtime], [Name], [NumberPhone], [Email]) VALUES (72, 4, N'Quận 2', 0, 1, 1, CAST(0xDC410B00 AS Date), NULL, N'Hồ Phi Long', N'0707919529', N'longho2390@gmail.com')
INSERT [dbo].[Orders] ([Id], [UserId], [Address], [TotalMoney], [Status], [Ispaid], [Createdtime], [Updatedtime], [Name], [NumberPhone], [Email]) VALUES (73, 4, N'Quận 2', 0, 1, 1, CAST(0xDC410B00 AS Date), NULL, N'Hồ Phi Long', N'0707919529', N'longho2390@gmail.com')
INSERT [dbo].[Orders] ([Id], [UserId], [Address], [TotalMoney], [Status], [Ispaid], [Createdtime], [Updatedtime], [Name], [NumberPhone], [Email]) VALUES (74, NULL, N'Quận 2', 0, 1, 1, CAST(0xDC410B00 AS Date), NULL, N'Hồ Phi Long', N'0707919529', N'longho2390@gmail.com')
INSERT [dbo].[Orders] ([Id], [UserId], [Address], [TotalMoney], [Status], [Ispaid], [Createdtime], [Updatedtime], [Name], [NumberPhone], [Email]) VALUES (75, NULL, N'Quận 2', 0, 1, 1, CAST(0xDC410B00 AS Date), NULL, N'Hồ Phi Long', N'0707919529', N'longho2390@gmail.com')
INSERT [dbo].[Orders] ([Id], [UserId], [Address], [TotalMoney], [Status], [Ispaid], [Createdtime], [Updatedtime], [Name], [NumberPhone], [Email]) VALUES (76, NULL, N'501/14/23 xô viết nghệ tĩnh', 250000, 1, 1, CAST(0xDC410B00 AS Date), NULL, N'Bảo Công Lê', N'0829069648', N'nhophuonhxa@gmail.com')
INSERT [dbo].[Orders] ([Id], [UserId], [Address], [TotalMoney], [Status], [Ispaid], [Createdtime], [Updatedtime], [Name], [NumberPhone], [Email]) VALUES (77, NULL, N'501/14/23 xô viết nghệ tĩnh', 0, 1, 1, CAST(0xDC410B00 AS Date), NULL, N'Bảo Công Lê', N'0829069648', N'nhophuonhxa@gmail.com')
INSERT [dbo].[Orders] ([Id], [UserId], [Address], [TotalMoney], [Status], [Ispaid], [Createdtime], [Updatedtime], [Name], [NumberPhone], [Email]) VALUES (78, NULL, N'501/14/23 xô viết nghệ tĩnh', 0, 1, 1, CAST(0xDC410B00 AS Date), NULL, N'Bảo Công Lê', N'0829069648', N'nhophuonhxa@gmail.com')
INSERT [dbo].[Orders] ([Id], [UserId], [Address], [TotalMoney], [Status], [Ispaid], [Createdtime], [Updatedtime], [Name], [NumberPhone], [Email]) VALUES (79, NULL, N'501/14/23 xô viết nghệ tĩnh', 0, 1, 1, CAST(0xDC410B00 AS Date), NULL, N'Bảo Công Lê', N'0829069648', N'nhophuonhxa@gmail.com')
INSERT [dbo].[Orders] ([Id], [UserId], [Address], [TotalMoney], [Status], [Ispaid], [Createdtime], [Updatedtime], [Name], [NumberPhone], [Email]) VALUES (80, NULL, N'501/14/23 xô viết nghệ tĩnh', 0, 1, 1, CAST(0xDC410B00 AS Date), NULL, N'Bảo Công Lê', N'0829069648', N'nhophuonhxa@gmail.com')
INSERT [dbo].[Orders] ([Id], [UserId], [Address], [TotalMoney], [Status], [Ispaid], [Createdtime], [Updatedtime], [Name], [NumberPhone], [Email]) VALUES (81, NULL, N'501/14/23 xô viết nghệ tĩnh', 0, 1, 1, CAST(0xDC410B00 AS Date), NULL, N'Bảo Công Lê', N'0829069648', N'nhophuonhxa@gmail.com')
INSERT [dbo].[Orders] ([Id], [UserId], [Address], [TotalMoney], [Status], [Ispaid], [Createdtime], [Updatedtime], [Name], [NumberPhone], [Email]) VALUES (82, NULL, N'501/14/23 xô viết nghệ tĩnh', 0, 1, 1, CAST(0xDC410B00 AS Date), NULL, N'Bảo Công Lê', N'0829069648', N'nhophuonhxa@gmail.com')
INSERT [dbo].[Orders] ([Id], [UserId], [Address], [TotalMoney], [Status], [Ispaid], [Createdtime], [Updatedtime], [Name], [NumberPhone], [Email]) VALUES (83, NULL, N'501/14/23 xô viết nghệ tĩnh', 0, 1, 1, CAST(0xDC410B00 AS Date), NULL, N'Bảo Công Lê', N'0829069648', N'nhophuonhxa@gmail.com')
INSERT [dbo].[Orders] ([Id], [UserId], [Address], [TotalMoney], [Status], [Ispaid], [Createdtime], [Updatedtime], [Name], [NumberPhone], [Email]) VALUES (84, NULL, N'501/14/23 xô viết nghệ tĩnh', 0, 1, 1, CAST(0xDC410B00 AS Date), NULL, N'Bảo Công Lê', N'0829069648', N'nhophuonhxa@gmail.com')
INSERT [dbo].[Orders] ([Id], [UserId], [Address], [TotalMoney], [Status], [Ispaid], [Createdtime], [Updatedtime], [Name], [NumberPhone], [Email]) VALUES (85, NULL, N'501/14/23 xô viết nghệ tĩnh', 0, 1, 1, CAST(0xDC410B00 AS Date), NULL, N'Bảo Công Lê', N'0829069648', N'nhophuonhxa@gmail.com')
INSERT [dbo].[Orders] ([Id], [UserId], [Address], [TotalMoney], [Status], [Ispaid], [Createdtime], [Updatedtime], [Name], [NumberPhone], [Email]) VALUES (86, NULL, N'501/14/23 xô viết nghệ tĩnh', 0, 1, 1, CAST(0xDC410B00 AS Date), NULL, N'Bảo Công Lê', N'0829069648', N'nhophuonhxa@gmail.com')
INSERT [dbo].[Orders] ([Id], [UserId], [Address], [TotalMoney], [Status], [Ispaid], [Createdtime], [Updatedtime], [Name], [NumberPhone], [Email]) VALUES (87, NULL, N'501/14/23 xô viết nghệ tĩnh', 0, 1, 1, CAST(0xDC410B00 AS Date), NULL, N'Bảo Công Lê', N'0829069648', N'nhophuonhxa@gmail.com')
INSERT [dbo].[Orders] ([Id], [UserId], [Address], [TotalMoney], [Status], [Ispaid], [Createdtime], [Updatedtime], [Name], [NumberPhone], [Email]) VALUES (88, NULL, N'501/14/23 xô viết nghệ tĩnh', 0, 1, 1, CAST(0xDC410B00 AS Date), NULL, N'Bảo Công Lê', N'0829069648', N'nhophuonhxa@gmail.com')
INSERT [dbo].[Orders] ([Id], [UserId], [Address], [TotalMoney], [Status], [Ispaid], [Createdtime], [Updatedtime], [Name], [NumberPhone], [Email]) VALUES (89, NULL, N'501/14/23 xô viết nghệ tĩnh', 0, 1, 1, CAST(0xDC410B00 AS Date), NULL, N'Bảo Công Lê', N'0829069648', N'nhophuonhxa@gmail.com')
INSERT [dbo].[Orders] ([Id], [UserId], [Address], [TotalMoney], [Status], [Ispaid], [Createdtime], [Updatedtime], [Name], [NumberPhone], [Email]) VALUES (90, NULL, N'', 250000, 1, 1, CAST(0xDC410B00 AS Date), NULL, N'', N'', N'')
INSERT [dbo].[Orders] ([Id], [UserId], [Address], [TotalMoney], [Status], [Ispaid], [Createdtime], [Updatedtime], [Name], [NumberPhone], [Email]) VALUES (91, NULL, N'501/14/23 xô viết nghệ tĩnh', 250000, 1, 1, CAST(0xDC410B00 AS Date), NULL, N'Trần Thanh Thanh', N'0829061111', N'thanhthanh@gmail.com')
INSERT [dbo].[Orders] ([Id], [UserId], [Address], [TotalMoney], [Status], [Ispaid], [Createdtime], [Updatedtime], [Name], [NumberPhone], [Email]) VALUES (92, NULL, N'501/14/23 xô viết nghệ tĩnh', 0, 1, 1, CAST(0xDC410B00 AS Date), NULL, N'Trần Thanh Thanh', N'0829061111', N'thanhthanh@gmail.com')
INSERT [dbo].[Orders] ([Id], [UserId], [Address], [TotalMoney], [Status], [Ispaid], [Createdtime], [Updatedtime], [Name], [NumberPhone], [Email]) VALUES (1091, 2, N'Gò Vấp', 950000, 1, 1, CAST(0xDD410B00 AS Date), NULL, N'Trần Công Truyền', N'0912321321', N'truyentran20172201@gmail.com')
INSERT [dbo].[Orders] ([Id], [UserId], [Address], [TotalMoney], [Status], [Ispaid], [Createdtime], [Updatedtime], [Name], [NumberPhone], [Email]) VALUES (1092, 3, N'Bình Thạnh', 850000, 1, 1, CAST(0xDF410B00 AS Date), NULL, N'Doanh Ngọc Diễm', N'0962789456', N'diem@gmail.com')
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
INSERT [dbo].[OrdersDetails] ([Id], [OrderId], [FlowerId], [Price], [Amount], [Totalprice], [Createdtime], [Updatedtime]) VALUES (22, 28, 7, 250000, 99, 24750000, CAST(0xDA410B00 AS Date), CAST(0xDA410B00 AS Date))
INSERT [dbo].[OrdersDetails] ([Id], [OrderId], [FlowerId], [Price], [Amount], [Totalprice], [Createdtime], [Updatedtime]) VALUES (23, 29, 2, 250000, 99, 24750000, CAST(0xDA410B00 AS Date), NULL)
INSERT [dbo].[OrdersDetails] ([Id], [OrderId], [FlowerId], [Price], [Amount], [Totalprice], [Createdtime], [Updatedtime]) VALUES (41, 48, 2, 250000, 1, 250000, CAST(0xDB410B00 AS Date), NULL)
INSERT [dbo].[OrdersDetails] ([Id], [OrderId], [FlowerId], [Price], [Amount], [Totalprice], [Createdtime], [Updatedtime]) VALUES (42, 48, 14, 2000000, 1, 2000000, CAST(0xDB410B00 AS Date), NULL)
INSERT [dbo].[OrdersDetails] ([Id], [OrderId], [FlowerId], [Price], [Amount], [Totalprice], [Createdtime], [Updatedtime]) VALUES (46, 58, 3, 250000, 1, 250000, CAST(0xDB410B00 AS Date), NULL)
INSERT [dbo].[OrdersDetails] ([Id], [OrderId], [FlowerId], [Price], [Amount], [Totalprice], [Createdtime], [Updatedtime]) VALUES (47, 58, 14, 2000000, 1, 2000000, CAST(0xDB410B00 AS Date), NULL)
INSERT [dbo].[OrdersDetails] ([Id], [OrderId], [FlowerId], [Price], [Amount], [Totalprice], [Createdtime], [Updatedtime]) VALUES (48, 59, 49, 150000, 1, 150000, CAST(0xDB410B00 AS Date), NULL)
INSERT [dbo].[OrdersDetails] ([Id], [OrderId], [FlowerId], [Price], [Amount], [Totalprice], [Createdtime], [Updatedtime]) VALUES (49, 59, 53, 150000, 2, 300000, CAST(0xDB410B00 AS Date), NULL)
INSERT [dbo].[OrdersDetails] ([Id], [OrderId], [FlowerId], [Price], [Amount], [Totalprice], [Createdtime], [Updatedtime]) VALUES (50, 60, 2, 250000, 1, 250000, CAST(0xDC410B00 AS Date), NULL)
INSERT [dbo].[OrdersDetails] ([Id], [OrderId], [FlowerId], [Price], [Amount], [Totalprice], [Createdtime], [Updatedtime]) VALUES (51, 62, 2, 250000, 1, 250000, CAST(0xDC410B00 AS Date), NULL)
INSERT [dbo].[OrdersDetails] ([Id], [OrderId], [FlowerId], [Price], [Amount], [Totalprice], [Createdtime], [Updatedtime]) VALUES (52, 71, 2, 250000, 1, 250000, CAST(0xDC410B00 AS Date), NULL)
INSERT [dbo].[OrdersDetails] ([Id], [OrderId], [FlowerId], [Price], [Amount], [Totalprice], [Createdtime], [Updatedtime]) VALUES (53, 76, 2, 250000, 1, 250000, CAST(0xDC410B00 AS Date), NULL)
INSERT [dbo].[OrdersDetails] ([Id], [OrderId], [FlowerId], [Price], [Amount], [Totalprice], [Createdtime], [Updatedtime]) VALUES (54, 90, 2, 250000, 1, 250000, CAST(0xDC410B00 AS Date), NULL)
INSERT [dbo].[OrdersDetails] ([Id], [OrderId], [FlowerId], [Price], [Amount], [Totalprice], [Createdtime], [Updatedtime]) VALUES (55, 91, 2, 250000, 1, 250000, CAST(0xDC410B00 AS Date), NULL)
INSERT [dbo].[OrdersDetails] ([Id], [OrderId], [FlowerId], [Price], [Amount], [Totalprice], [Createdtime], [Updatedtime]) VALUES (1055, 1091, 2, 250000, 2, 500000, CAST(0xDD410B00 AS Date), NULL)
INSERT [dbo].[OrdersDetails] ([Id], [OrderId], [FlowerId], [Price], [Amount], [Totalprice], [Createdtime], [Updatedtime]) VALUES (1056, 1091, 71, 225000, 2, 450000, CAST(0xDD410B00 AS Date), NULL)
INSERT [dbo].[OrdersDetails] ([Id], [OrderId], [FlowerId], [Price], [Amount], [Totalprice], [Createdtime], [Updatedtime]) VALUES (1057, 1092, 2, 250000, 1, 250000, CAST(0xDF410B00 AS Date), NULL)
INSERT [dbo].[OrdersDetails] ([Id], [OrderId], [FlowerId], [Price], [Amount], [Totalprice], [Createdtime], [Updatedtime]) VALUES (1058, 1092, 85, 200000, 3, 600000, CAST(0xDF410B00 AS Date), NULL)
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

INSERT [dbo].[Users] ([Id], [Name], [Email], [Address], [Phone], [Password], [Avatar], [Gender], [IsActive], [Createdtime], [Updatedtime], [Birthday]) VALUES (1, N'Nguyễn Đức Hòa', N'duchoa3320000@gmail.com', N'Hóc Môn', N'0962543840', N'123', N'hoa.jpg', 1, 1, CAST(0xB2410B00 AS Date), CAST(0xB2410B00 AS Date), CAST(0xA5240B00 AS Date))
INSERT [dbo].[Users] ([Id], [Name], [Email], [Address], [Phone], [Password], [Avatar], [Gender], [IsActive], [Createdtime], [Updatedtime], [Birthday]) VALUES (2, N'Trần Công Truyền', N'truyentran20172201@gmail.com', N'Gò Vấp', N'0912321321', N'123', N'truyen.jpg', 3, 1, CAST(0xB2410B00 AS Date), CAST(0xDD410B00 AS Date), CAST(0x42250B00 AS Date))
INSERT [dbo].[Users] ([Id], [Name], [Email], [Address], [Phone], [Password], [Avatar], [Gender], [IsActive], [Createdtime], [Updatedtime], [Birthday]) VALUES (3, N'Doanh Ngọc Diễm', N'diem@gmail.com', N'Bình Thạnh', N'0962789456', N'123', N'diem.jpg', 1, 1, CAST(0xB2410B00 AS Date), CAST(0xDF410B00 AS Date), CAST(0xC3240B00 AS Date))
INSERT [dbo].[Users] ([Id], [Name], [Email], [Address], [Phone], [Password], [Avatar], [Gender], [IsActive], [Createdtime], [Updatedtime], [Birthday]) VALUES (4, N'Hồ Phi Long', N'longho2390@gmail.com', N'Quận 2', N'0707919529', N'123', N'long.jpg', 1, 1, CAST(0xB2410B00 AS Date), CAST(0xB2410B00 AS Date), CAST(0xA5240B00 AS Date))
INSERT [dbo].[Users] ([Id], [Name], [Email], [Address], [Phone], [Password], [Avatar], [Gender], [IsActive], [Createdtime], [Updatedtime], [Birthday]) VALUES (5, N'Trần Đại Hưng', N'walker545vn@gmail.com', N'Thủ Đức', N'0913731119', N'123', N'hung.jpg', 1, 1, CAST(0xB2410B00 AS Date), CAST(0xB2410B00 AS Date), CAST(0xA5240B00 AS Date))
INSERT [dbo].[Users] ([Id], [Name], [Email], [Address], [Phone], [Password], [Avatar], [Gender], [IsActive], [Createdtime], [Updatedtime], [Birthday]) VALUES (6, N'Nguyễn Chi Pu', N'chipu123@gmail.com', N'Tân Bình', N'0154879652', N'123', N'chipu.jpg', 1, 1, CAST(0xB2410B00 AS Date), CAST(0xB2410B00 AS Date), CAST(0xA5240B00 AS Date))
INSERT [dbo].[Users] ([Id], [Name], [Email], [Address], [Phone], [Password], [Avatar], [Gender], [IsActive], [Createdtime], [Updatedtime], [Birthday]) VALUES (7, N'Thiều Bảo Trâm', N'thieutram@gmail.com', N'Thủ Đức', N'0945687545', N'123', N'tram.jpg', 1, 1, CAST(0xB2410B00 AS Date), CAST(0xB2410B00 AS Date), CAST(0xA5240B00 AS Date))
INSERT [dbo].[Users] ([Id], [Name], [Email], [Address], [Phone], [Password], [Avatar], [Gender], [IsActive], [Createdtime], [Updatedtime], [Birthday]) VALUES (8, N'Nguyễn Quang Hải', N'quanghai@gmail.com', N'Quận 9', N'0353349526', N'123', N'hai.jpg', 1, 1, CAST(0xB2410B00 AS Date), CAST(0xB2410B00 AS Date), CAST(0xA5240B00 AS Date))
INSERT [dbo].[Users] ([Id], [Name], [Email], [Address], [Phone], [Password], [Avatar], [Gender], [IsActive], [Createdtime], [Updatedtime], [Birthday]) VALUES (9, N'Nguyễn Công Phượng', N'congphuong@gmail.com', N'Bình Tân', N'0745678912', N'123', N'phuong.jpg', 1, 1, CAST(0xB2410B00 AS Date), CAST(0xB2410B00 AS Date), CAST(0xA5240B00 AS Date))
INSERT [dbo].[Users] ([Id], [Name], [Email], [Address], [Phone], [Password], [Avatar], [Gender], [IsActive], [Createdtime], [Updatedtime], [Birthday]) VALUES (10, N'Nguyễn Phương Dung', N'phuongdung@gmail.com', N'Củ Chi', N'0987965123', N'123', N'dung.jpg', 1, 1, CAST(0xB2410B00 AS Date), CAST(0xB2410B00 AS Date), CAST(0xA5240B00 AS Date))
INSERT [dbo].[Users] ([Id], [Name], [Email], [Address], [Phone], [Password], [Avatar], [Gender], [IsActive], [Createdtime], [Updatedtime], [Birthday]) VALUES (26, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, CAST(0xDC410B00 AS Date), NULL, CAST(0xA5240B00 AS Date))
INSERT [dbo].[Users] ([Id], [Name], [Email], [Address], [Phone], [Password], [Avatar], [Gender], [IsActive], [Createdtime], [Updatedtime], [Birthday]) VALUES (27, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, CAST(0xDC410B00 AS Date), NULL, CAST(0xA5240B00 AS Date))
INSERT [dbo].[Users] ([Id], [Name], [Email], [Address], [Phone], [Password], [Avatar], [Gender], [IsActive], [Createdtime], [Updatedtime], [Birthday]) VALUES (28, N'diem doanh', N'nhophuonhxa@gmail.com', N'501/14/23 xô viết nghệ tĩnh', N'0829069648', N'123', NULL, 1, 1, CAST(0xDC410B00 AS Date), NULL, CAST(0xA5240B00 AS Date))
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
