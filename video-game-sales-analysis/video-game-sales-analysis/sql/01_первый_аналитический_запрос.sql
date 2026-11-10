-- Вопрос 1. Какие жанры видеоигр приносят наибольшие мировые продажи?
-- Запрос взят из документа docs/Журнал_расследования_и_первый_запрос.docx (раздел 4).
-- Продажи в миллионах копий. Если игре назначить несколько жанров, её продажи учитываются в каждом из них.
SELECT
    Genres.genre_name AS Жанр,
    ROUND(SUM(Sales.global_sales), 2) AS Мировые_продажи
FROM Genres
JOIN Game_Genres ON Genres.genre_id = Game_Genres.genre_id
JOIN Games ON Game_Genres.game_id = Games.game_id
JOIN Sales ON Games.game_id = Sales.game_id
GROUP BY Genres.genre_name
ORDER BY Мировые_продажи DESC;
