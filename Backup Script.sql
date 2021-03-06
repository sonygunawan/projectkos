USE [digisoftid_db]
GO
/****** Object:  StoredProcedure [dbo].[LIK_InsertFormKosLingkungan]    Script Date: 2/17/2017 5:45:55 PM ******/
DROP PROCEDURE [dbo].[LIK_InsertFormKosLingkungan]
GO
/****** Object:  StoredProcedure [dbo].[LIK_InsertFormKosHarga]    Script Date: 2/17/2017 5:45:55 PM ******/
DROP PROCEDURE [dbo].[LIK_InsertFormKosHarga]
GO
/****** Object:  StoredProcedure [dbo].[LIK_InsertFormKosFasilitas]    Script Date: 2/17/2017 5:45:55 PM ******/
DROP PROCEDURE [dbo].[LIK_InsertFormKosFasilitas]
GO
/****** Object:  StoredProcedure [dbo].[LIK_InsertFormKos]    Script Date: 2/17/2017 5:45:55 PM ******/
DROP PROCEDURE [dbo].[LIK_InsertFormKos]
GO
/****** Object:  StoredProcedure [dbo].[LIK_GetMaxFormKos]    Script Date: 2/17/2017 5:45:55 PM ******/
DROP PROCEDURE [dbo].[LIK_GetMaxFormKos]
GO
/****** Object:  StoredProcedure [dbo].[LIK_GetAllTipeKos]    Script Date: 2/17/2017 5:45:55 PM ******/
DROP PROCEDURE [dbo].[LIK_GetAllTipeKos]
GO
/****** Object:  StoredProcedure [dbo].[LIK_GetAllPaymentBulan]    Script Date: 2/17/2017 5:45:55 PM ******/
DROP PROCEDURE [dbo].[LIK_GetAllPaymentBulan]
GO
/****** Object:  StoredProcedure [dbo].[LIK_GetAllLingkungan]    Script Date: 2/17/2017 5:45:55 PM ******/
DROP PROCEDURE [dbo].[LIK_GetAllLingkungan]
GO
/****** Object:  StoredProcedure [dbo].[LIK_GetAllFasilitas]    Script Date: 2/17/2017 5:45:55 PM ******/
DROP PROCEDURE [dbo].[LIK_GetAllFasilitas]
GO
/****** Object:  StoredProcedure [dbo].[LIK_GetAllBanner]    Script Date: 2/17/2017 5:45:55 PM ******/
DROP PROCEDURE [dbo].[LIK_GetAllBanner]
GO
/****** Object:  StoredProcedure [dbo].[LIK_GetAllArea]    Script Date: 2/17/2017 5:45:55 PM ******/
DROP PROCEDURE [dbo].[LIK_GetAllArea]
GO
/****** Object:  StoredProcedure [dbo].[LIK_DoSignIn]    Script Date: 2/17/2017 5:45:55 PM ******/
DROP PROCEDURE [dbo].[LIK_DoSignIn]
GO
/****** Object:  StoredProcedure [dbo].[LIK_DoRegister]    Script Date: 2/17/2017 5:45:55 PM ******/
DROP PROCEDURE [dbo].[LIK_DoRegister]
GO
ALTER TABLE [dbo].[tblTrKosHarga] DROP CONSTRAINT [FK_tblTrKosHarga_tblTempatKos]
GO
ALTER TABLE [dbo].[tblTrKosHarga] DROP CONSTRAINT [FK_tblTrKosHarga_tblSatuanHarga]
GO
ALTER TABLE [dbo].[tblMembership] DROP CONSTRAINT [FK_tblMembership_tblUser]
GO
/****** Object:  Table [dbo].[tblUser]    Script Date: 2/17/2017 5:45:55 PM ******/
DROP TABLE [dbo].[tblUser]
GO
/****** Object:  Table [dbo].[tblTrKosHarga]    Script Date: 2/17/2017 5:45:55 PM ******/
DROP TABLE [dbo].[tblTrKosHarga]
GO
/****** Object:  Table [dbo].[tblTrFormKosLingkungan]    Script Date: 2/17/2017 5:45:55 PM ******/
DROP TABLE [dbo].[tblTrFormKosLingkungan]
GO
/****** Object:  Table [dbo].[tblTrFormKosHarga]    Script Date: 2/17/2017 5:45:55 PM ******/
DROP TABLE [dbo].[tblTrFormKosHarga]
GO
/****** Object:  Table [dbo].[tblTrFormKosFasilitas]    Script Date: 2/17/2017 5:45:55 PM ******/
DROP TABLE [dbo].[tblTrFormKosFasilitas]
GO
/****** Object:  Table [dbo].[tblTrFasilitas]    Script Date: 2/17/2017 5:45:55 PM ******/
DROP TABLE [dbo].[tblTrFasilitas]
GO
/****** Object:  Table [dbo].[tblTempatKos]    Script Date: 2/17/2017 5:45:55 PM ******/
DROP TABLE [dbo].[tblTempatKos]
GO
/****** Object:  Table [dbo].[tblSatuanHarga]    Script Date: 2/17/2017 5:45:55 PM ******/
DROP TABLE [dbo].[tblSatuanHarga]
GO
/****** Object:  Table [dbo].[tblMsTipeUser]    Script Date: 2/17/2017 5:45:55 PM ******/
DROP TABLE [dbo].[tblMsTipeUser]
GO
/****** Object:  Table [dbo].[tblMsTipeKos]    Script Date: 2/17/2017 5:45:55 PM ******/
DROP TABLE [dbo].[tblMsTipeKos]
GO
/****** Object:  Table [dbo].[tblMsPaymentBulan]    Script Date: 2/17/2017 5:45:55 PM ******/
DROP TABLE [dbo].[tblMsPaymentBulan]
GO
/****** Object:  Table [dbo].[tblMsLingkungan]    Script Date: 2/17/2017 5:45:55 PM ******/
DROP TABLE [dbo].[tblMsLingkungan]
GO
/****** Object:  Table [dbo].[tblMsFasilitas]    Script Date: 2/17/2017 5:45:55 PM ******/
DROP TABLE [dbo].[tblMsFasilitas]
GO
/****** Object:  Table [dbo].[tblMembership]    Script Date: 2/17/2017 5:45:55 PM ******/
DROP TABLE [dbo].[tblMembership]
GO
/****** Object:  Table [dbo].[tblImage]    Script Date: 2/17/2017 5:45:55 PM ******/
DROP TABLE [dbo].[tblImage]
GO
/****** Object:  Table [dbo].[tblFormKos]    Script Date: 2/17/2017 5:45:55 PM ******/
DROP TABLE [dbo].[tblFormKos]
GO
/****** Object:  Table [dbo].[tblBanner]    Script Date: 2/17/2017 5:45:55 PM ******/
DROP TABLE [dbo].[tblBanner]
GO
/****** Object:  Table [dbo].[tblArea]    Script Date: 2/17/2017 5:45:55 PM ******/
DROP TABLE [dbo].[tblArea]
GO
USE [master]
GO
/****** Object:  Database [digisoftid_db]    Script Date: 2/17/2017 5:45:55 PM ******/
DROP DATABASE [digisoftid_db]
GO
/****** Object:  Database [digisoftid_db]    Script Date: 2/17/2017 5:45:55 PM ******/
CREATE DATABASE [digisoftid_db]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'digisoftid_db', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\digisoftid_db.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'digisoftid_db_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\digisoftid_db_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [digisoftid_db] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [digisoftid_db].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [digisoftid_db] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [digisoftid_db] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [digisoftid_db] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [digisoftid_db] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [digisoftid_db] SET ARITHABORT OFF 
GO
ALTER DATABASE [digisoftid_db] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [digisoftid_db] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [digisoftid_db] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [digisoftid_db] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [digisoftid_db] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [digisoftid_db] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [digisoftid_db] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [digisoftid_db] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [digisoftid_db] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [digisoftid_db] SET  DISABLE_BROKER 
GO
ALTER DATABASE [digisoftid_db] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [digisoftid_db] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [digisoftid_db] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [digisoftid_db] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [digisoftid_db] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [digisoftid_db] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [digisoftid_db] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [digisoftid_db] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [digisoftid_db] SET  MULTI_USER 
GO
ALTER DATABASE [digisoftid_db] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [digisoftid_db] SET DB_CHAINING OFF 
GO
ALTER DATABASE [digisoftid_db] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [digisoftid_db] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [digisoftid_db] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [digisoftid_db] SET QUERY_STORE = OFF
GO
USE [digisoftid_db]
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [digisoftid_db]
GO
/****** Object:  Table [dbo].[tblArea]    Script Date: 2/17/2017 5:45:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblArea](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Kode] [varchar](50) NULL,
	[Nama] [varchar](500) NULL,
	[Deskripsi] [text] NULL,
 CONSTRAINT [PK_tblLokasi] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblBanner]    Script Date: 2/17/2017 5:45:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblBanner](
	[ID] [int] NOT NULL,
	[Kode] [varchar](50) NULL,
	[Nama] [varchar](250) NULL,
	[Deskripsi] [text] NULL,
	[FilePath] [text] NULL,
	[Url] [text] NULL,
	[Prioritas] [int] NULL,
 CONSTRAINT [PK_tblBanner] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblFormKos]    Script Date: 2/17/2017 5:45:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblFormKos](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Kode] [varchar](50) NULL,
	[Nama] [varchar](250) NULL,
	[Deskripsi] [text] NULL,
	[Alamat] [text] NULL,
	[AreaID] [int] NULL,
	[Altitude] [decimal](9, 6) NULL,
	[Longitude] [decimal](9, 6) NULL,
	[ImageID] [bigint] NULL,
	[NamaPemilik] [varchar](250) NULL,
	[AlamatPemilik] [text] NULL,
	[KontakPemilik] [varchar](50) NULL,
	[NamaPengelola] [varchar](250) NULL,
	[AlamatPengelola] [text] NULL,
	[KontakPengelola] [varchar](50) NULL,
	[MinimumBayarMonth] [int] NULL,
	[MinimumBayarDesc] [text] NULL,
	[JmlKamar] [int] NULL,
	[LuasKamar] [decimal](9, 4) NULL,
	[TipeKosID] [int] NULL,
	[JmlKamarKosong] [int] NULL,
	[PetID] [bit] NULL,
	[Keterangan] [text] NULL,
	[UserID] [bigint] NULL,
 CONSTRAINT [PK_tblformKos] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblImage]    Script Date: 2/17/2017 5:45:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblImage](
	[ID] [bigint] NOT NULL,
	[Kode] [varchar](50) NULL,
	[Nama] [varchar](250) NULL,
	[Deskripsi] [text] NULL,
	[Utama] [int] NULL,
	[FilePath] [text] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblMembership]    Script Date: 2/17/2017 5:45:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblMembership](
	[UserID] [bigint] NOT NULL,
	[Email] [varchar](500) NULL,
	[Password] [varchar](128) NOT NULL,
	[PasswordFormat] [int] NOT NULL,
	[PasswordSalt] [varchar](128) NOT NULL,
	[TipeUser] [int] NULL,
	[Aktif] [int] NOT NULL,
	[IsApproved] [bit] NOT NULL,
	[IsLockedout] [bit] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[LastLoginDate] [datetime] NOT NULL,
	[LastPasswordChangedDate] [datetime] NOT NULL,
	[LastChangeAktifDate] [datetime] NOT NULL,
	[LastLockedoutDate] [datetime] NOT NULL,
	[FailedPasswordAttemptCount] [int] NOT NULL,
	[Comment] [varchar](500) NULL,
 CONSTRAINT [PK_Table_1] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblMsFasilitas]    Script Date: 2/17/2017 5:45:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblMsFasilitas](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Kode] [varchar](50) NULL,
	[NamaFasilitas] [varchar](500) NULL,
	[Deskripsi] [text] NULL,
 CONSTRAINT [PK_tblMsFasilitas] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblMsLingkungan]    Script Date: 2/17/2017 5:45:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblMsLingkungan](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Kode] [varchar](50) NULL,
	[Nama] [varchar](500) NULL,
	[Deskripsi] [text] NULL,
 CONSTRAINT [PK_tblMsLingkungan] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblMsPaymentBulan]    Script Date: 2/17/2017 5:45:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblMsPaymentBulan](
	[ID] [int] NOT NULL,
	[Kode] [varchar](50) NULL,
	[Nama] [varchar](50) NULL,
	[Deskripsi] [text] NULL,
 CONSTRAINT [PK_tblMsPaymentBulan] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblMsTipeKos]    Script Date: 2/17/2017 5:45:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblMsTipeKos](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Kode] [varchar](50) NULL,
	[Nama] [varchar](200) NULL,
	[Deskripsi] [text] NULL,
 CONSTRAINT [PK_tblMsTipeKos] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblMsTipeUser]    Script Date: 2/17/2017 5:45:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblMsTipeUser](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Kode] [varchar](50) NULL,
	[Nama] [varchar](200) NULL,
	[Deskripsi] [text] NULL,
 CONSTRAINT [PK_tblMsTipeUser] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblSatuanHarga]    Script Date: 2/17/2017 5:45:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSatuanHarga](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Kode] [varchar](50) NULL,
	[Nama] [varchar](500) NULL,
	[Deskripsi] [text] NULL,
 CONSTRAINT [PK_tblSatuanHarga] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblTempatKos]    Script Date: 2/17/2017 5:45:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTempatKos](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Kode] [varchar](50) NULL,
	[Nama] [varchar](250) NULL,
	[Deskripsi] [text] NULL,
	[Alamat] [text] NULL,
	[AreaID] [int] NULL,
	[Altitude] [float] NULL,
	[Longitude] [float] NULL,
	[ImageID] [bigint] NULL,
	[ViewKos] [bigint] NULL,
	[Status] [int] NULL,
	[StatusPenuh] [int] NULL,
 CONSTRAINT [PK_tblTempatKos] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblTrFasilitas]    Script Date: 2/17/2017 5:45:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTrFasilitas](
	[TempatKosID] [bigint] NOT NULL,
	[FasilitasID] [int] NOT NULL,
	[Status] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblTrFormKosFasilitas]    Script Date: 2/17/2017 5:45:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTrFormKosFasilitas](
	[FormKosID] [bigint] NOT NULL,
	[FormKosFasilitasID] [int] NOT NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_tblTrFormKosFasilitas] PRIMARY KEY CLUSTERED 
(
	[FormKosID] ASC,
	[FormKosFasilitasID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblTrFormKosHarga]    Script Date: 2/17/2017 5:45:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTrFormKosHarga](
	[FormKosID] [bigint] NOT NULL,
	[SatuanHargaID] [int] NOT NULL,
	[Harga] [decimal](18, 2) NULL,
	[Deskripsi] [text] NULL,
 CONSTRAINT [PK_tblTrFormKosHarga] PRIMARY KEY CLUSTERED 
(
	[FormKosID] ASC,
	[SatuanHargaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblTrFormKosLingkungan]    Script Date: 2/17/2017 5:45:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTrFormKosLingkungan](
	[FormKosID] [bigint] NOT NULL,
	[FormKosLingkunganID] [int] NOT NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_tblTrFormKosLingkungan] PRIMARY KEY CLUSTERED 
(
	[FormKosID] ASC,
	[FormKosLingkunganID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblTrKosHarga]    Script Date: 2/17/2017 5:45:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTrKosHarga](
	[KOSID] [bigint] NOT NULL,
	[SatuanHargaID] [int] NOT NULL,
	[Harga] [decimal](9, 2) NULL,
	[Deskripsi] [text] NULL,
 CONSTRAINT [PK_tblTrKosHarga] PRIMARY KEY CLUSTERED 
(
	[KOSID] ASC,
	[SatuanHargaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblUser]    Script Date: 2/17/2017 5:45:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUser](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](500) NULL,
	[LastActivityDate] [datetime] NOT NULL,
 CONSTRAINT [PK_tblUser] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[tblArea] ON 

INSERT [dbo].[tblArea] ([ID], [Kode], [Nama], [Deskripsi]) VALUES (1, N'AR-001', N'Jakarta', NULL)
INSERT [dbo].[tblArea] ([ID], [Kode], [Nama], [Deskripsi]) VALUES (2, N'AR-002', N'Bandung', NULL)
INSERT [dbo].[tblArea] ([ID], [Kode], [Nama], [Deskripsi]) VALUES (3, N'AR-003', N'Surabaya', NULL)
SET IDENTITY_INSERT [dbo].[tblArea] OFF
INSERT [dbo].[tblBanner] ([ID], [Kode], [Nama], [Deskripsi], [FilePath], [Url], [Prioritas]) VALUES (1, N'BN-001', N'Banner1', NULL, N'images/photos/banner.jpg', NULL, 1)
INSERT [dbo].[tblBanner] ([ID], [Kode], [Nama], [Deskripsi], [FilePath], [Url], [Prioritas]) VALUES (2, N'BN-002', N'Banner2', NULL, N'images/photos/1900x849.png', NULL, 2)
INSERT [dbo].[tblBanner] ([ID], [Kode], [Nama], [Deskripsi], [FilePath], [Url], [Prioritas]) VALUES (3, N'BN-003', N'Banner3', NULL, N'images/photos/1900x849.png', NULL, 3)
INSERT [dbo].[tblBanner] ([ID], [Kode], [Nama], [Deskripsi], [FilePath], [Url], [Prioritas]) VALUES (4, N'BN-004', N'Banner4', NULL, N'images/photos/1900x849.png', NULL, 4)
INSERT [dbo].[tblBanner] ([ID], [Kode], [Nama], [Deskripsi], [FilePath], [Url], [Prioritas]) VALUES (5, N'BN-005', N'Banner5', NULL, N'images/photos/1900x849.png', NULL, 5)
SET IDENTITY_INSERT [dbo].[tblFormKos] ON 

INSERT [dbo].[tblFormKos] ([ID], [Kode], [Nama], [Deskripsi], [Alamat], [AreaID], [Altitude], [Longitude], [ImageID], [NamaPemilik], [AlamatPemilik], [KontakPemilik], [NamaPengelola], [AlamatPengelola], [KontakPengelola], [MinimumBayarMonth], [MinimumBayarDesc], [JmlKamar], [LuasKamar], [TipeKosID], [JmlKamarKosong], [PetID], [Keterangan], [UserID]) VALUES (1, N'FK-0000001', N'nama', N'desc', N'alamat', 1, CAST(-6.288083 AS Decimal(9, 6)), CAST(106.593590 AS Decimal(9, 6)), 0, N'pemilik', N'alamat', N'533424', N'pengelola', NULL, N'34654656', 3, N'ket min bayar', 4, CAST(248.0000 AS Decimal(9, 4)), 1, 1, 0, N'lain lain', 1)
INSERT [dbo].[tblFormKos] ([ID], [Kode], [Nama], [Deskripsi], [Alamat], [AreaID], [Altitude], [Longitude], [ImageID], [NamaPemilik], [AlamatPemilik], [KontakPemilik], [NamaPengelola], [AlamatPengelola], [KontakPengelola], [MinimumBayarMonth], [MinimumBayarDesc], [JmlKamar], [LuasKamar], [TipeKosID], [JmlKamarKosong], [PetID], [Keterangan], [UserID]) VALUES (2, N'FK-0000002', N'nama', N'desc', N'alamat', 1, CAST(-6.288083 AS Decimal(9, 6)), CAST(106.593590 AS Decimal(9, 6)), 0, N'pemilik', N'alamat', N'533424', N'pengelola', NULL, N'34654656', 3, N'ket min bayar', 4, CAST(248.0000 AS Decimal(9, 4)), 1, 1, 1, N'lain lain', 1)
INSERT [dbo].[tblFormKos] ([ID], [Kode], [Nama], [Deskripsi], [Alamat], [AreaID], [Altitude], [Longitude], [ImageID], [NamaPemilik], [AlamatPemilik], [KontakPemilik], [NamaPengelola], [AlamatPengelola], [KontakPengelola], [MinimumBayarMonth], [MinimumBayarDesc], [JmlKamar], [LuasKamar], [TipeKosID], [JmlKamarKosong], [PetID], [Keterangan], [UserID]) VALUES (3, N'FK-0000003', N'nama', N'desc', N'alamat', 1, CAST(-6.288083 AS Decimal(9, 6)), CAST(106.593590 AS Decimal(9, 6)), 0, N'pemilik', N'alamat', N'533424', N'pengelola', NULL, N'34654656', 3, N'ket min bayar', 4, CAST(248.0000 AS Decimal(9, 4)), 1, 1, 1, N'lain lain', 1)
INSERT [dbo].[tblFormKos] ([ID], [Kode], [Nama], [Deskripsi], [Alamat], [AreaID], [Altitude], [Longitude], [ImageID], [NamaPemilik], [AlamatPemilik], [KontakPemilik], [NamaPengelola], [AlamatPengelola], [KontakPengelola], [MinimumBayarMonth], [MinimumBayarDesc], [JmlKamar], [LuasKamar], [TipeKosID], [JmlKamarKosong], [PetID], [Keterangan], [UserID]) VALUES (4, N'FK-0000004', N'nama', N'desc', N'alamat bandung', 2, CAST(-6.908266 AS Decimal(9, 6)), CAST(107.609222 AS Decimal(9, 6)), 0, N'pemilik', N'alamat pemilik', N'34234', N'pengelola', NULL, N'374827348', 24, N'ket min bayar', 4, CAST(56.6000 AS Decimal(9, 4)), 2, 1, 1, N'asdf', 1)
INSERT [dbo].[tblFormKos] ([ID], [Kode], [Nama], [Deskripsi], [Alamat], [AreaID], [Altitude], [Longitude], [ImageID], [NamaPemilik], [AlamatPemilik], [KontakPemilik], [NamaPengelola], [AlamatPengelola], [KontakPengelola], [MinimumBayarMonth], [MinimumBayarDesc], [JmlKamar], [LuasKamar], [TipeKosID], [JmlKamarKosong], [PetID], [Keterangan], [UserID]) VALUES (5, N'FK-0000005', N'nama', N'desc', N'alamat test', 1, CAST(-6.193758 AS Decimal(9, 6)), CAST(106.634613 AS Decimal(9, 6)), 0, N'nama pemilik', N'alamat pemilik', N'84738478', N'nama pengelola', NULL, N'23847289374987', 9, N'ket min bayar', 45, CAST(700.9600 AS Decimal(9, 4)), 1, 43, 0, N'test lain lain', 1)
INSERT [dbo].[tblFormKos] ([ID], [Kode], [Nama], [Deskripsi], [Alamat], [AreaID], [Altitude], [Longitude], [ImageID], [NamaPemilik], [AlamatPemilik], [KontakPemilik], [NamaPengelola], [AlamatPengelola], [KontakPengelola], [MinimumBayarMonth], [MinimumBayarDesc], [JmlKamar], [LuasKamar], [TipeKosID], [JmlKamarKosong], [PetID], [Keterangan], [UserID]) VALUES (6, N'FK-0000006', N'test name', N'desc', N'bandengan', 1, CAST(-6.136259 AS Decimal(9, 6)), CAST(106.803459 AS Decimal(9, 6)), 0, N'nama', N'alamat', N'23847', N'nama pengelola', NULL, N'38473874', 2, N'ket min bayar', 12, CAST(25.9000 AS Decimal(9, 4)), 3, 2, 0, N'ket lain lain', 1)
INSERT [dbo].[tblFormKos] ([ID], [Kode], [Nama], [Deskripsi], [Alamat], [AreaID], [Altitude], [Longitude], [ImageID], [NamaPemilik], [AlamatPemilik], [KontakPemilik], [NamaPengelola], [AlamatPengelola], [KontakPengelola], [MinimumBayarMonth], [MinimumBayarDesc], [JmlKamar], [LuasKamar], [TipeKosID], [JmlKamarKosong], [PetID], [Keterangan], [UserID]) VALUES (7, N'FK-0000007', N'test name', N'desc', N'bandengan', 1, CAST(-6.117821 AS Decimal(9, 6)), CAST(106.786293 AS Decimal(9, 6)), 0, N'nama2', N'alamat', N'23847', N'nama pengelola', NULL, N'38473874', 2, N'ket min bayar', 12, CAST(25.9000 AS Decimal(9, 4)), 3, 2, 0, N'ket lain lain2', 1)
INSERT [dbo].[tblFormKos] ([ID], [Kode], [Nama], [Deskripsi], [Alamat], [AreaID], [Altitude], [Longitude], [ImageID], [NamaPemilik], [AlamatPemilik], [KontakPemilik], [NamaPengelola], [AlamatPengelola], [KontakPengelola], [MinimumBayarMonth], [MinimumBayarDesc], [JmlKamar], [LuasKamar], [TipeKosID], [JmlKamarKosong], [PetID], [Keterangan], [UserID]) VALUES (8, N'FK-0000008', N'nama 3', N'test desc', N'bandeng', 1, CAST(-6.136299 AS Decimal(9, 6)), CAST(106.800735 AS Decimal(9, 6)), 0, N'nama pemilik2', N'alamat jpemilij', N'238478', N'nama pengelola 2', NULL, N'5455', 4, N'ket min bayar', 24, CAST(44.8000 AS Decimal(9, 4)), 3, 3, 0, N'ket lain lain', 1)
INSERT [dbo].[tblFormKos] ([ID], [Kode], [Nama], [Deskripsi], [Alamat], [AreaID], [Altitude], [Longitude], [ImageID], [NamaPemilik], [AlamatPemilik], [KontakPemilik], [NamaPengelola], [AlamatPengelola], [KontakPengelola], [MinimumBayarMonth], [MinimumBayarDesc], [JmlKamar], [LuasKamar], [TipeKosID], [JmlKamarKosong], [PetID], [Keterangan], [UserID]) VALUES (9, N'FK-0000009', N'nama 3', N'test desc', N'bandeng', 1, CAST(-6.136299 AS Decimal(9, 6)), CAST(106.800735 AS Decimal(9, 6)), 0, N'nama pemilik2', N'alamat jpemilij', N'238478', N'nama pengelola 2', NULL, N'5455', 4, N'ket min bayar', 24, CAST(44.8000 AS Decimal(9, 4)), 3, 3, 0, N'ket lain lain', 1)
INSERT [dbo].[tblFormKos] ([ID], [Kode], [Nama], [Deskripsi], [Alamat], [AreaID], [Altitude], [Longitude], [ImageID], [NamaPemilik], [AlamatPemilik], [KontakPemilik], [NamaPengelola], [AlamatPengelola], [KontakPengelola], [MinimumBayarMonth], [MinimumBayarDesc], [JmlKamar], [LuasKamar], [TipeKosID], [JmlKamarKosong], [PetID], [Keterangan], [UserID]) VALUES (10, N'FK-0000010', N'nama 3', N'test desc', N'bandeng', 1, CAST(-6.136299 AS Decimal(9, 6)), CAST(106.800735 AS Decimal(9, 6)), 0, N'nama pemilik2', N'alamat jpemilij', N'238478', N'nama pengelola 2', NULL, N'5455', 4, N'ket min bayar', 24, CAST(44.8000 AS Decimal(9, 4)), 3, 3, 0, N'ket lain lain', 1)
SET IDENTITY_INSERT [dbo].[tblFormKos] OFF
INSERT [dbo].[tblMembership] ([UserID], [Email], [Password], [PasswordFormat], [PasswordSalt], [TipeUser], [Aktif], [IsApproved], [IsLockedout], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastChangeAktifDate], [LastLockedoutDate], [FailedPasswordAttemptCount], [Comment]) VALUES (1, N'adminsystem@lihatkos.com', N'abcde!!12345', 1, N'1', 1, 1, 1, 0, CAST(N'2017-02-14T09:26:15.487' AS DateTime), CAST(N'2017-02-14T09:26:15.487' AS DateTime), CAST(N'1754-01-01T00:00:00.000' AS DateTime), CAST(N'2017-02-14T09:26:15.487' AS DateTime), CAST(N'1754-01-01T00:00:00.000' AS DateTime), 0, NULL)
SET IDENTITY_INSERT [dbo].[tblMsFasilitas] ON 

INSERT [dbo].[tblMsFasilitas] ([ID], [Kode], [NamaFasilitas], [Deskripsi]) VALUES (1, N'FS-001', N'TV', NULL)
INSERT [dbo].[tblMsFasilitas] ([ID], [Kode], [NamaFasilitas], [Deskripsi]) VALUES (2, N'FS-002', N'AC', NULL)
INSERT [dbo].[tblMsFasilitas] ([ID], [Kode], [NamaFasilitas], [Deskripsi]) VALUES (3, N'FS-003', N'WIFI', NULL)
INSERT [dbo].[tblMsFasilitas] ([ID], [Kode], [NamaFasilitas], [Deskripsi]) VALUES (4, N'FS-004', N'Dispenser', NULL)
INSERT [dbo].[tblMsFasilitas] ([ID], [Kode], [NamaFasilitas], [Deskripsi]) VALUES (5, N'FS-005', N'Kulkas', NULL)
INSERT [dbo].[tblMsFasilitas] ([ID], [Kode], [NamaFasilitas], [Deskripsi]) VALUES (6, N'FS-006', N'Kamar Mandi', NULL)
INSERT [dbo].[tblMsFasilitas] ([ID], [Kode], [NamaFasilitas], [Deskripsi]) VALUES (7, N'FS-007', N'Non-Furnished', NULL)
SET IDENTITY_INSERT [dbo].[tblMsFasilitas] OFF
SET IDENTITY_INSERT [dbo].[tblMsLingkungan] ON 

INSERT [dbo].[tblMsLingkungan] ([ID], [Kode], [Nama], [Deskripsi]) VALUES (1, N'AL-001', N'Restoran', NULL)
INSERT [dbo].[tblMsLingkungan] ([ID], [Kode], [Nama], [Deskripsi]) VALUES (2, N'AL-002', N'Mini Market', NULL)
INSERT [dbo].[tblMsLingkungan] ([ID], [Kode], [Nama], [Deskripsi]) VALUES (3, N'AL-003', N'Laundry', NULL)
INSERT [dbo].[tblMsLingkungan] ([ID], [Kode], [Nama], [Deskripsi]) VALUES (4, N'AL-004', N'ATM', NULL)
INSERT [dbo].[tblMsLingkungan] ([ID], [Kode], [Nama], [Deskripsi]) VALUES (5, N'AL-005', N'Apotik', NULL)
INSERT [dbo].[tblMsLingkungan] ([ID], [Kode], [Nama], [Deskripsi]) VALUES (6, N'AL-006', N'Rumah Sakit/Klinik', NULL)
INSERT [dbo].[tblMsLingkungan] ([ID], [Kode], [Nama], [Deskripsi]) VALUES (7, N'AL-007', N'Kampus', NULL)
INSERT [dbo].[tblMsLingkungan] ([ID], [Kode], [Nama], [Deskripsi]) VALUES (8, N'AL-008', N'Sekolah', NULL)
INSERT [dbo].[tblMsLingkungan] ([ID], [Kode], [Nama], [Deskripsi]) VALUES (9, N'AL-009', N'Halte Bus', NULL)
INSERT [dbo].[tblMsLingkungan] ([ID], [Kode], [Nama], [Deskripsi]) VALUES (10, N'AL-010', N'Pos Ojek', NULL)
INSERT [dbo].[tblMsLingkungan] ([ID], [Kode], [Nama], [Deskripsi]) VALUES (11, N'AL-011', N'Shopping Mall', NULL)
INSERT [dbo].[tblMsLingkungan] ([ID], [Kode], [Nama], [Deskripsi]) VALUES (12, N'AL-012', N'Bioskop', NULL)
SET IDENTITY_INSERT [dbo].[tblMsLingkungan] OFF
INSERT [dbo].[tblMsPaymentBulan] ([ID], [Kode], [Nama], [Deskripsi]) VALUES (1, N'PB-001', N'1 Bulan', NULL)
INSERT [dbo].[tblMsPaymentBulan] ([ID], [Kode], [Nama], [Deskripsi]) VALUES (2, N'PB-002', N'2 Bulan', NULL)
INSERT [dbo].[tblMsPaymentBulan] ([ID], [Kode], [Nama], [Deskripsi]) VALUES (3, N'PB-003', N'3 Bulan', NULL)
INSERT [dbo].[tblMsPaymentBulan] ([ID], [Kode], [Nama], [Deskripsi]) VALUES (4, N'PB-004', N'4 Bulan', NULL)
INSERT [dbo].[tblMsPaymentBulan] ([ID], [Kode], [Nama], [Deskripsi]) VALUES (5, N'PB-005', N'5 Bulan', NULL)
INSERT [dbo].[tblMsPaymentBulan] ([ID], [Kode], [Nama], [Deskripsi]) VALUES (6, N'PB-006', N'6 Bulan', NULL)
INSERT [dbo].[tblMsPaymentBulan] ([ID], [Kode], [Nama], [Deskripsi]) VALUES (7, N'PB-007', N'7 Bulan', NULL)
INSERT [dbo].[tblMsPaymentBulan] ([ID], [Kode], [Nama], [Deskripsi]) VALUES (8, N'PB-008', N'8 Bulan', NULL)
INSERT [dbo].[tblMsPaymentBulan] ([ID], [Kode], [Nama], [Deskripsi]) VALUES (9, N'PB-009', N'9 Bulan', NULL)
INSERT [dbo].[tblMsPaymentBulan] ([ID], [Kode], [Nama], [Deskripsi]) VALUES (10, N'PB-010', N'10 Bulan', NULL)
INSERT [dbo].[tblMsPaymentBulan] ([ID], [Kode], [Nama], [Deskripsi]) VALUES (11, N'PB-011', N'11 Bulan', NULL)
INSERT [dbo].[tblMsPaymentBulan] ([ID], [Kode], [Nama], [Deskripsi]) VALUES (12, N'PB-012', N'12 Bulan', NULL)
INSERT [dbo].[tblMsPaymentBulan] ([ID], [Kode], [Nama], [Deskripsi]) VALUES (24, N'PB-024', N'24 Bulan', NULL)
SET IDENTITY_INSERT [dbo].[tblMsTipeKos] ON 

INSERT [dbo].[tblMsTipeKos] ([ID], [Kode], [Nama], [Deskripsi]) VALUES (1, N'TK-001', N'Putra', NULL)
INSERT [dbo].[tblMsTipeKos] ([ID], [Kode], [Nama], [Deskripsi]) VALUES (2, N'TK-002', N'Putri', NULL)
INSERT [dbo].[tblMsTipeKos] ([ID], [Kode], [Nama], [Deskripsi]) VALUES (3, N'TK-003', N'Campur', NULL)
INSERT [dbo].[tblMsTipeKos] ([ID], [Kode], [Nama], [Deskripsi]) VALUES (4, N'TK-004', N'Pasutri', NULL)
SET IDENTITY_INSERT [dbo].[tblMsTipeKos] OFF
SET IDENTITY_INSERT [dbo].[tblMsTipeUser] ON 

INSERT [dbo].[tblMsTipeUser] ([ID], [Kode], [Nama], [Deskripsi]) VALUES (1, N'TU-001', N'Administrator', NULL)
INSERT [dbo].[tblMsTipeUser] ([ID], [Kode], [Nama], [Deskripsi]) VALUES (2, N'TU-002', N'Admin', NULL)
INSERT [dbo].[tblMsTipeUser] ([ID], [Kode], [Nama], [Deskripsi]) VALUES (3, N'TU-003', N'Agen', NULL)
INSERT [dbo].[tblMsTipeUser] ([ID], [Kode], [Nama], [Deskripsi]) VALUES (4, N'TU-004', N'Pemilik Kos', NULL)
INSERT [dbo].[tblMsTipeUser] ([ID], [Kode], [Nama], [Deskripsi]) VALUES (5, N'TU-005', N'Pengurus Kos', NULL)
INSERT [dbo].[tblMsTipeUser] ([ID], [Kode], [Nama], [Deskripsi]) VALUES (6, N'TU-006', N'Penyewa Kos', NULL)
INSERT [dbo].[tblMsTipeUser] ([ID], [Kode], [Nama], [Deskripsi]) VALUES (7, N'TU-007', N'Lainnya', NULL)
SET IDENTITY_INSERT [dbo].[tblMsTipeUser] OFF
SET IDENTITY_INSERT [dbo].[tblSatuanHarga] ON 

INSERT [dbo].[tblSatuanHarga] ([ID], [Kode], [Nama], [Deskripsi]) VALUES (1, N'SH-001', N'HARIAN', NULL)
INSERT [dbo].[tblSatuanHarga] ([ID], [Kode], [Nama], [Deskripsi]) VALUES (2, N'SH-002', N'MINGGUAN', NULL)
INSERT [dbo].[tblSatuanHarga] ([ID], [Kode], [Nama], [Deskripsi]) VALUES (3, N'SH-003', N'BULANAN', NULL)
INSERT [dbo].[tblSatuanHarga] ([ID], [Kode], [Nama], [Deskripsi]) VALUES (4, N'SH-004', N'TAHUNAN', NULL)
SET IDENTITY_INSERT [dbo].[tblSatuanHarga] OFF
SET IDENTITY_INSERT [dbo].[tblTempatKos] ON 

INSERT [dbo].[tblTempatKos] ([ID], [Kode], [Nama], [Deskripsi], [Alamat], [AreaID], [Altitude], [Longitude], [ImageID], [ViewKos], [Status], [StatusPenuh]) VALUES (1, N'aaa', N'test', N'test', N'aaa', 1, 7.999999, 8.777777, 1, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[tblTempatKos] OFF
INSERT [dbo].[tblTrFormKosFasilitas] ([FormKosID], [FormKosFasilitasID], [Status]) VALUES (10, 1, 0)
INSERT [dbo].[tblTrFormKosFasilitas] ([FormKosID], [FormKosFasilitasID], [Status]) VALUES (10, 2, 0)
INSERT [dbo].[tblTrFormKosFasilitas] ([FormKosID], [FormKosFasilitasID], [Status]) VALUES (10, 3, 1)
INSERT [dbo].[tblTrFormKosFasilitas] ([FormKosID], [FormKosFasilitasID], [Status]) VALUES (10, 4, 1)
INSERT [dbo].[tblTrFormKosFasilitas] ([FormKosID], [FormKosFasilitasID], [Status]) VALUES (10, 5, 1)
INSERT [dbo].[tblTrFormKosFasilitas] ([FormKosID], [FormKosFasilitasID], [Status]) VALUES (10, 6, 0)
INSERT [dbo].[tblTrFormKosFasilitas] ([FormKosID], [FormKosFasilitasID], [Status]) VALUES (10, 7, 0)
INSERT [dbo].[tblTrFormKosHarga] ([FormKosID], [SatuanHargaID], [Harga], [Deskripsi]) VALUES (8, 4, CAST(12000000.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[tblTrFormKosHarga] ([FormKosID], [SatuanHargaID], [Harga], [Deskripsi]) VALUES (9, 4, CAST(12000000.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[tblTrFormKosHarga] ([FormKosID], [SatuanHargaID], [Harga], [Deskripsi]) VALUES (10, 1, CAST(25000.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[tblTrFormKosHarga] ([FormKosID], [SatuanHargaID], [Harga], [Deskripsi]) VALUES (10, 2, CAST(250000.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[tblTrFormKosHarga] ([FormKosID], [SatuanHargaID], [Harga], [Deskripsi]) VALUES (10, 3, CAST(1000000.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[tblTrFormKosHarga] ([FormKosID], [SatuanHargaID], [Harga], [Deskripsi]) VALUES (10, 4, CAST(12000000.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[tblTrFormKosLingkungan] ([FormKosID], [FormKosLingkunganID], [Status]) VALUES (10, 1, 1)
INSERT [dbo].[tblTrFormKosLingkungan] ([FormKosID], [FormKosLingkunganID], [Status]) VALUES (10, 2, 1)
INSERT [dbo].[tblTrFormKosLingkungan] ([FormKosID], [FormKosLingkunganID], [Status]) VALUES (10, 3, 0)
INSERT [dbo].[tblTrFormKosLingkungan] ([FormKosID], [FormKosLingkunganID], [Status]) VALUES (10, 4, 1)
INSERT [dbo].[tblTrFormKosLingkungan] ([FormKosID], [FormKosLingkunganID], [Status]) VALUES (10, 5, 0)
INSERT [dbo].[tblTrFormKosLingkungan] ([FormKosID], [FormKosLingkunganID], [Status]) VALUES (10, 6, 1)
INSERT [dbo].[tblTrFormKosLingkungan] ([FormKosID], [FormKosLingkunganID], [Status]) VALUES (10, 7, 1)
INSERT [dbo].[tblTrFormKosLingkungan] ([FormKosID], [FormKosLingkunganID], [Status]) VALUES (10, 8, 1)
INSERT [dbo].[tblTrFormKosLingkungan] ([FormKosID], [FormKosLingkunganID], [Status]) VALUES (10, 9, 0)
INSERT [dbo].[tblTrFormKosLingkungan] ([FormKosID], [FormKosLingkunganID], [Status]) VALUES (10, 10, 0)
INSERT [dbo].[tblTrFormKosLingkungan] ([FormKosID], [FormKosLingkunganID], [Status]) VALUES (10, 11, 1)
INSERT [dbo].[tblTrFormKosLingkungan] ([FormKosID], [FormKosLingkunganID], [Status]) VALUES (10, 12, 1)
SET IDENTITY_INSERT [dbo].[tblUser] ON 

INSERT [dbo].[tblUser] ([ID], [UserName], [LastActivityDate]) VALUES (1, N'administrator', CAST(N'2017-02-14T09:26:15.410' AS DateTime))
SET IDENTITY_INSERT [dbo].[tblUser] OFF
ALTER TABLE [dbo].[tblMembership]  WITH CHECK ADD  CONSTRAINT [FK_tblMembership_tblUser] FOREIGN KEY([UserID])
REFERENCES [dbo].[tblUser] ([ID])
GO
ALTER TABLE [dbo].[tblMembership] CHECK CONSTRAINT [FK_tblMembership_tblUser]
GO
ALTER TABLE [dbo].[tblTrKosHarga]  WITH CHECK ADD  CONSTRAINT [FK_tblTrKosHarga_tblSatuanHarga] FOREIGN KEY([SatuanHargaID])
REFERENCES [dbo].[tblSatuanHarga] ([ID])
GO
ALTER TABLE [dbo].[tblTrKosHarga] CHECK CONSTRAINT [FK_tblTrKosHarga_tblSatuanHarga]
GO
ALTER TABLE [dbo].[tblTrKosHarga]  WITH CHECK ADD  CONSTRAINT [FK_tblTrKosHarga_tblTempatKos] FOREIGN KEY([KOSID])
REFERENCES [dbo].[tblTempatKos] ([ID])
GO
ALTER TABLE [dbo].[tblTrKosHarga] CHECK CONSTRAINT [FK_tblTrKosHarga_tblTempatKos]
GO
/****** Object:  StoredProcedure [dbo].[LIK_DoRegister]    Script Date: 2/17/2017 5:45:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LIK_DoRegister] 
(                
	@UserName varchar(50),
	@Email varchar(500),
	@Password varchar(128)
)  
AS
BEGIN
	--BEGIN TRAN
	--begin transaction
	INSERT INTO tblUser( UserName,LastActivityDate)
	VALUES( @UserName,GETDATE())

	DECLARE @UserID bigint
	SELECT @UserID = ID FROM tblUser WITH (NOLOCK) 
		WHERE UserName = @UserName

	DECLARE @IsApproved bit
    SET @IsApproved = 1

	DECLARE @IsLockedOut bit
    SET @IsLockedOut = 0
	
	DECLARE @CreateDate datetime
	SET @CreateDate = GETDATE()
	
    DECLARE @LastLockoutDate  datetime
    SET @LastLockoutDate = CONVERT( datetime, '17540101', 112 )
	
    DECLARE @LastPasswordChangedDate  datetime
    SET @LastPasswordChangedDate = CONVERT( datetime, '17540101', 112 )

    DECLARE @FailedPasswordAttemptCount int
    SET @FailedPasswordAttemptCount = 0

	INSERT INTO tblMembership 
		( UserID,
	      Email,
		  Password,
		  PasswordFormat,
		  PasswordSalt,
		  TipeUser,
		  Aktif,
		  IsApproved,
		  IsLockedout,
		  CreateDate,
		  LastLoginDate,
		  LastPasswordChangedDate,
		  LastChangeAktifDate,
		  LastLockedoutDate,
		  FailedPasswordAttemptCount )
	VALUES ( @UserID,
		     @Email,
			 @Password,
			 1,
			 '1',
			 2,
			 1,
			 @IsApproved,
			 @IsLockedOut,
			 @CreateDate,
			 @CreateDate,
			 @LastPasswordChangedDate,
			 @CreateDate,
			 @LastLockoutDate,
			 @FailedPasswordAttemptCount )

	--COMMIT TRAN
	--commit transaction
END
GO
/****** Object:  StoredProcedure [dbo].[LIK_DoSignIn]    Script Date: 2/17/2017 5:45:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LIK_DoSignIn] --'adminsystem@lihatkos.com','abcde!!12345'
(                
	@Email varchar(500),
	@Password varchar(128)
)  
AS
BEGIN
	
	SELECT B.ID, A.Email, B.UserName, A.Password, B.LastActivityDate FROM tblMembership A WITH (NOLOCK)
		LEFT JOIN tblUser B WITH (NOLOCK)
		 ON A.UserID = B.ID
	WHERE LOWER(Email) = LOWER(@Email) AND Password = @Password
		AND A.Aktif = 1 AND A.IsApproved = 1 AND A.IsLockedout = 0
		AND FailedPasswordAttemptCount <= 5

END
GO
/****** Object:  StoredProcedure [dbo].[LIK_GetAllArea]    Script Date: 2/17/2017 5:45:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LIK_GetAllArea] 	
AS
BEGIN
	SELECT ID,Kode,Nama,Deskripsi
		FROM tblArea
		ORDER BY Kode
END
GO
/****** Object:  StoredProcedure [dbo].[LIK_GetAllBanner]    Script Date: 2/17/2017 5:45:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LIK_GetAllBanner] 	
AS
BEGIN
	SELECT FilePath 
		FROM tblBanner
		ORDER BY Prioritas
END

GO
/****** Object:  StoredProcedure [dbo].[LIK_GetAllFasilitas]    Script Date: 2/17/2017 5:45:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LIK_GetAllFasilitas] 	
AS
BEGIN
	SELECT ID, Kode, NamaFasilitas
		FROM tblMsFasilitas
		ORDER BY ID		
END

GO
/****** Object:  StoredProcedure [dbo].[LIK_GetAllLingkungan]    Script Date: 2/17/2017 5:45:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LIK_GetAllLingkungan] 	
AS
BEGIN
	SELECT ID, Kode, Nama
		FROM tblMsLingkungan
		ORDER BY ID		
END

GO
/****** Object:  StoredProcedure [dbo].[LIK_GetAllPaymentBulan]    Script Date: 2/17/2017 5:45:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LIK_GetAllPaymentBulan] 	
AS
BEGIN
	SELECT ID, Kode, Nama
		FROM tblMsPaymentBulan
		ORDER BY ID		
END

GO
/****** Object:  StoredProcedure [dbo].[LIK_GetAllTipeKos]    Script Date: 2/17/2017 5:45:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LIK_GetAllTipeKos] 	
AS
BEGIN
	SELECT ID, Kode, Nama
		FROM tblMsTipeKos
		ORDER BY ID		
END

GO
/****** Object:  StoredProcedure [dbo].[LIK_GetMaxFormKos]    Script Date: 2/17/2017 5:45:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LIK_GetMaxFormKos] 	
AS
BEGIN
	DECLARE @prefix varchar(10)
	SET @prefix = 'FK-'
	IF ((SELECT Max(Kode)
		FROM tblFormKos) IS NOT NULL)
	BEGIN
		DECLARE @maxCode bigint
		SET @maxCode = (SELECT CONVERT(bigint, RIGHT(MAX(KODE),7)) FROM tblFormKos)
		SELECT @prefix+ right('0000000'+convert(varchar(7), @maxCode + 1), 7) as Kode
		
	END
	ELSE
	BEGIN
		SELECT @prefix+ right('0000000'+convert(varchar(7), 1), 7) as Kode
		--SELECT @prefix + '0000001'
	END
		
END

GO
/****** Object:  StoredProcedure [dbo].[LIK_InsertFormKos]    Script Date: 2/17/2017 5:45:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LIK_InsertFormKos] 
(                
	@Kode varchar(50),
	@Nama varchar(250),
	@Deskripsi text,
	@Alamat text,
	@AreaID int,
	@Altitude decimal(9,6),
	@Longitude decimal(9,6),
	@ImageID bigint, --input dulu
	@NamaPemilik varchar(250),
	@AlamatPemilik text,
	@KontakPemilik varchar(50),
	@NamaPengelola varchar(250),
	@AlamatPengelola text,
	@KontakPengelola varchar(50),
	@MinimumBayarMonth int,
	@MinimumBayarDesc text,
	@JmlKamar int,
	@LuasKamar decimal(9,4),
	@TipeKosID int,
	@JmlKamarKosong int,
	@PetID bit,
	--@FormKosFasilitasID int,
	--@FormKosLingkunganID int,
	@Keterangan text,
	@UserID bigint
)  
AS
BEGIN
	--SELECT * FROM tblArea
	--BEGIN TRAN
	--begin transaction
	INSERT INTO tblFormKos 
		( Kode,
		  Nama,
		  Deskripsi,
		  Alamat,
		  AreaID,
		  Altitude,
		  Longitude,
		  ImageID,
		  NamaPemilik,
		  AlamatPemilik,
		  KontakPemilik,
		  NamaPengelola,
		  AlamatPengelola,
		  KontakPengelola,
		  MinimumBayarMonth,
		  MinimumBayarDesc,
		  JmlKamar,
		  LuasKamar,
		  TipeKosID,
		  JmlKamarKosong,
		  PetID,
		  --FormKosFasilitasID,
		  --FormKosLingkunganID,
		  Keterangan,
		  UserID )
	VALUES ( @Kode,
			 @Nama,
			 @Deskripsi,
			 @Alamat,
			 @AreaID,
			 @Altitude,
			 @Longitude,
			 @ImageID,
			 @NamaPemilik,
			 @AlamatPemilik,
			 @KontakPemilik,
			 @NamaPengelola,
			 @AlamatPengelola,
			 @KontakPengelola,
			 @MinimumBayarMonth,
			 @MinimumBayarDesc,
			 @JmlKamar,
			 @LuasKamar,
			 @TipeKosID,
			 @JmlKamarKosong,
			 @PetID,
			 --@FormKosFasilitasID,
			 --@FormKosLingkunganID,
			 @Keterangan,
			 @UserID )
	 Declare @ID int                                    
	 SET @ID = (SELECT ID FROM tblFormKos WHERE Kode = @Kode ) 

	 RETURN @ID
END
GO
/****** Object:  StoredProcedure [dbo].[LIK_InsertFormKosFasilitas]    Script Date: 2/17/2017 5:45:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LIK_InsertFormKosFasilitas] 
(   
	@FormKosID bigint,
	@FormKosFasilitasID int,
	@Status int
)  
AS
BEGIN
	--BEGIN TRAN
	--begin transaction
	INSERT INTO tblTrFormKosFasilitas 
		( FormKosID,
		  FormKosFasilitasID,
		  Status )
	VALUES ( @FormKosID,
			 @FormKosFasilitasID,
			 @Status ) 
			
END
GO
/****** Object:  StoredProcedure [dbo].[LIK_InsertFormKosHarga]    Script Date: 2/17/2017 5:45:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--LIK_InsertFormKosHarga 7,4,12000000,''
CREATE PROCEDURE [dbo].[LIK_InsertFormKosHarga] 
(   
	@FormKosID bigint,
	@SatuanHargaID int,
	@Harga decimal,
	@Deskripsi text
)  
AS
BEGIN
	--SELECT * FROM tblArea
	--BEGIN TRAN
	--begin transaction
	INSERT INTO tblTrFormKosHarga 
		( FormKosID,
		  SatuanHargaID,
		  Harga,
		  Deskripsi )
	VALUES ( @FormKosID,
			 @SatuanHargaID,
			 @Harga,
			 @Deskripsi ) 
			
END
GO
/****** Object:  StoredProcedure [dbo].[LIK_InsertFormKosLingkungan]    Script Date: 2/17/2017 5:45:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LIK_InsertFormKosLingkungan] 
(   
	@FormKosID bigint,
	@FormKosLingkunganID int,
	@Status int
)  
AS
BEGIN
	--BEGIN TRAN
	--begin transaction
	INSERT INTO tblTrFormKosLingkungan 
		( FormKosID,
		  FormKosLingkunganID,
		  Status )
	VALUES ( @FormKosID,
			 @FormKosLingkunganID,
			 @Status ) 
			
END
GO
USE [master]
GO
ALTER DATABASE [digisoftid_db] SET  READ_WRITE 
GO
