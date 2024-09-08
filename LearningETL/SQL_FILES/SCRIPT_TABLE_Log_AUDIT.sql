USE [AdventureWorks_ETL_Source]
GO

/****** Object:  Table [dbo].[LOG_AUDIT]    Script Date: 9/8/2024 4:46:33 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[LOG_AUDIT](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[LOG_INFORMATION] [varchar](max) NULL,
	[QUANTITY] [float] NULL,
	[LOG_CreationDate] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

