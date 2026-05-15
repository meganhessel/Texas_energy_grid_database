
-- This script is various SQL queries I created to answer my TX energy grid questions. 
-- These queries are used with the `environmental_factors_viz` and `socioEconomic_viz` qmds

-- ENERGY -- 
-- Query 1. Join generator and plant 
SELECT * FROM generator_texas 
    JOIN plant_texas USING ("plant_code");

-- Query 2. Total energy per geoid and per fuel type 
SELECT geoid, fuel_category, SUM(nameplate_capacity_mw) AS total_mw FROM generator_texas 
    JOIN plant_texas USING ("plant_code")
    GROUP BY geoid, fuel_category;
    
    
-- EVIRONMENTAL FACTORS --- 
-- WIND 
-- Query 3. Wind energy and wind environmental patterns 
SELECT * FROM generator_texas 
    JOIN plant_texas USING ("plant_code")
    JOIN wind_texas USING ("countyfp")
    WHERE fuel_category LIKE 'Wind';

-- Query 4. Avg wind energy (mw) per county 
SELECT countyfp, AVG(nameplate_capacity_mw) AS avg_mw FROM generator_texas 
    JOIN plant_texas USING ("plant_code")
    JOIN wind_texas USING ("countyfp")
    WHERE fuel_category LIKE 'Wind'
    GROUP BY countyfp;

-- SOLAR 
-- Query 5. Solar energy and sunshine patterns 
SELECT * FROM generator_texas 
    JOIN plant_texas USING ("plant_code")
    JOIN sunshine_texas USING ("countyfp")
    WHERE fuel_category LIKE 'Solar';

-- Query 6. Avg solar energy (mw) mw per county 
SELECT countyfp, AVG(nameplate_capacity_mw) AS avg_mw FROM generator_texas 
    JOIN plant_texas USING ("plant_code")
    JOIN sunshine_texas USING ("countyfp")
    WHERE fuel_category LIKE 'Solar'
    GROUP BY countyfp;


-- SOCIO-ECONOMIC -- 
-- Query 7. Find median income per geiod 
SELECT geoid, MEDIAN(avg_income) AS median_avg_income FROM income_texas
    GROUP BY geoid;


-- Query 8. Count per income bin 
SELECT avg_income_bin, COUNT(*) FROM income_texas
    GROUP BY avg_income_bin;


-- Query 9. median income and total energy per geoid (Join Query 2 & 7)
SELECT 
    g.geoid,g.fuel_category, g.total_mw, i.median_avg_income
FROM (
    SELECT geoid, fuel_category, SUM(nameplate_capacity_mw) AS total_mw 
    FROM generator_texas 
    JOIN plant_texas USING (plant_code)
    GROUP BY geoid, fuel_category
) g
JOIN (
    SELECT geoid, MEDIAN(avg_income) AS median_avg_income 
    FROM income_texas
    GROUP BY geoid
) i USING (geoid);