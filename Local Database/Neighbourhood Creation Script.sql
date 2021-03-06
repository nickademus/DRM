USE [master]
GO

-- IF THIS ALREADY EXISTS
DROP DATABASE [Neighbourhood] --COMMENT OUT ON FIRST RUN
GO

/****** Object:  Database [Neighbourhood]    Script Date: 12/02/2015 11:52:15 PM ******/
CREATE DATABASE [Neighbourhood]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'NeighbourhoodData', FILENAME = N'C:\GitHub\DRM\Daycare Management System\Database\NeighbourhoodData.mdf' , SIZE = 10240KB , MAXSIZE = 15360KB , FILEGROWTH = 20%)
 LOG ON 
( NAME = N'NeighbourhoodLog', FILENAME = N'C:\GitHub\DRM\Daycare Management System\Database\NeighbourhoodLog.ldf' , SIZE = 3072KB , MAXSIZE = 5120KB , FILEGROWTH = 1024KB )
GO
ALTER DATABASE [Neighbourhood] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Neighbourhood].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Neighbourhood] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Neighbourhood] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Neighbourhood] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Neighbourhood] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Neighbourhood] SET ARITHABORT OFF 
GO
ALTER DATABASE [Neighbourhood] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Neighbourhood] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [Neighbourhood] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Neighbourhood] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Neighbourhood] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Neighbourhood] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Neighbourhood] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Neighbourhood] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Neighbourhood] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Neighbourhood] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Neighbourhood] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Neighbourhood] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Neighbourhood] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Neighbourhood] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Neighbourhood] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Neighbourhood] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Neighbourhood] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Neighbourhood] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Neighbourhood] SET RECOVERY FULL 
GO
ALTER DATABASE [Neighbourhood] SET  MULTI_USER 
GO
ALTER DATABASE [Neighbourhood] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Neighbourhood] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Neighbourhood] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Neighbourhood] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
--USE [Neighbourhood]
--GO
--/****** Object:  User [WebSiteUser]    Script Date: 12/02/2015 11:52:15 PM ******/
--CREATE USER [WebSiteUser] WITH DEFAULT_SCHEMA=[dbo]
--GO
--ALTER ROLE [db_datareader] ADD MEMBER [WebSiteUser]
--GO
--ALTER ROLE [db_datawriter] ADD MEMBER [WebSiteUser]
--GO
/****** Object:  StoredProcedure [dbo].[pGetThreeClosestBranches]    Script Date: 12/02/2015 11:52:15 PM ******/
USE [Neighbourhood]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[pGetThreeClosestBranches](
	@Lat	FLOAT,
	@Long	FLOAT
)
AS
SELECT TOP 3
		BranchID, 
		Street, 
		City, 
		Region, 
		Latitude, 
		Longitude,
		SQRT(POWER(Latitude - @Lat, 2) + POWER(Longitude - @Long, 2)) * 62.1371192 AS DistanceFromAddress
	FROM Branches 
	ORDER BY DistanceFromAddress
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 12/02/2015 11:52:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 12/02/2015 11:52:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 12/02/2015 11:52:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
	[User_Id] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 12/02/2015 11:52:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[UserId] [nvarchar](128) NOT NULL,
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 12/02/2015 11:52:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 12/02/2015 11:52:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[UserName] [nvarchar](max) NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[Discriminator] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Branches]    Script Date: 12/02/2015 11:52:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Branches](
	[BranchID] [int] IDENTITY(1,1) NOT NULL,
	[Street] [varchar](150) NULL,
	[City] [varchar](150) NULL,
	[Region] [varchar](2) NULL,
	[Longitude] [float] NULL,
	[Latitude] [float] NULL,
 CONSTRAINT [PK_Branch] PRIMARY KEY CLUSTERED 
(
	[BranchID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Child]    Script Date: 12/02/2015 11:52:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Child](
	[Id] [int] NOT NULL,
	[FirstName] [nchar](50) NOT NULL,
	[LastName] [nchar](50) NOT NULL,
	[DoB] [datetime] NOT NULL,
	[Address] [ntext] NULL,
	[Province] [nvarchar](50) NULL,
	[City] [nvarchar](50) NULL,
	[HealthCard] [int] NULL,
	[DocName] [nchar](50) NULL,
	[DocPhone] [nchar](10) NULL,
	[Comments] [text] NULL,
	[ParentId] [int] NULL,
 CONSTRAINT [PK_Child] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Class]    Script Date: 12/02/2015 11:52:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Class](
	[ClassId] [int] NOT NULL,
	[CName] [nchar](50) NULL,
	[Capacity] [int] NULL,
	[CStartEnd] [nchar](50) NULL,
	[EmployeeId] [int] NULL,
 CONSTRAINT [PK_Class] PRIMARY KEY CLUSTERED 
(
	[ClassId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Customers]    Script Date: 12/02/2015 11:52:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Age] [int] NULL,
	[Address1] [nvarchar](120) NULL,
	[City] [nvarchar](120) NULL,
	[Mailcode] [nvarchar](50) NULL,
	[Region] [nvarchar](50) NULL,
	[Country] [nvarchar](50) NULL,
	[Creditcardtype] [nvarchar](50) NULL,
	[Timer] [timestamp] NULL,
	[Username] [nvarchar](50) NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Employee]    Script Date: 12/02/2015 11:52:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[EmployeeId] [int] NOT NULL,
	[EFirstName] [nchar](50) NOT NULL,
	[ELastName] [nchar](50) NOT NULL,
	[EAddress] [ntext] NULL,
	[ECity] [nvarchar](50) NULL,
	[EProvince] [nvarchar](50) NULL,
	[EPhone] [nchar](10) NULL,
	[ERole] [nvarchar](50) NULL,
	[userName] [nvarchar](128) NULL,
	[Password] [nvarchar](128) NULL,
	[Email] [nvarchar](50) NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[EmployeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Parent]    Script Date: 12/02/2015 11:52:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Parent](
	[ParentId] [int] NOT NULL,
	[PFirstName] [nchar](50) NOT NULL,
	[PLastName] [nchar](50) NOT NULL,
	[PAddress] [ntext] NULL,
	[PCity] [nvarchar](50) NULL,
	[PProvince] [nvarchar](50) NULL,
	[PPhone] [nchar](10) NULL,
	[userName] [nvarchar](128) NULL,
	[Password] [nvarchar](128) NULL,
	[Email] [nvarchar](50) NULL,
 CONSTRAINT [PK_Parent] PRIMARY KEY CLUSTERED 
(
	[ParentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_User_Id]    Script Date: 12/02/2015 11:52:15 PM ******/
CREATE NONCLUSTERED INDEX [IX_User_Id] ON [dbo].[AspNetUserClaims]
(
	[User_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 12/02/2015 11:52:15 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_RoleId]    Script Date: 12/02/2015 11:52:15 PM ******/
CREATE NONCLUSTERED INDEX [IX_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 12/02/2015 11:52:15 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserRoles]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_User_Id] FOREIGN KEY([User_Id])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_User_Id]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Child]  WITH CHECK ADD  CONSTRAINT [FK_Child_Parent] FOREIGN KEY([ParentId])
REFERENCES [dbo].[Parent] ([ParentId])
GO
ALTER TABLE [dbo].[Child] CHECK CONSTRAINT [FK_Child_Parent]
GO
ALTER TABLE [dbo].[Class]  WITH CHECK ADD  CONSTRAINT [FK_Class_Employee] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employee] ([EmployeeId])
GO
ALTER TABLE [dbo].[Class] CHECK CONSTRAINT [FK_Class_Employee]
GO
USE [master]
GO
ALTER DATABASE [Neighbourhood] SET  READ_WRITE 
GO
