CREATE VIEW vw_TopProducts AS
SELECT 
    StockCode,
    Description,
    SUM(Quantity) AS TotalQuantitySold,
    SUM(Revenue) AS TotalRevenue,
    COUNT(DISTINCT Invoice) AS NumOrders
FROM online_retail_cleaned
WHERE IsCancelled = 'False'
GROUP BY StockCode, Description;