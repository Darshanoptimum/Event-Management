USE [master]
GO
/****** Object:  Database [Event_Management]    Script Date: 16-04-2024 05:22:45 PM ******/
CREATE DATABASE [Event_Management]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Event_Management', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Event_Management.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Event_Management_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Event_Management_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Event_Management] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Event_Management].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Event_Management] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Event_Management] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Event_Management] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Event_Management] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Event_Management] SET ARITHABORT OFF 
GO
ALTER DATABASE [Event_Management] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Event_Management] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Event_Management] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Event_Management] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Event_Management] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Event_Management] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Event_Management] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Event_Management] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Event_Management] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Event_Management] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Event_Management] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Event_Management] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Event_Management] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Event_Management] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Event_Management] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Event_Management] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Event_Management] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Event_Management] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Event_Management] SET  MULTI_USER 
GO
ALTER DATABASE [Event_Management] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Event_Management] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Event_Management] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Event_Management] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Event_Management] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Event_Management] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Event_Management] SET QUERY_STORE = ON
GO
ALTER DATABASE [Event_Management] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Event_Management]
GO
/****** Object:  Table [dbo].[TBL_admin]    Script Date: 16-04-2024 05:22:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_admin](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[EmailId] [nvarchar](230) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
	[MobileNumber] [bigint] NOT NULL,
 CONSTRAINT [PK_TBL_admin] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBL_Event]    Script Date: 16-04-2024 05:22:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_Event](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[EventName] [nvarchar](max) NOT NULL,
	[EventStartDate] [date] NOT NULL,
	[EventEndDate] [date] NOT NULL,
	[AddDate] [datetime] NULL,
	[IsActive] [bit] NOT NULL,
	[EventImage] [text] NULL,
 CONSTRAINT [PK_TBL_Event] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBL_EventActivity]    Script Date: 16-04-2024 05:22:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_EventActivity](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Event_Id] [bigint] NOT NULL,
	[EventActivityName] [nvarchar](max) NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
	[AddDate] [date] NOT NULL,
	[isActive] [bit] NOT NULL,
	[Price] [bigint] NULL,
 CONSTRAINT [PK_TBL_EventActivity] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBL_User]    Script Date: 16-04-2024 05:22:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_User](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[EmailId] [nvarchar](230) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
	[MobileNumber] [bigint] NOT NULL,
 CONSTRAINT [PK_TBL_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[TBL_admin] ON 

INSERT [dbo].[TBL_admin] ([Id], [Name], [EmailId], [Password], [MobileNumber]) VALUES (1, N'darshan', N'darshan01@gmail.com', N'Darshan@123', 9510484425)
SET IDENTITY_INSERT [dbo].[TBL_admin] OFF
GO
SET IDENTITY_INSERT [dbo].[TBL_Event] ON 

INSERT [dbo].[TBL_Event] ([Id], [EventName], [EventStartDate], [EventEndDate], [AddDate], [IsActive], [EventImage]) VALUES (12, N'Ramnavmi', CAST(N'2024-04-27' AS Date), CAST(N'2024-04-27' AS Date), CAST(N'2024-04-06T12:58:27.937' AS DateTime), 1, N'C:\Users\Priya Sutariya\Desktop\Darshan Vaghani\Week 10\Event Management\Expenses Management\image\img_11-04-2024 01-19-03 PM.jpg')
INSERT [dbo].[TBL_Event] ([Id], [EventName], [EventStartDate], [EventEndDate], [AddDate], [IsActive], [EventImage]) VALUES (13, N'Holi', CAST(N'2024-04-20' AS Date), CAST(N'2024-04-21' AS Date), CAST(N'2024-04-06T00:29:25.597' AS DateTime), 1, N'C:\Users\Priya Sutariya\Desktop\Darshan Vaghani\Week 10\Event Management\Expenses Management\image\img_11-04-2024 01-51-24 PM.jpg')
INSERT [dbo].[TBL_Event] ([Id], [EventName], [EventStartDate], [EventEndDate], [AddDate], [IsActive], [EventImage]) VALUES (14, N'dhuleti', CAST(N'2024-04-11' AS Date), CAST(N'2024-04-12' AS Date), CAST(N'2024-04-05T12:00:23.257' AS DateTime), 1, N'C:\Users\Priya Sutariya\Desktop\Darshan Vaghani\Week 10\Event Management\Expenses Management\image\img_11-04-2024 02-26-33 PM.jpg')
INSERT [dbo].[TBL_Event] ([Id], [EventName], [EventStartDate], [EventEndDate], [AddDate], [IsActive], [EventImage]) VALUES (15, N'asfgihawrhgbrgfh', CAST(N'2024-04-11' AS Date), CAST(N'2024-04-11' AS Date), CAST(N'2024-04-04T23:31:20.913' AS DateTime), 1, N'C:\Users\Priya Sutariya\Desktop\Darshan Vaghani\Week 10\Event Management\Expenses Management\image\img_11-04-2024 02-56-31 PM.jpg')
INSERT [dbo].[TBL_Event] ([Id], [EventName], [EventStartDate], [EventEndDate], [AddDate], [IsActive], [EventImage]) VALUES (16, N'Diwali', CAST(N'2024-04-19' AS Date), CAST(N'2024-04-27' AS Date), CAST(N'2024-04-04T11:02:18.573' AS DateTime), 0, N'C:\Users\Priya Sutariya\Desktop\Darshan Vaghani\Week 10\Event Management\Expenses Management\image\img_11-04-2024 04-43-37 PM.jpg')
INSERT [dbo].[TBL_Event] ([Id], [EventName], [EventStartDate], [EventEndDate], [AddDate], [IsActive], [EventImage]) VALUES (17, N'bestuvarshvsdfb', CAST(N'2024-04-25' AS Date), CAST(N'2024-04-30' AS Date), CAST(N'2024-04-03T22:33:16.233' AS DateTime), 0, N'C:\Users\Priya Sutariya\Desktop\Darshan Vaghani\Week 10\Event Management\Expenses Management\image\img_12-04-2024 12-19-33 PM.jpg')
INSERT [dbo].[TBL_Event] ([Id], [EventName], [EventStartDate], [EventEndDate], [AddDate], [IsActive], [EventImage]) VALUES (18, N'Diwali', CAST(N'2024-04-19' AS Date), CAST(N'2024-04-27' AS Date), CAST(N'2024-04-03T10:04:13.890' AS DateTime), 1, N'C:\Users\Priya Sutariya\Desktop\Darshan Vaghani\Week 10\Event Management\Expenses Management\image\img_11-04-2024 04-43-37 PM.jpg')
INSERT [dbo].[TBL_Event] ([Id], [EventName], [EventStartDate], [EventEndDate], [AddDate], [IsActive], [EventImage]) VALUES (19, N'Diwali', CAST(N'2024-04-19' AS Date), CAST(N'2024-04-27' AS Date), CAST(N'2024-04-02T21:35:11.550' AS DateTime), 1, N'C:\Users\Priya Sutariya\Desktop\Darshan Vaghani\Week 10\Event Management\Expenses Management\image\img_11-04-2024 04-43-37 PM.jpg')
INSERT [dbo].[TBL_Event] ([Id], [EventName], [EventStartDate], [EventEndDate], [AddDate], [IsActive], [EventImage]) VALUES (20, N'Diwali', CAST(N'2024-04-19' AS Date), CAST(N'2024-04-27' AS Date), CAST(N'2024-04-02T09:06:09.210' AS DateTime), 1, N'C:\Users\Priya Sutariya\Desktop\Darshan Vaghani\Week 10\Event Management\Expenses Management\image\img_11-04-2024 04-43-37 PM.jpg')
INSERT [dbo].[TBL_Event] ([Id], [EventName], [EventStartDate], [EventEndDate], [AddDate], [IsActive], [EventImage]) VALUES (21, N'Diwali', CAST(N'2024-04-19' AS Date), CAST(N'2024-04-27' AS Date), CAST(N'2024-04-01T20:37:06.867' AS DateTime), 1, N'C:\Users\Priya Sutariya\Desktop\Darshan Vaghani\Week 10\Event Management\Expenses Management\image\img_11-04-2024 04-43-37 PM.jpg')
INSERT [dbo].[TBL_Event] ([Id], [EventName], [EventStartDate], [EventEndDate], [AddDate], [IsActive], [EventImage]) VALUES (22, N'Diwali', CAST(N'2024-04-19' AS Date), CAST(N'2024-04-27' AS Date), CAST(N'2024-04-01T08:08:04.527' AS DateTime), 1, N'C:\Users\Priya Sutariya\Desktop\Darshan Vaghani\Week 10\Event Management\Expenses Management\image\img_11-04-2024 04-43-37 PM.jpg')
INSERT [dbo].[TBL_Event] ([Id], [EventName], [EventStartDate], [EventEndDate], [AddDate], [IsActive], [EventImage]) VALUES (23, N'Diwali', CAST(N'2024-04-19' AS Date), CAST(N'2024-04-27' AS Date), CAST(N'2024-03-31T19:39:02.187' AS DateTime), 1, N'C:\Users\Priya Sutariya\Desktop\Darshan Vaghani\Week 10\Event Management\Expenses Management\image\img_11-04-2024 04-43-37 PM.jpg')
INSERT [dbo].[TBL_Event] ([Id], [EventName], [EventStartDate], [EventEndDate], [AddDate], [IsActive], [EventImage]) VALUES (24, N'Diwali', CAST(N'2024-04-19' AS Date), CAST(N'2024-04-27' AS Date), CAST(N'2024-03-31T07:09:59.847' AS DateTime), 1, N'C:\Users\Priya Sutariya\Desktop\Darshan Vaghani\Week 10\Event Management\Expenses Management\image\img_11-04-2024 04-43-37 PM.jpg')
INSERT [dbo].[TBL_Event] ([Id], [EventName], [EventStartDate], [EventEndDate], [AddDate], [IsActive], [EventImage]) VALUES (25, N'Diwali', CAST(N'2024-04-19' AS Date), CAST(N'2024-04-27' AS Date), CAST(N'2024-03-30T18:40:57.503' AS DateTime), 1, N'C:\Users\Priya Sutariya\Desktop\Darshan Vaghani\Week 10\Event Management\Expenses Management\image\img_11-04-2024 04-43-37 PM.jpg')
INSERT [dbo].[TBL_Event] ([Id], [EventName], [EventStartDate], [EventEndDate], [AddDate], [IsActive], [EventImage]) VALUES (26, N'Diwali', CAST(N'2024-04-19' AS Date), CAST(N'2024-04-27' AS Date), CAST(N'2024-03-30T06:11:55.163' AS DateTime), 1, N'C:\Users\Priya Sutariya\Desktop\Darshan Vaghani\Week 10\Event Management\Expenses Management\image\img_11-04-2024 04-43-37 PM.jpg')
INSERT [dbo].[TBL_Event] ([Id], [EventName], [EventStartDate], [EventEndDate], [AddDate], [IsActive], [EventImage]) VALUES (27, N'Diwali', CAST(N'2024-04-19' AS Date), CAST(N'2024-04-27' AS Date), CAST(N'2024-03-29T17:42:52.823' AS DateTime), 1, N'C:\Users\Priya Sutariya\Desktop\Darshan Vaghani\Week 10\Event Management\Expenses Management\image\img_11-04-2024 04-43-37 PM.jpg')
INSERT [dbo].[TBL_Event] ([Id], [EventName], [EventStartDate], [EventEndDate], [AddDate], [IsActive], [EventImage]) VALUES (28, N'Diwali', CAST(N'2024-04-19' AS Date), CAST(N'2024-04-27' AS Date), CAST(N'2024-03-29T05:13:50.480' AS DateTime), 1, N'C:\Users\Priya Sutariya\Desktop\Darshan Vaghani\Week 10\Event Management\Expenses Management\image\img_11-04-2024 04-43-37 PM.jpg')
INSERT [dbo].[TBL_Event] ([Id], [EventName], [EventStartDate], [EventEndDate], [AddDate], [IsActive], [EventImage]) VALUES (29, N'Diwali', CAST(N'2024-04-19' AS Date), CAST(N'2024-04-27' AS Date), CAST(N'2024-03-28T16:44:48.140' AS DateTime), 1, N'C:\Users\Priya Sutariya\Desktop\Darshan Vaghani\Week 10\Event Management\Expenses Management\image\img_11-04-2024 04-43-37 PM.jpg')
INSERT [dbo].[TBL_Event] ([Id], [EventName], [EventStartDate], [EventEndDate], [AddDate], [IsActive], [EventImage]) VALUES (30, N'Diwali', CAST(N'2024-04-19' AS Date), CAST(N'2024-04-27' AS Date), CAST(N'2024-03-28T04:15:45.800' AS DateTime), 1, N'C:\Users\Priya Sutariya\Desktop\Darshan Vaghani\Week 10\Event Management\Expenses Management\image\img_11-04-2024 04-43-37 PM.jpg')
INSERT [dbo].[TBL_Event] ([Id], [EventName], [EventStartDate], [EventEndDate], [AddDate], [IsActive], [EventImage]) VALUES (31, N'Diwali', CAST(N'2024-04-19' AS Date), CAST(N'2024-04-27' AS Date), CAST(N'2024-03-27T15:46:43.457' AS DateTime), 1, N'C:\Users\Priya Sutariya\Desktop\Darshan Vaghani\Week 10\Event Management\Expenses Management\image\img_11-04-2024 04-43-37 PM.jpg')
INSERT [dbo].[TBL_Event] ([Id], [EventName], [EventStartDate], [EventEndDate], [AddDate], [IsActive], [EventImage]) VALUES (32, N'Diwali', CAST(N'2024-04-19' AS Date), CAST(N'2024-04-27' AS Date), CAST(N'2024-03-27T03:17:41.117' AS DateTime), 1, N'C:\Users\Priya Sutariya\Desktop\Darshan Vaghani\Week 10\Event Management\Expenses Management\image\img_11-04-2024 04-43-37 PM.jpg')
INSERT [dbo].[TBL_Event] ([Id], [EventName], [EventStartDate], [EventEndDate], [AddDate], [IsActive], [EventImage]) VALUES (33, N'Diwali', CAST(N'2024-04-19' AS Date), CAST(N'2024-04-27' AS Date), CAST(N'2024-03-26T14:48:38.777' AS DateTime), 1, N'C:\Users\Priya Sutariya\Desktop\Darshan Vaghani\Week 10\Event Management\Expenses Management\image\img_11-04-2024 04-43-37 PM.jpg')
INSERT [dbo].[TBL_Event] ([Id], [EventName], [EventStartDate], [EventEndDate], [AddDate], [IsActive], [EventImage]) VALUES (34, N'Diwali', CAST(N'2024-04-19' AS Date), CAST(N'2024-04-27' AS Date), CAST(N'2024-03-26T02:19:36.433' AS DateTime), 1, N'C:\Users\Priya Sutariya\Desktop\Darshan Vaghani\Week 10\Event Management\Expenses Management\image\img_11-04-2024 04-43-37 PM.jpg')
INSERT [dbo].[TBL_Event] ([Id], [EventName], [EventStartDate], [EventEndDate], [AddDate], [IsActive], [EventImage]) VALUES (35, N'Diwali', CAST(N'2024-04-19' AS Date), CAST(N'2024-04-27' AS Date), CAST(N'2024-03-25T13:50:34.093' AS DateTime), 1, N'C:\Users\Priya Sutariya\Desktop\Darshan Vaghani\Week 10\Event Management\Expenses Management\image\img_11-04-2024 04-43-37 PM.jpg')
INSERT [dbo].[TBL_Event] ([Id], [EventName], [EventStartDate], [EventEndDate], [AddDate], [IsActive], [EventImage]) VALUES (36, N'Diwali', CAST(N'2024-04-19' AS Date), CAST(N'2024-04-27' AS Date), CAST(N'2024-03-25T01:21:31.753' AS DateTime), 1, N'C:\Users\Priya Sutariya\Desktop\Darshan Vaghani\Week 10\Event Management\Expenses Management\image\img_11-04-2024 04-43-37 PM.jpg')
INSERT [dbo].[TBL_Event] ([Id], [EventName], [EventStartDate], [EventEndDate], [AddDate], [IsActive], [EventImage]) VALUES (37, N'Diwali', CAST(N'2024-04-19' AS Date), CAST(N'2024-04-27' AS Date), CAST(N'2024-03-24T12:52:29.410' AS DateTime), 1, N'C:\Users\Priya Sutariya\Desktop\Darshan Vaghani\Week 10\Event Management\Expenses Management\image\img_11-04-2024 04-43-37 PM.jpg')
INSERT [dbo].[TBL_Event] ([Id], [EventName], [EventStartDate], [EventEndDate], [AddDate], [IsActive], [EventImage]) VALUES (38, N'Diwali', CAST(N'2024-04-19' AS Date), CAST(N'2024-04-27' AS Date), CAST(N'2024-03-24T00:23:27.070' AS DateTime), 1, N'C:\Users\Priya Sutariya\Desktop\Darshan Vaghani\Week 10\Event Management\Expenses Management\image\img_11-04-2024 04-43-37 PM.jpg')
INSERT [dbo].[TBL_Event] ([Id], [EventName], [EventStartDate], [EventEndDate], [AddDate], [IsActive], [EventImage]) VALUES (39, N'Diwali', CAST(N'2024-04-19' AS Date), CAST(N'2024-04-27' AS Date), CAST(N'2024-03-23T11:54:24.730' AS DateTime), 1, N'C:\Users\Priya Sutariya\Desktop\Darshan Vaghani\Week 10\Event Management\Expenses Management\image\img_11-04-2024 04-43-37 PM.jpg')
INSERT [dbo].[TBL_Event] ([Id], [EventName], [EventStartDate], [EventEndDate], [AddDate], [IsActive], [EventImage]) VALUES (40, N'Diwali', CAST(N'2024-04-19' AS Date), CAST(N'2024-04-27' AS Date), CAST(N'2024-03-22T23:25:22.390' AS DateTime), 1, N'C:\Users\Priya Sutariya\Desktop\Darshan Vaghani\Week 10\Event Management\Expenses Management\image\img_11-04-2024 04-43-37 PM.jpg')
INSERT [dbo].[TBL_Event] ([Id], [EventName], [EventStartDate], [EventEndDate], [AddDate], [IsActive], [EventImage]) VALUES (41, N'Diwali', CAST(N'2024-04-19' AS Date), CAST(N'2024-04-27' AS Date), CAST(N'2024-03-22T10:56:20.047' AS DateTime), 1, N'C:\Users\Priya Sutariya\Desktop\Darshan Vaghani\Week 10\Event Management\Expenses Management\image\img_11-04-2024 04-43-37 PM.jpg')
INSERT [dbo].[TBL_Event] ([Id], [EventName], [EventStartDate], [EventEndDate], [AddDate], [IsActive], [EventImage]) VALUES (42, N'Diwali', CAST(N'2024-04-19' AS Date), CAST(N'2024-04-27' AS Date), CAST(N'2024-03-21T22:27:17.707' AS DateTime), 1, N'C:\Users\Priya Sutariya\Desktop\Darshan Vaghani\Week 10\Event Management\Expenses Management\image\img_11-04-2024 04-43-37 PM.jpg')
INSERT [dbo].[TBL_Event] ([Id], [EventName], [EventStartDate], [EventEndDate], [AddDate], [IsActive], [EventImage]) VALUES (43, N'Diwali', CAST(N'2024-04-19' AS Date), CAST(N'2024-04-27' AS Date), CAST(N'2024-03-21T09:58:15.367' AS DateTime), 1, N'C:\Users\Priya Sutariya\Desktop\Darshan Vaghani\Week 10\Event Management\Expenses Management\image\img_11-04-2024 04-43-37 PM.jpg')
INSERT [dbo].[TBL_Event] ([Id], [EventName], [EventStartDate], [EventEndDate], [AddDate], [IsActive], [EventImage]) VALUES (44, N'Diwali', CAST(N'2024-04-19' AS Date), CAST(N'2024-04-27' AS Date), CAST(N'2024-03-20T21:29:13.023' AS DateTime), 1, N'C:\Users\Priya Sutariya\Desktop\Darshan Vaghani\Week 10\Event Management\Expenses Management\image\img_11-04-2024 04-43-37 PM.jpg')
INSERT [dbo].[TBL_Event] ([Id], [EventName], [EventStartDate], [EventEndDate], [AddDate], [IsActive], [EventImage]) VALUES (45, N'Diwali', CAST(N'2024-04-19' AS Date), CAST(N'2024-04-27' AS Date), CAST(N'2024-03-20T09:00:10.683' AS DateTime), 1, N'C:\Users\Priya Sutariya\Desktop\Darshan Vaghani\Week 10\Event Management\Expenses Management\image\img_11-04-2024 04-43-37 PM.jpg')
INSERT [dbo].[TBL_Event] ([Id], [EventName], [EventStartDate], [EventEndDate], [AddDate], [IsActive], [EventImage]) VALUES (46, N'Diwali', CAST(N'2024-04-19' AS Date), CAST(N'2024-04-27' AS Date), CAST(N'2024-03-19T20:31:08.343' AS DateTime), 1, N'C:\Users\Priya Sutariya\Desktop\Darshan Vaghani\Week 10\Event Management\Expenses Management\image\img_11-04-2024 04-43-37 PM.jpg')
INSERT [dbo].[TBL_Event] ([Id], [EventName], [EventStartDate], [EventEndDate], [AddDate], [IsActive], [EventImage]) VALUES (47, N'Diwali', CAST(N'2024-04-19' AS Date), CAST(N'2024-04-27' AS Date), CAST(N'2024-03-19T08:02:06.000' AS DateTime), 1, N'C:\Users\Priya Sutariya\Desktop\Darshan Vaghani\Week 10\Event Management\Expenses Management\image\img_11-04-2024 04-43-37 PM.jpg')
INSERT [dbo].[TBL_Event] ([Id], [EventName], [EventStartDate], [EventEndDate], [AddDate], [IsActive], [EventImage]) VALUES (48, N'Diwali', CAST(N'2024-04-19' AS Date), CAST(N'2024-04-27' AS Date), CAST(N'2024-03-18T19:33:03.660' AS DateTime), 1, N'C:\Users\Priya Sutariya\Desktop\Darshan Vaghani\Week 10\Event Management\Expenses Management\image\img_11-04-2024 04-43-37 PM.jpg')
INSERT [dbo].[TBL_Event] ([Id], [EventName], [EventStartDate], [EventEndDate], [AddDate], [IsActive], [EventImage]) VALUES (49, N'Diwali', CAST(N'2024-04-19' AS Date), CAST(N'2024-04-27' AS Date), CAST(N'2024-03-18T07:04:01.320' AS DateTime), 1, N'C:\Users\Priya Sutariya\Desktop\Darshan Vaghani\Week 10\Event Management\Expenses Management\image\img_11-04-2024 04-43-37 PM.jpg')
INSERT [dbo].[TBL_Event] ([Id], [EventName], [EventStartDate], [EventEndDate], [AddDate], [IsActive], [EventImage]) VALUES (50, N'Diwali', CAST(N'2024-04-19' AS Date), CAST(N'2024-04-27' AS Date), CAST(N'2024-03-17T18:34:58.977' AS DateTime), 1, N'C:\Users\Priya Sutariya\Desktop\Darshan Vaghani\Week 10\Event Management\Expenses Management\image\img_11-04-2024 04-43-37 PM.jpg')
INSERT [dbo].[TBL_Event] ([Id], [EventName], [EventStartDate], [EventEndDate], [AddDate], [IsActive], [EventImage]) VALUES (51, N'Diwali', CAST(N'2024-04-19' AS Date), CAST(N'2024-04-27' AS Date), CAST(N'2024-03-17T06:05:56.637' AS DateTime), 1, N'C:\Users\Priya Sutariya\Desktop\Darshan Vaghani\Week 10\Event Management\Expenses Management\image\img_11-04-2024 04-43-37 PM.jpg')
INSERT [dbo].[TBL_Event] ([Id], [EventName], [EventStartDate], [EventEndDate], [AddDate], [IsActive], [EventImage]) VALUES (52, N'Diwali', CAST(N'2024-04-19' AS Date), CAST(N'2024-04-27' AS Date), CAST(N'2024-03-16T17:36:54.297' AS DateTime), 1, N'C:\Users\Priya Sutariya\Desktop\Darshan Vaghani\Week 10\Event Management\Expenses Management\image\img_11-04-2024 04-43-37 PM.jpg')
INSERT [dbo].[TBL_Event] ([Id], [EventName], [EventStartDate], [EventEndDate], [AddDate], [IsActive], [EventImage]) VALUES (53, N'Diwali', CAST(N'2024-04-19' AS Date), CAST(N'2024-04-27' AS Date), CAST(N'2024-03-16T05:07:51.953' AS DateTime), 1, N'C:\Users\Priya Sutariya\Desktop\Darshan Vaghani\Week 10\Event Management\Expenses Management\image\img_11-04-2024 04-43-37 PM.jpg')
INSERT [dbo].[TBL_Event] ([Id], [EventName], [EventStartDate], [EventEndDate], [AddDate], [IsActive], [EventImage]) VALUES (54, N'Diwali', CAST(N'2024-04-19' AS Date), CAST(N'2024-04-27' AS Date), CAST(N'2024-03-15T16:38:49.613' AS DateTime), 1, N'C:\Users\Priya Sutariya\Desktop\Darshan Vaghani\Week 10\Event Management\Expenses Management\image\img_11-04-2024 04-43-37 PM.jpg')
INSERT [dbo].[TBL_Event] ([Id], [EventName], [EventStartDate], [EventEndDate], [AddDate], [IsActive], [EventImage]) VALUES (55, N'Diwali', CAST(N'2024-04-19' AS Date), CAST(N'2024-04-27' AS Date), CAST(N'2024-03-15T04:09:47.273' AS DateTime), 1, N'C:\Users\Priya Sutariya\Desktop\Darshan Vaghani\Week 10\Event Management\Expenses Management\image\img_11-04-2024 04-43-37 PM.jpg')
INSERT [dbo].[TBL_Event] ([Id], [EventName], [EventStartDate], [EventEndDate], [AddDate], [IsActive], [EventImage]) VALUES (56, N'Diwali', CAST(N'2024-04-19' AS Date), CAST(N'2024-04-27' AS Date), CAST(N'2024-03-14T15:40:44.933' AS DateTime), 1, N'C:\Users\Priya Sutariya\Desktop\Darshan Vaghani\Week 10\Event Management\Expenses Management\image\img_11-04-2024 04-43-37 PM.jpg')
INSERT [dbo].[TBL_Event] ([Id], [EventName], [EventStartDate], [EventEndDate], [AddDate], [IsActive], [EventImage]) VALUES (57, N'Diwali', CAST(N'2024-04-19' AS Date), CAST(N'2024-04-27' AS Date), CAST(N'2024-03-14T03:11:42.590' AS DateTime), 1, N'C:\Users\Priya Sutariya\Desktop\Darshan Vaghani\Week 10\Event Management\Expenses Management\image\img_11-04-2024 04-43-37 PM.jpg')
INSERT [dbo].[TBL_Event] ([Id], [EventName], [EventStartDate], [EventEndDate], [AddDate], [IsActive], [EventImage]) VALUES (58, N'Diwali', CAST(N'2024-04-19' AS Date), CAST(N'2024-04-27' AS Date), CAST(N'2024-03-13T14:42:40.250' AS DateTime), 1, N'C:\Users\Priya Sutariya\Desktop\Darshan Vaghani\Week 10\Event Management\Expenses Management\image\img_11-04-2024 04-43-37 PM.jpg')
INSERT [dbo].[TBL_Event] ([Id], [EventName], [EventStartDate], [EventEndDate], [AddDate], [IsActive], [EventImage]) VALUES (59, N'Diwali', CAST(N'2024-04-19' AS Date), CAST(N'2024-04-27' AS Date), CAST(N'2024-03-13T02:13:37.910' AS DateTime), 1, N'C:\Users\Priya Sutariya\Desktop\Darshan Vaghani\Week 10\Event Management\Expenses Management\image\img_11-04-2024 04-43-37 PM.jpg')
INSERT [dbo].[TBL_Event] ([Id], [EventName], [EventStartDate], [EventEndDate], [AddDate], [IsActive], [EventImage]) VALUES (60, N'Diwali', CAST(N'2024-04-19' AS Date), CAST(N'2024-04-27' AS Date), CAST(N'2024-03-12T13:44:35.567' AS DateTime), 1, N'C:\Users\Priya Sutariya\Desktop\Darshan Vaghani\Week 10\Event Management\Expenses Management\image\img_11-04-2024 04-43-37 PM.jpg')
INSERT [dbo].[TBL_Event] ([Id], [EventName], [EventStartDate], [EventEndDate], [AddDate], [IsActive], [EventImage]) VALUES (61, N'Diwali', CAST(N'2024-04-19' AS Date), CAST(N'2024-04-27' AS Date), CAST(N'2024-03-12T01:15:33.227' AS DateTime), 1, N'C:\Users\Priya Sutariya\Desktop\Darshan Vaghani\Week 10\Event Management\Expenses Management\image\img_11-04-2024 04-43-37 PM.jpg')
INSERT [dbo].[TBL_Event] ([Id], [EventName], [EventStartDate], [EventEndDate], [AddDate], [IsActive], [EventImage]) VALUES (62, N'Diwali', CAST(N'2024-04-19' AS Date), CAST(N'2024-04-27' AS Date), CAST(N'2024-03-11T12:46:30.887' AS DateTime), 1, N'C:\Users\Priya Sutariya\Desktop\Darshan Vaghani\Week 10\Event Management\Expenses Management\image\img_11-04-2024 04-43-37 PM.jpg')
INSERT [dbo].[TBL_Event] ([Id], [EventName], [EventStartDate], [EventEndDate], [AddDate], [IsActive], [EventImage]) VALUES (63, N'Diwali', CAST(N'2024-04-19' AS Date), CAST(N'2024-04-27' AS Date), CAST(N'2024-03-11T00:17:28.543' AS DateTime), 1, N'C:\Users\Priya Sutariya\Desktop\Darshan Vaghani\Week 10\Event Management\Expenses Management\image\img_11-04-2024 04-43-37 PM.jpg')
INSERT [dbo].[TBL_Event] ([Id], [EventName], [EventStartDate], [EventEndDate], [AddDate], [IsActive], [EventImage]) VALUES (64, N'Diwali', CAST(N'2024-04-19' AS Date), CAST(N'2024-04-27' AS Date), CAST(N'2024-03-10T11:48:26.203' AS DateTime), 1, N'C:\Users\Priya Sutariya\Desktop\Darshan Vaghani\Week 10\Event Management\Expenses Management\image\img_11-04-2024 04-43-37 PM.jpg')
INSERT [dbo].[TBL_Event] ([Id], [EventName], [EventStartDate], [EventEndDate], [AddDate], [IsActive], [EventImage]) VALUES (65, N'Holi', CAST(N'2024-04-19' AS Date), CAST(N'2024-04-27' AS Date), CAST(N'2024-03-09T23:19:23.863' AS DateTime), 1, N'C:\Users\Priya Sutariya\Desktop\Darshan Vaghani\Week 10\Event Management\Expenses Management\image\img_11-04-2024 04-43-37 PM.jpg')
INSERT [dbo].[TBL_Event] ([Id], [EventName], [EventStartDate], [EventEndDate], [AddDate], [IsActive], [EventImage]) VALUES (66, N'ramzan', CAST(N'2024-04-19' AS Date), CAST(N'2024-04-27' AS Date), CAST(N'2024-03-09T10:50:21.520' AS DateTime), 1, N'C:\Users\Priya Sutariya\Desktop\Darshan Vaghani\Week 10\Event Management\Expenses Management\image\img_11-04-2024 04-43-37 PM.jpg')
INSERT [dbo].[TBL_Event] ([Id], [EventName], [EventStartDate], [EventEndDate], [AddDate], [IsActive], [EventImage]) VALUES (67, N'id-a-milad', CAST(N'2024-04-19' AS Date), CAST(N'2024-04-27' AS Date), CAST(N'2024-03-08T22:21:19.180' AS DateTime), 1, N'C:\Users\Priya Sutariya\Desktop\Darshan Vaghani\Week 10\Event Management\Expenses Management\image\img_11-04-2024 04-43-37 PM.jpg')
INSERT [dbo].[TBL_Event] ([Id], [EventName], [EventStartDate], [EventEndDate], [AddDate], [IsActive], [EventImage]) VALUES (68, N'hanuman', CAST(N'2024-04-19' AS Date), CAST(N'2024-04-27' AS Date), CAST(N'2024-03-08T09:52:16.840' AS DateTime), 1, N'C:\Users\Priya Sutariya\Desktop\Darshan Vaghani\Week 10\Event Management\Expenses Management\image\img_11-04-2024 04-43-37 PM.jpg')
INSERT [dbo].[TBL_Event] ([Id], [EventName], [EventStartDate], [EventEndDate], [AddDate], [IsActive], [EventImage]) VALUES (69, N'', CAST(N'2024-04-19' AS Date), CAST(N'2024-04-27' AS Date), CAST(N'2024-03-07T21:23:14.497' AS DateTime), 1, N'C:\Users\Priya Sutariya\Desktop\Darshan Vaghani\Week 10\Event Management\Expenses Management\image\img_11-04-2024 04-43-37 PM.jpg')
INSERT [dbo].[TBL_Event] ([Id], [EventName], [EventStartDate], [EventEndDate], [AddDate], [IsActive], [EventImage]) VALUES (70, N'bestuvarsh', CAST(N'2024-04-19' AS Date), CAST(N'2024-04-27' AS Date), CAST(N'2024-03-07T08:54:12.157' AS DateTime), 1, N'C:\Users\Priya Sutariya\Desktop\Darshan Vaghani\Week 10\Event Management\Expenses Management\image\img_11-04-2024 04-43-37 PM.jpg')
INSERT [dbo].[TBL_Event] ([Id], [EventName], [EventStartDate], [EventEndDate], [AddDate], [IsActive], [EventImage]) VALUES (71, N'tajposhi', CAST(N'2024-04-19' AS Date), CAST(N'2024-04-27' AS Date), CAST(N'2024-03-06T20:25:09.817' AS DateTime), 1, N'C:\Users\Priya Sutariya\Desktop\Darshan Vaghani\Week 10\Event Management\Expenses Management\image\img_11-04-2024 04-43-37 PM.jpg')
INSERT [dbo].[TBL_Event] ([Id], [EventName], [EventStartDate], [EventEndDate], [AddDate], [IsActive], [EventImage]) VALUES (72, N'egerhgerhweh', CAST(N'2024-04-17' AS Date), CAST(N'2024-04-19' AS Date), CAST(N'2024-04-16T12:12:05.763' AS DateTime), 0, N'C:\Users\Priya Sutariya\Desktop\Darshan Vaghani\Week 10\Event Management\Expenses Management\image\img_16-04-2024 12-12-04 PM.jpg')
SET IDENTITY_INSERT [dbo].[TBL_Event] OFF
GO
SET IDENTITY_INSERT [dbo].[TBL_EventActivity] ON 

INSERT [dbo].[TBL_EventActivity] ([Id], [Event_Id], [EventActivityName], [StartDate], [EndDate], [AddDate], [isActive], [Price]) VALUES (1, 12, N'visiting temples', CAST(N'2024-04-27T18:00:00.000' AS DateTime), CAST(N'2024-04-27T08:00:00.000' AS DateTime), CAST(N'2024-04-11' AS Date), 1, 500)
INSERT [dbo].[TBL_EventActivity] ([Id], [Event_Id], [EventActivityName], [StartDate], [EndDate], [AddDate], [isActive], [Price]) VALUES (2, 12, N'Reading the Ramayana', CAST(N'2024-04-27T09:00:00.000' AS DateTime), CAST(N'2024-04-27T10:00:00.000' AS DateTime), CAST(N'2024-04-11' AS Date), 1, 200)
INSERT [dbo].[TBL_EventActivity] ([Id], [Event_Id], [EventActivityName], [StartDate], [EndDate], [AddDate], [isActive], [Price]) VALUES (3, 12, N'singing bhajans or kirtans', CAST(N'2024-04-27T18:00:00.000' AS DateTime), CAST(N'2024-04-27T22:00:00.000' AS DateTime), CAST(N'2024-04-11' AS Date), 1, 100)
INSERT [dbo].[TBL_EventActivity] ([Id], [Event_Id], [EventActivityName], [StartDate], [EndDate], [AddDate], [isActive], [Price]) VALUES (4, 13, N'Colours Play', CAST(N'2024-04-21T13:00:00.000' AS DateTime), CAST(N'2024-04-21T15:00:00.000' AS DateTime), CAST(N'2024-04-11' AS Date), 1, 1000)
INSERT [dbo].[TBL_EventActivity] ([Id], [Event_Id], [EventActivityName], [StartDate], [EndDate], [AddDate], [isActive], [Price]) VALUES (5, 13, N'Music and Dance', CAST(N'2024-04-21T16:00:00.000' AS DateTime), CAST(N'2024-04-21T18:00:00.000' AS DateTime), CAST(N'2024-04-11' AS Date), 1, 950)
INSERT [dbo].[TBL_EventActivity] ([Id], [Event_Id], [EventActivityName], [StartDate], [EndDate], [AddDate], [isActive], [Price]) VALUES (6, 13, N'Colorful Water Balloon Fight', CAST(N'2024-04-21T18:00:00.000' AS DateTime), CAST(N'2024-04-21T19:00:00.000' AS DateTime), CAST(N'2024-04-11' AS Date), 1, 1250)
INSERT [dbo].[TBL_EventActivity] ([Id], [Event_Id], [EventActivityName], [StartDate], [EndDate], [AddDate], [isActive], [Price]) VALUES (7, 16, N'wefcadscasd', CAST(N'2024-04-20T16:43:00.000' AS DateTime), CAST(N'2024-04-21T16:43:00.000' AS DateTime), CAST(N'2024-04-11' AS Date), 0, NULL)
INSERT [dbo].[TBL_EventActivity] ([Id], [Event_Id], [EventActivityName], [StartDate], [EndDate], [AddDate], [isActive], [Price]) VALUES (8, 16, N'wefcadscasd', CAST(N'2024-04-20T16:43:00.000' AS DateTime), CAST(N'2024-04-21T16:43:00.000' AS DateTime), CAST(N'2024-04-11' AS Date), 0, NULL)
SET IDENTITY_INSERT [dbo].[TBL_EventActivity] OFF
GO
SET IDENTITY_INSERT [dbo].[TBL_User] ON 

INSERT [dbo].[TBL_User] ([Id], [Name], [EmailId], [Password], [MobileNumber]) VALUES (1, N'darshan', N'darshan0@gmail.com', N'Darshan@123', 9510484425)
INSERT [dbo].[TBL_User] ([Id], [Name], [EmailId], [Password], [MobileNumber]) VALUES (2, N'darshan', N'darshan01@gmail.com', N'Darshan@123', 9510484425)
INSERT [dbo].[TBL_User] ([Id], [Name], [EmailId], [Password], [MobileNumber]) VALUES (3, N'Darshan', N'darshan58@gmail.com', N'Darshan@123', 9510484425)
INSERT [dbo].[TBL_User] ([Id], [Name], [EmailId], [Password], [MobileNumber]) VALUES (8, N'Darshan', N'darshan07@gmail.com', N'sdgdfghbdfbfbdf', 546546565)
INSERT [dbo].[TBL_User] ([Id], [Name], [EmailId], [Password], [MobileNumber]) VALUES (9, N'Darshan', N'darshan5@gmail.com', N'Darshan@123', 9510484425)
SET IDENTITY_INSERT [dbo].[TBL_User] OFF
GO
ALTER TABLE [dbo].[TBL_EventActivity]  WITH CHECK ADD  CONSTRAINT [FK_TBL_EventActivity_TBL_Event] FOREIGN KEY([Event_Id])
REFERENCES [dbo].[TBL_Event] ([Id])
GO
ALTER TABLE [dbo].[TBL_EventActivity] CHECK CONSTRAINT [FK_TBL_EventActivity_TBL_Event]
GO
/****** Object:  StoredProcedure [dbo].[SP_ActivityPrice]    Script Date: 16-04-2024 05:22:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_ActivityPrice]
(@ActivityId bigint,
@Price bigint
)
AS
BEGIN
	Update TBL_EventActivity SET Price=@Price,isActive=1 WHERE Id=@ActivityId
	SELECT 'Price Add Successfully' AS Response
END
GO
/****** Object:  StoredProcedure [dbo].[SP_AdminLogIn]    Script Date: 16-04-2024 05:22:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROC [dbo].[SP_AdminLogIn]  -- 'darshan','darshan01@gmail.com','Darshan@123',9510484425
(@Name nvarchar(max),
@EmailId nvarchar(230),
@Password nvarchar(max))
AS
BEGIN
	IF(EXISTS(SELECT 1 FROM TBL_admin WHERE Name=@Name AND EmailId=@EmailId AND Password=@Password))
	BEGIN
		SELECT 'Valid Admin' AS Response,Id From TBL_admin WHERE EmailId=@EmailId
	END
	ELSE
	BEGIN
		SELECT 'Invalid Admin' AS Response,0 as Id
	END
END
GO
/****** Object:  StoredProcedure [dbo].[SP_AdminRegister]    Script Date: 16-04-2024 05:22:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_AdminRegister] -- 'darshan','darshan01@gmail.com','Darshan@123',9510484425
(@Name nvarchar(max),
@EmailId nvarchar(230),
@Password nvarchar(max),
@Mobile bigint)
AS
BEGIN
	IF(EXISTS(SELECT 1 FROM TBL_admin WHERE EmailId=@EmailId))
	BEGIN
		SELECT 'Admin Already Exist' AS Response
	END
	ELSE
	BEGIN
		INSERT INTO TBL_admin (Name,EmailId,Password,MobileNumber) VALUES (@Name,@EmailId,@Password,@Mobile)
		IF(EXISTS(SELECT 1 FROM TBL_admin WHERE EmailId=@EmailId))
		BEGIN
			SELECT 'Admin Register Successfully' AS Response
		END
		ELSE
		BEGIN
			SELECT 'Admin Not Register' AS Response
		END
	END
END
GO
/****** Object:  StoredProcedure [dbo].[SP_AllEventwithActivity]    Script Date: 16-04-2024 05:22:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_AllEventwithActivity] --4
(@EventId bigint)
AS
BEGIN
	SELECT e.Id,e.EventName,e.EventStartDate,e.EventEndDate,e.EventImage,a.EventActivityName,a.StartDate,a.EndDate,a.Price,'All published Events' AS Response 
	FROM TBL_Event e LEFT JOIN TBL_EventActivity a ON e.Id=a.Event_Id WHERE e.IsActive=1 AND e.Id=@EventId
END
GO
/****** Object:  StoredProcedure [dbo].[SP_EventForAdmin]    Script Date: 16-04-2024 05:22:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_EventForAdmin] --'upcoming'
(@flag nvarchar(10))
AS
BEGIN
	IF(@flag='past')
	BEGIN
		SELECT TOP 11 EventName,EventStartDate,EventEndDate FROM TBL_Event WHERE IsActive=1 AND EventEndDate<=GETDATE()-1
	END
	IF(@flag='upcoming')
	BEGIN
		SELECT TOP 11 EventName,EventStartDate,EventEndDate FROM TBL_Event WHERE IsActive=1 AND EventEndDate>=GETDATE()-1 
	END
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GetActiveEvents]    Script Date: 16-04-2024 05:22:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_GetActiveEvents] 
AS
BEGIN
	SELECT Id,EventName, 'All Non publish Event' AS Response FROM TBL_Event WHERE IsActive=0
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GetActivityOfEvent]    Script Date: 16-04-2024 05:22:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_GetActivityOfEvent]
(@EventId bigint
)
AS
BEGIN
	SELECT Id,EventActivityName AS ActivityName,'All Activity of Event' AS Response FROM TBL_EventActivity WHERE IsActive=0 AND Event_Id=@EventId
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GetAllEvent]    Script Date: 16-04-2024 05:22:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_GetAllEvent]
AS
BEGIN
	SELECT EventName,EventStartDate,EventEndDate,EventImage FROM TBL_Event WHERE isActive=1
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GetEventate]    Script Date: 16-04-2024 05:22:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_GetEventate]-- 1
(@EventId bigint)
AS
BEGIN
	SELECT EventStartDate,EventEndDate,'date'AS Response FROM TBL_Event WHERE Id=@EventId
END
GO
/****** Object:  StoredProcedure [dbo].[SP_InsertEvent]    Script Date: 16-04-2024 05:22:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_InsertEvent]  --'Holi','2024-05-06','2024-09-08',''
(@EventName nvarchar(max),
@StartDate date,
@EndDate date,
@Image text NULL)
AS
BEGIN
	INSERT INTO TBL_Event (EventName,EventStartDate,EventEndDate,EventImage,AddDate,IsActive) VALUES (@EventName,@StartDate,@EndDate,@Image,GETDATE(),0)
	SELECT TOP 1 Id,'Event Added Successfully' AS Response FROM TBL_Event WHERE EventName=@EventName AND EventStartDate=@StartDate AND EventEndDate=@EndDate ORDER BY Id DESC 
END
GO
/****** Object:  StoredProcedure [dbo].[SP_InsertEventActivity]    Script Date: 16-04-2024 05:22:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_InsertEventActivity]-- 'Holi','2024-05-06','2024-09-08',''
(@EventId bigint,
@ActivityName nvarchar(max),
@StartDate datetime,
@EndDate datetime)
AS
BEGIN
	INSERT INTO TBL_EventActivity (Event_Id,EventActivityName,StartDate,EndDate,AddDate,isActive) VALUES (@EventId,@ActivityName,@StartDate,@EndDate,GETDATE(),0)
	SELECT 'Activity Added Successfully' AS Response 
END
GO
/****** Object:  StoredProcedure [dbo].[SP_PublishedEvent]    Script Date: 16-04-2024 05:22:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_PublishedEvent] 
AS
BEGIN
	SELECT Id,EventName,EventStartDate,EventEndDate ,AddDate,'All published Events' AS Response FROM TBL_Event WHERE  IsActive=1 AND EventEndDate>=GETDATE()-1
END
GO
/****** Object:  StoredProcedure [dbo].[SP_PublishedEventCount]    Script Date: 16-04-2024 05:22:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SP_PublishedEventCount]
AS
BEGIN
	SELECT COUNT(Id) AS C FROM TBL_Event WHERE  IsActive=1 AND EventEndDate>=GETDATE()-1
END
GO
/****** Object:  StoredProcedure [dbo].[SP_PublishedEventForPagging]    Script Date: 16-04-2024 05:22:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_PublishedEventForPagging]
(@page bigint,
@EventPerPage bigint
)
AS
BEGIN
	SELECT Id,EventName,EventStartDate,EventEndDate ,'All published Events' AS Response FROM TBL_Event WHERE IsActive=1 AND EventEndDate>=GETDATE()-1
	ORDER BY Id
	OFFSET ((@page-1)*@EventPerPage) ROWS FETCH NEXT (@EventPerPage) ROWS ONLY
END
GO
/****** Object:  StoredProcedure [dbo].[SP_PublishEvent]    Script Date: 16-04-2024 05:22:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_PublishEvent] 
(@EventId bigint)
AS
BEGIN
	UPDATE TBL_Event SET IsActive=1 WHERE Id=@EventId
	SELECT 'Publish Successfully' AS Response
END
GO
/****** Object:  StoredProcedure [dbo].[SP_UserLogIn]    Script Date: 16-04-2024 05:22:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_UserLogIn] --  'darshan','darshan0@gmail.com','Darshan@123'
(@Name nvarchar(max),
@EmailId nvarchar(230),
@Password nvarchar(max))
AS
BEGIN
	IF(EXISTS(SELECT 1 FROM TBL_User WHERE Name=@Name AND EmailId=@EmailId AND Password=@Password))
	BEGIN
		SELECT 'Valid User' AS Response,Id From TBL_User WHERE EmailId=@EmailId
	END
	ELSE
	BEGIN
		SELECT 'Invalid User' AS Response,0 as Id
	END
END
GO
/****** Object:  StoredProcedure [dbo].[SP_UserRegister]    Script Date: 16-04-2024 05:22:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_UserRegister] -- 'darshan','darshan0@gmail.com','Darshan@123',9510484425
(@Name nvarchar(max),
@EmailId nvarchar(230),
@Password nvarchar(max),
@Mobile bigint)
AS
BEGIN
	IF(EXISTS(SELECT 1 FROM TBL_User WHERE EmailId=@EmailId))
	BEGIN
		SELECT Id,'User Already Exist' AS Response FROM TBL_User WHERE EmailId=@EmailId
	END
	ELSE
	BEGIN
		INSERT INTO TBL_User (Name,EmailId,Password,MobileNumber) VALUES (@Name,@EmailId,@Password,@Mobile)
		IF(EXISTS(SELECT 1 FROM TBL_User WHERE EmailId=@EmailId))
		BEGIN
			SELECT Id,'User Register Successfully' AS Response FROM TBL_User WHERE EmailId=@EmailId
		END
		ELSE
		BEGIN
			SELECT 0 AS Id, 'User Not Register' AS Response 
		END
	END
END
GO
USE [master]
GO
ALTER DATABASE [Event_Management] SET  READ_WRITE 
GO
