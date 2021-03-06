USE [master]
GO
/****** Object:  Database [productdb]    Script Date: 10/18/2018 9:48:53 PM ******/
CREATE DATABASE [productdb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'productdb', FILENAME = N'D:\Programming\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\productdb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'productdb_log', FILENAME = N'D:\Programming\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\productdb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [productdb] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [productdb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [productdb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [productdb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [productdb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [productdb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [productdb] SET ARITHABORT OFF 
GO
ALTER DATABASE [productdb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [productdb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [productdb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [productdb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [productdb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [productdb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [productdb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [productdb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [productdb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [productdb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [productdb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [productdb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [productdb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [productdb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [productdb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [productdb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [productdb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [productdb] SET RECOVERY FULL 
GO
ALTER DATABASE [productdb] SET  MULTI_USER 
GO
ALTER DATABASE [productdb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [productdb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [productdb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [productdb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [productdb] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'productdb', N'ON'
GO
ALTER DATABASE [productdb] SET QUERY_STORE = OFF
GO
USE [productdb]
GO
/****** Object:  Table [dbo].[tb_brand]    Script Date: 10/18/2018 9:48:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_brand](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tb_brand] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_tb_brand_name] UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_product]    Script Date: 10/18/2018 9:48:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_product](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[unit] [varchar](20) NULL,
	[quantity] [int] NULL,
	[price] [decimal](6, 2) NULL,
	[active] [bit] NULL,
	[brand_id] [int] NOT NULL,
 CONSTRAINT [PK_tb_product] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_tb_product_name] UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tb_product]  WITH CHECK ADD  CONSTRAINT [FK_tb_product_tb_brand] FOREIGN KEY([brand_id])
REFERENCES [dbo].[tb_brand] ([id])
GO
ALTER TABLE [dbo].[tb_product] CHECK CONSTRAINT [FK_tb_product_tb_brand]
GO
USE [master]
GO
ALTER DATABASE [productdb] SET  READ_WRITE 
GO
