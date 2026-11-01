USE RetailAnalytics;

SELECT COUNT(*) AS TotalRows FROM online_retail_cleaned;

SELECT TOP 10 * FROM online_retail_cleaned;

SELECT MIN(InvoiceDate) AS MinDate, MAX(InvoiceDate) AS MaxDate FROM online_retail_cleaned;