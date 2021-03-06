CREATE DATABASE [QuanLyShopHoaTuoi]
USE [QuanLyShopHoaTuoi]
GO
/****** Object:  Table [dbo].[ChiTietHoaDon]    Script Date: 12/17/2019 9:18:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ChiTietHoaDon](
	[MaHoaDon] [varchar](20) NULL,
	[MaHoaTuoi] [varchar](20) NULL,
	[SoLuong] [int] NULL,
	[DonGia] [int] NULL,
	[TongTien] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GioHang]    Script Date: 12/17/2019 9:18:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GioHang](
	[MaHoaTuoi] [varchar](20) NOT NULL,
	[TenHoa] [nvarchar](50) NULL,
	[SoLuong] [int] NULL,
	[TongTien] [int] NULL,
	[DonGia] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaHoaTuoi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[HoaDon]    Script Date: 12/17/2019 9:18:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HoaDon](
	[MaHoaDon] [varchar](20) NOT NULL,
	[MaNV] [int] NOT NULL,
	[NgayBan] [date] NULL,
	[MaKhachHang] [varchar](20) NOT NULL,
	[TongTien] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaHoaDon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[HoaTuoi]    Script Date: 12/17/2019 9:18:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HoaTuoi](
	[MaHoaTuoi] [varchar](20) NOT NULL,
	[TenHoa] [nvarchar](50) NOT NULL,
	[MaLoaiHoa] [varchar](20) NOT NULL,
	[SoLuong] [int] NULL,
	[DonGia] [int] NULL,
	[Hinh] [nvarchar](100) NULL,
	[GhiChu] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaHoaTuoi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 12/17/2019 9:18:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[KhachHang](
	[MaKhachHang] [varchar](20) NOT NULL,
	[TenKH] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](200) NULL,
	[DienThoai] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaKhachHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LoaiHoa]    Script Date: 12/17/2019 9:18:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LoaiHoa](
	[MaLoaiHoa] [varchar](20) NOT NULL,
	[TenLoaiHoa] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaLoaiHoa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NHANVIEN]    Script Date: 12/17/2019 9:18:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NHANVIEN](
	[MaNV] [int] IDENTITY(1,1) NOT NULL,
	[TenNhanVien] [nvarchar](50) NOT NULL,
	[NgaySinh] [date] NULL,
	[GioiTinh] [bit] NULL,
	[DiaChi] [nvarchar](50) NULL,
	[DienThoai] [varchar](10) NULL,
	[Hinh] [varchar](100) NULL,
	[Luong] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserLogins]    Script Date: 12/17/2019 9:18:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserLogins](
	[username] [varchar](100) NOT NULL,
	[password] [varchar](100) NOT NULL,
	[vaitro] [bit] NULL,
	[MaNV] [int] NULL,
	[MaBaoVe] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon], [MaHoaTuoi], [SoLuong], [DonGia], [TongTien]) VALUES (N'HD41582031', N'HB001', 1, 1000000, 1000000)
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon], [MaHoaTuoi], [SoLuong], [DonGia], [TongTien]) VALUES (N'HD41582031', N'HB002', 1, 1500000, 1500000)
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon], [MaHoaTuoi], [SoLuong], [DonGia], [TongTien]) VALUES (N'HD41582031', N'HB003', 1, 1050000, 1050000)
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon], [MaHoaTuoi], [SoLuong], [DonGia], [TongTien]) VALUES (N'HD87337584', N'HB001', 1, 1000000, 1000000)
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon], [MaHoaTuoi], [SoLuong], [DonGia], [TongTien]) VALUES (N'HD87337584', N'HB002', 1, 1500000, 1500000)
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon], [MaHoaTuoi], [SoLuong], [DonGia], [TongTien]) VALUES (N'HD87337584', N'HB003', 1, 1050000, 1050000)
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon], [MaHoaTuoi], [SoLuong], [DonGia], [TongTien]) VALUES (N'HD87337584', N'HB004', 1, 1350000, 1350000)
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon], [MaHoaTuoi], [SoLuong], [DonGia], [TongTien]) VALUES (N'HD87337584', N'HB005', 1, 1200000, 1200000)
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon], [MaHoaTuoi], [SoLuong], [DonGia], [TongTien]) VALUES (N'HD87337584', N'HB006', 1, 1250000, 1250000)
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon], [MaHoaTuoi], [SoLuong], [DonGia], [TongTien]) VALUES (N'HD87337584', N'HB007', 1, 1050000, 1050000)
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon], [MaHoaTuoi], [SoLuong], [DonGia], [TongTien]) VALUES (N'HD87337584', N'HB008', 1, 1100000, 1100000)
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon], [MaHoaTuoi], [SoLuong], [DonGia], [TongTien]) VALUES (N'HD24484465', N'HB004', 1, 1350000, 1350000)
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon], [MaHoaTuoi], [SoLuong], [DonGia], [TongTien]) VALUES (N'HD24484465', N'HB005', 28, 1200000, 33600000)
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon], [MaHoaTuoi], [SoLuong], [DonGia], [TongTien]) VALUES (N'HD87337584', N'HB009', 1, 1150000, 1150000)
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon], [MaHoaTuoi], [SoLuong], [DonGia], [TongTien]) VALUES (N'HD87337584', N'HB010', 1, 1500000, 1500000)
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon], [MaHoaTuoi], [SoLuong], [DonGia], [TongTien]) VALUES (N'HD87337584', N'HB011', 1, 1450000, 1450000)
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon], [MaHoaTuoi], [SoLuong], [DonGia], [TongTien]) VALUES (N'HD87337584', N'HB012', 1, 1500000, 1500000)
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon], [MaHoaTuoi], [SoLuong], [DonGia], [TongTien]) VALUES (N'HD87337584', N'HB013', 1, 1300000, 1300000)
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon], [MaHoaTuoi], [SoLuong], [DonGia], [TongTien]) VALUES (N'HD87337584', N'HB014', 1, 900000, 900000)
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon], [MaHoaTuoi], [SoLuong], [DonGia], [TongTien]) VALUES (N'HD87337584', N'HB015', 1, 850000, 850000)
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon], [MaHoaTuoi], [SoLuong], [DonGia], [TongTien]) VALUES (N'HD87337584', N'HC001', 8, 1220000, 9760000)
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon], [MaHoaTuoi], [SoLuong], [DonGia], [TongTien]) VALUES (N'HD87337584', N'HC002', 1, 1200000, 1200000)
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon], [MaHoaTuoi], [SoLuong], [DonGia], [TongTien]) VALUES (N'HD87337584', N'HC003', 1, 1300000, 1300000)
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon], [MaHoaTuoi], [SoLuong], [DonGia], [TongTien]) VALUES (N'HD87337584', N'HD001', 12, 1100000, 13200000)
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon], [MaHoaTuoi], [SoLuong], [DonGia], [TongTien]) VALUES (N'HD87337584', N'HSN001', 5, 1500000, 7500000)
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon], [MaHoaTuoi], [SoLuong], [DonGia], [TongTien]) VALUES (N'HD87337584', N'HT001', 7, 650000, 4550000)
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon], [MaHoaTuoi], [SoLuong], [DonGia], [TongTien]) VALUES (N'HD77808753', N'HKT018', 17, 2400000, 40800000)
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaNV], [NgayBan], [MaKhachHang], [TongTien]) VALUES (N'HD24484465', 9, CAST(0x77400B00 AS Date), N'KH16005188', 34950000)
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaNV], [NgayBan], [MaKhachHang], [TongTien]) VALUES (N'HD35078661', 1, CAST(0x80400B00 AS Date), N'KH03646831', 0)
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaNV], [NgayBan], [MaKhachHang], [TongTien]) VALUES (N'HD41582031', 1, CAST(0x81400B00 AS Date), N'KH36135817', 3550000)
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaNV], [NgayBan], [MaKhachHang], [TongTien]) VALUES (N'HD77808753', 1, CAST(0x80400B00 AS Date), N'KH11174688', 40800000)
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaNV], [NgayBan], [MaKhachHang], [TongTien]) VALUES (N'HD87337584', 3, CAST(0x80400B00 AS Date), N'KH46346614', 55660000)
INSERT [dbo].[HoaTuoi] ([MaHoaTuoi], [TenHoa], [MaLoaiHoa], [SoLuong], [DonGia], [Hinh], [GhiChu]) VALUES (N'HB001', N'Hoa Bó 1', N'HB01', 100, 1500000, N'hoabo1.jpg', N'Hoa Shop Tui')
INSERT [dbo].[HoaTuoi] ([MaHoaTuoi], [TenHoa], [MaLoaiHoa], [SoLuong], [DonGia], [Hinh], [GhiChu]) VALUES (N'HB002', N'Hoa Bó 2', N'HB01', 100, 1600000, N'hoabo2.jpg', N'Hoa Shop Tui')
INSERT [dbo].[HoaTuoi] ([MaHoaTuoi], [TenHoa], [MaLoaiHoa], [SoLuong], [DonGia], [Hinh], [GhiChu]) VALUES (N'HB003', N'Hoa bó 3', N'HB01', 500, 1000000, N'hoabo3.jpg', N'shop hoa tươi')
INSERT [dbo].[HoaTuoi] ([MaHoaTuoi], [TenHoa], [MaLoaiHoa], [SoLuong], [DonGia], [Hinh], [GhiChu]) VALUES (N'HB004', N'Hoa bó 4', N'HB01', 50, 1000000, N'hoabo4.jpg', N'shop hoa tươi')
INSERT [dbo].[HoaTuoi] ([MaHoaTuoi], [TenHoa], [MaLoaiHoa], [SoLuong], [DonGia], [Hinh], [GhiChu]) VALUES (N'HB005', N'Hoa bó 5', N'HB01', 50, 1000000, N'hoabo5.jpg', N'shop hoa tươi')
INSERT [dbo].[HoaTuoi] ([MaHoaTuoi], [TenHoa], [MaLoaiHoa], [SoLuong], [DonGia], [Hinh], [GhiChu]) VALUES (N'HB006', N'Hoa bó 6', N'HB01', 50, 1000000, N'hoabo6.jpg', N'shop hoa tươi')
INSERT [dbo].[HoaTuoi] ([MaHoaTuoi], [TenHoa], [MaLoaiHoa], [SoLuong], [DonGia], [Hinh], [GhiChu]) VALUES (N'HB007', N'Hoa bó 7', N'HB01', 50, 1000000, N'hoabo7.jpg', N'shop hoa tươi')
INSERT [dbo].[HoaTuoi] ([MaHoaTuoi], [TenHoa], [MaLoaiHoa], [SoLuong], [DonGia], [Hinh], [GhiChu]) VALUES (N'HB008', N'Hoa bó 8', N'HB01', 50, 1000000, N'hoabo8.jpg', N'shop hoa tươi')
INSERT [dbo].[HoaTuoi] ([MaHoaTuoi], [TenHoa], [MaLoaiHoa], [SoLuong], [DonGia], [Hinh], [GhiChu]) VALUES (N'HB009', N'Hoa bó 9', N'HB01', 50, 1000000, N'hoabo9.jpg', N'shop hoa tươi')
INSERT [dbo].[HoaTuoi] ([MaHoaTuoi], [TenHoa], [MaLoaiHoa], [SoLuong], [DonGia], [Hinh], [GhiChu]) VALUES (N'HB010', N'Hoa bó 10', N'HB01', 50, 1000000, N'hoabo10.jpg', N'shop hoa tươi')
INSERT [dbo].[HoaTuoi] ([MaHoaTuoi], [TenHoa], [MaLoaiHoa], [SoLuong], [DonGia], [Hinh], [GhiChu]) VALUES (N'HB011', N'Hoa bó 11', N'HB01', 50, 1000000, N'hoabo11.jpg', N'shop hoa tươi')
INSERT [dbo].[HoaTuoi] ([MaHoaTuoi], [TenHoa], [MaLoaiHoa], [SoLuong], [DonGia], [Hinh], [GhiChu]) VALUES (N'HB012', N'Hoa bó 12', N'HB01', 50, 1000000, N'hoabo12.jpg', N'shop hoa tươi')
INSERT [dbo].[HoaTuoi] ([MaHoaTuoi], [TenHoa], [MaLoaiHoa], [SoLuong], [DonGia], [Hinh], [GhiChu]) VALUES (N'HB013', N'Hoa bó 13', N'HB01', 50, 1000000, N'hoabo13.jpg', N'shop hoa tươi')
INSERT [dbo].[HoaTuoi] ([MaHoaTuoi], [TenHoa], [MaLoaiHoa], [SoLuong], [DonGia], [Hinh], [GhiChu]) VALUES (N'HB014', N'Hoa bó 14', N'HB01', 50, 1000000, N'hoabo14.jpg', N'shop hoa tươi')
INSERT [dbo].[HoaTuoi] ([MaHoaTuoi], [TenHoa], [MaLoaiHoa], [SoLuong], [DonGia], [Hinh], [GhiChu]) VALUES (N'HB015', N'Hoa bó 15', N'HB01', 50, 1000000, N'hoabo15.jpg', N'shop hoa tươi')
INSERT [dbo].[HoaTuoi] ([MaHoaTuoi], [TenHoa], [MaLoaiHoa], [SoLuong], [DonGia], [Hinh], [GhiChu]) VALUES (N'HC001', N'Hoa Cưới 1', N'HC01', 105, 5000000, N'hoacuoi1.jpg', N'Hoa Đám Cưới')
INSERT [dbo].[HoaTuoi] ([MaHoaTuoi], [TenHoa], [MaLoaiHoa], [SoLuong], [DonGia], [Hinh], [GhiChu]) VALUES (N'HC002', N'Hoa Cưới 2', N'HC01', 90, 4000000, N'hoacuoi2.jpg', N'Hoa Đám Cưới')
INSERT [dbo].[HoaTuoi] ([MaHoaTuoi], [TenHoa], [MaLoaiHoa], [SoLuong], [DonGia], [Hinh], [GhiChu]) VALUES (N'HC003', N'Hoa cưới', N'HC01', 50, 1200000, N'hoacuoi3.jpg', N'shop hoa tươi')
INSERT [dbo].[HoaTuoi] ([MaHoaTuoi], [TenHoa], [MaLoaiHoa], [SoLuong], [DonGia], [Hinh], [GhiChu]) VALUES (N'HC004', N'Hoa cưới', N'HC01', 50, 1200000, N'hoacuoi4.jfif', N'shop hoa tươi')
INSERT [dbo].[HoaTuoi] ([MaHoaTuoi], [TenHoa], [MaLoaiHoa], [SoLuong], [DonGia], [Hinh], [GhiChu]) VALUES (N'HC005', N'Hoa cưới', N'HC01', 50, 1200000, N'hoacuoi5.jpeg', N'shop hoa tươi')
INSERT [dbo].[HoaTuoi] ([MaHoaTuoi], [TenHoa], [MaLoaiHoa], [SoLuong], [DonGia], [Hinh], [GhiChu]) VALUES (N'HC006', N'Hoa cưới', N'HC01', 50, 1200000, N'hoacuoi6.jpg', N'shop hoa tươi')
INSERT [dbo].[HoaTuoi] ([MaHoaTuoi], [TenHoa], [MaLoaiHoa], [SoLuong], [DonGia], [Hinh], [GhiChu]) VALUES (N'HC007', N'Hoa cưới', N'HC01', 50, 1200000, N'hoacuoi7.jpg', N'shop hoa tươi')
INSERT [dbo].[HoaTuoi] ([MaHoaTuoi], [TenHoa], [MaLoaiHoa], [SoLuong], [DonGia], [Hinh], [GhiChu]) VALUES (N'HC008', N'Hoa cưới', N'HC01', 55, 1200000, N'hoacuoi8.jpg', N'shop hoa tươi')
INSERT [dbo].[HoaTuoi] ([MaHoaTuoi], [TenHoa], [MaLoaiHoa], [SoLuong], [DonGia], [Hinh], [GhiChu]) VALUES (N'HC009', N'Hoa cưới', N'HC01', 55, 1200000, N'hoacuoi9.jfif', N'shop hoa tươi')
INSERT [dbo].[HoaTuoi] ([MaHoaTuoi], [TenHoa], [MaLoaiHoa], [SoLuong], [DonGia], [Hinh], [GhiChu]) VALUES (N'HC010', N'Hoa cưới', N'HC01', 55, 1200000, N'hoacuoi10.jpg', N'shop hoa tươi')
INSERT [dbo].[HoaTuoi] ([MaHoaTuoi], [TenHoa], [MaLoaiHoa], [SoLuong], [DonGia], [Hinh], [GhiChu]) VALUES (N'HC011', N'Hoa cưới', N'HC01', 55, 1200000, N'hoacuoi11.jpg', N'shop hoa tươi')
INSERT [dbo].[HoaTuoi] ([MaHoaTuoi], [TenHoa], [MaLoaiHoa], [SoLuong], [DonGia], [Hinh], [GhiChu]) VALUES (N'HC012', N'Hoa cưới', N'HC01', 55, 1200000, N'hoacuoi12.jpg', N'shop hoa tươi')
INSERT [dbo].[HoaTuoi] ([MaHoaTuoi], [TenHoa], [MaLoaiHoa], [SoLuong], [DonGia], [Hinh], [GhiChu]) VALUES (N'HC013', N'Hoa cưới', N'HC01', 55, 1200000, N'hoacuoi13.jpeg', N'shop hoa tươi')
INSERT [dbo].[HoaTuoi] ([MaHoaTuoi], [TenHoa], [MaLoaiHoa], [SoLuong], [DonGia], [Hinh], [GhiChu]) VALUES (N'HC014', N'Hoa cưới', N'HC01', 55, 1200000, N'hoacuoi14.jpg', N'shop hoa tươi')
INSERT [dbo].[HoaTuoi] ([MaHoaTuoi], [TenHoa], [MaLoaiHoa], [SoLuong], [DonGia], [Hinh], [GhiChu]) VALUES (N'HC015', N'Hoa cưới', N'HC01', 55, 1200000, N'hoacuoi15.jpg', N'shop hoa tươi')
INSERT [dbo].[HoaTuoi] ([MaHoaTuoi], [TenHoa], [MaLoaiHoa], [SoLuong], [DonGia], [Hinh], [GhiChu]) VALUES (N'HD001', N'Hoa Đẹp 1', N'HD01', 95, 4500000, N'hoadep1.jpg', N'Hoa Đẹp Tăng Người Yêu Thương')
INSERT [dbo].[HoaTuoi] ([MaHoaTuoi], [TenHoa], [MaLoaiHoa], [SoLuong], [DonGia], [Hinh], [GhiChu]) VALUES (N'HD002', N'Hoa Đẹp 2', N'HD01', 98, 4600000, N'hoadep2.jpg', N'Hoa Đẹp Tăng Người Yêu Thương')
INSERT [dbo].[HoaTuoi] ([MaHoaTuoi], [TenHoa], [MaLoaiHoa], [SoLuong], [DonGia], [Hinh], [GhiChu]) VALUES (N'HD003', N'Hoa đẹp', N'HD01', 55, 1500000, N'hoadep3.jpg', N'shop hoa tươi')
INSERT [dbo].[HoaTuoi] ([MaHoaTuoi], [TenHoa], [MaLoaiHoa], [SoLuong], [DonGia], [Hinh], [GhiChu]) VALUES (N'HD004', N'Hoa đẹp', N'HD01', 55, 1350000, N'hoadep4.jpg', N'shop hoa tươi')
INSERT [dbo].[HoaTuoi] ([MaHoaTuoi], [TenHoa], [MaLoaiHoa], [SoLuong], [DonGia], [Hinh], [GhiChu]) VALUES (N'HD005', N'Hoa đẹp', N'HD01', 55, 1400000, N'hoadep5.jpg', N'shop hoa tươi')
INSERT [dbo].[HoaTuoi] ([MaHoaTuoi], [TenHoa], [MaLoaiHoa], [SoLuong], [DonGia], [Hinh], [GhiChu]) VALUES (N'HD006', N'Hoa đẹp', N'HD01', 55, 1500000, N'hoadep6.jpg', N'shop hoa tươi')
INSERT [dbo].[HoaTuoi] ([MaHoaTuoi], [TenHoa], [MaLoaiHoa], [SoLuong], [DonGia], [Hinh], [GhiChu]) VALUES (N'HD007', N'Hoa đẹp', N'HD01', 55, 1550000, N'hoadep7.jpg', N'shop hoa tươi')
INSERT [dbo].[HoaTuoi] ([MaHoaTuoi], [TenHoa], [MaLoaiHoa], [SoLuong], [DonGia], [Hinh], [GhiChu]) VALUES (N'HD008', N'Hoa đẹp', N'HD01', 55, 1550000, N'hoadep8.jpg', N'shop hoa tươi')
INSERT [dbo].[HoaTuoi] ([MaHoaTuoi], [TenHoa], [MaLoaiHoa], [SoLuong], [DonGia], [Hinh], [GhiChu]) VALUES (N'HD009', N'Hoa đẹp', N'HD01', 55, 1600000, N'hoadep9.jpg', N'shop hoa tươi')
INSERT [dbo].[HoaTuoi] ([MaHoaTuoi], [TenHoa], [MaLoaiHoa], [SoLuong], [DonGia], [Hinh], [GhiChu]) VALUES (N'HD010', N'Hoa đẹp', N'HD01', 55, 1600000, N'hoadep10.jpg', N'shop hoa tươi')
INSERT [dbo].[HoaTuoi] ([MaHoaTuoi], [TenHoa], [MaLoaiHoa], [SoLuong], [DonGia], [Hinh], [GhiChu]) VALUES (N'HD011', N'Hoa đẹp', N'HD01', 59, 1450000, N'hoadep11.jpg', N'shop hoa tươi')
INSERT [dbo].[HoaTuoi] ([MaHoaTuoi], [TenHoa], [MaLoaiHoa], [SoLuong], [DonGia], [Hinh], [GhiChu]) VALUES (N'HD012', N'Hoa đẹp', N'HD01', 55, 1450000, N'hoadep12.jpg', N'shop hoa tươi')
INSERT [dbo].[HoaTuoi] ([MaHoaTuoi], [TenHoa], [MaLoaiHoa], [SoLuong], [DonGia], [Hinh], [GhiChu]) VALUES (N'HD013', N'Hoa đẹp', N'HD01', 55, 1450000, N'hoadep13.jpg', N'shop hoa tươi')
INSERT [dbo].[HoaTuoi] ([MaHoaTuoi], [TenHoa], [MaLoaiHoa], [SoLuong], [DonGia], [Hinh], [GhiChu]) VALUES (N'HD014', N'Hoa đẹp', N'HD01', 55, 1450000, N'hoadep14.jpg', N'shop hoa tươi')
INSERT [dbo].[HoaTuoi] ([MaHoaTuoi], [TenHoa], [MaLoaiHoa], [SoLuong], [DonGia], [Hinh], [GhiChu]) VALUES (N'HD015', N'Hoa đẹp', N'HD01', 55, 1450000, N'hoadep15.jpg', N'shop hoa tươi')
INSERT [dbo].[HoaTuoi] ([MaHoaTuoi], [TenHoa], [MaLoaiHoa], [SoLuong], [DonGia], [Hinh], [GhiChu]) VALUES (N'HKT001', N'Hoa Khai Trương 1', N'HKT01', 30, 5600000, N'hoakhaitruong1.jpg', N'Hoa Mừng Khai Trương')
INSERT [dbo].[HoaTuoi] ([MaHoaTuoi], [TenHoa], [MaLoaiHoa], [SoLuong], [DonGia], [Hinh], [GhiChu]) VALUES (N'HKT002', N'Hoa Khai Trương 2', N'HKT01', 35, 6600000, N'hoakhaitruong2.jpg', N'Hoa Mừng Khai Trương')
INSERT [dbo].[HoaTuoi] ([MaHoaTuoi], [TenHoa], [MaLoaiHoa], [SoLuong], [DonGia], [Hinh], [GhiChu]) VALUES (N'HKT003', N'Hoa khai trương', N'HKT01', 55, 2400000, N'hoakhaitruong3.jpg', N'shop hoa tươi')
INSERT [dbo].[HoaTuoi] ([MaHoaTuoi], [TenHoa], [MaLoaiHoa], [SoLuong], [DonGia], [Hinh], [GhiChu]) VALUES (N'HKT004', N'Hoa khai trương', N'HKT01', 55, 2550000, N'hoakhaitruong4.jpg', N'shop hoa tươi')
INSERT [dbo].[HoaTuoi] ([MaHoaTuoi], [TenHoa], [MaLoaiHoa], [SoLuong], [DonGia], [Hinh], [GhiChu]) VALUES (N'HKT005', N'Hoa khai trương', N'HKT01', 55, 2550000, N'hoakhaitruong5.jpg', N'shop hoa tươi')
INSERT [dbo].[HoaTuoi] ([MaHoaTuoi], [TenHoa], [MaLoaiHoa], [SoLuong], [DonGia], [Hinh], [GhiChu]) VALUES (N'HKT006', N'Hoa khai trương', N'HKT01', 55, 2700000, N'hoakhaitruong6.jpg', N'shop hoa tươi')
INSERT [dbo].[HoaTuoi] ([MaHoaTuoi], [TenHoa], [MaLoaiHoa], [SoLuong], [DonGia], [Hinh], [GhiChu]) VALUES (N'HKT007', N'Hoa khai trương', N'HKT01', 51, 2600000, N'hoakhaitruong7.jpg', N'shop hoa tươi')
INSERT [dbo].[HoaTuoi] ([MaHoaTuoi], [TenHoa], [MaLoaiHoa], [SoLuong], [DonGia], [Hinh], [GhiChu]) VALUES (N'HKT008', N'Hoa khai trương', N'HKT01', 55, 2600000, N'hoakhaitruong8.jpg', N'shop hoa tươi')
INSERT [dbo].[HoaTuoi] ([MaHoaTuoi], [TenHoa], [MaLoaiHoa], [SoLuong], [DonGia], [Hinh], [GhiChu]) VALUES (N'HKT009', N'Hoa khai trương', N'HKT01', 52, 2650000, N'hoakhaitruong9.jpg', N'shop hoa tươi')
INSERT [dbo].[HoaTuoi] ([MaHoaTuoi], [TenHoa], [MaLoaiHoa], [SoLuong], [DonGia], [Hinh], [GhiChu]) VALUES (N'HKT010', N'Hoa khai trương', N'HKT01', 53, 2750000, N'hoakhaitruong10.jpg', N'shop hoa tươi')
INSERT [dbo].[HoaTuoi] ([MaHoaTuoi], [TenHoa], [MaLoaiHoa], [SoLuong], [DonGia], [Hinh], [GhiChu]) VALUES (N'HKT011', N'Hoa khai trương', N'HKT01', 54, 2750000, N'hoakhaitruong11.jpg', N'shop hoa tươi')
INSERT [dbo].[HoaTuoi] ([MaHoaTuoi], [TenHoa], [MaLoaiHoa], [SoLuong], [DonGia], [Hinh], [GhiChu]) VALUES (N'HKT012', N'Hoa khai trương', N'HKT01', 55, 2700000, N'hoakhaitruong12.jpg', N'shop hoa tươi')
INSERT [dbo].[HoaTuoi] ([MaHoaTuoi], [TenHoa], [MaLoaiHoa], [SoLuong], [DonGia], [Hinh], [GhiChu]) VALUES (N'HKT013', N'Hoa khai trương', N'HKT01', 56, 2600000, N'hoakhaitruong13.jpg', N'shop hoa tươi')
INSERT [dbo].[HoaTuoi] ([MaHoaTuoi], [TenHoa], [MaLoaiHoa], [SoLuong], [DonGia], [Hinh], [GhiChu]) VALUES (N'HKT014', N'Hoa khai trương', N'HKT01', 57, 2650000, N'hoakhaitruong14.jpg', N'shop hoa tươi')
INSERT [dbo].[HoaTuoi] ([MaHoaTuoi], [TenHoa], [MaLoaiHoa], [SoLuong], [DonGia], [Hinh], [GhiChu]) VALUES (N'HKT015', N'Hoa khai trương', N'HKT01', 51, 2800000, N'hoakhaitruong15.jpg', N'shop hoa tươi')
INSERT [dbo].[HoaTuoi] ([MaHoaTuoi], [TenHoa], [MaLoaiHoa], [SoLuong], [DonGia], [Hinh], [GhiChu]) VALUES (N'HKT016', N'Hoa khai trương 16', N'HKT01', 200, 2650000, N'hoakhaitruong16.jpg', N'shop hoa tươi')
INSERT [dbo].[HoaTuoi] ([MaHoaTuoi], [TenHoa], [MaLoaiHoa], [SoLuong], [DonGia], [Hinh], [GhiChu]) VALUES (N'HKT017', N'Hoa khai trương 17', N'HKT01', 200, 2600000, N'hoakhaitruong17.jpg', N'shop hoa tươi')
INSERT [dbo].[HoaTuoi] ([MaHoaTuoi], [TenHoa], [MaLoaiHoa], [SoLuong], [DonGia], [Hinh], [GhiChu]) VALUES (N'HKT018', N'Hoa khai trương 18', N'HKT01', 100, 2750000, N'hoakhaitruong18.jpg', N'shop hoa tươi')
INSERT [dbo].[HoaTuoi] ([MaHoaTuoi], [TenHoa], [MaLoaiHoa], [SoLuong], [DonGia], [Hinh], [GhiChu]) VALUES (N'HSN001', N'Hoa Sinh Nhật 1', N'HSN01', 15, 1600000, N'hoasinhnhat1.jpg', N'Hoa Mừng Sinh Nhật')
INSERT [dbo].[HoaTuoi] ([MaHoaTuoi], [TenHoa], [MaLoaiHoa], [SoLuong], [DonGia], [Hinh], [GhiChu]) VALUES (N'HSN002', N'Hoa Sinh Nhật 2', N'HSN01', 20, 1500000, N'hoasinhnhat2.jpg', N'Hoa Mừng Sinh Nhật')
INSERT [dbo].[HoaTuoi] ([MaHoaTuoi], [TenHoa], [MaLoaiHoa], [SoLuong], [DonGia], [Hinh], [GhiChu]) VALUES (N'HSN003', N'Hoa sinh nhật', N'HSN01', 5, 1800000, N'hoasinhnhat3.jpg', N'shop hoa tươi')
INSERT [dbo].[HoaTuoi] ([MaHoaTuoi], [TenHoa], [MaLoaiHoa], [SoLuong], [DonGia], [Hinh], [GhiChu]) VALUES (N'HSN004', N'Hoa sinh nhật', N'HSN01', 5, 1500000, N'hoasinhnhat4.jpg', N'shop hoa tươi')
INSERT [dbo].[HoaTuoi] ([MaHoaTuoi], [TenHoa], [MaLoaiHoa], [SoLuong], [DonGia], [Hinh], [GhiChu]) VALUES (N'HSN005', N'Hoa sinh nhật', N'HSN01', 5, 1500000, N'hoasinhnhat5.jpg', N'shop hoa tươi')
INSERT [dbo].[HoaTuoi] ([MaHoaTuoi], [TenHoa], [MaLoaiHoa], [SoLuong], [DonGia], [Hinh], [GhiChu]) VALUES (N'HSN006', N'Hoa sinh nhật', N'HSN01', 5, 1450000, N'hoasinhnhat6.jpg', N'shop hoa tươi')
INSERT [dbo].[HoaTuoi] ([MaHoaTuoi], [TenHoa], [MaLoaiHoa], [SoLuong], [DonGia], [Hinh], [GhiChu]) VALUES (N'HSN007', N'Hoa sinh nhật', N'HSN01', 5, 1700000, N'hoasinhnhat7.jpg', N'shop hoa tươi')
INSERT [dbo].[HoaTuoi] ([MaHoaTuoi], [TenHoa], [MaLoaiHoa], [SoLuong], [DonGia], [Hinh], [GhiChu]) VALUES (N'HSN008', N'Hoa sinh nhật', N'HSN01', 5, 1600000, N'hoasinhnhat8.jpg', N'shop hoa tươi')
INSERT [dbo].[HoaTuoi] ([MaHoaTuoi], [TenHoa], [MaLoaiHoa], [SoLuong], [DonGia], [Hinh], [GhiChu]) VALUES (N'HSN009', N'Hoa sinh nhật', N'HSN01', 5, 1350000, N'hoasinhnhat9jpg.jpg', N'shop hoa tươi')
INSERT [dbo].[HoaTuoi] ([MaHoaTuoi], [TenHoa], [MaLoaiHoa], [SoLuong], [DonGia], [Hinh], [GhiChu]) VALUES (N'HSN010', N'Hoa sinh nhật', N'HSN01', 5, 1400000, N'hoasinhnhat10.jpg', N'shop hoa tươi')
INSERT [dbo].[HoaTuoi] ([MaHoaTuoi], [TenHoa], [MaLoaiHoa], [SoLuong], [DonGia], [Hinh], [GhiChu]) VALUES (N'HSN011', N'Hoa sinh nhật', N'HSN01', 5, 1300000, N'hoasinhnhat11.jpg', N'shop hoa tươi')
INSERT [dbo].[HoaTuoi] ([MaHoaTuoi], [TenHoa], [MaLoaiHoa], [SoLuong], [DonGia], [Hinh], [GhiChu]) VALUES (N'HSN012', N'Hoa sinh nhật', N'HSN01', 5, 1600000, N'hoasinhnhat12.jpg', N'shop hoa tươi')
INSERT [dbo].[HoaTuoi] ([MaHoaTuoi], [TenHoa], [MaLoaiHoa], [SoLuong], [DonGia], [Hinh], [GhiChu]) VALUES (N'HSN013', N'Hoa sinh nhật', N'HSN01', 5, 1300000, N'hoasinhnhat13.jpg', N'shop hoa tươi')
INSERT [dbo].[HoaTuoi] ([MaHoaTuoi], [TenHoa], [MaLoaiHoa], [SoLuong], [DonGia], [Hinh], [GhiChu]) VALUES (N'HSN014', N'Hoa sinh nhật', N'HSN01', 5, 1300000, N'hoasinhnhat14.jpg', N'shop hoa tươi')
INSERT [dbo].[HoaTuoi] ([MaHoaTuoi], [TenHoa], [MaLoaiHoa], [SoLuong], [DonGia], [Hinh], [GhiChu]) VALUES (N'HSN015', N'Hoa sinh nhật', N'HSN01', 5, 730000, N'hoasinhnhat15.jpg', N'shop hoa tươi')
INSERT [dbo].[HoaTuoi] ([MaHoaTuoi], [TenHoa], [MaLoaiHoa], [SoLuong], [DonGia], [Hinh], [GhiChu]) VALUES (N'HT001', N'Hoa Tươi 1', N'HT01', 100, 500000, N'hoatuoi1.jpg', N'Hoa Tươi Tặng Valentine')
INSERT [dbo].[HoaTuoi] ([MaHoaTuoi], [TenHoa], [MaLoaiHoa], [SoLuong], [DonGia], [Hinh], [GhiChu]) VALUES (N'HT002', N'Hoa Tươi 2', N'HT01', 76, 600000, N'hoatuoi2.jpg', N'Hoa Tươi Tặng Valentine')
INSERT [dbo].[HoaTuoi] ([MaHoaTuoi], [TenHoa], [MaLoaiHoa], [SoLuong], [DonGia], [Hinh], [GhiChu]) VALUES (N'HT003', N'Hoa tươi', N'HT01', 5, 350000, N'hoatuoi3.jpg', N'shop hoa tươi')
INSERT [dbo].[HoaTuoi] ([MaHoaTuoi], [TenHoa], [MaLoaiHoa], [SoLuong], [DonGia], [Hinh], [GhiChu]) VALUES (N'HT004', N'Hoa tươi', N'HT01', 5, 450000, N'hoatuoi4.jpg', N'shop hoa tươi')
INSERT [dbo].[HoaTuoi] ([MaHoaTuoi], [TenHoa], [MaLoaiHoa], [SoLuong], [DonGia], [Hinh], [GhiChu]) VALUES (N'HT005', N'Hoa tươi', N'HT01', 5, 450000, N'hoatuoi5.jpg', N'shop hoa tươi')
INSERT [dbo].[HoaTuoi] ([MaHoaTuoi], [TenHoa], [MaLoaiHoa], [SoLuong], [DonGia], [Hinh], [GhiChu]) VALUES (N'HT006', N'Hoa tươi', N'HT01', 5, 450000, N'hoatuoi6.jpg', N'shop hoa tươi')
INSERT [dbo].[HoaTuoi] ([MaHoaTuoi], [TenHoa], [MaLoaiHoa], [SoLuong], [DonGia], [Hinh], [GhiChu]) VALUES (N'HT007', N'Hoa tươi', N'HT01', 5, 350000, N'hoatuoi7.jpg', N'shop hoa tươi')
INSERT [dbo].[HoaTuoi] ([MaHoaTuoi], [TenHoa], [MaLoaiHoa], [SoLuong], [DonGia], [Hinh], [GhiChu]) VALUES (N'HT008', N'Hoa tươi', N'HT01', 5, 650000, N'hoatuoi 8.jpg', N'shop hoa tươi')
INSERT [dbo].[HoaTuoi] ([MaHoaTuoi], [TenHoa], [MaLoaiHoa], [SoLuong], [DonGia], [Hinh], [GhiChu]) VALUES (N'HT009', N'Hoa tươi', N'HT01', 5, 550000, N'hoatuoi 9.jpg', N'shop hoa tươi')
INSERT [dbo].[HoaTuoi] ([MaHoaTuoi], [TenHoa], [MaLoaiHoa], [SoLuong], [DonGia], [Hinh], [GhiChu]) VALUES (N'HT010', N'Hoa tươi', N'HT01', 5, 800000, N'hoatuoi 10.jpg', N'shop hoa tươi')
INSERT [dbo].[HoaTuoi] ([MaHoaTuoi], [TenHoa], [MaLoaiHoa], [SoLuong], [DonGia], [Hinh], [GhiChu]) VALUES (N'HT011', N'Hoa tươi', N'HT01', 5, 700000, N'hoatuoi 11.jpg', N'shop hoa tươi')
INSERT [dbo].[HoaTuoi] ([MaHoaTuoi], [TenHoa], [MaLoaiHoa], [SoLuong], [DonGia], [Hinh], [GhiChu]) VALUES (N'HT012', N'Hoa tươi', N'HT01', 5, 750000, N'hoatuoi 12.jpg', N'shop hoa tươi')
INSERT [dbo].[HoaTuoi] ([MaHoaTuoi], [TenHoa], [MaLoaiHoa], [SoLuong], [DonGia], [Hinh], [GhiChu]) VALUES (N'HT013', N'Hoa tươi', N'HT01', 5, 150000, N'hoatuoi 13.jpg', N'shop hoa tươi')
INSERT [dbo].[HoaTuoi] ([MaHoaTuoi], [TenHoa], [MaLoaiHoa], [SoLuong], [DonGia], [Hinh], [GhiChu]) VALUES (N'HT014', N'Hoa tươi', N'HT01', 5, 650000, N'hoatuoi 14.jpg', N'shop hoa tươi')
INSERT [dbo].[HoaTuoi] ([MaHoaTuoi], [TenHoa], [MaLoaiHoa], [SoLuong], [DonGia], [Hinh], [GhiChu]) VALUES (N'HT015', N'Hoa tươi', N'HT01', 10, 650000, N'hoatuoi 15.jpg', N'shop hoa tươi')
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKH], [DiaChi], [DienThoai]) VALUES (N'KH03646831', N'', N'', 0)
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKH], [DiaChi], [DienThoai]) VALUES (N'KH11174688', N'Phạm Xuân Thành', N'Quân Bình Thạnh', 829069648)
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKH], [DiaChi], [DienThoai]) VALUES (N'KH16005188', N'Doanh Ngọc Diễm', N'501/14/23 Xô Viết Nghệ Tĩnh, Phường 26, Quận Bình Thạnh', 123456789)
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKH], [DiaChi], [DienThoai]) VALUES (N'KH36135817', N'Trần Công Minh', N'Quận 1', 923451678)
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKH], [DiaChi], [DienThoai]) VALUES (N'KH46346614', N'Trần Minh Hiếu', N'501/14/23 Phường 26, Quận Bình Thạnh', 829069648)
INSERT [dbo].[LoaiHoa] ([MaLoaiHoa], [TenLoaiHoa]) VALUES (N'HB01', N'Hoa Bó')
INSERT [dbo].[LoaiHoa] ([MaLoaiHoa], [TenLoaiHoa]) VALUES (N'HC01', N'Hoa Cưới')
INSERT [dbo].[LoaiHoa] ([MaLoaiHoa], [TenLoaiHoa]) VALUES (N'HD01', N'Hoa Đẹp')
INSERT [dbo].[LoaiHoa] ([MaLoaiHoa], [TenLoaiHoa]) VALUES (N'HKT01', N'Hoa Khai Trương')
INSERT [dbo].[LoaiHoa] ([MaLoaiHoa], [TenLoaiHoa]) VALUES (N'HSN01', N'Hoa Sinh Nhật')
INSERT [dbo].[LoaiHoa] ([MaLoaiHoa], [TenLoaiHoa]) VALUES (N'HT01', N'Hoa Tươi')
SET IDENTITY_INSERT [dbo].[NHANVIEN] ON 

INSERT [dbo].[NHANVIEN] ([MaNV], [TenNhanVien], [NgaySinh], [GioiTinh], [DiaChi], [DienThoai], [Hinh], [Luong]) VALUES (1, N'Nguyễn Thị Đào', CAST(0x2D250B00 AS Date), 1, N'Quận Bình Thạnh', N'0123456780', N'nhanvien2.jpg', 0)
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNhanVien], [NgaySinh], [GioiTinh], [DiaChi], [DienThoai], [Hinh], [Luong]) VALUES (2, N'Bào Thị Thơm', CAST(0x2F250B00 AS Date), 1, N'Quận Bình Thạnh', N'0123738492', N'nhanvien3.jpg', 0)
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNhanVien], [NgaySinh], [GioiTinh], [DiaChi], [DienThoai], [Hinh], [Luong]) VALUES (3, N'Phạm Băng Băng', CAST(0x1E250B00 AS Date), 1, N'Quận Tân Bỉnh', N'0163748201', N'nhanvien4.jpg', 0)
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNhanVien], [NgaySinh], [GioiTinh], [DiaChi], [DienThoai], [Hinh], [Luong]) VALUES (5, N'Trần Ngọc Như', CAST(0xE1240B00 AS Date), 1, N'Quận 3', N'0197636479', N'nhanvien5.jpg', 0)
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNhanVien], [NgaySinh], [GioiTinh], [DiaChi], [DienThoai], [Hinh], [Luong]) VALUES (8, N'Phạm Thanh Thanh', CAST(0x6F260B00 AS Date), 1, N'Quận Bình Thạnh', N'0829069648', N'nhanvien6.jpg', 1000000)
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNhanVien], [NgaySinh], [GioiTinh], [DiaChi], [DienThoai], [Hinh], [Luong]) VALUES (9, N'Mai Ngọc Ý', CAST(0x0C240B00 AS Date), 1, N'Quận Tân Bình', N'0823460871', N'nhanvien7.jpg', 8000000)
SET IDENTITY_INSERT [dbo].[NHANVIEN] OFF
INSERT [dbo].[UserLogins] ([username], [password], [vaitro], [MaNV], [MaBaoVe]) VALUES (N'administrator', N'123', 0, NULL, NULL)
INSERT [dbo].[UserLogins] ([username], [password], [vaitro], [MaNV], [MaBaoVe]) VALUES (N'babynu189', N'0209638001', 1, 8, N'nhophuonhxa@gmail.com')
INSERT [dbo].[UserLogins] ([username], [password], [vaitro], [MaNV], [MaBaoVe]) VALUES (N'merlin', N'123', 1, 9, N'01298952559')
INSERT [dbo].[UserLogins] ([username], [password], [vaitro], [MaNV], [MaBaoVe]) VALUES (N'nhanvien1', N'123', 1, 1, N'alesxanroad')
ALTER TABLE [dbo].[HoaDon] ADD  DEFAULT (getdate()) FOR [NgayBan]
GO
ALTER TABLE [dbo].[ChiTietHoaDon]  WITH CHECK ADD FOREIGN KEY([MaHoaTuoi])
REFERENCES [dbo].[HoaTuoi] ([MaHoaTuoi])
GO
ALTER TABLE [dbo].[ChiTietHoaDon]  WITH CHECK ADD  CONSTRAINT [FK_MAHoaDon] FOREIGN KEY([MaHoaDon])
REFERENCES [dbo].[HoaDon] ([MaHoaDon])
GO
ALTER TABLE [dbo].[ChiTietHoaDon] CHECK CONSTRAINT [FK_MAHoaDon]
GO
ALTER TABLE [dbo].[GioHang]  WITH CHECK ADD FOREIGN KEY([MaHoaTuoi])
REFERENCES [dbo].[HoaTuoi] ([MaHoaTuoi])
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD FOREIGN KEY([MaKhachHang])
REFERENCES [dbo].[KhachHang] ([MaKhachHang])
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD FOREIGN KEY([MaNV])
REFERENCES [dbo].[NHANVIEN] ([MaNV])
GO
ALTER TABLE [dbo].[HoaTuoi]  WITH CHECK ADD FOREIGN KEY([MaLoaiHoa])
REFERENCES [dbo].[LoaiHoa] ([MaLoaiHoa])
GO
ALTER TABLE [dbo].[UserLogins]  WITH CHECK ADD  CONSTRAINT [fk_usernv] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NHANVIEN] ([MaNV])
GO
ALTER TABLE [dbo].[UserLogins] CHECK CONSTRAINT [fk_usernv]
GO
