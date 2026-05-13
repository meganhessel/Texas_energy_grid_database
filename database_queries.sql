-- Query 1. Join generator and plant 
SELECT * FROM generator_texas 
    JOIN plant_texas USING ("plant_code");

-- EVIRONMENTAL FACTORS --- 
-- WIND 
-- Query 2. Wind energy and wind environmental patterns 
SELECT * FROM generator_texas 
    JOIN plant_texas USING ("plant_code")
    JOIN wind_texas USING ("countyfp")
    WHERE fuel_category LIKE 'Wind';

-- Query 3. Avg wind energy (mw) per county 
SELECT countyfp, AVG(nameplate_capacity_mw) AS avg_mw FROM generator_texas 
    JOIN plant_texas USING ("plant_code")
    JOIN wind_texas USING ("countyfp")
    WHERE fuel_category LIKE 'Wind'
    GROUP BY countyfp;

-- SOLAR 
-- Query 4. Solar energy and sunshine patterns 
SELECT * FROM generator_texas 
    JOIN plant_texas USING ("plant_code")
    JOIN sunshine_texas USING ("countyfp")
    WHERE fuel_category LIKE 'Solar';

-- Query 5. Avg solar energy (mw) mw per county 
SELECT countyfp, AVG(nameplate_capacity_mw) AS avg_mw FROM generator_texas 
    JOIN plant_texas USING ("plant_code")
    JOIN sunshine_texas USING ("countyfp")
    WHERE fuel_category LIKE 'Solar'
    GROUP BY countyfp;

-- ENERGY -- 
-- Query 6. Total energy per geoid and per fuel type 
SELECT geoid, fuel_category, SUM(nameplate_capacity_mw) AS total_mw FROM generator_texas 
    JOIN plant_texas USING ("plant_code")
    GROUP BY geoid, fuel_category;


-- SOCIO-ECONOMIC -- 
-- Query 7. Find median income per geiod 
SELECT geoid, MEDIAN(avg_income) AS median_avg_income FROM income_texas
    GROUP BY geoid;


-- Query 8. Count per income bin 
SELECT avg_income_bin, COUNT(*) FROM income_texas
    GROUP BY avg_income_bin;


-- Query 9. median income and total energy per geoid (Join Query 6 & 7)
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