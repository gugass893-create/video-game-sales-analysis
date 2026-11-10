-- Вопрос 3. Какие игровые платформы имеют наибольшие продажи и в каких регионах они наиболее популярны?
-- Запрос взят из файла excel/03_платформы_по_регионам.xlsx (лист «SQL-запрос»). Продажи в миллионах копий.
SELECT
    Platforms.platform_name AS Платформа,
    ROUND(SUM(Sales.global_sales), 2) AS Мировые_продажи,
    ROUND(SUM(Sales.na_sales), 2) AS Северная_Америка,
    ROUND(SUM(Sales.eu_sales), 2) AS Европа,
    ROUND(SUM(Sales.jp_sales), 2) AS Япония,
    ROUND(SUM(Sales.other_sales), 2) AS Другие_регионы
FROM Platforms
JOIN Sales ON Platforms.platform_id = Sales.platform_id
GROUP BY Platforms.platform_name
ORDER BY Мировые_продажи DESC
LIMIT 10;
