-- Ranks country origins of bands
-- Ordered by the number of (non-unique) fans
-- Column names must be: origin and nb_fans

-- cat metal_bands.sql | mysql -uroot -p holberton
-- cat 2-fans.sql | mysql -uroot -p holberton > tmp_res ; head tmp_res

SELECT origin, SUM(fans) AS nb_fans
FROM metal_bands 
GROUP BY origin
ORDER BY nb_fans DESC;

/*
Write a SQL script that ranks country origins of bands, ordered by the number of (non-unique) fans

Requirements:

Import this table dump: metal_bands.sql.zip
Column names must be: origin and nb_fans
Your script can be executed on any database
Context: Calculate/compute something is always power intensive… better to distribute the load!
*/