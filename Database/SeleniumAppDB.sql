IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[SeleniumLog]') AND type in (N'U'))
DROP TABLE [SeleniumLog]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[DataToInput]') AND type in (N'U'))
DROP TABLE [DataToInput]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Customer]') AND type in (N'U'))
DROP TABLE [Customer]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[AppUser]') AND type in (N'U'))
DROP TABLE [AppUser]
GO
DROP USER [devel]
GO
CREATE USER [devel] FOR LOGIN [devel] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [devel]
GO
ALTER ROLE [db_datareader] ADD MEMBER [devel]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [devel]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [AppUser](
	[Username] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
 CONSTRAINT [PK_AppUser] PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Customer](
	[RowId] [bigint] IDENTITY(1,1) NOT NULL,
	[CIFNo] [varchar](50) NOT NULL,
	[Nama] [varchar](200) NULL,
	[FlagBadanUsaha] [varchar](10) NULL,
	[NPWP] [varchar](50) NULL,
	[NoKTP] [varchar](50) NULL,
	[JenisKelamin] [varchar](50) NULL,
	[NoAkta] [varchar](50) NULL,
	[Alamat] [varchar](250) NULL,
	[NoTelepon] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[KodePos] [varchar](50) NULL,
	[CreatedBy] [varchar](50) NULL,
	[ModifiedBy] [varchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[RowId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DataToInput](
	[CIFNo] [varchar](50) NOT NULL,
	[Nama] [varchar](200) NULL,
	[FlagBadanUsaha] [varchar](10) NULL,
	[NPWP] [varchar](50) NULL,
	[NoKTP] [varchar](50) NULL,
	[JenisKelamin] [varchar](50) NULL,
	[NoAkta] [varchar](50) NULL,
	[Alamat] [varchar](250) NULL,
	[NoTelepon] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[KodePos] [varchar](50) NULL,
 CONSTRAINT [PK_DataToInput] PRIMARY KEY CLUSTERED 
(
	[CIFNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [SeleniumLog](
	[Id] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[RegNo] [varchar](50) NULL,
	[Sequence] [int] NULL,
	[Step] [varchar](50) NULL,
	[Status] [varchar](50) NULL,
	[Message] [varchar](max) NULL,
	[LogDate] [datetime] NULL,
	[RunAsUser] [varchar](50) NULL,
 CONSTRAINT [PK_SeleniumLog] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [AppUser] ([Username], [Password]) VALUES (N'admin', N'admin')
GO
INSERT [AppUser] ([Username], [Password]) VALUES (N'user', N'user')
GO
SET IDENTITY_INSERT [Customer] ON 
GO
INSERT [Customer] ([RowId], [CIFNo], [Nama], [FlagBadanUsaha], [NPWP], [NoKTP], [JenisKelamin], [NoAkta], [Alamat], [NoTelepon], [Email], [KodePos], [CreatedBy], [ModifiedBy], [CreatedDate], [ModifiedDate]) VALUES (32, N'B202508003', N'PT Mayora Indah', N'B', N'1239102102', NULL, NULL, N'2020/1/xxxxx/1', N'Jakarta', N'0210000000', N'mayora@bank.co.id', NULL, N'user', NULL, CAST(N'2025-11-05T17:39:32.967' AS DateTime), NULL)
GO
INSERT [Customer] ([RowId], [CIFNo], [Nama], [FlagBadanUsaha], [NPWP], [NoKTP], [JenisKelamin], [NoAkta], [Alamat], [NoTelepon], [Email], [KodePos], [CreatedBy], [ModifiedBy], [CreatedDate], [ModifiedDate]) VALUES (33, N'B20251001', N'PT Coca Cola Tbk', N'B', N'314791401414', NULL, NULL, N'1990/X/X1234', N'Jakarta', N'0210009391913', N'pepsi@company.com', NULL, N'user', NULL, CAST(N'2025-11-05T17:39:41.310' AS DateTime), NULL)
GO
INSERT [Customer] ([RowId], [CIFNo], [Nama], [FlagBadanUsaha], [NPWP], [NoKTP], [JenisKelamin], [NoAkta], [Alamat], [NoTelepon], [Email], [KodePos], [CreatedBy], [ModifiedBy], [CreatedDate], [ModifiedDate]) VALUES (34, N'B20251005', N'PT Reka Rekadia', N'B', N'4431421312313', NULL, NULL, N'2015/1213/123', N'Bandung', N'021020102103', N'cs@rekareka.com', NULL, N'user', NULL, CAST(N'2025-11-05T17:39:50.290' AS DateTime), NULL)
GO
INSERT [Customer] ([RowId], [CIFNo], [Nama], [FlagBadanUsaha], [NPWP], [NoKTP], [JenisKelamin], [NoAkta], [Alamat], [NoTelepon], [Email], [KodePos], [CreatedBy], [ModifiedBy], [CreatedDate], [ModifiedDate]) VALUES (35, N'I202508001', N'Laili', N'I', N'123456789', N'3333123456789001', N'P', NULL, N'Jakarta', N'08111111', N'laili@kozaku.com', NULL, N'user', NULL, CAST(N'2025-11-05T17:39:59.730' AS DateTime), NULL)
GO
INSERT [Customer] ([RowId], [CIFNo], [Nama], [FlagBadanUsaha], [NPWP], [NoKTP], [JenisKelamin], [NoAkta], [Alamat], [NoTelepon], [Email], [KodePos], [CreatedBy], [ModifiedBy], [CreatedDate], [ModifiedDate]) VALUES (36, N'I202508002', N'Binto', N'I', N'234567890', N'331111111111111', N'L', NULL, N'Jakarta', N'08121111', N'binto@kozaku.com', NULL, N'user', NULL, CAST(N'2025-11-05T17:40:10.530' AS DateTime), NULL)
GO
INSERT [Customer] ([RowId], [CIFNo], [Nama], [FlagBadanUsaha], [NPWP], [NoKTP], [JenisKelamin], [NoAkta], [Alamat], [NoTelepon], [Email], [KodePos], [CreatedBy], [ModifiedBy], [CreatedDate], [ModifiedDate]) VALUES (37, N'I20251002', N'Azzahra', N'I', N'41412390213', N'1121224121321', N'P', NULL, N'Bintaro', N'085812421931', N'azzahra@gmail.com', NULL, N'user', NULL, CAST(N'2025-11-05T17:40:20.753' AS DateTime), NULL)
GO
INSERT [Customer] ([RowId], [CIFNo], [Nama], [FlagBadanUsaha], [NPWP], [NoKTP], [JenisKelamin], [NoAkta], [Alamat], [NoTelepon], [Email], [KodePos], [CreatedBy], [ModifiedBy], [CreatedDate], [ModifiedDate]) VALUES (38, N'I20251003', N'Auliaa', N'I', N'12241531534', N'1112131232131', N'P', NULL, N'Bogor', N'081231121212', N'auliaa@gmail.com', NULL, N'user', NULL, CAST(N'2025-11-05T17:40:32.873' AS DateTime), NULL)
GO
INSERT [Customer] ([RowId], [CIFNo], [Nama], [FlagBadanUsaha], [NPWP], [NoKTP], [JenisKelamin], [NoAkta], [Alamat], [NoTelepon], [Email], [KodePos], [CreatedBy], [ModifiedBy], [CreatedDate], [ModifiedDate]) VALUES (39, N'I20251004', N'Rifan Rasudi', N'I', N'22121323123', N'22121313123123', N'L', NULL, N'Depok', N'08564121331', N'rifan.r@gmail.com', NULL, N'user', NULL, CAST(N'2025-11-05T17:40:43.770' AS DateTime), NULL)
GO
INSERT [Customer] ([RowId], [CIFNo], [Nama], [FlagBadanUsaha], [NPWP], [NoKTP], [JenisKelamin], [NoAkta], [Alamat], [NoTelepon], [Email], [KodePos], [CreatedBy], [ModifiedBy], [CreatedDate], [ModifiedDate]) VALUES (40, N'12345', N'12345', N'I', N'12345', N'12345', N'L', NULL, N'alaamt', N'0123', N'email@email.com', N'12345', N'user', NULL, CAST(N'2025-11-05T17:45:25.323' AS DateTime), NULL)
GO
INSERT [Customer] ([RowId], [CIFNo], [Nama], [FlagBadanUsaha], [NPWP], [NoKTP], [JenisKelamin], [NoAkta], [Alamat], [NoTelepon], [Email], [KodePos], [CreatedBy], [ModifiedBy], [CreatedDate], [ModifiedDate]) VALUES (41, N'B202508003', N'PT Mayora Indah', N'B', N'1239102102', NULL, NULL, N'2020/1/xxxxx/1', N'Jakarta', N'0210000000', N'mayora@bank.co.id', N'99999', N'user', NULL, CAST(N'2025-11-05T17:48:07.463' AS DateTime), NULL)
GO
INSERT [Customer] ([RowId], [CIFNo], [Nama], [FlagBadanUsaha], [NPWP], [NoKTP], [JenisKelamin], [NoAkta], [Alamat], [NoTelepon], [Email], [KodePos], [CreatedBy], [ModifiedBy], [CreatedDate], [ModifiedDate]) VALUES (42, N'B20251001', N'PT Coca Cola Tbk', N'B', N'314791401414', NULL, NULL, N'1990/X/X1234', N'Jakarta', N'0210009391913', N'pepsi@company.com', N'12345', N'user', NULL, CAST(N'2025-11-05T17:48:16.783' AS DateTime), NULL)
GO
INSERT [Customer] ([RowId], [CIFNo], [Nama], [FlagBadanUsaha], [NPWP], [NoKTP], [JenisKelamin], [NoAkta], [Alamat], [NoTelepon], [Email], [KodePos], [CreatedBy], [ModifiedBy], [CreatedDate], [ModifiedDate]) VALUES (43, N'B20251005', N'PT Reka Rekadia', N'B', N'4431421312313', NULL, NULL, N'2015/1213/123', N'Bandung', N'021020102103', N'cs@rekareka.com', N'12345', N'user', NULL, CAST(N'2025-11-05T17:48:26.083' AS DateTime), NULL)
GO
INSERT [Customer] ([RowId], [CIFNo], [Nama], [FlagBadanUsaha], [NPWP], [NoKTP], [JenisKelamin], [NoAkta], [Alamat], [NoTelepon], [Email], [KodePos], [CreatedBy], [ModifiedBy], [CreatedDate], [ModifiedDate]) VALUES (44, N'I202508001', N'Laili', N'I', N'123456789', N'3333123456789001', N'P', NULL, N'Jakarta', N'08111111', N'laili@kozaku.com', N'23455', N'user', NULL, CAST(N'2025-11-05T17:48:35.620' AS DateTime), NULL)
GO
INSERT [Customer] ([RowId], [CIFNo], [Nama], [FlagBadanUsaha], [NPWP], [NoKTP], [JenisKelamin], [NoAkta], [Alamat], [NoTelepon], [Email], [KodePos], [CreatedBy], [ModifiedBy], [CreatedDate], [ModifiedDate]) VALUES (45, N'I202508002', N'Binto', N'I', N'234567890', N'331111111111111', N'L', NULL, N'Jakarta', N'08121111', N'binto@kozaku.com', N'23455', N'user', NULL, CAST(N'2025-11-05T17:48:45.280' AS DateTime), NULL)
GO
INSERT [Customer] ([RowId], [CIFNo], [Nama], [FlagBadanUsaha], [NPWP], [NoKTP], [JenisKelamin], [NoAkta], [Alamat], [NoTelepon], [Email], [KodePos], [CreatedBy], [ModifiedBy], [CreatedDate], [ModifiedDate]) VALUES (46, N'I20251002', N'Azzahra', N'I', N'41412390213', N'1121224121321', N'P', NULL, N'Bintaro', N'085812421931', N'azzahra@gmail.com', N'23455', N'user', NULL, CAST(N'2025-11-05T17:48:55.877' AS DateTime), NULL)
GO
INSERT [Customer] ([RowId], [CIFNo], [Nama], [FlagBadanUsaha], [NPWP], [NoKTP], [JenisKelamin], [NoAkta], [Alamat], [NoTelepon], [Email], [KodePos], [CreatedBy], [ModifiedBy], [CreatedDate], [ModifiedDate]) VALUES (47, N'I20251003', N'Auliaa', N'I', N'12241531534', N'1112131232131', N'P', NULL, N'Bogor', N'081231121212', N'auliaa@gmail.com', N'23455', N'user', NULL, CAST(N'2025-11-05T17:49:07.923' AS DateTime), NULL)
GO
INSERT [Customer] ([RowId], [CIFNo], [Nama], [FlagBadanUsaha], [NPWP], [NoKTP], [JenisKelamin], [NoAkta], [Alamat], [NoTelepon], [Email], [KodePos], [CreatedBy], [ModifiedBy], [CreatedDate], [ModifiedDate]) VALUES (48, N'I20251004', N'Rifan Rasudi', N'I', N'22121323123', N'22121313123123', N'L', NULL, N'Depok', N'08564121331', N'rifan.r@gmail.com', N'23455', N'user', NULL, CAST(N'2025-11-05T17:49:19.370' AS DateTime), NULL)
GO
SET IDENTITY_INSERT [Customer] OFF
GO
INSERT [DataToInput] ([CIFNo], [Nama], [FlagBadanUsaha], [NPWP], [NoKTP], [JenisKelamin], [NoAkta], [Alamat], [NoTelepon], [Email], [KodePos]) VALUES (N'B202508003', N'PT Mayora Indah', N'B', N'1239102102', NULL, NULL, N'2020/1/xxxxx/1', N'Jakarta', N'0210000000', N'mayora@bank.co.id', N'99999')
GO
INSERT [DataToInput] ([CIFNo], [Nama], [FlagBadanUsaha], [NPWP], [NoKTP], [JenisKelamin], [NoAkta], [Alamat], [NoTelepon], [Email], [KodePos]) VALUES (N'B20251001', N'PT Coca Cola Tbk', N'B', N'314791401414', NULL, NULL, N'1990/X/X1234', N'Jakarta', N'0210009391913', N'pepsi@company.com', N'12345')
GO
INSERT [DataToInput] ([CIFNo], [Nama], [FlagBadanUsaha], [NPWP], [NoKTP], [JenisKelamin], [NoAkta], [Alamat], [NoTelepon], [Email], [KodePos]) VALUES (N'B20251005', N'PT Reka Rekadia', N'B', N'4431421312313', NULL, NULL, N'2015/1213/123', N'Bandung', N'021020102103', N'cs@rekareka.com', N'12345')
GO
INSERT [DataToInput] ([CIFNo], [Nama], [FlagBadanUsaha], [NPWP], [NoKTP], [JenisKelamin], [NoAkta], [Alamat], [NoTelepon], [Email], [KodePos]) VALUES (N'I202508001', N'Laili', N'I', N'123456789', N'3333123456789001', N'P', NULL, N'Jakarta', N'08111111', N'laili@kozaku.com', N'23455')
GO
INSERT [DataToInput] ([CIFNo], [Nama], [FlagBadanUsaha], [NPWP], [NoKTP], [JenisKelamin], [NoAkta], [Alamat], [NoTelepon], [Email], [KodePos]) VALUES (N'I202508002', N'Binto', N'I', N'234567890', N'331111111111111', N'L', NULL, N'Jakarta', N'08121111', N'binto@kozaku.com', N'23455')
GO
INSERT [DataToInput] ([CIFNo], [Nama], [FlagBadanUsaha], [NPWP], [NoKTP], [JenisKelamin], [NoAkta], [Alamat], [NoTelepon], [Email], [KodePos]) VALUES (N'I20251002', N'Azzahra', N'I', N'41412390213', N'1121224121321', N'P', NULL, N'Bintaro', N'085812421931', N'azzahra@gmail.com', N'23455')
GO
INSERT [DataToInput] ([CIFNo], [Nama], [FlagBadanUsaha], [NPWP], [NoKTP], [JenisKelamin], [NoAkta], [Alamat], [NoTelepon], [Email], [KodePos]) VALUES (N'I20251003', N'Auliaa', N'I', N'12241531534', N'1112131232131', N'P', NULL, N'Bogor', N'081231121212', N'auliaa@gmail.com', N'23455')
GO
INSERT [DataToInput] ([CIFNo], [Nama], [FlagBadanUsaha], [NPWP], [NoKTP], [JenisKelamin], [NoAkta], [Alamat], [NoTelepon], [Email], [KodePos]) VALUES (N'I20251004', N'Rifan Rasudi', N'I', N'22121323123', N'22121313123123', N'L', NULL, N'Depok', N'08564121331', N'rifan.r@gmail.com', N'23455')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'034a0edf-5784-4eb2-8633-016064b3d315', N'05112517-4004000794', 7, N'STEP06', N'OK', N'I202508002: Input JenisKelamin: L', CAST(N'2025-11-05T17:40:07.970' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'5b860f5a-6276-41ef-aee8-0197e241b9f3', N'05112517-4038000959', 6, N'STEP05', N'OK', N'I20251004: Input NPWP: 22121323123', CAST(N'2025-11-05T17:40:40.907' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'203dc288-2d71-4cf3-a141-024c0e27627d', N'05112517-3946000081', 1, N'START', N'OK', N'Navigated to https://localhost:7138/Home/Index', CAST(N'2025-11-05T17:39:46.800' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'223cdfde-e95e-45b7-b318-0283758ca90e', N'05112517-3946000081', 9, N'STEP08', N'OK', N'B20251005: Input NoAkta: 2015/1213/123', CAST(N'2025-11-05T17:39:47.877' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'209d7c6d-2891-4c40-b28c-03a3792c8c95', N'05112517-4830000870', 1, N'START', N'OK', N'Navigated to https://localhost:7138/Home/Index', CAST(N'2025-11-05T17:48:31.623' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'f2bc8701-6772-498b-8add-04898a6ad696', N'05112517-4830000870', 7, N'STEP06', N'OK', N'I202508001: Input JenisKelamin: P', CAST(N'2025-11-05T17:48:33.043' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'ce119080-d9d2-4c68-a3ab-051121944b8c', N'05112517-4038000959', 7, N'STEP06', N'OK', N'I20251004: Input JenisKelamin: L', CAST(N'2025-11-05T17:40:41.067' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'ada6d0f3-b949-49fe-90bb-0676a5470f4e', N'05112517-4038000959', 4, N'STEP03', N'OK', N'I20251004: Input Nama: Rifan Rasudi', CAST(N'2025-11-05T17:40:40.600' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'241b0fdb-856d-4bf7-a03d-08749bc7a736', N'05112517-3937000406', 6, N'STEP05', N'OK', N'B20251001: Input NPWP: 314791401414', CAST(N'2025-11-05T17:39:38.873' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'db3ac9d8-feea-455b-becb-090a2c6a8a0e', N'05112517-4830000870', 10, N'STEP09', N'OK', N'I202508001: Input Alamat: Jakarta', CAST(N'2025-11-05T17:48:33.267' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'6258cde9-7d97-41ed-ab52-09707ce520f1', N'05112517-4004000794', 5, N'STEP04', N'OK', N'I202508002: Input Email: binto@kozaku.com', CAST(N'2025-11-05T17:40:07.667' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'2bb67eea-6a6f-41af-8deb-0b30031bbedd', N'05112517-4840000956', 3, N'STEP02', N'OK', N'I202508002: Input CIFNo: I202508002', CAST(N'2025-11-05T17:48:42.000' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'18a1e0d1-e28f-41b5-8403-0b88788310d2', N'05112517-4850000501', 7, N'STEP06', N'OK', N'I20251002: Input JenisKelamin: P', CAST(N'2025-11-05T17:48:53.027' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'b044eef9-af43-43c4-b81d-0b91afe5747e', N'05112517-3929000489', 2, N'STEP01', N'OK', N'B202508003: Input FlagBadanUsaha: B', CAST(N'2025-11-05T17:39:30.193' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'be5e7841-5e78-474f-a5d5-0bbdcde9096c', N'05112517-4913000741', 11, N'STEP10', N'OK', N'I20251004: Input NoTelepon: 08564121331', CAST(N'2025-11-05T17:49:16.763' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'5f49a6d1-7d54-4516-9430-0d100034e637', N'05112517-4830000870', 9, N'STEP08', N'OK', N'I202508001: PASS NO INPUT', CAST(N'2025-11-05T17:48:33.153' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'8650a91d-0cca-4162-9a07-12aa38455f27', N'05112517-3929000489', 11, N'STEP10', N'OK', N'B202508003: Input NoTelepon: 0210000000', CAST(N'2025-11-05T17:39:30.813' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'0f43e0aa-ca9c-42f8-9d58-13e48a48da35', N'05112517-4015000602', 5, N'STEP04', N'OK', N'I20251002: Input Email: azzahra@gmail.com', CAST(N'2025-11-05T17:40:17.717' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'f22cdc80-a7ed-447c-aa9e-1566c9448aec', N'05112517-4803000905', 8, N'STEP07', N'OK', N'B202508003: PASS NO INPUT', CAST(N'2025-11-05T17:48:04.960' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'0e7e03a4-2267-4aaf-a0c0-17d21f87e298', N'05112517-4026000597', 6, N'STEP05', N'OK', N'I20251003: Input NPWP: 12241531534', CAST(N'2025-11-05T17:40:29.713' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'454548b9-3685-4cbd-9bcc-1efd523b6e54', N'05112517-4038000959', 1, N'START', N'OK', N'Navigated to https://localhost:7138/Home/Index', CAST(N'2025-11-05T17:40:39.950' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'7708b37d-1b5c-4484-881b-1fbd4c2d3ae9', N'05112517-3937000406', 7, N'STEP06', N'OK', N'B20251001: PASS NO INPUT', CAST(N'2025-11-05T17:39:38.877' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'566532e9-a0b8-4f19-9bb3-20962ed5fd5d', N'05112517-4830000870', 5, N'STEP04', N'OK', N'I202508001: Input Email: laili@kozaku.com', CAST(N'2025-11-05T17:48:32.630' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'b2ad86b1-cad8-4f92-b1b1-219a61e67b8c', N'05112517-4015000602', 1, N'START', N'OK', N'Navigated to https://localhost:7138/Home/Index', CAST(N'2025-11-05T17:40:16.653' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'705a60c8-81d9-427b-9d33-227b63d1a380', N'05112517-4901000644', 5, N'STEP04', N'OK', N'I20251003: Input Email: auliaa@gmail.com', CAST(N'2025-11-05T17:49:04.040' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'93cfa17b-a71b-4e64-a09b-23ef46791daf', N'05112517-4901000644', 11, N'STEP10B', N'OK', N'I20251003: Input txtKodePos: 23455', CAST(N'2025-11-05T17:49:05.550' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'd77ee0cf-792b-47c1-9e1b-250a2df4c150', N'05112517-4812000595', 10, N'STEP09', N'OK', N'B20251001: Input Alamat: Jakarta', CAST(N'2025-11-05T17:48:14.397' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'c6062259-b673-4024-85fd-279a1de7c9b6', N'05112517-3946000081', 12, N'STEP11', N'OK', N'B20251005: Submit success for user user', CAST(N'2025-11-05T17:39:50.797' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'8214737d-2d0c-412b-9cc6-27d0d174dbca', N'05112517-4840000956', 8, N'STEP07', N'OK', N'I202508002: Input NoKTP: 331111111111111', CAST(N'2025-11-05T17:48:42.817' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'48390c36-bbf4-438b-a89e-2857a5679c50', N'05112517-4803000905', 10, N'STEP09', N'OK', N'B202508003: Input Alamat: Jakarta', CAST(N'2025-11-05T17:48:05.110' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'019866b8-28a4-42be-8a85-287ad584a14c', N'05112517-4004000794', 12, N'STEP11', N'OK', N'I202508002: Submit success for user user', CAST(N'2025-11-05T17:40:11.040' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'5ac84fac-4b91-41e0-8047-2a39e08b5c49', N'05112517-4803000905', 5, N'STEP04', N'OK', N'B202508003: Input Email: mayora@bank.co.id', CAST(N'2025-11-05T17:48:04.857' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'99d1eadf-dd21-4a83-bb46-2a89b041de27', N'05112517-3955000379', 6, N'STEP05', N'OK', N'I202508001: Input NPWP: 123456789', CAST(N'2025-11-05T17:39:56.837' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'23aa6247-0e47-4274-9ead-2b3a0987a721', N'05112517-4803000905', 3, N'STEP02', N'OK', N'B202508003: Input CIFNo: B202508003', CAST(N'2025-11-05T17:48:04.673' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'ef4130b1-dcb6-4dfb-b642-2c5be37d0fd1', N'05112517-4840000956', 7, N'STEP06', N'OK', N'I202508002: Input JenisKelamin: L', CAST(N'2025-11-05T17:48:42.690' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'6f20b3c1-42c3-43cd-9de6-2da14f63351b', N'05112517-4901000644', 6, N'STEP05', N'OK', N'I20251003: Input NPWP: 12241531534', CAST(N'2025-11-05T17:49:04.207' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'7aea4ec0-0d84-4634-a46b-2e0a8cedde51', N'05112517-4850000501', 2, N'STEP01', N'OK', N'I20251002: Input FlagBadanUsaha: I', CAST(N'2025-11-05T17:48:51.847' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'9fd42d62-d9dd-4eb2-b463-2ffa05e13d1d', N'05112517-4913000741', 10, N'STEP09', N'OK', N'I20251004: Input Alamat: Depok', CAST(N'2025-11-05T17:49:16.570' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'f19ac66b-2a15-4c80-a60a-33e8f770d324', N'05112517-4026000597', 5, N'STEP04', N'OK', N'I20251003: Input Email: auliaa@gmail.com', CAST(N'2025-11-05T17:40:29.340' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'7120a0e2-b148-4287-9444-33ecc0da4bd5', N'05112517-4026000597', 4, N'STEP03', N'OK', N'I20251003: Input Nama: Auliaa', CAST(N'2025-11-05T17:40:29.163' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'67695296-fa04-42c1-bc8c-3407e3a3baa0', N'05112517-3946000081', 8, N'STEP07', N'OK', N'B20251005: PASS NO INPUT', CAST(N'2025-11-05T17:39:47.730' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'ce2db624-1cb3-4c2f-9ab7-362bf2abc643', N'05112517-4830000870', 11, N'STEP10', N'OK', N'I202508001: Input NoTelepon: 08111111', CAST(N'2025-11-05T17:48:33.357' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'a1029449-ca7a-4201-8475-36adb5592059', N'05112517-4913000741', 8, N'STEP07', N'OK', N'I20251004: Input NoKTP: 22121313123123', CAST(N'2025-11-05T17:49:16.377' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'4a01ba00-fe8d-4265-aefc-373e8b9cc164', N'05112517-4830000870', 2, N'STEP01', N'OK', N'I202508001: Input FlagBadanUsaha: I', CAST(N'2025-11-05T17:48:31.903' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'099671ad-ffa5-4215-ba01-37f280af650d', N'05112517-3955000379', 9, N'STEP08', N'OK', N'I202508001: PASS NO INPUT', CAST(N'2025-11-05T17:39:57.170' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'5baa9e7d-7ead-4e74-b421-38bdaccae950', N'05112517-4812000595', 8, N'STEP07', N'OK', N'B20251001: PASS NO INPUT', CAST(N'2025-11-05T17:48:14.170' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'b6567108-a0a1-499d-b99f-3947b8b408a9', N'05112517-3929000489', 12, N'STEP11', N'OK', N'B202508003: Submit success for user user', CAST(N'2025-11-05T17:39:33.403' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'483e61be-2c04-4e2e-a603-3c77b0accd10', N'05112517-3929000489', 1, N'START', N'OK', N'Navigated to https://localhost:7138/Home/Index', CAST(N'2025-11-05T17:39:29.980' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'4bf32712-7b9d-4f60-989e-3cf30d09d75a', N'05112517-4913000741', 5, N'STEP04', N'OK', N'I20251004: Input Email: rifan.r@gmail.com', CAST(N'2025-11-05T17:49:15.927' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'26656d6d-df8c-46f4-b00d-3e06742595e3', N'05112517-4004000794', 9, N'STEP08', N'OK', N'I202508002: PASS NO INPUT', CAST(N'2025-11-05T17:40:08.167' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'46678388-ca5c-4d61-baf4-3e955c6bde5a', N'05112517-3955000379', 2, N'STEP01', N'OK', N'I202508001: Input FlagBadanUsaha: I', CAST(N'2025-11-05T17:39:56.297' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'cb3586c2-6df9-4529-beaa-3fd961370fa1', N'05112517-3937000406', 1, N'START', N'OK', N'Navigated to https://localhost:7138/Home/Index', CAST(N'2025-11-05T17:39:38.157' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'842b4a06-2714-4631-9b96-407fe88cb305', N'05112517-4850000501', 3, N'STEP02', N'OK', N'I20251002: Input CIFNo: I20251002', CAST(N'2025-11-05T17:48:52.023' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'6cecd326-fe4c-4051-80df-40c1047c29e0', N'05112517-4901000644', 4, N'STEP03', N'OK', N'I20251003: Input Nama: Auliaa', CAST(N'2025-11-05T17:49:03.890' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'44fd6286-bc47-4752-88fe-41594a2801d3', N'05112517-3929000489', 5, N'STEP04', N'OK', N'B202508003: Input Email: mayora@bank.co.id', CAST(N'2025-11-05T17:39:30.470' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'8dd9d04b-cc21-4224-b9d7-41895c67d5aa', N'05112517-4015000602', 6, N'STEP05', N'OK', N'I20251002: Input NPWP: 41412390213', CAST(N'2025-11-05T17:40:17.887' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'5c50f9a0-5b67-4315-bb99-446f67e584d1', N'05112517-4812000595', 2, N'STEP01', N'OK', N'B20251001: Input FlagBadanUsaha: B', CAST(N'2025-11-05T17:48:13.613' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'1a593b34-70d4-435c-a2da-448d645bc0df', N'05112517-4850000501', 1, N'START', N'OK', N'Navigated to https://localhost:7138/Home/Index', CAST(N'2025-11-05T17:48:51.557' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'ad518494-e957-478b-89b5-453ed28eca0e', N'05112517-4821000546', 1, N'START', N'OK', N'Navigated to https://localhost:7138/Home/Index', CAST(N'2025-11-05T17:48:22.457' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'95a28f55-1a9d-447d-80c6-466cd01f772a', N'05112517-4004000794', 3, N'STEP02', N'OK', N'I202508002: Input CIFNo: I202508002', CAST(N'2025-11-05T17:40:07.177' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'598b0b58-4265-4bdf-baee-4e1c8616b590', N'05112517-4812000595', 7, N'STEP06', N'OK', N'B20251001: PASS NO INPUT', CAST(N'2025-11-05T17:48:14.167' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'e532f58f-3f46-4b7d-947b-4eb8b4e6ef03', N'05112517-3946000081', 7, N'STEP06', N'OK', N'B20251005: PASS NO INPUT', CAST(N'2025-11-05T17:39:47.730' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'a4e5c5be-0532-48c5-bd50-50892de6f305', N'05112517-4803000905', 11, N'STEP10B', N'OK', N'B202508003: Input txtKodePos: 99999', CAST(N'2025-11-05T17:48:05.263' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'ddeefeda-f3f0-4692-98e5-5310f9177e9d', N'05112517-4821000546', 5, N'STEP04', N'OK', N'B20251005: Input Email: cs@rekareka.com', CAST(N'2025-11-05T17:48:23.493' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'7c58e079-067b-44b3-a9d6-54299f8481a4', N'05112517-4830000870', 8, N'STEP07', N'OK', N'I202508001: Input NoKTP: 3333123456789001', CAST(N'2025-11-05T17:48:33.150' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'4833daac-0cfb-485f-939e-5443d667b75c', N'05112517-4026000597', 12, N'STEP11', N'OK', N'I20251003: Submit success for user user', CAST(N'2025-11-05T17:40:33.470' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'55f22d7b-090f-4e47-8462-56b2ba0df09e', N'05112517-4015000602', 8, N'STEP07', N'OK', N'I20251002: Input NoKTP: 1121224121321', CAST(N'2025-11-05T17:40:18.237' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'f151b068-ef76-44d2-bdd4-5a168dbcb418', N'05112517-4850000501', 6, N'STEP05', N'OK', N'I20251002: Input NPWP: 41412390213', CAST(N'2025-11-05T17:48:52.757' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'75177bd8-5d8b-416c-9ebb-5a33e8a8426c', N'05112517-4830000870', 11, N'STEP10B', N'OK', N'I202508001: Input txtKodePos: 23455', CAST(N'2025-11-05T17:48:33.470' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'f6a17237-7342-4344-92f6-5b84ad00ffdd', N'05112517-4913000741', 7, N'STEP06', N'OK', N'I20251004: Input JenisKelamin: L', CAST(N'2025-11-05T17:49:16.240' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'35235528-c4a4-4128-84af-5ba91fa31ada', N'05112517-4821000546', 10, N'STEP09', N'OK', N'B20251005: Input Alamat: Bandung', CAST(N'2025-11-05T17:48:23.797' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'538e6962-0354-4093-bca3-5d0d1fa49299', N'05112517-4901000644', 12, N'STEP11', N'OK', N'I20251003: Submit success for user user', CAST(N'2025-11-05T17:49:08.597' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'd9c64e4c-851b-42a8-b4ac-5e1f8d0fc38d', N'05112517-4901000644', 11, N'STEP10', N'OK', N'I20251003: Input NoTelepon: 081231121212', CAST(N'2025-11-05T17:49:05.230' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'dadede27-b1b1-44e6-bedc-5f7337c568a2', N'05112517-3946000081', 10, N'STEP09', N'OK', N'B20251005: Input Alamat: Bandung', CAST(N'2025-11-05T17:39:47.973' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'cc171c76-7656-4438-864d-601e206cdd46', N'05112517-3955000379', 5, N'STEP04', N'OK', N'I202508001: Input Email: laili@kozaku.com', CAST(N'2025-11-05T17:39:56.620' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'a7a8a844-50b7-423f-94cc-63324ec94955', N'05112517-3937000406', 11, N'STEP10', N'OK', N'B20251001: Input NoTelepon: 0210009391913', CAST(N'2025-11-05T17:39:39.223' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'b78e3955-9865-42c5-a758-645248842bae', N'05112517-4840000956', 2, N'STEP01', N'OK', N'I202508002: Input FlagBadanUsaha: I', CAST(N'2025-11-05T17:48:41.870' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'7a009c82-f9cd-4881-a543-648e529552a6', N'05112517-4850000501', 4, N'STEP03', N'OK', N'I20251002: Input Nama: Azzahra', CAST(N'2025-11-05T17:48:52.273' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'e55a434e-807d-42e5-9118-662821348c84', N'05112517-3929000489', 6, N'STEP05', N'OK', N'B202508003: Input NPWP: 1239102102', CAST(N'2025-11-05T17:39:30.563' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'ca63fdf5-753d-459e-b65f-6ad2d8c619be', N'05112517-4850000501', 10, N'STEP09', N'OK', N'I20251002: Input Alamat: Bintaro', CAST(N'2025-11-05T17:48:53.330' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'0ae98b0f-726e-417b-bbf2-6b869a5230ac', N'05112517-4038000959', 11, N'STEP10', N'OK', N'I20251004: Input NoTelepon: 08564121331', CAST(N'2025-11-05T17:40:41.570' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'3a054984-8664-4d92-ac64-6c34d1a00ae3', N'05112517-4026000597', 9, N'STEP08', N'OK', N'I20251003: PASS NO INPUT', CAST(N'2025-11-05T17:40:30.150' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'ecab6f7d-0b34-4142-9123-700c1ef4103b', N'05112517-4803000905', 12, N'STEP11', N'OK', N'B202508003: Submit success for user user', CAST(N'2025-11-05T17:48:07.953' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'cc4ab748-b0ab-440f-9447-70c3ac6c6742', N'05112517-3937000406', 8, N'STEP07', N'OK', N'B20251001: PASS NO INPUT', CAST(N'2025-11-05T17:39:38.880' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'e2a57f69-72ff-4df6-890a-72393a5aec93', N'05112517-4004000794', 6, N'STEP05', N'OK', N'I202508002: Input NPWP: 234567890', CAST(N'2025-11-05T17:40:07.833' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'64dd8218-848f-41b9-a3a3-73725e46ab32', N'05112517-3937000406', 10, N'STEP09', N'OK', N'B20251001: Input Alamat: Jakarta', CAST(N'2025-11-05T17:39:39.110' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'8763d8da-dfc5-47c3-8ffe-7577a3a85183', N'05112517-4840000956', 9, N'STEP08', N'OK', N'I202508002: PASS NO INPUT', CAST(N'2025-11-05T17:48:42.823' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'b04f038f-011d-4e1e-aee0-760f4ea55821', N'05112517-4901000644', 8, N'STEP07', N'OK', N'I20251003: Input NoKTP: 1112131232131', CAST(N'2025-11-05T17:49:04.710' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'0e3b5fb7-b592-49e1-a1e8-78776415baab', N'05112517-4821000546', 8, N'STEP07', N'OK', N'B20251005: PASS NO INPUT', CAST(N'2025-11-05T17:48:23.593' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'2d844d87-4ec8-44e5-a023-78c5c1d522a2', N'05112517-4015000602', 7, N'STEP06', N'OK', N'I20251002: Input JenisKelamin: P', CAST(N'2025-11-05T17:40:18.050' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'8bcdbfdd-9056-4e67-bfb8-79961452ff4d', N'05112517-3929000489', 4, N'STEP03', N'OK', N'B202508003: Input Nama: PT Mayora Indah', CAST(N'2025-11-05T17:39:30.373' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'f5691a69-e98f-4cc8-a247-7abc93154b91', N'05112517-3946000081', 11, N'STEP10', N'OK', N'B20251005: Input NoTelepon: 021020102103', CAST(N'2025-11-05T17:39:48.067' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'f795295d-e031-40da-b2d1-7b813d34db11', N'05112517-3937000406', 2, N'STEP01', N'OK', N'B20251001: Input FlagBadanUsaha: B', CAST(N'2025-11-05T17:39:38.380' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'd487028f-3537-49de-87b7-7c142fddb15f', N'05112517-4038000959', 12, N'STEP11', N'OK', N'I20251004: Submit success for user user', CAST(N'2025-11-05T17:40:44.303' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'0276ddaf-eb48-46f2-a202-7d6fa0c0d5c0', N'05112517-4901000644', 7, N'STEP06', N'OK', N'I20251003: Input JenisKelamin: P', CAST(N'2025-11-05T17:49:04.363' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'dbcf210b-e04c-4cbe-a362-7f99749df0e8', N'05112517-4038000959', 5, N'STEP04', N'OK', N'I20251004: Input Email: rifan.r@gmail.com', CAST(N'2025-11-05T17:40:40.750' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'3a329887-b4eb-4235-83ca-7faf29a89901', N'05112517-4850000501', 9, N'STEP08', N'OK', N'I20251002: PASS NO INPUT', CAST(N'2025-11-05T17:48:53.203' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'82de03ca-5093-46c8-a219-7ff7892ad30b', N'05112517-4026000597', 8, N'STEP07', N'OK', N'I20251003: Input NoKTP: 1112131232131', CAST(N'2025-11-05T17:40:30.147' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'1b6efcee-6629-4ce7-8d02-810ee3d2e992', N'05112517-3937000406', 4, N'STEP03', N'OK', N'B20251001: Input Nama: PT Coca Cola Tbk', CAST(N'2025-11-05T17:39:38.610' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'3b9d94d5-8320-4119-b782-81b0e3c2aa49', N'05112517-4752000394', 2, N'LOGIN', N'OK', N'Login success for user user', CAST(N'2025-11-05T17:47:54.213' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'f9e1577d-3140-4a02-b5a4-8276bd97055e', N'05112517-3937000406', 5, N'STEP04', N'OK', N'B20251001: Input Email: pepsi@company.com', CAST(N'2025-11-05T17:39:38.767' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'ec5403eb-8bd7-4f89-a878-82c5c0a189d8', N'05112517-4850000501', 8, N'STEP07', N'OK', N'I20251002: Input NoKTP: 1121224121321', CAST(N'2025-11-05T17:48:53.203' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'1d1f0f62-2a36-43a9-bc47-8392bedbd24a', N'05112517-4821000546', 2, N'STEP01', N'OK', N'B20251005: Input FlagBadanUsaha: B', CAST(N'2025-11-05T17:48:22.787' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'48fca8f1-2cd8-48c3-bbc2-84dafcfffb19', N'05112517-3929000489', 10, N'STEP09', N'OK', N'B202508003: Input Alamat: Jakarta', CAST(N'2025-11-05T17:39:30.733' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'23c90256-af7d-4edb-872b-867fcf7d6a15', N'05112517-4840000956', 11, N'STEP10', N'OK', N'I202508002: Input NoTelepon: 08121111', CAST(N'2025-11-05T17:48:43.077' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'627218a8-fc2a-48c4-a9cd-875e9242a2d6', N'05112517-4812000595', 6, N'STEP05', N'OK', N'B20251001: Input NPWP: 314791401414', CAST(N'2025-11-05T17:48:14.163' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'7df762db-daf9-4fd8-85c3-898f620fb7d2', N'05112517-4752000394', 1, N'START', N'OK', N'Navigated to /Account/Login', CAST(N'2025-11-05T17:47:53.193' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'52ae3640-0353-486d-8437-89cc214107eb', N'05112517-3937000406', 9, N'STEP08', N'OK', N'B20251001: Input NoAkta: 1990/X/X1234', CAST(N'2025-11-05T17:39:38.990' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'525248c3-c76a-4bca-822e-8a4209d3e814', N'05112517-4038000959', 2, N'STEP01', N'OK', N'I20251004: Input FlagBadanUsaha: I', CAST(N'2025-11-05T17:40:40.353' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'36ef1fc6-449e-4e01-bf59-8a54314ce4d0', N'05112517-4812000595', 12, N'STEP11', N'OK', N'B20251001: Submit success for user user', CAST(N'2025-11-05T17:48:17.290' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'6f7458cf-d6f9-4794-83c3-8b26afe53938', N'05112517-3955000379', 7, N'STEP06', N'OK', N'I202508001: Input JenisKelamin: P', CAST(N'2025-11-05T17:39:56.963' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'62f211af-28e9-4d2c-90c1-8bb3f65f47e0', N'05112517-4015000602', 3, N'STEP02', N'OK', N'I20251002: Input CIFNo: I20251002', CAST(N'2025-11-05T17:40:17.263' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'6404f66b-ad7a-4c9c-9284-8c88246e5e5f', N'05112517-3946000081', 2, N'STEP01', N'OK', N'B20251005: Input FlagBadanUsaha: B', CAST(N'2025-11-05T17:39:47.083' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'06ae7a20-829f-4248-9635-8e1e6a65fbc7', N'05112517-4803000905', 1, N'START', N'OK', N'Navigated to https://localhost:7138/Home/Index', CAST(N'2025-11-05T17:48:04.397' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'c81f364a-698c-41c1-b66f-92bd12896187', N'05112517-4913000741', 4, N'STEP03', N'OK', N'I20251004: Input Nama: Rifan Rasudi', CAST(N'2025-11-05T17:49:15.613' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'10b08686-aeb4-4141-9338-9641d0d1b27b', N'05112517-4026000597', 3, N'STEP02', N'OK', N'I20251003: Input CIFNo: I20251003', CAST(N'2025-11-05T17:40:28.923' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'd491ed20-1747-4d08-92a5-99b984473e5d', N'05112517-4026000597', 2, N'STEP01', N'OK', N'I20251003: Input FlagBadanUsaha: I', CAST(N'2025-11-05T17:40:28.663' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'35d4a237-4afa-4fe5-bb73-9a4af83346a1', N'05112517-4850000501', 11, N'STEP10B', N'OK', N'I20251002: Input txtKodePos: 23455', CAST(N'2025-11-05T17:48:53.597' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'daa45418-24f5-4429-981b-9b8d94089c75', N'05112517-4026000597', 1, N'START', N'OK', N'Navigated to https://localhost:7138/Home/Index', CAST(N'2025-11-05T17:40:28.240' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'c135f47d-34ef-48c0-a3f1-9b9a99000ccd', N'05112517-3955000379', 12, N'STEP11', N'OK', N'I202508001: Submit success for user user', CAST(N'2025-11-05T17:40:00.257' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'f9c15034-03ae-44ad-90d0-9c5cea706d7d', N'05112517-4821000546', 4, N'STEP03', N'OK', N'B20251005: Input Nama: PT Reka Rekadia', CAST(N'2025-11-05T17:48:23.373' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'2b24ba60-517d-48fc-a207-9cb82d2fd53b', N'05112517-4026000597', 7, N'STEP06', N'OK', N'I20251003: Input JenisKelamin: P', CAST(N'2025-11-05T17:40:29.903' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'46421c23-82df-4762-9c78-9d650baa4554', N'05112517-3955000379', 4, N'STEP03', N'OK', N'I202508001: Input Nama: Laili', CAST(N'2025-11-05T17:39:56.517' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'1260907d-c957-45ba-b587-9db18f449b71', N'05112517-4015000602', 9, N'STEP08', N'OK', N'I20251002: PASS NO INPUT', CAST(N'2025-11-05T17:40:18.240' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'f90a32ee-3046-4439-a472-a0687cf796cb', N'05112517-4812000595', 5, N'STEP04', N'OK', N'B20251001: Input Email: pepsi@company.com', CAST(N'2025-11-05T17:48:14.020' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'21812ce0-b56f-47bd-9a77-a20b6e035f66', N'05112517-4821000546', 11, N'STEP10B', N'OK', N'B20251005: Input txtKodePos: 12345', CAST(N'2025-11-05T17:48:23.983' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'c0d0c272-30cf-4e98-8065-a3877e8b3498', N'05112517-4850000501', 5, N'STEP04', N'OK', N'I20251002: Input Email: azzahra@gmail.com', CAST(N'2025-11-05T17:48:52.517' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'60a96df5-e488-48a7-b411-a46484993a6a', N'05112517-4026000597', 11, N'STEP10', N'OK', N'I20251003: Input NoTelepon: 081231121212', CAST(N'2025-11-05T17:40:30.520' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'9d6db144-4557-4863-ad22-a60ca46b510c', N'05112517-4015000602', 12, N'STEP11', N'OK', N'I20251002: Submit success for user user', CAST(N'2025-11-05T17:40:21.290' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'4be4cae9-0f68-46ac-84cc-a6238cc7f595', N'05112517-3929000489', 3, N'STEP02', N'OK', N'B202508003: Input CIFNo: B202508003', CAST(N'2025-11-05T17:39:30.283' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'f3587334-2ea3-4ff0-a410-a95b28fdef5e', N'05112517-4850000501', 11, N'STEP10', N'OK', N'I20251002: Input NoTelepon: 085812421931', CAST(N'2025-11-05T17:48:53.473' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'42e0a7fa-7840-4f4d-99fa-aa52b9cf7177', N'05112517-4015000602', 10, N'STEP09', N'OK', N'I20251002: Input Alamat: Bintaro', CAST(N'2025-11-05T17:40:18.370' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'27ac9223-b59e-477d-96d6-ad2aa4e25869', N'05112517-4901000644', 1, N'START', N'OK', N'Navigated to https://localhost:7138/Home/Index', CAST(N'2025-11-05T17:49:03.123' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'cc108455-c34e-4a3f-a045-b09b2f487ad6', N'05112517-4830000870', 3, N'STEP02', N'OK', N'I202508001: Input CIFNo: I202508001', CAST(N'2025-11-05T17:48:32.083' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'50b7996e-03fe-4548-91ae-b2f7a8b94bb4', N'05112517-3929000489', 9, N'STEP08', N'OK', N'B202508003: Input NoAkta: 2020/1/xxxxx/1', CAST(N'2025-11-05T17:39:30.657' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'4230d410-5705-417c-a5b7-b3747f2b58de', N'05112517-4830000870', 4, N'STEP03', N'OK', N'I202508001: Input Nama: Laili', CAST(N'2025-11-05T17:48:32.350' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'028e6ad3-0d6b-40e3-8862-b62723d872db', N'05112517-4803000905', 6, N'STEP05', N'OK', N'B202508003: Input NPWP: 1239102102', CAST(N'2025-11-05T17:48:04.943' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'416f6187-e1ab-4c3c-8823-b64786306592', N'05112517-3946000081', 5, N'STEP04', N'OK', N'B20251005: Input Email: cs@rekareka.com', CAST(N'2025-11-05T17:39:47.617' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'c54d453d-5310-4866-864b-b73e70b0ebbb', N'05112517-4830000870', 6, N'STEP05', N'OK', N'I202508001: Input NPWP: 123456789', CAST(N'2025-11-05T17:48:32.903' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'3e7b2bfd-ab8e-4e7f-9738-ba10c880ce2a', N'05112517-3955000379', 8, N'STEP07', N'OK', N'I202508001: Input NoKTP: 3333123456789001', CAST(N'2025-11-05T17:39:57.167' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'2d9b808f-0d21-4a0b-be08-bab18b604355', N'05112517-4004000794', 1, N'START', N'OK', N'Navigated to https://localhost:7138/Home/Index', CAST(N'2025-11-05T17:40:06.687' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'19cd3c5b-71cd-4309-8c96-baeae6f984c3', N'05112517-4803000905', 7, N'STEP06', N'OK', N'B202508003: PASS NO INPUT', CAST(N'2025-11-05T17:48:04.957' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'6e91c766-6f32-47fd-8b15-bb770a3527b4', N'05112517-4803000905', 4, N'STEP03', N'OK', N'B202508003: Input Nama: PT Mayora Indah', CAST(N'2025-11-05T17:48:04.757' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'2184c10a-2d08-4c13-897e-bb77ae451038', N'05112517-4004000794', 10, N'STEP09', N'OK', N'I202508002: Input Alamat: Jakarta', CAST(N'2025-11-05T17:40:08.273' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'f1696ee8-c981-4540-9eb5-bbe319597d76', N'05112517-3946000081', 6, N'STEP05', N'OK', N'B20251005: Input NPWP: 4431421312313', CAST(N'2025-11-05T17:39:47.727' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'cd061c10-6aef-4bb3-a011-bcbee87921f7', N'05112517-3929000489', 7, N'STEP06', N'OK', N'B202508003: PASS NO INPUT', CAST(N'2025-11-05T17:39:30.577' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'26f65827-4743-455e-9d55-bd62e068675b', N'05112517-4812000595', 4, N'STEP03', N'OK', N'B20251001: Input Nama: PT Coca Cola Tbk', CAST(N'2025-11-05T17:48:13.893' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'4c96bf72-a74c-46f9-b440-bdf007f61351', N'05112517-3955000379', 10, N'STEP09', N'OK', N'I202508001: Input Alamat: Jakarta', CAST(N'2025-11-05T17:39:57.390' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'b6e144c5-af68-41fe-bbe5-beb034b5e03b', N'05112517-4038000959', 10, N'STEP09', N'OK', N'I20251004: Input Alamat: Depok', CAST(N'2025-11-05T17:40:41.393' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'9e40e602-11be-41f1-90d6-bf7fcdc4704d', N'05112517-4913000741', 9, N'STEP08', N'OK', N'I20251004: PASS NO INPUT', CAST(N'2025-11-05T17:49:16.387' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'4a45bd81-198a-4957-8530-bff15df440fa', N'05112517-4803000905', 9, N'STEP08', N'OK', N'B202508003: Input NoAkta: 2020/1/xxxxx/1', CAST(N'2025-11-05T17:48:05.040' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'7189d577-0f9a-4acc-923a-c0bb6fc1b6e4', N'05112517-4004000794', 8, N'STEP07', N'OK', N'I202508002: Input NoKTP: 331111111111111', CAST(N'2025-11-05T17:40:08.163' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'c7e5d9c5-9f94-4bda-abb7-c1464274907c', N'05112517-4901000644', 2, N'STEP01', N'OK', N'I20251003: Input FlagBadanUsaha: I', CAST(N'2025-11-05T17:49:03.497' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'b7659cde-84be-40d8-a84c-c157aecb542b', N'05112517-3955000379', 1, N'START', N'OK', N'Navigated to https://localhost:7138/Home/Index', CAST(N'2025-11-05T17:39:55.997' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'aa6f347d-8671-4195-9df4-c1ab170724bb', N'05112517-3946000081', 4, N'STEP03', N'OK', N'B20251005: Input Nama: PT Reka Rekadia', CAST(N'2025-11-05T17:39:47.467' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'cf514d2f-1005-4c94-b6fa-c4dd2772dcdf', N'05112517-4901000644', 10, N'STEP09', N'OK', N'I20251003: Input Alamat: Bogor', CAST(N'2025-11-05T17:49:04.963' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'cfe11218-c18e-413a-bfaa-c51125f0d3c6', N'05112517-4038000959', 3, N'STEP02', N'OK', N'I20251004: Input CIFNo: I20251004', CAST(N'2025-11-05T17:40:40.457' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'8a50aadd-d870-4d82-ae1f-c5dfbe3c08b9', N'05112517-4038000959', 8, N'STEP07', N'OK', N'I20251004: Input NoKTP: 22121313123123', CAST(N'2025-11-05T17:40:41.240' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'a8f84ea0-c03f-4fa6-98fa-cb73dfadfe1d', N'05112517-4004000794', 4, N'STEP03', N'OK', N'I202508002: Input Nama: Binto', CAST(N'2025-11-05T17:40:07.453' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'4aee3830-32ae-431b-89d7-cbb27ce3bc33', N'05112517-4840000956', 1, N'START', N'OK', N'Navigated to https://localhost:7138/Home/Index', CAST(N'2025-11-05T17:48:41.630' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'7f18d074-3078-42fd-8331-ccde4bfc00d7', N'05112517-4913000741', 3, N'STEP02', N'OK', N'I20251004: Input CIFNo: I20251004', CAST(N'2025-11-05T17:49:15.313' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'e62c0cd7-7653-404e-bff9-ccfd1027fe3e', N'05112517-4913000741', 6, N'STEP05', N'OK', N'I20251004: Input NPWP: 22121323123', CAST(N'2025-11-05T17:49:16.127' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'180e00a8-6415-4975-9c6a-cd1b71cafbf3', N'05112517-4821000546', 12, N'STEP11', N'OK', N'B20251005: Submit success for user user', CAST(N'2025-11-05T17:48:26.600' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'c9808c09-1f05-478f-98a8-cd9bce1f2286', N'05112517-4821000546', 6, N'STEP05', N'OK', N'B20251005: Input NPWP: 4431421312313', CAST(N'2025-11-05T17:48:23.587' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'd1c7bd65-629c-454b-b63e-d0651cc9bc4b', N'05112517-4840000956', 11, N'STEP10B', N'OK', N'I202508002: Input txtKodePos: 23455', CAST(N'2025-11-05T17:48:43.167' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'45dfe5a7-001c-48e4-a969-d0aaa344df4a', N'05112517-4026000597', 10, N'STEP09', N'OK', N'I20251003: Input Alamat: Bogor', CAST(N'2025-11-05T17:40:30.327' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'4d099c28-e84d-4a1f-922d-d14971cdacd9', N'05112517-4901000644', 3, N'STEP02', N'OK', N'I20251003: Input CIFNo: I20251003', CAST(N'2025-11-05T17:49:03.717' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'a82233d8-d938-4f3b-8a61-d2d028a83393', N'05112517-4821000546', 9, N'STEP08', N'OK', N'B20251005: Input NoAkta: 2015/1213/123', CAST(N'2025-11-05T17:48:23.707' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'd17e2e87-966c-418b-b2bd-d7225dee4a18', N'05112517-3852000718', 1, N'START', N'OK', N'Navigated to /Account/Login', CAST(N'2025-11-05T17:38:53.163' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'02228dee-cbd8-4435-a668-d7268e694aff', N'05112517-4803000905', 11, N'STEP10', N'OK', N'B202508003: Input NoTelepon: 0210000000', CAST(N'2025-11-05T17:48:05.193' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'03578a54-6e4c-4a72-b79e-d889bbe64ec6', N'05112517-4812000595', 3, N'STEP02', N'OK', N'B20251001: Input CIFNo: B20251001', CAST(N'2025-11-05T17:48:13.727' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'3f990590-b863-4efe-88de-d97728a1023e', N'05112517-3937000406', 3, N'STEP02', N'OK', N'B20251001: Input CIFNo: B20251001', CAST(N'2025-11-05T17:39:38.497' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'9a6a7fe6-5ad3-4614-93ae-daab7d4db87c', N'05112517-4821000546', 11, N'STEP10', N'OK', N'B20251005: Input NoTelepon: 021020102103', CAST(N'2025-11-05T17:48:23.900' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'bf3e278c-1f0a-40ba-8d02-dac84a970e30', N'05112517-4850000501', 12, N'STEP11', N'OK', N'I20251002: Submit success for user user', CAST(N'2025-11-05T17:48:56.497' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'c9921534-7a5b-4f14-8e7a-dc3cf9b45629', N'05112517-4821000546', 7, N'STEP06', N'OK', N'B20251005: PASS NO INPUT', CAST(N'2025-11-05T17:48:23.590' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'b12a77bb-3bf1-4ed1-bf56-dcb3351be7b8', N'05112517-4821000546', 3, N'STEP02', N'OK', N'B20251005: Input CIFNo: B20251005', CAST(N'2025-11-05T17:48:23.040' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'9152ab0e-14c3-4754-9b8c-dce9934ac442', N'05112517-4840000956', 4, N'STEP03', N'OK', N'I202508002: Input Nama: Binto', CAST(N'2025-11-05T17:48:42.197' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'4a46aa97-58d9-4bbd-b4c5-dd378bc9e88b', N'05112517-4812000595', 9, N'STEP08', N'OK', N'B20251001: Input NoAkta: 1990/X/X1234', CAST(N'2025-11-05T17:48:14.290' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'a5a305ad-ca12-4ce8-a0da-de9dd1481786', N'05112517-4901000644', 9, N'STEP08', N'OK', N'I20251003: PASS NO INPUT', CAST(N'2025-11-05T17:49:04.717' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'fa5d263c-969f-4b41-814f-e1302829b895', N'05112517-3852000718', 2, N'LOGIN', N'OK', N'Login success for user user', CAST(N'2025-11-05T17:38:54.237' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'3311dd1d-d38f-467a-9069-e1cb783ada89', N'05112517-4803000905', 2, N'STEP01', N'OK', N'B202508003: Input FlagBadanUsaha: B', CAST(N'2025-11-05T17:48:04.570' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'56b96758-57fe-450c-a1fb-e36e9ffc4ccb', N'05112517-4812000595', 11, N'STEP10', N'OK', N'B20251001: Input NoTelepon: 0210009391913', CAST(N'2025-11-05T17:48:14.510' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'dff7109a-cc83-4e03-87ed-e4478942e45c', N'05112517-4812000595', 11, N'STEP10B', N'OK', N'B20251001: Input txtKodePos: 12345', CAST(N'2025-11-05T17:48:14.613' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'531b8237-545f-4e77-95b1-e71b4e39ce53', N'05112517-4913000741', 1, N'START', N'OK', N'Navigated to https://localhost:7138/Home/Index', CAST(N'2025-11-05T17:49:14.807' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'36a9830d-9960-46ab-be74-e773101a7640', N'05112517-4840000956', 5, N'STEP04', N'OK', N'I202508002: Input Email: binto@kozaku.com', CAST(N'2025-11-05T17:48:42.360' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'4a23facc-ed65-406b-89fa-ec3ddbfa116b', N'05112517-4004000794', 2, N'STEP01', N'OK', N'I202508002: Input FlagBadanUsaha: I', CAST(N'2025-11-05T17:40:07.027' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'56a2cb01-9bb7-45fc-be9e-ed7a5d29d94f', N'05112517-4840000956', 12, N'STEP11', N'OK', N'I202508002: Submit success for user user', CAST(N'2025-11-05T17:48:45.803' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'0cb71d34-8f79-4696-8ef1-eed3cfc1ff49', N'05112517-4015000602', 4, N'STEP03', N'OK', N'I20251002: Input Nama: Azzahra', CAST(N'2025-11-05T17:40:17.533' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'cbf09be1-f060-4847-ae3a-ef1bd9b4f6fa', N'05112517-3955000379', 3, N'STEP02', N'OK', N'I202508001: Input CIFNo: I202508001', CAST(N'2025-11-05T17:39:56.423' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'5be8165c-15a3-46f7-8814-ef9ae4703c34', N'05112517-3955000379', 11, N'STEP10', N'OK', N'I202508001: Input NoTelepon: 08111111', CAST(N'2025-11-05T17:39:57.573' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'1bb804b1-76ca-40c2-8cce-f0da6b3962d0', N'05112517-4913000741', 2, N'STEP01', N'OK', N'I20251004: Input FlagBadanUsaha: I', CAST(N'2025-11-05T17:49:15.120' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'b0eec226-d775-4070-ad56-f0dff7e20c1a', N'05112517-3937000406', 12, N'STEP11', N'OK', N'B20251001: Submit success for user user', CAST(N'2025-11-05T17:39:41.833' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'6768f011-422d-44f2-b82a-f24dfbe88ae8', N'05112517-4004000794', 11, N'STEP10', N'OK', N'I202508002: Input NoTelepon: 08121111', CAST(N'2025-11-05T17:40:08.407' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'64ad39ea-baa7-457f-ba57-f312fa73aeac', N'05112517-3946000081', 3, N'STEP02', N'OK', N'B20251005: Input CIFNo: B20251005', CAST(N'2025-11-05T17:39:47.260' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'07871749-fc4d-4f5c-a891-f3b1cc07c979', N'05112517-4015000602', 11, N'STEP10', N'OK', N'I20251002: Input NoTelepon: 085812421931', CAST(N'2025-11-05T17:40:18.517' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'758ebdea-f442-42ad-9672-f597f07929cd', N'05112517-4038000959', 9, N'STEP08', N'OK', N'I20251004: PASS NO INPUT', CAST(N'2025-11-05T17:40:41.243' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'4099a2a6-d13f-40a9-be5b-f6b568ca68dc', N'05112517-4913000741', 12, N'STEP11', N'OK', N'I20251004: Submit success for user user', CAST(N'2025-11-05T17:49:19.923' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'de46de18-9e1d-4a41-b4af-f8aea7653c43', N'05112517-4812000595', 1, N'START', N'OK', N'Navigated to https://localhost:7138/Home/Index', CAST(N'2025-11-05T17:48:13.353' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'9b4d4cac-51ad-4e3f-982d-f8cac8c1e03a', N'05112517-4840000956', 6, N'STEP05', N'OK', N'I202508002: Input NPWP: 234567890', CAST(N'2025-11-05T17:48:42.570' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'394cff7e-dfe5-45bf-87b4-fbd37829fb6c', N'05112517-3929000489', 8, N'STEP07', N'OK', N'B202508003: PASS NO INPUT', CAST(N'2025-11-05T17:39:30.580' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'79ffdfaa-647a-4265-80af-fcad4b9b1560', N'05112517-4015000602', 2, N'STEP01', N'OK', N'I20251002: Input FlagBadanUsaha: I', CAST(N'2025-11-05T17:40:17.063' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'489f0d63-7268-4741-bc4f-fd1c81b30a0c', N'05112517-4913000741', 11, N'STEP10B', N'OK', N'I20251004: Input txtKodePos: 23455', CAST(N'2025-11-05T17:49:17.197' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'391c653d-7dbc-4ca9-a461-fd1ebf99d1bb', N'05112517-4830000870', 12, N'STEP11', N'OK', N'I202508001: Submit success for user user', CAST(N'2025-11-05T17:48:36.143' AS DateTime), N'user')
GO
INSERT [SeleniumLog] ([Id], [RegNo], [Sequence], [Step], [Status], [Message], [LogDate], [RunAsUser]) VALUES (N'63b21a7d-7a16-44a6-9b80-ff94c34a3e12', N'05112517-4840000956', 10, N'STEP09', N'OK', N'I202508002: Input Alamat: Jakarta', CAST(N'2025-11-05T17:48:42.960' AS DateTime), N'user')
GO
