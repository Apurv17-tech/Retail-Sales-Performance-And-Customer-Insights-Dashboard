CREATE VIEW vw_RFM AS
WITH RFM_Base AS (
    SELECT 
        CustomerID,
        DATEDIFF(DAY, MAX(InvoiceDate), (SELECT MAX(InvoiceDate) FROM online_retail_cleaned)) AS Recency,
        COUNT(DISTINCT Invoice) AS Frequency,
        SUM(Revenue) AS Monetary
    FROM online_retail_cleaned
    WHERE IsCancelled = 'False' AND IsGuestOrder = 'False'
    GROUP BY CustomerID
),
RFM_Scores AS (
    SELECT *,
        NTILE(4) OVER (ORDER BY Recency DESC) AS R_Score,
        NTILE(4) OVER (ORDER BY Frequency ASC) AS F_Score,
        NTILE(4) OVER (ORDER BY Monetary ASC) AS M_Score
    FROM RFM_Base
)
SELECT *,
    (R_Score + F_Score + M_Score) AS RFM_Total,
    CASE 
        WHEN (R_Score + F_Score + M_Score) >= 10 THEN 'Champions'
        WHEN (R_Score + F_Score + M_Score) >= 7 THEN 'Loyal Customers'
        WHEN (R_Score + F_Score + M_Score) >= 5 THEN 'At Risk'
        ELSE 'Lost'
    END AS CustomerSegment
FROM RFM_Scores;