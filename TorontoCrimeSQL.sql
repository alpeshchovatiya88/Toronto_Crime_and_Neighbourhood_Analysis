USE TorontoCrimeDB;

SELECT * FROM CRIME_DATA;

SELECT * FROM NEIGHBOURHOOD_158;

-- 1. Crimes in 2024

SELECT * FROM CRIME_DATA
WHERE OCC_YEAR = 2024;

-- 2. Top 10 most frequent crime types

SELECT TOP 10 OFFENCE, COUNT(*) AS Total FROM CRIME_DATA
GROUP BY OFFENCE
ORDER BY Total DESC;

-- 3. Crimes per year

SELECT OCC_YEAR, COUNT(*) AS Total_Crimes FROM CRIME_DATA
GROUP BY OCC_YEAR
ORDER BY OCC_YEAR;

-- 4. Crimes per neighbourhood

SELECT C.HOOD_158, N.NEIGHBOURHOOD_158,  COUNT(*) AS Total_Crimes FROM CRIME_DATA C
JOIN NEIGHBOURHOOD_158 N
ON C.HOOD_158 = N.HOOD_158
GROUP BY C.HOOD_158, N.NEIGHBOURHOOD_158
ORDER BY C.HOOD_158;

-- 5. List all Offence types

SELECT DISTINCT OFFENCE FROM CRIME_DATA;

-- 6. Monthly crime counts (2022)

SELECT OCC_MONTH, COUNT(*) AS Total_Crimes FROM CRIME_DATA
WHERE OCC_YEAR = 2022
GROUP BY OCC_MONTH
ORDER BY OCC_MONTH;

-- 7. Crimes in a specific neighbourhood (North Toronto (173))

SELECT * FROM CRIME_DATA C
JOIN NEIGHBOURHOOD_158 N
ON C.HOOD_158 = N.HOOD_158
WHERE N.NEIGHBOURHOOD_158 = 'North Toronto (173)';

-- 8. Sort crimes by date

SELECT * FROM CRIME_DATA
ORDER BY OCC_DATE;

-- 9. Number of assaults in a neighbourhood (York University Heights (27))

SELECT COUNT(*) AS Total_Crimes FROM CRIME_DATA C
JOIN NEIGHBOURHOOD_158 N
ON C.HOOD_158 = N.HOOD_158
WHERE C.OFFENCE = 'Assault' AND N.NEIGHBOURHOOD_158 = 'York University Heights (27)';

-- 10. Crimes with Location Type = 'Ttc Bus'

SELECT * FROM CRIME_DATA
WHERE LOCATION_TYPE = 'Ttc Bus';

-- 11. Crimes that occurred on weekends

SELECT * FROM CRIME_DATA
WHERE OCC_DOW IN ('Saturday', 'Sunday');

-- 12. First 50 crimes sorted by occurrence date

SELECT TOP 50 * FROM CRIME_DATA
ORDER BY OCC_DATE;

-- 13. Crimes in Apartment premises

SELECT * FROM CRIME_DATA
WHERE PREMISES_TYPE = 'Apartment';

-- 14. Total crimes per offence

SELECT OFFENCE, COUNT(*) AS Total_Crimes FROM CRIME_DATA
GROUP BY OFFENCE
ORDER BY OFFENCE;

-- 15. Crimes reported each year

SELECT REPORT_YEAR, COUNT(*) AS Total_Crimes FROM CRIME_DATA
GROUP BY REPORT_YEAR
ORDER BY REPORT_YEAR DESC;

-- 16. Top 5 neighbourhoods by crime count

SELECT TOP 5  N.NEIGHBOURHOOD_158,  COUNT(*) AS Total_Crimes FROM CRIME_DATA C
JOIN NEIGHBOURHOOD_158 N
ON C.HOOD_158 = N.HOOD_158
GROUP BY N.NEIGHBOURHOOD_158
ORDER BY Total_Crimes DESC;

-- 17. Occurrence date vs report date more than 7 days apart

SELECT * FROM CRIME_DATA
WHERE DATEDIFF(DAY, OCC_DATE, REPORT_DATE) > 7;

-- 18. Crime count per Police Division

SELECT DIVISION, COUNT(*) AS Total_Crimes FROM CRIME_DATA
GROUP BY DIVISION
ORDER BY DIVISION;

-- 19. Neighbourhoods with more than 500 crimes

SELECT N.NEIGHBOURHOOD_158, COUNT(*) AS Total_Crimes FROM CRIME_DATA C
JOIN NEIGHBOURHOOD_158 N
ON C.HOOD_158 = N.HOOD_158
GROUP BY N.NEIGHBOURHOOD_158
HAVING COUNT(*) > 500
ORDER BY Total_Crimes DESC;

-- 20. Top 10 neighbourhoods with the most Assault crimes

SELECT TOP 10 N.NEIGHBOURHOOD_158, COUNT(*) AS Total_Crimes FROM CRIME_DATA C
JOIN NEIGHBOURHOOD_158 N
ON C.HOOD_158 = N.HOOD_158
WHERE C.OFFENCE = 'Assault'
GROUP BY N.NEIGHBOURHOOD_158
ORDER BY Total_Crimes DESC;

-- 21. Most recent crime in each neighbourhood

SELECT *
FROM (
    SELECT *,
           ROW_NUMBER() OVER (PARTITION BY HOOD_158 ORDER BY OCC_DATE DESC) AS rn
    FROM CRIME_DATA
) A
WHERE rn = 1;

-- 22. Rank neighbourhoods by crime volume

SELECT N.NEIGHBOURHOOD_158,
       COUNT(C.ID) AS Crime_Count,
       DENSE_RANK() OVER (ORDER BY COUNT(C.ID) DESC) AS Crime_Rank
FROM CRIME_DATA C
JOIN NEIGHBOURHOOD_158 N
     ON C.HOOD_158 = N.HOOD_158
GROUP BY N.NEIGHBOURHOOD_158
ORDER BY Crime_Rank;

-- 23. Percentage of total crimes per offence

SELECT OFFENCE,
       COUNT(*) AS Total_Crimes,
       ROUND(100.0 * COUNT(*) / SUM(COUNT(*)) OVER(), 2) AS Percent_of_Total
FROM CRIME_DATA
GROUP BY OFFENCE
ORDER BY Percent_of_Total DESC;

-- 24. Month-over-month crime change

WITH Monthly AS (
    SELECT OCC_YEAR,
           OCC_MONTH,
           COUNT(*) AS Crime_Count
    FROM CRIME_DATA
    GROUP BY OCC_YEAR, OCC_MONTH
)
SELECT *,
       Crime_Count - LAG(Crime_Count) OVER (ORDER BY OCC_YEAR, OCC_MONTH) AS Change_From_Previous
FROM Monthly
ORDER BY OCC_YEAR, OCC_MONTH;

-- 25. Create a useful view combining important fields

CREATE VIEW CrimeNeighbourhoodView AS
SELECT
    C.ID,
    C.OCC_DATE,
    C.OFFENCE,
    C.DIVISION,
    N.NEIGHBOURHOOD_158,
    C.HOOD_158
FROM CRIME_DATA C
LEFT JOIN NEIGHBOURHOOD_158 N
ON C.HOOD_158 = N.HOOD_158;

SELECT * FROM CrimeNeighbourhoodView; 










