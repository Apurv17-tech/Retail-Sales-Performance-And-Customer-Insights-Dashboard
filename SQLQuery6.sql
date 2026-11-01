CREATE VIEW vw_CountryPerformance AS
SELECT 
    Country,
    SUM(Revenue) AS TotalRevenue,
    COUNT(DISTINCT CustomerID) AS UniqueCustomers,
    COUNT(DISTINCT Invoice) AS TotalOrders
FROM online_retail_cleaned
WHERE IsCancelled = 0
GROUP BY Country;