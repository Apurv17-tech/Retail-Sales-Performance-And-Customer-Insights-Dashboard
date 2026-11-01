CREATE VIEW vw_MonthlyRevenue AS
SELECT 
    OrderMonth,
    SUM(Revenue) AS TotalRevenue,
    COUNT(DISTINCT Invoice) AS TotalOrders,
    COUNT(DISTINCT CustomerID) AS UniqueCustomers,
    SUM(Revenue) / COUNT(DISTINCT Invoice) AS AvgOrderValue
FROM online_retail_cleaned
WHERE IsCancelled = 'False'
GROUP BY OrderMonth;