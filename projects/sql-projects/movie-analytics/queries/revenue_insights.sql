-- Top 20 highest-grossing movies
SELECT
  title,
  genre,
  release_year,
  revenue
FROM `evan10725.movie_data.movies`
ORDER BY revenue DESC
LIMIT 20;

-- Revenue by genre
SELECT
  genre,
  SUM(revenue) AS total_revenue,
  AVG(revenue) AS avg_revenue,
  COUNT(*) AS movie_count
FROM `evan10725.movie_data.movies`
GROUP BY genre
ORDER BY total_revenue DESC;

-- Revenue by release year
SELECT
  release_year,
  SUM(revenue) AS yearly_revenue,
  AVG(revenue) AS avg_movie_revenue,
  COUNT(*) AS movies_released
FROM `evan10725.movie_data.movies`
GROUP BY release_year
ORDER BY release_year;

-- Rating vs revenue correlation (simple view)
SELECT
  rating,
  AVG(revenue) AS avg_revenue
FROM `evan10725.movie_data.movies`
GROUP BY rating
ORDER BY rating;
