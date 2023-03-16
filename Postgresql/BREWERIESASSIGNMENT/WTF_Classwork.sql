/* PROFIT ANALYSIS */

/* Within the space of the last three years, what was the profit worth of the breweries,
inclusive of the anglophone and the francophone territories?*/
SELECT language, sum(profit) AS total_profits
FROM breweries
GROUP BY language;

/* Compare the total profit between these two territories in order for the territory manager,
Mr. Stone made a strategic decision that will aid profit maximization in 2020.*/
SELECT language, years, sum(profit) AS total_profits
FROM breweries
GROUP BY language, years
ORDER BY years;

/* Country that generated the highest profit in 2019 */
SELECT countries, max(profit) AS max_profit
FROM breweries
WHERE years = 2019
GROUP BY countries
ORDER BY max_profit DESC
LIMIT 1;

/* Help him find the year with the highest profit */
SELECT years, max(profit) AS max_profit
FROM breweries
GROUP BY years
ORDER BY max_profit DESC
LIMIT 1;

/* Which month in the three years was the least profit generated? */
SELECT months, min(profit) AS min_profit
FROM breweries
GROUP BY months;

/* What was the minimum profit in the month of December 2018? */
SELECT months, years, min(profit) AS min_profit
FROM breweries
WHERE months = 'December' AND years = 2018
GROUP BY months, years;

/* Compare the profit in percentage for each of the month in 2019 */
SELECT months, sum(profit) as monthly_profit, 
sum(profit)*100/(SELECT sum(profit) FROM breweries WHERE years = 2019) AS profit_perc
FROM breweries
WHERE years = 2019
GROUP BY months
ORDER BY profit_perc DESC;
--SELECT sum(profit) FROM breweries WHERE years = 2019

/* Which particular brand generated the highest profit in Senegal? */
SELECT brands, max(profit) as max_profit
FROM breweries
GROUP BY brands
ORDER BY max_profit
LIMIT 1;