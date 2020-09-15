-- How many entries in the database are from Africa?
SELECT COUNT(*) AS 'Number of Entries'
FROM population_years
JOIN countries
	ON population_years.country_id = countries.id
WHERE countries.continent = 'Africa';

-- What was the total population of Oceania in 2005?
SELECT SUM(population_years.population) AS 'Total Population(Millions)'
FROM population_years
JOIN countries
	ON population_years.country_id = countries.id
WHERE countries.continent = 'Oceania'
	AND population_years.year = 2005;
	
-- What is the average population of countries in South America in 2003?
SELECT ROUND(AVG(population_years.population),2) AS 'Average Population(Millions)'
FROM population_years
JOIN countries
	ON population_years.country_id = countries.id
WHERE countries.continent = 'South America'
	AND population_years.year = 2003;

-- What country had the smallest population in 2007?
SELECT countries.name, MIN(population_years.population) AS 'Population(Millions)'
FROM population_years
JOIN countries
	ON population_years.country_id = countries.id
WHERE population_years.year = 2007;

-- What is the average population of Poland during the time period covered by this dataset?
SELECT ROUND(AVG(population_years.population),2) AS 'Average Population'
FROM population_years
JOIN countries
	ON population_years.country_id = countries.id
WHERE countries.name = 'Poland';


-- How many countries have the word "The" in their name?
SELECT COUNT(*) AS 'Number of Countries'
FROM countries
WHERE name LIKE '%The%';


-- What was the total population of each continent in 2010?
SELECT countries.continent AS 'Continent', ROUND(SUM(population_years.population),0) AS 'Population'
FROM population_years
JOIN countries
	ON population_years.country_id = countries.id
WHERE population_years.year = 2010
GROUP BY 1
ORDER BY 2 DESC;