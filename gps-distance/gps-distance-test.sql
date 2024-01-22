-- https://medium.com/@dmitry.romanoff/postgresql-how-to-calculate-the-distance-between-two-cities-based-on-their-corresponding-gps-data-358697734634
CREATE TABLE cities (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    latitude NUMERIC,
    longitude NUMERIC
);

INSERT INTO cities (name, latitude, longitude) VALUES ('Lisbon', 38.724874, -9.139604);
INSERT INTO cities (name, latitude, longitude) VALUES ('Porto', 41.158389, -8.629163);

SELECT ST_DistanceSphere(
    ST_MakePoint(city1.longitude, city1.latitude),
    ST_MakePoint(city2.longitude, city2.latitude)
) / 1000 AS distance_in_km
FROM cities AS city1
CROSS JOIN cities AS city2
WHERE city1.name = 'Lisbon'
  AND city2.name = 'Porto';


SELECT city1.name "from", city2.name "to", round(ST_DistanceSphere(
    ST_MakePoint(city1.longitude, city1.latitude),
    ST_MakePoint(city2.longitude, city2.latitude)
) / 1000) AS distance_in_km
FROM cities AS city1
CROSS JOIN cities AS city2
where city1.name != city2.name
order by 1, 2;