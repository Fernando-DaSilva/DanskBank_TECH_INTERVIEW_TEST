USE [AdventureWorks_ETL_Source]
GO

/****** Object:  Table [Person].[Address_ETLListOutput]    Script Date: 9/8/2024 4:47:39 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [Person].[Address_ETLListOutput](
	[AddressID] [int] NOT NULL,
	[AddressLine1] [nvarchar](60) NOT NULL,
	[AddressLine2] [nvarchar](60) NULL,
	[City] [nvarchar](30) NOT NULL,
	[StateProvinceID] [int] NOT NULL,
	[PostalCode] [nvarchar](15) NOT NULL,
	[SpatialLocation] [geography] NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[ModifiedDate] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

