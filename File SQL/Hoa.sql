USE [SG_Rose]
GO
/****** Object:  Table [dbo].[Flowers]    Script Date: 9/26/2020 11:31:49 AM ******/
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
ALTER TABLE [dbo].[Flowers] ADD  DEFAULT (getdate()) FOR [Created_time]
GO
ALTER TABLE [dbo].[Flowers] ADD  DEFAULT (getdate()) FOR [Update_time]
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
ALTER TABLE [dbo].[Flowers]  WITH CHECK ADD FOREIGN KEY([TypeId])
REFERENCES [dbo].[TypesOfFlowers] ([Id])
GO
