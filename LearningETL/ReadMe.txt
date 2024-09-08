# DanskBank_TECH_INTERVIEW_TEST
## Fernando Da Silva - September 2024  

### VIDEO PRESENTATION:  
DanskBank_FernandoDaSilva_TechTest.mp4
---
### Overview
In this test, I aimed to showcase my skills using Visual Studio Developer 2022, SQL Server Integration Services (SSIS), and Stored Procedure creation.
Based on the task requirements, I created a scenario that demonstrates the following process using three new tables modeled after the "Person.Address" structure:

#### Process Breakdown:
**Step 1**: Read data from the original `Person.Address` table.  

**Step 2**: Split the data into two groups and save them in the following tables:
  - `Person.Address_ETLInsert`: Contains records to be inserted.
  - `Person.Address_ETLUpdate`: Contains records to be updated.  

**Step 3**: Store the processed data in the `Person.Address_ETLOutput` table.  

**Step 4**: Transform the `AddressLine1` field to uppercase, then export this data to a flat file for integration with external systems, such as those that manage available addresses.  

**Step 5**: Export logs indicating success or failure. These logs are captured during each step of the ETL package execution.

---

### Installation Instructions
To run or test the package, you'll need **MS SQL Server**.

The following files are located in the folder `\LearningETL\SQL_FILES`:  
- `AdventureWorks_ETL_Source.BAK`: A database backup containing all necessary procedures and tables. Simply restore the database using this file with the given name.  
  **Note**: If you restore it under a different name, ensure you update the package’s connection strings accordingly.

If you prefer not to restore the database, the necessary SQL scripts are also provided with the following naming convention:  
- `SCRIPT_TABLE_[table_name].sql`: Script for creating the tables.
- `SCRIPT_PROCEDURE_[procedure_name].sql`: Script for creating the stored procedures.

These scripts enable you to run the package without modifying the actual AdventureWorks database data. This simulates an isolated environment, representing a scenario where actions are performed directly on a **production environment**.

---

### Package Files and Output

All relevant files are available in the folder `\LearningETL`, including:  
- SSIS package files.  
- Connection configuration files (`.dsn` / `.udl`).  
- Text (.txt) flat files generated during the export process.  
- A video presentation (`.mp4`) explaining the project.

---

### Closing Remarks

This project is intended to demonstrate my knowledge and effort in adding value through my technical skills. I am eager to be a part of the team and contribute to its success on a daily basis.

If you have any questions, feel free to contact me:  
- Phone: +370 639 00500  
- Email: fernando.lietuva@gmail.com  

Success!
