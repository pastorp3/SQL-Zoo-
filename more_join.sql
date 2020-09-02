--List the films where the yr is 1962 [Show id, title]

 SELECT yr
 FROM movie 
 WHERE title LIKE 'Citizen Kane'

--Give year of 'Citizen Kane'.

 SELECT id, title, yr FROM movie
WHERE title LIKE '%Star Trek%'
ORDER BY yr ASC

--List all of the Star Trek movies, include the id, title and yr (all of these movies include the words Star Trek in the title). Order results by year.

SELECT id
FROM actor
WHERE name LIKE 'Glenn Close'

--What id number does the actor 'Glenn Close' have?


SELECT id
FROM movie
WHERE title LIKE  'Casablanca'

--What is the id of the film 'Casablanca'


SELECT name FROM actor
JOIN casting ON casting.actorid = actor.id
WHERE casting.movieid = 11768;

--Obtain the cast list for 'Casablanca'.

SELECT name FROM actor
JOIN casting ON casting.actorid = actor.id
WHERE casting.movieid = 10522;

--List the films in which 'Harrison Ford' has appeared

SELECT title FROM movie
JOIN casting ON movie.id=movieid
JOIN actor   ON actorid=actor.id
WHERE name='Harrison Ford'

--List the films where 'Harrison Ford' has appeared - but not in the starring role. [Note: the ord field of casting gives the position of the actor. If ord=1 then this actor is in the starring role]

SELECT title FROM movie
JOIN casting ON movie.id=movieid
JOIN actor   ON actorid=actor.id
WHERE name='Harrison Ford' AND ord != 1

--List the films together with the leading star for all 1962 films.


SELECT title, name FROM movie
JOIN casting ON movie.id=movieid
JOIN actor   ON actorid=actor.id
WHERE  ord =1 AND yr = 1962

--Which were the busiest years for 'Rock Hudson', show the year and the number of movies he made each year for any year in which he made more than 2 movies.


SELECT title, name
FROM movie JOIN casting ON (movieid=movie.id AND ord = 1)
JOIN actor ON (actorid=actor.id)
WHERE movie.id IN (
SELECT movieid FROM casting 
WHERE actorid IN (
SELECT id FROM actor WHERE name= 'Julie Andrews' 
)
)

--List the film title and the leading actor for all of the films 'Julie Andrews' played in.


SELECT name FROM casting
JOIN actor ON actor.id = casting.actorid
WHERE ord = 1
GROUP BY name
HAVING sum(ord) >= 15
ORDER BY name

--Obtain a list, in alphabetical order, of actors who've had at least 15 starring roles.

SELECT title, COUNT(actorid) FROM movie
JOIN casting ON  id=movieid
JOIN actor ON actor.id=casting.actorid
WHERE yr=1978
GROUP BY title
ORDER BY COUNT(actorid) DESC, title

--List the films released in the year 1978 ordered by the number of actors in the cast, then by title.


SELECT name FROM movie
JOIN casting ON (movieid=movie.id)
JOIN actor ON actor.id=casting.actorid
WHERE movie.title IN (SELECT title FROM movie 
JOIN casting ON (movieid=movie.id)
JOIN actor ON actor.id=casting.actorid
WHERE name = 'Art Garfunkel')
AND
actor.name !='Art Garfunkel'






