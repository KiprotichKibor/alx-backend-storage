-- Task: Rank country origins of bands by the number of fans
-- This script can be executed on any database with the metal_bands table

-- Select the origin (country) and sum of fans, grouped by origin and ordered by total fans descending
SELECT
	origin,
	SUM(fans) AS nb_fans
FROM
	metal_bands
GROUP BY
	origin
ORDER BY
	nb_fans DESC;
