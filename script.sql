USE [master]
GO
/****** Object:  Database [Ticketing]    Script Date: 2015/12/5 18:35:04 ******/
CREATE DATABASE [Ticketing]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Ticketing', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Ticketing.mdf' , SIZE = 4160KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Ticketing_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Ticketing_log.ldf' , SIZE = 1040KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Ticketing] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Ticketing].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Ticketing] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Ticketing] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Ticketing] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Ticketing] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Ticketing] SET ARITHABORT OFF 
GO
ALTER DATABASE [Ticketing] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Ticketing] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [Ticketing] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Ticketing] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Ticketing] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Ticketing] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Ticketing] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Ticketing] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Ticketing] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Ticketing] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Ticketing] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Ticketing] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Ticketing] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Ticketing] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Ticketing] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Ticketing] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Ticketing] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Ticketing] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Ticketing] SET RECOVERY FULL 
GO
ALTER DATABASE [Ticketing] SET  MULTI_USER 
GO
ALTER DATABASE [Ticketing] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Ticketing] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Ticketing] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Ticketing] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [Ticketing]
GO
/****** Object:  Table [dbo].[Master]    Script Date: 2015/12/5 18:35:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Master](
	[uid] [int] NULL,
	[name] [varchar](50) NULL,
	[pwd] [varchar](50) NULL,
	[info] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MUser]    Script Date: 2015/12/5 18:35:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MUser](
	[uid] [int] NOT NULL,
	[name] [varchar](50) NOT NULL,
	[pwd] [varchar](50) NOT NULL,
	[sex] [varchar](50) NULL,
	[telephone] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ShowDate]    Script Date: 2015/12/5 18:35:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShowDate](
	[sid] [int] NOT NULL,
	[mid] [int] NULL,
	[date] [date] NULL,
	[morning] [bit] NULL,
	[afternoon] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[sid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ShowList]    Script Date: 2015/12/5 18:35:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ShowList](
	[mid] [int] NOT NULL,
	[name] [varchar](50) NULL,
	[path] [varchar](50) NULL,
	[director] [varchar](50) NULL,
	[actor] [varchar](50) NULL,
	[type] [varchar](50) NULL,
	[price] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[mid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ShowSeat]    Script Date: 2015/12/5 18:35:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShowSeat](
	[mid] [int] NULL,
	[morningSeat] [int] NULL,
	[afternoonSeat] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Trade]    Script Date: 2015/12/5 18:35:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Trade](
	[tid] [int] NULL,
	[uid] [int] NULL,
	[price] [int] NULL,
	[info] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
USE [master]
GO
ALTER DATABASE [Ticketing] SET  READ_WRITE 
GO
