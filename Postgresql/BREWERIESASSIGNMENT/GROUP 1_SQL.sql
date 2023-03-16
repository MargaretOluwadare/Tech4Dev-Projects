SELECT * FROM dataset;

ALTER TABLE dataset
ADD territories varchar;

UPDATE dataset
SET territories ='Anglophone'
WHERE "COUNTRIES" in ('Nigeria','Ghana');

UPDATE dataset
SET territories ='Francophone'
WHERE "COUNTRIES" in ('Benin','Senegal','Togo');

/*From the international breweries data recorded for a duration of three years, you are
directed to do the following analyses to aid better decision making in order to maximize
profit and reduce loss to the lowest minimum.
Session A
--PROFIT ANALYSIS

--1. Within the space of the last three years, what was the profit worth of the breweries,
inclusive of the anglophone and the francophone territories?*/

SELECT territories,SUM("PROFIT") 
AS TOTAL_PROFIT
FROM dataset
GROUP BY territories;

/*Compare the total profit between these two territories in order for the territory manager,
Mr. Stone made a strategic decision that will aid profit maximization in 2020.*/

SELECT territories, "YEARS", SUM ("PROFIT")
AS TOTAL_PROFIT
FROM dataset
GROUP BY TERRITORIES,"YEARS"
ORDER BY "YEARS";

/*Country that generated the highest profit in 2019*/

SELECT "COUNTRIES", SUM ("PROFIT")
AS MAX_PROFIT
FROM dataset
WHERE "YEARS" = 2019
GROUP BY "COUNTRIES"
ORDER BY MAX_PROFIT DESC LIMIT 1;

/*Help him find the year with the highest profit.*/

SELECT "YEARS", SUM ("PROFIT")
AS MAX_PROFIT
FROM dataset
GROUP BY "YEARS"
ORDER BY MAX_PROFIT DESC LIMIT 1;

/*Which month in the three years was the least profit generated?*/

SELECT "MONTHS","YEARS",SUM ("PROFIT")
AS MIN_PROFIT
FROM dataset
GROUP BY "MONTHS","YEARS"
ORDER BY MIN_PROFIT ASC LIMIT 1;

/*What was the minimum profit in the month of December 2018?*/

SELECT "MONTHS","YEARS",SUM ("PROFIT")
AS MIN_PROFIT
FROM dataset
WHERE "MONTHS" = 'December' and "YEARS" = 2018
GROUP BY "MONTHS","YEARS";

/*Compare the profit in percentage for each of the month in 2019*/

SELECT "MONTHS","YEARS",SUM ("PROFIT")
AS PERCENTAGE
FROM dataset
WHERE "YEARS" = 2019
GROUP BY "MONTHS","YEARS"
ORDER BY PERCENTAGE ASC;

/*Which particular brand generated the highest profit in Senegal?*/

SELECT "BRANDS","COUNTRIES",SUM ("PROFIT")
AS HIGHEST_PROFIT
FROM dataset
WHERE "COUNTRIES" = 'Senegal'
GROUP BY "BRANDS","COUNTRIES"
ORDER BY HIGHEST_PROFIT DESC
LIMIT 1;

/*Session B
BRAND ANALYSIS

Within the last two years, the brand manager wants to know the top three brands
consumed in the francophone countries*/

SELECT "BRANDS",SUM ("QUANTITY")
AS HIGHEST_QTY
FROM dataset
WHERE TERRITORIES = 'Francophone' AND "YEARS" IN (2018,2019)
GROUP BY "BRANDS",TERRITORIES
ORDER BY HIGHEST_QTY DESC 
LIMIT 3;

/*Find out the top two choice of consumer brands in Ghana*/

SELECT "BRANDS",SUM ("QUANTITY")
AS TOP_CHOICE
FROM dataset
WHERE  "COUNTRIES" = 'Ghana'
GROUP BY "BRANDS"
ORDER BY TOP_CHOICE DESC 
LIMIT 2;

/* Find out the details of beers consumed in the past three years in the most oil reached
country in West Africa.*/

SELECT "YEARS", "BRANDS", sum("QUANTITY") beer_sold, sum("PROFIT") profit_made
FROM dataset
WHERE "COUNTRIES" = 'Nigeria' 
	AND "BRANDS" NOT IN ('beta malt', 'grand malt')
GROUP BY "YEARS", "BRANDS"
ORDER BY "YEARS"; 

/*Favorites malt brand in Anglophone region between 2018 and 2019*/

SELECT "BRANDS",SUM ("QUANTITY")
AS FAV_BRAND
FROM dataset
WHERE TERRITORIES = 'Anglophone' AND "YEARS" IN (2018,2019)
AND "BRANDS" LIKE '%malt%'
GROUP BY "BRANDS",TERRITORIES
ORDER BY FAV_BRAND;

/*Which brands sold the highest in 2019 in Nigeria?*/

SELECT "BRANDS",SUM ("QUANTITY")
AS HIGHEST_BRAND
FROM dataset
WHERE "COUNTRIES" = 'Nigeria' AND "YEARS" = 2019
GROUP BY "BRANDS"
ORDER BY HIGHEST_BRAND DESC; 

/*Favorites brand in South_South region in Nigeria*/

SELECT "BRANDS",SUM ("QUANTITY")
AS QTY_CONSUMED
FROM dataset
WHERE "COUNTRIES" = 'Nigeria' AND "REGION " = 'southsouth'
GROUP BY "BRANDS"
ORDER BY QTY_CONSUMED DESC; 

/*Bear consumption in Nigeria*/

SELECT "BRANDS",SUM ("QUANTITY")
AS TOTAL_CONSUMED
FROM dataset
WHERE "COUNTRIES" = 'Nigeria' AND "BRANDS" NOT IN ('beta malt', 'grand malt')
GROUP BY "BRANDS"
ORDER BY TOTAL_CONSUMED DESC; 

/*Level of consumption of Budweiser in the regions in Nigeria*/

SELECT "REGION ",SUM ("QUANTITY")
AS LEVEL_CONSUMED
FROM dataset
WHERE "COUNTRIES" = 'Nigeria' AND "BRANDS" ='budweiser'
GROUP BY "REGION "
ORDER BY LEVEL_CONSUMED DESC; 

/*Level of consumption of Budweiser in the regions in Nigeria in 2019 (Decision on Promo)*/

SELECT "REGION ",SUM ("QUANTITY")
AS BUD_CONSUMED_2019
FROM dataset
WHERE "COUNTRIES" = 'Nigeria' AND "BRANDS" ='budweiser' AND "YEARS" = 2019
GROUP BY "REGION "
ORDER BY BUD_CONSUMED_2019 DESC; 

/*Session C
COUNTRIES ANALYSIS*/

/*Country with the highest consumption of beer.*/

SELECT "COUNTRIES",SUM ("QUANTITY")
AS TOTAL_CONSUM
FROM dataset
WHERE "BRANDS" NOT IN ('beta malt', 'grand malt')
GROUP BY "COUNTRIES"
ORDER BY TOTAL_CONSUM DESC; 

/*Highest sales personnel of Budweiser in Senegal*/

SELECT "SALES_REP",SUM ("QUANTITY")
AS QUANTITY_SOLD
FROM dataset
WHERE "BRANDS" ='budweiser' AND "COUNTRIES" ='Senegal'
GROUP BY "SALES_REP"
ORDER BY QUANTITY_SOLD DESC
LIMIT 1; 

/*Country with the highest profit of the fourth quarter in 2019*/

SELECT "COUNTRIES",SUM ("PROFIT")
AS TOTAL_PROFIT
FROM dataset
WHERE "MONTHS" IN ('October', 'November','December') AND "YEARS" = 2019
GROUP BY "COUNTRIES"
ORDER BY TOTAL_PROFIT DESC
LIMIT 1;

--GROUP 1 MEMBERS
MARGARET OLUWADARE
OLUCHI OLUCHI
MARIAM ANISHERE
LUCY OBASOHON
OLAYEMI IBILOYE
LOVETH OSUAGWU
OLAYEMI OLOYEDE
MARYANN AMAEFULA
MONSURAT ONABAJO
OLUBUSAYO SOLOLA
OLUWADUNSIN OLAJIDE