/*
=========================================
Create Database and Schema
=========================================

WARNING:
  Running this script will drop the entire 'DataWarehouse' database if it exists.
  All data in the database will be permanently deleted. Proced with caution and
  ensure you have proper backups before running this script.
*/


USE master;
GO

--Drop DataWarehouse if it already exists
IF EXISTS (SELECT 1 from sys.databases WHERE name = 'DataWarehouse')
BEGIN
  ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
  DROP DATABASE DataWarehouse;
END;
GO

  --Create datawarehouse database
CREATE DATABASE DataWarehouse;
GO

USE DataWarehouse;
GO

  --Create schemas for datawarehouse
CREATE SCHEMA bronze;
GO

CREATE SCHEMA silver;
GO

CREATE SCHEMA GOLD;
GO
