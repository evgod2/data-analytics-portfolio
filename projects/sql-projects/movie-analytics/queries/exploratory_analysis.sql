-- Basic row count
SELECT COUNT(*) AS total_movies
FROM `evan10725.movie_data.movies`;

-- Null checks
SELECT
  SUM(CASE WHEN title IS NULL THEN 1 ELSE 0 END) AS null_titles,
  SUM(CASE WHEN genre IS NULL THEN 1 ELSE 0 END) AS null_genres,
  SUM(CASE WHEN release_year IS NULL THEN 1 ELSE 0 END) AS null_years,
  SUM(CASE WHEN rating IS NULL THEN 1 ELSE 0 END) AS null_ratings,
  SUM(CASE WHEN revenue IS NULL THEN 1 ELSE 0 END) AS null_revenue
FROM `evan10725.movie_data.movies`;

-- Genre distribution
SELECT genre, COUNT(*) AS count
FROM `evan10725.movie_data.movies`
GROUP BY genre
ORDER BY count DESC;

-- Movies per year
SELECT release_year, COUNT(*) AS movies_released
FROM `evan10725.movie_data.movies`
GROUP BY release_year
ORDER BY release_year;
