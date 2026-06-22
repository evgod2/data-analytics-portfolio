-- Schema for movie analytics dataset
CREATE TABLE IF NOT EXISTS `evan10725.movie_data.movies` (
    movie_id STRING,
    title STRING,
    genre STRING,
    release_year INT64,
    rating FLOAT64,
    revenue NUMERIC
);

