-- Вопрос 2. Как менялись мировые продажи видеоигр по годам?
-- В файле excel/02_продажи_по_годам.xlsx текста запроса нет, поэтому запрос составлен по его результатам;
-- проверено: на базе из sql/бд_проект_все_годы.sql он даёт те же значения, что и таблица в Excel.
-- Игры без года (NULL) исключены. Продажи в миллионах копий.
SELECT
    Games.year AS Год_выпуска,
    ROUND(SUM(Sales.global_sales), 2) AS Мировые_продажи
FROM Games
JOIN Sales ON Games.game_id = Sales.game_id
WHERE Games.year IS NOT NULL
GROUP BY Games.year
ORDER BY Games.year;
