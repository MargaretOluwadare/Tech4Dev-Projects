select * from salesdata;
--PROFIT ANALYSIS
/*1. Within the space of the last three years, what was the profit worth of the breweries,
inclusive of the anglophone and the francophone territories?*/
select distinct countries from salesdata;

select countries,years,SUM(profit)
from salesdata
group by countries,years
order by years;

select SUM(profit) from salesdata;

/* 2. Compare the total profit between these two territories in order for the territory manager,
Mr. Stone made a strategic decision that will aid profit maximization in 2020.*/

select SUM(profit) as anglophone_profits from salesdata where countries in ('Nigeria','Ghana');
select SUM(profit) as francophone_profits from salesdata where not countries in ('Nigeria','Ghana')

--3. Country that generated the highest profit in 2019
select countries,SUM(profit) from salesdata where years = 2019
group by 1
order by 2 desc 
limit 1;
-- 4. Help him find the year with the highest profit.
SELECT years, SUM(profit)
FROM salesdata
GROUP BY years
ORDER BY 2 DESC
LIMIT 1;

-- 5. Which month in the three years was the least profit generated?
SELECT months, SUM(profit)
FROM salesdata
GROUP BY months
ORDER BY 2 ASC
LIMIT 1;

-- 6. What was the minimum profit in the month of December 2018?
SELECT MIN(profit)
FROM salesdata
WHERE months = 'December' AND years = 2018;

--7. Compare the profit in percentage for each of the month in 2019

SELECT distinct months,
(profit*100)/sum(profit) as percentage_profits
FROM salesdata
GROUP BY months,profit
ORDER BY percentage_profits DESC

-- 8. Which particular brand generated the highest profit in Senegal?
SELECT brands, countries, SUM(profit)
FROM salesdata
WHERE countries = 'Senegal'
GROUP BY brands, countries
ORDER BY SUM(profit) DESC
LIMIT 1;

--BRAND ANALYSIS
/*1. Within the last two years, the brand manager wants to know the top three brands
consumed in the francophone countries*/
SELECT brands, SUM(quantity)
FROM salesdata
WHERE countries IN ('Senegal', 'Benin', 'Togo') AND years IN (2018, 2019)
GROUP BY brands
ORDER BY 2 DESC
LIMIT 3;
--2. Find the top two choice of consumer brands in Ghana
SELECT brands, SUM(quantity)
FROM salesdata
WHERE countries = 'Ghana'
GROUP BY brands
ORDER BY 2 DESC

/*
3. Find out the details of beers consumed in the past three years in the most oil reached
country in West Africa.

*/
-- all details
-- most oil rich country (Nigeria)
-- wants beers only
SELECT DISTINCT brands
FROM salesdata

WHERE countries = 'Nigeria' AND brands NOT LIKE '%malt';

-- 4. Favorites malt brand in Anglophone region between 2018 and 2019
-- quantity
SELECT brands, SUM(quantity)
FROM salesdata
WHERE countries IN ('Nigeria', 'Ghana')
AND years IN (2018, 2019)
AND brands LIKE '%malt'
GROUP BY brands
ORDER BY SUM(quantity) DESC
LIMIT 1;

--5. Which brands sold the highest in 2019 in Nigeria?
SELECT brands, SUM(quantity)
FROM salesdata
WHERE countries = 'Nigeria' AND years = 2019
GROUP BY brands
ORDER BY 2 DESC

-- 6. Favorites brand in South_South region in Nigeria
SELECT brands, SUM(quantity)
FROM salesdata
WHERE region = 'southsouth' AND countries = 'Nigeria'
GROUP BY brands
ORDER BY 2 DESC
LIMIT 1;
--7. Bear consumption in Nigeria
--8. Level of consumption of Budweiser in the regions in Nigeria
select brands,SUM(quantity),region
from salesdata
where brands='budweiser' and countries='Nigeria'
group by brands,region;
--9. Level of consumption of Budweiser in the regions in Nigeria in 2019 (Decision on Promo)
select brands,SUM(quantity),region
from salesdata
where brands='budweiser' and countries='Nigeria' and years=2019
group by brands,region

--COUNTRIES ANALYSIS
--1. Country with the highest consumption of beer.
select brands,SUM(quantity),countries
from salesdata
where brands NOT LIKE '%malt'
group by brands,countries
order by 2 desc


--2. Highest sales personnel of Budweiser in Senegal
select sales_rep,sum(quantity*unit_price)
from salesdata 
where brands='budweiser' and countries='senegal'
group by sales_rep
ORDER BY SUM(quantity*unit_price)desc
LIMIT 1;

--3. Country with the highest profit of the fourth quarter in 2019
select countries,sum(profit),months
from salesdata
where months in ('october','november','december') and years=2019
group by countries,months
order by sum(profit) desc






