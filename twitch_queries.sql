'1.
Start by getting a feel for the stream table and the chat table.
Select the first 20 rows from each of the two tables.
What are the column names?'
SELECT * FROM stream LIMIT 20;
SELECT * FROM chat LIMIT 20;

'2.
What are the unique games in the stream table?'

SELECT DISTINCT game FROM stream;

'3.
What are the unique channels in the stream table?'

SELECT DISTINCT channel FROM stream;

'4.
What are the most popular games in the stream table?
Create a list of games and their number of viewers using GROUP BY.'

SELECT 
  game, COUNT(*)
FROM stream
GROUP BY game
ORDER BY COUNT(*) DESC;

'5.
Where are these LoL stream viewers located?
Create a list of countries and their number of LoL viewers using WHERE and GROUP BY.'

SELECT 
  country, COUNT(*)
FROM
  stream
WHERE game = 'League of Legends'
GROUP BY 1
ORDER BY 2 DESC;

'6.
The player column contains the source the user is using to view the stream (site, iphone, android, etc).
Create a list of players and their number of streamers.'

SELECT 
  player, COUNT(*)
FROM 
  stream
GROUP BY 1
ORDER BY 2 DESC;

'7.
Create a new column named genre for each of the games.
Group the games into their genres: Multiplayer Online Battle Arena (MOBA), First Person Shooter (FPS), Survival, and Other.'

SELECT
  game,
  CASE 
    WHEN game IN ('League of Legends', 'Dota 2', 'Heroes of the Storm'
  )   THEN 'MOBA'
    WHEN game = 'Counter-Strike: Global Offensive'
      THEN 'FPS'
    WHEN game IN ('Dayz', 'ARK: Survival Evolved')
      THEN 'Survival'
    ELSE 'Other'
    END AS 'genre',
    COUNT(*) AS 'Number of Streams'
FROM 
  stream
GROUP BY 1
ORDER BY 3 DESC;

'8.
Let’s write a query that returns two columns:

The hours of the time column
The view count for each hour
Lastly, filter the result with only the users in your country using a WHERE clause.'

SELECT 
  strftime('%H', time),
  COUNT(*)
FROM stream
WHERE country = 'US'
GROUP BY 1;

'9.
The stream table and the chat table share a column: device_id.
Let’s join the two tables on that column.'

SELECT * 
FROM stream
JOIN chat
ON stream.device_id = chat.device_id;

'10.
he stream table and the chat table share a column: device_id.
Let’s join the two tables on that column.'

SELECT * 
FROM stream
JOIN chat
ON stream.device_id = chat.device_id;




