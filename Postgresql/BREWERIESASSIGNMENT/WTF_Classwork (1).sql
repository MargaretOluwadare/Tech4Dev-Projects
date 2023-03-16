/* PROFIT ANALYSIS */

/* Within the space of the last three years, what was the profit 
worth of the breweries,inclusive of the anglophone and the 
francophone territories?*/
SELECT language, sum(profit) AS total_profits
FROM breweries
GROUP BY language;

/* Compare the total profit between these two territories in order 
for the territory manager, Mr. Stone made a strategic decision that 
will aid profit maximization in 2020.*/
SELECT language, years, sum(profit) AS total_profits_by_year
FROM breweries
GROUP BY language, years
ORDER BY years, total_profits_by_year;

/* Country that generated the highest profit in 2019 */
SELECT countries, sum(profit) AS highest_profit_2019
FROM breweries
WHERE years = 2019
GROUP BY countries
ORDER BY highest_profit_2019 DESC
LIMIT 1;

/* Help him find the year with the highest profit */
SELECT years, sum(profit) AS highest_profit_by_year
FROM breweries
GROUP BY years
ORDER BY highest_profit_by_year DESC
LIMIT 1;

/* Which month in the three years was the least profit generated? */
SELECT months, sum(profit) AS least_profit_by_month
FROM breweries
GROUP BY months
ORDER BY least_profit_by_month
LIMIT 1;

/* What was the minimum profit in the month of December 2018? */
SELECT months, years, min(profit) AS min_profit
FROM breweries
WHERE months = 'December' AND years = 2018
GROUP BY months, years;

/* Compare the profit in percentage for each of the month in 2019 */
SELECT months, sum(profit) as monthly_profit_2019,
ROUND(sum(profit)*100/(
	SELECT sum(profit) 
	FROM breweries 
	WHERE years = 2019),2) AS profit_perc_2019
FROM breweries
WHERE years = 2019
GROUP BY months
ORDER BY profit_perc_2019 ASC;

/* Which particular brand generated the highest profit in Senegal? */
SELECT brands, max(profit) as brand_max_profit
FROM breweries
GROUP BY brands
ORDER BY brand_max_profit DESC
LIMIT 1;


/* BRAND ANALYSIS */

/* Within the last two years, the brand manager wants to know 
the top three brands consumed in the francophone countries */
SELECT brands, sum(quantity) as franco_brand_quantity
FROM breweries
WHERE language = 'Francophone' AND years IN (2018,2019)
GROUP BY brands
ORDER BY franco_brand_quantity DESC
LIMIT 3;

/* Find out the top two choice of consumer brands in Ghana */
SELECT brands, sum(quantity) as ghana_brand_quantity
FROM breweries
WHERE countries = 'Ghana'
GROUP BY brands
ORDER BY ghana_brand_quantity DESC
LIMIT 2;

/*  Find out the details of beers consumed in the past three years 
in the most oil reached country in West Africa. */
SELECT years, brands, sum(quantity) beer_sold, sum(profit) profit_made
FROM breweries
WHERE countries = 'Nigeria' 
	AND brands NOT IN ('beta malt', 'grand malt')
GROUP BY years, brands
ORDER BY years;

/* Favorites malt brand in Anglophone region between 2018 and 2019 */
SELECT brands, sum(quantity) malt_sold
FROM breweries
WHERE language ='Anglophone' 
	AND brands IN ('beta malt', 'grand malt')
	AND years IN (2018, 2019)
GROUP BY brands
ORDER BY malt_sold DESC;

/* Which brands sold the highest in 2019 in Nigeria? */
SELECT brands, sum(quantity) quantity_sold
FROM breweries
WHERE years = 2019 AND countries = 'Nigeria'
GROUP BY brands
ORDER BY brands DESC;

/* Favorites brand in South_South region in Nigeria */
SELECT brands, sum(quantity) quantity_consumed
FROM breweries
WHERE region = 'southsouth' AND countries = 'Nigeria'
GROUP BY brands
ORDER BY brands DESC;

/*  Bear consumption in Nigeria */
SELECT brands, sum(quantity) beer_consumed
FROM breweries
WHERE countries = 'Nigeria' 
	AND brands NOT IN ('beta malt', 'grand malt')
GROUP BY brands
ORDER BY beer_consumed DESC;

/*  Level of consumption of Budweiser in the regions in Nigeria */
SELECT brands, sum(quantity) bud_consumed
FROM breweries
WHERE countries = 'Nigeria' AND brands = 'budweiser'
GROUP BY brands
ORDER BY bud_consumed DESC;

/* Level of consumption of Budweiser in the regions in Nigeria in 2019 */
SELECT brands, sum(quantity) bud_consumed_2019
FROM breweries
WHERE countries = 'Nigeria' 
	AND brands = 'budweiser'
	AND years = 2019
GROUP BY brands;

/* COUNTRY ANALYSIS */

/* Country with the highest consumption of beer */
SELECT countries, sum(quantity) beer_consumed
FROM breweries
WHERE brands NOT IN ('beta malt', 'grand malt')
GROUP BY countries
ORDER BY beer_consumed;

/* Highest sales personnel of Budweiser in Senegal */
SELECT sales_rep, sum(quantity) bud_sold_senegal
FROM breweries
WHERE countries = 'Senegal' 
	AND brands = 'budweiser'
GROUP BY sales_rep
ORDER BY bud_sold_senegal DESC;

/*  Country with the highest profit of the fourth quarter in 2019 */
SELECT countries, sum(profit) profit_made_2019
FROM breweries
WHERE months IN ('October', 'November', 'December')
GROUP BY countries
ORDER BY profit_made_2019 DESC;
