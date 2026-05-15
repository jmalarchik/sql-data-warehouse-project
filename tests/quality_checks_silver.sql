/*
===============================================================================
Data Quality Checks - Silver Layer
===============================================================================
Script Purpose: 
    This script performs various quality checks on the 'silver' schema tables 
    to ensure data integrity, uniqueness, and business logic consistency.
===============================================================================
*/

-------------------------------------------------------------------------------
-- Checking 'silver.crm_cust_info'
-------------------------------------------------------------------------------

-- Check for nulls in Primary Key
-- Expectation: No results
SELECT * FROM silver.crm_cust_info 
WHERE cst_id IS NULL;

-- Check for duplicates in Primary Key
-- Expectation: No results
SELECT cst_id, COUNT(*) 
FROM silver.crm_cust_info 
GROUP BY cst_id 
HAVING COUNT(*) > 1;

-- Check for unwanted spaces in names
-- Expectation: No results
SELECT cst_firstname FROM silver.crm_cust_info WHERE cst_firstname != TRIM(cst_firstname);
SELECT cst_lastname FROM silver.crm_cust_info WHERE cst_lastname != TRIM(cst_lastname);

-- Check unique values for gender
-- Expectation: 3 values (Male, Female, Unknown)
SELECT DISTINCT cst_gndr FROM silver.crm_cust_info;

-- Check unique values for marital status
-- Expectation: 3 values (Single, Married, Unknown)
SELECT DISTINCT cst_marital_status FROM silver.crm_cust_info;


-------------------------------------------------------------------------------
-- Checking 'silver.crm_prd_info'
-------------------------------------------------------------------------------

-- Check for nulls or duplicates in Primary Key (prd_id)
-- Expectation: No results
SELECT prd_id, COUNT(*) 
FROM silver.crm_prd_info 
GROUP BY prd_id 
HAVING COUNT(*) > 1 OR prd_id IS NULL;

-- Check for nulls in Product Key
-- Expectation: No results
SELECT * FROM silver.crm_prd_info WHERE prd_key IS NULL;

-- Check for unwanted spaces in product names
-- Expectation: No results
SELECT * FROM silver.crm_prd_info WHERE prd_nm != TRIM(prd_nm);

-- Check for invalid or null costs
-- Expectation: No results
SELECT * FROM silver.crm_prd_info WHERE prd_cost IS NULL OR prd_cost < 0;

-- Check valid product lines
-- Expectation: Distinct list of known product lines
SELECT DISTINCT prd_line FROM silver.crm_prd_info;

-- Check for logical date errors (End date before Start date)
-- Expectation: No results
SELECT * FROM silver.crm_prd_info WHERE prd_end_dt < prd_start_dt;


-------------------------------------------------------------------------------
-- Checking 'silver.crm_sales_details'
-------------------------------------------------------------------------------

-- Check for nulls in Order Number
-- Expectation: No results
SELECT * FROM silver.crm_sales_details WHERE sls_ord_num IS NULL;

-- Check for duplicates (Order Number + Product Key combination)
-- Expectation: No results
SELECT sls_ord_num, sls_prd_key, COUNT(*) 
FROM silver.crm_sales_details 
GROUP BY sls_ord_num, sls_prd_key 
HAVING COUNT(*) > 1;

-- Check for Referential Integrity: Product Key
-- Expectation: No results (all sales should match a product)
SELECT * FROM silver.crm_sales_details 
WHERE sls_prd_key NOT IN (SELECT prd_key FROM silver.crm_prd_info);

-- Check for Referential Integrity: Customer ID
-- Expectation: No results (all sales should match a customer)
SELECT * FROM silver.crm_sales_details 
WHERE sls_cust_id NOT IN (SELECT cst_id FROM silver.crm_cust_info);

-- Check for unwanted spaces in Order Numbers
-- Expectation: No results
SELECT * FROM silver.crm_sales_details WHERE TRIM(sls_ord_num) != sls_ord_num;

-- Check for logical date errors (Due/Ship date before Order date)
-- Expectation: No results
SELECT * FROM silver.crm_sales_details WHERE sls_due_dt < sls_order_dt OR sls_ship_dt < sls_order_dt;

-- Check for invalid data (Sales, Quantity, Price)
-- Expectation: No results
SELECT * FROM silver.crm_sales_details WHERE sls_sales <= 0 OR sls_sales IS NULL;
SELECT * FROM silver.crm_sales_details WHERE sls_quantity <= 0 OR sls_quantity IS NULL;
SELECT * FROM silver.crm_sales_details WHERE sls_price <= 0 OR sls_price IS NULL;

-- Check for Data Consistency (Sales = Price * Quantity)
-- Expectation: No results
SELECT * FROM silver.crm_sales_details 
WHERE sls_sales != (sls_price * sls_quantity);
