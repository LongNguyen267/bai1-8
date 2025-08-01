USE [Btvn]
GO
/****** Object:  Table [dbo].[GiaoDich]    Script Date: 01/08/2025 8:43:51 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GiaoDich](
	[MaGiaoDich] [varchar](50) NOT NULL,
	[SoTaiKhoan] [varchar](50) NOT NULL,
	[SoTien] [decimal](18, 2) NOT NULL,
	[ThoiGianGiaoDich] [datetime] NOT NULL,
	[SoDuSauGiaoDich] [decimal](18, 2) NOT NULL,
	[NoiDung] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaGiaoDich] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LaiSuatKyHan]    Script Date: 01/08/2025 8:43:51 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LaiSuatKyHan](
	[KyHanThang] [int] NOT NULL,
	[LaiSuatNam] [decimal](5, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[KyHanThang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SoTietKiem]    Script Date: 01/08/2025 8:43:51 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SoTietKiem](
	[MaSoTietKiem] [varchar](50) NOT NULL,
	[SoTaiKhoan] [varchar](50) NOT NULL,
	[SoTien] [decimal](18, 2) NOT NULL,
	[KyHanThang] [int] NOT NULL,
	[LaiSuatNam] [decimal](5, 2) NOT NULL,
	[NgayBatDau] [date] NOT NULL,
	[NgayDaoHan] [date] NOT NULL,
	[TuDongGiaHan] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaSoTietKiem] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaiKhoan]    Script Date: 01/08/2025 8:43:51 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiKhoan](
	[SoTaiKhoan] [varchar](50) NOT NULL,
	[HoTenChuThe] [nvarchar](100) NOT NULL,
	[SoDienThoai] [varchar](20) NOT NULL,
	[CanCuocCongDan] [varchar](20) NOT NULL,
	[NgayHetHan] [date] NOT NULL,
	[SoDuKhaDung] [decimal](18, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SoTaiKhoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[GiaoDich] ([MaGiaoDich], [SoTaiKhoan], [SoTien], [ThoiGianGiaoDich], [SoDuSauGiaoDich], [NoiDung]) VALUES (N'GD001', N'1234567891', CAST(-500000.00 AS Decimal(18, 2)), CAST(N'2025-07-28T09:30:00.000' AS DateTime), CAST(49500000.00 AS Decimal(18, 2)), N'Thanh toán tiền điện')
INSERT [dbo].[GiaoDich] ([MaGiaoDich], [SoTaiKhoan], [SoTien], [ThoiGianGiaoDich], [SoDuSauGiaoDich], [NoiDung]) VALUES (N'GD002', N'1234567892', CAST(1500000.00 AS Decimal(18, 2)), CAST(N'2025-07-28T10:15:00.000' AS DateTime), CAST(16500000.00 AS Decimal(18, 2)), N'Nhận tiền lương tháng 7')
INSERT [dbo].[GiaoDich] ([MaGiaoDich], [SoTaiKhoan], [SoTien], [ThoiGianGiaoDich], [SoDuSauGiaoDich], [NoiDung]) VALUES (N'GD003', N'1234567893', CAST(-1000000.00 AS Decimal(18, 2)), CAST(N'2025-07-28T11:00:00.000' AS DateTime), CAST(24000000.00 AS Decimal(18, 2)), N'Chuyển tiền mua hàng')
INSERT [dbo].[GiaoDich] ([MaGiaoDich], [SoTaiKhoan], [SoTien], [ThoiGianGiaoDich], [SoDuSauGiaoDich], [NoiDung]) VALUES (N'GD004', N'1234567894', CAST(2000000.00 AS Decimal(18, 2)), CAST(N'2025-07-28T12:30:00.000' AS DateTime), CAST(32000000.00 AS Decimal(18, 2)), N'Nhận tiền chuyển khoản từ 1234567893')
INSERT [dbo].[GiaoDich] ([MaGiaoDich], [SoTaiKhoan], [SoTien], [ThoiGianGiaoDich], [SoDuSauGiaoDich], [NoiDung]) VALUES (N'GD005', N'1234567895', CAST(-300000.00 AS Decimal(18, 2)), CAST(N'2025-07-29T14:00:00.000' AS DateTime), CAST(9700000.00 AS Decimal(18, 2)), N'Chi phí ăn uống')
INSERT [dbo].[GiaoDich] ([MaGiaoDich], [SoTaiKhoan], [SoTien], [ThoiGianGiaoDich], [SoDuSauGiaoDich], [NoiDung]) VALUES (N'GD006', N'1234567896', CAST(5000000.00 AS Decimal(18, 2)), CAST(N'2025-07-29T15:00:00.000' AS DateTime), CAST(45000000.00 AS Decimal(18, 2)), N'Tiền thu hồi công nợ')
INSERT [dbo].[GiaoDich] ([MaGiaoDich], [SoTaiKhoan], [SoTien], [ThoiGianGiaoDich], [SoDuSauGiaoDich], [NoiDung]) VALUES (N'GD007', N'1234567897', CAST(-1200000.00 AS Decimal(18, 2)), CAST(N'2025-07-29T16:30:00.000' AS DateTime), CAST(18800000.00 AS Decimal(18, 2)), N'Thanh toán học phí')
INSERT [dbo].[GiaoDich] ([MaGiaoDich], [SoTaiKhoan], [SoTien], [ThoiGianGiaoDich], [SoDuSauGiaoDich], [NoiDung]) VALUES (N'GD008', N'1234567898', CAST(1000000.00 AS Decimal(18, 2)), CAST(N'2025-07-30T09:00:00.000' AS DateTime), CAST(36000000.00 AS Decimal(18, 2)), N'Nhận tiền từ khách hàng')
INSERT [dbo].[GiaoDich] ([MaGiaoDich], [SoTaiKhoan], [SoTien], [ThoiGianGiaoDich], [SoDuSauGiaoDich], [NoiDung]) VALUES (N'GD009', N'1234567899', CAST(-2500000.00 AS Decimal(18, 2)), CAST(N'2025-07-30T10:45:00.000' AS DateTime), CAST(19500000.00 AS Decimal(18, 2)), N'Chuyển tiền tiết kiệm')
INSERT [dbo].[GiaoDich] ([MaGiaoDich], [SoTaiKhoan], [SoTien], [ThoiGianGiaoDich], [SoDuSauGiaoDich], [NoiDung]) VALUES (N'GD010', N'1234567900', CAST(800000.00 AS Decimal(18, 2)), CAST(N'2025-07-30T11:30:00.000' AS DateTime), CAST(18800000.00 AS Decimal(18, 2)), N'Nhận tiền lì xì')
INSERT [dbo].[GiaoDich] ([MaGiaoDich], [SoTaiKhoan], [SoTien], [ThoiGianGiaoDich], [SoDuSauGiaoDich], [NoiDung]) VALUES (N'GD011', N'1234567891', CAST(-15000000.00 AS Decimal(18, 2)), CAST(N'2025-07-30T13:00:00.000' AS DateTime), CAST(34500000.00 AS Decimal(18, 2)), N'Rút tiền mặt')
INSERT [dbo].[GiaoDich] ([MaGiaoDich], [SoTaiKhoan], [SoTien], [ThoiGianGiaoDich], [SoDuSauGiaoDich], [NoiDung]) VALUES (N'GD012', N'1234567892', CAST(500000.00 AS Decimal(18, 2)), CAST(N'2025-07-30T14:00:00.000' AS DateTime), CAST(17000000.00 AS Decimal(18, 2)), N'Tiền mừng tuổi')
INSERT [dbo].[GiaoDich] ([MaGiaoDich], [SoTaiKhoan], [SoTien], [ThoiGianGiaoDich], [SoDuSauGiaoDich], [NoiDung]) VALUES (N'GD013', N'1234567893', CAST(-5000000.00 AS Decimal(18, 2)), CAST(N'2025-07-30T15:00:00.000' AS DateTime), CAST(19000000.00 AS Decimal(18, 2)), N'Chuyển tiền mua xe')
INSERT [dbo].[GiaoDich] ([MaGiaoDich], [SoTaiKhoan], [SoTien], [ThoiGianGiaoDich], [SoDuSauGiaoDich], [NoiDung]) VALUES (N'GD014', N'1234567894', CAST(300000.00 AS Decimal(18, 2)), CAST(N'2025-07-31T09:00:00.000' AS DateTime), CAST(32300000.00 AS Decimal(18, 2)), N'Hoàn tiền')
INSERT [dbo].[GiaoDich] ([MaGiaoDich], [SoTaiKhoan], [SoTien], [ThoiGianGiaoDich], [SoDuSauGiaoDich], [NoiDung]) VALUES (N'GD015', N'1234567895', CAST(-5000000.00 AS Decimal(18, 2)), CAST(N'2025-07-31T10:00:00.000' AS DateTime), CAST(4700000.00 AS Decimal(18, 2)), N'Gửi tiết kiệm có kỳ hạn')
INSERT [dbo].[GiaoDich] ([MaGiaoDich], [SoTaiKhoan], [SoTien], [ThoiGianGiaoDich], [SoDuSauGiaoDich], [NoiDung]) VALUES (N'GD016', N'1234567896', CAST(-800000.00 AS Decimal(18, 2)), CAST(N'2025-07-31T11:00:00.000' AS DateTime), CAST(44200000.00 AS Decimal(18, 2)), N'Chi phí sinh hoạt')
INSERT [dbo].[GiaoDich] ([MaGiaoDich], [SoTaiKhoan], [SoTien], [ThoiGianGiaoDich], [SoDuSauGiaoDich], [NoiDung]) VALUES (N'GD017', N'1234567897', CAST(2000000.00 AS Decimal(18, 2)), CAST(N'2025-07-31T12:00:00.000' AS DateTime), CAST(20800000.00 AS Decimal(18, 2)), N'Nhận tiền bán hàng')
INSERT [dbo].[GiaoDich] ([MaGiaoDich], [SoTaiKhoan], [SoTien], [ThoiGianGiaoDich], [SoDuSauGiaoDich], [NoiDung]) VALUES (N'GD018', N'1234567898', CAST(-7500000.00 AS Decimal(18, 2)), CAST(N'2025-07-31T13:00:00.000' AS DateTime), CAST(28500000.00 AS Decimal(18, 2)), N'Đầu tư chứng khoán')
INSERT [dbo].[GiaoDich] ([MaGiaoDich], [SoTaiKhoan], [SoTien], [ThoiGianGiaoDich], [SoDuSauGiaoDich], [NoiDung]) VALUES (N'GD019', N'1234567899', CAST(1000000.00 AS Decimal(18, 2)), CAST(N'2025-07-31T14:00:00.000' AS DateTime), CAST(20500000.00 AS Decimal(18, 2)), N'Nhận tiền quà tặng')
INSERT [dbo].[GiaoDich] ([MaGiaoDich], [SoTaiKhoan], [SoTien], [ThoiGianGiaoDich], [SoDuSauGiaoDich], [NoiDung]) VALUES (N'GD020', N'1234567900', CAST(-200000.00 AS Decimal(18, 2)), CAST(N'2025-07-31T15:00:00.000' AS DateTime), CAST(18600000.00 AS Decimal(18, 2)), N'Thanh toán cước điện thoại')
GO
INSERT [dbo].[LaiSuatKyHan] ([KyHanThang], [LaiSuatNam]) VALUES (1, CAST(3.50 AS Decimal(5, 2)))
INSERT [dbo].[LaiSuatKyHan] ([KyHanThang], [LaiSuatNam]) VALUES (2, CAST(3.70 AS Decimal(5, 2)))
INSERT [dbo].[LaiSuatKyHan] ([KyHanThang], [LaiSuatNam]) VALUES (3, CAST(3.80 AS Decimal(5, 2)))
INSERT [dbo].[LaiSuatKyHan] ([KyHanThang], [LaiSuatNam]) VALUES (6, CAST(4.80 AS Decimal(5, 2)))
INSERT [dbo].[LaiSuatKyHan] ([KyHanThang], [LaiSuatNam]) VALUES (9, CAST(4.90 AS Decimal(5, 2)))
INSERT [dbo].[LaiSuatKyHan] ([KyHanThang], [LaiSuatNam]) VALUES (12, CAST(5.20 AS Decimal(5, 2)))
INSERT [dbo].[LaiSuatKyHan] ([KyHanThang], [LaiSuatNam]) VALUES (18, CAST(5.50 AS Decimal(5, 2)))
INSERT [dbo].[LaiSuatKyHan] ([KyHanThang], [LaiSuatNam]) VALUES (24, CAST(5.80 AS Decimal(5, 2)))
INSERT [dbo].[LaiSuatKyHan] ([KyHanThang], [LaiSuatNam]) VALUES (36, CAST(5.80 AS Decimal(5, 2)))
GO
INSERT [dbo].[SoTietKiem] ([MaSoTietKiem], [SoTaiKhoan], [SoTien], [KyHanThang], [LaiSuatNam], [NgayBatDau], [NgayDaoHan], [TuDongGiaHan]) VALUES (N'STK001', N'1234567891', CAST(10000000.00 AS Decimal(18, 2)), 12, CAST(5.20 AS Decimal(5, 2)), CAST(N'2025-07-28' AS Date), CAST(N'2026-07-28' AS Date), 1)
INSERT [dbo].[SoTietKiem] ([MaSoTietKiem], [SoTaiKhoan], [SoTien], [KyHanThang], [LaiSuatNam], [NgayBatDau], [NgayDaoHan], [TuDongGiaHan]) VALUES (N'STK002', N'1234567892', CAST(5000000.00 AS Decimal(18, 2)), 6, CAST(4.80 AS Decimal(5, 2)), CAST(N'2025-07-29' AS Date), CAST(N'2026-01-29' AS Date), 0)
INSERT [dbo].[SoTietKiem] ([MaSoTietKiem], [SoTaiKhoan], [SoTien], [KyHanThang], [LaiSuatNam], [NgayBatDau], [NgayDaoHan], [TuDongGiaHan]) VALUES (N'STK003', N'1234567893', CAST(10000000.00 AS Decimal(18, 2)), 24, CAST(5.80 AS Decimal(5, 2)), CAST(N'2025-07-30' AS Date), CAST(N'2027-07-30' AS Date), 1)
INSERT [dbo].[SoTietKiem] ([MaSoTietKiem], [SoTaiKhoan], [SoTien], [KyHanThang], [LaiSuatNam], [NgayBatDau], [NgayDaoHan], [TuDongGiaHan]) VALUES (N'STK004', N'1234567894', CAST(15000000.00 AS Decimal(18, 2)), 18, CAST(5.50 AS Decimal(5, 2)), CAST(N'2025-07-31' AS Date), CAST(N'2027-01-31' AS Date), 1)
INSERT [dbo].[SoTietKiem] ([MaSoTietKiem], [SoTaiKhoan], [SoTien], [KyHanThang], [LaiSuatNam], [NgayBatDau], [NgayDaoHan], [TuDongGiaHan]) VALUES (N'STK005', N'1234567895', CAST(5000000.00 AS Decimal(18, 2)), 12, CAST(5.20 AS Decimal(5, 2)), CAST(N'2025-07-31' AS Date), CAST(N'2026-07-31' AS Date), 0)
INSERT [dbo].[SoTietKiem] ([MaSoTietKiem], [SoTaiKhoan], [SoTien], [KyHanThang], [LaiSuatNam], [NgayBatDau], [NgayDaoHan], [TuDongGiaHan]) VALUES (N'STK006', N'1234567896', CAST(20000000.00 AS Decimal(18, 2)), 36, CAST(5.80 AS Decimal(5, 2)), CAST(N'2025-07-28' AS Date), CAST(N'2028-07-28' AS Date), 1)
INSERT [dbo].[SoTietKiem] ([MaSoTietKiem], [SoTaiKhoan], [SoTien], [KyHanThang], [LaiSuatNam], [NgayBatDau], [NgayDaoHan], [TuDongGiaHan]) VALUES (N'STK007', N'1234567897', CAST(5000000.00 AS Decimal(18, 2)), 9, CAST(4.90 AS Decimal(5, 2)), CAST(N'2025-07-29' AS Date), CAST(N'2026-04-29' AS Date), 0)
INSERT [dbo].[SoTietKiem] ([MaSoTietKiem], [SoTaiKhoan], [SoTien], [KyHanThang], [LaiSuatNam], [NgayBatDau], [NgayDaoHan], [TuDongGiaHan]) VALUES (N'STK008', N'1234567898', CAST(10000000.00 AS Decimal(18, 2)), 12, CAST(5.20 AS Decimal(5, 2)), CAST(N'2025-07-30' AS Date), CAST(N'2026-07-30' AS Date), 1)
INSERT [dbo].[SoTietKiem] ([MaSoTietKiem], [SoTaiKhoan], [SoTien], [KyHanThang], [LaiSuatNam], [NgayBatDau], [NgayDaoHan], [TuDongGiaHan]) VALUES (N'STK009', N'1234567899', CAST(10000000.00 AS Decimal(18, 2)), 6, CAST(4.80 AS Decimal(5, 2)), CAST(N'2025-07-31' AS Date), CAST(N'2026-01-31' AS Date), 1)
INSERT [dbo].[SoTietKiem] ([MaSoTietKiem], [SoTaiKhoan], [SoTien], [KyHanThang], [LaiSuatNam], [NgayBatDau], [NgayDaoHan], [TuDongGiaHan]) VALUES (N'STK010', N'1234567900', CAST(5000000.00 AS Decimal(18, 2)), 18, CAST(5.50 AS Decimal(5, 2)), CAST(N'2025-07-28' AS Date), CAST(N'2027-01-28' AS Date), 0)
INSERT [dbo].[SoTietKiem] ([MaSoTietKiem], [SoTaiKhoan], [SoTien], [KyHanThang], [LaiSuatNam], [NgayBatDau], [NgayDaoHan], [TuDongGiaHan]) VALUES (N'STK011', N'1234567891', CAST(5000000.00 AS Decimal(18, 2)), 3, CAST(3.80 AS Decimal(5, 2)), CAST(N'2025-08-01' AS Date), CAST(N'2025-11-01' AS Date), 1)
INSERT [dbo].[SoTietKiem] ([MaSoTietKiem], [SoTaiKhoan], [SoTien], [KyHanThang], [LaiSuatNam], [NgayBatDau], [NgayDaoHan], [TuDongGiaHan]) VALUES (N'STK012', N'1234567892', CAST(2000000.00 AS Decimal(18, 2)), 1, CAST(3.50 AS Decimal(5, 2)), CAST(N'2025-08-01' AS Date), CAST(N'2025-09-01' AS Date), 0)
INSERT [dbo].[SoTietKiem] ([MaSoTietKiem], [SoTaiKhoan], [SoTien], [KyHanThang], [LaiSuatNam], [NgayBatDau], [NgayDaoHan], [TuDongGiaHan]) VALUES (N'STK013', N'1234567893', CAST(5000000.00 AS Decimal(18, 2)), 12, CAST(5.20 AS Decimal(5, 2)), CAST(N'2025-08-01' AS Date), CAST(N'2026-08-01' AS Date), 1)
INSERT [dbo].[SoTietKiem] ([MaSoTietKiem], [SoTaiKhoan], [SoTien], [KyHanThang], [LaiSuatNam], [NgayBatDau], [NgayDaoHan], [TuDongGiaHan]) VALUES (N'STK014', N'1234567894', CAST(5000000.00 AS Decimal(18, 2)), 6, CAST(4.80 AS Decimal(5, 2)), CAST(N'2025-08-01' AS Date), CAST(N'2026-02-01' AS Date), 1)
INSERT [dbo].[SoTietKiem] ([MaSoTietKiem], [SoTaiKhoan], [SoTien], [KyHanThang], [LaiSuatNam], [NgayBatDau], [NgayDaoHan], [TuDongGiaHan]) VALUES (N'STK015', N'1234567896', CAST(5000000.00 AS Decimal(18, 2)), 12, CAST(5.20 AS Decimal(5, 2)), CAST(N'2025-08-01' AS Date), CAST(N'2026-08-01' AS Date), 0)
GO
INSERT [dbo].[TaiKhoan] ([SoTaiKhoan], [HoTenChuThe], [SoDienThoai], [CanCuocCongDan], [NgayHetHan], [SoDuKhaDung]) VALUES (N'1234567891', N'Lê Thị Hương', N'0901112222', N'012345678901', CAST(N'2030-01-01' AS Date), CAST(49500000.00 AS Decimal(18, 2)))
INSERT [dbo].[TaiKhoan] ([SoTaiKhoan], [HoTenChuThe], [SoDienThoai], [CanCuocCongDan], [NgayHetHan], [SoDuKhaDung]) VALUES (N'1234567892', N'Trần Minh Khôi', N'0902223333', N'012345678902', CAST(N'2031-02-02' AS Date), CAST(17000000.00 AS Decimal(18, 2)))
INSERT [dbo].[TaiKhoan] ([SoTaiKhoan], [HoTenChuThe], [SoDienThoai], [CanCuocCongDan], [NgayHetHan], [SoDuKhaDung]) VALUES (N'1234567893', N'Nguyễn Hoàng Mai', N'0903334444', N'012345678903', CAST(N'2032-03-03' AS Date), CAST(19000000.00 AS Decimal(18, 2)))
INSERT [dbo].[TaiKhoan] ([SoTaiKhoan], [HoTenChuThe], [SoDienThoai], [CanCuocCongDan], [NgayHetHan], [SoDuKhaDung]) VALUES (N'1234567894', N'Phạm Gia Hưng', N'0904445555', N'012345678904', CAST(N'2033-04-04' AS Date), CAST(32300000.00 AS Decimal(18, 2)))
INSERT [dbo].[TaiKhoan] ([SoTaiKhoan], [HoTenChuThe], [SoDienThoai], [CanCuocCongDan], [NgayHetHan], [SoDuKhaDung]) VALUES (N'1234567895', N'Hoàng Thị Ngọc', N'0905556666', N'012345678905', CAST(N'2034-05-05' AS Date), CAST(4700000.00 AS Decimal(18, 2)))
INSERT [dbo].[TaiKhoan] ([SoTaiKhoan], [HoTenChuThe], [SoDienThoai], [CanCuocCongDan], [NgayHetHan], [SoDuKhaDung]) VALUES (N'1234567896', N'Đỗ Minh Quân', N'0906667777', N'012345678906', CAST(N'2035-06-06' AS Date), CAST(44200000.00 AS Decimal(18, 2)))
INSERT [dbo].[TaiKhoan] ([SoTaiKhoan], [HoTenChuThe], [SoDienThoai], [CanCuocCongDan], [NgayHetHan], [SoDuKhaDung]) VALUES (N'1234567897', N'Vũ Kim Anh', N'0907778888', N'012345678907', CAST(N'2036-07-07' AS Date), CAST(20800000.00 AS Decimal(18, 2)))
INSERT [dbo].[TaiKhoan] ([SoTaiKhoan], [HoTenChuThe], [SoDienThoai], [CanCuocCongDan], [NgayHetHan], [SoDuKhaDung]) VALUES (N'1234567898', N'Bùi Thanh Tú', N'0908889999', N'012345678908', CAST(N'2037-08-08' AS Date), CAST(28500000.00 AS Decimal(18, 2)))
INSERT [dbo].[TaiKhoan] ([SoTaiKhoan], [HoTenChuThe], [SoDienThoai], [CanCuocCongDan], [NgayHetHan], [SoDuKhaDung]) VALUES (N'1234567899', N'Đặng Phương Thảo', N'0909990000', N'012345678909', CAST(N'2038-09-09' AS Date), CAST(20500000.00 AS Decimal(18, 2)))
INSERT [dbo].[TaiKhoan] ([SoTaiKhoan], [HoTenChuThe], [SoDienThoai], [CanCuocCongDan], [NgayHetHan], [SoDuKhaDung]) VALUES (N'1234567900', N'Nguyễn Anh Tuấn', N'0900001111', N'012345678910', CAST(N'2039-10-10' AS Date), CAST(18600000.00 AS Decimal(18, 2)))
GO
ALTER TABLE [dbo].[TaiKhoan] ADD  DEFAULT ((0)) FOR [SoDuKhaDung]
GO
ALTER TABLE [dbo].[GiaoDich]  WITH CHECK ADD  CONSTRAINT [FK_GiaoDich_TaiKhoan] FOREIGN KEY([SoTaiKhoan])
REFERENCES [dbo].[TaiKhoan] ([SoTaiKhoan])
GO
ALTER TABLE [dbo].[GiaoDich] CHECK CONSTRAINT [FK_GiaoDich_TaiKhoan]
GO
ALTER TABLE [dbo].[SoTietKiem]  WITH CHECK ADD  CONSTRAINT [FK_SoTietKiem_TaiKhoan] FOREIGN KEY([SoTaiKhoan])
REFERENCES [dbo].[TaiKhoan] ([SoTaiKhoan])
GO
ALTER TABLE [dbo].[SoTietKiem] CHECK CONSTRAINT [FK_SoTietKiem_TaiKhoan]
GO
