USE [EmployeeManager]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 6/8/2020 2:17:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Account](
	[Email] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[FullName] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](50) NOT NULL,
	[NumberPhone] [varchar](15) NOT NULL,
	[Access] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Contract]    Script Date: 6/8/2020 2:17:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Contract](
	[ID] [varchar](15) NOT NULL,
	[NameContract] [nvarchar](50) NOT NULL,
	[StartTime] [datetime] NOT NULL,
	[EndTime] [datetime] NULL,
	[Subsidize] [int] NULL,
	[Insurrance] [float] NULL,
	[Salary] [float] NULL,
	[Total] [int] NULL,
	[Status] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Department]    Script Date: 6/8/2020 2:17:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Department](
	[ID] [varchar](12) NOT NULL,
	[NameDepartment] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 6/8/2020 2:17:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Employee](
	[ID] [varchar](15) NOT NULL,
	[ID_Department] [varchar](12) NOT NULL,
	[ID_Position] [varchar](12) NOT NULL,
	[ID_EmployeeType] [varchar](12) NOT NULL,
	[NameEmployee] [nvarchar](50) NOT NULL,
	[Gender] [int] NOT NULL,
	[Photo] [nvarchar](max) NULL,
	[Address] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[NumberPhone] [nvarchar](50) NOT NULL,
	[Birthday] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EmployeeType]    Script Date: 6/8/2020 2:17:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EmployeeType](
	[ID] [varchar](12) NOT NULL,
	[NameEmployeeType] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Position]    Script Date: 6/8/2020 2:17:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Position](
	[ID] [varchar](12) NOT NULL,
	[NamePosition] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Record]    Script Date: 6/8/2020 2:17:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Record](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ID_Employee] [varchar](15) NOT NULL,
	[Type] [bit] NOT NULL,
	[Price] [int] NULL,
	[Reason] [nvarchar](50) NULL,
	[DateWrite] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Account] ([Email], [Password], [FullName], [Address], [NumberPhone], [Access]) VALUES (N'diem@gmail.com', N'123', N'Doanh Ngoc Diem', N'HCM', N'0209638001', 1)
INSERT [dbo].[Account] ([Email], [Password], [FullName], [Address], [NumberPhone], [Access]) VALUES (N'hieu@gmail.com', N'123', N'Tran Minh Hieu', N'HCM', N'0123456789', 1)
INSERT [dbo].[Account] ([Email], [Password], [FullName], [Address], [NumberPhone], [Access]) VALUES (N'hoa@gmail.com', N'123', N'Tran Vu Hoa', N'HCM', N'0123456879', 1)
INSERT [dbo].[Account] ([Email], [Password], [FullName], [Address], [NumberPhone], [Access]) VALUES (N'huy@gmail.com', N'123', N'Tran Van Huy', N'HCM', N'0123456789', 1)
INSERT [dbo].[Account] ([Email], [Password], [FullName], [Address], [NumberPhone], [Access]) VALUES (N'trong@gmail.com', N'123', N'Nguyen Tan Trong', N'HCM', N'0123456789', 1)
INSERT [dbo].[Account] ([Email], [Password], [FullName], [Address], [NumberPhone], [Access]) VALUES (N'tu@gmail.com', N'123', N'Vo Hoang Tu', N'HCM', N'0123456789', 1)
INSERT [dbo].[Contract] ([ID], [NameContract], [StartTime], [EndTime], [Subsidize], [Insurrance], [Salary], [Total], [Status]) VALUES (N'004', N'HD Khong Xac Dinh Thoi Han', CAST(0x0000ABD100000000 AS DateTime), NULL, 300000, 0.92, 8000000, NULL, 1)
INSERT [dbo].[Contract] ([ID], [NameContract], [StartTime], [EndTime], [Subsidize], [Insurrance], [Salary], [Total], [Status]) VALUES (N'005', N'HD Khong Xac Dinh Thoi Han', CAST(0x0000ABD100000000 AS DateTime), NULL, 900000, 0.92, 15000000, NULL, 1)
INSERT [dbo].[Department] ([ID], [NameDepartment]) VALUES (N'PB1', N'Phòng Hành Chính')
INSERT [dbo].[Department] ([ID], [NameDepartment]) VALUES (N'PB2', N'Phòng Kinh Doanh')
INSERT [dbo].[Department] ([ID], [NameDepartment]) VALUES (N'PB3', N'Phòng Kế Toán')
INSERT [dbo].[Department] ([ID], [NameDepartment]) VALUES (N'PB4', N'Phòng Nhân Sự')
INSERT [dbo].[Department] ([ID], [NameDepartment]) VALUES (N'PB5', N'Phòng IT')
INSERT [dbo].[Employee] ([ID], [ID_Department], [ID_Position], [ID_EmployeeType], [NameEmployee], [Gender], [Photo], [Address], [Email], [NumberPhone], [Birthday]) VALUES (N'001', N'PB2', N'CV4', N'LNV1', N'Nguyen Van A', 1, N'face-1.jpg', N'HCM', N'a@gmail.com', N'0123456789', CAST(0x0000000000000000 AS DateTime))
INSERT [dbo].[Employee] ([ID], [ID_Department], [ID_Position], [ID_EmployeeType], [NameEmployee], [Gender], [Photo], [Address], [Email], [NumberPhone], [Birthday]) VALUES (N'002', N'PB2', N'CV1', N'LNV1', N'Nguyen Van B', 2, N'face-1.jpg', N'HCM', N'b@gmail.com', N'0123789456', CAST(0x0000000000000000 AS DateTime))
INSERT [dbo].[Employee] ([ID], [ID_Department], [ID_Position], [ID_EmployeeType], [NameEmployee], [Gender], [Photo], [Address], [Email], [NumberPhone], [Birthday]) VALUES (N'004', N'PB1', N'CV4', N'LNV1', N'Doanh Ngoc Diem', 1, N'face-1.jpg', N'HCM', N'diem@gmail.com', N'0829069648', CAST(0x00008F6700000000 AS DateTime))
INSERT [dbo].[Employee] ([ID], [ID_Department], [ID_Position], [ID_EmployeeType], [NameEmployee], [Gender], [Photo], [Address], [Email], [NumberPhone], [Birthday]) VALUES (N'005', N'PB2', N'CV4', N'LNV1', N'Vo Hoang Tu', 1, N'face-1.jpg', N'HCM', N'tu@gmail.com', N'0123456789', CAST(0x00008F6700000000 AS DateTime))
INSERT [dbo].[Employee] ([ID], [ID_Department], [ID_Position], [ID_EmployeeType], [NameEmployee], [Gender], [Photo], [Address], [Email], [NumberPhone], [Birthday]) VALUES (N'006', N'PB3', N'CV4', N'LNV1', N'Tran Minh Hieu', 1, N'face-1.jpg', N'HCM', N'hieu@gmail.com', N'0829069648', CAST(0x00008F6700000000 AS DateTime))
INSERT [dbo].[Employee] ([ID], [ID_Department], [ID_Position], [ID_EmployeeType], [NameEmployee], [Gender], [Photo], [Address], [Email], [NumberPhone], [Birthday]) VALUES (N'007', N'PB4', N'CV4', N'LNV1', N'Nguyen Tan Trong', 1, N'face-1.jpg', N'501/14/23 xô viết nghệ tĩnh', N'trong@gmail.com', N'0829069648', CAST(0x00008F6700000000 AS DateTime))
INSERT [dbo].[Employee] ([ID], [ID_Department], [ID_Position], [ID_EmployeeType], [NameEmployee], [Gender], [Photo], [Address], [Email], [NumberPhone], [Birthday]) VALUES (N'008', N'PB5', N'CV4', N'LNV1', N'Tran Van Huy', 1, N'face-1.jpg', N'501/14/23 xô viết nghệ tĩnh', N'huy@gmail.com', N'0829069648', CAST(0x00008F6700000000 AS DateTime))
INSERT [dbo].[Employee] ([ID], [ID_Department], [ID_Position], [ID_EmployeeType], [NameEmployee], [Gender], [Photo], [Address], [Email], [NumberPhone], [Birthday]) VALUES (N'009', N'PB5', N'CV4', N'LNV1', N'Tran Vu Hoa', 1, N'face-1.jpg', N'501/14/23 xô viết nghệ tĩnh', N'hoa@gmail.com', N'0829069648', CAST(0x00008F6700000000 AS DateTime))
INSERT [dbo].[EmployeeType] ([ID], [NameEmployeeType]) VALUES (N'LNV1', N'FullTime')
INSERT [dbo].[EmployeeType] ([ID], [NameEmployeeType]) VALUES (N'LNV2', N'PartTime')
INSERT [dbo].[EmployeeType] ([ID], [NameEmployeeType]) VALUES (N'LNV3', N'PartTime')
INSERT [dbo].[Position] ([ID], [NamePosition]) VALUES (N'CV1', N'Giám Đốc')
INSERT [dbo].[Position] ([ID], [NamePosition]) VALUES (N'CV2', N'Trưởng Phòng')
INSERT [dbo].[Position] ([ID], [NamePosition]) VALUES (N'CV3', N'Leader')
INSERT [dbo].[Position] ([ID], [NamePosition]) VALUES (N'CV4', N'Nhân Viên')
SET IDENTITY_INSERT [dbo].[Record] ON 

INSERT [dbo].[Record] ([ID], [ID_Employee], [Type], [Price], [Reason], [DateWrite]) VALUES (1, N'004', 1, 500000, N'Đi sớm', CAST(0x0000ABD100000000 AS DateTime))
INSERT [dbo].[Record] ([ID], [ID_Employee], [Type], [Price], [Reason], [DateWrite]) VALUES (2, N'005', 1, 500000, N'Sieng nang, cham chi', CAST(0x0000ABD100000000 AS DateTime))
INSERT [dbo].[Record] ([ID], [ID_Employee], [Type], [Price], [Reason], [DateWrite]) VALUES (3, N'006', 1, 500000, N'Siêng năng chăm chỉ', CAST(0x0000ABD100000000 AS DateTime))
INSERT [dbo].[Record] ([ID], [ID_Employee], [Type], [Price], [Reason], [DateWrite]) VALUES (4, N'007', 0, 500000, N'Nghỉ Nhiều', CAST(0x0000ABD100000000 AS DateTime))
INSERT [dbo].[Record] ([ID], [ID_Employee], [Type], [Price], [Reason], [DateWrite]) VALUES (5, N'008', 0, 500000, N'Nghỉ nhiều', CAST(0x0000ABD100000000 AS DateTime))
INSERT [dbo].[Record] ([ID], [ID_Employee], [Type], [Price], [Reason], [DateWrite]) VALUES (6, N'009', 1, 500000, N'Siêng năng, chăm chỉ', CAST(0x0000ABD100000000 AS DateTime))
INSERT [dbo].[Record] ([ID], [ID_Employee], [Type], [Price], [Reason], [DateWrite]) VALUES (8, N'005', 0, 1, N'Nghỉ nhiều', CAST(0x0000ABD100000000 AS DateTime))
INSERT [dbo].[Record] ([ID], [ID_Employee], [Type], [Price], [Reason], [DateWrite]) VALUES (9, N'004', 0, 500000, N'Nghỉ nhiều quá', CAST(0x0000ABD100000000 AS DateTime))
SET IDENTITY_INSERT [dbo].[Record] OFF
ALTER TABLE [dbo].[Contract]  WITH CHECK ADD  CONSTRAINT [FK_Employee] FOREIGN KEY([ID])
REFERENCES [dbo].[Employee] ([ID])
GO
ALTER TABLE [dbo].[Contract] CHECK CONSTRAINT [FK_Employee]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD FOREIGN KEY([ID_Department])
REFERENCES [dbo].[Department] ([ID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD FOREIGN KEY([ID_EmployeeType])
REFERENCES [dbo].[EmployeeType] ([ID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD FOREIGN KEY([ID_Position])
REFERENCES [dbo].[Position] ([ID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Record]  WITH CHECK ADD  CONSTRAINT [FK_Record_Employee] FOREIGN KEY([ID_Employee])
REFERENCES [dbo].[Employee] ([ID])
GO
ALTER TABLE [dbo].[Record] CHECK CONSTRAINT [FK_Record_Employee]
GO
