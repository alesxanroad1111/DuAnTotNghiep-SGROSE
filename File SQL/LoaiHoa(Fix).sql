USE [SG_Rose]
GO
/****** Object:  Table [dbo].[TypesOfFlowers]    Script Date: 9/26/2020 10:54:47 AM ******/
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
INSERT [dbo].[TypesOfFlowers] ([Id], [Name], [Image]) VALUES (N'HC', N'Hoa cưới', NULL)
INSERT [dbo].[TypesOfFlowers] ([Id], [Name], [Image]) VALUES (N'HCB', N'Hoa chi buồn', NULL)
INSERT [dbo].[TypesOfFlowers] ([Id], [Name], [Image]) VALUES (N'HCM', N'Hoa chúc mừng', NULL)
INSERT [dbo].[TypesOfFlowers] ([Id], [Name], [Image]) VALUES (N'HKT', N'Hoa khai trương', NULL)
INSERT [dbo].[TypesOfFlowers] ([Id], [Name], [Image]) VALUES (N'HSN', N'Hoa sinh nhật', NULL)
