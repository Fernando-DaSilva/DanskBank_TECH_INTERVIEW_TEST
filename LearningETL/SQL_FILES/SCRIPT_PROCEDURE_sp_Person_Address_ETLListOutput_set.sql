USE [AdventureWorks_ETL_Source]
GO

/****** Object:  StoredProcedure [dbo].[sp_Person_Address_ETLListOutput_set]    Script Date: 9/8/2024 4:49:45 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- ETL for Person Address
-- Fernando Da Silva
-- September, 2024
CREATE procedure [dbo].[sp_Person_Address_ETLListOutput_set] 
as
BEGIN 
SET NOCOUNT ON
BEGIN TRY

	INSERT INTO [Person].[Address_ETLListOutput]
           ([AddressID]
           ,[AddressLine1]
           ,[AddressLine2]
           ,[City]
           ,[StateProvinceID]
           ,[PostalCode]
           ,[SpatialLocation]
           ,[rowguid]
           ,[ModifiedDate])
     select top 100000 -- Limit equivalent for avoid Timeouts
	        [AddressID]
           ,[AddressLine1]
           ,[AddressLine2]
           ,[City]
           ,[StateProvinceID]
           ,[PostalCode]
           ,[SpatialLocation]
           ,[rowguid]
           ,[ModifiedDate]
	from 
		Person.Address
		where AddressID not in (
		select 
	        [AddressID] from 
			[Person].[Address_ETLListOutput] (nolock)
		)
	
		Declare @TotalRecordsInsert INT = @@ROWCOUNT

		   IF @TotalRecordsInsert > 0 BEGIN 
			 
				INSERT INTO LOG_AUDIT ( 
					  LOG_INFORMATION
					, QUANTITY
					, LOG_CreationDate 
					) VALUES (
					'TOTAL RECORDS INSERTED'
					,@TotalRecordsInsert
					,GETUTCDATE()
				)


				DELETE FROM [Person].[Address_ETLInsert] 

			END
	END TRY
    BEGIN CATCH
			RAISERROR (15600, -1, -1, 'ERR DURING ETL INSERT: sp_Person_Address_ETLListOutput_set' );
	END CATCH			
END

GO

