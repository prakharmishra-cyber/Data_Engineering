SELECT  SalesYear, SalesQuarterSUM(SalesAmount) AS SalesTotal, CURRENT_TIMESTAMP 
AS 'Current Datetime' FROM ProductSales
    GROUP BY ROLLUP(SalesYear, SalesQuarter)


SELECT
CASE
WHEN GROUPING(SalesMonth)=1 AND GROUPING(SalesYear)=0
THEN 'Sub-Total'
WHEN GROUPING(SalesMonth)=1 AND GROUPING(SalesYear)=1
THEN 'Grand-Total'
ELSE CAST(SalesYear AS VARCHAR(10))
END AS SalesYear, SalesMonth,
SUM(SalesAmount) as SalesTotal
FROM ProductSales
GROUP BY ROLLUP(SalesYear, SalesMonth)

SELECT SalesMonth, SalesQuarter,
SUM(SalesAmount) AS 'SalesTotal', CURRENT_TIMESTAMP AS 'CurrentDateTime'
FROM ProductSales
GROUP BY GROUPING SETS(SalesMonth, SalesQuarter);


SELECT MAX(SalesAmount) AS 'Maximum Amount',
CURRENT_TIMESTAMP AS 'CurrentTimeStamp'
FROM ProductSales;

SELECT MIN(SalesAmount) AS 'Minimum Amount',
CURRENT_TIMESTAMP AS 'CurrentTimeStamp'
FROM ProductSales;

SELECT AVG(SalesAmount) AS 'Average Amount',
CURRENT_TIMESTAMP AS 'CurrentTimeStamp'
FROM ProductSales;

SELECT COUNT(SalesAmount) AS 'No of Sales',
CURRENT_TIMESTAMP AS 'CurrentTimeStamp'
FROM ProductSales;

SELECT SUM(SalesAmount) AS 'Total Sales amount',
CURRENT_TIMESTAMP AS 'CurrentTimeStamp'
FROM ProductSales;


SELECT SalesYear, SalesQuarter, 
AVG(SalesAmount) OVER(PARTITION BY SalesYear) AS 'Average Sales',
FROM ProductSales;