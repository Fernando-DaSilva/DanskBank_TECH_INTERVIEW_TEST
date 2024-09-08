USE [AdventureWorks_ETL_Source]
GO

/****** Object:  StoredProcedure [dbo].[sp_Person_Address_ETLUpdate_set]    Script Date: 9/8/2024 4:50:09 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- ETL for Person Address UPDATE
-- Fernando Da Silva
-- September, 2024
CREATE procedure [dbo].[sp_Person_Address_ETLUpdate_set] 
as
BEGIN 
SET NOCOUNT ON
   /*
   DEBUG
   delete from Person.Address_ETLListOutput
   select count(*) from Person.Address_ETLListOutput
   select count(*) from [Person].[Address_ETLUpdate]
   select * from LOG_AUDIT
   delete from LOG_AUDIT
   */

  BEGIN TRY
		DECLARE @TotalRecordsUpdated int
		UPDATE etl 
		   SET etl.[AddressID] = update_source.AddressID
			  ,etl.[AddressLine1] = update_source.AddressLine1
			  ,etl.[AddressLine2] = update_source.AddressLine2
			  ,etl.[City] = update_source.City
			  ,etl.[StateProvinceID] = update_source.StateProvinceID
			  ,etl.[PostalCode] = update_source.PostalCode
			  ,etl.[SpatialLocation] = update_source.SpatialLocation
			  ,etl.[rowguid] = update_source.rowguid
			  ,etl.[ModifiedDate] = GETUTCDATE() 
		   FROM [Person].[Address_ETLListOutput] etl 
		   INNER JOIN [Person].[Address_ETLUpdate] update_source 
		   ON etl.AddressID = update_source.AddressID
		   
		   SET @TotalRecordsUpdated = @@ROWCOUNT

		   IF @TotalRecordsUpdated > 0 BEGIN 
			 
				INSERT INTO LOG_AUDIT ( 
					  LOG_INFORMATION
					, QUANTITY
					,LOG_CreationDate 
					) VALUES (
					'TOTAL RECORDS UPDATED',
					@TotalRecordsUpdated,
					GETUTCDATE()
				)
		  	 
				DELETE FROM [Person].[Address_ETLUpdate] 
	       END 

	END TRY
    BEGIN CATCH
			RAISERROR (15600, -1, -1, 'ERR DURING ETL UPDATE: sp_Person_Address_ETLUpdate_set' );
	END CATCH
   
END

GO

