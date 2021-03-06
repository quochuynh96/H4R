USE [master]
GO
/****** Object:  Database [Group14]    Script Date: 3/19/2019 8:59:42 AM ******/
CREATE DATABASE [Group14] ON  PRIMARY 
( NAME = N'Group14', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Group14.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Group14_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Group14_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Group14].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Group14] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Group14] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Group14] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Group14] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Group14] SET ARITHABORT OFF 
GO
ALTER DATABASE [Group14] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Group14] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Group14] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Group14] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Group14] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Group14] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Group14] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Group14] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Group14] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Group14] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Group14] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Group14] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Group14] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Group14] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Group14] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Group14] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Group14] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Group14] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Group14] SET  MULTI_USER 
GO
ALTER DATABASE [Group14] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Group14] SET DB_CHAINING OFF 
GO
USE [Group14]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 3/19/2019 8:59:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[AccountID] [varchar](20) NOT NULL,
	[Password] [varchar](20) NULL,
	[Role] [bit] NULL,
	[AccountStatusID] [int] NOT NULL,
 CONSTRAINT [PK_Account_1] PRIMARY KEY CLUSTERED 
(
	[AccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AccountStatus]    Script Date: 3/19/2019 8:59:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountStatus](
	[AccountStatusID] [int] NOT NULL,
	[Name] [nvarchar](30) NULL,
 CONSTRAINT [PK_AccountStatus] PRIMARY KEY CLUSTERED 
(
	[AccountStatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[City]    Script Date: 3/19/2019 8:59:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City](
	[CityID] [int] NOT NULL,
	[CityName] [nvarchar](50) NULL,
 CONSTRAINT [PK_City] PRIMARY KEY CLUSTERED 
(
	[CityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HouseForRent]    Script Date: 3/19/2019 8:59:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HouseForRent](
	[HouseID] [int] IDENTITY(1,1) NOT NULL,
	[Acreage] [int] NULL,
	[Price] [bigint] NULL,
	[CityID] [int] NULL,
	[TownshipID] [int] NULL,
	[InnerBathRoom] [bit] NULL,
	[Parking] [bit] NULL,
	[MaxPeople] [int] NULL,
	[StatusID] [int] NULL,
	[Note] [nvarchar](255) NULL,
	[AccountID] [varchar](20) NULL,
	[Address] [nvarchar](255) NULL,
	[IsHouse] [bit] NULL,
	[Kitchenshelf] [bit] NULL,
	[Mezzanine] [bit] NULL,
 CONSTRAINT [PK_HouseForRent] PRIMARY KEY CLUSTERED 
(
	[HouseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Image]    Script Date: 3/19/2019 8:59:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Image](
	[ImageID] [int] IDENTITY(1,1) NOT NULL,
	[Url] [nchar](100) NULL,
	[HouseID] [int] NOT NULL,
 CONSTRAINT [PK_Image] PRIMARY KEY CLUSTERED 
(
	[ImageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Info]    Script Date: 3/19/2019 8:59:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Info](
	[Name] [nvarchar](40) NULL,
	[Sex] [bit] NULL,
	[Birthday] [date] NULL,
	[Phone] [nchar](11) NULL,
	[Mail] [nchar](30) NULL,
	[AccountID] [varchar](20) NOT NULL,
	[CityID] [int] NULL,
	[TownshipID] [int] NULL,
 CONSTRAINT [PK_Info] PRIMARY KEY CLUSTERED 
(
	[AccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Messenger]    Script Date: 3/19/2019 8:59:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Messenger](
	[Receiver] [varchar](20) NOT NULL,
	[SentTime] [datetime] NOT NULL,
	[Message] [nvarchar](150) NULL,
	[IsRead] [bit] NULL,
 CONSTRAINT [PK_Messenger] PRIMARY KEY CLUSTERED 
(
	[Receiver] ASC,
	[SentTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Post]    Script Date: 3/19/2019 8:59:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Post](
	[PostID] [int] IDENTITY(1,1) NOT NULL,
	[PostTitle] [nvarchar](50) NULL,
	[PostView] [int] NULL,
	[PostDay] [datetime] NULL,
	[HouseID] [int] NULL,
	[Description] [nvarchar](200) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Post] PRIMARY KEY CLUSTERED 
(
	[PostID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Renter]    Script Date: 3/19/2019 8:59:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Renter](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RenterID] [varchar](10) NULL,
	[Name] [nvarchar](50) NULL,
	[Birthday] [date] NULL,
	[Sex] [bit] NULL,
	[Phone] [varchar](11) NULL,
	[Note] [nvarchar](255) NULL,
	[HouseID] [int] NULL,
	[RentDate] [date] NULL,
 CONSTRAINT [PK_Renter] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status]    Script Date: 3/19/2019 8:59:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[StatusID] [int] IDENTITY(1,1) NOT NULL,
	[StatusName] [nvarchar](10) NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Township]    Script Date: 3/19/2019 8:59:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Township](
	[TownshipID] [int] IDENTITY(1,1) NOT NULL,
	[TownshipName] [nvarchar](50) NULL,
	[CityID] [int] NULL,
	[LocationX] [float] NULL,
	[LocationY] [float] NULL,
 CONSTRAINT [PK_Township] PRIMARY KEY CLUSTERED 
(
	[TownshipID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[University]    Script Date: 3/19/2019 8:59:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[University](
	[UniversityID] [int] IDENTITY(1,1) NOT NULL,
	[UnisersityName] [nvarchar](100) NULL,
	[CityID] [int] NULL,
	[TownshipID] [int] NULL,
 CONSTRAINT [PK_University] PRIMARY KEY CLUSTERED 
(
	[UniversityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[SearchResult]    Script Date: 3/19/2019 8:59:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[SearchResult]
AS
SELECT DISTINCT 
                         dbo.Post.PostID, dbo.Post.PostTitle, dbo.Post.PostView, dbo.Post.PostDay, dbo.Post.Description, dbo.HouseForRent.Acreage, dbo.HouseForRent.Price, dbo.HouseForRent.CityID, dbo.HouseForRent.TownshipID, 
                         dbo.HouseForRent.InnerBathRoom, dbo.HouseForRent.Parking, dbo.HouseForRent.MaxPeople, dbo.HouseForRent.Note, dbo.HouseForRent.Address, dbo.HouseForRent.IsHouse, dbo.Info.Name, dbo.City.CityName, 
                         dbo.HouseForRent.Kitchenshelf, dbo.HouseForRent.Mezzanine, dbo.HouseForRent.HouseID, dbo.Info.Mail, dbo.Info.Phone, dbo.Info.Birthday, dbo.Info.Sex, dbo.Post.Status, dbo.Status.StatusID, dbo.Account.AccountID
FROM            dbo.HouseForRent INNER JOIN
                         dbo.Account ON dbo.Account.AccountID = dbo.HouseForRent.AccountID INNER JOIN
                         dbo.Info ON dbo.Info.AccountID = dbo.Account.AccountID INNER JOIN
                         dbo.City ON dbo.HouseForRent.CityID = dbo.City.CityID INNER JOIN
                         dbo.Status ON dbo.HouseForRent.StatusID = dbo.Status.StatusID INNER JOIN
                         dbo.Post ON dbo.Post.HouseID = dbo.HouseForRent.HouseID LEFT OUTER JOIN
                         dbo.Township ON dbo.HouseForRent.TownshipID = dbo.Township.TownshipID AND dbo.Info.TownshipID = dbo.Township.TownshipID AND dbo.City.CityID = dbo.Township.CityID LEFT OUTER JOIN
                         dbo.Image ON dbo.Image.HouseID = dbo.HouseForRent.HouseID

GO
INSERT [dbo].[Account] ([AccountID], [Password], [Role], [AccountStatusID]) VALUES (N'Admin', N'1234', 1, 1)
INSERT [dbo].[Account] ([AccountID], [Password], [Role], [AccountStatusID]) VALUES (N'HanhMT', N'hanh', 0, 1)
INSERT [dbo].[Account] ([AccountID], [Password], [Role], [AccountStatusID]) VALUES (N'HoaLT', N'hoa', 0, 2)
INSERT [dbo].[Account] ([AccountID], [Password], [Role], [AccountStatusID]) VALUES (N'HungNV', N'hung', 0, 3)
INSERT [dbo].[Account] ([AccountID], [Password], [Role], [AccountStatusID]) VALUES (N'HuyND', N'huy', 0, 1)
INSERT [dbo].[Account] ([AccountID], [Password], [Role], [AccountStatusID]) VALUES (N'HuynhTQ', N'huynh123', 1, 3)
INSERT [dbo].[Account] ([AccountID], [Password], [Role], [AccountStatusID]) VALUES (N'MaiNT', N'mai', 0, 2)
INSERT [dbo].[Account] ([AccountID], [Password], [Role], [AccountStatusID]) VALUES (N'NamLLD', N'nam', 0, 2)
INSERT [dbo].[Account] ([AccountID], [Password], [Role], [AccountStatusID]) VALUES (N'NhatNV', N'nhat', 0, 1)
INSERT [dbo].[Account] ([AccountID], [Password], [Role], [AccountStatusID]) VALUES (N'NhiLT', N'nhi', 0, 2)
INSERT [dbo].[Account] ([AccountID], [Password], [Role], [AccountStatusID]) VALUES (N'OanhNK', N'oanh', 0, 1)
INSERT [dbo].[Account] ([AccountID], [Password], [Role], [AccountStatusID]) VALUES (N'PhucTD5', N'matkhau0co', 0, 1)
INSERT [dbo].[Account] ([AccountID], [Password], [Role], [AccountStatusID]) VALUES (N'PhungLD', N'phung', 0, 3)
INSERT [dbo].[Account] ([AccountID], [Password], [Role], [AccountStatusID]) VALUES (N'QuangLD', N'123', 1, 2)
INSERT [dbo].[Account] ([AccountID], [Password], [Role], [AccountStatusID]) VALUES (N'QuangLD2', N'quang123', 1, 1)
INSERT [dbo].[Account] ([AccountID], [Password], [Role], [AccountStatusID]) VALUES (N'TaiNV12', N'123', 1, 1)
INSERT [dbo].[Account] ([AccountID], [Password], [Role], [AccountStatusID]) VALUES (N'TamTT13', N'tam123', 1, 1)
INSERT [dbo].[Account] ([AccountID], [Password], [Role], [AccountStatusID]) VALUES (N'TienNT', N'tien', 0, 2)
INSERT [dbo].[Account] ([AccountID], [Password], [Role], [AccountStatusID]) VALUES (N'TTT', N'123', 1, 1)
INSERT [dbo].[AccountStatus] ([AccountStatusID], [Name]) VALUES (1, N'Đã được duyệt')
INSERT [dbo].[AccountStatus] ([AccountStatusID], [Name]) VALUES (2, N'Chưa phê duyệt')
INSERT [dbo].[AccountStatus] ([AccountStatusID], [Name]) VALUES (3, N'Bị khóa')
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (29, N'Hà Nội')
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (36, N'Thanh Hoá')
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (37, N'Nghệ An')
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (38, N'Hà Tĩnh')
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (43, N'Đà Nẵng')
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (55, N'Hồ Chí Minh')
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (73, N'Quảng Bình')
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (74, N'Quảng Trị')
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (75, N'Thừa Thiên Huế')
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (76, N'Quảng Ngãi')
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (77, N'Nha Trang')
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (78, N'Phú Yên')
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (79, N'Khánh Hòa')
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (92, N'Quảng Nam')
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (93, N'Bình Dương')
SET IDENTITY_INSERT [dbo].[HouseForRent] ON 

INSERT [dbo].[HouseForRent] ([HouseID], [Acreage], [Price], [CityID], [TownshipID], [InnerBathRoom], [Parking], [MaxPeople], [StatusID], [Note], [AccountID], [Address], [IsHouse], [Kitchenshelf], [Mezzanine]) VALUES (5, 32, 4000000, 43, 1, 1, 1, 5, 1, N'10 Võ Chí Công, Ngũ Hành Sơn, Đà Nẵng', N'TaiNV12', N'10 Võ Chí Công, Ngũ Hành Sơn, Đà Nẵng', 1, 1, 1)
INSERT [dbo].[HouseForRent] ([HouseID], [Acreage], [Price], [CityID], [TownshipID], [InnerBathRoom], [Parking], [MaxPeople], [StatusID], [Note], [AccountID], [Address], [IsHouse], [Kitchenshelf], [Mezzanine]) VALUES (6, 60, 7000000, 43, 1, 1, 1, 6, 1, N'45 Trần Đại Nghĩa, Ngũ Hành Sơn, Đà Nẵng', N'TamTT13', N'45 Trần Đại Nghĩa, Ngũ Hành Sơn, Đà Nẵng', 1, 1, 1)
INSERT [dbo].[HouseForRent] ([HouseID], [Acreage], [Price], [CityID], [TownshipID], [InnerBathRoom], [Parking], [MaxPeople], [StatusID], [Note], [AccountID], [Address], [IsHouse], [Kitchenshelf], [Mezzanine]) VALUES (7, 40, 3000000, 43, 1, 0, 1, 4, 3, N'05 Lê Lợi', N'TaiNV12', N'05 Lê Lợi', 1, 1, 1)
INSERT [dbo].[HouseForRent] ([HouseID], [Acreage], [Price], [CityID], [TownshipID], [InnerBathRoom], [Parking], [MaxPeople], [StatusID], [Note], [AccountID], [Address], [IsHouse], [Kitchenshelf], [Mezzanine]) VALUES (8, 30, 1500000, 43, 1, 1, 0, 2, 1, N'32 Trần Hưng Đạo', N'TaiNV12', N'72 Trần Hưng Đạo', 1, 1, 1)
INSERT [dbo].[HouseForRent] ([HouseID], [Acreage], [Price], [CityID], [TownshipID], [InnerBathRoom], [Parking], [MaxPeople], [StatusID], [Note], [AccountID], [Address], [IsHouse], [Kitchenshelf], [Mezzanine]) VALUES (9, 20, 2200000, 43, 1, 1, 1, 2, 1, N'45 Trần Hưng Đạo', N'QuangLD2', N'322 Trần Hưng Đạo', 1, 0, 1)
INSERT [dbo].[HouseForRent] ([HouseID], [Acreage], [Price], [CityID], [TownshipID], [InnerBathRoom], [Parking], [MaxPeople], [StatusID], [Note], [AccountID], [Address], [IsHouse], [Kitchenshelf], [Mezzanine]) VALUES (10, 50, 3200000, 43, 1, 1, 1, 4, 3, N'132 Trần Hưng Đạo', N'TaiNV12', N'31 Trần Hưng Đạo', 1, 1, 0)
INSERT [dbo].[HouseForRent] ([HouseID], [Acreage], [Price], [CityID], [TownshipID], [InnerBathRoom], [Parking], [MaxPeople], [StatusID], [Note], [AccountID], [Address], [IsHouse], [Kitchenshelf], [Mezzanine]) VALUES (11, 32, 2500000, 43, 1, 1, 1, 3, 1, N'332 Trần Hưng Đạo', N'QuangLD2', N'32 Trần Hưng Đạo', 0, 1, 1)
INSERT [dbo].[HouseForRent] ([HouseID], [Acreage], [Price], [CityID], [TownshipID], [InnerBathRoom], [Parking], [MaxPeople], [StatusID], [Note], [AccountID], [Address], [IsHouse], [Kitchenshelf], [Mezzanine]) VALUES (12, 20, 1000000, 43, 1, 0, 1, 2, 1, N'432 Trần Hưng Đạo', N'TaiNV12', N'326Trần Hưng Đạo', 0, 1, 1)
INSERT [dbo].[HouseForRent] ([HouseID], [Acreage], [Price], [CityID], [TownshipID], [InnerBathRoom], [Parking], [MaxPeople], [StatusID], [Note], [AccountID], [Address], [IsHouse], [Kitchenshelf], [Mezzanine]) VALUES (13, 25, 2000000, 43, 1, 1, 0, 2, 3, N'289 Trần Hưng Đạo', N'QuangLD2', N'332 Trần Hưng Đạo', 0, 1, 1)
INSERT [dbo].[HouseForRent] ([HouseID], [Acreage], [Price], [CityID], [TownshipID], [InnerBathRoom], [Parking], [MaxPeople], [StatusID], [Note], [AccountID], [Address], [IsHouse], [Kitchenshelf], [Mezzanine]) VALUES (14, 30, 2000000, 43, 1, 1, 1, 3, 1, N'532 - Nguyễn Khoa Chiêm', N'QuangLD2', N'322 Trần Hưng Đạo', 0, 0, 1)
INSERT [dbo].[HouseForRent] ([HouseID], [Acreage], [Price], [CityID], [TownshipID], [InnerBathRoom], [Parking], [MaxPeople], [StatusID], [Note], [AccountID], [Address], [IsHouse], [Kitchenshelf], [Mezzanine]) VALUES (18, 25, 3000000, 75, 21, 1, 1, 3, 3, N'382 Trần Hưng Đạo', N'TienNT', N'32 - Nguyễn Khoa Chiêm', 0, 1, 1)
INSERT [dbo].[HouseForRent] ([HouseID], [Acreage], [Price], [CityID], [TownshipID], [InnerBathRoom], [Parking], [MaxPeople], [StatusID], [Note], [AccountID], [Address], [IsHouse], [Kitchenshelf], [Mezzanine]) VALUES (19, 12, 1500000, 75, 24, 1, 0, 2, 1, N'52 - Trần Duy Hưng', N'OanhNK', N'53 - Trần Duy Hưng', 0, 1, 1)
INSERT [dbo].[HouseForRent] ([HouseID], [Acreage], [Price], [CityID], [TownshipID], [InnerBathRoom], [Parking], [MaxPeople], [StatusID], [Note], [AccountID], [Address], [IsHouse], [Kitchenshelf], [Mezzanine]) VALUES (20, 20, 1700000, 75, 26, 1, 1, 3, 3, N'113 - Trần Duy Hưng', N'HanhMT', N'12 - Phan Đăng Lưu', 0, 0, 1)
INSERT [dbo].[HouseForRent] ([HouseID], [Acreage], [Price], [CityID], [TownshipID], [InnerBathRoom], [Parking], [MaxPeople], [StatusID], [Note], [AccountID], [Address], [IsHouse], [Kitchenshelf], [Mezzanine]) VALUES (21, 20, 2000000, 75, 26, 1, 1, 4, 1, N'12 - Trần Phú ', N'NhiLT', N'55 - Nguyễn Viết Tiến', 0, 1, 0)
INSERT [dbo].[HouseForRent] ([HouseID], [Acreage], [Price], [CityID], [TownshipID], [InnerBathRoom], [Parking], [MaxPeople], [StatusID], [Note], [AccountID], [Address], [IsHouse], [Kitchenshelf], [Mezzanine]) VALUES (22, 30, 3400000, 75, 26, 1, 1, 5, 1, N'250 - Trần Phú ', N'TamTT13', N'12 - Trần Phú ', 1, 0, 1)
INSERT [dbo].[HouseForRent] ([HouseID], [Acreage], [Price], [CityID], [TownshipID], [InnerBathRoom], [Parking], [MaxPeople], [StatusID], [Note], [AccountID], [Address], [IsHouse], [Kitchenshelf], [Mezzanine]) VALUES (23, 20, 1200000, 75, 26, 1, 1, 3, 1, N'23 - Nguyễn Lộ Trạch', N'HuynhTQ', N'23 - Nguyễn Lộ Trạch', 0, 1, 1)
INSERT [dbo].[HouseForRent] ([HouseID], [Acreage], [Price], [CityID], [TownshipID], [InnerBathRoom], [Parking], [MaxPeople], [StatusID], [Note], [AccountID], [Address], [IsHouse], [Kitchenshelf], [Mezzanine]) VALUES (24, 32, 7000000, 75, 25, 0, 1, 4, 2, N'123 - Nguyễn Lộ Trạch', N'HuynhTQ', N'123 - Nguyễn Lộ Trạch', 1, 1, 1)
INSERT [dbo].[HouseForRent] ([HouseID], [Acreage], [Price], [CityID], [TownshipID], [InnerBathRoom], [Parking], [MaxPeople], [StatusID], [Note], [AccountID], [Address], [IsHouse], [Kitchenshelf], [Mezzanine]) VALUES (25, 40, 2000000, 75, 25, 1, 0, 5, 1, N'55- Trần Phú ', N'NhiLT', N'55 - Nguyễn Viết Tiến', 1, 1, 1)
INSERT [dbo].[HouseForRent] ([HouseID], [Acreage], [Price], [CityID], [TownshipID], [InnerBathRoom], [Parking], [MaxPeople], [StatusID], [Note], [AccountID], [Address], [IsHouse], [Kitchenshelf], [Mezzanine]) VALUES (26, 50, 2000000, 75, 23, 1, 1, 4, 1, N'25- Trần Phú ', N'QuangLD2', N'25 - Nguyễn Viết Tiến', 1, 0, 1)
INSERT [dbo].[HouseForRent] ([HouseID], [Acreage], [Price], [CityID], [TownshipID], [InnerBathRoom], [Parking], [MaxPeople], [StatusID], [Note], [AccountID], [Address], [IsHouse], [Kitchenshelf], [Mezzanine]) VALUES (27, 20, 2000000, 75, 21, 1, 1, 5, 3, N'382 Lương Văn Can', N'HanhMT', N'382 Lương Văn Can', 1, 1, 0)
INSERT [dbo].[HouseForRent] ([HouseID], [Acreage], [Price], [CityID], [TownshipID], [InnerBathRoom], [Parking], [MaxPeople], [StatusID], [Note], [AccountID], [Address], [IsHouse], [Kitchenshelf], [Mezzanine]) VALUES (28, 30, 2000000, 73, 11, 1, 1, 6, 1, N'382 Trần Hưng Đạo', N'HanhMT', N'382 Nguyễn Lộ Trạch', 1, 1, 0)
INSERT [dbo].[HouseForRent] ([HouseID], [Acreage], [Price], [CityID], [TownshipID], [InnerBathRoom], [Parking], [MaxPeople], [StatusID], [Note], [AccountID], [Address], [IsHouse], [Kitchenshelf], [Mezzanine]) VALUES (29, 45, 2000000, 73, 11, 1, 1, 5, 1, N'250 - Trần Phú ', N'HanhMT', N'250 - Trần Phú ', 1, 0, 0)
INSERT [dbo].[HouseForRent] ([HouseID], [Acreage], [Price], [CityID], [TownshipID], [InnerBathRoom], [Parking], [MaxPeople], [StatusID], [Note], [AccountID], [Address], [IsHouse], [Kitchenshelf], [Mezzanine]) VALUES (30, 30, 4000000, 73, 11, 0, 0, 6, 1, N'12 - Trần Phú ', N'HuynhTQ', N'382 Nguyễn Lộ Trạch', 0, 1, 1)
INSERT [dbo].[HouseForRent] ([HouseID], [Acreage], [Price], [CityID], [TownshipID], [InnerBathRoom], [Parking], [MaxPeople], [StatusID], [Note], [AccountID], [Address], [IsHouse], [Kitchenshelf], [Mezzanine]) VALUES (31, 35, 4300000, 73, 15, 0, 1, 5, 1, N'532 - Nguyễn Khoa Chiêm', N'NhiLT', N'12 - Phan Đăng Lưu', 0, 1, 0)
INSERT [dbo].[HouseForRent] ([HouseID], [Acreage], [Price], [CityID], [TownshipID], [InnerBathRoom], [Parking], [MaxPeople], [StatusID], [Note], [AccountID], [Address], [IsHouse], [Kitchenshelf], [Mezzanine]) VALUES (32, 30, 2500000, 73, 15, 1, 1, 6, 1, N'10 Võ Chí Công, Ngũ Hành Sơn', N'HuynhTQ', N'10 Võ Chí Công, Ngũ Hành Sơn', 0, 0, 0)
INSERT [dbo].[HouseForRent] ([HouseID], [Acreage], [Price], [CityID], [TownshipID], [InnerBathRoom], [Parking], [MaxPeople], [StatusID], [Note], [AccountID], [Address], [IsHouse], [Kitchenshelf], [Mezzanine]) VALUES (33, 40, 4800000, 92, 28, 1, 1, 8, 1, N'382 Lương Văn Can', N'HuynhTQ', N'382 Lương Văn Can', 0, 1, 1)
INSERT [dbo].[HouseForRent] ([HouseID], [Acreage], [Price], [CityID], [TownshipID], [InnerBathRoom], [Parking], [MaxPeople], [StatusID], [Note], [AccountID], [Address], [IsHouse], [Kitchenshelf], [Mezzanine]) VALUES (34, 36, 3600000, 92, 28, 0, 0, 6, 3, N'382 Trần Hưng Đạo', N'QuangLD2', N'382 Trần Hưng Đạo', 1, 1, 1)
INSERT [dbo].[HouseForRent] ([HouseID], [Acreage], [Price], [CityID], [TownshipID], [InnerBathRoom], [Parking], [MaxPeople], [StatusID], [Note], [AccountID], [Address], [IsHouse], [Kitchenshelf], [Mezzanine]) VALUES (35, 20, 1500000, 92, 29, 1, 1, 3, 1, N'25 Hồ Đắc Di', N'PhucTD5', N'25 Hồ Đắc Di', 1, 0, 0)
INSERT [dbo].[HouseForRent] ([HouseID], [Acreage], [Price], [CityID], [TownshipID], [InnerBathRoom], [Parking], [MaxPeople], [StatusID], [Note], [AccountID], [Address], [IsHouse], [Kitchenshelf], [Mezzanine]) VALUES (36, 20, 2000000, 92, 29, 1, 1, 4, 1, N'11 Hồ Đắc Di - A. Hùng', N'HanhMT', N'11 Hồ Đắc Di', 0, 0, 0)
INSERT [dbo].[HouseForRent] ([HouseID], [Acreage], [Price], [CityID], [TownshipID], [InnerBathRoom], [Parking], [MaxPeople], [StatusID], [Note], [AccountID], [Address], [IsHouse], [Kitchenshelf], [Mezzanine]) VALUES (37, 20, 2000000, 92, 35, 0, 0, 4, 1, N'43 Hồ Đắc Di - A. Hùng', N'HanhMT', N'43 Hồ Đắc Di', 0, 1, 1)
INSERT [dbo].[HouseForRent] ([HouseID], [Acreage], [Price], [CityID], [TownshipID], [InnerBathRoom], [Parking], [MaxPeople], [StatusID], [Note], [AccountID], [Address], [IsHouse], [Kitchenshelf], [Mezzanine]) VALUES (39, 30, 2200000, 43, 1, 1, 1, 3, 3, N'532 - Nguyễn Khoa Chiêm', N'HuynhTQ', N'532 Nguyễn Khoa Chiêm', 1, 0, 0)
INSERT [dbo].[HouseForRent] ([HouseID], [Acreage], [Price], [CityID], [TownshipID], [InnerBathRoom], [Parking], [MaxPeople], [StatusID], [Note], [AccountID], [Address], [IsHouse], [Kitchenshelf], [Mezzanine]) VALUES (42, 23, 2500000, 43, 1, 0, 0, 2, 3, N'32 Mai An Tiêm', N'QuangLD2', N'32 Mai An Tiêm', 1, 1, 1)
INSERT [dbo].[HouseForRent] ([HouseID], [Acreage], [Price], [CityID], [TownshipID], [InnerBathRoom], [Parking], [MaxPeople], [StatusID], [Note], [AccountID], [Address], [IsHouse], [Kitchenshelf], [Mezzanine]) VALUES (43, 21, 2000000, 43, 1, 1, 1, 3, 3, N'54 Võ Thị Sáu', N'HuynhTQ', N'54 Võ Thị Sáu', 0, 1, 0)
INSERT [dbo].[HouseForRent] ([HouseID], [Acreage], [Price], [CityID], [TownshipID], [InnerBathRoom], [Parking], [MaxPeople], [StatusID], [Note], [AccountID], [Address], [IsHouse], [Kitchenshelf], [Mezzanine]) VALUES (44, 33, 3000000, 43, 1, 1, 1, 3, 3, N'32 Huỳnh Thúc Kháng', N'HuynhTQ', N'32 Huỳnh Thúc Kháng', 0, 0, 0)
INSERT [dbo].[HouseForRent] ([HouseID], [Acreage], [Price], [CityID], [TownshipID], [InnerBathRoom], [Parking], [MaxPeople], [StatusID], [Note], [AccountID], [Address], [IsHouse], [Kitchenshelf], [Mezzanine]) VALUES (45, 30, 2000000, 43, 1, 0, 0, 3, 3, N'32 Ông Ích Khiêm', N'QuangLD2', N'32 Ông Ích Khiêm', 0, 1, 1)
INSERT [dbo].[HouseForRent] ([HouseID], [Acreage], [Price], [CityID], [TownshipID], [InnerBathRoom], [Parking], [MaxPeople], [StatusID], [Note], [AccountID], [Address], [IsHouse], [Kitchenshelf], [Mezzanine]) VALUES (46, 43, 5000000, 43, 5, 1, 1, 6, 1, N'45 Nguyễn Minh Khai', N'TamTT13', N'45 Nguyễn Minh Khai', 1, 1, 1)
INSERT [dbo].[HouseForRent] ([HouseID], [Acreage], [Price], [CityID], [TownshipID], [InnerBathRoom], [Parking], [MaxPeople], [StatusID], [Note], [AccountID], [Address], [IsHouse], [Kitchenshelf], [Mezzanine]) VALUES (47, 22, 3000000, 43, 5, 1, 1, 6, 1, N'54 Phan Đăng Lưu', N'NhiLT', N'54 Phan Đăng Lưu', 1, 1, 1)
INSERT [dbo].[HouseForRent] ([HouseID], [Acreage], [Price], [CityID], [TownshipID], [InnerBathRoom], [Parking], [MaxPeople], [StatusID], [Note], [AccountID], [Address], [IsHouse], [Kitchenshelf], [Mezzanine]) VALUES (48, 23, 3000000, 43, 5, 1, 1, 3, 1, N'12 Phan Đăng Lưu', N'NhiLT', N'12 Phan Đăng Lưu', 1, 1, 1)
INSERT [dbo].[HouseForRent] ([HouseID], [Acreage], [Price], [CityID], [TownshipID], [InnerBathRoom], [Parking], [MaxPeople], [StatusID], [Note], [AccountID], [Address], [IsHouse], [Kitchenshelf], [Mezzanine]) VALUES (49, 12, 14000000, 43, 5, 1, 1, 5, 1, N'123 Nguyễn Bỉnh Khiêm', N'TamTT13', N'123 Nguyễn Bỉnh Khiêm', 1, 1, 1)
INSERT [dbo].[HouseForRent] ([HouseID], [Acreage], [Price], [CityID], [TownshipID], [InnerBathRoom], [Parking], [MaxPeople], [StatusID], [Note], [AccountID], [Address], [IsHouse], [Kitchenshelf], [Mezzanine]) VALUES (50, 22, 2000000, 43, 6, 1, 1, 6, 1, N'77 Võ Thị Sáu', N'TamTT13', N'77 Võ Thị Sáu', 0, 1, 1)
SET IDENTITY_INSERT [dbo].[HouseForRent] OFF
SET IDENTITY_INSERT [dbo].[Image] ON 

INSERT [dbo].[Image] ([ImageID], [Url], [HouseID]) VALUES (1, N'1.jpg                                                                                               ', 5)
INSERT [dbo].[Image] ([ImageID], [Url], [HouseID]) VALUES (2, N'2.jpg                                                                                               ', 6)
INSERT [dbo].[Image] ([ImageID], [Url], [HouseID]) VALUES (6, N'3.jpg                                                                                               ', 7)
INSERT [dbo].[Image] ([ImageID], [Url], [HouseID]) VALUES (7, N'4.jpg                                                                                               ', 8)
INSERT [dbo].[Image] ([ImageID], [Url], [HouseID]) VALUES (8, N'5.jpg                                                                                               ', 9)
INSERT [dbo].[Image] ([ImageID], [Url], [HouseID]) VALUES (9, N'6.jpg                                                                                               ', 10)
INSERT [dbo].[Image] ([ImageID], [Url], [HouseID]) VALUES (10, N'7.jpg                                                                                               ', 11)
INSERT [dbo].[Image] ([ImageID], [Url], [HouseID]) VALUES (11, N'8.jpg                                                                                               ', 12)
INSERT [dbo].[Image] ([ImageID], [Url], [HouseID]) VALUES (12, N'9.jpg                                                                                               ', 13)
INSERT [dbo].[Image] ([ImageID], [Url], [HouseID]) VALUES (13, N'10.jpg                                                                                              ', 14)
INSERT [dbo].[Image] ([ImageID], [Url], [HouseID]) VALUES (18, N'11.jpg                                                                                              ', 18)
INSERT [dbo].[Image] ([ImageID], [Url], [HouseID]) VALUES (19, N'12.jpg                                                                                              ', 19)
INSERT [dbo].[Image] ([ImageID], [Url], [HouseID]) VALUES (20, N'13.jpg                                                                                              ', 20)
INSERT [dbo].[Image] ([ImageID], [Url], [HouseID]) VALUES (21, N'14.jpg                                                                                              ', 21)
INSERT [dbo].[Image] ([ImageID], [Url], [HouseID]) VALUES (22, N'15.jpg                                                                                              ', 22)
INSERT [dbo].[Image] ([ImageID], [Url], [HouseID]) VALUES (23, N'16.jpg                                                                                              ', 23)
INSERT [dbo].[Image] ([ImageID], [Url], [HouseID]) VALUES (24, N'17.jpg                                                                                              ', 24)
INSERT [dbo].[Image] ([ImageID], [Url], [HouseID]) VALUES (25, N'18.jpg                                                                                              ', 25)
INSERT [dbo].[Image] ([ImageID], [Url], [HouseID]) VALUES (26, N'19.jpg                                                                                              ', 26)
INSERT [dbo].[Image] ([ImageID], [Url], [HouseID]) VALUES (27, N'21.jpg                                                                                              ', 27)
INSERT [dbo].[Image] ([ImageID], [Url], [HouseID]) VALUES (28, N'21.jpg                                                                                              ', 28)
INSERT [dbo].[Image] ([ImageID], [Url], [HouseID]) VALUES (29, N'22.jpg                                                                                              ', 29)
INSERT [dbo].[Image] ([ImageID], [Url], [HouseID]) VALUES (33, N'23.jpg                                                                                              ', 30)
INSERT [dbo].[Image] ([ImageID], [Url], [HouseID]) VALUES (34, N'24.jpg                                                                                              ', 31)
INSERT [dbo].[Image] ([ImageID], [Url], [HouseID]) VALUES (35, N'25.jpg                                                                                              ', 32)
INSERT [dbo].[Image] ([ImageID], [Url], [HouseID]) VALUES (36, N'26.jpg                                                                                              ', 33)
INSERT [dbo].[Image] ([ImageID], [Url], [HouseID]) VALUES (37, N'27.jpg                                                                                              ', 34)
INSERT [dbo].[Image] ([ImageID], [Url], [HouseID]) VALUES (38, N'28.jpg                                                                                              ', 28)
INSERT [dbo].[Image] ([ImageID], [Url], [HouseID]) VALUES (39, N'29.jpg                                                                                              ', 29)
INSERT [dbo].[Image] ([ImageID], [Url], [HouseID]) VALUES (40, N'30.jpg                                                                                              ', 30)
INSERT [dbo].[Image] ([ImageID], [Url], [HouseID]) VALUES (41, N'31.jpg                                                                                              ', 31)
INSERT [dbo].[Image] ([ImageID], [Url], [HouseID]) VALUES (42, N'32.jpg                                                                                              ', 32)
INSERT [dbo].[Image] ([ImageID], [Url], [HouseID]) VALUES (43, N'33.jpg                                                                                              ', 33)
INSERT [dbo].[Image] ([ImageID], [Url], [HouseID]) VALUES (44, N'34.jpg                                                                                              ', 34)
INSERT [dbo].[Image] ([ImageID], [Url], [HouseID]) VALUES (45, N'35.jpg                                                                                              ', 20)
INSERT [dbo].[Image] ([ImageID], [Url], [HouseID]) VALUES (46, N'36.jpg                                                                                              ', 21)
INSERT [dbo].[Image] ([ImageID], [Url], [HouseID]) VALUES (47, N'37.jpg                                                                                              ', 22)
INSERT [dbo].[Image] ([ImageID], [Url], [HouseID]) VALUES (48, N'38.jpg                                                                                              ', 23)
INSERT [dbo].[Image] ([ImageID], [Url], [HouseID]) VALUES (49, N'39.jpg                                                                                              ', 24)
INSERT [dbo].[Image] ([ImageID], [Url], [HouseID]) VALUES (50, N'40.jpg                                                                                              ', 25)
INSERT [dbo].[Image] ([ImageID], [Url], [HouseID]) VALUES (51, N'41.jpg                                                                                              ', 26)
INSERT [dbo].[Image] ([ImageID], [Url], [HouseID]) VALUES (52, N'42.jpg                                                                                              ', 27)
INSERT [dbo].[Image] ([ImageID], [Url], [HouseID]) VALUES (53, N'43.jpg                                                                                              ', 28)
INSERT [dbo].[Image] ([ImageID], [Url], [HouseID]) VALUES (54, N'44.jpg                                                                                              ', 29)
INSERT [dbo].[Image] ([ImageID], [Url], [HouseID]) VALUES (55, N'45.jpg                                                                                              ', 30)
INSERT [dbo].[Image] ([ImageID], [Url], [HouseID]) VALUES (56, N'46.jpg                                                                                              ', 31)
INSERT [dbo].[Image] ([ImageID], [Url], [HouseID]) VALUES (57, N'47.jpg                                                                                              ', 32)
INSERT [dbo].[Image] ([ImageID], [Url], [HouseID]) VALUES (58, N'48.jpg                                                                                              ', 33)
INSERT [dbo].[Image] ([ImageID], [Url], [HouseID]) VALUES (59, N'49.jpg                                                                                              ', 34)
INSERT [dbo].[Image] ([ImageID], [Url], [HouseID]) VALUES (60, N'50.jpg                                                                                              ', 25)
INSERT [dbo].[Image] ([ImageID], [Url], [HouseID]) VALUES (61, N'51.jpg                                                                                              ', 26)
INSERT [dbo].[Image] ([ImageID], [Url], [HouseID]) VALUES (62, N'52.jpg                                                                                              ', 27)
INSERT [dbo].[Image] ([ImageID], [Url], [HouseID]) VALUES (63, N'53.jpg                                                                                              ', 28)
INSERT [dbo].[Image] ([ImageID], [Url], [HouseID]) VALUES (64, N'54.jpg                                                                                              ', 29)
INSERT [dbo].[Image] ([ImageID], [Url], [HouseID]) VALUES (65, N'55.jpg                                                                                              ', 30)
INSERT [dbo].[Image] ([ImageID], [Url], [HouseID]) VALUES (66, N'56.jpg                                                                                              ', 31)
INSERT [dbo].[Image] ([ImageID], [Url], [HouseID]) VALUES (67, N'57.jpg                                                                                              ', 32)
INSERT [dbo].[Image] ([ImageID], [Url], [HouseID]) VALUES (68, N'58.jpg                                                                                              ', 33)
INSERT [dbo].[Image] ([ImageID], [Url], [HouseID]) VALUES (69, N'59.jpg                                                                                              ', 34)
INSERT [dbo].[Image] ([ImageID], [Url], [HouseID]) VALUES (70, N'60.jpg                                                                                              ', 10)
INSERT [dbo].[Image] ([ImageID], [Url], [HouseID]) VALUES (71, N'61.jpg                                                                                              ', 11)
INSERT [dbo].[Image] ([ImageID], [Url], [HouseID]) VALUES (72, N'1.jpg                                                                                               ', 12)
INSERT [dbo].[Image] ([ImageID], [Url], [HouseID]) VALUES (73, N'73.jpg                                                                                              ', 35)
INSERT [dbo].[Image] ([ImageID], [Url], [HouseID]) VALUES (74, N'74.jpg                                                                                              ', 35)
INSERT [dbo].[Image] ([ImageID], [Url], [HouseID]) VALUES (75, N'57.jpg                                                                                              ', 46)
INSERT [dbo].[Image] ([ImageID], [Url], [HouseID]) VALUES (76, N'55.jpg                                                                                              ', 47)
INSERT [dbo].[Image] ([ImageID], [Url], [HouseID]) VALUES (77, N'47.jpg                                                                                              ', 49)
INSERT [dbo].[Image] ([ImageID], [Url], [HouseID]) VALUES (78, N'12.jpg                                                                                              ', 36)
INSERT [dbo].[Image] ([ImageID], [Url], [HouseID]) VALUES (79, N'13.jpg                                                                                              ', 36)
INSERT [dbo].[Image] ([ImageID], [Url], [HouseID]) VALUES (80, N'21.jpg                                                                                              ', 37)
INSERT [dbo].[Image] ([ImageID], [Url], [HouseID]) VALUES (81, N'21.jpg                                                                                              ', 37)
INSERT [dbo].[Image] ([ImageID], [Url], [HouseID]) VALUES (82, N'31.jpg                                                                                              ', 39)
INSERT [dbo].[Image] ([ImageID], [Url], [HouseID]) VALUES (83, N'32.jpg                                                                                              ', 39)
INSERT [dbo].[Image] ([ImageID], [Url], [HouseID]) VALUES (84, N'33.jpg                                                                                              ', 42)
INSERT [dbo].[Image] ([ImageID], [Url], [HouseID]) VALUES (85, N'35.jpg                                                                                              ', 43)
INSERT [dbo].[Image] ([ImageID], [Url], [HouseID]) VALUES (86, N'36.jpg                                                                                              ', 43)
INSERT [dbo].[Image] ([ImageID], [Url], [HouseID]) VALUES (87, N'38.jpg                                                                                              ', 44)
INSERT [dbo].[Image] ([ImageID], [Url], [HouseID]) VALUES (88, N'39.jpg                                                                                              ', 44)
INSERT [dbo].[Image] ([ImageID], [Url], [HouseID]) VALUES (89, N'50.jpg                                                                                              ', 45)
INSERT [dbo].[Image] ([ImageID], [Url], [HouseID]) VALUES (90, N'51.jpg                                                                                              ', 45)
INSERT [dbo].[Image] ([ImageID], [Url], [HouseID]) VALUES (91, N'42.jpg                                                                                              ', 48)
INSERT [dbo].[Image] ([ImageID], [Url], [HouseID]) VALUES (92, N'43.jpg                                                                                              ', 48)
INSERT [dbo].[Image] ([ImageID], [Url], [HouseID]) VALUES (93, N'55.jpg                                                                                              ', 50)
INSERT [dbo].[Image] ([ImageID], [Url], [HouseID]) VALUES (94, N'56.jpg                                                                                              ', 50)
SET IDENTITY_INSERT [dbo].[Image] OFF
INSERT [dbo].[Info] ([Name], [Sex], [Birthday], [Phone], [Mail], [AccountID], [CityID], [TownshipID]) VALUES (N'ABCD', 1, CAST(N'1997-01-01' AS Date), N'0946901161 ', N'Admin@gmail.com               ', N'Admin', 75, 21)
INSERT [dbo].[Info] ([Name], [Sex], [Birthday], [Phone], [Mail], [AccountID], [CityID], [TownshipID]) VALUES (N'Mai Thi Hạnh', 0, CAST(N'1999-02-01' AS Date), N'0912241244 ', N'hanhmt@gmail.com              ', N'HanhMT', 43, 6)
INSERT [dbo].[Info] ([Name], [Sex], [Birthday], [Phone], [Mail], [AccountID], [CityID], [TownshipID]) VALUES (N'Lê Thị Hoa', 0, CAST(N'1991-04-06' AS Date), N'0092182838 ', N'hoalt@gmail.com               ', N'HoaLT', 74, 18)
INSERT [dbo].[Info] ([Name], [Sex], [Birthday], [Phone], [Mail], [AccountID], [CityID], [TownshipID]) VALUES (N'Nguyễn Văn Hùng', 1, CAST(N'1899-06-03' AS Date), N'0123412332 ', N'hungnv@gmail.com              ', N'HungNV', 92, 35)
INSERT [dbo].[Info] ([Name], [Sex], [Birthday], [Phone], [Mail], [AccountID], [CityID], [TownshipID]) VALUES (N'Nguyễn Đức Huy', 1, CAST(N'1888-11-04' AS Date), N'0703323312 ', N'huynd@gmail.com               ', N'HuyND', 29, 46)
INSERT [dbo].[Info] ([Name], [Sex], [Birthday], [Phone], [Mail], [AccountID], [CityID], [TownshipID]) VALUES (N'Trương Quốc Huynh', 1, CAST(N'1996-01-01' AS Date), N'0911111111 ', N'HuynhTQ@gmail.com             ', N'HuynhTQ', 73, 10)
INSERT [dbo].[Info] ([Name], [Sex], [Birthday], [Phone], [Mail], [AccountID], [CityID], [TownshipID]) VALUES (N'Nguyễn Thị Mai', 0, CAST(N'1888-05-01' AS Date), N'0921231234 ', N'hoant@gmail.com               ', N'MaiNT', 38, 132)
INSERT [dbo].[Info] ([Name], [Sex], [Birthday], [Phone], [Mail], [AccountID], [CityID], [TownshipID]) VALUES (N'Lê Long Đình Nam', 1, CAST(N'1993-07-12' AS Date), N'0612445535 ', N'namlld@gmail.com              ', N'NamLLD', 55, 92)
INSERT [dbo].[Info] ([Name], [Sex], [Birthday], [Phone], [Mail], [AccountID], [CityID], [TownshipID]) VALUES (N'Nguyễn Văn Nhật', 1, CAST(N'1996-11-24' AS Date), N'0921412421 ', N'nhatnv@gmail.com              ', N'NhatNV', 76, 107)
INSERT [dbo].[Info] ([Name], [Sex], [Birthday], [Phone], [Mail], [AccountID], [CityID], [TownshipID]) VALUES (N'Lê Thị Nhi', 0, CAST(N'1992-12-06' AS Date), N'0931231312 ', N'nhilt@gmail.com               ', N'NhiLT', 79, 115)
INSERT [dbo].[Info] ([Name], [Sex], [Birthday], [Phone], [Mail], [AccountID], [CityID], [TownshipID]) VALUES (N'Nguyễn Khắc Oanh', 0, CAST(N'1987-01-30' AS Date), N'0997879867 ', N'oanhnk@gmail.com              ', N'OanhNK', 77, 120)
INSERT [dbo].[Info] ([Name], [Sex], [Birthday], [Phone], [Mail], [AccountID], [CityID], [TownshipID]) VALUES (N'Trần Đại Phúc', 1, CAST(N'1997-01-15' AS Date), N'0946901161 ', N'Happytran1501@gmail.com       ', N'PhucTD5', 36, 127)
INSERT [dbo].[Info] ([Name], [Sex], [Birthday], [Phone], [Mail], [AccountID], [CityID], [TownshipID]) VALUES (N'Lê Đình Phụng', 1, CAST(N'1998-10-21' AS Date), N'0998098112 ', N'phungld@gmail.com             ', N'PhungLD', 78, 122)
INSERT [dbo].[Info] ([Name], [Sex], [Birthday], [Phone], [Mail], [AccountID], [CityID], [TownshipID]) VALUES (N'Lê Đình Quang', 1, CAST(N'1997-02-28' AS Date), N'0123456789 ', N'tainguyen6600@gmail.com       ', N'QuangLD', 75, 21)
INSERT [dbo].[Info] ([Name], [Sex], [Birthday], [Phone], [Mail], [AccountID], [CityID], [TownshipID]) VALUES (N'Lê Đình Quang', 1, CAST(N'1997-02-28' AS Date), N'0964936311 ', N'lquang972@gmail.com           ', N'QuangLD2', 75, 21)
INSERT [dbo].[Info] ([Name], [Sex], [Birthday], [Phone], [Mail], [AccountID], [CityID], [TownshipID]) VALUES (N'Nguyễn Văn Tài', 1, CAST(N'1997-02-18' AS Date), N'0941111112 ', N'tainv@gmail.com               ', N'TaiNV12', 93, 124)
INSERT [dbo].[Info] ([Name], [Sex], [Birthday], [Phone], [Mail], [AccountID], [CityID], [TownshipID]) VALUES (N'Trương Tấn Tâm ', 1, CAST(N'1997-05-25' AS Date), N'0194245455 ', N'tamtt@gmail.com               ', N'TamTT13', 73, 11)
INSERT [dbo].[Info] ([Name], [Sex], [Birthday], [Phone], [Mail], [AccountID], [CityID], [TownshipID]) VALUES (N'Nguyễn Trần Tiến', 1, CAST(N'1999-03-06' AS Date), N'0903498321 ', N'tiennv@gmail.com              ', N'TienNT', 37, 128)
INSERT [dbo].[Info] ([Name], [Sex], [Birthday], [Phone], [Mail], [AccountID], [CityID], [TownshipID]) VALUES (N'Tam', 1, CAST(N'0123-03-12' AS Date), N'0924819022 ', N'ttt@fmail.com                 ', N'TTT', 75, 26)
SET IDENTITY_INSERT [dbo].[Post] ON 

INSERT [dbo].[Post] ([PostID], [PostTitle], [PostView], [PostDay], [HouseID], [Description], [Status]) VALUES (1, N'Cho thuê nhà trọ', 37, CAST(N'2019-02-27T12:06:12.100' AS DateTime), 11, N'Phòng trọ rộng, thoáng mát, đầy đủ tiện nghi', 1)
INSERT [dbo].[Post] ([PostID], [PostTitle], [PostView], [PostDay], [HouseID], [Description], [Status]) VALUES (2, N'Cho thuê nhà trọ', 57, CAST(N'2019-02-07T04:12:12.980' AS DateTime), 12, N'Phòng trọ rộng, thoáng mát, thân thiện', 1)
INSERT [dbo].[Post] ([PostID], [PostTitle], [PostView], [PostDay], [HouseID], [Description], [Status]) VALUES (3, N'Cho thuê nhà trọ', 98, CAST(N'2019-01-20T12:06:12.100' AS DateTime), 13, N'Phòng trọ rộng, thoáng mát, thân thiện', 1)
INSERT [dbo].[Post] ([PostID], [PostTitle], [PostView], [PostDay], [HouseID], [Description], [Status]) VALUES (4, N'Cho thuê nhà trọ', 86, CAST(N'2019-01-10T04:12:12.980' AS DateTime), 14, N'Phòng trọ rộng, thoáng mát, đầy đủ tiện nghi, trọ gần trường', 1)
INSERT [dbo].[Post] ([PostID], [PostTitle], [PostView], [PostDay], [HouseID], [Description], [Status]) VALUES (5, N'Cho thuê nhà trọ', 10, CAST(N'2019-01-30T01:01:01.100' AS DateTime), 18, N'Phòng trọ rộng, thoáng mát, đầy đủ tiện nghi, trọ gần trường', 0)
INSERT [dbo].[Post] ([PostID], [PostTitle], [PostView], [PostDay], [HouseID], [Description], [Status]) VALUES (6, N'Cho thuê nhà trọ', 234, CAST(N'2019-01-18T01:02:01.120' AS DateTime), 19, N'Phòng trọ rộng, thoáng mát, thân thiện', 1)
INSERT [dbo].[Post] ([PostID], [PostTitle], [PostView], [PostDay], [HouseID], [Description], [Status]) VALUES (7, N'Cho thuê nhà trọ', 10, CAST(N'2019-01-26T12:12:02.040' AS DateTime), 20, N'Phòng trọ rộng, thoáng mát, thân thiện', 0)
INSERT [dbo].[Post] ([PostID], [PostTitle], [PostView], [PostDay], [HouseID], [Description], [Status]) VALUES (8, N'Cho thuê nhà trọ', 232, CAST(N'2019-01-22T04:12:12.980' AS DateTime), 21, N'Phòng trọ rộng, thoáng mát, đầy đủ tiện nghi, trọ gần trường', 1)
INSERT [dbo].[Post] ([PostID], [PostTitle], [PostView], [PostDay], [HouseID], [Description], [Status]) VALUES (9, N'Cho thuê nhà trọ', 16, CAST(N'2019-01-05T02:03:12.100' AS DateTime), 23, N'Phòng trọ rộng, thoáng mát, đầy đủ tiện nghi, trọ gần trường', 1)
INSERT [dbo].[Post] ([PostID], [PostTitle], [PostView], [PostDay], [HouseID], [Description], [Status]) VALUES (10, N'Cho thuê nhà trọ', 13, CAST(N'2019-02-05T23:54:01.123' AS DateTime), 30, N'Phòng trọ rộng, thoáng mát, thân thiện', 1)
INSERT [dbo].[Post] ([PostID], [PostTitle], [PostView], [PostDay], [HouseID], [Description], [Status]) VALUES (11, N'Cho thuê nhà trọ', 302, CAST(N'2015-03-05T02:03:12.100' AS DateTime), 31, N'Phòng trọ rộng, thoáng mát, thân thiện', 1)
INSERT [dbo].[Post] ([PostID], [PostTitle], [PostView], [PostDay], [HouseID], [Description], [Status]) VALUES (12, N'Cho thuê nhà trọ', 123, CAST(N'2018-04-03T01:03:12.137' AS DateTime), 32, N'Phòng trọ rộng, thoáng mát, thân thiện', 1)
INSERT [dbo].[Post] ([PostID], [PostTitle], [PostView], [PostDay], [HouseID], [Description], [Status]) VALUES (13, N'Cho thuê nhà trọ', 30, CAST(N'2016-12-01T12:06:12.100' AS DateTime), 33, N'Phòng trọ rộng, thoáng mát, đầy đủ tiện nghi, trọ gần trường', 1)
INSERT [dbo].[Post] ([PostID], [PostTitle], [PostView], [PostDay], [HouseID], [Description], [Status]) VALUES (14, N'Cho thuê nhà trọ', 200, CAST(N'2017-10-03T02:03:12.123' AS DateTime), 36, N'Phòng trọ rộng, thoáng mát, thân thiện', 1)
INSERT [dbo].[Post] ([PostID], [PostTitle], [PostView], [PostDay], [HouseID], [Description], [Status]) VALUES (15, N'Cho thuê nhà trọ', 2, CAST(N'2018-03-22T04:12:12.980' AS DateTime), 37, N'Phòng trọ rộng, thoáng mát, thân thiện', 0)
INSERT [dbo].[Post] ([PostID], [PostTitle], [PostView], [PostDay], [HouseID], [Description], [Status]) VALUES (16, N'Cho thuê nhà nguyên căn', 12, CAST(N'2019-01-21T12:03:12.100' AS DateTime), 5, N'Nhà rộng, thoáng mát, đầy đủ tiện nghi, gần trường', 0)
INSERT [dbo].[Post] ([PostID], [PostTitle], [PostView], [PostDay], [HouseID], [Description], [Status]) VALUES (17, N'Cho thuê nhà nguyên căn', 56, CAST(N'2019-01-01T12:03:12.133' AS DateTime), 6, N'Nhà rộng, thoáng mát, đầy đủ tiện nghi, gần trường', 1)
INSERT [dbo].[Post] ([PostID], [PostTitle], [PostView], [PostDay], [HouseID], [Description], [Status]) VALUES (18, N'Cho thuê nhà nguyên căn', 343, CAST(N'2019-01-01T04:16:12.980' AS DateTime), 7, N'Nhà rộng, thoáng mát, đầy đủ tiện nghi, gần trường', 1)
INSERT [dbo].[Post] ([PostID], [PostTitle], [PostView], [PostDay], [HouseID], [Description], [Status]) VALUES (19, N'Cho thuê nhà nguyên căn', 34, CAST(N'2019-01-11T14:12:12.980' AS DateTime), 8, N'Nhà rộng, thoáng mát, đầy đủ tiện nghi, gần trường', 1)
INSERT [dbo].[Post] ([PostID], [PostTitle], [PostView], [PostDay], [HouseID], [Description], [Status]) VALUES (20, N'Cho thuê nhà nguyên căn', 34, CAST(N'2019-03-01T02:03:12.100' AS DateTime), 9, N'Nhà rộng, thoáng mát, đầy đủ tiện nghi, gần trường', 1)
INSERT [dbo].[Post] ([PostID], [PostTitle], [PostView], [PostDay], [HouseID], [Description], [Status]) VALUES (21, N'Cho thuê nhà nguyên căn', 10, CAST(N'2018-04-01T04:12:12.980' AS DateTime), 10, N'Nhà rộng, thoáng mát, đầy đủ tiện nghi, gần trường', 0)
INSERT [dbo].[Post] ([PostID], [PostTitle], [PostView], [PostDay], [HouseID], [Description], [Status]) VALUES (22, N'Cho thuê nhà nguyên căn', 54, CAST(N'2019-02-01T02:06:12.107' AS DateTime), 22, N'Nhà rộng, thoáng mát, đầy đủ tiện nghi, gần trường', 1)
INSERT [dbo].[Post] ([PostID], [PostTitle], [PostView], [PostDay], [HouseID], [Description], [Status]) VALUES (23, N'Cho thuê nhà nguyên căn', 439, CAST(N'2019-01-31T04:12:12.980' AS DateTime), 24, N'Nhà rộng, thoáng mát, đầy đủ tiện nghi, gần trường', 1)
INSERT [dbo].[Post] ([PostID], [PostTitle], [PostView], [PostDay], [HouseID], [Description], [Status]) VALUES (24, N'Cho thuê nhà nguyên căn', 12, CAST(N'2019-02-01T02:08:12.100' AS DateTime), 25, N'Nhà rộng, thoáng mát, đầy đủ tiện nghi, gần trường', 1)
INSERT [dbo].[Post] ([PostID], [PostTitle], [PostView], [PostDay], [HouseID], [Description], [Status]) VALUES (25, N'Cho thuê nhà nguyên căn', 42, CAST(N'2018-11-01T04:12:12.980' AS DateTime), 26, N'Nhà rộng, thoáng mát, đầy đủ tiện nghi, gần trường', 1)
INSERT [dbo].[Post] ([PostID], [PostTitle], [PostView], [PostDay], [HouseID], [Description], [Status]) VALUES (26, N'Cho thuênhà nguyên căn', 4, CAST(N'2018-07-01T02:09:12.107' AS DateTime), 27, N'Nhà rộng, thoáng mát, đầy đủ tiện nghi, gần trường', 1)
INSERT [dbo].[Post] ([PostID], [PostTitle], [PostView], [PostDay], [HouseID], [Description], [Status]) VALUES (27, N'Cho thuê nhà nguyên căn', 10, CAST(N'2019-07-01T02:09:12.107' AS DateTime), 28, N'Nhà rộng, thoáng mát, đầy đủ tiện nghi, gần trường', 0)
INSERT [dbo].[Post] ([PostID], [PostTitle], [PostView], [PostDay], [HouseID], [Description], [Status]) VALUES (28, N'Cho thuê nhà nguyên căn', 12, CAST(N'2019-01-01T12:03:12.100' AS DateTime), 29, N'Nhà rộng, thoáng mát, đầy đủ tiện nghi, gần trường', 1)
INSERT [dbo].[Post] ([PostID], [PostTitle], [PostView], [PostDay], [HouseID], [Description], [Status]) VALUES (29, N'Cho thuê nhà nguyên căn', 44, CAST(N'2019-04-01T02:03:12.100' AS DateTime), 34, N'Nhà rộng, thoáng mát, đầy đủ tiện nghi, gần trường', 1)
INSERT [dbo].[Post] ([PostID], [PostTitle], [PostView], [PostDay], [HouseID], [Description], [Status]) VALUES (30, N'Cho thuê nhà nguyên căn', 125, CAST(N'2019-05-01T02:06:12.107' AS DateTime), 35, N'Nhà rộng, thoáng mát, đầy đủ tiện nghi, gần trường', 1)
INSERT [dbo].[Post] ([PostID], [PostTitle], [PostView], [PostDay], [HouseID], [Description], [Status]) VALUES (31, N'Cho thuê nhà nguyên căn', 54, CAST(N'2019-02-01T02:06:12.107' AS DateTime), 39, N'Nhà rộng, thoáng mát, đầy đủ tiện nghi, gần trường', 1)
INSERT [dbo].[Post] ([PostID], [PostTitle], [PostView], [PostDay], [HouseID], [Description], [Status]) VALUES (32, N'Cho thuê nhà nguyên căn', 10, CAST(N'2019-03-04T15:36:20.430' AS DateTime), 42, N'Nhà rộng, thoáng mát, đầy đủ tiện nghi, gần trường', 0)
INSERT [dbo].[Post] ([PostID], [PostTitle], [PostView], [PostDay], [HouseID], [Description], [Status]) VALUES (36, N'Cho thuê nhà nguyên căn', 125, CAST(N'2019-06-01T02:06:12.107' AS DateTime), 46, N'Nhà rộng, thoáng mát, đầy đủ tiện nghi, gần trường', 1)
INSERT [dbo].[Post] ([PostID], [PostTitle], [PostView], [PostDay], [HouseID], [Description], [Status]) VALUES (37, N'Cho thuê nhà nguyên căn', 123, CAST(N'2019-02-01T02:03:12.100' AS DateTime), 47, N'Nhà rộng, thoáng mát, đầy đủ tiện nghi, gần trường', 1)
INSERT [dbo].[Post] ([PostID], [PostTitle], [PostView], [PostDay], [HouseID], [Description], [Status]) VALUES (38, N'Cho thuê trọ sinh viên giá rẻ', 21, CAST(N'2019-09-01T02:06:12.107' AS DateTime), 43, N'Phòng trọ rộng, thoáng mát, thân thiện', 1)
INSERT [dbo].[Post] ([PostID], [PostTitle], [PostView], [PostDay], [HouseID], [Description], [Status]) VALUES (39, N'Cho thuê trọ sinh viên giá rẻ', 124, CAST(N'2019-03-01T02:03:12.100' AS DateTime), 44, N'Phòng trọ rộng, thoáng mát, thân thiện', 1)
INSERT [dbo].[Post] ([PostID], [PostTitle], [PostView], [PostDay], [HouseID], [Description], [Status]) VALUES (40, N'Cho thuê trọ sinh viên giá rẻ', 45, CAST(N'2108-08-22T04:12:12.980' AS DateTime), 45, N'Phòng trọ rộng, thoáng mát, thân thiện', 1)
INSERT [dbo].[Post] ([PostID], [PostTitle], [PostView], [PostDay], [HouseID], [Description], [Status]) VALUES (41, N'Cho thuê nhà nguyên căn', 87, CAST(N'2019-04-01T02:06:12.107' AS DateTime), 49, N'Phòng trọ rộng, thoáng mát, thân thiện', 1)
INSERT [dbo].[Post] ([PostID], [PostTitle], [PostView], [PostDay], [HouseID], [Description], [Status]) VALUES (42, N'Cho thuê trọ sinh viên giá rẻ', 11, CAST(N'2019-11-01T02:03:12.100' AS DateTime), 50, N'Phòng trọ rộng, thoáng mát, thân thiện', 0)
INSERT [dbo].[Post] ([PostID], [PostTitle], [PostView], [PostDay], [HouseID], [Description], [Status]) VALUES (43, N'Cho thuê trọ sinh viên giá rẻ', 334, CAST(N'2019-02-01T02:06:12.107' AS DateTime), 35, N'Phòng trọ rộng, thoáng mát, thân thiện', 1)
SET IDENTITY_INSERT [dbo].[Post] OFF
SET IDENTITY_INSERT [dbo].[Renter] ON 

INSERT [dbo].[Renter] ([ID], [RenterID], [Name], [Birthday], [Sex], [Phone], [Note], [HouseID], [RentDate]) VALUES (1, N'192021111', N'Nguyễn Văn A', CAST(N'1985-03-02' AS Date), 1, N'0962312325', N'Abcde', 5, CAST(N'2018-01-01' AS Date))
INSERT [dbo].[Renter] ([ID], [RenterID], [Name], [Birthday], [Sex], [Phone], [Note], [HouseID], [RentDate]) VALUES (2, N'194512381', N'Trần Thị Minh', CAST(N'1992-03-01' AS Date), 0, N'0934761263', N'Không đẹp', 5, CAST(N'2018-02-02' AS Date))
INSERT [dbo].[Renter] ([ID], [RenterID], [Name], [Birthday], [Sex], [Phone], [Note], [HouseID], [RentDate]) VALUES (3, N'198623313', N'Nguyễn Văn Nam', CAST(N'1994-12-02' AS Date), 1, N'0832331356', N'Giàu', 6, CAST(N'2017-12-01' AS Date))
INSERT [dbo].[Renter] ([ID], [RenterID], [Name], [Birthday], [Sex], [Phone], [Note], [HouseID], [RentDate]) VALUES (4, N'192341201', N'Lê Thị Hoa', CAST(N'1996-12-01' AS Date), 0, N'0232145126', N'Đẹp', 7, CAST(N'2015-05-01' AS Date))
INSERT [dbo].[Renter] ([ID], [RenterID], [Name], [Birthday], [Sex], [Phone], [Note], [HouseID], [RentDate]) VALUES (5, N'188472421', N'Mai Văn Nhi', CAST(N'1999-01-01' AS Date), 0, N'0993418231', N'Xinh', 8, CAST(N'2017-04-01' AS Date))
INSERT [dbo].[Renter] ([ID], [RenterID], [Name], [Birthday], [Sex], [Phone], [Note], [HouseID], [RentDate]) VALUES (6, N'199492841', N'Trần Thị Yến Nhi', CAST(N'1998-04-01' AS Date), 0, N'0112341568', N'Không', 8, CAST(N'2017-03-29' AS Date))
INSERT [dbo].[Renter] ([ID], [RenterID], [Name], [Birthday], [Sex], [Phone], [Note], [HouseID], [RentDate]) VALUES (7, N'109234247', N'Lê Thị Thảo', CAST(N'1999-05-02' AS Date), 0, N'0832941124', N'Không', 8, CAST(N'2017-04-04' AS Date))
INSERT [dbo].[Renter] ([ID], [RenterID], [Name], [Birthday], [Sex], [Phone], [Note], [HouseID], [RentDate]) VALUES (8, N'198248274', N'Trần Văn Phước', CAST(N'1994-03-03' AS Date), 1, N'0948928419', NULL, 10, CAST(N'2014-06-06' AS Date))
INSERT [dbo].[Renter] ([ID], [RenterID], [Name], [Birthday], [Sex], [Phone], [Note], [HouseID], [RentDate]) VALUES (9, N'192734627', N'Nguyễn Tấn Sinh', CAST(N'1993-05-01' AS Date), 1, N'0908923853', NULL, 10, CAST(N'2015-02-01' AS Date))
INSERT [dbo].[Renter] ([ID], [RenterID], [Name], [Birthday], [Sex], [Phone], [Note], [HouseID], [RentDate]) VALUES (10, N'138098741', N'Trần Văn Hùng', CAST(N'1999-01-01' AS Date), 1, N'0928572114', NULL, 19, CAST(N'2016-05-05' AS Date))
INSERT [dbo].[Renter] ([ID], [RenterID], [Name], [Birthday], [Sex], [Phone], [Note], [HouseID], [RentDate]) VALUES (11, N'102941243', N'Trương Đình Sơn', CAST(N'1996-04-01' AS Date), 1, N'0924824791', N'', 22, CAST(N'2018-04-05' AS Date))
INSERT [dbo].[Renter] ([ID], [RenterID], [Name], [Birthday], [Sex], [Phone], [Note], [HouseID], [RentDate]) VALUES (12, N'102809149', N'Huỳnh Thúc Khải', CAST(N'1994-03-01' AS Date), 1, N'0928182748', NULL, 23, CAST(N'2015-03-01' AS Date))
INSERT [dbo].[Renter] ([ID], [RenterID], [Name], [Birthday], [Sex], [Phone], [Note], [HouseID], [RentDate]) VALUES (13, N'109212481', N'Nguyễn Thị Nhã', CAST(N'1996-03-01' AS Date), 0, N'0912471824', NULL, 23, CAST(N'2015-03-01' AS Date))
INSERT [dbo].[Renter] ([ID], [RenterID], [Name], [Birthday], [Sex], [Phone], [Note], [HouseID], [RentDate]) VALUES (14, N'109249182', N'Trần Minh Yến', CAST(N'1998-01-21' AS Date), 0, N'0921412091', NULL, 9, CAST(N'2018-03-01' AS Date))
INSERT [dbo].[Renter] ([ID], [RenterID], [Name], [Birthday], [Sex], [Phone], [Note], [HouseID], [RentDate]) VALUES (15, N'128312844', N'Hoàng Minh Thi', CAST(N'1997-12-02' AS Date), 0, N'0192094812', NULL, 9, CAST(N'2018-08-01' AS Date))
INSERT [dbo].[Renter] ([ID], [RenterID], [Name], [Birthday], [Sex], [Phone], [Note], [HouseID], [RentDate]) VALUES (16, N'129810248', N'Nguyễn Thị Huyền Oanh', CAST(N'1999-04-01' AS Date), 0, N'0124812912', NULL, 21, CAST(N'2017-04-01' AS Date))
INSERT [dbo].[Renter] ([ID], [RenterID], [Name], [Birthday], [Sex], [Phone], [Note], [HouseID], [RentDate]) VALUES (17, N'192849122', N'Hoàng Thị Ngọc', CAST(N'1994-01-01' AS Date), 0, N'0812938123', N'', 11, CAST(N'2015-01-05' AS Date))
INSERT [dbo].[Renter] ([ID], [RenterID], [Name], [Birthday], [Sex], [Phone], [Note], [HouseID], [RentDate]) VALUES (18, N'190923813', N'Huỳnh Văn Khang', CAST(N'1995-05-01' AS Date), 1, N'0942145899', N'', 13, CAST(N'2017-04-01' AS Date))
INSERT [dbo].[Renter] ([ID], [RenterID], [Name], [Birthday], [Sex], [Phone], [Note], [HouseID], [RentDate]) VALUES (19, N'124214528', N'Ngô Thị Thuỳ Linh', CAST(N'1998-04-08' AS Date), 0, N'9829490590', NULL, 18, CAST(N'2018-09-05' AS Date))
SET IDENTITY_INSERT [dbo].[Renter] OFF
SET IDENTITY_INSERT [dbo].[Status] ON 

INSERT [dbo].[Status] ([StatusID], [StatusName]) VALUES (1, N'Còn trống')
INSERT [dbo].[Status] ([StatusID], [StatusName]) VALUES (2, N'Đã thuê ')
INSERT [dbo].[Status] ([StatusID], [StatusName]) VALUES (3, N'Ở ghép')
SET IDENTITY_INSERT [dbo].[Status] OFF
SET IDENTITY_INSERT [dbo].[Township] ON 

INSERT [dbo].[Township] ([TownshipID], [TownshipName], [CityID], [LocationX], [LocationY]) VALUES (1, N'Hải Châu', 43, 16.0592036, 108.2119364)
INSERT [dbo].[Township] ([TownshipID], [TownshipName], [CityID], [LocationX], [LocationY]) VALUES (2, N'Cẩm Lệ', 43, 16.0170591, 108.1326173)
INSERT [dbo].[Township] ([TownshipID], [TownshipName], [CityID], [LocationX], [LocationY]) VALUES (3, N'Thanh Khê', 43, 16.0567591, 108.1549894)
INSERT [dbo].[Township] ([TownshipID], [TownshipName], [CityID], [LocationX], [LocationY]) VALUES (4, N'Liên Chiểu', 43, 16.1292916, 108.0660463)
INSERT [dbo].[Township] ([TownshipID], [TownshipName], [CityID], [LocationX], [LocationY]) VALUES (5, N'Ngũ Hành Sơn', 43, 16.004513, 108.2595841)
INSERT [dbo].[Township] ([TownshipID], [TownshipName], [CityID], [LocationX], [LocationY]) VALUES (6, N'Sơn Trà', 43, 16.103567, 108.2048812)
INSERT [dbo].[Township] ([TownshipID], [TownshipName], [CityID], [LocationX], [LocationY]) VALUES (7, N'Hòa Vang', 43, 16.0667933, 107.7412159)
INSERT [dbo].[Township] ([TownshipID], [TownshipName], [CityID], [LocationX], [LocationY]) VALUES (8, N'Hoàng Sa', 43, 16.0664289, 107.7412127)
INSERT [dbo].[Township] ([TownshipID], [TownshipName], [CityID], [LocationX], [LocationY]) VALUES (9, N'Bố Trạch', 73, 17.4858467, 105.7240716)
INSERT [dbo].[Township] ([TownshipID], [TownshipName], [CityID], [LocationX], [LocationY]) VALUES (10, N'Quảng Trạch', 73, 17.832965, 106.454241)
INSERT [dbo].[Township] ([TownshipID], [TownshipName], [CityID], [LocationX], [LocationY]) VALUES (11, N'Lệ Thủy', 73, 17.1261106, 106.4173642)
INSERT [dbo].[Township] ([TownshipID], [TownshipName], [CityID], [LocationX], [LocationY]) VALUES (12, N'Tuyên Hóa', 73, 17.9000745, 105.6906762)
INSERT [dbo].[Township] ([TownshipID], [TownshipName], [CityID], [LocationX], [LocationY]) VALUES (13, N'Quảng Ninh', 73, NULL, NULL)
INSERT [dbo].[Township] ([TownshipID], [TownshipName], [CityID], [LocationX], [LocationY]) VALUES (14, N'Ba Đồn', 73, NULL, NULL)
INSERT [dbo].[Township] ([TownshipID], [TownshipName], [CityID], [LocationX], [LocationY]) VALUES (15, N'Đồng Hới', 73, 17.4544544, 106.5359012)
INSERT [dbo].[Township] ([TownshipID], [TownshipName], [CityID], [LocationX], [LocationY]) VALUES (16, N'Triệu Phong', 74, NULL, NULL)
INSERT [dbo].[Township] ([TownshipID], [TownshipName], [CityID], [LocationX], [LocationY]) VALUES (17, N'Gio Linh', 74, NULL, NULL)
INSERT [dbo].[Township] ([TownshipID], [TownshipName], [CityID], [LocationX], [LocationY]) VALUES (18, N'Hướng Hóa', 74, 16.7050012, 106.3927495)
INSERT [dbo].[Township] ([TownshipID], [TownshipName], [CityID], [LocationX], [LocationY]) VALUES (19, N'Tx Quảng Trị', 74, NULL, NULL)
INSERT [dbo].[Township] ([TownshipID], [TownshipName], [CityID], [LocationX], [LocationY]) VALUES (20, N'Đông Hà', 74, 16.8014802, 107.0181195)
INSERT [dbo].[Township] ([TownshipID], [TownshipName], [CityID], [LocationX], [LocationY]) VALUES (21, N'Hương Trà', 75, 16.4281918, 107.3386282)
INSERT [dbo].[Township] ([TownshipID], [TownshipName], [CityID], [LocationX], [LocationY]) VALUES (22, N'Phong Điền', 75, NULL, NULL)
INSERT [dbo].[Township] ([TownshipID], [TownshipName], [CityID], [LocationX], [LocationY]) VALUES (23, N'Phú Vang', 75, 16.4492443, 107.5704871)
INSERT [dbo].[Township] ([TownshipID], [TownshipName], [CityID], [LocationX], [LocationY]) VALUES (24, N'Hương Thủy', 75, 16.3240913, 107.4863964)
INSERT [dbo].[Township] ([TownshipID], [TownshipName], [CityID], [LocationX], [LocationY]) VALUES (25, N'Phú Lộc', 75, 16.287803, 107.7814331)
INSERT [dbo].[Township] ([TownshipID], [TownshipName], [CityID], [LocationX], [LocationY]) VALUES (26, N'Thành phố Huế', 75, 16.4535435, 107.5070722)
INSERT [dbo].[Township] ([TownshipID], [TownshipName], [CityID], [LocationX], [LocationY]) VALUES (27, N'A Lưới', 75, 16.2317916, 106.9914894)
INSERT [dbo].[Township] ([TownshipID], [TownshipName], [CityID], [LocationX], [LocationY]) VALUES (28, N'Hội An', 92, 15.9184459, 108.347032)
INSERT [dbo].[Township] ([TownshipID], [TownshipName], [CityID], [LocationX], [LocationY]) VALUES (29, N'Tam Kỳ', 92, 15.5764984, 108.4286687)
INSERT [dbo].[Township] ([TownshipID], [TownshipName], [CityID], [LocationX], [LocationY]) VALUES (30, N'Điện Bàn', 92, 15.9033263, 108.162905)
INSERT [dbo].[Township] ([TownshipID], [TownshipName], [CityID], [LocationX], [LocationY]) VALUES (31, N'Thăng Bình', 92, NULL, NULL)
INSERT [dbo].[Township] ([TownshipID], [TownshipName], [CityID], [LocationX], [LocationY]) VALUES (32, N'Bắc Trà My', 92, NULL, NULL)
INSERT [dbo].[Township] ([TownshipID], [TownshipName], [CityID], [LocationX], [LocationY]) VALUES (33, N'Nam Trà My', 92, NULL, NULL)
INSERT [dbo].[Township] ([TownshipID], [TownshipName], [CityID], [LocationX], [LocationY]) VALUES (34, N'Núi Thành', 92, NULL, NULL)
INSERT [dbo].[Township] ([TownshipID], [TownshipName], [CityID], [LocationX], [LocationY]) VALUES (35, N'Phước Sơn', 92, 15.3863887, 107.7039037)
INSERT [dbo].[Township] ([TownshipID], [TownshipName], [CityID], [LocationX], [LocationY]) VALUES (36, N'Tiên Phước', 92, NULL, NULL)
INSERT [dbo].[Township] ([TownshipID], [TownshipName], [CityID], [LocationX], [LocationY]) VALUES (37, N'Hiệp Đức', 92, NULL, NULL)
INSERT [dbo].[Township] ([TownshipID], [TownshipName], [CityID], [LocationX], [LocationY]) VALUES (38, N'Nông Sơn', 92, NULL, NULL)
INSERT [dbo].[Township] ([TownshipID], [TownshipName], [CityID], [LocationX], [LocationY]) VALUES (39, N'Đông Sơn', 92, NULL, NULL)
INSERT [dbo].[Township] ([TownshipID], [TownshipName], [CityID], [LocationX], [LocationY]) VALUES (40, N'Nam Giang', 92, NULL, NULL)
INSERT [dbo].[Township] ([TownshipID], [TownshipName], [CityID], [LocationX], [LocationY]) VALUES (41, N'Đại Lộc', 92, NULL, NULL)
INSERT [dbo].[Township] ([TownshipID], [TownshipName], [CityID], [LocationX], [LocationY]) VALUES (42, N'Phú Ninh', 92, NULL, NULL)
INSERT [dbo].[Township] ([TownshipID], [TownshipName], [CityID], [LocationX], [LocationY]) VALUES (43, N'Tây Giang', 92, NULL, NULL)
INSERT [dbo].[Township] ([TownshipID], [TownshipName], [CityID], [LocationX], [LocationY]) VALUES (44, N'Duy Xuyên', 92, NULL, NULL)
INSERT [dbo].[Township] ([TownshipID], [TownshipName], [CityID], [LocationX], [LocationY]) VALUES (45, N'Quế Sơn', 92, NULL, NULL)
INSERT [dbo].[Township] ([TownshipID], [TownshipName], [CityID], [LocationX], [LocationY]) VALUES (46, N'Ba Đình', 29, 21.0359191, 105.8121223)
INSERT [dbo].[Township] ([TownshipID], [TownshipName], [CityID], [LocationX], [LocationY]) VALUES (47, N'Hoàn Kiếm', 29, NULL, NULL)
INSERT [dbo].[Township] ([TownshipID], [TownshipName], [CityID], [LocationX], [LocationY]) VALUES (48, N'Tây Hồ', 29, NULL, NULL)
INSERT [dbo].[Township] ([TownshipID], [TownshipName], [CityID], [LocationX], [LocationY]) VALUES (49, N'Long Biên', 29, NULL, NULL)
INSERT [dbo].[Township] ([TownshipID], [TownshipName], [CityID], [LocationX], [LocationY]) VALUES (50, N'Cầu Giấy', 29, 21.0287556, 105.7558942)
INSERT [dbo].[Township] ([TownshipID], [TownshipName], [CityID], [LocationX], [LocationY]) VALUES (51, N'Đống Đa', 29, NULL, NULL)
INSERT [dbo].[Township] ([TownshipID], [TownshipName], [CityID], [LocationX], [LocationY]) VALUES (52, N'Hai Bà Trưng', 29, NULL, NULL)
INSERT [dbo].[Township] ([TownshipID], [TownshipName], [CityID], [LocationX], [LocationY]) VALUES (53, N'Hoàng Mai', 29, NULL, NULL)
INSERT [dbo].[Township] ([TownshipID], [TownshipName], [CityID], [LocationX], [LocationY]) VALUES (54, N'Thanh Xuân', 29, NULL, NULL)
INSERT [dbo].[Township] ([TownshipID], [TownshipName], [CityID], [LocationX], [LocationY]) VALUES (55, N'Sóc Sơn', 29, NULL, NULL)
INSERT [dbo].[Township] ([TownshipID], [TownshipName], [CityID], [LocationX], [LocationY]) VALUES (56, N'Đông Anh', 29, NULL, NULL)
INSERT [dbo].[Township] ([TownshipID], [TownshipName], [CityID], [LocationX], [LocationY]) VALUES (57, N'Gia Lâm', 29, NULL, NULL)
INSERT [dbo].[Township] ([TownshipID], [TownshipName], [CityID], [LocationX], [LocationY]) VALUES (58, N'Từ Liêm', 29, NULL, NULL)
INSERT [dbo].[Township] ([TownshipID], [TownshipName], [CityID], [LocationX], [LocationY]) VALUES (59, N'Thanh Trì', 29, NULL, NULL)
INSERT [dbo].[Township] ([TownshipID], [TownshipName], [CityID], [LocationX], [LocationY]) VALUES (60, N'Bắc Từ Liêm', 29, NULL, NULL)
INSERT [dbo].[Township] ([TownshipID], [TownshipName], [CityID], [LocationX], [LocationY]) VALUES (61, N'Mê Linh', 29, NULL, NULL)
INSERT [dbo].[Township] ([TownshipID], [TownshipName], [CityID], [LocationX], [LocationY]) VALUES (62, N'Hà Đông', 29, NULL, NULL)
INSERT [dbo].[Township] ([TownshipID], [TownshipName], [CityID], [LocationX], [LocationY]) VALUES (63, N'Sơn Tây', 29, NULL, NULL)
INSERT [dbo].[Township] ([TownshipID], [TownshipName], [CityID], [LocationX], [LocationY]) VALUES (64, N'Ba Vì', 29, NULL, NULL)
INSERT [dbo].[Township] ([TownshipID], [TownshipName], [CityID], [LocationX], [LocationY]) VALUES (65, N'Phúc Thọ', 29, NULL, NULL)
INSERT [dbo].[Township] ([TownshipID], [TownshipName], [CityID], [LocationX], [LocationY]) VALUES (66, N'Đan Phượng', 29, NULL, NULL)
INSERT [dbo].[Township] ([TownshipID], [TownshipName], [CityID], [LocationX], [LocationY]) VALUES (67, N'Hoài Đức', 29, NULL, NULL)
INSERT [dbo].[Township] ([TownshipID], [TownshipName], [CityID], [LocationX], [LocationY]) VALUES (68, N'Quốc Oai', 29, NULL, NULL)
INSERT [dbo].[Township] ([TownshipID], [TownshipName], [CityID], [LocationX], [LocationY]) VALUES (69, N'Thường Tín', 29, NULL, NULL)
INSERT [dbo].[Township] ([TownshipID], [TownshipName], [CityID], [LocationX], [LocationY]) VALUES (70, N'Phú Xuyên', 29, NULL, NULL)
INSERT [dbo].[Township] ([TownshipID], [TownshipName], [CityID], [LocationX], [LocationY]) VALUES (71, N'Ứng Hòa', 29, NULL, NULL)
INSERT [dbo].[Township] ([TownshipID], [TownshipName], [CityID], [LocationX], [LocationY]) VALUES (72, N'Mỹ Đức', 29, NULL, NULL)
INSERT [dbo].[Township] ([TownshipID], [TownshipName], [CityID], [LocationX], [LocationY]) VALUES (73, N'Quận 1', 55, 10.7752187, 106.6808529)
INSERT [dbo].[Township] ([TownshipID], [TownshipName], [CityID], [LocationX], [LocationY]) VALUES (74, N'Quận 12', 55, NULL, NULL)
INSERT [dbo].[Township] ([TownshipID], [TownshipName], [CityID], [LocationX], [LocationY]) VALUES (75, N'Thủ Đức', 55, NULL, NULL)
INSERT [dbo].[Township] ([TownshipID], [TownshipName], [CityID], [LocationX], [LocationY]) VALUES (76, N'Quận 9', 55, NULL, NULL)
INSERT [dbo].[Township] ([TownshipID], [TownshipName], [CityID], [LocationX], [LocationY]) VALUES (77, N'Quận Gò Vấp', 55, NULL, NULL)
INSERT [dbo].[Township] ([TownshipID], [TownshipName], [CityID], [LocationX], [LocationY]) VALUES (78, N'Quận Bình Thạnh', 55, NULL, NULL)
INSERT [dbo].[Township] ([TownshipID], [TownshipName], [CityID], [LocationX], [LocationY]) VALUES (79, N'Quận Tân Bình', 55, NULL, NULL)
INSERT [dbo].[Township] ([TownshipID], [TownshipName], [CityID], [LocationX], [LocationY]) VALUES (80, N'Quận Tân Phú', 55, NULL, NULL)
INSERT [dbo].[Township] ([TownshipID], [TownshipName], [CityID], [LocationX], [LocationY]) VALUES (81, N'Quận Phú Nhuận', 55, NULL, NULL)
INSERT [dbo].[Township] ([TownshipID], [TownshipName], [CityID], [LocationX], [LocationY]) VALUES (82, N'Quận 2', 55, NULL, NULL)
INSERT [dbo].[Township] ([TownshipID], [TownshipName], [CityID], [LocationX], [LocationY]) VALUES (83, N'Quận 3', 55, NULL, NULL)
INSERT [dbo].[Township] ([TownshipID], [TownshipName], [CityID], [LocationX], [LocationY]) VALUES (84, N'Quận 10', 55, NULL, NULL)
INSERT [dbo].[Township] ([TownshipID], [TownshipName], [CityID], [LocationX], [LocationY]) VALUES (85, N'Quận 11 ', 55, NULL, NULL)
INSERT [dbo].[Township] ([TownshipID], [TownshipName], [CityID], [LocationX], [LocationY]) VALUES (86, N'Quận 4', 55, NULL, NULL)
INSERT [dbo].[Township] ([TownshipID], [TownshipName], [CityID], [LocationX], [LocationY]) VALUES (87, N'Quận 5', 55, NULL, NULL)
INSERT [dbo].[Township] ([TownshipID], [TownshipName], [CityID], [LocationX], [LocationY]) VALUES (88, N'Quận 6', 55, NULL, NULL)
INSERT [dbo].[Township] ([TownshipID], [TownshipName], [CityID], [LocationX], [LocationY]) VALUES (89, N'Quận 8', 55, NULL, NULL)
INSERT [dbo].[Township] ([TownshipID], [TownshipName], [CityID], [LocationX], [LocationY]) VALUES (90, N'Quận Bình Tân', 55, NULL, NULL)
INSERT [dbo].[Township] ([TownshipID], [TownshipName], [CityID], [LocationX], [LocationY]) VALUES (91, N'Quận 7', 55, 10.7376658, 106.6933227)
INSERT [dbo].[Township] ([TownshipID], [TownshipName], [CityID], [LocationX], [LocationY]) VALUES (92, N'Củ Chi', 55, 11.0378198, 106.3663753)
INSERT [dbo].[Township] ([TownshipID], [TownshipName], [CityID], [LocationX], [LocationY]) VALUES (93, N'Hóc Môn', 55, NULL, NULL)
INSERT [dbo].[Township] ([TownshipID], [TownshipName], [CityID], [LocationX], [LocationY]) VALUES (94, N'Bình Chánh', 55, NULL, NULL)
INSERT [dbo].[Township] ([TownshipID], [TownshipName], [CityID], [LocationX], [LocationY]) VALUES (95, N'Nhà Bè', 55, NULL, NULL)
INSERT [dbo].[Township] ([TownshipID], [TownshipName], [CityID], [LocationX], [LocationY]) VALUES (96, N'Cần Giờ', 55, NULL, NULL)
INSERT [dbo].[Township] ([TownshipID], [TownshipName], [CityID], [LocationX], [LocationY]) VALUES (97, N'Thành phố Quảng Ngãi', 76, NULL, NULL)
INSERT [dbo].[Township] ([TownshipID], [TownshipName], [CityID], [LocationX], [LocationY]) VALUES (98, N'Lý Sơn', 76, NULL, NULL)
INSERT [dbo].[Township] ([TownshipID], [TownshipName], [CityID], [LocationX], [LocationY]) VALUES (99, N'Bình Sơn ', 76, NULL, NULL)
GO
INSERT [dbo].[Township] ([TownshipID], [TownshipName], [CityID], [LocationX], [LocationY]) VALUES (100, N'Trà Bồng', 76, NULL, NULL)
INSERT [dbo].[Township] ([TownshipID], [TownshipName], [CityID], [LocationX], [LocationY]) VALUES (101, N'Sơn Tịnh', 76, NULL, NULL)
INSERT [dbo].[Township] ([TownshipID], [TownshipName], [CityID], [LocationX], [LocationY]) VALUES (102, N'Sơn Hà', 76, NULL, NULL)
INSERT [dbo].[Township] ([TownshipID], [TownshipName], [CityID], [LocationX], [LocationY]) VALUES (103, N'Tư Nghĩa', 76, NULL, NULL)
INSERT [dbo].[Township] ([TownshipID], [TownshipName], [CityID], [LocationX], [LocationY]) VALUES (104, N'Nghĩa Thành', 76, NULL, NULL)
INSERT [dbo].[Township] ([TownshipID], [TownshipName], [CityID], [LocationX], [LocationY]) VALUES (105, N'Minh Long', 76, NULL, NULL)
INSERT [dbo].[Township] ([TownshipID], [TownshipName], [CityID], [LocationX], [LocationY]) VALUES (106, N'Mộ Đức', 76, NULL, NULL)
INSERT [dbo].[Township] ([TownshipID], [TownshipName], [CityID], [LocationX], [LocationY]) VALUES (107, N'Đức Phổ', 76, NULL, NULL)
INSERT [dbo].[Township] ([TownshipID], [TownshipName], [CityID], [LocationX], [LocationY]) VALUES (108, N'Ba Tơ ', 76, NULL, NULL)
INSERT [dbo].[Township] ([TownshipID], [TownshipName], [CityID], [LocationX], [LocationY]) VALUES (109, N'Sơn Tây', 76, NULL, NULL)
INSERT [dbo].[Township] ([TownshipID], [TownshipName], [CityID], [LocationX], [LocationY]) VALUES (110, N'Tây Trà', 76, NULL, NULL)
INSERT [dbo].[Township] ([TownshipID], [TownshipName], [CityID], [LocationX], [LocationY]) VALUES (111, N'Thành phố Nha Trang', 79, NULL, NULL)
INSERT [dbo].[Township] ([TownshipID], [TownshipName], [CityID], [LocationX], [LocationY]) VALUES (112, N'Vạn Ninh', 79, NULL, NULL)
INSERT [dbo].[Township] ([TownshipID], [TownshipName], [CityID], [LocationX], [LocationY]) VALUES (113, N'Ninh Hòa', 79, NULL, NULL)
INSERT [dbo].[Township] ([TownshipID], [TownshipName], [CityID], [LocationX], [LocationY]) VALUES (114, N'Diên Khánh', 79, NULL, NULL)
INSERT [dbo].[Township] ([TownshipID], [TownshipName], [CityID], [LocationX], [LocationY]) VALUES (115, N'Khánh Vĩnh ', 79, NULL, NULL)
INSERT [dbo].[Township] ([TownshipID], [TownshipName], [CityID], [LocationX], [LocationY]) VALUES (116, N'Cam Ranh', 79, NULL, NULL)
INSERT [dbo].[Township] ([TownshipID], [TownshipName], [CityID], [LocationX], [LocationY]) VALUES (117, N'Khánh Sơn', 79, NULL, NULL)
INSERT [dbo].[Township] ([TownshipID], [TownshipName], [CityID], [LocationX], [LocationY]) VALUES (118, N'Trường Sa', 79, NULL, NULL)
INSERT [dbo].[Township] ([TownshipID], [TownshipName], [CityID], [LocationX], [LocationY]) VALUES (119, N'Cam Lâm', 79, NULL, NULL)
INSERT [dbo].[Township] ([TownshipID], [TownshipName], [CityID], [LocationX], [LocationY]) VALUES (120, N'Thuý Tú', 77, NULL, NULL)
INSERT [dbo].[Township] ([TownshipID], [TownshipName], [CityID], [LocationX], [LocationY]) VALUES (121, N'Lộc Thọ', 77, NULL, NULL)
INSERT [dbo].[Township] ([TownshipID], [TownshipName], [CityID], [LocationX], [LocationY]) VALUES (122, N'Canh Tinh', 78, NULL, NULL)
INSERT [dbo].[Township] ([TownshipID], [TownshipName], [CityID], [LocationX], [LocationY]) VALUES (123, N'Tuy Hoà', 78, NULL, NULL)
INSERT [dbo].[Township] ([TownshipID], [TownshipName], [CityID], [LocationX], [LocationY]) VALUES (124, N'Thuận An', 93, 10.931884, 106.6318169)
INSERT [dbo].[Township] ([TownshipID], [TownshipName], [CityID], [LocationX], [LocationY]) VALUES (125, N'Tân Uyên', 93, NULL, NULL)
INSERT [dbo].[Township] ([TownshipID], [TownshipName], [CityID], [LocationX], [LocationY]) VALUES (126, N'Sầm Sơn', 36, NULL, NULL)
INSERT [dbo].[Township] ([TownshipID], [TownshipName], [CityID], [LocationX], [LocationY]) VALUES (127, N'Bỉm Sơn', 36, 20.0883761, 105.8481714)
INSERT [dbo].[Township] ([TownshipID], [TownshipName], [CityID], [LocationX], [LocationY]) VALUES (128, N'Thái Hoà', 37, NULL, NULL)
INSERT [dbo].[Township] ([TownshipID], [TownshipName], [CityID], [LocationX], [LocationY]) VALUES (129, N'Vinh', 37, NULL, NULL)
INSERT [dbo].[Township] ([TownshipID], [TownshipName], [CityID], [LocationX], [LocationY]) VALUES (130, N'Cửa Lò', 37, NULL, NULL)
INSERT [dbo].[Township] ([TownshipID], [TownshipName], [CityID], [LocationX], [LocationY]) VALUES (131, N'Hồng Lĩnh', 38, NULL, NULL)
INSERT [dbo].[Township] ([TownshipID], [TownshipName], [CityID], [LocationX], [LocationY]) VALUES (132, N'Tp. Hà Tĩnh', 38, 18.3543226, 105.8668106)
SET IDENTITY_INSERT [dbo].[Township] OFF
SET IDENTITY_INSERT [dbo].[University] ON 

INSERT [dbo].[University] ([UniversityID], [UnisersityName], [CityID], [TownshipID]) VALUES (1, N'Đại học Quảng Bình', 73, 15)
INSERT [dbo].[University] ([UniversityID], [UnisersityName], [CityID], [TownshipID]) VALUES (2, N'Phân hiệu Đại học Huế tại Quảng Trị', 74, 20)
INSERT [dbo].[University] ([UniversityID], [UnisersityName], [CityID], [TownshipID]) VALUES (3, N'Đại học Nông Lâm - Đại học Huế', 75, 26)
INSERT [dbo].[University] ([UniversityID], [UnisersityName], [CityID], [TownshipID]) VALUES (4, N'Đại học Y Dược - Đại học Huế', 75, 26)
INSERT [dbo].[University] ([UniversityID], [UnisersityName], [CityID], [TownshipID]) VALUES (5, N'Đại học Ngoại Ngữ - Đại học Huế', 75, 26)
INSERT [dbo].[University] ([UniversityID], [UnisersityName], [CityID], [TownshipID]) VALUES (6, N'Đại học Kinh Tế - Đại học Huế', 75, 26)
INSERT [dbo].[University] ([UniversityID], [UnisersityName], [CityID], [TownshipID]) VALUES (7, N'Đại học Luật - Đại học Huế', 75, 26)
INSERT [dbo].[University] ([UniversityID], [UnisersityName], [CityID], [TownshipID]) VALUES (8, N'Khoa Du Lịch - Đại học Huế', 75, 26)
INSERT [dbo].[University] ([UniversityID], [UnisersityName], [CityID], [TownshipID]) VALUES (9, N'Khoa Giáo dục Thể chất - Đại học Huế', 75, 26)
INSERT [dbo].[University] ([UniversityID], [UnisersityName], [CityID], [TownshipID]) VALUES (10, N'Đại học Sư Phạm - Đại học Huế', 75, 26)
INSERT [dbo].[University] ([UniversityID], [UnisersityName], [CityID], [TownshipID]) VALUES (11, N'Đại học Bách Khoa - Đại học Đà Nẵng', 43, 4)
INSERT [dbo].[University] ([UniversityID], [UnisersityName], [CityID], [TownshipID]) VALUES (12, N'Đại học Sư Phạm - Đại học  Đà Nẵng', 43, 4)
INSERT [dbo].[University] ([UniversityID], [UnisersityName], [CityID], [TownshipID]) VALUES (13, N'Đại học Kinh Tế - Đại học Đà Nẵng', 43, 5)
INSERT [dbo].[University] ([UniversityID], [UnisersityName], [CityID], [TownshipID]) VALUES (14, N'Đại học Ngoại Ngữ - Đại học Đà Nẵng', 43, 2)
INSERT [dbo].[University] ([UniversityID], [UnisersityName], [CityID], [TownshipID]) VALUES (15, N'Đại học Cao Đẳng Công nghệ - Đại học Đà Nẵng', 43, 5)
INSERT [dbo].[University] ([UniversityID], [UnisersityName], [CityID], [TownshipID]) VALUES (16, N'Đại học Cao Đẳng Công nghệ thông tin - Đại học Đà Nẵng', 43, 4)
INSERT [dbo].[University] ([UniversityID], [UnisersityName], [CityID], [TownshipID]) VALUES (17, N'Khoa Y Dược - Đại học Đà Nẵng', 43, 5)
INSERT [dbo].[University] ([UniversityID], [UnisersityName], [CityID], [TownshipID]) VALUES (18, N'Đại học Kỹ thuật Y Dược ', 43, 1)
INSERT [dbo].[University] ([UniversityID], [UnisersityName], [CityID], [TownshipID]) VALUES (19, N'Đại học Thể dục thể thao Đà Nẵng', 43, 4)
INSERT [dbo].[University] ([UniversityID], [UnisersityName], [CityID], [TownshipID]) VALUES (20, N'Đại học Duy Tân', 43, 1)
INSERT [dbo].[University] ([UniversityID], [UnisersityName], [CityID], [TownshipID]) VALUES (21, N'Đại học Đông Á', 43, 1)
INSERT [dbo].[University] ([UniversityID], [UnisersityName], [CityID], [TownshipID]) VALUES (22, N'Đại học Kiến Trúc Đà Nẵng', 43, 1)
INSERT [dbo].[University] ([UniversityID], [UnisersityName], [CityID], [TownshipID]) VALUES (23, N'Cao Đẳng Công nghệ thông tin Hữu Nghị Việt-Hàn', 43, 5)
INSERT [dbo].[University] ([UniversityID], [UnisersityName], [CityID], [TownshipID]) VALUES (24, N'Cao Đẳng Kinh Tế - Kế Hoạch Đà Nẵng', 43, 4)
INSERT [dbo].[University] ([UniversityID], [UnisersityName], [CityID], [TownshipID]) VALUES (25, N'Cao Đẳng Lương thực Thực Phẩm ', 43, 6)
INSERT [dbo].[University] ([UniversityID], [UnisersityName], [CityID], [TownshipID]) VALUES (26, N'Cao Đẳng Giao Thông Vận Tải II', 43, 3)
INSERT [dbo].[University] ([UniversityID], [UnisersityName], [CityID], [TownshipID]) VALUES (27, N'Cao Đẳng Thương Mại Đà Nẵng', 43, 3)
INSERT [dbo].[University] ([UniversityID], [UnisersityName], [CityID], [TownshipID]) VALUES (28, N'Cao Đẳng Bách Khoa Đà Nẵng', 43, 1)
INSERT [dbo].[University] ([UniversityID], [UnisersityName], [CityID], [TownshipID]) VALUES (30, N'Cao Đẳng  Đông Du', 43, 1)
INSERT [dbo].[University] ([UniversityID], [UnisersityName], [CityID], [TownshipID]) VALUES (31, N'Cao Đẳng Lạc Việt', 43, 1)
INSERT [dbo].[University] ([UniversityID], [UnisersityName], [CityID], [TownshipID]) VALUES (32, N'Cao Đẳng Phương Đông', 43, 1)
INSERT [dbo].[University] ([UniversityID], [UnisersityName], [CityID], [TownshipID]) VALUES (33, N'Cao Đẳng Đức Trí', 43, 4)
INSERT [dbo].[University] ([UniversityID], [UnisersityName], [CityID], [TownshipID]) VALUES (34, N'Đại học Đà Nẵng', 43, 1)
INSERT [dbo].[University] ([UniversityID], [UnisersityName], [CityID], [TownshipID]) VALUES (35, N'Đại học Quảng Nam', 92, 29)
INSERT [dbo].[University] ([UniversityID], [UnisersityName], [CityID], [TownshipID]) VALUES (36, N'Đại học Phan Châu Trinh', 92, 30)
INSERT [dbo].[University] ([UniversityID], [UnisersityName], [CityID], [TownshipID]) VALUES (37, N'Đại học Nội vụ Hà Nội Phân hiệu Quảng Nam', 92, 30)
INSERT [dbo].[University] ([UniversityID], [UnisersityName], [CityID], [TownshipID]) VALUES (38, N'Cao Đẳng Phương Đông  Quảng Nam', 92, 29)
INSERT [dbo].[University] ([UniversityID], [UnisersityName], [CityID], [TownshipID]) VALUES (39, N'Cao Đẳng Kinh Tế Kỹ Thuật Quảng Nam', 92, 29)
INSERT [dbo].[University] ([UniversityID], [UnisersityName], [CityID], [TownshipID]) VALUES (40, N'Cao Đẳng Y Tế Quảng Nam', 92, 29)
SET IDENTITY_INSERT [dbo].[University] OFF
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_AccountStatus] FOREIGN KEY([AccountStatusID])
REFERENCES [dbo].[AccountStatus] ([AccountStatusID])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_AccountStatus]
GO
ALTER TABLE [dbo].[HouseForRent]  WITH CHECK ADD  CONSTRAINT [FK_HouseForRent_Account] FOREIGN KEY([AccountID])
REFERENCES [dbo].[Account] ([AccountID])
GO
ALTER TABLE [dbo].[HouseForRent] CHECK CONSTRAINT [FK_HouseForRent_Account]
GO
ALTER TABLE [dbo].[HouseForRent]  WITH CHECK ADD  CONSTRAINT [FK_HouseForRent_City] FOREIGN KEY([CityID])
REFERENCES [dbo].[City] ([CityID])
GO
ALTER TABLE [dbo].[HouseForRent] CHECK CONSTRAINT [FK_HouseForRent_City]
GO
ALTER TABLE [dbo].[HouseForRent]  WITH CHECK ADD  CONSTRAINT [FK_HouseForRent_Status] FOREIGN KEY([StatusID])
REFERENCES [dbo].[Status] ([StatusID])
GO
ALTER TABLE [dbo].[HouseForRent] CHECK CONSTRAINT [FK_HouseForRent_Status]
GO
ALTER TABLE [dbo].[HouseForRent]  WITH CHECK ADD  CONSTRAINT [FK_HouseForRent_Township] FOREIGN KEY([TownshipID])
REFERENCES [dbo].[Township] ([TownshipID])
GO
ALTER TABLE [dbo].[HouseForRent] CHECK CONSTRAINT [FK_HouseForRent_Township]
GO
ALTER TABLE [dbo].[Image]  WITH CHECK ADD  CONSTRAINT [FK_Image_HouseForRent] FOREIGN KEY([HouseID])
REFERENCES [dbo].[HouseForRent] ([HouseID])
GO
ALTER TABLE [dbo].[Image] CHECK CONSTRAINT [FK_Image_HouseForRent]
GO
ALTER TABLE [dbo].[Info]  WITH CHECK ADD  CONSTRAINT [FK_Info_Account] FOREIGN KEY([AccountID])
REFERENCES [dbo].[Account] ([AccountID])
GO
ALTER TABLE [dbo].[Info] CHECK CONSTRAINT [FK_Info_Account]
GO
ALTER TABLE [dbo].[Info]  WITH CHECK ADD  CONSTRAINT [FK_Info_City] FOREIGN KEY([CityID])
REFERENCES [dbo].[City] ([CityID])
GO
ALTER TABLE [dbo].[Info] CHECK CONSTRAINT [FK_Info_City]
GO
ALTER TABLE [dbo].[Info]  WITH CHECK ADD  CONSTRAINT [FK_Info_Township] FOREIGN KEY([TownshipID])
REFERENCES [dbo].[Township] ([TownshipID])
GO
ALTER TABLE [dbo].[Info] CHECK CONSTRAINT [FK_Info_Township]
GO
ALTER TABLE [dbo].[Messenger]  WITH CHECK ADD  CONSTRAINT [FK_Messenger_Account] FOREIGN KEY([Receiver])
REFERENCES [dbo].[Account] ([AccountID])
GO
ALTER TABLE [dbo].[Messenger] CHECK CONSTRAINT [FK_Messenger_Account]
GO
ALTER TABLE [dbo].[Post]  WITH CHECK ADD  CONSTRAINT [FK_Post_HouseForRent] FOREIGN KEY([HouseID])
REFERENCES [dbo].[HouseForRent] ([HouseID])
GO
ALTER TABLE [dbo].[Post] CHECK CONSTRAINT [FK_Post_HouseForRent]
GO
ALTER TABLE [dbo].[Renter]  WITH CHECK ADD  CONSTRAINT [FK_Renter_HouseForRent] FOREIGN KEY([HouseID])
REFERENCES [dbo].[HouseForRent] ([HouseID])
GO
ALTER TABLE [dbo].[Renter] CHECK CONSTRAINT [FK_Renter_HouseForRent]
GO
ALTER TABLE [dbo].[Township]  WITH CHECK ADD  CONSTRAINT [FK_Township_City] FOREIGN KEY([CityID])
REFERENCES [dbo].[City] ([CityID])
GO
ALTER TABLE [dbo].[Township] CHECK CONSTRAINT [FK_Township_City]
GO
ALTER TABLE [dbo].[University]  WITH CHECK ADD  CONSTRAINT [FK_University_City] FOREIGN KEY([CityID])
REFERENCES [dbo].[City] ([CityID])
GO
ALTER TABLE [dbo].[University] CHECK CONSTRAINT [FK_University_City]
GO
ALTER TABLE [dbo].[University]  WITH CHECK ADD  CONSTRAINT [FK_University_Township] FOREIGN KEY([TownshipID])
REFERENCES [dbo].[Township] ([TownshipID])
GO
ALTER TABLE [dbo].[University] CHECK CONSTRAINT [FK_University_Township]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = -288
         Left = 0
      End
      Begin Tables = 
         Begin Table = "HouseForRent"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 210
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Account"
            Begin Extent = 
               Top = 6
               Left = 248
               Bottom = 136
               Right = 425
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Info"
            Begin Extent = 
               Top = 138
               Left = 38
               Bottom = 268
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "City"
            Begin Extent = 
               Top = 138
               Left = 246
               Bottom = 234
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Status"
            Begin Extent = 
               Top = 234
               Left = 246
               Bottom = 330
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Post"
            Begin Extent = 
               Top = 270
               Left = 38
               Bottom = 400
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Township"
            Begin Extent = 
               Top = 330
               Left = 246
               Bottom = 460
               Right = 419
            End
            DisplayFlags = 280
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'SearchResult'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'            TopColumn = 0
         End
         Begin Table = "Image"
            Begin Extent = 
               Top = 402
               Left = 38
               Bottom = 553
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'SearchResult'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'SearchResult'
GO
USE [master]
GO
ALTER DATABASE [Group14] SET  READ_WRITE 
GO
