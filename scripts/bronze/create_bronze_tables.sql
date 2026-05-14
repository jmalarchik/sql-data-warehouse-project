/*
=======================================
Script to create tables for the bronze layer
=======================================

The script creates all of the tables needed for the bronze layer for both the erp and crm source files.
It checks to see if the table already exists and drops it if it does.  The tables can then be created with the current
metadata.

WARNING:

Running this script will permanently delete all existing data from the bronze layer of the data warehouse
*/

USE DataWarehouse;
GO

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
					WHERE TABLE_SCHEMA = 'bronze' AND TABLE_NAME = 'crm_cust_info')
DROP TABLE bronze.crm_cust_info;

CREATE TABLE  bronze.crm_cust_info (
cst_id INT,
cst_key NVARCHAR(50),
cst_firstname NVARCHAR(50),
cst_lastname NVARCHAR(50),
cst_Marital_status NVARCHAR(1),
cst_gndr NVARCHAR(1), 
cst_create_date DATE
);

GO

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
					WHERE TABLE_SCHEMA = 'bronze' AND TABLE_NAME = 'crm_prd_info')
DROP TABLE bronze.crm_prd_info;
	
CREATE TABLE bronze.crm_prd_info (
prd_id INT,
prd_key NVARCHAR(50),
prd_nm NVARCHAR(100),
prd_cost NUMERIC,
prd_line NVARCHAR(10),
prd_start_dt DATETIME, 
prd_end_dt DATETIME
);

GO

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
					WHERE TABLE_SCHEMA = 'bronze' AND TABLE_NAME = 'crm_sales_details')
DROP TABLE bronze.crm_sales_details;

CREATE TABLE bronze.crm_sales_details (
sls_ord_num NVARCHAR(10),
sls_prd_key NVARCHAR(50),
sls_cust_id int,
sls_order_dt int,
sls_ship_dt int,
sls_due_dt int,
sls_sales int,
sls_quantity int,
sls_price int
);

GO

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
					WHERE TABLE_SCHEMA = 'bronze' AND TABLE_NAME = 'erp_cust_az12')
DROP TABLE bronze.erp_cust_az12;

CREATE TABLE bronze.erp_cust_az12 (
cid NVARCHAR(20),
bdate DATE,
gen NVARCHAR(10)
);

GO

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
					WHERE TABLE_SCHEMA = 'bronze' AND TABLE_NAME = 'erp_loc_a101')
DROP TABLE bronze.erp_loc_a101;

CREATE TABLE bronze.erp_loc_a101 (
cid NVARCHAR(20),
cntry NVARCHAR(20)
);

GO

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
					WHERE TABLE_SCHEMA = 'bronze' AND TABLE_NAME = 'erp_px_cat_g1v2')
DROP TABLE bronze.erp_px_cat_g1v2;
	
CREATE TABLE bronze.erp_px_cat_g1v2 (
id NVARCHAR(10),
cat NVARCHAR(50),
subcat NVARCHAR(50),
maintenance NVARCHAR(10)
);

GO
