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
INSERT [DataToInput] ([CIFNo], [Nama], [FlagBadanUsaha], [NPWP], [NoKTP], [JenisKelamin], [NoAkta], [Alamat], [NoTelepon], [Email]) VALUES (N'B202508003', N'PT Mayora Indah', N'B', N'1239102102', NULL, NULL, N'2020/1/xxxxx/1', N'Jakarta', N'0210000000', N'mayora@bank.co.id')
GO
INSERT [DataToInput] ([CIFNo], [Nama], [FlagBadanUsaha], [NPWP], [NoKTP], [JenisKelamin], [NoAkta], [Alamat], [NoTelepon], [Email]) VALUES (N'I202508001', N'Laili', N'I', N'123456789', N'3333123456789001', N'P', NULL, N'Jakarta', N'08111111', N'laili@kozaku.com')
GO
INSERT [DataToInput] ([CIFNo], [Nama], [FlagBadanUsaha], [NPWP], [NoKTP], [JenisKelamin], [NoAkta], [Alamat], [NoTelepon], [Email]) VALUES (N'I202508002', N'Binto', N'I', N'234567890', N'331111111111111', N'L', NULL, N'Jakarta', N'08121111', N'binto@kozaku.com')
GO
