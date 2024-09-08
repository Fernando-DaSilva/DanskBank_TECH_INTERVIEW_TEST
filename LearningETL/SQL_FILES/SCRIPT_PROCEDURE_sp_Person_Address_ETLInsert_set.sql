USE [AdventureWorks_ETL_Source]
GO

/****** Object:  StoredProcedure [dbo].[sp_Person_Address_ETLInsert_set]    Script Date: 9/8/2024 4:49:12 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- ETL for Person Address INSERT
-- Fernando Da Silva
-- September, 2024
CREATE procedure [dbo].[sp_Person_Address_ETLInsert_set] 
@AddressID int,
@Debug bit = null

as
BEGIN 
SET NOCOUNT ON
   /*
   DEBUG
   ======

   delete from Person.Address_ETLListOutput
   
   select count(*) from Person.Address_ETLListOutput  (nolock)
   select count(*) from [Person].[Address_ETLInsert]  (nolock)
   select count(*) from [Person].[Address_ETLUpdate]  (nolock)
   
   select distinct 
				[AddressID]
			   ,[AddressLine1]
			   ,[AddressLine2]
			   ,[City]
			   ,[StateProvinceID]
			   ,[PostalCode]
			   ,[rowguid]
			   ,[ModifiedDate]
	from [Person].[Address_ETLListOutput] (nolock)
	where year([ModifiedDate]) = 2024



   select * from LOG_AUDIT
   
   delete from [Person].[Address_ETLInsert]
   delete from [Person].[Address_ETLUpdate]
   delete from [Person].[Address_ETLListOutput]
   delete from LOG_AUDIT 
   
   */

  BEGIN TRY
		DECLARE @TotalRecordsInserted int
		DECLARE @NOW DATETIME = GETUTCDATE()
		IF @Debug is null set @Debug = 0 

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
		   SELECT 
				AddressID
			   ,AddressLine1
			   ,AddressLine2
			   ,City
			   ,StateProvinceID
			   ,PostalCode
			   ,SpatialLocation
			   ,rowguid
			   ,@NOW
	       FROM
		       [Person].[Address_ETLInsert]

		   where AddressID = @AddressID
		   
		   SET @TotalRecordsInserted = @@ROWCOUNT

		   IF @TotalRecordsInserted > 0 BEGIN 

				IF  ISNULL(@Debug,0) = 1 BEGIN
 
						INSERT INTO LOG_AUDIT ( 
								LOG_INFORMATION
							, QUANTITY
							, LOG_CreationDate 
							) VALUES (
							'TOTAL RECORDS INSERTED',
							@TotalRecordsInserted,
							GETUTCDATE()
						)
				END

				DELETE FROM
					[Person].[Address_ETLInsert]
				WHERE AddressID = @AddressID
		  	 

	       END 

	END TRY
    BEGIN CATCH
			RAISERROR (15600, -1, -1, 'ERR DURING ETL INSERT: sp_Person_Address_ETLInsert_set' );
	END CATCH
   
END

GO

