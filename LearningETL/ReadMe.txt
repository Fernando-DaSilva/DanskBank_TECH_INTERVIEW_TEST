## DanskBank
## TECH INTERVIEW TEST 
## Fernando Da Silva - September, 2024

VIDEO PRESENTATION: DanskBank_FernandoDaSilva_TechTest.mp4

My main idea was to use the test to show my skills using the Visual Studio Developer 2022 with the SQL Server Integration Services, and also the creation of Stored Procedures.

Based on the request, I imagine a scenario where we create 3 new Tables based on " Person.Address structures " and with that demostrate the following process:

Step 1: Read information from the Original table Person.Address.

Step 2: Split the information in 2 blocks saving it in the tables: 
  - Person.Address_ETLInsert , with the content of records to be inserted.
  - Person.Address_ETLUpdate , with the content of records to be updated.

Step 3: Save the information in the Person.Address_ETLOutput

Step 4: Read and transform the Addresses Line1 to UPPER CASES and save it into a Flat File that can be delivered to new systems, for instance one that control the possible available addresses.

Step 5: Export the Logs of succces or failure.  Those logs are saved during the running steps of the Package.

=========== TO INSTALL ==============
MS SQL SERVER DATABASE to run/test:

Files available in the folder \LearningETL\SQL_FILES 
AdventureWorks_ETL_Source.BAK is a backup with all the procedures, and tables available to the tests, so you just need to restore it with this name. 
** If you restore with another name, verify and update the connection strings of the package.

If you don't whant to restore the database, the necessary scripts are also available with the following syntax:
SCRIPT_TABLE_[name of the table].sql
SCRIPT_PROCEDURE_[name of the procedure].sql

Those are necessary to run the package as it was developed without touch the AdventureWorks database data. 

I did that to emulate an isolated environmnent in a situation where actions are executed directly at the "PRODUCTION ENVIRONMENT"  available.

PACKAGE FILES and output FLAT FILES:
Files available at the folder \LearningETL

All the files are available, included Configurators of connections (.dns / .udl ) and the Text (.txt) Flat files resulted of the exportation process.

Also a video presentation (.mp4) is available.

I hope that represents a little of my knowledge, and the effort to add value and show my skills.
My goal is to be part of the team and add value on a daily basis.

If you have any questions please contact:
+370 639 00500
fernando.lietuva@gmail.com

Success!







