USE [master]
GO
/****** Object:  Database [Demo]    Script Date: 22-03-2024 15:36:19 ******/
CREATE DATABASE [Demo]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Demo', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Demo.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Demo_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Demo_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Demo] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Demo].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Demo] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Demo] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Demo] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Demo] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Demo] SET ARITHABORT OFF 
GO
ALTER DATABASE [Demo] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Demo] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Demo] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Demo] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Demo] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Demo] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Demo] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Demo] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Demo] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Demo] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Demo] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Demo] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Demo] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Demo] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Demo] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Demo] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Demo] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Demo] SET RECOVERY FULL 
GO
ALTER DATABASE [Demo] SET  MULTI_USER 
GO
ALTER DATABASE [Demo] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Demo] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Demo] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Demo] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Demo] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Demo] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Demo', N'ON'
GO
ALTER DATABASE [Demo] SET QUERY_STORE = ON
GO
ALTER DATABASE [Demo] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Demo]
GO
/****** Object:  Table [dbo].[tblLeadDetail]    Script Date: 22-03-2024 15:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblLeadDetail](
	[LeadId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[MiddleName] [varchar](50) NULL,
	[JobTitle] [varchar](50) NULL,
	[PersonalEmail] [varchar](50) NULL,
	[WorkEmail] [varchar](50) NULL,
	[CompanyContactEmail] [varchar](50) NULL,
	[Country] [varchar](50) NULL,
	[State] [varchar](50) NULL,
	[City] [varchar](50) NULL,
	[Linkedin] [varchar](50) NULL,
	[CreatedDate] [date] NULL,
	[Status] [varchar](50) NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[isDeleted] [int] NULL,
	[CreatedId] [int] NULL,
 CONSTRAINT [PK_CRUD] PRIMARY KEY CLUSTERED 
(
	[LeadId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblRole]    Script Date: 22-03-2024 15:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRole](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUser]    Script Date: 22-03-2024 15:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUser](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[MiddleName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[isDeleted] [int] NOT NULL,
 CONSTRAINT [PK_tblUser] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[userRoles]    Script Date: 22-03-2024 15:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[userRoles](
	[UserRoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
 CONSTRAINT [PK__userRole__3D978A55507C5CDD] PRIMARY KEY CLUSTERED 
(
	[UserRoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tblLeadDetail] ON 

INSERT [dbo].[tblLeadDetail] ([LeadId], [FirstName], [LastName], [MiddleName], [JobTitle], [PersonalEmail], [WorkEmail], [CompanyContactEmail], [Country], [State], [City], [Linkedin], [CreatedDate], [Status], [CreatedBy], [isDeleted], [CreatedId]) VALUES (2040, N'Shubham', N'Patil', N'shankar', N'Developer', N'p@gmail.com', N'w@gmail.com', N'c@gmail.com', N'India', N'Maharashtra', N'Pune', N'link', CAST(N'2024-03-15' AS Date), N'email sent', N'Shubham', 1, 1)
INSERT [dbo].[tblLeadDetail] ([LeadId], [FirstName], [LastName], [MiddleName], [JobTitle], [PersonalEmail], [WorkEmail], [CompanyContactEmail], [Country], [State], [City], [Linkedin], [CreatedDate], [Status], [CreatedBy], [isDeleted], [CreatedId]) VALUES (2042, N'Rahul', N'salunkhe', N'NA', N'Angular', N'salunkhe@gmail.com', N'work@gmail.com', N'company@gmail.com', N'India', N'Maharashtra', N'Kolhapur', N'linkedin', CAST(N'2024-03-22' AS Date), N'new', N'Shubham', 0, 1)
INSERT [dbo].[tblLeadDetail] ([LeadId], [FirstName], [LastName], [MiddleName], [JobTitle], [PersonalEmail], [WorkEmail], [CompanyContactEmail], [Country], [State], [City], [Linkedin], [CreatedDate], [Status], [CreatedBy], [isDeleted], [CreatedId]) VALUES (2043, N'Shiridhar', N'Kate', N'NA', N'Former Dev', N'shridhar@gmail.com', N'work@gmail.com', N'company@gmail.com', N'India', N'Maharashtra', N'Ichalkaranji', N'link', CAST(N'2024-03-18' AS Date), N'email sent', N'Shubham', 0, 1)
INSERT [dbo].[tblLeadDetail] ([LeadId], [FirstName], [LastName], [MiddleName], [JobTitle], [PersonalEmail], [WorkEmail], [CompanyContactEmail], [Country], [State], [City], [Linkedin], [CreatedDate], [Status], [CreatedBy], [isDeleted], [CreatedId]) VALUES (2045, N'Pratik', N'hulawle', N'NA', N'Dev', N'pratik@gmail.com', N'work@gmail.com', N'company@gmail.com', N'India', N'Maharashtra', N'Pune', N'link', CAST(N'2024-03-14' AS Date), N'email sent', N'Shubham', 1, 1)
INSERT [dbo].[tblLeadDetail] ([LeadId], [FirstName], [LastName], [MiddleName], [JobTitle], [PersonalEmail], [WorkEmail], [CompanyContactEmail], [Country], [State], [City], [Linkedin], [CreatedDate], [Status], [CreatedBy], [isDeleted], [CreatedId]) VALUES (2051, N'Shubham', N'Patil', N'Alias Balasaheb Shankar', N'asd', N'shubham@gmail.com', N'shubham@gmail.com', N'shubham@gmail.com', N'India', N'Nagaland', N'Kolhapur', N'asd', CAST(N'2024-03-18' AS Date), N'email sent', N'Shubham', 0, 1)
INSERT [dbo].[tblLeadDetail] ([LeadId], [FirstName], [LastName], [MiddleName], [JobTitle], [PersonalEmail], [WorkEmail], [CompanyContactEmail], [Country], [State], [City], [Linkedin], [CreatedDate], [Status], [CreatedBy], [isDeleted], [CreatedId]) VALUES (2052, N'Shubham', N'Patil', N'Alias Balasaheb Shankar', N'dfhg', N'shubham@gmail.com', N'shubham@gmail.com', N'shubham@gmail.com', N'India', N'Nagaland', N'asdsa', N'fghfh', CAST(N'2024-03-13' AS Date), N'new', N'Shubham', 0, 1)
INSERT [dbo].[tblLeadDetail] ([LeadId], [FirstName], [LastName], [MiddleName], [JobTitle], [PersonalEmail], [WorkEmail], [CompanyContactEmail], [Country], [State], [City], [Linkedin], [CreatedDate], [Status], [CreatedBy], [isDeleted], [CreatedId]) VALUES (2053, N'Rohan', N'Trivedi', N'Josh', N'Senior', N'rohan@gmail.com', N'work@gmail.com', N'Company@gmail.com', N'india', N'Maharashtra', N'ichalkaranji', N'link', CAST(N'2024-03-13' AS Date), N'new', N'shubham', 0, 1)
INSERT [dbo].[tblLeadDetail] ([LeadId], [FirstName], [LastName], [MiddleName], [JobTitle], [PersonalEmail], [WorkEmail], [CompanyContactEmail], [Country], [State], [City], [Linkedin], [CreatedDate], [Status], [CreatedBy], [isDeleted], [CreatedId]) VALUES (2054, N'Vishwajit', N'Hawale', N'NA', N'maha', N'vishwajeet@gmail.com', N'work@gmail.com', N'company@gmail.com', N'india', N'Manipur', N'Jalgaon', N'kida', CAST(N'2024-03-14' AS Date), N'new', N'Ramesh', 0, 2)
INSERT [dbo].[tblLeadDetail] ([LeadId], [FirstName], [LastName], [MiddleName], [JobTitle], [PersonalEmail], [WorkEmail], [CompanyContactEmail], [Country], [State], [City], [Linkedin], [CreatedDate], [Status], [CreatedBy], [isDeleted], [CreatedId]) VALUES (2055, N'Somesh', N'Karawande', N'NAS', N'Dev', N'somesh@gmail.com', N'work@gmail.com', N'company@gmail.com', N'india', N'Madhya Pradesh', N'indore', N'linki', CAST(N'2024-03-14' AS Date), N'new', N'Shubham', 0, 1)
INSERT [dbo].[tblLeadDetail] ([LeadId], [FirstName], [LastName], [MiddleName], [JobTitle], [PersonalEmail], [WorkEmail], [CompanyContactEmail], [Country], [State], [City], [Linkedin], [CreatedDate], [Status], [CreatedBy], [isDeleted], [CreatedId]) VALUES (2058, N'Mahendra', N'dhoni', N'Na', N'Finisher', N'dhoni@gmail.com', N'work@gmail.com', N'Own@gmail.com', N'india', N'Jharkhand', N'Ranchi', N'link', CAST(N'2024-03-14' AS Date), N'new', N'Shubham', 1, 1)
INSERT [dbo].[tblLeadDetail] ([LeadId], [FirstName], [LastName], [MiddleName], [JobTitle], [PersonalEmail], [WorkEmail], [CompanyContactEmail], [Country], [State], [City], [Linkedin], [CreatedDate], [Status], [CreatedBy], [isDeleted], [CreatedId]) VALUES (2059, N'Sachin', N'Tendulkar', N'NA', N'Batter', N'sachin@gmail.cm', N'work@gmail.com', N'ferrrari@gmail.com', N'india', N'Maharashtra', N'Mumbai', N'link', CAST(N'2024-03-14' AS Date), N'new', N'Ramesh', 1, 2)
INSERT [dbo].[tblLeadDetail] ([LeadId], [FirstName], [LastName], [MiddleName], [JobTitle], [PersonalEmail], [WorkEmail], [CompanyContactEmail], [Country], [State], [City], [Linkedin], [CreatedDate], [Status], [CreatedBy], [isDeleted], [CreatedId]) VALUES (2060, N'Yuvraj', N'Singh', N'Na', N'Sixer', N'yuvi@gmail.com', N'ipl@gmail.com', N'Punjab@gmail.com', N'India', N'Punjab', N'Bhatinda', N'link', CAST(N'2024-03-15' AS Date), N'new', N'Shubham', 1, 1)
INSERT [dbo].[tblLeadDetail] ([LeadId], [FirstName], [LastName], [MiddleName], [JobTitle], [PersonalEmail], [WorkEmail], [CompanyContactEmail], [Country], [State], [City], [Linkedin], [CreatedDate], [Status], [CreatedBy], [isDeleted], [CreatedId]) VALUES (2061, N'Rakesh', N'Sharma', N'Na', N'Astrounaut', N'rakesh@gmail.com', N'India', N'NASA', N'India', N'Tamil Nadu', N'Kochi', N'link', CAST(N'2024-03-15' AS Date), N'email sent', N'Ramesh', 1, 2)
INSERT [dbo].[tblLeadDetail] ([LeadId], [FirstName], [LastName], [MiddleName], [JobTitle], [PersonalEmail], [WorkEmail], [CompanyContactEmail], [Country], [State], [City], [Linkedin], [CreatedDate], [Status], [CreatedBy], [isDeleted], [CreatedId]) VALUES (2062, N'Krunal', N'Mistari', N'NA', N'React Dev', N'krunal@gmail.com', N'krunal@rbis.com', N'hr@rbis.com', N'india', N'Maharashtra', N'Jalgaon', N'link', CAST(N'2024-03-15' AS Date), N'new', N'Ramesh', 0, 2)
INSERT [dbo].[tblLeadDetail] ([LeadId], [FirstName], [LastName], [MiddleName], [JobTitle], [PersonalEmail], [WorkEmail], [CompanyContactEmail], [Country], [State], [City], [Linkedin], [CreatedDate], [Status], [CreatedBy], [isDeleted], [CreatedId]) VALUES (2063, N'Kalpesh', N'Patil', N'Na', N'React', N'kalpesh@gmail.com', N'kalpesh@rbis.com', N'hr@rbis.com', N'india', N'Maharashtra', N'jalgaon', N'link', CAST(N'2024-03-15' AS Date), N'new', N'Ramesh', 1, 2)
INSERT [dbo].[tblLeadDetail] ([LeadId], [FirstName], [LastName], [MiddleName], [JobTitle], [PersonalEmail], [WorkEmail], [CompanyContactEmail], [Country], [State], [City], [Linkedin], [CreatedDate], [Status], [CreatedBy], [isDeleted], [CreatedId]) VALUES (2064, N'Aditya ', N'Patil', N'NA', N'Backend Dev', N'aditya@gmail.com', N'adityap@rbistech.com', N'hr@rbis.com', N'india', N'Maharashtra', N'jalgaon', N'link', CAST(N'2024-03-15' AS Date), N'new', N'Ramesh', 0, 2)
INSERT [dbo].[tblLeadDetail] ([LeadId], [FirstName], [LastName], [MiddleName], [JobTitle], [PersonalEmail], [WorkEmail], [CompanyContactEmail], [Country], [State], [City], [Linkedin], [CreatedDate], [Status], [CreatedBy], [isDeleted], [CreatedId]) VALUES (2065, N'Jayesh', N'Bhore', N'NA ', N'UI/UX', N'jayesh@gmail.com', N'jayesh@rbis.com', N'hr@rbis.com', N'india', N'Maharashtra', N'Jalgaon', N'link', CAST(N'2024-03-15' AS Date), N'new', N'Ramesh', 0, 2)
INSERT [dbo].[tblLeadDetail] ([LeadId], [FirstName], [LastName], [MiddleName], [JobTitle], [PersonalEmail], [WorkEmail], [CompanyContactEmail], [Country], [State], [City], [Linkedin], [CreatedDate], [Status], [CreatedBy], [isDeleted], [CreatedId]) VALUES (2066, N'Ankit', N'Warade', N'NA', N'Data Scientist', N'ankit@gmail.com', N'ankit@rbis.com', N'hr@rbis.com', N'India', N'Maharashtra', N'Jalgaon', N'link', CAST(N'2024-03-15' AS Date), N'new', N'Ramesh', 0, 2)
INSERT [dbo].[tblLeadDetail] ([LeadId], [FirstName], [LastName], [MiddleName], [JobTitle], [PersonalEmail], [WorkEmail], [CompanyContactEmail], [Country], [State], [City], [Linkedin], [CreatedDate], [Status], [CreatedBy], [isDeleted], [CreatedId]) VALUES (2067, N'Saurabh', N'Nale', N'NA', N'Data Scientist', N'saurabh@rbis.com', N'saurabh@rbis.com', N'hr@rbis.com', N'india', N'Maharashtra', N'jalgaon', N'link', CAST(N'2024-03-15' AS Date), N'new', N'Ramesh', 0, 2)
INSERT [dbo].[tblLeadDetail] ([LeadId], [FirstName], [LastName], [MiddleName], [JobTitle], [PersonalEmail], [WorkEmail], [CompanyContactEmail], [Country], [State], [City], [Linkedin], [CreatedDate], [Status], [CreatedBy], [isDeleted], [CreatedId]) VALUES (2068, N'Rajesh ', N'Sharma', N'Na', N'Tester', N'rajesh@gmail.com', N'rajesh@rbis.com', N'hr@rbis.com', N'India', N'Madhya Pradesh', N'Indore', N'link', CAST(N'2024-03-19' AS Date), N'email sent', N'Ramesh', 0, 2)
INSERT [dbo].[tblLeadDetail] ([LeadId], [FirstName], [LastName], [MiddleName], [JobTitle], [PersonalEmail], [WorkEmail], [CompanyContactEmail], [Country], [State], [City], [Linkedin], [CreatedDate], [Status], [CreatedBy], [isDeleted], [CreatedId]) VALUES (2069, N'Yash', N'Kamble', N'NA', N'Python Dev', N'yash@gmail.com', N'yash@rbis.com', N'hr@rbis.com', N'India', N'Maharashtra', N'Kolhapur', N'link', CAST(N'2024-03-19' AS Date), N'email sent', N'shubham', 1, 1)
INSERT [dbo].[tblLeadDetail] ([LeadId], [FirstName], [LastName], [MiddleName], [JobTitle], [PersonalEmail], [WorkEmail], [CompanyContactEmail], [Country], [State], [City], [Linkedin], [CreatedDate], [Status], [CreatedBy], [isDeleted], [CreatedId]) VALUES (2070, N'Dhaneshwar', N'Singh', N'Na', N'Programmer', N'dhaneshwar@gmail.com', N'dhaneshwar@rbis.com', N'hr@rbis.com', N'India', N'Haryana', N'Na', N'linki', CAST(N'2024-03-21' AS Date), N'email sent', N'Ramesh', 1, 2)
INSERT [dbo].[tblLeadDetail] ([LeadId], [FirstName], [LastName], [MiddleName], [JobTitle], [PersonalEmail], [WorkEmail], [CompanyContactEmail], [Country], [State], [City], [Linkedin], [CreatedDate], [Status], [CreatedBy], [isDeleted], [CreatedId]) VALUES (2071, N'Rakesh', N'Jhunjunwala', N'NA', N'Trader', N'rakesh@gmail.com', N'rakesh@Trader.com', N'hr@Trader.com', N'india', N'Maharashtra', N'Mumbai', N'link', CAST(N'2024-03-22' AS Date), N'new', N'2', 1, NULL)
INSERT [dbo].[tblLeadDetail] ([LeadId], [FirstName], [LastName], [MiddleName], [JobTitle], [PersonalEmail], [WorkEmail], [CompanyContactEmail], [Country], [State], [City], [Linkedin], [CreatedDate], [Status], [CreatedBy], [isDeleted], [CreatedId]) VALUES (2072, N'Pooja ', N'Patil', N'Digambar', N'HouseWife', N'pooja@gmail.com', N'pooja@home.com', N'hr@home.com', N'India', N'Manipur', N'Kolhapur', N'link', CAST(N'2024-03-22' AS Date), N'new', N'2', 1, NULL)
INSERT [dbo].[tblLeadDetail] ([LeadId], [FirstName], [LastName], [MiddleName], [JobTitle], [PersonalEmail], [WorkEmail], [CompanyContactEmail], [Country], [State], [City], [Linkedin], [CreatedDate], [Status], [CreatedBy], [isDeleted], [CreatedId]) VALUES (2073, N'Jayashree ', N'Lohe', N'NA', N'Housewife', N'jayashree@gmail.com', N'jayashree@home.com', N'hr@home.com', N'India', N'Maharashtra', N'Jalgaon', N'link', CAST(N'2024-03-22' AS Date), N'new', N'Ramesh', 0, NULL)
INSERT [dbo].[tblLeadDetail] ([LeadId], [FirstName], [LastName], [MiddleName], [JobTitle], [PersonalEmail], [WorkEmail], [CompanyContactEmail], [Country], [State], [City], [Linkedin], [CreatedDate], [Status], [CreatedBy], [isDeleted], [CreatedId]) VALUES (2074, N'Vishal', N'Nemade', N'NA', N'Frontend Dev', N'vishal@gmail.com', N'vishal@rbis.com', N'hr@rbis.com', N'India', N'Maharashtra', N'Jalgaon', N'link', CAST(N'2024-03-22' AS Date), N'new', N'shubham', 0, NULL)
INSERT [dbo].[tblLeadDetail] ([LeadId], [FirstName], [LastName], [MiddleName], [JobTitle], [PersonalEmail], [WorkEmail], [CompanyContactEmail], [Country], [State], [City], [Linkedin], [CreatedDate], [Status], [CreatedBy], [isDeleted], [CreatedId]) VALUES (2075, N'pratik', N'Halawale', N'NA', N'BackEnd Dev', N'pratik@gmail.com', N'pratik@rbis.com', N'hr@rbis.com', N'India', N'Andhra Pradesh', N'shree shailam', N'link', CAST(N'2024-03-22' AS Date), N'email sent', N'shubham', 1, 1)
INSERT [dbo].[tblLeadDetail] ([LeadId], [FirstName], [LastName], [MiddleName], [JobTitle], [PersonalEmail], [WorkEmail], [CompanyContactEmail], [Country], [State], [City], [Linkedin], [CreatedDate], [Status], [CreatedBy], [isDeleted], [CreatedId]) VALUES (2076, N'pratik', N'Halawale', N'NA', N'BackEnd Dev', N'pratik@gmail.com', N'pratik@rbis.com', N'hr@rbis.com', N'India', N'Andhra Pradesh', N'shree shailam', N'link', CAST(N'2024-03-22' AS Date), N'new', N'shubham', 0, 1)
SET IDENTITY_INSERT [dbo].[tblLeadDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[tblRole] ON 

INSERT [dbo].[tblRole] ([RoleId], [RoleName]) VALUES (1, N'admin')
INSERT [dbo].[tblRole] ([RoleId], [RoleName]) VALUES (2, N'user')
SET IDENTITY_INSERT [dbo].[tblRole] OFF
GO
SET IDENTITY_INSERT [dbo].[tblUser] ON 

INSERT [dbo].[tblUser] ([UserId], [Email], [Password], [FirstName], [MiddleName], [LastName], [CreatedDate], [isDeleted]) VALUES (1, N'shubham@gmail.com', N'asd', N'shubham', N'Shankar', N'patil', CAST(N'2024-03-11T18:43:40.700' AS DateTime), 0)
INSERT [dbo].[tblUser] ([UserId], [Email], [Password], [FirstName], [MiddleName], [LastName], [CreatedDate], [isDeleted]) VALUES (2, N'shubhampatil101220@gmail.com', N'12345678', N'Ramesh', N'Kishor1', N'Kumar', CAST(N'2024-03-12T17:04:06.077' AS DateTime), 0)
INSERT [dbo].[tblUser] ([UserId], [Email], [Password], [FirstName], [MiddleName], [LastName], [CreatedDate], [isDeleted]) VALUES (3, N'Tushar@gmail.com', N'tusjaha', N'Tushar', N'Available', N'Patil', CAST(N'2024-03-15T13:08:02.543' AS DateTime), 1)
INSERT [dbo].[tblUser] ([UserId], [Email], [Password], [FirstName], [MiddleName], [LastName], [CreatedDate], [isDeleted]) VALUES (4, N'aditya@gmail.com', N'65646', N'Aditya', N'NA', N'Patil', CAST(N'2024-03-18T17:29:04.613' AS DateTime), 0)
INSERT [dbo].[tblUser] ([UserId], [Email], [Password], [FirstName], [MiddleName], [LastName], [CreatedDate], [isDeleted]) VALUES (5, N'rsrahulsalunkhe4@gmail.com', N'Jayashree@123', N'Rahul', N'NA', N'Salunkhe', CAST(N'2024-03-19T12:48:08.913' AS DateTime), 1)
INSERT [dbo].[tblUser] ([UserId], [Email], [Password], [FirstName], [MiddleName], [LastName], [CreatedDate], [isDeleted]) VALUES (6, N'rahul@gmail.com', N'rahul@123', N'Rahul', N'NA', N'Teli', CAST(N'2024-03-22T11:40:03.417' AS DateTime), 0)
INSERT [dbo].[tblUser] ([UserId], [Email], [Password], [FirstName], [MiddleName], [LastName], [CreatedDate], [isDeleted]) VALUES (7, N'rahulsalunkhe@gmail.com', N'rahuljayashree@123', N'Rahul', N'NA', N'Salunkhe', CAST(N'2024-03-22T12:10:25.240' AS DateTime), 0)
INSERT [dbo].[tblUser] ([UserId], [Email], [Password], [FirstName], [MiddleName], [LastName], [CreatedDate], [isDeleted]) VALUES (8, N'kushal@gmail.com', N'kushal@123', N'kushal', N'NA', N'Badrike', CAST(N'2024-03-22T12:13:48.290' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[tblUser] OFF
GO
SET IDENTITY_INSERT [dbo].[userRoles] ON 

INSERT [dbo].[userRoles] ([UserRoleID], [RoleId], [UserId]) VALUES (6, 2, 1)
INSERT [dbo].[userRoles] ([UserRoleID], [RoleId], [UserId]) VALUES (8, 1, 2)
INSERT [dbo].[userRoles] ([UserRoleID], [RoleId], [UserId]) VALUES (9, 2, 3)
INSERT [dbo].[userRoles] ([UserRoleID], [RoleId], [UserId]) VALUES (11, 2, 6)
INSERT [dbo].[userRoles] ([UserRoleID], [RoleId], [UserId]) VALUES (12, 1, 7)
INSERT [dbo].[userRoles] ([UserRoleID], [RoleId], [UserId]) VALUES (13, 2, 8)
SET IDENTITY_INSERT [dbo].[userRoles] OFF
GO
ALTER TABLE [dbo].[tblLeadDetail] ADD  CONSTRAINT [DF_LeadDetail_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[tblLeadDetail] ADD  CONSTRAINT [DF_LeadDetail_isDeleted]  DEFAULT ((0)) FOR [isDeleted]
GO
ALTER TABLE [dbo].[tblUser] ADD  CONSTRAINT [DF_User_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[tblUser] ADD  CONSTRAINT [DF_User_IsActive]  DEFAULT ((0)) FOR [isDeleted]
GO
ALTER TABLE [dbo].[userRoles]  WITH CHECK ADD  CONSTRAINT [FK_Roles_userRoles] FOREIGN KEY([RoleId])
REFERENCES [dbo].[tblRole] ([RoleId])
GO
ALTER TABLE [dbo].[userRoles] CHECK CONSTRAINT [FK_Roles_userRoles]
GO
ALTER TABLE [dbo].[userRoles]  WITH CHECK ADD  CONSTRAINT [FK_user_userRoles] FOREIGN KEY([UserId])
REFERENCES [dbo].[tblUser] ([UserId])
GO
ALTER TABLE [dbo].[userRoles] CHECK CONSTRAINT [FK_user_userRoles]
GO
/****** Object:  StoredProcedure [dbo].[ALLUsersWithDataRole]    Script Date: 22-03-2024 15:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

   
CREATE PROCEDURE [dbo].[ALLUsersWithDataRole]
    
as
BEGIN
        SELECT u.*, ur.RoleId -- Add more columns as needed
        FROM tblUser u
        INNER JOIN userRoles ur ON u.UserID = ur.UserID
        WHERE u.isDeleted = 0;
END
GO
/****** Object:  StoredProcedure [dbo].[CheckMail]    Script Date: 22-03-2024 15:36:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CheckMail]
    @Email NVARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS (SELECT 1 FROM tblUser WHERE Email = @Email)
        SELECT 1 AS EmailExists;
    ELSE
        SELECT 0 AS EmailExists;
END
GO
/****** Object:  StoredProcedure [dbo].[getUserData]    Script Date: 22-03-2024 15:36:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[getUserData]
    @Email NVARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT *
    FROM tblUser
    WHERE Email = @Email;
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Create_Customer]    Script Date: 22-03-2024 15:36:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Create_Customer]
    @FirstName NVARCHAR(50),
    @LastName NVARCHAR(50),
    @MiddleName NVARCHAR(50),
    @JobTitle NVARCHAR(100),
    @PersonalEmail NVARCHAR(100),
    @WorkEmail NVARCHAR(100),
    @CompanyContactEmail NVARCHAR(100),
    @Country NVARCHAR(50),
    @State NVARCHAR(50),
    @City NVARCHAR(50),
    @Linkedin NVARCHAR(100),
    @Status NVARCHAR(50),
	@CreatedBy NVARCHAR(50),
	@CreatedId NVARCHAR(50)
AS
BEGIN
    Insert into tblLeadDetail(FirstName,LastName,MiddleName,JobTitle,PersonalEmail,WorkEmail,CompanyContactEmail,Country,State,City,Linkedin,Status,CreatedBy,CreatedId) 
	values (@FirstName,@LastName,@MiddleName,@JobTitle,
	@PersonalEmail,@WorkEmail,@CompanyContactEmail,@Country,@State,@City,@Linkedin,@Status,@CreatedBy,@CreatedId)
      
END;        


GO
/****** Object:  StoredProcedure [dbo].[SP_Create_User]    Script Date: 22-03-2024 15:36:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Create_User]
    @FirstName NVARCHAR(50),
    @LastName NVARCHAR(50),
    @MiddleName NVARCHAR(50),
    @Email NVARCHAR(50),
	@Password NVARCHAR(50),
	@RoleId int
AS
BEGIN
  DECLARE @UserId INT;


    Insert into[dbo].[tblUser] (FirstName,LastName,MiddleName,Email,Password) 
	values (@FirstName,@LastName,@MiddleName,@Email,@Password)

	 -- Retrieve the generated UserId
    SET @UserId = SCOPE_IDENTITY();

    -- Insert record into tblUserRole
    INSERT INTO [dbo].[userRoles] (UserId, RoleId) 
    VALUES (@UserId, @RoleId);
      
END;        
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllCustomerByFilter]    Script Date: 22-03-2024 15:36:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetAllCustomerByFilter]
    @Page INT = 1,
    @PageSize INT = 10
AS
BEGIN
    DECLARE @StartIndex INT, @EndIndex INT;

    SET @StartIndex = (@Page - 1) * @PageSize + 1;
    SET @EndIndex = @Page * @PageSize;

    WITH OrderedCustomers AS (
        SELECT *,
               ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS RowNum
          FROM tblLeadDetail
         WHERE isDeleted = 0
    )
    SELECT *
      FROM OrderedCustomers
     WHERE RowNum BETWEEN @StartIndex AND @EndIndex;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllUserByFilter]    Script Date: 22-03-2024 15:36:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetAllUserByFilter]
    @Page INT = 1,
    @PageSize INT = 10
AS
BEGIN
    DECLARE @StartIndex INT, @EndIndex INT;

    SET @StartIndex = (@Page - 1) * @PageSize + 1;
    SET @EndIndex = @Page * @PageSize;

    WITH OrderedUsers AS (
        SELECT u.*, ur.RoleId,
               ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS RowNum
          FROM tblUser u
          INNER JOIN userRoles ur ON u.UserID = ur.UserID
         WHERE u.isDeleted = 0
    )
    SELECT *
      FROM OrderedUsers
     WHERE RowNum BETWEEN @StartIndex AND @EndIndex;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_GetUsersCustomerByFilterId]    Script Date: 22-03-2024 15:36:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetUsersCustomerByFilterId]
    @Page INT = 1,
    @PageSize INT = 10,
	@CreatedId INT=1
AS
BEGIN
    DECLARE @StartIndex INT, @EndIndex INT;

    SET @StartIndex = (@Page - 1) * @PageSize + 1;
    SET @EndIndex = @Page * @PageSize;

    WITH OrderedCustomers AS (
        SELECT *,
               ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS RowNum
          FROM tblLeadDetail
         WHERE isDeleted = 0 AND CreatedId=@CreatedId
    )
    SELECT *
      FROM OrderedCustomers
     WHERE RowNum BETWEEN @StartIndex AND @EndIndex;
END;
GO
/****** Object:  StoredProcedure [dbo].[SP_Update_Customer]    Script Date: 22-03-2024 15:36:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Create the stored procedure
CREATE PROCEDURE [dbo].[SP_Update_Customer]
    @LeadId INT,
    @FirstName NVARCHAR(50),
    @LastName NVARCHAR(50),
    @MiddleName NVARCHAR(50),
    @JobTitle NVARCHAR(100),
    @PersonalEmail NVARCHAR(100),
    @WorkEmail NVARCHAR(100),
    @CompanyContactEmail NVARCHAR(100),
    @Country NVARCHAR(50),
    @State NVARCHAR(50),
    @City NVARCHAR(50),
    @Linkedin NVARCHAR(100),
    @Status NVARCHAR(50),
	@CreatedBy NVARCHAR(50)
	
AS
BEGIN
    UPDATE tblLeadDetail
    SET
        FirstName = @FirstName,
        LastName = @LastName,
        MiddleName = @MiddleName,
        JobTitle = @JobTitle,
        PersonalEmail = @PersonalEmail,
        WorkEmail = @WorkEmail,
        CompanyContactEmail = @CompanyContactEmail,
        Country = @Country,
        State = @State,
        City = @City,
        Linkedin = @Linkedin,
        CreatedDate = GETDATE(),
        Status = @Status,
		CreatedBy = @CreatedBy
	
    WHERE
        LeadId = @LeadId;
END;
GO
/****** Object:  StoredProcedure [dbo].[SP_Update_User]    Script Date: 22-03-2024 15:36:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Create the stored procedure
CREATE PROCEDURE [dbo].[SP_Update_User]
    @UserId INT,
   @FirstName NVARCHAR(50),
    @LastName NVARCHAR(50),
    @MiddleName NVARCHAR(50),
    @Email NVARCHAR(50),
	@Password NVARCHAR(50),
	@RoleId int
AS
BEGIN
    UPDATE [dbo].[tblUser]
    SET
        FirstName = @FirstName,
        LastName = @LastName,
        MiddleName = @MiddleName,
		Email = @Email,
		Password = @Password
	
    WHERE
        UserId = @UserId;
	UPDATE [dbo].[userRoles]
    SET
        RoleId = @RoleId
    WHERE
        UserId = @UserId;
END;
GO
/****** Object:  StoredProcedure [dbo].[UserDataRole]    Script Date: 22-03-2024 15:36:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

   
CREATE PROCEDURE [dbo].[UserDataRole]
    @Email NVARCHAR(50)
as
BEGIN
    SET NOCOUNT ON;

    DECLARE @UserID INT;

    -- Check if the username and password match
    SELECT @UserID = u.UserID
    FROM tblUser u
    INNER JOIN userRoles ur ON u.UserID = ur.UserID
    WHERE u.Email = @Email AND u.isDeleted = 0;

    IF @UserID IS NOT NULL
    BEGIN
        -- User found, return user details including RoleId
        SELECT u.*, ur.RoleId -- Add more columns as needed
        FROM tblUser u
        INNER JOIN userRoles ur ON u.UserID = ur.UserID
        WHERE u.UserID = @UserID;

    END
END
GO
/****** Object:  StoredProcedure [dbo].[UserLogin]    Script Date: 22-03-2024 15:36:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UserLogin]
    @Email NVARCHAR(50),
    @Password NVARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @UserID INT;

    -- Check if the username and password match
    SELECT @UserID = u.UserID
    FROM tblUser u
    INNER JOIN userRoles ur ON u.UserID = ur.UserID
    WHERE u.Email = @Email AND u.Password = @Password AND u.isDeleted = 0;

    IF @UserID IS NOT NULL
    BEGIN
        -- User found, return user details including RoleId
        SELECT u.*, ur.RoleId -- Add more columns as needed
        FROM tblUser u
        INNER JOIN userRoles ur ON u.UserID = ur.UserID
        WHERE u.UserID = @UserID;

    END
END
GO
USE [master]
GO
ALTER DATABASE [Demo] SET  READ_WRITE 
GO
