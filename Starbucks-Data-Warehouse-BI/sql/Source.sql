USE Starbucks_Source_DB;
GO
/****** Object:  Table [dbo].[Source_Orders]    Script Date: 5/4/2026 1:57:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Source_Orders](
	[order_id] [varchar](20) NOT NULL,
	[customer_id] [varchar](20) NULL,
	[store_id] [varchar](20) NULL,
	[order_date] [date] NULL,
	[order_time] [time](7) NULL,
	[day_of_week] [varchar](10) NULL,
	[order_channel] [varchar](50) NULL,
	[cart_size] [int] NULL,
	[num_customizations] [int] NULL,
	[total_spend] [decimal](10, 2) NULL,
	[fulfillment_time_min] [decimal](5, 2) NULL,
	[drink_category] [varchar](50) NULL,
	[has_food_item] [bit] NULL,
	[order_ahead] [bit] NULL,
	[customer_satisfaction] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Source_Stores]    Script Date: 5/4/2026 1:57:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Source_Stores](
	[store_id] [varchar](20) NOT NULL,
	[store_location_type] [varchar](50) NULL,
	[region] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[store_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Source_Orders]  WITH NOCHECK ADD  CONSTRAINT [FK_Orders_Stores] FOREIGN KEY([store_id])
REFERENCES [dbo].[Source_Stores] ([store_id])
GO
ALTER TABLE [dbo].[Source_Orders] CHECK CONSTRAINT [FK_Orders_Stores]
GO
