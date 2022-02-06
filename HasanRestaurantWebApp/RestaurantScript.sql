USE [RestaurantDB]
GO
/****** Object:  Schema [Master]    
CREATE SCHEMA [Master]
GO
/****** Object:  Schema [Order]    
CREATE SCHEMA [Order]
GO
/****** Object:  Table [Master].[Customers]   
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Master].[Customers](
	[CustomerId] [int] IDENTITY(1,1) NOT NULL,
	[CustomerName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Master].[Items]     ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Master].[Items](
	[ItemId] [int] IDENTITY(1,1) NOT NULL,
	[ItemName] [varchar](50) NOT NULL,
	[ItemPrice] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_Items] PRIMARY KEY CLUSTERED 
(
	[ItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Master].[PaymentTypes]     ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Master].[PaymentTypes](
	[PaymentTypeId] [int] IDENTITY(1,1) NOT NULL,
	[PaymentTypeName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_PaymentTypes] PRIMARY KEY CLUSTERED 
(
	[PaymentTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Master].[Types]     ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Master].[Types](
	[TypeId] [int] IDENTITY(1,1) NOT NULL,
	[Type] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Types] PRIMARY KEY CLUSTERED 
(
	[TypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Order].[OrderDetails]     ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Order].[OrderDetails](
	[OrderDetailId] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[ItemId] [int] NOT NULL,
	[UnitPrice] [decimal](18, 2) NOT NULL,
	[Quantity] [decimal](18, 2) NOT NULL,
	[Discount] [decimal](18, 2) NOT NULL,
	[Total] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[OrderDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Order].[Orders]     ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Order].[Orders](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[PaymentTypeId] [int] NOT NULL,
	[CustomerId] [int] NOT NULL,
	[OrderNumber] [varchar](20) NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[FinalTotal] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Order].[Transactions]     ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Order].[Transactions](
	[TransactionId] [int] IDENTITY(1,1) NOT NULL,
	[ItemId] [int] NOT NULL,
	[Quantity] [decimal](18, 2) NOT NULL,
	[TranactionDate] [date] NOT NULL,
	[TypeId] [int] NOT NULL,
 CONSTRAINT [PK_Transactions] PRIMARY KEY CLUSTERED 
(
	[TransactionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [Master].[Customers] ON 

INSERT [Master].[Customers] ([CustomerId], [CustomerName]) VALUES (1, N'Customer A')
INSERT [Master].[Customers] ([CustomerId], [CustomerName]) VALUES (2, N'Customer B')
INSERT [Master].[Customers] ([CustomerId], [CustomerName]) VALUES (3, N'Customer C')
SET IDENTITY_INSERT [Master].[Customers] OFF
GO
SET IDENTITY_INSERT [Master].[Items] ON 

INSERT [Master].[Items] ([ItemId], [ItemName], [ItemPrice]) VALUES (1, N'Apple', CAST(50.00 AS Decimal(18, 2)))
INSERT [Master].[Items] ([ItemId], [ItemName], [ItemPrice]) VALUES (2, N'Orange', CAST(70.00 AS Decimal(18, 2)))
INSERT [Master].[Items] ([ItemId], [ItemName], [ItemPrice]) VALUES (3, N'Pizza', CAST(450.00 AS Decimal(18, 2)))
INSERT [Master].[Items] ([ItemId], [ItemName], [ItemPrice]) VALUES (4, N'Burger', CAST(150.00 AS Decimal(18, 2)))
INSERT [Master].[Items] ([ItemId], [ItemName], [ItemPrice]) VALUES (5, N'Noodles', CAST(80.00 AS Decimal(18, 2)))
INSERT [Master].[Items] ([ItemId], [ItemName], [ItemPrice]) VALUES (6, N'Rice', CAST(50.00 AS Decimal(18, 2)))
INSERT [Master].[Items] ([ItemId], [ItemName], [ItemPrice]) VALUES (7, N'French Fries', CAST(60.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [Master].[Items] OFF
GO
SET IDENTITY_INSERT [Master].[PaymentTypes] ON 

INSERT [Master].[PaymentTypes] ([PaymentTypeId], [PaymentTypeName]) VALUES (1, N'Cash')
INSERT [Master].[PaymentTypes] ([PaymentTypeId], [PaymentTypeName]) VALUES (2, N'Credit')
SET IDENTITY_INSERT [Master].[PaymentTypes] OFF
GO
SET IDENTITY_INSERT [Master].[Types] ON 

INSERT [Master].[Types] ([TypeId], [Type]) VALUES (1, N'IN')
INSERT [Master].[Types] ([TypeId], [Type]) VALUES (2, N'OUT')
SET IDENTITY_INSERT [Master].[Types] OFF
GO
ALTER TABLE [Order].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Orders] FOREIGN KEY([OrderId])
REFERENCES [Order].[Orders] ([OrderId])
GO
ALTER TABLE [Order].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Orders]
GO
USE [RestaurantDB]
GO
/****** Object:  Schema [Master]     ******/
CREATE SCHEMA [Master]
GO
/****** Object:  Schema [Order]     ******/
CREATE SCHEMA [Order]
GO
/****** Object:  Table [Master].[Customers]    ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Master].[Customers](
	[CustomerId] [int] IDENTITY(1,1) NOT NULL,
	[CustomerName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Master].[Items]     ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Master].[Items](
	[ItemId] [int] IDENTITY(1,1) NOT NULL,
	[ItemName] [varchar](50) NOT NULL,
	[ItemPrice] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_Items] PRIMARY KEY CLUSTERED 
(
	[ItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Master].[PaymentTypes]     ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Master].[PaymentTypes](
	[PaymentTypeId] [int] IDENTITY(1,1) NOT NULL,
	[PaymentTypeName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_PaymentTypes] PRIMARY KEY CLUSTERED 
(
	[PaymentTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Master].[Types]     ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Master].[Types](
	[TypeId] [int] IDENTITY(1,1) NOT NULL,
	[Type] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Types] PRIMARY KEY CLUSTERED 
(
	[TypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Order].[OrderDetails]    ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Order].[OrderDetails](
	[OrderDetailId] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[ItemId] [int] NOT NULL,
	[UnitPrice] [decimal](18, 2) NOT NULL,
	[Quantity] [decimal](18, 2) NOT NULL,
	[Discount] [decimal](18, 2) NOT NULL,
	[Total] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[OrderDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Order].[Orders]     ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Order].[Orders](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[PaymentTypeId] [int] NOT NULL,
	[CustomerId] [int] NOT NULL,
	[OrderNumber] [varchar](20) NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[FinalTotal] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Order].[Transactions]    ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Order].[Transactions](
	[TransactionId] [int] IDENTITY(1,1) NOT NULL,
	[ItemId] [int] NOT NULL,
	[Quantity] [decimal](18, 2) NOT NULL,
	[TranactionDate] [date] NOT NULL,
	[TypeId] [int] NOT NULL,
 CONSTRAINT [PK_Transactions] PRIMARY KEY CLUSTERED 
(
	[TransactionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [Master].[Customers] ON 

INSERT [Master].[Customers] ([CustomerId], [CustomerName]) VALUES (1, N'Customer A')
INSERT [Master].[Customers] ([CustomerId], [CustomerName]) VALUES (2, N'Customer B')
INSERT [Master].[Customers] ([CustomerId], [CustomerName]) VALUES (3, N'Customer C')
SET IDENTITY_INSERT [Master].[Customers] OFF
GO
SET IDENTITY_INSERT [Master].[Items] ON 

INSERT [Master].[Items] ([ItemId], [ItemName], [ItemPrice]) VALUES (1, N'Apple', CAST(50.00 AS Decimal(18, 2)))
INSERT [Master].[Items] ([ItemId], [ItemName], [ItemPrice]) VALUES (2, N'Orange', CAST(70.00 AS Decimal(18, 2)))
INSERT [Master].[Items] ([ItemId], [ItemName], [ItemPrice]) VALUES (3, N'Pizza', CAST(450.00 AS Decimal(18, 2)))
INSERT [Master].[Items] ([ItemId], [ItemName], [ItemPrice]) VALUES (4, N'Burger', CAST(150.00 AS Decimal(18, 2)))
INSERT [Master].[Items] ([ItemId], [ItemName], [ItemPrice]) VALUES (5, N'Noodles', CAST(80.00 AS Decimal(18, 2)))
INSERT [Master].[Items] ([ItemId], [ItemName], [ItemPrice]) VALUES (6, N'Rice', CAST(50.00 AS Decimal(18, 2)))
INSERT [Master].[Items] ([ItemId], [ItemName], [ItemPrice]) VALUES (7, N'French Fries', CAST(60.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [Master].[Items] OFF
GO
SET IDENTITY_INSERT [Master].[PaymentTypes] ON 

INSERT [Master].[PaymentTypes] ([PaymentTypeId], [PaymentTypeName]) VALUES (1, N'Cash')
INSERT [Master].[PaymentTypes] ([PaymentTypeId], [PaymentTypeName]) VALUES (2, N'Credit')
SET IDENTITY_INSERT [Master].[PaymentTypes] OFF
GO
SET IDENTITY_INSERT [Master].[Types] ON 

INSERT [Master].[Types] ([TypeId], [Type]) VALUES (1, N'IN')
INSERT [Master].[Types] ([TypeId], [Type]) VALUES (2, N'OUT')
SET IDENTITY_INSERT [Master].[Types] OFF
GO
ALTER TABLE [Order].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Orders] FOREIGN KEY([OrderId])
REFERENCES [Order].[Orders] ([OrderId])
GO
ALTER TABLE [Order].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Orders]
GO
