CREATE VIEW vw_CancelledImpact AS
SELECT 
    SUM(Revenue) AS CancelledRevenue,
    COUNT(DISTINCT Invoice) AS CancelledOrders
FROM online_retail_cleaned
WHERE IsCancelled = 'True';