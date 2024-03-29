CREATE DATABASE [Project]
GO
USE [Project]
GO
/****** Object:  Table [dbo].[FoodList]    Script Date: 10/17/2019 12:49:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FoodList](
	[ListID] [varchar](10) NOT NULL,
	[FoodID] [varchar](10) NULL,
	[MenuID] [varchar](10) NULL,
	[ComboID] [varchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tableCombo]    Script Date: 10/17/2019 12:49:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tableCombo](
	[ComboID] [varchar](10) NOT NULL,
	[ComboName] [nvarchar](max) NULL,
	[ComboContent] [nvarchar](max) NULL,
	[ComboPrice] [float] NULL,
 CONSTRAINT [PK_tableCombo] PRIMARY KEY CLUSTERED 
(
	[ComboID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tableFood]    Script Date: 10/17/2019 12:49:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tableFood](
	[FoodID] [varchar](10) NOT NULL,
	[FoodName] [nvarchar](max) NOT NULL,
	[Price] [float] NULL,
	[ImageLink] [nvarchar](max) NULL,
	[isMainDisk] [bit] NULL,
	[isMainDisk2] [bit] NULL,
	[isSideDisk] [bit] NULL,
	[isAvailable] [bit] NULL,
 CONSTRAINT [PK_tableFood] PRIMARY KEY CLUSTERED 
(
	[FoodID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tableMenu]    Script Date: 10/17/2019 12:49:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tableMenu](
	[ID] [varchar](10) NOT NULL,
	[Name] [varchar](500) NULL,
	[Date] [date] NULL,
	[DayInWeek] [int] NULL,
 CONSTRAINT [PK_tableMenu] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tableOrder]    Script Date: 10/17/2019 12:49:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tableOrder](
	[OrderID] [varchar](10) NOT NULL,
	[CustomerID] [varchar](10) NOT NULL,
	[DateOrdered] [date] NULL,
	[Status] [bit] NULL,
	[Price] [float] NULL,
 CONSTRAINT [PK_tableOrder] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tableUser]    Script Date: 10/17/2019 12:49:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tableUser](
	[UserID] [varchar](10) NOT NULL,
	[UserFullName] [nvarchar](500) NULL,
	[Username] [nvarchar](500) NULL,
	[UserPassword] [nvarchar](500) NULL,
	[UserEmail] [nvarchar](500) NULL,
	[Role] [varchar](50) NULL,
	[DateOrdered] [date] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_tableUser] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[talbleOrderDetail]    Script Date: 10/17/2019 12:49:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[talbleOrderDetail](
	[OrderDetailID] [varchar](10) NOT NULL,
	[OrderID] [varchar](10) NULL,
	[ComboID] [varchar](10) NULL,
	[FoodID] [varchar](10) NULL,
 CONSTRAINT [PK_talbleOrderDetail] PRIMARY KEY CLUSTERED 
(
	[OrderDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[FoodList] ([ListID], [FoodID], [MenuID], [ComboID]) VALUES (N'L01', N'F01', N'M01', N'C1')
INSERT [dbo].[FoodList] ([ListID], [FoodID], [MenuID], [ComboID]) VALUES (N'L02', N'F02', N'M01', N'C1')
INSERT [dbo].[FoodList] ([ListID], [FoodID], [MenuID], [ComboID]) VALUES (N'L03', N'F03', N'M01', N'C1')
INSERT [dbo].[FoodList] ([ListID], [FoodID], [MenuID], [ComboID]) VALUES (N'L04', N'F04', N'M02', NULL)
INSERT [dbo].[FoodList] ([ListID], [FoodID], [MenuID], [ComboID]) VALUES (N'L05', N'F05', N'M02', NULL)
INSERT [dbo].[FoodList] ([ListID], [FoodID], [MenuID], [ComboID]) VALUES (N'L06', N'F01', N'M02', NULL)
INSERT [dbo].[FoodList] ([ListID], [FoodID], [MenuID], [ComboID]) VALUES (N'L7', N'F12', N'M03', NULL)
INSERT [dbo].[FoodList] ([ListID], [FoodID], [MenuID], [ComboID]) VALUES (N'L07', NULL, N'M02', NULL)
INSERT [dbo].[FoodList] ([ListID], [FoodID], [MenuID], [ComboID]) VALUES (N'L9', N'F13', N'M03', NULL)
INSERT [dbo].[FoodList] ([ListID], [FoodID], [MenuID], [ComboID]) VALUES (N'L10', N'F02', N'M01', N'C13')
INSERT [dbo].[FoodList] ([ListID], [FoodID], [MenuID], [ComboID]) VALUES (N'L13', N'F05', N'M02', N'C15')
INSERT [dbo].[FoodList] ([ListID], [FoodID], [MenuID], [ComboID]) VALUES (N'L14', N'F04', N'M02', N'C15')
INSERT [dbo].[FoodList] ([ListID], [FoodID], [MenuID], [ComboID]) VALUES (N'L17', N'F7', NULL, NULL)
INSERT [dbo].[FoodList] ([ListID], [FoodID], [MenuID], [ComboID]) VALUES (N'L18', N'F9', NULL, NULL)
INSERT [dbo].[FoodList] ([ListID], [FoodID], [MenuID], [ComboID]) VALUES (N'L25', N'F16', N'M04', NULL)
INSERT [dbo].[FoodList] ([ListID], [FoodID], [MenuID], [ComboID]) VALUES (N'L26', N'F14', N'M04', NULL)
INSERT [dbo].[FoodList] ([ListID], [FoodID], [MenuID], [ComboID]) VALUES (N'L28', N'F14', N'M04', NULL)
INSERT [dbo].[FoodList] ([ListID], [FoodID], [MenuID], [ComboID]) VALUES (N'L30', N'F17', N'M05', NULL)
INSERT [dbo].[FoodList] ([ListID], [FoodID], [MenuID], [ComboID]) VALUES (N'L37', N'F15', N'M04', NULL)
INSERT [dbo].[FoodList] ([ListID], [FoodID], [MenuID], [ComboID]) VALUES (N'L34', N'F16', N'M04', N'C17')
INSERT [dbo].[FoodList] ([ListID], [FoodID], [MenuID], [ComboID]) VALUES (N'L35', N'F14', N'M04', N'C18')
INSERT [dbo].[FoodList] ([ListID], [FoodID], [MenuID], [ComboID]) VALUES (N'L37', N'F16', N'M04', N'C18')
INSERT [dbo].[FoodList] ([ListID], [FoodID], [MenuID], [ComboID]) VALUES (N'L38', N'F18', N'M05', N'C19')
INSERT [dbo].[FoodList] ([ListID], [FoodID], [MenuID], [ComboID]) VALUES (N'L39', N'F19', N'M05', N'C19')
INSERT [dbo].[FoodList] ([ListID], [FoodID], [MenuID], [ComboID]) VALUES (N'L11', N'F05', N'M02', N'C14')
INSERT [dbo].[FoodList] ([ListID], [FoodID], [MenuID], [ComboID]) VALUES (N'L12', N'F01', N'M02', N'C14')
INSERT [dbo].[FoodList] ([ListID], [FoodID], [MenuID], [ComboID]) VALUES (N'L25', N'F14', N'M04', NULL)
INSERT [dbo].[FoodList] ([ListID], [FoodID], [MenuID], [ComboID]) VALUES (N'L27', N'F14', N'M04', NULL)
INSERT [dbo].[FoodList] ([ListID], [FoodID], [MenuID], [ComboID]) VALUES (N'L29', N'F14', N'M04', NULL)
INSERT [dbo].[FoodList] ([ListID], [FoodID], [MenuID], [ComboID]) VALUES (N'L31', N'F18', N'M05', NULL)
INSERT [dbo].[FoodList] ([ListID], [FoodID], [MenuID], [ComboID]) VALUES (N'L32', N'F19', N'M05', NULL)
INSERT [dbo].[FoodList] ([ListID], [FoodID], [MenuID], [ComboID]) VALUES (N'L15', N'F12', N'M03', N'C16')
INSERT [dbo].[FoodList] ([ListID], [FoodID], [MenuID], [ComboID]) VALUES (N'L16', N'F13', N'M03', N'C16')
INSERT [dbo].[FoodList] ([ListID], [FoodID], [MenuID], [ComboID]) VALUES (N'L19', N'F10', N'M03', NULL)
INSERT [dbo].[FoodList] ([ListID], [FoodID], [MenuID], [ComboID]) VALUES (N'L20', N'F9', N'M03', NULL)
INSERT [dbo].[FoodList] ([ListID], [FoodID], [MenuID], [ComboID]) VALUES (N'L21', N'F10', N'M03', NULL)
INSERT [dbo].[FoodList] ([ListID], [FoodID], [MenuID], [ComboID]) VALUES (N'L22', N'F9', N'M03', NULL)
INSERT [dbo].[tableCombo] ([ComboID], [ComboName], [ComboContent], [ComboPrice]) VALUES (N'C1', N'Mon', NULL, 114)
INSERT [dbo].[tableCombo] ([ComboID], [ComboName], [ComboContent], [ComboPrice]) VALUES (N'C10', N'Fri', NULL, NULL)
INSERT [dbo].[tableCombo] ([ComboID], [ComboName], [ComboContent], [ComboPrice]) VALUES (N'C11', N'C2', NULL, NULL)
INSERT [dbo].[tableCombo] ([ComboID], [ComboName], [ComboContent], [ComboPrice]) VALUES (N'C12', N'C2', NULL, NULL)
INSERT [dbo].[tableCombo] ([ComboID], [ComboName], [ComboContent], [ComboPrice]) VALUES (N'C13', N'TEst', NULL, 30)
INSERT [dbo].[tableCombo] ([ComboID], [ComboName], [ComboContent], [ComboPrice]) VALUES (N'C14', N'Thurs', NULL, 54)
INSERT [dbo].[tableCombo] ([ComboID], [ComboName], [ComboContent], [ComboPrice]) VALUES (N'C15', N'RTs', NULL, 3344)
INSERT [dbo].[tableCombo] ([ComboID], [ComboName], [ComboContent], [ComboPrice]) VALUES (N'C16', N'Namr', NULL, 21)
INSERT [dbo].[tableCombo] ([ComboID], [ComboName], [ComboContent], [ComboPrice]) VALUES (N'C17', N'Thursday Combo', NULL, 42)
INSERT [dbo].[tableCombo] ([ComboID], [ComboName], [ComboContent], [ComboPrice]) VALUES (N'C18', N'Thursday Combo 2', NULL, 67)
INSERT [dbo].[tableCombo] ([ComboID], [ComboName], [ComboContent], [ComboPrice]) VALUES (N'C19', N'Friday Combo', NULL, 54)
INSERT [dbo].[tableCombo] ([ComboID], [ComboName], [ComboContent], [ComboPrice]) VALUES (N'C2', N'Mon', NULL, NULL)
INSERT [dbo].[tableCombo] ([ComboID], [ComboName], [ComboContent], [ComboPrice]) VALUES (N'C3', N'Tues', NULL, NULL)
INSERT [dbo].[tableCombo] ([ComboID], [ComboName], [ComboContent], [ComboPrice]) VALUES (N'C4', N'Tues', NULL, NULL)
INSERT [dbo].[tableCombo] ([ComboID], [ComboName], [ComboContent], [ComboPrice]) VALUES (N'C5', N'Tues', NULL, NULL)
INSERT [dbo].[tableCombo] ([ComboID], [ComboName], [ComboContent], [ComboPrice]) VALUES (N'C6', N'Wed', NULL, NULL)
INSERT [dbo].[tableCombo] ([ComboID], [ComboName], [ComboContent], [ComboPrice]) VALUES (N'C7', N'Thurs', NULL, NULL)
INSERT [dbo].[tableCombo] ([ComboID], [ComboName], [ComboContent], [ComboPrice]) VALUES (N'C8', N'Thurs', NULL, NULL)
INSERT [dbo].[tableCombo] ([ComboID], [ComboName], [ComboContent], [ComboPrice]) VALUES (N'C9', N'Fri', NULL, NULL)
INSERT [dbo].[tableFood] ([FoodID], [FoodName], [Price], [ImageLink], [isMainDisk], [isMainDisk2], [isSideDisk], [isAvailable]) VALUES (N'F00', N'Main1', 12, N'img/Food/ChickenResize.jpg', 1, 0, 0, 1)
INSERT [dbo].[tableFood] ([FoodID], [FoodName], [Price], [ImageLink], [isMainDisk], [isMainDisk2], [isSideDisk], [isAvailable]) VALUES (N'F01', N'Mon1', 43, N'img/Food/Tofu.jpg', 1, 1, 0, 1)
INSERT [dbo].[tableFood] ([FoodID], [FoodName], [Price], [ImageLink], [isMainDisk], [isMainDisk2], [isSideDisk], [isAvailable]) VALUES (N'F02', N'Side1', 31, N'img/Food/brrcs.jpg', 0, 0, 1, 1)
INSERT [dbo].[tableFood] ([FoodID], [FoodName], [Price], [ImageLink], [isMainDisk], [isMainDisk2], [isSideDisk], [isAvailable]) VALUES (N'F03', N'Mon2', 41, N'img/Food/bhs.jpg', 0, 1, 0, 1)
INSERT [dbo].[tableFood] ([FoodID], [FoodName], [Price], [ImageLink], [isMainDisk], [isMainDisk2], [isSideDisk], [isAvailable]) VALUES (N'F04', N'Main3dawd', 3333, N'img/Food/ChickenResize.jpg', 1, 1, 0, 1)
INSERT [dbo].[tableFood] ([FoodID], [FoodName], [Price], [ImageLink], [isMainDisk], [isMainDisk2], [isSideDisk], [isAvailable]) VALUES (N'F05', N'Side3', 12, N'img/Food/Tofu.jpg', 0, 0, 1, 1)
INSERT [dbo].[tableFood] ([FoodID], [FoodName], [Price], [ImageLink], [isMainDisk], [isMainDisk2], [isSideDisk], [isAvailable]) VALUES (N'F10', N'New food', 1111, N'img/Food/brrcs.jpg', 0, 0, 1, 1)
INSERT [dbo].[tableFood] ([FoodID], [FoodName], [Price], [ImageLink], [isMainDisk], [isMainDisk2], [isSideDisk], [isAvailable]) VALUES (N'F11', N'Latest', 1123, N'img/Food/bhs.jpg', 1, 1, 0, 1)
INSERT [dbo].[tableFood] ([FoodID], [FoodName], [Price], [ImageLink], [isMainDisk], [isMainDisk2], [isSideDisk], [isAvailable]) VALUES (N'F12', N'Test1', 11, N'img/Food/ChickenResize.jpg', 0, 0, 1, 1)
INSERT [dbo].[tableFood] ([FoodID], [FoodName], [Price], [ImageLink], [isMainDisk], [isMainDisk2], [isSideDisk], [isAvailable]) VALUES (N'F13', N'Wed1', 11, N'img/Food/Tofu.jpg', 1, 1, 0, 1)
INSERT [dbo].[tableFood] ([FoodID], [FoodName], [Price], [ImageLink], [isMainDisk], [isMainDisk2], [isSideDisk], [isAvailable]) VALUES (N'F14', N'Thurs1Update', 25, N'img/Food/brrcs.jpg', 1, 1, 0, 1)
INSERT [dbo].[tableFood] ([FoodID], [FoodName], [Price], [ImageLink], [isMainDisk], [isMainDisk2], [isSideDisk], [isAvailable]) VALUES (N'F15', N'Thurs2', 312, N'img/Food/brrcs.jpg', 0, 1, 0, 1)
INSERT [dbo].[tableFood] ([FoodID], [FoodName], [Price], [ImageLink], [isMainDisk], [isMainDisk2], [isSideDisk], [isAvailable]) VALUES (N'F16', N'Side1', 43, N'img/Food/ChickenResize.jpg', 0, 0, 1, 1)
INSERT [dbo].[tableFood] ([FoodID], [FoodName], [Price], [ImageLink], [isMainDisk], [isMainDisk2], [isSideDisk], [isAvailable]) VALUES (N'F17', N'Fri', 54, N'img/Food/Tofu.jpg', 1, 0, 0, 1)
INSERT [dbo].[tableFood] ([FoodID], [FoodName], [Price], [ImageLink], [isMainDisk], [isMainDisk2], [isSideDisk], [isAvailable]) VALUES (N'F18', N'Fri2', 23, N'img/Food/brrcs.jpg', 0, 1, 0, 1)
INSERT [dbo].[tableFood] ([FoodID], [FoodName], [Price], [ImageLink], [isMainDisk], [isMainDisk2], [isSideDisk], [isAvailable]) VALUES (N'F19', N'Fri3', 32, N'img/Food/bhs.jpg', 1, 0, 0, 1)
INSERT [dbo].[tableFood] ([FoodID], [FoodName], [Price], [ImageLink], [isMainDisk], [isMainDisk2], [isSideDisk], [isAvailable]) VALUES (N'F20', N'Test', 12, N'fwa', 0, 0, 1, 0)
INSERT [dbo].[tableFood] ([FoodID], [FoodName], [Price], [ImageLink], [isMainDisk], [isMainDisk2], [isSideDisk], [isAvailable]) VALUES (N'F7', N'New food', 1111, N'img/Food/Tofu.jpg', 0, 0, 1, 1)
INSERT [dbo].[tableFood] ([FoodID], [FoodName], [Price], [ImageLink], [isMainDisk], [isMainDisk2], [isSideDisk], [isAvailable]) VALUES (N'F8', N'New food', 1111, N'img/Food/brrcs.jpg', 0, 0, 1, 1)
INSERT [dbo].[tableFood] ([FoodID], [FoodName], [Price], [ImageLink], [isMainDisk], [isMainDisk2], [isSideDisk], [isAvailable]) VALUES (N'F9', N'new food 2', 12, N'img/Food/bhs.jpg', 1, 1, 0, 1)
INSERT [dbo].[tableMenu] ([ID], [Name], [Date], [DayInWeek]) VALUES (N'M01', N'MondayMenu', CAST(N'2019-10-05' AS Date), 2)
INSERT [dbo].[tableMenu] ([ID], [Name], [Date], [DayInWeek]) VALUES (N'M02', N'TuesdayMenu', CAST(N'2019-10-05' AS Date), 3)
INSERT [dbo].[tableMenu] ([ID], [Name], [Date], [DayInWeek]) VALUES (N'M03', N'WednesdayMenu', CAST(N'2019-11-05' AS Date), 4)
INSERT [dbo].[tableMenu] ([ID], [Name], [Date], [DayInWeek]) VALUES (N'M04', N'Thursday Menu', CAST(N'2019-10-10' AS Date), 5)
INSERT [dbo].[tableMenu] ([ID], [Name], [Date], [DayInWeek]) VALUES (N'M05', N'FridayMenu', CAST(N'2019-10-15' AS Date), 6)
INSERT [dbo].[tableOrder] ([OrderID], [CustomerID], [DateOrdered], [Status], [Price]) VALUES (N'O1', N'U01', CAST(N'2019-10-15' AS Date), 1, NULL)
INSERT [dbo].[tableOrder] ([OrderID], [CustomerID], [DateOrdered], [Status], [Price]) VALUES (N'O2', N'U01', CAST(N'2019-10-16' AS Date), 1, NULL)
INSERT [dbo].[tableOrder] ([OrderID], [CustomerID], [DateOrdered], [Status], [Price]) VALUES (N'O3', N'U03', CAST(N'2019-10-17' AS Date), 1, NULL)
INSERT [dbo].[tableOrder] ([OrderID], [CustomerID], [DateOrdered], [Status], [Price]) VALUES (N'O4', N'U4', CAST(N'2019-10-17' AS Date), 1, NULL)
INSERT [dbo].[tableOrder] ([OrderID], [CustomerID], [DateOrdered], [Status], [Price]) VALUES (N'O5', N'U01', CAST(N'2019-10-17' AS Date), 1, NULL)
INSERT [dbo].[tableUser] ([UserID], [UserFullName], [Username], [UserPassword], [UserEmail], [Role], [DateOrdered], [Status]) VALUES (N'U01', N'Test', N'Test', N'Test', N'Test', N'user', NULL, 1)
INSERT [dbo].[tableUser] ([UserID], [UserFullName], [Username], [UserPassword], [UserEmail], [Role], [DateOrdered], [Status]) VALUES (N'U02', N'Test1', N'Test1', N'Test1', N'Test1', N'admin', NULL, 1)
INSERT [dbo].[tableUser] ([UserID], [UserFullName], [Username], [UserPassword], [UserEmail], [Role], [DateOrdered], [Status]) VALUES (N'U03', N'Test2', N'Test2', N'Test2', N'Test1', N'user', NULL, 1)
INSERT [dbo].[tableUser] ([UserID], [UserFullName], [Username], [UserPassword], [UserEmail], [Role], [DateOrdered], [Status]) VALUES (N'U4', N'Test3', N'Test3', N'Test3', N'Test3', N'user', NULL, 1)
INSERT [dbo].[tableUser] ([UserID], [UserFullName], [Username], [UserPassword], [UserEmail], [Role], [DateOrdered], [Status]) VALUES (N'U5', N'daw', N'Test34', N'Test', N'daw', N'user', NULL, 1)
INSERT [dbo].[talbleOrderDetail] ([OrderDetailID], [OrderID], [ComboID], [FoodID]) VALUES (N'OD1', N'O1', N' C15', NULL)
INSERT [dbo].[talbleOrderDetail] ([OrderDetailID], [OrderID], [ComboID], [FoodID]) VALUES (N'OD10', N'O4', NULL, N'F14')
INSERT [dbo].[talbleOrderDetail] ([OrderDetailID], [OrderID], [ComboID], [FoodID]) VALUES (N'OD11', N'O4', NULL, N'F16')
INSERT [dbo].[talbleOrderDetail] ([OrderDetailID], [OrderID], [ComboID], [FoodID]) VALUES (N'OD12', N'O5', N' C18', NULL)
INSERT [dbo].[talbleOrderDetail] ([OrderDetailID], [OrderID], [ComboID], [FoodID]) VALUES (N'OD13', N'O5', NULL, N'F14')
INSERT [dbo].[talbleOrderDetail] ([OrderDetailID], [OrderID], [ComboID], [FoodID]) VALUES (N'OD14', N'O5', NULL, N'F16')
INSERT [dbo].[talbleOrderDetail] ([OrderDetailID], [OrderID], [ComboID], [FoodID]) VALUES (N'OD2', N'O1', NULL, N'F01')
INSERT [dbo].[talbleOrderDetail] ([OrderDetailID], [OrderID], [ComboID], [FoodID]) VALUES (N'OD3', N'O1', NULL, N'F05')
INSERT [dbo].[talbleOrderDetail] ([OrderDetailID], [OrderID], [ComboID], [FoodID]) VALUES (N'OD4', N'O2', N' C16', NULL)
INSERT [dbo].[talbleOrderDetail] ([OrderDetailID], [OrderID], [ComboID], [FoodID]) VALUES (N'OD5', N'O3', N' C18', NULL)
INSERT [dbo].[talbleOrderDetail] ([OrderDetailID], [OrderID], [ComboID], [FoodID]) VALUES (N'OD6', N'O3', NULL, N'F14')
INSERT [dbo].[talbleOrderDetail] ([OrderDetailID], [OrderID], [ComboID], [FoodID]) VALUES (N'OD7', N'O3', NULL, N'F16')
INSERT [dbo].[talbleOrderDetail] ([OrderDetailID], [OrderID], [ComboID], [FoodID]) VALUES (N'OD8', N'O4', N' C17', NULL)
INSERT [dbo].[talbleOrderDetail] ([OrderDetailID], [OrderID], [ComboID], [FoodID]) VALUES (N'OD9', N'O4', N' C18', NULL)
ALTER TABLE [dbo].[FoodList]  WITH CHECK ADD  CONSTRAINT [FK_FoodList_tableCombo] FOREIGN KEY([ComboID])
REFERENCES [dbo].[tableCombo] ([ComboID])
GO
ALTER TABLE [dbo].[FoodList] CHECK CONSTRAINT [FK_FoodList_tableCombo]
GO
ALTER TABLE [dbo].[FoodList]  WITH CHECK ADD  CONSTRAINT [FK_FoodList_tableFood] FOREIGN KEY([FoodID])
REFERENCES [dbo].[tableFood] ([FoodID])
GO
ALTER TABLE [dbo].[FoodList] CHECK CONSTRAINT [FK_FoodList_tableFood]
GO
ALTER TABLE [dbo].[FoodList]  WITH CHECK ADD  CONSTRAINT [FK_FoodList_tableMenu] FOREIGN KEY([MenuID])
REFERENCES [dbo].[tableMenu] ([ID])
GO
ALTER TABLE [dbo].[FoodList] CHECK CONSTRAINT [FK_FoodList_tableMenu]
GO
ALTER TABLE [dbo].[tableOrder]  WITH CHECK ADD  CONSTRAINT [FK_tableOrder_tableUser] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[tableUser] ([UserID])
GO
ALTER TABLE [dbo].[tableOrder] CHECK CONSTRAINT [FK_tableOrder_tableUser]
GO
ALTER TABLE [dbo].[talbleOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_talbleOrderDetail_tableOrder] FOREIGN KEY([OrderID])
REFERENCES [dbo].[tableOrder] ([OrderID])
GO
ALTER TABLE [dbo].[talbleOrderDetail] CHECK CONSTRAINT [FK_talbleOrderDetail_tableOrder]
GO
