USE [Starbucks_DW]
GO
/****** Object:  Table [dbo].[DimCustomer]    Script Date: 5/4/2026 1:14:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimCustomer](
	[CustomerSK] [int] IDENTITY(1,1) NOT NULL,
	[AlternateCustomerID] [varchar](20) NOT NULL,
	[CustomerAgeGroup] [varchar](50) NULL,
	[CustomerGender] [varchar](50) NULL,
	[isRewardsMember] [bit] NULL,
	[StartDate] [date] NULL,
	[EndDate] [date] NULL,
	[CurrentFlag] [bit] NULL,
	[InsertDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimDate]    Script Date: 5/4/2026 1:14:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimDate](
	[DateSK] [int] NOT NULL,
	[Date] [date] NOT NULL,
	[Day] [int] NOT NULL,
	[Month] [int] NOT NULL,
	[Year] [int] NOT NULL,
	[Quarter] [int] NOT NULL,
	[DayOfWeek] [varchar](10) NOT NULL,
	[IsWeekend] [bit] NOT NULL,
	[FiscalYear] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[DateSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimDrink]    Script Date: 5/4/2026 1:14:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimDrink](
	[DrinkSK] [int] IDENTITY(1,1) NOT NULL,
	[DrinkCategory] [varchar](50) NOT NULL,
	[InsertDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[DrinkSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimOrder]    Script Date: 5/4/2026 1:14:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimOrder](
	[OrderSK] [int] IDENTITY(1,1) NOT NULL,
	[OrderChannelName] [varchar](50) NOT NULL,
	[InsertDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimStore]    Script Date: 5/4/2026 1:14:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimStore](
	[StoreSK] [int] IDENTITY(1,1) NOT NULL,
	[AlternateStoreID] [varchar](20) NOT NULL,
	[StoreLocationType] [varchar](50) NULL,
	[Region] [varchar](50) NULL,
	[InsertDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[StoreSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FactSales]    Script Date: 5/4/2026 1:14:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FactSales](
	[SalesSK] [bigint] IDENTITY(1,1) NOT NULL,
	[OrderID] [varchar](20) NOT NULL,
	[DateSK] [int] NULL,
	[CustomerSK] [int] NULL,
	[StoreSK] [int] NULL,
	[OrderSK] [int] NULL,
	[DrinkSK] [int] NULL,
	[TotalSpend] [decimal](10, 2) NULL,
	[ItemCount] [int] NULL,
	[CustomizationCount] [int] NULL,
	[FulfillmentTimeMin] [decimal](5, 2) NULL,
	[CustomerSatisfaction] [int] NULL,
	[HasFoodItem] [bit] NULL,
	[OrderAhead] [bit] NULL,
	[AccmTxnCreateTime] [datetime] NULL,
	[AccmTxnCompleteTime] [datetime] NULL,
	[TxnProcessTimeHours]  AS (case when [AccmTxnCompleteTime] IS NOT NULL then datediff(hour,[AccmTxnCreateTime],[AccmTxnCompleteTime])  end) PERSISTED,
	[InsertDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[SalesSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DimCustomer] ADD  DEFAULT (getdate()) FOR [StartDate]
GO
ALTER TABLE [dbo].[DimCustomer] ADD  DEFAULT ('9999-12-31') FOR [EndDate]
GO
ALTER TABLE [dbo].[DimCustomer] ADD  DEFAULT ((1)) FOR [CurrentFlag]
GO
ALTER TABLE [dbo].[DimCustomer] ADD  DEFAULT (getdate()) FOR [InsertDate]
GO
ALTER TABLE [dbo].[DimCustomer] ADD  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[DimDrink] ADD  DEFAULT (getdate()) FOR [InsertDate]
GO
ALTER TABLE [dbo].[DimOrder] ADD  DEFAULT (getdate()) FOR [InsertDate]
GO
ALTER TABLE [dbo].[DimStore] ADD  DEFAULT (getdate()) FOR [InsertDate]
GO
ALTER TABLE [dbo].[FactSales] ADD  DEFAULT (getdate()) FOR [AccmTxnCreateTime]
GO
ALTER TABLE [dbo].[FactSales] ADD  DEFAULT (getdate()) FOR [InsertDate]
GO
ALTER TABLE [dbo].[FactSales] ADD  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[FactSales]  WITH CHECK ADD FOREIGN KEY([CustomerSK])
REFERENCES [dbo].[DimCustomer] ([CustomerSK])
GO
ALTER TABLE [dbo].[FactSales]  WITH CHECK ADD FOREIGN KEY([DateSK])
REFERENCES [dbo].[DimDate] ([DateSK])
GO
ALTER TABLE [dbo].[FactSales]  WITH CHECK ADD FOREIGN KEY([DrinkSK])
REFERENCES [dbo].[DimDrink] ([DrinkSK])
GO
ALTER TABLE [dbo].[FactSales]  WITH CHECK ADD FOREIGN KEY([OrderSK])
REFERENCES [dbo].[DimOrder] ([OrderSK])
GO
ALTER TABLE [dbo].[FactSales]  WITH CHECK ADD FOREIGN KEY([StoreSK])
REFERENCES [dbo].[DimStore] ([StoreSK])
GO
/****** Object:  StoredProcedure [dbo].[UpdateDimDrink]    Script Date: 5/4/2026 1:14:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateDimDrink]
    @DrinkCategory VARCHAR(50)  -- Changed from NVARCHAR to VARCHAR
AS
BEGIN
    IF NOT EXISTS (SELECT DrinkSK FROM dbo.DimDrink 
                   WHERE DrinkCategory = @DrinkCategory)
    BEGIN
        INSERT INTO dbo.DimDrink (DrinkCategory, InsertDate)
        VALUES (@DrinkCategory, GETDATE())
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[UpdateDimOrder]    Script Date: 5/4/2026 1:14:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Recreate with varchar instead of nvarchar
CREATE PROCEDURE [dbo].[UpdateDimOrder]
    @OrderChannelName VARCHAR(50)  -- Changed from NVARCHAR to VARCHAR
AS
BEGIN
    IF NOT EXISTS (SELECT OrderSK FROM dbo.DimOrder 
                   WHERE OrderChannelName = @OrderChannelName)
    BEGIN
        INSERT INTO dbo.DimOrder (OrderChannelName, InsertDate)
        VALUES (@OrderChannelName, GETDATE())
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[UpdateDimStore]    Script Date: 5/4/2026 1:14:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpdateDimStore]
    @StoreID VARCHAR(50),
    @StoreLocationType VARCHAR(50) = NULL,
    @Region VARCHAR(50) = NULL
AS
BEGIN
    IF NOT EXISTS (SELECT StoreSK FROM dbo.DimStore 
                   WHERE AlternateStoreID = @StoreID)
    BEGIN
        INSERT INTO dbo.DimStore (AlternateStoreID, StoreLocationType, Region, InsertDate)
        VALUES (@StoreID, @StoreLocationType, @Region, GETDATE())
    END
END;
GO
