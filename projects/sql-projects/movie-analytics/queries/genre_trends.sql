-- Most common genres
SELECT
  genre,
  COUNT(*) AS movie_count
FROM `evan10725.movie_data.movies`
GROUP BY genre
ORDER BY movie_count DESC;

-- Average rating by genre
SELECT
  genre,
  AVG(rating) AS avg_rating
FROM `evan10725.movie_data.movies`
GROUP BY genre
ORDER BY avg_rating DESC;

-- Genre popularity over time
SELECT
  release_year,
  genre,
  COUNT(*) AS movies_released
FROM `evan10725.movie_data.movies`
GROUP BY release_year, genre
ORDER BY release_year, movies_released DESC;
